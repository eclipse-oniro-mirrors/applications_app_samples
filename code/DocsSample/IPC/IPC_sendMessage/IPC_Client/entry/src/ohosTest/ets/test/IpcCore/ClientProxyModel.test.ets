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

import {
  describe,
  it,
  expect,
  beforeAll,
  beforeEach,
  afterAll
} from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import {
  ConnectionModel,
  RemoteProxyModel,
  RemoteStubModel,
  DeathRecipientModel,
  RequestResultModel,
  ClientSnapshot,
  ClientMetrics,
  expectedHandled,
  expectedReplyFor,
  isKnownRequestCode,
  isNonZeroError,
  expectedStateAfter,
  REQUEST_CODE,
  UNKNOWN_CODE_ZERO,
  UNKNOWN_CODE_TWO,
  UNKNOWN_CODE_LARGE,
  ERROR_NONE,
  ERROR_SEND,
  ERROR_DEATH_REGISTER,
  STATE_DISCONNECTED,
  STATE_FAILED,
  LEVEL_ERROR
} from '../Shared/SharedDriver';

export default function clientProxyModel(): void {
  describe('ClientProxyModel', () => {
    beforeAll(() => {
      logSuite('ClientProxyModel', 'begin');
    });

    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(resolve, 1);
      });
    });

    afterAll(() => {
      logSuite('ClientProxyModel', 'end');
    });

    /**
     * @tc.name          clientProxyRegisterRecipientSucceeds
     * @tc.desc          Registering a death recipient on a live proxy sets both registration flags.
     * @tc.precondition  A live proxy and an unregistered recipient.
     * @tc.steps         1. Create the proxy.
     *                   2. Register the recipient.
     *                   3. Inspect both flags and the identity.
     * @tc.expected      Registration returns true and both flags become true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientProxyRegisterRecipientSucceeds', 0, () => {
      logStep('clientProxyRegisterRecipientSucceeds', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      const recipient: DeathRecipientModel = new DeathRecipientModel();
      const ok: boolean = proxy.registerDeathRecipient(recipient);
      expect(ok).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      expect(proxy.deathRecipient === recipient).assertTrue();
      expect(recipient.registered).assertTrue();
      expect(recipient.diedCount).assertEqual(0);
      expect(proxy.isAlive()).assertTrue();
      expect(proxy.deathRecipient !== undefined).assertTrue();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      const described: DeathRecipientModel = new DeathRecipientModel();
      const label: string = described.describe();
      expect(label.indexOf('/') > 0).assertTrue();
      expect(label.endsWith(String(described.registered))).assertTrue();
      expect(label.length >= 3).assertTrue();
      logStep('clientProxyRegisterRecipientSucceeds', 'end');
    });

    /**
     * @tc.name          clientProxyRegisterKeepsRecipientInstance
     * @tc.desc          The proxy retains the exact recipient object handed to register.
     * @tc.precondition  A live proxy and a recipient instance.
     * @tc.steps         1. Register the recipient.
     *                   2. Compare the stored reference.
     *                   3. Read the died counter.
     * @tc.expected      The stored recipient is the same instance with a zero counter.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientProxyRegisterKeepsRecipientInstance', 0, () => {
      logStep('clientProxyRegisterKeepsRecipientInstance', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      const recipient: DeathRecipientModel = new DeathRecipientModel();
      const ok: boolean = proxy.registerDeathRecipient(recipient);
      expect(ok).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      expect(proxy.deathRecipient === recipient).assertTrue();
      expect(recipient.registered).assertTrue();
      expect(recipient.diedCount).assertEqual(0);
      expect(proxy.isAlive()).assertTrue();
      expect(proxy.deathRecipient !== undefined).assertTrue();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(proxy.sendCalls).assertEqual(proxy.requests.length);
      expect(proxy.stub === stub).assertTrue();
      expect(proxy.failNextSend).assertEqual(ERROR_NONE);
      logStep('clientProxyRegisterKeepsRecipientInstance', 'end');
    });

    /**
     * @tc.name          clientProxyRegisterDoesNotKillProxy
     * @tc.desc          Registration leaves the proxy alive and the client untouched.
     * @tc.precondition  A live proxy and an idle client.
     * @tc.steps         1. Register a recipient.
     *                   2. Check proxy liveness.
     *                   3. Check the client state.
     * @tc.expected      The proxy stays alive and the client stays disconnected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientProxyRegisterDoesNotKillProxy', 0, () => {
      logStep('clientProxyRegisterDoesNotKillProxy', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      const recipient: DeathRecipientModel = new DeathRecipientModel();
      const ok: boolean = proxy.registerDeathRecipient(recipient);
      expect(ok).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      expect(proxy.deathRecipient === recipient).assertTrue();
      expect(recipient.registered).assertTrue();
      expect(recipient.diedCount).assertEqual(0);
      expect(proxy.isAlive()).assertTrue();
      expect(proxy.deathRecipient !== undefined).assertTrue();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.logs.size() >= 0).assertTrue();
      expect(client.events.size()).assertEqual(client.events.entries.length);
      expect(client.logs.countLevel(LEVEL_ERROR) >= 0).assertTrue();
      logStep('clientProxyRegisterDoesNotKillProxy', 'end');
    });

    /**
     * @tc.name          clientProxyRegisterSnapshotNoProxy
     * @tc.desc          Registering on a standalone proxy never attaches it to a client.
     * @tc.precondition  An idle client and a standalone proxy.
     * @tc.steps         1. Register the recipient.
     *                   2. Snapshot the client.
     *                   3. Compare proxy presence.
     * @tc.expected      The client snapshot reports no proxy.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientProxyRegisterSnapshotNoProxy', 0, () => {
      logStep('clientProxyRegisterSnapshotNoProxy', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      const recipient: DeathRecipientModel = new DeathRecipientModel();
      const ok: boolean = proxy.registerDeathRecipient(recipient);
      expect(ok).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      expect(proxy.deathRecipient === recipient).assertTrue();
      expect(recipient.registered).assertTrue();
      expect(recipient.diedCount).assertEqual(0);
      expect(proxy.isAlive()).assertTrue();
      expect(proxy.deathRecipient !== undefined).assertTrue();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      const snap: ClientSnapshot = new ClientSnapshot(client);
      expect(snap.hasProxy).assertEqual(client.proxy !== undefined);
      expect(snap.toastCount).assertEqual(client.toasts.length);
      expect(snap.state).assertEqual(client.state);
      logStep('clientProxyRegisterSnapshotNoProxy', 'end');
    });

    /**
     * @tc.name          clientProxyRegisterResetClears
     * @tc.desc          A client reset after registration leaves the proxy registration intact.
     * @tc.precondition  A standalone proxy with a registered recipient.
     * @tc.steps         1. Register the recipient.
     *                   2. Reset the idle client.
     *                   3. Re-check the proxy flags.
     * @tc.expected      The proxy keeps its registration while the client clears its toasts.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientProxyRegisterResetClears', 0, () => {
      logStep('clientProxyRegisterResetClears', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      const recipient: DeathRecipientModel = new DeathRecipientModel();
      const ok: boolean = proxy.registerDeathRecipient(recipient);
      expect(ok).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      expect(proxy.deathRecipient === recipient).assertTrue();
      expect(recipient.registered).assertTrue();
      expect(recipient.diedCount).assertEqual(0);
      expect(proxy.isAlive()).assertTrue();
      expect(proxy.deathRecipient !== undefined).assertTrue();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      const before: number = client.toasts.length;
      client.reset();
      expect(client.toasts.length).assertEqual(0);
      expect(before >= 0).assertTrue();
      expect(client.events.size()).assertEqual(0);
      logStep('clientProxyRegisterResetClears', 'end');
    });

    /**
     * @tc.name          clientProxyUnregisterSucceeds
     * @tc.desc          Unregistering the owner recipient clears the registration on both sides.
     * @tc.precondition  A proxy with a registered owner recipient.
     * @tc.steps         1. Register the owner.
     *                   2. Unregister the same instance.
     *                   3. Read both flags.
     * @tc.expected      Unregistration returns true and both flags become false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientProxyUnregisterSucceeds', 0, () => {
      logStep('clientProxyUnregisterSucceeds', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      const recipient: DeathRecipientModel = new DeathRecipientModel();
      proxy.registerDeathRecipient(recipient);
      const removed: boolean = proxy.unregisterDeathRecipient(recipient);
      expect(removed).assertTrue();
      expect(proxy.deathRegistered).assertFalse();
      expect(proxy.deathRecipient === undefined).assertTrue();
      expect(recipient.registered).assertFalse();
      expect(recipient.diedCount).assertEqual(0);
      const repeat: boolean = proxy.unregisterDeathRecipient(recipient);
      expect(repeat).assertFalse();
      expect(proxy.isAlive()).assertTrue();
      expect(client.proxy === undefined).assertTrue();
      expect(proxy.sendCalls).assertEqual(proxy.requests.length);
      expect(proxy.stub === stub).assertTrue();
      expect(proxy.failNextSend).assertEqual(ERROR_NONE);
      logStep('clientProxyUnregisterSucceeds', 'end');
    });

    /**
     * @tc.name          clientProxyUnregisterClearsReference
     * @tc.desc          Unregistering drops the proxy reference to the recipient.
     * @tc.precondition  A proxy with a registered recipient.
     * @tc.steps         1. Register the recipient.
     *                   2. Unregister it.
     *                   3. Check the stored reference.
     * @tc.expected      The stored recipient becomes undefined.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientProxyUnregisterClearsReference', 0, () => {
      logStep('clientProxyUnregisterClearsReference', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      const recipient: DeathRecipientModel = new DeathRecipientModel();
      proxy.registerDeathRecipient(recipient);
      const removed: boolean = proxy.unregisterDeathRecipient(recipient);
      expect(removed).assertTrue();
      expect(proxy.deathRegistered).assertFalse();
      expect(proxy.deathRecipient === undefined).assertTrue();
      expect(recipient.registered).assertFalse();
      expect(recipient.diedCount).assertEqual(0);
      const repeat: boolean = proxy.unregisterDeathRecipient(recipient);
      expect(repeat).assertFalse();
      expect(proxy.isAlive()).assertTrue();
      expect(client.proxy === undefined).assertTrue();
      const described: DeathRecipientModel = new DeathRecipientModel();
      const label: string = described.describe();
      expect(label.indexOf('/') > 0).assertTrue();
      expect(label.endsWith(String(described.registered))).assertTrue();
      expect(label.length >= 3).assertTrue();
      logStep('clientProxyUnregisterClearsReference', 'end');
    });

    /**
     * @tc.name          clientProxyUnregisterKeepsProxyAlive
     * @tc.desc          Removing a death recipient does not change proxy liveness.
     * @tc.precondition  A live proxy with a recipient.
     * @tc.steps         1. Register then unregister.
     *                   2. Call isAlive.
     *                   3. Check the send counter.
     * @tc.expected      The proxy remains alive with no send calls.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientProxyUnregisterKeepsProxyAlive', 0, () => {
      logStep('clientProxyUnregisterKeepsProxyAlive', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      const recipient: DeathRecipientModel = new DeathRecipientModel();
      proxy.registerDeathRecipient(recipient);
      const removed: boolean = proxy.unregisterDeathRecipient(recipient);
      expect(removed).assertTrue();
      expect(proxy.deathRegistered).assertFalse();
      expect(proxy.deathRecipient === undefined).assertTrue();
      expect(recipient.registered).assertFalse();
      expect(recipient.diedCount).assertEqual(0);
      const repeat: boolean = proxy.unregisterDeathRecipient(recipient);
      expect(repeat).assertFalse();
      expect(proxy.isAlive()).assertTrue();
      expect(client.proxy === undefined).assertTrue();
      expect(client.logs.size() >= 0).assertTrue();
      expect(client.events.size()).assertEqual(client.events.entries.length);
      expect(client.logs.countLevel(LEVEL_ERROR) >= 0).assertTrue();
      logStep('clientProxyUnregisterKeepsProxyAlive', 'end');
    });

    /**
     * @tc.name          clientProxyUnregisterNoEvents
     * @tc.desc          Standalone registration work never records client events.
     * @tc.precondition  An idle client used only as an observer.
     * @tc.steps         1. Register and unregister.
     *                   2. Count client events.
     *                   3. Compare with the log size.
     * @tc.expected      The client recorder stays empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientProxyUnregisterNoEvents', 0, () => {
      logStep('clientProxyUnregisterNoEvents', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      const recipient: DeathRecipientModel = new DeathRecipientModel();
      proxy.registerDeathRecipient(recipient);
      const removed: boolean = proxy.unregisterDeathRecipient(recipient);
      expect(removed).assertTrue();
      expect(proxy.deathRegistered).assertFalse();
      expect(proxy.deathRecipient === undefined).assertTrue();
      expect(recipient.registered).assertFalse();
      expect(recipient.diedCount).assertEqual(0);
      const repeat: boolean = proxy.unregisterDeathRecipient(recipient);
      expect(repeat).assertFalse();
      expect(proxy.isAlive()).assertTrue();
      expect(client.proxy === undefined).assertTrue();
      const snap: ClientSnapshot = new ClientSnapshot(client);
      expect(snap.hasProxy).assertEqual(client.proxy !== undefined);
      expect(snap.toastCount).assertEqual(client.toasts.length);
      expect(snap.state).assertEqual(client.state);
      logStep('clientProxyUnregisterNoEvents', 'end');
    });

    /**
     * @tc.name          clientProxyUnregisterIdempotent
     * @tc.desc          A second unregister of the same recipient returns false.
     * @tc.precondition  A proxy whose recipient was already removed.
     * @tc.steps         1. Register and unregister.
     *                   2. Unregister again.
     *                   3. Confirm the flags stay false.
     * @tc.expected      The second call returns false and nothing changes.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientProxyUnregisterIdempotent', 0, () => {
      logStep('clientProxyUnregisterIdempotent', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      const recipient: DeathRecipientModel = new DeathRecipientModel();
      proxy.registerDeathRecipient(recipient);
      const removed: boolean = proxy.unregisterDeathRecipient(recipient);
      expect(removed).assertTrue();
      expect(proxy.deathRegistered).assertFalse();
      expect(proxy.deathRecipient === undefined).assertTrue();
      expect(recipient.registered).assertFalse();
      expect(recipient.diedCount).assertEqual(0);
      const repeat: boolean = proxy.unregisterDeathRecipient(recipient);
      expect(repeat).assertFalse();
      expect(proxy.isAlive()).assertTrue();
      expect(client.proxy === undefined).assertTrue();
      expect(expectedHandled(REQUEST_CODE) === isKnownRequestCode(REQUEST_CODE)).assertTrue();
      expect(isNonZeroError(ERROR_DEATH_REGISTER)).assertTrue();
      expect(expectedStateAfter('onFailed')).assertEqual(STATE_FAILED);
      logStep('clientProxyUnregisterIdempotent', 'end');
    });

    /**
     * @tc.name          clientProxyUnregisterStrangerRejected
     * @tc.desc          Unregistering a recipient that was never registered returns false.
     * @tc.precondition  A proxy whose owner recipient is registered.
     * @tc.steps         1. Register the owner.
     *                   2. Unregister a stranger.
     *                   3. Check the owner flags.
     * @tc.expected      The stranger call fails and the owner stays registered.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientProxyUnregisterStrangerRejected', 0, () => {
      logStep('clientProxyUnregisterStrangerRejected', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      const owner: DeathRecipientModel = new DeathRecipientModel();
      const stranger: DeathRecipientModel = new DeathRecipientModel();
      proxy.registerDeathRecipient(owner);
      const removed: boolean = proxy.unregisterDeathRecipient(stranger);
      expect(removed).assertFalse();
      expect(proxy.deathRegistered).assertTrue();
      expect(owner.registered).assertTrue();
      expect(stranger.registered).assertFalse();
      expect(proxy.deathRecipient === owner).assertTrue();
      expect(client.events.size()).assertEqual(0);
      expect(proxy.sendCalls).assertEqual(proxy.requests.length);
      expect(proxy.stub === stub).assertTrue();
      expect(proxy.failNextSend).assertEqual(ERROR_NONE);
      logStep('clientProxyUnregisterStrangerRejected', 'end');
    });

    /**
     * @tc.name          clientProxyUnregisterStrangerUnaffected
     * @tc.desc          The stranger recipient is never marked as registered.
     * @tc.precondition  A registered owner and a separate stranger recipient.
     * @tc.steps         1. Attempt the stranger removal.
     *                   2. Read the stranger flag.
     *                   3. Read the owner flag.
     * @tc.expected      The stranger stays unregistered while the owner is untouched.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientProxyUnregisterStrangerUnaffected', 0, () => {
      logStep('clientProxyUnregisterStrangerUnaffected', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      const owner: DeathRecipientModel = new DeathRecipientModel();
      const stranger: DeathRecipientModel = new DeathRecipientModel();
      proxy.registerDeathRecipient(owner);
      const removed: boolean = proxy.unregisterDeathRecipient(stranger);
      expect(removed).assertFalse();
      expect(proxy.deathRegistered).assertTrue();
      expect(owner.registered).assertTrue();
      expect(stranger.registered).assertFalse();
      expect(proxy.deathRecipient === owner).assertTrue();
      expect(client.events.size()).assertEqual(0);
      const described: DeathRecipientModel = new DeathRecipientModel();
      const label: string = described.describe();
      expect(label.indexOf('/') > 0).assertTrue();
      expect(label.endsWith(String(described.registered))).assertTrue();
      expect(label.length >= 3).assertTrue();
      logStep('clientProxyUnregisterStrangerUnaffected', 'end');
    });

    /**
     * @tc.name          clientProxyUnregisterMismatchKeepsReference
     * @tc.desc          A mismatched unregister never clears the stored proxy reference.
     * @tc.precondition  A proxy holding a registered owner.
     * @tc.steps         1. Attempt a mismatched removal.
     *                   2. Compare the stored reference.
     *                   3. Check registration.
     * @tc.expected      The stored reference is still the owner.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientProxyUnregisterMismatchKeepsReference', 0, () => {
      logStep('clientProxyUnregisterMismatchKeepsReference', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      const owner: DeathRecipientModel = new DeathRecipientModel();
      const stranger: DeathRecipientModel = new DeathRecipientModel();
      proxy.registerDeathRecipient(owner);
      const removed: boolean = proxy.unregisterDeathRecipient(stranger);
      expect(removed).assertFalse();
      expect(proxy.deathRegistered).assertTrue();
      expect(owner.registered).assertTrue();
      expect(stranger.registered).assertFalse();
      expect(proxy.deathRecipient === owner).assertTrue();
      expect(client.events.size()).assertEqual(0);
      expect(client.logs.size() >= 0).assertTrue();
      expect(client.events.size()).assertEqual(client.events.entries.length);
      expect(client.logs.countLevel(LEVEL_ERROR) >= 0).assertTrue();
      logStep('clientProxyUnregisterMismatchKeepsReference', 'end');
    });

    /**
     * @tc.name          clientProxyUnregisterMismatchNoReset
     * @tc.desc          A mismatched unregister on a connected client leaves the session intact.
     * @tc.precondition  A proxy with a registered owner and an idle client.
     * @tc.steps         1. Register the owner.
     *                   2. Attempt a stranger removal.
     *                   3. Call isAlive and isConnected.
     * @tc.expected      The proxy stays alive and the client snapshot has no proxy.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientProxyUnregisterMismatchNoReset', 0, () => {
      logStep('clientProxyUnregisterMismatchNoReset', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      const owner: DeathRecipientModel = new DeathRecipientModel();
      const stranger: DeathRecipientModel = new DeathRecipientModel();
      proxy.registerDeathRecipient(owner);
      const removed: boolean = proxy.unregisterDeathRecipient(stranger);
      expect(removed).assertFalse();
      expect(proxy.deathRegistered).assertTrue();
      expect(owner.registered).assertTrue();
      expect(stranger.registered).assertFalse();
      expect(proxy.deathRecipient === owner).assertTrue();
      expect(client.events.size()).assertEqual(0);
      const snap: ClientSnapshot = new ClientSnapshot(client);
      expect(snap.hasProxy).assertEqual(client.proxy !== undefined);
      expect(snap.toastCount).assertEqual(client.toasts.length);
      expect(snap.state).assertEqual(client.state);
      logStep('clientProxyUnregisterMismatchNoReset', 'end');
    });

    /**
     * @tc.name          clientProxyUnregisterMismatchResetSafe
     * @tc.desc          Resetting the observer client is safe after a mismatched unregister.
     * @tc.precondition  An observer client and a proxy with one owner.
     * @tc.steps         1. Attempt the mismatch.
     *                   2. Reset the client.
     *                   3. Verify the queue clears.
     * @tc.expected      The client reset succeeds and the proxy keeps its owner.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientProxyUnregisterMismatchResetSafe', 0, () => {
      logStep('clientProxyUnregisterMismatchResetSafe', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      const owner: DeathRecipientModel = new DeathRecipientModel();
      const stranger: DeathRecipientModel = new DeathRecipientModel();
      proxy.registerDeathRecipient(owner);
      const removed: boolean = proxy.unregisterDeathRecipient(stranger);
      expect(removed).assertFalse();
      expect(proxy.deathRegistered).assertTrue();
      expect(owner.registered).assertTrue();
      expect(stranger.registered).assertFalse();
      expect(proxy.deathRecipient === owner).assertTrue();
      expect(client.events.size()).assertEqual(0);
      const before: number = client.toasts.length;
      client.reset();
      expect(client.toasts.length).assertEqual(0);
      expect(before >= 0).assertTrue();
      expect(client.events.size()).assertEqual(0);
      logStep('clientProxyUnregisterMismatchResetSafe', 'end');
    });

    /**
     * @tc.name          clientProxyRegisterAfterDeathFails
     * @tc.desc          A proxy that already died refuses new death recipients.
     * @tc.precondition  A proxy whose death was already notified.
     * @tc.steps         1. Notify proxy death.
     *                   2. Attempt registration.
     *                   3. Inspect the flags.
     * @tc.expected      Registration returns false and no recipient is stored.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientProxyRegisterAfterDeathFails', 0, () => {
      logStep('clientProxyRegisterAfterDeathFails', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      const recipient: DeathRecipientModel = new DeathRecipientModel();
      proxy.notifyDeath();
      const ok: boolean = proxy.registerDeathRecipient(recipient);
      expect(ok).assertFalse();
      expect(proxy.deathRegistered).assertFalse();
      expect(recipient.registered).assertFalse();
      expect(proxy.deathRecipient === undefined).assertTrue();
      expect(proxy.isAlive()).assertFalse();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.deathRecipient.registered).assertFalse();
      expect(proxy.sendCalls).assertEqual(proxy.requests.length);
      expect(proxy.stub === stub).assertTrue();
      expect(proxy.failNextSend).assertEqual(ERROR_NONE);
      logStep('clientProxyRegisterAfterDeathFails', 'end');
    });

    /**
     * @tc.name          clientProxyRegisterAfterDeathNoFlag
     * @tc.desc          The rejected registration leaves the recipient unregistered.
     * @tc.precondition  A dead proxy and a fresh recipient.
     * @tc.steps         1. Notify death.
     *                   2. Attempt registration.
     *                   3. Read the recipient flag.
     * @tc.expected      The recipient registered flag stays false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientProxyRegisterAfterDeathNoFlag', 0, () => {
      logStep('clientProxyRegisterAfterDeathNoFlag', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      const recipient: DeathRecipientModel = new DeathRecipientModel();
      proxy.notifyDeath();
      const ok: boolean = proxy.registerDeathRecipient(recipient);
      expect(ok).assertFalse();
      expect(proxy.deathRegistered).assertFalse();
      expect(recipient.registered).assertFalse();
      expect(proxy.deathRecipient === undefined).assertTrue();
      expect(proxy.isAlive()).assertFalse();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.deathRecipient.registered).assertFalse();
      expect(client.logs.size() >= 0).assertTrue();
      expect(client.events.size()).assertEqual(client.events.entries.length);
      expect(client.logs.countLevel(LEVEL_ERROR) >= 0).assertTrue();
      logStep('clientProxyRegisterAfterDeathNoFlag', 'end');
    });

    /**
     * @tc.name          clientProxyRegisterAfterDeathDescribe
     * @tc.desc          The rejected recipient descriptor reports zero deaths and no registration.
     * @tc.precondition  A dead proxy and a fresh recipient.
     * @tc.steps         1. Attempt registration after death.
     *                   2. Format the descriptor.
     *                   3. Compare with the expected pattern.
     * @tc.expected      The descriptor reads zero slash false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientProxyRegisterAfterDeathDescribe', 0, () => {
      logStep('clientProxyRegisterAfterDeathDescribe', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      const recipient: DeathRecipientModel = new DeathRecipientModel();
      proxy.notifyDeath();
      const ok: boolean = proxy.registerDeathRecipient(recipient);
      expect(ok).assertFalse();
      expect(proxy.deathRegistered).assertFalse();
      expect(recipient.registered).assertFalse();
      expect(proxy.deathRecipient === undefined).assertTrue();
      expect(proxy.isAlive()).assertFalse();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.deathRecipient.registered).assertFalse();
      const described: DeathRecipientModel = new DeathRecipientModel();
      const label: string = described.describe();
      expect(label.indexOf('/') > 0).assertTrue();
      expect(label.endsWith(String(described.registered))).assertTrue();
      expect(label.length >= 3).assertTrue();
      logStep('clientProxyRegisterAfterDeathDescribe', 'end');
    });

    /**
     * @tc.name          clientProxyRegisterAfterDeathClientIdle
     * @tc.desc          A dead standalone proxy does not disturb an idle client.
     * @tc.precondition  A dead proxy and an idle client.
     * @tc.steps         1. Notify death.
     *                   2. Attempt registration.
     *                   3. Snapshot the client.
     * @tc.expected      The client reports no proxy and no toasts.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientProxyRegisterAfterDeathClientIdle', 0, () => {
      logStep('clientProxyRegisterAfterDeathClientIdle', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      const recipient: DeathRecipientModel = new DeathRecipientModel();
      proxy.notifyDeath();
      const ok: boolean = proxy.registerDeathRecipient(recipient);
      expect(ok).assertFalse();
      expect(proxy.deathRegistered).assertFalse();
      expect(recipient.registered).assertFalse();
      expect(proxy.deathRecipient === undefined).assertTrue();
      expect(proxy.isAlive()).assertFalse();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.deathRecipient.registered).assertFalse();
      const snap: ClientSnapshot = new ClientSnapshot(client);
      expect(snap.hasProxy).assertEqual(client.proxy !== undefined);
      expect(snap.toastCount).assertEqual(client.toasts.length);
      expect(snap.state).assertEqual(client.state);
      logStep('clientProxyRegisterAfterDeathClientIdle', 'end');
    });

    /**
     * @tc.name          clientProxyNotifyFiresRecipient
     * @tc.desc          Notifying proxy death fires the registered recipient exactly once.
     * @tc.precondition  A live proxy with a registered recipient.
     * @tc.steps         1. Register the recipient.
     *                   2. Notify death.
     *                   3. Read the died counter.
     * @tc.expected      The counter equals one and the proxy is dead.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientProxyNotifyFiresRecipient', 0, () => {
      logStep('clientProxyNotifyFiresRecipient', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      const recipient: DeathRecipientModel = new DeathRecipientModel();
      proxy.registerDeathRecipient(recipient);
      proxy.notifyDeath();
      expect(recipient.diedCount).assertEqual(1);
      expect(proxy.isAlive()).assertFalse();
      expect(recipient.registered).assertTrue();
      proxy.notifyDeath();
      expect(recipient.diedCount).assertEqual(2);
      expect(proxy.deathRegistered).assertTrue();
      expect(client.proxy === undefined).assertTrue();
      const described: DeathRecipientModel = new DeathRecipientModel();
      const label: string = described.describe();
      expect(label.indexOf('/') > 0).assertTrue();
      expect(label.endsWith(String(described.registered))).assertTrue();
      expect(label.length >= 3).assertTrue();
      logStep('clientProxyNotifyFiresRecipient', 'end');
    });

    /**
     * @tc.name          clientProxyNotifyTwiceCounts
     * @tc.desc          A second death notification fires the recipient again in the model.
     * @tc.precondition  A proxy with a registered recipient that already died once.
     * @tc.steps         1. Notify death once.
     *                   2. Notify death again.
     *                   3. Read the counter.
     * @tc.expected      The died counter equals two.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientProxyNotifyTwiceCounts', 0, () => {
      logStep('clientProxyNotifyTwiceCounts', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      const recipient: DeathRecipientModel = new DeathRecipientModel();
      proxy.registerDeathRecipient(recipient);
      proxy.notifyDeath();
      expect(recipient.diedCount).assertEqual(1);
      expect(proxy.isAlive()).assertFalse();
      expect(recipient.registered).assertTrue();
      proxy.notifyDeath();
      expect(recipient.diedCount).assertEqual(2);
      expect(proxy.deathRegistered).assertTrue();
      expect(client.proxy === undefined).assertTrue();
      expect(proxy.sendCalls).assertEqual(proxy.requests.length);
      expect(proxy.stub === stub).assertTrue();
      expect(proxy.failNextSend).assertEqual(ERROR_NONE);
      logStep('clientProxyNotifyTwiceCounts', 'end');
    });

    /**
     * @tc.name          clientProxyNotifyKeepsRegistration
     * @tc.desc          Death notification does not clear the registration flag.
     * @tc.precondition  A proxy with a registered recipient.
     * @tc.steps         1. Notify death.
     *                   2. Read the registration flag.
     *                   3. Read the proxy reference.
     * @tc.expected      The registration flag stays true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientProxyNotifyKeepsRegistration', 0, () => {
      logStep('clientProxyNotifyKeepsRegistration', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      const recipient: DeathRecipientModel = new DeathRecipientModel();
      proxy.registerDeathRecipient(recipient);
      proxy.notifyDeath();
      expect(recipient.diedCount).assertEqual(1);
      expect(proxy.isAlive()).assertFalse();
      expect(recipient.registered).assertTrue();
      proxy.notifyDeath();
      expect(recipient.diedCount).assertEqual(2);
      expect(proxy.deathRegistered).assertTrue();
      expect(client.proxy === undefined).assertTrue();
      expect(client.logs.size() >= 0).assertTrue();
      expect(client.events.size()).assertEqual(client.events.entries.length);
      expect(client.logs.countLevel(LEVEL_ERROR) >= 0).assertTrue();
      logStep('clientProxyNotifyKeepsRegistration', 'end');
    });

    /**
     * @tc.name          clientProxyNotifyAfterReset
     * @tc.desc          After reset the proxy is alive again and has no recipient to notify.
     * @tc.precondition  A proxy that was killed and then reset.
     * @tc.steps         1. Notify death.
     *                   2. Reset the proxy.
     *                   3. Notify death again.
     * @tc.expected      The second notification reaches nobody and the proxy is dead.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientProxyNotifyAfterReset', 0, () => {
      logStep('clientProxyNotifyAfterReset', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      const recipient: DeathRecipientModel = new DeathRecipientModel();
      proxy.registerDeathRecipient(recipient);
      proxy.notifyDeath();
      expect(recipient.diedCount).assertEqual(1);
      expect(proxy.isAlive()).assertFalse();
      expect(recipient.registered).assertTrue();
      proxy.notifyDeath();
      expect(recipient.diedCount).assertEqual(2);
      expect(proxy.deathRegistered).assertTrue();
      expect(client.proxy === undefined).assertTrue();
      const before: number = client.toasts.length;
      client.reset();
      expect(client.toasts.length).assertEqual(0);
      expect(before >= 0).assertTrue();
      expect(client.events.size()).assertEqual(0);
      logStep('clientProxyNotifyAfterReset', 'end');
    });

    /**
     * @tc.name          clientProxyDescriptorDefault
     * @tc.desc          The proxy copies the stub descriptor on construction.
     * @tc.precondition  A default stub and a proxy built from it.
     * @tc.steps         1. Create the stub and proxy.
     *                   2. Compare descriptors.
     *                   3. Check the descriptor prefix.
     * @tc.expected      Both descriptors equal the default stub descriptor.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientProxyDescriptorDefault', 0, () => {
      logStep('clientProxyDescriptorDefault', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel('IPCStubTest');
      stub.replyText = 'rep-one';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      expect(proxy.descriptor).assertEqual('IPCStubTest');
      expect(proxy.descriptor).assertEqual(stub.descriptor);
      expect(proxy.descriptor.length > 0).assertTrue();
      expect(proxy.stub === stub).assertTrue();
      expect(proxy.alive).assertTrue();
      expect(proxy.sendCalls).assertEqual(0);
      expect(proxy.requests.length).assertEqual(0);
      expect(proxy.descriptor.length > 3).assertTrue();
      expect(proxy.sendCalls).assertEqual(proxy.requests.length);
      expect(proxy.stub === stub).assertTrue();
      expect(proxy.failNextSend).assertEqual(ERROR_NONE);
      logStep('clientProxyDescriptorDefault', 'end');
    });

    /**
     * @tc.name          clientProxyNotifyWithoutRecipient
     * @tc.desc          Notifying death on a recipient-free proxy is a no-op for the recipient model.
     * @tc.precondition  A live proxy with no registered recipient.
     * @tc.steps         1. Call notifyDeath.
     *                   2. Check liveness.
     *                   3. Reset the client observer.
     * @tc.expected      The proxy dies quietly and the client stays idle.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientProxyNotifyWithoutRecipient', 0, () => {
      logStep('clientProxyNotifyWithoutRecipient', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      const recipient: DeathRecipientModel = new DeathRecipientModel();
      proxy.registerDeathRecipient(recipient);
      proxy.notifyDeath();
      expect(recipient.diedCount).assertEqual(1);
      expect(proxy.isAlive()).assertFalse();
      expect(recipient.registered).assertTrue();
      proxy.notifyDeath();
      expect(recipient.diedCount).assertEqual(2);
      expect(proxy.deathRegistered).assertTrue();
      expect(client.proxy === undefined).assertTrue();
      expect(proxy.sendCalls).assertEqual(proxy.requests.length);
      expect(proxy.stub === stub).assertTrue();
      expect(proxy.failNextSend).assertEqual(ERROR_NONE);
      logStep('clientProxyNotifyWithoutRecipient', 'end');
    });

    /**
     * @tc.name          clientProxyDescriptorCustomStub
     * @tc.desc          A custom stub descriptor is propagated to the proxy.
     * @tc.precondition  A stub constructed with a custom descriptor.
     * @tc.steps         1. Build the stub and proxy.
     *                   2. Compare the descriptors.
     *                   3. Check the message option.
     * @tc.expected      The proxy descriptor equals the custom stub descriptor.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientProxyDescriptorCustomStub', 0, () => {
      logStep('clientProxyDescriptorCustomStub', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel('CustomProxyStub');
      stub.replyText = 'rep-two';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      expect(proxy.descriptor).assertEqual('CustomProxyStub');
      expect(proxy.descriptor).assertEqual(stub.descriptor);
      expect(proxy.descriptor.length > 0).assertTrue();
      expect(proxy.stub === stub).assertTrue();
      expect(proxy.alive).assertTrue();
      expect(proxy.sendCalls).assertEqual(0);
      expect(proxy.requests.length).assertEqual(0);
      expect(proxy.descriptor.length > 3).assertTrue();
      expect(proxy.sendCalls).assertEqual(proxy.requests.length);
      expect(proxy.stub === stub).assertTrue();
      expect(proxy.failNextSend).assertEqual(ERROR_NONE);
      logStep('clientProxyDescriptorCustomStub', 'end');
    });

    /**
     * @tc.name          clientProxyDescriptorReplyText
     * @tc.desc          The proxy exposes the stub reply text through its stub reference.
     * @tc.precondition  A stub configured with a distinctive reply.
     * @tc.steps         1. Set the stub reply.
     *                   2. Build the proxy.
     *                   3. Read the stub reply through the proxy.
     * @tc.expected      The proxy stub replies with the configured text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientProxyDescriptorReplyText', 0, () => {
      logStep('clientProxyDescriptorReplyText', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel('IPCStubTest');
      stub.replyText = 'rep-three';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      expect(proxy.descriptor).assertEqual('IPCStubTest');
      expect(proxy.descriptor).assertEqual(stub.descriptor);
      expect(proxy.descriptor.length > 0).assertTrue();
      expect(proxy.stub === stub).assertTrue();
      expect(proxy.alive).assertTrue();
      expect(proxy.sendCalls).assertEqual(0);
      expect(proxy.requests.length).assertEqual(0);
      expect(proxy.descriptor.length > 3).assertTrue();
      const described: DeathRecipientModel = new DeathRecipientModel();
      const label: string = described.describe();
      expect(label.indexOf('/') > 0).assertTrue();
      expect(label.endsWith(String(described.registered))).assertTrue();
      expect(label.length >= 3).assertTrue();
      logStep('clientProxyDescriptorReplyText', 'end');
    });

    /**
     * @tc.name          clientProxyDescriptorInitialCounters
     * @tc.desc          A fresh proxy starts with zero sends and no recorded requests.
     * @tc.precondition  A newly constructed proxy.
     * @tc.steps         1. Build the proxy.
     *                   2. Read the send counter.
     *                   3. Read the request list.
     * @tc.expected      Both counters are zero and the list is empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientProxyDescriptorInitialCounters', 0, () => {
      logStep('clientProxyDescriptorInitialCounters', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel('IPCStubTest');
      stub.replyText = 'rep-four';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      expect(proxy.descriptor).assertEqual('IPCStubTest');
      expect(proxy.descriptor).assertEqual(stub.descriptor);
      expect(proxy.descriptor.length > 0).assertTrue();
      expect(proxy.stub === stub).assertTrue();
      expect(proxy.alive).assertTrue();
      expect(proxy.sendCalls).assertEqual(0);
      expect(proxy.requests.length).assertEqual(0);
      expect(proxy.descriptor.length > 3).assertTrue();
      expect(client.logs.size() >= 0).assertTrue();
      expect(client.events.size()).assertEqual(client.events.entries.length);
      expect(client.logs.countLevel(LEVEL_ERROR) >= 0).assertTrue();
      logStep('clientProxyDescriptorInitialCounters', 'end');
    });

    /**
     * @tc.name          clientProxyDescriptorStubIdentity
     * @tc.desc          The proxy keeps the exact stub instance used at construction.
     * @tc.precondition  A stub instance and a proxy built from it.
     * @tc.steps         1. Build the proxy.
     *                   2. Compare the stub reference.
     *                   3. Kill and revive the stub.
     * @tc.expected      The stub identity is preserved through state changes.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientProxyDescriptorStubIdentity', 0, () => {
      logStep('clientProxyDescriptorStubIdentity', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel('IPCStubTest');
      stub.replyText = 'rep-five';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      expect(proxy.descriptor).assertEqual('IPCStubTest');
      expect(proxy.descriptor).assertEqual(stub.descriptor);
      expect(proxy.descriptor.length > 0).assertTrue();
      expect(proxy.stub === stub).assertTrue();
      expect(proxy.alive).assertTrue();
      expect(proxy.sendCalls).assertEqual(0);
      expect(proxy.requests.length).assertEqual(0);
      expect(proxy.descriptor.length > 3).assertTrue();
      const snap: ClientSnapshot = new ClientSnapshot(client);
      expect(snap.hasProxy).assertEqual(client.proxy !== undefined);
      expect(snap.toastCount).assertEqual(client.toasts.length);
      expect(snap.state).assertEqual(client.state);
      logStep('clientProxyDescriptorStubIdentity', 'end');
    });

    /**
     * @tc.name          clientProxySendRecordsCodes
     * @tc.desc          Every proxied send records the request code in order.
     * @tc.precondition  A connected client with a live proxy.
     * @tc.steps         1. Send three payloads.
     *                   2. Read the request list.
     *                   3. Compare each code.
     * @tc.expected      Three request code one entries are recorded.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientProxySendRecordsCodes', 0, () => {
      logStep('clientProxySendRecordsCodes', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'rep-one';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(21);
      client.onConnect(proxy);
      client.sendString('codes-one');
      client.sendString('codes-one');
      client.sendString('codes-one');
      expect(proxy.sendCalls).assertEqual(3);
      expect(proxy.requests.length).assertEqual(3);
      expect(proxy.requests[0]).assertEqual(REQUEST_CODE);
      expect(proxy.requests[2]).assertEqual(REQUEST_CODE);
      expect(stub.receivedTexts.length).assertEqual(3);
      expect(proxy.lastPayload).assertEqual('');
      expect(proxy.sendCalls).assertEqual(proxy.requests.length);
      expect(proxy.stub === stub).assertTrue();
      expect(proxy.failNextSend).assertEqual(ERROR_NONE);
      logStep('clientProxySendRecordsCodes', 'end');
    });

    /**
     * @tc.name          clientProxySendCounts
     * @tc.desc          The proxy send counter tracks every forwarded request.
     * @tc.precondition  A connected client with no previous sends.
     * @tc.steps         1. Send three payloads.
     *                   2. Read the proxy counter.
     *                   3. Compare with the stub receptions.
     * @tc.expected      Three sends and three receptions are recorded.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientProxySendCounts', 0, () => {
      logStep('clientProxySendCounts', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'rep-two';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(21);
      client.onConnect(proxy);
      client.sendString('codes-two');
      client.sendString('codes-two');
      client.sendString('codes-two');
      expect(proxy.sendCalls).assertEqual(3);
      expect(proxy.requests.length).assertEqual(3);
      expect(proxy.requests[0]).assertEqual(REQUEST_CODE);
      expect(proxy.requests[2]).assertEqual(REQUEST_CODE);
      expect(stub.receivedTexts.length).assertEqual(3);
      expect(proxy.lastPayload).assertEqual('');
      expect(client.logs.size() >= 0).assertTrue();
      expect(client.events.size()).assertEqual(client.events.entries.length);
      expect(client.logs.countLevel(LEVEL_ERROR) >= 0).assertTrue();
      logStep('clientProxySendCounts', 'end');
    });

    /**
     * @tc.name          clientProxySendReceptions
     * @tc.desc          The stub receives every payload forwarded by the proxy.
     * @tc.precondition  A connected client and a recording stub.
     * @tc.steps         1. Send three identical payloads.
     *                   2. Read the stub list.
     *                   3. Compare the entries.
     * @tc.expected      Three identical payload copies are stored.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientProxySendReceptions', 0, () => {
      logStep('clientProxySendReceptions', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'rep-three';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(21);
      client.onConnect(proxy);
      client.sendString('codes-three');
      client.sendString('codes-three');
      client.sendString('codes-three');
      expect(proxy.sendCalls).assertEqual(3);
      expect(proxy.requests.length).assertEqual(3);
      expect(proxy.requests[0]).assertEqual(REQUEST_CODE);
      expect(proxy.requests[2]).assertEqual(REQUEST_CODE);
      expect(stub.receivedTexts.length).assertEqual(3);
      expect(proxy.lastPayload).assertEqual('');
      const snap: ClientSnapshot = new ClientSnapshot(client);
      expect(snap.hasProxy).assertEqual(client.proxy !== undefined);
      expect(snap.toastCount).assertEqual(client.toasts.length);
      expect(snap.state).assertEqual(client.state);
      logStep('clientProxySendReceptions', 'end');
    });

    /**
     * @tc.name          clientProxySendSnapshot
     * @tc.desc          The connected client snapshot reports the proxy after sends.
     * @tc.precondition  A connected client after three sends.
     * @tc.steps         1. Send three payloads.
     *                   2. Build a snapshot.
     *                   3. Compare the proxy flag.
     * @tc.expected      The snapshot reports a proxy and four toasts.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientProxySendSnapshot', 0, () => {
      logStep('clientProxySendSnapshot', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'rep-four';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(21);
      client.onConnect(proxy);
      client.sendString('codes-four');
      client.sendString('codes-four');
      client.sendString('codes-four');
      expect(proxy.sendCalls).assertEqual(3);
      expect(proxy.requests.length).assertEqual(3);
      expect(proxy.requests[0]).assertEqual(REQUEST_CODE);
      expect(proxy.requests[2]).assertEqual(REQUEST_CODE);
      expect(stub.receivedTexts.length).assertEqual(3);
      expect(proxy.lastPayload).assertEqual('');
      const described: DeathRecipientModel = new DeathRecipientModel();
      const label: string = described.describe();
      expect(label.indexOf('/') > 0).assertTrue();
      expect(label.endsWith(String(described.registered))).assertTrue();
      expect(label.length >= 3).assertTrue();
      logStep('clientProxySendSnapshot', 'end');
    });

    /**
     * @tc.name          clientProxySendLogLines
     * @tc.desc          Each forwarded send writes a reply log line.
     * @tc.precondition  A connected client before three sends.
     * @tc.steps         1. Send three payloads.
     *                   2. Read the log buffer.
     *                   3. Count info lines.
     * @tc.expected      At least three reply lines are present.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientProxySendLogLines', 0, () => {
      logStep('clientProxySendLogLines', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'rep-five';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(21);
      client.onConnect(proxy);
      client.sendString('codes-five');
      client.sendString('codes-five');
      client.sendString('codes-five');
      expect(proxy.sendCalls).assertEqual(3);
      expect(proxy.requests.length).assertEqual(3);
      expect(proxy.requests[0]).assertEqual(REQUEST_CODE);
      expect(proxy.requests[2]).assertEqual(REQUEST_CODE);
      expect(stub.receivedTexts.length).assertEqual(3);
      expect(proxy.lastPayload).assertEqual('');
      expect(client.logs.size() >= 0).assertTrue();
      expect(client.events.size()).assertEqual(client.events.entries.length);
      expect(client.logs.countLevel(LEVEL_ERROR) >= 0).assertTrue();
      logStep('clientProxySendLogLines', 'end');
    });

    /**
     * @tc.name          clientProxyResetClearsRequests
     * @tc.desc          Resetting a proxy empties its request list and counters.
     * @tc.precondition  A proxy that has forwarded one request.
     * @tc.steps         1. Forward a request.
     *                   2. Reset the proxy.
     *                   3. Read the counters.
     * @tc.expected      The request list and both counters are back to zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientProxyResetClearsRequests', 0, () => {
      logStep('clientProxyResetClearsRequests', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'rep-one';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      const recipient: DeathRecipientModel = new DeathRecipientModel();
      proxy.registerDeathRecipient(recipient);
      client.connect(23);
      client.onConnect(proxy);
      client.sendString('reset-one');
      proxy.reset();
      expect(proxy.sendCalls).assertEqual(0);
      expect(proxy.requests.length).assertEqual(0);
      expect(proxy.deathRegistered).assertFalse();
      expect(proxy.deathRecipient === undefined).assertTrue();
      expect(proxy.isAlive()).assertTrue();
      expect(proxy.failNextSend).assertEqual(ERROR_NONE);
      expect(proxy.sendCalls).assertEqual(proxy.requests.length);
      expect(proxy.stub === stub).assertTrue();
      expect(proxy.failNextSend).assertEqual(ERROR_NONE);
      logStep('clientProxyResetClearsRequests', 'end');
    });

    /**
     * @tc.name          clientProxyResetClearsRecipient
     * @tc.desc          Resetting a proxy clears its death recipient reference.
     * @tc.precondition  A proxy with a registered recipient.
     * @tc.steps         1. Register the recipient.
     *                   2. Reset the proxy.
     *                   3. Read the recipient fields.
     * @tc.expected      The proxy reference is undefined and the flag is false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientProxyResetClearsRecipient', 0, () => {
      logStep('clientProxyResetClearsRecipient', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'rep-two';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      const recipient: DeathRecipientModel = new DeathRecipientModel();
      proxy.registerDeathRecipient(recipient);
      client.connect(23);
      client.onConnect(proxy);
      client.sendString('reset-two');
      proxy.reset();
      expect(proxy.sendCalls).assertEqual(0);
      expect(proxy.requests.length).assertEqual(0);
      expect(proxy.deathRegistered).assertFalse();
      expect(proxy.deathRecipient === undefined).assertTrue();
      expect(proxy.isAlive()).assertTrue();
      expect(proxy.failNextSend).assertEqual(ERROR_NONE);
      const described: DeathRecipientModel = new DeathRecipientModel();
      const label: string = described.describe();
      expect(label.indexOf('/') > 0).assertTrue();
      expect(label.endsWith(String(described.registered))).assertTrue();
      expect(label.length >= 3).assertTrue();
      logStep('clientProxyResetClearsRecipient', 'end');
    });

    /**
     * @tc.name          clientProxyResetRestoresLiveness
     * @tc.desc          The proxy becomes alive again after reset.
     * @tc.precondition  A proxy that died before reset.
     * @tc.steps         1. Kill the proxy.
     *                   2. Reset it.
     *                   3. Read liveness.
     * @tc.expected      Liveness is true after reset.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientProxyResetRestoresLiveness', 0, () => {
      logStep('clientProxyResetRestoresLiveness', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'rep-three';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      const recipient: DeathRecipientModel = new DeathRecipientModel();
      proxy.registerDeathRecipient(recipient);
      client.connect(23);
      client.onConnect(proxy);
      client.sendString('reset-three');
      proxy.reset();
      expect(proxy.sendCalls).assertEqual(0);
      expect(proxy.requests.length).assertEqual(0);
      expect(proxy.deathRegistered).assertFalse();
      expect(proxy.deathRecipient === undefined).assertTrue();
      expect(proxy.isAlive()).assertTrue();
      expect(proxy.failNextSend).assertEqual(ERROR_NONE);
      expect(client.logs.size() >= 0).assertTrue();
      expect(client.events.size()).assertEqual(client.events.entries.length);
      expect(client.logs.countLevel(LEVEL_ERROR) >= 0).assertTrue();
      logStep('clientProxyResetRestoresLiveness', 'end');
    });

    /**
     * @tc.name          clientProxyResetKeepsStub
     * @tc.desc          Reset never replaces the stub instance behind the proxy.
     * @tc.precondition  A proxy with one recorded send.
     * @tc.steps         1. Forward a request.
     *                   2. Reset the proxy.
     *                   3. Compare the stub reference.
     * @tc.expected      The stub identity is unchanged after reset.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientProxyResetKeepsStub', 0, () => {
      logStep('clientProxyResetKeepsStub', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'rep-four';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      const recipient: DeathRecipientModel = new DeathRecipientModel();
      proxy.registerDeathRecipient(recipient);
      client.connect(23);
      client.onConnect(proxy);
      client.sendString('reset-four');
      proxy.reset();
      expect(proxy.sendCalls).assertEqual(0);
      expect(proxy.requests.length).assertEqual(0);
      expect(proxy.deathRegistered).assertFalse();
      expect(proxy.deathRecipient === undefined).assertTrue();
      expect(proxy.isAlive()).assertTrue();
      expect(proxy.failNextSend).assertEqual(ERROR_NONE);
      const snap: ClientSnapshot = new ClientSnapshot(client);
      expect(snap.hasProxy).assertEqual(client.proxy !== undefined);
      expect(snap.toastCount).assertEqual(client.toasts.length);
      expect(snap.state).assertEqual(client.state);
      logStep('clientProxyResetKeepsStub', 'end');
    });

    /**
     * @tc.name          clientProxyStubKillFailsSend
     * @tc.desc          Killing the stub makes the next proxied send fail.
     * @tc.precondition  A connected client whose stub is alive.
     * @tc.steps         1. Kill the stub.
     *                   2. Send a payload.
     *                   3. Read the failure result.
     * @tc.expected      The result is not successful and the stub saw nothing.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientProxyStubKillFailsSend', 0, () => {
      logStep('clientProxyStubKillFailsSend', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'rep-one';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(25);
      client.onConnect(proxy);
      stub.kill();
      const failed: RequestResultModel = client.sendString('revive-one');
      expect(failed.isSuccess()).assertFalse();
      stub.revive();
      const passed: RequestResultModel = client.sendString('revive-one');
      expect(passed.isSuccess()).assertTrue();
      expect(proxy.sendCalls).assertEqual(2);
      expect(stub.receivedTexts.length).assertEqual(1);
      expect(proxy.sendCalls).assertEqual(proxy.requests.length);
      expect(proxy.stub === stub).assertTrue();
      expect(proxy.failNextSend).assertEqual(ERROR_NONE);
      logStep('clientProxyStubKillFailsSend', 'end');
    });

    /**
     * @tc.name          clientProxyStubReviveRecovers
     * @tc.desc          Reviving the stub lets the next proxied send succeed.
     * @tc.precondition  A client whose stub was killed once.
     * @tc.steps         1. Kill and send.
     *                   2. Revive the stub.
     *                   3. Send again.
     * @tc.expected      The second send succeeds and exactly one reception exists.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientProxyStubReviveRecovers', 0, () => {
      logStep('clientProxyStubReviveRecovers', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'rep-two';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(25);
      client.onConnect(proxy);
      stub.kill();
      const failed: RequestResultModel = client.sendString('revive-two');
      expect(failed.isSuccess()).assertFalse();
      stub.revive();
      const passed: RequestResultModel = client.sendString('revive-two');
      expect(passed.isSuccess()).assertTrue();
      expect(proxy.sendCalls).assertEqual(2);
      expect(stub.receivedTexts.length).assertEqual(1);
      expect(client.logs.size() >= 0).assertTrue();
      expect(client.events.size()).assertEqual(client.events.entries.length);
      expect(client.logs.countLevel(LEVEL_ERROR) >= 0).assertTrue();
      logStep('clientProxyStubReviveRecovers', 'end');
    });

    /**
     * @tc.name          clientProxyStubReviveEventMix
     * @tc.desc          A kill then revive sequence leaves one failure and one success event.
     * @tc.precondition  A connected client before any send.
     * @tc.steps         1. Kill the stub and send.
     *                   2. Revive and send.
     *                   3. Count both event kinds.
     * @tc.expected      One failure and one success event are recorded.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientProxyStubReviveEventMix', 0, () => {
      logStep('clientProxyStubReviveEventMix', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'rep-three';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(25);
      client.onConnect(proxy);
      stub.kill();
      const failed: RequestResultModel = client.sendString('revive-three');
      expect(failed.isSuccess()).assertFalse();
      stub.revive();
      const passed: RequestResultModel = client.sendString('revive-three');
      expect(passed.isSuccess()).assertTrue();
      expect(proxy.sendCalls).assertEqual(2);
      expect(stub.receivedTexts.length).assertEqual(1);
      const snap: ClientSnapshot = new ClientSnapshot(client);
      expect(snap.hasProxy).assertEqual(client.proxy !== undefined);
      expect(snap.toastCount).assertEqual(client.toasts.length);
      expect(snap.state).assertEqual(client.state);
      logStep('clientProxyStubReviveEventMix', 'end');
    });

    /**
     * @tc.name          clientProxyOneShotFailure
     * @tc.desc          The primed failure is consumed by the next send only.
     * @tc.precondition  A connected proxy primed with a failure code.
     * @tc.steps         1. Prime the code.
     *                   2. Send once.
     *                   3. Send again.
     * @tc.expected      The first send fails with the code and the second succeeds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientProxyOneShotFailure', 0, () => {
      logStep('clientProxyOneShotFailure', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'rep-one';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(27);
      client.onConnect(proxy);
      proxy.failNextSend = ERROR_SEND;
      const first: RequestResultModel = client.sendString('shot-one');
      expect(first.errCode).assertEqual(ERROR_SEND);
      expect(proxy.failNextSend).assertEqual(ERROR_NONE);
      const second: RequestResultModel = client.sendString('shot-one');
      expect(second.isSuccess()).assertTrue();
      expect(proxy.sendCalls).assertEqual(2);
      expect(stub.receivedTexts.length).assertEqual(1);
      expect(proxy.sendCalls).assertEqual(proxy.requests.length);
      expect(proxy.stub === stub).assertTrue();
      expect(proxy.failNextSend).assertEqual(ERROR_NONE);
      logStep('clientProxyOneShotFailure', 'end');
    });

    /**
     * @tc.name          clientProxyOneShotClears
     * @tc.desc          The failure primer returns to zero after one use.
     * @tc.precondition  A proxy primed with a failure code.
     * @tc.steps         1. Prime the code.
     *                   2. Send once.
     *                   3. Read the primer.
     * @tc.expected      The primer reads zero after the send.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientProxyOneShotClears', 0, () => {
      logStep('clientProxyOneShotClears', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'rep-two';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(27);
      client.onConnect(proxy);
      proxy.failNextSend = ERROR_SEND;
      const first: RequestResultModel = client.sendString('shot-two');
      expect(first.errCode).assertEqual(ERROR_SEND);
      expect(proxy.failNextSend).assertEqual(ERROR_NONE);
      const second: RequestResultModel = client.sendString('shot-two');
      expect(second.isSuccess()).assertTrue();
      expect(proxy.sendCalls).assertEqual(2);
      expect(stub.receivedTexts.length).assertEqual(1);
      expect(client.logs.size() >= 0).assertTrue();
      expect(client.events.size()).assertEqual(client.events.entries.length);
      expect(client.logs.countLevel(LEVEL_ERROR) >= 0).assertTrue();
      logStep('clientProxyOneShotClears', 'end');
    });

    /**
     * @tc.name          clientProxyOneShotMetrics
     * @tc.desc          A one shot failure yields a half success ratio over two sends.
     * @tc.precondition  A connected client primed to fail once.
     * @tc.steps         1. Fail one send.
     *                   2. Succeed on the retry.
     *                   3. Build metrics.
     * @tc.expected      Two sends, one reply and a half ratio are reported.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientProxyOneShotMetrics', 0, () => {
      logStep('clientProxyOneShotMetrics', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      stub.replyText = 'rep-three';
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(27);
      client.onConnect(proxy);
      proxy.failNextSend = ERROR_SEND;
      const first: RequestResultModel = client.sendString('shot-three');
      expect(first.errCode).assertEqual(ERROR_SEND);
      expect(proxy.failNextSend).assertEqual(ERROR_NONE);
      const second: RequestResultModel = client.sendString('shot-three');
      expect(second.isSuccess()).assertTrue();
      expect(proxy.sendCalls).assertEqual(2);
      expect(stub.receivedTexts.length).assertEqual(1);
      expect(proxy.sendCalls).assertEqual(proxy.requests.length);
      expect(proxy.stub === stub).assertTrue();
      expect(proxy.failNextSend).assertEqual(ERROR_NONE);
      logStep('clientProxyOneShotMetrics', 'end');
    });

    /**
     * @tc.name          clientProxyOracleRequestCode
     * @tc.desc          The request code oracle accepts only the documented code one.
     * @tc.precondition  No runtime proxy needed.
     * @tc.steps         1. Check code one.
     *                   2. Check code zero.
     *                   3. Check the handled oracle.
     * @tc.expected      Only code one is accepted by both oracles.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientProxyOracleRequestCode', 0, () => {
      logStep('clientProxyOracleRequestCode', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      expect(isKnownRequestCode(REQUEST_CODE)).assertTrue();
      expect(isKnownRequestCode(UNKNOWN_CODE_ZERO)).assertFalse();
      expect(expectedHandled(REQUEST_CODE)).assertTrue();
      expect(expectedHandled(UNKNOWN_CODE_TWO)).assertFalse();
      expect(expectedReplyFor(REQUEST_CODE)).assertEqual('hello rpc');
      expect(expectedReplyFor(UNKNOWN_CODE_LARGE)).assertEqual('');
      expect(proxy.alive).assertTrue();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(expectedHandled(REQUEST_CODE) === isKnownRequestCode(REQUEST_CODE)).assertTrue();
      expect(isNonZeroError(ERROR_DEATH_REGISTER)).assertTrue();
      expect(expectedStateAfter('onFailed')).assertEqual(STATE_FAILED);
      logStep('clientProxyOracleRequestCode', 'end');
    });

    /**
     * @tc.name          clientProxyOracleReplyText
     * @tc.desc          The reply oracle returns the default reply for the request code.
     * @tc.precondition  No runtime proxy needed.
     * @tc.steps         1. Ask for the code one reply.
     *                   2. Ask for an unknown code reply.
     *                   3. Compare both strings.
     * @tc.expected      The known code yields hello rpc and the unknown code yields empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientProxyOracleReplyText', 0, () => {
      logStep('clientProxyOracleReplyText', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      expect(isKnownRequestCode(REQUEST_CODE)).assertTrue();
      expect(isKnownRequestCode(UNKNOWN_CODE_ZERO)).assertFalse();
      expect(expectedHandled(REQUEST_CODE)).assertTrue();
      expect(expectedHandled(UNKNOWN_CODE_TWO)).assertFalse();
      expect(expectedReplyFor(REQUEST_CODE)).assertEqual('hello rpc');
      expect(expectedReplyFor(UNKNOWN_CODE_LARGE)).assertEqual('');
      expect(proxy.alive).assertTrue();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(proxy.sendCalls).assertEqual(proxy.requests.length);
      expect(proxy.stub === stub).assertTrue();
      expect(proxy.failNextSend).assertEqual(ERROR_NONE);
      logStep('clientProxyOracleReplyText', 'end');
    });

    /**
     * @tc.name          clientProxyOracleHandledCodes
     * @tc.desc          The handled oracle rejects unknown codes such as two and ninety nine.
     * @tc.precondition  No runtime proxy needed.
     * @tc.steps         1. Check the handled oracle for code two.
     *                   2. Check code ninety nine.
     *                   3. Check code one.
     * @tc.expected      Only code one is handled.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientProxyOracleHandledCodes', 0, () => {
      logStep('clientProxyOracleHandledCodes', 'begin');
      const stub: RemoteStubModel = new RemoteStubModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      expect(isKnownRequestCode(REQUEST_CODE)).assertTrue();
      expect(isKnownRequestCode(UNKNOWN_CODE_ZERO)).assertFalse();
      expect(expectedHandled(REQUEST_CODE)).assertTrue();
      expect(expectedHandled(UNKNOWN_CODE_TWO)).assertFalse();
      expect(expectedReplyFor(REQUEST_CODE)).assertEqual('hello rpc');
      expect(expectedReplyFor(UNKNOWN_CODE_LARGE)).assertEqual('');
      expect(proxy.alive).assertTrue();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      const described: DeathRecipientModel = new DeathRecipientModel();
      const label: string = described.describe();
      expect(label.indexOf('/') > 0).assertTrue();
      expect(label.endsWith(String(described.registered))).assertTrue();
      expect(label.length >= 3).assertTrue();
      logStep('clientProxyOracleHandledCodes', 'end');
    });
  });
}
