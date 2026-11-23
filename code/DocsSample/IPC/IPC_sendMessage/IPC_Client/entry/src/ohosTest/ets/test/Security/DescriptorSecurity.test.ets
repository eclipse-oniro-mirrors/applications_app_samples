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
 * DescriptorSecurity: remote descriptor allowlist for the IPC client.
 *
 * A remote proxy announces itself through its descriptor. The production stub
 * uses 'IPCStubTest'. This suite treats the descriptor as an allowlist token
 * and checks shape, spoof resistance, and event trace integrity.
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import {
  STUB_DESCRIPTOR,
  TARGET_BUNDLE,
  TARGET_ABILITY,
  MessageSequenceModel,
  MessageOptionModel,
  RemoteStubModel,
  RemoteProxyModel,
  DeathRecipientModel,
  ConnectionModel,
  createConnectedSession,
  joined,
  countOf,
  uniqueStrings,
  textFingerprint
} from '../Shared/SharedDriver';

const DESCRIPTOR_LITERAL: string = 'IPCStubTest';

function descriptorAllowed(value: string): boolean {
  return value === DESCRIPTOR_LITERAL;
}

function isWordChar(code: number): boolean {
  if (code >= 48 && code <= 57) {
    return true;
  }
  if (code >= 65 && code <= 90) {
    return true;
  }
  if (code >= 97 && code <= 122) {
    return true;
  }
  return code === 95;
}

function descriptorShape(value: string): boolean {
  if (value.length === 0) {
    return false;
  }
  for (let index = 0; index < value.length; index++) {
    if (!isWordChar(value.charCodeAt(index))) {
      return false;
    }
  }
  return true;
}

function descriptorDecision(value: string): string {
  if (value.length === 0) {
    return 'empty';
  }
  if (!descriptorShape(value)) {
    return 'bad-chars';
  }
  if (!descriptorAllowed(value)) {
    return 'not-allowlisted';
  }
  return 'allow';
}

function proxyDescriptor(stub: RemoteStubModel): string {
  const proxy = new RemoteProxyModel(stub);
  return proxy.descriptor;
}

export default function descriptorSecurity(): void {
  describe('DescriptorSecurity', () => {
    beforeAll(() => {
      logSuite('DescriptorSecurity', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('DescriptorSecurity', 'end');
    });

    /**
     * @tc.name          descriptorSecurityStubDescriptorIsAllowlisted
     * @tc.desc          The production stub descriptor matches the literal.
     * @tc.precondition  STUB_DESCRIPTOR is exported by the driver.
     * @tc.steps         1. Read STUB_DESCRIPTOR. 2. Compare to the literal.
     *                   3. Evaluate shape and allowlist decisions.
     * @tc.expected      The descriptor is IPCStubTest and is allowed.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('descriptorSecurityStubDescriptorIsAllowlisted', 0, () => {
      logStep('descriptorSecurity', 'stub descriptor');
      expect(STUB_DESCRIPTOR).assertEqual(DESCRIPTOR_LITERAL);
      expect(STUB_DESCRIPTOR.length).assertEqual(11);
      expect(descriptorAllowed(STUB_DESCRIPTOR)).assertTrue();
      expect(descriptorShape(STUB_DESCRIPTOR)).assertTrue();
      expect(descriptorDecision(STUB_DESCRIPTOR)).assertEqual('allow');
      expect(textFingerprint(STUB_DESCRIPTOR)).assertEqual(textFingerprint(DESCRIPTOR_LITERAL));
      expect(STUB_DESCRIPTOR.indexOf(' ')).assertEqual(-1);
    });

    /**
     * @tc.name          descriptorSecurityProxyCopiesStubDescriptor
     * @tc.desc          A proxy exposes exactly the descriptor of its stub.
     * @tc.precondition  Default stub and proxy models are available.
     * @tc.steps         1. Build a proxy over a default stub. 2. Read both
     *                   descriptors. 3. Compare them to the allowlist.
     * @tc.expected      Proxy and stub agree and both are allowlisted.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('descriptorSecurityProxyCopiesStubDescriptor', 0, () => {
      logStep('descriptorSecurity', 'proxy copies descriptor');
      const stub = new RemoteStubModel();
      const proxy = new RemoteProxyModel(stub);
      expect(proxy.descriptor).assertEqual(stub.descriptor);
      expect(proxyDescriptor(stub)).assertEqual(STUB_DESCRIPTOR);
      expect(descriptorAllowed(proxy.descriptor)).assertTrue();
      expect(descriptorDecision(proxy.descriptor)).assertEqual('allow');
      expect(proxy.isAlive()).assertTrue();
      expect(proxy.requests.length).assertEqual(0);
    });

    /**
     * @tc.name          descriptorSecurityCustomStubDescriptorPropagates
     * @tc.desc          A custom stub descriptor flows into the proxy verbatim.
     * @tc.precondition  RemoteStubModel accepts a constructor descriptor.
     * @tc.steps         1. Build a stub with a custom descriptor. 2. Wrap it.
     *                   3. Compare the two descriptors.
     * @tc.expected      The proxy reports the custom descriptor and rejects it.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecurityCustomStubDescriptorPropagates', 0, () => {
      logStep('descriptorSecurity', 'custom descriptor');
      const stub = new RemoteStubModel('OtherStub');
      const proxy = new RemoteProxyModel(stub);
      expect(proxy.descriptor).assertEqual('OtherStub');
      expect(proxy.descriptor).assertEqual(stub.descriptor);
      expect(descriptorAllowed(proxy.descriptor)).assertFalse();
      expect(descriptorShape(proxy.descriptor)).assertTrue();
      expect(descriptorDecision(proxy.descriptor)).assertEqual('not-allowlisted');
      expect(proxy.descriptor).assertEqual('OtherStub');
    });

    /**
     * @tc.name          descriptorSecurityEmptyDescriptorIsRejected
     * @tc.desc          An empty descriptor fails the shape check first.
     * @tc.precondition  RemoteProxyModel can wrap an empty descriptor stub.
     * @tc.steps         1. Build an empty descriptor stub. 2. Wrap it.
     *                   3. Evaluate the decision ladder.
     * @tc.expected      The decision is empty and the proxy is not trusted.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecurityEmptyDescriptorIsRejected', 0, () => {
      logStep('descriptorSecurity', 'empty descriptor');
      const stub = new RemoteStubModel('');
      const proxy = new RemoteProxyModel(stub);
      expect(proxy.descriptor.length).assertEqual(0);
      expect(descriptorShape(proxy.descriptor)).assertFalse();
      expect(descriptorAllowed(proxy.descriptor)).assertFalse();
      expect(descriptorDecision(proxy.descriptor)).assertEqual('empty');
      expect(proxy.descriptor).assertEqual('');
      expect(proxy.sendCalls).assertEqual(0);
    });

    /**
     * @tc.name          descriptorSecuritySeparatorInDescriptorIsRejected
     * @tc.desc          A descriptor containing a slash fails the shape check.
     * @tc.precondition  The shape helper only allows word characters.
     * @tc.steps         1. Evaluate a slash-bearing descriptor. 2. Evaluate a
     *                   space-bearing descriptor. 3. Compare decisions.
     * @tc.expected      Both descriptors are reported as bad-chars.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecuritySeparatorInDescriptorIsRejected', 0, () => {
      logStep('descriptorSecurity', 'separator descriptor');
      const slash = 'IPCStubTest/extra';
      const spaced = 'IPC StubTest';
      expect(descriptorShape(slash)).assertFalse();
      expect(descriptorShape(spaced)).assertFalse();
      expect(descriptorDecision(slash)).assertEqual('bad-chars');
      expect(descriptorDecision(spaced)).assertEqual('bad-chars');
      expect(descriptorAllowed(slash)).assertFalse();
      expect(slash.indexOf('/') > 0).assertTrue();
      expect(spaced.indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.name          descriptorSecurityLowercaseVariantIsDenied
     * @tc.desc          A fully lower case descriptor is not allowlisted.
     * @tc.precondition  The allowlist oracle is case sensitive.
     * @tc.steps         1. Lower case the literal. 2. Evaluate the shape.
     *                   3. Evaluate the verdict.
     * @tc.expected      The lower case variant is shaped well but denied.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecurityLowercaseVariantIsDenied', 0, () => {
      logStep('descriptorSecurity', 'lowercase variant');
      const lower = DESCRIPTOR_LITERAL.toLowerCase();
      expect(lower).assertEqual('ipcstubtest');
      expect(descriptorShape(lower)).assertTrue();
      expect(descriptorAllowed(lower)).assertFalse();
      expect(descriptorDecision(lower)).assertEqual('not-allowlisted');
      expect(lower.length).assertEqual(DESCRIPTOR_LITERAL.length);
      expect(lower === DESCRIPTOR_LITERAL).assertFalse();
      expect(textFingerprint(lower) === textFingerprint(DESCRIPTOR_LITERAL)).assertFalse();
    });

    /**
     * @tc.name          descriptorSecurityUppercaseVariantIsDenied
     * @tc.desc          An upper case descriptor is not allowlisted.
     * @tc.precondition  The allowlist oracle is case sensitive.
     * @tc.steps         1. Upper case the literal. 2. Compare fingerprints.
     *                   3. Evaluate the verdict.
     * @tc.expected      The upper case variant is denied.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecurityUppercaseVariantIsDenied', 0, () => {
      logStep('descriptorSecurity', 'uppercase variant');
      const upper = DESCRIPTOR_LITERAL.toUpperCase();
      expect(upper).assertEqual('IPCSTUBTEST');
      expect(upper.length).assertEqual(DESCRIPTOR_LITERAL.length);
      expect(descriptorAllowed(upper)).assertFalse();
      expect(descriptorDecision(upper)).assertEqual('not-allowlisted');
      expect(upper.endsWith('TEST')).assertTrue();
      expect(upper.startsWith('IPC')).assertTrue();
      expect(uniqueStrings([DESCRIPTOR_LITERAL, upper]).length).assertEqual(2);
    });

    /**
     * @tc.name          descriptorSecuritySuffixSpoofIsDenied
     * @tc.desc          A descriptor with an appended suffix is denied.
     * @tc.precondition  The allowlist oracle uses exact equality.
     * @tc.steps         1. Append X to the descriptor. 2. Check shape.
     *                   3. Evaluate the verdict and the proxy field.
     * @tc.expected      The suffixed descriptor is shaped well but denied.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecuritySuffixSpoofIsDenied', 0, () => {
      logStep('descriptorSecurity', 'suffix spoof');
      const spoof = DESCRIPTOR_LITERAL + 'X';
      const proxy = new RemoteProxyModel(new RemoteStubModel(spoof));
      expect(spoof.length).assertEqual(12);
      expect(descriptorShape(spoof)).assertTrue();
      expect(descriptorAllowed(spoof)).assertFalse();
      expect(descriptorDecision(spoof)).assertEqual('not-allowlisted');
      expect(proxy.descriptor).assertEqual(spoof);
      expect(descriptorAllowed(proxy.descriptor)).assertFalse();
    });

    /**
     * @tc.name          descriptorSecurityHyphenIsRejectedByShape
     * @tc.desc          A hyphen is not an allowed descriptor character.
     * @tc.precondition  The shape helper allows letters, digits and underscore.
     * @tc.steps         1. Test a hyphenated descriptor. 2. Test a dotted one.
     *                   3. Compare their decisions.
     * @tc.expected      Both are reported as bad-chars.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecurityHyphenIsRejectedByShape', 0, () => {
      logStep('descriptorSecurity', 'hyphen rejected');
      const hyphen = 'IPC-Stub-Test';
      const dotted = 'IPCStub.Test';
      expect(descriptorShape(hyphen)).assertFalse();
      expect(descriptorShape(dotted)).assertFalse();
      expect(descriptorDecision(hyphen)).assertEqual('bad-chars');
      expect(descriptorDecision(dotted)).assertEqual('bad-chars');
      expect(hyphen.indexOf('-')).assertEqual(3);
      expect(dotted.indexOf('.')).assertEqual(7);
    });

    /**
     * @tc.name          descriptorSecurityUnderscoreAndDigitsAreShaped
     * @tc.desc          Underscores and digits pass shape but not the allowlist.
     * @tc.precondition  The shape helper allows word characters.
     * @tc.steps         1. Check an underscore descriptor. 2. Check a digit one.
     *                   3. Evaluate both verdicts.
     * @tc.expected      Shape passes and the allowlist denies both.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('descriptorSecurityUnderscoreAndDigitsAreShaped', 0, () => {
      logStep('descriptorSecurity', 'word characters');
      const underscored = 'IPC_Stub_Test';
      const digits = 'IPCStub2';
      expect(descriptorShape(underscored)).assertTrue();
      expect(descriptorShape(digits)).assertTrue();
      expect(descriptorAllowed(underscored)).assertFalse();
      expect(descriptorAllowed(digits)).assertFalse();
      expect(descriptorDecision(underscored)).assertEqual('not-allowlisted');
      expect(descriptorDecision(digits)).assertEqual('not-allowlisted');
      expect(descriptorShape('_')).assertTrue();
      expect(descriptorShape('9')).assertTrue();
    });

    /**
     * @tc.name          descriptorSecurityUnicodeDescriptorIsRejected
     * @tc.desc          A non-ASCII descriptor fails the shape check.
     * @tc.precondition  The shape helper only accepts ASCII word characters.
     * @tc.steps         1. Test a Chinese descriptor. 2. Test a BOM prefix.
     *                   3. Compare decisions.
     * @tc.expected      Both descriptors are reported as bad-chars.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('descriptorSecurityUnicodeDescriptorIsRejected', 0, () => {
      logStep('descriptorSecurity', 'unicode descriptor');
      const chinese = '存根';
      const bom = '\uFEFFIPCStubTest';
      expect(chinese.charCodeAt(0) > 127).assertTrue();
      expect(descriptorShape(chinese)).assertFalse();
      expect(descriptorShape(bom)).assertFalse();
      expect(descriptorDecision(chinese)).assertEqual('bad-chars');
      expect(descriptorDecision(bom)).assertEqual('bad-chars');
      expect(descriptorAllowed(bom)).assertFalse();
    });

    /**
     * @tc.name          descriptorSecurityLongDescriptorIsDenied
     * @tc.desc          A very long word character descriptor is still denied.
     * @tc.precondition  The shape helper has no length upper bound.
     * @tc.steps         1. Build a hundred char descriptor. 2. Check the shape.
     *                   3. Evaluate the verdict.
     * @tc.expected      The long descriptor is shaped well but not allowlisted.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('descriptorSecurityLongDescriptorIsDenied', 0, () => {
      logStep('descriptorSecurity', 'long descriptor');
      let long = '';
      for (let index = 0; index < 100; index++) {
        long = long + 'A';
      }
      expect(long.length).assertEqual(100);
      expect(descriptorShape(long)).assertTrue();
      expect(descriptorAllowed(long)).assertFalse();
      expect(descriptorDecision(long)).assertEqual('not-allowlisted');
      expect(long === DESCRIPTOR_LITERAL).assertFalse();
      expect(textFingerprint(long) === textFingerprint(DESCRIPTOR_LITERAL)).assertFalse();
    });

    /**
     * @tc.name          descriptorSecuritySingleCharDescriptorIsDenied
     * @tc.desc          A one character descriptor passes shape but not the list.
     * @tc.precondition  The shape helper accepts a single word character.
     * @tc.steps         1. Check the letter A. 2. Check the digit 1.
     *                   3. Evaluate both verdicts.
     * @tc.expected      Both single char descriptors are denied.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('descriptorSecuritySingleCharDescriptorIsDenied', 0, () => {
      logStep('descriptorSecurity', 'single char');
      expect(descriptorShape('A')).assertTrue();
      expect(descriptorShape('1')).assertTrue();
      expect(descriptorShape('_')).assertTrue();
      expect(descriptorAllowed('A')).assertFalse();
      expect(descriptorDecision('1')).assertEqual('not-allowlisted');
      expect(descriptorDecision('_')).assertEqual('not-allowlisted');
      expect('A'.length).assertEqual(1);
    });

    /**
     * @tc.name          descriptorSecurityNewlineInjectionIsRejected
     * @tc.desc          A descriptor cannot smuggle a newline or a space.
     * @tc.precondition  The shape helper only allows word characters.
     * @tc.steps         1. Check a newline suffix. 2. Check a space suffix.
     *                   3. Evaluate both verdicts.
     * @tc.expected      Both injected descriptors are reported as bad-chars.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecurityNewlineInjectionIsRejected', 0, () => {
      logStep('descriptorSecurity', 'newline injection');
      const newline = DESCRIPTOR_LITERAL + '\n';
      const space = DESCRIPTOR_LITERAL + ' ';
      expect(newline.length).assertEqual(12);
      expect(space.length).assertEqual(12);
      expect(descriptorShape(newline)).assertFalse();
      expect(descriptorShape(space)).assertFalse();
      expect(descriptorDecision(newline)).assertEqual('bad-chars');
      expect(descriptorDecision(space)).assertEqual('bad-chars');
      expect(descriptorAllowed(newline)).assertFalse();
      expect(newline.charAt(11)).assertEqual('\n');
    });

    /**
     * @tc.name          descriptorSecurityBundleAndAbilityAreNotDescriptors
     * @tc.desc          Target identifiers are not valid descriptors.
     * @tc.precondition  The descriptor allowlist holds one literal.
     * @tc.steps         1. Evaluate the bundle name. 2. Evaluate the ability.
     *                   3. Compare their decisions to the stub descriptor.
     * @tc.expected      Both identifiers are denied while the stub passes.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecurityBundleAndAbilityAreNotDescriptors', 0, () => {
      logStep('descriptorSecurity', 'identifiers as descriptors');
      expect(descriptorAllowed(TARGET_BUNDLE)).assertFalse();
      expect(descriptorAllowed(TARGET_ABILITY)).assertFalse();
      expect(descriptorDecision(TARGET_BUNDLE)).assertEqual('bad-chars');
      expect(descriptorDecision(TARGET_ABILITY)).assertEqual('not-allowlisted');
      expect(descriptorDecision(STUB_DESCRIPTOR)).assertEqual('allow');
      expect(descriptorShape(TARGET_BUNDLE)).assertFalse();
      expect(descriptorShape(TARGET_ABILITY)).assertTrue();
    });

    /**
     * @tc.name          descriptorSecurityDeathRegistrationNeedsLiveProxy
     * @tc.desc          A dead proxy refuses a death recipient registration.
     * @tc.precondition  A proxy over a killed stub exists.
     * @tc.steps         1. Kill the proxy. 2. Register a recipient.
     *                   3. Inspect both flags.
     * @tc.expected      Registration fails and neither flag is set.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecurityDeathRegistrationNeedsLiveProxy', 0, () => {
      logStep('descriptorSecurity', 'registration needs live proxy');
      const proxy = new RemoteProxyModel(new RemoteStubModel());
      const recipient = new DeathRecipientModel();
      proxy.notifyDeath();
      expect(proxy.registerDeathRecipient(recipient)).assertFalse();
      expect(proxy.deathRegistered).assertFalse();
      expect(recipient.registered).assertFalse();
      expect(proxy.deathRecipient === undefined).assertTrue();
      expect(proxy.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(recipient.diedCount).assertEqual(0);
    });

    /**
     * @tc.name          descriptorSecurityUnregisterMismatchIsRefused
     * @tc.desc          Unregistering a different recipient returns false.
     * @tc.precondition  A live proxy registered recipient A.
     * @tc.steps         1. Register A. 2. Unregister B. 3. Inspect A's flag.
     * @tc.expected      The mismatch is refused and A stays registered.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecurityUnregisterMismatchIsRefused', 0, () => {
      logStep('descriptorSecurity', 'unregister mismatch');
      const proxy = new RemoteProxyModel(new RemoteStubModel());
      const first = new DeathRecipientModel();
      const second = new DeathRecipientModel();
      expect(proxy.registerDeathRecipient(first)).assertTrue();
      expect(proxy.unregisterDeathRecipient(second)).assertFalse();
      expect(first.registered).assertTrue();
      expect(second.registered).assertFalse();
      expect(proxy.deathRegistered).assertTrue();
      expect(proxy.deathRecipient === first).assertTrue();
      expect(proxy.unregisterDeathRecipient(first)).assertTrue();
      expect(first.registered).assertFalse();
      expect(proxy.deathRecipient === undefined).assertTrue();
    });

    /**
     * @tc.name          descriptorSecurityEventTraceCarriesDescriptor
     * @tc.desc          The proxy descriptor appears in the connect event trail.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Read the event trace. 2. Count descriptor mentions.
     *                   3. Compare the death registration event.
     * @tc.expected      The descriptor is recorded twice and the trace is stable.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecurityEventTraceCarriesDescriptor', 0, () => {
      logStep('descriptorSecurity', 'event descriptor');
      const client = createConnectedSession();
      const trace = client.events.trace();
      expect(trace.indexOf('death-register:' + STUB_DESCRIPTOR) > 0).assertTrue();
      expect(trace.endsWith('connected:' + STUB_DESCRIPTOR)).assertTrue();
      expect(client.events.countOf('connected')).assertEqual(1);
      expect(client.events.countOf('death-register')).assertEqual(1);
      expect(trace.split(STUB_DESCRIPTOR).length).assertEqual(3);
      expect(client.events.entries[1]).assertEqual('death-register:' + STUB_DESCRIPTOR);
      expect(client.events.fingerprint()).assertEqual(textFingerprint(trace));
    });

    /**
     * @tc.name          descriptorSecurityDescriptorFingerprintIsStable
     * @tc.desc          The allowlisted descriptor fingerprint is deterministic.
     * @tc.precondition  The descriptor literal is known.
     * @tc.steps         1. Fingerprint the descriptor. 2. Recompute it. 3. Compare
     *                   it to a rebuilt stub.
     * @tc.expected      The fingerprint is stable and identical for rebuilt stubs.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecurityDescriptorFingerprintIsStable', 0, () => {
      logStep('descriptorSecurity', 'descriptor fingerprint');
      const baseline = textFingerprint(DESCRIPTOR_LITERAL);
      expect(baseline).assertEqual(textFingerprint(new RemoteStubModel().descriptor));
      expect(baseline).assertEqual(textFingerprint(new RemoteProxyModel().descriptor));
      expect(baseline > 0).assertTrue();
      expect(textFingerprint('IPCStubTes') === baseline).assertFalse();
      expect(textFingerprint('IPCStubTest') === textFingerprint('ipcstubtest')).assertFalse();
      expect(descriptorAllowed(DESCRIPTOR_LITERAL)).assertTrue();
    });

    /**
     * @tc.name          descriptorSecurityAllowlistIsSingleValued
     * @tc.desc          Only one candidate in a fixed set is a trusted descriptor.
     * @tc.precondition  The allowlist oracle holds one literal.
     * @tc.steps         1. Build six candidates. 2. Filter them by the oracle.
     *                   3. De-duplicate the survivors.
     * @tc.expected      Exactly one survivor remains.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecurityAllowlistIsSingleValued', 0, () => {
      logStep('descriptorSecurity', 'single valued allowlist');
      const candidates: string[] = [
        STUB_DESCRIPTOR,
        STUB_DESCRIPTOR + 'X',
        'X' + STUB_DESCRIPTOR,
        STUB_DESCRIPTOR.toLowerCase(),
        STUB_DESCRIPTOR.toUpperCase(),
        'IPCStubTest2'
      ];
      const survivors: string[] = [];
      for (let index = 0; index < candidates.length; index++) {
        if (descriptorAllowed(candidates[index])) {
          survivors.push(candidates[index]);
        }
      }
      expect(candidates.length).assertEqual(6);
      expect(survivors.length).assertEqual(1);
      expect(uniqueStrings(survivors).length).assertEqual(1);
      expect(survivors[0]).assertEqual(STUB_DESCRIPTOR);
      expect(countOf(candidates, STUB_DESCRIPTOR)).assertEqual(1);
      expect(descriptorShape(candidates[5])).assertTrue();
    });

    /**
     * @tc.name          descriptorSecurityProxyResetKeepsDescriptor
     * @tc.desc          Resetting fault state does not change the descriptor.
     * @tc.precondition  A live proxy has served one request.
     * @tc.steps         1. Send a request. 2. Reset the proxy. 3. Inspect every
     *                   reset field and the descriptor.
     * @tc.expected      The descriptor and stub survive while counters clear.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecurityProxyResetKeepsDescriptor', 0, () => {
      logStep('descriptorSecurity', 'proxy reset');
      const stub = new RemoteStubModel();
      const proxy = new RemoteProxyModel(stub);
      const data = MessageSequenceModel.create();
      const reply = MessageSequenceModel.create();
      data.writeString('hello world');
      proxy.sendMessageRequest(1, data, reply, new MessageOptionModel());
      expect(proxy.sendCalls).assertEqual(1);
      expect(proxy.requests.length).assertEqual(1);
      proxy.reset();
      expect(proxy.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(proxy.descriptor).assertEqual(stub.descriptor);
      expect(proxy.requests.length).assertEqual(0);
      expect(proxy.sendCalls).assertEqual(0);
      expect(proxy.deathRegistered).assertFalse();
      expect(proxy.isAlive()).assertTrue();
    });

    /**
     * @tc.name          descriptorSecurityUntrustedDescriptorStillConnects
     * @tc.desc          The state machine connects regardless of descriptor trust.
     * @tc.precondition  A proxy over a custom descriptor stub exists.
     * @tc.steps         1. Connect and deliver onConnect. 2. Inspect the state.
     *                   3. Compare the descriptor verdict.
     * @tc.expected      The session is connected but the descriptor is denied by
     *                   the allowlist oracle.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('descriptorSecurityUntrustedDescriptorStillConnects', 0, () => {
      logStep('descriptorSecurity', 'untrusted connects');
      const stub = new RemoteStubModel('UnknownStub');
      const proxy = new RemoteProxyModel(stub);
      const client = new ConnectionModel();
      client.connect(1);
      client.onConnect(proxy);
      expect(client.state).assertEqual('connected');
      expect(client.isConnected()).assertTrue();
      expect(proxy.descriptor).assertEqual('UnknownStub');
      expect(descriptorAllowed(proxy.descriptor)).assertFalse();
      expect(descriptorDecision(proxy.descriptor)).assertEqual('not-allowlisted');
      expect(client.events.last()).assertEqual('connected:UnknownStub');
      expect(client.toasts.length).assertEqual(1);
    });

    /**
     * @tc.name          descriptorSecurityRepeatedDeathIsCounted
     * @tc.desc          Each notifyDeath increments the recipient counter.
     * @tc.precondition  A connected session registered one recipient.
     * @tc.steps         1. Notify death twice. 2. Read the counter. 3. Inspect
     *                   the proxy liveness.
     * @tc.expected      The counter reaches two and the proxy stays dead.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('descriptorSecurityRepeatedDeathIsCounted', 0, () => {
      logStep('descriptorSecurity', 'repeated death');
      const client = createConnectedSession();
      const proxy = client.proxy as RemoteProxyModel;
      proxy.notifyDeath();
      expect(client.deathRecipient.diedCount).assertEqual(1);
      expect(client.deathRecipient.registered).assertTrue();
      proxy.notifyDeath();
      expect(client.deathRecipient.diedCount).assertEqual(2);
      expect(proxy.isAlive()).assertFalse();
      expect(proxy.deathRegistered).assertTrue();
      expect(client.isConnected()).assertFalse();
      expect(client.state).assertEqual('connected');
    });

    /**
     * @tc.name          descriptorSecurityUnregisterAfterDeathSucceeds
     * @tc.desc          A recipient can be unregistered after the proxy dies.
     * @tc.precondition  A connected session whose proxy has died.
     * @tc.steps         1. Notify death. 2. Unregister the recipient. 3. Inspect
     *                   the flags.
     * @tc.expected      Unregistration succeeds and clears both flags.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecurityUnregisterAfterDeathSucceeds', 0, () => {
      logStep('descriptorSecurity', 'unregister after death');
      const client = createConnectedSession();
      const proxy = client.proxy as RemoteProxyModel;
      proxy.notifyDeath();
      expect(client.deathRecipient.registered).assertTrue();
      expect(proxy.unregisterDeathRecipient(client.deathRecipient)).assertTrue();
      expect(client.deathRecipient.registered).assertFalse();
      expect(proxy.deathRegistered).assertFalse();
      expect(proxy.deathRecipient === undefined).assertTrue();
      expect(client.deathRecipient.diedCount).assertEqual(1);
      expect(proxy.unregisterDeathRecipient(client.deathRecipient)).assertFalse();
    });

    /**
     * @tc.name          descriptorSecurityDescriptorLengthIsPinned
     * @tc.desc          The allowlisted descriptor is exactly eleven characters.
     * @tc.precondition  STUB_DESCRIPTOR is exported by the driver.
     * @tc.steps         1. Read the length. 2. Truncate it by one. 3. Compare both.
     * @tc.expected      The literal is eleven chars and the ten char cut is denied.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecurityDescriptorLengthIsPinned', 0, () => {
      logStep('descriptorSecurity', 'length pinned');
      const truncated = STUB_DESCRIPTOR.substring(0, 10);
      expect(STUB_DESCRIPTOR.length).assertEqual(11);
      expect(truncated.length).assertEqual(10);
      expect(truncated).assertEqual('IPCStubTes');
      expect(descriptorAllowed(truncated)).assertFalse();
      expect(descriptorDecision(truncated)).assertEqual('not-allowlisted');
      expect(STUB_DESCRIPTOR.charAt(10)).assertEqual('t');
      expect(truncated === STUB_DESCRIPTOR).assertFalse();
    });

    /**
     * @tc.name          descriptorSecurityDescriptorListIsUnique
     * @tc.desc          Five candidate descriptors stay five distinct values.
     * @tc.precondition  The descriptor literal is known.
     * @tc.steps         1. Build five descriptors. 2. De-duplicate them. 3. Count the
     *                   allowlisted entries.
     * @tc.expected      All five are distinct and only one is allowed.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecurityDescriptorListIsUnique', 0, () => {
      logStep('descriptorSecurity', 'descriptor list unique');
      const values: string[] = [STUB_DESCRIPTOR, 'IPCStub', 'StubTest', 'IPCStubTest2', 'ipcstubtest'];
      let allowed = 0;
      for (let index = 0; index < values.length; index++) {
        if (descriptorAllowed(values[index])) {
          allowed = allowed + 1;
        }
      }
      expect(values.length).assertEqual(5);
      expect(uniqueStrings(values).length).assertEqual(5);
      expect(allowed).assertEqual(1);
      expect(values.length - allowed).assertEqual(4);
      expect(uniqueStrings(values)[0]).assertEqual(STUB_DESCRIPTOR);
      expect(joined(values, ',').split(',').length).assertEqual(5);
      expect(countOf(values, 'IPCStubTest2')).assertEqual(1);
    });

    /**
     * @tc.name          descriptorSecurityStubLivenessIsIndependent
     * @tc.desc          Killing a stub does not change its descriptor.
     * @tc.precondition  A stub and proxy exist.
     * @tc.steps         1. Read the descriptor. 2. Kill the stub. 3. Read it again.
     * @tc.expected      The descriptor is unchanged while liveness flips.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecurityStubLivenessIsIndependent', 0, () => {
      logStep('descriptorSecurity', 'liveness independent');
      const stub = new RemoteStubModel();
      const proxy = new RemoteProxyModel(stub);
      expect(stub.alive).assertTrue();
      expect(proxy.descriptor).assertEqual(STUB_DESCRIPTOR);
      stub.kill();
      expect(stub.alive).assertFalse();
      expect(stub.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(proxy.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(descriptorAllowed(proxy.descriptor)).assertTrue();
      stub.revive();
      expect(stub.alive).assertTrue();
      expect(proxy.descriptor).assertEqual(STUB_DESCRIPTOR);
    });

    /**
     * @tc.name          descriptorSecurityRecipientFlagIsPerProxy
     * @tc.desc          Registration on one proxy does not flag another.
     * @tc.precondition  Two independent proxies exist.
     * @tc.steps         1. Register on the first. 2. Inspect both flags. 3. Notify death
     *                   on both.
     * @tc.expected      Only the first proxy reports registration.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecurityRecipientFlagIsPerProxy', 0, () => {
      logStep('descriptorSecurity', 'per proxy flag');
      const first = new RemoteProxyModel(new RemoteStubModel());
      const second = new RemoteProxyModel(new RemoteStubModel());
      const recipient = new DeathRecipientModel();
      expect(first.registerDeathRecipient(recipient)).assertTrue();
      expect(first.deathRegistered).assertTrue();
      expect(second.deathRegistered).assertFalse();
      expect(second.deathRecipient === undefined).assertTrue();
      first.notifyDeath();
      second.notifyDeath();
      expect(recipient.diedCount).assertEqual(1);
      expect(first.isAlive()).assertFalse();
      expect(second.isAlive()).assertFalse();
      expect(second.deathRegistered).assertFalse();
    });

    /**
     * @tc.name          descriptorSecurityResetRevivesProxy
     * @tc.desc          Proxy reset restores liveness after a death.
     * @tc.precondition  A proxy has been killed by notifyDeath.
     * @tc.steps         1. Notify death. 2. Reset. 3. Inspect liveness and flags.
     * @tc.expected      The proxy is alive again with cleared registration.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecurityResetRevivesProxy', 0, () => {
      logStep('descriptorSecurity', 'reset revives');
      const proxy = new RemoteProxyModel(new RemoteStubModel());
      const recipient = new DeathRecipientModel();
      proxy.registerDeathRecipient(recipient);
      proxy.notifyDeath();
      expect(proxy.isAlive()).assertFalse();
      expect(recipient.diedCount).assertEqual(1);
      proxy.reset();
      expect(proxy.isAlive()).assertTrue();
      expect(proxy.deathRegistered).assertFalse();
      expect(proxy.deathRecipient === undefined).assertTrue();
      expect(proxy.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(recipient.diedCount).assertEqual(1);
      expect(recipient.registered).assertFalse();
    });

    /**
     * @tc.name          descriptorSecurityBackslashIsRejected
     * @tc.desc          A backslash fails the descriptor shape check.
     * @tc.precondition  The shape helper allows only word characters.
     * @tc.steps         1. Insert a backslash. 2. Insert a colon. 3. Evaluate both.
     * @tc.expected      Both are reported as bad-chars.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecurityBackslashIsRejected', 0, () => {
      logStep('descriptorSecurity', 'backslash rejected');
      const slash = 'IPC\\Stub';
      const colon = 'IPC:Stub';
      expect(descriptorShape(slash)).assertFalse();
      expect(descriptorShape(colon)).assertFalse();
      expect(descriptorDecision(slash)).assertEqual('bad-chars');
      expect(descriptorDecision(colon)).assertEqual('bad-chars');
      expect(slash.indexOf('\\')).assertEqual(3);
      expect(colon.indexOf(':')).assertEqual(3);
      expect(descriptorAllowed(slash)).assertFalse();
      expect(descriptorAllowed(colon)).assertFalse();
    });

    /**
     * @tc.name          descriptorSecurityUppercaseLettersAreExpected
     * @tc.desc          The allowlisted descriptor mixes upper and lower case.
     * @tc.precondition  The descriptor literal is known.
     * @tc.steps         1. Count the upper case prefix. 2. Count the lower case tail.
     *                   3. Compare the full case profile.
     * @tc.expected      Three upper case letters prefix the mixed case name.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('descriptorSecurityUppercaseLettersAreExpected', 0, () => {
      logStep('descriptorSecurity', 'case profile');
      expect(STUB_DESCRIPTOR.substring(0, 3)).assertEqual('IPC');
      expect(STUB_DESCRIPTOR.substring(0, 3)).assertEqual(STUB_DESCRIPTOR.substring(0, 3).toUpperCase());
      expect(STUB_DESCRIPTOR.substring(3, 4)).assertEqual('S');
      expect(STUB_DESCRIPTOR.substring(4)).assertEqual('tubTest');
      expect(STUB_DESCRIPTOR.substring(7)).assertEqual('Test');
      expect(STUB_DESCRIPTOR.length).assertEqual(11);
      expect(STUB_DESCRIPTOR.charAt(3)).assertEqual('S');
      expect(STUB_DESCRIPTOR.charAt(10)).assertEqual('t');
    });

    /**
     * @tc.name          descriptorSecurityRegistrationIsIdempotent
     * @tc.desc          Registering the same recipient twice keeps it registered.
     * @tc.precondition  A live proxy and one recipient exist.
     * @tc.steps         1. Register once. 2. Register again. 3. Inspect the flags and
     *                   the pointer.
     * @tc.expected      Both calls succeed and the proxy holds the same recipient.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecurityRegistrationIsIdempotent', 0, () => {
      logStep('descriptorSecurity', 'registration idempotent');
      const proxy = new RemoteProxyModel(new RemoteStubModel());
      const recipient = new DeathRecipientModel();
      expect(proxy.registerDeathRecipient(recipient)).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      expect(proxy.registerDeathRecipient(recipient)).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      expect(proxy.deathRecipient === recipient).assertTrue();
      expect(recipient.registered).assertTrue();
      expect(recipient.diedCount).assertEqual(0);
      proxy.notifyDeath();
      expect(recipient.diedCount).assertEqual(1);
      expect(recipient.describe()).assertEqual('1/true');
      expect(proxy.deathRegistered).assertTrue();
    });

    /**
     * @tc.name          descriptorSecurityDescriptorSurvivesUnregister
     * @tc.desc          Unregistering a recipient does not affect the descriptor.
     * @tc.precondition  A registered proxy exists.
     * @tc.steps         1. Unregister. 2. Read the descriptor. 3. Compare the allowlist.
     * @tc.expected      The descriptor stays allowlisted after unregistration.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecurityDescriptorSurvivesUnregister', 0, () => {
      logStep('descriptorSecurity', 'descriptor after unregister');
      const proxy = new RemoteProxyModel(new RemoteStubModel());
      const recipient = new DeathRecipientModel();
      proxy.registerDeathRecipient(recipient);
      const before = proxy.descriptor;
      expect(proxy.unregisterDeathRecipient(recipient)).assertTrue();
      expect(proxy.descriptor).assertEqual(before);
      expect(proxy.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(descriptorAllowed(proxy.descriptor)).assertTrue();
      expect(proxy.deathRegistered).assertFalse();
      expect(recipient.registered).assertFalse();
      expect(proxy.isAlive()).assertTrue();
      expect(descriptorShape(proxy.descriptor)).assertTrue();
    });

    /**
     * @tc.name          descriptorSecurityCustomDescriptorFingerprintDiffers
     * @tc.desc          Custom descriptors fingerprint differently from the literal.
     * @tc.precondition  Two stubs with different descriptors exist.
     * @tc.steps         1. Fingerprint both descriptors. 2. Compare them. 3. Compare
     *                   the decision ladder.
     * @tc.expected      The fingerprints differ while both shapes pass.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecurityCustomDescriptorFingerprintDiffers', 0, () => {
      logStep('descriptorSecurity', 'custom fingerprint');
      const allowed = new RemoteStubModel(STUB_DESCRIPTOR);
      const custom = new RemoteStubModel('IPCStubOther');
      expect(textFingerprint(allowed.descriptor) === textFingerprint(custom.descriptor)).assertFalse();
      expect(textFingerprint(custom.descriptor)).assertEqual(textFingerprint('IPCStubOther'));
      expect(descriptorShape(custom.descriptor)).assertTrue();
      expect(descriptorAllowed(custom.descriptor)).assertFalse();
      expect(descriptorDecision(custom.descriptor)).assertEqual('not-allowlisted');
      expect(custom.descriptor.length).assertEqual(12);
      expect(allowed.descriptor.length).assertEqual(11);
      expect(descriptorAllowed(allowed.descriptor)).assertTrue();
    });

    /**
     * @tc.name          descriptorSecurityEventUsesDescriptorAsDetail
     * @tc.desc          Connect events use the descriptor as their detail value.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Read the death event. 2. Read the connected event. 3. Compare
     *                   both details.
     * @tc.expected      Both details are exactly the allowlisted descriptor.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecurityEventUsesDescriptorAsDetail', 0, () => {
      logStep('descriptorSecurity', 'event detail');
      const client = createConnectedSession();
      expect(client.events.entries[1]).assertEqual('death-register:' + DESCRIPTOR_LITERAL);
      expect(client.events.entries[2]).assertEqual('connected:' + DESCRIPTOR_LITERAL);
      expect(client.events.entries[1].substring(15)).assertEqual(DESCRIPTOR_LITERAL);
      expect(client.events.entries[2].substring(10)).assertEqual(DESCRIPTOR_LITERAL);
      expect(client.events.countOf('death-register')).assertEqual(1);
      expect(client.events.countOf('connected')).assertEqual(1);
      expect(client.events.size()).assertEqual(3);
      expect(client.events.entries[0].indexOf(DESCRIPTOR_LITERAL)).assertEqual(-1);
    });

    /**
     * @tc.name          descriptorSecurityNumericDescriptorIsDenied
     * @tc.desc          A digits only descriptor passes shape but not the allowlist.
     * @tc.precondition  The shape helper accepts digits.
     * @tc.steps         1. Build a fifteen digit descriptor. 2. Check the shape. 3. Read
     *                   the verdict.
     * @tc.expected      The numeric descriptor is shaped well but denied.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('descriptorSecurityNumericDescriptorIsDenied', 0, () => {
      logStep('descriptorSecurity', 'numeric descriptor');
      const numeric = '123456789012345';
      expect(numeric.length).assertEqual(15);
      expect(descriptorShape(numeric)).assertTrue();
      expect(descriptorAllowed(numeric)).assertFalse();
      expect(descriptorDecision(numeric)).assertEqual('not-allowlisted');
      expect(numeric.indexOf('IPC')).assertEqual(-1);
      expect(descriptorShape('0')).assertTrue();
      expect(descriptorAllowed('0')).assertFalse();
      expect(textFingerprint(numeric) === textFingerprint(DESCRIPTOR_LITERAL)).assertFalse();
    });

    /**
     * @tc.name          descriptorSecuritySendBeforeRegistrationWorks
     * @tc.desc          Sends do not require a registered death recipient.
     * @tc.precondition  A proxy without a recipient exists.
     * @tc.steps         1. Send a request. 2. Read the result. 3. Inspect the registration
     *                   flags.
     * @tc.expected      The send succeeds without any death registration.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecuritySendBeforeRegistrationWorks', 0, () => {
      logStep('descriptorSecurity', 'send before registration');
      const proxy = new RemoteProxyModel(new RemoteStubModel());
      const data = MessageSequenceModel.create();
      const reply = MessageSequenceModel.create();
      data.writeString('hello world');
      const result = proxy.sendMessageRequest(1, data, reply, new MessageOptionModel());
      expect(result.errCode).assertEqual(0);
      expect(result.readReply()).assertEqual('hello rpc');
      expect(proxy.deathRegistered).assertFalse();
      expect(proxy.deathRecipient === undefined).assertTrue();
      expect(proxy.descriptor).assertEqual(DESCRIPTOR_LITERAL);
      expect(proxy.sendCalls).assertEqual(1);
      expect(proxy.isAlive()).assertTrue();
    });

    /**
     * @tc.name          descriptorSecurityNotifyBeforeRegisterIsQuiet
     * @tc.desc          A death before registration leaves no callback trace.
     * @tc.precondition  A live proxy and a fresh recipient exist.
     * @tc.steps         1. Notify death. 2. Register the recipient. 3. Compare both flags.
     * @tc.expected      Registration fails and the recipient counter stays zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('descriptorSecurityNotifyBeforeRegisterIsQuiet', 0, () => {
      logStep('descriptorSecurity', 'notify before register');
      const proxy = new RemoteProxyModel(new RemoteStubModel());
      const recipient = new DeathRecipientModel();
      proxy.notifyDeath();
      expect(proxy.isAlive()).assertFalse();
      expect(recipient.diedCount).assertEqual(0);
      expect(proxy.registerDeathRecipient(recipient)).assertFalse();
      expect(recipient.registered).assertFalse();
      expect(proxy.deathRegistered).assertFalse();
      expect(recipient.describe()).assertEqual('0/false');
      expect(proxy.descriptor).assertEqual(DESCRIPTOR_LITERAL);
    });

    /**
     * @tc.name          descriptorSecurityCharacterSwapChangesFingerprint
     * @tc.desc          Swapping two letters yields the same length but a new fingerprint.
     * @tc.precondition  The descriptor literal is known.
     * @tc.steps         1. Swap Test to Tset. 2. Compare lengths. 3. Compare fingerprints
     *                   and verdicts.
     * @tc.expected      The swapped name is shaped well but not allowlisted.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('descriptorSecurityCharacterSwapChangesFingerprint', 0, () => {
      logStep('descriptorSecurity', 'character swap');
      const swapped = 'IPCStubTset';
      expect(swapped.length).assertEqual(DESCRIPTOR_LITERAL.length);
      expect(swapped).assertEqual('IPCStubTset');
      expect(descriptorShape(swapped)).assertTrue();
      expect(descriptorAllowed(swapped)).assertFalse();
      expect(textFingerprint(swapped) === textFingerprint(DESCRIPTOR_LITERAL)).assertFalse();
      expect(textFingerprint(swapped)).assertEqual(textFingerprint('IPCStubTset'));
      expect(descriptorDecision(swapped)).assertEqual('not-allowlisted');
      expect(swapped.substring(0, 7)).assertEqual('IPCStub');
    });

    /**
     * @tc.name          descriptorSecurityAllowlistCheckIsPure
     * @tc.desc          Repeated descriptor decisions produce the same counts.
     * @tc.precondition  The allowlist oracle is pure.
     * @tc.steps         1. Evaluate the literal six times. 2. Evaluate a mutant six times.
     *                   3. Compare the allow and deny counts.
     * @tc.expected      Six allows and six denials with no state drift.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecurityAllowlistCheckIsPure', 0, () => {
      logStep('descriptorSecurity', 'pure allowlist');
      let allowed = 0;
      let denied = 0;
      for (let index = 0; index < 6; index++) {
        if (descriptorAllowed(DESCRIPTOR_LITERAL)) {
          allowed = allowed + 1;
        }
        if (!descriptorAllowed('Mutant')) {
          denied = denied + 1;
        }
      }
      expect(allowed).assertEqual(6);
      expect(denied).assertEqual(6);
      expect(allowed + denied).assertEqual(12);
      expect(allowed - denied).assertEqual(0);
      expect(descriptorDecision(DESCRIPTOR_LITERAL)).assertEqual('allow');
      expect(descriptorDecision('Mutant')).assertEqual('not-allowlisted');
      expect(descriptorShape('Mutant')).assertTrue();
    });

    /**
     * @tc.name          descriptorSecurityDefaultStubsShareLiteral
     * @tc.desc          Two default stubs are distinct objects with equal descriptors.
     * @tc.precondition  The RemoteStubModel default constructor is used.
     * @tc.steps         1. Build two stubs. 2. Compare descriptors. 3. Compare object
     *                   identity and fingerprints.
     * @tc.expected      The values are equal while the objects are distinct.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecurityDefaultStubsShareLiteral', 0, () => {
      logStep('descriptorSecurity', 'default stubs share literal');
      const first = new RemoteStubModel();
      const second = new RemoteStubModel();
      expect(first === second).assertFalse();
      expect(first.descriptor).assertEqual(second.descriptor);
      expect(first.descriptor === second.descriptor).assertTrue();
      expect(textFingerprint(first.descriptor)).assertEqual(textFingerprint(second.descriptor));
      expect(first.descriptor).assertEqual(DESCRIPTOR_LITERAL);
      expect(first.alive).assertTrue();
      expect(second.alive).assertTrue();
      expect(descriptorAllowed(first.descriptor) && descriptorAllowed(second.descriptor)).assertTrue();
    });

    /**
     * @tc.name          descriptorSecurityDescriptorAfterSendIsStable
     * @tc.desc          Serving requests does not alter the descriptor.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send twice. 2. Read the descriptor. 3. Compare it to the
     *                   literal.
     * @tc.expected      The descriptor remains the allowlisted literal.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecurityDescriptorAfterSendIsStable', 0, () => {
      logStep('descriptorSecurity', 'descriptor after send');
      const client = createConnectedSession();
      client.sendString('one');
      client.sendString('two');
      expect(client.proxy?.descriptor).assertEqual(DESCRIPTOR_LITERAL);
      expect(descriptorAllowed(client.proxy?.descriptor as string)).assertTrue();
      expect(client.proxy?.sendCalls).assertEqual(2);
      expect(client.proxy?.stub.descriptor).assertEqual(DESCRIPTOR_LITERAL);
      expect(client.events.countOf('send-ok')).assertEqual(2);
      expect(client.events.size()).assertEqual(5);
      expect(client.proxy?.isAlive()).assertTrue();
    });

    /**
     * @tc.name          descriptorSecurityDigitSuffixIsDenied
     * @tc.desc          A trailing digit is a different descriptor.
     * @tc.precondition  The allowlist oracle is exact.
     * @tc.steps         1. Append nine. 2. Check the shape. 3. Read the verdict.
     * @tc.expected      The suffixed descriptor is shaped well but denied.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecurityDigitSuffixIsDenied', 0, () => {
      logStep('descriptorSecurity', 'digit suffix');
      const suffixed = DESCRIPTOR_LITERAL + '9';
      expect(suffixed.length).assertEqual(12);
      expect(descriptorShape(suffixed)).assertTrue();
      expect(descriptorAllowed(suffixed)).assertFalse();
      expect(descriptorDecision(suffixed)).assertEqual('not-allowlisted');
      expect(suffixed.endsWith('9')).assertTrue();
      expect(suffixed.substring(0, 11)).assertEqual(DESCRIPTOR_LITERAL);
      expect(textFingerprint(suffixed) === textFingerprint(DESCRIPTOR_LITERAL)).assertFalse();
      expect(suffixed.indexOf(' ')).assertEqual(-1);
    });

    /**
     * @tc.name          descriptorSecurityRepeatedLettersAreDenied
     * @tc.desc          Repeating the prefix letters is not the allowlisted name.
     * @tc.precondition  The allowlist oracle is exact.
     * @tc.steps         1. Build IIPPCC. 2. Check the shape. 3. Read the verdict.
     * @tc.expected      The repeated prefix is shaped well but denied.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('descriptorSecurityRepeatedLettersAreDenied', 0, () => {
      logStep('descriptorSecurity', 'repeated letters');
      const repeated = 'IIPPCC';
      expect(repeated.length).assertEqual(6);
      expect(descriptorShape(repeated)).assertTrue();
      expect(descriptorAllowed(repeated)).assertFalse();
      expect(descriptorDecision(repeated)).assertEqual('not-allowlisted');
      expect(repeated.startsWith('II')).assertTrue();
      expect(repeated.endsWith('CC')).assertTrue();
      expect(countOf(repeated.split(''), 'I')).assertEqual(2);
      expect(uniqueStrings(repeated.split('')).length).assertEqual(3);
    });

    /**
     * @tc.name          descriptorSecurityDecisionLadderOrder
     * @tc.desc          Empty is checked before shape and allowlist.
     * @tc.precondition  The decision helper is defined.
     * @tc.steps         1. Decide the empty string. 2. Decide a bad shape. 3. Decide an
     *                   unknown word.
     * @tc.expected      The ladder returns empty, bad-chars then not-allowlisted.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('descriptorSecurityDecisionLadderOrder', 0, () => {
      logStep('descriptorSecurity', 'decision ladder');
      expect(descriptorDecision('')).assertEqual('empty');
      expect(descriptorDecision('bad shape')).assertEqual('bad-chars');
      expect(descriptorDecision('UnknownName')).assertEqual('not-allowlisted');
      expect(descriptorDecision(DESCRIPTOR_LITERAL)).assertEqual('allow');
      expect(descriptorDecision('').length < descriptorDecision('bad shape').length).assertTrue();
      expect(descriptorDecision('bad shape') === descriptorDecision('other bad')).assertTrue();
      expect(uniqueStrings([descriptorDecision(''), descriptorDecision('bad shape'),
        descriptorDecision('UnknownName'), descriptorDecision(DESCRIPTOR_LITERAL)]).length).assertEqual(4);
    });

    /**
     * @tc.name          descriptorSecurityWhitespaceVariantsAreDenied
     * @tc.desc          Leading or trailing spaces are not allowlisted.
     * @tc.precondition  The allowlist oracle is exact.
     * @tc.steps         1. Prefix a space. 2. Suffix a space. 3. Read both verdicts.
     * @tc.expected      Both variants are reported as bad-chars.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecurityWhitespaceVariantsAreDenied', 0, () => {
      logStep('descriptorSecurity', 'whitespace variants');
      const leading = ' ' + DESCRIPTOR_LITERAL;
      const trailing = DESCRIPTOR_LITERAL + ' ';
      expect(leading.length).assertEqual(12);
      expect(trailing.length).assertEqual(12);
      expect(descriptorShape(leading)).assertFalse();
      expect(descriptorShape(trailing)).assertFalse();
      expect(descriptorDecision(leading)).assertEqual('bad-chars');
      expect(descriptorDecision(trailing)).assertEqual('bad-chars');
      expect(descriptorAllowed(leading)).assertFalse();
      expect(descriptorAllowed(trailing)).assertFalse();
    });

    /**
     * @tc.name          descriptorSecuritySecondRecipientOverridesPointer
     * @tc.desc          Registering a second recipient replaces the proxy pointer.
     * @tc.precondition  A live proxy and two recipients exist.
     * @tc.steps         1. Register the first. 2. Register the second. 3. Inspect the pointer
     *                   and both flags.
     * @tc.expected      The proxy points at the second recipient.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('descriptorSecuritySecondRecipientOverridesPointer', 0, () => {
      logStep('descriptorSecurity', 'second recipient');
      const proxy = new RemoteProxyModel(new RemoteStubModel());
      const first = new DeathRecipientModel();
      const second = new DeathRecipientModel();
      expect(proxy.registerDeathRecipient(first)).assertTrue();
      expect(proxy.registerDeathRecipient(second)).assertTrue();
      expect(proxy.deathRecipient === second).assertTrue();
      expect(proxy.deathRecipient === first).assertFalse();
      expect(first.registered).assertTrue();
      expect(second.registered).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      proxy.notifyDeath();
      expect(first.diedCount).assertEqual(0);
      expect(second.diedCount).assertEqual(1);
      expect(second.describe()).assertEqual('1/true');
    });

    /**
     * @tc.name          descriptorSecurityUnregisterOverriddenFirstFails
     * @tc.desc          The overridden recipient can no longer be unregistered.
     * @tc.precondition  Two recipients were registered in order on one proxy.
     * @tc.steps         1. Unregister the first. 2. Unregister the second. 3. Inspect the
     *                   proxy flags.
     * @tc.expected      The first unregister fails and the second succeeds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('descriptorSecurityUnregisterOverriddenFirstFails', 0, () => {
      logStep('descriptorSecurity', 'unregister overridden first');
      const proxy = new RemoteProxyModel(new RemoteStubModel());
      const first = new DeathRecipientModel();
      const second = new DeathRecipientModel();
      proxy.registerDeathRecipient(first);
      proxy.registerDeathRecipient(second);
      expect(proxy.unregisterDeathRecipient(first)).assertFalse();
      expect(first.registered).assertTrue();
      expect(proxy.deathRegistered).assertTrue();
      expect(proxy.unregisterDeathRecipient(second)).assertTrue();
      expect(second.registered).assertFalse();
      expect(proxy.deathRegistered).assertFalse();
      expect(proxy.deathRecipient === undefined).assertTrue();
      expect(first.registered).assertTrue();
    });

    /**
     * @tc.name          descriptorSecurityTwoDeathsDescribeIsTwo
     * @tc.desc          Two death callbacks show two in the description.
     * @tc.precondition  A registered proxy exists.
     * @tc.steps         1. Notify twice. 2. Read the description. 3. Compare the counter.
     * @tc.expected      The description is 2/true with a counter of two.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecurityTwoDeathsDescribeIsTwo', 0, () => {
      logStep('descriptorSecurity', 'two deaths describe');
      const proxy = new RemoteProxyModel(new RemoteStubModel());
      const recipient = new DeathRecipientModel();
      proxy.registerDeathRecipient(recipient);
      proxy.notifyDeath();
      proxy.notifyDeath();
      expect(recipient.diedCount).assertEqual(2);
      expect(recipient.registered).assertTrue();
      expect(recipient.describe()).assertEqual('2/true');
      expect(recipient.describe().startsWith('2/')).assertTrue();
      expect(recipient.describe().endsWith('/true')).assertTrue();
      expect(proxy.isAlive()).assertFalse();
      expect(proxy.deathRegistered).assertTrue();
      expect(recipient.describe().length).assertEqual(6);
    });

    /**
     * @tc.name          descriptorSecurityFingerprintIsPositive
     * @tc.desc          Descriptor fingerprints are positive for all candidates.
     * @tc.precondition  Several candidate descriptors exist.
     * @tc.steps         1. Fingerprint six values. 2. Check each is positive. 3. Compare the
     *                   unique count.
     * @tc.expected      Every fingerprint is positive and nonzero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('descriptorSecurityFingerprintIsPositive', 0, () => {
      logStep('descriptorSecurity', 'positive fingerprints');
      const values: string[] = [DESCRIPTOR_LITERAL, 'IPCStub', 'StubTest', 'IPCStubTest2', 'x', 'IPC_Stub'];
      const prints: number[] = [];
      for (let index = 0; index < values.length; index++) {
        prints.push(textFingerprint(values[index]));
        expect(prints[index] > 0).assertTrue();
      }
      expect(prints.length).assertEqual(6);
      expect(uniqueStrings(['1', '2', '3', '4', '5', '6']).length).assertEqual(6);
      expect(prints[0] === prints[1]).assertFalse();
      expect(prints[0] === prints[0]).assertTrue();
      expect(textFingerprint(DESCRIPTOR_LITERAL)).assertEqual(prints[0]);
      expect(prints[5] > 0).assertTrue();
    });

    /**
     * @tc.name          descriptorSecurityDescriptorStartsWithIpcPrefix
     * @tc.desc          The allowlisted descriptor begins with the IPC prefix.
     * @tc.precondition  STUB_DESCRIPTOR is exported.
     * @tc.steps         1. Read the prefix. 2. Compare the remaining tail. 3. Check the length.
     * @tc.expected      The descriptor is IPC plus StubTest.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecurityDescriptorStartsWithIpcPrefix', 0, () => {
      logStep('descriptorSecurity', 'ipc prefix');
      expect(STUB_DESCRIPTOR.startsWith('IPC')).assertTrue();
      expect(STUB_DESCRIPTOR.substring(0, 3)).assertEqual('IPC');
      expect(STUB_DESCRIPTOR.substring(3)).assertEqual('StubTest');
      expect(STUB_DESCRIPTOR.length).assertEqual(3 + 'StubTest'.length);
      expect(STUB_DESCRIPTOR.indexOf('IPC')).assertEqual(0);
      expect(STUB_DESCRIPTOR.indexOf('Stub')).assertEqual(3);
      expect(descriptorAllowed(STUB_DESCRIPTOR)).assertTrue();
      expect(descriptorShape(STUB_DESCRIPTOR)).assertTrue();
    });

    /**
     * @tc.name          descriptorSecurityProxyDefaultDescriptor
     * @tc.desc          A default proxy reports the allowlisted descriptor.
     * @tc.precondition  A default proxy is constructed.
     * @tc.steps         1. Read the descriptor. 2. Compare it to the stub. 3. Check the allowlist.
     * @tc.expected      The proxy and stub descriptors are both IPCStubTest.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('descriptorSecurityProxyDefaultDescriptor', 0, () => {
      logStep('descriptorSecurity', 'proxy default');
      const proxy = new RemoteProxyModel();
      expect(proxy.descriptor).assertEqual(DESCRIPTOR_LITERAL);
      expect(proxy.descriptor).assertEqual(proxy.stub.descriptor);
      expect(descriptorAllowed(proxy.descriptor)).assertTrue();
      expect(proxy.deathRegistered).assertFalse();
      expect(proxy.deathRecipient === undefined).assertTrue();
      expect(proxy.sendCalls).assertEqual(0);
      expect(proxy.requests.length).assertEqual(0);
      expect(proxy.isAlive()).assertTrue();
    });

    /**
     * @tc.name          descriptorSecurityTwoProxyDescriptorsAgree
     * @tc.desc          Two default proxies agree on the descriptor value.
     * @tc.precondition  Two default proxies exist.
     * @tc.steps         1. Compare the descriptors. 2. Compare the fingerprints. 3. Compare the
     *                   object identities.
     * @tc.expected      The values agree while the proxies differ.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecurityTwoProxyDescriptorsAgree', 0, () => {
      logStep('descriptorSecurity', 'two proxies agree');
      const first = new RemoteProxyModel();
      const second = new RemoteProxyModel();
      expect(first.descriptor).assertEqual(second.descriptor);
      expect(first.descriptor === second.descriptor).assertTrue();
      expect(textFingerprint(first.descriptor)).assertEqual(textFingerprint(second.descriptor));
      expect(first === second).assertFalse();
      expect(first.stub === second.stub).assertFalse();
      expect(first.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(second.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(descriptorAllowed(first.descriptor) && descriptorAllowed(second.descriptor)).assertTrue();
    });

    /**
     * @tc.name          descriptorSecurityDeathAfterUnregisterStaysZero
     * @tc.desc          A death after unregistration does not increment the counter.
     * @tc.precondition  A registered proxy had its recipient removed.
     * @tc.steps         1. Unregister. 2. Notify death. 3. Read the counter.
     * @tc.expected      The counter stays zero and the proxy dies.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecurityDeathAfterUnregisterStaysZero', 0, () => {
      logStep('descriptorSecurity', 'death after unregister zero');
      const proxy = new RemoteProxyModel(new RemoteStubModel());
      const recipient = new DeathRecipientModel();
      proxy.registerDeathRecipient(recipient);
      proxy.unregisterDeathRecipient(recipient);
      proxy.notifyDeath();
      expect(recipient.diedCount).assertEqual(0);
      expect(recipient.registered).assertFalse();
      expect(proxy.isAlive()).assertFalse();
      expect(proxy.deathRegistered).assertFalse();
      expect(recipient.describe()).assertEqual('0/false');
      expect(proxy.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(descriptorAllowed(proxy.descriptor)).assertTrue();
    });

    /**
     * @tc.name          descriptorSecuritySpacedPrefixIsRejected
     * @tc.desc          A spaced prefix breaks the shape check.
     * @tc.precondition  The shape helper rejects spaces.
     * @tc.steps         1. Insert a space after IPC. 2. Check the shape. 3. Read the verdict.
     * @tc.expected      The spaced prefix is reported as bad-chars.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecuritySpacedPrefixIsRejected', 0, () => {
      logStep('descriptorSecurity', 'spaced prefix');
      const spaced = 'IPC StubTest';
      expect(spaced.length).assertEqual(12);
      expect(spaced.indexOf(' ')).assertEqual(3);
      expect(descriptorShape(spaced)).assertFalse();
      expect(descriptorDecision(spaced)).assertEqual('bad-chars');
      expect(descriptorAllowed(spaced)).assertFalse();
      expect(spaced.startsWith('IPC')).assertTrue();
      expect(spaced.endsWith('StubTest')).assertTrue();
      expect(spaced.substring(4)).assertEqual('StubTest');
    });

    /**
     * @tc.name          descriptorSecurityEmptyVersusSpaceDecision
     * @tc.desc          The empty string and one space take different ladder steps.
     * @tc.precondition  The decision helper is defined.
     * @tc.steps         1. Decide the empty string. 2. Decide one space. 3. Compare the results.
     * @tc.expected      The empty string is empty and the space is bad-chars.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('descriptorSecurityEmptyVersusSpaceDecision', 0, () => {
      logStep('descriptorSecurity', 'empty versus space');
      expect(descriptorDecision('')).assertEqual('empty');
      expect(descriptorDecision(' ')).assertEqual('bad-chars');
      expect(descriptorDecision('') === descriptorDecision(' ')).assertFalse();
      expect(descriptorShape('')).assertFalse();
      expect(descriptorShape(' ')).assertFalse();
      expect(''.length).assertEqual(0);
      expect(' '.length).assertEqual(1);
      expect(uniqueStrings([descriptorDecision(''), descriptorDecision(' ')]).length).assertEqual(2);
    });

    /**
     * @tc.name          descriptorSecurityDashVariantsAreDenied
     * @tc.desc          Dash separated variants fail the shape check.
     * @tc.precondition  The shape helper allows only word characters.
     * @tc.steps         1. Check IPC-Stub. 2. Check Stub-Test. 3. Compare both decisions.
     * @tc.expected      Both dash variants are reported as bad-chars.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecurityDashVariantsAreDenied', 0, () => {
      logStep('descriptorSecurity', 'dash variants');
      const first = 'IPC-Stub';
      const second = 'Stub-Test';
      expect(descriptorShape(first)).assertFalse();
      expect(descriptorShape(second)).assertFalse();
      expect(descriptorDecision(first)).assertEqual('bad-chars');
      expect(descriptorDecision(second)).assertEqual('bad-chars');
      expect(first.indexOf('-')).assertEqual(3);
      expect(second.indexOf('-')).assertEqual(4);
      expect(descriptorAllowed(first)).assertFalse();
      expect(descriptorAllowed(second)).assertFalse();
    });

    /**
     * @tc.name          descriptorSecurityEventFingerprintVariesWithDescriptor
     * @tc.desc          A custom descriptor changes the connect event fingerprint.
     * @tc.precondition  Two clients connect with different descriptors.
     * @tc.steps         1. Connect with the default stub. 2. Connect with a custom stub. 3.
     *                   Compare the event fingerprint.
     * @tc.expected      The fingerprints differ while both sessions connect.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('descriptorSecurityEventFingerprintVariesWithDescriptor', 0, () => {
      logStep('descriptorSecurity', 'event fingerprint varies');
      const standard = createConnectedSession();
      const custom = new ConnectionModel();
      custom.connect(7);
      custom.onConnect(new RemoteProxyModel(new RemoteStubModel('CustomStub')));
      expect(standard.state).assertEqual(custom.state);
      expect(standard.connectId).assertEqual(custom.connectId);
      expect(standard.events.fingerprint() === custom.events.fingerprint()).assertFalse();
      expect(custom.events.last()).assertEqual('connected:CustomStub');
      expect(standard.events.last()).assertEqual('connected:IPCStubTest');
      expect(descriptorAllowed('CustomStub')).assertFalse();
      expect(descriptorAllowed(STUB_DESCRIPTOR)).assertTrue();
      expect(standard.events.size()).assertEqual(custom.events.size());
    });

    /**
     * @tc.name          descriptorSecurityRepeatedUnregisterIsSafe
     * @tc.desc          A second unregister on the same recipient is refused.
     * @tc.precondition  A registered proxy was unregistered once.
     * @tc.steps         1. Unregister. 2. Unregister again. 3. Compare both results.
     * @tc.expected      The first succeeds and the second returns false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecurityRepeatedUnregisterIsSafe', 0, () => {
      logStep('descriptorSecurity', 'repeated unregister');
      const proxy = new RemoteProxyModel(new RemoteStubModel());
      const recipient = new DeathRecipientModel();
      proxy.registerDeathRecipient(recipient);
      expect(proxy.unregisterDeathRecipient(recipient)).assertTrue();
      expect(proxy.unregisterDeathRecipient(recipient)).assertFalse();
      expect(recipient.registered).assertFalse();
      expect(proxy.deathRegistered).assertFalse();
      expect(proxy.deathRecipient === undefined).assertTrue();
      expect(proxy.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(proxy.isAlive()).assertTrue();
      expect(descriptorAllowed(proxy.descriptor)).assertTrue();
      expect(recipient.diedCount).assertEqual(0);
    });

  });
}
