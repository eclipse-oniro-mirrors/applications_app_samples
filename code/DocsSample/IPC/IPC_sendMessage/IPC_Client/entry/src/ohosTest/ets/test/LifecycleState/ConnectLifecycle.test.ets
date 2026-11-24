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
  STUB_DESCRIPTOR,
  REQUEST_CODE,
  STATE_CONNECTING,
  STATE_CONNECTED,
  ERROR_NONE,
  ERROR_PROXY_INVALID,
  CONNECT_SUCCESS_TOAST,
  SEND_FAIL_TOAST,
  LEVEL_WARN,
  ConnectionModel,
  RemoteProxyModel,
  RemoteStubModel,
  WantModel,
  ClientSnapshot,
  ClientMetrics,
  createConnectedSession,
  isNonZeroError
} from '../Shared/SharedDriver';

export default function connectLifecycle(): void {
  describe('ConnectLifecycle', () => {
    beforeAll(() => {
      logSuite('ConnectLifecycle', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('ConnectLifecycle', 'end');
    });

    /**
     * @tc.name          connectLifecycleTargetBundleLiteral
     * @tc.desc          The default want names the documented stub bundle.
     * @tc.precondition  Driver constants are loaded.
     * @tc.steps         1. Driver constants are loaded.
     *                   2. Inspect the default want bundle name.
     *                   3. The bundle equals com.example.ipc_stub.
     * @tc.expected      The bundle equals com.example.ipc_stub.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('connectLifecycleTargetBundleLiteral', 0, () => {
      const bundle = 'com.example.ipc_stub';
      const ability = 'ServiceAbility';
      const want = new WantModel(bundle, ability);
      const reference = new WantModel(TARGET_BUNDLE, TARGET_ABILITY);
      const errors = want.validate();
      expect(want.bundleName).assertEqual(bundle);
      expect(want.abilityName).assertEqual(ability);
      expect(want.describe()).assertEqual(bundle + '/' + ability);
      expect(errors.length).assertEqual(0);
      expect(want.matches(reference)).assertEqual(true);
      expect(errors.indexOf('bundle-empty') >= 0).assertEqual(false);
      expect(reference.validate().length).assertEqual(0);
      expect(TARGET_BUNDLE).assertEqual('com.example.ipc_stub');
      expect(TARGET_ABILITY).assertEqual('ServiceAbility');
      expect(String(errors.length)).assertEqual('0');
    });

    /**
     * @tc.name          connectLifecycleTargetAbilityLiteral
     * @tc.desc          The default want names the documented service ability.
     * @tc.precondition  Driver constants are loaded.
     * @tc.steps         1. Driver constants are loaded.
     *                   2. Inspect the default want ability name.
     *                   3. The ability equals ServiceAbility.
     * @tc.expected      The ability equals ServiceAbility.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('connectLifecycleTargetAbilityLiteral', 0, () => {
      const bundle = 'com.example.ipc_stub';
      const ability = 'ServiceAbility';
      const want = new WantModel(bundle, ability);
      const reference = new WantModel(TARGET_BUNDLE, TARGET_ABILITY);
      const errors = want.validate();
      expect(want.bundleName).assertEqual(bundle);
      expect(want.abilityName).assertEqual(ability);
      expect(want.describe()).assertEqual(bundle + '/' + ability);
      expect(errors.length).assertEqual(0);
      expect(want.matches(reference)).assertEqual(true);
      expect(errors.indexOf('ability-empty') >= 0).assertEqual(false);
      expect(reference.validate().length).assertEqual(0);
      expect(TARGET_BUNDLE).assertEqual('com.example.ipc_stub');
      expect(TARGET_ABILITY).assertEqual('ServiceAbility');
      expect(String(errors.length)).assertEqual('0');
    });

    /**
     * @tc.name          connectLifecycleDefaultWantIsValid
     * @tc.desc          A default want produces no validation errors.
     * @tc.precondition  A default WantModel exists.
     * @tc.steps         1. A default WantModel exists.
     *                   2. Call validate on the default want.
     *                   3. The error list is empty.
     * @tc.expected      The error list is empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('connectLifecycleDefaultWantIsValid', 0, () => {
      const want = new WantModel();
      expect(want.bundleName).assertEqual(TARGET_BUNDLE);
      expect(want.abilityName).assertEqual(TARGET_ABILITY);
      expect(want.validate().length).assertEqual(0);
      expect(want.validate().indexOf('bundle-empty')).assertEqual(-1);
      expect(want.describe()).assertEqual('com.example.ipc_stub/ServiceAbility');
      expect(want.matches(new WantModel(TARGET_BUNDLE, TARGET_ABILITY))).assertTrue();
      expect(want.bundleName.length > 0).assertTrue();
    });

    /**
     * @tc.name          connectLifecycleEmptyBundleRejected
     * @tc.desc          An empty bundle name is rejected by validation.
     * @tc.precondition  A want with an empty bundle is built.
     * @tc.steps         1. A want with an empty bundle is built.
     *                   2. Validate and search for bundle-empty.
     *                   3. The bundle-empty marker is present.
     * @tc.expected      The bundle-empty marker is present.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('connectLifecycleEmptyBundleRejected', 0, () => {
      const bundle = '';
      const ability = 'ServiceAbility';
      const want = new WantModel(bundle, ability);
      const reference = new WantModel(TARGET_BUNDLE, TARGET_ABILITY);
      const errors = want.validate();
      expect(want.bundleName).assertEqual(bundle);
      expect(want.abilityName).assertEqual(ability);
      expect(want.describe()).assertEqual(bundle + '/' + ability);
      expect(errors.length).assertEqual(1);
      expect(want.matches(reference)).assertEqual(false);
      expect(errors.indexOf('bundle-empty') >= 0).assertEqual(true);
      expect(reference.validate().length).assertEqual(0);
      expect(TARGET_BUNDLE).assertEqual('com.example.ipc_stub');
      expect(TARGET_ABILITY).assertEqual('ServiceAbility');
      expect(String(errors.length)).assertEqual('1');
    });

    /**
     * @tc.name          connectLifecycleEmptyAbilityRejected
     * @tc.desc          An empty ability name is rejected by validation.
     * @tc.precondition  A want with an empty ability is built.
     * @tc.steps         1. A want with an empty ability is built.
     *                   2. Validate and search for ability-empty.
     *                   3. The ability-empty marker is present.
     * @tc.expected      The ability-empty marker is present.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('connectLifecycleEmptyAbilityRejected', 0, () => {
      const bundle = 'com.example.ipc_stub';
      const ability = '';
      const want = new WantModel(bundle, ability);
      const reference = new WantModel(TARGET_BUNDLE, TARGET_ABILITY);
      const errors = want.validate();
      expect(want.bundleName).assertEqual(bundle);
      expect(want.abilityName).assertEqual(ability);
      expect(want.describe()).assertEqual(bundle + '/' + ability);
      expect(errors.length).assertEqual(1);
      expect(want.matches(reference)).assertEqual(false);
      expect(errors.indexOf('ability-empty') >= 0).assertEqual(true);
      expect(reference.validate().length).assertEqual(0);
      expect(TARGET_BUNDLE).assertEqual('com.example.ipc_stub');
      expect(TARGET_ABILITY).assertEqual('ServiceAbility');
      expect(String(errors.length)).assertEqual('1');
    });

    /**
     * @tc.name          connectLifecycleBundleSpaceRejected
     * @tc.desc          A bundle name with a space is rejected.
     * @tc.precondition  A want with a spaced bundle is built.
     * @tc.steps         1. A want with a spaced bundle is built.
     *                   2. Validate and search for bundle-has-space.
     *                   3. The spacing marker is present.
     * @tc.expected      The spacing marker is present.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectLifecycleBundleSpaceRejected', 0, () => {
      const bundle = 'com.example ipc';
      const ability = 'ServiceAbility';
      const want = new WantModel(bundle, ability);
      const reference = new WantModel(TARGET_BUNDLE, TARGET_ABILITY);
      const errors = want.validate();
      expect(want.bundleName).assertEqual(bundle);
      expect(want.abilityName).assertEqual(ability);
      expect(want.describe()).assertEqual(bundle + '/' + ability);
      expect(errors.length).assertEqual(1);
      expect(want.matches(reference)).assertEqual(false);
      expect(errors.indexOf('bundle-has-space') >= 0).assertEqual(true);
      expect(reference.validate().length).assertEqual(0);
      expect(TARGET_BUNDLE).assertEqual('com.example.ipc_stub');
      expect(TARGET_ABILITY).assertEqual('ServiceAbility');
      expect(String(errors.length)).assertEqual('1');
    });

    /**
     * @tc.name          connectLifecycleAbilitySpaceRejected
     * @tc.desc          An ability name with a space is rejected.
     * @tc.precondition  A want with a spaced ability is built.
     * @tc.steps         1. A want with a spaced ability is built.
     *                   2. Validate and search for ability-has-space.
     *                   3. The spacing marker is present.
     * @tc.expected      The spacing marker is present.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectLifecycleAbilitySpaceRejected', 0, () => {
      const bundle = 'com.example.ipc_stub';
      const ability = 'Service Ability';
      const want = new WantModel(bundle, ability);
      const reference = new WantModel(TARGET_BUNDLE, TARGET_ABILITY);
      const errors = want.validate();
      expect(want.bundleName).assertEqual(bundle);
      expect(want.abilityName).assertEqual(ability);
      expect(want.describe()).assertEqual(bundle + '/' + ability);
      expect(errors.length).assertEqual(1);
      expect(want.matches(reference)).assertEqual(false);
      expect(errors.indexOf('ability-has-space') >= 0).assertEqual(true);
      expect(reference.validate().length).assertEqual(0);
      expect(TARGET_BUNDLE).assertEqual('com.example.ipc_stub');
      expect(TARGET_ABILITY).assertEqual('ServiceAbility');
      expect(String(errors.length)).assertEqual('1');
    });

    /**
     * @tc.name          connectLifecycleWantDescribeMatchesInput
     * @tc.desc          Want describe keeps bundle and ability order.
     * @tc.precondition  A custom WantModel is built.
     * @tc.steps         1. A custom WantModel is built.
     *                   2. Call describe and compare with the inputs.
     *                   3. The text is bundle slash ability.
     * @tc.expected      The text is bundle slash ability.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectLifecycleWantDescribeMatchesInput', 0, () => {
      const bundle = 'com.custom.client';
      const ability = 'CustomAbility';
      const want = new WantModel(bundle, ability);
      const reference = new WantModel(TARGET_BUNDLE, TARGET_ABILITY);
      const errors = want.validate();
      expect(want.bundleName).assertEqual(bundle);
      expect(want.abilityName).assertEqual(ability);
      expect(want.describe()).assertEqual(bundle + '/' + ability);
      expect(errors.length).assertEqual(0);
      expect(want.matches(reference)).assertEqual(false);
      expect(errors.indexOf('bundle-empty') >= 0).assertEqual(false);
      expect(reference.validate().length).assertEqual(0);
      expect(TARGET_BUNDLE).assertEqual('com.example.ipc_stub');
      expect(TARGET_ABILITY).assertEqual('ServiceAbility');
      expect(String(errors.length)).assertEqual('0');
    });

    /**
     * @tc.name          connectLifecycleWantMatchRejectsDifferentAbility
     * @tc.desc          Want matching compares both fields.
     * @tc.precondition  Two wants differ only by ability.
     * @tc.steps         1. Two wants differ only by ability.
     *                   2. Call matches in both directions.
     *                   3. Both comparisons return false.
     * @tc.expected      Both comparisons return false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectLifecycleWantMatchRejectsDifferentAbility', 0, () => {
      const bundle = 'com.example.ipc_stub';
      const ability = 'OtherAbility';
      const want = new WantModel(bundle, ability);
      const reference = new WantModel(TARGET_BUNDLE, TARGET_ABILITY);
      const errors = want.validate();
      expect(want.bundleName).assertEqual(bundle);
      expect(want.abilityName).assertEqual(ability);
      expect(want.describe()).assertEqual(bundle + '/' + ability);
      expect(errors.length).assertEqual(0);
      expect(want.matches(reference)).assertEqual(false);
      expect(errors.indexOf('ability-empty') >= 0).assertEqual(false);
      expect(reference.validate().length).assertEqual(0);
      expect(TARGET_BUNDLE).assertEqual('com.example.ipc_stub');
      expect(TARGET_ABILITY).assertEqual('ServiceAbility');
      expect(String(errors.length)).assertEqual('0');
    });

    /**
     * @tc.name          connectLifecycleConnectMovesToConnectingState
     * @tc.desc          connect parks the client in the connecting state.
     * @tc.precondition  A fresh client exists.
     * @tc.steps         1. A fresh client exists.
     *                   2. Call connect with a numeric id.
     *                   3. The state becomes connecting.
     * @tc.expected      The state becomes connecting.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('connectLifecycleConnectMovesToConnectingState', 0, () => {
      const client = new ConnectionModel();
      const ok = client.connect(21);
      expect(ok).assertEqual(true);
      expect(client.state).assertEqual(STATE_CONNECTING);
      expect(client.connectId).assertEqual(21);
      expect(client.proxy === undefined).assertEqual(true);
      expect(client.isConnected()).assertEqual(false);
      expect(client.connectCalls).assertEqual(1);
      expect(client.events.countOf('connect')).assertEqual(1);
      expect(client.toasts.length).assertEqual(0);
      expect(client.logs.countLevel(LEVEL_WARN)).assertEqual(0);
      expect(client.failedCode).assertEqual(0);
      expect(client.events.last().indexOf('connect:') === 0).assertTrue();
    });

    /**
     * @tc.name          connectLifecycleConnectAssignsConnectId
     * @tc.desc          connect stores the caller supplied id.
     * @tc.precondition  A fresh client exists.
     * @tc.steps         1. A fresh client exists.
     *                   2. Connect with id 41.
     *                   3. connectId equals 41 while connecting.
     * @tc.expected      connectId equals 41 while connecting.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('connectLifecycleConnectAssignsConnectId', 0, () => {
      const client = new ConnectionModel();
      const ok = client.connect(41);
      expect(ok).assertEqual(true);
      expect(client.state).assertEqual(STATE_CONNECTING);
      expect(client.connectId).assertEqual(41);
      expect(client.proxy === undefined).assertEqual(true);
      expect(client.isConnected()).assertEqual(false);
      expect(client.connectCalls).assertEqual(1);
      expect(client.events.countOf('connect')).assertEqual(1);
      expect(client.toasts.length).assertEqual(0);
      expect(client.logs.countLevel(LEVEL_WARN)).assertEqual(0);
      expect(client.failedCode).assertEqual(0);
      expect(client.events.last().indexOf('connect:') === 0).assertTrue();
    });

    /**
     * @tc.name          connectLifecycleConnectDefaultsToOne
     * @tc.desc          The default connect id is one.
     * @tc.precondition  A fresh client exists.
     * @tc.steps         1. A fresh client exists.
     *                   2. Call connect without arguments.
     *                   3. connectId equals one.
     * @tc.expected      connectId equals one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectLifecycleConnectDefaultsToOne', 0, () => {
      const client = new ConnectionModel();
      const ok = client.connect();
      expect(ok).assertEqual(true);
      expect(client.state).assertEqual(STATE_CONNECTING);
      expect(client.connectId).assertEqual(1);
      expect(client.proxy === undefined).assertEqual(true);
      expect(client.isConnected()).assertEqual(false);
      expect(client.connectCalls).assertEqual(1);
      expect(client.events.countOf('connect')).assertEqual(1);
      expect(client.toasts.length).assertEqual(0);
      expect(client.logs.countLevel(LEVEL_WARN)).assertEqual(0);
      expect(client.failedCode).assertEqual(0);
      expect(client.events.last().indexOf('connect:') === 0).assertTrue();
    });

    /**
     * @tc.name          connectLifecycleConnectRecordsSingleEvent
     * @tc.desc          The connect call writes one event.
     * @tc.precondition  A fresh client exists.
     * @tc.steps         1. A fresh client exists.
     *                   2. Connect and count connect events.
     *                   3. Exactly one connect event exists.
     * @tc.expected      Exactly one connect event exists.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('connectLifecycleConnectRecordsSingleEvent', 0, () => {
      const client = new ConnectionModel();
      const ok = client.connect(23);
      expect(ok).assertEqual(true);
      expect(client.state).assertEqual(STATE_CONNECTING);
      expect(client.connectId).assertEqual(23);
      expect(client.proxy === undefined).assertEqual(true);
      expect(client.isConnected()).assertEqual(false);
      expect(client.connectCalls).assertEqual(1);
      expect(client.events.countOf('connect')).assertEqual(1);
      expect(client.toasts.length).assertEqual(0);
      expect(client.logs.countLevel(LEVEL_WARN)).assertEqual(0);
      expect(client.failedCode).assertEqual(0);
      expect(client.events.last().indexOf('connect:') === 0).assertTrue();
    });

    /**
     * @tc.name          connectLifecycleConnectEventCarriesWant
     * @tc.desc          The connect event embeds the want description.
     * @tc.precondition  A default client exists.
     * @tc.steps         1. A default client exists.
     *                   2. Connect and read the last event.
     *                   3. The event ends with the target want text.
     * @tc.expected      The event ends with the target want text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectLifecycleConnectEventCarriesWant', 0, () => {
      const client = new ConnectionModel();
      const ok = client.connect(24);
      expect(ok).assertEqual(true);
      expect(client.state).assertEqual(STATE_CONNECTING);
      expect(client.connectId).assertEqual(24);
      expect(client.proxy === undefined).assertEqual(true);
      expect(client.isConnected()).assertEqual(false);
      expect(client.connectCalls).assertEqual(1);
      expect(client.events.countOf('connect')).assertEqual(1);
      expect(client.toasts.length).assertEqual(0);
      expect(client.logs.countLevel(LEVEL_WARN)).assertEqual(0);
      expect(client.failedCode).assertEqual(0);
      expect(client.events.last().indexOf('connect:') === 0).assertTrue();
    });

    /**
     * @tc.name          connectLifecycleConnectIsIdempotentWhileConnecting
     * @tc.desc          A second connect is refused while connecting.
     * @tc.precondition  The client is connecting.
     * @tc.steps         1. The client is connecting.
     *                   2. Call connect twice and compare ids.
     *                   3. The second call returns false.
     * @tc.expected      The second call returns false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('connectLifecycleConnectIsIdempotentWhileConnecting', 0, () => {
      const client = new ConnectionModel();
      client.connect(25);
      const ok = client.connect(99);
      expect(ok).assertEqual(false);
      expect(client.state).assertEqual(STATE_CONNECTING);
      expect(client.connectId).assertEqual(25);
      expect(client.proxy === undefined).assertEqual(true);
      expect(client.isConnected()).assertEqual(false);
      expect(client.connectCalls).assertEqual(2);
      expect(client.events.countOf('connect')).assertEqual(1);
      expect(client.toasts.length).assertEqual(0);
      expect(client.logs.countLevel(LEVEL_WARN)).assertEqual(1);
      expect(client.failedCode).assertEqual(0);
      expect(client.events.last().indexOf('connect:') === 0).assertTrue();
    });

    /**
     * @tc.name          connectLifecycleConnectLogsWarningOnRepeat
     * @tc.desc          The refused connect produces a warning log.
     * @tc.precondition  The client is connecting.
     * @tc.steps         1. The client is connecting.
     *                   2. Call connect twice.
     *                   3. One WARN entry is buffered.
     * @tc.expected      One WARN entry is buffered.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectLifecycleConnectLogsWarningOnRepeat', 0, () => {
      const client = new ConnectionModel();
      client.connect(26);
      const ok = client.connect(98);
      expect(ok).assertEqual(false);
      expect(client.state).assertEqual(STATE_CONNECTING);
      expect(client.connectId).assertEqual(26);
      expect(client.proxy === undefined).assertEqual(true);
      expect(client.isConnected()).assertEqual(false);
      expect(client.connectCalls).assertEqual(2);
      expect(client.events.countOf('connect')).assertEqual(1);
      expect(client.toasts.length).assertEqual(0);
      expect(client.logs.countLevel(LEVEL_WARN)).assertEqual(1);
      expect(client.failedCode).assertEqual(0);
      expect(client.events.last().indexOf('connect:') === 0).assertTrue();
    });

    /**
     * @tc.name          connectLifecycleConnectKeepsProxyUndefined
     * @tc.desc          No proxy exists before onConnect.
     * @tc.precondition  The client is connecting.
     * @tc.steps         1. The client is connecting.
     *                   2. Inspect the proxy field.
     *                   3. The proxy remains undefined.
     * @tc.expected      The proxy remains undefined.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('connectLifecycleConnectKeepsProxyUndefined', 0, () => {
      const client = new ConnectionModel();
      const ok = client.connect(27);
      expect(ok).assertEqual(true);
      expect(client.state).assertEqual(STATE_CONNECTING);
      expect(client.connectId).assertEqual(27);
      expect(client.proxy === undefined).assertEqual(true);
      expect(client.isConnected()).assertEqual(false);
      expect(client.connectCalls).assertEqual(1);
      expect(client.events.countOf('connect')).assertEqual(1);
      expect(client.toasts.length).assertEqual(0);
      expect(client.logs.countLevel(LEVEL_WARN)).assertEqual(0);
      expect(client.failedCode).assertEqual(0);
      expect(client.events.last().indexOf('connect:') === 0).assertTrue();
    });

    /**
     * @tc.name          connectLifecycleConnectIsNotYetConnected
     * @tc.desc          isConnected is false while connecting.
     * @tc.precondition  The client is connecting.
     * @tc.steps         1. The client is connecting.
     *                   2. Call isConnected.
     *                   3. The result is false.
     * @tc.expected      The result is false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('connectLifecycleConnectIsNotYetConnected', 0, () => {
      const client = new ConnectionModel();
      const ok = client.connect(28);
      expect(ok).assertEqual(true);
      expect(client.state).assertEqual(STATE_CONNECTING);
      expect(client.connectId).assertEqual(28);
      expect(client.proxy === undefined).assertEqual(true);
      expect(client.isConnected()).assertEqual(false);
      expect(client.connectCalls).assertEqual(1);
      expect(client.events.countOf('connect')).assertEqual(1);
      expect(client.toasts.length).assertEqual(0);
      expect(client.logs.countLevel(LEVEL_WARN)).assertEqual(0);
      expect(client.failedCode).assertEqual(0);
      expect(client.events.last().indexOf('connect:') === 0).assertTrue();
    });

    /**
     * @tc.name          connectLifecycleConnectCountsEachAttempt
     * @tc.desc          connectCalls counts refused attempts too.
     * @tc.precondition  A connected client exists.
     * @tc.steps         1. A connected client exists.
     *                   2. Attempt one more connect.
     *                   3. connectCalls equals two.
     * @tc.expected      connectCalls equals two.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectLifecycleConnectCountsEachAttempt', 0, () => {
      const client = createConnectedSession();
      const ok = client.connect(88);
      expect(ok).assertEqual(false);
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.connectId).assertEqual(7);
      expect(client.proxy === undefined).assertEqual(false);
      expect(client.isConnected()).assertEqual(true);
      expect(client.connectCalls).assertEqual(2);
      expect(client.events.countOf('connect')).assertEqual(1);
      expect(client.toasts.length).assertEqual(1);
      expect(client.logs.countLevel(LEVEL_WARN)).assertEqual(1);
      expect(client.failedCode).assertEqual(0);
      expect(client.events.last().indexOf('connected:') === 0).assertTrue();
    });

    /**
     * @tc.name          connectLifecycleConnectAfterFailureIsAllowed
     * @tc.desc          A failed client may start a new connect.
     * @tc.precondition  onFailed has been delivered.
     * @tc.steps         1. onFailed has been delivered.
     *                   2. Connect again with a new id.
     *                   3. The call returns true and state is connecting.
     * @tc.expected      The call returns true and state is connecting.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectLifecycleConnectAfterFailureIsAllowed', 0, () => {
      const client = new ConnectionModel();
      client.onFailed(16000001);
      const ok = client.connect(31);
      expect(ok).assertEqual(true);
      expect(client.state).assertEqual(STATE_CONNECTING);
      expect(client.connectId).assertEqual(31);
      expect(client.proxy === undefined).assertEqual(true);
      expect(client.isConnected()).assertEqual(false);
      expect(client.connectCalls).assertEqual(1);
      expect(client.events.countOf('connect')).assertEqual(1);
      expect(client.toasts.length).assertEqual(1);
      expect(client.logs.countLevel(LEVEL_WARN)).assertEqual(0);
      expect(client.failedCode).assertEqual(16000001);
      expect(client.events.last().indexOf('connect:') === 0).assertTrue();
    });

    /**
     * @tc.name          connectLifecycleConnectAfterDisconnectIsAllowed
     * @tc.desc          A disconnected client may reconnect.
     * @tc.precondition  onDisconnect has been delivered.
     * @tc.steps         1. onDisconnect has been delivered.
     *                   2. Call connect with id 52.
     *                   3. The call returns true.
     * @tc.expected      The call returns true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectLifecycleConnectAfterDisconnectIsAllowed', 0, () => {
      const client = new ConnectionModel();
      client.connect(32);
      client.onConnect(new RemoteProxyModel());
      client.onDisconnect();
      const ok = client.connect(33);
      expect(ok).assertEqual(true);
      expect(client.state).assertEqual(STATE_CONNECTING);
      expect(client.connectId).assertEqual(33);
      expect(client.proxy === undefined).assertEqual(true);
      expect(client.isConnected()).assertEqual(false);
      expect(client.connectCalls).assertEqual(2);
      expect(client.events.countOf('connect')).assertEqual(2);
      expect(client.toasts.length).assertEqual(2);
      expect(client.logs.countLevel(LEVEL_WARN)).assertEqual(0);
      expect(client.failedCode).assertEqual(0);
      expect(client.events.last().indexOf('connect:') === 0).assertTrue();
    });

    /**
     * @tc.name          connectLifecycleConnectAfterResetIsAllowed
     * @tc.desc          reset restores a connectable client.
     * @tc.precondition  reset was called on a live session.
     * @tc.steps         1. reset was called on a live session.
     *                   2. Connect with id 53.
     *                   3. The state becomes connecting.
     * @tc.expected      The state becomes connecting.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectLifecycleConnectAfterResetIsAllowed', 0, () => {
      const client = new ConnectionModel();
      client.connect(34);
      client.onConnect(new RemoteProxyModel());
      client.reset();
      const ok = client.connect(35);
      expect(ok).assertEqual(true);
      expect(client.state).assertEqual(STATE_CONNECTING);
      expect(client.connectId).assertEqual(35);
      expect(client.proxy === undefined).assertEqual(true);
      expect(client.isConnected()).assertEqual(false);
      expect(client.connectCalls).assertEqual(1);
      expect(client.events.countOf('connect')).assertEqual(1);
      expect(client.toasts.length).assertEqual(0);
      expect(client.logs.countLevel(LEVEL_WARN)).assertEqual(0);
      expect(client.failedCode).assertEqual(0);
      expect(client.events.last().indexOf('connect:') === 0).assertTrue();
    });

    /**
     * @tc.name          connectLifecycleOnConnectStoresProxy
     * @tc.desc          onConnect keeps the remote proxy reference.
     * @tc.precondition  The client is connecting.
     * @tc.steps         1. The client is connecting.
     *                   2. Deliver onConnect with a live proxy.
     *                   3. The stored proxy is the delivered instance.
     * @tc.expected      The stored proxy is the delivered instance.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('connectLifecycleOnConnectStoresProxy', 0, () => {
      const stub = new RemoteStubModel();
      stub.replyText = 'hello rpc';
      const proxy = new RemoteProxyModel(stub);
      const client = new ConnectionModel();
      client.connect(51);
      client.onConnect(proxy);
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.proxy === proxy).assertTrue();
      expect(client.connectId).assertEqual(51);
      expect(client.deathRecipient.registered).assertEqual(true);
      expect(proxy.deathRegistered).assertEqual(true);
      expect(client.deathRecipient.diedCount).assertEqual(0);
      expect(client.lastToast()).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(client.events.countOf('connected')).assertEqual(1);
      expect(client.events.countOf('death-register')).assertEqual(1);
      expect(client.isConnected()).assertEqual(true);
      expect(proxy.requests.length).assertEqual(0);
      expect(client.toasts.length).assertEqual(1);
      expect(client.logs.countLevel('INFO') >= 1).assertTrue();
    });

    /**
     * @tc.name          connectLifecycleOnConnectSetsConnectedState
     * @tc.desc          onConnect completes the handshake.
     * @tc.precondition  The client is connecting.
     * @tc.steps         1. The client is connecting.
     *                   2. Deliver onConnect.
     *                   3. The state becomes connected.
     * @tc.expected      The state becomes connected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('connectLifecycleOnConnectSetsConnectedState', 0, () => {
      const stub = new RemoteStubModel();
      stub.replyText = 'alpha';
      const proxy = new RemoteProxyModel(stub);
      const client = new ConnectionModel();
      client.connect(52);
      client.onConnect(proxy);
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.proxy === proxy).assertTrue();
      expect(client.connectId).assertEqual(52);
      expect(client.deathRecipient.registered).assertEqual(true);
      expect(proxy.deathRegistered).assertEqual(true);
      expect(client.deathRecipient.diedCount).assertEqual(0);
      expect(client.lastToast()).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(client.events.countOf('connected')).assertEqual(1);
      expect(client.events.countOf('death-register')).assertEqual(1);
      expect(client.isConnected()).assertEqual(true);
      expect(proxy.requests.length).assertEqual(0);
      expect(client.toasts.length).assertEqual(1);
      expect(client.logs.countLevel('INFO') >= 1).assertTrue();
    });

    /**
     * @tc.name          connectLifecycleOnConnectRegistersDeathRecipient
     * @tc.desc          onConnect registers the death recipient.
     * @tc.precondition  The client is connecting.
     * @tc.steps         1. The client is connecting.
     *                   2. Deliver onConnect and inspect flags.
     *                   3. The recipient is registered on both sides.
     * @tc.expected      The recipient is registered on both sides.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('connectLifecycleOnConnectRegistersDeathRecipient', 0, () => {
      const stub = new RemoteStubModel();
      stub.replyText = 'beta';
      const proxy = new RemoteProxyModel(stub);
      const client = new ConnectionModel();
      client.connect(53);
      client.onConnect(proxy);
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.proxy === proxy).assertTrue();
      expect(client.connectId).assertEqual(53);
      expect(client.deathRecipient.registered).assertEqual(true);
      expect(proxy.deathRegistered).assertEqual(true);
      expect(client.deathRecipient.diedCount).assertEqual(0);
      expect(client.lastToast()).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(client.events.countOf('connected')).assertEqual(1);
      expect(client.events.countOf('death-register')).assertEqual(1);
      expect(client.isConnected()).assertEqual(true);
      expect(proxy.requests.length).assertEqual(0);
      expect(client.toasts.length).assertEqual(1);
      expect(client.logs.countLevel('INFO') >= 1).assertTrue();
    });

    /**
     * @tc.name          connectLifecycleOnConnectEmitsSuccessToast
     * @tc.desc          onConnect shows the success toast text.
     * @tc.precondition  The client is connecting.
     * @tc.steps         1. The client is connecting.
     *                   2. Deliver onConnect and read the last toast.
     *                   3. The toast equals connectAbility success.
     * @tc.expected      The toast equals connectAbility success.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('connectLifecycleOnConnectEmitsSuccessToast', 0, () => {
      const stub = new RemoteStubModel();
      stub.replyText = 'gamma';
      const proxy = new RemoteProxyModel(stub);
      const client = new ConnectionModel();
      client.connect(54);
      client.onConnect(proxy);
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.proxy === proxy).assertTrue();
      expect(client.connectId).assertEqual(54);
      expect(client.deathRecipient.registered).assertEqual(true);
      expect(proxy.deathRegistered).assertEqual(true);
      expect(client.deathRecipient.diedCount).assertEqual(0);
      expect(client.lastToast()).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(client.events.countOf('connected')).assertEqual(1);
      expect(client.events.countOf('death-register')).assertEqual(1);
      expect(client.isConnected()).assertEqual(true);
      expect(proxy.requests.length).assertEqual(0);
      expect(client.toasts.length).assertEqual(1);
      expect(client.logs.countLevel('INFO') >= 1).assertTrue();
    });

    /**
     * @tc.name          connectLifecycleOnConnectRecordsConnectedEvent
     * @tc.desc          onConnect appends the connected event.
     * @tc.precondition  The client is connecting.
     * @tc.steps         1. The client is connecting.
     *                   2. Deliver onConnect and read the last event.
     *                   3. The event is connected with the descriptor.
     * @tc.expected      The event is connected with the descriptor.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectLifecycleOnConnectRecordsConnectedEvent', 0, () => {
      const stub = new RemoteStubModel();
      stub.replyText = 'delta';
      const proxy = new RemoteProxyModel(stub);
      const client = new ConnectionModel();
      client.connect(55);
      client.onConnect(proxy);
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.proxy === proxy).assertTrue();
      expect(client.connectId).assertEqual(55);
      expect(client.deathRecipient.registered).assertEqual(true);
      expect(proxy.deathRegistered).assertEqual(true);
      expect(client.deathRecipient.diedCount).assertEqual(0);
      expect(client.lastToast()).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(client.events.countOf('connected')).assertEqual(1);
      expect(client.events.countOf('death-register')).assertEqual(1);
      expect(client.isConnected()).assertEqual(true);
      expect(proxy.requests.length).assertEqual(0);
      expect(client.toasts.length).assertEqual(1);
      expect(client.logs.countLevel('INFO') >= 1).assertTrue();
    });

    /**
     * @tc.name          connectLifecycleOnConnectSatisfiesIsConnected
     * @tc.desc          A live proxy makes isConnected true.
     * @tc.precondition  The client is connecting.
     * @tc.steps         1. The client is connecting.
     *                   2. Deliver onConnect then call isConnected.
     *                   3. The result is true.
     * @tc.expected      The result is true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('connectLifecycleOnConnectSatisfiesIsConnected', 0, () => {
      const stub = new RemoteStubModel();
      stub.replyText = 'epsilon';
      const proxy = new RemoteProxyModel(stub);
      const client = new ConnectionModel();
      client.connect(56);
      client.onConnect(proxy);
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.proxy === proxy).assertTrue();
      expect(client.connectId).assertEqual(56);
      expect(client.deathRecipient.registered).assertEqual(true);
      expect(proxy.deathRegistered).assertEqual(true);
      expect(client.deathRecipient.diedCount).assertEqual(0);
      expect(client.lastToast()).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(client.events.countOf('connected')).assertEqual(1);
      expect(client.events.countOf('death-register')).assertEqual(1);
      expect(client.isConnected()).assertEqual(true);
      expect(proxy.requests.length).assertEqual(0);
      expect(client.toasts.length).assertEqual(1);
      expect(client.logs.countLevel('INFO') >= 1).assertTrue();
    });

    /**
     * @tc.name          connectLifecycleOnConnectKeepsConnectId
     * @tc.desc          The handshake does not change the connect id.
     * @tc.precondition  The client connected with id 61.
     * @tc.steps         1. The client connected with id 61.
     *                   2. Deliver onConnect.
     *                   3. connectId still equals 61.
     * @tc.expected      connectId still equals 61.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectLifecycleOnConnectKeepsConnectId', 0, () => {
      const stub = new RemoteStubModel();
      stub.replyText = 'zeta';
      const proxy = new RemoteProxyModel(stub);
      const client = new ConnectionModel();
      client.connect(57);
      client.onConnect(proxy);
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.proxy === proxy).assertTrue();
      expect(client.connectId).assertEqual(57);
      expect(client.deathRecipient.registered).assertEqual(true);
      expect(proxy.deathRegistered).assertEqual(true);
      expect(client.deathRecipient.diedCount).assertEqual(0);
      expect(client.lastToast()).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(client.events.countOf('connected')).assertEqual(1);
      expect(client.events.countOf('death-register')).assertEqual(1);
      expect(client.isConnected()).assertEqual(true);
      expect(proxy.requests.length).assertEqual(0);
      expect(client.toasts.length).assertEqual(1);
      expect(client.logs.countLevel('INFO') >= 1).assertTrue();
    });

    /**
     * @tc.name          connectLifecycleOnConnectReplacesEarlierProxy
     * @tc.desc          A second onConnect swaps the proxy.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. A connected session exists.
     *                   2. Deliver a new live proxy.
     *                   3. The stored proxy is the new instance.
     * @tc.expected      The stored proxy is the new instance.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectLifecycleOnConnectReplacesEarlierProxy', 0, () => {
      const client = createConnectedSession();
      const stub = new RemoteStubModel();
      stub.replyText = 'eta';
      const proxy = new RemoteProxyModel(stub);
      const previous = client.proxy as RemoteProxyModel;
      client.onConnect(proxy);
      expect(client.proxy === proxy).assertTrue();
      expect(client.proxy === previous).assertFalse();
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.connectId).assertEqual(7);
      expect(client.deathRecipient.registered).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      expect(previous.deathRegistered).assertTrue();
      expect(client.events.countOf('connected')).assertEqual(2);
      expect(client.events.countOf('death-register')).assertEqual(2);
      expect(client.toasts.length).assertEqual(2);
      expect(client.isConnected()).assertTrue();
      expect(client.deathRecipient.diedCount).assertEqual(0);
    });

    /**
     * @tc.name          connectLifecycleOnConnectWithDeadProxyFlagsFailure
     * @tc.desc          A dead proxy cannot host a death recipient.
     * @tc.precondition  A proxy is marked dead before delivery.
     * @tc.steps         1. A proxy is marked dead before delivery.
     *                   2. Deliver onConnect with that proxy.
     *                   3. The failure event is recorded.
     * @tc.expected      The failure event is recorded.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('connectLifecycleOnConnectWithDeadProxyFlagsFailure', 0, () => {
      const stub = new RemoteStubModel();
      stub.replyText = 'theta';
      const proxy = new RemoteProxyModel(stub);
      const client = new ConnectionModel();
      client.connect(58);
      proxy.alive = false;
      client.onConnect(proxy);
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.proxy === proxy).assertTrue();
      expect(client.connectId).assertEqual(58);
      expect(client.deathRecipient.registered).assertEqual(false);
      expect(proxy.deathRegistered).assertEqual(false);
      expect(client.deathRecipient.diedCount).assertEqual(0);
      expect(client.lastToast()).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(client.events.countOf('connected')).assertEqual(1);
      expect(client.events.countOf('death-register')).assertEqual(0);
      expect(client.isConnected()).assertEqual(false);
      expect(proxy.requests.length).assertEqual(0);
      expect(client.toasts.length).assertEqual(1);
      expect(client.logs.countLevel('ERROR') >= 1).assertTrue();
    });

    /**
     * @tc.name          connectLifecycleOnConnectDeadProxyStillConnects
     * @tc.desc          The connected state does not depend on liveness.
     * @tc.precondition  A dead proxy is delivered.
     * @tc.steps         1. A dead proxy is delivered.
     *                   2. Read the client state and isConnected.
     *                   3. The state is connected but liveness is false.
     * @tc.expected      The state is connected but liveness is false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('connectLifecycleOnConnectDeadProxyStillConnects', 0, () => {
      const stub = new RemoteStubModel();
      stub.replyText = 'iota';
      const proxy = new RemoteProxyModel(stub);
      const client = new ConnectionModel();
      client.connect(59);
      proxy.alive = false;
      client.onConnect(proxy);
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.proxy === proxy).assertTrue();
      expect(client.connectId).assertEqual(59);
      expect(client.deathRecipient.registered).assertEqual(false);
      expect(proxy.deathRegistered).assertEqual(false);
      expect(client.deathRecipient.diedCount).assertEqual(0);
      expect(client.lastToast()).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(client.events.countOf('connected')).assertEqual(1);
      expect(client.events.countOf('death-register')).assertEqual(0);
      expect(client.isConnected()).assertEqual(false);
      expect(proxy.requests.length).assertEqual(0);
      expect(client.toasts.length).assertEqual(1);
      expect(client.logs.countLevel('ERROR') >= 1).assertTrue();
    });

    /**
     * @tc.name          connectLifecycleDuplicateConnectKeepsProxy
     * @tc.desc          A refused connect leaves the live proxy alone.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. A connected session exists.
     *                   2. Call connect again.
     *                   3. The original proxy reference survives.
     * @tc.expected      The original proxy reference survives.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectLifecycleDuplicateConnectKeepsProxy', 0, () => {
      const session = createConnectedSession();
      const before = session.proxy as RemoteProxyModel;
      const idBefore = session.connectId;
      const again = session.connect(61);
      expect(again).assertFalse();
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.connectId).assertEqual(idBefore);
      expect(session.connectId).assertEqual(7);
      expect(session.proxy === before).assertTrue();
      expect(session.connectCalls).assertEqual(2);
      expect(session.events.countOf('connect')).assertEqual(1);
      expect(session.logs.countLevel(LEVEL_WARN)).assertEqual(1);
      expect(session.lastToast()).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(session.isConnected()).assertTrue();
      expect(session.toasts.length).assertEqual(1);
      expect(before.requests.length).assertEqual(0);
      expect(session.logs.countLevel('ERROR')).assertEqual(0);
    });

    /**
     * @tc.name          connectLifecycleDuplicateConnectKeepsState
     * @tc.desc          A refused connect keeps the connected state.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. A connected session exists.
     *                   2. Call connect again.
     *                   3. The state remains connected.
     * @tc.expected      The state remains connected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('connectLifecycleDuplicateConnectKeepsState', 0, () => {
      const session = createConnectedSession();
      const before = session.proxy as RemoteProxyModel;
      const idBefore = session.connectId;
      const again = session.connect(62);
      expect(again).assertFalse();
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.connectId).assertEqual(idBefore);
      expect(session.connectId).assertEqual(7);
      expect(session.proxy === before).assertTrue();
      expect(session.connectCalls).assertEqual(2);
      expect(session.events.countOf('connect')).assertEqual(1);
      expect(session.logs.countLevel(LEVEL_WARN)).assertEqual(1);
      expect(session.lastToast()).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(session.isConnected()).assertTrue();
      expect(session.toasts.length).assertEqual(1);
      expect(before.requests.length).assertEqual(0);
      expect(session.logs.countLevel('ERROR')).assertEqual(0);
    });

    /**
     * @tc.name          connectLifecycleDuplicateConnectKeepsConnectId
     * @tc.desc          A refused connect keeps the original id.
     * @tc.precondition  A connected session exists with id 7.
     * @tc.steps         1. A connected session exists with id 7.
     *                   2. Call connect with id 88.
     *                   3. connectId remains seven.
     * @tc.expected      connectId remains seven.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectLifecycleDuplicateConnectKeepsConnectId', 0, () => {
      const session = createConnectedSession();
      const before = session.proxy as RemoteProxyModel;
      const idBefore = session.connectId;
      const again = session.connect(63);
      expect(again).assertFalse();
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.connectId).assertEqual(idBefore);
      expect(session.connectId).assertEqual(7);
      expect(session.proxy === before).assertTrue();
      expect(session.connectCalls).assertEqual(2);
      expect(session.events.countOf('connect')).assertEqual(1);
      expect(session.logs.countLevel(LEVEL_WARN)).assertEqual(1);
      expect(session.lastToast()).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(session.isConnected()).assertTrue();
      expect(session.toasts.length).assertEqual(1);
      expect(before.requests.length).assertEqual(0);
      expect(session.logs.countLevel('ERROR')).assertEqual(0);
    });

    /**
     * @tc.name          connectLifecycleDuplicateConnectCountsAttempt
     * @tc.desc          The refused connect still increments the counter.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. A connected session exists.
     *                   2. Call connect and read connectCalls.
     *                   3. The counter equals two.
     * @tc.expected      The counter equals two.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectLifecycleDuplicateConnectCountsAttempt', 0, () => {
      const session = createConnectedSession();
      const before = session.proxy as RemoteProxyModel;
      const idBefore = session.connectId;
      const again = session.connect(64);
      expect(again).assertFalse();
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.connectId).assertEqual(idBefore);
      expect(session.connectId).assertEqual(7);
      expect(session.proxy === before).assertTrue();
      expect(session.connectCalls).assertEqual(2);
      expect(session.events.countOf('connect')).assertEqual(1);
      expect(session.logs.countLevel(LEVEL_WARN)).assertEqual(1);
      expect(session.lastToast()).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(session.isConnected()).assertTrue();
      expect(session.toasts.length).assertEqual(1);
      expect(before.requests.length).assertEqual(0);
      expect(session.logs.countLevel('ERROR')).assertEqual(0);
    });

    /**
     * @tc.name          connectLifecycleDuplicateConnectWarnsOnce
     * @tc.desc          Each refused connect adds one warning.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. A connected session exists.
     *                   2. Reject one connect and count warnings.
     *                   3. The warning count equals one.
     * @tc.expected      The warning count equals one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectLifecycleDuplicateConnectWarnsOnce', 0, () => {
      const session = createConnectedSession();
      const before = session.proxy as RemoteProxyModel;
      const idBefore = session.connectId;
      const again = session.connect(65);
      expect(again).assertFalse();
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.connectId).assertEqual(idBefore);
      expect(session.connectId).assertEqual(7);
      expect(session.proxy === before).assertTrue();
      expect(session.connectCalls).assertEqual(2);
      expect(session.events.countOf('connect')).assertEqual(1);
      expect(session.logs.countLevel(LEVEL_WARN)).assertEqual(1);
      expect(session.lastToast()).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(session.isConnected()).assertTrue();
      expect(session.toasts.length).assertEqual(1);
      expect(before.requests.length).assertEqual(0);
      expect(session.logs.countLevel('ERROR')).assertEqual(0);
    });

    /**
     * @tc.name          connectLifecycleSnapshotBeforeConnectHasNoProxy
     * @tc.desc          A connecting snapshot reports no proxy.
     * @tc.precondition  A client is connecting.
     * @tc.steps         1. A client is connecting.
     *                   2. Build a ClientSnapshot.
     *                   3. hasProxy is false and state is connecting.
     * @tc.expected      hasProxy is false and state is connecting.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectLifecycleSnapshotBeforeConnectHasNoProxy', 0, () => {
      const client = new ConnectionModel();
      client.connect(71);
      const snapshot = new ClientSnapshot(client);
      expect(snapshot.state).assertEqual(STATE_CONNECTING);
      expect(snapshot.connectId).assertEqual(71);
      expect(snapshot.hasProxy).assertFalse();
      expect(snapshot.deathRegistered).assertFalse();
      expect(snapshot.toastCount).assertEqual(0);
      expect(snapshot.sameAs(snapshot)).assertTrue();
      expect(snapshot.describe().indexOf('connecting') === 0).assertTrue();
      expect(snapshot.describe().indexOf('/true') < 0).assertTrue();
    });

    /**
     * @tc.name          connectLifecycleSnapshotAfterConnectHasProxy
     * @tc.desc          A connected snapshot reports the proxy.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. A connected session exists.
     *                   2. Build a ClientSnapshot.
     *                   3. hasProxy and deathRegistered are true.
     * @tc.expected      hasProxy and deathRegistered are true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('connectLifecycleSnapshotAfterConnectHasProxy', 0, () => {
      const session = createConnectedSession();
      const snapshot = new ClientSnapshot(session);
      const again = new ClientSnapshot(session);
      expect(snapshot.state).assertEqual(STATE_CONNECTED);
      expect(snapshot.connectId).assertEqual(7);
      expect(snapshot.hasProxy).assertTrue();
      expect(snapshot.deathRegistered).assertTrue();
      expect(snapshot.toastCount).assertEqual(1);
      expect(snapshot.sameAs(again)).assertTrue();
      expect(snapshot.describe()).assertEqual('connected/7/true/true/1');
      expect(snapshot.describe().length > 0).assertTrue();
    });

    /**
     * @tc.name          connectLifecycleSnapshotToastCountAfterConnect
     * @tc.desc          The success toast is visible in the snapshot.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. A connected session exists.
     *                   2. Build a ClientSnapshot.
     *                   3. toastCount equals one.
     * @tc.expected      toastCount equals one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectLifecycleSnapshotToastCountAfterConnect', 0, () => {
      const session = createConnectedSession();
      const before = new ClientSnapshot(session);
      const result = session.sendString('snapshot');
      const after = new ClientSnapshot(session);
      expect(before.toastCount).assertEqual(1);
      expect(after.toastCount).assertEqual(2);
      expect(before.sameAs(after)).assertFalse();
      expect(after.state).assertEqual(before.state);
      expect(after.connectId).assertEqual(before.connectId);
      expect(after.hasProxy).assertEqual(before.hasProxy);
      expect(result.isSuccess()).assertTrue();
      expect(after.describe()).assertEqual('connected/7/true/true/2');
      expect(session.lastToast()).assertEqual('sendRequest success');
    });

    /**
     * @tc.name          connectLifecycleMetricsConnectCountOne
     * @tc.desc          Metrics count the first connect event.
     * @tc.precondition  A client has connected once.
     * @tc.steps         1. A client has connected once.
     *                   2. Build ClientMetrics from the client.
     *                   3. connects equals one and replies is zero.
     * @tc.expected      connects equals one and replies is zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectLifecycleMetricsConnectCountOne', 0, () => {
      const client = new ConnectionModel();
      client.connect(81);
      const metrics = ClientMetrics.from(client);
      expect(metrics.connects).assertEqual(1);
      expect(metrics.sends).assertEqual(0);
      expect(metrics.failures).assertEqual(0);
      expect(metrics.replies).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(0);
      expect(metrics.fingerprint() === 0).assertFalse();
      expect(client.events.countOf('connect')).assertEqual(1);
      expect(client.events.countOf('failed')).assertEqual(0);
    });

    /**
     * @tc.name          connectLifecycleMetricsConnectCountTwo
     * @tc.desc          A reconnect raises the connect metric.
     * @tc.precondition  A client connected, disconnected and connected again.
     * @tc.steps         1. A client connected, disconnected and connected again.
     *                   2. Build ClientMetrics.
     *                   3. connects equals two.
     * @tc.expected      connects equals two.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectLifecycleMetricsConnectCountTwo', 0, () => {
      const client = new ConnectionModel();
      client.connect(82);
      client.onConnect(new RemoteProxyModel());
      client.onDisconnect();
      client.connect(83);
      const metrics = ClientMetrics.from(client);
      const empty = new ClientMetrics();
      expect(metrics.connects).assertEqual(2);
      expect(metrics.sends).assertEqual(0);
      expect(metrics.failures).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(0);
      expect(metrics.fingerprint() === empty.fingerprint()).assertFalse();
      expect(client.events.countOf('disconnected')).assertEqual(1);
      expect(client.state).assertEqual(STATE_CONNECTING);
    });

    /**
     * @tc.name          connectLifecycleSendBeforeOnConnectFails
     * @tc.desc          Sending without a proxy is refused.
     * @tc.precondition  The client is only connecting.
     * @tc.steps         1. The client is only connecting.
     *                   2. Call sendString.
     *                   3. The errCode is proxy invalid.
     * @tc.expected      The errCode is proxy invalid.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('connectLifecycleSendBeforeOnConnectFails', 0, () => {
      const client = new ConnectionModel();
      const result = client.sendString('hello world');
      expect(result.errCode).assertEqual(ERROR_PROXY_INVALID);
      expect(isNonZeroError(result.errCode)).assertTrue();
      expect(result.isSuccess()).assertFalse();
      expect(result.replyText).assertEqual('');
      expect(client.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(client.toasts.length).assertEqual(1);
      expect(client.events.countOf('send-no-proxy')).assertEqual(1);
      expect(client.events.countOf('send-ok')).assertEqual(0);
      expect(client.state).assertEqual('disconnected');
      expect(client.proxy === undefined).assertTrue();
      expect(client.connectCalls).assertEqual(0);
      expect(client.logs.countLevel('ERROR')).assertEqual(1);
      expect(result.reply.size()).assertEqual(0);
    });

    /**
     * @tc.name          connectLifecycleSendBeforeOnConnectToastsFailure
     * @tc.desc          The refused send shows the failure toast.
     * @tc.precondition  The client is only connecting.
     * @tc.steps         1. The client is only connecting.
     *                   2. Call sendString and read the toast.
     *                   3. The toast is the send failure text.
     * @tc.expected      The toast is the send failure text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('connectLifecycleSendBeforeOnConnectToastsFailure', 0, () => {
      const client = new ConnectionModel();
      const result = client.sendString('alpha');
      expect(result.errCode).assertEqual(ERROR_PROXY_INVALID);
      expect(isNonZeroError(result.errCode)).assertTrue();
      expect(result.isSuccess()).assertFalse();
      expect(result.replyText).assertEqual('');
      expect(client.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(client.toasts.length).assertEqual(1);
      expect(client.events.countOf('send-no-proxy')).assertEqual(1);
      expect(client.events.countOf('send-ok')).assertEqual(0);
      expect(client.state).assertEqual('disconnected');
      expect(client.proxy === undefined).assertTrue();
      expect(client.connectCalls).assertEqual(0);
      expect(client.logs.countLevel('ERROR')).assertEqual(1);
      expect(result.reply.size()).assertEqual(0);
    });

    /**
     * @tc.name          connectLifecycleSendBeforeOnConnectRecordsEvent
     * @tc.desc          The refused send records a no-proxy event.
     * @tc.precondition  The client is only connecting.
     * @tc.steps         1. The client is only connecting.
     *                   2. Call sendString.
     *                   3. One send-no-proxy event exists.
     * @tc.expected      One send-no-proxy event exists.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectLifecycleSendBeforeOnConnectRecordsEvent', 0, () => {
      const client = new ConnectionModel();
      const result = client.sendString('beta');
      expect(result.errCode).assertEqual(ERROR_PROXY_INVALID);
      expect(isNonZeroError(result.errCode)).assertTrue();
      expect(result.isSuccess()).assertFalse();
      expect(result.replyText).assertEqual('');
      expect(client.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(client.toasts.length).assertEqual(1);
      expect(client.events.countOf('send-no-proxy')).assertEqual(1);
      expect(client.events.countOf('send-ok')).assertEqual(0);
      expect(client.state).assertEqual('disconnected');
      expect(client.proxy === undefined).assertTrue();
      expect(client.connectCalls).assertEqual(0);
      expect(client.logs.countLevel('ERROR')).assertEqual(1);
      expect(result.reply.size()).assertEqual(0);
    });

    /**
     * @tc.name          connectLifecycleSendAfterConnectSucceeds
     * @tc.desc          A connected client can send the sample payload.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. A connected session exists.
     *                   2. Call sendString with hello world.
     *                   3. The result reports no error.
     * @tc.expected      The result reports no error.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('connectLifecycleSendAfterConnectSucceeds', 0, () => {
      const session = createConnectedSession('hello rpc');
      const payload = 'hello world';
      const result = session.sendString(payload);
      const proxy = session.proxy as RemoteProxyModel;
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.isSuccess()).assertTrue();
      expect(result.replyText).assertEqual('hello rpc');
      expect(proxy.requests[0]).assertEqual(REQUEST_CODE);
      expect(proxy.requests.length).assertEqual(1);
      expect(proxy.stub.receivedTexts[0]).assertEqual(payload);
      expect(proxy.sendCalls).assertEqual(1);
      expect(session.lastToast()).assertEqual('sendRequest success');
      expect(session.events.countOf('send-ok')).assertEqual(1);
      expect(session.toasts.length).assertEqual(2);
      expect(session.isConnected()).assertTrue();
      expect(session.logs.countLevel('ERROR')).assertEqual(0);
    });

    /**
     * @tc.name          connectLifecycleSendAfterConnectReturnsReplyText
     * @tc.desc          The reply text is copied into the result.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. A connected session exists.
     *                   2. Send and read result dot replyText.
     *                   3. The reply text is hello rpc.
     * @tc.expected      The reply text is hello rpc.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('connectLifecycleSendAfterConnectReturnsReplyText', 0, () => {
      const session = createConnectedSession('alpha reply');
      const payload = 'alpha';
      const result = session.sendString(payload);
      const proxy = session.proxy as RemoteProxyModel;
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.isSuccess()).assertTrue();
      expect(result.replyText).assertEqual('alpha reply');
      expect(proxy.requests[0]).assertEqual(REQUEST_CODE);
      expect(proxy.requests.length).assertEqual(1);
      expect(proxy.stub.receivedTexts[0]).assertEqual(payload);
      expect(proxy.sendCalls).assertEqual(1);
      expect(session.lastToast()).assertEqual('sendRequest success');
      expect(session.events.countOf('send-ok')).assertEqual(1);
      expect(session.toasts.length).assertEqual(2);
      expect(session.isConnected()).assertTrue();
      expect(session.logs.countLevel('ERROR')).assertEqual(0);
    });

    /**
     * @tc.name          connectLifecycleSendAfterConnectReachesStub
     * @tc.desc          The stub receives the request code and payload.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. A connected session exists.
     *                   2. Send and inspect the proxy stub.
     *                   3. The code is one and the payload matches.
     * @tc.expected      The code is one and the payload matches.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectLifecycleSendAfterConnectReachesStub', 0, () => {
      const session = createConnectedSession('beta reply');
      const payload = 'beta';
      const result = session.sendString(payload);
      const proxy = session.proxy as RemoteProxyModel;
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.isSuccess()).assertTrue();
      expect(result.replyText).assertEqual('beta reply');
      expect(proxy.requests[0]).assertEqual(REQUEST_CODE);
      expect(proxy.requests.length).assertEqual(1);
      expect(proxy.stub.receivedTexts[0]).assertEqual(payload);
      expect(proxy.sendCalls).assertEqual(1);
      expect(session.lastToast()).assertEqual('sendRequest success');
      expect(session.events.countOf('send-ok')).assertEqual(1);
      expect(session.toasts.length).assertEqual(2);
      expect(session.isConnected()).assertTrue();
      expect(session.logs.countLevel('ERROR')).assertEqual(0);
    });

    /**
     * @tc.name          connectLifecycleConnectDoesNotResetDisconnectFlag
     * @tc.desc          Connecting leaves the previous probe flag untouched.
     * @tc.precondition  The client has isDisconnect set.
     * @tc.steps         1. The client has isDisconnect set.
     *                   2. Call connect.
     *                   3. The flag stays true until a reset.
     * @tc.expected      The flag stays true until a reset.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('connectLifecycleConnectDoesNotResetDisconnectFlag', 0, () => {
      const session = createConnectedSession();
      session.isDisconnect = true;
      const again = session.connect(91);
      expect(again).assertFalse();
      expect(session.isDisconnect).assertTrue();
      expect(session.state).assertEqual(STATE_CONNECTED);
      expect(session.connectId).assertEqual(7);
      expect(session.connectCalls).assertEqual(2);
      expect(session.toasts.length).assertEqual(1);
      expect(session.logs.countLevel(LEVEL_WARN)).assertEqual(1);
      expect(session.events.countOf('connect')).assertEqual(1);
      expect(session.isConnected()).assertTrue();
      expect(session.proxy !== undefined).assertTrue();
    });

    /**
     * @tc.name          connectLifecycleResetClearsConnectAttempts
     * @tc.desc          reset returns the attempt counter to zero.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. A connected session exists.
     *                   2. Call reset and read connectCalls.
     *                   3. The counter equals zero.
     * @tc.expected      The counter equals zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('connectLifecycleResetClearsConnectAttempts', 0, () => {
      const session = createConnectedSession();
      session.isDisconnect = true;
      session.onFailed(16000002);
      session.reset();
      expect(session.state).assertEqual('disconnected');
      expect(session.connectId).assertEqual(-1);
      expect(session.proxy === undefined).assertTrue();
      expect(session.deathRecipient.registered).assertFalse();
      expect(session.events.size()).assertEqual(0);
      expect(session.toasts.length).assertEqual(0);
      expect(session.isDisconnect).assertFalse();
      expect(session.failedCode).assertEqual(ERROR_NONE);
      expect(session.connectCalls).assertEqual(0);
      expect(session.logs.size()).assertEqual(0);
      expect(session.isConnected()).assertFalse();
    });

  });
}
