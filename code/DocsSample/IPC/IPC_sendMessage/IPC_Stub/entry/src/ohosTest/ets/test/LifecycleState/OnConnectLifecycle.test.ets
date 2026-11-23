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
  StubRemoteObjectModel
} from '../Shared/SharedDriver';

function idleService(): ServiceLifecycleModel {
  return new ServiceLifecycleModel();
}

function connectedService(): ServiceLifecycleModel {
  const service = new ServiceLifecycleModel();
  service.onConnect();
  return service;
}

function boundStub(service: ServiceLifecycleModel): StubRemoteObjectModel {
  const stub = service.stub;
  if (stub === undefined) {
    throw new Error('Expected an already connected service stub');
  }
  return stub;
}

function connectTimes(service: ServiceLifecycleModel, times: number): StubRemoteObjectModel[] {
  const stubs: StubRemoteObjectModel[] = [];
  for (let index = 0; index < times; index++) {
    stubs.push(service.onConnect());
  }
  return stubs;
}

function connectedSnapshot(service: ServiceLifecycleModel): ServiceSnapshot {
  return new ServiceSnapshot(service);
}

function connectEntry(service: ServiceLifecycleModel): string {
  return service.events.entries[service.events.size() - 1];
}

export default function onConnectLifecycle(): void {
  describe('OnConnectLifecycle', () => {
    beforeAll(() => {
      logSuite('OnConnectLifecycle', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('OnConnectLifecycle', 'end');
    });

    /**
     * @tc.name          onConnectLifecycleReturnsStubObject
     * @tc.desc          onConnect returns a non-null remote object stand-in.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Invoke onConnect.
     *                   2. Read the returned reference.
     *                   3. Read the bound stub field.
     * @tc.expected      A stub object is returned and bound to the model.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('onConnectLifecycleReturnsStubObject', 0, () => {
      const service: ServiceLifecycleModel = idleService();
      const stub: StubRemoteObjectModel = service.onConnect();
      expect(stub.descriptor.length).assertLarger(0);
      expect(stub.alive).assertTrue();
      expect(service.stub).assertEqual(stub);
      expect(service.connectCount).assertEqual(1);
      expect(service.state).assertEqual('connected');
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(1);
      expect(service.events.size()).assertEqual(1);
      logStep('onConnectLifecycleReturnsStubObject', stub.descriptor);
    });

    /**
     * @tc.name          onConnectLifecycleStubDescriptorLiteral
     * @tc.desc          The returned stub carries the production descriptor literal.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Invoke onConnect.
     *                   2. Read the stub descriptor.
     *                   3. Compare with the shared constant.
     * @tc.expected      The descriptor equals IPCStubTest.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('onConnectLifecycleStubDescriptorLiteral', 0, () => {
      const service: ServiceLifecycleModel = idleService();
      const stub: StubRemoteObjectModel = service.onConnect();
      expect(stub.descriptor).assertEqual('IPCStubTest');
      expect(stub.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(stub.descriptor.length).assertEqual(STUB_DESCRIPTOR.length);
      expect(stub.descriptor.length).assertLarger(0);
      expect(stub.descriptor.indexOf('IPC')).assertEqual(0);
      expect(service.events.entries[0]).assertEqual('onConnect:IPCStubTest');
      expect(service.events.trace()).assertEqual('onConnect:IPCStubTest');
    });

    /**
     * @tc.name          onConnectLifecycleStubStartsAlive
     * @tc.desc          A newly connected stub is alive and holds no requests.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Invoke onConnect.
     *                   2. Read the alive flag.
     *                   3. Read the request ledger.
     * @tc.expected      The stub is alive with an empty ledger.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('onConnectLifecycleStubStartsAlive', 0, () => {
      const service: ServiceLifecycleModel = idleService();
      const stub: StubRemoteObjectModel = service.onConnect();
      expect(stub.alive).assertTrue();
      expect(stub.requestCount()).assertEqual(0);
      expect(stub.requests.length).assertEqual(0);
      expect(stub.lastRequest()).assertUndefined();
      expect(stub.replyText).assertEqual(REPLY_PAYLOAD);
      expect(stub.rejectCodes.length).assertEqual(0);
      expect(stub.descriptor).assertEqual(STUB_DESCRIPTOR);
    });

    /**
     * @tc.name          onConnectLifecycleStateBecomesConnected
     * @tc.desc          onConnect moves the lifecycle state to connected.
     * @tc.precondition  An idle lifecycle model is available.
     * @tc.steps         1. Invoke onConnect.
     *                   2. Read the state string.
     *                   3. Compare with the pre-call state.
     * @tc.expected      The state changes from idle to connected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('onConnectLifecycleStateBecomesConnected', 0, () => {
      const service: ServiceLifecycleModel = idleService();
      const before: string = service.state;
      service.onConnect();
      expect(before).assertEqual('idle');
      expect(service.state).assertEqual('connected');
      expect(service.state === before).assertFalse();
      expect(service.isAlive()).assertTrue();
      expect(service.events.last()).assertEqual('onConnect:IPCStubTest');
      expect(service.logs.lines[0]).assertEqual('INFO onConnect');
    });

    /**
     * @tc.name          onConnectLifecycleIncrementsConnectCounter
     * @tc.desc          Each onConnect invocation raises the connect counter by one.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Invoke onConnect twice.
     *                   2. Read the counter.
     *                   3. Read the per-kind event count.
     * @tc.expected      The counter and event count both equal two.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('onConnectLifecycleIncrementsConnectCounter', 0, () => {
      const service: ServiceLifecycleModel = idleService();
      service.onConnect();
      service.onConnect();
      expect(service.connectCount).assertEqual(2);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(2);
      expect(service.events.size()).assertEqual(2);
      expect(service.logs.size()).assertEqual(2);
      expect(service.requestCount).assertEqual(0);
      expect(service.disconnectCount).assertEqual(0);
      expect(service.events.trace()).assertEqual('onConnect:IPCStubTest>onConnect:IPCStubTest');
    });

    /**
     * @tc.name          onConnectLifecycleRecordsDescriptorDetail
     * @tc.desc          The connect event entry appends the descriptor after a colon.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Invoke onConnect.
     *                   2. Read the entry.
     *                   3. Split the entry on the colon.
     * @tc.expected      The entry prefix is onConnect and the suffix is the descriptor.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('onConnectLifecycleRecordsDescriptorDetail', 0, () => {
      const service: ServiceLifecycleModel = idleService();
      service.onConnect();
      const entry: string = service.events.entries[0];
      const parts: string[] = entry.split(':');
      expect(parts.length).assertEqual(2);
      expect(parts[0]).assertEqual(EVENT_ON_CONNECT);
      expect(parts[1]).assertEqual(STUB_DESCRIPTOR);
      expect(entry).assertEqual('onConnect:' + STUB_DESCRIPTOR);
      expect(connectEntry(service)).assertEqual(entry);
      expect(entry.indexOf(EVENT_ON_CONNECT)).assertEqual(0);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(1);
      expect(service.events.size()).assertEqual(1);
    });

    /**
     * @tc.name          onConnectLifecycleLogsSingleInfoLine
     * @tc.desc          A single connect writes exactly one info log line.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Invoke onConnect.
     *                   2. Read the log buffer.
     *                   3. Count each severity.
     * @tc.expected      One INFO line reading INFO onConnect and no warnings.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('onConnectLifecycleLogsSingleInfoLine', 0, () => {
      const service: ServiceLifecycleModel = idleService();
      service.onConnect();
      expect(service.logs.size()).assertEqual(1);
      expect(service.logs.lines[0]).assertEqual('INFO onConnect');
      expect(service.logs.countLevel(LEVEL_INFO)).assertEqual(1);
      expect(service.logs.countLevel(LEVEL_WARN)).assertEqual(0);
      expect(service.logs.countLevel(LEVEL_ERROR)).assertEqual(0);
      expect(service.logs.contains('onConnect')).assertTrue();
      expect(service.logs.trace()).assertEqual('INFO onConnect');
      expect(service.logs.limit).assertEqual(128);
    });

    /**
     * @tc.name          onConnectLifecycleBindsStubField
     * @tc.desc          The service keeps a reference to the returned stub.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Confirm the stub field is undefined.
     *                   2. Invoke onConnect.
     *                   3. Compare the field with the returned object.
     * @tc.expected      The stub field points at the returned object.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('onConnectLifecycleBindsStubField', 0, () => {
      const service: ServiceLifecycleModel = idleService();
      expect(service.stub).assertUndefined();
      const stub: StubRemoteObjectModel = service.onConnect();
      expect(service.stub === stub).assertTrue();
      expect(service.stub).assertEqual(stub);
      expect(service.stub?.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(service.stub?.alive).assertTrue();
      expect(service.stub?.requestCount()).assertEqual(0);
      expect(service.connectCount).assertEqual(1);
      expect(service.state).assertEqual('connected');
    });

    /**
     * @tc.name          onConnectLifecycleSecondConnectReturnsNewInstance
     * @tc.desc          Every connect call constructs a distinct stub instance.
     * @tc.precondition  A connected model is available.
     * @tc.steps         1. Read the first stub.
     *                   2. Invoke onConnect again.
     *                   3. Compare both references and descriptors.
     * @tc.expected      The two stubs are distinct objects sharing one descriptor.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('onConnectLifecycleSecondConnectReturnsNewInstance', 0, () => {
      const service: ServiceLifecycleModel = idleService();
      const first: StubRemoteObjectModel = service.onConnect();
      const second: StubRemoteObjectModel = service.onConnect();
      expect(first === second).assertFalse();
      expect(second === first).assertFalse();
      expect(first.descriptor).assertEqual(second.descriptor);
      expect(first.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(first.alive).assertTrue();
      expect(second.alive).assertTrue();
      expect(service.connectCount).assertEqual(2);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(2);
    });

    /**
     * @tc.name          onConnectLifecycleSecondConnectReplacesBoundStub
     * @tc.desc          The service keeps only the newest stub in its field.
     * @tc.precondition  A connected model is available.
     * @tc.steps         1. Connect once and record the first stub.
     *                   2. Connect again.
     *                   3. Compare the field with both stubs.
     * @tc.expected      The field equals the second stub and differs from the first.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('onConnectLifecycleSecondConnectReplacesBoundStub', 0, () => {
      const service: ServiceLifecycleModel = idleService();
      const first: StubRemoteObjectModel = service.onConnect();
      const second: StubRemoteObjectModel = service.onConnect();
      expect(service.stub === second).assertTrue();
      expect(service.stub === first).assertFalse();
      expect(service.stub?.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(service.events.entries[0]).assertEqual(service.events.entries[1]);
      expect(service.events.size()).assertEqual(2);
      expect(service.logs.size()).assertEqual(2);
      expect(first.alive).assertTrue();
      expect(second.alive).assertTrue();
    });

    /**
     * @tc.name          onConnectLifecycleAfterCreateKeepsCreateFirst
     * @tc.desc          Connecting a created service appends after the create event.
     * @tc.precondition  A created model is available.
     * @tc.steps         1. Invoke onCreate and onConnect.
     *                   2. Read entries by index.
     *                   3. Compare the trace.
     * @tc.expected      The trace is onCreate then onConnect with the descriptor.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('onConnectLifecycleAfterCreateKeepsCreateFirst', 0, () => {
      const service: ServiceLifecycleModel = idleService();
      service.onCreate();
      const stub: StubRemoteObjectModel = service.onConnect();
      expect(service.events.entries[0]).assertEqual(EVENT_ON_CREATE);
      expect(service.events.entries[1]).assertEqual('onConnect:' + STUB_DESCRIPTOR);
      expect(service.events.trace()).assertEqual('onCreate>onConnect:IPCStubTest');
      expect(service.events.size()).assertEqual(2);
      expect(service.state).assertEqual('connected');
      expect(service.events.countOf(EVENT_ON_CREATE)).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(1);
      expect(stub.alive).assertTrue();
    });

    /**
     * @tc.name          onConnectLifecycleSnapshotConnectedDescribe
     * @tc.desc          A connected snapshot reports one connect and the connected state.
     * @tc.precondition  A connected model is available.
     * @tc.steps         1. Invoke onConnect.
     *                   2. Capture the snapshot.
     *                   3. Read describe and each field.
     * @tc.expected      The describe text is connected/1/0/0/0.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('onConnectLifecycleSnapshotConnectedDescribe', 0, () => {
      const service: ServiceLifecycleModel = connectedService();
      const snapshot: ServiceSnapshot = connectedSnapshot(service);
      expect(snapshot.state).assertEqual('connected');
      expect(snapshot.connects).assertEqual(1);
      expect(snapshot.disconnects).assertEqual(0);
      expect(snapshot.requests).assertEqual(0);
      expect(snapshot.destroys).assertEqual(0);
      expect(snapshot.describe()).assertEqual('connected/1/0/0/0');
      expect(snapshot.sameAs(connectedSnapshot(service))).assertTrue();
      expect(snapshot.describe().split('/').length).assertEqual(5);
    });

    /**
     * @tc.name          onConnectLifecycleThreeConnectsCount
     * @tc.desc          Three connect calls produce three stubs and one state.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Connect three times through the helper.
     *                   2. Read the returned stub array.
     *                   3. Compare counters and trace.
     * @tc.expected      Three distinct stubs, three events, and connected state.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('onConnectLifecycleThreeConnectsCount', 0, () => {
      const service: ServiceLifecycleModel = idleService();
      const stubs: StubRemoteObjectModel[] = connectTimes(service, 3);
      expect(stubs.length).assertEqual(3);
      expect(stubs[0] === stubs[1]).assertFalse();
      expect(stubs[1] === stubs[2]).assertFalse();
      expect(stubs[0] === stubs[2]).assertFalse();
      expect(service.connectCount).assertEqual(3);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(3);
      expect(service.events.size()).assertEqual(3);
      expect(service.events.trace()).assertEqual(
        'onConnect:IPCStubTest>onConnect:IPCStubTest>onConnect:IPCStubTest');
    });

    /**
     * @tc.name          onConnectLifecycleEveryStubHandlesRoundTrip
     * @tc.desc          Each stub returned by connect answers code one.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Connect twice to obtain two stubs.
     *                   2. Send one code-one message on each stub.
     *                   3. Compare replies.
     * @tc.expected      Both stubs reply with hello rpc and succeed.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('onConnectLifecycleEveryStubHandlesRoundTrip', 0, () => {
      const service: ServiceLifecycleModel = idleService();
      const stubs: StubRemoteObjectModel[] = connectTimes(service, 2);
      const firstClient: InProcessClient = new InProcessClient(stubs[0]);
      const secondClient: InProcessClient = new InProcessClient(stubs[1]);
      const firstResult = firstClient.send(1, 'alpha');
      const secondResult = secondClient.send(1, 'beta');
      expect(firstResult.isSuccess()).assertTrue();
      expect(secondResult.isSuccess()).assertTrue();
      expect(firstResult.replyText).assertEqual(REPLY_PAYLOAD);
      expect(secondResult.replyText).assertEqual(REPLY_PAYLOAD);
      expect(stubs[0].requestCount()).assertEqual(1);
      expect(stubs[1].requestCount()).assertEqual(1);
      expect(stubs[0].lastRequest()?.text).assertEqual('alpha');
      expect(stubs[1].lastRequest()?.text).assertEqual('beta');
    });

    /**
     * @tc.name          onConnectLifecycleOldStubRemainsUsable
     * @tc.desc          A replaced stub reference still serves requests.
     * @tc.precondition  A model has connected twice.
     * @tc.steps         1. Record the first stub.
     *                   2. Connect again to replace the service field.
     *                   3. Send through the old stub.
     * @tc.expected      The old stub still replies and is alive.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('onConnectLifecycleOldStubRemainsUsable', 0, () => {
      const service: ServiceLifecycleModel = idleService();
      const first: StubRemoteObjectModel = service.onConnect();
      const second: StubRemoteObjectModel = service.onConnect();
      const client: InProcessClient = new InProcessClient(first);
      const result = client.send(1, 'stale');
      expect(first === second).assertFalse();
      expect(first.alive).assertTrue();
      expect(result.isSuccess()).assertTrue();
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(first.requestCount()).assertEqual(1);
      expect(second.requestCount()).assertEqual(0);
      expect(service.stub === second).assertTrue();
      expect(service.connectCount).assertEqual(2);
    });

    /**
     * @tc.name          onConnectLifecycleDoesNotTouchRequestCount
     * @tc.desc          Connect leaves the lifecycle request counter untouched.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Invoke onConnect twice.
     *                   2. Read the request counter.
     *                   3. Read the request event count.
     * @tc.expected      Both request measures stay zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('onConnectLifecycleDoesNotTouchRequestCount', 0, () => {
      const service: ServiceLifecycleModel = idleService();
      connectTimes(service, 2);
      expect(service.requestCount).assertEqual(0);
      expect(service.events.countOf(EVENT_ON_REQUEST)).assertEqual(0);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(2);
      expect(service.logs.contains('onRequest')).assertFalse();
      expect(service.state).assertEqual('connected');
      expect(service.disconnectCount).assertEqual(0);
      expect(service.destroyCount).assertEqual(0);
      expect(service.isAlive()).assertTrue();
    });

    /**
     * @tc.name          onConnectLifecycleDoesNotRecordRequestEvent
     * @tc.desc          The recorder never contains a request entry after connect.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Invoke onConnect.
     *                   2. Walk every recorder entry.
     *                   3. Compare each entry prefix with the request constant.
     * @tc.expected      No entry starts with onRequest.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('onConnectLifecycleDoesNotRecordRequestEvent', 0, () => {
      const service: ServiceLifecycleModel = idleService();
      service.onConnect();
      expect(service.events.entries[0].startsWith(EVENT_ON_REQUEST)).assertFalse();
      expect(service.events.trace().indexOf(EVENT_ON_REQUEST)).assertLess(0);
      expect(service.events.size()).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_REQUEST)).assertEqual(0);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(1);
      expect(service.logs.trace().indexOf('onRequest')).assertLess(0);
      expect(service.requestCount).assertEqual(0);
      expect(service.events.entries[0].startsWith(EVENT_ON_CONNECT)).assertTrue();
    });

    /**
     * @tc.name          onConnectLifecycleIdleWalkHasNoCreateEvent
     * @tc.desc          Connecting without creation leaves the create count at zero.
     * @tc.precondition  An idle lifecycle model is available.
     * @tc.steps         1. Skip onCreate.
     *                   2. Invoke onConnect.
     *                   3. Read create counts and entries.
     * @tc.expected      No create event exists and connect is the only entry.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onConnectLifecycleIdleWalkHasNoCreateEvent', 0, () => {
      const service: ServiceLifecycleModel = idleService();
      service.onConnect();
      expect(service.events.countOf(EVENT_ON_CREATE)).assertEqual(0);
      expect(service.events.trace().indexOf(EVENT_ON_CREATE)).assertLess(0);
      expect(service.events.entries[0]).assertEqual('onConnect:IPCStubTest');
      expect(service.events.size()).assertEqual(1);
      expect(service.state).assertEqual('connected');
      expect(service.logs.trace()).assertEqual('INFO onConnect');
      expect(service.isAlive()).assertTrue();
      expect(service.stub?.descriptor).assertEqual(STUB_DESCRIPTOR);
    });

    /**
     * @tc.name          onConnectLifecycleStubReplyTextLiteral
     * @tc.desc          The connected stub replies with the production literal.
     * @tc.precondition  A connected model is available.
     * @tc.steps         1. Wrap the stub in a client.
     *                   2. Send code one with the sample payload.
     *                   3. Compare the reply text.
     * @tc.expected      The reply is hello rpc and the result is successful.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('onConnectLifecycleStubReplyTextLiteral', 0, () => {
      const service: ServiceLifecycleModel = connectedService();
      const client: InProcessClient = new InProcessClient(boundStub(service));
      const result = client.send(1, 'hello world');
      expect(result.replyText).assertEqual('hello rpc');
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(result.isSuccess()).assertTrue();
      expect(result.errCode).assertEqual(0);
      expect(result.handled).assertTrue();
      expect(client.replies[0]).assertEqual(REPLY_PAYLOAD);
      expect(client.sentTexts[0]).assertEqual('hello world');
      expect(service.stub?.lastRequest()?.replyText).assertEqual(REPLY_PAYLOAD);
    });

    /**
     * @tc.name          onConnectLifecycleClientLedgerAfterConnect
     * @tc.desc          A client created from the stub records each message sent.
     * @tc.precondition  A connected model is available.
     * @tc.steps         1. Create a client over the stub.
     *                   2. Send code one twice.
     *                   3. Read ledger lengths and codes.
     * @tc.expected      Two codes and two replies are recorded.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('onConnectLifecycleClientLedgerAfterConnect', 0, () => {
      const service: ServiceLifecycleModel = connectedService();
      const client: InProcessClient = new InProcessClient(boundStub(service));
      client.send(1, 'one');
      client.send(1, 'two');
      expect(client.sentCodes.length).assertEqual(2);
      expect(client.sentCodes[0]).assertEqual(1);
      expect(client.sentTexts.length).assertEqual(2);
      expect(client.sentTexts[1]).assertEqual('two');
      expect(client.results.length).assertEqual(2);
      expect(client.replies.length).assertEqual(2);
      expect(client.stub.requestCount()).assertEqual(2);
      expect(client.stub.lastRequest()?.text).assertEqual('two');
    });

    /**
     * @tc.name          onConnectLifecycleResetClearsStubAndCount
     * @tc.desc          Reset removes the bound stub and zeroes the connect counter.
     * @tc.precondition  A connected model is available.
     * @tc.steps         1. Connect the model.
     *                   2. Invoke reset.
     *                   3. Read the stub field and counters.
     * @tc.expected      The stub is undefined and the connect counter is zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('onConnectLifecycleResetClearsStubAndCount', 0, () => {
      const service: ServiceLifecycleModel = connectedService();
      expect(service.stub?.alive).assertTrue();
      expect(service.stub === undefined).assertFalse();
      expect(service.connectCount).assertEqual(1);
      service.reset();
      expect(service.stub).assertUndefined();
      expect(service.connectCount).assertEqual(0);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(0);
      expect(service.events.size()).assertEqual(0);
      expect(service.logs.size()).assertEqual(0);
      expect(service.state).assertEqual('idle');
    });

    /**
     * @tc.name          onConnectLifecycleAfterDisconnectReconnects
     * @tc.desc          A new connection after disconnect binds a fresh stub.
     * @tc.precondition  A connected model has disconnected.
     * @tc.steps         1. Connect and disconnect.
     *                   2. Connect again.
     *                   3. Compare counters, state and stub aliveness.
     * @tc.expected      Connect count is two and the state returns to connected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('onConnectLifecycleAfterDisconnectReconnects', 0, () => {
      const service: ServiceLifecycleModel = idleService();
      const first: StubRemoteObjectModel = service.onConnect();
      service.onDisconnect();
      const second: StubRemoteObjectModel = service.onConnect();
      expect(service.connectCount).assertEqual(2);
      expect(service.disconnectCount).assertEqual(1);
      expect(service.state).assertEqual('connected');
      expect(first === second).assertFalse();
      expect(second.alive).assertTrue();
      expect(service.stub === second).assertTrue();
      expect(service.events.trace()).assertEqual(
        'onConnect:IPCStubTest>onDisconnect>onConnect:IPCStubTest');
      expect(service.isAlive()).assertTrue();
    });

    /**
     * @tc.name          onConnectLifecycleAfterDestroyStillConnects
     * @tc.desc          Connecting a destroyed model rebinds a live stub.
     * @tc.precondition  A model has been destroyed.
     * @tc.steps         1. Create and destroy.
     *                   2. Invoke onConnect.
     *                   3. Read state and stub status.
     * @tc.expected      State becomes connected and the stub is alive.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onConnectLifecycleAfterDestroyStillConnects', 0, () => {
      const service: ServiceLifecycleModel = idleService();
      service.onCreate();
      service.onDestroy();
      const stub: StubRemoteObjectModel = service.onConnect();
      expect(service.state).assertEqual('connected');
      expect(service.isAlive()).assertTrue();
      expect(stub.alive).assertTrue();
      expect(service.connectCount).assertEqual(1);
      expect(service.destroyCount).assertEqual(1);
      expect(service.events.trace()).assertEqual(
        'onCreate>onDestroy>onConnect:IPCStubTest');
      expect(service.events.last()).assertEqual('onConnect:IPCStubTest');
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(1);
    });

    /**
     * @tc.name          onConnectLifecycleStubMetricsAfterRequests
     * @tc.desc          Metrics computed from a connected stub track handled requests.
     * @tc.precondition  A connected model with a client is available.
     * @tc.steps         1. Send two valid requests.
     *                   2. Send one unknown code.
     *                   3. Compute metrics.
     * @tc.expected      Metrics report three requests, two handled and one rejected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('onConnectLifecycleStubMetricsAfterRequests', 0, () => {
      const service: ServiceLifecycleModel = connectedService();
      const client: InProcessClient = new InProcessClient(boundStub(service));
      client.send(1, 'a');
      client.send(1, 'b');
      client.send(0, 'c');
      const metrics: StubMetrics = StubMetrics.from(client.stub);
      expect(metrics.requests).assertEqual(3);
      expect(metrics.handled).assertEqual(2);
      expect(metrics.rejected).assertEqual(1);
      expect(metrics.replies).assertEqual(2);
      expect(metrics.successRatio()).assertLarger(0.6);
      expect(metrics.successRatio()).assertLess(0.7);
      expect(service.connectCount).assertEqual(1);
      expect(service.state).assertEqual('connected');
    });

    /**
     * @tc.name          onConnectLifecycleIndependentModelsSeparateStubs
     * @tc.desc          Each model owns its stub and connect counter.
     * @tc.precondition  Two independent lifecycle models are available.
     * @tc.steps         1. Connect the first model.
     *                   2. Read the second model state.
     *                   3. Connect the second model and compare stubs.
     * @tc.expected      The models hold different stubs and separate counters.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onConnectLifecycleIndependentModelsSeparateStubs', 0, () => {
      const first: ServiceLifecycleModel = idleService();
      const second: ServiceLifecycleModel = idleService();
      const firstStub: StubRemoteObjectModel = first.onConnect();
      expect(second.stub).assertUndefined();
      expect(second.connectCount).assertEqual(0);
      expect(second.state).assertEqual('idle');
      const secondStub: StubRemoteObjectModel = second.onConnect();
      expect(firstStub === secondStub).assertFalse();
      expect(first.stub === firstStub).assertTrue();
      expect(second.stub === secondStub).assertTrue();
      expect(first.connectCount).assertEqual(1);
      expect(second.connectCount).assertEqual(1);
    });

    /**
     * @tc.name          onConnectLifecycleFingerprintGrowsPerConnect
     * @tc.desc          Consecutive connects extend the recorder fingerprint.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Read the empty fingerprint.
     *                   2. Connect once and read again.
     *                   3. Connect again and compare.
     * @tc.expected      All three fingerprints differ pairwise.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onConnectLifecycleFingerprintGrowsPerConnect', 0, () => {
      const service: ServiceLifecycleModel = idleService();
      const empty: number = service.events.fingerprint();
      service.onConnect();
      const once: number = service.events.fingerprint();
      service.onConnect();
      const twice: number = service.events.fingerprint();
      expect(empty === once).assertFalse();
      expect(once === twice).assertFalse();
      expect(empty === twice).assertFalse();
      expect(once).assertLarger(0);
      expect(twice).assertLarger(0);
      expect(service.events.size()).assertEqual(2);
      expect(service.connectCount).assertEqual(2);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(2);
    });

    /**
     * @tc.name          onConnectLifecycleEntrySuffixLength
     * @tc.desc          The descriptor suffix has the exact constant length.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Invoke onConnect.
     *                   2. Measure the entry prefix and suffix.
     *                   3. Compare lengths with the constants.
     * @tc.expected      The entry length is onConnect plus colon plus descriptor.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onConnectLifecycleEntrySuffixLength', 0, () => {
      const service: ServiceLifecycleModel = idleService();
      service.onConnect();
      const entry: string = service.events.entries[0];
      const prefix: string = entry.substring(0, EVENT_ON_CONNECT.length);
      const suffix: string = entry.substring(EVENT_ON_CONNECT.length + 1);
      expect(prefix).assertEqual(EVENT_ON_CONNECT);
      expect(suffix).assertEqual(STUB_DESCRIPTOR);
      expect(suffix.length).assertEqual(STUB_DESCRIPTOR.length);
      expect(entry.length).assertEqual(EVENT_ON_CONNECT.length + 1 + STUB_DESCRIPTOR.length);
      expect(entry.charAt(EVENT_ON_CONNECT.length)).assertEqual(':');
      expect(entry.indexOf(':')).assertEqual(EVENT_ON_CONNECT.length);
      expect(service.events.trace()).assertEqual(entry);
    });

    /**
     * @tc.name          onConnectLifecycleStubResetKeepsDescriptor
     * @tc.desc          Resetting a stub clears requests but keeps its descriptor.
     * @tc.precondition  A connected stub has served one request.
     * @tc.steps         1. Record the descriptor.
     *                   2. Send a request and reset the stub.
     *                   3. Re-read descriptor and ledger.
     * @tc.expected      The descriptor is unchanged and the ledger is empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onConnectLifecycleStubResetKeepsDescriptor', 0, () => {
      const service: ServiceLifecycleModel = connectedService();
      const stub: StubRemoteObjectModel = boundStub(service);
      const descriptor: string = stub !== undefined ? stub.descriptor : '';
      const client: InProcessClient = new InProcessClient(stub);
      client.send(1, 'before');
      expect(stub?.requestCount()).assertEqual(1);
      stub?.reset();
      expect(stub?.descriptor).assertEqual(descriptor);
      expect(stub?.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(stub?.requestCount()).assertEqual(0);
      expect(stub?.alive).assertTrue();
      expect(stub?.lastRequest()).assertUndefined();
      expect(stub?.rejectCodes.length).assertEqual(0);
      expect(service.state).assertEqual('connected');
    });

    /**
     * @tc.name          onConnectLifecycleKillThenReviveStub
     * @tc.desc          A connected stub can be killed and revived independently.
     * @tc.precondition  A connected model is available.
     * @tc.steps         1. Kill the stub and send a request.
     *                   2. Revive the stub and send again.
     *                   3. Compare the two results.
     * @tc.expected      The killed request fails and the revived request succeeds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onConnectLifecycleKillThenReviveStub', 0, () => {
      const service: ServiceLifecycleModel = connectedService();
      const client: InProcessClient = new InProcessClient(boundStub(service));
      client.stub.kill();
      const dead = client.send(1, 'dead');
      expect(dead.isSuccess()).assertFalse();
      expect(dead.replyText).assertEqual('');
      expect(client.stub.alive).assertFalse();
      client.stub.revive();
      const alive = client.send(1, 'alive');
      expect(alive.isSuccess()).assertTrue();
      expect(alive.replyText).assertEqual(REPLY_PAYLOAD);
      expect(client.stub.requestCount()).assertEqual(2);
      expect(service.connectCount).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(1);
    });

    /**
     * @tc.name          onConnectLifecycleSnapshotConnectsEqualsCounter
     * @tc.desc          The snapshot connect field always equals the live counter.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Capture a snapshot before connecting.
     *                   2. Connect twice, capturing between calls.
     *                   3. Compare each connect field.
     * @tc.expected      The fields read zero, one and two.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onConnectLifecycleSnapshotConnectsEqualsCounter', 0, () => {
      const service: ServiceLifecycleModel = idleService();
      const zero: ServiceSnapshot = connectedSnapshot(service);
      service.onConnect();
      const one: ServiceSnapshot = connectedSnapshot(service);
      service.onConnect();
      const two: ServiceSnapshot = connectedSnapshot(service);
      expect(zero.connects).assertEqual(0);
      expect(one.connects).assertEqual(1);
      expect(two.connects).assertEqual(2);
      expect(two.connects).assertEqual(service.connectCount);
      expect(zero.state).assertEqual('idle');
      expect(one.state).assertEqual('connected');
      expect(two.sameAs(one)).assertFalse();
      expect(one.describe()).assertEqual('connected/1/0/0/0');
    });

    /**
     * @tc.name          onConnectLifecycleTwoConnectsDescribe
     * @tc.desc          A double connect describes a connect count of two.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Connect twice.
     *                   2. Capture and describe the snapshot.
     *                   3. Split the describe text.
     * @tc.expected      The second describe field is two.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onConnectLifecycleTwoConnectsDescribe', 0, () => {
      const service: ServiceLifecycleModel = idleService();
      connectTimes(service, 2);
      const snapshot: ServiceSnapshot = connectedSnapshot(service);
      const fields: string[] = snapshot.describe().split('/');
      expect(fields[0]).assertEqual('connected');
      expect(fields[1]).assertEqual('2');
      expect(fields[2]).assertEqual('0');
      expect(fields[3]).assertEqual('0');
      expect(fields[4]).assertEqual('0');
      expect(snapshot.describe()).assertEqual('connected/2/0/0/0');
      expect(snapshot.connects).assertEqual(2);
      expect(service.stub?.descriptor).assertEqual(STUB_DESCRIPTOR);
    });

    /**
     * @tc.name          onConnectLifecycleLogCountMatchesConnects
     * @tc.desc          Each connect writes exactly one info line.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Connect four times.
     *                   2. Read the log size and level counts.
     *                   3. Compare with the event size.
     * @tc.expected      Four info lines and four events are present.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onConnectLifecycleLogCountMatchesConnects', 0, () => {
      const service: ServiceLifecycleModel = idleService();
      connectTimes(service, 4);
      expect(service.logs.size()).assertEqual(4);
      expect(service.logs.size()).assertEqual(service.events.size());
      expect(service.logs.countLevel(LEVEL_INFO)).assertEqual(4);
      expect(service.logs.countLevel(LEVEL_WARN)).assertEqual(0);
      expect(service.logs.countLevel(LEVEL_ERROR)).assertEqual(0);
      expect(service.logs.lines[0]).assertEqual('INFO onConnect');
      expect(service.logs.lines[3]).assertEqual('INFO onConnect');
      expect(service.connectCount).assertEqual(4);
      expect(service.logs.contains('onConnect')).assertTrue();
    });

    /**
     * @tc.name          onConnectLifecycleMultipleStubsIndependentLedgers
     * @tc.desc          Requests on one stub do not appear on another.
     * @tc.precondition  A model has connected three times.
     * @tc.steps         1. Send different counts to each stub.
     *                   2. Read each ledger length.
     *                   3. Compare texts recorded.
     * @tc.expected      Ledgers hold one, two and zero entries respectively.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onConnectLifecycleMultipleStubsIndependentLedgers', 0, () => {
      const service: ServiceLifecycleModel = idleService();
      const stubs: StubRemoteObjectModel[] = connectTimes(service, 3);
      new InProcessClient(stubs[0]).send(1, 's0');
      const second: InProcessClient = new InProcessClient(stubs[1]);
      second.send(1, 's1a');
      second.send(1, 's1b');
      expect(stubs[0].requestCount()).assertEqual(1);
      expect(stubs[1].requestCount()).assertEqual(2);
      expect(stubs[2].requestCount()).assertEqual(0);
      expect(stubs[0].lastRequest()?.text).assertEqual('s0');
      expect(stubs[1].lastRequest()?.text).assertEqual('s1b');
      expect(stubs[2].lastRequest()).assertUndefined();
      expect(stubs[0].requests[0].text).assertEqual('s0');
      expect(stubs[1].requests[1].text).assertEqual('s1b');
    });

    /**
     * @tc.name          onConnectLifecycleConnectThenRequestTrace
     * @tc.desc          Connecting before a request yields connect then request.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Connect the model.
     *                   2. Invoke onRequest with startId 6.
     *                   3. Read the trace and counters.
     * @tc.expected      The trace is connect then request with one of each.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onConnectLifecycleConnectThenRequestTrace', 0, () => {
      const service: ServiceLifecycleModel = idleService();
      service.onConnect();
      service.onRequest(6);
      expect(service.events.trace()).assertEqual('onConnect:IPCStubTest>onRequest:6');
      expect(service.events.entries[0]).assertEqual('onConnect:IPCStubTest');
      expect(service.events.entries[1]).assertEqual('onRequest:6');
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_REQUEST)).assertEqual(1);
      expect(service.connectCount).assertEqual(1);
      expect(service.requestCount).assertEqual(1);
      expect(service.state).assertEqual('connected');
      expect(service.events.size()).assertEqual(2);
    });

    /**
     * @tc.name          onConnectLifecycleConnectedStateIsAlive
     * @tc.desc          The connected state reports a living service.
     * @tc.precondition  A connected model is available.
     * @tc.steps         1. Read the state.
     *                   2. Read liveness.
     *                   3. Compare with an idle model.
     * @tc.expected      Both idle and connected states are alive.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onConnectLifecycleConnectedStateIsAlive', 0, () => {
      const idle: ServiceLifecycleModel = idleService();
      const connected: ServiceLifecycleModel = connectedService();
      expect(idle.isAlive()).assertTrue();
      expect(connected.isAlive()).assertTrue();
      expect(connected.state).assertEqual('connected');
      expect(connected.state === idle.state).assertFalse();
      expect(connected.isAlive()).assertEqual(idle.isAlive());
      expect(connected.destroyCount).assertEqual(0);
      expect(connected.state).assertContain('connect');
      expect(idle.connectCount).assertEqual(0);
    });

    /**
     * @tc.name          onConnectLifecycleDescriptorConstantEquality
     * @tc.desc          The bound stub descriptor equals the exported constant.
     * @tc.precondition  A connected model is available.
     * @tc.steps         1. Read the stub descriptor.
     *                   2. Compare with STUB_DESCRIPTOR.
     *                   3. Compare with the stub default.
     * @tc.expected      All three descriptor sources agree.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onConnectLifecycleDescriptorConstantEquality', 0, () => {
      const service: ServiceLifecycleModel = connectedService();
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      expect(service.stub?.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(stub.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(service.stub?.descriptor).assertEqual(stub.descriptor);
      expect(STUB_DESCRIPTOR).assertEqual('IPCStubTest');
      expect(service.events.entries[0]).assertEqual('onConnect:' + STUB_DESCRIPTOR);
      expect(service.events.trace()).assertEqual('onConnect:' + STUB_DESCRIPTOR);
      expect(stub.descriptor.length).assertEqual(service.stub?.descriptor.length);
      expect(service.events.size()).assertEqual(1);
    });

    /**
     * @tc.name          onConnectLifecycleNewStubAfterReset
     * @tc.desc          A reset followed by connect binds a fresh stub instance.
     * @tc.precondition  A connected model is available.
     * @tc.steps         1. Record the first stub.
     *                   2. Reset and connect again.
     *                   3. Compare references and counters.
     * @tc.expected      The second stub is a new object and the counter is one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onConnectLifecycleNewStubAfterReset', 0, () => {
      const service: ServiceLifecycleModel = idleService();
      const first: StubRemoteObjectModel = service.onConnect();
      service.reset();
      expect(service.stub).assertUndefined();
      const second: StubRemoteObjectModel = service.onConnect();
      expect(first === second).assertFalse();
      expect(service.stub === second).assertTrue();
      expect(service.connectCount).assertEqual(1);
      expect(service.events.size()).assertEqual(1);
      expect(service.events.trace()).assertEqual('onConnect:IPCStubTest');
      expect(service.logs.size()).assertEqual(1);
      expect(second.alive).assertTrue();
    });

    /**
     * @tc.name          onConnectLifecycleEventKindCountsSum
     * @tc.desc          Connect counts participate in the full kind sum.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Create, connect twice, request and destroy.
     *                   2. Sum all five kind counts.
     *                   3. Compare with the recorder size.
     * @tc.expected      The sum equals five and connect contributes two.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onConnectLifecycleEventKindCountsSum', 0, () => {
      const service: ServiceLifecycleModel = idleService();
      service.onCreate();
      service.onConnect();
      service.onConnect();
      service.onRequest(1);
      service.onDestroy();
      const sum: number = service.events.countOf(EVENT_ON_CREATE) +
        service.events.countOf(EVENT_ON_CONNECT) +
        service.events.countOf(EVENT_ON_REQUEST) +
        service.events.countOf(EVENT_ON_DISCONNECT) +
        service.events.countOf(EVENT_ON_DESTROY);
      expect(sum).assertEqual(5);
      expect(sum).assertEqual(service.events.size());
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(2);
      expect(service.connectCount).assertEqual(2);
      expect(service.destroyCount).assertEqual(1);
      expect(service.events.trace()).assertEqual(
        'onCreate>onConnect:IPCStubTest>onConnect:IPCStubTest>onRequest:1>onDestroy');
      expect(service.isAlive()).assertFalse();
      expect(service.events.entries.length).assertEqual(5);
    });

    /**
     * @tc.name          onConnectLifecycleStubRejectCodesIndependent
     * @tc.desc          Reject lists belong to individual stub instances.
     * @tc.precondition  A model has connected twice.
     * @tc.steps         1. Add code 1 to the first stub reject list.
     *                   2. Send code 1 through both stubs.
     *                   3. Compare results.
     * @tc.expected      The first stub rejects while the second handles.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onConnectLifecycleStubRejectCodesIndependent', 0, () => {
      const service: ServiceLifecycleModel = idleService();
      const stubs: StubRemoteObjectModel[] = connectTimes(service, 2);
      stubs[0].rejectCodes.push(1);
      const firstResult = new InProcessClient(stubs[0]).send(1, 'blocked');
      const secondResult = new InProcessClient(stubs[1]).send(1, 'allowed');
      expect(firstResult.isSuccess()).assertFalse();
      expect(firstResult.handled).assertFalse();
      expect(secondResult.isSuccess()).assertTrue();
      expect(secondResult.replyText).assertEqual(REPLY_PAYLOAD);
      expect(stubs[0].rejectCodes.length).assertEqual(1);
      expect(stubs[1].rejectCodes.length).assertEqual(0);
      expect(stubs[0].requestCount()).assertEqual(1);
      expect(stubs[1].requestCount()).assertEqual(1);
    });

    /**
     * @tc.name          onConnectLifecycleDisconnectKeepsStubReference
     * @tc.desc          Disconnecting does not clear the previously bound stub.
     * @tc.precondition  A connected model is available.
     * @tc.steps         1. Record the bound stub.
     *                   2. Invoke onDisconnect.
     *                   3. Read the stub field and state.
     * @tc.expected      The stub field is unchanged while the state is disconnected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onConnectLifecycleDisconnectKeepsStubReference', 0, () => {
      const service: ServiceLifecycleModel = connectedService();
      const stub: StubRemoteObjectModel = boundStub(service);
      service.onDisconnect();
      expect(service.stub === stub).assertTrue();
      expect(service.stub?.alive).assertTrue();
      expect(service.state).assertEqual('disconnected');
      expect(service.connectCount).assertEqual(1);
      expect(service.disconnectCount).assertEqual(1);
      expect(service.stub?.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(service.events.trace()).assertEqual(
        'onConnect:IPCStubTest>onDisconnect');
      expect(service.isAlive()).assertTrue();
    });

    /**
     * @tc.name          onConnectLifecycleConnectAfterKilledStub
     * @tc.desc          Connecting again after killing the old stub yields a live stub.
     * @tc.precondition  A connected model has a killed stub.
     * @tc.steps         1. Kill the bound stub.
     *                   2. Invoke onConnect again.
     *                   3. Compare liveness of both stubs.
     * @tc.expected      The old stub stays dead while the new stub is alive.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onConnectLifecycleConnectAfterKilledStub', 0, () => {
      const service: ServiceLifecycleModel = idleService();
      const first: StubRemoteObjectModel = service.onConnect();
      first.kill();
      const second: StubRemoteObjectModel = service.onConnect();
      expect(first.alive).assertFalse();
      expect(second.alive).assertTrue();
      expect(service.stub === second).assertTrue();
      expect(service.stub === first).assertFalse();
      expect(service.connectCount).assertEqual(2);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(2);
      expect(service.events.trace()).assertEqual(
        'onConnect:IPCStubTest>onConnect:IPCStubTest');
      expect(service.state).assertEqual('connected');
    });

    /**
     * @tc.name          onConnectLifecycleSnapshotAfterConnectAndRequest
     * @tc.desc          A snapshot after connect and request reports both totals.
     * @tc.precondition  A connected model has received one request.
     * @tc.steps         1. Connect and request.
     *                   2. Capture the snapshot.
     *                   3. Read describe and each field.
     * @tc.expected      The describe text is connected/1/0/1/0.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onConnectLifecycleSnapshotAfterConnectAndRequest', 0, () => {
      const service: ServiceLifecycleModel = idleService();
      service.onConnect();
      service.onRequest(1);
      const snapshot: ServiceSnapshot = connectedSnapshot(service);
      expect(snapshot.describe()).assertEqual('connected/1/0/1/0');
      expect(snapshot.connects).assertEqual(1);
      expect(snapshot.requests).assertEqual(1);
      expect(snapshot.disconnects).assertEqual(0);
      expect(snapshot.destroys).assertEqual(0);
      expect(snapshot.state).assertEqual('connected');
      expect(service.stub?.requestCount()).assertEqual(0);
      expect(service.events.size()).assertEqual(2);
    });

    /**
     * @tc.name          onConnectLifecycleConnectCounterAfterRecorderClear
     * @tc.desc          Clearing the recorder preserves the connect counter.
     * @tc.precondition  A model has connected twice.
     * @tc.steps         1. Connect twice.
     *                   2. Clear the recorder.
     *                   3. Connect again and compare.
     * @tc.expected      The counter becomes three while the recorder holds one entry.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onConnectLifecycleConnectCounterAfterRecorderClear', 0, () => {
      const service: ServiceLifecycleModel = idleService();
      connectTimes(service, 2);
      service.events.clear();
      expect(service.events.size()).assertEqual(0);
      expect(service.connectCount).assertEqual(2);
      service.onConnect();
      expect(service.connectCount).assertEqual(3);
      expect(service.events.size()).assertEqual(1);
      expect(service.events.trace()).assertEqual('onConnect:IPCStubTest');
      expect(service.events.last()).assertEqual('onConnect:IPCStubTest');
      expect(service.logs.size()).assertEqual(3);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(1);
    });

    /**
     * @tc.name          onConnectLifecycleRoundTripThreeTimes
     * @tc.desc          One stub handles three consecutive code-one messages.
     * @tc.precondition  A connected model is available.
     * @tc.steps         1. Wrap the stub in a client.
     *                   2. Send code one three times.
     *                   3. Inspect replies and ledger.
     * @tc.expected      Three successful replies and a ledger of three requests.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onConnectLifecycleRoundTripThreeTimes', 0, () => {
      const service: ServiceLifecycleModel = connectedService();
      const client: InProcessClient = new InProcessClient(boundStub(service));
      const handled: number = client.sendMany(3, 1);
      expect(handled).assertEqual(3);
      expect(client.replies.length).assertEqual(3);
      expect(client.replies[0]).assertEqual(REPLY_PAYLOAD);
      expect(client.replies[2]).assertEqual(REPLY_PAYLOAD);
      expect(client.stub.requestCount()).assertEqual(3);
      expect(StubMetrics.from(client.stub).handled).assertEqual(3);
      expect(StubMetrics.from(client.stub).rejected).assertEqual(0);
      expect(service.events.size()).assertEqual(1);
    });

    /**
     * @tc.name          onConnectLifecycleConnectThenResetSnapshotIdle
     * @tc.desc          A snapshot after connect and reset reports idle.
     * @tc.precondition  A connected model is available.
     * @tc.steps         1. Connect the model.
     *                   2. Reset it.
     *                   3. Capture and describe the snapshot.
     * @tc.expected      The describe text is idle/0/0/0/0 and the stub is gone.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onConnectLifecycleConnectThenResetSnapshotIdle', 0, () => {
      const service: ServiceLifecycleModel = connectedService();
      service.reset();
      const snapshot: ServiceSnapshot = connectedSnapshot(service);
      expect(snapshot.state).assertEqual('idle');
      expect(snapshot.connects).assertEqual(0);
      expect(snapshot.describe()).assertEqual('idle/0/0/0/0');
      expect(service.stub).assertUndefined();
      expect(service.events.size()).assertEqual(0);
      expect(service.logs.size()).assertEqual(0);
      expect(snapshot.sameAs(connectedSnapshot(idleService()))).assertTrue();
      expect(service.state).assertEqual('idle');
    });

    /**
     * @tc.name          onConnectLifecycleReconnectCycleCounts
     * @tc.desc          Two connect-disconnect cycles count each callback separately.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Run two connect-disconnect cycles.
     *                   2. Read connect and disconnect counters.
     *                   3. Read the trace.
     * @tc.expected      Two connects, two disconnects and a four-entry trace.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onConnectLifecycleReconnectCycleCounts', 0, () => {
      const service: ServiceLifecycleModel = idleService();
      for (let cycle = 0; cycle < 2; cycle++) {
        service.onConnect();
        service.onDisconnect();
      }
      expect(service.connectCount).assertEqual(2);
      expect(service.disconnectCount).assertEqual(2);
      expect(service.events.size()).assertEqual(4);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(2);
      expect(service.events.countOf(EVENT_ON_DISCONNECT)).assertEqual(2);
      expect(service.events.trace()).assertEqual(
        'onConnect:IPCStubTest>onDisconnect>onConnect:IPCStubTest>onDisconnect');
      expect(service.state).assertEqual('disconnected');
      expect(service.isAlive()).assertTrue();
    });

    /**
     * @tc.name          onConnectLifecycleResetCycleDeterministic
     * @tc.desc          Repeated reset-connect cycles yield identical snapshots.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Run three reset-connect cycles.
     *                   2. Capture a snapshot per cycle.
     *                   3. Compare describe text.
     * @tc.expected      Every cycle describes connected/1/0/0/0.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onConnectLifecycleResetCycleDeterministic', 0, () => {
      const service: ServiceLifecycleModel = idleService();
      const texts: string[] = [];
      for (let cycle = 0; cycle < 3; cycle++) {
        service.reset();
        service.onConnect();
        texts.push(connectedSnapshot(service).describe());
      }
      expect(texts.length).assertEqual(3);
      expect(texts[0]).assertEqual('connected/1/0/0/0');
      expect(texts[0]).assertEqual(texts[1]);
      expect(texts[1]).assertEqual(texts[2]);
      expect(service.connectCount).assertEqual(1);
      expect(service.events.size()).assertEqual(1);
      expect(service.events.trace()).assertEqual('onConnect:IPCStubTest');
      expect(service.logs.size()).assertEqual(1);
    });

    /**
     * @tc.name          onConnectLifecycleLogInfoOnlyAfterManyConnects
     * @tc.desc          Many connects never emit warning or error lines.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Connect ten times.
     *                   2. Count each log severity.
     *                   3. Sum the counts.
     * @tc.expected      Ten info lines with zero warning and error lines.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onConnectLifecycleLogInfoOnlyAfterManyConnects', 0, () => {
      const service: ServiceLifecycleModel = idleService();
      connectTimes(service, 10);
      const sum: number = service.logs.countLevel(LEVEL_INFO) +
        service.logs.countLevel(LEVEL_WARN) +
        service.logs.countLevel(LEVEL_ERROR);
      expect(sum).assertEqual(service.logs.size());
      expect(service.logs.size()).assertEqual(10);
      expect(service.logs.countLevel(LEVEL_WARN)).assertEqual(0);
      expect(service.logs.countLevel(LEVEL_ERROR)).assertEqual(0);
      expect(service.logs.contains('WARN')).assertFalse();
      expect(service.logs.contains('ERROR')).assertFalse();
      expect(service.logs.trace().split('|').length).assertEqual(10);
      expect(service.connectCount).assertEqual(10);
    });

    /**
     * @tc.name          onConnectLifecycleSnapshotChainConnectCounts
     * @tc.desc          A chain of snapshots counts connects from zero upward.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Capture a snapshot per connect.
     *                   2. Walk the chain by index.
     *                   3. Compare each connect field.
     * @tc.expected      Each snapshot reports its capture-time connect count.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onConnectLifecycleSnapshotChainConnectCounts', 0, () => {
      const service: ServiceLifecycleModel = idleService();
      const chain: ServiceSnapshot[] = [];
      chain.push(connectedSnapshot(service));
      for (let index = 0; index < 4; index++) {
        service.onConnect();
        chain.push(connectedSnapshot(service));
      }
      expect(chain.length).assertEqual(5);
      expect(chain[0].connects).assertEqual(0);
      expect(chain[1].connects).assertEqual(1);
      expect(chain[4].connects).assertEqual(4);
      for (let index = 1; index < chain.length; index++) {
        expect(chain[index].connects).assertEqual(chain[index - 1].connects + 1);
      }
      expect(chain[0].state).assertEqual('idle');
      expect(chain[4].state).assertEqual('connected');
      expect(chain[4].sameAs(chain[0])).assertFalse();
    });

    /**
     * @tc.name          onConnectLifecycleConnectDoesNotMoveDestroyCount
     * @tc.desc          Connecting never increments the destroy counter.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Connect three times.
     *                   2. Read the destroy counter and events.
     *                   3. Confirm liveness.
     * @tc.expected      The destroy counter stays zero and no destroy event exists.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onConnectLifecycleConnectDoesNotMoveDestroyCount', 0, () => {
      const service: ServiceLifecycleModel = idleService();
      connectTimes(service, 3);
      expect(service.destroyCount).assertEqual(0);
      expect(service.events.countOf(EVENT_ON_DESTROY)).assertEqual(0);
      expect(service.events.trace().indexOf(EVENT_ON_DESTROY)).assertLess(0);
      expect(service.isAlive()).assertTrue();
      expect(service.state).assertEqual('connected');
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(3);
      expect(service.logs.contains('onDestroy')).assertFalse();
      expect(service.events.size()).assertEqual(3);
    });

    /**
     * @tc.name          onConnectLifecycleStubReplyAfterReconnect
     * @tc.desc          A stub obtained after reconnecting answers code one.
     * @tc.precondition  A model has connected, disconnected and connected again.
     * @tc.steps         1. Perform the reconnect cycle.
     *                   2. Send through the newest stub.
     *                   3. Inspect the reply and counters.
     * @tc.expected      The newest stub replies and the connect count is two.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onConnectLifecycleStubReplyAfterReconnect', 0, () => {
      const service: ServiceLifecycleModel = idleService();
      service.onConnect();
      service.onDisconnect();
      const stub: StubRemoteObjectModel = service.onConnect();
      const client: InProcessClient = new InProcessClient(stub);
      const result = client.send(1, 'reconnected');
      expect(result.isSuccess()).assertTrue();
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(stub.requestCount()).assertEqual(1);
      expect(service.connectCount).assertEqual(2);
      expect(service.disconnectCount).assertEqual(1);
      expect(service.state).assertEqual('connected');
      expect(service.stub === stub).assertTrue();
      expect(client.sentTexts[0]).assertEqual('reconnected');
    });

    /**
     * @tc.name          onConnectLifecycleFinalSnapshotAfterConnectDestroy
     * @tc.desc          Destroying after connect leaves connect totals in the snapshot.
     * @tc.precondition  A connected model is available.
     * @tc.steps         1. Connect twice.
     *                   2. Destroy the model.
     *                   3. Capture and describe the snapshot.
     * @tc.expected      The describe text is destroyed/2/0/0/1.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onConnectLifecycleFinalSnapshotAfterConnectDestroy', 0, () => {
      const service: ServiceLifecycleModel = idleService();
      connectTimes(service, 2);
      service.onDestroy();
      const snapshot: ServiceSnapshot = connectedSnapshot(service);
      expect(snapshot.state).assertEqual('destroyed');
      expect(snapshot.connects).assertEqual(2);
      expect(snapshot.destroys).assertEqual(1);
      expect(snapshot.describe()).assertEqual('destroyed/2/0/0/1');
      expect(service.isAlive()).assertFalse();
      expect(service.connectCount).assertEqual(2);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(2);
      expect(service.events.last()).assertEqual(EVENT_ON_DESTROY);
    });

    /**
     * @tc.name          onConnectLifecycleDescriptorRepeatedEquality
     * @tc.desc          Every stub from repeated connects shares one descriptor.
     * @tc.precondition  A fresh lifecycle model is available.
     * @tc.steps         1. Connect four times.
     *                   2. Compare all descriptors.
     *                   3. Count unique descriptors.
     * @tc.expected      All four descriptors equal the shared constant.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onConnectLifecycleDescriptorRepeatedEquality', 0, () => {
      const service: ServiceLifecycleModel = idleService();
      const stubs: StubRemoteObjectModel[] = connectTimes(service, 4);
      const descriptors: string[] = [];
      for (let index = 0; index < stubs.length; index++) {
        descriptors.push(stubs[index].descriptor);
      }
      expect(descriptors.length).assertEqual(4);
      expect(descriptors[0]).assertEqual(STUB_DESCRIPTOR);
      expect(descriptors[1]).assertEqual(STUB_DESCRIPTOR);
      expect(descriptors[3]).assertEqual(STUB_DESCRIPTOR);
      expect(descriptors[0] === descriptors[3]).assertTrue();
      expect(stubs[0].descriptor).assertEqual(stubs[3].descriptor);
      expect(service.events.size()).assertEqual(4);
      expect(service.connectCount).assertEqual(4);
    });

    /**
     * @tc.name          onConnectLifecycleConnectPreservesRequestTotal
     * @tc.desc          Reconnecting does not reset the lifecycle request counter.
     * @tc.precondition  A model has received two requests.
     * @tc.steps         1. Request twice.
     *                   2. Connect again.
     *                   3. Compare the request total and trace.
     * @tc.expected      The request total stays two after the new connect.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onConnectLifecycleConnectPreservesRequestTotal', 0, () => {
      const service: ServiceLifecycleModel = idleService();
      service.onRequest(1);
      service.onRequest(2);
      service.onConnect();
      expect(service.requestCount).assertEqual(2);
      expect(service.connectCount).assertEqual(1);
      expect(service.events.trace()).assertEqual(
        'onRequest:1>onRequest:2>onConnect:IPCStubTest');
      expect(service.events.countOf(EVENT_ON_REQUEST)).assertEqual(2);
      expect(service.events.entries[2]).assertEqual('onConnect:IPCStubTest');
      expect(service.state).assertEqual('connected');
      expect(service.logs.size()).assertEqual(3);
      expect(service.events.size()).assertEqual(3);
    });

    /**
     * @tc.name          onConnectLifecycleConnectedSnapshotNotShared
     * @tc.desc          Snapshots from separate connected models are independent.
     * @tc.precondition  Two connected models are available.
     * @tc.steps         1. Connect the first model once and the second twice.
     *                   2. Capture both snapshots.
     *                   3. Compare connect fields.
     * @tc.expected      The snapshots report one and two connects.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('onConnectLifecycleConnectedSnapshotNotShared', 0, () => {
      const first: ServiceLifecycleModel = connectedService();
      const second: ServiceLifecycleModel = idleService();
      connectTimes(second, 2);
      const firstSnapshot: ServiceSnapshot = connectedSnapshot(first);
      const secondSnapshot: ServiceSnapshot = connectedSnapshot(second);
      expect(firstSnapshot.connects).assertEqual(1);
      expect(secondSnapshot.connects).assertEqual(2);
      expect(firstSnapshot.connects === secondSnapshot.connects).assertFalse();
      expect(firstSnapshot.sameAs(secondSnapshot)).assertFalse();
      expect(firstSnapshot.describe()).assertEqual('connected/1/0/0/0');
      expect(secondSnapshot.describe()).assertEqual('connected/2/0/0/0');
      expect(first.connectCount).assertEqual(1);
      expect(second.connectCount).assertEqual(2);
    });
  });
}
