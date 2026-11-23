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
  InProcessClient,
  StubRemoteObjectModel,
  ServiceLifecycleModel,
  ServiceSnapshot,
  StubMetrics,
  countOf,
  joined,
  textFingerprint
} from '../Shared/SharedDriver';

function establish(service: ServiceLifecycleModel): InProcessClient {
  const stub = service.onConnect();
  return new InProcessClient(stub);
}

function loseAndRecover(service: ServiceLifecycleModel, client: InProcessClient): number {
  client.stub.kill();
  const lost = client.send(REQUEST_CODE, 'while-lost');
  client.stub.revive();
  const recovered = client.send(REQUEST_CODE, 'after-recovery');
  return (lost.isSuccess() ? 1 : 0) + (recovered.isSuccess() ? 10 : 0);
}

export default function connectivityIntegration(): void {
  describe('IntegrationConnectivity', () => {
    beforeAll(() => {
      logSuite('IntegrationConnectivity', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('IntegrationConnectivity', 'end');
    });

    /**
     * @tc.name          connectivityIntegrationConnectEstablishesState
     * @tc.desc          A successful connect moves the service into the connected state.
     * @tc.precondition  A created service model exists.
     * @tc.steps         1. Create the service.
     *                   2. Call onConnect.
     *                   3. Read the state and stub.
     * @tc.expected      The state is connected with a live stub.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('connectivityIntegrationConnectEstablishesState', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      expect(service.state).assertEqual('created');
      const stub = service.onConnect();
      expect(service.state).assertEqual('connected');
      expect(service.connectCount).assertEqual(1);
      expect(service.disconnectCount).assertEqual(0);
      expect(stub.alive).assertTrue();
      expect(service.stub === stub).assertTrue();
    });

    /**
     * @tc.name          connectivityIntegrationDisconnectChangesState
     * @tc.desc          A disconnect moves the service into the disconnected state.
     * @tc.precondition  A connected service exists.
     * @tc.steps         1. Connect.
     *                   2. Disconnect.
     *                   3. Read the state and snapshot.
     * @tc.expected      The state and snapshot both read disconnected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('connectivityIntegrationDisconnectChangesState', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onConnect();
      service.onDisconnect();
      const snapshot = new ServiceSnapshot(service);
      expect(service.state).assertEqual('disconnected');
      expect(snapshot.state).assertEqual('disconnected');
      expect(snapshot.disconnects).assertEqual(1);
      expect(service.disconnectCount).assertEqual(1);
      expect(service.isAlive()).assertTrue();
      expect(service.events.last()).assertEqual(EVENT_ON_DISCONNECT);
    });

    /**
     * @tc.name          connectivityIntegrationReconnectRestoresState
     * @tc.desc          A reconnect restores the connected state after a disconnect.
     * @tc.precondition  A disconnected service exists.
     * @tc.steps         1. Connect and disconnect.
     *                   2. Connect again.
     *                   3. Read the state and counters.
     * @tc.expected      The state is connected with two connect events.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('connectivityIntegrationReconnectRestoresState', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onConnect();
      service.onDisconnect();
      const stub = service.onConnect();
      expect(service.state).assertEqual('connected');
      expect(service.connectCount).assertEqual(2);
      expect(service.disconnectCount).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(2);
      expect(stub.alive).assertTrue();
      expect(service.isAlive()).assertTrue();
    });

    /**
     * @tc.name          connectivityIntegrationConnectCounterIncrements
     * @tc.desc          Each connect increments the connect counter by one.
     * @tc.precondition  A created service exists.
     * @tc.steps         1. Connect three times.
     *                   2. Read the counter.
     *                   3. Compare with the event count.
     * @tc.expected      The counter and connect event count read three.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('connectivityIntegrationConnectCounterIncrements', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onConnect();
      expect(service.connectCount).assertEqual(1);
      service.onConnect();
      expect(service.connectCount).assertEqual(2);
      service.onConnect();
      expect(service.connectCount).assertEqual(3);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(3);
      expect(service.events.size()).assertEqual(4);
      expect(service.state).assertEqual('connected');
    });

    /**
     * @tc.name          connectivityIntegrationDisconnectCounterIncrements
     * @tc.desc          Each disconnect increments the disconnect counter by one.
     * @tc.precondition  A connected service exists.
     * @tc.steps         1. Disconnect three times.
     *                   2. Read the counter.
     *                   3. Compare with the snapshot.
     * @tc.expected      The counter and snapshot both read three.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('connectivityIntegrationDisconnectCounterIncrements', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onConnect();
      service.onDisconnect();
      service.onDisconnect();
      service.onDisconnect();
      const snapshot = new ServiceSnapshot(service);
      expect(service.disconnectCount).assertEqual(3);
      expect(snapshot.disconnects).assertEqual(3);
      expect(snapshot.connects).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_DISCONNECT)).assertEqual(3);
      expect(service.state).assertEqual('disconnected');
      expect(service.isAlive()).assertTrue();
    });

    /**
     * @tc.name          connectivityIntegrationStubSurvivesDisconnect
     * @tc.desc          A stub reference stays valid after the service disconnects.
     * @tc.precondition  A connected stub with traffic exists.
     * @tc.steps         1. Send one request.
     *                   2. Disconnect the service.
     *                   3. Inspect the stub.
     * @tc.expected      The stub remains alive with its ledger intact.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectivityIntegrationStubSurvivesDisconnect', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const client = establish(service);
      client.send(REQUEST_CODE, 'before-disconnect');
      service.onDisconnect();
      expect(client.stub.alive).assertTrue();
      expect(client.stub.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(client.stub.requestCount()).assertEqual(1);
      expect(client.replies.length).assertEqual(1);
      expect(service.state).assertEqual('disconnected');
      expect(service.stub === client.stub).assertTrue();
    });

    /**
     * @tc.name          connectivityIntegrationStubHandlesAfterDisconnect
     * @tc.desc          Stub traffic after disconnect is still handled.
     * @tc.precondition  A disconnected service with a stub reference exists.
     * @tc.steps         1. Disconnect the service.
     *                   2. Send two requests through the old stub.
     *                   3. Build metrics.
     * @tc.expected      Both post-disconnect requests are handled.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectivityIntegrationStubHandlesAfterDisconnect', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const client = establish(service);
      service.onDisconnect();
      const first = client.send(REQUEST_CODE, 'after-disconnect-1');
      const second = client.send(REQUEST_CODE, 'after-disconnect-2');
      expect(first.isSuccess()).assertTrue();
      expect(second.isSuccess()).assertTrue();
      expect(client.stub.requestCount()).assertEqual(2);
      expect(StubMetrics.from(client.stub).handled).assertEqual(2);
      expect(StubMetrics.from(client.stub).successRatio()).assertEqual(1);
    });

    /**
     * @tc.name          connectivityIntegrationKilledStubRejectsTraffic
     * @tc.desc          A killed stub rejects every request in the loss window.
     * @tc.precondition  A connected client exists.
     * @tc.steps         1. Kill the stub.
     *                   2. Send three requests.
     *                   3. Read the metrics.
     * @tc.expected      All three requests are rejected with no replies.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectivityIntegrationKilledStubRejectsTraffic', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const client = establish(service);
      client.stub.kill();
      expect(client.stub.alive).assertFalse();
      for (let index = 0; index < 3; index++) {
        expect(client.send(REQUEST_CODE, 'lost-' + String(index)).isSuccess()).assertFalse();
      }
      const metrics = StubMetrics.from(client.stub);
      expect(metrics.requests).assertEqual(3);
      expect(metrics.handled).assertEqual(0);
      expect(metrics.rejected).assertEqual(3);
      expect(client.replies.length).assertEqual(0);
      expect(service.state).assertEqual('connected');
    });

    /**
     * @tc.name          connectivityIntegrationReviveRestoresTraffic
     * @tc.desc          Reviving a stub restores successful handling.
     * @tc.precondition  A killed stub exists.
     * @tc.steps         1. Kill the stub.
     *                   2. Revive it.
     *                   3. Send two requests.
     * @tc.expected      The revived stub handles both requests.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectivityIntegrationReviveRestoresTraffic', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const client = establish(service);
      client.stub.kill();
      client.stub.revive();
      expect(client.stub.alive).assertTrue();
      const first = client.send(REQUEST_CODE, 'revived-1');
      const second = client.send(REQUEST_CODE, 'revived-2');
      expect(first.isSuccess()).assertTrue();
      expect(second.isSuccess()).assertTrue();
      expect(client.replies.length).assertEqual(2);
      expect(StubMetrics.from(client.stub).handled).assertEqual(2);
    });

    /**
     * @tc.name          connectivityIntegrationRepeatedLossRecovery
     * @tc.desc          A loss-recovery pair yields one failure and one success.
     * @tc.precondition  A connected client exists.
     * @tc.steps         1. Kill, send, revive and send again.
     *                   2. Read the outcome code from the helper.
     *                   3. Build metrics.
     * @tc.expected      The helper reports ten for the recovered send only.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectivityIntegrationRepeatedLossRecovery', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const client = establish(service);
      const outcome = loseAndRecover(service, client);
      expect(outcome).assertEqual(10);
      expect(client.stub.alive).assertTrue();
      expect(client.replies.length).assertEqual(1);
      expect(client.stub.requestCount()).assertEqual(2);
      expect(StubMetrics.from(client.stub).rejected).assertEqual(1);
      expect(StubMetrics.from(client.stub).handled).assertEqual(1);
    });

    /**
     * @tc.name          connectivityIntegrationTenLossRecoveryCycles
     * @tc.desc          Ten loss-recovery cycles keep a half-success profile.
     * @tc.precondition  A connected client exists.
     * @tc.steps         1. Repeat kill, send, revive and send ten times.
     *                   2. Build metrics.
     *                   3. Check the final alive flag.
     * @tc.expected      Ten replies and ten rejects are recorded.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectivityIntegrationTenLossRecoveryCycles', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const client = establish(service);
      let outcomes = 0;
      for (let cycle = 0; cycle < 10; cycle++) {
        outcomes = outcomes + loseAndRecover(service, client);
      }
      const metrics = StubMetrics.from(client.stub);
      expect(outcomes).assertEqual(100);
      expect(metrics.requests).assertEqual(20);
      expect(metrics.handled).assertEqual(10);
      expect(metrics.rejected).assertEqual(10);
      expect(metrics.successRatio()).assertEqual(0.5);
      expect(client.stub.alive).assertTrue();
    });

    /**
     * @tc.name          connectivityIntegrationNewStubPerReconnect
     * @tc.desc          Reconnecting after a disconnect returns a new stub.
     * @tc.precondition  A disconnected service exists.
     * @tc.steps         1. Hold the first stub.
     *                   2. Reconnect.
     *                   3. Compare both stub references.
     * @tc.expected      The second stub is a different object with an empty ledger.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectivityIntegrationNewStubPerReconnect', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const first = establish(service);
      first.sendMany(2);
      service.onDisconnect();
      const second = establish(service);
      expect(second.stub === first.stub).assertFalse();
      expect(second.stub.requestCount()).assertEqual(0);
      expect(first.stub.requestCount()).assertEqual(2);
      expect(second.stub.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(service.connectCount).assertEqual(2);
      expect(service.disconnectCount).assertEqual(1);
    });

    /**
     * @tc.name          connectivityIntegrationOldStubIsolationAfterReconnect
     * @tc.desc          Traffic on the new stub never reaches the old stub.
     * @tc.precondition  A reconnect has produced a second stub.
     * @tc.steps         1. Send three requests to the new stub.
     *                   2. Read the old stub ledger.
     *                   3. Compare both metric sets.
     * @tc.expected      The old stub stays at its original count.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectivityIntegrationOldStubIsolationAfterReconnect', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const first = establish(service);
      first.sendMany(4);
      service.onDisconnect();
      const second = establish(service);
      second.sendMany(3);
      expect(first.stub.requestCount()).assertEqual(4);
      expect(second.stub.requestCount()).assertEqual(3);
      expect(StubMetrics.from(first.stub).requests).assertEqual(4);
      expect(StubMetrics.from(second.stub).requests).assertEqual(3);
      expect(service.state).assertEqual('connected');
      expect(service.stub === second.stub).assertTrue();
    });

    /**
     * @tc.name          connectivityIntegrationDisconnectWithoutConnect
     * @tc.desc          A disconnect without a connect is still a state transition.
     * @tc.precondition  A created service has no stub.
     * @tc.steps         1. Call onDisconnect.
     *                   2. Read the counters and state.
     *                   3. Check the events.
     * @tc.expected      The disconnect counter reads one and the stub is undefined.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('connectivityIntegrationDisconnectWithoutConnect', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onDisconnect();
      expect(service.disconnectCount).assertEqual(1);
      expect(service.connectCount).assertEqual(0);
      expect(service.state).assertEqual('disconnected');
      expect(service.stub).assertUndefined();
      expect(service.events.countOf(EVENT_ON_DISCONNECT)).assertEqual(1);
      expect(service.isAlive()).assertTrue();
    });

    /**
     * @tc.name          connectivityIntegrationDestroyWithoutConnect
     * @tc.desc          Destroy without a connect ends the service cleanly.
     * @tc.precondition  A created service has no connection.
     * @tc.steps         1. Destroy the service.
     *                   2. Read the snapshot.
     *                   3. Compare the description.
     * @tc.expected      The snapshot reads destroyed with zero connects.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('connectivityIntegrationDestroyWithoutConnect', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onDestroy();
      const snapshot = new ServiceSnapshot(service);
      expect(snapshot.state).assertEqual('destroyed');
      expect(snapshot.connects).assertEqual(0);
      expect(snapshot.disconnects).assertEqual(0);
      expect(snapshot.destroys).assertEqual(1);
      expect(snapshot.describe()).assertEqual('destroyed/0/0/0/1');
      expect(service.stub).assertUndefined();
    });

    /**
     * @tc.name          connectivityIntegrationStateAfterDestroy
     * @tc.desc          Destroy ends connectivity regardless of the prior state.
     * @tc.precondition  A connected service with traffic exists.
     * @tc.steps         1. Connect and send.
     *                   2. Destroy.
     *                   3. Read state and alive flag.
     * @tc.expected      The service is destroyed and not alive.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('connectivityIntegrationStateAfterDestroy', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const client = establish(service);
      client.sendMany(2);
      service.onDestroy();
      expect(service.state).assertEqual('destroyed');
      expect(service.isAlive()).assertFalse();
      expect(service.destroyCount).assertEqual(1);
      expect(service.events.last()).assertEqual(EVENT_ON_DESTROY);
      expect(service.logs.contains(EVENT_ON_DESTROY)).assertTrue();
      expect(service.connectCount).assertEqual(1);
    });

    /**
     * @tc.name          connectivityIntegrationStubAliveAfterDestroy
     * @tc.desc          The stub remains alive after the service is destroyed.
     * @tc.precondition  A connected stub exists.
     * @tc.steps         1. Destroy the service.
     *                   2. Read the stub alive flag.
     *                   3. Send one request.
     * @tc.expected      The stub stays alive and handles the request.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectivityIntegrationStubAliveAfterDestroy', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const client = establish(service);
      service.onDestroy();
      expect(client.stub.alive).assertTrue();
      expect(client.stub.descriptor).assertEqual(STUB_DESCRIPTOR);
      const result = client.send(REQUEST_CODE, 'survivor');
      expect(result.isSuccess()).assertTrue();
      expect(client.stub.requestCount()).assertEqual(1);
      expect(client.replies.length).assertEqual(1);
    });

    /**
     * @tc.name          connectivityIntegrationTrafficAfterDestroy
     * @tc.desc          A destroyed service does not block its former stub.
     * @tc.precondition  A destroyed service with a stub reference exists.
     * @tc.steps         1. Destroy the service.
     *                   2. Send five requests through the stub.
     *                   3. Build metrics.
     * @tc.expected      All five requests are handled after destruction.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectivityIntegrationTrafficAfterDestroy', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const client = establish(service);
      service.onDestroy();
      const handled = client.sendMany(5);
      expect(handled).assertEqual(5);
      expect(client.stub.requestCount()).assertEqual(5);
      expect(StubMetrics.from(client.stub).successRatio()).assertEqual(1);
      expect(service.isAlive()).assertFalse();
      expect(service.destroyCount).assertEqual(1);
      expect(client.replies.length).assertEqual(5);
    });

    /**
     * @tc.name          connectivityIntegrationRejectDuringLoss
     * @tc.desc          A rejected send during loss carries the rejection error code.
     * @tc.precondition  A killed stub with a client exists.
     * @tc.steps         1. Kill the stub.
     *                   2. Send one request.
     *                   3. Read the result fields.
     * @tc.expected      The error code is the stub rejection value with no reply.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectivityIntegrationRejectDuringLoss', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const client = establish(service);
      client.stub.kill();
      const result = client.send(REQUEST_CODE, 'lost');
      expect(result.handled).assertFalse();
      expect(result.errCode).assertEqual(16000011);
      expect(result.replyText).assertEqual('');
      expect(client.results.length).assertEqual(1);
      expect(client.replies.length).assertEqual(0);
      expect(client.stub.requestCount()).assertEqual(1);
    });

    /**
     * @tc.name          connectivityIntegrationLossWindowRowCount
     * @tc.desc          Every send during loss still creates one ledger row.
     * @tc.precondition  A killed stub exists.
     * @tc.steps         1. Kill the stub.
     *                   2. Send four requests.
     *                   3. Count the rows.
     * @tc.expected      Four rows exist with empty text and no replies.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectivityIntegrationLossWindowRowCount', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const client = establish(service);
      client.stub.kill();
      client.sendMany(4);
      expect(client.stub.requestCount()).assertEqual(4);
      expect(client.stub.requests[0].text).assertEqual('');
      expect(client.stub.requests[3].handled).assertFalse();
      expect(client.replies.length).assertEqual(0);
      expect(StubMetrics.from(client.stub).rejected).assertEqual(4);
      expect(StubMetrics.from(client.stub).replies).assertEqual(0);
    });

    /**
     * @tc.name          connectivityIntegrationRecoveryRowCount
     * @tc.desc          Recovery traffic appends handled rows after the loss window.
     * @tc.precondition  A stub was killed and revived.
     * @tc.steps         1. Send three requests while dead.
     *                   2. Revive and send two.
     *                   3. Read the row history.
     * @tc.expected      Five rows exist with the last two handled.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectivityIntegrationRecoveryRowCount', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const client = establish(service);
      client.stub.kill();
      client.sendMany(3);
      client.stub.revive();
      client.sendMany(2);
      expect(client.stub.requestCount()).assertEqual(5);
      expect(client.stub.requests[2].handled).assertFalse();
      expect(client.stub.requests[3].handled).assertTrue();
      expect(client.stub.requests[4].handled).assertTrue();
      expect(client.replies.length).assertEqual(2);
      expect(StubMetrics.from(client.stub).successRatio()).assertEqual(0.4);
    });

    /**
     * @tc.name          connectivityIntegrationLossRatio
     * @tc.desc          A full loss window reports a zero success ratio.
     * @tc.precondition  A killed stub exists.
     * @tc.steps         1. Send five requests while dead.
     *                   2. Build metrics.
     *                   3. Compare the ratio.
     * @tc.expected      The ratio is zero with five rejected rows.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectivityIntegrationLossRatio', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const client = establish(service);
      client.stub.kill();
      client.sendMany(5);
      const metrics = StubMetrics.from(client.stub);
      expect(metrics.requests).assertEqual(5);
      expect(metrics.handled).assertEqual(0);
      expect(metrics.rejected).assertEqual(5);
      expect(metrics.successRatio()).assertEqual(0);
      expect(metrics.fingerprint()).assertEqual(textFingerprint('5:0:5:0'));
      expect(service.state).assertEqual('connected');
    });

    /**
     * @tc.name          connectivityIntegrationRecoveryRatio
     * @tc.desc          A full recovery window reports a one success ratio.
     * @tc.precondition  A revived stub exists.
     * @tc.steps         1. Revive the stub.
     *                   2. Send five requests.
     *                   3. Build metrics.
     * @tc.expected      The ratio is one with five handled rows.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectivityIntegrationRecoveryRatio', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const client = establish(service);
      client.stub.kill();
      client.stub.revive();
      client.sendMany(5);
      const metrics = StubMetrics.from(client.stub);
      expect(metrics.requests).assertEqual(5);
      expect(metrics.handled).assertEqual(5);
      expect(metrics.rejected).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(1);
      expect(metrics.fingerprint()).assertEqual(textFingerprint('5:5:0:5'));
      expect(client.replies.length).assertEqual(5);
    });

    /**
     * @tc.name          connectivityIntegrationConnectionSnapshot
     * @tc.desc          A connected snapshot records exactly one connection.
     * @tc.precondition  A service is created and connected.
     * @tc.steps         1. Connect.
     *                   2. Capture a snapshot.
     *                   3. Compare the description.
     * @tc.expected      The snapshot reads connected/1/0/0/0.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('connectivityIntegrationConnectionSnapshot', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onConnect();
      const snapshot = new ServiceSnapshot(service);
      expect(snapshot.state).assertEqual('connected');
      expect(snapshot.describe()).assertEqual('connected/1/0/0/0');
      expect(snapshot.connects).assertEqual(1);
      expect(snapshot.disconnects).assertEqual(0);
      expect(snapshot.requests).assertEqual(0);
      expect(snapshot.destroys).assertEqual(0);
    });

    /**
     * @tc.name          connectivityIntegrationSnapshotAfterDisconnect
     * @tc.desc          A disconnected snapshot reflects the lost connection.
     * @tc.precondition  A connected service has disconnected.
     * @tc.steps         1. Connect and disconnect.
     *                   2. Capture a snapshot.
     *                   3. Compare the description.
     * @tc.expected      The snapshot reads disconnected/1/1/0/0.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('connectivityIntegrationSnapshotAfterDisconnect', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onConnect();
      service.onDisconnect();
      const snapshot = new ServiceSnapshot(service);
      expect(snapshot.describe()).assertEqual('disconnected/1/1/0/0');
      expect(snapshot.state).assertEqual('disconnected');
      expect(snapshot.connects).assertEqual(1);
      expect(snapshot.disconnects).assertEqual(1);
      expect(snapshot.destroys).assertEqual(0);
      expect(service.isAlive()).assertTrue();
    });

    /**
     * @tc.name          connectivityIntegrationSnapshotAfterReconnect
     * @tc.desc          A reconnected snapshot reflects both connections.
     * @tc.precondition  A service has connected twice with one disconnect.
     * @tc.steps         1. Connect, disconnect and connect.
     *                   2. Capture a snapshot.
     *                   3. Compare the description.
     * @tc.expected      The snapshot reads connected/2/1/0/0.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectivityIntegrationSnapshotAfterReconnect', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onConnect();
      service.onDisconnect();
      service.onConnect();
      const snapshot = new ServiceSnapshot(service);
      expect(snapshot.describe()).assertEqual('connected/2/1/0/0');
      expect(snapshot.connects).assertEqual(2);
      expect(snapshot.disconnects).assertEqual(1);
      expect(service.state).assertEqual('connected');
      expect(service.events.size()).assertEqual(4);
      expect(service.stub === undefined).assertFalse();
    });

    /**
     * @tc.name          connectivityIntegrationConnectionEventOrder
     * @tc.desc          Connection events appear in call order with details.
     * @tc.precondition  A service is created.
     * @tc.steps         1. Create, connect, disconnect and connect.
     *                   2. Read the event trace.
     *                   3. Compare with the expected literal.
     * @tc.expected      The trace lists both connect details in order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectivityIntegrationConnectionEventOrder', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onConnect();
      service.onDisconnect();
      service.onConnect();
      const expected = 'onCreate>onConnect:' + STUB_DESCRIPTOR + '>onDisconnect>onConnect:' + STUB_DESCRIPTOR;
      expect(service.events.trace()).assertEqual(expected);
      expect(service.events.fingerprint()).assertEqual(textFingerprint(expected));
      expect(service.events.size()).assertEqual(4);
      expect(service.events.last()).assertEqual('onConnect:' + STUB_DESCRIPTOR);
      expect(service.logs.size()).assertEqual(4);
      expect(service.connectCount).assertEqual(2);
    });

    /**
     * @tc.name          connectivityIntegrationConnectionEventCounts
     * @tc.desc          Connection event counts match their counters.
     * @tc.precondition  A service has three connect-disconnect cycles.
     * @tc.steps         1. Run three cycles.
     *                   2. Compare event counts with counters.
     *                   3. Read the total events.
     * @tc.expected      Both count pairs read three.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectivityIntegrationConnectionEventCounts', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      for (let cycle = 0; cycle < 3; cycle++) {
        service.onConnect();
        service.onDisconnect();
      }
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(3);
      expect(service.events.countOf(EVENT_ON_DISCONNECT)).assertEqual(3);
      expect(service.connectCount).assertEqual(3);
      expect(service.disconnectCount).assertEqual(3);
      expect(service.events.size()).assertEqual(7);
      expect(service.state).assertEqual('disconnected');
    });

    /**
     * @tc.name          connectivityIntegrationConnectionLogs
     * @tc.desc          Each connection transition writes an info log line.
     * @tc.precondition  A service cycle has run.
     * @tc.steps         1. Create, connect and disconnect.
     *                   2. Search the log for each transition.
     *                   3. Count info lines.
     * @tc.expected      All three transition names appear in the log.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectivityIntegrationConnectionLogs', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onConnect();
      service.onDisconnect();
      expect(service.logs.size()).assertEqual(3);
      expect(service.logs.contains(EVENT_ON_CREATE)).assertTrue();
      expect(service.logs.contains(EVENT_ON_CONNECT)).assertTrue();
      expect(service.logs.contains(EVENT_ON_DISCONNECT)).assertTrue();
      expect(service.logs.countLevel('INFO')).assertEqual(3);
      expect(service.logs.lines[2]).assertEqual('INFO onDisconnect');
      expect(service.logs.trace().split('|').length).assertEqual(3);
    });

    /**
     * @tc.name          connectivityIntegrationBoundedConnectionLogs
     * @tc.desc          Many reconnections keep the connection log bounded.
     * @tc.precondition  A service with a 128-line log is created.
     * @tc.steps         1. Run one hundred connect-disconnect cycles.
     *                   2. Read the log size and event count.
     *                   3. Check the newest fragment.
     * @tc.expected      The log holds 128 lines while events reach 201.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectivityIntegrationBoundedConnectionLogs', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      for (let cycle = 0; cycle < 100; cycle++) {
        service.onConnect();
        service.onDisconnect();
      }
      expect(service.logs.size()).assertEqual(128);
      expect(service.events.size()).assertEqual(201);
      expect(service.logs.contains(EVENT_ON_DISCONNECT)).assertTrue();
      expect(service.logs.contains(EVENT_ON_CREATE)).assertFalse();
      expect(service.connectCount).assertEqual(100);
      expect(service.disconnectCount).assertEqual(100);
      expect(service.logs.size() <= service.logs.limit).assertTrue();
    });

    /**
     * @tc.name          connectivityIntegrationLossMidBatch
     * @tc.desc          A loss in the middle of a batch splits successes and failures.
     * @tc.precondition  A connected client exists.
     * @tc.steps         1. Send two requests.
     *                   2. Kill the stub and send three.
     *                   3. Revive and send two more.
     * @tc.expected      Four handled and three rejected rows are recorded.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectivityIntegrationLossMidBatch', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const client = establish(service);
      client.sendMany(2);
      client.stub.kill();
      client.sendMany(3);
      client.stub.revive();
      client.sendMany(2);
      const metrics = StubMetrics.from(client.stub);
      expect(metrics.requests).assertEqual(7);
      expect(metrics.handled).assertEqual(4);
      expect(metrics.rejected).assertEqual(3);
      expect(client.replies.length).assertEqual(4);
      expect(client.stub.requests[2].handled).assertFalse();
      expect(client.stub.requests[6].handled).assertTrue();
    });

    /**
     * @tc.name          connectivityIntegrationRecoveryMidBatch
     * @tc.desc          Recovery mid-batch resumes successful appends.
     * @tc.precondition  A stub killed during a batch exists.
     * @tc.steps         1. Kill and send three.
     *                   2. Revive and send three.
     *                   3. Compare the row sequence flags.
     * @tc.expected      The first three rows fail and the last three succeed.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectivityIntegrationRecoveryMidBatch', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const client = establish(service);
      client.stub.kill();
      client.sendMany(3);
      client.stub.revive();
      client.sendMany(3);
      const flags: string[] = [];
      for (let index = 0; index < client.stub.requests.length; index++) {
        flags.push(String(client.stub.requests[index].handled));
      }
      expect(joined(flags, ',')).assertEqual('false,false,false,true,true,true');
      expect(client.stub.requestCount()).assertEqual(6);
      expect(StubMetrics.from(client.stub).replies).assertEqual(3);
      expect(client.replies.length).assertEqual(3);
      expect(service.state).assertEqual('connected');
      expect(service.connectCount).assertEqual(1);
    });

    /**
     * @tc.name          connectivityIntegrationTwoClientsDuringLoss
     * @tc.desc          A loss affects both clients bound to the same stub.
     * @tc.precondition  Two clients share one stub.
     * @tc.steps         1. Kill the stub.
     *                   2. Send from both clients.
     *                   3. Build metrics.
     * @tc.expected      Both clients see failures with four rejected rows.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectivityIntegrationTwoClientsDuringLoss', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const stub = service.onConnect();
      const first = new InProcessClient(stub);
      const second = new InProcessClient(stub);
      stub.kill();
      first.sendMany(2);
      second.sendMany(2);
      expect(first.replies.length).assertEqual(0);
      expect(second.replies.length).assertEqual(0);
      expect(first.results.length).assertEqual(2);
      expect(second.results.length).assertEqual(2);
      expect(StubMetrics.from(stub).rejected).assertEqual(4);
      expect(stub.alive).assertFalse();
    });

    /**
     * @tc.name          connectivityIntegrationTwoClientsAfterRecovery
     * @tc.desc          Both clients resume successfully after the stub is revived.
     * @tc.precondition  Two clients share a killed stub.
     * @tc.steps         1. Revive the stub.
     *                   2. Send three from each client.
     *                   3. Compare reply counts.
     * @tc.expected      Each client holds three replies and the stub holds six rows.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectivityIntegrationTwoClientsAfterRecovery', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const stub = service.onConnect();
      const first = new InProcessClient(stub);
      const second = new InProcessClient(stub);
      stub.kill();
      stub.revive();
      first.sendMany(3);
      second.sendMany(3);
      expect(first.replies.length).assertEqual(3);
      expect(second.replies.length).assertEqual(3);
      expect(stub.requestCount()).assertEqual(6);
      expect(StubMetrics.from(stub).handled).assertEqual(6);
      expect(StubMetrics.from(stub).successRatio()).assertEqual(1);
      expect(stub.alive).assertTrue();
    });

    /**
     * @tc.name          connectivityIntegrationClientIsolationAfterLoss
     * @tc.desc          One client's pre-loss history stays intact through another's sends.
     * @tc.precondition  A client has two successful sends.
     * @tc.steps         1. Record the first client history.
     *                   2. Kill the stub and send from a second client.
     *                   3. Re-check the first client history.
     * @tc.expected      The first client still holds two replies.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectivityIntegrationClientIsolationAfterLoss', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const stub = service.onConnect();
      const first = new InProcessClient(stub);
      const second = new InProcessClient(stub);
      first.sendMany(2);
      stub.kill();
      second.sendMany(3);
      expect(first.replies.length).assertEqual(2);
      expect(first.results.length).assertEqual(2);
      expect(second.replies.length).assertEqual(0);
      expect(second.results.length).assertEqual(3);
      expect(stub.requestCount()).assertEqual(5);
      expect(StubMetrics.from(stub).handled).assertEqual(2);
    });

    /**
     * @tc.name          connectivityIntegrationServiceResetAfterLoss
     * @tc.desc          Resetting the service after a loss clears connection history.
     * @tc.precondition  A service has lost and recovered connectivity.
     * @tc.steps         1. Kill and revive the stub.
     *                   2. Reset the service.
     *                   3. Read state and counters.
     * @tc.expected      The service is idle with empty events and no stub reference.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectivityIntegrationServiceResetAfterLoss', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const client = establish(service);
      loseAndRecover(service, client);
      service.reset();
      expect(service.state).assertEqual('idle');
      expect(service.connectCount).assertEqual(0);
      expect(service.disconnectCount).assertEqual(0);
      expect(service.events.size()).assertEqual(0);
      expect(service.logs.size()).assertEqual(0);
      expect(service.stub).assertUndefined();
    });

    /**
     * @tc.name          connectivityIntegrationServiceAliveDuringLoss
     * @tc.desc          Stub loss does not change the service lifecycle state.
     * @tc.precondition  A connected service exists.
     * @tc.steps         1. Kill the stub.
     *                   2. Read the service state and counters.
     *                   3. Revive the stub.
     * @tc.expected      The service stays connected and alive through the loss.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectivityIntegrationServiceAliveDuringLoss', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const client = establish(service);
      client.stub.kill();
      expect(service.state).assertEqual('connected');
      expect(service.isAlive()).assertTrue();
      expect(service.connectCount).assertEqual(1);
      expect(service.disconnectCount).assertEqual(0);
      expect(service.events.countOf(EVENT_ON_DISCONNECT)).assertEqual(0);
      client.stub.revive();
      expect(service.state).assertEqual('connected');
    });

    /**
     * @tc.name          connectivityIntegrationReconnectAfterDestroy
     * @tc.desc          A destroyed service can be reset and connected again.
     * @tc.precondition  A service has been destroyed.
     * @tc.steps         1. Destroy the service.
     *                   2. Reset and create it.
     *                   3. Connect and read the state.
     * @tc.expected      The restarted service connects with a fresh stub.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectivityIntegrationReconnectAfterDestroy', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      establish(service).sendMany(3);
      service.onDestroy();
      service.reset();
      service.onCreate();
      const client = establish(service);
      expect(service.state).assertEqual('connected');
      expect(service.connectCount).assertEqual(1);
      expect(service.disconnectCount).assertEqual(0);
      expect(service.destroyCount).assertEqual(0);
      expect(client.stub.requestCount()).assertEqual(0);
      expect(client.send(REQUEST_CODE).isSuccess()).assertTrue();
    });

    /**
     * @tc.name          connectivityIntegrationRepeatedConnectWithoutDisconnect
     * @tc.desc          Repeated connects without disconnects increment the connect counter.
     * @tc.precondition  A created service exists.
     * @tc.steps         1. Connect five times.
     *                   2. Read the counters.
     *                   3. Compare the stubs.
     * @tc.expected      The connect counter reads five with zero disconnects.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectivityIntegrationRepeatedConnectWithoutDisconnect', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const stubs: StubRemoteObjectModel[] = [];
      for (let index = 0; index < 5; index++) {
        stubs.push(service.onConnect());
      }
      expect(service.connectCount).assertEqual(5);
      expect(service.disconnectCount).assertEqual(0);
      expect(service.state).assertEqual('connected');
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(5);
      expect(stubs[0] === stubs[4]).assertFalse();
      expect(service.stub === stubs[4]).assertTrue();
    });

    /**
     * @tc.name          connectivityIntegrationConnectThenKillThenDisconnect
     * @tc.desc          Service disconnect after a stub kill keeps independent state.
     * @tc.precondition  A connected stub is killed.
     * @tc.steps         1. Kill the stub.
     *                   2. Disconnect the service.
     *                   3. Read both states.
     * @tc.expected      The service is disconnected while the stub stays dead.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectivityIntegrationConnectThenKillThenDisconnect', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const client = establish(service);
      client.stub.kill();
      service.onDisconnect();
      expect(service.state).assertEqual('disconnected');
      expect(service.disconnectCount).assertEqual(1);
      expect(client.stub.alive).assertFalse();
      expect(service.events.last()).assertEqual(EVENT_ON_DISCONNECT);
      expect(service.isAlive()).assertTrue();
      client.stub.revive();
      expect(client.stub.alive).assertTrue();
      expect(service.state).assertEqual('disconnected');
    });

    /**
     * @tc.name          connectivityIntegrationMetricsAfterLossRecovery
     * @tc.desc          Metrics after a loss and recovery reconcile with row counts.
     * @tc.precondition  A client has run a loss-recovery batch.
     * @tc.steps         1. Send four, kill, send two, revive, send four.
     *                   2. Build metrics.
     *                   3. Compare every counter.
     * @tc.expected      Ten requests, eight handled and two rejected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectivityIntegrationMetricsAfterLossRecovery', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const client = establish(service);
      client.sendMany(4);
      client.stub.kill();
      client.sendMany(2);
      client.stub.revive();
      client.sendMany(4);
      const metrics = StubMetrics.from(client.stub);
      expect(metrics.requests).assertEqual(10);
      expect(metrics.handled).assertEqual(8);
      expect(metrics.rejected).assertEqual(2);
      expect(metrics.replies).assertEqual(8);
      expect(metrics.successRatio()).assertEqual(0.8);
      expect(client.replies.length).assertEqual(8);
    });

    /**
     * @tc.name          connectivityIntegrationFingerprintAfterLoss
     * @tc.desc          A loss batch has a deterministic metric fingerprint.
     * @tc.precondition  A loss-only batch exists.
     * @tc.steps         1. Kill the stub and send twelve requests.
     *                   2. Build metrics.
     *                   3. Compare the fingerprint literal.
     * @tc.expected      The fingerprint equals the hash of 12:0:12:0.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectivityIntegrationFingerprintAfterLoss', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const client = establish(service);
      client.stub.kill();
      client.sendMany(12);
      const metrics = StubMetrics.from(client.stub);
      expect(metrics.requests).assertEqual(12);
      expect(metrics.handled).assertEqual(0);
      expect(metrics.rejected).assertEqual(12);
      expect(metrics.fingerprint()).assertEqual(textFingerprint('12:0:12:0'));
      expect(metrics.successRatio()).assertEqual(0);
      expect(client.trace()).assertEqual('');
    });

    /**
     * @tc.name          connectivityIntegrationDeterministicRecovery
     * @tc.desc          Identical loss-recovery plans produce identical metrics.
     * @tc.precondition  Two services are prepared.
     * @tc.steps         1. Run the same plan on both.
     *                   2. Build both metric sets.
     *                   3. Compare fingerprints.
     * @tc.expected      Both fingerprints match at 4:2:2:2.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectivityIntegrationDeterministicRecovery', 0, () => {
      const fingerprints: number[] = [];
      for (let run = 0; run < 2; run++) {
        const service = new ServiceLifecycleModel();
        service.onCreate();
        const client = establish(service);
        client.sendMany(2);
        client.stub.kill();
        client.sendMany(1);
        client.stub.revive();
        client.sendMany(1);
        fingerprints.push(StubMetrics.from(client.stub).fingerprint());
      }
      expect(fingerprints.length).assertEqual(2);
      expect(fingerprints[0]).assertEqual(fingerprints[1]);
      expect(fingerprints[0]).assertEqual(textFingerprint('4:3:1:3'));
      expect(fingerprints[1]).assertEqual(textFingerprint('4:3:1:3'));
      expect(fingerprints[0] === textFingerprint('4:2:2:2')).assertFalse();
    });

    /**
     * @tc.name          connectivityIntegrationHundredRecoveries
     * @tc.desc          One hundred recovery cycles keep a half-success profile.
     * @tc.precondition  A connected client exists.
     * @tc.steps         1. Repeat kill, send, revive and send one hundred times.
     *                   2. Build metrics.
     *                   3. Read the final alive flag.
     * @tc.expected      Two hundred rows with one hundred handled.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectivityIntegrationHundredRecoveries', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const client = establish(service);
      for (let cycle = 0; cycle < 100; cycle++) {
        client.stub.kill();
        client.send(REQUEST_CODE, 'lost-' + String(cycle));
        client.stub.revive();
        client.send(REQUEST_CODE, 'back-' + String(cycle));
      }
      const metrics = StubMetrics.from(client.stub);
      expect(metrics.requests).assertEqual(200);
      expect(metrics.handled).assertEqual(100);
      expect(metrics.rejected).assertEqual(100);
      expect(client.replies.length).assertEqual(100);
      expect(client.stub.alive).assertTrue();
      expect(service.state).assertEqual('connected');
    });

    /**
     * @tc.name          connectivityIntegrationLossWithMixedCodes
     * @tc.desc          Mixed codes after recovery keep their normal outcomes.
     * @tc.precondition  A revived stub exists.
     * @tc.steps         1. Revive the stub.
     *                   2. Send four valid and two invalid codes.
     *                   3. Build metrics.
     * @tc.expected      Four handled and two rejected rows.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectivityIntegrationLossWithMixedCodes', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const client = establish(service);
      client.stub.kill();
      client.stub.revive();
      const codes: number[] = [REQUEST_CODE, UNKNOWN_CODE_ZERO, REQUEST_CODE, REQUEST_CODE,
        UNKNOWN_CODE_TWO, REQUEST_CODE];
      for (let index = 0; index < codes.length; index++) {
        client.send(codes[index], 'mixed-' + String(index));
      }
      const metrics = StubMetrics.from(client.stub);
      expect(metrics.requests).assertEqual(6);
      expect(metrics.handled).assertEqual(4);
      expect(metrics.rejected).assertEqual(2);
      expect(metrics.successRatio()).assertEqual(2 / 3);
      expect(client.replies.length).assertEqual(4);
      expect(client.stub.requests[1].handled).assertFalse();
    });

    /**
     * @tc.name          connectivityIntegrationFullConnectivityAudit
     * @tc.desc          A full loss cycle reconciles every observable.
     * @tc.precondition  A service is created.
     * @tc.steps         1. Connect, send five, kill and send two.
     *                   2. Revive, send three, disconnect and destroy.
     *                   3. Audit counters and metrics.
     * @tc.expected      Ten requests, eight handled and two rejected with a destroyed service.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectivityIntegrationFullConnectivityAudit', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const client = establish(service);
      client.sendMany(5);
      client.stub.kill();
      client.sendMany(2);
      client.stub.revive();
      client.sendMany(3);
      service.onDisconnect();
      service.onDestroy();
      const metrics = StubMetrics.from(client.stub);
      expect(metrics.requests).assertEqual(10);
      expect(metrics.handled).assertEqual(8);
      expect(metrics.rejected).assertEqual(2);
      expect(service.connectCount).assertEqual(1);
      expect(service.disconnectCount).assertEqual(1);
      expect(service.destroyCount).assertEqual(1);
      expect(service.isAlive()).assertFalse();
    });

    /**
     * @tc.name          connectivityIntegrationResponseAfterRecovery
     * @tc.desc          The first reply after recovery matches production.
     * @tc.precondition  A stub has been killed and revived.
     * @tc.steps         1. Kill and revive the stub.
     *                   2. Send one request.
     *                   3. Compare the reply and ledger.
     * @tc.expected      The reply is hello rpc with a handled row.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('connectivityIntegrationResponseAfterRecovery', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const client = establish(service);
      client.stub.kill();
      client.stub.revive();
      const result = client.send(REQUEST_CODE, 'first-after-recovery');
      expect(result.errCode).assertEqual(0);
      expect(result.handled).assertTrue();
      expect(result.replyText).assertEqual('hello rpc');
      expect(client.stub.requests[0].text).assertEqual('first-after-recovery');
      expect(client.stub.requests[0].replyText).assertEqual(REPLY_PAYLOAD);
      expect(client.replies.length).assertEqual(1);
    });

    /**
     * @tc.name          connectivityIntegrationFinalStateAudit
     * @tc.desc          The final state after loss and destroy is consistent.
     * @tc.precondition  A service has destroyed after a loss cycle.
     * @tc.steps         1. Run a loss cycle and destroy.
     *                   2. Read the service and stub states.
     *                   3. Compare the snapshot.
     * @tc.expected      The service is destroyed while the stub remains alive.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectivityIntegrationFinalStateAudit', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const client = establish(service);
      loseAndRecover(service, client);
      service.onDestroy();
      const snapshot = new ServiceSnapshot(service);
      expect(snapshot.state).assertEqual('destroyed');
      expect(snapshot.connects).assertEqual(1);
      expect(snapshot.destroys).assertEqual(1);
      expect(service.isAlive()).assertFalse();
      expect(client.stub.alive).assertTrue();
      expect(client.stub.requestCount()).assertEqual(2);
    });

    /**
     * @tc.name          connectivityIntegrationDescriptorAcrossReconnects
     * @tc.desc          Every reconnect returns the same descriptor name.
     * @tc.precondition  A service is created.
     * @tc.steps         1. Connect and reconnect four times.
     *                   2. Record each descriptor.
     *                   3. Compare all four.
     * @tc.expected      All descriptors read IPCStubTest.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectivityIntegrationDescriptorAcrossReconnects', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const descriptors: string[] = [];
      for (let cycle = 0; cycle < 4; cycle++) {
        const stub = service.onConnect();
        descriptors.push(stub.descriptor);
        service.onDisconnect();
      }
      expect(descriptors.length).assertEqual(4);
      expect(countOf(descriptors, STUB_DESCRIPTOR)).assertEqual(4);
      expect(countOf(descriptors, 'IPCStubTest')).assertEqual(4);
      expect(service.connectCount).assertEqual(4);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(4);
      expect(service.state).assertEqual('disconnected');
    });

    /**
     * @tc.name          connectivityIntegrationConnectivityJourney
     * @tc.desc          A two-session journey ends in a fully consistent state.
     * @tc.precondition  A service is created.
     * @tc.steps         1. Connect, send and disconnect.
     *                   2. Reconnect, send and disconnect.
     *                   3. Destroy and audit.
     * @tc.expected      Two connects, two disconnects and one destroy are recorded.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectivityIntegrationConnectivityJourney', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const first = establish(service);
      first.sendMany(2);
      service.onDisconnect();
      const second = establish(service);
      second.sendMany(3);
      second.stub.kill();
      second.stub.revive();
      second.send(REQUEST_CODE, 'journey-recovery');
      service.onDisconnect();
      service.onDestroy();
      expect(service.connectCount).assertEqual(2);
      expect(service.disconnectCount).assertEqual(2);
      expect(service.destroyCount).assertEqual(1);
      expect(service.state).assertEqual('destroyed');
      expect(StubMetrics.from(first.stub).requests).assertEqual(2);
      expect(StubMetrics.from(second.stub).requests).assertEqual(4);
    });

    /**
     * @tc.name          connectivityIntegrationLossDuringSession
     * @tc.desc          Losing a stub mid-session forces a reconnect for new traffic.
     * @tc.precondition  A connected client with a dead stub exists.
     * @tc.steps         1. Kill the stub and send once.
     *                   2. Disconnect and reconnect.
     *                   3. Send through the new stub.
     * @tc.expected      The new stub is live and serves the request.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectivityIntegrationLossDuringSession', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const first = establish(service);
      first.stub.kill();
      expect(first.send(REQUEST_CODE, 'dead-session').isSuccess()).assertFalse();
      service.onDisconnect();
      const second = establish(service);
      const result = second.send(REQUEST_CODE, 'new-session');
      expect(result.isSuccess()).assertTrue();
      expect(second.stub.alive).assertTrue();
      expect(first.stub.alive).assertFalse();
      expect(second.stub === first.stub).assertFalse();
      expect(service.connectCount).assertEqual(2);
      expect(service.disconnectCount).assertEqual(1);
    });

    /**
     * @tc.name          connectivityIntegrationRecoveryClearsKillState
     * @tc.desc          Revive fully clears the killed state for later traffic.
     * @tc.precondition  A killed stub exists.
     * @tc.steps         1. Kill the stub.
     *                   2. Revive and send six requests.
     *                   3. Send an unknown code.
     * @tc.expected      The six valid requests succeed and the unknown code is rejected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectivityIntegrationRecoveryClearsKillState', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const client = establish(service);
      client.stub.kill();
      client.stub.revive();
      expect(client.stub.alive).assertTrue();
      const handled = client.sendMany(6);
      const rejected = client.send(UNKNOWN_CODE_LARGE, 'unknown-after-recovery');
      expect(handled).assertEqual(6);
      expect(rejected.isSuccess()).assertFalse();
      expect(client.replies.length).assertEqual(6);
      expect(client.stub.requestCount()).assertEqual(7);
      expect(StubMetrics.from(client.stub).rejected).assertEqual(1);
    });

    /**
     * @tc.name          connectivityIntegrationStubResetDuringRecovery
     * @tc.desc          Resetting a killed stub recovers it and clears its ledger.
     * @tc.precondition  A killed stub with rejected rows exists.
     * @tc.steps         1. Kill the stub and send two requests.
     *                   2. Reset the stub.
     *                   3. Send one request and read the ledger.
     * @tc.expected      The reset stub is alive with exactly one new row.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectivityIntegrationStubResetDuringRecovery', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const client = establish(service);
      client.stub.kill();
      client.sendMany(2);
      expect(client.stub.requestCount()).assertEqual(2);
      client.stub.reset();
      expect(client.stub.alive).assertTrue();
      expect(client.stub.requestCount()).assertEqual(0);
      const result = client.send(REQUEST_CODE, 'after-stub-reset');
      expect(result.isSuccess()).assertTrue();
      expect(client.stub.requestCount()).assertEqual(1);
      expect(service.state).assertEqual('connected');
    });

    /**
     * @tc.name          connectivityIntegrationReconnectMetricsIsolation
     * @tc.desc          A new connection starts a separate metric history.
     * @tc.precondition  A first session has recorded four requests.
     * @tc.steps         1. Disconnect and reconnect.
     *                   2. Send three requests through the new stub.
     *                   3. Compare both metric sets.
     * @tc.expected      The first stub reports four and the second three.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectivityIntegrationReconnectMetricsIsolation', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const first = establish(service);
      first.sendMany(4);
      service.onDisconnect();
      const second = establish(service);
      second.sendMany(3);
      expect(StubMetrics.from(first.stub).requests).assertEqual(4);
      expect(StubMetrics.from(second.stub).requests).assertEqual(3);
      expect(StubMetrics.from(first.stub).fingerprint()).assertEqual(textFingerprint('4:4:0:4'));
      expect(StubMetrics.from(second.stub).fingerprint()).assertEqual(textFingerprint('3:3:0:3'));
      expect(service.connectCount).assertEqual(2);
      expect(service.stub === second.stub).assertTrue();
    });

    /**
     * @tc.name          connectivityIntegrationLossRecoverySnapshot
     * @tc.desc          Stub loss does not alter service connection counters.
     * @tc.precondition  A connected service has experienced a stub kill.
     * @tc.steps         1. Kill and revive the stub.
     *                   2. Capture a snapshot.
     *                   3. Compare with a pre-loss snapshot.
     * @tc.expected      Both snapshots are identical.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectivityIntegrationLossRecoverySnapshot', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const client = establish(service);
      client.sendMany(2);
      const before = new ServiceSnapshot(service);
      loseAndRecover(service, client);
      const after = new ServiceSnapshot(service);
      expect(before.sameAs(after)).assertTrue();
      expect(before.describe()).assertEqual(after.describe());
      expect(after.connects).assertEqual(1);
      expect(after.disconnects).assertEqual(0);
      expect(service.isAlive()).assertTrue();
      expect(client.stub.alive).assertTrue();
    });
  });
}
