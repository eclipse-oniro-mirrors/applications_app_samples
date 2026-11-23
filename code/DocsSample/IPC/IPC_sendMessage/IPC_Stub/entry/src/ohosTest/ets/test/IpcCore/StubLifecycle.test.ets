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
  STUB_DESCRIPTOR,
  REQUEST_CODE,
  REQUEST_PAYLOAD,
  REPLY_PAYLOAD,
  EVENT_ON_CREATE,
  EVENT_ON_REQUEST,
  EVENT_ON_CONNECT,
  EVENT_ON_DISCONNECT,
  EVENT_ON_DESTROY,
  LEVEL_INFO,
  LEVEL_WARN,
  LEVEL_ERROR,
  ServiceLifecycleModel,
  ServiceSnapshot,
  ServiceEventRecorder,
  LogBuffer,
  InProcessClient,
  StubMetrics,
  joined,
  countOf,
  uniqueStrings,
  textFingerprint
} from '../Shared/SharedDriver';

export default function stubLifecycleTest(): void {
  describe('StubLifecycle', () => {
    beforeAll(() => {
      logSuite('StubLifecycle', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('StubLifecycle', 'end');
    });

    /**
     * @tc.name   stubLifecycleInitialStateIsIdle
     * @tc.desc   A new lifecycle model starts in the idle state.
     * @tc.precondition  No lifecycle method has been called.
     * @tc.steps         1. Construct a lifecycle model.
     *                   2. Read the state and counters.
     *                   3. Read the stub reference.
     * @tc.expected      The model is idle with zero counters and no stub.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stubLifecycleInitialStateIsIdle', 0, () => {
      const service = new ServiceLifecycleModel();
      expect(service.state).assertEqual('idle');
      expect(service.isAlive()).assertTrue();
      expect(service.connectCount).assertEqual(0);
      expect(service.disconnectCount).assertEqual(0);
      expect(service.requestCount).assertEqual(0);
      expect(service.destroyCount).assertEqual(0);
      expect(service.stub).assertUndefined();
      expect(service.events.size()).assertEqual(0);
    });

    /**
     * @tc.name   stubLifecycleOnCreateSetsCreatedState
     * @tc.desc   onCreate moves the service into the created state.
     * @tc.precondition  A fresh lifecycle model.
     * @tc.steps         1. Call onCreate.
     *                   2. Read the state.
     *                   3. Confirm the model is still alive.
     * @tc.expected      The state is created and isAlive stays true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stubLifecycleOnCreateSetsCreatedState', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      expect(service.state).assertEqual('created');
      expect(service.isAlive()).assertTrue();
      expect(service.destroyCount).assertEqual(0);
      expect(service.connectCount).assertEqual(0);
      expect(service.events.size()).assertEqual(1);
      expect(service.events.last()).assertEqual(EVENT_ON_CREATE);
    });

    /**
     * @tc.name   stubLifecycleOnCreateRecordsEvent
     * @tc.desc   onCreate appends exactly one onCreate event.
     * @tc.precondition  A fresh lifecycle model.
     * @tc.steps         1. Call onCreate once.
     *                   2. Count onCreate events.
     *                   3. Read the full event trace.
     * @tc.expected      One onCreate event and an 'onCreate' trace.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stubLifecycleOnCreateRecordsEvent', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      expect(service.events.countOf(EVENT_ON_CREATE)).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(0);
      expect(service.events.trace()).assertEqual('onCreate');
      expect(service.events.size()).assertEqual(1);
      expect(service.events.entries[0]).assertEqual(EVENT_ON_CREATE);
      expect(textFingerprint(service.events.trace())).assertLarger(0);
    });

    /**
     * @tc.name   stubLifecycleOnCreateWritesLog
     * @tc.desc   onCreate writes one info line to the service log buffer.
     * @tc.precondition  A fresh lifecycle model.
     * @tc.steps         1. Call onCreate.
     *                   2. Read the log size and level counts.
     *                   3. Search the log for onCreate.
     * @tc.expected      The log holds one info line mentioning onCreate.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stubLifecycleOnCreateWritesLog', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      expect(service.logs.size()).assertEqual(1);
      expect(service.logs.countLevel(LEVEL_INFO)).assertEqual(1);
      expect(service.logs.countLevel(LEVEL_WARN)).assertEqual(0);
      expect(service.logs.countLevel(LEVEL_ERROR)).assertEqual(0);
      expect(service.logs.contains('onCreate')).assertTrue();
      expect(service.logs.lines[0]).assertEqual('INFO onCreate');
    });

    /**
     * @tc.name   stubLifecycleOnRequestIncrementsCounter
     * @tc.desc   Each onRequest call increments the request counter once.
     * @tc.precondition  A created service.
     * @tc.steps         1. Call onCreate.
     *                   2. Call onRequest three times.
     *                   3. Read the request counter.
     * @tc.expected      The request counter equals three.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stubLifecycleOnRequestIncrementsCounter', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onRequest(1);
      service.onRequest(2);
      service.onRequest(3);
      expect(service.requestCount).assertEqual(3);
      expect(service.events.countOf(EVENT_ON_REQUEST)).assertEqual(3);
      expect(service.logs.countLevel(LEVEL_INFO)).assertEqual(4);
      expect(service.state).assertEqual('created');
      expect(service.events.size()).assertEqual(4);
    });

    /**
     * @tc.name   stubLifecycleOnRequestRecordsStartIdDetail
     * @tc.desc   onRequest records the start id as event detail.
     * @tc.precondition  A created service.
     * @tc.steps         1. Call onRequest with start id 7.
     *                   2. Read the last event entry.
     *                   3. Confirm the detail segment.
     * @tc.expected      The event reads 'onRequest:7'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLifecycleOnRequestRecordsStartIdDetail', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onRequest(7);
      const entry = service.events.last();
      expect(entry).assertEqual('onRequest:7');
      expect(entry.indexOf(':')).assertEqual(9);
      expect(entry.endsWith('7')).assertTrue();
      expect(service.events.countOf(EVENT_ON_REQUEST)).assertEqual(1);
      expect(service.logs.contains('onRequest 7')).assertTrue();
      expect(service.requestCount).assertEqual(1);
    });

    /**
     * @tc.name   stubLifecycleOnRequestKeepsState
     * @tc.desc   onRequest does not change the lifecycle state.
     * @tc.precondition  A created service.
     * @tc.steps         1. Call onCreate.
     *                   2. Call onRequest with the default start id.
     *                   3. Compare the state before and after.
     * @tc.expected      The state remains created.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLifecycleOnRequestKeepsState', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const before = service.state;
      service.onRequest();
      expect(service.state).assertEqual(before);
      expect(service.state).assertEqual('created');
      expect(service.isAlive()).assertTrue();
      expect(service.events.last()).assertEqual('onRequest:1');
      expect(service.connectCount).assertEqual(0);
      expect(service.disconnectCount).assertEqual(0);
    });

    /**
     * @tc.name   stubLifecycleOnConnectReturnsStub
     * @tc.desc   onConnect returns a stub instance, mirroring production.
     * @tc.precondition  A created service.
     * @tc.steps         1. Call onCreate.
     *                   2. Call onConnect and capture the return value.
     *                   3. Inspect the returned object.
     * @tc.expected      A non-null stub with a true alive flag.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stubLifecycleOnConnectReturnsStub', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const stub = service.onConnect();
      expect(stub.alive).assertTrue();
      expect(stub.requestCount()).assertEqual(0);
      expect(stub.replyText).assertEqual(REPLY_PAYLOAD);
      expect(service.stub?.alive).assertTrue();
      expect(service.connectCount).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(1);
    });

    /**
     * @tc.name   stubLifecycleOnConnectDescriptorIsProductionLiteral
     * @tc.desc   The stub returned by onConnect uses 'IPCStubTest'.
     * @tc.precondition  A created service.
     * @tc.steps         1. Call onConnect.
     *                   2. Read the stub descriptor.
     *                   3. Compare with the production literal.
     * @tc.expected      The descriptor is IPCStubTest.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stubLifecycleOnConnectDescriptorIsProductionLiteral', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const stub = service.onConnect();
      expect(stub.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(stub.descriptor).assertEqual('IPCStubTest');
      expect(stub.descriptor.length).assertEqual(11);
      expect(stub.descriptor.startsWith('IPC')).assertTrue();
      expect(service.stub?.descriptor).assertEqual(STUB_DESCRIPTOR);
    });

    /**
     * @tc.name   stubLifecycleOnConnectSetsConnectedState
     * @tc.desc   onConnect moves the service into the connected state.
     * @tc.precondition  A created service.
     * @tc.steps         1. Call onCreate.
     *                   2. Call onConnect.
     *                   3. Read the state and alive flag.
     * @tc.expected      The state is connected and the service is alive.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stubLifecycleOnConnectSetsConnectedState', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onConnect();
      expect(service.state).assertEqual('connected');
      expect(service.isAlive()).assertTrue();
      expect(service.state === 'created').assertFalse();
      expect(service.events.last().startsWith(EVENT_ON_CONNECT)).assertTrue();
      expect(service.logs.contains('onConnect')).assertTrue();
      expect(service.destroyCount).assertEqual(0);
    });

    /**
     * @tc.name   stubLifecycleOnConnectEventCarriesDescriptor
     * @tc.desc   The connect event detail is the returned stub descriptor.
     * @tc.precondition  A created service.
     * @tc.steps         1. Call onConnect.
     *                   2. Read the last event entry.
     *                   3. Split the entry on the detail separator.
     * @tc.expected      The detail segment equals the descriptor.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLifecycleOnConnectEventCarriesDescriptor', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onConnect();
      const entry = service.events.last();
      const parts = entry.split(':');
      expect(entry).assertEqual('onConnect:IPCStubTest');
      expect(parts.length).assertEqual(2);
      expect(parts[0]).assertEqual(EVENT_ON_CONNECT);
      expect(parts[1]).assertEqual(STUB_DESCRIPTOR);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(1);
      expect(service.events.trace()).assertEqual('onCreate>onConnect:IPCStubTest');
    });

    /**
     * @tc.name   stubLifecycleConnectCountIncrements
     * @tc.desc   connectCount grows by one for each onConnect call.
     * @tc.precondition  A created service.
     * @tc.steps         1. Call onConnect twice.
     *                   2. Read connectCount.
     *                   3. Count connect events.
     * @tc.expected      Two connects are recorded.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLifecycleConnectCountIncrements', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const first = service.onConnect();
      const second = service.onConnect();
      expect(service.connectCount).assertEqual(2);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(2);
      expect(service.state).assertEqual('connected');
      expect(first.descriptor).assertEqual(second.descriptor);
      expect(service.logs.countLevel(LEVEL_INFO)).assertEqual(3);
      expect(service.events.size()).assertEqual(3);
    });

    /**
     * @tc.name   stubLifecycleOnDisconnectSetsDisconnectedState
     * @tc.desc   onDisconnect moves the service into the disconnected state.
     * @tc.precondition  A connected service.
     * @tc.steps         1. Create and connect.
     *                   2. Call onDisconnect.
     *                   3. Read the state and counters.
     * @tc.expected      The state is disconnected and the service is alive.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stubLifecycleOnDisconnectSetsDisconnectedState', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onConnect();
      service.onDisconnect();
      expect(service.state).assertEqual('disconnected');
      expect(service.disconnectCount).assertEqual(1);
      expect(service.isAlive()).assertTrue();
      expect(service.events.last()).assertEqual(EVENT_ON_DISCONNECT);
      expect(service.connectCount).assertEqual(1);
      expect(service.destroyCount).assertEqual(0);
    });

    /**
     * @tc.name   stubLifecycleOnDisconnectCounter
     * @tc.desc   disconnectCount tracks repeated disconnects.
     * @tc.precondition  A connected service.
     * @tc.steps         1. Call onConnect then onDisconnect twice.
     *                   2. Read disconnectCount.
     *                   3. Count disconnect events.
     * @tc.expected      Two disconnects are recorded.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLifecycleOnDisconnectCounter', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onConnect();
      service.onDisconnect();
      service.onDisconnect();
      expect(service.disconnectCount).assertEqual(2);
      expect(service.events.countOf(EVENT_ON_DISCONNECT)).assertEqual(2);
      expect(service.state).assertEqual('disconnected');
      expect(service.connectCount).assertEqual(1);
      expect(service.logs.contains('onDisconnect')).assertTrue();
      expect(service.events.trace().split('>').length).assertEqual(4);
    });

    /**
     * @tc.name   stubLifecycleOnDestroySetsDestroyedState
     * @tc.desc   onDestroy moves the service into the destroyed state.
     * @tc.precondition  A connected service.
     * @tc.steps         1. Create, connect and destroy.
     *                   2. Read the state.
     *                   3. Confirm isAlive is false.
     * @tc.expected      The state is destroyed and the service is not alive.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stubLifecycleOnDestroySetsDestroyedState', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onConnect();
      service.onDestroy();
      expect(service.state).assertEqual('destroyed');
      expect(service.state === 'destroyed').assertTrue();
      expect(service.isAlive()).assertFalse();
      expect(service.destroyCount).assertEqual(1);
      expect(service.events.last()).assertEqual(EVENT_ON_DESTROY);
      expect(service.stub?.alive).assertTrue();
    });

    /**
     * @tc.name   stubLifecycleDestroyCounterIncrements
     * @tc.desc   destroyCount grows for each onDestroy call.
     * @tc.precondition  A created service.
     * @tc.steps         1. Call onDestroy twice.
     *                   2. Read destroyCount.
     *                   3. Count destroy events.
     * @tc.expected      Two destroy calls are recorded.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLifecycleDestroyCounterIncrements', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onDestroy();
      service.onDestroy();
      expect(service.destroyCount).assertEqual(2);
      expect(service.events.countOf(EVENT_ON_DESTROY)).assertEqual(2);
      expect(service.state).assertEqual('destroyed');
      expect(service.isAlive()).assertFalse();
      expect(service.logs.contains('onDestroy')).assertTrue();
      expect(service.events.last()).assertEqual(EVENT_ON_DESTROY);
    });

    /**
     * @tc.name   stubLifecycleIsAliveBeforeDestroy
     * @tc.desc   The service reports alive for every pre-destroy state.
     * @tc.precondition  A fresh lifecycle model.
     * @tc.steps         1. Check isAlive while idle.
     *                   2. Check after create, connect and disconnect.
     *                   3. Check after destroy.
     * @tc.expected      Alive holds true until destroy and false afterwards.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stubLifecycleIsAliveBeforeDestroy', 0, () => {
      const service = new ServiceLifecycleModel();
      expect(service.isAlive()).assertTrue();
      service.onCreate();
      expect(service.isAlive()).assertTrue();
      service.onConnect();
      expect(service.isAlive()).assertTrue();
      service.onDisconnect();
      expect(service.isAlive()).assertTrue();
      service.onDestroy();
      expect(service.isAlive()).assertFalse();
    });

    /**
     * @tc.name   stubLifecycleFullCycleEventOrder
     * @tc.desc   A complete lifecycle records events in production order.
     * @tc.precondition  A fresh lifecycle model.
     * @tc.steps         1. Run create, request, connect, disconnect, destroy.
     *                   2. Read the event trace.
     *                   3. Split the trace into ordered parts.
     * @tc.expected      The trace follows the documented lifecycle order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stubLifecycleFullCycleEventOrder', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onRequest(3);
      service.onConnect();
      service.onDisconnect();
      service.onDestroy();
      const parts = service.events.trace().split('>');
      expect(parts.length).assertEqual(5);
      expect(parts[0]).assertEqual(EVENT_ON_CREATE);
      expect(parts[1]).assertEqual('onRequest:3');
      expect(parts[2]).assertEqual('onConnect:IPCStubTest');
      expect(parts[3]).assertEqual(EVENT_ON_DISCONNECT);
      expect(parts[4]).assertEqual(EVENT_ON_DESTROY);
      expect(service.events.size()).assertEqual(5);
    });

    /**
     * @tc.name   stubLifecycleFullCycleCounters
     * @tc.desc   Every lifecycle counter holds its expected full-cycle value.
     * @tc.precondition  A fresh lifecycle model.
     * @tc.steps         1. Run a complete lifecycle twice for requests.
     *                   2. Read all counters.
     *                   3. Compare with the expected values.
     * @tc.expected      Requests are two and the other counters are one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLifecycleFullCycleCounters', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onRequest(1);
      service.onRequest(2);
      service.onConnect();
      service.onDisconnect();
      service.onDestroy();
      expect(service.requestCount).assertEqual(2);
      expect(service.connectCount).assertEqual(1);
      expect(service.disconnectCount).assertEqual(1);
      expect(service.destroyCount).assertEqual(1);
      expect(service.events.size()).assertEqual(6);
      expect(service.state).assertEqual('destroyed');
    });

    /**
     * @tc.name   stubLifecycleRepeatedStartIdsPreserved
     * @tc.desc   Consecutive onRequest calls keep each start id in order.
     * @tc.precondition  A created service.
     * @tc.steps         1. Call onRequest with ids 4, 5 and 6.
     *                   2. Extract the request events.
     *                   3. Compare the ordered details.
     * @tc.expected      The details are 'onRequest:4', 'onRequest:5', 'onRequest:6'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLifecycleRepeatedStartIdsPreserved', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onRequest(4);
      service.onRequest(5);
      service.onRequest(6);
      const requests: string[] = [];
      for (let index = 0; index < service.events.entries.length; index++) {
        const entry = service.events.entries[index];
        if (entry.startsWith(EVENT_ON_REQUEST)) {
          requests.push(entry);
        }
      }
      expect(requests.length).assertEqual(3);
      expect(joined(requests, ',')).assertEqual('onRequest:4,onRequest:5,onRequest:6');
      expect(requests[0]).assertEqual('onRequest:4');
      expect(requests[2]).assertEqual('onRequest:6');
      expect(service.requestCount).assertEqual(3);
      expect(uniqueStrings(requests).length).assertEqual(3);
    });

    /**
     * @tc.name   stubLifecycleRequestAfterDestroyStillRecorded
     * @tc.desc   The model records a request even after the destroyed state.
     * @tc.precondition  A destroyed service.
     * @tc.steps         1. Destroy the service.
     *                   2. Call onRequest with start id 9.
     *                   3. Inspect counters and events.
     * @tc.expected      The request is recorded while the state stays destroyed.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('stubLifecycleRequestAfterDestroyStillRecorded', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onDestroy();
      service.onRequest(9);
      expect(service.requestCount).assertEqual(1);
      expect(service.events.last()).assertEqual('onRequest:9');
      expect(service.state).assertEqual('destroyed');
      expect(service.isAlive()).assertFalse();
      expect(service.destroyCount).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_REQUEST)).assertEqual(1);
    });

    /**
     * @tc.name   stubLifecycleReconnectCreatesNewInstance
     * @tc.desc   A second onConnect replaces the stub reference with a new object.
     * @tc.precondition  A connected service.
     * @tc.steps         1. Capture the first stub.
     *                   2. Call onConnect again and capture the second stub.
     *                   3. Compare identity and descriptor.
     * @tc.expected      The descriptors match while the objects differ.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLifecycleReconnectCreatesNewInstance', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const first = service.onConnect();
      first.rejectCodes.push(REQUEST_CODE);
      const second = service.onConnect();
      expect(first.descriptor).assertEqual(second.descriptor);
      expect(second.rejectCodes.length).assertEqual(0);
      expect(first.rejectCodes.length).assertEqual(1);
      expect(service.stub).assertEqual(second);
      expect(service.connectCount).assertEqual(2);
      expect(second.requestCount()).assertEqual(0);
    });

    /**
     * @tc.name   stubLifecycleStubUsableAfterDisconnect
     * @tc.desc   The stub returned by onConnect still answers after disconnect.
     * @tc.precondition  A connected service whose stub was captured.
     * @tc.steps         1. Connect and capture the stub.
     *                   2. Disconnect, then send code 1 through the stub.
     *                   3. Inspect the result and service state.
     * @tc.expected      The request succeeds while the service is disconnected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('stubLifecycleStubUsableAfterDisconnect', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const stub = service.onConnect();
      service.onDisconnect();
      const client = new InProcessClient(stub);
      const result = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(service.state).assertEqual('disconnected');
      expect(result.handled).assertTrue();
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(stub.requestCount()).assertEqual(1);
      expect(stub.alive).assertTrue();
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(1);
    });

    /**
     * @tc.name   stubLifecycleStubReferenceKeptAfterDestroy
     * @tc.desc   onDestroy does not clear the stub reference in the model.
     * @tc.precondition  A connected service.
     * @tc.steps         1. Connect and capture the stub.
     *                   2. Destroy the service.
     *                   3. Compare the stored and captured references.
     * @tc.expected      The stored reference survives destroy.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('stubLifecycleStubReferenceKeptAfterDestroy', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const stub = service.onConnect();
      service.onDestroy();
      expect(service.stub).assertEqual(stub);
      expect(service.stub?.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(service.stub?.alive).assertTrue();
      expect(service.isAlive()).assertFalse();
      expect(service.connectCount).assertEqual(1);
      expect(service.destroyCount).assertEqual(1);
    });

    /**
     * @tc.name   stubLifecycleSnapshotMatchesModel
     * @tc.desc   ServiceSnapshot copies the counters of its source model.
     * @tc.precondition  A service with one connect, one request and one destroy.
     * @tc.steps         1. Run the lifecycle steps.
     *                   2. Build a snapshot.
     *                   3. Compare each snapshot field.
     * @tc.expected      The snapshot mirrors the model exactly.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLifecycleSnapshotMatchesModel', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onRequest(2);
      service.onConnect();
      service.onDestroy();
      const snapshot = new ServiceSnapshot(service);
      expect(snapshot.state).assertEqual(service.state);
      expect(snapshot.requests).assertEqual(service.requestCount);
      expect(snapshot.connects).assertEqual(service.connectCount);
      expect(snapshot.destroys).assertEqual(service.destroyCount);
      expect(snapshot.disconnects).assertEqual(service.disconnectCount);
      expect(snapshot.state).assertEqual('destroyed');
      expect(snapshot.requests).assertEqual(1);
    });

    /**
     * @tc.name   stubLifecycleSnapshotSameAfterIdenticalRuns
     * @tc.desc   Two identical lifecycle runs produce equal snapshots.
     * @tc.precondition  Two fresh lifecycle models.
     * @tc.steps         1. Run the same steps on both models.
     *                   2. Build both snapshots.
     *                   3. Compare with sameAs and describe.
     * @tc.expected      Both snapshots are equal.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLifecycleSnapshotSameAfterIdenticalRuns', 0, () => {
      const left = new ServiceLifecycleModel();
      const right = new ServiceLifecycleModel();
      left.onCreate();
      right.onCreate();
      left.onConnect();
      right.onConnect();
      left.onDisconnect();
      right.onDisconnect();
      const leftSnapshot = new ServiceSnapshot(left);
      const rightSnapshot = new ServiceSnapshot(right);
      expect(leftSnapshot.sameAs(rightSnapshot)).assertTrue();
      expect(leftSnapshot.describe()).assertEqual(rightSnapshot.describe());
      expect(leftSnapshot.describe()).assertEqual('disconnected/1/1/0/0');
      expect(leftSnapshot.state).assertEqual(rightSnapshot.state);
      expect(leftSnapshot.connects).assertEqual(1);
      expect(leftSnapshot.disconnects).assertEqual(1);
    });

    /**
     * @tc.name   stubLifecycleSnapshotDiffersAfterExtraRequest
     * @tc.desc   An extra request makes two otherwise equal snapshots differ.
     * @tc.precondition  Two models with the same connect sequence.
     * @tc.steps         1. Connect both models.
     *                   2. Send one request on the left model only.
     *                   3. Compare the snapshots.
     * @tc.expected      sameAs returns false and the request counts differ.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLifecycleSnapshotDiffersAfterExtraRequest', 0, () => {
      const left = new ServiceLifecycleModel();
      const right = new ServiceLifecycleModel();
      left.onCreate();
      left.onConnect();
      right.onCreate();
      right.onConnect();
      left.onRequest(11);
      const leftSnapshot = new ServiceSnapshot(left);
      const rightSnapshot = new ServiceSnapshot(right);
      expect(leftSnapshot.sameAs(rightSnapshot)).assertFalse();
      expect(leftSnapshot.requests).assertEqual(1);
      expect(rightSnapshot.requests).assertEqual(0);
      expect(leftSnapshot.connects).assertEqual(rightSnapshot.connects);
      expect(leftSnapshot.describe() === rightSnapshot.describe()).assertFalse();
      expect(left.requestCount === right.requestCount).assertFalse();
    });

    /**
     * @tc.name   stubLifecycleSnapshotDescribeShape
     * @tc.desc   The snapshot description joins five positional fields.
     * @tc.precondition  A freshly constructed snapshot.
     * @tc.steps         1. Build a snapshot from an idle model.
     *                   2. Split the description.
     *                   3. Compare each field.
     * @tc.expected      The description is 'idle/0/0/0/0'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLifecycleSnapshotDescribeShape', 0, () => {
      const snapshot = new ServiceSnapshot(new ServiceLifecycleModel());
      const fields = snapshot.describe().split('/');
      expect(snapshot.describe()).assertEqual('idle/0/0/0/0');
      expect(fields.length).assertEqual(5);
      expect(fields[0]).assertEqual('idle');
      expect(fields[4]).assertEqual('0');
      expect(snapshot.requests).assertEqual(0);
      expect(snapshot.sameAs(snapshot)).assertTrue();
    });

    /**
     * @tc.name   stubLifecycleSnapshotOfFreshModel
     * @tc.desc   A fresh model always yields the same snapshot.
     * @tc.precondition  Two untouched lifecycle models.
     * @tc.steps         1. Build a snapshot for each model.
     *                   2. Compare the states.
     *                   3. Compare the described forms.
     * @tc.expected      Both fresh snapshots are idle with zero counters.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLifecycleSnapshotOfFreshModel', 0, () => {
      const first = new ServiceSnapshot(new ServiceLifecycleModel());
      const second = new ServiceSnapshot(new ServiceLifecycleModel());
      expect(first.state).assertEqual('idle');
      expect(first.connects).assertEqual(0);
      expect(first.disconnects).assertEqual(0);
      expect(first.requests).assertEqual(0);
      expect(first.destroys).assertEqual(0);
      expect(first.sameAs(second)).assertTrue();
      expect(first.describe()).assertEqual(second.describe());
    });

    /**
     * @tc.name   stubLifecycleResetClearsState
     * @tc.desc   reset returns the model to the idle state.
     * @tc.precondition  A destroyed service.
     * @tc.steps         1. Run a full lifecycle.
     *                   2. Reset the model.
     *                   3. Read the state and alive flag.
     * @tc.expected      The state is idle and the model reports alive.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLifecycleResetClearsState', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onConnect();
      service.onDestroy();
      service.reset();
      expect(service.state).assertEqual('idle');
      expect(service.isAlive()).assertTrue();
      expect(service.state === 'destroyed').assertFalse();
      expect(new ServiceSnapshot(service).describe()).assertEqual('idle/0/0/0/0');
      expect(service.events.last()).assertEqual('');
    });

    /**
     * @tc.name   stubLifecycleResetClearsEvents
     * @tc.desc   reset empties the event recorder.
     * @tc.precondition  A service with several recorded events.
     * @tc.steps         1. Record create, connect and destroy events.
     *                   2. Reset the model.
     *                   3. Read the recorder size and trace.
     * @tc.expected      The recorder is empty after reset.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLifecycleResetClearsEvents', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onConnect();
      service.onDestroy();
      expect(service.events.size()).assertEqual(3);
      service.reset();
      expect(service.events.size()).assertEqual(0);
      expect(service.events.trace()).assertEqual('');
      expect(service.events.countOf(EVENT_ON_CREATE)).assertEqual(0);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(0);
      expect(service.events.countOf(EVENT_ON_DESTROY)).assertEqual(0);
    });

    /**
     * @tc.name   stubLifecycleResetClearsLogs
     * @tc.desc   reset empties the service log buffer.
     * @tc.precondition  A service with logged lifecycle steps.
     * @tc.steps         1. Run create, connect, disconnect and destroy.
     *                   2. Reset the model.
     *                   3. Read the log size and contents.
     * @tc.expected      The log buffer is empty and contains nothing.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLifecycleResetClearsLogs', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onConnect();
      service.onDisconnect();
      service.onDestroy();
      expect(service.logs.size()).assertEqual(4);
      service.reset();
      expect(service.logs.size()).assertEqual(0);
      expect(service.logs.contains('onCreate')).assertFalse();
      expect(service.logs.contains('onDestroy')).assertFalse();
      expect(service.logs.countLevel(LEVEL_INFO)).assertEqual(0);
      expect(service.logs.trace()).assertEqual('');
    });

    /**
     * @tc.name   stubLifecycleResetClearsStubReference
     * @tc.desc   reset drops the stub created by onConnect.
     * @tc.precondition  A connected service.
     * @tc.steps         1. Connect and confirm a stub exists.
     *                   2. Reset the model.
     *                   3. Read the stub reference.
     * @tc.expected      The stub reference becomes undefined.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLifecycleResetClearsStubReference', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onConnect();
      expect(service.stub?.descriptor).assertEqual(STUB_DESCRIPTOR);
      service.reset();
      expect(service.stub).assertUndefined();
      expect(service.connectCount).assertEqual(0);
      expect(service.events.size()).assertEqual(0);
      expect(service.logs.size()).assertEqual(0);
      expect(service.state).assertEqual('idle');
    });

    /**
     * @tc.name   stubLifecycleResetClearsCounters
     * @tc.desc   reset zeroes every lifecycle counter.
     * @tc.precondition  A service with non-zero counters.
     * @tc.steps         1. Run two requests, connect, disconnect and destroy.
     *                   2. Reset the model.
     *                   3. Read each counter.
     * @tc.expected      All counters are zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLifecycleResetClearsCounters', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onRequest(1);
      service.onRequest(2);
      service.onConnect();
      service.onDisconnect();
      service.onDestroy();
      service.reset();
      expect(service.requestCount).assertEqual(0);
      expect(service.connectCount).assertEqual(0);
      expect(service.disconnectCount).assertEqual(0);
      expect(service.destroyCount).assertEqual(0);
      expect(service.events.size()).assertEqual(0);
      expect(service.isAlive()).assertTrue();
    });

    /**
     * @tc.name   stubLifecycleAfterResetWorks
     * @tc.desc   A reset model can run a complete lifecycle again.
     * @tc.precondition  A model that already ran one lifecycle.
     * @tc.steps         1. Run and reset a lifecycle.
     *                   2. Run the lifecycle a second time.
     *                   3. Compare the fresh snapshot with a direct run.
     * @tc.expected      The second run behaves like a first run.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLifecycleAfterResetWorks', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onConnect();
      service.onDestroy();
      service.reset();
      service.onCreate();
      service.onConnect();
      service.onDisconnect();
      service.onDestroy();
      const snapshot = new ServiceSnapshot(service);
      expect(snapshot.state).assertEqual('destroyed');
      expect(snapshot.connects).assertEqual(1);
      expect(snapshot.disconnects).assertEqual(1);
      expect(snapshot.destroys).assertEqual(1);
      expect(snapshot.requests).assertEqual(0);
      expect(service.events.countOf(EVENT_ON_CREATE)).assertEqual(1);
      expect(service.logs.size()).assertEqual(4);
    });

    /**
     * @tc.name   stubLifecycleEventCountsByKind
     * @tc.desc   countOf separates the five lifecycle event kinds.
     * @tc.precondition  A service with a mixed event history.
     * @tc.steps         1. Run two creates, two requests, one connect.
     *                   2. Count each kind.
     *                   3. Compare the counts.
     * @tc.expected      Each kind count matches the number of calls.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLifecycleEventCountsByKind', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onCreate();
      service.onRequest(1);
      service.onRequest(2);
      service.onConnect();
      service.onDisconnect();
      service.onDestroy();
      expect(service.events.countOf(EVENT_ON_CREATE)).assertEqual(2);
      expect(service.events.countOf(EVENT_ON_REQUEST)).assertEqual(2);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_DISCONNECT)).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_DESTROY)).assertEqual(1);
      expect(service.events.size()).assertEqual(7);
    });

    /**
     * @tc.name   stubLifecycleEventTraceShape
     * @tc.desc   The recorder trace joins entries with the '>' separator.
     * @tc.precondition  A service after create and disconnect.
     * @tc.steps         1. Run create then disconnect.
     *                   2. Read the trace.
     *                   3. Count the separators.
     * @tc.expected      The trace is 'onCreate>onDisconnect'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLifecycleEventTraceShape', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onDisconnect();
      const trace = service.events.trace();
      const parts = trace.split('>');
      expect(trace).assertEqual('onCreate>onDisconnect');
      expect(parts.length).assertEqual(2);
      expect(parts[0]).assertEqual(EVENT_ON_CREATE);
      expect(parts[1]).assertEqual(EVENT_ON_DISCONNECT);
      expect(trace.indexOf('>')).assertEqual(8);
      expect(service.events.size()).assertEqual(2);
    });

    /**
     * @tc.name   stubLifecycleEventFingerprintStable
     * @tc.desc   Identical event sequences yield identical fingerprints.
     * @tc.precondition  Two service models.
     * @tc.steps         1. Run the same lifecycle on both.
     *                   2. Read both fingerprints.
     *                   3. Compare with textFingerprint of the trace.
     * @tc.expected      The fingerprints match the independent oracle.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLifecycleEventFingerprintStable', 0, () => {
      const left = new ServiceLifecycleModel();
      const right = new ServiceLifecycleModel();
      left.onCreate();
      left.onConnect();
      right.onCreate();
      right.onConnect();
      const oracle = textFingerprint('onCreate>onConnect:IPCStubTest');
      expect(left.events.fingerprint()).assertEqual(right.events.fingerprint());
      expect(left.events.fingerprint()).assertEqual(oracle);
      expect(left.events.trace()).assertEqual(right.events.trace());
      expect(left.connectCount).assertEqual(right.connectCount);
      expect(left.events.size()).assertEqual(2);
      expect(oracle).assertLarger(0);
    });

    /**
     * @tc.name   stubLifecycleEventFingerprintDiffers
     * @tc.desc   A different event sequence yields a different fingerprint.
     * @tc.precondition  Two models with different event histories.
     * @tc.steps         1. Create only on the left model.
     *                   2. Create and connect on the right model.
     *                   3. Compare fingerprints.
     * @tc.expected      The fingerprints differ.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLifecycleEventFingerprintDiffers', 0, () => {
      const left = new ServiceLifecycleModel();
      const right = new ServiceLifecycleModel();
      left.onCreate();
      right.onCreate();
      right.onConnect();
      expect(left.events.fingerprint() === right.events.fingerprint()).assertFalse();
      expect(left.events.size()).assertEqual(1);
      expect(right.events.size()).assertEqual(2);
      expect(left.events.trace()).assertEqual('onCreate');
      expect(right.events.trace()).assertEqual('onCreate>onConnect:IPCStubTest');
      expect(textFingerprint(left.events.trace()) === textFingerprint(right.events.trace())).assertFalse();
    });

    /**
     * @tc.name   stubLifecycleRecorderStandaloneClear
     * @tc.desc   A standalone recorder clears its entries without a service.
     * @tc.precondition  An empty ServiceEventRecorder.
     * @tc.steps         1. Record three events directly.
     *                   2. Clear the recorder.
     *                   3. Read size, trace and last.
     * @tc.expected      The recorder is empty after clear.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLifecycleRecorderStandaloneClear', 0, () => {
      const recorder = new ServiceEventRecorder();
      recorder.record(EVENT_ON_CREATE);
      recorder.record(EVENT_ON_REQUEST, '12');
      recorder.record(EVENT_ON_DESTROY);
      expect(recorder.size()).assertEqual(3);
      recorder.clear();
      expect(recorder.size()).assertEqual(0);
      expect(recorder.trace()).assertEqual('');
      expect(recorder.last()).assertEqual('');
      expect(recorder.countOf(EVENT_ON_CREATE)).assertEqual(0);
      expect(recorder.fingerprint()).assertEqual(textFingerprint(''));
    });

    /**
     * @tc.name   stubLifecycleRecorderCountsDetailEntries
     * @tc.desc   countOf matches both bare and detailed entries of a kind.
     * @tc.precondition  A recorder with bare and detailed request entries.
     * @tc.steps         1. Record 'onRequest' and 'onRequest:5'.
     *                   2. Count the request kind.
     *                   3. Read the last entry.
     * @tc.expected      Both entries count as request events.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLifecycleRecorderCountsDetailEntries', 0, () => {
      const recorder = new ServiceEventRecorder();
      recorder.record(EVENT_ON_REQUEST);
      recorder.record(EVENT_ON_REQUEST, '5');
      recorder.record(EVENT_ON_CONNECT, STUB_DESCRIPTOR);
      expect(recorder.countOf(EVENT_ON_REQUEST)).assertEqual(2);
      expect(recorder.countOf(EVENT_ON_CONNECT)).assertEqual(1);
      expect(recorder.countOf(EVENT_ON_DESTROY)).assertEqual(0);
      expect(recorder.size()).assertEqual(3);
      expect(recorder.last()).assertEqual('onConnect:IPCStubTest');
      expect(recorder.entries[0]).assertEqual('onRequest');
    });

    /**
     * @tc.name   stubLifecycleRecorderEmptyDefaults
     * @tc.desc   An empty recorder reports neutral default values.
     * @tc.precondition  A newly constructed recorder.
     * @tc.steps         1. Read size, last and trace.
     *                   2. Count every known kind.
     *                   3. Compare the fingerprint with the empty hash.
     * @tc.expected      The recorder reports empty values everywhere.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stubLifecycleRecorderEmptyDefaults', 0, () => {
      const recorder = new ServiceEventRecorder();
      expect(recorder.size()).assertEqual(0);
      expect(recorder.last()).assertEqual('');
      expect(recorder.trace()).assertEqual('');
      expect(recorder.countOf(EVENT_ON_CREATE)).assertEqual(0);
      expect(recorder.countOf(EVENT_ON_REQUEST)).assertEqual(0);
      expect(recorder.fingerprint()).assertEqual(textFingerprint(''));
      expect(recorder.entries.length).assertEqual(0);
    });

    /**
     * @tc.name   stubLifecycleLogCountsAfterFullCycle
     * @tc.desc   A full lifecycle writes one info line per step.
     * @tc.precondition  A fresh lifecycle model.
     * @tc.steps         1. Run create, request, connect, disconnect, destroy.
     *                   2. Count log levels.
     *                   3. Compare with the event count.
     * @tc.expected      Five info lines and no warning or error lines.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLifecycleLogCountsAfterFullCycle', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onRequest(1);
      service.onConnect();
      service.onDisconnect();
      service.onDestroy();
      expect(service.logs.size()).assertEqual(5);
      expect(service.logs.countLevel(LEVEL_INFO)).assertEqual(5);
      expect(service.logs.countLevel(LEVEL_WARN)).assertEqual(0);
      expect(service.logs.countLevel(LEVEL_ERROR)).assertEqual(0);
      expect(service.logs.size()).assertEqual(service.events.size());
      expect(service.logs.lines[4]).assertEqual('INFO onDestroy');
    });

    /**
     * @tc.name   stubLifecycleLogBufferEvictsOldest
     * @tc.desc   A bounded log buffer drops the oldest line when full.
     * @tc.precondition  A log buffer limited to three lines.
     * @tc.steps         1. Push five info lines.
     *                   2. Read size and contents.
     *                   3. Confirm the first two lines were evicted.
     * @tc.expected      Three newest lines remain.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLifecycleLogBufferEvictsOldest', 0, () => {
      const logs = new LogBuffer(3);
      logs.info('one');
      logs.info('two');
      logs.info('three');
      logs.info('four');
      logs.info('five');
      expect(logs.size()).assertEqual(3);
      expect(logs.contains('one')).assertFalse();
      expect(logs.contains('two')).assertFalse();
      expect(logs.contains('three')).assertTrue();
      expect(logs.contains('five')).assertTrue();
      expect(logs.lines[0]).assertEqual('INFO three');
      expect(logs.trace()).assertEqual('INFO three|INFO four|INFO five');
    });

    /**
     * @tc.name   stubLifecycleLogBufferLevels
     * @tc.desc   Info, warn and error lines are counted per level.
     * @tc.precondition  An unbounded log buffer.
     * @tc.steps         1. Push two info, one warn and one error line.
     *                   2. Count each level.
     *                   3. Read the full trace.
     * @tc.expected      Each level count matches the pushed lines.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLifecycleLogBufferLevels', 0, () => {
      const logs = new LogBuffer(16);
      logs.info('alpha');
      logs.warn('beta');
      logs.error('gamma');
      logs.info('delta');
      expect(logs.size()).assertEqual(4);
      expect(logs.countLevel(LEVEL_INFO)).assertEqual(2);
      expect(logs.countLevel(LEVEL_WARN)).assertEqual(1);
      expect(logs.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(logs.lines[1]).assertEqual('WARN beta');
      expect(logs.lines[2]).assertEqual('ERROR gamma');
      expect(logs.contains('delta')).assertTrue();
    });

    /**
     * @tc.name   stubLifecycleLogBufferClear
     * @tc.desc   clear removes lines and levels from the log buffer.
     * @tc.precondition  A buffer with three entries.
     * @tc.steps         1. Push three lines of different levels.
     *                   2. Clear the buffer.
     *                   3. Read size, trace and level counts.
     * @tc.expected      The buffer is completely empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLifecycleLogBufferClear', 0, () => {
      const logs = new LogBuffer(8);
      logs.info('a');
      logs.warn('b');
      logs.error('c');
      logs.clear();
      expect(logs.size()).assertEqual(0);
      expect(logs.trace()).assertEqual('');
      expect(logs.countLevel(LEVEL_INFO)).assertEqual(0);
      expect(logs.countLevel(LEVEL_WARN)).assertEqual(0);
      expect(logs.countLevel(LEVEL_ERROR)).assertEqual(0);
      expect(logs.contains('a')).assertFalse();
      expect(logs.lines.length).assertEqual(0);
    });

    /**
     * @tc.name   stubLifecycleTwoServicesIndependent
     * @tc.desc   Two lifecycle models keep separate state and counters.
     * @tc.precondition  Two fresh lifecycle models.
     * @tc.steps         1. Connect the left model only.
     *                   2. Destroy the right model only.
     *                   3. Compare states and counters.
     * @tc.expected      Each model reflects only its own calls.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLifecycleTwoServicesIndependent', 0, () => {
      const left = new ServiceLifecycleModel();
      const right = new ServiceLifecycleModel();
      left.onCreate();
      left.onConnect();
      right.onCreate();
      right.onDestroy();
      expect(left.state).assertEqual('connected');
      expect(right.state).assertEqual('destroyed');
      expect(left.connectCount).assertEqual(1);
      expect(right.connectCount).assertEqual(0);
      expect(left.destroyCount).assertEqual(0);
      expect(right.destroyCount).assertEqual(1);
      expect(left.isAlive()).assertTrue();
      expect(right.isAlive()).assertFalse();
    });

    /**
     * @tc.name   stubLifecycleTwoServicesDifferentTraces
     * @tc.desc   Independent models produce different event traces.
     * @tc.precondition  Two fresh models.
     * @tc.steps         1. Create and connect the left model.
     *                   2. Create and destroy the right model.
     *                   3. Compare the traces.
     * @tc.expected      The traces differ in their second event.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLifecycleTwoServicesDifferentTraces', 0, () => {
      const left = new ServiceLifecycleModel();
      const right = new ServiceLifecycleModel();
      left.onCreate();
      left.onConnect();
      right.onCreate();
      right.onDestroy();
      expect(left.events.size()).assertEqual(right.events.size());
      expect(left.events.trace() === right.events.trace()).assertFalse();
      expect(left.events.countOf(EVENT_ON_CONNECT)).assertEqual(1);
      expect(right.events.countOf(EVENT_ON_CONNECT)).assertEqual(0);
      expect(right.events.countOf(EVENT_ON_DESTROY)).assertEqual(1);
      expect(left.logs.contains('onDestroy')).assertFalse();
    });

    /**
     * @tc.name   stubLifecycleDisconnectWithoutConnect
     * @tc.desc   A disconnect without a prior connect is still recorded.
     * @tc.precondition  A fresh lifecycle model.
     * @tc.steps         1. Call onDisconnect directly.
     *                   2. Read the state and counters.
     *                   3. Read the event trace.
     * @tc.expected      The state is disconnected with one disconnect event.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('stubLifecycleDisconnectWithoutConnect', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onDisconnect();
      expect(service.state).assertEqual('disconnected');
      expect(service.connectCount).assertEqual(0);
      expect(service.disconnectCount).assertEqual(1);
      expect(service.events.trace()).assertEqual('onDisconnect');
      expect(service.isAlive()).assertTrue();
      expect(service.stub).assertUndefined();
    });

    /**
     * @tc.name   stubLifecycleDestroyWithoutConnect
     * @tc.desc   Destroying without connect leaves the stub reference undefined.
     * @tc.precondition  A fresh lifecycle model.
     * @tc.steps         1. Call onDestroy directly.
     *                   2. Read the state, stub and counters.
     *                   3. Read the log.
     * @tc.expected      The model is destroyed without any connect.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('stubLifecycleDestroyWithoutConnect', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onDestroy();
      expect(service.state).assertEqual('destroyed');
      expect(service.stub).assertUndefined();
      expect(service.connectCount).assertEqual(0);
      expect(service.destroyCount).assertEqual(1);
      expect(service.isAlive()).assertFalse();
      expect(service.logs.contains('onDestroy')).assertTrue();
      expect(service.events.trace()).assertEqual('onDestroy');
    });

    /**
     * @tc.name   stubLifecycleRequestCountMatchesEvents
     * @tc.desc   The request counter always equals the request event count.
     * @tc.precondition  A created service.
     * @tc.steps         1. Call onRequest four times with different ids.
     *                   2. Compare the counter with the event count.
     *                   3. Compare the log count with the counter.
     * @tc.expected      All three observations agree.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLifecycleRequestCountMatchesEvents', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onRequest(21);
      service.onRequest(22);
      service.onRequest(23);
      service.onRequest(24);
      expect(service.requestCount).assertEqual(4);
      expect(service.requestCount).assertEqual(service.events.countOf(EVENT_ON_REQUEST));
      expect(service.logs.size()).assertEqual(service.requestCount + 1);
      expect(service.events.size()).assertEqual(5);
      expect(service.logs.contains('onRequest 24')).assertTrue();
      expect(service.requestCount).assertLarger(service.connectCount);
    });

    /**
     * @tc.name   stubLifecycleStubAliveThroughFlow
     * @tc.desc   The stub alive flag is independent of the service state.
     * @tc.precondition  A connected service.
     * @tc.steps         1. Read the stub alive flag after connect.
     *                   2. Destroy the service.
     *                   3. Re-read the stub alive flag.
     * @tc.expected      The stub remains alive while the service is destroyed.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('stubLifecycleStubAliveThroughFlow', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const stub = service.onConnect();
      expect(stub.alive).assertTrue();
      service.onDestroy();
      expect(stub.alive).assertTrue();
      expect(service.isAlive()).assertFalse();
      const client = new InProcessClient(stub);
      expect(client.send(REQUEST_CODE, REQUEST_PAYLOAD).isSuccess()).assertTrue();
      expect(stub.requestCount()).assertEqual(1);
      expect(client.replies.length).assertEqual(1);
    });

    /**
     * @tc.name   stubLifecycleSnapshotAfterReset
     * @tc.desc   A snapshot taken after reset reports the idle state.
     * @tc.precondition  A service that ran a full lifecycle and was reset.
     * @tc.steps         1. Run the lifecycle and reset.
     *                   2. Build a snapshot.
     *                   3. Compare with a fresh snapshot.
     * @tc.expected      The reset snapshot equals a fresh snapshot.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLifecycleSnapshotAfterReset', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onRequest(5);
      service.onConnect();
      service.onDisconnect();
      service.onDestroy();
      service.reset();
      const reset = new ServiceSnapshot(service);
      const fresh = new ServiceSnapshot(new ServiceLifecycleModel());
      expect(reset.sameAs(fresh)).assertTrue();
      expect(reset.state).assertEqual('idle');
      expect(reset.requests).assertEqual(0);
      expect(reset.describe()).assertEqual('idle/0/0/0/0');
      expect(service.events.size()).assertEqual(0);
      expect(service.logs.size()).assertEqual(0);
    });

    /**
     * @tc.name   stubLifecycleServiceStubHandlesRequests
     * @tc.desc   The stub obtained from onConnect behaves like the production stub.
     * @tc.precondition  A connected service.
     * @tc.steps         1. Connect and wrap the stub in a client.
     *                   2. Send code 1 and an unknown code.
     *                   3. Compare handled flags and metrics.
     * @tc.expected      One handled and one rejected request are recorded.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLifecycleServiceStubHandlesRequests', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const stub = service.onConnect();
      const client = new InProcessClient(stub);
      const accepted = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      const rejected = client.send(2, REQUEST_PAYLOAD);
      const metrics = StubMetrics.from(stub);
      expect(accepted.handled).assertTrue();
      expect(rejected.handled).assertFalse();
      expect(accepted.replyText).assertEqual(REPLY_PAYLOAD);
      expect(metrics.requests).assertEqual(2);
      expect(metrics.handled).assertEqual(1);
      expect(metrics.rejected).assertEqual(1);
      expect(service.state).assertEqual('connected');
    });

    /**
     * @tc.name   stubLifecycleCreateDestroyCreateCycle
     * @tc.desc   The model tolerates create, destroy and create again.
     * @tc.precondition  A fresh lifecycle model.
     * @tc.steps         1. Create and destroy once.
     *                   2. Create again.
     *                   3. Read the state and create event count.
     * @tc.expected      The second create restores the created state.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('stubLifecycleCreateDestroyCreateCycle', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onDestroy();
      expect(service.state).assertEqual('destroyed');
      service.onCreate();
      expect(service.state).assertEqual('created');
      expect(service.events.countOf(EVENT_ON_CREATE)).assertEqual(2);
      expect(service.destroyCount).assertEqual(1);
      expect(service.events.trace()).assertEqual('onCreate>onDestroy>onCreate');
      expect(service.logs.size()).assertEqual(3);
    });

    /**
     * @tc.name   stubLifecycleFingerprintAfterReset
     * @tc.desc   Resetting the model restores the empty event fingerprint.
     * @tc.precondition  A model with a recorded lifecycle.
     * @tc.steps         1. Record create and connect.
     *                   2. Reset the model.
     *                   3. Compare the fingerprint with the empty hash.
     * @tc.expected      The fingerprint equals textFingerprint of an empty string.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLifecycleFingerprintAfterReset', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onConnect();
      const before = service.events.fingerprint();
      service.reset();
      const after = service.events.fingerprint();
      expect(after).assertEqual(textFingerprint(''));
      expect(after === before).assertFalse();
      expect(service.events.trace()).assertEqual('');
      expect(service.events.size()).assertEqual(0);
      expect(service.state).assertEqual('idle');
      expect(service.stub).assertUndefined();
    });

    /**
     * @tc.name   stubLifecycleLogContainsAllSteps
     * @tc.desc   Every lifecycle step leaves a searchable log line.
     * @tc.precondition  A service after a complete lifecycle.
     * @tc.steps         1. Run all five lifecycle steps.
     *                   2. Search for each step keyword.
     *                   3. Compare the log size with the event size.
     * @tc.expected      All five keywords are found.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLifecycleLogContainsAllSteps', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onRequest(1);
      service.onConnect();
      service.onDisconnect();
      service.onDestroy();
      expect(service.logs.contains('onCreate')).assertTrue();
      expect(service.logs.contains('onRequest 1')).assertTrue();
      expect(service.logs.contains('onConnect')).assertTrue();
      expect(service.logs.contains('onDisconnect')).assertTrue();
      expect(service.logs.contains('onDestroy')).assertTrue();
      expect(service.logs.size()).assertEqual(service.events.size());
      expect(service.logs.trace().split('|').length).assertEqual(5);
    });

    /**
     * @tc.name   stubLifecycleMetricsOfConnectedStub
     * @tc.desc   Metrics built from a service stub match the client ledger.
     * @tc.precondition  A connected service with a client double.
     * @tc.steps         1. Connect and send three code 1 requests.
     *                   2. Build metrics from the stub.
     *                   3. Compare handled and reply counters.
     * @tc.expected      All three requests are handled and replied.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLifecycleMetricsOfConnectedStub', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const stub = service.onConnect();
      const client = new InProcessClient(stub);
      const handled = client.sendMany(3, REQUEST_CODE);
      const metrics = StubMetrics.from(stub);
      expect(handled).assertEqual(3);
      expect(metrics.requests).assertEqual(3);
      expect(metrics.handled).assertEqual(3);
      expect(metrics.replies).assertEqual(3);
      expect(metrics.rejected).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(1);
      expect(client.replies.length).assertEqual(3);
    });

    /**
     * @tc.name   stubLifecycleMultipleConnectsLogCount
     * @tc.desc   Each connect adds one log line and one connect event.
     * @tc.precondition  A created service.
     * @tc.steps         1. Connect three times.
     *                   2. Count connect events and log lines.
     *                   3. Compare with the connect counter.
     * @tc.expected      The three observations agree.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLifecycleMultipleConnectsLogCount', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onConnect();
      service.onConnect();
      service.onConnect();
      expect(service.connectCount).assertEqual(3);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(3);
      expect(service.logs.size()).assertEqual(4);
      expect(service.logs.contains('onConnect')).assertTrue();
      expect(service.stub?.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(service.events.trace().split('>').length).assertEqual(4);
    });

    /**
     * @tc.name   stubLifecycleDestroyKeepsEventHistory
     * @tc.desc   Destroy does not erase earlier lifecycle events.
     * @tc.precondition  A service with create and connect events.
     * @tc.steps         1. Create and connect.
     *                   2. Destroy the service.
     *                   3. Read the full trace.
     * @tc.expected      All three events remain in order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubLifecycleDestroyKeepsEventHistory', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onConnect();
      service.onDestroy();
      const parts = service.events.trace().split('>');
      expect(parts.length).assertEqual(3);
      expect(parts[0]).assertEqual(EVENT_ON_CREATE);
      expect(parts[1]).assertEqual('onConnect:IPCStubTest');
      expect(parts[2]).assertEqual(EVENT_ON_DESTROY);
      expect(service.events.countOf(EVENT_ON_CREATE)).assertEqual(1);
      expect(service.events.size()).assertEqual(3);
      expect(service.destroyCount).assertEqual(1);
    });
  });
}
