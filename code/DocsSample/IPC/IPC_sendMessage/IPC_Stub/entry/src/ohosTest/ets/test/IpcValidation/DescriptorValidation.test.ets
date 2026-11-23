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
  REQUEST_CODE,
  REQUEST_PAYLOAD,
  REPLY_PAYLOAD,
  ERROR_NONE,
  ERROR_STUB_REJECTED,
  EVENT_ON_CONNECT,
  EVENT_ON_REQUEST,
  EVENT_ON_DISCONNECT,
  joined,
  countOf,
  uniqueStrings,
  textFingerprint,
  clampInt,
  StubRemoteObjectModel,
  StubMetrics,
  InProcessClient,
  ServiceLifecycleModel,
  expectedDescriptor
} from '../Shared/SharedDriver';

const DESCRIPTOR_LIMIT: number = 64;
const DESCRIPTOR_EMPTY: string = '';

/** A descriptor must be a single non empty token without separators. */
function descriptorLooksValid(value: string): boolean {
  if (value.length === 0) {
    return false;
  }
  if (value.length > DESCRIPTOR_LIMIT) {
    return false;
  }
  for (let index = 0; index < value.length; index++) {
    const code: number = value.charCodeAt(index);
    const upper: boolean = code >= 65 && code <= 90;
    const lower: boolean = code >= 97 && code <= 122;
    const digit: boolean = code >= 48 && code <= 57;
    const underscore: boolean = value.charAt(index) === '_';
    if (!upper && !lower && !digit && !underscore) {
      return false;
    }
  }
  return true;
}

function descriptorLength(value: string): number {
  return value.length;
}

function describeStub(stub: StubRemoteObjectModel): string {
  return stub.descriptor + '#' + String(stub.requestCount()) + '#' + String(stub.alive);
}

function descriptorTextOf(service: ServiceLifecycleModel): string {
  const stub: StubRemoteObjectModel | undefined = service.stub;
  return stub === undefined ? '' : stub.descriptor;
}

export default function descriptorValidation(): void {
  describe('DescriptorValidation', () => {
    beforeAll(() => {
      logSuite('DescriptorValidation', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('DescriptorValidation', 'end');
    });

    /**
     * @tc.name          descriptorValidationDefaultLiteral
     * @tc.desc          A default stub exposes the documented IPCStubTest descriptor.
     * @tc.precondition  The stub model and constants are loaded.
     * @tc.steps         1. Construct a default stub.
     *                   2. Read the descriptor field.
     *                   3. Compare with the constant and oracle.
     * @tc.expected      The descriptor is IPCStubTest in every comparison.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('descriptorValidationDefaultLiteral', 0, () => {
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const oracle: string = expectedDescriptor();
      const literal: string = 'IPCStubTest';
      logStep('descriptorValidationDefaultLiteral', stub.descriptor);
      expect(stub.descriptor).assertEqual(literal);
      expect(stub.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(stub.descriptor).assertEqual(oracle);
      expect(stub.descriptor.length).assertEqual(11);
      expect(stub.descriptor.startsWith('IPC')).assertTrue();
      expect(stub.descriptor.endsWith('Test')).assertTrue();
      expect(stub.descriptor).assertEqual(oracle);
      expect(descriptorLooksValid(stub.descriptor)).assertTrue();
      expect(stub.descriptor.split('').length).assertEqual(11);
      expect(stub.descriptor.substring(0, 7)).assertEqual('IPCStub');
      expect(stub.descriptor.substring(7)).assertEqual('Test');
    });

    /**
     * @tc.name          descriptorValidationCustomDescriptorAccepted
     * @tc.desc          A custom descriptor is preserved exactly on the stub.
     * @tc.precondition  The stub constructor accepts a descriptor string.
     * @tc.steps         1. Construct a stub with a custom descriptor.
     *                   2. Read it back.
     *                   3. Compare against the default stub.
     * @tc.expected      The custom literal is stored unchanged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('descriptorValidationCustomDescriptorAccepted', 0, () => {
      const custom: string = 'CustomStub_01';
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel(custom);
      const fallback: StubRemoteObjectModel = new StubRemoteObjectModel();
      logStep('descriptorValidationCustomDescriptorAccepted', stub.descriptor);
      expect(stub.descriptor).assertEqual(custom);
      expect(stub.descriptor === STUB_DESCRIPTOR).assertFalse();
      expect(stub.descriptor.length).assertEqual(13);
      expect(stub.descriptor.indexOf('_')).assertLarger(0);
      expect(descriptorLooksValid(stub.descriptor)).assertTrue();
      expect(fallback.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(descriptorLooksValid(fallback.descriptor)).assertTrue();
      expect(descriptorLooksValid(custom)).assertEqual(descriptorLooksValid(stub.descriptor));
    });

    /**
     * @tc.name          descriptorValidationEmptyDescriptorExplicit
     * @tc.desc          An explicitly empty descriptor fails lexical validation.
     * @tc.precondition  The stub constructor accepts an empty string.
     * @tc.steps         1. Construct a stub with an empty descriptor.
     *                   2. Evaluate the predicate.
     *                   3. Compare with the default stub.
     * @tc.expected      The empty descriptor is rejected while the default passes.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorValidationEmptyDescriptorExplicit', 0, () => {
      const empty: StubRemoteObjectModel = new StubRemoteObjectModel(DESCRIPTOR_EMPTY);
      const normal: StubRemoteObjectModel = new StubRemoteObjectModel();
      logStep('descriptorValidationEmptyDescriptorExplicit', String(empty.descriptor.length));
      expect(empty.descriptor).assertEqual(DESCRIPTOR_EMPTY);
      expect(empty.descriptor.length).assertEqual(0);
      expect(descriptorLooksValid(empty.descriptor)).assertFalse();
      expect(descriptorLooksValid(normal.descriptor)).assertTrue();
      expect(empty.descriptor === STUB_DESCRIPTOR).assertFalse();
      expect(describeStub(empty)).assertEqual('#0#true');
      expect(empty.descriptor.trim().length).assertEqual(0);
    });

    /**
     * @tc.name          descriptorValidationWhitespaceRejected
     * @tc.desc          A descriptor containing a space is lexically invalid.
     * @tc.precondition  The descriptor predicate is available.
     * @tc.steps         1. Build a spaced descriptor.
     *                   2. Evaluate the predicate.
     *                   3. Compare with the default descriptor.
     * @tc.expected      The spaced descriptor is rejected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorValidationWhitespaceRejected', 0, () => {
      const spaced: string = 'IPC Stub';
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel(spaced);
      logStep('descriptorValidationWhitespaceRejected', stub.descriptor);
      expect(stub.descriptor.indexOf(' ')).assertEqual(3);
      expect(descriptorLooksValid(spaced)).assertFalse();
      expect(descriptorLooksValid(STUB_DESCRIPTOR)).assertTrue();
      expect(stub.descriptor.length).assertEqual(8);
      expect(descriptorLength(spaced)).assertEqual(descriptorLength(stub.descriptor));
      expect(spaced.split(' ').length).assertEqual(2);
      expect(stub.descriptor === STUB_DESCRIPTOR).assertFalse();
    });

    /**
     * @tc.name          descriptorValidationSlashRejected
     * @tc.desc          A descriptor containing a slash is lexically invalid.
     * @tc.precondition  The descriptor predicate is available.
     * @tc.steps         1. Build a slash separated descriptor.
     *                   2. Evaluate the predicate.
     *                   3. Confirm the segment count.
     * @tc.expected      The slash form is rejected with two segments.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('descriptorValidationSlashRejected', 0, () => {
      const slashed: string = 'IPC/Stub';
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel(slashed);
      logStep('descriptorValidationSlashRejected', stub.descriptor);
      expect(stub.descriptor.indexOf('/')).assertEqual(3);
      expect(stub.descriptor.split('/').length).assertEqual(2);
      expect(descriptorLooksValid(slashed)).assertFalse();
      expect(descriptorLooksValid(STUB_DESCRIPTOR)).assertTrue();
      expect(stub.descriptor.startsWith('IPC')).assertTrue();
      expect(stub.descriptor.endsWith('Stub')).assertTrue();
      expect(stub.descriptor.length).assertEqual(8);
    });

    /**
     * @tc.name          descriptorValidationUnicodeRejected
     * @tc.desc          A descriptor with a non ASCII character is invalid.
     * @tc.precondition  The descriptor predicate is available.
     * @tc.steps         1. Build a descriptor with a non ASCII suffix.
     *                   2. Evaluate the predicate.
     *                   3. Confirm the ASCII prefix.
     * @tc.expected      The unicode descriptor is rejected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('descriptorValidationUnicodeRejected', 0, () => {
      const unicode: string = 'IPCStub\u4e00';
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel(unicode);
      const ascii: string = stub.descriptor.substring(0, 7);
      logStep('descriptorValidationUnicodeRejected', stub.descriptor);
      expect(stub.descriptor.length).assertEqual(8);
      expect(descriptorLooksValid(unicode)).assertFalse();
      expect(descriptorLooksValid(STUB_DESCRIPTOR)).assertTrue();
      expect(ascii).assertEqual('IPCStub');
      expect(stub.descriptor.startsWith('IPCStub')).assertTrue();
      expect(stub.descriptor.charCodeAt(0)).assertEqual(73);
      expect(unicode === STUB_DESCRIPTOR).assertFalse();
    });

    /**
     * @tc.name          descriptorValidationLongDescriptorRejected
     * @tc.desc          A descriptor longer than the limit is rejected.
     * @tc.precondition  The descriptor limit is 64 characters.
     * @tc.steps         1. Build a 70 character descriptor.
     *                   2. Evaluate the predicate.
     *                   3. Compare its length with the limit.
     * @tc.expected      The long descriptor is rejected by the length rule.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('descriptorValidationLongDescriptorRejected', 0, () => {
      const longText: string = 'StubDescriptor_0123456789012345678901234567890123456789012345678901234';
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel(longText);
      logStep('descriptorValidationLongDescriptorRejected', String(stub.descriptor.length));
      expect(stub.descriptor.length).assertEqual(70);
      expect(stub.descriptor.length).assertLarger(DESCRIPTOR_LIMIT);
      expect(descriptorLooksValid(longText)).assertFalse();
      expect(descriptorLooksValid(STUB_DESCRIPTOR)).assertTrue();
      expect(clampInt(stub.descriptor.length, 0, DESCRIPTOR_LIMIT)).assertEqual(DESCRIPTOR_LIMIT);
      expect(stub.descriptor.substring(0, 11)).assertEqual('StubDescrip');
      expect(stub.descriptor === STUB_DESCRIPTOR).assertFalse();
      expect(countOf(stub.descriptor.split(''), '_')).assertEqual(1);
    });

    /**
     * @tc.name          descriptorValidationExactLimitAccepted
     * @tc.desc          A descriptor of exactly the limit length passes.
     * @tc.precondition  The descriptor limit is 64 characters.
     * @tc.steps         1. Build a 64 character descriptor.
     *                   2. Evaluate the predicate.
     *                   3. Confirm the boundary relationship.
     * @tc.expected      The exact limit is accepted and one more is not.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('descriptorValidationExactLimitAccepted', 0, () => {
      const atLimit: string = 'StubDescriptor_' + '0123456789012345678901234567890123456789012345678';
      const overLimit: string = atLimit + '9';
      logStep('descriptorValidationExactLimitAccepted', String(atLimit.length));
      expect(atLimit.length).assertEqual(DESCRIPTOR_LIMIT);
      expect(descriptorLooksValid(atLimit)).assertTrue();
      expect(overLimit.length).assertEqual(DESCRIPTOR_LIMIT + 1);
      expect(descriptorLooksValid(overLimit)).assertFalse();
      expect(clampInt(atLimit.length, 0, DESCRIPTOR_LIMIT)).assertEqual(DESCRIPTOR_LIMIT);
      expect(clampInt(overLimit.length, 0, DESCRIPTOR_LIMIT)).assertEqual(DESCRIPTOR_LIMIT);
      expect(atLimit.split('_').length).assertEqual(2);
    });

    /**
     * @tc.name          descriptorValidationCaseSensitivity
     * @tc.desc          Descriptor comparisons are case sensitive.
     * @tc.precondition  The stub model is available.
     * @tc.steps         1. Build a lower case descriptor stub.
     *                   2. Compare with the canonical literal.
     *                   3. Confirm the case folded form.
     * @tc.expected      Only the exact case matches IPCStubTest.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorValidationCaseSensitivity', 0, () => {
      const lower: StubRemoteObjectModel = new StubRemoteObjectModel('ipcstubtest');
      const exact: StubRemoteObjectModel = new StubRemoteObjectModel();
      logStep('descriptorValidationCaseSensitivity', lower.descriptor);
      expect(lower.descriptor).assertEqual('ipcstubtest');
      expect(lower.descriptor === STUB_DESCRIPTOR).assertFalse();
      expect(exact.descriptor === STUB_DESCRIPTOR).assertTrue();
      expect(lower.descriptor.toLowerCase()).assertEqual(STUB_DESCRIPTOR.toLowerCase());
      expect(lower.descriptor.toUpperCase()).assertEqual(STUB_DESCRIPTOR.toUpperCase());
      expect(descriptorLooksValid(lower.descriptor)).assertTrue();
      expect(descriptorLooksValid(exact.descriptor)).assertTrue();
      expect(lower.descriptor.length).assertEqual(exact.descriptor.length);
    });

    /**
     * @tc.name          descriptorValidationPredicateMatchesConstants
     * @tc.desc          The predicate accepts the constant and rejects empty text.
     * @tc.precondition  The descriptor predicate is available.
     * @tc.steps         1. Evaluate the constant.
     *                   2. Evaluate an empty string.
     *                   3. Evaluate a numeric descriptor.
     * @tc.expected      Only token like descriptors pass.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorValidationPredicateMatchesConstants', 0, () => {
      const numeric: string = '12345';
      const upper: string = 'STUB';
      logStep('descriptorValidationPredicateMatchesConstants', String(descriptorLooksValid(numeric)));
      expect(descriptorLooksValid(STUB_DESCRIPTOR)).assertTrue();
      expect(descriptorLooksValid(DESCRIPTOR_EMPTY)).assertFalse();
      expect(descriptorLooksValid(numeric)).assertTrue();
      expect(descriptorLooksValid(upper)).assertTrue();
      expect(descriptorLooksValid('-')).assertFalse();
      expect(descriptorLooksValid('.')).assertFalse();
      expect(descriptorLooksValid('Stub_1')).assertTrue();
      expect(descriptorLooksValid('\n')).assertFalse();
    });

    /**
     * @tc.name          descriptorValidationInstancesAreIndependent
     * @tc.desc          Two stub instances keep independent descriptors.
     * @tc.precondition  The stub model is available.
     * @tc.steps         1. Build two stubs with different descriptors.
     *                   2. Read both descriptors.
     *                   3. Confirm no cross assignment.
     * @tc.expected      Each stub retains its own descriptor.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorValidationInstancesAreIndependent', 0, () => {
      const first: StubRemoteObjectModel = new StubRemoteObjectModel('FirstStub');
      const second: StubRemoteObjectModel = new StubRemoteObjectModel('SecondStub');
      logStep('descriptorValidationInstancesAreIndependent', first.descriptor + '/' + second.descriptor);
      expect(first.descriptor).assertEqual('FirstStub');
      expect(second.descriptor).assertEqual('SecondStub');
      expect(first.descriptor === second.descriptor).assertFalse();
      expect(first.descriptor.length).assertEqual(9);
      expect(second.descriptor.length).assertEqual(10);
      expect(first.descriptor === STUB_DESCRIPTOR).assertFalse();
      expect(second.descriptor === STUB_DESCRIPTOR).assertFalse();
      expect(uniqueStrings([first.descriptor, second.descriptor]).length).assertEqual(2);
    });

    /**
     * @tc.name          descriptorValidationSurvivesKillAndRevive
     * @tc.desc          Killing and reviving a stub keeps its descriptor.
     * @tc.precondition  A stub with the default descriptor exists.
     * @tc.steps         1. Kill the stub.
     *                   2. Revive it.
     *                   3. Read the descriptor after each step.
     * @tc.expected      The descriptor stays IPCStubTest throughout.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorValidationSurvivesKillAndRevive', 0, () => {
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const before: string = stub.descriptor;
      stub.kill();
      const during: string = stub.descriptor;
      stub.revive();
      const after: string = stub.descriptor;
      logStep('descriptorValidationSurvivesKillAndRevive', describeStub(stub));
      expect(before).assertEqual(STUB_DESCRIPTOR);
      expect(during).assertEqual(STUB_DESCRIPTOR);
      expect(after).assertEqual(STUB_DESCRIPTOR);
      expect(before).assertEqual(after);
      expect(stub.alive).assertTrue();
      expect(after.length).assertEqual(11);
      expect(textFingerprint(before)).assertEqual(textFingerprint(after));
      expect(descriptorLooksValid(after)).assertTrue();
    });

    /**
     * @tc.name          descriptorValidationSurvivesReset
     * @tc.desc          reset clears traffic but preserves the descriptor.
     * @tc.precondition  A stub that has served a request exists.
     * @tc.steps         1. Serve one request.
     *                   2. Reset the stub.
     *                   3. Read the descriptor and counters.
     * @tc.expected      The descriptor remains while the request count returns to zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorValidationSurvivesReset', 0, () => {
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const client: InProcessClient = new InProcessClient(stub);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      const served: number = stub.requestCount();
      stub.reset();
      logStep('descriptorValidationSurvivesReset', describeStub(stub));
      expect(served).assertEqual(1);
      expect(stub.requestCount()).assertEqual(0);
      expect(stub.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(stub.descriptor).assertEqual(expectedDescriptor());
      expect(stub.alive).assertTrue();
      expect(stub.replyText).assertEqual(REPLY_PAYLOAD);
      expect(descriptorLooksValid(stub.descriptor)).assertTrue();
      expect(client.replies.length).assertEqual(1);
    });

    /**
     * @tc.name          descriptorValidationCustomSurvivesReset
     * @tc.desc          A custom descriptor is retained across reset.
     * @tc.precondition  A stub with a custom descriptor exists.
     * @tc.steps         1. Record the custom descriptor.
     *                   2. Send an unknown code.
     *                   3. Reset and compare.
     * @tc.expected      The custom descriptor is unchanged after reset.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorValidationCustomSurvivesReset', 0, () => {
      const custom: string = 'CustomResetStub';
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel(custom);
      const client: InProcessClient = new InProcessClient(stub);
      client.send(2, REQUEST_PAYLOAD);
      const beforeReset: string = stub.descriptor;
      stub.reset();
      logStep('descriptorValidationCustomSurvivesReset', stub.descriptor);
      expect(stub.descriptor).assertEqual(custom);
      expect(stub.descriptor).assertEqual(beforeReset);
      expect(stub.descriptor === STUB_DESCRIPTOR).assertFalse();
      expect(stub.requestCount()).assertEqual(0);
      expect(client.results.length).assertEqual(1);
      expect(client.results[0].handled).assertFalse();
      expect(descriptorLooksValid(stub.descriptor)).assertTrue();
      expect(textFingerprint(custom)).assertEqual(textFingerprint(stub.descriptor));
    });

    /**
     * @tc.name          descriptorValidationConnectEventDetail
     * @tc.desc          onConnect records the descriptor as its event detail.
     * @tc.precondition  The lifecycle model is available.
     * @tc.steps         1. Create and connect the service.
     *                   2. Read the recorded event.
     *                   3. Compare the detail segment.
     * @tc.expected      The connect event carries IPCStubTest as detail.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorValidationConnectEventDetail', 0, () => {
      const service: ServiceLifecycleModel = new ServiceLifecycleModel();
      service.onCreate();
      const stub: StubRemoteObjectModel = service.onConnect();
      const last: string = service.events.last();
      logStep('descriptorValidationConnectEventDetail', last);
      expect(last).assertEqual(EVENT_ON_CONNECT + ':' + STUB_DESCRIPTOR);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(1);
      expect(service.connectCount).assertEqual(1);
      expect(stub.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(service.stub?.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(last.split(':').length).assertEqual(2);
      expect(last.split(':')[1]).assertEqual(STUB_DESCRIPTOR);
      expect(service.state).assertEqual('connected');
    });

    /**
     * @tc.name          descriptorValidationPerConnectionInstance
     * @tc.desc          Every onConnect call yields a fresh stub instance.
     * @tc.precondition  The lifecycle model is available.
     * @tc.steps         1. Connect twice.
     *                   2. Capture both stubs.
     *                   3. Compare identity and descriptor.
     * @tc.expected      Both stubs share the descriptor but are distinct objects.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorValidationPerConnectionInstance', 0, () => {
      const service: ServiceLifecycleModel = new ServiceLifecycleModel();
      const first: StubRemoteObjectModel = service.onConnect();
      const second: StubRemoteObjectModel = service.onConnect();
      logStep('descriptorValidationPerConnectionInstance', describeStub(second));
      expect(service.connectCount).assertEqual(2);
      expect(first === second).assertFalse();
      expect(first.descriptor).assertEqual(second.descriptor);
      expect(first.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(service.stub === second).assertTrue();
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(2);
      expect(service.stub?.descriptor).assertEqual(STUB_DESCRIPTOR);
    });

    /**
     * @tc.name          descriptorValidationFingerprintStability
     * @tc.desc          The descriptor fingerprint is stable and literal specific.
     * @tc.precondition  The textFingerprint helper is available.
     * @tc.steps         1. Fingerprint the constant twice.
     *                   2. Fingerprint a variant.
     *                   3. Compare the values.
     * @tc.expected      Equal text yields equal fingerprints and the variant differs.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorValidationFingerprintStability', 0, () => {
      const baseline: number = textFingerprint(STUB_DESCRIPTOR);
      const repeat: number = textFingerprint(expectedDescriptor());
      const variant: number = textFingerprint('ipcstubtest');
      logStep('descriptorValidationFingerprintStability', String(baseline));
      expect(baseline).assertEqual(repeat);
      expect(baseline === variant).assertFalse();
      expect(baseline).assertLarger(0);
      expect(baseline).assertLess(1000003);
      expect(textFingerprint('')).assertEqual(216613);
      expect(variant).assertLarger(0);
      expect(textFingerprint('IPCStubTesu') === baseline).assertFalse();
      expect(baseline).assertEqual(textFingerprint('IPCStubTest'));
    });

    /**
     * @tc.name          descriptorValidationMetricsCarryNoDescriptor
     * @tc.desc          Metrics count traffic without embedding the descriptor.
     * @tc.precondition  A stub with one handled and one rejected request exists.
     * @tc.steps         1. Replay two codes.
     *                   2. Derive metrics.
     *                   3. Inspect the fingerprint bounds.
     * @tc.expected      Metrics report one handled request and one rejection.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('descriptorValidationMetricsCarryNoDescriptor', 0, () => {
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const client: InProcessClient = new InProcessClient(stub);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      client.send(0, REQUEST_PAYLOAD);
      const metrics: StubMetrics = StubMetrics.from(stub);
      logStep('descriptorValidationMetricsCarryNoDescriptor', String(metrics.fingerprint()));
      expect(metrics.requests).assertEqual(2);
      expect(metrics.handled).assertEqual(1);
      expect(metrics.rejected).assertEqual(1);
      expect(metrics.successRatio()).assertEqual(0.5);
      expect(metrics.fingerprint()).assertLarger(0);
      expect(metrics.fingerprint() === textFingerprint(STUB_DESCRIPTOR)).assertFalse();
      expect(stub.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(client.results.length).assertEqual(2);
    });

    /**
     * @tc.name          descriptorValidationLengthDiffersFromAbility
     * @tc.desc          The descriptor length is independent of the ability name.
     * @tc.precondition  The literal constants are available.
     * @tc.steps         1. Compare descriptor and ability lengths.
     *                   2. Confirm both are non empty.
     *                   3. Check containment.
     * @tc.expected      Both literals are distinct with different lengths.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('descriptorValidationLengthDiffersFromAbility', 0, () => {
      const descriptor: string = STUB_DESCRIPTOR;
      const ability: string = 'ServiceAbility';
      logStep('descriptorValidationLengthDiffersFromAbility', String(descriptor.length) + '/' + String(ability.length));
      expect(descriptor.length).assertEqual(11);
      expect(ability.length).assertEqual(14);
      expect(descriptor.length === ability.length).assertFalse();
      expect(descriptor === ability).assertFalse();
      expect(descriptor.indexOf('Ability')).assertEqual(-1);
      expect(ability.indexOf('IPC')).assertEqual(-1);
      expect(descriptor.startsWith('IPC')).assertTrue();
      expect(ability.startsWith('Service')).assertTrue();
    });

    /**
     * @tc.name          descriptorValidationNotDerivedFromBundle
     * @tc.desc          The descriptor is not a substring of the bundle name.
     * @tc.precondition  The literal constants are available.
     * @tc.steps         1. Check bundle containment.
     *                   2. Check the reverse containment.
     *                   3. Compare lengths.
     * @tc.expected      Neither literal contains the other.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('descriptorValidationNotDerivedFromBundle', 0, () => {
      const descriptor: string = STUB_DESCRIPTOR;
      const bundle: string = STUB_BUNDLE;
      logStep('descriptorValidationNotDerivedFromBundle', descriptor + '/' + bundle);
      expect(bundle.indexOf(descriptor)).assertEqual(-1);
      expect(descriptor.indexOf(bundle)).assertEqual(-1);
      expect(descriptor === bundle).assertFalse();
      expect(bundle.indexOf('.')).assertLarger(0);
      expect(descriptor.indexOf('.')).assertEqual(-1);
      expect(bundle.length).assertLarger(descriptor.length);
      expect(bundle.split('.').length).assertEqual(3);
      expect(descriptor.split('.').length).assertEqual(1);
    });

    /**
     * @tc.name          descriptorValidationTraceAppearsOncePerConnect
     * @tc.desc          The descriptor appears once per connect event in the trace.
     * @tc.precondition  A lifecycle model is available.
     * @tc.steps         1. Connect three times.
     *                   2. Read the event trace.
     *                   3. Count the descriptor occurrences.
     * @tc.expected      Three connect events reference the descriptor three times.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorValidationTraceAppearsOncePerConnect', 0, () => {
      const service: ServiceLifecycleModel = new ServiceLifecycleModel();
      service.onConnect();
      service.onConnect();
      service.onConnect();
      const trace: string = service.events.trace();
      logStep('descriptorValidationTraceAppearsOncePerConnect', trace);
      expect(service.events.size()).assertEqual(3);
      expect(countOf(trace.split('>'), EVENT_ON_CONNECT + ':' + STUB_DESCRIPTOR)).assertEqual(3);
      expect(trace.split('>').length).assertEqual(3);
      expect(trace.indexOf(STUB_DESCRIPTOR)).assertLarger(0);
      expect(trace.split(STUB_DESCRIPTOR).length).assertEqual(4);
      expect(service.connectCount).assertEqual(3);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(3);
      expect(service.events.fingerprint()).assertLarger(0);
    });

    /**
     * @tc.name          descriptorValidationDistinctInList
     * @tc.desc          Distinct descriptors survive list deduplication.
     * @tc.precondition  The uniqueStrings helper is available.
     * @tc.steps         1. Build a descriptor list with duplicates.
     *                   2. Deduplicate it.
     *                   3. Count each literal.
     * @tc.expected      Two unique descriptors remain from five entries.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('descriptorValidationDistinctInList', 0, () => {
      const descriptors: string[] = [STUB_DESCRIPTOR, 'OtherStub', STUB_DESCRIPTOR, STUB_DESCRIPTOR, 'OtherStub'];
      const unique: string[] = uniqueStrings(descriptors);
      logStep('descriptorValidationDistinctInList', joined(unique, ','));
      expect(descriptors.length).assertEqual(5);
      expect(unique.length).assertEqual(2);
      expect(unique[0]).assertEqual(STUB_DESCRIPTOR);
      expect(unique[1]).assertEqual('OtherStub');
      expect(countOf(descriptors, STUB_DESCRIPTOR)).assertEqual(3);
      expect(countOf(descriptors, 'OtherStub')).assertEqual(2);
      expect(countOf(unique, STUB_DESCRIPTOR)).assertEqual(1);
      expect(joined(unique, '|')).assertEqual(STUB_DESCRIPTOR + '|OtherStub');
    });

    /**
     * @tc.name          descriptorValidationNumericDescriptor
     * @tc.desc          A numeric descriptor is lexically valid but not canonical.
     * @tc.precondition  The descriptor predicate is available.
     * @tc.steps         1. Build a numeric stub.
     *                   2. Evaluate the predicate.
     *                   3. Compare with the canonical descriptor.
     * @tc.expected      The numeric descriptor passes lexically but differs from IPCStubTest.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('descriptorValidationNumericDescriptor', 0, () => {
      const numeric: string = '16000011';
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel(numeric);
      logStep('descriptorValidationNumericDescriptor', stub.descriptor);
      expect(stub.descriptor).assertEqual(numeric);
      expect(descriptorLooksValid(numeric)).assertTrue();
      expect(stub.descriptor === STUB_DESCRIPTOR).assertFalse();
      expect(stub.descriptor.length).assertEqual(8);
      expect(STUB_DESCRIPTOR.length).assertEqual(11);
      expect(stub.descriptor.indexOf('IPC')).assertEqual(-1);
      expect(countOf(numeric.split(''), '1')).assertEqual(3);
      expect(clampInt(Number(numeric), 0, 16000011)).assertEqual(16000011);
    });

    /**
     * @tc.name          descriptorValidationReplyUnaffectedByDescriptor
     * @tc.desc          The reply literal does not depend on the descriptor value.
     * @tc.precondition  Two stubs with different descriptors exist.
     * @tc.steps         1. Send code one to both stubs.
     *                   2. Compare the replies.
     *                   3. Confirm the descriptors still differ.
     * @tc.expected      Both replies equal hello rpc while descriptors differ.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorValidationReplyUnaffectedByDescriptor', 0, () => {
      const first: StubRemoteObjectModel = new StubRemoteObjectModel('FirstStub');
      const second: StubRemoteObjectModel = new StubRemoteObjectModel('SecondStub');
      const firstClient: InProcessClient = new InProcessClient(first);
      const secondClient: InProcessClient = new InProcessClient(second);
      const firstResult = firstClient.send(REQUEST_CODE, REQUEST_PAYLOAD);
      const secondResult = secondClient.send(REQUEST_CODE, REQUEST_PAYLOAD);
      logStep('descriptorValidationReplyUnaffectedByDescriptor', firstResult.replyText);
      expect(firstResult.replyText).assertEqual(REPLY_PAYLOAD);
      expect(secondResult.replyText).assertEqual(REPLY_PAYLOAD);
      expect(firstResult.replyText).assertEqual(secondResult.replyText);
      expect(first.descriptor === second.descriptor).assertFalse();
      expect(firstResult.errCode).assertEqual(ERROR_NONE);
      expect(secondResult.errCode).assertEqual(ERROR_NONE);
      expect(firstClient.trace()).assertEqual(REPLY_PAYLOAD);
      expect(secondClient.trace()).assertEqual(REPLY_PAYLOAD);
    });

    /**
     * @tc.name          descriptorValidationKillRejectsRequest
     * @tc.desc          A killed stub rejects the request but keeps its descriptor.
     * @tc.precondition  A stub and client are available.
     * @tc.steps         1. Kill the stub.
     *                   2. Send code one.
     *                   3. Inspect the descriptor and result.
     * @tc.expected      The request is rejected while the descriptor is intact.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorValidationKillRejectsRequest', 0, () => {
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const client: InProcessClient = new InProcessClient(stub);
      stub.kill();
      const result = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      logStep('descriptorValidationKillRejectsRequest', describeStub(stub));
      expect(stub.alive).assertFalse();
      expect(result.handled).assertFalse();
      expect(result.errCode).assertEqual(ERROR_STUB_REJECTED);
      expect(result.replyText).assertEqual('');
      expect(stub.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(stub.requestCount()).assertEqual(1);
      expect(stub.lastRequest()?.code).assertEqual(REQUEST_CODE);
      expect(client.replies.length).assertEqual(0);
    });

    /**
     * @tc.name          descriptorValidationReviveRestoresRequests
     * @tc.desc          A revived stub serves requests again under the same descriptor.
     * @tc.precondition  A killed stub is available.
     * @tc.steps         1. Kill and revive the stub.
     *                   2. Send code one.
     *                   3. Compare the descriptor with the constant.
     * @tc.expected      The revived stub handles the request.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorValidationReviveRestoresRequests', 0, () => {
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const client: InProcessClient = new InProcessClient(stub);
      stub.kill();
      stub.revive();
      const result = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      logStep('descriptorValidationReviveRestoresRequests', describeStub(stub));
      expect(stub.alive).assertTrue();
      expect(result.isSuccess()).assertTrue();
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(stub.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(stub.requestCount()).assertEqual(1);
      expect(stub.lastRequest()?.handled).assertTrue();
      expect(client.replies.length).assertEqual(1);
      expect(textFingerprint(stub.descriptor)).assertEqual(textFingerprint(expectedDescriptor()));
    });

    /**
     * @tc.name          descriptorValidationEmptyDescriptorServesRequests
     * @tc.desc          An empty descriptor does not block request handling.
     * @tc.precondition  A stub with an empty descriptor exists.
     * @tc.steps         1. Send code one.
     *                   2. Inspect the result and descriptor.
     *                   3. Confirm the lexical predicate.
     * @tc.expected      The request succeeds even though the descriptor is invalid.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('descriptorValidationEmptyDescriptorServesRequests', 0, () => {
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel(DESCRIPTOR_EMPTY);
      const client: InProcessClient = new InProcessClient(stub);
      const result = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      logStep('descriptorValidationEmptyDescriptorServesRequests', String(stub.descriptor.length));
      expect(stub.descriptor.length).assertEqual(0);
      expect(descriptorLooksValid(stub.descriptor)).assertFalse();
      expect(result.isSuccess()).assertTrue();
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(stub.lastRequest()?.text).assertEqual(REQUEST_PAYLOAD);
      expect(stub.requestCount()).assertEqual(1);
      expect(client.trace()).assertEqual(REPLY_PAYLOAD);
      expect(stub.descriptor).assertEqual(DESCRIPTOR_EMPTY);
    });

    /**
     * @tc.name          descriptorValidationDescriptorInSnapshotText
     * @tc.desc          A snapshot line contains the descriptor between known markers.
     * @tc.precondition  A connected lifecycle model exists.
     * @tc.steps         1. Connect the service.
     *                   2. Compose a snapshot line.
     *                   3. Inspect the marker segments.
     * @tc.expected      The descriptor sits alone between the two markers.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('descriptorValidationDescriptorInSnapshotText', 0, () => {
      const service: ServiceLifecycleModel = new ServiceLifecycleModel();
      const stub: StubRemoteObjectModel = service.onConnect();
      const snapshot: string = '[' + stub.descriptor + ']';
      logStep('descriptorValidationDescriptorInSnapshotText', snapshot);
      expect(snapshot.length).assertEqual(STUB_DESCRIPTOR.length + 2);
      expect(snapshot.startsWith('[')).assertTrue();
      expect(snapshot.endsWith(']')).assertTrue();
      expect(snapshot.substring(1, snapshot.length - 1)).assertEqual(STUB_DESCRIPTOR);
      expect(snapshot.indexOf(STUB_DESCRIPTOR)).assertEqual(1);
      expect(snapshot.split(STUB_DESCRIPTOR).length).assertEqual(2);
      expect(service.stub?.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(clampInt(snapshot.length, 0, 12)).assertEqual(12);
    });

    /**
     * @tc.name          descriptorValidationConnectAfterDestroy
     * @tc.desc          Connecting after destroy still produces the documented descriptor.
     * @tc.precondition  The lifecycle model supports repeated transitions.
     * @tc.steps         1. Destroy the service.
     *                   2. Connect again.
     *                   3. Inspect the new stub.
     * @tc.expected      The new stub carries IPCStubTest and the state is connected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('descriptorValidationConnectAfterDestroy', 0, () => {
      const service: ServiceLifecycleModel = new ServiceLifecycleModel();
      service.onCreate();
      const first: StubRemoteObjectModel = service.onConnect();
      service.onDisconnect();
      service.onDestroy();
      const second: StubRemoteObjectModel = service.onConnect();
      logStep('descriptorValidationConnectAfterDestroy', service.state);
      expect(first === second).assertFalse();
      expect(second.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(service.state).assertEqual('connected');
      expect(service.connectCount).assertEqual(2);
      expect(service.destroyCount).assertEqual(1);
      expect(service.events.last()).assertEqual(EVENT_ON_CONNECT + ':' + STUB_DESCRIPTOR);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(2);
      expect(service.isAlive()).assertTrue();
    });

    /**
     * @tc.name          descriptorValidationDescriptorArrayJoin
     * @tc.desc          Joined descriptor lists keep insertion order and count.
     * @tc.precondition  The joined helper is available.
     * @tc.steps         1. Build three descriptors.
     *                   2. Join them with a comma.
     *                   3. Split and compare.
     * @tc.expected      The joined text has three ordered entries.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('descriptorValidationDescriptorArrayJoin', 0, () => {
      const values: string[] = [STUB_DESCRIPTOR, 'AlphaStub', 'BetaStub'];
      const text: string = joined(values, ',');
      logStep('descriptorValidationDescriptorArrayJoin', text);
      expect(text.split(',').length).assertEqual(3);
      expect(text.split(',')[0]).assertEqual(STUB_DESCRIPTOR);
      expect(text.split(',')[1]).assertEqual('AlphaStub');
      expect(text.split(',')[2]).assertEqual('BetaStub');
      expect(text.startsWith(STUB_DESCRIPTOR)).assertTrue();
      expect(text.endsWith('BetaStub')).assertTrue();
      expect(countOf(values, STUB_DESCRIPTOR)).assertEqual(1);
      expect(joined([STUB_DESCRIPTOR], ',')).assertEqual(STUB_DESCRIPTOR);
      expect(text.length).assertLarger(STUB_DESCRIPTOR.length);
    });

    /**
     * @tc.name          descriptorValidationResetThenConnect
     * @tc.desc          Resetting the lifecycle model clears the stub reference.
     * @tc.precondition  A connected lifecycle model exists.
     * @tc.steps         1. Connect and serve a request.
     *                   2. Reset the model.
     *                   3. Inspect the stub reference and counts.
     * @tc.expected      reset removes the stub and zeroes every counter.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorValidationResetThenConnect', 0, () => {
      const service: ServiceLifecycleModel = new ServiceLifecycleModel();
      service.onCreate();
      const stub: StubRemoteObjectModel = service.onConnect();
      const client: InProcessClient = new InProcessClient(stub);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      service.reset();
      logStep('descriptorValidationResetThenConnect', service.state);
      expect(service.state).assertEqual('idle');
      expect(service.stub).assertUndefined();
      expect(service.connectCount).assertEqual(0);
      expect(service.events.size()).assertEqual(0);
      expect(service.logs.size()).assertEqual(0);
      expect(service.isAlive()).assertTrue();
      const fresh: StubRemoteObjectModel = service.onConnect();
      expect(fresh.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(service.connectCount).assertEqual(1);
    });

    /**
     * @tc.name          descriptorValidationCaseFoldCollisions
     * @tc.desc          Case folded descriptors collide although literals differ.
     * @tc.precondition  Two case variant descriptors are available.
     * @tc.steps         1. Compare the literals.
     *                   2. Compare the folded forms.
     *                   3. Deduplicate the folded list.
     * @tc.expected      Literals differ but the folded forms are identical.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('descriptorValidationCaseFoldCollisions', 0, () => {
      const upper: string = 'IPCS TUB'.replace(' ', '');
      const lower: string = 'ipcstub';
      const folded: string[] = [upper.toLowerCase(), lower.toLowerCase()];
      logStep('descriptorValidationCaseFoldCollisions', joined(folded, ','));
      expect(upper === lower).assertFalse();
      expect(folded[0]).assertEqual(folded[1]);
      expect(uniqueStrings(folded).length).assertEqual(1);
      expect(upper.length).assertEqual(lower.length);
      expect(upper.toUpperCase()).assertEqual(upper);
      expect(lower.toLowerCase()).assertEqual(lower);
      expect(descriptorLooksValid(upper)).assertTrue();
      expect(descriptorLooksValid(lower)).assertTrue();
    });

    /**
     * @tc.name          descriptorValidationSubstringSearches
     * @tc.desc          Substring searches resolve the descriptor prefix and suffix.
     * @tc.precondition  The descriptor literal is available.
     * @tc.steps         1. Search for the prefix.
     *                   2. Search for the suffix.
     *                   3. Search for an absent fragment.
     * @tc.expected      Prefix and suffix are found at the documented indices.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('descriptorValidationSubstringSearches', 0, () => {
      const descriptor: string = STUB_DESCRIPTOR;
      logStep('descriptorValidationSubstringSearches', descriptor);
      expect(descriptor.indexOf('IPC')).assertEqual(0);
      expect(descriptor.indexOf('Stub')).assertEqual(3);
      expect(descriptor.indexOf('Test')).assertEqual(7);
      expect(descriptor.indexOf('Missing')).assertEqual(-1);
      expect(descriptor.substring(0, 3)).assertEqual('IPC');
      expect(descriptor.substring(7)).assertEqual('Test');
      expect(descriptor.substring(3, 7)).assertEqual('Stub');
      expect(descriptor.substring(0, 7)).assertEqual('IPCStub');
    });

    /**
     * @tc.name          descriptorValidationClampDescriptorLength
     * @tc.desc          Clamping the descriptor length respects report bounds.
     * @tc.precondition  The clampInt helper is available.
     * @tc.steps         1. Clamp the literal length to a valid range.
     *                   2. Clamp a negative value.
     *                   3. Clamp an oversized value.
     * @tc.expected      The literal length stays inside the report bounds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('descriptorValidationClampDescriptorLength', 0, () => {
      const length: number = descriptorLength(STUB_DESCRIPTOR);
      const low: number = clampInt(-10, 0, 32);
      const high: number = clampInt(80, 0, 32);
      logStep('descriptorValidationClampDescriptorLength', String(length));
      expect(length).assertEqual(11);
      expect(low).assertEqual(0);
      expect(high).assertEqual(32);
      expect(clampInt(length, 0, 32)).assertEqual(length);
      expect(clampInt(length, 0, 8)).assertEqual(8);
      expect(clampInt(length, 20, 32)).assertEqual(20);
      expect(clampInt(11, 11, 11)).assertEqual(11);
      expect(clampInt(10, 11, 11)).assertEqual(11);
    });

    /**
     * @tc.name          descriptorValidationStubDescribeRecord
     * @tc.desc          A request record description omits the descriptor field.
     * @tc.precondition  A stub that served one request exists.
     * @tc.steps         1. Send code one.
     *                   2. Read the record description.
     *                   3. Count the slash separated fields.
     * @tc.expected      Four fields appear and the descriptor does not.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('descriptorValidationStubDescribeRecord', 0, () => {
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const client: InProcessClient = new InProcessClient(stub);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      const record = stub.lastRequest();
      const text: string = record === undefined ? '' : record.describe();
      logStep('descriptorValidationStubDescribeRecord', text);
      expect(text.split('/').length).assertEqual(4);
      expect(text.split('/')[0]).assertEqual('1');
      expect(text.split('/')[1]).assertEqual(REQUEST_PAYLOAD);
      expect(text.split('/')[2]).assertEqual(REPLY_PAYLOAD);
      expect(text.split('/')[3]).assertEqual('true');
      expect(text.indexOf(STUB_DESCRIPTOR)).assertEqual(-1);
      expect(text.startsWith('1/')).assertTrue();
      expect(text.endsWith('/true')).assertTrue();
    });

    /**
     * @tc.name          descriptorValidationManyInstances
     * @tc.desc          Many stub instances hold their own descriptor and traffic.
     * @tc.precondition  The stub model is available.
     * @tc.steps         1. Build four stubs.
     *                   2. Send one request to each.
     *                   3. Compare counts.
     * @tc.expected      Every stub reports one request and the canonical descriptor.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('descriptorValidationManyInstances', 0, () => {
      const stubs: StubRemoteObjectModel[] = [];
      for (let index = 0; index < 4; index++) {
        stubs.push(new StubRemoteObjectModel());
      }
      for (let index = 0; index < stubs.length; index++) {
        const client: InProcessClient = new InProcessClient(stubs[index]);
        client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      }
      logStep('descriptorValidationManyInstances', String(stubs.length));
      expect(stubs.length).assertEqual(4);
      expect(stubs[0].requestCount()).assertEqual(1);
      expect(stubs[3].requestCount()).assertEqual(1);
      expect(stubs[0].descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(stubs[3].descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(stubs[0] === stubs[3]).assertFalse();
      expect(StubMetrics.from(stubs[0]).handled).assertEqual(1);
      expect(StubMetrics.from(stubs[3]).successRatio()).assertEqual(1);
    });

    /**
     * @tc.name          descriptorValidationCustomListUnique
     * @tc.desc          Custom descriptors deduplicate independently of the default.
     * @tc.precondition  The uniqueStrings helper is available.
     * @tc.steps         1. Build a mixed descriptor list.
     *                   2. Deduplicate.
     *                   3. Count the canonical occurrences.
     * @tc.expected      Three unique descriptors remain from six entries.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('descriptorValidationCustomListUnique', 0, () => {
      const values: string[] = ['Alpha', STUB_DESCRIPTOR, 'Beta', 'Alpha', STUB_DESCRIPTOR, 'Beta'];
      const unique: string[] = uniqueStrings(values);
      logStep('descriptorValidationCustomListUnique', joined(unique, ','));
      expect(values.length).assertEqual(6);
      expect(unique.length).assertEqual(3);
      expect(unique[0]).assertEqual('Alpha');
      expect(unique[1]).assertEqual(STUB_DESCRIPTOR);
      expect(unique[2]).assertEqual('Beta');
      expect(countOf(values, 'Alpha')).assertEqual(2);
      expect(countOf(values, STUB_DESCRIPTOR)).assertEqual(2);
      expect(countOf(unique, STUB_DESCRIPTOR)).assertEqual(1);
      expect(uniqueStrings(unique).length).assertEqual(3);
    });

    /**
     * @tc.name          descriptorValidationEventDetailCount
     * @tc.desc          Connect events carry the descriptor as detail every time.
     * @tc.precondition  The lifecycle recorder is available.
     * @tc.steps         1. Connect twice with a disconnect between.
     *                   2. Inspect the entries array.
     *                   3. Count the detail segments.
     * @tc.expected      Both connect entries end with the descriptor.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorValidationEventDetailCount', 0, () => {
      const service: ServiceLifecycleModel = new ServiceLifecycleModel();
      service.onConnect();
      service.onDisconnect();
      service.onConnect();
      const entries: string[] = service.events.entries;
      logStep('descriptorValidationEventDetailCount', joined(entries, '>'));
      expect(entries.length).assertEqual(3);
      expect(entries[0]).assertEqual(EVENT_ON_CONNECT + ':' + STUB_DESCRIPTOR);
      expect(entries[1]).assertEqual('onDisconnect');
      expect(entries[2]).assertEqual(EVENT_ON_CONNECT + ':' + STUB_DESCRIPTOR);
      expect(countOf(entries, EVENT_ON_CONNECT + ':' + STUB_DESCRIPTOR)).assertEqual(2);
      expect(entries[1].indexOf(':')).assertEqual(-1);
      expect(service.events.countOf('onDisconnect')).assertEqual(1);
      expect(service.disconnectCount).assertEqual(1);
    });

    /**
     * @tc.name          descriptorValidationMetricsAfterReset
     * @tc.desc          Metrics restart from zero after a stub reset.
     * @tc.precondition  A stub that served two requests exists.
     * @tc.steps         1. Serve two requests.
     *                   2. Reset the stub.
     *                   3. Derive metrics again.
     * @tc.expected      The second metrics snapshot reports zero requests.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorValidationMetricsAfterReset', 0, () => {
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const client: InProcessClient = new InProcessClient(stub);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      const before: StubMetrics = StubMetrics.from(stub);
      stub.reset();
      const after: StubMetrics = StubMetrics.from(stub);
      logStep('descriptorValidationMetricsAfterReset', String(after.requests));
      expect(before.requests).assertEqual(2);
      expect(before.handled).assertEqual(2);
      expect(before.successRatio()).assertEqual(1);
      expect(after.requests).assertEqual(0);
      expect(after.handled).assertEqual(0);
      expect(after.rejected).assertEqual(0);
      expect(after.successRatio()).assertEqual(0);
      expect(stub.descriptor).assertEqual(STUB_DESCRIPTOR);
    });

    /**
     * @tc.name          descriptorValidationConnectTraceOrder
     * @tc.desc          Connect traces follow the documented lifecycle order.
     * @tc.precondition  The lifecycle model is available.
     * @tc.steps         1. Create, connect and disconnect.
     *                   2. Read the event trace.
     *                   3. Compare the ordered segments.
     * @tc.expected      The trace is onCreate, onConnect with descriptor, onDisconnect.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorValidationConnectTraceOrder', 0, () => {
      const service: ServiceLifecycleModel = new ServiceLifecycleModel();
      service.onCreate();
      service.onConnect();
      service.onDisconnect();
      const segments: string[] = service.events.trace().split('>');
      logStep('descriptorValidationConnectTraceOrder', service.events.trace());
      expect(segments.length).assertEqual(3);
      expect(segments[0]).assertEqual('onCreate');
      expect(segments[1]).assertEqual(EVENT_ON_CONNECT + ':' + STUB_DESCRIPTOR);
      expect(segments[2]).assertEqual('onDisconnect');
      expect(segments[1].split(':')[1]).assertEqual(STUB_DESCRIPTOR);
      expect(service.state).assertEqual('disconnected');
      expect(service.connectCount).assertEqual(1);
      expect(service.events.last()).assertEqual('onDisconnect');
    });

    /**
     * @tc.name          descriptorValidationDefaultOracleRepeat
     * @tc.desc          The descriptor oracle is repeatable and idempotent.
     * @tc.precondition  The expectedDescriptor helper is available.
     * @tc.steps         1. Call the oracle three times.
     *                   2. Compare each call.
     *                   3. Confirm the constant.
     * @tc.expected      Every oracle call returns IPCStubTest.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('descriptorValidationDefaultOracleRepeat', 0, () => {
      const first: string = expectedDescriptor();
      const second: string = expectedDescriptor();
      const third: string = expectedDescriptor();
      logStep('descriptorValidationDefaultOracleRepeat', first + '/' + third);
      expect(first).assertEqual(second);
      expect(second).assertEqual(third);
      expect(first).assertEqual(STUB_DESCRIPTOR);
      expect(third).assertEqual('IPCStubTest');
      expect(first.length).assertEqual(11);
      expect(textFingerprint(first)).assertEqual(textFingerprint(third));
      expect(first === '').assertFalse();
      expect(descriptorLooksValid(first)).assertTrue();
    });

    /**
     * @tc.name          descriptorValidationDescriptorEchoThroughReply
     * @tc.desc          The reply is independent from the descriptor echo in the record.
     * @tc.precondition  A stub with a custom descriptor exists.
     * @tc.steps         1. Send code one.
     *                   2. Read the reply and the record.
     *                   3. Compare both literals.
     * @tc.expected      The reply is hello rpc while the record carries the request text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorValidationDescriptorEchoThroughReply', 0, () => {
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel('EchoStub');
      const client: InProcessClient = new InProcessClient(stub);
      const result = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      const record = stub.lastRequest();
      logStep('descriptorValidationDescriptorEchoThroughReply', result.replyText);
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(record?.text).assertEqual(REQUEST_PAYLOAD);
      expect(record?.replyText).assertEqual(REPLY_PAYLOAD);
      expect(record?.handled).assertTrue();
      expect(record?.code).assertEqual(REQUEST_CODE);
      expect(record?.text === stub.descriptor).assertFalse();
      expect(result.replyText === stub.descriptor).assertFalse();
      expect(client.sentTexts[0]).assertEqual(REQUEST_PAYLOAD);
    });

    /**
     * @tc.name          descriptorValidationBoundaryLengthMatrix
     * @tc.desc          The length predicate separates boundary descriptor sizes.
     * @tc.precondition  The descriptor predicate uses a 64 character limit.
     * @tc.steps         1. Build 63, 64 and 65 character descriptors.
     *                   2. Evaluate each.
     *                   3. Compare the results.
     * @tc.expected      Sizes 63 and 64 pass and size 65 fails.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('descriptorValidationBoundaryLengthMatrix', 0, () => {
      const base: string = 'StubDescriptor_0123456789012345678901234567890123456789012345678';
      const size63: string = base.substring(0, 63);
      const size64: string = base.substring(0, 64);
      const size65: string = base + '9';
      logStep('descriptorValidationBoundaryLengthMatrix', String(size64.length));
      expect(size63.length).assertEqual(63);
      expect(size64.length).assertEqual(64);
      expect(size65.length).assertEqual(65);
      expect(descriptorLooksValid(size63)).assertTrue();
      expect(descriptorLooksValid(size64)).assertTrue();
      expect(descriptorLooksValid(size65)).assertFalse();
      expect(size63.length).assertLess(DESCRIPTOR_LIMIT);
      expect(size65.length).assertLarger(DESCRIPTOR_LIMIT);
    });

    /**
     * @tc.name          descriptorValidationLedgerSummary
     * @tc.desc          A ledger line combines descriptor, state and traffic counts.
     * @tc.precondition  A connected lifecycle model is available.
     * @tc.steps         1. Connect and request once.
     *                   2. Compose the ledger line.
     *                   3. Inspect each field.
     * @tc.expected      The ledger reports the descriptor, connected state and one request.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorValidationLedgerSummary', 0, () => {
      const service: ServiceLifecycleModel = new ServiceLifecycleModel();
      service.onCreate();
      service.onConnect();
      service.onRequest(7);
      const ledger: string = descriptorTextOf(service) + '#' + service.state + '#' + String(service.requestCount);
      logStep('descriptorValidationLedgerSummary', ledger);
      expect(ledger.split('#').length).assertEqual(3);
      expect(ledger.split('#')[0]).assertEqual(STUB_DESCRIPTOR);
      expect(ledger.split('#')[1]).assertEqual('connected');
      expect(ledger.split('#')[2]).assertEqual('1');
      expect(ledger.indexOf(STUB_DESCRIPTOR)).assertEqual(0);
      expect(service.events.countOf(EVENT_ON_REQUEST)).assertEqual(1);
      expect(service.logs.contains('onConnect')).assertTrue();
      expect(service.isAlive()).assertTrue();
    });

    /**
     * @tc.name          descriptorValidationFullProtocol
     * @tc.desc          A complete connect, request and disconnect protocol completes.
     * @tc.precondition  A lifecycle model and a client are available.
     * @tc.steps         1. Connect through the lifecycle.
     *                   2. Send a request to the returned stub.
     *                   3. Disconnect and inspect.
     * @tc.expected      The protocol records one handled request and a disconnect.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('descriptorValidationFullProtocol', 0, () => {
      const service: ServiceLifecycleModel = new ServiceLifecycleModel();
      service.onCreate();
      const stub: StubRemoteObjectModel = service.onConnect();
      const client: InProcessClient = new InProcessClient(stub);
      const result = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      service.onDisconnect();
      logStep('descriptorValidationFullProtocol', service.state);
      expect(result.isSuccess()).assertTrue();
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(stub.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(stub.requestCount()).assertEqual(1);
      expect(service.connectCount).assertEqual(1);
      expect(service.disconnectCount).assertEqual(1);
      expect(service.state).assertEqual('disconnected');
      expect(service.events.countOf(EVENT_ON_DISCONNECT)).assertEqual(1);
    });

    /**
     * @tc.name          descriptorValidationKillRestoreSequence
     * @tc.desc          A kill, reject, revive and accept sequence is observable.
     * @tc.precondition  A stub and client are available.
     * @tc.steps         1. Kill and send.
     *                   2. Revive and send.
     *                   3. Compare both results.
     * @tc.expected      The first request is rejected and the second succeeds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('descriptorValidationKillRestoreSequence', 0, () => {
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const client: InProcessClient = new InProcessClient(stub);
      stub.kill();
      const rejected = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      stub.revive();
      const accepted = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      logStep('descriptorValidationKillRestoreSequence', String(stub.requestCount()));
      expect(rejected.handled).assertFalse();
      expect(rejected.errCode).assertEqual(ERROR_STUB_REJECTED);
      expect(accepted.handled).assertTrue();
      expect(accepted.errCode).assertEqual(ERROR_NONE);
      expect(accepted.replyText).assertEqual(REPLY_PAYLOAD);
      expect(stub.requestCount()).assertEqual(2);
      expect(client.results.length).assertEqual(2);
      expect(client.replies.length).assertEqual(1);
      expect(stub.descriptor).assertEqual(STUB_DESCRIPTOR);
    });

    /**
     * @tc.name          descriptorValidationMultipleServices
     * @tc.desc          Two lifecycle models hold independent stub descriptors.
     * @tc.precondition  Two lifecycle models are available.
     * @tc.steps         1. Connect both services.
     *                   2. Compare the stub references.
     *                   3. Confirm the counts.
     * @tc.expected      Each service owns one stub with the canonical descriptor.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('descriptorValidationMultipleServices', 0, () => {
      const first: ServiceLifecycleModel = new ServiceLifecycleModel();
      const second: ServiceLifecycleModel = new ServiceLifecycleModel();
      const firstStub: StubRemoteObjectModel = first.onConnect();
      const secondStub: StubRemoteObjectModel = second.onConnect();
      logStep('descriptorValidationMultipleServices', describeStub(firstStub) + '/' + describeStub(secondStub));
      expect(firstStub === secondStub).assertFalse();
      expect(firstStub.descriptor).assertEqual(secondStub.descriptor);
      expect(firstStub.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(first.connectCount).assertEqual(1);
      expect(second.connectCount).assertEqual(1);
      expect(first.stub === secondStub).assertFalse();
      expect(second.stub === secondStub).assertTrue();
      expect(first.events.size()).assertEqual(1);
    });

    /**
     * @tc.name          descriptorValidationDescriptorSorting
     * @tc.desc          Sorted descriptor lists place the canonical literal deterministically.
     * @tc.precondition  The descriptor literals are available.
     * @tc.steps         1. Build an unsorted descriptor list.
     *                   2. Sort a copy.
     *                   3. Compare the first entry with the literal ordering.
     * @tc.expected      Sorting yields Alpha, Beta and IPCStubTest order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('descriptorValidationDescriptorSorting', 0, () => {
      const values: string[] = [STUB_DESCRIPTOR, 'Beta', 'Alpha'];
      const sorted: string[] = [STUB_DESCRIPTOR, 'Beta', 'Alpha'];
      sorted.sort((left: string, right: string): number => left < right ? -1 : (left > right ? 1 : 0));
      logStep('descriptorValidationDescriptorSorting', joined(sorted, ','));
      expect(values[0]).assertEqual(STUB_DESCRIPTOR);
      expect(sorted[0]).assertEqual('Alpha');
      expect(sorted[1]).assertEqual('Beta');
      expect(sorted[2]).assertEqual(STUB_DESCRIPTOR);
      expect(sorted.length).assertEqual(values.length);
      expect(countOf(sorted, STUB_DESCRIPTOR)).assertEqual(1);
      expect(sorted[2].length).assertEqual(11);
      expect(sorted[0] === sorted[1]).assertFalse();
    });

    /**
     * @tc.name          descriptorValidationResetEventDetail
     * @tc.desc          Reset removes connect event details entirely.
     * @tc.precondition  A connected lifecycle model exists.
     * @tc.steps         1. Connect once.
     *                   2. Reset.
     *                   3. Inspect the event entries.
     * @tc.expected      No event entry remains after reset.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorValidationResetEventDetail', 0, () => {
      const service: ServiceLifecycleModel = new ServiceLifecycleModel();
      service.onConnect();
      const before: number = service.events.size();
      service.reset();
      logStep('descriptorValidationResetEventDetail', String(service.events.size()));
      expect(before).assertEqual(1);
      expect(service.events.size()).assertEqual(0);
      expect(service.events.last()).assertEqual('');
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(0);
      expect(service.events.trace()).assertEqual('');
      expect(service.stub).assertUndefined();
      expect(service.connectCount).assertEqual(0);
      expect(service.state).assertEqual('idle');
    });

    /**
     * @tc.name          descriptorValidationTruncation
     * @tc.desc          Truncating the descriptor separates prefix and suffix.
     * @tc.precondition  The descriptor literal is available.
     * @tc.steps         1. Truncate to seven characters.
     *                   2. Compare with the prefix.
     *                   3. Compare the suffix.
     * @tc.expected      The prefix is IPCStub and the suffix is Test.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('descriptorValidationTruncation', 0, () => {
      const truncated: string = STUB_DESCRIPTOR.substring(0, 7);
      const suffix: string = STUB_DESCRIPTOR.substring(7);
      logStep('descriptorValidationTruncation', truncated + '/' + suffix);
      expect(truncated).assertEqual('IPCStub');
      expect(truncated.length).assertEqual(7);
      expect(suffix).assertEqual('Test');
      expect(suffix.length).assertEqual(4);
      expect(truncated + suffix).assertEqual(STUB_DESCRIPTOR);
      expect(truncated.length + suffix.length).assertEqual(STUB_DESCRIPTOR.length);
      expect(descriptorLooksValid(truncated)).assertTrue();
      expect(descriptorLooksValid(suffix)).assertTrue();
    });

    /**
     * @tc.name          descriptorValidationRequestLedgerDescriptor
     * @tc.desc          The request ledger is independent from the descriptor value.
     * @tc.precondition  A stub with a custom descriptor exists.
     * @tc.steps         1. Replay three codes.
     *                   2. Build a ledger of codes.
     *                   3. Compare the ledger with the descriptor.
     * @tc.expected      The ledger reports three requests and the descriptor stays custom.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('descriptorValidationRequestLedgerDescriptor', 0, () => {
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel('LedgerStub');
      const client: InProcessClient = new InProcessClient(stub);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      client.send(0, REQUEST_PAYLOAD);
      client.send(2, REQUEST_PAYLOAD);
      const ledger: string = joined(client.sentCodes.map((code: number): string => String(code)), ',');
      logStep('descriptorValidationRequestLedgerDescriptor', ledger);
      expect(ledger).assertEqual('1,0,2');
      expect(ledger.split(',').length).assertEqual(3);
      expect(stub.requestCount()).assertEqual(3);
      expect(stub.descriptor).assertEqual('LedgerStub');
      expect(stub.descriptor === STUB_DESCRIPTOR).assertFalse();
      expect(StubMetrics.from(stub).handled).assertEqual(1);
      expect(StubMetrics.from(stub).rejected).assertEqual(2);
      expect(client.replies.length).assertEqual(1);
    });

    /**
     * @tc.name          descriptorValidationStubStateLedger
     * @tc.desc          A stub state ledger reports descriptor, aliveness and traffic.
     * @tc.precondition  A stub that served one request exists.
     * @tc.steps         1. Send one request.
     *                   2. Compose the state ledger.
     *                   3. Inspect each field.
     * @tc.expected      The ledger reports the descriptor, true and one request.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('descriptorValidationStubStateLedger', 0, () => {
      const stub: StubRemoteObjectModel = new StubRemoteObjectModel();
      const client: InProcessClient = new InProcessClient(stub);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      const ledger: string = describeStub(stub);
      logStep('descriptorValidationStubStateLedger', ledger);
      expect(ledger).assertEqual(STUB_DESCRIPTOR + '#1#true');
      expect(ledger.split('#').length).assertEqual(3);
      expect(ledger.startsWith(STUB_DESCRIPTOR)).assertTrue();
      expect(ledger.endsWith('#true')).assertTrue();
      expect(ledger.indexOf('#1#')).assertLarger(0);
      expect(stub.alive).assertTrue();
      expect(stub.requestCount()).assertEqual(1);
      expect(ledger.length).assertEqual(18);
    });

    /**
     * @tc.name          descriptorValidationConnectReplyChain
     * @tc.desc          The connect stub drives a request and a reply chain.
     * @tc.precondition  A lifecycle model is available.
     * @tc.steps         1. Connect the service.
     *                   2. Send two requests.
     *                   3. Join the replies.
     * @tc.expected      The chain contains two hello rpc entries.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorValidationConnectReplyChain', 0, () => {
      const service: ServiceLifecycleModel = new ServiceLifecycleModel();
      const stub: StubRemoteObjectModel = service.onConnect();
      const client: InProcessClient = new InProcessClient(stub);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      const chain: string = client.trace();
      logStep('descriptorValidationConnectReplyChain', chain);
      expect(chain.split('|').length).assertEqual(2);
      expect(chain.split('|')[0]).assertEqual(REPLY_PAYLOAD);
      expect(chain.split('|')[1]).assertEqual(REPLY_PAYLOAD);
      expect(countOf(chain.split('|'), REPLY_PAYLOAD)).assertEqual(2);
      expect(stub.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(service.connectCount).assertEqual(1);
      expect(client.results.length).assertEqual(2);
      expect(stub.requestCount()).assertEqual(2);
    });
  });
}
