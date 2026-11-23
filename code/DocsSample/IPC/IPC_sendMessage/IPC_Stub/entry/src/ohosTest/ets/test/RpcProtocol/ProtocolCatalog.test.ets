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
  STUB_BUNDLE,
  STUB_ABILITY,
  CLIENT_BUNDLE,
  REQUEST_CODE,
  REQUEST_PAYLOAD,
  REPLY_PAYLOAD,
  UNKNOWN_CODE_ZERO,
  UNKNOWN_CODE_TWO,
  UNKNOWN_CODE_NEGATIVE,
  UNKNOWN_CODE_LARGE,
  EVENT_ON_CREATE,
  EVENT_ON_REQUEST,
  EVENT_ON_CONNECT,
  EVENT_ON_DISCONNECT,
  EVENT_ON_DESTROY,
  EVENT_ON_REMOTE_DIED,
  ERROR_NONE,
  ERROR_STUB_REJECTED,
  ERROR_STUB_NOT_ALIVE,
  ERROR_SEQUENCE_RECLAIMED,
  OPTION_FLAG_SYNC,
  OPTION_FLAG_ASYNC,
  LEVEL_INFO,
  LEVEL_WARN,
  LEVEL_ERROR,
  StubRemoteObjectModel,
  MessageSequenceModel,
  MessageOptionModel,
  ServiceLifecycleModel,
  expectedReplyFor,
  countOf,
  joined,
  textFingerprint
} from '../Shared/SharedDriver';

/**
 * Protocol catalog for the IPC stub sample.
 *
 * Production anchor: ServiceExtAbility.ets 22-65 fixes the stub descriptor,
 * the single request code, the 'hello rpc' reply and the five lifecycle
 * callbacks. This suite pins every literal of that contract in one place
 * and cross-checks the catalog against the model doubles.
 */

function eventCatalog(): string[] {
  return [EVENT_ON_CREATE, EVENT_ON_REQUEST, EVENT_ON_CONNECT, EVENT_ON_DISCONNECT, EVENT_ON_DESTROY,
    EVENT_ON_REMOTE_DIED];
}

function levelCatalog(): string[] {
  return [LEVEL_INFO, LEVEL_WARN, LEVEL_ERROR];
}

function errorCatalog(): number[] {
  return [ERROR_NONE, ERROR_STUB_REJECTED, ERROR_STUB_NOT_ALIVE, ERROR_SEQUENCE_RECLAIMED];
}

function unknownCatalog(): number[] {
  return [UNKNOWN_CODE_ZERO, UNKNOWN_CODE_TWO, UNKNOWN_CODE_NEGATIVE, UNKNOWN_CODE_LARGE];
}

function stringCatalog(): string[] {
  return [STUB_DESCRIPTOR, STUB_BUNDLE, STUB_ABILITY, CLIENT_BUNDLE, REQUEST_PAYLOAD, REPLY_PAYLOAD];
}

function catalogSummary(): string {
  return joined([STUB_DESCRIPTOR, String(REQUEST_CODE), REPLY_PAYLOAD], ':');
}

export default function protocolCatalogTest(): void {
  describe('ProtocolCatalogTest', () => {
    beforeAll(() => {
      logSuite('ProtocolCatalogTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('ProtocolCatalogTest', 'end');
    });

    /**
     * @tc.name          protocolCatalogRequestCodeIsOne
     * @tc.desc          The catalog fixes the single accepted request code at 1.
     * @tc.precondition  The shared constants are loaded.
     * @tc.steps         1. Read REQUEST_CODE.
     *                   2. Compare with the literal.
     *                   3. Compare with the unknown catalog.
     * @tc.expected      The request code is 1 and appears in no unknown entry.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('protocolCatalogRequestCodeIsOne', 0, () => {
      expect(REQUEST_CODE).assertEqual(1);
      expect(REQUEST_CODE).assertEqual(REQUEST_CODE * 1);
      expect(REQUEST_CODE).assertLarger(0);
      expect(unknownCatalog().indexOf(REQUEST_CODE)).assertEqual(-1);
      expect(REQUEST_CODE === UNKNOWN_CODE_ZERO).assertFalse();
      expect(REQUEST_CODE === UNKNOWN_CODE_TWO).assertFalse();
      expect(REQUEST_CODE === UNKNOWN_CODE_LARGE).assertFalse();
      expect(String(REQUEST_CODE)).assertEqual('1');
    });

    /**
     * @tc.name          protocolCatalogReplyLiteral
     * @tc.desc          The catalog fixes the reply literal at 'hello rpc'.
     * @tc.precondition  The shared constants are loaded.
     * @tc.steps         1. Read REPLY_PAYLOAD.
     *                   2. Compare with the literal and length.
     *                   3. Compare with the request payload.
     * @tc.expected      The reply is 'hello rpc' with nine characters.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('protocolCatalogReplyLiteral', 0, () => {
      expect(REPLY_PAYLOAD).assertEqual('hello rpc');
      expect(REPLY_PAYLOAD.length).assertEqual(9);
      expect(REPLY_PAYLOAD.startsWith('hello')).assertTrue();
      expect(REPLY_PAYLOAD.endsWith('rpc')).assertTrue();
      expect(REPLY_PAYLOAD === REQUEST_PAYLOAD).assertFalse();
      expect(REPLY_PAYLOAD.indexOf(' ')).assertEqual(5);
      expect(REPLY_PAYLOAD.charCodeAt(5)).assertEqual(32);
      expect(textFingerprint(REPLY_PAYLOAD)).assertLarger(0);
    });

    /**
     * @tc.name          protocolCatalogRequestPayloadLiteral
     * @tc.desc          The catalog fixes the request payload at 'hello world'.
     * @tc.precondition  The shared constants are loaded.
     * @tc.steps         1. Read REQUEST_PAYLOAD.
     *                   2. Compare with the literal and length.
     *                   3. Compare the trailing word.
     * @tc.expected      The payload is 'hello world' with eleven characters.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('protocolCatalogRequestPayloadLiteral', 0, () => {
      expect(REQUEST_PAYLOAD).assertEqual('hello world');
      expect(REQUEST_PAYLOAD.length).assertEqual(11);
      expect(REQUEST_PAYLOAD.startsWith('hello')).assertTrue();
      expect(REQUEST_PAYLOAD.endsWith('world')).assertTrue();
      expect(REQUEST_PAYLOAD.substring(6)).assertEqual('world');
      expect(REQUEST_PAYLOAD.length - REPLY_PAYLOAD.length).assertEqual(2);
      expect(REQUEST_PAYLOAD === REPLY_PAYLOAD).assertFalse();
      expect(textFingerprint(REQUEST_PAYLOAD) === textFingerprint(REPLY_PAYLOAD)).assertFalse();
    });
    /**
     * @tc.name          protocolCatalogDescriptorLiteral
     * @tc.desc          The catalog fixes the stub descriptor at IPCStubTest.
     * @tc.precondition  The shared constants are loaded.
     * @tc.steps         1. Read STUB_DESCRIPTOR.
     *                   2. Compare with the literal and length.
     *                   3. Compare with the stub default.
     * @tc.expected      The descriptor is IPCStubTest with eleven characters.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('protocolCatalogDescriptorLiteral', 0, () => {
      expect(STUB_DESCRIPTOR).assertEqual('IPCStubTest');
      expect(STUB_DESCRIPTOR.length).assertEqual(11);
      expect(STUB_DESCRIPTOR.startsWith('IPC')).assertTrue();
      expect(STUB_DESCRIPTOR.endsWith('Test')).assertTrue();
      expect(STUB_DESCRIPTOR.indexOf('Stub')).assertEqual(3);
      expect(new StubRemoteObjectModel().descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(new StubRemoteObjectModel().descriptor).assertEqual('IPCStubTest');
      expect(STUB_DESCRIPTOR === 'IPCStub').assertFalse();
    });

    /**
     * @tc.name          protocolCatalogBundleLiteral
     * @tc.desc          The catalog fixes the stub bundle at com.example.ipc_stub.
     * @tc.precondition  The shared constants are loaded.
     * @tc.steps         1. Read STUB_BUNDLE.
     *                   2. Compare with the literal.
     *                   3. Check the dot separators.
     * @tc.expected      The bundle has two dots and ends with ipc_stub.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('protocolCatalogBundleLiteral', 0, () => {
      expect(STUB_BUNDLE).assertEqual('com.example.ipc_stub');
      expect(STUB_BUNDLE.length).assertEqual(20);
      expect(STUB_BUNDLE.startsWith('com.')).assertTrue();
      expect(STUB_BUNDLE.endsWith('ipc_stub')).assertTrue();
      expect(STUB_BUNDLE.indexOf('.')).assertEqual(3);
      expect(STUB_BUNDLE.lastIndexOf('.')).assertEqual(11);
      expect(STUB_BUNDLE.split('.').length).assertEqual(3);
      expect(STUB_BUNDLE.split('.')[2]).assertEqual('ipc_stub');
    });

    /**
     * @tc.name          protocolCatalogAbilityLiteral
     * @tc.desc          The catalog fixes the ability name at ServiceAbility.
     * @tc.precondition  The shared constants are loaded.
     * @tc.steps         1. Read STUB_ABILITY.
     *                   2. Compare with the literal.
     *                   3. Check its prefix and suffix.
     * @tc.expected      The ability name is ServiceAbility with 14 characters.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('protocolCatalogAbilityLiteral', 0, () => {
      expect(STUB_ABILITY).assertEqual('ServiceAbility');
      expect(STUB_ABILITY.length).assertEqual(14);
      expect(STUB_ABILITY.startsWith('Service')).assertTrue();
      expect(STUB_ABILITY.endsWith('Ability')).assertTrue();
      expect(STUB_ABILITY.charAt(0)).assertEqual('S');
      expect(STUB_ABILITY.indexOf('Ability')).assertEqual(7);
      expect(STUB_ABILITY === 'ServiceExtAbility').assertFalse();
      expect(STUB_ABILITY.toUpperCase()).assertEqual('SERVICEABILITY');
    });

    /**
     * @tc.name          protocolCatalogClientBundleLiteral
     * @tc.desc          The catalog fixes the client bundle at com.example.ipc_client.
     * @tc.precondition  The shared constants are loaded.
     * @tc.steps         1. Read CLIENT_BUNDLE.
     *                   2. Compare with the literal.
     *                   3. Compare with the stub bundle.
     * @tc.expected      The client bundle ends with ipc_client and differs from the stub.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('protocolCatalogClientBundleLiteral', 0, () => {
      expect(CLIENT_BUNDLE).assertEqual('com.example.ipc_client');
      expect(CLIENT_BUNDLE.length).assertEqual(22);
      expect(CLIENT_BUNDLE.endsWith('ipc_client')).assertTrue();
      expect(CLIENT_BUNDLE.startsWith('com.example.')).assertTrue();
      expect(CLIENT_BUNDLE === STUB_BUNDLE).assertFalse();
      expect(CLIENT_BUNDLE.length - STUB_BUNDLE.length).assertEqual(2);
      expect(CLIENT_BUNDLE.split('.').length).assertEqual(3);
      expect(CLIENT_BUNDLE.split('.')[2]).assertEqual('ipc_client');
    });

    /**
     * @tc.name          protocolCatalogBundlePairDiffers
     * @tc.desc          The stub and client bundles differ only in the role suffix.
     * @tc.precondition  Both bundle constants are loaded.
     * @tc.steps         1. Compare common prefixes.
     *                   2. Compare the role suffixes.
     *                   3. Compare both full strings.
     * @tc.expected      The shared prefix is com.example.ipc_ and the suffixes differ.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('protocolCatalogBundlePairDiffers', 0, () => {
      expect(STUB_BUNDLE.substring(0, 16)).assertEqual('com.example.ipc_');
      expect(CLIENT_BUNDLE.substring(0, 16)).assertEqual('com.example.ipc_');
      expect(STUB_BUNDLE.substring(16)).assertEqual('stub');
      expect(CLIENT_BUNDLE.substring(16)).assertEqual('client');
      expect(STUB_BUNDLE.substring(16) === CLIENT_BUNDLE.substring(16)).assertFalse();
      expect(STUB_BUNDLE === CLIENT_BUNDLE).assertFalse();
      expect(textFingerprint(STUB_BUNDLE) === textFingerprint(CLIENT_BUNDLE)).assertFalse();
      expect(stringCatalog().indexOf(STUB_BUNDLE)).assertEqual(1);
    });

    /**
     * @tc.name          protocolCatalogEventNames
     * @tc.desc          The lifecycle event catalog holds the six documented names.
     * @tc.precondition  The event constants are loaded.
     * @tc.steps         1. Read the event catalog.
     *                   2. Compare each entry.
     *                   3. Check the common prefix.
     * @tc.expected      All six names start with 'on' and match the literals.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('protocolCatalogEventNames', 0, () => {
      const events = eventCatalog();
      expect(events.length).assertEqual(6);
      expect(events[0]).assertEqual('onCreate');
      expect(events[1]).assertEqual('onRequest');
      expect(events[2]).assertEqual('onConnect');
      expect(events[3]).assertEqual('onDisconnect');
      expect(events[4]).assertEqual('onDestroy');
      expect(events[5]).assertEqual('onRemoteDied');
      for (let index = 0; index < events.length; index++) {
        expect(events[index].startsWith('on')).assertTrue();
      }
      expect(events.length).assertEqual(6);
    });

    /**
     * @tc.name          protocolCatalogEventCount
     * @tc.desc          The event catalog contains six unique names.
     * @tc.precondition  The event constants are loaded.
     * @tc.steps         1. Read the catalog.
     *                   2. Count unique entries.
     *                   3. Compare with the length.
     * @tc.expected      Six unique event names exist.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('protocolCatalogEventCount', 0, () => {
      const events = eventCatalog();
      const unique: string[] = [];
      for (let index = 0; index < events.length; index++) {
        if (unique.indexOf(events[index]) < 0) {
          unique.push(events[index]);
        }
      }
      expect(unique.length).assertEqual(6);
      expect(unique.length).assertEqual(events.length);
      expect(countOf(events, EVENT_ON_CONNECT)).assertEqual(1);
      expect(countOf(events, EVENT_ON_DESTROY)).assertEqual(1);
      expect(events.indexOf('onMissing')).assertEqual(-1);
      expect(joined(events, ',').split(',').length).assertEqual(6);
      expect(events[0] === events[5]).assertFalse();
      expect(events[2].length).assertEqual(9);
    });

    /**
     * @tc.name          protocolCatalogCreateEvent
     * @tc.desc          The create callback is recorded by the lifecycle model under the catalog name.
     * @tc.precondition  A fresh lifecycle model.
     * @tc.steps         1. Call onCreate.
     *                   2. Read the event entry.
     *                   3. Compare with the catalog name.
     * @tc.expected      The entry equals EVENT_ON_CREATE.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('protocolCatalogCreateEvent', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      expect(service.events.last()).assertEqual(EVENT_ON_CREATE);
      expect(service.events.last()).assertEqual('onCreate');
      expect(service.events.countOf(EVENT_ON_CREATE)).assertEqual(1);
      expect(service.events.entries[0]).assertEqual(eventCatalog()[0]);
      expect(service.state).assertEqual('created');
      expect(service.logs.contains(EVENT_ON_CREATE)).assertTrue();
      expect(service.events.size()).assertEqual(1);
      expect(service.events.trace()).assertEqual(EVENT_ON_CREATE);
    });
    /**
     * @tc.name          protocolCatalogRequestEvent
     * @tc.desc          The request callback uses the catalog event name with a start id detail.
     * @tc.precondition  A fresh lifecycle model.
     * @tc.steps         1. Call onRequest with id 17.
     *                   2. Read the event entry.
     *                   3. Compare the prefix with the catalog name.
     * @tc.expected      The entry starts with EVENT_ON_REQUEST and ends with :17.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('protocolCatalogRequestEvent', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onRequest(17);
      expect(service.events.entries[0]).assertEqual('onRequest:17');
      expect(service.events.entries[0].startsWith(EVENT_ON_REQUEST)).assertTrue();
      expect(service.events.entries[0].endsWith(':17')).assertTrue();
      expect(service.events.entries[0]).assertContain(EVENT_ON_REQUEST);
      expect(service.events.countOf(EVENT_ON_REQUEST)).assertEqual(1);
      expect(service.requestCount).assertEqual(1);
      expect(service.events.last()).assertEqual('onRequest:17');
      expect(eventCatalog()[1]).assertEqual(EVENT_ON_REQUEST);
    });

    /**
     * @tc.name          protocolCatalogConnectEvent
     * @tc.desc          The connect callback records the catalog name and descriptor.
     * @tc.precondition  A fresh lifecycle model.
     * @tc.steps         1. Call onConnect.
     *                   2. Read the event entry.
     *                   3. Compare prefix and detail.
     * @tc.expected      The entry is onConnect:IPCStubTest.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('protocolCatalogConnectEvent', 0, () => {
      const service = new ServiceLifecycleModel();
      const stub = service.onConnect();
      expect(service.events.entries[0]).assertEqual('onConnect:' + STUB_DESCRIPTOR);
      expect(service.events.entries[0]).assertEqual('onConnect:IPCStubTest');
      expect(service.events.entries[0].startsWith(EVENT_ON_CONNECT)).assertTrue();
      expect(service.events.entries[0].endsWith(STUB_DESCRIPTOR)).assertTrue();
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(1);
      expect(stub.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(service.connectCount).assertEqual(1);
      expect(eventCatalog()[2]).assertEqual(EVENT_ON_CONNECT);
    });

    /**
     * @tc.name          protocolCatalogDisconnectEvent
     * @tc.desc          The disconnect callback records the bare catalog name.
     * @tc.precondition  A connected lifecycle model.
     * @tc.steps         1. Disconnect.
     *                   2. Read the last event.
     *                   3. Compare with the catalog name.
     * @tc.expected      The last event is exactly onDisconnect.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('protocolCatalogDisconnectEvent', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onConnect();
      service.onDisconnect();
      expect(service.events.last()).assertEqual(EVENT_ON_DISCONNECT);
      expect(service.events.last()).assertEqual('onDisconnect');
      expect(service.events.last().indexOf(':')).assertEqual(-1);
      expect(service.events.countOf(EVENT_ON_DISCONNECT)).assertEqual(1);
      expect(service.state).assertEqual('disconnected');
      expect(service.disconnectCount).assertEqual(1);
      expect(eventCatalog()[3]).assertEqual(EVENT_ON_DISCONNECT);
      expect(service.logs.contains(EVENT_ON_DISCONNECT)).assertTrue();
    });

    /**
     * @tc.name          protocolCatalogDestroyEvent
     * @tc.desc          The destroy callback records the bare catalog name.
     * @tc.precondition  A connected lifecycle model.
     * @tc.steps         1. Destroy.
     *                   2. Read the last event.
     *                   3. Compare with the catalog name.
     * @tc.expected      The last event is exactly onDestroy.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('protocolCatalogDestroyEvent', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onConnect();
      service.onDestroy();
      expect(service.events.last()).assertEqual(EVENT_ON_DESTROY);
      expect(service.events.last()).assertEqual('onDestroy');
      expect(service.events.countOf(EVENT_ON_DESTROY)).assertEqual(1);
      expect(service.state).assertEqual('destroyed');
      expect(service.destroyCount).assertEqual(1);
      expect(service.isAlive()).assertFalse();
      expect(eventCatalog()[4]).assertEqual(EVENT_ON_DESTROY);
      expect(service.events.last() === EVENT_ON_DISCONNECT).assertFalse();
    });

    /**
     * @tc.name          protocolCatalogErrorCodeCatalog
     * @tc.desc          The error catalog holds the four documented codes.
     * @tc.precondition  The error constants are loaded.
     * @tc.steps         1. Read the error catalog.
     *                   2. Compare each entry with its literal.
     *                   3. Compare the catalog length.
     * @tc.expected      The catalog is 0, 16000011, 16000012 and 16000013.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('protocolCatalogErrorCodeCatalog', 0, () => {
      const errors = errorCatalog();
      expect(errors.length).assertEqual(4);
      expect(errors[0]).assertEqual(0);
      expect(errors[1]).assertEqual(16000011);
      expect(errors[2]).assertEqual(16000012);
      expect(errors[3]).assertEqual(16000013);
      expect(errors[0]).assertEqual(ERROR_NONE);
      expect(errors[1]).assertEqual(ERROR_STUB_REJECTED);
      expect(errors[2]).assertEqual(ERROR_STUB_NOT_ALIVE);
      expect(errors[3]).assertEqual(ERROR_SEQUENCE_RECLAIMED);
    });

    /**
     * @tc.name          protocolCatalogErrorCodesAscending
     * @tc.desc          The error catalog is strictly ascending.
     * @tc.precondition  The error constants are loaded.
     * @tc.steps         1. Walk adjacent pairs.
     *                   2. Compare each with its successor.
     *                   3. Verify the failure gap pattern.
     * @tc.expected      Each code is smaller than the next.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('protocolCatalogErrorCodesAscending', 0, () => {
      const errors = errorCatalog();
      for (let index = 0; index + 1 < errors.length; index++) {
        expect(errors[index]).assertLess(errors[index + 1]);
      }
      expect(errors[1] - errors[0]).assertEqual(16000011);
      expect(errors[2] - errors[1]).assertEqual(1);
      expect(errors[3] - errors[2]).assertEqual(1);
      expect(errors[0]).assertEqual(0);
      expect(errors[3]).assertEqual(16000013);
      expect(errors[3]).assertLarger(errors[0]);
      expect(errors.length).assertEqual(4);
    });

    /**
     * @tc.name          protocolCatalogOptionFlagCatalog
     * @tc.desc          The option flags are the catalog values 0 and 1.
     * @tc.precondition  The option constants are loaded.
     * @tc.steps         1. Read both flag constants.
     *                   2. Compare their sum and difference.
     *                   3. Build options with them.
     * @tc.expected      Sync is 0, async is 1 and the difference is 1.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('protocolCatalogOptionFlagCatalog', 0, () => {
      expect(OPTION_FLAG_SYNC).assertEqual(0);
      expect(OPTION_FLAG_ASYNC).assertEqual(1);
      expect(OPTION_FLAG_ASYNC - OPTION_FLAG_SYNC).assertEqual(1);
      expect(OPTION_FLAG_SYNC + OPTION_FLAG_ASYNC).assertEqual(1);
      expect(OPTION_FLAG_SYNC).assertLess(OPTION_FLAG_ASYNC);
      expect(new MessageOptionModel(OPTION_FLAG_SYNC).describe()).assertEqual('0/0/false');
      expect(new MessageOptionModel(OPTION_FLAG_ASYNC).describe()).assertEqual('1/0/false');
      expect(new MessageOptionModel(OPTION_FLAG_ASYNC).isSync()).assertFalse();
    });

    /**
     * @tc.name          protocolCatalogSyncIsZero
     * @tc.desc          A zero flag option is synchronous under the catalog rules.
     * @tc.precondition  The option model is available.
     * @tc.steps         1. Build a zero-flag option.
     *                   2. Query isSync and describe.
     *                   3. Compare with the default option.
     * @tc.expected      The zero-flag option is synchronous and describes 0/0/false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('protocolCatalogSyncIsZero', 0, () => {
      const option = new MessageOptionModel(0, 0, false);
      expect(option.flags).assertEqual(OPTION_FLAG_SYNC);
      expect(option.isSync()).assertTrue();
      expect(option.describe()).assertEqual('0/0/false');
      expect(option.describe().startsWith(String(OPTION_FLAG_SYNC) + '/')).assertTrue();
      expect(new MessageOptionModel().isSync()).assertEqual(option.isSync());
      expect(new MessageOptionModel().describe()).assertEqual(option.describe());
      expect(option.sync).assertFalse();
      expect(option.waitTime).assertEqual(0);
    });
    /**
     * @tc.name          protocolCatalogAsyncIsOne
     * @tc.desc          A one-flag option is asynchronous under the catalog rules.
     * @tc.precondition  The option model is available.
     * @tc.steps         1. Build a flag-one option.
     *                   2. Query isSync and describe.
     *                   3. Compare with the sync option.
     * @tc.expected      The one-flag option is asynchronous and describes 1/0/false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('protocolCatalogAsyncIsOne', 0, () => {
      const option = new MessageOptionModel(OPTION_FLAG_ASYNC, 0, false);
      expect(option.flags).assertEqual(OPTION_FLAG_ASYNC);
      expect(option.isSync()).assertFalse();
      expect(option.describe()).assertEqual('1/0/false');
      expect(option.describe().startsWith(String(OPTION_FLAG_ASYNC) + '/')).assertTrue();
      expect(option.isSync()).assertEqual(!new MessageOptionModel().isSync());
      expect(option.describe() === new MessageOptionModel().describe()).assertFalse();
      expect(option.waitTime).assertEqual(0);
      expect(option.sync).assertFalse();
    });

    /**
     * @tc.name          protocolCatalogLevelNames
     * @tc.desc          The log level catalog holds INFO, WARN and ERROR.
     * @tc.precondition  The level constants are loaded.
     * @tc.steps         1. Read the level catalog.
     *                   2. Compare each entry.
     *                   3. Check the catalog length.
     * @tc.expected      The levels are INFO, WARN and ERROR.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('protocolCatalogLevelNames', 0, () => {
      const levels = levelCatalog();
      expect(levels.length).assertEqual(3);
      expect(levels[0]).assertEqual('INFO');
      expect(levels[1]).assertEqual('WARN');
      expect(levels[2]).assertEqual('ERROR');
      expect(levels[0]).assertEqual(LEVEL_INFO);
      expect(levels[1]).assertEqual(LEVEL_WARN);
      expect(levels[2]).assertEqual(LEVEL_ERROR);
      expect(levels.indexOf(LEVEL_WARN)).assertEqual(1);
      expect(levels.indexOf('DEBUG')).assertEqual(-1);
    });

    /**
     * @tc.name          protocolCatalogLevelCatalogDistinct
     * @tc.desc          Every level name is unique and upper case.
     * @tc.precondition  The level constants are loaded.
     * @tc.steps         1. Walk the catalog.
     *                   2. Compare each with its upper-case form.
     *                   3. Count unique entries.
     * @tc.expected      Three unique upper-case levels exist.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('protocolCatalogLevelCatalogDistinct', 0, () => {
      const levels = levelCatalog();
      const unique: string[] = [];
      for (let index = 0; index < levels.length; index++) {
        expect(levels[index]).assertEqual(levels[index].toUpperCase());
        expect(levels[index].toLowerCase() === levels[index]).assertFalse();
        if (unique.indexOf(levels[index]) < 0) {
          unique.push(levels[index]);
        }
      }
      expect(unique.length).assertEqual(3);
      expect(unique.length).assertEqual(levels.length);
      expect(levels[0].length).assertEqual(4);
      expect(levels[1].length).assertEqual(4);
      expect(levels[2].length).assertEqual(5);
      expect(joined(levels, '/')).assertEqual('INFO/WARN/ERROR');
      expect(countOf(levels, LEVEL_ERROR)).assertEqual(1);
    });

    /**
     * @tc.name          protocolCatalogUnknownCodeCatalog
     * @tc.desc          The unknown catalog holds the four representative codes.
     * @tc.precondition  The unknown constants are loaded.
     * @tc.steps         1. Read the unknown catalog.
     *                   2. Compare each entry.
     *                   3. Compare the catalog length.
     * @tc.expected      The catalog is 0, 2, -1 and 99.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('protocolCatalogUnknownCodeCatalog', 0, () => {
      const codes = unknownCatalog();
      expect(codes.length).assertEqual(4);
      expect(codes[0]).assertEqual(0);
      expect(codes[1]).assertEqual(2);
      expect(codes[2]).assertEqual(-1);
      expect(codes[3]).assertEqual(99);
      expect(codes[0]).assertEqual(UNKNOWN_CODE_ZERO);
      expect(codes[1]).assertEqual(UNKNOWN_CODE_TWO);
      expect(codes[2]).assertEqual(UNKNOWN_CODE_NEGATIVE);
      expect(codes[3]).assertEqual(UNKNOWN_CODE_LARGE);
    });

    /**
     * @tc.name          protocolCatalogUnknownCodesExcludeOne
     * @tc.desc          No unknown catalog entry equals the accepted request code.
     * @tc.precondition  The unknown catalog is available.
     * @tc.steps         1. Walk the catalog.
     *                   2. Compare each entry with 1.
     *                   3. Count matches.
     * @tc.expected      Zero entries equal the request code.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('protocolCatalogUnknownCodesExcludeOne', 0, () => {
      const codes = unknownCatalog();
      let matches = 0;
      for (let index = 0; index < codes.length; index++) {
        if (codes[index] === REQUEST_CODE) {
          matches = matches + 1;
        }
        expect(codes[index] === REQUEST_CODE).assertFalse();
      }
      expect(matches).assertEqual(0);
      expect(codes.indexOf(REQUEST_CODE)).assertEqual(-1);
      expect(codes.indexOf(0)).assertEqual(0);
      expect(codes.indexOf(99)).assertEqual(3);
      expect(codes.indexOf(-1)).assertEqual(2);
      expect(codes.length).assertEqual(4);
      expect(new StubRemoteObjectModel().descriptor).assertEqual(STUB_DESCRIPTOR);
    });

    /**
     * @tc.name          protocolCatalogResponseLiteralLength
     * @tc.desc          The reply literal length is derived from its words.
     * @tc.precondition  The reply constant is loaded.
     * @tc.steps         1. Split the reply on the space.
     *                   2. Sum both word lengths.
     *                   3. Add the separator.
     * @tc.expected      Both words plus one space equal nine characters.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('protocolCatalogResponseLiteralLength', 0, () => {
      const words = REPLY_PAYLOAD.split(' ');
      expect(words.length).assertEqual(2);
      expect(words[0]).assertEqual('hello');
      expect(words[1]).assertEqual('rpc');
      expect(words[0].length).assertEqual(5);
      expect(words[1].length).assertEqual(3);
      expect(words[0].length + words[1].length + 1).assertEqual(REPLY_PAYLOAD.length);
      expect(REPLY_PAYLOAD.length).assertEqual(9);
      expect(REPLY_PAYLOAD.indexOf(words[1])).assertEqual(6);
    });

    /**
     * @tc.name          protocolCatalogDescriptorLength
     * @tc.desc          The descriptor literal is eleven characters with a mixed case shape.
     * @tc.precondition  The descriptor constant is loaded.
     * @tc.steps         1. Check the three case segments.
     *                   2. Sum their lengths.
     *                   3. Compare with the descriptor length.
     * @tc.expected      IPC plus Stub plus Test equals eleven characters.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('protocolCatalogDescriptorLength', 0, () => {
      const descriptor = STUB_DESCRIPTOR;
      expect(descriptor.substring(0, 3)).assertEqual('IPC');
      expect(descriptor.substring(3, 7)).assertEqual('Stub');
      expect(descriptor.substring(7)).assertEqual('Test');
      expect('IPC'.length + 'Stub'.length + 'Test'.length).assertEqual(descriptor.length);
      expect(descriptor.length).assertEqual(11);
      expect(descriptor.toUpperCase()).assertEqual('IPCSTUBTEST');
      expect(descriptor.toLowerCase()).assertEqual('ipcstubtest');
      expect(descriptor.charAt(3)).assertEqual('S');
    });

    /**
     * @tc.name          protocolCatalogBundleFormat
     * @tc.desc          Both bundles follow the three-segment dotted format.
     * @tc.precondition  Both bundle constants are loaded.
     * @tc.steps         1. Split both bundles.
     *                   2. Compare the first two segments.
     *                   3. Compare the third segments.
     * @tc.expected      Both start with com.example and differ in the role segment.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('protocolCatalogBundleFormat', 0, () => {
      const stubParts = STUB_BUNDLE.split('.');
      const clientParts = CLIENT_BUNDLE.split('.');
      expect(stubParts.length).assertEqual(3);
      expect(clientParts.length).assertEqual(3);
      expect(stubParts[0]).assertEqual('com');
      expect(stubParts[1]).assertEqual('example');
      expect(clientParts[0]).assertEqual(stubParts[0]);
      expect(clientParts[1]).assertEqual(stubParts[1]);
      expect(stubParts[2]).assertEqual('ipc_stub');
      expect(clientParts[2]).assertEqual('ipc_client');
      expect(stubParts[2] === clientParts[2]).assertFalse();
    });
    /**
     * @tc.name          protocolCatalogAbilitySuffix
     * @tc.desc          The ability name is the Service plus Ability compound.
     * @tc.precondition  The ability constant is loaded.
     * @tc.steps         1. Slice the name into two words.
     *                   2. Sum the word lengths.
     *                   3. Compare with the full length.
     * @tc.expected      Service plus Ability equals the full name length.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('protocolCatalogAbilitySuffix', 0, () => {
      expect(STUB_ABILITY.substring(0, 7)).assertEqual('Service');
      expect(STUB_ABILITY.substring(7)).assertEqual('Ability');
      expect('Service'.length + 'Ability'.length).assertEqual(STUB_ABILITY.length);
      expect(STUB_ABILITY.length).assertEqual(14);
      expect(STUB_ABILITY.indexOf('Ability')).assertEqual(7);
      expect(STUB_ABILITY.startsWith('Service')).assertTrue();
      expect(STUB_ABILITY.endsWith('Ability')).assertTrue();
      expect(STUB_ABILITY.indexOf('Extension')).assertEqual(-1);
    });

    /**
     * @tc.name          protocolCatalogCatalogSize
     * @tc.desc          The string catalog holds six protocol literals.
     * @tc.precondition  The string catalog helper is available.
     * @tc.steps         1. Read the catalog.
     *                   2. Compare its length.
     *                   3. Compare specific positions.
     * @tc.expected      Six distinct literals are listed.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('protocolCatalogCatalogSize', 0, () => {
      const catalog = stringCatalog();
      expect(catalog.length).assertEqual(6);
      expect(catalog[0]).assertEqual(STUB_DESCRIPTOR);
      expect(catalog[1]).assertEqual(STUB_BUNDLE);
      expect(catalog[2]).assertEqual(STUB_ABILITY);
      expect(catalog[3]).assertEqual(CLIENT_BUNDLE);
      expect(catalog[4]).assertEqual(REQUEST_PAYLOAD);
      expect(catalog[5]).assertEqual(REPLY_PAYLOAD);
      expect(catalog.length).assertEqual(6);
      expect(catalog.indexOf(REPLY_PAYLOAD)).assertEqual(5);
    });

    /**
     * @tc.name          protocolCatalogAllStringsNonEmpty
     * @tc.desc          Every catalog literal is non-empty and already trimmed.
     * @tc.precondition  The string catalog helper is available.
     * @tc.steps         1. Walk the catalog.
     *                   2. Compare each with its trimmed form.
     *                   3. Count empty entries.
     * @tc.expected      All six literals are non-empty and trimmed.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('protocolCatalogAllStringsNonEmpty', 0, () => {
      const catalog = stringCatalog();
      let empty = 0;
      for (let index = 0; index < catalog.length; index++) {
        expect(catalog[index].length).assertLarger(0);
        expect(catalog[index].trim()).assertEqual(catalog[index]);
        if (catalog[index].length === 0) {
          empty = empty + 1;
        }
      }
      expect(empty).assertEqual(0);
      expect(catalog[0].length).assertEqual(11);
      expect(catalog[5].length).assertEqual(9);
      expect(joined(catalog, '|').length).assertLarger(catalog.length);
      expect(textFingerprint(joined(catalog, '|'))).assertLarger(0);
    });

    /**
     * @tc.name          protocolCatalogEventSuffixCapital
     * @tc.desc          Every event name starts with 'on' and a capital letter.
     * @tc.precondition  The event catalog is available.
     * @tc.steps         1. Walk the catalog.
     *                   2. Check the two-letter prefix.
     *                   3. Check the third character case.
     * @tc.expected      Each name has a capital at index two.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('protocolCatalogEventSuffixCapital', 0, () => {
      const events = eventCatalog();
      for (let index = 0; index < events.length; index++) {
        expect(events[index].substring(0, 2)).assertEqual('on');
        const third = events[index].charAt(2);
        expect(third).assertEqual(third.toUpperCase());
        expect(third.charCodeAt(0)).assertLarger(64);
        expect(third.charCodeAt(0)).assertLess(91);
      }
      expect(events[0].charAt(2)).assertEqual('C');
      expect(events[1].charAt(2)).assertEqual('R');
      expect(events[2].charAt(2)).assertEqual('C');
      expect(events[5].charAt(2)).assertEqual('R');
    });

    /**
     * @tc.name          protocolCatalogEventNamesNoDigits
     * @tc.desc          Lifecycle event names contain no digit characters.
     * @tc.precondition  The event catalog is available.
     * @tc.steps         1. Walk the catalog.
     *                   2. Search for each digit.
     *                   3. Sum the digit hits.
     * @tc.expected      No event name contains a digit.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('protocolCatalogEventNamesNoDigits', 0, () => {
      const events = eventCatalog();
      const digits: string[] = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
      let hits = 0;
      for (let eventIndex = 0; eventIndex < events.length; eventIndex++) {
        for (let digitIndex = 0; digitIndex < digits.length; digitIndex++) {
          if (events[eventIndex].indexOf(digits[digitIndex]) >= 0) {
            hits = hits + 1;
          }
        }
        expect(events[eventIndex]).assertEqual(events[eventIndex].trim());
        expect(events[eventIndex].length).assertLarger(5);
      }
      expect(hits).assertEqual(0);
      expect(events[5]).assertEqual('onRemoteDied');
      expect(events[5].length).assertEqual(12);
      expect(events.indexOf('onRequest')).assertEqual(1);
    });

    /**
     * @tc.name          protocolCatalogErrorNoneZero
     * @tc.desc          The catalog success code is exactly zero.
     * @tc.precondition  The error catalog is available.
     * @tc.steps         1. Read the first catalog entry.
     *                   2. Compare with zero.
     *                   3. Compare with the constant.
     * @tc.expected      The catalog entry and the error constant both equal zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('protocolCatalogErrorNoneZero', 0, () => {
      const errors = errorCatalog();
      expect(errors[0]).assertEqual(0);
      expect(errors[0]).assertEqual(ERROR_NONE);
      expect(errors[0]).assertLess(1);
      expect(errors[0]).assertEqual(errors.indexOf(0));
      expect(ERROR_NONE === errors[1]).assertFalse();
      expect(String(errors[0])).assertEqual('0');
      expect(Math.floor(errors[0])).assertEqual(0);
      expect(errors[0] * 100).assertEqual(0);
    });

    /**
     * @tc.name          protocolCatalogErrorRejectedRange
     * @tc.desc          The rejection code sits in the sixteen-million band.
     * @tc.precondition  The error catalog is available.
     * @tc.steps         1. Check the lower band bound.
     *                   2. Check the upper band bound.
     *                   3. Compare the tail digits.
     * @tc.expected      The rejection code is 16000011.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('protocolCatalogErrorRejectedRange', 0, () => {
      const rejected = errorCatalog()[1];
      expect(rejected).assertEqual(16000011);
      expect(rejected).assertLarger(16000000);
      expect(rejected).assertLess(16000099);
      expect(String(rejected).endsWith('011')).assertTrue();
      expect(String(rejected).startsWith('16000')).assertTrue();
      expect(rejected - 16000000).assertEqual(11);
      expect(rejected).assertEqual(ERROR_STUB_REJECTED);
      expect(rejected === ERROR_NONE).assertFalse();
    });

    /**
     * @tc.name          protocolCatalogErrorNotAliveTail
     * @tc.desc          The not-alive code is the rejection code plus one.
     * @tc.precondition  The error catalog is available.
     * @tc.steps         1. Read both codes.
     *                   2. Compare their difference.
     *                   3. Compare string tails.
     * @tc.expected      The codes are 16000011 and 16000012.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('protocolCatalogErrorNotAliveTail', 0, () => {
      const errors = errorCatalog();
      expect(errors[2]).assertEqual(16000012);
      expect(errors[2] - errors[1]).assertEqual(1);
      expect(String(errors[2]).endsWith('012')).assertTrue();
      expect(String(errors[2]).length).assertEqual(8);
      expect(errors[2]).assertEqual(ERROR_STUB_NOT_ALIVE);
      expect(errors[2] === errors[1]).assertFalse();
      expect(errors[2]).assertLarger(errors[1]);
      expect(errors[2] % 2).assertEqual(0);
    });
    /**
     * @tc.name          protocolCatalogErrorReclaimedTail
     * @tc.desc          The reclaimed-sequence code follows the not-alive code.
     * @tc.precondition  The error catalog is available.
     * @tc.steps         1. Read the fourth entry.
     *                   2. Compare with the previous entry.
     *                   3. Compare the string tail.
     * @tc.expected      The reclaimed code is 16000013.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('protocolCatalogErrorReclaimedTail', 0, () => {
      const errors = errorCatalog();
      expect(errors[3]).assertEqual(16000013);
      expect(errors[3] - errors[2]).assertEqual(1);
      expect(errors[3]).assertEqual(ERROR_SEQUENCE_RECLAIMED);
      expect(String(errors[3]).endsWith('013')).assertTrue();
      expect(String(errors[3]).length).assertEqual(8);
      expect(errors[3]).assertLarger(16000012);
      expect(errors[3] % 2).assertEqual(1);
      expect(errors[3] === errors[0]).assertFalse();
    });

    /**
     * @tc.name          protocolCatalogConstantsRoundTrip
     * @tc.desc          Numeric catalog entries survive a string round trip.
     * @tc.precondition  The numeric catalogs are available.
     * @tc.steps         1. Convert each error code to a string.
     *                   2. Parse it back.
     *                   3. Compare with the original.
     * @tc.expected      Every code round-trips exactly.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('protocolCatalogConstantsRoundTrip', 0, () => {
      const errors = errorCatalog();
      for (let index = 0; index < errors.length; index++) {
        const text = String(errors[index]);
        expect(Number(text)).assertEqual(errors[index]);
        expect(text.length).assertLarger(0);
        expect(Math.floor(errors[index])).assertEqual(errors[index]);
      }
      expect(Number(String(REQUEST_CODE))).assertEqual(1);
      expect(Number(String(OPTION_FLAG_SYNC))).assertEqual(0);
      expect(Number(String(OPTION_FLAG_ASYNC))).assertEqual(1);
      expect(Number(String(errors[3]))).assertEqual(16000013);
      expect(Number('16000011')).assertEqual(errors[1]);
    });

    /**
     * @tc.name          protocolCatalogRequestReplyPair
     * @tc.desc          The request and reply literals form a distinct pair.
     * @tc.precondition  The payload constants are loaded.
     * @tc.steps         1. Compare the two literals.
     *                   2. Compare their lengths and fingerprints.
     *                   3. Check the shared word prefix.
     * @tc.expected      The pair shares 'hello' but differs overall.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('protocolCatalogRequestReplyPair', 0, () => {
      expect(REQUEST_PAYLOAD === REPLY_PAYLOAD).assertFalse();
      expect(REQUEST_PAYLOAD.substring(0, 5)).assertEqual(REPLY_PAYLOAD.substring(0, 5));
      expect(REQUEST_PAYLOAD.length).assertEqual(11);
      expect(REPLY_PAYLOAD.length).assertEqual(9);
      expect(REQUEST_PAYLOAD.length - REPLY_PAYLOAD.length).assertEqual(2);
      expect(textFingerprint(REQUEST_PAYLOAD) === textFingerprint(REPLY_PAYLOAD)).assertFalse();
      expect(REQUEST_PAYLOAD.split(' ')[0]).assertEqual('hello');
      expect(REPLY_PAYLOAD.split(' ')[0]).assertEqual('hello');
    });

    /**
     * @tc.name          protocolCatalogCatalogFingerprint
     * @tc.desc          The joined string catalog has a stable fingerprint.
     * @tc.precondition  The string catalog helper is available.
     * @tc.steps         1. Join the catalog with pipes.
     *                   2. Fingerprint it twice.
     *                   3. Compare with an equivalent join.
     * @tc.expected      The fingerprint is identical across evaluations.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('protocolCatalogCatalogFingerprint', 0, () => {
      const first = joined(stringCatalog(), '|');
      const second = joined(stringCatalog(), '|');
      expect(first).assertEqual(second);
      expect(textFingerprint(first)).assertEqual(textFingerprint(second));
      expect(textFingerprint(first)).assertLarger(0);
      expect(textFingerprint(first)).assertLess(1000003);
      expect(first.split('|').length).assertEqual(6);
      expect(first).assertContain(STUB_DESCRIPTOR);
      expect(first).assertContain(REPLY_PAYLOAD);
      expect(textFingerprint(joined([REPLY_PAYLOAD], '|'))).assertEqual(textFingerprint(REPLY_PAYLOAD));
    });

    /**
     * @tc.name          protocolCatalogDescriptorMatchesStub
     * @tc.desc          The catalog descriptor matches every stub construction path.
     * @tc.precondition  The descriptor constant and models are available.
     * @tc.steps         1. Build a default stub.
     *                   2. Build a stub through connect.
     *                   3. Compare all descriptors.
     * @tc.expected      All descriptors equal IPCStubTest.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('protocolCatalogDescriptorMatchesStub', 0, () => {
      const direct = new StubRemoteObjectModel();
      const service = new ServiceLifecycleModel();
      const connected = service.onConnect();
      expect(direct.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(connected.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(direct.descriptor).assertEqual(connected.descriptor);
      expect(direct === connected).assertFalse();
      expect(service.events.entries[0]).assertEqual('onConnect:' + STUB_DESCRIPTOR);
      expect(STUB_DESCRIPTOR.length).assertEqual(11);
      expect(new StubRemoteObjectModel('CustomDescriptor').descriptor).assertEqual('CustomDescriptor');
      expect(new StubRemoteObjectModel('CustomDescriptor').descriptor === STUB_DESCRIPTOR).assertFalse();
    });

    /**
     * @tc.name          protocolCatalogEventNamesUsedByLifecycle
     * @tc.desc          Every lifecycle callback uses a name from the catalog.
     * @tc.precondition  A fresh lifecycle model.
     * @tc.steps         1. Drive the whole lifecycle.
     *                   2. Read the event kinds.
     *                   3. Confirm each is listed in the catalog.
     * @tc.expected      All recorded kinds belong to the catalog.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('protocolCatalogEventNamesUsedByLifecycle', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onRequest(1);
      service.onConnect();
      service.onDisconnect();
      service.onDestroy();
      const events = eventCatalog();
      expect(service.events.size()).assertEqual(5);
      for (let index = 0; index < service.events.entries.length; index++) {
        const entry = service.events.entries[index];
        const colon = entry.indexOf(':');
        const kind = colon < 0 ? entry : entry.substring(0, colon);
        expect(events.indexOf(kind)).assertLarger(-1);
      }
      expect(service.events.countOf(EVENT_ON_CREATE)).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_REMOTE_DIED)).assertEqual(0);
      expect(events.length).assertEqual(6);
      expect(service.events.trace().startsWith(EVENT_ON_CREATE)).assertTrue();
    });

    /**
     * @tc.name          protocolCatalogLifecycleTraceUsesCatalog
     * @tc.desc          The lifecycle trace is built from catalog names only.
     * @tc.precondition  A service with four events.
     * @tc.steps         1. Drive create, request, connect and disconnect.
     *                   2. Split the trace on '>'.
     *                   3. Match each segment against the catalog.
     * @tc.expected      Four segments are present and all start with catalog names.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('protocolCatalogLifecycleTraceUsesCatalog', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onRequest(2);
      service.onConnect();
      service.onDisconnect();
      const trace = service.events.trace();
      const segments = trace.split('>');
      expect(segments.length).assertEqual(4);
      expect(segments[0]).assertEqual(EVENT_ON_CREATE);
      expect(segments[1]).assertEqual('onRequest:2');
      expect(segments[2]).assertEqual('onConnect:' + STUB_DESCRIPTOR);
      expect(segments[3]).assertEqual(EVENT_ON_DISCONNECT);
      expect(trace).assertEqual(joined(service.events.entries, '>'));
      expect(trace.indexOf(EVENT_ON_DESTROY)).assertEqual(-1);
      expect(service.events.size()).assertEqual(4);
    });

    /**
     * @tc.name          protocolCatalogOptionDescriptionsFromCatalog
     * @tc.desc          Option descriptions derive from the catalog flag values.
     * @tc.precondition  The option constants are loaded.
     * @tc.steps         1. Build options with both flags.
     *                   2. Join their descriptions.
     *                   3. Compare with the catalog-derived string.
     * @tc.expected      The descriptions are 0/0/false and 1/0/false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('protocolCatalogOptionDescriptionsFromCatalog', 0, () => {
      const sync = new MessageOptionModel(OPTION_FLAG_SYNC);
      const async = new MessageOptionModel(OPTION_FLAG_ASYNC);
      const descriptions = joined([sync.describe(), async.describe()], '|');
      expect(descriptions).assertEqual('0/0/false|1/0/false');
      expect(sync.describe().startsWith(String(OPTION_FLAG_SYNC))).assertTrue();
      expect(async.describe().startsWith(String(OPTION_FLAG_ASYNC))).assertTrue();
      expect(descriptions.split('|').length).assertEqual(2);
      expect(sync.isSync()).assertTrue();
      expect(async.isSync()).assertFalse();
      expect(async.describe()).assertEqual(String(OPTION_FLAG_ASYNC) + '/0/false');
      expect(sync.describe()).assertEqual(String(OPTION_FLAG_SYNC) + '/0/false');
    });
    /**
     * @tc.name          protocolCatalogErrorCodesFromCatalog
     * @tc.desc          The catalog error list equals the four exported constants.
     * @tc.precondition  The error catalog is available.
     * @tc.steps         1. Read the catalog.
     *                   2. Walk the constants.
     *                   3. Count differences.
     * @tc.expected      All four entries match their constants.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('protocolCatalogErrorCodesFromCatalog', 0, () => {
      const catalog = errorCatalog();
      const constants: number[] = [ERROR_NONE, ERROR_STUB_REJECTED, ERROR_STUB_NOT_ALIVE,
        ERROR_SEQUENCE_RECLAIMED];
      let differences = 0;
      for (let index = 0; index < constants.length; index++) {
        if (catalog[index] !== constants[index]) {
          differences = differences + 1;
        }
        expect(catalog[index]).assertEqual(constants[index]);
      }
      expect(differences).assertEqual(0);
      expect(catalog.length).assertEqual(constants.length);
      expect(catalog[0] === catalog[1]).assertFalse();
      expect(catalog[3]).assertEqual(16000013);
      expect(errorCatalog().length).assertEqual(4);
    });

    /**
     * @tc.name          protocolCatalogReplyFromCatalog
     * @tc.desc          The catalog reply equals the literal written by the stub.
     * @tc.precondition  The string catalog and a stub are available.
     * @tc.steps         1. Read the reply from the catalog.
     *                   2. Send code 1 through a stub.
     *                   3. Compare the reply copies.
     * @tc.expected      Both replies are 'hello rpc'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('protocolCatalogReplyFromCatalog', 0, () => {
      const catalogReply = stringCatalog()[5];
      const stub = new StubRemoteObjectModel();
      const data = MessageSequenceModel.create();
      const reply = MessageSequenceModel.create();
      data.writeString(REQUEST_PAYLOAD);
      stub.onRemoteMessageRequest(REQUEST_CODE, data, reply, new MessageOptionModel());
      expect(catalogReply).assertEqual(REPLY_PAYLOAD);
      expect(catalogReply).assertEqual(reply.readString());
      expect(catalogReply).assertEqual(stub.requests[0].replyText);
      expect(catalogReply.length).assertEqual(9);
      expect(catalogReply === stringCatalog()[4]).assertFalse();
      expect(textFingerprint(catalogReply)).assertEqual(textFingerprint(REPLY_PAYLOAD));
      expect(stringCatalog().indexOf(catalogReply)).assertEqual(5);
    });

    /**
     * @tc.name          protocolCatalogCodeMatrixFromCatalog
     * @tc.desc          The request code plus unknown catalog form a five-code matrix.
     * @tc.precondition  Both code catalogs are available.
     * @tc.steps         1. Combine the request code with the unknown catalog.
     *                   2. Count accepted codes with the oracle.
     *                   3. Compare with the stub.
     * @tc.expected      Exactly one of the five codes is handled.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('protocolCatalogCodeMatrixFromCatalog', 0, () => {
      const matrix: number[] = [REQUEST_CODE];
      const unknowns = unknownCatalog();
      for (let index = 0; index < unknowns.length; index++) {
        matrix.push(unknowns[index]);
      }
      expect(matrix.length).assertEqual(5);
      let accepted = 0;
      for (let index = 0; index < matrix.length; index++) {
        if (matrix[index] === REQUEST_CODE) {
          accepted = accepted + 1;
        }
      }
      expect(accepted).assertEqual(1);
      expect(matrix[0]).assertEqual(1);
      expect(matrix[4]).assertEqual(99);
      expect(matrix.indexOf(REQUEST_CODE)).assertEqual(0);
      expect(new StubRemoteObjectModel().descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(expectedReplyFor(REQUEST_CODE)).assertEqual(REPLY_PAYLOAD);
      expect(expectedReplyFor(UNKNOWN_CODE_TWO)).assertEqual('');
    });

    /**
     * @tc.name          protocolCatalogCatalogImmutableLocalCopy
     * @tc.desc          Mutating a local catalog copy never changes later copies.
     * @tc.precondition  The string catalog helper returns a fresh array.
     * @tc.steps         1. Take one catalog copy.
     *                   2. Push extra entries into it.
     *                   3. Take a second copy.
     * @tc.expected      The second copy is still six entries long.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('protocolCatalogCatalogImmutableLocalCopy', 0, () => {
      const first = stringCatalog();
      first.push('extra one');
      first.push('extra two');
      expect(first.length).assertEqual(8);
      const second = stringCatalog();
      expect(second.length).assertEqual(6);
      expect(second.indexOf('extra one')).assertEqual(-1);
      expect(second[0]).assertEqual(STUB_DESCRIPTOR);
      expect(first.length - second.length).assertEqual(2);
      expect(eventCatalog().length).assertEqual(6);
      expect(errorCatalog().length).assertEqual(4);
      expect(unknownCatalog().length).assertEqual(4);
    });

    /**
     * @tc.name          protocolCatalogCatalogStringsNoWhitespace
     * @tc.desc          Catalog identifiers contain no doubled or outer whitespace.
     * @tc.precondition  The string catalog is available.
     * @tc.steps         1. Walk the catalog.
     *                   2. Search for doubled spaces.
     *                   3. Compare with trimmed forms.
     * @tc.expected      No doubled spaces or outer whitespace exist.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('protocolCatalogCatalogStringsNoWhitespace', 0, () => {
      const catalog = stringCatalog();
      for (let index = 0; index < catalog.length; index++) {
        expect(catalog[index].indexOf('  ')).assertEqual(-1);
        expect(catalog[index].trim()).assertEqual(catalog[index]);
        expect(catalog[index].indexOf('\t')).assertEqual(-1);
        expect(catalog[index].indexOf('\n')).assertEqual(-1);
      }
      expect(REQUEST_PAYLOAD.indexOf(' ')).assertEqual(5);
      expect(REPLY_PAYLOAD.indexOf(' ')).assertEqual(5);
      expect(STUB_BUNDLE.indexOf(' ')).assertEqual(-1);
      expect(STUB_DESCRIPTOR.indexOf(' ')).assertEqual(-1);
      expect(countOf(catalog, STUB_ABILITY)).assertEqual(1);
    });

    /**
     * @tc.name          protocolCatalogBundleSegmentsDiffer
     * @tc.desc          The two bundle role segments differ by length and content.
     * @tc.precondition  Both bundle constants are loaded.
     * @tc.steps         1. Slice both role segments.
     *                   2. Compare their lengths.
     *                   3. Compare their first characters.
     * @tc.expected      One segment is 'stub' and the other 'client'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('protocolCatalogBundleSegmentsDiffer', 0, () => {
      const stubRole = STUB_BUNDLE.split('.')[2].substring(4);
      const clientRole = CLIENT_BUNDLE.split('.')[2].substring(4);
      expect(stubRole).assertEqual('stub');
      expect(clientRole).assertEqual('client');
      expect(stubRole.length).assertEqual(4);
      expect(clientRole.length).assertEqual(6);
      expect(clientRole.length - stubRole.length).assertEqual(2);
      expect(stubRole.charAt(0)).assertEqual('s');
      expect(clientRole.charAt(0)).assertEqual('c');
      expect(stubRole === clientRole).assertFalse();
      expect(STUB_BUNDLE.length - CLIENT_BUNDLE.length).assertEqual(-2);
    });

    /**
     * @tc.name          protocolCatalogAbilityNameMatchesProduction
     * @tc.desc          The catalog ability name matches the production class name pattern.
     * @tc.precondition  The ability constant is loaded.
     * @tc.steps         1. Check the leading segment.
     *                   2. Check the trailing segment.
     *                   3. Check the absence of the extension word.
     * @tc.expected      The catalog name is ServiceAbility without the Ext infix.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('protocolCatalogAbilityNameMatchesProduction', 0, () => {
      expect(STUB_ABILITY).assertEqual('ServiceAbility');
      expect(STUB_ABILITY.indexOf('Ext')).assertEqual(-1);
      expect(STUB_ABILITY.startsWith('Service')).assertTrue();
      expect(STUB_ABILITY.endsWith('Ability')).assertTrue();
      expect(STUB_ABILITY.length).assertEqual('ServiceAbility'.length);
      expect(STUB_ABILITY.charAt(7)).assertEqual('A');
      expect(STUB_ABILITY.toLowerCase()).assertEqual('serviceability');
      expect(STUB_ABILITY.split('Ability').length).assertEqual(2);
    });

    /**
     * @tc.name          protocolCatalogCompleteCatalogSummary
     * @tc.desc          The catalog summary joins descriptor, code and reply.
     * @tc.precondition  The summary helper is available.
     * @tc.steps         1. Read the summary.
     *                   2. Compare each segment.
     *                   3. Compare with a manual join.
     * @tc.expected      The summary is IPCStubTest:1:hello rpc.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('protocolCatalogCompleteCatalogSummary', 0, () => {
      const summary = catalogSummary();
      expect(summary).assertEqual('IPCStubTest:1:hello rpc');
      expect(summary.split(':').length).assertEqual(3);
      expect(summary.split(':')[0]).assertEqual(STUB_DESCRIPTOR);
      expect(summary.split(':')[1]).assertEqual(String(REQUEST_CODE));
      expect(summary.split(':')[2]).assertEqual(REPLY_PAYLOAD);
      expect(summary).assertEqual(STUB_DESCRIPTOR + ':' + String(REQUEST_CODE) + ':' + REPLY_PAYLOAD);
      expect(summary.length).assertEqual(23);
      expect(summary.endsWith(REPLY_PAYLOAD)).assertTrue();
    });

    /**
     * @tc.name          protocolCatalogSummaryJoin
     * @tc.desc          The summary equals an explicit join of its three parts.
     * @tc.precondition  The summary helper is available.
     * @tc.steps         1. Build the parts manually.
     *                   2. Join them with colons.
     *                   3. Compare with the helper output.
     * @tc.expected      Both summaries are identical and hash equally.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('protocolCatalogSummaryJoin', 0, () => {
      const manual = joined([STUB_DESCRIPTOR, String(REQUEST_CODE), REPLY_PAYLOAD], ':');
      expect(manual).assertEqual(catalogSummary());
      expect(manual.split(':').length).assertEqual(3);
      expect(textFingerprint(manual)).assertEqual(textFingerprint(catalogSummary()));
      expect(textFingerprint(manual)).assertLarger(0);
      expect(manual).assertContain(STUB_DESCRIPTOR);
      expect(manual).assertContain(REPLY_PAYLOAD);
      expect(countOf([manual], catalogSummary())).assertEqual(1);
      expect(manual.indexOf(':')).assertEqual(11);
      expect(manual.lastIndexOf(':')).assertEqual(13);
    });

    /**
     * @tc.name          protocolCatalogCatalogCount
     * @tc.desc          The whole catalog holds twenty-three documented entries.
     * @tc.precondition  All catalog helpers are available.
     * @tc.steps         1. Read each sub-catalog.
     *                   2. Sum the lengths.
     *                   3. Compare with twenty-three.
     * @tc.expected      Six strings, six events, four errors, four unknowns and three levels.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('protocolCatalogCatalogCount', 0, () => {
      const strings = stringCatalog().length;
      const events = eventCatalog().length;
      const errors = errorCatalog().length;
      const unknowns = unknownCatalog().length;
      const levels = levelCatalog().length;
      expect(strings).assertEqual(6);
      expect(events).assertEqual(6);
      expect(errors).assertEqual(4);
      expect(unknowns).assertEqual(4);
      expect(levels).assertEqual(3);
      expect(strings + events + errors + unknowns + levels).assertEqual(23);
      expect(strings + events).assertEqual(12);
      expect(errors + unknowns).assertEqual(8);
      expect(levels * 2).assertEqual(6);
    });

    /**
     * @tc.name          protocolCatalogDescriptorUsedByConnect
     * @tc.desc          The connect path uses the catalog descriptor as event detail.
     * @tc.precondition  A fresh lifecycle model.
     * @tc.steps         1. Connect.
     *                   2. Read the event detail.
     *                   3. Compare with the catalog descriptor.
     * @tc.expected      The detail equals STUB_DESCRIPTOR.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('protocolCatalogDescriptorUsedByConnect', 0, () => {
      const service = new ServiceLifecycleModel();
      const stub = service.onConnect();
      const detail = service.events.entries[0].substring(EVENT_ON_CONNECT.length + 1);
      expect(detail).assertEqual(STUB_DESCRIPTOR);
      expect(detail).assertEqual(stub.descriptor);
      expect(detail.length).assertEqual(11);
      expect(service.events.entries[0]).assertContain(STUB_DESCRIPTOR);
      expect(stringCatalog().indexOf(detail)).assertEqual(0);
      expect(detail === STUB_BUNDLE).assertFalse();
      expect(service.connectCount).assertEqual(1);
      expect(stub.alive).assertTrue();
    });

    /**
     * @tc.name          protocolCatalogEventCatalogLengths
     * @tc.desc          Each lifecycle event name has its documented length.
     * @tc.precondition  The event catalog is available.
     * @tc.steps         1. Walk the catalog.
     *                   2. Compare each length.
     *                   3. Sum the lengths.
     * @tc.expected      The lengths are 8, 9, 9, 12, 9 and 12.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('protocolCatalogEventCatalogLengths', 0, () => {
      const events = eventCatalog();
      expect(events[0].length).assertEqual(8);
      expect(events[1].length).assertEqual(9);
      expect(events[2].length).assertEqual(9);
      expect(events[3].length).assertEqual(12);
      expect(events[4].length).assertEqual(9);
      expect(events[5].length).assertEqual(12);
      let total = 0;
      for (let index = 0; index < events.length; index++) {
        total = total + events[index].length;
      }
      expect(total).assertEqual(59);
      expect(events[3].length).assertEqual(events[5].length);
      expect(events[1].length).assertEqual(events[2].length);
    });

    /**
     * @tc.name          protocolCatalogErrorCatalogFingerprints
     * @tc.desc          Each numeric error code has a distinct string fingerprint.
     * @tc.precondition  The error catalog is available.
     * @tc.steps         1. Fingerprint each code string.
     *                   2. Count unique fingerprints.
     *                   3. Compare with the catalog length.
     * @tc.expected      Four distinct fingerprints are produced.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('protocolCatalogErrorCatalogFingerprints', 0, () => {
      const errors = errorCatalog();
      const prints: number[] = [];
      for (let index = 0; index < errors.length; index++) {
        prints.push(textFingerprint(String(errors[index])));
      }
      const unique: number[] = [];
      for (let index = 0; index < prints.length; index++) {
        if (unique.indexOf(prints[index]) < 0) {
          unique.push(prints[index]);
        }
      }
      expect(unique.length).assertEqual(4);
      expect(prints.length).assertEqual(errors.length);
      expect(prints[0] === prints[1]).assertFalse();
      expect(prints[1] === prints[2]).assertFalse();
      expect(prints[2] === prints[3]).assertFalse();
      expect(textFingerprint(String(ERROR_NONE))).assertEqual(prints[0]);
      expect(textFingerprint(String(ERROR_SEQUENCE_RECLAIMED))).assertEqual(prints[3]);
    });

    /**
     * @tc.name          protocolCatalogSummaryExact
     * @tc.desc          The summary separator positions match the descriptor length.
     * @tc.precondition  The summary helper is available.
     * @tc.steps         1. Read the summary.
     *                   2. Locate both colon separators.
     *                   3. Compare the middle segment.
     * @tc.expected      The first colon is at index 11 and the code occupies one character.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('protocolCatalogSummaryExact', 0, () => {
      const summary = catalogSummary();
      const firstColon = summary.indexOf(':');
      const secondColon = summary.lastIndexOf(':');
      expect(firstColon).assertEqual(STUB_DESCRIPTOR.length);
      expect(firstColon).assertEqual(11);
      expect(secondColon).assertEqual(13);
      expect(secondColon - firstColon).assertEqual(2);
      expect(summary.substring(firstColon + 1, secondColon)).assertEqual('1');
      expect(Number(summary.substring(firstColon + 1, secondColon))).assertEqual(REQUEST_CODE);
      expect(summary.substring(secondColon + 1)).assertEqual(REPLY_PAYLOAD);
      expect(summary.length).assertEqual(23);
    });

    /**
     * @tc.name          protocolCatalogRequestCodeUnique
     * @tc.desc          The request code appears exactly once in the code matrix.
     * @tc.precondition  Both code catalogs are available.
     * @tc.steps         1. Build the five-code matrix.
     *                   2. Count occurrences of code 1.
     *                   3. Compare with one.
     * @tc.expected      The request code is unique in the matrix.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('protocolCatalogRequestCodeUnique', 0, () => {
      const matrix: number[] = [REQUEST_CODE];
      const unknowns = unknownCatalog();
      for (let index = 0; index < unknowns.length; index++) {
        matrix.push(unknowns[index]);
      }
      let occurrences = 0;
      for (let index = 0; index < matrix.length; index++) {
        if (matrix[index] === REQUEST_CODE) {
          occurrences = occurrences + 1;
        }
      }
      expect(occurrences).assertEqual(1);
      expect(matrix.length).assertEqual(5);
      expect(matrix.indexOf(REQUEST_CODE)).assertEqual(0);
      expect(matrix.indexOf(REQUEST_CODE)).assertEqual(matrix.lastIndexOf(REQUEST_CODE));
      expect(matrix[1]).assertEqual(0);
      expect(matrix[4]).assertEqual(99);
      expect(occurrences * 5).assertEqual(matrix.length);
      expect(REQUEST_CODE).assertEqual(1);
    });

    /**
     * @tc.name          protocolCatalogReplyNotInRequest
     * @tc.desc          The reply literal is not a substring of the request payload.
     * @tc.precondition  Both payload constants are loaded.
     * @tc.steps         1. Search the request for the reply.
     *                   2. Search the request for the reply tail.
     *                   3. Compare the findings.
     * @tc.expected      The full reply never appears inside the request.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('protocolCatalogReplyNotInRequest', 0, () => {
      expect(REQUEST_PAYLOAD.indexOf(REPLY_PAYLOAD)).assertEqual(-1);
      expect(REQUEST_PAYLOAD.indexOf('rpc')).assertEqual(-1);
      expect(REPLY_PAYLOAD.indexOf(REQUEST_PAYLOAD)).assertEqual(-1);
      expect(REQUEST_PAYLOAD.indexOf('hello')).assertEqual(0);
      expect(REPLY_PAYLOAD.indexOf('hello')).assertEqual(0);
      expect(REQUEST_PAYLOAD.indexOf('world')).assertEqual(6);
      expect(REQUEST_PAYLOAD.substring(6)).assertEqual('world');
      expect(REQUEST_PAYLOAD.substring(6) === REPLY_PAYLOAD).assertFalse();
    });

    /**
     * @tc.name          protocolCatalogCatalogCompleteness
     * @tc.desc          The catalog covers every production literal used by the suite.
     * @tc.precondition  All catalog helpers are available.
     * @tc.steps         1. Check the descriptor, code, reply and events.
     *                   2. Check the errors, flags and levels.
     *                   3. Confirm every entry is non-empty.
     * @tc.expected      Every production literal is present and non-empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('protocolCatalogCatalogCompleteness', 0, () => {
      expect(stringCatalog().indexOf(STUB_DESCRIPTOR)).assertEqual(0);
      expect(stringCatalog().indexOf(REPLY_PAYLOAD)).assertEqual(5);
      expect(eventCatalog().indexOf(EVENT_ON_CONNECT)).assertEqual(2);
      expect(errorCatalog().indexOf(ERROR_STUB_REJECTED)).assertEqual(1);
      expect(unknownCatalog().indexOf(UNKNOWN_CODE_NEGATIVE)).assertEqual(2);
      expect(levelCatalog().indexOf(LEVEL_ERROR)).assertEqual(2);
      expect(REQUEST_CODE).assertEqual(1);
      expect(OPTION_FLAG_SYNC + OPTION_FLAG_ASYNC).assertEqual(1);
      expect(STUB_ABILITY.length).assertEqual(14);
      expect(catalogSummary()).assertEqual('IPCStubTest:1:hello rpc');
    });
  });
}




