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
  TARGET_BUNDLE,
  TARGET_ABILITY,
  CLIENT_BUNDLE,
  STUB_DESCRIPTOR,
  OPTION_FLAG_SYNC,
  OPTION_FLAG_ASYNC,
  STATE_CONNECTED,
  STATE_CONNECTING,
  STATE_DISCONNECTED,
  INITIAL_CONNECT_ID,
  ERROR_NONE,
  ERROR_SEND,
  ConnectionModel,
  RemoteProxyModel,
  RemoteStubModel,
  WantModel,
  MessageOptionModel,
  ClientSnapshot,
  createConnectedSession
} from '../Shared/SharedDriver';

export default function configurationChanges(): void {
  describe('ConfigurationChanges', () => {
    beforeAll(() => {
      logSuite('ConfigurationChanges', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('ConfigurationChanges', 'end');
    });

    /**
     * @tc.name          configurationChangesDefaultWantTargetsStub
     * @tc.desc          The default want targets the stub package.
     * @tc.precondition  The driver is loaded.
     * @tc.steps         1. The driver is loaded.
     *                   2. Build a default WantModel.
     *                   3. It names com.example.ipc_stub and ServiceAbility.
     * @tc.expected      It names com.example.ipc_stub and ServiceAbility.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('configurationChangesDefaultWantTargetsStub', 0, () => {
      const want = new WantModel();
      expect(want.bundleName).assertEqual(TARGET_BUNDLE);
      expect(want.abilityName).assertEqual(TARGET_ABILITY);
      expect(want.bundleName).assertEqual('com.example.ipc_stub');
      expect(want.abilityName).assertEqual('ServiceAbility');
      expect(want.validate().length).assertEqual(0);
      expect(want.describe()).assertEqual('com.example.ipc_stub/ServiceAbility');
      expect(want.matches(new WantModel())).assertTrue();
    });

    /**
     * @tc.name          configurationChangesClientBundleLiteral
     * @tc.desc          The client bundle literal is stable.
     * @tc.precondition  The driver is loaded.
     * @tc.steps         1. The driver is loaded.
     *                   2. Read CLIENT_BUNDLE.
     *                   3. It equals com.example.ipc_client.
     * @tc.expected      It equals com.example.ipc_client.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('configurationChangesClientBundleLiteral', 0, () => {
      expect(CLIENT_BUNDLE).assertEqual('com.example.ipc_client');
      expect(STUB_DESCRIPTOR).assertEqual('IPCStubTest');
      expect(TARGET_BUNDLE).assertEqual('com.example.ipc_stub');
      expect(TARGET_ABILITY).assertEqual('ServiceAbility');
      expect(CLIENT_BUNDLE === TARGET_BUNDLE).assertFalse();
      expect(CLIENT_BUNDLE.length > 0).assertTrue();
      expect(STUB_DESCRIPTOR.length).assertEqual(11);
      expect(CLIENT_BUNDLE.indexOf('client') > 0).assertTrue();
    });

    /**
     * @tc.name          configurationChangesStubDescriptorLiteral
     * @tc.desc          The stub descriptor literal is stable.
     * @tc.precondition  The driver is loaded.
     * @tc.steps         1. The driver is loaded.
     *                   2. Read STUB_DESCRIPTOR.
     *                   3. It equals IPCStubTest.
     * @tc.expected      It equals IPCStubTest.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('configurationChangesStubDescriptorLiteral', 0, () => {
      expect(STUB_DESCRIPTOR).assertEqual('IPCStubTest');
      expect(STUB_DESCRIPTOR.length).assertEqual(11);
      expect(STUB_DESCRIPTOR.startsWith('IPC')).assertTrue();
      expect(STUB_DESCRIPTOR.endsWith('Test')).assertTrue();
      expect(STUB_DESCRIPTOR.indexOf('Stub')).assertEqual(3);
      expect(STUB_DESCRIPTOR === TARGET_BUNDLE).assertFalse();
      const proxy = new RemoteProxyModel(new RemoteStubModel());
      expect(proxy.descriptor).assertEqual(STUB_DESCRIPTOR);
    });

    /**
     * @tc.name          configurationChangesWantEmptyBundleError
     * @tc.desc          An empty bundle is reported once.
     * @tc.precondition  A want with an empty bundle exists.
     * @tc.steps         1. A want with an empty bundle exists.
     *                   2. Validate and count bundle-empty markers.
     *                   3. The marker appears once.
     * @tc.expected      The marker appears once.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('configurationChangesWantEmptyBundleError', 0, () => {
      const want = new WantModel('', 'ServiceAbility');
      const errors = want.validate();
      expect(errors.length).assertEqual(1);
      expect(errors.indexOf('bundle-empty')).assertEqual(0);
      expect(want.describe()).assertEqual('/ServiceAbility');
      expect(want.matches(new WantModel())).assertFalse();
      expect(want.bundleName).assertEqual('');
      expect(want.abilityName).assertEqual('ServiceAbility');
      expect(errors.indexOf('bundle-has-space') >= 0).assertEqual(false);
    });

    /**
     * @tc.name          configurationChangesWantEmptyAbilityError
     * @tc.desc          An empty ability is reported once.
     * @tc.precondition  A want with an empty ability exists.
     * @tc.steps         1. A want with an empty ability exists.
     *                   2. Validate and count ability-empty markers.
     *                   3. The marker appears once.
     * @tc.expected      The marker appears once.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('configurationChangesWantEmptyAbilityError', 0, () => {
      const want = new WantModel('com.example.ipc_stub', '');
      const errors = want.validate();
      expect(errors.length).assertEqual(1);
      expect(errors.indexOf('ability-empty')).assertEqual(0);
      expect(want.describe()).assertEqual('com.example.ipc_stub/');
      expect(want.matches(new WantModel())).assertFalse();
      expect(want.bundleName).assertEqual('com.example.ipc_stub');
      expect(want.abilityName).assertEqual('');
      expect(errors.indexOf('bundle-has-space') >= 0).assertEqual(false);
    });

    /**
     * @tc.name          configurationChangesWantBundleSpaceError
     * @tc.desc          A bundle containing a space is rejected.
     * @tc.precondition  A want with a spaced bundle exists.
     * @tc.steps         1. A want with a spaced bundle exists.
     *                   2. Validate and search the markers.
     *                   3. The bundle-has-space marker is present.
     * @tc.expected      The bundle-has-space marker is present.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('configurationChangesWantBundleSpaceError', 0, () => {
      const want = new WantModel('com.example ipc', 'ServiceAbility');
      const errors = want.validate();
      expect(errors.length).assertEqual(1);
      expect(errors.indexOf('bundle-has-space')).assertEqual(0);
      expect(want.describe()).assertEqual('com.example ipc/ServiceAbility');
      expect(want.matches(new WantModel())).assertFalse();
      expect(want.bundleName).assertEqual('com.example ipc');
      expect(want.abilityName).assertEqual('ServiceAbility');
      expect(errors.indexOf('bundle-has-space') >= 0).assertEqual(true);
    });

    /**
     * @tc.name          configurationChangesWantAbilitySpaceError
     * @tc.desc          An ability containing a space is rejected.
     * @tc.precondition  A want with a spaced ability exists.
     * @tc.steps         1. A want with a spaced ability exists.
     *                   2. Validate and search the markers.
     *                   3. The ability-has-space marker is present.
     * @tc.expected      The ability-has-space marker is present.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('configurationChangesWantAbilitySpaceError', 0, () => {
      const want = new WantModel('com.example.ipc_stub', 'Service Ability');
      const errors = want.validate();
      expect(errors.length).assertEqual(1);
      expect(errors.indexOf('ability-has-space')).assertEqual(0);
      expect(want.describe()).assertEqual('com.example.ipc_stub/Service Ability');
      expect(want.matches(new WantModel())).assertFalse();
      expect(want.bundleName).assertEqual('com.example.ipc_stub');
      expect(want.abilityName).assertEqual('Service Ability');
      expect(errors.indexOf('bundle-has-space') >= 0).assertEqual(false);
    });

    /**
     * @tc.name          configurationChangesWantBothEmptyErrors
     * @tc.desc          Two empty fields produce two markers.
     * @tc.precondition  A want with both fields empty exists.
     * @tc.steps         1. A want with both fields empty exists.
     *                   2. Validate and read the length.
     *                   3. Exactly two markers are returned.
     * @tc.expected      Exactly two markers are returned.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('configurationChangesWantBothEmptyErrors', 0, () => {
      const want = new WantModel('', '');
      const errors = want.validate();
      expect(errors.length).assertEqual(2);
      expect(errors.indexOf('bundle-empty')).assertEqual(0);
      expect(errors.indexOf('ability-empty')).assertEqual(1);
      expect(want.matches(new WantModel())).assertFalse();
      expect(want.validate().length).assertEqual(2);
      expect(want.describe()).assertEqual('/');
      expect(errors !== undefined).assertTrue();
    });

    /**
     * @tc.name          configurationChangesWantBothSpaceErrors
     * @tc.desc          Two spaced fields produce two markers.
     * @tc.precondition  Both want fields contain spaces.
     * @tc.steps         1. Both want fields contain spaces.
     *                   2. Validate and read the length.
     *                   3. Exactly two markers are returned.
     * @tc.expected      Exactly two markers are returned.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('configurationChangesWantBothSpaceErrors', 0, () => {
      const want = new WantModel('bad bundle', 'bad ability');
      const errors = want.validate();
      expect(errors.length).assertEqual(2);
      expect(errors.indexOf('bundle-has-space')).assertEqual(0);
      expect(errors.indexOf('ability-has-space')).assertEqual(1);
      expect(want.matches(new WantModel())).assertFalse();
      expect(want.validate().length).assertEqual(2);
      expect(want.describe()).assertEqual('bad bundle/bad ability');
      expect(errors !== undefined).assertTrue();
    });

    /**
     * @tc.name          configurationChangesWantUnknownFieldValidationClean
     * @tc.desc          A valid custom want has no markers.
     * @tc.precondition  A custom bundle and ability exist.
     * @tc.steps         1. A custom bundle and ability exist.
     *                   2. Build and validate the want.
     *                   3. The error list is empty.
     * @tc.expected      The error list is empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('configurationChangesWantUnknownFieldValidationClean', 0, () => {
      const want = new WantModel('com.example.custom', 'CustomAbility');
      const errors = want.validate();
      expect(errors.length).assertEqual(0);
      expect(want.bundleName).assertEqual('com.example.custom');
      expect(want.abilityName).assertEqual('CustomAbility');
      expect(want.matches(new WantModel('com.example.custom', 'CustomAbility'))).assertTrue();
      expect(want.matches(new WantModel())).assertFalse();
      expect(want.describe()).assertEqual('com.example.custom/CustomAbility');
    });

    /**
     * @tc.name          configurationChangesWantDescribeOrder
     * @tc.desc          The want description keeps bundle before ability.
     * @tc.precondition  A custom want exists.
     * @tc.steps         1. A custom want exists.
     *                   2. Call describe.
     *                   3. The text is bundle slash ability.
     * @tc.expected      The text is bundle slash ability.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('configurationChangesWantDescribeOrder', 0, () => {
      const want = new WantModel('com.example.order', 'OrderAbility');
      expect(want.describe()).assertEqual('com.example.order/OrderAbility');
      expect(want.describe().indexOf('/') > 0).assertTrue();
      expect(want.describe().indexOf('com.example.order') === 0).assertTrue();
      expect(want.describe().split('/').length).assertEqual(2);
      expect(want.describe().endsWith('OrderAbility')).assertTrue();
      expect(want.describe()).assertEqual(want.bundleName + '/' + want.abilityName);
    });

    /**
     * @tc.name          configurationChangesWantMatchesEqual
     * @tc.desc          Equal wants match in both directions.
     * @tc.precondition  Two equal wants exist.
     * @tc.steps         1. Two equal wants exist.
     *                   2. Call matches both ways.
     *                   3. Both calls return true.
     * @tc.expected      Both calls return true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('configurationChangesWantMatchesEqual', 0, () => {
      const left = new WantModel('com.example.left', 'LeftAbility');
      const right = new WantModel('com.example.left', 'LeftAbility');
      expect(left.matches(right)).assertTrue();
      expect(right.matches(left)).assertTrue();
      expect(left === right).assertFalse();
      expect(left.bundleName).assertEqual(right.bundleName);
      expect(left.abilityName).assertEqual(right.abilityName);
      expect(left.describe()).assertEqual(right.describe());
    });

    /**
     * @tc.name          configurationChangesWantMismatchBundle
     * @tc.desc          A different bundle breaks the match.
     * @tc.precondition  Two wants differ by bundle.
     * @tc.steps         1. Two wants differ by bundle.
     *                   2. Call matches.
     *                   3. The result is false.
     * @tc.expected      The result is false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('configurationChangesWantMismatchBundle', 0, () => {
      const left = new WantModel('com.example.left', 'SharedAbility');
      const right = new WantModel('com.example.right', 'SharedAbility');
      expect(left.matches(right)).assertFalse();
      expect(right.matches(left)).assertFalse();
      expect(left.abilityName).assertEqual(right.abilityName);
      expect(left.bundleName === right.bundleName).assertFalse();
      expect(left.describe() === right.describe()).assertFalse();
      expect(left.validate().length).assertEqual(0);
    });

    /**
     * @tc.name          configurationChangesWantMismatchAbility
     * @tc.desc          A different ability breaks the match.
     * @tc.precondition  Two wants differ by ability.
     * @tc.steps         1. Two wants differ by ability.
     *                   2. Call matches.
     *                   3. The result is false.
     * @tc.expected      The result is false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('configurationChangesWantMismatchAbility', 0, () => {
      const left = new WantModel('com.example.same', 'LeftAbility');
      const right = new WantModel('com.example.same', 'RightAbility');
      expect(left.matches(right)).assertFalse();
      expect(right.matches(left)).assertFalse();
      expect(left.bundleName).assertEqual(right.bundleName);
      expect(left.abilityName === right.abilityName).assertFalse();
      expect(left.describe() === right.describe()).assertFalse();
      expect(left.validate().length).assertEqual(0);
    });

    /**
     * @tc.name          configurationChangesConnectRecordsDefaultWant
     * @tc.desc          The connect event carries the default want.
     * @tc.precondition  A default client exists.
     * @tc.steps         1. A default client exists.
     *                   2. Connect and read the first event.
     *                   3. The event names the stub want.
     * @tc.expected      The event names the stub want.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('configurationChangesConnectRecordsDefaultWant', 0, () => {
      const client = new ConnectionModel();
      client.connect(70);
      expect(client.want.bundleName).assertEqual(TARGET_BUNDLE);
      expect(client.want.abilityName).assertEqual(TARGET_ABILITY);
      expect(client.events.entries[0]).assertEqual('connect:com.example.ipc_stub/ServiceAbility');
      expect(client.state).assertEqual(STATE_CONNECTING);
      expect(client.connectId).assertEqual(70);
      expect(client.events.countOf('connect')).assertEqual(1);
      expect(client.want.validate().length).assertEqual(0);
    });

    /**
     * @tc.name          configurationChangesConnectWithCustomWant
     * @tc.desc          A replaced want is used by connect.
     * @tc.precondition  A client want was replaced.
     * @tc.steps         1. A client want was replaced.
     *                   2. Connect and read the event.
     *                   3. The event names the custom want.
     * @tc.expected      The event names the custom want.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('configurationChangesConnectWithCustomWant', 0, () => {
      const client = new ConnectionModel();
      const want = new WantModel('com.example.custom', 'CustomAbility');
      client.want = want;
      client.connect(71);
      expect(client.want === want).assertTrue();
      expect(client.want.bundleName).assertEqual('com.example.custom');
      expect(client.events.entries[0]).assertEqual('connect:com.example.custom/CustomAbility');
      expect(client.want.matches(want)).assertTrue();
      expect(client.want.validate().length).assertEqual(0);
      expect(client.connectId).assertEqual(71);
    });

    /**
     * @tc.name          configurationChangesCustomWantStoredAfterConnect
     * @tc.desc          The custom want survives the handshake.
     * @tc.precondition  A custom want client is connecting.
     * @tc.steps         1. A custom want client is connecting.
     *                   2. Deliver onConnect.
     *                   3. The want fields are unchanged.
     * @tc.expected      The want fields are unchanged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('configurationChangesCustomWantStoredAfterConnect', 0, () => {
      const client = new ConnectionModel();
      client.want = new WantModel('com.example.custom', 'CustomAbility');
      client.connect(72);
      client.onConnect(new RemoteProxyModel(new RemoteStubModel()));
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.want.bundleName).assertEqual('com.example.custom');
      expect(client.want.abilityName).assertEqual('CustomAbility');
      expect(client.isConnected()).assertTrue();
      expect(client.toasts.length).assertEqual(1);
      expect(client.want.validate().length).assertEqual(0);
    });

    /**
     * @tc.name          configurationChangesCustomWantSurvivesDisconnect
     * @tc.desc          The custom want survives a disconnect.
     * @tc.precondition  A custom want session disconnected.
     * @tc.steps         1. A custom want session disconnected.
     *                   2. Inspect the want.
     *                   3. The custom fields are still stored.
     * @tc.expected      The custom fields are still stored.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('configurationChangesCustomWantSurvivesDisconnect', 0, () => {
      const client = new ConnectionModel();
      client.want = new WantModel('com.example.custom', 'CustomAbility');
      client.connect(73);
      client.onConnect(new RemoteProxyModel(new RemoteStubModel()));
      client.onDisconnect();
      expect(client.want.bundleName).assertEqual('com.example.custom');
      expect(client.want.abilityName).assertEqual('CustomAbility');
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(client.proxy === undefined).assertTrue();
      expect(client.want.matches(new WantModel('com.example.custom', 'CustomAbility'))).assertTrue();
    });

    /**
     * @tc.name          configurationChangesInvalidWantStillConnects
     * @tc.desc          An invalid want does not block connect.
     * @tc.precondition  A client with empty want fields exists.
     * @tc.steps         1. A client with empty want fields exists.
     *                   2. Call connect.
     *                   3. The call returns true and the state is connecting.
     * @tc.expected      The call returns true and the state is connecting.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('configurationChangesInvalidWantStillConnects', 0, () => {
      const client = new ConnectionModel(new WantModel('', ''));
      const ok = client.connect(74);
      expect(ok).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTING);
      expect(client.connectId).assertEqual(74);
      expect(client.want.validate().length).assertEqual(2);
      expect(client.events.entries[0]).assertEqual('connect:/');
      expect(client.connectCalls).assertEqual(1);
    });

    /**
     * @tc.name          configurationChangesInvalidWantValidationAvailable
     * @tc.desc          The invalid want remains inspectable.
     * @tc.precondition  A client with a spaced ability exists.
     * @tc.steps         1. A client with a spaced ability exists.
     *                   2. Read the validation markers.
     *                   3. The spacing marker is present.
     * @tc.expected      The spacing marker is present.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('configurationChangesInvalidWantValidationAvailable', 0, () => {
      const client = new ConnectionModel(new WantModel('com.example.ipc_stub', 'Service Ability'));
      const errors = client.want.validate();
      expect(errors.length).assertEqual(1);
      expect(errors.indexOf('ability-has-space')).assertEqual(0);
      expect(client.want.abilityName).assertEqual('Service Ability');
      expect(client.want.matches(new WantModel())).assertFalse();
      expect(client.want.describe()).assertEqual('com.example.ipc_stub/Service Ability');
      expect(client.want.bundleName).assertEqual('com.example.ipc_stub');
    });

    /**
     * @tc.name          configurationChangesTwoClientsKeepOwnWants
     * @tc.desc          Each client keeps its own want.
     * @tc.precondition  Two clients with different wants exist.
     * @tc.steps         1. Two clients with different wants exist.
     *                   2. Connect both.
     *                   3. Each event names its own want.
     * @tc.expected      Each event names its own want.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('configurationChangesTwoClientsKeepOwnWants', 0, () => {
      const left = new ConnectionModel(new WantModel('com.example.left', 'LeftAbility'));
      const right = new ConnectionModel(new WantModel('com.example.right', 'RightAbility'));
      left.connect(75);
      right.connect(76);
      expect(left.events.entries[0]).assertEqual('connect:com.example.left/LeftAbility');
      expect(right.events.entries[0]).assertEqual('connect:com.example.right/RightAbility');
      expect(left.want.bundleName === right.want.bundleName).assertFalse();
      expect(left.connectId).assertEqual(75);
      expect(right.connectId).assertEqual(76);
    });

    /**
     * @tc.name          configurationChangesWantObjectNotClonedOnConnect
     * @tc.desc          connect keeps the same want instance.
     * @tc.precondition  A client with a custom want exists.
     * @tc.steps         1. A client with a custom want exists.
     *                   2. Connect and compare references.
     *                   3. The want instance is unchanged.
     * @tc.expected      The want instance is unchanged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('configurationChangesWantObjectNotClonedOnConnect', 0, () => {
      const client = new ConnectionModel();
      const want = new WantModel('com.example.identity', 'IdentityAbility');
      client.want = want;
      client.connect(91);
      expect(client.want === want).assertTrue();
      expect(client.want.bundleName).assertEqual('com.example.identity');
      expect(client.events.entries[0]).assertEqual('connect:com.example.identity/IdentityAbility');
      expect(client.want.matches(want)).assertTrue();
      expect(client.connectId).assertEqual(91);
      expect(client.want === new WantModel()).assertFalse();
    });

    /**
     * @tc.name          configurationChangesReconnectWithChangedWant
     * @tc.desc          A want changed before reconnect is used again.
     * @tc.precondition  A disconnected custom client exists.
     * @tc.steps         1. A disconnected custom client exists.
     *                   2. Replace the want and connect.
     *                   3. The new event names the new want.
     * @tc.expected      The new event names the new want.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('configurationChangesReconnectWithChangedWant', 0, () => {
      const client = new ConnectionModel();
      client.want = new WantModel('com.example.first', 'FirstAbility');
      client.connect(77);
      client.onConnect(new RemoteProxyModel(new RemoteStubModel()));
      client.onDisconnect();
      client.want = new WantModel('com.example.second', 'SecondAbility');
      client.connect(78);
      expect(client.want.bundleName).assertEqual('com.example.second');
      expect(client.events.entries[client.events.size() - 1]).assertEqual('connect:com.example.second/SecondAbility');
      expect(client.connectId).assertEqual(78);
      expect(client.events.countOf('connect')).assertEqual(2);
    });

    /**
     * @tc.name          configurationChangesDefaultWantAfterReset
     * @tc.desc          reset keeps the stored want object.
     * @tc.precondition  A custom want session was reset.
     * @tc.steps         1. A custom want session was reset.
     *                   2. Read the want fields.
     *                   3. The custom fields remain.
     * @tc.expected      The custom fields remain.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('configurationChangesDefaultWantAfterReset', 0, () => {
      const client = new ConnectionModel(new WantModel('com.example.reset', 'ResetAbility'));
      client.connect(79);
      client.onConnect(new RemoteProxyModel(new RemoteStubModel()));
      client.reset();
      expect(client.want.bundleName).assertEqual('com.example.reset');
      expect(client.want.abilityName).assertEqual('ResetAbility');
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(client.want.validate().length).assertEqual(0);
      expect(client.events.size()).assertEqual(0);
    });

    /**
     * @tc.name          configurationChangesStubReplyConfigurable
     * @tc.desc          The stub reply text is configurable.
     * @tc.precondition  A stub with a custom reply exists.
     * @tc.steps         1. A stub with a custom reply exists.
     *                   2. Send through a session over the stub.
     *                   3. The result returns the custom text.
     * @tc.expected      The result returns the custom text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('configurationChangesStubReplyConfigurable', 0, () => {
      const stub = new RemoteStubModel();
      stub.replyText = 'configured reply';
      const proxy = new RemoteProxyModel(stub);
      const client = new ConnectionModel();
      client.connect(80);
      client.onConnect(proxy);
      const result = client.sendString('config');
      expect(result.replyText).assertEqual('configured reply');
      expect(stub.replyText).assertEqual('configured reply');
      expect(proxy.stub === stub).assertTrue();
      expect(result.isSuccess()).assertTrue();
      expect(client.events.entries[client.events.size() - 1]).assertEqual('send-ok:configured reply');
    });

    /**
     * @tc.name          configurationChangesProxyDescriptorFromStub
     * @tc.desc          The proxy inherits the stub descriptor.
     * @tc.precondition  A proxy over a custom descriptor stub exists.
     * @tc.steps         1. A proxy over a custom descriptor stub exists.
     *                   2. Read the proxy descriptor.
     *                   3. It equals the stub descriptor.
     * @tc.expected      It equals the stub descriptor.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('configurationChangesProxyDescriptorFromStub', 0, () => {
      const stub = new RemoteStubModel('CustomDescriptor');
      const proxy = new RemoteProxyModel(stub);
      expect(proxy.descriptor).assertEqual('CustomDescriptor');
      expect(stub.descriptor).assertEqual('CustomDescriptor');
      expect(proxy.descriptor === STUB_DESCRIPTOR).assertFalse();
      expect(proxy.deathRegistered).assertFalse();
      expect(proxy.alive).assertTrue();
      expect(proxy.stub === stub).assertTrue();
    });

    /**
     * @tc.name          configurationChangesTargetMatchesStubConstants
     * @tc.desc          The default want matches the documented target.
     * @tc.precondition  The driver constants are loaded.
     * @tc.steps         1. The driver constants are loaded.
     *                   2. Compare the want with a constant want.
     *                   3. The match is true.
     * @tc.expected      The match is true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('configurationChangesTargetMatchesStubConstants', 0, () => {
      const want = new WantModel();
      expect(want.matches(new WantModel(TARGET_BUNDLE, TARGET_ABILITY))).assertTrue();
      expect(want.bundleName).assertEqual(TARGET_BUNDLE);
      expect(want.abilityName).assertEqual(TARGET_ABILITY);
      expect(want.describe()).assertEqual(TARGET_BUNDLE + '/' + TARGET_ABILITY);
      expect(want.validate().length).assertEqual(0);
      expect(want.matches(new WantModel(TARGET_BUNDLE, 'OtherAbility'))).assertFalse();
    });

    /**
     * @tc.name          configurationChangesClientAndTargetBundlesDiffer
     * @tc.desc          The client and target bundles are distinct.
     * @tc.precondition  The driver is loaded.
     * @tc.steps         1. The driver is loaded.
     *                   2. Compare CLIENT_BUNDLE and TARGET_BUNDLE.
     *                   3. The values differ.
     * @tc.expected      The values differ.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('configurationChangesClientAndTargetBundlesDiffer', 0, () => {
      const client = new ConnectionModel();
      client.connect(92);
      const want = client.want;
      expect(want.bundleName).assertEqual(TARGET_BUNDLE);
      expect(TARGET_BUNDLE === CLIENT_BUNDLE).assertFalse();
      expect(TARGET_BUNDLE.endsWith('stub')).assertTrue();
      expect(CLIENT_BUNDLE.startsWith('com.example')).assertTrue();
      expect(want.abilityName).assertEqual(TARGET_ABILITY);
      expect(want.matches(new WantModel(TARGET_BUNDLE, TARGET_ABILITY))).assertTrue();
    });

    /**
     * @tc.name          configurationChangesOptionDefaultsAreSync
     * @tc.desc          The default message option is synchronous.
     * @tc.precondition  A default option exists.
     * @tc.steps         1. A default option exists.
     *                   2. Read the flags and sync flag.
     *                   3. The flags are zero and the sync flag is false.
     * @tc.expected      The flags are zero and the sync flag is false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('configurationChangesOptionDefaultsAreSync', 0, () => {
      const option = new MessageOptionModel();
      expect(option.flags).assertEqual(OPTION_FLAG_SYNC);
      expect(option.flags).assertEqual(0);
      expect(option.waitTime).assertEqual(0);
      expect(option.sync).assertFalse();
      expect(option.isSync()).assertTrue();
      expect(option.isAsync()).assertFalse();
      expect(option.describe()).assertEqual('0/0/false');
    });

    /**
     * @tc.name          configurationChangesOptionDefaultWaitZero
     * @tc.desc          The default wait time is zero.
     * @tc.precondition  A default option exists.
     * @tc.steps         1. A default option exists.
     *                   2. Read the wait time.
     *                   3. The wait time is zero.
     * @tc.expected      The wait time is zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('configurationChangesOptionDefaultWaitZero', 0, () => {
      const option = new MessageOptionModel();
      expect(option.waitTime).assertEqual(0);
      expect(option.waitTime === 10).assertFalse();
      expect(option.flags).assertEqual(0);
      expect(option.describe().split('/').length).assertEqual(3);
      expect(option.describe().split('/')[1]).assertEqual('0');
      expect(option.clone().waitTime).assertEqual(0);
    });

    /**
     * @tc.name          configurationChangesOptionExplicitAsyncFlag
     * @tc.desc          An explicit async flag is preserved.
     * @tc.precondition  An async option exists.
     * @tc.steps         1. An async option exists.
     *                   2. Read the flags and the async predicate.
     *                   3. The flags are one and async is true.
     * @tc.expected      The flags are one and async is true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('configurationChangesOptionExplicitAsyncFlag', 0, () => {
      const option = new MessageOptionModel(OPTION_FLAG_ASYNC, 0, false);
      expect(option.flags).assertEqual(1);
      expect(option.flags).assertEqual(OPTION_FLAG_ASYNC);
      expect(option.isAsync()).assertTrue();
      expect(option.isSync()).assertFalse();
      expect(option.describe()).assertEqual('1/0/false');
      expect(option.clone().isAsync()).assertTrue();
    });

    /**
     * @tc.name          configurationChangesOptionExplicitWaitTime
     * @tc.desc          An explicit wait time is preserved.
     * @tc.precondition  An option with wait ten exists.
     * @tc.steps         1. An option with wait ten exists.
     *                   2. Read the wait time.
     *                   3. The wait time equals ten.
     * @tc.expected      The wait time equals ten.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('configurationChangesOptionExplicitWaitTime', 0, () => {
      const option = new MessageOptionModel(OPTION_FLAG_SYNC, 10, false);
      expect(option.waitTime).assertEqual(10);
      expect(option.flags).assertEqual(0);
      expect(option.isSync()).assertTrue();
      expect(option.describe()).assertEqual('0/10/false');
      expect(option.clone().waitTime).assertEqual(10);
      expect(option.clone().describe()).assertEqual(option.describe());
    });

    /**
     * @tc.name          configurationChangesOptionSyncConstructedWithSync
     * @tc.desc          A sync option reports synchronous.
     * @tc.precondition  An option with sync true exists.
     * @tc.steps         1. An option with sync true exists.
     *                   2. Read both predicates.
     *                   3. Sync is true and async is false.
     * @tc.expected      Sync is true and async is false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('configurationChangesOptionSyncConstructedWithSync', 0, () => {
      const option = new MessageOptionModel(OPTION_FLAG_ASYNC, 3, true);
      expect(option.sync).assertTrue();
      expect(option.isSync()).assertTrue();
      expect(option.isAsync()).assertFalse();
      expect(option.flags).assertEqual(1);
      expect(option.waitTime).assertEqual(3);
      expect(option.describe()).assertEqual('1/3/true');
    });

    /**
     * @tc.name          configurationChangesOptionCloneCopiesFields
     * @tc.desc          The clone copies every field.
     * @tc.precondition  An option with explicit values exists.
     * @tc.steps         1. An option with explicit values exists.
     *                   2. Clone and compare the fields.
     *                   3. Flags, wait time and sync agree.
     * @tc.expected      Flags, wait time and sync agree.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('configurationChangesOptionCloneCopiesFields', 0, () => {
      const option = new MessageOptionModel(OPTION_FLAG_ASYNC, 4, false);
      const clone = option.clone();
      expect(clone.flags).assertEqual(option.flags);
      expect(clone.waitTime).assertEqual(option.waitTime);
      expect(clone.sync).assertEqual(option.sync);
      expect(clone.describe()).assertEqual(option.describe());
      expect(clone === option).assertFalse();
      expect(clone.isAsync()).assertEqual(option.isAsync());
    });

    /**
     * @tc.name          configurationChangesOptionCloneIndependent
     * @tc.desc          The clone changes do not affect the source.
     * @tc.precondition  An option and its clone exist.
     * @tc.steps         1. An option and its clone exist.
     *                   2. Change the clone flags.
     *                   3. The source flags are unchanged.
     * @tc.expected      The source flags are unchanged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('configurationChangesOptionCloneIndependent', 0, () => {
      const option = new MessageOptionModel(OPTION_FLAG_ASYNC, 4, false);
      const clone = option.clone();
      clone.waitTime = 12;
      clone.flags = OPTION_FLAG_SYNC;
      expect(option.waitTime).assertEqual(4);
      expect(option.flags).assertEqual(1);
      expect(clone.waitTime).assertEqual(12);
      expect(clone.flags).assertEqual(0);
      expect(option.describe()).assertEqual('1/4/false');
      expect(clone.describe()).assertEqual('0/12/false');
    });

    /**
     * @tc.name          configurationChangesOptionDescribeFormat
     * @tc.desc          The description uses slash separated fields.
     * @tc.precondition  An option with explicit values exists.
     * @tc.steps         1. An option with explicit values exists.
     *                   2. Call describe.
     *                   3. The text is flags slash wait slash sync.
     * @tc.expected      The text is flags slash wait slash sync.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('configurationChangesOptionDescribeFormat', 0, () => {
      const option = new MessageOptionModel(OPTION_FLAG_ASYNC, 7, false);
      expect(option.describe()).assertEqual('1/7/false');
      expect(option.describe().split('/')[0]).assertEqual('1');
      expect(option.describe().split('/')[1]).assertEqual('7');
      expect(option.describe().split('/')[2]).assertEqual('false');
      expect(option.describe()).assertEqual(option.clone().describe());
      expect(option.describe().length).assertEqual(9);
    });

    /**
     * @tc.name          configurationChangesOptionZeroSyncDescribe
     * @tc.desc          The synchronous description reports false sync.
     * @tc.precondition  A default option exists.
     * @tc.steps         1. A default option exists.
     *                   2. Call describe.
     *                   3. The text is zero slash zero slash false.
     * @tc.expected      The text is zero slash zero slash false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('configurationChangesOptionZeroSyncDescribe', 0, () => {
      const option = new MessageOptionModel(0, 0, false);
      expect(option.describe()).assertEqual('0/0/false');
      expect(option.describe().indexOf('false') > 0).assertTrue();
      expect(option.isSync()).assertTrue();
      expect(option.sync).assertFalse();
      expect(option.flags).assertEqual(0);
      expect(option.waitTime).assertEqual(0);
      expect(option.isAsync()).assertFalse();
    });

    /**
     * @tc.name          configurationChangesOptionFlagsConstantSync
     * @tc.desc          The sync flag constant is zero.
     * @tc.precondition  The driver is loaded.
     * @tc.steps         1. The driver is loaded.
     *                   2. Compare OPTION_FLAG_SYNC with a default option flag.
     *                   3. The values are equal.
     * @tc.expected      The values are equal.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('configurationChangesOptionFlagsConstantSync', 0, () => {
      expect(OPTION_FLAG_SYNC).assertEqual(0);
      const option = new MessageOptionModel();
      expect(option.flags).assertEqual(OPTION_FLAG_SYNC);
      expect(option.isSync()).assertTrue();
      expect(option.flags === OPTION_FLAG_ASYNC).assertFalse();
      expect(option.describe().indexOf('0/') === 0).assertTrue();
      expect(option.clone().flags).assertEqual(OPTION_FLAG_SYNC);
    });

    /**
     * @tc.name          configurationChangesOptionFlagsConstantAsync
     * @tc.desc          The async flag constant is one.
     * @tc.precondition  The driver is loaded.
     * @tc.steps         1. The driver is loaded.
     *                   2. Compare OPTION_FLAG_ASYNC with one.
     *                   3. The value equals one.
     * @tc.expected      The value equals one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('configurationChangesOptionFlagsConstantAsync', 0, () => {
      expect(OPTION_FLAG_ASYNC).assertEqual(1);
      const option = new MessageOptionModel(OPTION_FLAG_ASYNC, 0, false);
      expect(option.flags).assertEqual(1);
      expect(option.isAsync()).assertTrue();
      expect(option.flags === OPTION_FLAG_SYNC).assertFalse();
      expect(option.describe().indexOf('1/') === 0).assertTrue();
      expect(option.clone().flags).assertEqual(OPTION_FLAG_ASYNC);
    });

    /**
     * @tc.name          configurationChangesOptionSendWithAsyncOption
     * @tc.desc          An async option is accepted by the connection.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. A connected session exists.
     *                   2. Build an async option and send a request.
     *                   3. The request succeeds.
     * @tc.expected      The request succeeds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('configurationChangesOptionSendWithAsyncOption', 0, () => {
      const session = createConnectedSession();
      const option = new MessageOptionModel(OPTION_FLAG_ASYNC, 0, false);
      const result = session.sendString('async-option');
      expect(option.isAsync()).assertTrue();
      expect(option.flags).assertEqual(1);
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.replyText).assertEqual('hello rpc');
      expect(session.isConnected()).assertTrue();
      expect(session.events.countOf('send-ok')).assertEqual(1);
    });

    /**
     * @tc.name          configurationChangesSnapshotAfterCustomConnect
     * @tc.desc          The snapshot reflects a custom-id session.
     * @tc.precondition  A custom want client connected with id fifty.
     * @tc.steps         1. A custom want client connected with id fifty.
     *                   2. Build a ClientSnapshot.
     *                   3. The state is connected and the id is fifty.
     * @tc.expected      The state is connected and the id is fifty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('configurationChangesSnapshotAfterCustomConnect', 0, () => {
      const client = new ConnectionModel(new WantModel('com.example.fifty', 'FiftyAbility'));
      client.connect(50);
      client.onConnect(new RemoteProxyModel(new RemoteStubModel()));
      const snapshot = new ClientSnapshot(client);
      expect(snapshot.state).assertEqual(STATE_CONNECTED);
      expect(snapshot.connectId).assertEqual(50);
      expect(snapshot.hasProxy).assertTrue();
      expect(snapshot.deathRegistered).assertTrue();
      expect(snapshot.toastCount).assertEqual(1);
      expect(client.want.bundleName).assertEqual('com.example.fifty');
    });

    /**
     * @tc.name          configurationChangesSnapshotAfterWantChange
     * @tc.desc          Changing the want does not change the snapshot state.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. A connected session exists.
     *                   2. Replace the want and rebuild the snapshot.
     *                   3. The snapshot state is still connected.
     * @tc.expected      The snapshot state is still connected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('configurationChangesSnapshotAfterWantChange', 0, () => {
      const session = createConnectedSession();
      const before = new ClientSnapshot(session);
      session.want = new WantModel('com.example.changed', 'ChangedAbility');
      const after = new ClientSnapshot(session);
      expect(before.sameAs(after)).assertTrue();
      expect(before.state).assertEqual(STATE_CONNECTED);
      expect(session.want.bundleName).assertEqual('com.example.changed');
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.isConnected()).assertTrue();
      expect(after.connectId).assertEqual(before.connectId);
    });

    /**
     * @tc.name          configurationChangesWantChangeDoesNotAffectProxy
     * @tc.desc          The proxy remains attached across a want change.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. A connected session exists.
     *                   2. Replace the want and inspect the proxy.
     *                   3. The proxy is still stored and alive.
     * @tc.expected      The proxy is still stored and alive.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('configurationChangesWantChangeDoesNotAffectProxy', 0, () => {
      const session = createConnectedSession();
      const proxy = session.proxy as RemoteProxyModel;
      session.want = new WantModel('com.example.swapped', 'SwappedAbility');
      expect(session.proxy === proxy).assertTrue();
      expect(proxy.isAlive()).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      expect(session.isConnected()).assertTrue();
      expect(proxy.requests.length).assertEqual(0);
      expect(session.want.abilityName).assertEqual('SwappedAbility');
    });

    /**
     * @tc.name          configurationChangesConfigChangeAfterDisconnect
     * @tc.desc          A want change after disconnect is stored.
     * @tc.precondition  A disconnected session exists.
     * @tc.steps         1. A disconnected session exists.
     *                   2. Replace the want and read it.
     *                   3. The new want is stored.
     * @tc.expected      The new want is stored.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('configurationChangesConfigChangeAfterDisconnect', 0, () => {
      const session = createConnectedSession();
      session.onDisconnect();
      session.want = new WantModel('com.example.after', 'AfterAbility');
      expect(session.want.bundleName).assertEqual('com.example.after');
      expect(session.want.abilityName).assertEqual('AfterAbility');
      expect(session.state).assertEqual(STATE_DISCONNECTED);
      expect(session.proxy === undefined).assertTrue();
      expect(session.want.validate().length).assertEqual(0);
      expect(session.connectId).assertEqual(INITIAL_CONNECT_ID);
    });

    /**
     * @tc.name          configurationChangesConfigChangeBeforeConnect
     * @tc.desc          A want change before connect is used.
     * @tc.precondition  A fresh client exists.
     * @tc.steps         1. A fresh client exists.
     *                   2. Replace the want then connect.
     *                   3. The event names the new want.
     * @tc.expected      The event names the new want.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('configurationChangesConfigChangeBeforeConnect', 0, () => {
      const client = new ConnectionModel();
      client.want = new WantModel('com.example.before', 'BeforeAbility');
      const ok = client.connect(81);
      expect(ok).assertTrue();
      expect(client.events.entries[0]).assertEqual('connect:com.example.before/BeforeAbility');
      expect(client.want.bundleName).assertEqual('com.example.before');
      expect(client.state).assertEqual(STATE_CONNECTING);
      expect(client.connectCalls).assertEqual(1);
    });

    /**
     * @tc.name          configurationChangesWantValidationAfterChange
     * @tc.desc          The new want can be validated independently.
     * @tc.precondition  A replacement want with a spaced bundle exists.
     * @tc.steps         1. A replacement want with a spaced bundle exists.
     *                   2. Validate the stored want.
     *                   3. The spacing marker is present.
     * @tc.expected      The spacing marker is present.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('configurationChangesWantValidationAfterChange', 0, () => {
      const client = new ConnectionModel();
      client.want = new WantModel('com.example ipc', 'ServiceAbility');
      const errors = client.want.validate();
      expect(errors.length).assertEqual(1);
      expect(errors.indexOf('bundle-has-space')).assertEqual(0);
      expect(client.want.matches(new WantModel())).assertFalse();
      expect(client.want.describe()).assertEqual('com.example ipc/ServiceAbility');
      expect(client.want.abilityName).assertEqual('ServiceAbility');
    });

    /**
     * @tc.name          configurationChangesSameTargetDifferentInstance
     * @tc.desc          Equal wants are distinct object instances.
     * @tc.precondition  Two equal wants exist.
     * @tc.steps         1. Two equal wants exist.
     *                   2. Compare identity and equality.
     *                   3. The references differ and the match is true.
     * @tc.expected      The references differ and the match is true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('configurationChangesSameTargetDifferentInstance', 0, () => {
      const left = new WantModel('com.example.same', 'SameAbility');
      const right = new WantModel('com.example.same', 'SameAbility');
      expect(left === right).assertFalse();
      expect(left.matches(right)).assertTrue();
      expect(right.matches(left)).assertTrue();
      expect(left.describe()).assertEqual(right.describe());
      expect(left.bundleName === right.bundleName).assertTrue();
      expect(left.abilityName === right.abilityName).assertTrue();
    });

    /**
     * @tc.name          configurationChangesCustomDescriptorStubRoundTrip
     * @tc.desc          A stub with a custom descriptor keeps it.
     * @tc.precondition  A custom descriptor stub exists.
     * @tc.steps         1. A custom descriptor stub exists.
     *                   2. Read the descriptor and the reply text.
     *                   3. Both custom values are stored.
     * @tc.expected      Both custom values are stored.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('configurationChangesCustomDescriptorStubRoundTrip', 0, () => {
      const stub = new RemoteStubModel('RoundTrip');
      stub.replyText = 'round trip reply';
      const proxy = new RemoteProxyModel(stub);
      const client = new ConnectionModel();
      client.connect(82);
      client.onConnect(proxy);
      const result = client.sendString('round');
      expect(proxy.descriptor).assertEqual('RoundTrip');
      expect(stub.descriptor).assertEqual('RoundTrip');
      expect(result.replyText).assertEqual('round trip reply');
      expect(stub.receivedTexts[0]).assertEqual('round');
      expect(client.isConnected()).assertTrue();
    });

    /**
     * @tc.name          configurationChangesDefaultDescriptorOnNewProxy
     * @tc.desc          A new proxy defaults to the stub descriptor.
     * @tc.precondition  A fresh proxy exists.
     * @tc.steps         1. A fresh proxy exists.
     *                   2. Read the descriptor.
     *                   3. It equals IPCStubTest.
     * @tc.expected      It equals IPCStubTest.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('configurationChangesDefaultDescriptorOnNewProxy', 0, () => {
      const proxy = new RemoteProxyModel();
      expect(proxy.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(proxy.stub.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(proxy.stub.replyText).assertEqual('hello rpc');
      expect(proxy.alive).assertTrue();
      expect(proxy.requests.length).assertEqual(0);
      expect(proxy.deathRegistered).assertFalse();
    });

    /**
     * @tc.name          configurationChangesCustomAbilityWantConnects
     * @tc.desc          A custom ability name connects normally.
     * @tc.precondition  A want with a custom ability exists.
     * @tc.steps         1. A want with a custom ability exists.
     *                   2. Connect and attach a proxy.
     *                   3. The client is connected.
     * @tc.expected      The client is connected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('configurationChangesCustomAbilityWantConnects', 0, () => {
      const client = new ConnectionModel(new WantModel(TARGET_BUNDLE, 'AlternateAbility'));
      const ok = client.connect(83);
      client.onConnect(new RemoteProxyModel(new RemoteStubModel()));
      expect(ok).assertTrue();
      expect(client.want.abilityName).assertEqual('AlternateAbility');
      expect(client.want.matches(new WantModel())).assertFalse();
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.connectId).assertEqual(83);
      expect(client.isConnected()).assertTrue();
    });

    /**
     * @tc.name          configurationChangesConfigurationStableAcrossCycle
     * @tc.desc          The configuration is stable after a full cycle.
     * @tc.precondition  A custom want client connects and disconnects.
     * @tc.steps         1. A custom want client connects and disconnects.
     *                   2. Read the want fields at the end.
     *                   3. They match the configured values.
     * @tc.expected      They match the configured values.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('configurationChangesConfigurationStableAcrossCycle', 0, () => {
      const client = new ConnectionModel(new WantModel('com.example.cycle', 'CycleAbility'));
      client.connect(84);
      client.onConnect(new RemoteProxyModel(new RemoteStubModel()));
      client.sendString('cycle');
      client.onDisconnect();
      expect(client.want.bundleName).assertEqual('com.example.cycle');
      expect(client.want.abilityName).assertEqual('CycleAbility');
      expect(client.want.validate().length).assertEqual(0);
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.events.countOf('send-ok')).assertEqual(1);
      expect(client.toasts.length).assertEqual(3);
    });

    /**
     * @tc.name          configurationChangesOptionConfigDoesNotAffectClient
     * @tc.desc          Replacing the option does not change the client state.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. A connected session exists.
     *                   2. Build a new option and read the session state.
     *                   3. The state is still connected.
     * @tc.expected      The state is still connected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('configurationChangesOptionConfigDoesNotAffectClient', 0, () => {
      const session = createConnectedSession();
      const before = new ClientSnapshot(session);
      const option = new MessageOptionModel(OPTION_FLAG_ASYNC, 2, false);
      expect(option.isAsync()).assertTrue();
      expect(option.waitTime).assertEqual(2);
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(before.sameAs(new ClientSnapshot(session))).assertTrue();
      expect(session.isConnected()).assertTrue();
      expect(session.want.validate().length).assertEqual(0);
    });

    /**
     * @tc.name          configurationChangesWantDescribeEmptyAbility
     * @tc.desc          An empty ability still yields a description.
     * @tc.precondition  A want with an empty ability exists.
     * @tc.steps         1. A want with an empty ability exists.
     *                   2. Call describe.
     *                   3. The text is bundle slash with an empty tail.
     * @tc.expected      The text is bundle slash with an empty tail.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('configurationChangesWantDescribeEmptyAbility', 0, () => {
      const want = new WantModel('com.example.ipc_stub', '');
      expect(want.describe()).assertEqual('com.example.ipc_stub/');
      expect(want.describe().endsWith('/')).assertTrue();
      expect(want.validate().length).assertEqual(1);
      expect(want.validate().indexOf('ability-empty')).assertEqual(0);
      expect(want.matches(new WantModel())).assertFalse();
      expect(want.abilityName).assertEqual('');
    });

    /**
     * @tc.name          configurationChangesWantMatchesSelf
     * @tc.desc          A want matches itself.
     * @tc.precondition  A custom want exists.
     * @tc.steps         1. A custom want exists.
     *                   2. Call matches with itself.
     *                   3. The result is true.
     * @tc.expected      The result is true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('configurationChangesWantMatchesSelf', 0, () => {
      const want = new WantModel('com.example.self', 'SelfAbility');
      expect(want.matches(want)).assertTrue();
      expect(want.matches(new WantModel('com.example.self', 'SelfAbility'))).assertTrue();
      expect(want.validate().length).assertEqual(0);
      expect(want.describe()).assertEqual('com.example.self/SelfAbility');
      expect(want.bundleName).assertEqual('com.example.self');
      expect(want.matches(new WantModel('com.example.self', 'OtherAbility'))).assertFalse();
    });

    /**
     * @tc.name          configurationChangesClientWantDefaultAfterConstruction
     * @tc.desc          A new client starts with the default want.
     * @tc.precondition  A fresh client exists.
     * @tc.steps         1. A fresh client exists.
     *                   2. Read the want fields.
     *                   3. They match the target constants.
     * @tc.expected      They match the target constants.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('configurationChangesClientWantDefaultAfterConstruction', 0, () => {
      const client = new ConnectionModel();
      expect(client.want.bundleName).assertEqual(TARGET_BUNDLE);
      expect(client.want.abilityName).assertEqual(TARGET_ABILITY);
      expect(client.want.validate().length).assertEqual(0);
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.want.describe()).assertEqual('com.example.ipc_stub/ServiceAbility');
    });

    /**
     * @tc.name          configurationChangesProxyDescriptorAfterReconnect
     * @tc.desc          The replacement proxy keeps the configured descriptor.
     * @tc.precondition  A client reconnected over a custom stub.
     * @tc.steps         1. A client reconnected over a custom stub.
     *                   2. Read the proxy descriptor.
     *                   3. It equals the custom descriptor.
     * @tc.expected      It equals the custom descriptor.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('configurationChangesProxyDescriptorAfterReconnect', 0, () => {
      const session = createConnectedSession();
      session.onDisconnect();
      const stub = new RemoteStubModel('ReconnectedDescriptor');
      const proxy = new RemoteProxyModel(stub);
      session.connect(85);
      session.onConnect(proxy);
      expect(proxy.descriptor).assertEqual('ReconnectedDescriptor');
      expect(session.proxy === proxy).assertTrue();
      expect(stub.descriptor).assertEqual('ReconnectedDescriptor');
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.connectId).assertEqual(85);
      expect(proxy.deathRegistered).assertTrue();
    });

    /**
     * @tc.name          configurationChangesOptionLargeWaitTime
     * @tc.desc          A large wait time is preserved.
     * @tc.precondition  An option with wait ninety nine exists.
     * @tc.steps         1. An option with wait ninety nine exists.
     *                   2. Read the wait time and description.
     *                   3. Both report ninety nine.
     * @tc.expected      Both report ninety nine.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('configurationChangesOptionLargeWaitTime', 0, () => {
      const option = new MessageOptionModel(OPTION_FLAG_SYNC, 99, false);
      expect(option.waitTime).assertEqual(99);
      expect(option.waitTime > 10).assertTrue();
      expect(option.describe()).assertEqual('0/99/false');
      expect(option.describe().split('/')[1]).assertEqual('99');
      expect(option.clone().waitTime).assertEqual(99);
      expect(option.isSync()).assertTrue();
    });

    /**
     * @tc.name          configurationChangesWantValidationOrderStable
     * @tc.desc          The validation markers keep a stable order.
     * @tc.precondition  A want with two problems exists.
     * @tc.steps         1. A want with two problems exists.
     *                   2. Validate twice and compare the lists.
     *                   3. Both lists are identical.
     * @tc.expected      Both lists are identical.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('configurationChangesWantValidationOrderStable', 0, () => {
      const want = new WantModel('', '');
      const first = want.validate();
      const second = want.validate();
      expect(first.length).assertEqual(2);
      expect(second.length).assertEqual(2);
      expect(first[0]).assertEqual(second[0]);
      expect(first[1]).assertEqual(second[1]);
      expect(first.indexOf('bundle-empty')).assertEqual(0);
      expect(first.indexOf('ability-empty')).assertEqual(1);
    });

    /**
     * @tc.name          configurationChangesTwoSessionsDifferentReplies
     * @tc.desc          Two sessions keep their own stub replies.
     * @tc.precondition  Two connected sessions with different stub texts exist.
     * @tc.steps         1. Two connected sessions with different stub texts exist.
     *                   2. Send in both.
     *                   3. Each result returns its own text.
     * @tc.expected      Each result returns its own text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('configurationChangesTwoSessionsDifferentReplies', 0, () => {
      const leftStub = new RemoteStubModel();
      leftStub.replyText = 'left reply';
      const rightStub = new RemoteStubModel();
      rightStub.replyText = 'right reply';
      const left = new ConnectionModel();
      left.connect(86);
      left.onConnect(new RemoteProxyModel(leftStub));
      const right = new ConnectionModel();
      right.connect(87);
      right.onConnect(new RemoteProxyModel(rightStub));
      expect(left.sendString('a').replyText).assertEqual('left reply');
      expect(right.sendString('b').replyText).assertEqual('right reply');
      expect(leftStub.receivedTexts[0]).assertEqual('a');
      expect(rightStub.receivedTexts[0]).assertEqual('b');
    });

    /**
     * @tc.name          configurationChangesConfigResetKeepsDescriptor
     * @tc.desc          The reset client keeps its want configuration.
     * @tc.precondition  A custom want client was reset.
     * @tc.steps         1. A custom want client was reset.
     *                   2. Read the want and the state.
     *                   3. The custom fields remain and the state is disconnected.
     * @tc.expected      The custom fields remain and the state is disconnected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('configurationChangesConfigResetKeepsDescriptor', 0, () => {
      const client = new ConnectionModel(new WantModel('com.example.keep', 'KeepAbility'));
      client.connect(88);
      client.onConnect(new RemoteProxyModel(new RemoteStubModel()));
      client.reset();
      expect(client.want.bundleName).assertEqual('com.example.keep');
      expect(client.want.abilityName).assertEqual('KeepAbility');
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.proxy === undefined).assertTrue();
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(client.events.size()).assertEqual(0);
    });

    /**
     * @tc.name          configurationChangesSnapshotDescribeAfterCustomCycle
     * @tc.desc          The snapshot description reflects the custom cycle.
     * @tc.precondition  A custom want session completed a cycle.
     * @tc.steps         1. A custom want session completed a cycle.
     *                   2. Build a ClientSnapshot.
     *                   3. The description starts with disconnected and ends with the toast count.
     * @tc.expected      The description starts with disconnected and ends with the toast count.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('configurationChangesSnapshotDescribeAfterCustomCycle', 0, () => {
      const client = new ConnectionModel(new WantModel('com.example.cycle2', 'CycleTwo'));
      client.connect(89);
      client.onConnect(new RemoteProxyModel(new RemoteStubModel()));
      client.sendString('cycle');
      client.onDisconnect();
      const snapshot = new ClientSnapshot(client);
      expect(snapshot.state).assertEqual(STATE_DISCONNECTED);
      expect(snapshot.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(snapshot.hasProxy).assertFalse();
      expect(snapshot.toastCount).assertEqual(3);
      expect(snapshot.describe().indexOf('disconnected') === 0).assertTrue();
      expect(snapshot.describe().endsWith('/3')).assertTrue();
      expect(client.want.bundleName).assertEqual('com.example.cycle2');
    });

    /**
     * @tc.name          configurationChangesWantAfterDisconnectReconnect
     * @tc.desc          A replaced want is used by the next reconnect.
     * @tc.precondition  A disconnected client exists.
     * @tc.steps         1. A disconnected client exists.
     *                   2. Replace the want, connect and attach a proxy.
     *                   3. The session is connected under the new want.
     * @tc.expected      The session is connected under the new want.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('configurationChangesWantAfterDisconnectReconnect', 0, () => {
      const client = new ConnectionModel();
      client.connect(90);
      client.onConnect(new RemoteProxyModel(new RemoteStubModel()));
      client.onDisconnect();
      client.want = new WantModel('com.example.again', 'AgainAbility');
      const ok = client.connect(91);
      const proxy = new RemoteProxyModel(new RemoteStubModel());
      client.onConnect(proxy);
      expect(ok).assertTrue();
      expect(client.want.bundleName).assertEqual('com.example.again');
      expect(client.events.entries[client.events.size() - 3]).assertEqual('connect:com.example.again/AgainAbility');
      expect(client.connectId).assertEqual(91);
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.isConnected()).assertTrue();
    });

    /**
     * @tc.name          configurationChangesOptionDescribeCloneAfterMutation
     * @tc.desc          The cloned description tracks clone mutations.
     * @tc.precondition  An option and its clone exist.
     * @tc.steps         1. An option and its clone exist.
     *                   2. Change the clone wait time and describe both.
     *                   3. The descriptions differ only by the wait time.
     * @tc.expected      The descriptions differ only by the wait time.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('configurationChangesOptionDescribeCloneAfterMutation', 0, () => {
      const option = new MessageOptionModel(OPTION_FLAG_SYNC, 1, false);
      const clone = option.clone();
      clone.waitTime = 8;
      expect(option.describe()).assertEqual('0/1/false');
      expect(clone.describe()).assertEqual('0/8/false');
      expect(option.describe() === clone.describe()).assertFalse();
      expect(option.waitTime).assertEqual(1);
      expect(clone.waitTime).assertEqual(8);
      expect(option.flags).assertEqual(clone.flags);
    });

    /**
     * @tc.name          configurationChangesWantBundleCaseSensitivity
     * @tc.desc          Want matching is case sensitive.
     * @tc.precondition  Two wants differ by letter case.
     * @tc.steps         1. Two wants differ by letter case.
     *                   2. Compare them.
     *                   3. The match is false and the descriptions differ.
     * @tc.expected      The match is false and the descriptions differ.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('configurationChangesWantBundleCaseSensitivity', 0, () => {
      const lower = new WantModel('com.example.stub', 'ServiceAbility');
      const upper = new WantModel('com.example.STUB', 'ServiceAbility');
      expect(lower.matches(upper)).assertFalse();
      expect(upper.matches(lower)).assertFalse();
      expect(lower.bundleName === upper.bundleName).assertFalse();
      expect(lower.abilityName).assertEqual(upper.abilityName);
      expect(lower.describe() === upper.describe()).assertFalse();
      expect(lower.validate().length).assertEqual(0);
    });

  });
}
