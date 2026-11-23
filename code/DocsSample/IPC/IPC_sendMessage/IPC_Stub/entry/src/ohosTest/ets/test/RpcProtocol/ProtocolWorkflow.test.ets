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
  UNKNOWN_CODE_ZERO,
  UNKNOWN_CODE_TWO,
  UNKNOWN_CODE_LARGE,
  ERROR_NONE,
  ERROR_STUB_REJECTED,
  EVENT_ON_CREATE,
  EVENT_ON_REQUEST,
  EVENT_ON_CONNECT,
  EVENT_ON_DISCONNECT,
  EVENT_ON_DESTROY,
  LEVEL_INFO,
  LEVEL_WARN,
  StubRemoteObjectModel,
  InProcessClient,
  ServiceLifecycleModel,
  ServiceSnapshot,
  MessageSequenceModel,
  MessageOptionModel,
  StubMetrics,
  countOf,
  joined,
  expectedDescriptor,
  textFingerprint
} from '../Shared/SharedDriver';

/**
 * End-to-end protocol workflow for the IPC stub.
 *
 * Production anchor: ServiceExtAbility.ets 43-65 defines onCreate,
 * onRequest, onConnect returning new Stub('IPCStubTest'), onDisconnect and
 * onDestroy. This suite drives connect, request/reply and teardown in one
 * ordered workflow and compares the results with independent oracles.
 */

function freshService(): ServiceLifecycleModel {
  return new ServiceLifecycleModel();
}

function connectedService(): ServiceLifecycleModel {
  const service = new ServiceLifecycleModel();
  service.onCreate();
  service.onConnect();
  return service;
}

function connectedStub(service: ServiceLifecycleModel): StubRemoteObjectModel {
  const stub = service.stub;
  if (stub === undefined) {
    return new StubRemoteObjectModel();
  }
  return stub;
}

function requestThrough(service: ServiceLifecycleModel, code: number, payload: string = REQUEST_PAYLOAD): boolean {
  const stub = connectedStub(service);
  const data = MessageSequenceModel.create();
  const reply = MessageSequenceModel.create();
  data.writeString(payload);
  return stub.onRemoteMessageRequest(code, data, reply, new MessageOptionModel());
}

function replyThrough(service: ServiceLifecycleModel, code: number): string {
  const stub = connectedStub(service);
  const data = MessageSequenceModel.create();
  const reply = MessageSequenceModel.create();
  data.writeString(REQUEST_PAYLOAD);
  stub.onRemoteMessageRequest(code, data, reply, new MessageOptionModel());
  return reply.readString();
}
export default function protocolWorkflowTest(): void {
  describe('ProtocolWorkflowTest', () => {
    beforeAll(() => {
      logSuite('ProtocolWorkflowTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('ProtocolWorkflowTest', 'end');
    });

    /**
     * @tc.name          protocolWorkflowConnectReturnsStub
     * @tc.desc          onConnect returns a stub instance with the production descriptor.
     * @tc.precondition  A fresh lifecycle model.
     * @tc.steps         1. Call onCreate.
     *                   2. Call onConnect.
     *                   3. Inspect the returned stub.
     * @tc.expected      The stub exists with descriptor IPCStubTest.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('protocolWorkflowConnectReturnsStub', 0, () => {
      const service = freshService();
      service.onCreate();
      const stub = service.onConnect();
      expect(stub !== undefined).assertTrue();
      expect(stub.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(stub.descriptor).assertEqual('IPCStubTest');
      expect(service.stub !== undefined).assertTrue();
      expect(service.state).assertEqual('connected');
      expect(service.connectCount).assertEqual(1);
      expect(stub.alive).assertTrue();
      expect(stub.requestCount()).assertEqual(0);
    });

    /**
     * @tc.name          protocolWorkflowConnectDescriptor
     * @tc.desc          The onConnect event records the stub descriptor as detail.
     * @tc.precondition  A service after connect.
     * @tc.steps         1. Connect.
     *                   2. Read the event trace.
     *                   3. Compare the last event.
     * @tc.expected      The last event is onConnect:IPCStubTest.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('protocolWorkflowConnectDescriptor', 0, () => {
      const service = connectedService();
      expect(service.events.last()).assertEqual('onConnect:IPCStubTest');
      expect(service.events.last()).assertContain(STUB_DESCRIPTOR);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(1);
      expect(service.events.size()).assertEqual(2);
      expect(service.events.entries[0]).assertEqual(EVENT_ON_CREATE);
      expect(service.events.entries[1]).assertEqual('onConnect:' + STUB_DESCRIPTOR);
      expect(service.connectCount).assertEqual(1);
      expect(service.state).assertEqual('connected');
    });

    /**
     * @tc.name          protocolWorkflowRequestAfterConnect
     * @tc.desc          A code 1 request through the connected stub returns the reply.
     * @tc.precondition  A connected service.
     * @tc.steps         1. Take the stub from onConnect.
     *                   2. Send code 1 with a client.
     *                   3. Compare the reply.
     * @tc.expected      The client receives 'hello rpc'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('protocolWorkflowRequestAfterConnect', 0, () => {
      const service = connectedService();
      const stub = connectedStub(service);
      const client = new InProcessClient(stub);
      logStep('protocolWorkflowRequestAfterConnect', 'send through the connected stub');
      const result = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(result.isSuccess()).assertTrue();
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(stub.requestCount()).assertEqual(1);
      expect(stub.requests[0].text).assertEqual(REQUEST_PAYLOAD);
      expect(client.replies.length).assertEqual(1);
      expect(client.trace()).assertEqual(REPLY_PAYLOAD);
    });

    /**
     * @tc.name          protocolWorkflowCreateThenConnect
     * @tc.desc          Lifecycle create then connect reaches the connected state.
     * @tc.precondition  A fresh lifecycle model.
     * @tc.steps         1. Call onCreate.
     *                   2. Call onConnect.
     *                   3. Compare state and counters.
     * @tc.expected      The state is connected with one connect and one create event.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('protocolWorkflowCreateThenConnect', 0, () => {
      const service = freshService();
      expect(service.state).assertEqual('idle');
      service.onCreate();
      expect(service.state).assertEqual('created');
      expect(service.events.countOf(EVENT_ON_CREATE)).assertEqual(1);
      service.onConnect();
      expect(service.state).assertEqual('connected');
      expect(service.connectCount).assertEqual(1);
      expect(service.events.size()).assertEqual(2);
      expect(service.isAlive()).assertTrue();
      expect(service.logs.size()).assertEqual(2);
    });

    /**
     * @tc.name          protocolWorkflowConnectThenRequest
     * @tc.desc          A request after connect goes through the connected stub.
     * @tc.precondition  A connected service.
     * @tc.steps         1. Connect.
     *                   2. Invoke requestThrough with code 1.
     *                   3. Compare replyThrough with the literal.
     * @tc.expected      The request is handled and the reply is 'hello rpc'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('protocolWorkflowConnectThenRequest', 0, () => {
      const service = connectedService();
      expect(requestThrough(service, REQUEST_CODE)).assertTrue();
      const reply = replyThrough(service, REQUEST_CODE);
      expect(reply).assertEqual(REPLY_PAYLOAD);
      expect(reply).assertEqual('hello rpc');
      expect(connectedStub(service).requestCount()).assertEqual(2);
      expect(connectedStub(service).requests[0].handled).assertTrue();
      expect(connectedStub(service).requests[1].handled).assertTrue();
      expect(service.state).assertEqual('connected');
      expect(service.connectCount).assertEqual(1);
    });

    /**
     * @tc.name          protocolWorkflowFullLifecycleSequence
     * @tc.desc          The five production callbacks run in one ordered sequence.
     * @tc.precondition  A fresh lifecycle model.
     * @tc.steps         1. Call create, request, connect, disconnect and destroy.
     *                   2. Read the event trace.
     *                   3. Compare with the expected chain.
     * @tc.expected      The trace lists all five callbacks in order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('protocolWorkflowFullLifecycleSequence', 0, () => {
      const service = freshService();
      service.onCreate();
      service.onRequest(7);
      service.onConnect();
      service.onDisconnect();
      service.onDestroy();
      expect(service.events.size()).assertEqual(5);
      expect(service.events.trace()).assertEqual('onCreate>onRequest:7>onConnect:IPCStubTest>onDisconnect>onDestroy');
      expect(service.state).assertEqual('destroyed');
      expect(service.isAlive()).assertFalse();
      expect(service.requestCount).assertEqual(1);
      expect(service.connectCount).assertEqual(1);
      expect(service.disconnectCount).assertEqual(1);
      expect(service.destroyCount).assertEqual(1);
    });

    /**
     * @tc.name          protocolWorkflowDisconnectAfterRequests
     * @tc.desc          Disconnecting after requests keeps the recorded traffic.
     * @tc.precondition  A connected service with two requests.
     * @tc.steps         1. Send code 1 and code 2.
     *                   2. Disconnect.
     *                   3. Compare the stub ledger.
     * @tc.expected      The stub keeps two entries and the state is disconnected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('protocolWorkflowDisconnectAfterRequests', 0, () => {
      const service = connectedService();
      const stub = connectedStub(service);
      requestThrough(service, REQUEST_CODE);
      requestThrough(service, UNKNOWN_CODE_TWO);
      service.onDisconnect();
      expect(service.state).assertEqual('disconnected');
      expect(service.disconnectCount).assertEqual(1);
      expect(stub.requestCount()).assertEqual(2);
      expect(stub.requests[0].handled).assertTrue();
      expect(stub.requests[1].handled).assertFalse();
      expect(stub.alive).assertTrue();
      expect(service.events.countOf(EVENT_ON_DISCONNECT)).assertEqual(1);
      expect(service.isAlive()).assertTrue();
    });

    /**
     * @tc.name          protocolWorkflowDestroyEndsService
     * @tc.desc          Destroy marks the service dead and records the event.
     * @tc.precondition  A connected service.
     * @tc.steps         1. Destroy the service.
     *                   2. Read state and alive flag.
     *                   3. Compare the counter.
     * @tc.expected      The state is destroyed and isAlive is false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('protocolWorkflowDestroyEndsService', 0, () => {
      const service = connectedService();
      expect(service.isAlive()).assertTrue();
      service.onDestroy();
      expect(service.state).assertEqual('destroyed');
      expect(service.isAlive()).assertFalse();
      expect(service.destroyCount).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_DESTROY)).assertEqual(1);
      expect(service.events.last()).assertEqual(EVENT_ON_DESTROY);
      expect(service.logs.contains('onDestroy')).assertTrue();
      expect(service.stub !== undefined).assertTrue();
    });

    /**
     * @tc.name          protocolWorkflowAliveDuringLifecycle
     * @tc.desc          The alive predicate stays true until destruction.
     * @tc.precondition  A fresh lifecycle model.
     * @tc.steps         1. Read alive after create.
     *                   2. Read alive after connect and disconnect.
     *                   3. Read alive after destroy.
     * @tc.expected      Alive is true until the destroy callback.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('protocolWorkflowAliveDuringLifecycle', 0, () => {
      const service = freshService();
      expect(service.isAlive()).assertTrue();
      service.onCreate();
      expect(service.isAlive()).assertTrue();
      service.onConnect();
      expect(service.isAlive()).assertTrue();
      service.onDisconnect();
      expect(service.isAlive()).assertTrue();
      service.onDestroy();
      expect(service.isAlive()).assertFalse();
      expect(service.state === 'destroyed').assertTrue();
      expect(service.state === 'disconnected').assertFalse();
    });

    /**
     * @tc.name          protocolWorkflowEventsOrdered
     * @tc.desc          The event recorder preserves callback order exactly.
     * @tc.precondition  A service driven through create, request and connect.
     * @tc.steps         1. Drive the three callbacks.
     *                   2. Read each event entry.
     *                   3. Compare with the expected entries.
     * @tc.expected      Entries are onCreate, onRequest:3 and onConnect.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('protocolWorkflowEventsOrdered', 0, () => {
      const service = freshService();
      service.onCreate();
      service.onRequest(3);
      service.onConnect();
      expect(service.events.entries.length).assertEqual(3);
      expect(service.events.entries[0]).assertEqual('onCreate');
      expect(service.events.entries[1]).assertEqual('onRequest:3');
      expect(service.events.entries[2]).assertEqual('onConnect:IPCStubTest');
      expect(service.events.entries[0].startsWith('onCreate')).assertTrue();
      expect(service.events.entries[1].endsWith(':3')).assertTrue();
      expect(service.events.entries[2].indexOf(':')).assertEqual(9);
      expect(service.events.trace()).assertEqual(joined(service.events.entries, '>'));
    });

    /**
     * @tc.name          protocolWorkflowEventCounts
     * @tc.desc          Event counts reflect repeated lifecycle callbacks.
     * @tc.precondition  A service with two requests and one of each other callback.
     * @tc.steps         1. Drive the lifecycle.
     *                   2. Count each callback kind.
     *                   3. Compare with the expected totals.
     * @tc.expected      Request count is two and the others are one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('protocolWorkflowEventCounts', 0, () => {
      const service = freshService();
      service.onCreate();
      service.onRequest(1);
      service.onRequest(2);
      service.onConnect();
      service.onDisconnect();
      service.onDestroy();
      expect(service.events.countOf(EVENT_ON_CREATE)).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_REQUEST)).assertEqual(2);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_DISCONNECT)).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_DESTROY)).assertEqual(1);
      expect(service.events.size()).assertEqual(6);
      expect(service.requestCount).assertEqual(2);
      expect(service.events.entries.length).assertEqual(6);
    });

    /**
     * @tc.name          protocolWorkflowSnapshotMatches
     * @tc.desc          A snapshot after create and connect reports the live counters.
     * @tc.precondition  A connected service.
     * @tc.steps         1. Build a snapshot.
     *                   2. Read each field.
     *                   3. Compare with the service counters.
     * @tc.expected      The snapshot mirrors state and counters.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('protocolWorkflowSnapshotMatches', 0, () => {
      const service = connectedService();
      const snapshot = new ServiceSnapshot(service);
      expect(snapshot.state).assertEqual('connected');
      expect(snapshot.connects).assertEqual(1);
      expect(snapshot.disconnects).assertEqual(0);
      expect(snapshot.requests).assertEqual(0);
      expect(snapshot.destroys).assertEqual(0);
      expect(snapshot.describe()).assertEqual('connected/1/0/0/0');
      expect(snapshot.state).assertEqual(service.state);
      expect(snapshot.connects).assertEqual(service.connectCount);
    });

    /**
     * @tc.name          protocolWorkflowSnapshotAfterConnect
     * @tc.desc          A snapshot after a request reflects the request counter.
     * @tc.precondition  A connected service with one onRequest call.
     * @tc.steps         1. Call onRequest.
     *                   2. Build a snapshot.
     *                   3. Compare the requests field.
     * @tc.expected      The snapshot reports one request.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('protocolWorkflowSnapshotAfterConnect', 0, () => {
      const service = connectedService();
      service.onRequest(41);
      const snapshot = new ServiceSnapshot(service);
      expect(snapshot.requests).assertEqual(1);
      expect(snapshot.requests).assertEqual(service.requestCount);
      expect(snapshot.connects).assertEqual(1);
      expect(snapshot.state).assertEqual('connected');
      expect(snapshot.disconnects).assertEqual(0);
      expect(snapshot.destroys).assertEqual(0);
      expect(snapshot.describe()).assertEqual('connected/1/0/1/0');
      expect(service.events.last()).assertEqual('onRequest:41');
    });

    /**
     * @tc.name          protocolWorkflowSnapshotAfterDestroy
     * @tc.desc          A snapshot after destroy reports the terminal state.
     * @tc.precondition  A destroyed service.
     * @tc.steps         1. Connect, disconnect and destroy.
     *                   2. Build a snapshot.
     *                   3. Compare the state and counters.
     * @tc.expected      The snapshot reports destroyed with one of each teardown.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('protocolWorkflowSnapshotAfterDestroy', 0, () => {
      const service = connectedService();
      service.onDisconnect();
      service.onDestroy();
      const snapshot = new ServiceSnapshot(service);
      expect(snapshot.state).assertEqual('destroyed');
      expect(snapshot.connects).assertEqual(1);
      expect(snapshot.disconnects).assertEqual(1);
      expect(snapshot.destroys).assertEqual(1);
      expect(snapshot.requests).assertEqual(0);
      expect(snapshot.describe()).assertEqual('destroyed/1/1/0/1');
      expect(snapshot.state).assertEqual(service.state);
      expect(service.isAlive()).assertFalse();
    });

    /**
     * @tc.name          protocolWorkflowSnapshotEquality
     * @tc.desc          Two snapshots of the same service state compare equal.
     * @tc.precondition  A connected service with one request.
     * @tc.steps         1. Build two snapshots.
     *                   2. Compare them with sameAs.
     *                   3. Mutate the service and compare again.
     * @tc.expected      Equal snapshots agree and a later snapshot diverges.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('protocolWorkflowSnapshotEquality', 0, () => {
      const service = connectedService();
      service.onRequest(5);
      const first = new ServiceSnapshot(service);
      const second = new ServiceSnapshot(service);
      expect(first.sameAs(second)).assertTrue();
      expect(first.describe()).assertEqual(second.describe());
      service.onRequest(6);
      const third = new ServiceSnapshot(service);
      expect(first.sameAs(third)).assertFalse();
      expect(third.requests).assertEqual(2);
      expect(third.describe() === first.describe()).assertFalse();
      expect(first.sameAs(first)).assertTrue();
    });

    /**
     * @tc.name          protocolWorkflowRequestCountTracking
     * @tc.desc          onRequest increments the request counter each call.
     * @tc.precondition  A fresh lifecycle model.
     * @tc.steps         1. Call onRequest three times.
     *                   2. Compare the counter.
     *                   3. Compare the snapshot.
     * @tc.expected      The request counter and snapshot both report three.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('protocolWorkflowRequestCountTracking', 0, () => {
      const service = freshService();
      expect(service.requestCount).assertEqual(0);
      service.onRequest(1);
      service.onRequest(2);
      service.onRequest(3);
      expect(service.requestCount).assertEqual(3);
      expect(new ServiceSnapshot(service).requests).assertEqual(3);
      expect(service.events.countOf(EVENT_ON_REQUEST)).assertEqual(3);
      expect(service.logs.contains('onRequest 1')).assertTrue();
      expect(service.logs.contains('onRequest 3')).assertTrue();
      expect(service.events.last()).assertEqual('onRequest:3');
    });

    /**
     * @tc.name          protocolWorkflowConnectCountTracking
     * @tc.desc          onConnect increments the connect counter each call.
     * @tc.precondition  A fresh lifecycle model.
     * @tc.steps         1. Connect twice.
     *                   2. Compare the connect counter.
     *                   3. Compare the snapshot.
     * @tc.expected      The connect counter and snapshot both report two.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('protocolWorkflowConnectCountTracking', 0, () => {
      const service = freshService();
      service.onConnect();
      service.onConnect();
      expect(service.connectCount).assertEqual(2);
      expect(new ServiceSnapshot(service).connects).assertEqual(2);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(2);
      expect(service.stub !== undefined).assertTrue();
      expect(service.state).assertEqual('connected');
      expect(service.connectCount).assertEqual(service.events.countOf(EVENT_ON_CONNECT));
      expect(service.isAlive()).assertTrue();
    });

    /**
     * @tc.name          protocolWorkflowDisconnectCountTracking
     * @tc.desc          onDisconnect increments the disconnect counter each call.
     * @tc.precondition  A connected service.
     * @tc.steps         1. Disconnect twice.
     *                   2. Compare the counter.
     *                   3. Compare the snapshot.
     * @tc.expected      The disconnect counter and snapshot both report two.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('protocolWorkflowDisconnectCountTracking', 0, () => {
      const service = connectedService();
      service.onDisconnect();
      service.onDisconnect();
      expect(service.disconnectCount).assertEqual(2);
      expect(new ServiceSnapshot(service).disconnects).assertEqual(2);
      expect(service.events.countOf(EVENT_ON_DISCONNECT)).assertEqual(2);
      expect(service.state).assertEqual('disconnected');
      expect(service.destroyCount).assertEqual(0);
      expect(service.isAlive()).assertTrue();
      expect(service.events.last()).assertEqual(EVENT_ON_DISCONNECT);
    });

    /**
     * @tc.name          protocolWorkflowDestroyCountTracking
     * @tc.desc          onDestroy increments the destroy counter each call.
     * @tc.precondition  A fresh lifecycle model.
     * @tc.steps         1. Destroy twice.
     *                   2. Compare the counter.
     *                   3. Compare the snapshot.
     * @tc.expected      The destroy counter and snapshot both report two.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('protocolWorkflowDestroyCountTracking', 0, () => {
      const service = freshService();
      service.onDestroy();
      service.onDestroy();
      expect(service.destroyCount).assertEqual(2);
      expect(new ServiceSnapshot(service).destroys).assertEqual(2);
      expect(service.events.countOf(EVENT_ON_DESTROY)).assertEqual(2);
      expect(service.state).assertEqual('destroyed');
      expect(service.isAlive()).assertFalse();
      expect(service.events.last()).assertEqual(EVENT_ON_DESTROY);
      expect(service.logs.contains('onDestroy')).assertTrue();
    });
    /**
     * @tc.name          protocolWorkflowResetClearsLifecycle
     * @tc.desc          Resetting a destroyed service returns it to the idle state.
     * @tc.precondition  A destroyed service.
     * @tc.steps         1. Destroy the service.
     *                   2. Reset it.
     *                   3. Compare state and counters.
     * @tc.expected      The service is idle, alive and fully zeroed.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('protocolWorkflowResetClearsLifecycle', 0, () => {
      const service = connectedService();
      service.onRequest(1);
      service.onDisconnect();
      service.onDestroy();
      expect(service.isAlive()).assertFalse();
      service.reset();
      expect(service.state).assertEqual('idle');
      expect(service.isAlive()).assertTrue();
      expect(service.connectCount).assertEqual(0);
      expect(service.disconnectCount).assertEqual(0);
      expect(service.requestCount).assertEqual(0);
      expect(service.destroyCount).assertEqual(0);
      expect(service.stub === undefined).assertTrue();
    });

    /**
     * @tc.name          protocolWorkflowResetClearsEvents
     * @tc.desc          Reset clears the recorded lifecycle events.
     * @tc.precondition  A service with several events.
     * @tc.steps         1. Drive four callbacks.
     *                   2. Reset.
     *                   3. Read the event recorder.
     * @tc.expected      The event recorder is empty after the reset.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('protocolWorkflowResetClearsEvents', 0, () => {
      const service = connectedService();
      service.onRequest(2);
      service.onDisconnect();
      expect(service.events.size()).assertEqual(4);
      service.reset();
      expect(service.events.size()).assertEqual(0);
      expect(service.events.entries.length).assertEqual(0);
      expect(service.events.trace()).assertEqual('');
      expect(service.events.last()).assertEqual('');
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(0);
      expect(service.events.fingerprint()).assertEqual(textFingerprint(''));
      expect(service.events.countOf(EVENT_ON_REQUEST)).assertEqual(0);
    });

    /**
     * @tc.name          protocolWorkflowResetClearsLogs
     * @tc.desc          Reset clears the bounded service log buffer.
     * @tc.precondition  A service with several log lines.
     * @tc.steps         1. Drive the lifecycle.
     *                   2. Reset.
     *                   3. Read the logs.
     * @tc.expected      No log lines or levels remain.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('protocolWorkflowResetClearsLogs', 0, () => {
      const service = connectedService();
      service.onRequest(4);
      expect(service.logs.size()).assertEqual(3);
      expect(service.logs.countLevel(LEVEL_INFO)).assertEqual(3);
      service.reset();
      expect(service.logs.size()).assertEqual(0);
      expect(service.logs.lines.length).assertEqual(0);
      expect(service.logs.levels.length).assertEqual(0);
      expect(service.logs.countLevel(LEVEL_INFO)).assertEqual(0);
      expect(service.logs.contains('onCreate')).assertFalse();
      expect(service.logs.trace()).assertEqual('');
    });

    /**
     * @tc.name          protocolWorkflowClientRequestReplyLoop
     * @tc.desc          A client request/reply loop over the connected stub succeeds.
     * @tc.precondition  A connected service and its stub.
     * @tc.steps         1. Send code 1 three times through a client.
     *                   2. Compare handled count.
     *                   3. Compare the reply trace.
     * @tc.expected      Three successes and three identical replies.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('protocolWorkflowClientRequestReplyLoop', 0, () => {
      const service = connectedService();
      const client = new InProcessClient(connectedStub(service));
      const handled = client.sendMany(3, REQUEST_CODE);
      expect(handled).assertEqual(3);
      expect(client.stub.requestCount()).assertEqual(3);
      expect(client.replies.length).assertEqual(3);
      expect(client.trace()).assertEqual('hello rpc|hello rpc|hello rpc');
      expect(countOf(client.replies, REPLY_PAYLOAD)).assertEqual(3);
      expect(StubMetrics.from(client.stub).successRatio()).assertEqual(1);
      expect(service.connectCount).assertEqual(1);
      expect(service.requestCount).assertEqual(0);
    });

    /**
     * @tc.name          protocolWorkflowMultipleRequestsInWorkflow
     * @tc.desc          Several requests inside one connect session all reach the stub.
     * @tc.precondition  A connected service.
     * @tc.steps         1. Send 1, 1, 0 and 1 through a client.
     *                   2. Compare metrics.
     *                   3. Compare the workflow counters.
     * @tc.expected      Three successes and one rejection appear without lifecycle changes.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('protocolWorkflowMultipleRequestsInWorkflow', 0, () => {
      const service = connectedService();
      const client = new InProcessClient(connectedStub(service));
      const codes: number[] = [1, 1, 0, 1];
      for (let index = 0; index < codes.length; index++) {
        client.send(codes[index], REQUEST_PAYLOAD);
      }
      const metrics = StubMetrics.from(client.stub);
      expect(metrics.requests).assertEqual(4);
      expect(metrics.handled).assertEqual(3);
      expect(metrics.rejected).assertEqual(1);
      expect(metrics.replies).assertEqual(3);
      expect(client.replies.length).assertEqual(3);
      expect(service.connectCount).assertEqual(1);
      expect(service.events.size()).assertEqual(2);
      expect(service.state).assertEqual('connected');
    });

    /**
     * @tc.name          protocolWorkflowUnknownInterleaved
     * @tc.desc          Unknown codes interleaved with successes do not disturb the workflow.
     * @tc.precondition  A connected service.
     * @tc.steps         1. Send 2, 1, 99 and 1.
     *                   2. Compare the reply trace.
     *                   3. Compare the stub ledger.
     * @tc.expected      Two successes remain and two rejections are recorded.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('protocolWorkflowUnknownInterleaved', 0, () => {
      const service = connectedService();
      const client = new InProcessClient(connectedStub(service));
      const codes: number[] = [UNKNOWN_CODE_TWO, REQUEST_CODE, UNKNOWN_CODE_LARGE, REQUEST_CODE];
      for (let index = 0; index < codes.length; index++) {
        client.send(codes[index], REQUEST_PAYLOAD);
      }
      expect(client.replies.length).assertEqual(2);
      expect(client.trace()).assertEqual('hello rpc|hello rpc');
      expect(client.stub.requests.length).assertEqual(4);
      expect(client.stub.requests[0].handled).assertFalse();
      expect(client.stub.requests[1].handled).assertTrue();
      expect(client.stub.requests[2].handled).assertFalse();
      expect(client.stub.requests[3].handled).assertTrue();
      expect(StubMetrics.from(client.stub).successRatio()).assertEqual(0.5);
    });

    /**
     * @tc.name          protocolWorkflowLastReplyInWorkflow
     * @tc.desc          The last successful reply is visible after an unknown tail.
     * @tc.precondition  A connected service with mixed traffic.
     * @tc.steps         1. Send code 1 then code 0.
     *                   2. Read the last result.
     *                   3. Compare the reply trace.
     * @tc.expected      The trace keeps 'hello rpc' while the last result fails.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('protocolWorkflowLastReplyInWorkflow', 0, () => {
      const service = connectedService();
      const client = new InProcessClient(connectedStub(service));
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      const last = client.send(UNKNOWN_CODE_ZERO, REQUEST_PAYLOAD);
      expect(last.isSuccess()).assertFalse();
      expect(last.replyText).assertEqual('');
      expect(client.replies.length).assertEqual(1);
      expect(client.replies[0]).assertEqual(REPLY_PAYLOAD);
      expect(client.trace()).assertEqual(REPLY_PAYLOAD);
      expect(client.stub.requests[0].handled).assertTrue();
      expect(client.stub.requests[1].handled).assertFalse();
      expect(service.stub !== undefined).assertTrue();
    });

    /**
     * @tc.name          protocolWorkflowMetricsAfterWorkflow
     * @tc.desc          Metrics after a workflow match the independent history counts.
     * @tc.precondition  A connected service with five requests.
     * @tc.steps         1. Send 1, 0, 1, 2 and 1.
     *                   2. Build metrics.
     *                   3. Compare each counter.
     * @tc.expected      Three handled, two rejected and three replies.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('protocolWorkflowMetricsAfterWorkflow', 0, () => {
      const service = connectedService();
      const client = new InProcessClient(connectedStub(service));
      const codes: number[] = [1, 0, 1, 2, 1];
      for (let index = 0; index < codes.length; index++) {
        client.send(codes[index], REQUEST_PAYLOAD);
      }
      const metrics = StubMetrics.from(client.stub);
      expect(metrics.requests).assertEqual(5);
      expect(metrics.handled).assertEqual(3);
      expect(metrics.rejected).assertEqual(2);
      expect(metrics.replies).assertEqual(3);
      expect(metrics.successRatio()).assertEqual(0.6);
      expect(client.stub.requestCount()).assertEqual(metrics.requests);
      expect(client.replies.length).assertEqual(metrics.replies);
      expect(service.state).assertEqual('connected');
    });
    /**
     * @tc.name          protocolWorkflowStubFromConnectIsFresh
     * @tc.desc          The stub returned by onConnect starts with an empty ledger.
     * @tc.precondition  A connected service.
     * @tc.steps         1. Connect.
     *                   2. Inspect the stub.
     *                   3. Compare its defaults.
     * @tc.expected      The stub has no requests, a default reply and is alive.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('protocolWorkflowStubFromConnectIsFresh', 0, () => {
      const service = connectedService();
      const stub = connectedStub(service);
      expect(stub.requestCount()).assertEqual(0);
      expect(stub.requests.length).assertEqual(0);
      expect(stub.lastRequest() === undefined).assertTrue();
      expect(stub.replyText).assertEqual(REPLY_PAYLOAD);
      expect(stub.alive).assertTrue();
      expect(stub.rejectCodes.length).assertEqual(0);
      expect(stub.descriptor).assertEqual(STUB_DESCRIPTOR);
    });

    /**
     * @tc.name          protocolWorkflowSecondConnectNewStub
     * @tc.desc          Each onConnect call returns a new independent stub.
     * @tc.precondition  A service with one completed request.
     * @tc.steps         1. Connect and send code 1.
     *                   2. Connect again.
     *                   3. Compare both stubs.
     * @tc.expected      The second stub is distinct and starts with an empty ledger.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('protocolWorkflowSecondConnectNewStub', 0, () => {
      const service = freshService();
      const first = service.onConnect();
      new InProcessClient(first).send(REQUEST_CODE, 'first session');
      expect(first.requestCount()).assertEqual(1);
      const second = service.onConnect();
      expect(first === second).assertFalse();
      expect(service.connectCount).assertEqual(2);
      expect(service.stub === second).assertTrue();
      expect(second.requestCount()).assertEqual(0);
      expect(first.requestCount()).assertEqual(1);
      expect(first.descriptor).assertEqual(second.descriptor);
    });

    /**
     * @tc.name          protocolWorkflowDisconnectDoesNotKillStub
     * @tc.desc          Disconnecting the service leaves the stub usable.
     * @tc.precondition  A connected service.
     * @tc.steps         1. Disconnect.
     *                   2. Send code 1 through the retained stub.
     *                   3. Compare the result.
     * @tc.expected      The stub stays alive and still replies.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('protocolWorkflowDisconnectDoesNotKillStub', 0, () => {
      const service = connectedService();
      const stub = connectedStub(service);
      service.onDisconnect();
      expect(service.state).assertEqual('disconnected');
      expect(stub.alive).assertTrue();
      const result = new InProcessClient(stub).send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(result.isSuccess()).assertTrue();
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(stub.requestCount()).assertEqual(1);
      expect(service.requestCount).assertEqual(0);
      expect(service.isAlive()).assertTrue();
      expect(service.disconnectCount).assertEqual(1);
    });

    /**
     * @tc.name          protocolWorkflowStubUsableAfterServiceDestroy
     * @tc.desc          The retained stub object still serves requests after destroy.
     * @tc.precondition  A destroyed service with a retained stub.
     * @tc.steps         1. Destroy the service.
     *                   2. Send code 1 through the retained stub.
     *                   3. Compare the service and stub states.
     * @tc.expected      The service is destroyed while the stub still replies.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('protocolWorkflowStubUsableAfterServiceDestroy', 0, () => {
      const service = connectedService();
      const stub = connectedStub(service);
      service.onDestroy();
      expect(service.state).assertEqual('destroyed');
      expect(service.isAlive()).assertFalse();
      expect(stub.alive).assertTrue();
      const result = new InProcessClient(stub).send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(stub.requestCount()).assertEqual(1);
      expect(stub.requests[0].handled).assertTrue();
      expect(service.destroyCount).assertEqual(1);
      expect(service.events.last()).assertEqual(EVENT_ON_DESTROY);
    });

    /**
     * @tc.name          protocolWorkflowLifecycleFingerprint
     * @tc.desc          Identical lifecycle traces share one fingerprint.
     * @tc.precondition  Two services driven identically.
     * @tc.steps         1. Drive create and connect on both.
     *                   2. Fingerprint both traces.
     *                   3. Compare with the literal chain hash.
     * @tc.expected      Both fingerprints are identical and positive.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('protocolWorkflowLifecycleFingerprint', 0, () => {
      const first = connectedService();
      const second = connectedService();
      const firstTrace = first.events.trace();
      const secondTrace = second.events.trace();
      expect(firstTrace).assertEqual('onCreate>onConnect:IPCStubTest');
      expect(firstTrace).assertEqual(secondTrace);
      expect(first.events.fingerprint()).assertEqual(second.events.fingerprint());
      expect(first.events.fingerprint()).assertEqual(textFingerprint(firstTrace));
      expect(first.events.fingerprint()).assertLarger(0);
      expect(second.events.size()).assertEqual(2);
      expect(first.events.size()).assertEqual(2);
      expect(firstTrace.length).assertEqual(30);
    });

    /**
     * @tc.name          protocolWorkflowLogsContainEvents
     * @tc.desc          The service log buffer records each callback name.
     * @tc.precondition  A service driven through create and connect.
     * @tc.steps         1. Drive both callbacks.
     *                   2. Search the logs.
     *                   3. Compare the log count.
     * @tc.expected      Both callback names appear in the logs.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('protocolWorkflowLogsContainEvents', 0, () => {
      const service = connectedService();
      expect(service.logs.contains('onCreate')).assertTrue();
      expect(service.logs.contains('onConnect')).assertTrue();
      expect(service.logs.contains('onDestroy')).assertFalse();
      expect(service.logs.size()).assertEqual(2);
      expect(service.logs.lines[0]).assertContain('onCreate');
      expect(service.logs.lines[1]).assertEqual('INFO onConnect');
      expect(service.logs.countLevel(LEVEL_INFO)).assertEqual(2);
      expect(service.logs.trace()).assertEqual('INFO onCreate|INFO onConnect');
    });

    /**
     * @tc.name          protocolWorkflowLogCounts
     * @tc.desc          The log buffer counts one info line per callback.
     * @tc.precondition  A service driven through four callbacks.
     * @tc.steps         1. Drive create, request, connect and disconnect.
     *                   2. Count info-level lines.
     *                   3. Compare with the event count.
     * @tc.expected      Four info lines match four events.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('protocolWorkflowLogCounts', 0, () => {
      const service = connectedService();
      service.onRequest(11);
      service.onDisconnect();
      expect(service.logs.size()).assertEqual(4);
      expect(service.logs.countLevel(LEVEL_INFO)).assertEqual(4);
      expect(service.logs.countLevel(LEVEL_WARN)).assertEqual(0);
      expect(service.logs.size()).assertEqual(service.events.size());
      expect(service.logs.contains('onRequest 11')).assertTrue();
      expect(service.logs.contains('onDisconnect')).assertTrue();
      expect(service.logs.lines.length).assertEqual(4);
      expect(service.logs.levels.length).assertEqual(4);
    });

    /**
     * @tc.name          protocolWorkflowEventLast
     * @tc.desc          events.last follows the most recent lifecycle callback.
     * @tc.precondition  A service driven step by step.
     * @tc.steps         1. Read last after create.
     *                   2. Read last after connect.
     *                   3. Read last after destroy.
     * @tc.expected      The last event tracks each callback.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('protocolWorkflowEventLast', 0, () => {
      const service = freshService();
      expect(service.events.last()).assertEqual('');
      service.onCreate();
      expect(service.events.last()).assertEqual(EVENT_ON_CREATE);
      service.onConnect();
      expect(service.events.last()).assertEqual('onConnect:IPCStubTest');
      service.onDisconnect();
      expect(service.events.last()).assertEqual(EVENT_ON_DISCONNECT);
      service.onDestroy();
      expect(service.events.last()).assertEqual(EVENT_ON_DESTROY);
      expect(service.events.size()).assertEqual(4);
      expect(service.events.last()).assertEqual(service.events.entries[3]);
    });

    /**
     * @tc.name          protocolWorkflowOnRequestStartIdRecorded
     * @tc.desc          The onRequest event stores the start id as detail.
     * @tc.precondition  A fresh lifecycle model.
     * @tc.steps         1. Call onRequest with start id 42.
     *                   2. Read the last event.
     *                   3. Compare the detail suffix.
     * @tc.expected      The event reads onRequest:42.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('protocolWorkflowOnRequestStartIdRecorded', 0, () => {
      const service = freshService();
      service.onRequest(42);
      expect(service.events.last()).assertEqual('onRequest:42');
      expect(service.events.last().endsWith(':42')).assertTrue();
      expect(service.events.last().startsWith('onRequest')).assertTrue();
      expect(service.events.countOf(EVENT_ON_REQUEST)).assertEqual(1);
      expect(service.requestCount).assertEqual(1);
      expect(service.logs.contains('onRequest 42')).assertTrue();
      expect(service.events.entries[0]).assertEqual('onRequest:42');
      expect(service.events.trace()).assertEqual('onRequest:42');
    });

    /**
     * @tc.name          protocolWorkflowMultipleOnRequest
     * @tc.desc          Multiple onRequest calls keep distinct start ids in order.
     * @tc.precondition  A fresh lifecycle model.
     * @tc.steps         1. Call onRequest with 1, 5 and 9.
     *                   2. Read the event entries.
     *                   3. Compare each detail.
     * @tc.expected      The entries read onRequest:1, onRequest:5 and onRequest:9.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('protocolWorkflowMultipleOnRequest', 0, () => {
      const service = freshService();
      service.onRequest(1);
      service.onRequest(5);
      service.onRequest(9);
      expect(service.events.size()).assertEqual(3);
      expect(service.events.entries[0]).assertEqual('onRequest:1');
      expect(service.events.entries[1]).assertEqual('onRequest:5');
      expect(service.events.entries[2]).assertEqual('onRequest:9');
      expect(service.events.trace()).assertEqual('onRequest:1>onRequest:5>onRequest:9');
      expect(service.requestCount).assertEqual(3);
      expect(service.events.countOf(EVENT_ON_REQUEST)).assertEqual(3);
      expect(service.logs.contains('onRequest 9')).assertTrue();
      expect(service.state).assertEqual('idle');
    });

    /**
     * @tc.name          protocolWorkflowSnapshotDescribe
     * @tc.desc          ServiceSnapshot.describe joins all five counters.
     * @tc.precondition  A service with known counters.
     * @tc.steps         1. Drive create, two requests, connect, disconnect and destroy.
     *                   2. Build a snapshot.
     *                   3. Compare the description.
     * @tc.expected      The description reads destroyed/1/1/2/1.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('protocolWorkflowSnapshotDescribe', 0, () => {
      const service = freshService();
      service.onCreate();
      service.onRequest(1);
      service.onRequest(2);
      service.onConnect();
      service.onDisconnect();
      service.onDestroy();
      const snapshot = new ServiceSnapshot(service);
      expect(snapshot.describe()).assertEqual('destroyed/1/1/2/1');
      expect(snapshot.describe().split('/').length).assertEqual(5);
      expect(snapshot.state).assertEqual('destroyed');
      expect(snapshot.requests).assertEqual(2);
      expect(snapshot.describe()).assertContain('/2/');
      expect(snapshot.sameAs(new ServiceSnapshot(service))).assertTrue();
      expect(snapshot.destroys).assertEqual(1);
      expect(snapshot.connects).assertEqual(snapshot.disconnects);
    });

    /**
     * @tc.name          protocolWorkflowConnectThenDisconnectCounts
     * @tc.desc          Connect and disconnect counters stay balanced across a cycle.
     * @tc.precondition  A fresh lifecycle model.
     * @tc.steps         1. Connect and disconnect twice.
     *                   2. Compare both counters.
     *                   3. Read the snapshot.
     * @tc.expected      Both counters reach two and the state is disconnected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('protocolWorkflowConnectThenDisconnectCounts', 0, () => {
      const service = freshService();
      service.onConnect();
      service.onDisconnect();
      service.onConnect();
      service.onDisconnect();
      expect(service.connectCount).assertEqual(2);
      expect(service.disconnectCount).assertEqual(2);
      expect(service.connectCount).assertEqual(service.disconnectCount);
      expect(service.state).assertEqual('disconnected');
      const snapshot = new ServiceSnapshot(service);
      expect(snapshot.connects).assertEqual(2);
      expect(snapshot.disconnects).assertEqual(2);
      expect(snapshot.requests).assertEqual(0);
      expect(service.events.size()).assertEqual(4);
    });

    /**
     * @tc.name          protocolWorkflowClientTraceAfterWorkflow
     * @tc.desc          The client reply trace summarises the request phase.
     * @tc.precondition  A connected service with a mixed client history.
     * @tc.steps         1. Send 1, 2 and 1.
     *                   2. Read the trace.
     *                   3. Compare with the replies.
     * @tc.expected      The trace holds two replies joined by a pipe.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('protocolWorkflowClientTraceAfterWorkflow', 0, () => {
      const service = connectedService();
      const client = new InProcessClient(connectedStub(service));
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      client.send(UNKNOWN_CODE_TWO, REQUEST_PAYLOAD);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(client.trace()).assertEqual('hello rpc|hello rpc');
      expect(client.trace()).assertEqual(joined(client.replies, '|'));
      expect(client.trace().split('|').length).assertEqual(2);
      expect(client.replies.length).assertEqual(2);
      expect(client.results.length).assertEqual(3);
      expect(client.stub.requestCount()).assertEqual(3);
      expect(service.connectCount).assertEqual(1);
      expect(service.state).assertEqual('connected');
    });

    /**
     * @tc.name          protocolWorkflowWorkflowReplayStable
     * @tc.desc          Two identical workflows produce identical snapshots and traces.
     * @tc.precondition  Two fresh services.
     * @tc.steps         1. Run the same workflow on both.
     *                   2. Compare snapshots.
     *                   3. Compare event fingerprints.
     * @tc.expected      Both workflows match exactly.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('protocolWorkflowWorkflowReplayStable', 0, () => {
      const first = connectedService();
      const second = connectedService();
      const firstClient = new InProcessClient(connectedStub(first));
      const secondClient = new InProcessClient(connectedStub(second));
      firstClient.send(REQUEST_CODE, REQUEST_PAYLOAD);
      secondClient.send(REQUEST_CODE, REQUEST_PAYLOAD);
      const firstSnapshot = new ServiceSnapshot(first);
      const secondSnapshot = new ServiceSnapshot(second);
      expect(firstSnapshot.sameAs(secondSnapshot)).assertTrue();
      expect(firstSnapshot.describe()).assertEqual(secondSnapshot.describe());
      expect(first.events.fingerprint()).assertEqual(second.events.fingerprint());
      expect(firstClient.trace()).assertEqual(secondClient.trace());
      expect(firstClient.stub.requestCount()).assertEqual(secondClient.stub.requestCount());
      expect(StubMetrics.from(firstClient.stub).fingerprint())
        .assertEqual(StubMetrics.from(secondClient.stub).fingerprint());
      expect(firstSnapshot.describe()).assertEqual('connected/1/0/0/0');
    });

    /**
     * @tc.name          protocolWorkflowWorkflowIndependentServices
     * @tc.desc          Two services never share lifecycle counters or stubs.
     * @tc.precondition  Two fresh services.
     * @tc.steps         1. Connect only the first.
     *                   2. Send a request on the second stub.
     *                   3. Compare both services.
     * @tc.expected      The first has one connect and no requests, the second the reverse.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('protocolWorkflowWorkflowIndependentServices', 0, () => {
      const first = freshService();
      const second = freshService();
      const firstStub = first.onConnect();
      const secondStub = second.onConnect();
      new InProcessClient(secondStub).send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(first.connectCount).assertEqual(1);
      expect(second.connectCount).assertEqual(1);
      expect(first.stub === second.stub).assertFalse();
      expect(first.stub !== undefined).assertTrue();
      expect(firstStub.requestCount()).assertEqual(0);
      expect(secondStub.requestCount()).assertEqual(1);
      expect(first.events.size()).assertEqual(1);
      expect(second.events.size()).assertEqual(1);
    });

    /**
     * @tc.name          protocolWorkflowReplyContractInWorkflow
     * @tc.desc          The reply contract holds when driven through the workflow.
     * @tc.precondition  A connected service.
     * @tc.steps         1. Send code 1 with a long payload.
     *                   2. Compare the reply.
     *                   3. Compare the ledger reply copy.
     * @tc.expected      The reply is 'hello rpc' with length 9.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('protocolWorkflowReplyContractInWorkflow', 0, () => {
      const service = connectedService();
      let payload = '';
      for (let index = 0; index < 10; index++) {
        payload = payload + 'workflow payload ';
      }
      const client = new InProcessClient(connectedStub(service));
      const result = client.send(REQUEST_CODE, payload);
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(result.replyText.length).assertEqual(9);
      expect(result.replyText).assertEqual('hello rpc');
      expect(client.stub.requests[0].replyText).assertEqual(REPLY_PAYLOAD);
      expect(client.stub.requests[0].text.length).assertEqual(payload.length);
      expect(payload.length).assertEqual(170);
      expect(result.isSuccess()).assertTrue();
      expect(service.state).assertEqual('connected');
    });
    /**
     * @tc.name          protocolWorkflowUnknownCodeInWorkflow
     * @tc.desc          An unknown code inside the workflow is refused cleanly.
     * @tc.precondition  A connected service.
     * @tc.steps         1. Send code 99 through a client.
     *                   2. Compare the result and ledger.
     *                   3. Confirm the lifecycle is unchanged.
     * @tc.expected      The request fails without affecting the service.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('protocolWorkflowUnknownCodeInWorkflow', 0, () => {
      const service = connectedService();
      const client = new InProcessClient(connectedStub(service));
      const result = client.send(UNKNOWN_CODE_LARGE, REQUEST_PAYLOAD);
      expect(result.handled).assertFalse();
      expect(result.replyText).assertEqual('');
      expect(result.errCode).assertEqual(ERROR_STUB_REJECTED);
      expect(client.replies.length).assertEqual(0);
      expect(client.trace()).assertEqual('');
      expect(service.state).assertEqual('connected');
      expect(service.connectCount).assertEqual(1);
      expect(service.isAlive()).assertTrue();
    });

    /**
     * @tc.name          protocolWorkflowErrorCodeInWorkflow
     * @tc.desc          Error codes in the workflow follow the code, not the lifecycle.
     * @tc.precondition  A connected service.
     * @tc.steps         1. Send 1, 0 and 1.
     *                   2. Read the error code sequence.
     *                   3. Compare with the constants.
     * @tc.expected      The codes are success, rejection and success.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('protocolWorkflowErrorCodeInWorkflow', 0, () => {
      const service = connectedService();
      const client = new InProcessClient(connectedStub(service));
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      client.send(UNKNOWN_CODE_ZERO, REQUEST_PAYLOAD);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(client.results.length).assertEqual(3);
      expect(client.results[0].errCode).assertEqual(ERROR_NONE);
      expect(client.results[1].errCode).assertEqual(ERROR_STUB_REJECTED);
      expect(client.results[2].errCode).assertEqual(ERROR_NONE);
      expect(client.results[0].errCode === client.results[2].errCode).assertTrue();
      expect(client.replies.length).assertEqual(2);
      expect(service.state).assertEqual('connected');
      expect(service.requestCount).assertEqual(0);
    });

    /**
     * @tc.name          protocolWorkflowDescriptorThroughConnect
     * @tc.desc          The descriptor returned by onConnect matches the constant.
     * @tc.precondition  A fresh lifecycle model.
     * @tc.steps         1. Connect.
     *                   2. Read the stub descriptor.
     *                   3. Compare with the production literal.
     * @tc.expected      The descriptor is IPCStubTest.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('protocolWorkflowDescriptorThroughConnect', 0, () => {
      const service = freshService();
      const stub = service.onConnect();
      expect(stub.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(stub.descriptor).assertEqual('IPCStubTest');
      expect(stub.descriptor.length).assertEqual(11);
      expect(stub.descriptor.startsWith('IPC')).assertTrue();
      expect(stub.descriptor.endsWith('Test')).assertTrue();
      expect(service.stub !== undefined).assertTrue();
      expect(stub.descriptor).assertEqual(expectedDescriptor());
      expect(stub.descriptor === 'IPCClientTest').assertFalse();
    });

    /**
     * @tc.name          protocolWorkflowStubRequestsAfterDisconnect
     * @tc.desc          Requests after disconnect are recorded on the old stub.
     * @tc.precondition  A disconnected service with a retained stub.
     * @tc.steps         1. Disconnect.
     *                   2. Send code 1 twice.
     *                   3. Compare the ledger and service counters.
     * @tc.expected      The stub records two requests while the service counters stay unchanged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('protocolWorkflowStubRequestsAfterDisconnect', 0, () => {
      const service = connectedService();
      const stub = connectedStub(service);
      service.onDisconnect();
      const client = new InProcessClient(stub);
      client.send(REQUEST_CODE, 'after one');
      client.send(REQUEST_CODE, 'after two');
      expect(stub.requestCount()).assertEqual(2);
      expect(stub.requests[0].text).assertEqual('after one');
      expect(stub.requests[1].text).assertEqual('after two');
      expect(service.requestCount).assertEqual(0);
      expect(service.disconnectCount).assertEqual(1);
      expect(client.replies.length).assertEqual(2);
      expect(StubMetrics.from(stub).successRatio()).assertEqual(1);
    });

    /**
     * @tc.name          protocolWorkflowStubRequestsAfterDestroy
     * @tc.desc          Mixed traffic after destroy is still captured by the stub.
     * @tc.precondition  A destroyed service with a retained stub.
     * @tc.steps         1. Destroy the service.
     *                   2. Send code 1 and 2.
     *                   3. Compare the stub metrics.
     * @tc.expected      The stub reports one handled and one rejected request.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('protocolWorkflowStubRequestsAfterDestroy', 0, () => {
      const service = connectedService();
      const stub = connectedStub(service);
      service.onDestroy();
      const client = new InProcessClient(stub);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      client.send(UNKNOWN_CODE_TWO, REQUEST_PAYLOAD);
      const metrics = StubMetrics.from(stub);
      expect(metrics.requests).assertEqual(2);
      expect(metrics.handled).assertEqual(1);
      expect(metrics.rejected).assertEqual(1);
      expect(metrics.replies).assertEqual(1);
      expect(service.isAlive()).assertFalse();
      expect(service.destroyCount).assertEqual(1);
      expect(stub.alive).assertTrue();
      expect(client.trace()).assertEqual(REPLY_PAYLOAD);
    });

    /**
     * @tc.name          protocolWorkflowServiceStateTransitions
     * @tc.desc          The service state follows idle, created, connected, disconnected, destroyed.
     * @tc.precondition  A fresh lifecycle model.
     * @tc.steps         1. Read the state after each callback.
     *                   2. Collect the five states.
     *                   3. Compare with the expected chain.
     * @tc.expected      The states follow the documented lifecycle order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('protocolWorkflowServiceStateTransitions', 0, () => {
      const service = freshService();
      const states: string[] = [];
      states.push(service.state);
      service.onCreate();
      states.push(service.state);
      service.onConnect();
      states.push(service.state);
      service.onDisconnect();
      states.push(service.state);
      service.onDestroy();
      states.push(service.state);
      expect(states.length).assertEqual(5);
      expect(states[0]).assertEqual('idle');
      expect(states[1]).assertEqual('created');
      expect(states[2]).assertEqual('connected');
      expect(states[3]).assertEqual('disconnected');
      expect(states[4]).assertEqual('destroyed');
      expect(joined(states, '>')).assertEqual('idle>created>connected>disconnected>destroyed');
      expect(service.isAlive()).assertFalse();
    });

    /**
     * @tc.name          protocolWorkflowSnapshotBeforeAnything
     * @tc.desc          A pristine service snapshot reports the idle zero state.
     * @tc.precondition  A fresh lifecycle model.
     * @tc.steps         1. Build a snapshot immediately.
     *                   2. Read each field.
     *                   3. Compare with the zero description.
     * @tc.expected      The snapshot is idle/0/0/0/0.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('protocolWorkflowSnapshotBeforeAnything', 0, () => {
      const service = freshService();
      const snapshot = new ServiceSnapshot(service);
      expect(snapshot.state).assertEqual('idle');
      expect(snapshot.connects).assertEqual(0);
      expect(snapshot.disconnects).assertEqual(0);
      expect(snapshot.requests).assertEqual(0);
      expect(snapshot.destroys).assertEqual(0);
      expect(snapshot.describe()).assertEqual('idle/0/0/0/0');
      expect(service.isAlive()).assertTrue();
      expect(service.events.size()).assertEqual(0);
    });

    /**
     * @tc.name          protocolWorkflowEventTraceJoin
     * @tc.desc          The event trace is the joined entries with '>' separators.
     * @tc.precondition  A service with three events.
     * @tc.steps         1. Drive create, request and connect.
     *                   2. Read the trace.
     *                   3. Compare with a manual join.
     * @tc.expected      The trace equals the joined entry list.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('protocolWorkflowEventTraceJoin', 0, () => {
      const service = freshService();
      service.onCreate();
      service.onRequest(8);
      service.onConnect();
      expect(service.events.trace()).assertEqual(joined(service.events.entries, '>'));
      expect(service.events.trace()).assertEqual('onCreate>onRequest:8>onConnect:IPCStubTest');
      expect(service.events.trace().split('>').length).assertEqual(3);
      expect(service.events.trace().indexOf('>')).assertEqual(8);
      expect(service.events.trace().lastIndexOf('>')).assertEqual(20);
      expect(service.events.entries.length).assertEqual(3);
      expect(service.events.size()).assertEqual(3);
      expect(service.events.fingerprint()).assertEqual(textFingerprint(service.events.trace()));
    });

    /**
     * @tc.name          protocolWorkflowLogLevels
     * @tc.desc          Every lifecycle callback logs exactly one info line.
     * @tc.precondition  A service with five callbacks.
     * @tc.steps         1. Drive the full lifecycle.
     *                   2. Count info and other levels.
     *                   3. Compare with the event count.
     * @tc.expected      Five info lines and no warning or error lines exist.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('protocolWorkflowLogLevels', 0, () => {
      const service = freshService();
      service.onCreate();
      service.onRequest(3);
      service.onConnect();
      service.onDisconnect();
      service.onDestroy();
      expect(service.logs.countLevel(LEVEL_INFO)).assertEqual(5);
      expect(service.logs.countLevel(LEVEL_WARN)).assertEqual(0);
      expect(service.logs.size()).assertEqual(5);
      expect(service.logs.size()).assertEqual(service.events.size());
      expect(service.logs.levels.length).assertEqual(5);
      expect(service.logs.contains('INFO onCreate')).assertTrue();
      expect(service.logs.contains('onRequest 3')).assertTrue();
      expect(service.logs.contains('onDestroy')).assertTrue();
    });

    /**
     * @tc.name          protocolWorkflowClientSendManyInWorkflow
     * @tc.desc          sendMany inside the workflow returns the handled count.
     * @tc.precondition  A connected service.
     * @tc.steps         1. Call sendMany with count 3.
     *                   2. Compare the return value.
     *                   3. Compare the stub ledger.
     * @tc.expected      Three requests are handled and recorded.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('protocolWorkflowClientSendManyInWorkflow', 0, () => {
      const service = connectedService();
      const client = new InProcessClient(connectedStub(service));
      const handled = client.sendMany(3, REQUEST_CODE);
      expect(handled).assertEqual(3);
      expect(client.stub.requestCount()).assertEqual(3);
      expect(client.results.length).assertEqual(3);
      expect(client.replies.length).assertEqual(3);
      expect(StubMetrics.from(client.stub).handled).assertEqual(3);
      expect(StubMetrics.from(client.stub).rejected).assertEqual(0);
      expect(service.connectCount).assertEqual(1);
      expect(service.state).assertEqual('connected');
    });

    /**
     * @tc.name          protocolWorkflowResetThenWorkflowAgain
     * @tc.desc          A reset service can run the whole workflow again.
     * @tc.precondition  A destroyed service.
     * @tc.steps         1. Destroy the service.
     *                   2. Reset it.
     *                   3. Connect and request again.
     * @tc.expected      The second workflow starts from a clean state and succeeds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('protocolWorkflowResetThenWorkflowAgain', 0, () => {
      const service = connectedService();
      service.onDestroy();
      service.reset();
      expect(service.state).assertEqual('idle');
      expect(service.events.size()).assertEqual(0);
      expect(service.stub === undefined).assertTrue();
      service.onCreate();
      const stub = service.onConnect();
      const result = new InProcessClient(stub).send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(result.isSuccess()).assertTrue();
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(service.connectCount).assertEqual(1);
      expect(service.events.size()).assertEqual(2);
      expect(service.isAlive()).assertTrue();
    });

    /**
     * @tc.name          protocolWorkflowFullChainCounts
     * @tc.desc          A full chain with two requests reports consistent counters.
     * @tc.precondition  A fresh lifecycle model.
     * @tc.steps         1. Drive the five callbacks with two requests.
     *                   2. Build a snapshot.
     *                   3. Compare each counter with the event counts.
     * @tc.expected      Every snapshot counter equals its event count.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('protocolWorkflowFullChainCounts', 0, () => {
      const service = freshService();
      service.onCreate();
      service.onRequest(1);
      service.onRequest(2);
      service.onConnect();
      service.onDisconnect();
      service.onDestroy();
      const snapshot = new ServiceSnapshot(service);
      expect(snapshot.connects).assertEqual(service.events.countOf(EVENT_ON_CONNECT));
      expect(snapshot.disconnects).assertEqual(service.events.countOf(EVENT_ON_DISCONNECT));
      expect(snapshot.requests).assertEqual(service.events.countOf(EVENT_ON_REQUEST));
      expect(snapshot.destroys).assertEqual(service.events.countOf(EVENT_ON_DESTROY));
      expect(snapshot.connects + snapshot.disconnects + snapshot.requests + snapshot.destroys)
        .assertEqual(5);
      expect(snapshot.requests).assertEqual(2);
      expect(service.events.countOf(EVENT_ON_CREATE)).assertEqual(1);
      expect(snapshot.describe()).assertEqual('destroyed/1/1/2/1');
    });

    /**
     * @tc.name          protocolWorkflowDisconnectTwiceState
     * @tc.desc          Repeated disconnects keep the terminal disconnected state stable.
     * @tc.precondition  A connected service.
     * @tc.steps         1. Disconnect three times.
     *                   2. Read the state and counter.
     *                   3. Build a snapshot.
     * @tc.expected      The state stays disconnected and the counter reaches three.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('protocolWorkflowDisconnectTwiceState', 0, () => {
      const service = connectedService();
      service.onDisconnect();
      service.onDisconnect();
      service.onDisconnect();
      expect(service.state).assertEqual('disconnected');
      expect(service.disconnectCount).assertEqual(3);
      expect(service.connectCount).assertEqual(1);
      expect(new ServiceSnapshot(service).disconnects).assertEqual(3);
      expect(service.isAlive()).assertTrue();
      expect(service.destroyCount).assertEqual(0);
      expect(service.events.last()).assertEqual(EVENT_ON_DISCONNECT);
      expect(service.events.countOf(EVENT_ON_DISCONNECT)).assertEqual(3);
    });

    /**
     * @tc.name          protocolWorkflowLifecycleSnapshotAfterReset
     * @tc.desc          A snapshot after reset reports the pristine zero state.
     * @tc.precondition  A service reset after a full lifecycle.
     * @tc.steps         1. Drive the lifecycle and reset.
     *                   2. Build a snapshot.
     *                   3. Compare the description.
     * @tc.expected      The snapshot reads idle/0/0/0/0.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('protocolWorkflowLifecycleSnapshotAfterReset', 0, () => {
      const service = connectedService();
      service.onRequest(9);
      service.onDisconnect();
      service.onDestroy();
      service.reset();
      const snapshot = new ServiceSnapshot(service);
      expect(snapshot.state).assertEqual('idle');
      expect(snapshot.describe()).assertEqual('idle/0/0/0/0');
      expect(snapshot.connects).assertEqual(0);
      expect(snapshot.requests).assertEqual(0);
      expect(snapshot.destroys).assertEqual(0);
      expect(snapshot.sameAs(new ServiceSnapshot(freshService()))).assertTrue();
      expect(service.isAlive()).assertTrue();
      expect(service.events.size()).assertEqual(0);
    });

    /**
     * @tc.name          protocolWorkflowWithUnknownMatrix
     * @tc.desc          The unknown matrix runs through the connected workflow stub.
     * @tc.precondition  A connected service.
     * @tc.steps         1. Send 0, 2, -1 and 99.
     *                   2. Build metrics.
     *                   3. Confirm the workflow state is untouched.
     * @tc.expected      Four rejections occur without lifecycle changes.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('protocolWorkflowWithUnknownMatrix', 0, () => {
      const service = connectedService();
      const client = new InProcessClient(connectedStub(service));
      const codes: number[] = [0, 2, -1, 99];
      for (let index = 0; index < codes.length; index++) {
        client.send(codes[index], REQUEST_PAYLOAD);
      }
      const metrics = StubMetrics.from(client.stub);
      expect(metrics.requests).assertEqual(4);
      expect(metrics.rejected).assertEqual(4);
      expect(metrics.handled).assertEqual(0);
      expect(client.replies.length).assertEqual(0);
      expect(service.state).assertEqual('connected');
      expect(service.connectCount).assertEqual(1);
      expect(service.events.size()).assertEqual(2);
      expect(textFingerprint(client.trace())).assertEqual(textFingerprint(''));
    });
  });
}


