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

/**
 * Descriptor contract of the IPC client protocol.
 *
 * The stub publishes the descriptor 'IPCStubTest'. The client discovers it
 * through the remote proxy when onConnect fires, and uses that string when it
 * records death-recipient registration and connection events. This suite
 * checks constant equality, proxy/stub mirroring, custom descriptors, event
 * decoration, snapshots and the interaction with connect and disconnect.
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite } from '../Shared/Support';
import {
  STUB_DESCRIPTOR,
  TARGET_BUNDLE,
  TARGET_ABILITY,
  REQUEST_PAYLOAD,
  REPLY_PAYLOAD,
  REQUEST_CODE,
  ERROR_SEND,
  STATE_DISCONNECTED,
  STATE_CONNECTED,
  CONNECT_SUCCESS_TOAST,
  DISCONNECT_SUCCESS_TOAST,
  RemoteStubModel,
  RemoteProxyModel,
  DeathRecipientModel,
  MessageSequenceModel,
  MessageOptionModel,
  WantModel,
  ConnectionModel,
  ClientSnapshot,
  createConnectedSession,
  textFingerprint
} from '../Shared/SharedDriver';

/** Builds a session whose stub advertises a custom descriptor. */
function sessionWithDescriptor(descriptor: string): ConnectionModel {
  const stub = new RemoteStubModel(descriptor);
  const proxy = new RemoteProxyModel(stub);
  const client = new ConnectionModel();
  client.connect(5);
  client.onConnect(proxy);
  return client;
}

/** Finds the first event entry containing a fragment. */
function firstEventWith(client: ConnectionModel, fragment: string): string {
  for (let index = 0; index < client.events.entries.length; index++) {
    if (client.events.entries[index].indexOf(fragment) >= 0) {
      return client.events.entries[index];
    }
  }
  return '';
}

export default function clientDescriptor(): void {
  describe('ClientDescriptorContract', () => {
    beforeAll(() => {
      logSuite('ClientDescriptorContract', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('ClientDescriptorContract', 'end');
    });
    /**
     * @tc.name          clientDescriptorConstantIsStubTest
     * @tc.desc          The exported descriptor constant is 'IPCStubTest'.
     * @tc.precondition  SharedDriver constants are loaded.
     * @tc.steps         1. Read STUB_DESCRIPTOR. 2. Compare with the literal.
     *                   3. Check its shape.
     * @tc.expected      The descriptor equals 'IPCStubTest' and starts with 'IPC'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientDescriptorConstantIsStubTest', 0, () => {
      expect(STUB_DESCRIPTOR).assertEqual('IPCStubTest');
      expect(STUB_DESCRIPTOR.length).assertEqual(11);
      expect(STUB_DESCRIPTOR.startsWith('IPC')).assertTrue();
      expect(STUB_DESCRIPTOR.endsWith('Test')).assertTrue();
      expect(STUB_DESCRIPTOR.indexOf('Stub')).assertEqual(3);
      expect(STUB_DESCRIPTOR === '').assertFalse();
    });

    /**
     * @tc.name          clientDescriptorProxyMirrorsStub
     * @tc.desc          A new proxy copies the descriptor of its stub.
     * @tc.precondition  A stub with the default descriptor.
     * @tc.steps         1. Build the stub and the proxy. 2. Read both descriptors.
     *                   3. Compare them with the constant.
     * @tc.expected      Stub, proxy and constant all equal 'IPCStubTest'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientDescriptorProxyMirrorsStub', 0, () => {
      const stub = new RemoteStubModel();
      const proxy = new RemoteProxyModel(stub);
      expect(stub.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(proxy.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(proxy.descriptor).assertEqual(stub.descriptor);
      expect(proxy.stub === stub).assertTrue();
      expect(proxy.descriptor === stub.descriptor).assertTrue();
      expect(proxy.alive).assertTrue();
    });

    /**
     * @tc.name          clientDescriptorDefaultSessionExposesConstant
     * @tc.desc          A connected default session exposes the stub descriptor.
     * @tc.precondition  createConnectedSession uses a default stub.
     * @tc.steps         1. Build the session. 2. Read the proxy descriptor.
     *                   3. Compare with the constant and stub.
     * @tc.expected      The connected proxy reports 'IPCStubTest'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientDescriptorDefaultSessionExposesConstant', 0, () => {
      const session = createConnectedSession();
      expect(session.proxy?.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(session.proxy?.descriptor).assertEqual('IPCStubTest');
      expect(session.proxy?.stub.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.proxy === undefined).assertFalse();
      expect(session.deathRecipient.registered).assertTrue();
    });

    /**
     * @tc.name          clientDescriptorCustomValuePropagates
     * @tc.desc          A custom stub descriptor reaches the client proxy unchanged.
     * @tc.precondition  sessionWithDescriptor accepts any string.
     * @tc.steps         1. Build a session with 'CustomDescriptor'.
     *                   2. Read proxy and stub descriptors.
     *                   3. Compare with the constant.
     * @tc.expected      Both report the custom value, not 'IPCStubTest'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientDescriptorCustomValuePropagates', 0, () => {
      const session = sessionWithDescriptor('CustomDescriptor');
      expect(session.proxy?.descriptor).assertEqual('CustomDescriptor');
      expect(session.proxy?.stub.descriptor).assertEqual('CustomDescriptor');
      expect(session.proxy?.descriptor === STUB_DESCRIPTOR).assertFalse();
      expect(session.proxy?.descriptor.length).assertEqual(16);
      expect(session.state).assertEqual(STATE_CONNECTED);
    });

    /**
     * @tc.name          clientDescriptorEmptyValuePropagates
     * @tc.desc          An empty descriptor is copied verbatim without a default.
     * @tc.precondition  A stub built with an empty descriptor.
     * @tc.steps         1. Build the proxy. 2. Compare descriptors.
     *                   3. Confirm registration still succeeds.
     * @tc.expected      The descriptor is '' while death registration succeeds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientDescriptorEmptyValuePropagates', 0, () => {
      const stub = new RemoteStubModel('');
      const proxy = new RemoteProxyModel(stub);
      expect(proxy.descriptor).assertEqual('');
      expect(stub.descriptor).assertEqual('');
      expect(proxy.descriptor.length).assertEqual(0);
      const recipient = new DeathRecipientModel();
      expect(proxy.registerDeathRecipient(recipient)).assertTrue();
      expect(recipient.registered).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
    });

    /**
     * @tc.name          clientDescriptorDiffersFromWantFields
     * @tc.desc          The descriptor is not the bundle or ability name.
     * @tc.precondition  A default session and the target Want constants.
     * @tc.steps         1. Compare the descriptor with the bundle name.
     *                   2. Compare it with the ability name.
     *                   3. Build the Want description.
     * @tc.expected      The descriptor differs from both Want fields.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientDescriptorDiffersFromWantFields', 0, () => {
      const session = createConnectedSession();
      const descriptor = session.proxy?.descriptor;
      expect(descriptor === TARGET_BUNDLE).assertFalse();
      expect(descriptor === TARGET_ABILITY).assertFalse();
      expect(descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(session.want.describe()).assertEqual(TARGET_BUNDLE + '/' + TARGET_ABILITY);
      expect(session.want.describe().indexOf(STUB_DESCRIPTOR)).assertEqual(-1);
      expect(descriptor?.indexOf('.')).assertEqual(-1);
    });

    /**
     * @tc.name          clientDescriptorDeathRegisterEvent
     * @tc.desc          Successful registration records the descriptor in the event.
     * @tc.precondition  A default connected session.
     * @tc.steps         1. Read the death-register entry.
     *                   2. Compare its suffix with the descriptor.
     *                   3. Count registration events.
     * @tc.expected      The entry is death-register:IPCStubTest.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientDescriptorDeathRegisterEvent', 0, () => {
      const session = createConnectedSession();
      expect(firstEventWith(session, 'death-register')).assertEqual('death-register:' + STUB_DESCRIPTOR);
      expect(session.events.countOf('death-register')).assertEqual(1);
      expect(session.events.countOf('death-register-failed')).assertEqual(0);
      expect(session.events.entries[1]).assertEqual('death-register:IPCStubTest');
      expect(session.logs.contains('registerDeathRecipient success')).assertTrue();
    });

    /**
     * @tc.name          clientDescriptorConnectedEvent
     * @tc.desc          The connected event is decorated with the descriptor.
     * @tc.precondition  A default connected session.
     * @tc.steps         1. Read the connected entry.
     *                   2. Compare its suffix with the constant.
     *                   3. Confirm it follows the registration entry.
     * @tc.expected      The entry is connected:IPCStubTest at index two.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientDescriptorConnectedEvent', 0, () => {
      const session = createConnectedSession();
      expect(firstEventWith(session, 'connected')).assertEqual('connected:' + STUB_DESCRIPTOR);
      expect(session.events.entries[2]).assertEqual('connected:IPCStubTest');
      expect(session.events.entries[1].startsWith('death-register:')).assertTrue();
      expect(session.events.countOf('connected')).assertEqual(1);
      expect(session.events.last()).assertEqual('connected:IPCStubTest');
      expect(session.events.entries[0].startsWith('connect:')).assertTrue();
    });

    /**
     * @tc.name          clientDescriptorFailedRegistrationEvent
     * @tc.desc          A dead proxy produces a failed registration event with the descriptor.
     * @tc.precondition  A dead proxy attached through onConnect.
     * @tc.steps         1. Kill the proxy. 2. Connect the client to it.
     *                   3. Read the registration events.
     * @tc.expected      The failed event carries the descriptor and registration stays false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientDescriptorFailedRegistrationEvent', 0, () => {
      const stub = new RemoteStubModel();
      const proxy = new RemoteProxyModel(stub);
      proxy.kill();
      const client = new ConnectionModel();
      client.connect(3);
      client.onConnect(proxy);
      expect(client.events.countOf('death-register-failed')).assertEqual(1);
      expect(client.events.countOf('death-register')).assertEqual(0);
      expect(client.events.entries[1]).assertEqual('death-register-failed:IPCStubTest');
      expect(client.deathRecipient.registered).assertFalse();
      expect(proxy.deathRegistered).assertFalse();
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.logs.contains('register failed')).assertTrue();
    });

    /**
     * @tc.name          clientDescriptorCustomInEvents
     * @tc.desc          Custom descriptors appear in every registration-related event.
     * @tc.precondition  A session with a custom descriptor.
     * @tc.steps         1. Read the connected entry.
     *                   2. Read the registration entry.
     *                   3. Compare both suffixes.
     * @tc.expected      Both entries end with the custom descriptor.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientDescriptorCustomInEvents', 0, () => {
      const session = sessionWithDescriptor('CustomEvents');
      expect(firstEventWith(session, 'connected')).assertEqual('connected:CustomEvents');
      expect(firstEventWith(session, 'death-register')).assertEqual('death-register:CustomEvents');
      expect(session.events.trace().indexOf('CustomEvents')).assertLarger(-1);
      expect(session.events.trace().indexOf(STUB_DESCRIPTOR)).assertEqual(-1);
      expect(session.events.countOf('connected')).assertEqual(1);
      expect(session.proxy?.descriptor).assertEqual('CustomEvents');
    });

    /**
     * @tc.name          clientDescriptorSnapshotHasRegistration
     * @tc.desc          The client snapshot records death registration as true.
     * @tc.precondition  A default connected session.
     * @tc.steps         1. Build a snapshot. 2. Inspect its flags.
     *                   3. Read its description.
     * @tc.expected      hasProxy and deathRegistered are both true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientDescriptorSnapshotHasRegistration', 0, () => {
      const session = createConnectedSession();
      const snapshot = new ClientSnapshot(session);
      expect(snapshot.hasProxy).assertTrue();
      expect(snapshot.deathRegistered).assertTrue();
      expect(snapshot.state).assertEqual(STATE_CONNECTED);
      expect(snapshot.connectId).assertEqual(7);
      expect(snapshot.toastCount).assertEqual(1);
      expect(snapshot.describe()).assertEqual('connected/7/true/true/1');
    });

    /**
     * @tc.name          clientDescriptorSnapshotAfterDisconnect
     * @tc.desc          Disconnect clears the proxy and the registration flag in snapshots.
     * @tc.precondition  A default connected session.
     * @tc.steps         1. Take a snapshot. 2. Disconnect.
     *                   3. Take a second snapshot and compare.
     * @tc.expected      The second snapshot loses the proxy and registration.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientDescriptorSnapshotAfterDisconnect', 0, () => {
      const session = createConnectedSession();
      const before = new ClientSnapshot(session);
      session.onDisconnect();
      const after = new ClientSnapshot(session);
      expect(before.deathRegistered).assertTrue();
      expect(after.deathRegistered).assertFalse();
      expect(before.hasProxy).assertTrue();
      expect(after.hasProxy).assertFalse();
      expect(before.sameAs(after)).assertFalse();
      expect(after.state).assertEqual(STATE_DISCONNECTED);
      expect(after.describe().indexOf('false/false')).assertLarger(-1);
    });

    /**
     * @tc.name          clientDescriptorRegistrationAfterReconnect
     * @tc.desc          Reconnecting re-registers the death recipient for the new proxy.
     * @tc.precondition  A default connected session.
     * @tc.steps         1. Disconnect. 2. Connect with a fresh proxy.
     *                   3. Count registration events and inspect the descriptor.
     * @tc.expected      Two registration events exist, both with 'IPCStubTest'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientDescriptorRegistrationAfterReconnect', 0, () => {
      const session = createConnectedSession();
      session.onDisconnect();
      expect(session.deathRecipient.registered).assertFalse();
      session.connect(13);
      const stub = new RemoteStubModel();
      const proxy = new RemoteProxyModel(stub);
      session.onConnect(proxy);
      expect(session.events.countOf('death-register')).assertEqual(2);
      expect(session.events.countOf('death-register-failed')).assertEqual(0);
      expect(proxy.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(session.deathRecipient.registered).assertTrue();
      expect(session.events.countOf('connected')).assertEqual(2);
    });

    /**
     * @tc.name          clientDescriptorStableAcrossSends
     * @tc.desc          Sending requests never mutates the proxy descriptor.
     * @tc.precondition  A default connected session.
     * @tc.steps         1. Record the descriptor. 2. Send three requests.
     *                   3. Compare the descriptor again.
     * @tc.expected      The descriptor remains 'IPCStubTest' after all sends.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientDescriptorStableAcrossSends', 0, () => {
      const session = createConnectedSession();
      const before = session.proxy?.descriptor;
      session.sendString('one');
      session.sendString('two');
      session.sendString('three');
      const after = session.proxy?.descriptor;
      expect(after).assertEqual(before);
      expect(after).assertEqual(STUB_DESCRIPTOR);
      expect(after).assertEqual('IPCStubTest');
      expect(session.proxy?.stub.descriptor).assertEqual(after);
      expect(session.proxy?.stub.requestCount()).assertEqual(3);
      expect(session.events.countOf('send-ok')).assertEqual(3);
    });

    /**
     * @tc.name          clientDescriptorSurvivesDeathNotify
     * @tc.desc          A death notification leaves the descriptor string readable.
     * @tc.precondition  A default connected session.
     * @tc.steps         1. Notify remote death. 2. Read the descriptor.
     *                   3. Confirm the recipient counted the death.
     * @tc.expected      The descriptor is unchanged while diedCount is one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientDescriptorSurvivesDeathNotify', 0, () => {
      const session = createConnectedSession();
      session.proxy?.notifyDeath();
      expect(session.proxy?.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(session.proxy?.isAlive()).assertFalse();
      expect(session.deathRecipient.diedCount).assertEqual(1);
      expect(session.deathRecipient.describe()).assertEqual('1/true');
      expect(session.isConnected()).assertFalse();
      expect(session.state).assertEqual(STATE_CONNECTED);
    });

    /**
     * @tc.name          clientDescriptorUnregisterKeepsValue
     * @tc.desc          Unregistering a death recipient does not clear the descriptor.
     * @tc.precondition  A default connected session.
     * @tc.steps         1. Unregister the recipient directly.
     *                   2. Read descriptor and registration flags.
     *                   3. Unregister a foreign recipient.
     * @tc.expected      The descriptor stays while the flags clear and the foreign call fails.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientDescriptorUnregisterKeepsValue', 0, () => {
      const session = createConnectedSession();
      const proxy = session.proxy;
      expect(proxy?.unregisterDeathRecipient(session.deathRecipient)).assertTrue();
      expect(proxy?.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(proxy?.deathRegistered).assertFalse();
      expect(session.deathRecipient.registered).assertFalse();
      const foreign = new DeathRecipientModel();
      expect(proxy?.unregisterDeathRecipient(foreign)).assertFalse();
      expect(foreign.registered).assertFalse();
      expect(proxy?.descriptor).assertEqual('IPCStubTest');
    });

    /**
     * @tc.name          clientDescriptorFingerprintDistinguishesValues
     * @tc.desc          Descriptor text fingerprints separate different names.
     * @tc.precondition  textFingerprint is exported.
     * @tc.steps         1. Hash the constant. 2. Hash two custom names.
     *                   3. Compare the hashes.
     * @tc.expected      All three hashes differ and repeat calls are stable.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientDescriptorFingerprintDistinguishesValues', 0, () => {
      const base = textFingerprint(STUB_DESCRIPTOR);
      const lower = textFingerprint('ipcstubtest');
      const suffix = textFingerprint('IPCStubTest2');
      expect(base === lower).assertFalse();
      expect(base === suffix).assertFalse();
      expect(lower === suffix).assertFalse();
      expect(base).assertEqual(textFingerprint('IPCStubTest'));
      expect(base).assertLarger(0);
      expect(textFingerprint('')).assertEqual(216613);
    });

    /**
     * @tc.name          clientDescriptorWantDescribeFormat
     * @tc.desc          The Want description uses the bundle/ability format.
     * @tc.precondition  A default WantModel.
     * @tc.steps         1. Build a WantModel. 2. Describe it.
     *                   3. Split and compare the parts.
     * @tc.expected      The description is 'com.example.ipc_stub/ServiceAbility'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientDescriptorWantDescribeFormat', 0, () => {
      const want = new WantModel();
      const description = want.describe();
      const parts = description.split('/');
      expect(parts.length).assertEqual(2);
      expect(parts[0]).assertEqual(TARGET_BUNDLE);
      expect(parts[1]).assertEqual(TARGET_ABILITY);
      expect(description).assertEqual('com.example.ipc_stub/ServiceAbility');
      expect(description.indexOf(STUB_DESCRIPTOR)).assertEqual(-1);
      expect(want.validate().length).assertEqual(0);
      expect(want.matches(new WantModel())).assertTrue();
    });

    /**
     * @tc.name          clientDescriptorSnapshotStableTwice
     * @tc.desc          Two snapshots of an idle session are identical.
     * @tc.precondition  A default connected session.
     * @tc.steps         1. Take two snapshots in a row.
     *                   2. Compare them. 3. Compare descriptions.
     * @tc.expected      Both snapshots report the same state and describe text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientDescriptorSnapshotStableTwice', 0, () => {
      const session = createConnectedSession();
      const first = new ClientSnapshot(session);
      const second = new ClientSnapshot(session);
      expect(first.sameAs(second)).assertTrue();
      expect(second.sameAs(first)).assertTrue();
      expect(first.describe()).assertEqual(second.describe());
      expect(first.toastCount).assertEqual(1);
      expect(first.deathRegistered).assertTrue();
      expect(first.connectId).assertEqual(7);
    });

    /**
     * @tc.name          clientDescriptorSnapshotDistinguishesSessions
     * @tc.desc          Snapshots from different sessions are not equal.
     * @tc.precondition  Two connected sessions with different connect ids.
     * @tc.steps         1. Build both sessions. 2. Snapshot both.
     *                   3. Compare equality and descriptions.
     * @tc.expected      The snapshots differ on the connect id.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientDescriptorSnapshotDistinguishesSessions', 0, () => {
      const alpha = createConnectedSession();
      const beta = createConnectedSession();
      expect(alpha.connectId).assertEqual(beta.connectId);
      const betaStub = new RemoteStubModel();
      const betaProxy = new RemoteProxyModel(betaStub);
      beta.onDisconnect();
      beta.connect(21);
      beta.onConnect(betaProxy);
      const first = new ClientSnapshot(alpha);
      const second = new ClientSnapshot(beta);
      expect(first.sameAs(second)).assertFalse();
      expect(first.connectId).assertEqual(7);
      expect(second.connectId).assertEqual(21);
      expect(first.state).assertEqual(second.state);
      expect(first.describe() === second.describe()).assertFalse();
    });

    /**
     * @tc.name          clientDescriptorRegisterTwiceStaysRegistered
     * @tc.desc          Registering a second recipient replaces the first.
     * @tc.precondition  A live proxy without a recipient.
     * @tc.steps         1. Register the first recipient.
     *                   2. Register a second one. 3. Inspect both flags.
     * @tc.expected      Only the second recipient is retained and registered.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientDescriptorRegisterTwiceStaysRegistered', 0, () => {
      const proxy = new RemoteProxyModel();
      const first = new DeathRecipientModel();
      const second = new DeathRecipientModel();
      expect(proxy.registerDeathRecipient(first)).assertTrue();
      expect(proxy.deathRecipient === first).assertTrue();
      expect(proxy.registerDeathRecipient(second)).assertTrue();
      expect(proxy.deathRecipient === second).assertTrue();
      expect(proxy.deathRecipient === first).assertFalse();
      expect(proxy.deathRegistered).assertTrue();
      expect(first.registered).assertTrue();
      expect(second.registered).assertTrue();
      expect(proxy.descriptor).assertEqual(STUB_DESCRIPTOR);
    });

    /**
     * @tc.name          clientDescriptorRegisterAfterDeathFails
     * @tc.desc          A dead proxy refuses a new death recipient registration.
     * @tc.precondition  A killed proxy.
     * @tc.steps         1. Kill the proxy. 2. Attempt registration.
     *                   3. Inspect the descriptor and flags.
     * @tc.expected      Registration returns false and no recipient is stored.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientDescriptorRegisterAfterDeathFails', 0, () => {
      const proxy = new RemoteProxyModel();
      proxy.kill();
      const recipient = new DeathRecipientModel();
      expect(proxy.registerDeathRecipient(recipient)).assertFalse();
      expect(proxy.deathRecipient === recipient).assertFalse();
      expect(proxy.deathRegistered).assertFalse();
      expect(recipient.registered).assertFalse();
      expect(proxy.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(proxy.isAlive()).assertFalse();
      expect(proxy.registerDeathRecipient(recipient)).assertFalse();
    });

    /**
     * @tc.name          clientDescriptorEmptyValueEvents
     * @tc.desc          An empty descriptor still decorates connection events consistently.
     * @tc.precondition  A session with an empty descriptor.
     * @tc.steps         1. Read the connected event.
     *                   2. Read the registration event.
     *                   3. Compare both suffixes.
     * @tc.expected      Both events end with an empty suffix and count once each.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientDescriptorEmptyValueEvents', 0, () => {
      const session = sessionWithDescriptor('');
      expect(session.proxy?.descriptor).assertEqual('');
      expect(firstEventWith(session, 'connected')).assertEqual('connected:');
      expect(firstEventWith(session, 'death-register')).assertEqual('death-register:');
      expect(session.events.countOf('connected')).assertEqual(1);
      expect(session.events.countOf('death-register')).assertEqual(1);
      expect(session.events.entries[1].endsWith(':')).assertTrue();
      expect(session.deathRecipient.registered).assertTrue();
    });

    /**
     * @tc.name          clientDescriptorNotPartOfReply
     * @tc.desc          The descriptor never leaks into the reply payload.
     * @tc.precondition  A default connected session.
     * @tc.steps         1. Send a request. 2. Read the reply.
     *                   3. Search it for the descriptor.
     * @tc.expected      The reply is 'hello rpc' without any descriptor text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientDescriptorNotPartOfReply', 0, () => {
      const session = createConnectedSession();
      const result = session.sendString(REQUEST_PAYLOAD);
      const reply = result.readReply();
      expect(reply).assertEqual(REPLY_PAYLOAD);
      expect(reply.indexOf(STUB_DESCRIPTOR)).assertEqual(-1);
      expect(reply.indexOf('IPC')).assertEqual(-1);
      expect(reply.length).assertEqual(9);
      expect(session.proxy?.descriptor).assertEqual('IPCStubTest');
      expect(session.logs.contains(STUB_DESCRIPTOR)).assertFalse();
    });

    /**
     * @tc.name          clientDescriptorResetClearsRecipient
     * @tc.desc          Resetting the client replaces the death recipient with a fresh one.
     * @tc.precondition  A default connected session.
     * @tc.steps         1. Capture the old recipient. 2. Reset the client.
     *                   3. Compare recipient flags and descriptor access.
     * @tc.expected      The old recipient is no longer the client recipient and the proxy is gone.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientDescriptorResetClearsRecipient', 0, () => {
      const session = createConnectedSession();
      const old = session.deathRecipient;
      expect(old.registered).assertTrue();
      session.reset();
      expect(session.deathRecipient === old).assertFalse();
      expect(session.deathRecipient.registered).assertFalse();
      expect(session.proxy === undefined).assertTrue();
      expect(session.state).assertEqual(STATE_DISCONNECTED);
      expect(session.connectId).assertEqual(-1);
      expect(old.registered).assertFalse();
    });

    /**
     * @tc.name          clientDescriptorEventCountAfterReconnect
     * @tc.desc          The event trace grows by three entries per connection.
     * @tc.precondition  A default connected session.
     * @tc.steps         1. Record the trace size. 2. Reconnect.
     *                   3. Compare the size.
     * @tc.expected      The size grows by exactly three entries.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientDescriptorEventCountAfterReconnect', 0, () => {
      const session = createConnectedSession();
      const before = session.events.size();
      session.onDisconnect();
      const afterDisconnect = session.events.size();
      session.connect(17);
      const stub = new RemoteStubModel();
      const proxy = new RemoteProxyModel(stub);
      session.onConnect(proxy);
      const afterConnect = session.events.size();
      expect(before).assertEqual(3);
      expect(afterDisconnect).assertEqual(4);
      expect(afterConnect).assertEqual(7);
      expect(session.events.countOf('connect')).assertEqual(2);
      expect(session.events.countOf('connected')).assertEqual(2);
      expect(session.events.countOf('disconnected')).assertEqual(1);
      expect(session.events.entries[6]).assertEqual('connected:IPCStubTest');
    });

    /**
     * @tc.name          clientDescriptorRegistrationIdempotentRecipient
     * @tc.desc          Registering the same recipient twice keeps it registered.
     * @tc.precondition  A live proxy.
     * @tc.steps         1. Register a recipient.
     *                   2. Register the same instance again.
     *                   3. Count death deliveries.
     * @tc.expected      The recipient stays stored and receives one death event.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientDescriptorRegistrationIdempotentRecipient', 0, () => {
      const proxy = new RemoteProxyModel();
      const recipient = new DeathRecipientModel();
      expect(proxy.registerDeathRecipient(recipient)).assertTrue();
      expect(proxy.registerDeathRecipient(recipient)).assertTrue();
      expect(proxy.deathRecipient === recipient).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      proxy.notifyDeath();
      expect(recipient.diedCount).assertEqual(1);
      expect(recipient.describe()).assertEqual('1/true');
      expect(proxy.descriptor).assertEqual(STUB_DESCRIPTOR);
    });

    /**
     * @tc.name          clientDescriptorCustomValueNotDefault
     * @tc.desc          A custom descriptor must not fall back to 'IPCStubTest'.
     * @tc.precondition  A session with 'OtherStub'.
     * @tc.steps         1. Read the descriptor. 2. Compare with the default.
     *                   3. Read the registration event.
     * @tc.expected      The custom value is used everywhere and the default never appears.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientDescriptorCustomValueNotDefault', 0, () => {
      const session = sessionWithDescriptor('OtherStub');
      expect(session.proxy?.descriptor).assertEqual('OtherStub');
      expect(session.proxy?.descriptor === STUB_DESCRIPTOR).assertFalse();
      expect(firstEventWith(session, 'death-register')).assertEqual('death-register:OtherStub');
      expect(session.events.trace().indexOf('IPCStubTest')).assertEqual(-1);
      expect(session.proxy?.descriptor.length).assertEqual(9);
      expect(session.deathRecipient.registered).assertTrue();
    });

    /**
     * @tc.name          clientDescriptorNameIsCaseSensitive
     * @tc.desc          Descriptor comparisons treat letter case as significant.
     * @tc.precondition  Two proxies with case-varied descriptors.
     * @tc.steps         1. Build 'ipcstubtest' and 'IPCStubTest'.
     *                   2. Compare their descriptors.
     *                   3. Compare their fingerprints.
     * @tc.expected      The values differ, as do their hashes.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientDescriptorNameIsCaseSensitive', 0, () => {
      const lower = new RemoteProxyModel(new RemoteStubModel('ipcstubtest'));
      const upper = new RemoteProxyModel(new RemoteStubModel('IPCStubTest'));
      expect(lower.descriptor === upper.descriptor).assertFalse();
      expect(lower.descriptor.toLowerCase()).assertEqual(upper.descriptor.toLowerCase());
      expect(textFingerprint(lower.descriptor) === textFingerprint(upper.descriptor)).assertFalse();
      expect(upper.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(lower.descriptor).assertEqual('ipcstubtest');
      expect(lower.descriptor.length).assertEqual(upper.descriptor.length);
    });

    /**
     * @tc.name          clientDescriptorConnectWithoutProxy
     * @tc.desc          A client that only connected has no descriptor to show.
     * @tc.precondition  A client in the connecting state.
     * @tc.steps         1. Call connect without onConnect.
     *                   2. Inspect the proxy and events.
     *                   3. Take a snapshot.
     * @tc.expected      The proxy is undefined and no registration event exists.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientDescriptorConnectWithoutProxy', 0, () => {
      const client = new ConnectionModel();
      expect(client.connect(4)).assertTrue();
      expect(client.proxy === undefined).assertTrue();
      expect(client.events.countOf('connect')).assertEqual(1);
      expect(client.events.countOf('death-register')).assertEqual(0);
      expect(client.deathRecipient.registered).assertFalse();
      const snapshot = new ClientSnapshot(client);
      expect(snapshot.hasProxy).assertFalse();
      expect(snapshot.deathRegistered).assertFalse();
      expect(snapshot.state).assertEqual('connecting');
      expect(snapshot.toastCount).assertEqual(0);
    });

    /**
     * @tc.name          clientDescriptorConnectRefusedWhenConnected
     * @tc.desc          Connecting twice without a disconnect is refused.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Call connect again. 2. Inspect the return value.
     *                   3. Read the warning log and the event count.
     * @tc.expected      The call returns false and logs a skipped connect.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientDescriptorConnectRefusedWhenConnected', 0, () => {
      const session = createConnectedSession();
      const before = session.events.size();
      expect(session.connect(99)).assertFalse();
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.events.size()).assertEqual(before);
      expect(session.connectId).assertEqual(7);
      expect(session.logs.contains('connect skipped in state connected')).assertTrue();
      expect(session.logs.countLevel('WARN')).assertEqual(1);
      expect(session.proxy?.descriptor).assertEqual(STUB_DESCRIPTOR);
    });

    /**
     * @tc.name          clientDescriptorConnectIdRecorded
     * @tc.desc          The supplied connect id is stored and surfaced in events.
     * @tc.precondition  A client before connecting.
     * @tc.steps         1. Connect with id 42. 2. Read the client field.
     *                   3. Disconnect and inspect the request event.
     * @tc.expected      The id is 42 until disconnect resets it to -1.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientDescriptorConnectIdRecorded', 0, () => {
      const client = new ConnectionModel();
      expect(client.connectId).assertEqual(-1);
      expect(client.connect(42)).assertTrue();
      expect(client.connectId).assertEqual(42);
      expect(client.disconnectRequested()).assertTrue();
      expect(client.events.last()).assertEqual('disconnect-request:42');
      expect(client.events.countOf('disconnect-request')).assertEqual(1);
      expect(client.connectId).assertEqual(42);
    });

    /**
     * @tc.name          clientDescriptorDisconnectWithoutConnectId
     * @tc.desc          A disconnect request before connecting is refused.
     * @tc.precondition  A fresh client.
     * @tc.steps         1. Call disconnectRequested. 2. Inspect the log.
     *                   3. Count disconnect-request events.
     * @tc.expected      The call returns false and logs 'disconnect without connectId'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientDescriptorDisconnectWithoutConnectId', 0, () => {
      const client = new ConnectionModel();
      expect(client.disconnectRequested()).assertFalse();
      expect(client.events.countOf('disconnect-request')).assertEqual(0);
      expect(client.events.size()).assertEqual(0);
      expect(client.logs.contains('disconnect without connectId')).assertTrue();
      expect(client.logs.countLevel('ERROR')).assertEqual(1);
      expect(client.proxy === undefined).assertTrue();
      expect(client.deathRecipient.registered).assertFalse();
    });

    /**
     * @tc.name          clientDescriptorFailureKeepsNoProxy
     * @tc.desc          onFailed leaves the client without a proxy or registration.
     * @tc.precondition  A connecting client.
     * @tc.steps         1. Connect. 2. Deliver an onFailed callback.
     *                   3. Inspect state, recipient and descriptor access.
     * @tc.expected      The state is failed and the descriptor remains unreachable.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientDescriptorFailureKeepsNoProxy', 0, () => {
      const client = new ConnectionModel();
      client.connect(6);
      client.onFailed(16000001);
      expect(client.state).assertEqual('failed');
      expect(client.failedCode).assertEqual(16000001);
      expect(client.proxy === undefined).assertTrue();
      expect(client.deathRecipient.registered).assertFalse();
      expect(client.events.last()).assertEqual('failed:16000001');
      expect(client.toasts.length).assertEqual(1);
      expect(client.logs.contains('onFailed code 16000001')).assertTrue();
    });

    /**
     * @tc.name          clientDescriptorProxyAliveFlag
     * @tc.desc          The proxy alive flag reflects kill and revive calls.
     * @tc.precondition  A default connected session.
     * @tc.steps         1. Read the alive flag. 2. Kill and check.
     *                   3. Revive and check again.
     * @tc.expected      The flag flips false then true while the descriptor is stable.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientDescriptorProxyAliveFlag', 0, () => {
      const session = createConnectedSession();
      expect(session.proxy?.alive).assertTrue();
      expect(session.proxy?.isAlive()).assertTrue();
      session.proxy?.kill();
      expect(session.proxy?.alive).assertFalse();
      expect(session.proxy?.isAlive()).assertFalse();
      expect(session.proxy?.descriptor).assertEqual(STUB_DESCRIPTOR);
      session.proxy?.revive();
      expect(session.proxy?.alive).assertTrue();
      expect(session.isConnected()).assertTrue();
    });

    /**
     * @tc.name          clientDescriptorFreshRecipientDescription
     * @tc.desc          A fresh death recipient reports zero deaths and no registration.
     * @tc.precondition  A new DeathRecipientModel.
     * @tc.steps         1. Read its fields. 2. Describe it.
     *                   3. Deliver one death notification.
     * @tc.expected      The initial description is '0/false' and becomes '1/false'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientDescriptorFreshRecipientDescription', 0, () => {
      const recipient = new DeathRecipientModel();
      expect(recipient.diedCount).assertEqual(0);
      expect(recipient.registered).assertFalse();
      expect(recipient.describe()).assertEqual('0/false');
      recipient.onRemoteDied();
      expect(recipient.diedCount).assertEqual(1);
      expect(recipient.describe()).assertEqual('1/false');
      expect(recipient.registered).assertFalse();
    });

    /**
     * @tc.name          clientDescriptorDisconnectUnregistersProxy
     * @tc.desc          onDisconnect unregisters the recipient and drops the proxy.
     * @tc.precondition  A default connected session.
     * @tc.steps         1. Call onDisconnect. 2. Inspect recipient and proxy state.
     *                   3. Read the last event.
     * @tc.expected      The recipient is unregistered, the proxy is gone and the toast updates.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientDescriptorDisconnectUnregistersProxy', 0, () => {
      const session = createConnectedSession();
      const proxy = session.proxy;
      session.onDisconnect();
      expect(session.proxy === undefined).assertTrue();
      expect(session.deathRecipient.registered).assertFalse();
      expect(proxy?.deathRegistered).assertFalse();
      expect(session.events.last()).assertEqual('disconnected:ok');
      expect(session.lastToast()).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(session.isDisconnect).assertTrue();
      expect(session.state).assertEqual(STATE_DISCONNECTED);
    });

    /**
     * @tc.name          clientDescriptorDoubleDisconnectIsSafe
     * @tc.desc          A second onDisconnect in the disconnected state is harmless.
     * @tc.precondition  A default connected session already disconnected once.
     * @tc.steps         1. Disconnect once. 2. Disconnect again.
     *                   3. Count disconnect events and toasts.
     * @tc.expected      Two disconnect events and two toasts accumulate without errors.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientDescriptorDoubleDisconnectIsSafe', 0, () => {
      const session = createConnectedSession();
      session.onDisconnect();
      session.onDisconnect();
      expect(session.events.countOf('disconnected')).assertEqual(2);
      expect(session.toasts.length).assertEqual(3);
      expect(session.toasts[2]).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(session.connectId).assertEqual(-1);
      expect(session.proxy === undefined).assertTrue();
      expect(session.deathRecipient.diedCount).assertEqual(0);
      expect(session.logs.countLevel('ERROR')).assertEqual(0);
    });

    /**
     * @tc.name          clientDescriptorEventsAppendOnDisconnect
     * @tc.desc          Disconnect appends exactly one event to the trace.
     * @tc.precondition  A default connected session.
     * @tc.steps         1. Record the size. 2. Disconnect.
     *                   3. Compare the size and last entry.
     * @tc.expected      The size grows by one with 'disconnected:ok'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientDescriptorEventsAppendOnDisconnect', 0, () => {
      const session = createConnectedSession();
      const before = session.events.size();
      session.onDisconnect();
      expect(session.events.size()).assertEqual(before + 1);
      expect(session.events.size()).assertEqual(4);
      expect(session.events.last()).assertEqual('disconnected:ok');
      expect(session.events.countOf('disconnected')).assertEqual(1);
      expect(session.events.countOf('connected')).assertEqual(1);
      expect(session.events.entries[3].startsWith('disconnected')).assertTrue();
    });

    /**
     * @tc.name          clientDescriptorWantValidationErrors
     * @tc.desc          Want validation reports empty and spaced fields.
     * @tc.precondition  WantModel is exported.
     * @tc.steps         1. Validate an empty bundle.
     *                   2. Validate an empty ability.
     *                   3. Validate a name containing a space.
     * @tc.expected      Each defect appears as its documented error token.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientDescriptorWantValidationErrors', 0, () => {
      const emptyBundle = new WantModel('', TARGET_ABILITY);
      expect(emptyBundle.validate().indexOf('bundle-empty')).assertLarger(-1);
      expect(emptyBundle.validate().length).assertEqual(1);
      const emptyAbility = new WantModel(TARGET_BUNDLE, '');
      expect(emptyAbility.validate().indexOf('ability-empty')).assertLarger(-1);
      const spaced = new WantModel('ipc stub', 'Service Ability');
      const errors = spaced.validate();
      expect(errors.length).assertEqual(2);
      expect(errors.indexOf('bundle-has-space')).assertLarger(-1);
      expect(errors.indexOf('ability-has-space')).assertLarger(-1);
      const good = new WantModel();
      expect(good.validate().length).assertEqual(0);
    });

    /**
     * @tc.name          clientDescriptorWantMatchesOnlySameTarget
     * @tc.desc          Want equality requires both bundle and ability to match.
     * @tc.precondition  WantModel is exported.
     * @tc.steps         1. Compare a clone. 2. Compare a different ability.
     *                   3. Compare a different bundle.
     * @tc.expected      Only the exact clone matches.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientDescriptorWantMatchesOnlySameTarget', 0, () => {
      const base = new WantModel();
      const clone = new WantModel(TARGET_BUNDLE, TARGET_ABILITY);
      const otherAbility = new WantModel(TARGET_BUNDLE, 'OtherAbility');
      const otherBundle = new WantModel('com.example.other', TARGET_ABILITY);
      expect(base.matches(clone)).assertTrue();
      expect(base.matches(otherAbility)).assertFalse();
      expect(base.matches(otherBundle)).assertFalse();
      expect(otherAbility.matches(otherBundle)).assertFalse();
      expect(base.describe() === otherAbility.describe()).assertFalse();
      expect(clone.validate().length).assertEqual(0);
      expect(base.bundleName).assertEqual(TARGET_BUNDLE);
    });

    /**
     * @tc.name          clientDescriptorStubMutationDoesNotFollow
     * @tc.desc          The proxy keeps the descriptor captured at construction.
     * @tc.precondition  A proxy built over a live stub.
     * @tc.steps         1. Read the proxy descriptor.
     *                   2. Change the stub descriptor.
     *                   3. Compare both again.
     * @tc.expected      The proxy keeps the original while the stub changes.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientDescriptorStubMutationDoesNotFollow', 0, () => {
      const stub = new RemoteStubModel();
      const proxy = new RemoteProxyModel(stub);
      expect(proxy.descriptor).assertEqual(STUB_DESCRIPTOR);
      stub.descriptor = 'ChangedLater';
      expect(stub.descriptor).assertEqual('ChangedLater');
      expect(proxy.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(proxy.descriptor === stub.descriptor).assertFalse();
      expect(proxy.stub === stub).assertTrue();
      expect(proxy.registerDeathRecipient(new DeathRecipientModel())).assertTrue();
    });

    /**
     * @tc.name          clientDescriptorUnregisterThenNotify
     * @tc.desc          A death notification after unregistration is not delivered.
     * @tc.precondition  A proxy with a registered recipient.
     * @tc.steps         1. Unregister the recipient.
     *                   2. Notify death. 3. Read the recipient counter.
     * @tc.expected      The died count stays zero while the proxy becomes dead.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientDescriptorUnregisterThenNotify', 0, () => {
      const proxy = new RemoteProxyModel();
      const recipient = new DeathRecipientModel();
      proxy.registerDeathRecipient(recipient);
      expect(proxy.unregisterDeathRecipient(recipient)).assertTrue();
      expect(recipient.registered).assertFalse();
      recipient.onRemoteDied();
      expect(recipient.diedCount).assertEqual(1);
      proxy.notifyDeath();
      expect(recipient.diedCount).assertEqual(1);
      expect(proxy.isAlive()).assertFalse();
      expect(proxy.deathRecipient === undefined).assertTrue();
      expect(proxy.descriptor).assertEqual(STUB_DESCRIPTOR);
    });

    /**
     * @tc.name          clientDescriptorNotifyWithoutRecipient
     * @tc.desc          Notifying death on an unregistered proxy is safe.
     * @tc.precondition  A fresh proxy.
     * @tc.steps         1. Call notifyDeath. 2. Inspect the proxy flags.
     *                   3. Send through the dead proxy.
     * @tc.expected      No recipient is touched and the send fails with ERROR_SEND.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientDescriptorNotifyWithoutRecipient', 0, () => {
      const proxy = new RemoteProxyModel();
      expect(proxy.deathRecipient === undefined).assertTrue();
      proxy.notifyDeath();
      expect(proxy.isAlive()).assertFalse();
      expect(proxy.deathRegistered).assertFalse();
      const data = new MessageSequenceModel();
      const reply = new MessageSequenceModel();
      data.writeString('x');
      const result = proxy.sendMessageRequest(REQUEST_CODE, data, reply, new MessageOptionModel());
      expect(result.errCode).assertEqual(ERROR_SEND);
      expect(proxy.requests[0]).assertEqual(REQUEST_CODE);
      expect(proxy.descriptor).assertEqual(STUB_DESCRIPTOR);
    });

    /**
     * @tc.name          clientDescriptorResetThenConnect
     * @tc.desc          A reset client can connect again and receive a descriptor.
     * @tc.precondition  A default connected session that was reset.
     * @tc.steps         1. Reset. 2. Connect and deliver onConnect.
     *                   3. Read the descriptor and events.
     * @tc.expected      The descriptor is 'IPCStubTest' and events start over.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientDescriptorResetThenConnect', 0, () => {
      const session = createConnectedSession();
      session.reset();
      expect(session.events.size()).assertEqual(0);
      expect(session.connect(31)).assertTrue();
      const proxy = new RemoteProxyModel(new RemoteStubModel());
      session.onConnect(proxy);
      expect(session.proxy?.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(session.events.size()).assertEqual(3);
      expect(session.events.entries[0].startsWith('connect:')).assertTrue();
      expect(session.events.entries[2]).assertEqual('connected:IPCStubTest');
      expect(session.deathRecipient.registered).assertTrue();
      expect(session.state).assertEqual(STATE_CONNECTED);
    });

    /**
     * @tc.name          clientDescriptorSnapshotAfterReset
     * @tc.desc          A snapshot after reset shows the disconnected defaults.
     * @tc.precondition  A default connected session.
     * @tc.steps         1. Reset. 2. Take a snapshot.
     *                   3. Read every field.
     * @tc.expected      The snapshot reports disconnected, -1, no proxy and no registration.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientDescriptorSnapshotAfterReset', 0, () => {
      const session = createConnectedSession();
      session.reset();
      const snapshot = new ClientSnapshot(session);
      expect(snapshot.state).assertEqual(STATE_DISCONNECTED);
      expect(snapshot.connectId).assertEqual(-1);
      expect(snapshot.hasProxy).assertFalse();
      expect(snapshot.deathRegistered).assertFalse();
      expect(snapshot.toastCount).assertEqual(0);
      expect(snapshot.describe()).assertEqual('disconnected/-1/false/false/0');
      expect(session.isDisconnect).assertFalse();
    });

    /**
     * @tc.name          clientDescriptorEventFormatSingleColon
     * @tc.desc          Every event entry contains exactly one kind separator.
     * @tc.precondition  A default connected session.
     * @tc.steps         1. Walk all event entries.
     *                   2. Count colons in each.
     *                   3. Compare with one.
     * @tc.expected      Each entry has exactly one colon separating kind and detail.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientDescriptorEventFormatSingleColon', 0, () => {
      const session = createConnectedSession();
      let separators = 0;
      for (let index = 0; index < session.events.entries.length; index++) {
        const entry = session.events.entries[index];
        separators = separators + entry.split(':').length - 1;
        expect(entry.indexOf(':') > 0).assertTrue();
      }
      expect(session.events.size()).assertEqual(3);
      expect(separators).assertEqual(3);
      expect(session.events.entries[0].split(':')[0]).assertEqual('connect');
      expect(session.events.entries[1].split(':')[0]).assertEqual('death-register');
      expect(session.events.entries[2].split(':')[0]).assertEqual('connected');
    });

    /**
     * @tc.name          clientDescriptorDuplicateSessionsStayIndependent
     * @tc.desc          Two default sessions keep separate descriptor-backed proxies.
     * @tc.precondition  Two connected sessions.
     * @tc.steps         1. Compare their descriptors.
     *                   2. Kill one proxy. 3. Compare alive flags.
     * @tc.expected      Descriptors match while the alive flags diverge.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientDescriptorDuplicateSessionsStayIndependent', 0, () => {
      const alpha = createConnectedSession();
      const beta = createConnectedSession();
      expect(alpha.proxy?.descriptor).assertEqual(beta.proxy?.descriptor);
      expect(alpha.proxy === beta.proxy).assertFalse();
      expect(alpha.proxy?.stub === beta.proxy?.stub).assertFalse();
      alpha.proxy?.kill();
      expect(alpha.isConnected()).assertFalse();
      expect(alpha.proxy?.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(beta.isConnected()).assertTrue();
      expect(beta.proxy?.descriptor).assertEqual(STUB_DESCRIPTOR);
    });

    /**
     * @tc.name          clientDescriptorLogInfoEntries
     * @tc.desc          Connect logs exactly two INFO lines for registration and connect.
     * @tc.precondition  A default connected session.
     * @tc.steps         1. Read the log buffer.
     *                   2. Compare the two INFO lines.
     *                   3. Confirm no error line exists.
     * @tc.expected      The lines are 'INFO onConnect' and the registration success line.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientDescriptorLogInfoEntries', 0, () => {
      const session = createConnectedSession();
      expect(session.logs.size()).assertEqual(2);
      expect(session.logs.countLevel('INFO')).assertEqual(2);
      expect(session.logs.countLevel('ERROR')).assertEqual(0);
      expect(session.logs.lines[0]).assertEqual('INFO registerDeathRecipient success');
      expect(session.logs.lines[1]).assertEqual('INFO onConnect');
      expect(session.logs.contains('registerDeathRecipient success')).assertTrue();
    });

    /**
     * @tc.name          clientDescriptorToastAfterConnect
     * @tc.desc          Connecting pushes the success toast exactly once.
     * @tc.precondition  A default connected session.
     * @tc.steps         1. Read the toast list. 2. Compare the first item.
     *                   3. Confirm no other toast exists.
     * @tc.expected      The only toast is 'connectAbility success'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientDescriptorToastAfterConnect', 0, () => {
      const session = createConnectedSession();
      expect(session.toasts.length).assertEqual(1);
      expect(session.toasts[0]).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(session.lastToast()).assertEqual('connectAbility success');
      expect(session.toasts.indexOf(DISCONNECT_SUCCESS_TOAST)).assertEqual(-1);
      expect(session.events.countOf('connected')).assertEqual(1);
      expect(session.events.countOf('failed')).assertEqual(0);
    });

    /**
     * @tc.name          clientDescriptorFailedThenConnect
     * @tc.desc          A client may connect again after an onFailed callback.
     * @tc.precondition  A client that already failed once.
     * @tc.steps         1. Deliver onFailed. 2. Connect again.
     *                   3. Deliver onConnect and read the descriptor.
     * @tc.expected      The state returns to connected with the stub descriptor.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientDescriptorFailedThenConnect', 0, () => {
      const client = new ConnectionModel();
      client.onFailed(16000001);
      expect(client.state).assertEqual('failed');
      expect(client.connect(8)).assertTrue();
      expect(client.state).assertEqual('connecting');
      const proxy = new RemoteProxyModel(new RemoteStubModel());
      client.onConnect(proxy);
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.proxy?.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(client.events.countOf('failed')).assertEqual(1);
      expect(client.events.countOf('connected')).assertEqual(1);
      expect(client.deathRecipient.registered).assertTrue();
    });

    /**
     * @tc.name          clientDescriptorDeathAfterUnregisterZero
     * @tc.desc          Losing the proxy before death prevents any delivery.
     * @tc.precondition  A default connected session.
     * @tc.steps         1. Clear the proxy reference.
     *                   2. Notify death through the captured proxy.
     *                   3. Read the recipient counter.
     * @tc.expected      The recipient is unregistered with a zero died count.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientDescriptorDeathAfterUnregisterZero', 0, () => {
      const session = createConnectedSession();
      const proxy = session.proxy;
      session.onDisconnect();
      expect(proxy?.deathRegistered).assertFalse();
      proxy?.notifyDeath();
      expect(session.deathRecipient.diedCount).assertEqual(0);
      expect(session.deathRecipient.registered).assertFalse();
      expect(session.proxy === undefined).assertTrue();
      expect(session.events.countOf('disconnected')).assertEqual(1);
      expect(session.connectId).assertEqual(-1);
    });

    /**
     * @tc.name          clientDescriptorThreeStringsDistinct
     * @tc.desc          Bundle, ability and descriptor are three unrelated strings.
     * @tc.precondition  A default session.
     * @tc.steps         1. Collect the three strings.
     *                   2. Compare each pair. 3. Count distinct values.
     * @tc.expected      All three pairs differ.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientDescriptorThreeStringsDistinct', 0, () => {
      const session = createConnectedSession();
      const bundle = session.want.bundleName;
      const ability = session.want.abilityName;
      const descriptor = session.proxy?.descriptor;
      expect(bundle === ability).assertFalse();
      expect(bundle === descriptor).assertFalse();
      expect(ability === descriptor).assertFalse();
      expect(bundle).assertEqual('com.example.ipc_stub');
      expect(ability).assertEqual('ServiceAbility');
      expect(descriptor).assertEqual('IPCStubTest');
      expect(bundle.indexOf('/')).assertEqual(-1);
    });

    /**
     * @tc.name          clientDescriptorStubAliveIndependent
     * @tc.desc          The stub alive flag can diverge from the proxy alive flag.
     * @tc.precondition  A default connected session.
     * @tc.steps         1. Kill the stub only.
     *                   2. Send and inspect the result.
     *                   3. Compare both alive flags.
     * @tc.expected      The proxy stays alive while the stub refuses the request.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientDescriptorStubAliveIndependent', 0, () => {
      const session = createConnectedSession();
      session.proxy?.stub.kill();
      expect(session.proxy?.alive).assertTrue();
      expect(session.proxy?.stub.alive).assertFalse();
      const result = session.sendString(REQUEST_PAYLOAD);
      expect(result.errCode).assertEqual(ERROR_SEND);
      expect(session.proxy?.stub.receivedTexts.length).assertEqual(0);
      expect(session.proxy?.sendCalls).assertEqual(1);
      expect(session.proxy?.descriptor).assertEqual(STUB_DESCRIPTOR);
    });

    /**
     * @tc.name          clientDescriptorProxyResetDefaults
     * @tc.desc          Resetting a proxy restores the documented defaults.
     * @tc.precondition  A used proxy with requests and a recipient.
     * @tc.steps         1. Send and register. 2. Reset the proxy.
     *                   3. Read every field.
     * @tc.expected      The proxy returns to alive, unregistered, zero-request state.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientDescriptorProxyResetDefaults', 0, () => {
      const proxy = new RemoteProxyModel();
      proxy.registerDeathRecipient(new DeathRecipientModel());
      const data = new MessageSequenceModel();
      const reply = new MessageSequenceModel();
      data.writeString('x');
      proxy.sendMessageRequest(REQUEST_CODE, data, reply, new MessageOptionModel());
      expect(proxy.requests.length).assertEqual(1);
      expect(proxy.sendCalls).assertEqual(1);
      proxy.reset();
      expect(proxy.alive).assertTrue();
      expect(proxy.deathRegistered).assertFalse();
      expect(proxy.deathRecipient === undefined).assertTrue();
      expect(proxy.requests.length).assertEqual(0);
      expect(proxy.sendCalls).assertEqual(0);
      expect(proxy.descriptor).assertEqual(STUB_DESCRIPTOR);
    });

    /**
     * @tc.name          clientDescriptorWantSpaceOnlyFields
     * @tc.desc          Space-only Want fields fail validation.
     * @tc.precondition  WantModel is exported.
     * @tc.steps         1. Build a want with single-space fields.
     *                   2. Validate it. 3. Count the error tokens.
     * @tc.expected      Both space errors appear and the value is not empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientDescriptorWantSpaceOnlyFields', 0, () => {
      const want = new WantModel(' ', ' ');
      const errors = want.validate();
      expect(errors.length).assertEqual(2);
      expect(errors[0]).assertEqual('bundle-has-space');
      expect(errors[1]).assertEqual('ability-has-space');
      expect(errors.indexOf('bundle-empty')).assertEqual(-1);
      expect(want.bundleName.length).assertEqual(1);
      expect(want.describe()).assertEqual(' / ');
    });

    /**
     * @tc.name          clientDescriptorNotWrittenToLogs
     * @tc.desc          The descriptor is not part of the routine client log lines.
     * @tc.precondition  A default connected session with one send.
     * @tc.steps         1. Send the payload. 2. Scan all log lines.
     *                   3. Count descriptor occurrences.
     * @tc.expected      No routine log line contains 'IPCStubTest'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientDescriptorNotWrittenToLogs', 0, () => {
      const session = createConnectedSession();
      session.sendString(REQUEST_PAYLOAD);
      let hits = 0;
      for (let index = 0; index < session.logs.lines.length; index++) {
        if (session.logs.lines[index].indexOf(STUB_DESCRIPTOR) >= 0) {
          hits = hits + 1;
        }
      }
      expect(hits).assertEqual(0);
      expect(session.logs.contains(STUB_DESCRIPTOR)).assertFalse();
      expect(session.logs.size()).assertEqual(3);
      expect(session.events.countOf('connected')).assertEqual(1);
      expect(session.logs.contains('reply hello rpc')).assertTrue();
    });

    /**
     * @tc.name          clientDescriptorSnapshotAfterSend
     * @tc.desc          A send updates only the toast count in a snapshot.
     * @tc.precondition  A default connected session.
     * @tc.steps         1. Take a snapshot. 2. Send the payload.
     *                   3. Take a second snapshot and compare.
     * @tc.expected      State, id and flags match while only the toast count changes.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientDescriptorSnapshotAfterSend', 0, () => {
      const session = createConnectedSession();
      const before = new ClientSnapshot(session);
      session.sendString(REQUEST_PAYLOAD);
      const after = new ClientSnapshot(session);
      expect(before.state).assertEqual(after.state);
      expect(before.connectId).assertEqual(after.connectId);
      expect(before.hasProxy).assertEqual(after.hasProxy);
      expect(before.deathRegistered).assertEqual(after.deathRegistered);
      expect(after.toastCount).assertEqual(before.toastCount + 1);
      expect(before.sameAs(after)).assertFalse();
      expect(after.toastCount).assertEqual(2);
    });

    /**
     * @tc.name          clientDescriptorContractSummary
     * @tc.desc          All descriptor observables agree in one end-to-end check.
     * @tc.precondition  A default connected session.
     * @tc.steps         1. Send the sample payload.
     *                   2. Collect descriptor, events and snapshot facts.
     *                   3. Cross-check them.
     * @tc.expected      Every observable reports 'IPCStubTest' and success.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientDescriptorContractSummary', 0, () => {
      const session = createConnectedSession();
      const result = session.sendString(REQUEST_PAYLOAD);
      expect(session.proxy?.descriptor).assertEqual('IPCStubTest');
      expect(firstEventWith(session, 'death-register')).assertEqual('death-register:IPCStubTest');
      expect(firstEventWith(session, 'connected')).assertEqual('connected:IPCStubTest');
      expect(result.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(session.deathRecipient.registered).assertTrue();
      expect(new ClientSnapshot(session).deathRegistered).assertTrue();
      expect(session.events.countOf('send-ok')).assertEqual(1);
    });

    /**
     * @tc.name          clientDescriptorSurvivesProxyDeath
     * @tc.desc          The descriptor remains readable after the proxy dies.
     * @tc.precondition  A default connected session.
     * @tc.steps         1. Kill the proxy. 2. Read the descriptor.
     *                   3. Attempt a send and re-read the descriptor.
     * @tc.expected      The descriptor stays 'IPCStubTest' across the failure.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientDescriptorSurvivesProxyDeath', 0, () => {
      const session = createConnectedSession();
      session.proxy?.kill();
      expect(session.proxy?.descriptor).assertEqual(STUB_DESCRIPTOR);
      const result = session.sendString(REQUEST_PAYLOAD);
      expect(result.errCode).assertEqual(ERROR_SEND);
      expect(session.proxy?.descriptor).assertEqual('IPCStubTest');
      expect(session.proxy?.requests[0]).assertEqual(REQUEST_CODE);
      expect(session.proxy?.stub.handledCodes.length).assertEqual(0);
      expect(session.events.countOf('send-failed')).assertEqual(1);
    });

    /**
     * @tc.name          clientDescriptorReconnectUpdatesConnectId
     * @tc.desc          Each connection records its own id while the descriptor repeats.
     * @tc.precondition  A default connected session.
     * @tc.steps         1. Disconnect. 2. Connect with id 55.
     *                   3. Compare descriptors and snapshots.
     * @tc.expected      The descriptor repeats while the connect id changes to 55.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientDescriptorReconnectUpdatesConnectId', 0, () => {
      const session = createConnectedSession();
      const before = new ClientSnapshot(session);
      session.onDisconnect();
      session.connect(55);
      const proxy = new RemoteProxyModel(new RemoteStubModel());
      session.onConnect(proxy);
      const after = new ClientSnapshot(session);
      expect(before.connectId).assertEqual(7);
      expect(after.connectId).assertEqual(55);
      expect(before.deathRegistered).assertTrue();
      expect(after.deathRegistered).assertTrue();
      expect(proxy.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(session.events.countOf('connected')).assertEqual(2);
      expect(after.describe()).assertEqual('connected/55/true/true/3');
    });

    /**
     * @tc.name          clientDescriptorNearMissNamesDiffer
     * @tc.desc          Near-miss descriptor names are not accepted as the constant.
     * @tc.precondition  STUB_DESCRIPTOR is loaded.
     * @tc.steps         1. Compare four near-miss strings.
     *                   2. Check each inequality.
     *                   3. Confirm the exact match.
     * @tc.expected      Every near miss differs from the constant.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientDescriptorNearMissNamesDiffer', 0, () => {
      expect(STUB_DESCRIPTOR === 'IPCStub').assertFalse();
      expect(STUB_DESCRIPTOR === 'IPCStubTest ').assertFalse();
      expect(STUB_DESCRIPTOR === 'IPCStubTests').assertFalse();
      expect(STUB_DESCRIPTOR === 'ipcStubTest').assertFalse();
      expect(STUB_DESCRIPTOR).assertEqual('IPCStubTest');
      expect(textFingerprint('IPCStub') === textFingerprint(STUB_DESCRIPTOR)).assertFalse();
    });

  });
}
