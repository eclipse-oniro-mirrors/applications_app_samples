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
import {
  ConnectionModel,
  RemoteProxyModel,
  RemoteStubModel,
  RequestResultModel,
  MessageSequenceModel,
  MessageOptionModel,
  WantModel,
  DeathRecipientModel,
  ClientSnapshot,
  ClientMetrics,
  TARGET_BUNDLE,
  TARGET_ABILITY,
  STUB_DESCRIPTOR,
  REQUEST_CODE,
  REQUEST_PAYLOAD,
  REPLY_PAYLOAD,
  ERROR_NONE,
  ERROR_CONNECT,
  ERROR_DISCONNECT,
  ERROR_SEND,
  ERROR_PROXY_INVALID,
  STATE_CONNECTED,
  STATE_CONNECTING,
  STATE_DISCONNECTED,
  STATE_FAILED,
  CONNECT_SUCCESS_TOAST,
  CONNECT_FAIL_TOAST,
  SEND_SUCCESS_TOAST,
  SEND_FAIL_TOAST,
  DISCONNECT_SUCCESS_TOAST,
  INITIAL_CONNECT_ID,
  LEVEL_INFO,
  LEVEL_WARN,
  LEVEL_ERROR,
  OPTION_FLAG_ASYNC,
  clampInt,
  joined,
  countOf,
  uniqueStrings,
  sameStringArray,
  textFingerprint,
  isKnownRequestCode,
  isNonZeroError
} from '../Shared/SharedDriver';
import { logSuite, logStep } from '../Shared/Support';

function newClient(): ConnectionModel {
  return new ConnectionModel();
}

function openConnection(client: ConnectionModel, id: number, reply: string = REPLY_PAYLOAD): RemoteProxyModel {
  client.connect(id);
  const stub: RemoteStubModel = new RemoteStubModel();
  stub.replyText = reply;
  const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
  client.onConnect(proxy);
  return proxy;
}

function sendBurst(client: ConnectionModel, times: number, payload: string = REQUEST_PAYLOAD): RequestResultModel[] {
  const results: RequestResultModel[] = [];
  for (let index = 0; index < times; index++) {
    results.push(client.sendString(payload));
  }
  return results;
}

function successCount(results: RequestResultModel[]): number {
  let total = 0;
  for (let index = 0; index < results.length; index++) {
    if (results[index].isSuccess()) {
      total = total + 1;
    }
  }
  return total;
}

function codeCount(results: RequestResultModel[], code: number): number {
  let total = 0;
  for (let index = 0; index < results.length; index++) {
    if (results[index].errCode === code) {
      total = total + 1;
    }
  }
  return total;
}

function toastCount(client: ConnectionModel, text: string): number {
  return countOf(client.toasts, text);
}

function eventCount(client: ConnectionModel, kind: string): number {
  return client.events.countOf(kind);
}

/** Runs the canonical connect, register and send pipeline and returns a trace label. */
function runPipeline(client: ConnectionModel, id: number, payload: string): string {
  const proxy: RemoteProxyModel = openConnection(client, id);
  const result: RequestResultModel = client.sendString(payload);
  return client.state + '>' + proxy.descriptor + '>' + result.replyText;
}

export default function systemIntegration(): void {
  describe('SystemIntegration', () => {
    beforeAll(() => {
      logSuite('SystemIntegration', 'begin');
    });

    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(resolve, 1);
      });
    });

    afterAll(() => {
      logSuite('SystemIntegration', 'end');
    });

    /**
     * @tc.name          systemIntegrationFullPipelineHappyPath
     * @tc.desc          The connect, register and send pipeline produces a connected session and reply.
     * @tc.precondition  An empty client with default want values.
     * @tc.steps         1. Connect with id 2001 and deliver a proxy.
     *                   2. Send the default request payload.
     *                   3. Inspect state, reply and toast.
     * @tc.expected      The session is connected, the reply matches the stub payload and success is toasted.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('systemIntegrationFullPipelineHappyPath', 0, () => {
      logStep('systemIntegrationFullPipelineHappyPath', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 2001);
      const result: RequestResultModel = client.sendString(REQUEST_PAYLOAD);
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.connectId).assertEqual(2001);
      expect(client.proxy).assertEqual(proxy);
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(toastCount(client, SEND_SUCCESS_TOAST)).assertEqual(1);
      expect(proxy.stub.receivedTexts[0]).assertEqual(REQUEST_PAYLOAD);
      expect(client.isConnected()).assertTrue();
    });

    /**
     * @tc.name          systemIntegrationWantConstants
     * @tc.desc          The default want targets the stub bundle and service ability.
     * @tc.precondition  A default-constructed want.
     * @tc.steps         1. Read bundle and ability names.
     *                   2. Compare with the shared constants.
     *                   3. Validate the want.
     * @tc.expected      The want matches the documented target and validates cleanly.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('systemIntegrationWantConstants', 0, () => {
      logStep('systemIntegrationWantConstants', 'begin');
      const want: WantModel = new WantModel();
      expect(want.bundleName).assertEqual('com.example.ipc_stub');
      expect(want.abilityName).assertEqual('ServiceAbility');
      expect(want.bundleName).assertEqual(TARGET_BUNDLE);
      expect(want.abilityName).assertEqual(TARGET_ABILITY);
      expect(want.validate().length).assertEqual(0);
      expect(want.describe()).assertEqual('com.example.ipc_stub/ServiceAbility');
      expect(want.matches(new WantModel(TARGET_BUNDLE, TARGET_ABILITY))).assertTrue();
    });

    /**
     * @tc.name          systemIntegrationRegisterOnConnect
     * @tc.desc          Every successful onConnect registers the death recipient once.
     * @tc.precondition  A client in the connecting state.
     * @tc.steps         1. Request connect with id 2002.
     *                   2. Deliver a live proxy.
     *                   3. Inspect recipient flags and the event log.
     * @tc.expected      The recipient and proxy both report registration and one event is recorded.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('systemIntegrationRegisterOnConnect', 0, () => {
      logStep('systemIntegrationRegisterOnConnect', 'begin');
      const client: ConnectionModel = newClient();
      client.connect(2002);
      expect(client.state).assertEqual(STATE_CONNECTING);
      const proxy: RemoteProxyModel = new RemoteProxyModel();
      client.onConnect(proxy);
      expect(client.deathRecipient.registered).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      expect(proxy.deathRecipient).assertEqual(client.deathRecipient);
      expect(eventCount(client, 'death-register')).assertEqual(1);
      expect(toastCount(client, CONNECT_SUCCESS_TOAST)).assertEqual(1);
      expect(client.logs.contains('registerDeathRecipient success')).assertTrue();
    });

    /**
     * @tc.name          systemIntegrationRequestCodeIsOne
     * @tc.desc          The client sends request code one through the proxy.
     * @tc.precondition  A connected client.
     * @tc.steps         1. Send three requests.
     *                   2. Read the proxy request list.
     *                   3. Compare with the shared request code.
     * @tc.expected      All three requests carry code one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('systemIntegrationRequestCodeIsOne', 0, () => {
      logStep('systemIntegrationRequestCodeIsOne', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 2003);
      sendBurst(client, 3);
      expect(REQUEST_CODE).assertEqual(1);
      expect(proxy.requests.length).assertEqual(3);
      expect(proxy.requests[0]).assertEqual(REQUEST_CODE);
      expect(proxy.requests[1]).assertEqual(REQUEST_CODE);
      expect(proxy.requests[2]).assertEqual(REQUEST_CODE);
      expect(proxy.stub.handledCodes.length).assertEqual(3);
      expect(proxy.stub.handledCodes[0]).assertEqual(REQUEST_CODE);
      expect(isKnownRequestCode(proxy.requests[0])).assertTrue();
    });

    /**
     * @tc.name          systemIntegrationDescriptorPropagation
     * @tc.desc          The stub descriptor flows into the proxy and into the connect event.
     * @tc.precondition  A connected client with a default stub.
     * @tc.steps         1. Open a connection.
     *                   2. Read descriptor fields.
     *                   3. Inspect the connected event entry.
     * @tc.expected      All descriptors equal the shared stub descriptor.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('systemIntegrationDescriptorPropagation', 0, () => {
      logStep('systemIntegrationDescriptorPropagation', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 2004);
      expect(proxy.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(proxy.stub.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(client.events.countOf('connected')).assertEqual(1);
      expect(client.events.entries[2]).assertEqual('connected:' + STUB_DESCRIPTOR);
      expect(client.logs.contains('onConnect')).assertTrue();
      expect(toastCount(client, CONNECT_SUCCESS_TOAST)).assertEqual(1);
      expect(client.events.entries[1]).assertEqual('death-register:' + STUB_DESCRIPTOR);
    });

    /**
     * @tc.name          systemIntegrationReplyPayloadFromStub
     * @tc.desc          The reply payload originates from the stub configuration.
     * @tc.precondition  A connected client with a custom stub reply.
     * @tc.steps         1. Configure the stub reply to a custom text.
     *                   2. Send one request.
     *                   3. Compare the reply with the stub value.
     * @tc.expected      The reply text equals the configured stub payload.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('systemIntegrationReplyPayloadFromStub', 0, () => {
      logStep('systemIntegrationReplyPayloadFromStub', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 2005, 'stub-configured-reply');
      const result: RequestResultModel = client.sendString('request-text');
      expect(result.isSuccess()).assertTrue();
      expect(result.replyText).assertEqual('stub-configured-reply');
      expect(proxy.stub.replyText).assertEqual('stub-configured-reply');
      expect(proxy.stub.receivedTexts[0]).assertEqual('request-text');
      expect(toastCount(client, SEND_SUCCESS_TOAST)).assertEqual(1);
      expect(client.logs.contains('reply stub-configured-reply')).assertTrue();
      expect(REPLY_PAYLOAD === result.replyText).assertFalse();
    });

    /**
     * @tc.name          systemIntegrationNoProxyBranch
     * @tc.desc          Sending without a connected proxy takes the documented invalid branch.
     * @tc.precondition  A client that never connected.
     * @tc.steps         1. Send a request.
     *                   2. Inspect the error code and toast.
     *                   3. Check the recorded event.
     * @tc.expected      The result carries the proxy-invalid code and the failure toast.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('systemIntegrationNoProxyBranch', 0, () => {
      logStep('systemIntegrationNoProxyBranch', 'begin');
      const client: ConnectionModel = newClient();
      const result: RequestResultModel = client.sendString(REQUEST_PAYLOAD);
      expect(result.errCode).assertEqual(ERROR_PROXY_INVALID);
      expect(result.isSuccess()).assertFalse();
      expect(isNonZeroError(result.errCode)).assertTrue();
      expect(client.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(eventCount(client, 'send-no-proxy')).assertEqual(1);
      expect(client.logs.contains('proxy is invalid')).assertTrue();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
    });

    /**
     * @tc.name          systemIntegrationKilledStubBranch
     * @tc.desc          A killed stub turns the next request into a send error.
     * @tc.precondition  A connected client whose stub has been killed.
     * @tc.steps         1. Kill the stub through the proxy.
     *                   2. Send one request.
     *                   3. Inspect code, toast and stub state.
     * @tc.expected      The request fails with the send error and the stub records it as handled.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('systemIntegrationKilledStubBranch', 0, () => {
      logStep('systemIntegrationKilledStubBranch', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 2006);
      proxy.kill();
      const result: RequestResultModel = client.sendString('after-kill');
      expect(result.errCode).assertEqual(ERROR_SEND);
      expect(result.isSuccess()).assertFalse();
      expect(proxy.stub.receivedTexts.length).assertEqual(0);
      expect(proxy.stub.handledCodes.length).assertEqual(0);
      expect(toastCount(client, SEND_FAIL_TOAST)).assertEqual(1);
      expect(client.logs.contains('sendMessageRequest failed')).assertTrue();
      expect(proxy.isAlive()).assertFalse();
    });

    /**
     * @tc.name          systemIntegrationDeathNotifyIntegration
     * @tc.desc          Death notification reaches the registered recipient exactly once.
     * @tc.precondition  A connected client with a live proxy.
     * @tc.steps         1. Open a connection.
     *                   2. Notify death on the proxy.
     *                   3. Inspect the recipient counter and liveness.
     * @tc.expected      The recipient records one death and the proxy becomes not alive.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('systemIntegrationDeathNotifyIntegration', 0, () => {
      logStep('systemIntegrationDeathNotifyIntegration', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 2007);
      expect(proxy.isAlive()).assertTrue();
      proxy.notifyDeath();
      expect(client.deathRecipient.diedCount).assertEqual(1);
      expect(proxy.isAlive()).assertFalse();
      expect(client.isConnected()).assertFalse();
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.deathRecipient.registered).assertTrue();
      const second: RequestResultModel = client.sendString('post-death');
      expect(second.errCode).assertEqual(ERROR_SEND);
    });

    /**
     * @tc.name          systemIntegrationConnectFailureIntegration
     * @tc.desc          A failed connect callback records the failure toast and code.
     * @tc.precondition  A client in the connecting state.
     * @tc.steps         1. Connect with id 2008.
     *                   2. Deliver onFailed with the connect error.
     *                   3. Inspect state, code and toast.
     * @tc.expected      The state is failed, the code recorded and the failure toast shown once.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('systemIntegrationConnectFailureIntegration', 0, () => {
      logStep('systemIntegrationConnectFailureIntegration', 'begin');
      const client: ConnectionModel = newClient();
      client.connect(2008);
      client.onFailed(ERROR_CONNECT);
      expect(client.state).assertEqual(STATE_FAILED);
      expect(client.failedCode).assertEqual(ERROR_CONNECT);
      expect(client.failedCode).assertEqual(16000001);
      expect(toastCount(client, CONNECT_FAIL_TOAST)).assertEqual(1);
      expect(client.toasts.length).assertEqual(1);
      expect(client.events.entries[0].startsWith('connect:')).assertTrue();
      expect(client.events.last()).assertEqual('failed:' + String(ERROR_CONNECT));
      expect(client.proxy).assertUndefined();
    });

    /**
     * @tc.name          systemIntegrationDisconnectGuardIntegration
     * @tc.desc          Disconnecting without a connect id is refused by the guard.
     * @tc.precondition  An empty client.
     * @tc.steps         1. Request disconnection immediately.
     *                   2. Attempt a valid cycle afterwards.
     *                   3. Compare both guard results.
     * @tc.expected      The premature request is refused and the valid one is accepted.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('systemIntegrationDisconnectGuardIntegration', 0, () => {
      logStep('systemIntegrationDisconnectGuardIntegration', 'begin');
      const client: ConnectionModel = newClient();
      const premature: boolean = client.disconnectRequested();
      openConnection(client, 2009);
      const valid: boolean = client.disconnectRequested();
      expect(premature).assertFalse();
      expect(valid).assertTrue();
      expect(client.connectId).assertEqual(2009);
      expect(client.logs.countLevel('ERROR')).assertEqual(1);
      expect(eventCount(client, 'disconnect-request')).assertEqual(1);
      expect(client.events.last()).assertEqual('disconnect-request:2009');
      expect(client.toasts.length).assertEqual(1);
    });

    /**
     * @tc.name          systemIntegrationDisconnectClearsProxy
     * @tc.desc          The disconnect callback clears the proxy, id and registration.
     * @tc.precondition  A connected client.
     * @tc.steps         1. Open a connection.
     *                   2. Deliver onDisconnect.
     *                   3. Inspect all cleared fields.
     * @tc.expected      The proxy is gone, the id reset and the recipient unregistered.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('systemIntegrationDisconnectClearsProxy', 0, () => {
      logStep('systemIntegrationDisconnectClearsProxy', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 2010);
      client.onDisconnect();
      expect(client.proxy).assertUndefined();
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
      expect(client.isDisconnect).assertTrue();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(proxy.deathRegistered).assertFalse();
      expect(client.deathRecipient.registered).assertFalse();
      expect(toastCount(client, DISCONNECT_SUCCESS_TOAST)).assertEqual(1);
      expect(eventCount(client, 'disconnected')).assertEqual(1);
    });

    /**
     * @tc.name          systemIntegrationErrorCodeConstants
     * @tc.desc          The exported error codes are distinct and non-zero where documented.
     * @tc.precondition  The shared constant set.
     * @tc.steps         1. Compare the success code with zero.
     *                   2. Compare the four error codes pairwise.
     *                   3. Confirm each error is treated as non-zero.
     * @tc.expected      Success is zero, errors are distinct and each error is non-zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('systemIntegrationErrorCodeConstants', 0, () => {
      logStep('systemIntegrationErrorCodeConstants', 'begin');
      expect(ERROR_NONE).assertEqual(0);
      expect(ERROR_CONNECT).assertEqual(16000001);
      expect(ERROR_DISCONNECT).assertEqual(16000002);
      expect(ERROR_SEND).assertEqual(16000003);
      expect(ERROR_PROXY_INVALID).assertEqual(16000004);
      expect(ERROR_CONNECT === ERROR_SEND).assertFalse();
      expect(isNonZeroError(ERROR_NONE)).assertFalse();
      expect(isNonZeroError(ERROR_DISCONNECT)).assertTrue();
      expect(isNonZeroError(ERROR_PROXY_INVALID)).assertTrue();
    });

    /**
     * @tc.name          systemIntegrationKnownCodePredicate
     * @tc.desc          Only the documented request code is recognised by the predicate.
     * @tc.precondition  A set of candidate codes.
     * @tc.steps         1. Evaluate the predicate for the known code.
     *                   2. Evaluate it for five foreign codes.
     *                   3. Compare the accepted set size.
     * @tc.expected      Only code one is accepted.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('systemIntegrationKnownCodePredicate', 0, () => {
      logStep('systemIntegrationKnownCodePredicate', 'begin');
      const codes: number[] = [0, 1, 2, -1, 99, 1];
      let accepted: number = 0;
      for (let index = 0; index < codes.length; index++) {
        if (isKnownRequestCode(codes[index])) {
          accepted = accepted + 1;
        }
      }
      expect(isKnownRequestCode(1)).assertTrue();
      expect(isKnownRequestCode(0)).assertFalse();
      expect(isKnownRequestCode(-1)).assertFalse();
      expect(isKnownRequestCode(99)).assertFalse();
      expect(accepted).assertEqual(2);
      expect(codes.length).assertEqual(6);
      expect(isKnownRequestCode(REQUEST_CODE)).assertTrue();
    });

    /**
     * @tc.name          systemIntegrationClampBounds
     * @tc.desc          Clamping returns the value or the nearest bound at both extremes.
     * @tc.precondition  A pure clamp helper.
     * @tc.steps         1. Clamp values below, inside and above the range.
     *                   2. Compare each result.
     *                   3. Confirm the boundaries themselves.
     * @tc.expected      Values pin to ten and twenty at the extremes.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('systemIntegrationClampBounds', 0, () => {
      logStep('systemIntegrationClampBounds', 'begin');
      expect(clampInt(-5, 10, 20)).assertEqual(10);
      expect(clampInt(10, 10, 20)).assertEqual(10);
      expect(clampInt(15, 10, 20)).assertEqual(15);
      expect(clampInt(20, 10, 20)).assertEqual(20);
      expect(clampInt(25, 10, 20)).assertEqual(20);
      expect(clampInt(0, 0, 0)).assertEqual(0);
      expect(clampInt(3, 1, 2)).assertEqual(2);
    });

    /**
     * @tc.name          systemIntegrationJoinedFormatting
     * @tc.desc          The join helper uses the requested separator and handles empty input.
     * @tc.precondition  A pure join helper.
     * @tc.steps         1. Join a three-element list with the default separator.
     *                   2. Join with a custom separator.
     *                   3. Join an empty list.
     * @tc.expected      Default joins with commas, custom joins with the given text and empty stays empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('systemIntegrationJoinedFormatting', 0, () => {
      logStep('systemIntegrationJoinedFormatting', 'begin');
      expect(joined(['a', 'b', 'c'])).assertEqual('a,b,c');
      expect(joined(['a', 'b', 'c'], '-')).assertEqual('a-b-c');
      expect(joined(['solo'])).assertEqual('solo');
      expect(joined([])).assertEqual('');
      expect(joined(['x', 'y'], '::')).assertEqual('x::y');
      expect(joined(['a', 'b', 'c']).split(',').length).assertEqual(3);
      expect(countOf(['a', 'b', 'a'], 'a')).assertEqual(2);
    });

    /**
     * @tc.name          systemIntegrationUniqueStringsIntegration
     * @tc.desc          Unique filtering preserves first occurrence order.
     * @tc.precondition  A list with repeated values.
     * @tc.steps         1. Deduplicate the list.
     *                   2. Compare the result with the expected order.
     *                   3. Confirm counts and length.
     * @tc.expected      The deduplicated list keeps the first occurrence of each value.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('systemIntegrationUniqueStringsIntegration', 0, () => {
      logStep('systemIntegrationUniqueStringsIntegration', 'begin');
      const input: string[] = ['connect', 'send', 'connect', 'disconnect', 'send', 'connect'];
      const unique: string[] = uniqueStrings(input);
      expect(unique.length).assertEqual(3);
      expect(unique[0]).assertEqual('connect');
      expect(unique[1]).assertEqual('send');
      expect(unique[2]).assertEqual('disconnect');
      expect(unique.join('|')).assertEqual('connect|send|disconnect');
      expect(countOf(input, 'connect')).assertEqual(3);
      expect(sameStringArray(unique, ['connect', 'send', 'disconnect'])).assertTrue();
    });

    /**
     * @tc.name          systemIntegrationSameStringArrayMismatch
     * @tc.desc          Array equality rejects different lengths, orders and values.
     * @tc.precondition  A pure equality helper.
     * @tc.steps         1. Compare equal arrays.
     *                   2. Compare a longer and a reordered array.
     *                   3. Confirm empty arrays compare equal.
     * @tc.expected      Only identical arrays compare equal.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('systemIntegrationSameStringArrayMismatch', 0, () => {
      logStep('systemIntegrationSameStringArrayMismatch', 'begin');
      expect(sameStringArray(['a', 'b'], ['a', 'b'])).assertTrue();
      expect(sameStringArray(['a', 'b'], ['a', 'b', 'c'])).assertFalse();
      expect(sameStringArray(['a', 'b'], ['b', 'a'])).assertFalse();
      expect(sameStringArray(['a', 'b'], ['a', 'c'])).assertFalse();
      expect(sameStringArray([], [])).assertTrue();
      expect(sameStringArray([], ['a'])).assertFalse();
      expect(sameStringArray(['1'], ['1'])).assertTrue();
    });

    /**
     * @tc.name          systemIntegrationFingerprintDeterminism
     * @tc.desc          Text fingerprints are deterministic and differ for different inputs.
     * @tc.precondition  A pure fingerprint helper.
     * @tc.steps         1. Fingerprint the same text twice.
     *                   2. Fingerprint a modified text.
     *                   3. Compare all three values.
     * @tc.expected      Equal texts share a fingerprint and different texts generally differ.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('systemIntegrationFingerprintDeterminism', 0, () => {
      logStep('systemIntegrationFingerprintDeterminism', 'begin');
      const first: number = textFingerprint('connect:com.example.ipc_stub/ServiceAbility');
      const second: number = textFingerprint('connect:com.example.ipc_stub/ServiceAbility');
      const third: number = textFingerprint('connect:com.example.ipc_stub/OtherAbility');
      expect(first).assertEqual(second);
      expect(first === third).assertFalse();
      expect(first >= 0).assertTrue();
      expect(first < 1000003).assertTrue();
      expect(textFingerprint('')).assertEqual(216613);
      expect(third >= 0).assertTrue();
      expect(second > 0).assertTrue();
    });

    /**
     * @tc.name          systemIntegrationLogLevelConstants
     * @tc.desc          The shared log level labels match the expected strings.
     * @tc.precondition  The exported level constants.
     * @tc.steps         1. Compare each constant.
     *                   2. Use them as buffer levels.
     *                   3. Confirm counting works.
     * @tc.expected      The labels are INFO, WARN and ERROR and are counted correctly.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('systemIntegrationLogLevelConstants', 0, () => {
      logStep('systemIntegrationLogLevelConstants', 'begin');
      expect(LEVEL_INFO).assertEqual('INFO');
      expect(LEVEL_WARN).assertEqual('WARN');
      expect(LEVEL_ERROR).assertEqual('ERROR');
      const client: ConnectionModel = newClient();
      openConnection(client, 2011);
      client.logs.warn('integration-warning');
      expect(client.logs.countLevel(LEVEL_INFO)).assertEqual(2);
      expect(client.logs.countLevel(LEVEL_WARN)).assertEqual(1);
      expect(client.logs.countLevel(LEVEL_ERROR)).assertEqual(0);
      expect(client.logs.contains('integration-warning')).assertTrue();
    });

    /**
     * @tc.name          systemIntegrationProxyResetIntegration
     * @tc.desc          Resetting a proxy clears requests, counters and the armed failure.
     * @tc.precondition  A proxy used for several requests.
     * @tc.steps         1. Send three requests and arm a failure.
     *                   2. Reset the proxy.
     *                   3. Send once more and inspect counters.
     * @tc.expected      The reset clears history and the next request succeeds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('systemIntegrationProxyResetIntegration', 0, () => {
      logStep('systemIntegrationProxyResetIntegration', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 2012);
      sendBurst(client, 3);
      proxy.failNextSend = ERROR_SEND;
      proxy.reset();
      expect(proxy.requests.length).assertEqual(0);
      expect(proxy.sendCalls).assertEqual(0);
      expect(proxy.failNextSend).assertEqual(ERROR_NONE);
      expect(proxy.deathRegistered).assertFalse();
      expect(proxy.isAlive()).assertTrue();
      const result: RequestResultModel = client.sendString('after-reset');
      expect(result.isSuccess()).assertTrue();
      expect(proxy.sendCalls).assertEqual(1);
      expect(proxy.stub.receivedTexts.length).assertEqual(4);
    });

    /**
     * @tc.name          systemIntegrationStubKillRevive
     * @tc.desc          A revived stub answers requests again after being killed.
     * @tc.precondition  A connected client with a stub that toggles liveness.
     * @tc.steps         1. Kill the stub and send once.
     *                   2. Revive the stub and send again.
     *                   3. Compare both results.
     * @tc.expected      The first request fails and the second succeeds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('systemIntegrationStubKillRevive', 0, () => {
      logStep('systemIntegrationStubKillRevive', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 2013);
      proxy.kill();
      const failed: RequestResultModel = client.sendString('dead');
      proxy.revive();
      const recovered: RequestResultModel = client.sendString('alive');
      expect(failed.errCode).assertEqual(ERROR_SEND);
      expect(recovered.errCode).assertEqual(ERROR_NONE);
      expect(recovered.replyText).assertEqual(REPLY_PAYLOAD);
      expect(proxy.isAlive()).assertTrue();
      expect(proxy.stub.receivedTexts.length).assertEqual(1);
      expect(proxy.stub.receivedTexts[0]).assertEqual('alive');
      expect(toastCount(client, SEND_FAIL_TOAST)).assertEqual(1);
      expect(toastCount(client, SEND_SUCCESS_TOAST)).assertEqual(1);
    });

    /**
     * @tc.name          systemIntegrationRecipientDeathAccumulation
     * @tc.desc          Three death notifications accumulate on the registered recipient.
     * @tc.precondition  A connected client.
     * @tc.steps         1. Notify death three times.
     *                   2. Inspect the counter and description.
     *                   3. Send once and confirm the failure.
     * @tc.expected      The counter reads three and the send fails with the send code.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('systemIntegrationRecipientDeathAccumulation', 0, () => {
      logStep('systemIntegrationRecipientDeathAccumulation', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 2014);
      proxy.notifyDeath();
      proxy.notifyDeath();
      proxy.notifyDeath();
      expect(client.deathRecipient.diedCount).assertEqual(3);
      expect(client.deathRecipient.describe()).assertEqual('3/true');
      const result: RequestResultModel = client.sendString('after-three');
      expect(result.errCode).assertEqual(ERROR_SEND);
      expect(proxy.sendCalls).assertEqual(1);
      expect(proxy.stub.receivedTexts.length).assertEqual(0);
      expect(toastCount(client, SEND_FAIL_TOAST)).assertEqual(1);
      expect(client.deathRecipient.registered).assertTrue();
    });

    /**
     * @tc.name          systemIntegrationSnapshotFullPath
     * @tc.desc          A snapshot after the full pipeline describes every field correctly.
     * @tc.precondition  A client that connected and sent twice.
     * @tc.steps         1. Run the pipeline with two sends.
     *                   2. Capture the snapshot.
     *                   3. Compare the description.
     * @tc.expected      The snapshot reads connected with id 2015, proxy, registration and three toasts.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('systemIntegrationSnapshotFullPath', 0, () => {
      logStep('systemIntegrationSnapshotFullPath', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 2015);
      sendBurst(client, 2);
      const snapshot: ClientSnapshot = new ClientSnapshot(client);
      expect(snapshot.state).assertEqual(STATE_CONNECTED);
      expect(snapshot.connectId).assertEqual(2015);
      expect(snapshot.hasProxy).assertTrue();
      expect(snapshot.deathRegistered).assertTrue();
      expect(snapshot.toastCount).assertEqual(3);
      expect(snapshot.describe()).assertEqual('connected/2015/true/true/3');
      expect(snapshot.sameAs(new ClientSnapshot(client))).assertTrue();
    });

    /**
     * @tc.name          systemIntegrationMetricsAfterPipeline
     * @tc.desc          Aggregate metrics after a pipeline run match the manual tallies.
     * @tc.precondition  A client with one connect and four sends.
     * @tc.steps         1. Connect and send four requests.
     *                   2. Build metrics.
     *                   3. Compare every field.
     * @tc.expected      One connect, four sends, four replies and zero failures.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('systemIntegrationMetricsAfterPipeline', 0, () => {
      logStep('systemIntegrationMetricsAfterPipeline', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 2016);
      sendBurst(client, 4);
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.connects).assertEqual(1);
      expect(metrics.sends).assertEqual(4);
      expect(metrics.replies).assertEqual(4);
      expect(metrics.failures).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(1);
      expect(metrics.fingerprint() > 0).assertTrue();
      expect(toastCount(client, CONNECT_SUCCESS_TOAST)).assertEqual(1);
    });

    /**
     * @tc.name          systemIntegrationEventTracePipelineOrder
     * @tc.desc          The pipeline event trace follows connect, register, connected and send order.
     * @tc.precondition  An empty client and one request.
     * @tc.steps         1. Run the pipeline.
     *                   2. Read the first four event entries.
     *                   3. Confirm their prefixes.
     * @tc.expected      The trace begins with the lifecycle events and ends with the send event.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('systemIntegrationEventTracePipelineOrder', 0, () => {
      logStep('systemIntegrationEventTracePipelineOrder', 'begin');
      const client: ConnectionModel = newClient();
      runPipeline(client, 2017, 'trace-payload');
      const entries: string[] = client.events.entries;
      expect(entries.length).assertEqual(4);
      expect(entries[0].startsWith('connect:')).assertTrue();
      expect(entries[1].startsWith('death-register:')).assertTrue();
      expect(entries[2].startsWith('connected:')).assertTrue();
      expect(entries[3]).assertEqual('send-ok:' + REPLY_PAYLOAD);
      expect(client.events.countOf('connect')).assertEqual(1);
      expect(client.events.countOf('send-ok')).assertEqual(1);
      expect(entries[3].indexOf(REPLY_PAYLOAD) > 0).assertTrue();
    });

    /**
     * @tc.name          systemIntegrationToastSequencePipeline
     * @tc.desc          The toast sequence follows connect, send, disconnect order.
     * @tc.precondition  An empty client.
     * @tc.steps         1. Connect, send and disconnect.
     *                   2. Read the toast list.
     *                   3. Compare with the expected sequence.
     * @tc.expected      The three toasts appear in lifecycle order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('systemIntegrationToastSequencePipeline', 0, () => {
      logStep('systemIntegrationToastSequencePipeline', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 2018);
      client.sendString('toast-payload');
      client.onDisconnect();
      expect(client.toasts.length).assertEqual(3);
      expect(client.toasts[0]).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(client.toasts[1]).assertEqual(SEND_SUCCESS_TOAST);
      expect(client.toasts[2]).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(client.lastToast()).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(toastCount(client, SEND_FAIL_TOAST)).assertEqual(0);
      expect(client.events.countOf('disconnected')).assertEqual(1);
    });

    /**
     * @tc.name          systemIntegrationRepeatedSendsSameReply
     * @tc.desc          Eight consecutive sends receive the same reply payload.
     * @tc.precondition  A connected client with the default stub.
     * @tc.steps         1. Send eight requests.
     *                   2. Compare every reply text.
     *                   3. Confirm the stub receive count.
     * @tc.expected      All replies equal the shared reply payload.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('systemIntegrationRepeatedSendsSameReply', 0, () => {
      logStep('systemIntegrationRepeatedSendsSameReply', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 2019);
      const results: RequestResultModel[] = sendBurst(client, 8);
      let uniform: boolean = true;
      for (let index = 0; index < results.length; index++) {
        if (results[index].replyText !== REPLY_PAYLOAD) {
          uniform = false;
        }
      }
      expect(uniform).assertTrue();
      expect(results.length).assertEqual(8);
      expect(proxy.stub.receivedTexts.length).assertEqual(8);
      expect(proxy.stub.requestCount()).assertEqual(8);
      expect(successCount(results)).assertEqual(8);
      expect(toastCount(client, SEND_SUCCESS_TOAST)).assertEqual(8);
      expect(client.logs.contains('reply ' + REPLY_PAYLOAD)).assertTrue();
    });

    /**
     * @tc.name          systemIntegrationDescriptorAfterReset
     * @tc.desc          A rebuilt proxy after reset derives its descriptor from the new stub.
     * @tc.precondition  A client with one completed session.
     * @tc.steps         1. Run a session and reset the client.
     *                   2. Open a session with a custom descriptor stub.
     *                   3. Compare the proxy descriptor.
     * @tc.expected      The new proxy carries the custom descriptor while the old one keeps its own.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('systemIntegrationDescriptorAfterReset', 0, () => {
      logStep('systemIntegrationDescriptorAfterReset', 'begin');
      const client: ConnectionModel = newClient();
      const first: RemoteProxyModel = openConnection(client, 2020);
      client.reset();
      client.connect(2021);
      const stub: RemoteStubModel = new RemoteStubModel('CustomDescriptor');
      const second: RemoteProxyModel = new RemoteProxyModel(stub);
      client.onConnect(second);
      expect(first.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(second.descriptor).assertEqual('CustomDescriptor');
      expect(stub.descriptor).assertEqual('CustomDescriptor');
      expect(second.descriptor === first.descriptor).assertFalse();
      expect(client.proxy).assertEqual(second);
      expect(client.events.entries[1]).assertEqual('death-register:CustomDescriptor');
      expect(client.state).assertEqual(STATE_CONNECTED);
    });

    /**
     * @tc.name          systemIntegrationRegisterUnregisterCycle
     * @tc.desc          Registration and unregistration toggle both sides of the binding.
     * @tc.precondition  A connected client.
     * @tc.steps         1. Confirm the initial registration.
     *                   2. Unregister through the proxy.
     *                   3. Re-register and confirm both sides again.
     * @tc.expected      Both flags toggle together and return to true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('systemIntegrationRegisterUnregisterCycle', 0, () => {
      logStep('systemIntegrationRegisterUnregisterCycle', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 2022);
      expect(proxy.deathRegistered).assertTrue();
      const removed: boolean = proxy.unregisterDeathRecipient(client.deathRecipient);
      expect(removed).assertTrue();
      expect(proxy.deathRegistered).assertFalse();
      expect(client.deathRecipient.registered).assertFalse();
      const repeated: boolean = proxy.unregisterDeathRecipient(client.deathRecipient);
      expect(repeated).assertFalse();
      const restored: boolean = proxy.registerDeathRecipient(client.deathRecipient);
      expect(restored).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      expect(client.deathRecipient.registered).assertTrue();
    });

    /**
     * @tc.name          systemIntegrationSendAfterUnregister
     * @tc.desc          A send still succeeds after the death recipient is unregistered.
     * @tc.precondition  A connected client with the registration removed.
     * @tc.steps         1. Unregister the recipient.
     *                   2. Send a request.
     *                   3. Notify death and confirm the recipient is untouched.
     * @tc.expected      The send succeeds and the unregistered recipient records no death.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('systemIntegrationSendAfterUnregister', 0, () => {
      logStep('systemIntegrationSendAfterUnregister', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 2023);
      proxy.unregisterDeathRecipient(client.deathRecipient);
      const result: RequestResultModel = client.sendString('unregistered-send');
      expect(result.isSuccess()).assertTrue();
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
      proxy.notifyDeath();
      expect(client.deathRecipient.diedCount).assertEqual(0);
      expect(proxy.isAlive()).assertFalse();
      expect(client.deathRecipient.registered).assertFalse();
      expect(proxy.stub.receivedTexts[0]).assertEqual('unregistered-send');
      expect(client.state).assertEqual(STATE_CONNECTED);
    });

    /**
     * @tc.name          systemIntegrationInjectedCustomErrorCode
     * @tc.desc          An injected failure surfaces the exact injected error code once.
     * @tc.precondition  A connected client.
     * @tc.steps         1. Arm the proxy with the invalid-proxy code.
     *                   2. Send once and then send again.
     *                   3. Compare both codes and toasts.
     * @tc.expected      The first result carries the injected code and the second succeeds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('systemIntegrationInjectedCustomErrorCode', 0, () => {
      logStep('systemIntegrationInjectedCustomErrorCode', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 2024);
      proxy.failNextSend = ERROR_PROXY_INVALID;
      const injected: RequestResultModel = client.sendString('injected');
      const normal: RequestResultModel = client.sendString('normal');
      expect(injected.errCode).assertEqual(ERROR_PROXY_INVALID);
      expect(injected.isSuccess()).assertFalse();
      expect(normal.errCode).assertEqual(ERROR_NONE);
      expect(normal.isSuccess()).assertTrue();
      expect(proxy.failNextSend).assertEqual(ERROR_NONE);
      expect(toastCount(client, SEND_FAIL_TOAST)).assertEqual(1);
      expect(toastCount(client, SEND_SUCCESS_TOAST)).assertEqual(1);
      expect(client.logs.contains('sendMessageRequest failed')).assertTrue();
    });

    /**
     * @tc.name          systemIntegrationFailuresStillDispatch
     * @tc.desc          Failed dispatches are still recorded in the proxy request log.
     * @tc.precondition  A connected client whose proxy has been killed.
     * @tc.steps         1. Kill the proxy.
     *                   2. Send three requests.
     *                   3. Inspect request log, send calls and stub handling.
     * @tc.expected      Three dispatch attempts are recorded while the stub handles none.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('systemIntegrationFailuresStillDispatch', 0, () => {
      logStep('systemIntegrationFailuresStillDispatch', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 2025);
      proxy.kill();
      const results: RequestResultModel[] = sendBurst(client, 3);
      expect(codeCount(results, ERROR_SEND)).assertEqual(3);
      expect(proxy.sendCalls).assertEqual(3);
      expect(proxy.requests.length).assertEqual(3);
      expect(proxy.stub.handledCodes.length).assertEqual(0);
      expect(proxy.stub.receivedTexts.length).assertEqual(0);
      expect(ClientMetrics.from(client).failures).assertEqual(3);
      expect(toastCount(client, SEND_FAIL_TOAST)).assertEqual(3);
      expect(client.state).assertEqual(STATE_CONNECTED);
    });

    /**
     * @tc.name          systemIntegrationTwoClientsIndependent
     * @tc.desc          Two clients run the full pipeline without sharing any stub state.
     * @tc.precondition  Two empty clients.
     * @tc.steps         1. Run the pipeline on each with distinct payloads.
     *                   2. Compare their stubs and metrics.
     *                   3. Confirm the replies stay separate.
     * @tc.expected      Each stub sees only its own payload and both sessions are healthy.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('systemIntegrationTwoClientsIndependent', 0, () => {
      logStep('systemIntegrationTwoClientsIndependent', 'begin');
      const left: ConnectionModel = newClient();
      const right: ConnectionModel = newClient();
      const leftTrace: string = runPipeline(left, 2026, 'left-only');
      const rightTrace: string = runPipeline(right, 2027, 'right-only');
      expect(leftTrace).assertEqual('connected>IPCStubTest>' + REPLY_PAYLOAD);
      expect(rightTrace).assertEqual('connected>IPCStubTest>' + REPLY_PAYLOAD);
      expect(left.proxy === right.proxy).assertFalse();
      expect(left.proxy?.stub.receivedTexts[0]).assertEqual('left-only');
      expect(right.proxy?.stub.receivedTexts[0]).assertEqual('right-only');
      expect(left.connectId).assertEqual(2026);
      expect(right.connectId).assertEqual(2027);
      expect(ClientMetrics.from(left).replies).assertEqual(1);
      expect(ClientMetrics.from(right).replies).assertEqual(1);
    });

    /**
     * @tc.name          systemIntegrationAsyncOptionDispatch
     * @tc.desc          A direct dispatch with an async option still reaches the stub.
     * @tc.precondition  A connected client and a prepared sequence pair.
     * @tc.steps         1. Build data with a payload and an async option.
     *                   2. Dispatch directly through the proxy.
     *                   3. Read the reply and the stub record.
     * @tc.expected      The request succeeds and the stub records the payload.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('systemIntegrationAsyncOptionDispatch', 0, () => {
      logStep('systemIntegrationAsyncOptionDispatch', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 2028);
      const data: MessageSequenceModel = MessageSequenceModel.create();
      const reply: MessageSequenceModel = MessageSequenceModel.create();
      const option: MessageOptionModel = new MessageOptionModel(OPTION_FLAG_ASYNC, 25, false);
      data.writeString('async-payload');
      const result: RequestResultModel = proxy.sendMessageRequest(REQUEST_CODE, data, reply, option);
      expect(result.isSuccess()).assertTrue();
      expect(option.isAsync()).assertTrue();
      expect(option.waitTime).assertEqual(25);
      expect(proxy.stub.receivedTexts[0]).assertEqual('async-payload');
      expect(result.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(reply.size()).assertEqual(1);
      data.reclaim();
      expect(data.readString()).assertEqual('');
    });

    /**
     * @tc.name          systemIntegrationSequencePairReclaim
     * @tc.desc          A directly dispatched sequence pair is reclaimed without affecting the result.
     * @tc.precondition  A connected client and prepared sequences.
     * @tc.steps         1. Dispatch one request directly.
     *                   2. Reclaim both sequences.
     *                   3. Read the result reply and the reclaimed data.
     * @tc.expected      The result reply stays readable while both sequences refuse reads.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('systemIntegrationSequencePairReclaim', 0, () => {
      logStep('systemIntegrationSequencePairReclaim', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 2029);
      const data: MessageSequenceModel = MessageSequenceModel.create();
      const reply: MessageSequenceModel = MessageSequenceModel.create();
      data.writeString('reclaim-payload');
      const result: RequestResultModel =
        proxy.sendMessageRequest(REQUEST_CODE, data, reply, new MessageOptionModel());
      data.reclaim();
      reply.reclaim();
      expect(result.isSuccess()).assertTrue();
      expect(data.isReclaimed()).assertTrue();
      expect(reply.isReclaimed()).assertTrue();
      expect(data.readString()).assertEqual('');
      expect(reply.readString()).assertEqual('');
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(result.readReply()).assertEqual(REPLY_PAYLOAD);
    });

    /**
     * @tc.name          systemIntegrationRecipientReplacedOnReset
     * @tc.desc          Reset replaces the death recipient so a stale registration cannot leak.
     * @tc.precondition  A connected client with a captured recipient.
     * @tc.steps         1. Capture the recipient and reset.
     *                   2. Reconnect and capture the new recipient.
     *                   3. Compare both instances.
     * @tc.expected      The reset installs a new unregistered recipient.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('systemIntegrationRecipientReplacedOnReset', 0, () => {
      logStep('systemIntegrationRecipientReplacedOnReset', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 2030);
      const oldRecipient: DeathRecipientModel = client.deathRecipient;
      client.reset();
      expect(client.deathRecipient === oldRecipient).assertFalse();
      expect(client.deathRecipient.registered).assertFalse();
      expect(client.deathRecipient.diedCount).assertEqual(0);
      openConnection(client, 2031);
      expect(client.deathRecipient === oldRecipient).assertFalse();
      expect(client.deathRecipient.registered).assertTrue();
      expect(oldRecipient.registered).assertFalse();
      expect(proxy.deathRegistered).assertFalse();
    });

    /**
     * @tc.name          systemIntegrationZeroConnectId
     * @tc.desc          A zero connect id is accepted and distinguishes itself from the sentinel.
     * @tc.precondition  An empty client.
     * @tc.steps         1. Connect with id zero.
     *                   2. Request disconnection.
     *                   3. Compare with the initial sentinel.
     * @tc.expected      The zero id is accepted and treated as connected for the guard.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('systemIntegrationZeroConnectId', 0, () => {
      logStep('systemIntegrationZeroConnectId', 'begin');
      const client: ConnectionModel = newClient();
      const accepted: boolean = client.connect(0);
      const guard: boolean = client.disconnectRequested();
      expect(accepted).assertTrue();
      expect(client.connectId).assertEqual(0);
      expect(client.connectId === INITIAL_CONNECT_ID).assertFalse();
      expect(guard).assertTrue();
      expect(client.events.last()).assertEqual('disconnect-request:0');
      expect(eventCount(client, 'connect')).assertEqual(1);
      expect(client.connectCalls).assertEqual(1);
    });

    /**
     * @tc.name          systemIntegrationNegativeConnectId
     * @tc.desc          A negative connect id other than the sentinel is accepted by the guard.
     * @tc.precondition  An empty client.
     * @tc.steps         1. Connect with id minus five.
     *                   2. Request disconnection.
     *                   3. Inspect the recorded id.
     * @tc.expected      The negative id is accepted because only minus one is reserved.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('systemIntegrationNegativeConnectId', 0, () => {
      logStep('systemIntegrationNegativeConnectId', 'begin');
      const client: ConnectionModel = newClient();
      client.connect(-5);
      const guard: boolean = client.disconnectRequested();
      expect(client.connectId).assertEqual(-5);
      expect(guard).assertTrue();
      expect(client.connectId === INITIAL_CONNECT_ID).assertFalse();
      expect(client.events.last()).assertEqual('disconnect-request:-5');
      expect(client.logs.countLevel('ERROR')).assertEqual(0);
      expect(client.state).assertEqual(STATE_CONNECTING);
      expect(client.proxy).assertUndefined();
    });

    /**
     * @tc.name          systemIntegrationStubReplyChangeBeforeSend
     * @tc.desc          Changing the stub reply after connection changes the next send reply.
     * @tc.precondition  A connected client.
     * @tc.steps         1. Send once with the default reply.
     *                   2. Change the stub reply and send again.
     *                   3. Compare both reply texts.
     * @tc.expected      The first reply is default and the second reflects the change.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('systemIntegrationStubReplyChangeBeforeSend', 0, () => {
      logStep('systemIntegrationStubReplyChangeBeforeSend', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 2032);
      const first: RequestResultModel = client.sendString('first');
      proxy.stub.replyText = 'changed-reply';
      const second: RequestResultModel = client.sendString('second');
      expect(first.replyText).assertEqual(REPLY_PAYLOAD);
      expect(second.replyText).assertEqual('changed-reply');
      expect(proxy.stub.replyText).assertEqual('changed-reply');
      expect(proxy.stub.receivedTexts.length).assertEqual(2);
      expect(proxy.stub.receivedTexts[1]).assertEqual('second');
      expect(toastCount(client, SEND_SUCCESS_TOAST)).assertEqual(2);
      expect(client.logs.contains('reply changed-reply')).assertTrue();
    });

    /**
     * @tc.name          systemIntegrationSessionEventParity
     * @tc.desc          Connected and disconnected event counts track the number of sessions.
     * @tc.precondition  A client and four sessions.
     * @tc.steps         1. Run four open and close sessions.
     *                   2. Count connected and disconnected events.
     *                   3. Compare with the session count.
     * @tc.expected      Both event counts read four and the final state is disconnected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('systemIntegrationSessionEventParity', 0, () => {
      logStep('systemIntegrationSessionEventParity', 'begin');
      const client: ConnectionModel = newClient();
      for (let session = 0; session < 4; session++) {
        openConnection(client, 2040 + session);
        client.onDisconnect();
      }
      expect(eventCount(client, 'connected')).assertEqual(4);
      expect(eventCount(client, 'disconnected')).assertEqual(4);
      expect(eventCount(client, 'connect')).assertEqual(4);
      expect(eventCount(client, 'death-register')).assertEqual(4);
      expect(client.connectCalls).assertEqual(4);
      expect(client.toasts.length).assertEqual(8);
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.connectId).assertEqual(INITIAL_CONNECT_ID);
    });

    /**
     * @tc.name          systemIntegrationMixedToastCounts
     * @tc.desc          A session with successes, failures and a disconnect yields exact toast counts.
     * @tc.precondition  A connected client with an armed failure phase.
     * @tc.steps         1. Send three successful requests.
     *                   2. Kill the proxy and send two more.
     *                   3. Disconnect and send once.
     * @tc.expected      The toast list splits into the expected per-category counts.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('systemIntegrationMixedToastCounts', 0, () => {
      logStep('systemIntegrationMixedToastCounts', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 2044);
      sendBurst(client, 3);
      proxy.kill();
      sendBurst(client, 2);
      client.onDisconnect();
      client.sendString('after-close');
      expect(toastCount(client, CONNECT_SUCCESS_TOAST)).assertEqual(1);
      expect(toastCount(client, SEND_SUCCESS_TOAST)).assertEqual(3);
      expect(toastCount(client, SEND_FAIL_TOAST)).assertEqual(3);
      expect(toastCount(client, DISCONNECT_SUCCESS_TOAST)).assertEqual(1);
      expect(client.toasts.length).assertEqual(8);
      expect(client.events.countOf('send-ok')).assertEqual(3);
      expect(client.events.countOf('send-failed')).assertEqual(2);
    });

    /**
     * @tc.name          systemIntegrationMetricsFailureRatio
     * @tc.desc          Four injected failures among twelve sends produce a two thirds ratio.
     * @tc.precondition  A connected client.
     * @tc.steps         1. Arm a failure every third request.
     *                   2. Send twelve requests.
     *                   3. Compare the ratio and toast counts.
     * @tc.expected      The ratio is two thirds with four failure toasts.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('systemIntegrationMetricsFailureRatio', 0, () => {
      logStep('systemIntegrationMetricsFailureRatio', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 2045);
      for (let index = 0; index < 12; index++) {
        if (index % 3 === 0) {
          proxy.failNextSend = ERROR_SEND;
        }
        client.sendString('ratio-' + String(index));
      }
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.sends).assertEqual(12);
      expect(metrics.replies).assertEqual(8);
      expect(metrics.failures).assertEqual(4);
      expect(metrics.successRatio()).assertEqual(2 / 3);
      expect(toastCount(client, SEND_FAIL_TOAST)).assertEqual(4);
      expect(toastCount(client, SEND_SUCCESS_TOAST)).assertEqual(8);
      expect(proxy.stub.receivedTexts.length).assertEqual(8);
    });

    /**
     * @tc.name          systemIntegrationCustomDescriptorPipeline
     * @tc.desc          A custom descriptor propagates through registration and events.
     * @tc.precondition  A client in the connecting state and a custom stub.
     * @tc.steps         1. Build a stub with a custom descriptor.
     *                   2. Deliver the proxy and send.
     *                   3. Compare descriptor and event entries.
     * @tc.expected      The custom descriptor appears in the proxy and the death-register event.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('systemIntegrationCustomDescriptorPipeline', 0, () => {
      logStep('systemIntegrationCustomDescriptorPipeline', 'begin');
      const client: ConnectionModel = newClient();
      client.connect(2046);
      const stub: RemoteStubModel = new RemoteStubModel('CustomStub');
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      client.onConnect(proxy);
      const result: RequestResultModel = client.sendString('custom-send');
      expect(proxy.descriptor).assertEqual('CustomStub');
      expect(result.isSuccess()).assertTrue();
      expect(client.events.entries[1]).assertEqual('death-register:CustomStub');
      expect(client.events.entries[2]).assertEqual('connected:CustomStub');
      expect(client.proxy).assertEqual(proxy);
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(stub.receivedTexts[0]).assertEqual('custom-send');
    });

    /**
     * @tc.name          systemIntegrationResetBetweenPipelines
     * @tc.desc          Reset between two pipelines isolates their metrics and events.
     * @tc.precondition  An empty client.
     * @tc.steps         1. Run the first pipeline with three sends.
     *                   2. Reset and run the second with two sends.
     *                   3. Compare metrics and event size.
     * @tc.expected      Only the second pipeline is visible after reset.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('systemIntegrationResetBetweenPipelines', 0, () => {
      logStep('systemIntegrationResetBetweenPipelines', 'begin');
      const client: ConnectionModel = newClient();
      runPipeline(client, 2047, 'first');
      sendBurst(client, 2);
      client.reset();
      runPipeline(client, 2048, 'second');
      sendBurst(client, 1);
      expect(ClientMetrics.from(client).replies).assertEqual(2);
      expect(ClientMetrics.from(client).sends).assertEqual(2);
      expect(ClientMetrics.from(client).connects).assertEqual(1);
      expect(client.events.size()).assertEqual(5);
      expect(client.toasts.length).assertEqual(3);
      expect(client.connectId).assertEqual(2048);
      expect(client.logs.size()).assertEqual(4);
    });

    /**
     * @tc.name          systemIntegrationFinalInvariants
     * @tc.desc          Two sessions with mixed outcomes satisfy every counting invariant.
     * @tc.precondition  An empty client.
     * @tc.steps         1. Run two sessions with successes and failures.
     *                   2. Build metrics once.
     *                   3. Verify the invariants.
     * @tc.expected      Sends equal replies plus failures and the client ends disconnected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('systemIntegrationFinalInvariants', 0, () => {
      logStep('systemIntegrationFinalInvariants', 'begin');
      const client: ConnectionModel = newClient();
      const first: RemoteProxyModel = openConnection(client, 2049);
      sendBurst(client, 6);
      first.failNextSend = ERROR_SEND;
      client.sendString('bad');
      client.onDisconnect();
      openConnection(client, 2050);
      sendBurst(client, 4);
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.sends).assertEqual(11);
      expect(metrics.replies).assertEqual(10);
      expect(metrics.failures).assertEqual(1);
      expect(metrics.connects).assertEqual(2);
      expect(metrics.replies + metrics.failures).assertEqual(metrics.sends);
      expect(toastCount(client, CONNECT_SUCCESS_TOAST)).assertEqual(2);
      expect(toastCount(client, DISCONNECT_SUCCESS_TOAST)).assertEqual(1);
      expect(client.events.countOf('send-ok')).assertEqual(10);
    });

    /**
     * @tc.name          systemIntegrationReplyReadProgression
     * @tc.desc          Reading a result reply advances its cursor exactly once.
     * @tc.precondition  A connected client and one request result.
     * @tc.steps         1. Send one request.
     *                   2. Read the reply twice.
     *                   3. Inspect the reply cursor.
     * @tc.expected      The first read returns the payload and the second returns empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('systemIntegrationReplyReadProgression', 0, () => {
      logStep('systemIntegrationReplyReadProgression', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 2051);
      const result: RequestResultModel = client.sendString('progression');
      expect(result.reply.size()).assertEqual(1);
      expect(result.reply.cursor).assertEqual(0);
      const first: string = result.readReply();
      expect(first).assertEqual(REPLY_PAYLOAD);
      expect(result.reply.cursor).assertEqual(1);
      expect(result.reply.readCount).assertEqual(1);
      expect(result.readReply()).assertEqual('');
      expect(result.reply.readCount).assertEqual(1);
    });

    /**
     * @tc.name          systemIntegrationLongPipelineSession
     * @tc.desc          A ten-request pipeline session keeps every counter consistent.
     * @tc.precondition  A connected client.
     * @tc.steps         1. Send ten requests.
     *                   2. Inspect toasts, logs and events.
     *                   3. Confirm the session state.
     * @tc.expected      Ten replies, eleven toasts, twelve log lines and thirteen events appear.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('systemIntegrationLongPipelineSession', 0, () => {
      logStep('systemIntegrationLongPipelineSession', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 2052);
      const results: RequestResultModel[] = sendBurst(client, 10);
      expect(successCount(results)).assertEqual(10);
      expect(client.toasts.length).assertEqual(11);
      expect(client.logs.size()).assertEqual(12);
      expect(client.events.size()).assertEqual(13);
      expect(client.events.countOf('send-ok')).assertEqual(10);
      expect(client.logs.countLevel('ERROR')).assertEqual(0);
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(ClientMetrics.from(client).successRatio()).assertEqual(1);
    });

    /**
     * @tc.name          systemIntegrationFingerprintReproducible
     * @tc.desc          Two clients running the same pipeline produce the same event fingerprint.
     * @tc.precondition  Two empty clients and one fixed pipeline.
     * @tc.steps         1. Run the pipeline on both clients.
     *                   2. Compare event fingerprints.
     *                   3. Compare traces and sizes.
     * @tc.expected      Both fingerprints and traces are identical.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('systemIntegrationFingerprintReproducible', 0, () => {
      logStep('systemIntegrationFingerprintReproducible', 'begin');
      const left: ConnectionModel = newClient();
      const right: ConnectionModel = newClient();
      openConnection(left, 2053);
      openConnection(right, 2053);
      sendBurst(left, 3);
      sendBurst(right, 3);
      expect(left.events.fingerprint()).assertEqual(right.events.fingerprint());
      expect(left.events.trace()).assertEqual(right.events.trace());
      expect(left.events.size()).assertEqual(6);
      expect(right.events.size()).assertEqual(6);
      expect(left.events.fingerprint() > 0).assertTrue();
      expect(left.toasts.length).assertEqual(right.toasts.length);
      expect(left.logs.trace()).assertEqual(right.logs.trace());
    });

    /**
     * @tc.name          systemIntegrationDefaultOptionDispatch
     * @tc.desc          A direct dispatch with the default option behaves synchronously.
     * @tc.precondition  A connected client and a prepared data sequence.
     * @tc.steps         1. Build data and dispatch with a default option.
     *                   2. Inspect the option predicates.
     *                   3. Read the reply.
     * @tc.expected      The dispatch succeeds with a sync option and the reply matches.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('systemIntegrationDefaultOptionDispatch', 0, () => {
      logStep('systemIntegrationDefaultOptionDispatch', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 2054);
      const data: MessageSequenceModel = MessageSequenceModel.create();
      const reply: MessageSequenceModel = MessageSequenceModel.create();
      const option: MessageOptionModel = new MessageOptionModel();
      data.writeString('default-option');
      const result: RequestResultModel = proxy.sendMessageRequest(REQUEST_CODE, data, reply, option);
      expect(option.isSync()).assertTrue();
      expect(option.isAsync()).assertFalse();
      expect(option.describe()).assertEqual('0/0/false');
      expect(result.isSuccess()).assertTrue();
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(proxy.stub.receivedTexts[0]).assertEqual('default-option');
      expect(proxy.sendCalls).assertEqual(1);
    });

    /**
     * @tc.name          systemIntegrationHandledCodeOrder
     * @tc.desc          The stub records handled codes in dispatch order.
     * @tc.precondition  A connected client.
     * @tc.steps         1. Send three requests.
     *                   2. Read the handled code list.
     *                   3. Compare with the request list.
     * @tc.expected      Both lists hold three entries of code one in order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('systemIntegrationHandledCodeOrder', 0, () => {
      logStep('systemIntegrationHandledCodeOrder', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 2055);
      sendBurst(client, 3);
      const handled: number[] = proxy.stub.handledCodes;
      expect(handled.length).assertEqual(3);
      expect(handled[0]).assertEqual(1);
      expect(handled[1]).assertEqual(1);
      expect(handled[2]).assertEqual(1);
      expect(proxy.requests.length).assertEqual(3);
      expect(joined(handled.map((value: number) => String(value)), '-')).assertEqual('1-1-1');
      expect(proxy.stub.requestCount()).assertEqual(3);
    });

    /**
     * @tc.name          systemIntegrationReclaimAfterBurst
     * @tc.desc          Every result reply in a burst can be reclaimed without affecting the payload text.
     * @tc.precondition  A connected client and five results.
     * @tc.steps         1. Send five requests.
     *                   2. Reclaim all reply sequences.
     *                   3. Verify reads are empty and the payload text survives.
     * @tc.expected      All reply sequences are reclaimed and the stored texts remain intact.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('systemIntegrationReclaimAfterBurst', 0, () => {
      logStep('systemIntegrationReclaimAfterBurst', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 2056);
      const results: RequestResultModel[] = sendBurst(client, 5);
      for (let index = 0; index < results.length; index++) {
        results[index].reply.reclaim();
      }
      let reclaimed: number = 0;
      let emptyReads: number = 0;
      for (let index = 0; index < results.length; index++) {
        if (results[index].reply.isReclaimed()) {
          reclaimed = reclaimed + 1;
        }
        if (results[index].readReply() === '') {
          emptyReads = emptyReads + 1;
        }
      }
      expect(reclaimed).assertEqual(5);
      expect(emptyReads).assertEqual(5);
      expect(results[0].replyText).assertEqual(REPLY_PAYLOAD);
      expect(results[4].replyText).assertEqual(REPLY_PAYLOAD);
      expect(results[2].isSuccess()).assertTrue();
      expect(client.toasts.length).assertEqual(6);
    });
  });
}