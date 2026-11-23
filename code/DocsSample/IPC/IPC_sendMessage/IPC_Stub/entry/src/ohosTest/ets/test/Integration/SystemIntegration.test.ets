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
import { logSuite } from '../Shared/Support';
import {
  STUB_DESCRIPTOR,
  REQUEST_CODE,
  UNKNOWN_CODE_ZERO,
  UNKNOWN_CODE_TWO,
  UNKNOWN_CODE_NEGATIVE,
  UNKNOWN_CODE_LARGE,
  REQUEST_PAYLOAD,
  REPLY_PAYLOAD,
  EVENT_ON_CREATE,
  EVENT_ON_CONNECT,
  EVENT_ON_DISCONNECT,
  EVENT_ON_DESTROY,
  EVENT_ON_REQUEST,
  LEVEL_INFO,
  InProcessClient,
  StubRemoteObjectModel,
  ServiceLifecycleModel,
  ServiceSnapshot,
  StubMetrics,
  StubRequestRecord,
  countOf,
  joined,
  textFingerprint
} from '../Shared/SharedDriver';

function sessionCodes(count: number): number[] {
  const codes: number[] = [];
  for (let index = 0; index < count; index++) {
    codes.push(index % 3 === 0 ? UNKNOWN_CODE_ZERO : REQUEST_CODE);
  }
  return codes;
}

function sessionHandled(count: number): number {
  let handled = 0;
  for (let index = 0; index < count; index++) {
    if (index % 3 !== 0) {
      handled = handled + 1;
    }
  }
  return handled;
}

export default function systemIntegration(): void {
  describe('IntegrationSystem', () => {
    beforeAll(() => {
      logSuite('IntegrationSystem', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('IntegrationSystem', 'end');
    });

    /**
     * @tc.name          systemIntegrationFullLifecycleSequence
     * @tc.desc          The full production callback sequence is exercised in order.
     * @tc.precondition  A fresh service lifecycle model exists.
     * @tc.steps         1. Call create, request and connect.
     *                   2. Send a request through the returned stub.
     *                   3. Disconnect and destroy.
     * @tc.expected      All five callbacks appear in order and the state is destroyed.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('systemIntegrationFullLifecycleSequence', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onRequest(1);
      const stub = service.onConnect();
      new InProcessClient(stub).send(REQUEST_CODE, REQUEST_PAYLOAD);
      service.onDisconnect();
      service.onDestroy();
      expect(service.events.trace()).assertEqual(
        'onCreate>onRequest:1>onConnect:' + STUB_DESCRIPTOR + '>onDisconnect>onDestroy');
      expect(service.state).assertEqual('destroyed');
      expect(service.isAlive()).assertFalse();
      expect(service.events.size()).assertEqual(5);
      expect(service.destroyCount).assertEqual(1);
    });

    /**
     * @tc.name          systemIntegrationOnConnectReturnsStub
     * @tc.desc          onConnect returns an independent stub with no prior records.
     * @tc.precondition  A service has been created.
     * @tc.steps         1. Call onConnect.
     *                   2. Read the stub descriptor and ledger.
     *                   3. Send one request.
     * @tc.expected      The stub starts empty with the production descriptor.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('systemIntegrationOnConnectReturnsStub', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const stub = service.onConnect();
      expect(stub.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(stub.alive).assertTrue();
      expect(stub.requestCount()).assertEqual(0);
      expect(service.state).assertEqual('connected');
      const result = new InProcessClient(stub).send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(result.isSuccess()).assertTrue();
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
    });

    /**
     * @tc.name          systemIntegrationDescriptorPropagation
     * @tc.desc          The descriptor from onConnect matches the production literal.
     * @tc.precondition  A service is connected.
     * @tc.steps         1. Capture the stub descriptor.
     *                   2. Compare with the constant and event detail.
     *                   3. Send one request.
     * @tc.expected      The stub descriptor, constant and event detail all contain IPCStubTest.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('systemIntegrationDescriptorPropagation', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const stub = service.onConnect();
      expect(stub.descriptor).assertEqual('IPCStubTest');
      expect(service.events.last()).assertEqual(EVENT_ON_CONNECT + ':' + 'IPCStubTest');
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(1);
      expect(new InProcessClient(stub).send(REQUEST_CODE).replyText).assertEqual(REPLY_PAYLOAD);
      expect(service.logs.contains(EVENT_ON_CONNECT)).assertTrue();
      expect(service.state).assertEqual('connected');
    });

    /**
     * @tc.name          systemIntegrationRequestAfterConnect
     * @tc.desc          Stub traffic after connect does not touch service request counters.
     * @tc.precondition  A connected service exposes a stub.
     * @tc.steps         1. Send five stub requests.
     *                   2. Read service and stub counters.
     *                   3. Compare with metrics.
     * @tc.expected      The stub reports five while the service request count stays zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('systemIntegrationRequestAfterConnect', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const stub = service.onConnect();
      new InProcessClient(stub).sendMany(5);
      expect(stub.requestCount()).assertEqual(5);
      expect(service.requestCount).assertEqual(0);
      expect(StubMetrics.from(stub).handled).assertEqual(5);
      expect(service.state).assertEqual('connected');
      expect(service.connectCount).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_REQUEST)).assertEqual(0);
    });

    /**
     * @tc.name          systemIntegrationDisconnectKeepsStubLedger
     * @tc.desc          Disconnecting does not erase replies already recorded.
     * @tc.precondition  A connected service has served traffic.
     * @tc.steps         1. Send three requests.
     *                   2. Disconnect the service.
     *                   3. Read the stub ledger and snapshot.
     * @tc.expected      The ledger keeps three rows and the snapshot shows disconnected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('systemIntegrationDisconnectKeepsStubLedger', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const stub = service.onConnect();
      const client = new InProcessClient(stub);
      client.sendMany(3);
      service.onDisconnect();
      const snapshot = new ServiceSnapshot(service);
      expect(stub.requestCount()).assertEqual(3);
      expect(client.replies.length).assertEqual(3);
      expect(snapshot.state).assertEqual('disconnected');
      expect(snapshot.disconnects).assertEqual(1);
      expect(snapshot.connects).assertEqual(1);
      expect(service.events.last()).assertEqual(EVENT_ON_DISCONNECT);
    });

    /**
     * @tc.name          systemIntegrationDestroyFinalState
     * @tc.desc          Destroy leaves a dead service but a usable stub.
     * @tc.precondition  A service is connected with recorded traffic.
     * @tc.steps         1. Connect and send two requests.
     *                   2. Destroy the service.
     *                   3. Send one more request.
     * @tc.expected      The service is dead while the stub still handles requests.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('systemIntegrationDestroyFinalState', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const stub = service.onConnect();
      const client = new InProcessClient(stub);
      client.sendMany(2);
      service.onDestroy();
      const after = client.send(REQUEST_CODE, 'post-destroy');
      expect(service.isAlive()).assertFalse();
      expect(service.state).assertEqual('destroyed');
      expect(service.destroyCount).assertEqual(1);
      expect(after.isSuccess()).assertTrue();
      expect(stub.requestCount()).assertEqual(3);
      expect(stub.requests[2].text).assertEqual('post-destroy');
    });

    /**
     * @tc.name          systemIntegrationLifecycleCountersReconcile
     * @tc.desc          Lifecycle counters reconcile with the recorded events.
     * @tc.precondition  A service has completed create, three requests, connect and disconnect.
     * @tc.steps         1. Invoke each callback.
     *                   2. Read all counters.
     *                   3. Compare with event counts.
     * @tc.expected      Requests read three and both connection counters read one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('systemIntegrationLifecycleCountersReconcile', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onRequest(1);
      service.onRequest(2);
      service.onRequest(3);
      service.onConnect();
      service.onDisconnect();
      expect(service.requestCount).assertEqual(3);
      expect(service.connectCount).assertEqual(1);
      expect(service.disconnectCount).assertEqual(1);
      expect(service.destroyCount).assertEqual(0);
      expect(service.events.countOf(EVENT_ON_REQUEST)).assertEqual(3);
      expect(service.events.size()).assertEqual(6);
    });

    /**
     * @tc.name          systemIntegrationEventTraceFingerprint
     * @tc.desc          The full session trace has a deterministic fingerprint.
     * @tc.precondition  A complete service session has run.
     * @tc.steps         1. Build the expected trace literal.
     *                   2. Read the recorder trace.
     *                   3. Compare fingerprints.
     * @tc.expected      Both fingerprints and traces match exactly.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('systemIntegrationEventTraceFingerprint', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onRequest(42);
      service.onConnect();
      service.onDisconnect();
      service.onDestroy();
      const expected = 'onCreate>onRequest:42>onConnect:' + STUB_DESCRIPTOR + '>onDisconnect>onDestroy';
      expect(service.events.trace()).assertEqual(expected);
      expect(service.events.fingerprint()).assertEqual(textFingerprint(expected));
      expect(service.events.last()).assertEqual(EVENT_ON_DESTROY);
      expect(service.events.countOf(EVENT_ON_CREATE)).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_REQUEST)).assertEqual(1);
      expect(service.events.size()).assertEqual(5);
    });

    /**
     * @tc.name          systemIntegrationLogCapturesLifecycle
     * @tc.desc          Every lifecycle callback writes a service log line.
     * @tc.precondition  A service session has run.
     * @tc.steps         1. Create and connect the service.
     *                   2. Send three requests and disconnect.
     *                   3. Search the logs for each callback.
     * @tc.expected      All lifecycle names are present in the bounded log.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('systemIntegrationLogCapturesLifecycle', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onRequest(1);
      service.onRequest(2);
      service.onRequest(3);
      service.onConnect();
      service.onDisconnect();
      expect(service.logs.size()).assertEqual(6);
      expect(service.logs.contains(EVENT_ON_CREATE)).assertTrue();
      expect(service.logs.contains(EVENT_ON_CONNECT)).assertTrue();
      expect(service.logs.contains(EVENT_ON_DISCONNECT)).assertTrue();
      expect(service.logs.contains('onRequest 2')).assertTrue();
      expect(service.logs.countLevel(LEVEL_INFO)).assertEqual(6);
      expect(service.logs.trace().split('|').length).assertEqual(6);
    });

    /**
     * @tc.name          systemIntegrationBoundedLogsFullSession
     * @tc.desc          A long session keeps logs bounded while events accumulate.
     * @tc.precondition  A service model is created.
     * @tc.steps         1. Send three hundred requests.
     *                   2. Connect, disconnect and destroy.
     *                   3. Read log and event sizes.
     * @tc.expected      Logs stop at 128 lines while events reach 304.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('systemIntegrationBoundedLogsFullSession', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      for (let index = 0; index < 300; index++) {
        service.onRequest(index + 1);
      }
      service.onConnect();
      service.onDisconnect();
      service.onDestroy();
      expect(service.logs.size()).assertEqual(128);
      expect(service.events.size()).assertEqual(304);
      expect(service.logs.contains(EVENT_ON_DESTROY)).assertTrue();
      expect(service.logs.contains('onRequest 175')).assertFalse();
      expect(service.requestCount).assertEqual(300);
      expect(service.destroyCount).assertEqual(1);
    });

    /**
     * @tc.name          systemIntegrationStubMetricsInSession
     * @tc.desc          Stub metrics inside a live session match client observations.
     * @tc.precondition  A connected stub has handled a mixed plan.
     * @tc.steps         1. Send a mixed plan of nine.
     *                   2. Build metrics.
     *                   3. Compare with client replies and rows.
     * @tc.expected      Six handled and three rejected rows with six replies.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('systemIntegrationStubMetricsInSession', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const stub = service.onConnect();
      const client = new InProcessClient(stub);
      const codes = sessionCodes(9);
      for (let index = 0; index < codes.length; index++) {
        client.send(codes[index], 'session-' + String(index));
      }
      const metrics = StubMetrics.from(stub);
      expect(metrics.requests).assertEqual(9);
      expect(metrics.handled).assertEqual(sessionHandled(9));
      expect(metrics.handled).assertEqual(6);
      expect(metrics.rejected).assertEqual(3);
      expect(metrics.replies).assertEqual(6);
      expect(client.replies.length).assertEqual(6);
      expect(metrics.successRatio()).assertEqual(2 / 3);
    });

    /**
     * @tc.name          systemIntegrationSnapshotRoundTrip
     * @tc.desc          A snapshot stays valid while no lifecycle change occurs.
     * @tc.precondition  A service is connected and has served traffic.
     * @tc.steps         1. Capture a snapshot and its description.
     *                   2. Capture a second snapshot.
     *                   3. Compare both objects.
     * @tc.expected      The snapshots match and describe identical counters.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('systemIntegrationSnapshotRoundTrip', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const stub = service.onConnect();
      new InProcessClient(stub).sendMany(4);
      service.onRequest(1);
      const first = new ServiceSnapshot(service);
      const second = new ServiceSnapshot(service);
      expect(first.sameAs(second)).assertTrue();
      expect(first.describe()).assertEqual(second.describe());
      expect(first.connects).assertEqual(1);
      expect(first.requests).assertEqual(1);
      expect(first.state).assertEqual('connected');
      expect(first.describe()).assertEqual('connected/1/0/1/0');
    });

    /**
     * @tc.name          systemIntegrationClientReceivesReply
     * @tc.desc          A client connected through the service receives hello rpc.
     * @tc.precondition  A service is connected and returns a stub.
     * @tc.steps         1. Send the production payload.
     *                   2. Read the reply and result flag.
     *                   3. Inspect the ledger row.
     * @tc.expected      The reply literal, handled flag and row text all match production.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('systemIntegrationClientReceivesReply', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const stub = service.onConnect();
      const client = new InProcessClient(stub);
      const result = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(result.handled).assertTrue();
      expect(result.isSuccess()).assertTrue();
      expect(result.replyText).assertEqual('hello rpc');
      expect(client.replies[0]).assertEqual(REPLY_PAYLOAD);
      expect(stub.lastRequest()?.text).assertEqual(REQUEST_PAYLOAD);
      expect(service.state).assertEqual('connected');
    });

    /**
     * @tc.name          systemIntegrationUnknownCodeInSession
     * @tc.desc          An unknown code in a service session is rejected cleanly.
     * @tc.precondition  A connected service stub exists.
     * @tc.steps         1. Send an unknown code.
     *                   2. Send a valid code.
     *                   3. Compare the two results.
     * @tc.expected      The unknown code fails with no reply while the valid code succeeds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('systemIntegrationUnknownCodeInSession', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const stub = service.onConnect();
      const client = new InProcessClient(stub);
      const rejected = client.send(UNKNOWN_CODE_TWO, 'bad');
      const accepted = client.send(REQUEST_CODE, 'good');
      expect(rejected.isSuccess()).assertFalse();
      expect(rejected.replyText).assertEqual('');
      expect(accepted.isSuccess()).assertTrue();
      expect(stub.requestCount()).assertEqual(2);
      expect(stub.requests[0].handled).assertFalse();
      expect(stub.requests[1].handled).assertTrue();
      expect(StubMetrics.from(stub).rejected).assertEqual(1);
    });

    /**
     * @tc.name          systemIntegrationReconnectNewStub
     * @tc.desc          A second onConnect returns a fresh, independent stub.
     * @tc.precondition  A service has connected once and served traffic.
     * @tc.steps         1. Capture the first stub.
     *                   2. Disconnect and connect again.
     *                   3. Send through the second stub.
     * @tc.expected      The second stub starts empty and the connect count reaches two.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('systemIntegrationReconnectNewStub', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const firstStub = service.onConnect();
      new InProcessClient(firstStub).sendMany(3);
      service.onDisconnect();
      const secondStub = service.onConnect();
      expect(secondStub === firstStub).assertFalse();
      expect(secondStub.requestCount()).assertEqual(0);
      expect(secondStub.descriptor).assertEqual(STUB_DESCRIPTOR);
      new InProcessClient(secondStub).send(REQUEST_CODE, 'reconnected');
      expect(secondStub.requestCount()).assertEqual(1);
      expect(service.connectCount).assertEqual(2);
      expect(service.disconnectCount).assertEqual(1);
    });

    /**
     * @tc.name          systemIntegrationReconnectOldStubIndependent
     * @tc.desc          Traffic on a new stub never reaches the old stub.
     * @tc.precondition  Two stubs have been returned by successive connects.
     * @tc.steps         1. Send two requests to the old stub.
     *                   2. Send three to the new stub.
     *                   3. Compare both ledgers.
     * @tc.expected      The old stub holds two rows and the new stub holds three.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('systemIntegrationReconnectOldStubIndependent', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const oldStub = service.onConnect();
      service.onDisconnect();
      const newStub = service.onConnect();
      new InProcessClient(oldStub).sendMany(2);
      new InProcessClient(newStub).sendMany(3);
      expect(oldStub.requestCount()).assertEqual(2);
      expect(newStub.requestCount()).assertEqual(3);
      expect(oldStub.requests[1].text).assertEqual(REQUEST_PAYLOAD);
      expect(newStub.requests[2].text).assertEqual(REQUEST_PAYLOAD);
      expect(StubMetrics.from(oldStub).requests).assertEqual(2);
      expect(StubMetrics.from(newStub).requests).assertEqual(3);
    });

    /**
     * @tc.name          systemIntegrationTwoClientsOneService
     * @tc.desc          Two clients share one connected stub inside a session.
     * @tc.precondition  A service is connected.
     * @tc.steps         1. Attach two clients to the stub.
     *                   2. Send four requests from each.
     *                   3. Compare per-client and stub totals.
     * @tc.expected      Each client holds four replies and the stub holds eight rows.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('systemIntegrationTwoClientsOneService', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const stub = service.onConnect();
      const first = new InProcessClient(stub);
      const second = new InProcessClient(stub);
      first.sendMany(4);
      second.sendMany(4);
      expect(first.replies.length).assertEqual(4);
      expect(second.replies.length).assertEqual(4);
      expect(stub.requestCount()).assertEqual(8);
      expect(StubMetrics.from(stub).handled).assertEqual(8);
      expect(service.connectCount).assertEqual(1);
      expect(service.state).assertEqual('connected');
    });

    /**
     * @tc.name          systemIntegrationMultiSessionCounters
     * @tc.desc          Three connect-disconnect sessions accumulate connection counters.
     * @tc.precondition  A service model is created once.
     * @tc.steps         1. Run three connect, send and disconnect sessions.
     *                   2. Count connections and disconnections.
     *                   3. Inspect the final state.
     * @tc.expected      Both counters read three and the state is disconnected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('systemIntegrationMultiSessionCounters', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      for (let session = 0; session < 3; session++) {
        const stub = service.onConnect();
        new InProcessClient(stub).send(REQUEST_CODE, 'session-' + String(session));
        service.onDisconnect();
      }
      expect(service.connectCount).assertEqual(3);
      expect(service.disconnectCount).assertEqual(3);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(3);
      expect(service.events.countOf(EVENT_ON_DISCONNECT)).assertEqual(3);
      expect(service.state).assertEqual('disconnected');
      expect(service.isAlive()).assertTrue();
    });

    /**
     * @tc.name          systemIntegrationRequestIdsRecorded
     * @tc.desc          Consecutive onRequest start ids are preserved in order.
     * @tc.precondition  A service model exists.
     * @tc.steps         1. Call onRequest with four increasing ids.
     *                   2. Read the event trace.
     *                   3. Compare with the expected literal.
     * @tc.expected      The trace lists all four ids in call order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('systemIntegrationRequestIdsRecorded', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onRequest(101);
      service.onRequest(102);
      service.onRequest(103);
      service.onRequest(104);
      expect(service.events.trace()).assertEqual('onRequest:101>onRequest:102>onRequest:103>onRequest:104');
      expect(service.requestCount).assertEqual(4);
      expect(service.events.size()).assertEqual(4);
      expect(service.events.countOf(EVENT_ON_REQUEST)).assertEqual(4);
      expect(service.logs.contains('onRequest 104')).assertTrue();
      expect(service.logs.contains('onRequest 101')).assertTrue();
    });

    /**
     * @tc.name          systemIntegrationServiceAliveBeforeDestroy
     * @tc.desc          A created and connected service reports itself alive.
     * @tc.precondition  A service has been created and connected.
     * @tc.steps         1. Read the alive flag in each state.
     *                   2. Disconnect and read it again.
     *                   3. Compare with the state literal.
     * @tc.expected      The service is alive in created, connected and disconnected states.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('systemIntegrationServiceAliveBeforeDestroy', 0, () => {
      const service = new ServiceLifecycleModel();
      expect(service.isAlive()).assertTrue();
      service.onCreate();
      expect(service.isAlive()).assertTrue();
      expect(service.state).assertEqual('created');
      service.onConnect();
      expect(service.isAlive()).assertTrue();
      expect(service.state).assertEqual('connected');
      service.onDisconnect();
      expect(service.isAlive()).assertTrue();
      expect(service.state).assertEqual('disconnected');
    });

    /**
     * @tc.name          systemIntegrationServiceNotAliveAfterDestroy
     * @tc.desc          Destroy is the only callback that clears the alive flag.
     * @tc.precondition  A service is connected and serving traffic.
     * @tc.steps         1. Destroy the service.
     *                   2. Read the alive flag and state.
     *                   3. Compare with the snapshot.
     * @tc.expected      The service reports not alive with a destroyed snapshot.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('systemIntegrationServiceNotAliveAfterDestroy', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onConnect();
      expect(service.isAlive()).assertTrue();
      service.onDestroy();
      const snapshot = new ServiceSnapshot(service);
      expect(service.isAlive()).assertFalse();
      expect(service.state).assertEqual('destroyed');
      expect(snapshot.state).assertEqual('destroyed');
      expect(snapshot.destroys).assertEqual(1);
      expect(snapshot.describe()).assertEqual('destroyed/1/0/0/1');
      expect(service.events.last()).assertEqual(EVENT_ON_DESTROY);
    });

    /**
     * @tc.name          systemIntegrationStubAliveAfterDestroy
     * @tc.desc          Destroying the service does not kill the returned stub.
     * @tc.precondition  A service returned a stub before destruction.
     * @tc.steps         1. Connect and destroy.
     *                   2. Read the stub alive flag.
     *                   3. Send one request through it.
     * @tc.expected      The stub remains alive and handles the request.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('systemIntegrationStubAliveAfterDestroy', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const stub = service.onConnect();
      service.onDestroy();
      expect(stub.alive).assertTrue();
      expect(stub.descriptor).assertEqual(STUB_DESCRIPTOR);
      const result = new InProcessClient(stub).send(REQUEST_CODE, 'survivor');
      expect(result.isSuccess()).assertTrue();
      expect(stub.requestCount()).assertEqual(1);
      expect(stub.requests[0].text).assertEqual('survivor');
      expect(service.isAlive()).assertFalse();
    });

    /**
     * @tc.name          systemIntegrationLogLevelsInSession
     * @tc.desc          Session log lines are all info-level entries.
     * @tc.precondition  A normal session has run.
     * @tc.steps         1. Run a create, request, connect, disconnect session.
     *                   2. Read each level count.
     *                   3. Compare the totals.
     * @tc.expected      All four lines are info level with no warnings or errors.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('systemIntegrationLogLevelsInSession', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onRequest(1);
      service.onConnect();
      service.onDisconnect();
      expect(service.logs.size()).assertEqual(4);
      expect(service.logs.countLevel(LEVEL_INFO)).assertEqual(4);
      expect(service.logs.countLevel('WARN')).assertEqual(0);
      expect(service.logs.countLevel('ERROR')).assertEqual(0);
      expect(service.logs.lines[0]).assertEqual('INFO onCreate');
      expect(service.logs.lines[3]).assertEqual('INFO onDisconnect');
      expect(service.logs.trace().split('|').length).assertEqual(4);
    });

    /**
     * @tc.name          systemIntegrationEventCountsMatchCounters
     * @tc.desc          Event kind counts equal their lifecycle counters.
     * @tc.precondition  A service has two connect-disconnect cycles and one destroy.
     * @tc.steps         1. Drive two cycles and destroy.
     *                   2. Compare event counts with counters.
     *                   3. Read the total event count.
     * @tc.expected      Every kind count equals its counter.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('systemIntegrationEventCountsMatchCounters', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onConnect();
      service.onDisconnect();
      service.onConnect();
      service.onDisconnect();
      service.onDestroy();
      expect(service.events.countOf(EVENT_ON_CREATE)).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(service.connectCount);
      expect(service.events.countOf(EVENT_ON_DISCONNECT)).assertEqual(service.disconnectCount);
      expect(service.events.countOf(EVENT_ON_DESTROY)).assertEqual(service.destroyCount);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(2);
      expect(service.events.size()).assertEqual(6);
    });

    /**
     * @tc.name          systemIntegrationFullSessionAudit
     * @tc.desc          Every observable agrees at the end of a full session.
     * @tc.precondition  A service session with twelve mixed stub requests exists.
     * @tc.steps         1. Run create, request, connect, traffic, disconnect, destroy.
     *                   2. Cross-check counters, metrics and snapshot.
     *                   3. Verify the final state.
     * @tc.expected      All counters, replies and states reconcile.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('systemIntegrationFullSessionAudit', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onRequest(1);
      const stub = service.onConnect();
      const client = new InProcessClient(stub);
      const codes = sessionCodes(12);
      for (let index = 0; index < codes.length; index++) {
        client.send(codes[index], 'audit-' + String(index));
      }
      service.onDisconnect();
      service.onDestroy();
      expect(stub.requestCount()).assertEqual(12);
      expect(StubMetrics.from(stub).handled).assertEqual(8);
      expect(StubMetrics.from(stub).rejected).assertEqual(4);
      expect(client.replies.length).assertEqual(8);
      expect(service.state).assertEqual('destroyed');
      expect(service.events.size()).assertEqual(5);
    });

    /**
     * @tc.name          systemIntegrationCreateTwiceRecordsTwoEvents
     * @tc.desc          Calling onCreate twice records two create events.
     * @tc.precondition  A fresh service model exists.
     * @tc.steps         1. Call onCreate twice.
     *                   2. Read the event count and state.
     *                   3. Call onDestroy once.
     * @tc.expected      Two create events are recorded before destruction.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('systemIntegrationCreateTwiceRecordsTwoEvents', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onCreate();
      expect(service.events.countOf(EVENT_ON_CREATE)).assertEqual(2);
      expect(service.events.size()).assertEqual(2);
      expect(service.state).assertEqual('created');
      expect(service.logs.size()).assertEqual(2);
      expect(service.logs.countLevel(LEVEL_INFO)).assertEqual(2);
      service.onDestroy();
      expect(service.state).assertEqual('destroyed');
      expect(service.events.size()).assertEqual(3);
    });

    /**
     * @tc.name          systemIntegrationConnectTwiceDistinctStubs
     * @tc.desc          Two connects without a disconnect still yield distinct stubs.
     * @tc.precondition  A service is created.
     * @tc.steps         1. Call onConnect twice.
     *                   2. Compare the returned objects.
     *                   3. Send one request to each.
     * @tc.expected      The stubs are distinct and keep separate ledgers.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('systemIntegrationConnectTwiceDistinctStubs', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const first = service.onConnect();
      const second = service.onConnect();
      expect(first === second).assertFalse();
      new InProcessClient(first).send(REQUEST_CODE, 'first');
      new InProcessClient(second).send(REQUEST_CODE, 'second');
      expect(first.requestCount()).assertEqual(1);
      expect(second.requestCount()).assertEqual(1);
      expect(first.requests[0].text).assertEqual('first');
      expect(second.requests[0].text).assertEqual('second');
      expect(service.connectCount).assertEqual(2);
    });

    /**
     * @tc.name          systemIntegrationDisconnectWithoutConnect
     * @tc.desc          A disconnect without a prior connect is still recorded.
     * @tc.precondition  A freshly created service has no connection.
     * @tc.steps         1. Call onDisconnect directly.
     *                   2. Read the disconnect counter.
     *                   3. Inspect the state and event.
     * @tc.expected      The counter reads one and the state is disconnected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('systemIntegrationDisconnectWithoutConnect', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onDisconnect();
      expect(service.disconnectCount).assertEqual(1);
      expect(service.connectCount).assertEqual(0);
      expect(service.state).assertEqual('disconnected');
      expect(service.events.countOf(EVENT_ON_DISCONNECT)).assertEqual(1);
      expect(service.events.last()).assertEqual(EVENT_ON_DISCONNECT);
      expect(service.isAlive()).assertTrue();
    });

    /**
     * @tc.name          systemIntegrationDestroyWithoutConnect
     * @tc.desc          Destroy without a connection ends in the destroyed state.
     * @tc.precondition  A created service has never connected.
     * @tc.steps         1. Call onDestroy directly.
     *                   2. Read the destruction counter.
     *                   3. Compare the snapshot.
     * @tc.expected      The service is destroyed with zero connects.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('systemIntegrationDestroyWithoutConnect', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onDestroy();
      const snapshot = new ServiceSnapshot(service);
      expect(snapshot.state).assertEqual('destroyed');
      expect(snapshot.connects).assertEqual(0);
      expect(snapshot.destroys).assertEqual(1);
      expect(service.isAlive()).assertFalse();
      expect(service.stub).assertUndefined();
      expect(snapshot.describe()).assertEqual('destroyed/0/0/0/1');
    });

    /**
     * @tc.name          systemIntegrationRequestBeforeConnect
     * @tc.desc          An onRequest before connect is recorded without a stub.
     * @tc.precondition  A created service has no stub.
     * @tc.steps         1. Call onRequest before connecting.
     *                   2. Read the stub reference and counter.
     *                   3. Connect and send traffic.
     * @tc.expected      The request counter reads one and the stub appears only after connect.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('systemIntegrationRequestBeforeConnect', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onRequest(7);
      expect(service.requestCount).assertEqual(1);
      expect(service.stub).assertUndefined();
      expect(service.state).assertEqual('created');
      const stub = service.onConnect();
      expect(stub.requestCount()).assertEqual(0);
      new InProcessClient(stub).send(REQUEST_CODE);
      expect(stub.requestCount()).assertEqual(1);
      expect(service.requestCount).assertEqual(1);
    });

    /**
     * @tc.name          systemIntegrationLifecycleResetBetweenSessions
     * @tc.desc          Resetting the service between sessions clears history.
     * @tc.precondition  A service has completed one session.
     * @tc.steps         1. Run a session and reset the service.
     *                   2. Run a second session.
     *                   3. Compare counters.
     * @tc.expected      The second session starts from zero counters.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('systemIntegrationLifecycleResetBetweenSessions', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const firstStub = service.onConnect();
      new InProcessClient(firstStub).sendMany(6);
      service.onDisconnect();
      service.reset();
      expect(service.connectCount).assertEqual(0);
      expect(service.state).assertEqual('idle');
      service.onCreate();
      const secondStub = service.onConnect();
      new InProcessClient(secondStub).sendMany(2);
      expect(secondStub.requestCount()).assertEqual(2);
      expect(service.connectCount).assertEqual(1);
      expect(service.events.size()).assertEqual(2);
    });

    /**
     * @tc.name          systemIntegrationSessionWithMixedTraffic
     * @tc.desc          A session accepts a mixed code workload and records it.
     * @tc.precondition  A connected service stub exists.
     * @tc.steps         1. Send a hundred mixed requests.
     *                   2. Build metrics.
     *                   3. Verify ledger ordering.
     * @tc.expected      Sixty-six handled rows and thirty-four rejected rows.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('systemIntegrationSessionWithMixedTraffic', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const stub = service.onConnect();
      const client = new InProcessClient(stub);
      const codes = sessionCodes(100);
      for (let index = 0; index < codes.length; index++) {
        client.send(codes[index], 'mix-' + String(index));
      }
      const metrics = StubMetrics.from(stub);
      expect(metrics.requests).assertEqual(100);
      expect(metrics.handled).assertEqual(66);
      expect(metrics.rejected).assertEqual(34);
      expect(stub.requests[0].code).assertEqual(UNKNOWN_CODE_ZERO);
      expect(stub.requests[1].code).assertEqual(REQUEST_CODE);
      expect(client.replies.length).assertEqual(66);
    });

    /**
     * @tc.name          systemIntegrationSessionRatio
     * @tc.desc          A session with two-thirds valid traffic reports ratio two thirds.
     * @tc.precondition  A connected stub exists.
     * @tc.steps         1. Send ninety mixed requests.
     *                   2. Build metrics.
     *                   3. Compare the ratio.
     * @tc.expected      Sixty handled, thirty rejected and ratio 2 / 3.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('systemIntegrationSessionRatio', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const stub = service.onConnect();
      const client = new InProcessClient(stub);
      const codes = sessionCodes(90);
      for (let index = 0; index < codes.length; index++) {
        client.send(codes[index], 'ratio-' + String(index));
      }
      const metrics = StubMetrics.from(stub);
      expect(metrics.handled).assertEqual(60);
      expect(metrics.rejected).assertEqual(30);
      expect(metrics.successRatio()).assertEqual(2 / 3);
      expect(metrics.replies).assertEqual(60);
      expect(service.state).assertEqual('connected');
      expect(stub.requestCount()).assertEqual(90);
    });

    /**
     * @tc.name          systemIntegrationSessionFingerprint
     * @tc.desc          A session's metric fingerprint matches its counter literal.
     * @tc.precondition  A connected stub with a mixed plan exists.
     * @tc.steps         1. Send thirty mixed requests.
     *                   2. Build metrics.
     *                   3. Compare the fingerprint.
     * @tc.expected      The fingerprint equals the hash of 30:20:10:20.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('systemIntegrationSessionFingerprint', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const stub = service.onConnect();
      const client = new InProcessClient(stub);
      const codes = sessionCodes(30);
      for (let index = 0; index < codes.length; index++) {
        client.send(codes[index], 'fp-' + String(index));
      }
      const metrics = StubMetrics.from(stub);
      expect(metrics.requests).assertEqual(30);
      expect(metrics.handled).assertEqual(20);
      expect(metrics.rejected).assertEqual(10);
      expect(metrics.replies).assertEqual(20);
      expect(metrics.fingerprint()).assertEqual(textFingerprint('30:20:10:20'));
      expect(metrics.successRatio()).assertEqual(2 / 3);
    });

    /**
     * @tc.name          systemIntegrationClientTraceInSession
     * @tc.desc          A client trace inside a session lists only its own replies.
     * @tc.precondition  Two clients share the session stub.
     * @tc.steps         1. Send three valid requests from each client.
     *                   2. Join each client trace.
     *                   3. Compare with the reply literal.
     * @tc.expected      Each trace holds three identical reply literals.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('systemIntegrationClientTraceInSession', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const stub = service.onConnect();
      const first = new InProcessClient(stub);
      const second = new InProcessClient(stub);
      first.sendMany(3);
      second.sendMany(3);
      const expectedTrace = REPLY_PAYLOAD + '|' + REPLY_PAYLOAD + '|' + REPLY_PAYLOAD;
      expect(first.trace()).assertEqual(expectedTrace);
      expect(second.trace()).assertEqual(expectedTrace);
      expect(stub.requestCount()).assertEqual(6);
      expect(countOf(first.replies, REPLY_PAYLOAD)).assertEqual(3);
      expect(StubMetrics.from(stub).replies).assertEqual(6);
    });

    /**
     * @tc.name          systemIntegrationReplaySessionDeterministic
     * @tc.desc          Replaying a session produces identical events and metrics.
     * @tc.precondition  A session recipe is available.
     * @tc.steps         1. Run the recipe on one service.
     *                   2. Run it on a second service.
     *                   3. Compare traces and fingerprints.
     * @tc.expected      Both sessions share identical traces and metric fingerprints.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('systemIntegrationReplaySessionDeterministic', 0, () => {
      const first = new ServiceLifecycleModel();
      const second = new ServiceLifecycleModel();
      const services: ServiceLifecycleModel[] = [first, second];
      const fingerprints: number[] = [];
      for (let index = 0; index < services.length; index++) {
        const service = services[index];
        service.onCreate();
        service.onRequest(5);
        const stub = service.onConnect();
        new InProcessClient(stub).sendMany(7);
        service.onDisconnect();
        fingerprints.push(StubMetrics.from(stub).fingerprint());
      }
      expect(first.events.trace()).assertEqual(second.events.trace());
      expect(first.events.fingerprint()).assertEqual(second.events.fingerprint());
      expect(fingerprints[0]).assertEqual(fingerprints[1]);
      expect(first.logs.trace()).assertEqual(second.logs.trace());
      expect(first.requestCount).assertEqual(second.requestCount);
      expect(fingerprints[0]).assertEqual(textFingerprint('7:7:0:7'));
    });

    /**
     * @tc.name          systemIntegrationSnapshotAfterMixedLifecycle
     * @tc.desc          A snapshot after mixed callbacks reports exact counters.
     * @tc.precondition  A service is available.
     * @tc.steps         1. Create, request twice, connect, request and disconnect.
     *                   2. Destroy and snapshot.
     *                   3. Compare the description.
     * @tc.expected      The snapshot reads destroyed/1/1/3/1.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('systemIntegrationSnapshotAfterMixedLifecycle', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onRequest(1);
      service.onRequest(2);
      service.onConnect();
      service.onRequest(3);
      service.onDisconnect();
      service.onDestroy();
      const snapshot = new ServiceSnapshot(service);
      expect(snapshot.describe()).assertEqual('destroyed/1/1/3/1');
      expect(snapshot.requests).assertEqual(3);
      expect(snapshot.connects).assertEqual(1);
      expect(snapshot.disconnects).assertEqual(1);
      expect(snapshot.destroys).assertEqual(1);
      expect(snapshot.sameAs(new ServiceSnapshot(service))).assertTrue();
    });

    /**
     * @tc.name          systemIntegrationLifecycleTraceWithDetails
     * @tc.desc          Connect events carry the descriptor detail in the trace.
     * @tc.precondition  A service has connected twice.
     * @tc.steps         1. Connect twice with a disconnect between.
     *                   2. Read the trace.
     *                   3. Count detailed connect events.
     * @tc.expected      Both connect events carry the IPCStubTest detail.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('systemIntegrationLifecycleTraceWithDetails', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onConnect();
      service.onDisconnect();
      service.onConnect();
      expect(service.events.trace()).assertEqual(
        'onCreate>onConnect:' + STUB_DESCRIPTOR + '>onDisconnect>onConnect:' + STUB_DESCRIPTOR);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(2);
      expect(service.events.size()).assertEqual(4);
      expect(service.events.last()).assertEqual('onConnect:' + STUB_DESCRIPTOR);
      expect(service.events.fingerprint()).assertEqual(textFingerprint(service.events.trace()));
      expect(service.connectCount).assertEqual(2);
    });

    /**
     * @tc.name          systemIntegrationServiceResetClearsSession
     * @tc.desc          Resetting the service releases every session artifact.
     * @tc.precondition  A complete session with traffic exists.
     * @tc.steps         1. Run a session with stub traffic.
     *                   2. Reset the service.
     *                   3. Audit logs, events and references.
     * @tc.expected      Logs, events and the stub reference are all cleared.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('systemIntegrationServiceResetClearsSession', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const stub = service.onConnect();
      new InProcessClient(stub).sendMany(5);
      service.onRequest(1);
      service.onDisconnect();
      service.onDestroy();
      service.reset();
      expect(service.logs.size()).assertEqual(0);
      expect(service.events.size()).assertEqual(0);
      expect(service.stub).assertUndefined();
      expect(service.state).assertEqual('idle');
      expect(service.connectCount + service.disconnectCount + service.requestCount + service.destroyCount)
        .assertEqual(0);
      expect(stub.requestCount()).assertEqual(5);
    });

    /**
     * @tc.name          systemIntegrationLogContainsAllCallbacks
     * @tc.desc          The bounded log names every lifecycle callback that ran.
     * @tc.precondition  A full session has been executed.
     * @tc.steps         1. Run create, request, connect, disconnect and destroy.
     *                   2. Search the log for each name.
     *                   3. Read the total size.
     * @tc.expected      All five callback names appear in the log.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('systemIntegrationLogContainsAllCallbacks', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onRequest(1);
      service.onConnect();
      service.onDisconnect();
      service.onDestroy();
      expect(service.logs.size()).assertEqual(5);
      expect(service.logs.contains(EVENT_ON_CREATE)).assertTrue();
      expect(service.logs.contains(EVENT_ON_REQUEST)).assertTrue();
      expect(service.logs.contains(EVENT_ON_CONNECT)).assertTrue();
      expect(service.logs.contains(EVENT_ON_DISCONNECT)).assertTrue();
      expect(service.logs.contains(EVENT_ON_DESTROY)).assertTrue();
      expect(service.logs.trace()).assertEqual('INFO onCreate|INFO onRequest 1|INFO onConnect|INFO onDisconnect|INFO onDestroy');
    });

    /**
     * @tc.name          systemIntegrationFullPipelineOrdering
     * @tc.desc          The end-to-end pipeline stages execute in production order.
     * @tc.precondition  A full service session is available.
     * @tc.steps         1. Create, connect and send a stub request.
     *                   2. Disconnect and destroy.
     *                   3. Compare events with the lifecycle stages.
     * @tc.expected      The event order matches create, connect, disconnect, destroy.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('systemIntegrationFullPipelineOrdering', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const stub = service.onConnect();
      const client = new InProcessClient(stub);
      client.send(REQUEST_CODE, 'pipeline');
      service.onDisconnect();
      service.onDestroy();
      const entries: string[] = service.events.entries;
      expect(entries.length).assertEqual(4);
      expect(entries[0]).assertEqual(EVENT_ON_CREATE);
      expect(entries[1]).assertEqual('onConnect:' + STUB_DESCRIPTOR);
      expect(entries[2]).assertEqual(EVENT_ON_DISCONNECT);
      expect(entries[3]).assertEqual(EVENT_ON_DESTROY);
      expect(stub.requests[0].text).assertEqual('pipeline');
      expect(stub.requestCount()).assertEqual(1);
    });

    /**
     * @tc.name          systemIntegrationTenSessionsAudit
     * @tc.desc          Ten short sessions accumulate the exact session counters.
     * @tc.precondition  A service model is created once.
     * @tc.steps         1. Run ten connect, send and disconnect sessions.
     *                   2. Destroy at the end.
     *                   3. Compare counters and event totals.
     * @tc.expected      Ten connects, ten disconnects, one destroy and twenty-two events.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('systemIntegrationTenSessionsAudit', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      let payloadChecks = 0;
      for (let session = 0; session < 10; session++) {
        const stub = service.onConnect();
        const result = new InProcessClient(stub).send(REQUEST_CODE, 'session-' + String(session));
        if (result.replyText === REPLY_PAYLOAD) {
          payloadChecks = payloadChecks + 1;
        }
        service.onDisconnect();
      }
      service.onDestroy();
      expect(service.connectCount).assertEqual(10);
      expect(service.disconnectCount).assertEqual(10);
      expect(service.destroyCount).assertEqual(1);
      expect(payloadChecks).assertEqual(10);
      expect(service.events.size()).assertEqual(22);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(10);
    });

    /**
     * @tc.name          systemIntegrationStubDescriptorStableAcrossSessions
     * @tc.desc          Every session's stub carries the same production descriptor.
     * @tc.precondition  A service is created once.
     * @tc.steps         1. Connect in five sessions.
     *                   2. Record each descriptor.
     *                   3. Compare all descriptors.
     * @tc.expected      All five descriptors equal IPCStubTest.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('systemIntegrationStubDescriptorStableAcrossSessions', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const descriptors: string[] = [];
      for (let session = 0; session < 5; session++) {
        const stub = service.onConnect();
        descriptors.push(stub.descriptor);
        service.onDisconnect();
      }
      expect(descriptors.length).assertEqual(5);
      expect(countOf(descriptors, STUB_DESCRIPTOR)).assertEqual(5);
      expect(countOf(descriptors, 'IPCStubTest')).assertEqual(5);
      expect(service.connectCount).assertEqual(5);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(5);
      expect(service.state).assertEqual('disconnected');
    });

    /**
     * @tc.name          systemIntegrationSessionMetricsIsolation
     * @tc.desc          Metrics from one session do not merge into another stub.
     * @tc.precondition  Two sessions have produced different volumes.
     * @tc.steps         1. Send twenty requests in the first session.
     *                   2. Send five in the second.
     *                   3. Compare both metric sets.
     * @tc.expected      The first stub reports twenty and the second five.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('systemIntegrationSessionMetricsIsolation', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const firstStub = service.onConnect();
      new InProcessClient(firstStub).sendMany(20);
      service.onDisconnect();
      const secondStub = service.onConnect();
      new InProcessClient(secondStub).sendMany(5);
      expect(StubMetrics.from(firstStub).requests).assertEqual(20);
      expect(StubMetrics.from(secondStub).requests).assertEqual(5);
      expect(StubMetrics.from(firstStub).fingerprint() === StubMetrics.from(secondStub).fingerprint())
        .assertFalse();
      expect(secondStub.requestCount()).assertEqual(5);
      expect(service.connectCount).assertEqual(2);
    });

    /**
     * @tc.name          systemIntegrationClientResetWithinSession
     * @tc.desc          Resetting a client mid-session clears the shared stub ledger.
     * @tc.precondition  A connected stub has recorded traffic.
     * @tc.steps         1. Send five requests.
     *                   2. Reset the client.
     *                   3. Send two more requests.
     * @tc.expected      The ledger restarts at two and the client view holds two.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('systemIntegrationClientResetWithinSession', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const stub = service.onConnect();
      const client = new InProcessClient(stub);
      client.sendMany(5);
      client.reset();
      expect(stub.requestCount()).assertEqual(0);
      client.send(REQUEST_CODE, 'after-reset-1');
      client.send(REQUEST_CODE, 'after-reset-2');
      expect(stub.requestCount()).assertEqual(2);
      expect(client.results.length).assertEqual(2);
      expect(stub.requests[0].text).assertEqual('after-reset-1');
      expect(service.connectCount).assertEqual(1);
    });

    /**
     * @tc.name          systemIntegrationServiceDestroyTwiceCounts
     * @tc.desc          Calling onDestroy twice increments the destroy counter twice.
     * @tc.precondition  A service is connected.
     * @tc.steps         1. Destroy the service twice.
     *                   2. Read the destroy counter.
     *                   3. Count destroy events.
     * @tc.expected      Both the counter and event count read two.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('systemIntegrationServiceDestroyTwiceCounts', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onConnect();
      service.onDestroy();
      service.onDestroy();
      expect(service.destroyCount).assertEqual(2);
      expect(service.events.countOf(EVENT_ON_DESTROY)).assertEqual(2);
      expect(service.state).assertEqual('destroyed');
      expect(service.isAlive()).assertFalse();
      expect(service.events.last()).assertEqual(EVENT_ON_DESTROY);
      expect(service.logs.contains(EVENT_ON_DESTROY)).assertTrue();
    });

    /**
     * @tc.name          systemIntegrationLifecycleAfterReset
     * @tc.desc          A reset service can run a complete lifecycle again.
     * @tc.precondition  A full session has been reset.
     * @tc.steps         1. Reset the service.
     *                   2. Run a complete second session.
     *                   3. Compare counters with a fresh service.
     * @tc.expected      The second session matches a fresh service run.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('systemIntegrationLifecycleAfterReset', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onConnect();
      service.onDestroy();
      service.reset();
      service.onCreate();
      const stub = service.onConnect();
      new InProcessClient(stub).sendMany(2);
      service.onDisconnect();
      service.onDestroy();
      const fresh = new ServiceLifecycleModel();
      fresh.onCreate();
      const freshStub = fresh.onConnect();
      new InProcessClient(freshStub).sendMany(2);
      fresh.onDisconnect();
      fresh.onDestroy();
      expect(service.events.trace()).assertEqual(fresh.events.trace());
      expect(service.state).assertEqual(fresh.state);
      expect(service.destroyCount).assertEqual(fresh.destroyCount);
      expect(service.logs.trace()).assertEqual(fresh.logs.trace());
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(1);
    });

    /**
     * @tc.name          systemIntegrationCrossClientLedgerOrder
     * @tc.desc          Interleaved clients append rows in global send order.
     * @tc.precondition  Two clients share a session stub.
     * @tc.steps         1. Alternate four sends with indexed payloads.
     *                   2. Rebuild the ledger order.
     *                   3. Compare with the expected sequence.
     * @tc.expected      The ledger reads left1, right1, left2, right2.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('systemIntegrationCrossClientLedgerOrder', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const stub = service.onConnect();
      const left = new InProcessClient(stub);
      const right = new InProcessClient(stub);
      left.send(REQUEST_CODE, 'left1');
      right.send(REQUEST_CODE, 'right1');
      left.send(REQUEST_CODE, 'left2');
      right.send(REQUEST_CODE, 'right2');
      const texts: string[] = [];
      for (let index = 0; index < stub.requests.length; index++) {
        texts.push(stub.requests[index].text);
      }
      expect(joined(texts, ',')).assertEqual('left1,right1,left2,right2');
      expect(stub.requestCount()).assertEqual(4);
      expect(left.replies.length).assertEqual(2);
      expect(right.replies.length).assertEqual(2);
      expect(countOf(texts, 'left1')).assertEqual(1);
    });

    /**
     * @tc.name          systemIntegrationFinalSnapshotDescription
     * @tc.desc          The final snapshot description encodes every counter in order.
     * @tc.precondition  A service has two connects, one disconnect, four requests and one destroy.
     * @tc.steps         1. Drive the exact callback counts.
     *                   2. Capture a snapshot.
     *                   3. Compare the description.
     * @tc.expected      The description reads destroyed/2/1/4/1.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('systemIntegrationFinalSnapshotDescription', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onConnect();
      service.onConnect();
      service.onDisconnect();
      for (let index = 0; index < 4; index++) {
        service.onRequest(index + 1);
      }
      service.onDestroy();
      const snapshot = new ServiceSnapshot(service);
      expect(snapshot.describe()).assertEqual('destroyed/2/1/4/1');
      expect(snapshot.connects).assertEqual(2);
      expect(snapshot.disconnects).assertEqual(1);
      expect(snapshot.requests).assertEqual(4);
      expect(snapshot.destroys).assertEqual(1);
      expect(snapshot.state).assertEqual('destroyed');
    });

    /**
     * @tc.name          systemIntegrationSessionWithRejectedMajority
     * @tc.desc          A session whose traffic is mostly unknown reports a low ratio.
     * @tc.precondition  A connected stub exists.
     * @tc.steps         1. Send ten requests where six are unknown.
     *                   2. Build metrics.
     *                   3. Compare the ratio and replies.
     * @tc.expected      Four handled, six rejected and ratio 0.4.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('systemIntegrationSessionWithRejectedMajority', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const stub = service.onConnect();
      const client = new InProcessClient(stub);
      const codes: number[] = [UNKNOWN_CODE_ZERO, REQUEST_CODE, UNKNOWN_CODE_TWO, REQUEST_CODE,
        UNKNOWN_CODE_NEGATIVE, UNKNOWN_CODE_LARGE, REQUEST_CODE, UNKNOWN_CODE_ZERO, UNKNOWN_CODE_TWO, REQUEST_CODE];
      for (let index = 0; index < codes.length; index++) {
        client.send(codes[index], 'majority-' + String(index));
      }
      const metrics = StubMetrics.from(stub);
      expect(metrics.requests).assertEqual(10);
      expect(metrics.handled).assertEqual(4);
      expect(metrics.rejected).assertEqual(6);
      expect(metrics.successRatio()).assertEqual(0.4);
      expect(metrics.replies).assertEqual(4);
      expect(service.state).assertEqual('connected');
    });

    /**
     * @tc.name          systemIntegrationCompletePipelineFingerprint
     * @tc.desc          The complete pipeline produces a single deterministic fingerprint.
     * @tc.precondition  A full session has run with known traffic.
     * @tc.steps         1. Run create, connect, six sends, disconnect, destroy.
     *                   2. Build stub metrics.
     *                   3. Compare with the literal.
     * @tc.expected      The fingerprint equals the hash of 6:6:0:6.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('systemIntegrationCompletePipelineFingerprint', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const stub = service.onConnect();
      const client = new InProcessClient(stub);
      client.sendMany(6);
      service.onDisconnect();
      service.onDestroy();
      const metrics = StubMetrics.from(stub);
      expect(metrics.requests).assertEqual(6);
      expect(metrics.handled).assertEqual(6);
      expect(metrics.fingerprint()).assertEqual(textFingerprint('6:6:0:6'));
      expect(service.events.size()).assertEqual(4);
      expect(service.state).assertEqual('destroyed');
      expect(service.isAlive()).assertFalse();
    });

    /**
     * @tc.name          systemIntegrationSessionEndStateAudit
     * @tc.desc          The final session state is internally consistent.
     * @tc.precondition  A session ended with disconnect but no destroy.
     * @tc.steps         1. Connect and send three requests.
     *                   2. Disconnect without destroying.
     *                   3. Audit all observables.
     * @tc.expected      The service stays alive and disconnected with an intact stub.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('systemIntegrationSessionEndStateAudit', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const stub = service.onConnect();
      new InProcessClient(stub).sendMany(3);
      service.onDisconnect();
      expect(service.state).assertEqual('disconnected');
      expect(service.isAlive()).assertTrue();
      expect(service.destroyCount).assertEqual(0);
      expect(stub.alive).assertTrue();
      expect(stub.requestCount()).assertEqual(3);
      expect(service.events.size()).assertEqual(3);
    });

    /**
     * @tc.name          systemIntegrationConnectStubRequestReplyRoundTrip
     * @tc.desc          A full connect-request-reply round trip preserves every value.
     * @tc.precondition  A service is created.
     * @tc.steps         1. Connect and capture the stub.
     *                   2. Send the production payload.
     *                   3. Read the result, ledger and reply.
     * @tc.expected      Descriptor, payload and reply all match production.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('systemIntegrationConnectStubRequestReplyRoundTrip', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const stub = service.onConnect();
      const client = new InProcessClient(stub);
      const result = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(stub.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(result.errCode).assertEqual(0);
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(client.sentTexts[0]).assertEqual(REQUEST_PAYLOAD);
      expect(stub.requests[0].text).assertEqual(REQUEST_PAYLOAD);
      expect(stub.requests[0].replyText).assertEqual(REPLY_PAYLOAD);
      expect(service.state).assertEqual('connected');
    });
  });
}
