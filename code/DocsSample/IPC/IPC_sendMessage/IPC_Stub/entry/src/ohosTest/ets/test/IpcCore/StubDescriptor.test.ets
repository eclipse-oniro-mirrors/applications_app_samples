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
  STUB_BUNDLE,
  STUB_ABILITY,
  CLIENT_BUNDLE,
  REQUEST_CODE,
  REQUEST_PAYLOAD,
  REPLY_PAYLOAD,
  EVENT_ON_CONNECT,
  ServiceLifecycleModel,
  StubRemoteObjectModel,
  InProcessClient,
  StubMetrics,
  expectedDescriptor,
  joined,
  countOf,
  uniqueStrings,
  sameStringArray,
  textFingerprint,
  replayCodes
} from '../Shared/SharedDriver';

export default function stubDescriptorTest(): void {
  describe('StubDescriptor', () => {
    beforeAll(() => {
      logSuite('StubDescriptor', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('StubDescriptor', 'end');
    });

    /**
     * @tc.name   stubDescriptorDefaultLiteral
     * @tc.desc   A stub built without arguments uses the production descriptor.
     * @tc.precondition  The shared driver is loaded.
     * @tc.steps         1. Construct a stub with no arguments.
     *                   2. Read the descriptor.
     *                   3. Compare with the production literal.
     * @tc.expected      The descriptor is 'IPCStubTest'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stubDescriptorDefaultLiteral', 0, () => {
      const stub = new StubRemoteObjectModel();
      expect(stub.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(stub.descriptor).assertEqual('IPCStubTest');
      expect(stub.descriptor.length).assertEqual(11);
      expect(stub.descriptor === REPLY_PAYLOAD).assertFalse();
      expect(expectedDescriptor()).assertEqual(stub.descriptor);
    });

    /**
     * @tc.name   stubDescriptorPrefixAndSuffix
     * @tc.desc   The default descriptor has the expected prefix and suffix.
     * @tc.precondition  A default stub.
     * @tc.steps         1. Read the descriptor.
     *                   2. Test the prefix 'IPC'.
     *                   3. Test the suffix 'Test'.
     * @tc.expected      Both affixes are present.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stubDescriptorPrefixAndSuffix', 0, () => {
      const descriptor = new StubRemoteObjectModel().descriptor;
      expect(descriptor.startsWith('IPC')).assertTrue();
      expect(descriptor.endsWith('Test')).assertTrue();
      expect(descriptor.startsWith('Stub')).assertFalse();
      expect(descriptor.endsWith('Stub')).assertFalse();
      expect(descriptor.substring(0, 3)).assertEqual('IPC');
      expect(descriptor.substring(7)).assertEqual('Test');
    });

    /**
     * @tc.name   stubDescriptorInnerSegment
     * @tc.desc   The middle segment of the descriptor is 'Stub'.
     * @tc.precondition  A default stub.
     * @tc.steps         1. Read the descriptor.
     *                   2. Extract the middle segment.
     *                   3. Compare with 'Stub'.
     * @tc.expected      The segment between IPC and Test is 'Stub'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubDescriptorInnerSegment', 0, () => {
      const descriptor = new StubRemoteObjectModel().descriptor;
      expect(descriptor.substring(3, 7)).assertEqual('Stub');
      expect(descriptor.indexOf('Stub')).assertEqual(3);
      expect(descriptor.indexOf('IPC')).assertEqual(0);
      expect(descriptor.indexOf('Test')).assertEqual(7);
      expect(descriptor.charAt(7)).assertEqual('T');
      expect(descriptor.charAt(0)).assertEqual('I');
    });

    /**
     * @tc.name   stubDescriptorCaseSensitive
     * @tc.desc   Descriptor comparisons are case sensitive.
     * @tc.precondition  A default stub.
     * @tc.steps         1. Compare with a lower-case variant.
     *                   2. Compare two upper-case variants.
     *                   3. Compare the exact literal.
     * @tc.expected      Only the exact literal matches.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubDescriptorCaseSensitive', 0, () => {
      const descriptor = new StubRemoteObjectModel().descriptor;
      expect(descriptor === 'ipcstubtest').assertFalse();
      expect(descriptor === 'IPCSTUBTEST').assertFalse();
      expect(descriptor === 'IPCStubTest').assertTrue();
      expect(descriptor.toUpperCase()).assertEqual('IPCSTUBTEST');
      expect(descriptor.toLowerCase()).assertEqual('ipcstubtest');
      expect(descriptor.toUpperCase() === descriptor).assertFalse();
    });

    /**
     * @tc.name   stubDescriptorFingerprintMatchesConstant
     * @tc.desc   The descriptor fingerprint is deterministic for all stubs.
     * @tc.precondition  Two default stubs.
     * @tc.steps         1. Fingerprint both descriptors.
     *                   2. Fingerprint the shared constant.
     *                   3. Compare the three values.
     * @tc.expected      All three fingerprints are equal.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubDescriptorFingerprintMatchesConstant', 0, () => {
      const left = new StubRemoteObjectModel().descriptor;
      const right = new StubRemoteObjectModel().descriptor;
      expect(textFingerprint(left)).assertEqual(textFingerprint(right));
      expect(textFingerprint(left)).assertEqual(textFingerprint(STUB_DESCRIPTOR));
      expect(textFingerprint(right)).assertEqual(textFingerprint('IPCStubTest'));
      expect(textFingerprint(left)).assertLarger(0);
      expect(textFingerprint(left)).assertLess(1000003);
      expect(left === right).assertTrue();
    });

    /**
     * @tc.name   stubDescriptorCustomValueStored
     * @tc.desc   A constructor argument overrides the default descriptor.
     * @tc.precondition  The stub constructor accepts a descriptor.
     * @tc.steps         1. Build a stub with a custom descriptor.
     *                   2. Read the descriptor back.
     *                   3. Compare with the default stub.
     * @tc.expected      The custom descriptor is stored verbatim.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stubDescriptorCustomValueStored', 0, () => {
      const custom = new StubRemoteObjectModel('custom.Desc');
      const plain = new StubRemoteObjectModel();
      expect(custom.descriptor).assertEqual('custom.Desc');
      expect(custom.descriptor).assertEqual('custom.Desc');
      expect(custom.descriptor === plain.descriptor).assertFalse();
      expect(plain.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(custom.alive).assertTrue();
      expect(custom.replyText).assertEqual(REPLY_PAYLOAD);
    });

    /**
     * @tc.name   stubDescriptorCustomInstancesIndependent
     * @tc.desc   Two custom stubs keep their own descriptor values.
     * @tc.precondition  Two stubs built with different descriptors.
     * @tc.steps         1. Build both stubs.
     *                   2. Read both descriptors.
     *                   3. Deduplicate the descriptor list.
     * @tc.expected      The descriptors differ and remain independent.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubDescriptorCustomInstancesIndependent', 0, () => {
      const first = new StubRemoteObjectModel('first.Desc');
      const second = new StubRemoteObjectModel('second.Desc');
      const values: string[] = [first.descriptor, second.descriptor];
      expect(first.descriptor).assertEqual('first.Desc');
      expect(second.descriptor).assertEqual('second.Desc');
      expect(first.descriptor === second.descriptor).assertFalse();
      expect(uniqueStrings(values).length).assertEqual(2);
      expect(countOf(values, 'first.Desc')).assertEqual(1);
      expect(second.descriptor.startsWith('second')).assertTrue();
      expect(first.descriptor.endsWith('Desc')).assertTrue();
    });

    /**
     * @tc.name   stubDescriptorEmptyCustomValue
     * @tc.desc   An empty descriptor argument is kept as an empty string.
     * @tc.precondition  A stub built with an empty descriptor.
     * @tc.steps         1. Build the stub with ''.
     *                   2. Read the descriptor and its length.
     *                   3. Compare with the default stub.
     * @tc.expected      The descriptor is empty and differs from the default.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubDescriptorEmptyCustomValue', 0, () => {
      const empty = new StubRemoteObjectModel('');
      const plain = new StubRemoteObjectModel();
      expect(empty.descriptor).assertEqual('');
      expect(empty.descriptor.length).assertEqual(0);
      expect(empty.descriptor === plain.descriptor).assertFalse();
      expect(textFingerprint(empty.descriptor)).assertEqual(216613);
      expect(empty.alive).assertTrue();
      expect(plain.descriptor.length).assertEqual(11);
    });

    /**
     * @tc.name   stubDescriptorLongCustomValue
     * @tc.desc   A long descriptor is stored without truncation.
     * @tc.precondition  A stub built with a 64-character descriptor.
     * @tc.steps         1. Build a long descriptor string.
     *                   2. Construct the stub with it.
     *                   3. Compare the length and content.
     * @tc.expected      The full descriptor is preserved.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubDescriptorLongCustomValue', 0, () => {
      let text = '';
      for (let index = 0; index < 8; index++) {
        text = text + 'abcdefgh';
      }
      const stub = new StubRemoteObjectModel(text);
      expect(text.length).assertEqual(64);
      expect(stub.descriptor.length).assertEqual(64);
      expect(stub.descriptor).assertEqual(text);
      expect(stub.descriptor.startsWith('abcdefgh')).assertTrue();
      expect(stub.descriptor.endsWith('abcdefgh')).assertTrue();
      expect(textFingerprint(stub.descriptor)).assertEqual(textFingerprint(text));
    });

    /**
     * @tc.name   stubDescriptorWithSpaces
     * @tc.desc   Spaces inside a descriptor are preserved exactly.
     * @tc.precondition  A stub built with spaced text.
     * @tc.steps         1. Build a descriptor with leading and inner spaces.
     *                   2. Read it back.
     *                   3. Split it on spaces.
     * @tc.expected      The spacing survives unchanged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubDescriptorWithSpaces', 0, () => {
      const spaced = new StubRemoteObjectModel(' IPC Stub Test ');
      expect(spaced.descriptor).assertEqual(' IPC Stub Test ');
      expect(spaced.descriptor.length).assertEqual(15);
      expect(spaced.descriptor.startsWith(' ')).assertTrue();
      expect(spaced.descriptor.endsWith(' ')).assertTrue();
      expect(spaced.descriptor.split(' ').length).assertEqual(5);
      expect(spaced.descriptor.trim()).assertEqual('IPC Stub Test');
      expect(spaced.descriptor.trim() === spaced.descriptor).assertFalse();
    });

    /**
     * @tc.name   stubDescriptorWithSeparators
     * @tc.desc   Descriptor text may contain punctuation without corruption.
     * @tc.precondition  A stub built with a dotted descriptor.
     * @tc.steps         1. Build 'app.ipc:Stub/1'.
     *                   2. Split on the dot and colon.
     *                   3. Read the recorded descriptor after a request.
     * @tc.expected      The descriptor text is unchanged by request handling.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubDescriptorWithSeparators', 0, () => {
      const stub = new StubRemoteObjectModel('app.ipc:Stub/1');
      const client = new InProcessClient(stub);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(stub.descriptor).assertEqual('app.ipc:Stub/1');
      expect(stub.descriptor.indexOf('.')).assertEqual(3);
      expect(stub.descriptor.indexOf(':')).assertEqual(7);
      expect(stub.descriptor.indexOf('/')).assertEqual(12);
      expect(stub.descriptor.split('.').length).assertEqual(2);
      expect(stub.requestCount()).assertEqual(1);
      expect(stub.descriptor.length).assertEqual(14);
    });

    /**
     * @tc.name   stubDescriptorOracleStableAcrossCalls
     * @tc.desc   expectedDescriptor returns the same value on every call.
     * @tc.precondition  The oracle function is imported.
     * @tc.steps         1. Call the oracle five times.
     *                   2. Deduplicate the results.
     *                   3. Compare with the constant.
     * @tc.expected      Every call returns the same descriptor text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubDescriptorOracleStableAcrossCalls', 0, () => {
      const values: string[] = [];
      for (let index = 0; index < 5; index++) {
        values.push(expectedDescriptor());
      }
      expect(values.length).assertEqual(5);
      expect(uniqueStrings(values).length).assertEqual(1);
      expect(countOf(values, STUB_DESCRIPTOR)).assertEqual(5);
      expect(values[0]).assertEqual('IPCStubTest');
      expect(values[4]).assertEqual(values[0]);
      expect(textFingerprint(joined(values, ''))).assertLarger(0);
    });

    /**
     * @tc.name   stubDescriptorOracleMatchesEveryStub
     * @tc.desc   Default stubs all carry the oracle descriptor.
     * @tc.precondition  The oracle function is imported.
     * @tc.steps         1. Build four default stubs.
     *                   2. Compare each descriptor with the oracle.
     *                   3. Deduplicate the collected values.
     * @tc.expected      All four stubs match the oracle.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubDescriptorOracleMatchesEveryStub', 0, () => {
      const stubs: StubRemoteObjectModel[] = [
        new StubRemoteObjectModel(),
        new StubRemoteObjectModel(),
        new StubRemoteObjectModel(),
        new StubRemoteObjectModel()
      ];
      const values: string[] = [];
      for (let index = 0; index < stubs.length; index++) {
        expect(stubs[index].descriptor).assertEqual(expectedDescriptor());
        values.push(stubs[index].descriptor);
      }
      expect(values.length).assertEqual(4);
      expect(uniqueStrings(values).length).assertEqual(1);
      expect(values[0]).assertEqual(STUB_DESCRIPTOR);
      expect(expectedDescriptor().length).assertEqual(11);
    });

    /**
     * @tc.name   stubDescriptorDiffersFromBundleAndAbility
     * @tc.desc   The descriptor is neither the bundle name nor the ability name.
     * @tc.precondition  The bundle and ability constants are imported.
     * @tc.steps         1. Compare the descriptor with the bundle name.
     *                   2. Compare it with the ability name.
     *                   3. Compare with the client bundle.
     * @tc.expected      The descriptor differs from all module identifiers.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubDescriptorDiffersFromBundleAndAbility', 0, () => {
      const descriptor = new StubRemoteObjectModel().descriptor;
      expect(descriptor === STUB_BUNDLE).assertFalse();
      expect(descriptor === STUB_ABILITY).assertFalse();
      expect(descriptor === CLIENT_BUNDLE).assertFalse();
      expect(descriptor.indexOf('.')).assertEqual(-1);
      expect(STUB_BUNDLE.indexOf('.')).assertLarger(0);
      expect(sameStringArray([descriptor], [STUB_DESCRIPTOR])).assertTrue();
    });

    /**
     * @tc.name   stubDescriptorLifecycleConnectUsesProductionValue
     * @tc.desc   onConnect builds a stub with the production descriptor.
     * @tc.precondition  A created lifecycle service.
     * @tc.steps         1. Call onCreate and onConnect.
     *                   2. Read the returned stub descriptor.
     *                   3. Compare with the shared constant.
     * @tc.expected      The service returns a stub with 'IPCStubTest'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stubDescriptorLifecycleConnectUsesProductionValue', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const stub = service.onConnect();
      expect(stub.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(stub.descriptor).assertEqual('IPCStubTest');
      expect(service.stub?.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(stub.descriptor).assertEqual(expectedDescriptor());
      expect(service.connectCount).assertEqual(1);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(1);
    });

    /**
     * @tc.name   stubDescriptorLifecycleConnectEventDetail
     * @tc.desc   The connect event records the descriptor as its detail.
     * @tc.precondition  A created lifecycle service.
     * @tc.steps         1. Call onConnect.
     *                   2. Read the last event entry.
     *                   3. Split the entry on the colon.
     * @tc.expected      The detail equals the descriptor.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubDescriptorLifecycleConnectEventDetail', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const stub = service.onConnect();
      const entry = service.events.last();
      const parts = entry.split(':');
      expect(parts.length).assertEqual(2);
      expect(parts[0]).assertEqual(EVENT_ON_CONNECT);
      expect(parts[1]).assertEqual(stub.descriptor);
      expect(parts[1]).assertEqual('IPCStubTest');
      expect(entry).assertEqual('onConnect:IPCStubTest');
      expect(entry.indexOf(stub.descriptor)).assertLarger(0);
    });

    /**
     * @tc.name   stubDescriptorLifecycleConnectTrace
     * @tc.desc   The lifecycle trace embeds the descriptor after connect.
     * @tc.precondition  A created lifecycle service.
     * @tc.steps         1. Call onCreate and onConnect.
     *                   2. Read the event trace.
     *                   3. Count descriptor occurrences.
     * @tc.expected      The descriptor appears once in the trace.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubDescriptorLifecycleConnectTrace', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onConnect();
      const trace = service.events.trace();
      expect(trace).assertEqual('onCreate>onConnect:IPCStubTest');
      expect(trace.indexOf(STUB_DESCRIPTOR)).assertEqual(19);
      expect(trace.endsWith(STUB_DESCRIPTOR)).assertTrue();
      expect(trace.split(':').length).assertEqual(2);
      expect(countOf(trace.split('>'), EVENT_ON_CONNECT + ':' + STUB_DESCRIPTOR)).assertEqual(1);
      expect(textFingerprint(trace)).assertLarger(0);
    });

    /**
     * @tc.name   stubDescriptorLifecycleConnectTwiceSameValue
     * @tc.desc   Two connects produce stubs with equal descriptors.
     * @tc.precondition  A created lifecycle service.
     * @tc.steps         1. Call onConnect twice.
     *                   2. Compare both descriptors.
     *                   3. Count connect entries in the trace.
     * @tc.expected      The descriptors match and both connects are traced.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubDescriptorLifecycleConnectTwiceSameValue', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const first = service.onConnect();
      const second = service.onConnect();
      expect(first.descriptor).assertEqual(second.descriptor);
      expect(first.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(2);
      expect(service.events.trace().split('>').length).assertEqual(3);
      expect(service.stub).assertEqual(second);
      expect(service.connectCount).assertEqual(2);
      expect(first.descriptor === second.descriptor).assertTrue();
    });

    /**
     * @tc.name   stubDescriptorLifecycleConnectAfterRequest
     * @tc.desc   A descriptor stays valid after the stub processes a request.
     * @tc.precondition  A connected lifecycle service.
     * @tc.steps         1. Connect and send code 1 through the stub.
     *                   2. Read the descriptor again.
     *                   3. Compare with the connect event detail.
     * @tc.expected      The descriptor is unchanged by request handling.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubDescriptorLifecycleConnectAfterRequest', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const stub = service.onConnect();
      const client = new InProcessClient(stub);
      const result = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(result.handled).assertTrue();
      expect(stub.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(stub.descriptor.length).assertEqual(11);
      expect(service.events.last()).assertEqual('onConnect:IPCStubTest');
      expect(stub.requestCount()).assertEqual(1);
      expect(service.state).assertEqual('connected');
    });

    /**
     * @tc.name   stubDescriptorLifecycleResetDropsStub
     * @tc.desc   reset clears the service stub and its descriptor access.
     * @tc.precondition  A connected lifecycle service.
     * @tc.steps         1. Connect and capture the stub descriptor.
     *                   2. Reset the service.
     *                   3. Read the service stub reference.
     * @tc.expected      The service no longer exposes a stub.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubDescriptorLifecycleResetDropsStub', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const stub = service.onConnect();
      const captured = stub.descriptor;
      service.reset();
      expect(captured).assertEqual(STUB_DESCRIPTOR);
      expect(service.stub).assertUndefined();
      expect(service.state).assertEqual('idle');
      expect(service.events.size()).assertEqual(0);
      expect(stub.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(service.connectCount).assertEqual(0);
    });

    /**
     * @tc.name   stubDescriptorTwoServicesSameValue
     * @tc.desc   Independent services return stubs with the same descriptor.
     * @tc.precondition  Two lifecycle services.
     * @tc.steps         1. Connect both services.
     *                   2. Compare their stub descriptors.
     *                   3. Deduplicate the collected values.
     * @tc.expected      Both services use the production descriptor.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubDescriptorTwoServicesSameValue', 0, () => {
      const left = new ServiceLifecycleModel();
      const right = new ServiceLifecycleModel();
      left.onCreate();
      right.onCreate();
      const leftStub = left.onConnect();
      const rightStub = right.onConnect();
      const values: string[] = [leftStub.descriptor, rightStub.descriptor];
      expect(leftStub.descriptor).assertEqual(rightStub.descriptor);
      expect(uniqueStrings(values).length).assertEqual(1);
      expect(countOf(values, STUB_DESCRIPTOR)).assertEqual(2);
      expect(leftStub === rightStub).assertFalse();
      expect(left.state).assertEqual(right.state);
      expect(left.events.trace()).assertEqual(right.events.trace());
    });

    /**
     * @tc.name   stubDescriptorSurvivesKill
     * @tc.desc   Killing a stub does not alter its descriptor.
     * @tc.precondition  A stub with a custom descriptor.
     * @tc.steps         1. Kill the stub.
     *                   2. Read the descriptor.
     *                   3. Send a request and re-read the descriptor.
     * @tc.expected      The descriptor is unchanged while the stub is dead.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubDescriptorSurvivesKill', 0, () => {
      const stub = new StubRemoteObjectModel('kill.Desc');
      stub.kill();
      const client = new InProcessClient(stub);
      const result = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(stub.descriptor).assertEqual('kill.Desc');
      expect(stub.alive).assertFalse();
      expect(result.handled).assertFalse();
      expect(stub.descriptor.length).assertEqual(9);
      expect(stub.requestCount()).assertEqual(1);
      expect(stub.descriptor.startsWith('kill')).assertTrue();
    });

    /**
     * @tc.name   stubDescriptorSurvivesDefaultReset
     * @tc.desc   reset keeps the constructor descriptor on a default stub.
     * @tc.precondition  A default stub that processed a request.
     * @tc.steps         1. Send a request then reset the stub.
     *                   2. Read the descriptor.
     *                   3. Compare with the shared constant.
     * @tc.expected      The descriptor remains 'IPCStubTest'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubDescriptorSurvivesDefaultReset', 0, () => {
      const stub = new StubRemoteObjectModel();
      new InProcessClient(stub).send(REQUEST_CODE, REQUEST_PAYLOAD);
      stub.reset();
      expect(stub.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(stub.descriptor).assertEqual(expectedDescriptor());
      expect(stub.requestCount()).assertEqual(0);
      expect(stub.alive).assertTrue();
      expect(stub.descriptor.length).assertEqual(11);
      expect(textFingerprint(stub.descriptor)).assertEqual(textFingerprint('IPCStubTest'));
    });

    /**
     * @tc.name   stubDescriptorSurvivesCustomReset
     * @tc.desc   reset keeps a custom constructor descriptor.
     * @tc.precondition  A custom stub that was killed.
     * @tc.steps         1. Kill the custom stub.
     *                   2. Reset it.
     *                   3. Compare the descriptor with the constructor value.
     * @tc.expected      The custom descriptor is preserved by reset.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubDescriptorSurvivesCustomReset', 0, () => {
      const stub = new StubRemoteObjectModel('custom.Stub');
      stub.kill();
      stub.reset();
      expect(stub.descriptor).assertEqual('custom.Stub');
      expect(stub.descriptor === STUB_DESCRIPTOR).assertFalse();
      expect(stub.alive).assertTrue();
      expect(stub.replyText).assertEqual(REPLY_PAYLOAD);
      expect(stub.descriptor.endsWith('.Stub')).assertTrue();
      expect(stub.descriptor.length).assertEqual(11);
    });

    /**
     * @tc.name   stubDescriptorSurvivesManyRequests
     * @tc.desc   Repeated request handling never mutates the descriptor.
     * @tc.precondition  A stub and a client double.
     * @tc.steps         1. Send eight mixed requests.
     *                   2. Read the descriptor.
     *                   3. Compare with the initial copy.
     * @tc.expected      The descriptor text is identical after the run.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubDescriptorSurvivesManyRequests', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const initial = stub.descriptor;
      for (let index = 0; index < 8; index++) {
        client.send(index % 2 === 0 ? REQUEST_CODE : 2, REQUEST_PAYLOAD);
      }
      expect(stub.descriptor).assertEqual(initial);
      expect(stub.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(stub.requestCount()).assertEqual(8);
      expect(StubMetrics.from(stub).requests).assertEqual(8);
      expect(stub.descriptor.length).assertEqual(initial.length);
      expect(textFingerprint(stub.descriptor)).assertEqual(textFingerprint(initial));
    });

    /**
     * @tc.name   stubDescriptorWithReplayClient
     * @tc.desc   The replay helper preserves the descriptor of the supplied stub.
     * @tc.precondition  A custom stub.
     * @tc.steps         1. Replay three codes through the helper.
     *                   2. Read the client stub descriptor.
     *                   3. Compare with the custom value.
     * @tc.expected      The replayed client sees the same descriptor.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubDescriptorWithReplayClient', 0, () => {
      const stub = new StubRemoteObjectModel('replay.Desc');
      const client = replayCodes(stub, [REQUEST_CODE, 2, REQUEST_CODE]);
      expect(client.stub.descriptor).assertEqual('replay.Desc');
      expect(client.stub).assertEqual(stub);
      expect(client.sentCodes.length).assertEqual(3);
      expect(client.results[0].handled).assertTrue();
      expect(client.results[1].handled).assertFalse();
      expect(stub.descriptor === STUB_DESCRIPTOR).assertFalse();
      expect(stub.requestCount()).assertEqual(3);
    });

    /**
     * @tc.name   stubDescriptorAcrossMultipleClients
     * @tc.desc   Several clients share one stub descriptor without conflicts.
     * @tc.precondition  One stub and three client doubles.
     * @tc.steps         1. Build three clients over the same stub.
     *                   2. Send one request from each.
     *                   3. Compare their stub descriptors.
     * @tc.expected      All clients report the same descriptor.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubDescriptorAcrossMultipleClients', 0, () => {
      const stub = new StubRemoteObjectModel('shared.Desc');
      const first = new InProcessClient(stub);
      const second = new InProcessClient(stub);
      const third = new InProcessClient(stub);
      first.send(REQUEST_CODE, REQUEST_PAYLOAD);
      second.send(REQUEST_CODE, REQUEST_PAYLOAD);
      third.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(first.stub.descriptor).assertEqual('shared.Desc');
      expect(second.stub.descriptor).assertEqual(first.stub.descriptor);
      expect(third.stub.descriptor).assertEqual(first.stub.descriptor);
      expect(stub.requestCount()).assertEqual(3);
      expect(first.replies.length).assertEqual(1);
      expect(third.sentCodes.length).assertEqual(1);
      expect(stub.descriptor.length).assertEqual(11);
    });

    /**
     * @tc.name   stubDescriptorDuringMetricsRun
     * @tc.desc   A metrics run leaves the descriptor and counters consistent.
     * @tc.precondition  A default stub and a client double.
     * @tc.steps         1. Send three accepted and one rejected code.
     *                   2. Build metrics.
     *                   3. Read the descriptor and compute its length.
     * @tc.expected      Metrics count four requests and the descriptor is intact.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubDescriptorDuringMetricsRun', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      client.sendMany(3, REQUEST_CODE);
      client.send(2, REQUEST_PAYLOAD);
      const metrics = StubMetrics.from(stub);
      expect(metrics.requests).assertEqual(4);
      expect(metrics.handled).assertEqual(3);
      expect(stub.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(stub.descriptor.length).assertEqual(11);
      expect(metrics.successRatio()).assertEqual(0.75);
      expect(stub.descriptor.indexOf('Stub')).assertLarger(-1);
    });

    /**
     * @tc.name   stubDescriptorCharCodes
     * @tc.desc   The default descriptor character codes match the literal.
     * @tc.precondition  A default stub.
     * @tc.steps         1. Read the char codes of the first three characters.
     *                   2. Compare with the ASCII values of I, P and C.
     *                   3. Compare the final character code.
     * @tc.expected      The character codes match the production literal.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubDescriptorCharCodes', 0, () => {
      const descriptor = new StubRemoteObjectModel().descriptor;
      expect(descriptor.charCodeAt(0)).assertEqual(73);
      expect(descriptor.charCodeAt(1)).assertEqual(80);
      expect(descriptor.charCodeAt(2)).assertEqual(67);
      expect(descriptor.charCodeAt(10)).assertEqual(116);
      expect(descriptor.charCodeAt(0)).assertEqual('I'.charCodeAt(0));
      expect(descriptor.charCodeAt(10)).assertEqual('t'.charCodeAt(0));
      expect(descriptor.length).assertEqual(11);
    });

    /**
     * @tc.name   stubDescriptorSplitShape
     * @tc.desc   Splitting the descriptor on empty text yields every character.
     * @tc.precondition  A default stub.
     * @tc.steps         1. Split the descriptor into characters.
     *                   2. Compare the count with the length.
     *                   3. Rejoin the characters.
     * @tc.expected      The character list rebuilds the descriptor exactly.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubDescriptorSplitShape', 0, () => {
      const descriptor = new StubRemoteObjectModel().descriptor;
      const chars = descriptor.split('');
      expect(chars.length).assertEqual(11);
      expect(chars.length).assertEqual(descriptor.length);
      expect(chars[0]).assertEqual('I');
      expect(chars[10]).assertEqual('t');
      expect(joined(chars, '')).assertEqual(descriptor);
      expect(chars[3]).assertEqual('S');
      expect(uniqueStrings(chars).length).assertLess(chars.length);
    });

    /**
     * @tc.name   stubDescriptorJoinedWithBundle
     * @tc.desc   The descriptor participates cleanly in joined identifier lists.
     * @tc.precondition  The descriptor and bundle constants are imported.
     * @tc.steps         1. Join the bundle, ability and descriptor.
     *                   2. Split the joined text.
     *                   3. Count each identifier.
     * @tc.expected      The joined text keeps all three values.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubDescriptorJoinedWithBundle', 0, () => {
      const identifiers: string[] = [STUB_BUNDLE, STUB_ABILITY, STUB_DESCRIPTOR];
      const text = joined(identifiers, '/');
      const parts = text.split('/');
      expect(parts.length).assertEqual(3);
      expect(parts[0]).assertEqual(STUB_BUNDLE);
      expect(parts[1]).assertEqual(STUB_ABILITY);
      expect(parts[2]).assertEqual(STUB_DESCRIPTOR);
      expect(countOf(parts, 'IPCStubTest')).assertEqual(1);
      expect(text.endsWith('/IPCStubTest')).assertTrue();
      expect(text.length).assertEqual(47);
    });

    /**
     * @tc.name   stubDescriptorUniqueAcrossStubs
     * @tc.desc   Mixed custom and default stubs have distinct descriptors.
     * @tc.precondition  A default stub and two custom stubs.
     * @tc.steps         1. Build three stubs with different descriptors.
     *                   2. Collect the descriptors.
     *                   3. Deduplicate the list.
     * @tc.expected      Three distinct descriptors remain.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubDescriptorUniqueAcrossStubs', 0, () => {
      const values: string[] = [
        new StubRemoteObjectModel().descriptor,
        new StubRemoteObjectModel('other.Stub').descriptor,
        new StubRemoteObjectModel('third.Stub').descriptor
      ];
      expect(values.length).assertEqual(3);
      expect(uniqueStrings(values).length).assertEqual(3);
      expect(values[0]).assertEqual('IPCStubTest');
      expect(values[1]).assertEqual('other.Stub');
      expect(countOf(values, 'IPCStubTest')).assertEqual(1);
      expect(sameStringArray(uniqueStrings(values), values)).assertTrue();
    });

    /**
     * @tc.name   stubDescriptorAfterDisconnectKept
     * @tc.desc   Disconnecting the service does not clear the stub descriptor.
     * @tc.precondition  A connected lifecycle service.
     * @tc.steps         1. Connect and capture the stub.
     *                   2. Disconnect the service.
     *                   3. Read the descriptor from the service and the stub.
     * @tc.expected      Both still report the production descriptor.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubDescriptorAfterDisconnectKept', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const stub = service.onConnect();
      service.onDisconnect();
      expect(service.stub?.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(stub.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(service.state).assertEqual('disconnected');
      expect(service.disconnectCount).assertEqual(1);
      expect(service.connectCount).assertEqual(1);
      expect(stub.descriptor.length).assertEqual(11);
    });

    /**
     * @tc.name   stubDescriptorAfterDestroyKept
     * @tc.desc   Destroying the service keeps the captured stub descriptor.
     * @tc.precondition  A connected lifecycle service.
     * @tc.steps         1. Connect and capture the stub.
     *                   2. Destroy the service.
     *                   3. Compare the captured descriptor with the constant.
     * @tc.expected      The descriptor survives the destroyed state.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubDescriptorAfterDestroyKept', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const stub = service.onConnect();
      service.onDestroy();
      expect(stub.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(service.stub).assertEqual(stub);
      expect(service.isAlive()).assertFalse();
      expect(service.destroyCount).assertEqual(1);
      expect(textFingerprint(stub.descriptor)).assertEqual(textFingerprint(expectedDescriptor()));
      expect(stub.descriptor.endsWith('Test')).assertTrue();
    });

    /**
     * @tc.name   stubDescriptorNumericSuffix
     * @tc.desc   A numeric suffix is stored without conversion.
     * @tc.precondition  A stub built with a numeric suffix descriptor.
     * @tc.steps         1. Build 'IPCStubTest2'.
     *                   2. Compare with the default descriptor.
     *                   3. Read the suffix character.
     * @tc.expected      The numeric suffix is preserved as text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubDescriptorNumericSuffix', 0, () => {
      const numbered = new StubRemoteObjectModel('IPCStubTest2');
      const plain = new StubRemoteObjectModel();
      expect(numbered.descriptor).assertEqual('IPCStubTest2');
      expect(numbered.descriptor.length).assertEqual(12);
      expect(numbered.descriptor === plain.descriptor).assertFalse();
      expect(numbered.descriptor.endsWith('2')).assertTrue();
      expect(numbered.descriptor.charAt(11)).assertEqual('2');
      expect(numbered.descriptor.substring(0, 11)).assertEqual(plain.descriptor);
      expect(numbered.descriptor.charCodeAt(11)).assertEqual(50);
    });

    /**
     * @tc.name   stubDescriptorLowerCaseCustom
     * @tc.desc   A lower-case custom descriptor keeps its casing.
     * @tc.precondition  A stub built with a lower-case descriptor.
     * @tc.steps         1. Build 'ipcstubtest'.
     *                   2. Compare with the default descriptor.
     *                   3. Uppercase it and compare with the default.
     * @tc.expected      The custom casing is preserved.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubDescriptorLowerCaseCustom', 0, () => {
      const lower = new StubRemoteObjectModel('ipcstubtest');
      const plain = new StubRemoteObjectModel();
      expect(lower.descriptor).assertEqual('ipcstubtest');
      expect(lower.descriptor === plain.descriptor).assertFalse();
      expect(lower.descriptor.toUpperCase()).assertEqual(plain.descriptor.toUpperCase());
      expect(lower.descriptor.length).assertEqual(plain.descriptor.length);
      expect(lower.descriptor.charAt(0)).assertEqual('i');
      expect(plain.descriptor.charAt(0)).assertEqual('I');
      expect(textFingerprint(lower.descriptor) === textFingerprint(plain.descriptor)).assertFalse();
    });

    /**
     * @tc.name   stubDescriptorTrimComparison
     * @tc.desc   Trimming a padded descriptor yields the plain literal.
     * @tc.precondition  A stub with a padded descriptor.
     * @tc.steps         1. Build the padded descriptor.
     *                   2. Trim it.
     *                   3. Compare with the shared constant.
     * @tc.expected      The trimmed text equals the production descriptor.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubDescriptorTrimComparison', 0, () => {
      const padded = new StubRemoteObjectModel('  IPCStubTest  ');
      expect(padded.descriptor.length).assertEqual(15);
      expect(padded.descriptor.trim()).assertEqual(STUB_DESCRIPTOR);
      expect(padded.descriptor.trim().length).assertEqual(11);
      expect(padded.descriptor.trim() === padded.descriptor).assertFalse();
      expect(textFingerprint(padded.descriptor.trim())).assertEqual(textFingerprint(STUB_DESCRIPTOR));
      expect(padded.descriptor.trim().startsWith('IPC')).assertTrue();
    });

    /**
     * @tc.name   stubDescriptorConcatComparison
     * @tc.desc   Concatenating two segments rebuilds the descriptor.
     * @tc.precondition  A default stub.
     * @tc.steps         1. Split the descriptor into two parts.
     *                   2. Concatenate them back.
     *                   3. Compare with the constant.
     * @tc.expected      The rebuilt text equals the original descriptor.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubDescriptorConcatComparison', 0, () => {
      const descriptor = new StubRemoteObjectModel().descriptor;
      const head = descriptor.substring(0, 7);
      const tail = descriptor.substring(7);
      expect(head).assertEqual('IPCStub');
      expect(tail).assertEqual('Test');
      expect(head + tail).assertEqual(descriptor);
      expect(head.length).assertEqual(7);
      expect(tail.length).assertEqual(4);
      expect(head.length + tail.length).assertEqual(descriptor.length);
    });

    /**
     * @tc.name   stubDescriptorConnectLogLine
     * @tc.desc   The connect log line exists but omits the descriptor detail.
     * @tc.precondition  A created lifecycle service.
     * @tc.steps         1. Connect the service.
     *                   2. Read the log lines.
     *                   3. Confirm the descriptor is only in the event detail.
     * @tc.expected      The log mentions onConnect and the event holds the descriptor.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('stubDescriptorConnectLogLine', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onConnect();
      expect(service.logs.contains('onConnect')).assertTrue();
      expect(service.logs.trace().indexOf(STUB_DESCRIPTOR)).assertEqual(-1);
      expect(service.events.trace().indexOf(STUB_DESCRIPTOR)).assertLarger(0);
      expect(service.logs.size()).assertEqual(2);
      expect(service.logs.lines[1]).assertEqual('INFO onConnect');
      expect(service.events.last()).assertEqual('onConnect:IPCStubTest');
    });

    /**
     * @tc.name   stubDescriptorSliceAroundSegments
     * @tc.desc   Slice indices around the Stub segment are stable.
     * @tc.precondition  A default stub.
     * @tc.steps         1. Slice the descriptor at several offsets.
     *                   2. Compare each slice with the expected text.
     *                   3. Confirm the full slice equals the descriptor.
     * @tc.expected      Every slice matches the production segmentation.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubDescriptorSliceAroundSegments', 0, () => {
      const descriptor = new StubRemoteObjectModel().descriptor;
      expect(descriptor.slice(0, 3)).assertEqual('IPC');
      expect(descriptor.slice(3, 7)).assertEqual('Stub');
      expect(descriptor.slice(7)).assertEqual('Test');
      expect(descriptor.slice(0)).assertEqual(descriptor);
      expect(descriptor.slice(-4)).assertEqual('Test');
      expect(descriptor.slice(11)).assertEqual('');
      expect(descriptor.slice(0, 3).length).assertEqual(3);
    });

    /**
     * @tc.name   stubDescriptorCustomKillRevive
     * @tc.desc   A custom descriptor survives a kill and revive cycle.
     * @tc.precondition  A custom stub and a client double.
     * @tc.steps         1. Kill the stub and send a request.
     *                   2. Revive it and send another request.
     *                   3. Read the descriptor after each step.
     * @tc.expected      The descriptor never changes.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubDescriptorCustomKillRevive', 0, () => {
      const stub = new StubRemoteObjectModel('revive.Desc');
      const client = new InProcessClient(stub);
      stub.kill();
      const blocked = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      const afterKill = stub.descriptor;
      stub.revive();
      const accepted = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(blocked.handled).assertFalse();
      expect(accepted.handled).assertTrue();
      expect(afterKill).assertEqual('revive.Desc');
      expect(stub.descriptor).assertEqual(afterKill);
      expect(stub.descriptor.length).assertEqual(11);
      expect(stub.requestCount()).assertEqual(2);
    });

    /**
     * @tc.name   stubDescriptorManyConnectsTrace
     * @tc.desc   Four connects produce four descriptor details in the trace.
     * @tc.precondition  A created lifecycle service.
     * @tc.steps         1. Connect four times.
     *                   2. Split the event trace.
     *                   3. Count the entries carrying the descriptor.
     * @tc.expected      Four connect entries mention the descriptor.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubDescriptorManyConnectsTrace', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onConnect();
      service.onConnect();
      service.onConnect();
      service.onConnect();
      const parts = service.events.trace().split('>');
      let withDescriptor = 0;
      for (let index = 0; index < parts.length; index++) {
        if (parts[index].indexOf(STUB_DESCRIPTOR) >= 0) {
          withDescriptor = withDescriptor + 1;
        }
      }
      expect(parts.length).assertEqual(5);
      expect(withDescriptor).assertEqual(4);
      expect(service.connectCount).assertEqual(4);
      expect(parts[1]).assertEqual('onConnect:IPCStubTest');
      expect(parts[4]).assertEqual('onConnect:IPCStubTest');
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(4);
    });

    /**
     * @tc.name   stubDescriptorSearchInEventEntries
     * @tc.desc   Only connect entries carry the descriptor text.
     * @tc.precondition  A service after a full lifecycle.
     * @tc.steps         1. Run create, request, connect, disconnect and destroy.
     *                   2. Scan every event entry for the descriptor.
     *                   3. Collect the matching entries.
     * @tc.expected      Exactly one entry carries the descriptor.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubDescriptorSearchInEventEntries', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onRequest(2);
      service.onConnect();
      service.onDisconnect();
      service.onDestroy();
      const matches: string[] = [];
      for (let index = 0; index < service.events.entries.length; index++) {
        const entry = service.events.entries[index];
        if (entry.indexOf(STUB_DESCRIPTOR) >= 0) {
          matches.push(entry);
        }
      }
      expect(matches.length).assertEqual(1);
      expect(matches[0]).assertEqual('onConnect:IPCStubTest');
      expect(service.events.size()).assertEqual(5);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(1);
      expect(matches[0].indexOf(':')).assertEqual(9);
      expect(matches[0].length).assertEqual(21);
    });

    /**
     * @tc.name   stubDescriptorResetThenReconnect
     * @tc.desc   A reset service reconnects with the production descriptor.
     * @tc.precondition  A service that was connected and reset.
     * @tc.steps         1. Connect, then reset the service.
     *                   2. Create and connect again.
     *                   3. Compare the new descriptor.
     * @tc.expected      The reconnected stub uses the production descriptor.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubDescriptorResetThenReconnect', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const first = service.onConnect();
      service.reset();
      service.onCreate();
      const second = service.onConnect();
      expect(first.descriptor).assertEqual(second.descriptor);
      expect(second.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(first === second).assertFalse();
      expect(service.events.trace()).assertEqual('onCreate>onConnect:IPCStubTest');
      expect(service.connectCount).assertEqual(1);
      expect(service.stub).assertEqual(second);
    });

    /**
     * @tc.name   stubDescriptorEmptyCustomSurvivesReset
     * @tc.desc   An empty custom descriptor is preserved by reset.
     * @tc.precondition  A stub built with an empty descriptor.
     * @tc.steps         1. Send a request through the empty-descriptor stub.
     *                   2. Reset the stub.
     *                   3. Re-read the descriptor.
     * @tc.expected      The descriptor stays empty after reset.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubDescriptorEmptyCustomSurvivesReset', 0, () => {
      const stub = new StubRemoteObjectModel('');
      const client = new InProcessClient(stub);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(stub.descriptor).assertEqual('');
      stub.reset();
      expect(stub.descriptor).assertEqual('');
      expect(stub.descriptor.length).assertEqual(0);
      expect(stub.requestCount()).assertEqual(0);
      expect(stub.alive).assertTrue();
      expect(stub.descriptor === STUB_DESCRIPTOR).assertFalse();
      expect(textFingerprint(stub.descriptor)).assertEqual(216613);
    });

    /**
     * @tc.name   stubDescriptorRepeatedCustomResets
     * @tc.desc   Repeated resets never replace a custom descriptor.
     * @tc.precondition  A custom stub.
     * @tc.steps         1. Reset the stub three times.
     *                   2. Read the descriptor after each reset.
     *                   3. Compare with the constructor value.
     * @tc.expected      Every reset keeps the custom descriptor.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubDescriptorRepeatedCustomResets', 0, () => {
      const stub = new StubRemoteObjectModel('repeat.Desc');
      const values: string[] = [];
      for (let index = 0; index < 3; index++) {
        stub.reset();
        values.push(stub.descriptor);
      }
      expect(values.length).assertEqual(3);
      expect(uniqueStrings(values).length).assertEqual(1);
      expect(values[0]).assertEqual('repeat.Desc');
      expect(countOf(values, 'repeat.Desc')).assertEqual(3);
      expect(stub.descriptor.length).assertEqual(11);
      expect(stub.descriptor === STUB_DESCRIPTOR).assertFalse();
      expect(stub.requestCount()).assertEqual(0);
    });

    /**
     * @tc.name   stubDescriptorCompareWithPayloads
     * @tc.desc   The descriptor is distinct from both payload literals.
     * @tc.precondition  A default stub.
     * @tc.steps         1. Compare the descriptor with the request payload.
     *                   2. Compare it with the reply payload.
     *                   3. Compare the three fingerprint values.
     * @tc.expected      The descriptor shares no value with the payloads.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubDescriptorCompareWithPayloads', 0, () => {
      const descriptor = new StubRemoteObjectModel().descriptor;
      expect(descriptor === REQUEST_PAYLOAD).assertFalse();
      expect(descriptor === REPLY_PAYLOAD).assertFalse();
      expect(descriptor.length === REQUEST_PAYLOAD.length).assertTrue();
      expect(textFingerprint(descriptor) === textFingerprint(REQUEST_PAYLOAD)).assertFalse();
      expect(textFingerprint(descriptor) === textFingerprint(REPLY_PAYLOAD)).assertFalse();
      expect(uniqueStrings([descriptor, REQUEST_PAYLOAD, REPLY_PAYLOAD]).length).assertEqual(3);
    });

    /**
     * @tc.name   stubDescriptorEventDetailSplitCount
     * @tc.desc   The connect event has exactly one colon separator.
     * @tc.precondition  A connected lifecycle service.
     * @tc.steps         1. Connect the service.
     *                   2. Split the last event on colons.
     *                   3. Count the resulting parts.
     * @tc.expected      Exactly two parts are produced.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubDescriptorEventDetailSplitCount', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onConnect();
      const entry = service.events.last();
      expect(entry.split(':').length).assertEqual(2);
      expect(countOf(entry.split(':'), STUB_DESCRIPTOR)).assertEqual(1);
      expect(entry.split(':')[1].length).assertEqual(11);
      expect(entry.split(':')[0]).assertEqual(EVENT_ON_CONNECT);
      expect(entry.lastIndexOf(':')).assertEqual(9);
      expect(entry.indexOf(':')).assertEqual(entry.lastIndexOf(':'));
    });

    /**
     * @tc.name   stubDescriptorFingerprintCustomRange
     * @tc.desc   Custom descriptor fingerprints stay inside the hash range.
     * @tc.precondition  Three custom stubs.
     * @tc.steps         1. Fingerprint each custom descriptor.
     *                   2. Check each value against the range.
     *                   3. Deduplicate the fingerprints.
     * @tc.expected      Every fingerprint is valid and distinct.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubDescriptorFingerprintCustomRange', 0, () => {
      const stubs: StubRemoteObjectModel[] = [
        new StubRemoteObjectModel('alpha.Desc'),
        new StubRemoteObjectModel('beta.Desc'),
        new StubRemoteObjectModel('gamma.Desc')
      ];
      const prints: string[] = [];
      for (let index = 0; index < stubs.length; index++) {
        const value = textFingerprint(stubs[index].descriptor);
        expect(value).assertLarger(-1);
        expect(value).assertLess(1000003);
        prints.push(String(value));
      }
      expect(prints.length).assertEqual(3);
      expect(uniqueStrings(prints).length).assertEqual(3);
      expect(stubs[2].descriptor).assertEqual('gamma.Desc');
    });

    /**
     * @tc.name   stubDescriptorLifecycleMetricsLink
     * @tc.desc   Descriptor and metrics coexist after a connected request run.
     * @tc.precondition  A connected lifecycle service.
     * @tc.steps         1. Connect and send two requests plus one rejection.
     *                   2. Build metrics from the stub.
     *                   3. Read the descriptor and snapshot.
     * @tc.expected      Metrics, descriptor and snapshot all stay consistent.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubDescriptorLifecycleMetricsLink', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const stub = service.onConnect();
      const client = new InProcessClient(stub);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      client.send(2, REQUEST_PAYLOAD);
      const metrics = StubMetrics.from(stub);
      expect(stub.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(metrics.requests).assertEqual(3);
      expect(metrics.handled).assertEqual(2);
      expect(metrics.successRatio()).assertLess(1);
      expect(service.state).assertEqual('connected');
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(1);
      expect(stub.descriptor.length).assertEqual(11);
    });

    /**
     * @tc.name   stubDescriptorTwoCustomStubRequests
     * @tc.desc   Two custom stubs answer requests without crossing descriptors.
     * @tc.precondition  Two custom stubs with different descriptors.
     * @tc.steps         1. Send a request through each stub.
     *                   2. Read each descriptor and its ledger.
     *                   3. Compare the recorded replies.
     * @tc.expected      Each stub keeps its own descriptor while replying.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubDescriptorTwoCustomStubRequests', 0, () => {
      const first = new StubRemoteObjectModel('first.Only');
      const second = new StubRemoteObjectModel('second.Only');
      const firstClient = new InProcessClient(first);
      const secondClient = new InProcessClient(second);
      const firstResult = firstClient.send(REQUEST_CODE, REQUEST_PAYLOAD);
      const secondResult = secondClient.send(REQUEST_CODE, 'second payload');
      expect(firstResult.replyText).assertEqual(REPLY_PAYLOAD);
      expect(secondResult.replyText).assertEqual(REPLY_PAYLOAD);
      expect(first.descriptor).assertEqual('first.Only');
      expect(second.descriptor).assertEqual('second.Only');
      expect(first.requests[0].text).assertEqual(REQUEST_PAYLOAD);
      expect(second.requests[0].text).assertEqual('second payload');
      expect(first.descriptor === second.descriptor).assertFalse();
    });

    /**
     * @tc.name   stubDescriptorOrderInJoinedList
     * @tc.desc   The descriptor occupies its list position when joined.
     * @tc.precondition  Three stub descriptors of different values.
     * @tc.steps         1. Join the descriptors with ';'.
     *                   2. Read the first and last segments.
     *                   3. Compare the order.
     * @tc.expected      The join preserves the construction order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubDescriptorOrderInJoinedList', 0, () => {
      const a = new StubRemoteObjectModel('aaa.Desc');
      const b = new StubRemoteObjectModel('bbb.Desc');
      const c = new StubRemoteObjectModel('ccc.Desc');
      const text = joined([a.descriptor, b.descriptor, c.descriptor], ';');
      expect(text).assertEqual('aaa.Desc;bbb.Desc;ccc.Desc');
      expect(text.split(';').length).assertEqual(3);
      expect(text.startsWith('aaa')).assertTrue();
      expect(text.endsWith('ccc.Desc')).assertTrue();
      expect(text.split(';')[1]).assertEqual(b.descriptor);
      expect(sameStringArray(text.split(';'), [a.descriptor, b.descriptor, c.descriptor])).assertTrue();
    });

    /**
     * @tc.name   stubDescriptorConnectDisconnectConnectTrace
     * @tc.desc   Reconnecting after a disconnect leaves two descriptor details.
     * @tc.precondition  A created lifecycle service.
     * @tc.steps         1. Connect, disconnect and connect again.
     *                   2. Read the event trace.
     *                   3. Count connect entries.
     * @tc.expected      Two connect entries carry the descriptor.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubDescriptorConnectDisconnectConnectTrace', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onConnect();
      service.onDisconnect();
      service.onConnect();
      const trace = service.events.trace();
      expect(trace).assertEqual('onCreate>onConnect:IPCStubTest>onDisconnect>onConnect:IPCStubTest');
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(2);
      expect(trace.split('onConnect:IPCStubTest').length).assertEqual(3);
      expect(service.connectCount).assertEqual(2);
      expect(service.disconnectCount).assertEqual(1);
      expect(service.state).assertEqual('connected');
      expect(service.events.size()).assertEqual(4);
    });

    /**
     * @tc.name   stubDescriptorCustomWithSlash
     * @tc.desc   A descriptor containing a slash survives a join and split.
     * @tc.precondition  A stub with a slash in its descriptor.
     * @tc.steps         1. Build a 'module/Stub' descriptor.
     *                   2. Join it with another value using a tilde.
     *                   3. Split and compare the segments.
     * @tc.expected      The slash is preserved inside the descriptor.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubDescriptorCustomWithSlash', 0, () => {
      const stub = new StubRemoteObjectModel('module/Stub');
      const text = joined([stub.descriptor, STUB_DESCRIPTOR], '~');
      expect(stub.descriptor).assertEqual('module/Stub');
      expect(stub.descriptor.split('/').length).assertEqual(2);
      expect(stub.descriptor.indexOf('/')).assertEqual(6);
      expect(text.split('~').length).assertEqual(2);
      expect(text.startsWith('module/Stub')).assertTrue();
      expect(text.split('~')[1]).assertEqual('IPCStubTest');
      expect(stub.descriptor.length).assertEqual(11);
    });

    /**
     * @tc.name   stubDescriptorComparisonAfterManyResets
     * @tc.desc   Five resets leave the descriptor comparison results stable.
     * @tc.precondition  A default stub.
     * @tc.steps         1. Reset the stub five times.
     *                   2. Compare the descriptor with the constant each time.
     *                   3. Count the equal comparisons.
     * @tc.expected      All five comparisons are equal.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubDescriptorComparisonAfterManyResets', 0, () => {
      const stub = new StubRemoteObjectModel();
      let equalCount = 0;
      for (let index = 0; index < 5; index++) {
        stub.reset();
        if (stub.descriptor === STUB_DESCRIPTOR) {
          equalCount = equalCount + 1;
        }
      }
      expect(equalCount).assertEqual(5);
      expect(stub.descriptor).assertEqual(expectedDescriptor());
      expect(stub.alive).assertTrue();
      expect(stub.requestCount()).assertEqual(0);
      expect(stub.descriptor.length).assertEqual(11);
      expect(textFingerprint(stub.descriptor)).assertEqual(textFingerprint('IPCStubTest'));
    });

    /**
     * @tc.name   stubDescriptorMultipleCustomMetrics
     * @tc.desc   Custom stubs keep separate descriptors and separate metrics.
     * @tc.precondition  Two custom stubs with clients.
     * @tc.steps         1. Send two requests to the first stub.
     *                   2. Send one rejection to the second stub.
     *                   3. Compare metrics and descriptors.
     * @tc.expected      The counters and descriptors stay separated.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubDescriptorMultipleCustomMetrics', 0, () => {
      const busy = new StubRemoteObjectModel('busy.Desc');
      const idle = new StubRemoteObjectModel('idle.Desc');
      const busyClient = new InProcessClient(busy);
      const idleClient = new InProcessClient(idle);
      busyClient.sendMany(2, REQUEST_CODE);
      idleClient.send(2, REQUEST_PAYLOAD);
      const busyMetrics = StubMetrics.from(busy);
      const idleMetrics = StubMetrics.from(idle);
      expect(busyMetrics.handled).assertEqual(2);
      expect(idleMetrics.handled).assertEqual(0);
      expect(idleMetrics.rejected).assertEqual(1);
      expect(busy.descriptor).assertEqual('busy.Desc');
      expect(idle.descriptor).assertEqual('idle.Desc');
      expect(busyMetrics.fingerprint() === idleMetrics.fingerprint()).assertFalse();
      expect(busy.descriptor === idle.descriptor).assertFalse();
    });

    /**
     * @tc.name   stubDescriptorRequestRecordUnaffected
     * @tc.desc   Request records do not contain or alter the descriptor field.
     * @tc.precondition  A custom stub and a client double.
     * @tc.steps         1. Send one request.
     *                   2. Read the record description.
     *                   3. Compare the descriptor before and after.
     * @tc.expected      The record is independent of the descriptor text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('stubDescriptorRequestRecordUnaffected', 0, () => {
      const stub = new StubRemoteObjectModel('record.Desc');
      const client = new InProcessClient(stub);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      const record = stub.requests[0];
      expect(record.describe().indexOf('record.Desc')).assertEqual(-1);
      expect(record.describe()).assertEqual('1/hello world/hello rpc/true');
      expect(stub.descriptor).assertEqual('record.Desc');
      expect(record.code).assertEqual(REQUEST_CODE);
      expect(record.handled).assertTrue();
      expect(record.replyText).assertEqual(REPLY_PAYLOAD);
      expect(stub.requestCount()).assertEqual(1);
    });

    /**
     * @tc.name   stubDescriptorReconnectEventDetail
     * @tc.desc   The second connect event repeats the production descriptor.
     * @tc.precondition  A service that reconnected once.
     * @tc.steps         1. Connect twice with a disconnect between.
     *                   2. Collect both connect entries.
     *                   3. Compare them with each other.
     * @tc.expected      Both connect details are identical.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubDescriptorReconnectEventDetail', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onConnect();
      service.onDisconnect();
      service.onConnect();
      const connects: string[] = [];
      for (let index = 0; index < service.events.entries.length; index++) {
        const entry = service.events.entries[index];
        if (entry.startsWith(EVENT_ON_CONNECT)) {
          connects.push(entry);
        }
      }
      expect(connects.length).assertEqual(2);
      expect(connects[0]).assertEqual(connects[1]);
      expect(connects[0]).assertEqual('onConnect:IPCStubTest');
      expect(sameStringArray(connects, ['onConnect:IPCStubTest', 'onConnect:IPCStubTest'])).assertTrue();
      expect(uniqueStrings(connects).length).assertEqual(1);
      expect(service.connectCount).assertEqual(2);
    });

    /**
     * @tc.name   stubDescriptorEventFingerprintWithDescriptor
     * @tc.desc   The event fingerprint includes the descriptor detail text.
     * @tc.precondition  A created lifecycle service.
     * @tc.steps         1. Connect and read the fingerprint.
     *                   2. Compute the oracle from the trace.
     *                   3. Compare with a fingerprint ignoring the detail.
     * @tc.expected      The fingerprint depends on the descriptor detail.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubDescriptorEventFingerprintWithDescriptor', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onConnect();
      const withDetail = service.events.fingerprint();
      const oracle = textFingerprint(service.events.trace());
      const withoutDetail = textFingerprint('onCreate>onConnect');
      expect(withDetail).assertEqual(oracle);
      expect(withDetail === withoutDetail).assertFalse();
      expect(service.events.trace()).assertEqual('onCreate>onConnect:IPCStubTest');
      expect(oracle).assertLarger(0);
      expect(oracle).assertLess(1000003);
      expect(service.events.size()).assertEqual(2);
    });

    /**
     * @tc.name   stubDescriptorNotTrimmedByConnect
     * @tc.desc   Connecting never trims spaces from a custom descriptor.
     * @tc.precondition  A custom stub built directly, not through the service.
     * @tc.steps         1. Build a stub with padded descriptor text.
     *                   2. Send a request through a client.
     *                   3. Compare the padded descriptor with its trimmed form.
     * @tc.expected      The padding survives request handling.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('stubDescriptorNotTrimmedByConnect', 0, () => {
      const stub = new StubRemoteObjectModel(' padded.Desc ');
      const client = new InProcessClient(stub);
      const result = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(result.handled).assertTrue();
      expect(stub.descriptor).assertEqual(' padded.Desc ');
      expect(stub.descriptor.length).assertEqual(13);
      expect(stub.descriptor.trim()).assertEqual('padded.Desc');
      expect(stub.descriptor === stub.descriptor.trim()).assertFalse();
      expect(stub.descriptor.startsWith(' ')).assertTrue();
      expect(stub.requestCount()).assertEqual(1);
    });
  });
}
