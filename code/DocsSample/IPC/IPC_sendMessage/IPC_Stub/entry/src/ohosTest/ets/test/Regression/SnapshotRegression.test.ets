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
  STUB_DESCRIPTOR, EVENT_ON_CREATE, EVENT_ON_CONNECT, EVENT_ON_REQUEST, EVENT_ON_DISCONNECT,
  EVENT_ON_DESTROY, LEVEL_INFO, LEVEL_ERROR, ServiceLifecycleModel, ServiceSnapshot, textFingerprint
} from '../Shared/SharedDriver';

const GOLDEN_CONNECT_TRACE: string = 'onCreate>onConnect:IPCStubTest';
const GOLDEN_FULL_TRACE: string =
  'onCreate>onRequest:1>onConnect:IPCStubTest>onRequest:2>onDisconnect>onDestroy';

class GoldenSnapshot {
  public state: string;
  public connects: number;
  public disconnects: number;
  public requests: number;
  public destroys: number;
  public trace: string;
  public fingerprint: number;

  constructor(state: string, connects: number, disconnects: number, requests: number, destroys: number,
    trace: string) {
    this.state = state;
    this.connects = connects;
    this.disconnects = disconnects;
    this.requests = requests;
    this.destroys = destroys;
    this.trace = trace;
    this.fingerprint = textFingerprint(trace);
  }

  public describe(): string {
    return this.state + '/' + String(this.connects) + '/' + String(this.disconnects) + '/' +
      String(this.requests) + '/' + String(this.destroys);
  }
}

function runScenario(requests: number[], connectFirst: boolean, connectTwice: boolean,
  disconnect: boolean, destroy: boolean): ServiceLifecycleModel {
  const service: ServiceLifecycleModel = new ServiceLifecycleModel();
  service.onCreate();
  if (connectFirst) {
    service.onConnect();
  }
  for (let index = 0; index < requests.length; index++) {
    service.onRequest(requests[index]);
  }
  if (connectTwice) {
    service.onConnect();
  }
  if (disconnect) {
    service.onDisconnect();
  }
  if (destroy) {
    service.onDestroy();
  }
  return service;
}

function snapshotOf(service: ServiceLifecycleModel): ServiceSnapshot {
  return new ServiceSnapshot(service);
}

function sameLifecycle(left: ServiceLifecycleModel, right: ServiceLifecycleModel): boolean {
  return snapshotOf(left).sameAs(snapshotOf(right)) &&
    left.events.trace() === right.events.trace() &&
    left.connectCount === right.connectCount;
}

export default function snapshotRegression(): void {
  describe('SnapshotRegressionTest', () => {
    beforeAll(() => {
      logSuite('SnapshotRegressionTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('SnapshotRegressionTest', 'end');
    });

    /**
     * @tc.name          snapshotRegressionTraceConnectOnly
     * @tc.desc          Scenario connect only reproduces the golden lifecycle trace.
     * @tc.precondition  A lifecycle model is driven through the recorded step configuration.
     * @tc.steps         1. Run the scenario with the configured requests and callbacks.
     *                   2. Read the ordered lifecycle trace.
     *                   3. Compare the trace with the golden literal.
     *                   4. Check the per-event counters.
     * @tc.expected      The trace and every counter match the recorded golden values.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('snapshotRegressionTraceConnectOnly', 0, () => {
      const service: ServiceLifecycleModel = runScenario([], true, false, false, false);
      const trace: string = service.events.trace();
      expect(trace).assertEqual('onCreate>onConnect:IPCStubTest');
      expect(service.events.size()).assertEqual(2);
      expect(service.events.countOf(EVENT_ON_CREATE)).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_REQUEST)).assertEqual(0);
      expect(service.events.countOf(EVENT_ON_DISCONNECT)).assertEqual(0);
      expect(service.events.countOf(EVENT_ON_DESTROY)).assertEqual(0);
      expect(service.events.last()).assertEqual('onConnect:IPCStubTest');
      expect(service.events.fingerprint()).assertEqual(textFingerprint('onCreate>onConnect:IPCStubTest'));
      logStep("snapshotRegressionTraceConnectOnly", trace);
    });

    /**
     * @tc.name          snapshotRegressionTraceRequestBeforeConnect
     * @tc.desc          Scenario request before connect reproduces the golden lifecycle trace.
     * @tc.precondition  A lifecycle model is driven through the recorded step configuration.
     * @tc.steps         1. Run the scenario with the configured requests and callbacks.
     *                   2. Read the ordered lifecycle trace.
     *                   3. Compare the trace with the golden literal.
     *                   4. Check the per-event counters.
     * @tc.expected      The trace and every counter match the recorded golden values.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('snapshotRegressionTraceRequestBeforeConnect', 0, () => {
      const service: ServiceLifecycleModel = runScenario([1], false, false, false, false);
      const trace: string = service.events.trace();
      expect(trace).assertEqual('onCreate>onRequest:1');
      expect(service.events.size()).assertEqual(2);
      expect(service.events.countOf(EVENT_ON_CREATE)).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(0);
      expect(service.events.countOf(EVENT_ON_REQUEST)).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_DISCONNECT)).assertEqual(0);
      expect(service.events.countOf(EVENT_ON_DESTROY)).assertEqual(0);
      expect(service.events.last()).assertEqual('onRequest:1');
      expect(service.events.fingerprint()).assertEqual(textFingerprint('onCreate>onRequest:1'));
      logStep("snapshotRegressionTraceRequestBeforeConnect", trace);
    });

    /**
     * @tc.name          snapshotRegressionTraceFullLifecycle
     * @tc.desc          Scenario full lifecycle reproduces the golden lifecycle trace.
     * @tc.precondition  A lifecycle model is driven through the recorded step configuration.
     * @tc.steps         1. Run the scenario with the configured requests and callbacks.
     *                   2. Read the ordered lifecycle trace.
     *                   3. Compare the trace with the golden literal.
     *                   4. Check the per-event counters.
     * @tc.expected      The trace and every counter match the recorded golden values.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('snapshotRegressionTraceFullLifecycle', 0, () => {
      const service: ServiceLifecycleModel = runScenario([1, 2], true, false, true, true);
      const trace: string = service.events.trace();
      expect(trace).assertEqual('onCreate>onConnect:IPCStubTest>onRequest:1>onRequest:2>onDisconnect>onDestroy');
      expect(service.events.size()).assertEqual(6);
      expect(service.events.countOf(EVENT_ON_CREATE)).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_REQUEST)).assertEqual(2);
      expect(service.events.countOf(EVENT_ON_DISCONNECT)).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_DESTROY)).assertEqual(1);
      expect(service.events.last()).assertEqual('onDestroy');
      expect(service.events.fingerprint()).assertEqual(textFingerprint('onCreate>onConnect:IPCStubTest>onRequest:1>onRequest:2>onDisconnect>onDestroy'));
      logStep("snapshotRegressionTraceFullLifecycle", trace);
    });

    /**
     * @tc.name          snapshotRegressionTraceDoubleConnect
     * @tc.desc          Scenario double connect reproduces the golden lifecycle trace.
     * @tc.precondition  A lifecycle model is driven through the recorded step configuration.
     * @tc.steps         1. Run the scenario with the configured requests and callbacks.
     *                   2. Read the ordered lifecycle trace.
     *                   3. Compare the trace with the golden literal.
     *                   4. Check the per-event counters.
     * @tc.expected      The trace and every counter match the recorded golden values.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('snapshotRegressionTraceDoubleConnect', 0, () => {
      const service: ServiceLifecycleModel = runScenario([], true, true, false, false);
      const trace: string = service.events.trace();
      expect(trace).assertEqual('onCreate>onConnect:IPCStubTest>onConnect:IPCStubTest');
      expect(service.events.size()).assertEqual(3);
      expect(service.events.countOf(EVENT_ON_CREATE)).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(2);
      expect(service.events.countOf(EVENT_ON_REQUEST)).assertEqual(0);
      expect(service.events.countOf(EVENT_ON_DISCONNECT)).assertEqual(0);
      expect(service.events.countOf(EVENT_ON_DESTROY)).assertEqual(0);
      expect(service.events.last()).assertEqual('onConnect:IPCStubTest');
      expect(service.events.fingerprint()).assertEqual(textFingerprint('onCreate>onConnect:IPCStubTest>onConnect:IPCStubTest'));
      logStep("snapshotRegressionTraceDoubleConnect", trace);
    });

    /**
     * @tc.name          snapshotRegressionTraceDestroyOnly
     * @tc.desc          Scenario destroy only reproduces the golden lifecycle trace.
     * @tc.precondition  A lifecycle model is driven through the recorded step configuration.
     * @tc.steps         1. Run the scenario with the configured requests and callbacks.
     *                   2. Read the ordered lifecycle trace.
     *                   3. Compare the trace with the golden literal.
     *                   4. Check the per-event counters.
     * @tc.expected      The trace and every counter match the recorded golden values.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('snapshotRegressionTraceDestroyOnly', 0, () => {
      const service: ServiceLifecycleModel = runScenario([], false, false, false, true);
      const trace: string = service.events.trace();
      expect(trace).assertEqual('onCreate>onDestroy');
      expect(service.events.size()).assertEqual(2);
      expect(service.events.countOf(EVENT_ON_CREATE)).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(0);
      expect(service.events.countOf(EVENT_ON_REQUEST)).assertEqual(0);
      expect(service.events.countOf(EVENT_ON_DISCONNECT)).assertEqual(0);
      expect(service.events.countOf(EVENT_ON_DESTROY)).assertEqual(1);
      expect(service.events.last()).assertEqual('onDestroy');
      expect(service.events.fingerprint()).assertEqual(textFingerprint('onCreate>onDestroy'));
      logStep("snapshotRegressionTraceDestroyOnly", trace);
    });

    /**
     * @tc.name          snapshotRegressionTraceDisconnectOnly
     * @tc.desc          Scenario disconnect only reproduces the golden lifecycle trace.
     * @tc.precondition  A lifecycle model is driven through the recorded step configuration.
     * @tc.steps         1. Run the scenario with the configured requests and callbacks.
     *                   2. Read the ordered lifecycle trace.
     *                   3. Compare the trace with the golden literal.
     *                   4. Check the per-event counters.
     * @tc.expected      The trace and every counter match the recorded golden values.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('snapshotRegressionTraceDisconnectOnly', 0, () => {
      const service: ServiceLifecycleModel = runScenario([], false, false, true, false);
      const trace: string = service.events.trace();
      expect(trace).assertEqual('onCreate>onDisconnect');
      expect(service.events.size()).assertEqual(2);
      expect(service.events.countOf(EVENT_ON_CREATE)).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(0);
      expect(service.events.countOf(EVENT_ON_REQUEST)).assertEqual(0);
      expect(service.events.countOf(EVENT_ON_DISCONNECT)).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_DESTROY)).assertEqual(0);
      expect(service.events.last()).assertEqual('onDisconnect');
      expect(service.events.fingerprint()).assertEqual(textFingerprint('onCreate>onDisconnect'));
      logStep("snapshotRegressionTraceDisconnectOnly", trace);
    });

    /**
     * @tc.name          snapshotRegressionTraceThreeRequests
     * @tc.desc          Scenario three requests reproduces the golden lifecycle trace.
     * @tc.precondition  A lifecycle model is driven through the recorded step configuration.
     * @tc.steps         1. Run the scenario with the configured requests and callbacks.
     *                   2. Read the ordered lifecycle trace.
     *                   3. Compare the trace with the golden literal.
     *                   4. Check the per-event counters.
     * @tc.expected      The trace and every counter match the recorded golden values.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('snapshotRegressionTraceThreeRequests', 0, () => {
      const service: ServiceLifecycleModel = runScenario([1, 2, 3], false, false, false, false);
      const trace: string = service.events.trace();
      expect(trace).assertEqual('onCreate>onRequest:1>onRequest:2>onRequest:3');
      expect(service.events.size()).assertEqual(4);
      expect(service.events.countOf(EVENT_ON_CREATE)).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(0);
      expect(service.events.countOf(EVENT_ON_REQUEST)).assertEqual(3);
      expect(service.events.countOf(EVENT_ON_DISCONNECT)).assertEqual(0);
      expect(service.events.countOf(EVENT_ON_DESTROY)).assertEqual(0);
      expect(service.events.last()).assertEqual('onRequest:3');
      expect(service.events.fingerprint()).assertEqual(textFingerprint('onCreate>onRequest:1>onRequest:2>onRequest:3'));
      logStep("snapshotRegressionTraceThreeRequests", trace);
    });

    /**
     * @tc.name          snapshotRegressionTraceNoDestroy
     * @tc.desc          Scenario no destroy reproduces the golden lifecycle trace.
     * @tc.precondition  A lifecycle model is driven through the recorded step configuration.
     * @tc.steps         1. Run the scenario with the configured requests and callbacks.
     *                   2. Read the ordered lifecycle trace.
     *                   3. Compare the trace with the golden literal.
     *                   4. Check the per-event counters.
     * @tc.expected      The trace and every counter match the recorded golden values.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('snapshotRegressionTraceNoDestroy', 0, () => {
      const service: ServiceLifecycleModel = runScenario([1, 2], true, false, true, false);
      const trace: string = service.events.trace();
      expect(trace).assertEqual('onCreate>onConnect:IPCStubTest>onRequest:1>onRequest:2>onDisconnect');
      expect(service.events.size()).assertEqual(5);
      expect(service.events.countOf(EVENT_ON_CREATE)).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_REQUEST)).assertEqual(2);
      expect(service.events.countOf(EVENT_ON_DISCONNECT)).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_DESTROY)).assertEqual(0);
      expect(service.events.last()).assertEqual('onDisconnect');
      expect(service.events.fingerprint()).assertEqual(textFingerprint('onCreate>onConnect:IPCStubTest>onRequest:1>onRequest:2>onDisconnect'));
      logStep("snapshotRegressionTraceNoDestroy", trace);
    });

    /**
     * @tc.name          snapshotRegressionTraceConnectThenDestroy
     * @tc.desc          Scenario connect then destroy reproduces the golden lifecycle trace.
     * @tc.precondition  A lifecycle model is driven through the recorded step configuration.
     * @tc.steps         1. Run the scenario with the configured requests and callbacks.
     *                   2. Read the ordered lifecycle trace.
     *                   3. Compare the trace with the golden literal.
     *                   4. Check the per-event counters.
     * @tc.expected      The trace and every counter match the recorded golden values.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('snapshotRegressionTraceConnectThenDestroy', 0, () => {
      const service: ServiceLifecycleModel = runScenario([1], true, false, false, true);
      const trace: string = service.events.trace();
      expect(trace).assertEqual('onCreate>onConnect:IPCStubTest>onRequest:1>onDestroy');
      expect(service.events.size()).assertEqual(4);
      expect(service.events.countOf(EVENT_ON_CREATE)).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_REQUEST)).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_DISCONNECT)).assertEqual(0);
      expect(service.events.countOf(EVENT_ON_DESTROY)).assertEqual(1);
      expect(service.events.last()).assertEqual('onDestroy');
      expect(service.events.fingerprint()).assertEqual(textFingerprint('onCreate>onConnect:IPCStubTest>onRequest:1>onDestroy'));
      logStep("snapshotRegressionTraceConnectThenDestroy", trace);
    });

    /**
     * @tc.name          snapshotRegressionTraceThreeRequestsThenDestroy
     * @tc.desc          Scenario three requests then destroy reproduces the golden lifecycle trace.
     * @tc.precondition  A lifecycle model is driven through the recorded step configuration.
     * @tc.steps         1. Run the scenario with the configured requests and callbacks.
     *                   2. Read the ordered lifecycle trace.
     *                   3. Compare the trace with the golden literal.
     *                   4. Check the per-event counters.
     * @tc.expected      The trace and every counter match the recorded golden values.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('snapshotRegressionTraceThreeRequestsThenDestroy', 0, () => {
      const service: ServiceLifecycleModel = runScenario([1, 2, 3], true, false, false, true);
      const trace: string = service.events.trace();
      expect(trace).assertEqual('onCreate>onConnect:IPCStubTest>onRequest:1>onRequest:2>onRequest:3>onDestroy');
      expect(service.events.size()).assertEqual(6);
      expect(service.events.countOf(EVENT_ON_CREATE)).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_REQUEST)).assertEqual(3);
      expect(service.events.countOf(EVENT_ON_DISCONNECT)).assertEqual(0);
      expect(service.events.countOf(EVENT_ON_DESTROY)).assertEqual(1);
      expect(service.events.last()).assertEqual('onDestroy');
      expect(service.events.fingerprint()).assertEqual(textFingerprint('onCreate>onConnect:IPCStubTest>onRequest:1>onRequest:2>onRequest:3>onDestroy'));
      logStep("snapshotRegressionTraceThreeRequestsThenDestroy", trace);
    });

    /**
     * @tc.name          snapshotRegressionTraceDoubleConnectWithRequest
     * @tc.desc          Scenario double connect with request reproduces the golden lifecycle trace.
     * @tc.precondition  A lifecycle model is driven through the recorded step configuration.
     * @tc.steps         1. Run the scenario with the configured requests and callbacks.
     *                   2. Read the ordered lifecycle trace.
     *                   3. Compare the trace with the golden literal.
     *                   4. Check the per-event counters.
     * @tc.expected      The trace and every counter match the recorded golden values.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('snapshotRegressionTraceDoubleConnectWithRequest', 0, () => {
      const service: ServiceLifecycleModel = runScenario([5], true, true, false, false);
      const trace: string = service.events.trace();
      expect(trace).assertEqual('onCreate>onConnect:IPCStubTest>onRequest:5>onConnect:IPCStubTest');
      expect(service.events.size()).assertEqual(4);
      expect(service.events.countOf(EVENT_ON_CREATE)).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(2);
      expect(service.events.countOf(EVENT_ON_REQUEST)).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_DISCONNECT)).assertEqual(0);
      expect(service.events.countOf(EVENT_ON_DESTROY)).assertEqual(0);
      expect(service.events.last()).assertEqual('onConnect:IPCStubTest');
      expect(service.events.fingerprint()).assertEqual(textFingerprint('onCreate>onConnect:IPCStubTest>onRequest:5>onConnect:IPCStubTest'));
      logStep("snapshotRegressionTraceDoubleConnectWithRequest", trace);
    });

    /**
     * @tc.name          snapshotRegressionTraceNegativeStartId
     * @tc.desc          Scenario negative start id reproduces the golden lifecycle trace.
     * @tc.precondition  A lifecycle model is driven through the recorded step configuration.
     * @tc.steps         1. Run the scenario with the configured requests and callbacks.
     *                   2. Read the ordered lifecycle trace.
     *                   3. Compare the trace with the golden literal.
     *                   4. Check the per-event counters.
     * @tc.expected      The trace and every counter match the recorded golden values.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('snapshotRegressionTraceNegativeStartId', 0, () => {
      const service: ServiceLifecycleModel = runScenario([-1], true, false, false, false);
      const trace: string = service.events.trace();
      expect(trace).assertEqual('onCreate>onConnect:IPCStubTest>onRequest:-1');
      expect(service.events.size()).assertEqual(3);
      expect(service.events.countOf(EVENT_ON_CREATE)).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_REQUEST)).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_DISCONNECT)).assertEqual(0);
      expect(service.events.countOf(EVENT_ON_DESTROY)).assertEqual(0);
      expect(service.events.last()).assertEqual('onRequest:-1');
      expect(service.events.fingerprint()).assertEqual(textFingerprint('onCreate>onConnect:IPCStubTest>onRequest:-1'));
      logStep("snapshotRegressionTraceNegativeStartId", trace);
    });

    /**
     * @tc.name          snapshotRegressionTraceZeroStartId
     * @tc.desc          Scenario zero start id reproduces the golden lifecycle trace.
     * @tc.precondition  A lifecycle model is driven through the recorded step configuration.
     * @tc.steps         1. Run the scenario with the configured requests and callbacks.
     *                   2. Read the ordered lifecycle trace.
     *                   3. Compare the trace with the golden literal.
     *                   4. Check the per-event counters.
     * @tc.expected      The trace and every counter match the recorded golden values.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('snapshotRegressionTraceZeroStartId', 0, () => {
      const service: ServiceLifecycleModel = runScenario([0], true, false, false, false);
      const trace: string = service.events.trace();
      expect(trace).assertEqual('onCreate>onConnect:IPCStubTest>onRequest:0');
      expect(service.events.size()).assertEqual(3);
      expect(service.events.countOf(EVENT_ON_CREATE)).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_REQUEST)).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_DISCONNECT)).assertEqual(0);
      expect(service.events.countOf(EVENT_ON_DESTROY)).assertEqual(0);
      expect(service.events.last()).assertEqual('onRequest:0');
      expect(service.events.fingerprint()).assertEqual(textFingerprint('onCreate>onConnect:IPCStubTest>onRequest:0'));
      logStep("snapshotRegressionTraceZeroStartId", trace);
    });

    /**
     * @tc.name          snapshotRegressionTraceLargeStartId
     * @tc.desc          Scenario large start id reproduces the golden lifecycle trace.
     * @tc.precondition  A lifecycle model is driven through the recorded step configuration.
     * @tc.steps         1. Run the scenario with the configured requests and callbacks.
     *                   2. Read the ordered lifecycle trace.
     *                   3. Compare the trace with the golden literal.
     *                   4. Check the per-event counters.
     * @tc.expected      The trace and every counter match the recorded golden values.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('snapshotRegressionTraceLargeStartId', 0, () => {
      const service: ServiceLifecycleModel = runScenario([99], true, false, false, false);
      const trace: string = service.events.trace();
      expect(trace).assertEqual('onCreate>onConnect:IPCStubTest>onRequest:99');
      expect(service.events.size()).assertEqual(3);
      expect(service.events.countOf(EVENT_ON_CREATE)).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_REQUEST)).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_DISCONNECT)).assertEqual(0);
      expect(service.events.countOf(EVENT_ON_DESTROY)).assertEqual(0);
      expect(service.events.last()).assertEqual('onRequest:99');
      expect(service.events.fingerprint()).assertEqual(textFingerprint('onCreate>onConnect:IPCStubTest>onRequest:99'));
      logStep("snapshotRegressionTraceLargeStartId", trace);
    });

    /**
     * @tc.name          snapshotRegressionSnapshotRequestOnly
     * @tc.desc          Snapshot fields for scenario request only match the golden snapshot.
     * @tc.precondition  The scenario is executed once on a fresh lifecycle model.
     * @tc.steps         1. Run the configured scenario.
     *                   2. Capture the service snapshot.
     *                   3. Compare state and all counters.
     *                   4. Compare the description and liveness flag.
     * @tc.expected      The snapshot equals the golden state and the description is stable.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('snapshotRegressionSnapshotRequestOnly', 0, () => {
      const service: ServiceLifecycleModel = runScenario([1], false, false, false, false);
      const snapshot: ServiceSnapshot = snapshotOf(service);
      expect(snapshot.state).assertEqual('created');
      expect(snapshot.connects).assertEqual(0);
      expect(snapshot.disconnects).assertEqual(0);
      expect(snapshot.requests).assertEqual(1);
      expect(snapshot.destroys).assertEqual(0);
      expect(snapshot.describe()).assertEqual('created/0/0/1/0');
      expect(service.isAlive()).assertEqual(true);
      expect(snapshot.requests).assertEqual(service.requestCount);
      expect(snapshot.connects).assertEqual(service.connectCount);
      logStep("snapshotRegressionSnapshotRequestOnly", snapshot.describe());
    });

    /**
     * @tc.name          snapshotRegressionSnapshotFullLifecycle
     * @tc.desc          Snapshot fields for scenario full lifecycle match the golden snapshot.
     * @tc.precondition  The scenario is executed once on a fresh lifecycle model.
     * @tc.steps         1. Run the configured scenario.
     *                   2. Capture the service snapshot.
     *                   3. Compare state and all counters.
     *                   4. Compare the description and liveness flag.
     * @tc.expected      The snapshot equals the golden state and the description is stable.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('snapshotRegressionSnapshotFullLifecycle', 0, () => {
      const service: ServiceLifecycleModel = runScenario([1, 2], true, false, true, true);
      const snapshot: ServiceSnapshot = snapshotOf(service);
      expect(snapshot.state).assertEqual('destroyed');
      expect(snapshot.connects).assertEqual(1);
      expect(snapshot.disconnects).assertEqual(1);
      expect(snapshot.requests).assertEqual(2);
      expect(snapshot.destroys).assertEqual(1);
      expect(snapshot.describe()).assertEqual('destroyed/1/1/2/1');
      expect(service.isAlive()).assertEqual(false);
      expect(snapshot.requests).assertEqual(service.requestCount);
      expect(snapshot.connects).assertEqual(service.connectCount);
      logStep("snapshotRegressionSnapshotFullLifecycle", snapshot.describe());
    });

    /**
     * @tc.name          snapshotRegressionSnapshotDoubleConnect
     * @tc.desc          Snapshot fields for scenario double connect match the golden snapshot.
     * @tc.precondition  The scenario is executed once on a fresh lifecycle model.
     * @tc.steps         1. Run the configured scenario.
     *                   2. Capture the service snapshot.
     *                   3. Compare state and all counters.
     *                   4. Compare the description and liveness flag.
     * @tc.expected      The snapshot equals the golden state and the description is stable.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('snapshotRegressionSnapshotDoubleConnect', 0, () => {
      const service: ServiceLifecycleModel = runScenario([], true, true, false, false);
      const snapshot: ServiceSnapshot = snapshotOf(service);
      expect(snapshot.state).assertEqual('connected');
      expect(snapshot.connects).assertEqual(2);
      expect(snapshot.disconnects).assertEqual(0);
      expect(snapshot.requests).assertEqual(0);
      expect(snapshot.destroys).assertEqual(0);
      expect(snapshot.describe()).assertEqual('connected/2/0/0/0');
      expect(service.isAlive()).assertEqual(true);
      expect(snapshot.requests).assertEqual(service.requestCount);
      expect(snapshot.connects).assertEqual(service.connectCount);
      logStep("snapshotRegressionSnapshotDoubleConnect", snapshot.describe());
    });

    /**
     * @tc.name          snapshotRegressionSnapshotDestroyOnly
     * @tc.desc          Snapshot fields for scenario destroy only match the golden snapshot.
     * @tc.precondition  The scenario is executed once on a fresh lifecycle model.
     * @tc.steps         1. Run the configured scenario.
     *                   2. Capture the service snapshot.
     *                   3. Compare state and all counters.
     *                   4. Compare the description and liveness flag.
     * @tc.expected      The snapshot equals the golden state and the description is stable.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('snapshotRegressionSnapshotDestroyOnly', 0, () => {
      const service: ServiceLifecycleModel = runScenario([], false, false, false, true);
      const snapshot: ServiceSnapshot = snapshotOf(service);
      expect(snapshot.state).assertEqual('destroyed');
      expect(snapshot.connects).assertEqual(0);
      expect(snapshot.disconnects).assertEqual(0);
      expect(snapshot.requests).assertEqual(0);
      expect(snapshot.destroys).assertEqual(1);
      expect(snapshot.describe()).assertEqual('destroyed/0/0/0/1');
      expect(service.isAlive()).assertEqual(false);
      expect(snapshot.requests).assertEqual(service.requestCount);
      expect(snapshot.connects).assertEqual(service.connectCount);
      logStep("snapshotRegressionSnapshotDestroyOnly", snapshot.describe());
    });

    /**
     * @tc.name          snapshotRegressionSnapshotDisconnectOnly
     * @tc.desc          Snapshot fields for scenario disconnect only match the golden snapshot.
     * @tc.precondition  The scenario is executed once on a fresh lifecycle model.
     * @tc.steps         1. Run the configured scenario.
     *                   2. Capture the service snapshot.
     *                   3. Compare state and all counters.
     *                   4. Compare the description and liveness flag.
     * @tc.expected      The snapshot equals the golden state and the description is stable.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('snapshotRegressionSnapshotDisconnectOnly', 0, () => {
      const service: ServiceLifecycleModel = runScenario([], false, false, true, false);
      const snapshot: ServiceSnapshot = snapshotOf(service);
      expect(snapshot.state).assertEqual('disconnected');
      expect(snapshot.connects).assertEqual(0);
      expect(snapshot.disconnects).assertEqual(1);
      expect(snapshot.requests).assertEqual(0);
      expect(snapshot.destroys).assertEqual(0);
      expect(snapshot.describe()).assertEqual('disconnected/0/1/0/0');
      expect(service.isAlive()).assertEqual(true);
      expect(snapshot.requests).assertEqual(service.requestCount);
      expect(snapshot.connects).assertEqual(service.connectCount);
      logStep("snapshotRegressionSnapshotDisconnectOnly", snapshot.describe());
    });

    /**
     * @tc.name          snapshotRegressionSnapshotThreeRequests
     * @tc.desc          Snapshot fields for scenario three requests match the golden snapshot.
     * @tc.precondition  The scenario is executed once on a fresh lifecycle model.
     * @tc.steps         1. Run the configured scenario.
     *                   2. Capture the service snapshot.
     *                   3. Compare state and all counters.
     *                   4. Compare the description and liveness flag.
     * @tc.expected      The snapshot equals the golden state and the description is stable.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('snapshotRegressionSnapshotThreeRequests', 0, () => {
      const service: ServiceLifecycleModel = runScenario([1, 2, 3], false, false, false, false);
      const snapshot: ServiceSnapshot = snapshotOf(service);
      expect(snapshot.state).assertEqual('created');
      expect(snapshot.connects).assertEqual(0);
      expect(snapshot.disconnects).assertEqual(0);
      expect(snapshot.requests).assertEqual(3);
      expect(snapshot.destroys).assertEqual(0);
      expect(snapshot.describe()).assertEqual('created/0/0/3/0');
      expect(service.isAlive()).assertEqual(true);
      expect(snapshot.requests).assertEqual(service.requestCount);
      expect(snapshot.connects).assertEqual(service.connectCount);
      logStep("snapshotRegressionSnapshotThreeRequests", snapshot.describe());
    });

    /**
     * @tc.name          snapshotRegressionSnapshotNoDestroy
     * @tc.desc          Snapshot fields for scenario no destroy match the golden snapshot.
     * @tc.precondition  The scenario is executed once on a fresh lifecycle model.
     * @tc.steps         1. Run the configured scenario.
     *                   2. Capture the service snapshot.
     *                   3. Compare state and all counters.
     *                   4. Compare the description and liveness flag.
     * @tc.expected      The snapshot equals the golden state and the description is stable.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('snapshotRegressionSnapshotNoDestroy', 0, () => {
      const service: ServiceLifecycleModel = runScenario([1, 2], true, false, true, false);
      const snapshot: ServiceSnapshot = snapshotOf(service);
      expect(snapshot.state).assertEqual('disconnected');
      expect(snapshot.connects).assertEqual(1);
      expect(snapshot.disconnects).assertEqual(1);
      expect(snapshot.requests).assertEqual(2);
      expect(snapshot.destroys).assertEqual(0);
      expect(snapshot.describe()).assertEqual('disconnected/1/1/2/0');
      expect(service.isAlive()).assertEqual(true);
      expect(snapshot.requests).assertEqual(service.requestCount);
      expect(snapshot.connects).assertEqual(service.connectCount);
      logStep("snapshotRegressionSnapshotNoDestroy", snapshot.describe());
    });

    /**
     * @tc.name          snapshotRegressionSnapshotConnectThenDestroy
     * @tc.desc          Snapshot fields for scenario connect then destroy match the golden snapshot.
     * @tc.precondition  The scenario is executed once on a fresh lifecycle model.
     * @tc.steps         1. Run the configured scenario.
     *                   2. Capture the service snapshot.
     *                   3. Compare state and all counters.
     *                   4. Compare the description and liveness flag.
     * @tc.expected      The snapshot equals the golden state and the description is stable.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('snapshotRegressionSnapshotConnectThenDestroy', 0, () => {
      const service: ServiceLifecycleModel = runScenario([1], true, false, false, true);
      const snapshot: ServiceSnapshot = snapshotOf(service);
      expect(snapshot.state).assertEqual('destroyed');
      expect(snapshot.connects).assertEqual(1);
      expect(snapshot.disconnects).assertEqual(0);
      expect(snapshot.requests).assertEqual(1);
      expect(snapshot.destroys).assertEqual(1);
      expect(snapshot.describe()).assertEqual('destroyed/1/0/1/1');
      expect(service.isAlive()).assertEqual(false);
      expect(snapshot.requests).assertEqual(service.requestCount);
      expect(snapshot.connects).assertEqual(service.connectCount);
      logStep("snapshotRegressionSnapshotConnectThenDestroy", snapshot.describe());
    });

    /**
     * @tc.name          snapshotRegressionSnapshotThreeThenDestroy
     * @tc.desc          Snapshot fields for scenario three then destroy match the golden snapshot.
     * @tc.precondition  The scenario is executed once on a fresh lifecycle model.
     * @tc.steps         1. Run the configured scenario.
     *                   2. Capture the service snapshot.
     *                   3. Compare state and all counters.
     *                   4. Compare the description and liveness flag.
     * @tc.expected      The snapshot equals the golden state and the description is stable.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('snapshotRegressionSnapshotThreeThenDestroy', 0, () => {
      const service: ServiceLifecycleModel = runScenario([1, 2, 3], true, false, false, true);
      const snapshot: ServiceSnapshot = snapshotOf(service);
      expect(snapshot.state).assertEqual('destroyed');
      expect(snapshot.connects).assertEqual(1);
      expect(snapshot.disconnects).assertEqual(0);
      expect(snapshot.requests).assertEqual(3);
      expect(snapshot.destroys).assertEqual(1);
      expect(snapshot.describe()).assertEqual('destroyed/1/0/3/1');
      expect(service.isAlive()).assertEqual(false);
      expect(snapshot.requests).assertEqual(service.requestCount);
      expect(snapshot.connects).assertEqual(service.connectCount);
      logStep("snapshotRegressionSnapshotThreeThenDestroy", snapshot.describe());
    });

    /**
     * @tc.name          snapshotRegressionSnapshotDoubleConnectWithRequest
     * @tc.desc          Snapshot fields for scenario double connect with request match the golden snapshot.
     * @tc.precondition  The scenario is executed once on a fresh lifecycle model.
     * @tc.steps         1. Run the configured scenario.
     *                   2. Capture the service snapshot.
     *                   3. Compare state and all counters.
     *                   4. Compare the description and liveness flag.
     * @tc.expected      The snapshot equals the golden state and the description is stable.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('snapshotRegressionSnapshotDoubleConnectWithRequest', 0, () => {
      const service: ServiceLifecycleModel = runScenario([5], true, true, false, false);
      const snapshot: ServiceSnapshot = snapshotOf(service);
      expect(snapshot.state).assertEqual('connected');
      expect(snapshot.connects).assertEqual(2);
      expect(snapshot.disconnects).assertEqual(0);
      expect(snapshot.requests).assertEqual(1);
      expect(snapshot.destroys).assertEqual(0);
      expect(snapshot.describe()).assertEqual('connected/2/0/1/0');
      expect(service.isAlive()).assertEqual(true);
      expect(snapshot.requests).assertEqual(service.requestCount);
      expect(snapshot.connects).assertEqual(service.connectCount);
      logStep("snapshotRegressionSnapshotDoubleConnectWithRequest", snapshot.describe());
    });

    /**
     * @tc.name          snapshotRegressionSnapshotNegativeStartId
     * @tc.desc          Snapshot fields for scenario negative start id match the golden snapshot.
     * @tc.precondition  The scenario is executed once on a fresh lifecycle model.
     * @tc.steps         1. Run the configured scenario.
     *                   2. Capture the service snapshot.
     *                   3. Compare state and all counters.
     *                   4. Compare the description and liveness flag.
     * @tc.expected      The snapshot equals the golden state and the description is stable.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('snapshotRegressionSnapshotNegativeStartId', 0, () => {
      const service: ServiceLifecycleModel = runScenario([-1], true, false, false, false);
      const snapshot: ServiceSnapshot = snapshotOf(service);
      expect(snapshot.state).assertEqual('connected');
      expect(snapshot.connects).assertEqual(1);
      expect(snapshot.disconnects).assertEqual(0);
      expect(snapshot.requests).assertEqual(1);
      expect(snapshot.destroys).assertEqual(0);
      expect(snapshot.describe()).assertEqual('connected/1/0/1/0');
      expect(service.isAlive()).assertEqual(true);
      expect(snapshot.requests).assertEqual(service.requestCount);
      expect(snapshot.connects).assertEqual(service.connectCount);
      logStep("snapshotRegressionSnapshotNegativeStartId", snapshot.describe());
    });

    /**
     * @tc.name          snapshotRegressionSnapshotZeroStartId
     * @tc.desc          Snapshot fields for scenario zero start id match the golden snapshot.
     * @tc.precondition  The scenario is executed once on a fresh lifecycle model.
     * @tc.steps         1. Run the configured scenario.
     *                   2. Capture the service snapshot.
     *                   3. Compare state and all counters.
     *                   4. Compare the description and liveness flag.
     * @tc.expected      The snapshot equals the golden state and the description is stable.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('snapshotRegressionSnapshotZeroStartId', 0, () => {
      const service: ServiceLifecycleModel = runScenario([0], true, false, false, false);
      const snapshot: ServiceSnapshot = snapshotOf(service);
      expect(snapshot.state).assertEqual('connected');
      expect(snapshot.connects).assertEqual(1);
      expect(snapshot.disconnects).assertEqual(0);
      expect(snapshot.requests).assertEqual(1);
      expect(snapshot.destroys).assertEqual(0);
      expect(snapshot.describe()).assertEqual('connected/1/0/1/0');
      expect(service.isAlive()).assertEqual(true);
      expect(snapshot.requests).assertEqual(service.requestCount);
      expect(snapshot.connects).assertEqual(service.connectCount);
      logStep("snapshotRegressionSnapshotZeroStartId", snapshot.describe());
    });

    /**
     * @tc.name          snapshotRegressionSnapshotLargeStartId
     * @tc.desc          Snapshot fields for scenario large start id match the golden snapshot.
     * @tc.precondition  The scenario is executed once on a fresh lifecycle model.
     * @tc.steps         1. Run the configured scenario.
     *                   2. Capture the service snapshot.
     *                   3. Compare state and all counters.
     *                   4. Compare the description and liveness flag.
     * @tc.expected      The snapshot equals the golden state and the description is stable.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('snapshotRegressionSnapshotLargeStartId', 0, () => {
      const service: ServiceLifecycleModel = runScenario([99], true, false, false, false);
      const snapshot: ServiceSnapshot = snapshotOf(service);
      expect(snapshot.state).assertEqual('connected');
      expect(snapshot.connects).assertEqual(1);
      expect(snapshot.disconnects).assertEqual(0);
      expect(snapshot.requests).assertEqual(1);
      expect(snapshot.destroys).assertEqual(0);
      expect(snapshot.describe()).assertEqual('connected/1/0/1/0');
      expect(service.isAlive()).assertEqual(true);
      expect(snapshot.requests).assertEqual(service.requestCount);
      expect(snapshot.connects).assertEqual(service.connectCount);
      logStep("snapshotRegressionSnapshotLargeStartId", snapshot.describe());
    });

    /**
     * @tc.name          snapshotRegressionSnapshotSevenEight
     * @tc.desc          Snapshot fields for scenario seven eight match the golden snapshot.
     * @tc.precondition  The scenario is executed once on a fresh lifecycle model.
     * @tc.steps         1. Run the configured scenario.
     *                   2. Capture the service snapshot.
     *                   3. Compare state and all counters.
     *                   4. Compare the description and liveness flag.
     * @tc.expected      The snapshot equals the golden state and the description is stable.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('snapshotRegressionSnapshotSevenEight', 0, () => {
      const service: ServiceLifecycleModel = runScenario([7, 8], true, false, true, true);
      const snapshot: ServiceSnapshot = snapshotOf(service);
      expect(snapshot.state).assertEqual('destroyed');
      expect(snapshot.connects).assertEqual(1);
      expect(snapshot.disconnects).assertEqual(1);
      expect(snapshot.requests).assertEqual(2);
      expect(snapshot.destroys).assertEqual(1);
      expect(snapshot.describe()).assertEqual('destroyed/1/1/2/1');
      expect(service.isAlive()).assertEqual(false);
      expect(snapshot.requests).assertEqual(service.requestCount);
      expect(snapshot.connects).assertEqual(service.connectCount);
      logStep("snapshotRegressionSnapshotSevenEight", snapshot.describe());
    });

    /**
     * @tc.name          snapshotRegressionReplayConnectOnly
     * @tc.desc          Replaying scenario connect only yields two identical lifecycles.
     * @tc.precondition  Two independent models run the same configuration.
     * @tc.steps         1. Run the scenario on the first model.
     *                   2. Run it again on the second model.
     *                   3. Compare snapshots, traces and fingerprints.
     *                   4. Compare the two descriptions.
     * @tc.expected      Snapshots, event traces and fingerprints are pairwise equal.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('snapshotRegressionReplayConnectOnly', 0, () => {
      const left: ServiceLifecycleModel = runScenario([], true, false, false, false);
      const right: ServiceLifecycleModel = runScenario([], true, false, false, false);
      expect(sameLifecycle(left, right)).assertTrue();
      expect(left.events.trace()).assertEqual(right.events.trace());
      expect(left.events.trace()).assertEqual('onCreate>onConnect:IPCStubTest');
      expect(left.events.fingerprint()).assertEqual(right.events.fingerprint());
      expect(snapshotOf(left).sameAs(snapshotOf(right))).assertTrue();
      expect(snapshotOf(left).describe()).assertEqual(snapshotOf(right).describe());
      expect(left.destroyCount).assertEqual(right.destroyCount);
      expect(left.events.size()).assertEqual(right.events.size());
      logStep("snapshotRegressionReplayConnectOnly", snapshotOf(left).describe());
    });

    /**
     * @tc.name          snapshotRegressionReplayFullLifecycle
     * @tc.desc          Replaying scenario full lifecycle yields two identical lifecycles.
     * @tc.precondition  Two independent models run the same configuration.
     * @tc.steps         1. Run the scenario on the first model.
     *                   2. Run it again on the second model.
     *                   3. Compare snapshots, traces and fingerprints.
     *                   4. Compare the two descriptions.
     * @tc.expected      Snapshots, event traces and fingerprints are pairwise equal.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('snapshotRegressionReplayFullLifecycle', 0, () => {
      const left: ServiceLifecycleModel = runScenario([1, 2], true, false, true, true);
      const right: ServiceLifecycleModel = runScenario([1, 2], true, false, true, true);
      expect(sameLifecycle(left, right)).assertTrue();
      expect(left.events.trace()).assertEqual(right.events.trace());
      expect(left.events.trace()).assertEqual('onCreate>onConnect:IPCStubTest>onRequest:1>onRequest:2>onDisconnect>onDestroy');
      expect(left.events.fingerprint()).assertEqual(right.events.fingerprint());
      expect(snapshotOf(left).sameAs(snapshotOf(right))).assertTrue();
      expect(snapshotOf(left).describe()).assertEqual(snapshotOf(right).describe());
      expect(left.destroyCount).assertEqual(right.destroyCount);
      expect(left.events.size()).assertEqual(right.events.size());
      logStep("snapshotRegressionReplayFullLifecycle", snapshotOf(left).describe());
    });

    /**
     * @tc.name          snapshotRegressionReplayThreeRequests
     * @tc.desc          Replaying scenario three requests yields two identical lifecycles.
     * @tc.precondition  Two independent models run the same configuration.
     * @tc.steps         1. Run the scenario on the first model.
     *                   2. Run it again on the second model.
     *                   3. Compare snapshots, traces and fingerprints.
     *                   4. Compare the two descriptions.
     * @tc.expected      Snapshots, event traces and fingerprints are pairwise equal.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('snapshotRegressionReplayThreeRequests', 0, () => {
      const left: ServiceLifecycleModel = runScenario([1, 2, 3], false, false, false, false);
      const right: ServiceLifecycleModel = runScenario([1, 2, 3], false, false, false, false);
      expect(sameLifecycle(left, right)).assertTrue();
      expect(left.events.trace()).assertEqual(right.events.trace());
      expect(left.events.trace()).assertEqual('onCreate>onRequest:1>onRequest:2>onRequest:3');
      expect(left.events.fingerprint()).assertEqual(right.events.fingerprint());
      expect(snapshotOf(left).sameAs(snapshotOf(right))).assertTrue();
      expect(snapshotOf(left).describe()).assertEqual(snapshotOf(right).describe());
      expect(left.destroyCount).assertEqual(right.destroyCount);
      expect(left.events.size()).assertEqual(right.events.size());
      logStep("snapshotRegressionReplayThreeRequests", snapshotOf(left).describe());
    });

    /**
     * @tc.name          snapshotRegressionReplayThreeThenDestroy
     * @tc.desc          Replaying scenario three then destroy yields two identical lifecycles.
     * @tc.precondition  Two independent models run the same configuration.
     * @tc.steps         1. Run the scenario on the first model.
     *                   2. Run it again on the second model.
     *                   3. Compare snapshots, traces and fingerprints.
     *                   4. Compare the two descriptions.
     * @tc.expected      Snapshots, event traces and fingerprints are pairwise equal.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('snapshotRegressionReplayThreeThenDestroy', 0, () => {
      const left: ServiceLifecycleModel = runScenario([1, 2, 3], true, false, false, true);
      const right: ServiceLifecycleModel = runScenario([1, 2, 3], true, false, false, true);
      expect(sameLifecycle(left, right)).assertTrue();
      expect(left.events.trace()).assertEqual(right.events.trace());
      expect(left.events.trace()).assertEqual('onCreate>onConnect:IPCStubTest>onRequest:1>onRequest:2>onRequest:3>onDestroy');
      expect(left.events.fingerprint()).assertEqual(right.events.fingerprint());
      expect(snapshotOf(left).sameAs(snapshotOf(right))).assertTrue();
      expect(snapshotOf(left).describe()).assertEqual(snapshotOf(right).describe());
      expect(left.destroyCount).assertEqual(right.destroyCount);
      expect(left.events.size()).assertEqual(right.events.size());
      logStep("snapshotRegressionReplayThreeThenDestroy", snapshotOf(left).describe());
    });

    /**
     * @tc.name          snapshotRegressionReplaySevenEight
     * @tc.desc          Replaying scenario seven eight yields two identical lifecycles.
     * @tc.precondition  Two independent models run the same configuration.
     * @tc.steps         1. Run the scenario on the first model.
     *                   2. Run it again on the second model.
     *                   3. Compare snapshots, traces and fingerprints.
     *                   4. Compare the two descriptions.
     * @tc.expected      Snapshots, event traces and fingerprints are pairwise equal.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('snapshotRegressionReplaySevenEight', 0, () => {
      const left: ServiceLifecycleModel = runScenario([7, 8], true, false, true, true);
      const right: ServiceLifecycleModel = runScenario([7, 8], true, false, true, true);
      expect(sameLifecycle(left, right)).assertTrue();
      expect(left.events.trace()).assertEqual(right.events.trace());
      expect(left.events.trace()).assertEqual('onCreate>onConnect:IPCStubTest>onRequest:7>onRequest:8>onDisconnect>onDestroy');
      expect(left.events.fingerprint()).assertEqual(right.events.fingerprint());
      expect(snapshotOf(left).sameAs(snapshotOf(right))).assertTrue();
      expect(snapshotOf(left).describe()).assertEqual(snapshotOf(right).describe());
      expect(left.destroyCount).assertEqual(right.destroyCount);
      expect(left.events.size()).assertEqual(right.events.size());
      logStep("snapshotRegressionReplaySevenEight", snapshotOf(left).describe());
    });

    /**
     * @tc.name          snapshotRegressionReplayConnectDisconnect
     * @tc.desc          Replaying scenario connect disconnect yields two identical lifecycles.
     * @tc.precondition  Two independent models run the same configuration.
     * @tc.steps         1. Run the scenario on the first model.
     *                   2. Run it again on the second model.
     *                   3. Compare snapshots, traces and fingerprints.
     *                   4. Compare the two descriptions.
     * @tc.expected      Snapshots, event traces and fingerprints are pairwise equal.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('snapshotRegressionReplayConnectDisconnect', 0, () => {
      const left: ServiceLifecycleModel = runScenario([], true, false, true, false);
      const right: ServiceLifecycleModel = runScenario([], true, false, true, false);
      expect(sameLifecycle(left, right)).assertTrue();
      expect(left.events.trace()).assertEqual(right.events.trace());
      expect(left.events.trace()).assertEqual('onCreate>onConnect:IPCStubTest>onDisconnect');
      expect(left.events.fingerprint()).assertEqual(right.events.fingerprint());
      expect(snapshotOf(left).sameAs(snapshotOf(right))).assertTrue();
      expect(snapshotOf(left).describe()).assertEqual(snapshotOf(right).describe());
      expect(left.destroyCount).assertEqual(right.destroyCount);
      expect(left.events.size()).assertEqual(right.events.size());
      logStep("snapshotRegressionReplayConnectDisconnect", snapshotOf(left).describe());
    });

    /**
     * @tc.name          snapshotRegressionResetFullLifecycle
     * @tc.desc          Resetting scenario full lifecycle returns the model to the idle golden state.
     * @tc.precondition  The scenario is executed and then reset.
     * @tc.steps         1. Run the configured scenario.
     *                   2. Capture the pre-reset snapshot.
     *                   3. Reset the model and capture the post-reset snapshot.
     *                   4. Check counters, events, logs and stub.
     * @tc.expected      Every counter and buffer drops to zero and the stub reference is cleared.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('snapshotRegressionResetFullLifecycle', 0, () => {
      const service: ServiceLifecycleModel = runScenario([1, 2], true, false, true, true);
      const before: ServiceSnapshot = snapshotOf(service);
      expect(before.state).assertEqual('destroyed');
      service.reset();
      const after: ServiceSnapshot = snapshotOf(service);
      expect(after.state).assertEqual("idle");
      expect(after.describe()).assertEqual("idle/0/0/0/0");
      expect(after.connects).assertEqual(0);
      expect(after.requests).assertEqual(0);
      expect(after.destroys).assertEqual(0);
      expect(service.events.size()).assertEqual(0);
      expect(service.logs.size()).assertEqual(0);
      expect(service.stub === undefined).assertTrue();
      expect(service.isAlive()).assertTrue();
      logStep("snapshotRegressionResetFullLifecycle", after.describe());
    });

    /**
     * @tc.name          snapshotRegressionResetDoubleConnect
     * @tc.desc          Resetting scenario double connect returns the model to the idle golden state.
     * @tc.precondition  The scenario is executed and then reset.
     * @tc.steps         1. Run the configured scenario.
     *                   2. Capture the pre-reset snapshot.
     *                   3. Reset the model and capture the post-reset snapshot.
     *                   4. Check counters, events, logs and stub.
     * @tc.expected      Every counter and buffer drops to zero and the stub reference is cleared.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('snapshotRegressionResetDoubleConnect', 0, () => {
      const service: ServiceLifecycleModel = runScenario([], true, true, false, false);
      const before: ServiceSnapshot = snapshotOf(service);
      expect(before.state).assertEqual('connected');
      service.reset();
      const after: ServiceSnapshot = snapshotOf(service);
      expect(after.state).assertEqual("idle");
      expect(after.describe()).assertEqual("idle/0/0/0/0");
      expect(after.connects).assertEqual(0);
      expect(after.requests).assertEqual(0);
      expect(after.destroys).assertEqual(0);
      expect(service.events.size()).assertEqual(0);
      expect(service.logs.size()).assertEqual(0);
      expect(service.stub === undefined).assertTrue();
      expect(service.isAlive()).assertTrue();
      logStep("snapshotRegressionResetDoubleConnect", after.describe());
    });

    /**
     * @tc.name          snapshotRegressionResetThreeRequests
     * @tc.desc          Resetting scenario three requests returns the model to the idle golden state.
     * @tc.precondition  The scenario is executed and then reset.
     * @tc.steps         1. Run the configured scenario.
     *                   2. Capture the pre-reset snapshot.
     *                   3. Reset the model and capture the post-reset snapshot.
     *                   4. Check counters, events, logs and stub.
     * @tc.expected      Every counter and buffer drops to zero and the stub reference is cleared.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('snapshotRegressionResetThreeRequests', 0, () => {
      const service: ServiceLifecycleModel = runScenario([1, 2, 3], false, false, false, false);
      const before: ServiceSnapshot = snapshotOf(service);
      expect(before.state).assertEqual('created');
      service.reset();
      const after: ServiceSnapshot = snapshotOf(service);
      expect(after.state).assertEqual("idle");
      expect(after.describe()).assertEqual("idle/0/0/0/0");
      expect(after.connects).assertEqual(0);
      expect(after.requests).assertEqual(0);
      expect(after.destroys).assertEqual(0);
      expect(service.events.size()).assertEqual(0);
      expect(service.logs.size()).assertEqual(0);
      expect(service.stub === undefined).assertTrue();
      expect(service.isAlive()).assertTrue();
      logStep("snapshotRegressionResetThreeRequests", after.describe());
    });

    /**
     * @tc.name          snapshotRegressionResetDestroyOnly
     * @tc.desc          Resetting scenario destroy only returns the model to the idle golden state.
     * @tc.precondition  The scenario is executed and then reset.
     * @tc.steps         1. Run the configured scenario.
     *                   2. Capture the pre-reset snapshot.
     *                   3. Reset the model and capture the post-reset snapshot.
     *                   4. Check counters, events, logs and stub.
     * @tc.expected      Every counter and buffer drops to zero and the stub reference is cleared.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('snapshotRegressionResetDestroyOnly', 0, () => {
      const service: ServiceLifecycleModel = runScenario([], false, false, false, true);
      const before: ServiceSnapshot = snapshotOf(service);
      expect(before.state).assertEqual('destroyed');
      service.reset();
      const after: ServiceSnapshot = snapshotOf(service);
      expect(after.state).assertEqual("idle");
      expect(after.describe()).assertEqual("idle/0/0/0/0");
      expect(after.connects).assertEqual(0);
      expect(after.requests).assertEqual(0);
      expect(after.destroys).assertEqual(0);
      expect(service.events.size()).assertEqual(0);
      expect(service.logs.size()).assertEqual(0);
      expect(service.stub === undefined).assertTrue();
      expect(service.isAlive()).assertTrue();
      logStep("snapshotRegressionResetDestroyOnly", after.describe());
    });

    /**
     * @tc.name          snapshotRegressionResetSevenEight
     * @tc.desc          Resetting scenario seven eight returns the model to the idle golden state.
     * @tc.precondition  The scenario is executed and then reset.
     * @tc.steps         1. Run the configured scenario.
     *                   2. Capture the pre-reset snapshot.
     *                   3. Reset the model and capture the post-reset snapshot.
     *                   4. Check counters, events, logs and stub.
     * @tc.expected      Every counter and buffer drops to zero and the stub reference is cleared.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('snapshotRegressionResetSevenEight', 0, () => {
      const service: ServiceLifecycleModel = runScenario([7, 8], true, false, true, true);
      const before: ServiceSnapshot = snapshotOf(service);
      expect(before.state).assertEqual('destroyed');
      service.reset();
      const after: ServiceSnapshot = snapshotOf(service);
      expect(after.state).assertEqual("idle");
      expect(after.describe()).assertEqual("idle/0/0/0/0");
      expect(after.connects).assertEqual(0);
      expect(after.requests).assertEqual(0);
      expect(after.destroys).assertEqual(0);
      expect(service.events.size()).assertEqual(0);
      expect(service.logs.size()).assertEqual(0);
      expect(service.stub === undefined).assertTrue();
      expect(service.isAlive()).assertTrue();
      logStep("snapshotRegressionResetSevenEight", after.describe());
    });

    /**
     * @tc.name          snapshotRegressionResetConnectDisconnect
     * @tc.desc          Resetting scenario connect disconnect returns the model to the idle golden state.
     * @tc.precondition  The scenario is executed and then reset.
     * @tc.steps         1. Run the configured scenario.
     *                   2. Capture the pre-reset snapshot.
     *                   3. Reset the model and capture the post-reset snapshot.
     *                   4. Check counters, events, logs and stub.
     * @tc.expected      Every counter and buffer drops to zero and the stub reference is cleared.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('snapshotRegressionResetConnectDisconnect', 0, () => {
      const service: ServiceLifecycleModel = runScenario([], true, false, true, false);
      const before: ServiceSnapshot = snapshotOf(service);
      expect(before.state).assertEqual('disconnected');
      service.reset();
      const after: ServiceSnapshot = snapshotOf(service);
      expect(after.state).assertEqual("idle");
      expect(after.describe()).assertEqual("idle/0/0/0/0");
      expect(after.connects).assertEqual(0);
      expect(after.requests).assertEqual(0);
      expect(after.destroys).assertEqual(0);
      expect(service.events.size()).assertEqual(0);
      expect(service.logs.size()).assertEqual(0);
      expect(service.stub === undefined).assertTrue();
      expect(service.isAlive()).assertTrue();
      logStep("snapshotRegressionResetConnectDisconnect", after.describe());
    });

    /**
     * @tc.name          snapshotRegressionStubSingleConnect
     * @tc.desc          Connection handling for scenario single connect issues fresh stub objects.
     * @tc.precondition  The scenario connects at least once.
     * @tc.steps         1. Run the configured scenario with connections.
     *                   2. Read the current stub and its descriptor.
     *                   3. Kill the stub and check the service remains alive.
     *                   4. Connect again and compare the stub identities.
     * @tc.expected      Each connection creates a new stub while the service stays alive.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('snapshotRegressionStubSingleConnect', 0, () => {
      const service: ServiceLifecycleModel = runScenario([], true, false, false, false);
      const first = service.stub;
      expect(first === undefined).assertFalse();
      expect(first?.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(service.connectCount).assertEqual(1);
      expect(first?.alive).assertTrue();
      first?.kill();
      expect(first?.alive).assertFalse();
      expect(service.isAlive()).assertTrue();
      const second = service.onConnect();
      expect(second === first).assertFalse();
      expect(second.descriptor).assertEqual(first?.descriptor);
      expect(second.alive).assertTrue();
      expect(service.connectCount).assertEqual(2);
      logStep("snapshotRegressionStubSingleConnect", String(service.connectCount));
    });

    /**
     * @tc.name          snapshotRegressionStubRequestBeforeConnect
     * @tc.desc          Connection handling for scenario request before connect issues fresh stub objects.
     * @tc.precondition  The scenario connects at least once.
     * @tc.steps         1. Run the configured scenario with connections.
     *                   2. Read the current stub and its descriptor.
     *                   3. Kill the stub and check the service remains alive.
     *                   4. Connect again and compare the stub identities.
     * @tc.expected      Each connection creates a new stub while the service stays alive.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('snapshotRegressionStubRequestBeforeConnect', 0, () => {
      const service: ServiceLifecycleModel = runScenario([1], true, false, false, false);
      const first = service.stub;
      expect(first === undefined).assertFalse();
      expect(first?.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(service.connectCount).assertEqual(1);
      expect(first?.alive).assertTrue();
      first?.kill();
      expect(first?.alive).assertFalse();
      expect(service.isAlive()).assertTrue();
      const second = service.onConnect();
      expect(second === first).assertFalse();
      expect(second.descriptor).assertEqual(first?.descriptor);
      expect(second.alive).assertTrue();
      expect(service.connectCount).assertEqual(2);
      logStep("snapshotRegressionStubRequestBeforeConnect", String(service.connectCount));
    });

    /**
     * @tc.name          snapshotRegressionStubDoubleConnect
     * @tc.desc          Connection handling for scenario double connect issues fresh stub objects.
     * @tc.precondition  The scenario connects at least once.
     * @tc.steps         1. Run the configured scenario with connections.
     *                   2. Read the current stub and its descriptor.
     *                   3. Kill the stub and check the service remains alive.
     *                   4. Connect again and compare the stub identities.
     * @tc.expected      Each connection creates a new stub while the service stays alive.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('snapshotRegressionStubDoubleConnect', 0, () => {
      const service: ServiceLifecycleModel = runScenario([], true, true, false, false);
      const first = service.stub;
      expect(first === undefined).assertFalse();
      expect(first?.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(service.connectCount).assertEqual(2);
      expect(first?.alive).assertTrue();
      first?.kill();
      expect(first?.alive).assertFalse();
      expect(service.isAlive()).assertTrue();
      const second = service.onConnect();
      expect(second === first).assertFalse();
      expect(second.descriptor).assertEqual(first?.descriptor);
      expect(second.alive).assertTrue();
      expect(service.connectCount).assertEqual(3);
      logStep("snapshotRegressionStubDoubleConnect", String(service.connectCount));
    });

    /**
     * @tc.name          snapshotRegressionStubConnectWithRequest
     * @tc.desc          Connection handling for scenario connect with request issues fresh stub objects.
     * @tc.precondition  The scenario connects at least once.
     * @tc.steps         1. Run the configured scenario with connections.
     *                   2. Read the current stub and its descriptor.
     *                   3. Kill the stub and check the service remains alive.
     *                   4. Connect again and compare the stub identities.
     * @tc.expected      Each connection creates a new stub while the service stays alive.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('snapshotRegressionStubConnectWithRequest', 0, () => {
      const service: ServiceLifecycleModel = runScenario([5], true, true, false, false);
      const first = service.stub;
      expect(first === undefined).assertFalse();
      expect(first?.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(service.connectCount).assertEqual(2);
      expect(first?.alive).assertTrue();
      first?.kill();
      expect(first?.alive).assertFalse();
      expect(service.isAlive()).assertTrue();
      const second = service.onConnect();
      expect(second === first).assertFalse();
      expect(second.descriptor).assertEqual(first?.descriptor);
      expect(second.alive).assertTrue();
      expect(service.connectCount).assertEqual(3);
      logStep("snapshotRegressionStubConnectWithRequest", String(service.connectCount));
    });

    /**
     * @tc.name          snapshotRegressionStubFullLifecycle
     * @tc.desc          Connection handling for scenario full lifecycle issues fresh stub objects.
     * @tc.precondition  The scenario connects at least once.
     * @tc.steps         1. Run the configured scenario with connections.
     *                   2. Read the current stub and its descriptor.
     *                   3. Kill the stub and check the service remains alive.
     *                   4. Connect again and compare the stub identities.
     * @tc.expected      Each connection creates a new stub while the service stays alive.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('snapshotRegressionStubFullLifecycle', 0, () => {
      const service: ServiceLifecycleModel = runScenario([1, 2], true, false, false, false);
      const first = service.stub;
      expect(first === undefined).assertFalse();
      expect(first?.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(service.connectCount).assertEqual(1);
      expect(first?.alive).assertTrue();
      first?.kill();
      expect(first?.alive).assertFalse();
      expect(service.isAlive()).assertTrue();
      const second = service.onConnect();
      expect(second === first).assertFalse();
      expect(second.descriptor).assertEqual(first?.descriptor);
      expect(second.alive).assertTrue();
      expect(service.connectCount).assertEqual(2);
      logStep("snapshotRegressionStubFullLifecycle", String(service.connectCount));
    });

    /**
     * @tc.name          snapshotRegressionStubConnectThenDestroy
     * @tc.desc          Connection handling for scenario connect then destroy issues fresh stub objects.
     * @tc.precondition  The scenario connects at least once.
     * @tc.steps         1. Run the configured scenario with connections.
     *                   2. Read the current stub and its descriptor.
     *                   3. Kill the stub and check the service remains alive.
     *                   4. Connect again and compare the stub identities.
     * @tc.expected      Each connection creates a new stub while the service stays alive.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('snapshotRegressionStubConnectThenDestroy', 0, () => {
      const service: ServiceLifecycleModel = runScenario([1], true, false, false, false);
      const first = service.stub;
      expect(first === undefined).assertFalse();
      expect(first?.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(service.connectCount).assertEqual(1);
      expect(first?.alive).assertTrue();
      first?.kill();
      expect(first?.alive).assertFalse();
      expect(service.isAlive()).assertTrue();
      const second = service.onConnect();
      expect(second === first).assertFalse();
      expect(second.descriptor).assertEqual(first?.descriptor);
      expect(second.alive).assertTrue();
      expect(service.connectCount).assertEqual(2);
      logStep("snapshotRegressionStubConnectThenDestroy", String(service.connectCount));
    });

    /**
     * @tc.name          snapshotRegressionOrderConnectOnly
     * @tc.desc          Callback ordering for scenario connect only matches the golden sequence.
     * @tc.precondition  The trace positions are inspected by index.
     * @tc.steps         1. Run the configured scenario.
     *                   2. Locate lifecycle markers inside the trace.
     *                   3. Compare relative positions and endpoints.
     *                   4. Count trace segments.
     * @tc.expected      Create precedes connect, connect precedes request and destroy is last when present.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('snapshotRegressionOrderConnectOnly', 0, () => {
      const service: ServiceLifecycleModel = runScenario([], true, false, false, false);
      const trace: string = service.events.trace();
      expect(trace.startsWith(EVENT_ON_CREATE)).assertTrue();
      expect(trace.split(">").length).assertEqual(2);
      expect(service.events.entries[0]).assertEqual(EVENT_ON_CREATE);
      expect(trace.indexOf("onConnect") > trace.indexOf("onCreate")).assertEqual(true);
      expect(trace.indexOf("onDisconnect") > trace.indexOf("onConnect")).assertEqual(false);
      expect(trace.endsWith(EVENT_ON_DESTROY)).assertEqual(false);
      expect(trace.endsWith('onConnect:IPCStubTest')).assertTrue();
      expect(service.events.last()).assertEqual('onConnect:IPCStubTest');
      logStep("snapshotRegressionOrderConnectOnly", trace);
    });

    /**
     * @tc.name          snapshotRegressionOrderFullLifecycle
     * @tc.desc          Callback ordering for scenario full lifecycle matches the golden sequence.
     * @tc.precondition  The trace positions are inspected by index.
     * @tc.steps         1. Run the configured scenario.
     *                   2. Locate lifecycle markers inside the trace.
     *                   3. Compare relative positions and endpoints.
     *                   4. Count trace segments.
     * @tc.expected      Create precedes connect, connect precedes request and destroy is last when present.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('snapshotRegressionOrderFullLifecycle', 0, () => {
      const service: ServiceLifecycleModel = runScenario([1, 2], true, false, true, true);
      const trace: string = service.events.trace();
      expect(trace.startsWith(EVENT_ON_CREATE)).assertTrue();
      expect(trace.split(">").length).assertEqual(6);
      expect(service.events.entries[0]).assertEqual(EVENT_ON_CREATE);
      expect(trace.indexOf("onConnect") > trace.indexOf("onCreate")).assertEqual(true);
      expect(trace.indexOf("onDisconnect") > trace.indexOf("onConnect")).assertEqual(true);
      expect(trace.endsWith(EVENT_ON_DESTROY)).assertEqual(true);
      expect(trace.endsWith('onDestroy')).assertTrue();
      expect(service.events.last()).assertEqual('onDestroy');
      logStep("snapshotRegressionOrderFullLifecycle", trace);
    });

    /**
     * @tc.name          snapshotRegressionOrderNoConnect
     * @tc.desc          Callback ordering for scenario no connect matches the golden sequence.
     * @tc.precondition  The trace positions are inspected by index.
     * @tc.steps         1. Run the configured scenario.
     *                   2. Locate lifecycle markers inside the trace.
     *                   3. Compare relative positions and endpoints.
     *                   4. Count trace segments.
     * @tc.expected      Create precedes connect, connect precedes request and destroy is last when present.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('snapshotRegressionOrderNoConnect', 0, () => {
      const service: ServiceLifecycleModel = runScenario([1, 2, 3], false, false, false, false);
      const trace: string = service.events.trace();
      expect(trace.startsWith(EVENT_ON_CREATE)).assertTrue();
      expect(trace.split(">").length).assertEqual(4);
      expect(service.events.entries[0]).assertEqual(EVENT_ON_CREATE);
      expect(trace.indexOf("onConnect") > trace.indexOf("onCreate")).assertEqual(false);
      expect(trace.indexOf("onDisconnect") > trace.indexOf("onConnect")).assertEqual(false);
      expect(trace.endsWith(EVENT_ON_DESTROY)).assertEqual(false);
      expect(trace.endsWith('onRequest:3')).assertTrue();
      expect(service.events.last()).assertEqual('onRequest:3');
      logStep("snapshotRegressionOrderNoConnect", trace);
    });

    /**
     * @tc.name          snapshotRegressionOrderConnectDisconnect
     * @tc.desc          Callback ordering for scenario connect disconnect matches the golden sequence.
     * @tc.precondition  The trace positions are inspected by index.
     * @tc.steps         1. Run the configured scenario.
     *                   2. Locate lifecycle markers inside the trace.
     *                   3. Compare relative positions and endpoints.
     *                   4. Count trace segments.
     * @tc.expected      Create precedes connect, connect precedes request and destroy is last when present.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('snapshotRegressionOrderConnectDisconnect', 0, () => {
      const service: ServiceLifecycleModel = runScenario([], true, false, true, false);
      const trace: string = service.events.trace();
      expect(trace.startsWith(EVENT_ON_CREATE)).assertTrue();
      expect(trace.split(">").length).assertEqual(3);
      expect(service.events.entries[0]).assertEqual(EVENT_ON_CREATE);
      expect(trace.indexOf("onConnect") > trace.indexOf("onCreate")).assertEqual(true);
      expect(trace.indexOf("onDisconnect") > trace.indexOf("onConnect")).assertEqual(true);
      expect(trace.endsWith(EVENT_ON_DESTROY)).assertEqual(false);
      expect(trace.endsWith('onDisconnect')).assertTrue();
      expect(service.events.last()).assertEqual('onDisconnect');
      logStep("snapshotRegressionOrderConnectDisconnect", trace);
    });

    /**
     * @tc.name          snapshotRegressionOrderConnectThenDestroy
     * @tc.desc          Callback ordering for scenario connect then destroy matches the golden sequence.
     * @tc.precondition  The trace positions are inspected by index.
     * @tc.steps         1. Run the configured scenario.
     *                   2. Locate lifecycle markers inside the trace.
     *                   3. Compare relative positions and endpoints.
     *                   4. Count trace segments.
     * @tc.expected      Create precedes connect, connect precedes request and destroy is last when present.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('snapshotRegressionOrderConnectThenDestroy', 0, () => {
      const service: ServiceLifecycleModel = runScenario([1], true, false, false, true);
      const trace: string = service.events.trace();
      expect(trace.startsWith(EVENT_ON_CREATE)).assertTrue();
      expect(trace.split(">").length).assertEqual(4);
      expect(service.events.entries[0]).assertEqual(EVENT_ON_CREATE);
      expect(trace.indexOf("onConnect") > trace.indexOf("onCreate")).assertEqual(true);
      expect(trace.indexOf("onDisconnect") > trace.indexOf("onConnect")).assertEqual(false);
      expect(trace.endsWith(EVENT_ON_DESTROY)).assertEqual(true);
      expect(trace.endsWith('onDestroy')).assertTrue();
      expect(service.events.last()).assertEqual('onDestroy');
      logStep("snapshotRegressionOrderConnectThenDestroy", trace);
    });

    /**
     * @tc.name          snapshotRegressionOrderDoubleConnect
     * @tc.desc          Callback ordering for scenario double connect matches the golden sequence.
     * @tc.precondition  The trace positions are inspected by index.
     * @tc.steps         1. Run the configured scenario.
     *                   2. Locate lifecycle markers inside the trace.
     *                   3. Compare relative positions and endpoints.
     *                   4. Count trace segments.
     * @tc.expected      Create precedes connect, connect precedes request and destroy is last when present.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('snapshotRegressionOrderDoubleConnect', 0, () => {
      const service: ServiceLifecycleModel = runScenario([], true, true, false, false);
      const trace: string = service.events.trace();
      expect(trace.startsWith(EVENT_ON_CREATE)).assertTrue();
      expect(trace.split(">").length).assertEqual(3);
      expect(service.events.entries[0]).assertEqual(EVENT_ON_CREATE);
      expect(trace.indexOf("onConnect") > trace.indexOf("onCreate")).assertEqual(true);
      expect(trace.indexOf("onDisconnect") > trace.indexOf("onConnect")).assertEqual(false);
      expect(trace.endsWith(EVENT_ON_DESTROY)).assertEqual(false);
      expect(trace.endsWith('onConnect:IPCStubTest')).assertTrue();
      expect(service.events.last()).assertEqual('onConnect:IPCStubTest');
      logStep("snapshotRegressionOrderDoubleConnect", trace);
    });

    /**
     * @tc.name          snapshotRegressionLogsConnectOnly
     * @tc.desc          Lifecycle logging for scenario connect only stays one line per callback.
     * @tc.precondition  Each lifecycle callback appends one info line.
     * @tc.steps         1. Run the configured scenario.
     *                   2. Measure the log buffer size.
     *                   3. Count info levels and check fragments.
     *                   4. Compare the log size with the event count.
     * @tc.expected      The log holds one info line per event and never contains an error level.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('snapshotRegressionLogsConnectOnly', 0, () => {
      const service: ServiceLifecycleModel = runScenario([], true, false, false, false);
      expect(service.logs.size()).assertEqual(2);
      expect(service.logs.countLevel(LEVEL_INFO)).assertEqual(2);
      expect(service.logs.countLevel(LEVEL_ERROR)).assertEqual(0);
      expect(service.logs.contains("onCreate")).assertTrue();
      expect(service.logs.contains("onConnect")).assertEqual(true);
      expect(service.logs.contains("onDestroy")).assertEqual(false);
      expect(service.logs.size()).assertEqual(service.events.size());
      expect(service.logs.trace().indexOf("|") >= 0).assertEqual(true);
      expect(service.logs.lines[0].startsWith(LEVEL_INFO)).assertTrue();
      logStep("snapshotRegressionLogsConnectOnly", service.logs.trace());
    });

    /**
     * @tc.name          snapshotRegressionLogsFullLifecycle
     * @tc.desc          Lifecycle logging for scenario full lifecycle stays one line per callback.
     * @tc.precondition  Each lifecycle callback appends one info line.
     * @tc.steps         1. Run the configured scenario.
     *                   2. Measure the log buffer size.
     *                   3. Count info levels and check fragments.
     *                   4. Compare the log size with the event count.
     * @tc.expected      The log holds one info line per event and never contains an error level.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('snapshotRegressionLogsFullLifecycle', 0, () => {
      const service: ServiceLifecycleModel = runScenario([1, 2], true, false, true, true);
      expect(service.logs.size()).assertEqual(6);
      expect(service.logs.countLevel(LEVEL_INFO)).assertEqual(6);
      expect(service.logs.countLevel(LEVEL_ERROR)).assertEqual(0);
      expect(service.logs.contains("onCreate")).assertTrue();
      expect(service.logs.contains("onConnect")).assertEqual(true);
      expect(service.logs.contains("onDestroy")).assertEqual(true);
      expect(service.logs.size()).assertEqual(service.events.size());
      expect(service.logs.trace().indexOf("|") >= 0).assertEqual(true);
      expect(service.logs.lines[0].startsWith(LEVEL_INFO)).assertTrue();
      logStep("snapshotRegressionLogsFullLifecycle", service.logs.trace());
    });

    /**
     * @tc.name          snapshotRegressionLogsThreeRequests
     * @tc.desc          Lifecycle logging for scenario three requests stays one line per callback.
     * @tc.precondition  Each lifecycle callback appends one info line.
     * @tc.steps         1. Run the configured scenario.
     *                   2. Measure the log buffer size.
     *                   3. Count info levels and check fragments.
     *                   4. Compare the log size with the event count.
     * @tc.expected      The log holds one info line per event and never contains an error level.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('snapshotRegressionLogsThreeRequests', 0, () => {
      const service: ServiceLifecycleModel = runScenario([1, 2, 3], false, false, false, false);
      expect(service.logs.size()).assertEqual(4);
      expect(service.logs.countLevel(LEVEL_INFO)).assertEqual(4);
      expect(service.logs.countLevel(LEVEL_ERROR)).assertEqual(0);
      expect(service.logs.contains("onCreate")).assertTrue();
      expect(service.logs.contains("onConnect")).assertEqual(false);
      expect(service.logs.contains("onDestroy")).assertEqual(false);
      expect(service.logs.size()).assertEqual(service.events.size());
      expect(service.logs.trace().indexOf("|") >= 0).assertEqual(true);
      expect(service.logs.lines[0].startsWith(LEVEL_INFO)).assertTrue();
      logStep("snapshotRegressionLogsThreeRequests", service.logs.trace());
    });

    /**
     * @tc.name          snapshotRegressionLogsDestroyOnly
     * @tc.desc          Lifecycle logging for scenario destroy only stays one line per callback.
     * @tc.precondition  Each lifecycle callback appends one info line.
     * @tc.steps         1. Run the configured scenario.
     *                   2. Measure the log buffer size.
     *                   3. Count info levels and check fragments.
     *                   4. Compare the log size with the event count.
     * @tc.expected      The log holds one info line per event and never contains an error level.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('snapshotRegressionLogsDestroyOnly', 0, () => {
      const service: ServiceLifecycleModel = runScenario([], false, false, false, true);
      expect(service.logs.size()).assertEqual(2);
      expect(service.logs.countLevel(LEVEL_INFO)).assertEqual(2);
      expect(service.logs.countLevel(LEVEL_ERROR)).assertEqual(0);
      expect(service.logs.contains("onCreate")).assertTrue();
      expect(service.logs.contains("onConnect")).assertEqual(false);
      expect(service.logs.contains("onDestroy")).assertEqual(true);
      expect(service.logs.size()).assertEqual(service.events.size());
      expect(service.logs.trace().indexOf("|") >= 0).assertEqual(true);
      expect(service.logs.lines[0].startsWith(LEVEL_INFO)).assertTrue();
      logStep("snapshotRegressionLogsDestroyOnly", service.logs.trace());
    });

    /**
     * @tc.name          snapshotRegressionLogsDoubleConnect
     * @tc.desc          Lifecycle logging for scenario double connect stays one line per callback.
     * @tc.precondition  Each lifecycle callback appends one info line.
     * @tc.steps         1. Run the configured scenario.
     *                   2. Measure the log buffer size.
     *                   3. Count info levels and check fragments.
     *                   4. Compare the log size with the event count.
     * @tc.expected      The log holds one info line per event and never contains an error level.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('snapshotRegressionLogsDoubleConnect', 0, () => {
      const service: ServiceLifecycleModel = runScenario([], true, true, false, false);
      expect(service.logs.size()).assertEqual(3);
      expect(service.logs.countLevel(LEVEL_INFO)).assertEqual(3);
      expect(service.logs.countLevel(LEVEL_ERROR)).assertEqual(0);
      expect(service.logs.contains("onCreate")).assertTrue();
      expect(service.logs.contains("onConnect")).assertEqual(true);
      expect(service.logs.contains("onDestroy")).assertEqual(false);
      expect(service.logs.size()).assertEqual(service.events.size());
      expect(service.logs.trace().indexOf("|") >= 0).assertEqual(true);
      expect(service.logs.lines[0].startsWith(LEVEL_INFO)).assertTrue();
      logStep("snapshotRegressionLogsDoubleConnect", service.logs.trace());
    });

    /**
     * @tc.name          snapshotRegressionLogsConnectDisconnect
     * @tc.desc          Lifecycle logging for scenario connect disconnect stays one line per callback.
     * @tc.precondition  Each lifecycle callback appends one info line.
     * @tc.steps         1. Run the configured scenario.
     *                   2. Measure the log buffer size.
     *                   3. Count info levels and check fragments.
     *                   4. Compare the log size with the event count.
     * @tc.expected      The log holds one info line per event and never contains an error level.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('snapshotRegressionLogsConnectDisconnect', 0, () => {
      const service: ServiceLifecycleModel = runScenario([], true, false, true, false);
      expect(service.logs.size()).assertEqual(3);
      expect(service.logs.countLevel(LEVEL_INFO)).assertEqual(3);
      expect(service.logs.countLevel(LEVEL_ERROR)).assertEqual(0);
      expect(service.logs.contains("onCreate")).assertTrue();
      expect(service.logs.contains("onConnect")).assertEqual(true);
      expect(service.logs.contains("onDestroy")).assertEqual(false);
      expect(service.logs.size()).assertEqual(service.events.size());
      expect(service.logs.trace().indexOf("|") >= 0).assertEqual(true);
      expect(service.logs.lines[0].startsWith(LEVEL_INFO)).assertTrue();
      logStep("snapshotRegressionLogsConnectDisconnect", service.logs.trace());
    });

    /**
     * @tc.name          snapshotRegressionReconnectWithoutRequests
     * @tc.desc          Reconnect scenario reconnect without requests replaces the stub across disconnect boundaries.
     * @tc.precondition  The model connects, disconnects and connects again with requests in between.
     * @tc.steps         1. Create the service and connect once.
     *                   2. Replay request ids and disconnect.
     *                   3. Connect a second time and read the new stub.
     *                   4. Compare counts and the golden trace.
     * @tc.expected      Two connections are counted, the stub identity changes, and the trace matches.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('snapshotRegressionReconnectWithoutRequests', 0, () => {
      const service: ServiceLifecycleModel = new ServiceLifecycleModel();
      service.onCreate();
      const first = service.onConnect();
      const ids: number[] = [];
      for (let index = 0; index < ids.length; index++) {
        service.onRequest(ids[index]);
      }
      service.onDisconnect();
      const second = service.onConnect();
      expect(first === second).assertFalse();
      expect(service.connectCount).assertEqual(2);
      expect(service.disconnectCount).assertEqual(1);
      expect(service.state).assertEqual("connected");
      expect(service.stub === second).assertTrue();
      expect(service.events.trace()).assertEqual('onCreate>onConnect:IPCStubTest>onDisconnect>onConnect:IPCStubTest');
      expect(second.descriptor).assertEqual(first.descriptor);
      logStep("snapshotRegressionReconnectWithoutRequests", service.events.trace());
    });

    /**
     * @tc.name          snapshotRegressionReconnectWithOneRequest
     * @tc.desc          Reconnect scenario reconnect with one request replaces the stub across disconnect boundaries.
     * @tc.precondition  The model connects, disconnects and connects again with requests in between.
     * @tc.steps         1. Create the service and connect once.
     *                   2. Replay request ids and disconnect.
     *                   3. Connect a second time and read the new stub.
     *                   4. Compare counts and the golden trace.
     * @tc.expected      Two connections are counted, the stub identity changes, and the trace matches.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('snapshotRegressionReconnectWithOneRequest', 0, () => {
      const service: ServiceLifecycleModel = new ServiceLifecycleModel();
      service.onCreate();
      const first = service.onConnect();
      const ids: number[] = [1];
      for (let index = 0; index < ids.length; index++) {
        service.onRequest(ids[index]);
      }
      service.onDisconnect();
      const second = service.onConnect();
      expect(first === second).assertFalse();
      expect(service.connectCount).assertEqual(2);
      expect(service.disconnectCount).assertEqual(1);
      expect(service.state).assertEqual("connected");
      expect(service.stub === second).assertTrue();
      expect(service.events.trace()).assertEqual('onCreate>onConnect:IPCStubTest>onRequest:1>onDisconnect>onConnect:IPCStubTest');
      expect(second.descriptor).assertEqual(first.descriptor);
      logStep("snapshotRegressionReconnectWithOneRequest", service.events.trace());
    });

    /**
     * @tc.name          snapshotRegressionReconnectWithTwoRequests
     * @tc.desc          Reconnect scenario reconnect with two requests replaces the stub across disconnect boundaries.
     * @tc.precondition  The model connects, disconnects and connects again with requests in between.
     * @tc.steps         1. Create the service and connect once.
     *                   2. Replay request ids and disconnect.
     *                   3. Connect a second time and read the new stub.
     *                   4. Compare counts and the golden trace.
     * @tc.expected      Two connections are counted, the stub identity changes, and the trace matches.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('snapshotRegressionReconnectWithTwoRequests', 0, () => {
      const service: ServiceLifecycleModel = new ServiceLifecycleModel();
      service.onCreate();
      const first = service.onConnect();
      const ids: number[] = [1, 2];
      for (let index = 0; index < ids.length; index++) {
        service.onRequest(ids[index]);
      }
      service.onDisconnect();
      const second = service.onConnect();
      expect(first === second).assertFalse();
      expect(service.connectCount).assertEqual(2);
      expect(service.disconnectCount).assertEqual(1);
      expect(service.state).assertEqual("connected");
      expect(service.stub === second).assertTrue();
      expect(service.events.trace()).assertEqual('onCreate>onConnect:IPCStubTest>onRequest:1>onRequest:2>onDisconnect>onConnect:IPCStubTest');
      expect(second.descriptor).assertEqual(first.descriptor);
      logStep("snapshotRegressionReconnectWithTwoRequests", service.events.trace());
    });

    /**
     * @tc.name          snapshotRegressionReconnectWithThreeRequests
     * @tc.desc          Reconnect scenario reconnect with three requests replaces the stub across disconnect boundaries.
     * @tc.precondition  The model connects, disconnects and connects again with requests in between.
     * @tc.steps         1. Create the service and connect once.
     *                   2. Replay request ids and disconnect.
     *                   3. Connect a second time and read the new stub.
     *                   4. Compare counts and the golden trace.
     * @tc.expected      Two connections are counted, the stub identity changes, and the trace matches.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('snapshotRegressionReconnectWithThreeRequests', 0, () => {
      const service: ServiceLifecycleModel = new ServiceLifecycleModel();
      service.onCreate();
      const first = service.onConnect();
      const ids: number[] = [1, 2, 3];
      for (let index = 0; index < ids.length; index++) {
        service.onRequest(ids[index]);
      }
      service.onDisconnect();
      const second = service.onConnect();
      expect(first === second).assertFalse();
      expect(service.connectCount).assertEqual(2);
      expect(service.disconnectCount).assertEqual(1);
      expect(service.state).assertEqual("connected");
      expect(service.stub === second).assertTrue();
      expect(service.events.trace()).assertEqual('onCreate>onConnect:IPCStubTest>onRequest:1>onRequest:2>onRequest:3>onDisconnect>onConnect:IPCStubTest');
      expect(second.descriptor).assertEqual(first.descriptor);
      logStep("snapshotRegressionReconnectWithThreeRequests", service.events.trace());
    });

  });
}
