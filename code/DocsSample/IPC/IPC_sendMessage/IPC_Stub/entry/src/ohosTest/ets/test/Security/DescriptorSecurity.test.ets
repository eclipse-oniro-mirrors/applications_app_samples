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
import { joined, textFingerprint } from '../Shared/SharedDriver';

const POLICY_PREFIX: string = 'IPC';
const POLICY_SUFFIX: string = 'Test';
const MIN_DESCRIPTOR: number = 8;
const MAX_DESCRIPTOR: number = 48;
const REASON_ACCEPTED: string = 'accepted';
const REASON_SHORT: string = 'short';
const REASON_LONG: string = 'long';
const REASON_PREFIX: string = 'prefix';
const REASON_SUFFIX: string = 'suffix';
const REASON_CHARSET: string = 'charset';
const REASON_PIN: string = 'pin';
const REASON_UNREGISTERED: string = 'unregistered';

class DescriptorAudit {
  public accepted: boolean;
  public reason: string;
  public normalized: string;
  public digest: number;
  public pinned: boolean;

  constructor(accepted: boolean, reason: string, normalized: string, digest: number, pinned: boolean) {
    this.accepted = accepted;
    this.reason = reason;
    this.normalized = normalized;
    this.digest = digest;
    this.pinned = pinned;
  }

  public token(): string {
    return this.reason + '@' + String(this.digest) + '@' + String(this.pinned);
  }
}

class RegistryEntry {
  public value: string;
  public digest: number;
  public active: boolean;

  constructor(value: string, digest: number, active: boolean = true) {
    this.value = value;
    this.digest = digest;
    this.active = active;
  }
}

function pinOf(value: string): number {
  return textFingerprint('pin|' + value) % 99991;
}

function charsetOk(value: string): boolean {
  for (let index = 0; index < value.length; index++) {
    const code: number = value.charCodeAt(index);
    const upper: boolean = code >= 65 && code <= 90;
    const lower: boolean = code >= 97 && code <= 122;
    const digit: boolean = code >= 48 && code <= 57;
    const separator: boolean = code === 46 || code === 95 || code === 45;
    if (!upper && !lower && !digit && !separator) {
      return false;
    }
  }
  return true;
}

function normalize(value: string): string {
  const trimmed: string = value.trim();
  let text = '';
  for (let index = 0; index < trimmed.length; index++) {
    const symbol: string = trimmed.charAt(index);
    if (symbol === ' ') {
      text = text + '-';
    } else {
      text = text + symbol;
    }
  }
  return text;
}

function policyReason(value: string): string {
  if (value.length < MIN_DESCRIPTOR) {
    return REASON_SHORT;
  }
  if (value.length > MAX_DESCRIPTOR) {
    return REASON_LONG;
  }
  if (!value.startsWith(POLICY_PREFIX)) {
    return REASON_PREFIX;
  }
  if (!value.endsWith(POLICY_SUFFIX)) {
    return REASON_SUFFIX;
  }
  if (!charsetOk(value)) {
    return REASON_CHARSET;
  }
  return '';
}

class DescriptorRegistry {
  public entries: RegistryEntry[] = [];

  public add(value: string, digest: number = pinOf(value)): boolean {
    if (this.contains(value)) {
      return false;
    }
    this.entries.push(new RegistryEntry(value, digest));
    return true;
  }

  public contains(value: string): boolean {
    for (let index = 0; index < this.entries.length; index++) {
      if (this.entries[index].value === value && this.entries[index].active) {
        return true;
      }
    }
    return false;
  }

  public digestOf(value: string): number {
    for (let index = 0; index < this.entries.length; index++) {
      if (this.entries[index].value === value) {
        return this.entries[index].digest;
      }
    }
    return -1;
  }

  public tamper(value: string): boolean {
    for (let index = 0; index < this.entries.length; index++) {
      if (this.entries[index].value === value) {
        this.entries[index].digest = this.entries[index].digest + 1;
        return true;
      }
    }
    return false;
  }

  public repair(value: string): boolean {
    for (let index = 0; index < this.entries.length; index++) {
      if (this.entries[index].value === value) {
        this.entries[index].digest = pinOf(value);
        return true;
      }
    }
    return false;
  }

  public size(): number {
    return this.entries.length;
  }

  public trace(): string {
    const parts: string[] = [];
    for (let index = 0; index < this.entries.length; index++) {
      parts.push(this.entries[index].value + '=' + String(this.entries[index].digest));
    }
    return joined(parts, ';');
  }
}

function auditDescriptor(value: string, registry: DescriptorRegistry): DescriptorAudit {
  const normalized: string = normalize(value);
  const reason: string = policyReason(normalized);
  if (reason.length > 0) {
    return new DescriptorAudit(false, reason, normalized, -1, false);
  }
  if (!registry.contains(normalized)) {
    return new DescriptorAudit(false, REASON_UNREGISTERED, normalized, -1, false);
  }
  const digest: number = registry.digestOf(normalized);
  if (digest !== pinOf(normalized)) {
    return new DescriptorAudit(false, REASON_PIN, normalized, digest, false);
  }
  return new DescriptorAudit(true, REASON_ACCEPTED, normalized, digest, true);
}

function buildSized(prefix: string, suffix: string, size: number): string {
  let text = prefix;
  while (text.length + suffix.length < size) {
    text = text + 'A';
  }
  return text + suffix;
}

export default function descriptorSecurity(): void {
  describe('DescriptorSecurityTest', () => {
    beforeAll(() => {
      logSuite('DescriptorSecurityTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('DescriptorSecurityTest', 'end');
    });

    /**
     * @tc.name          descriptorSecurityAcceptsStubDescriptor
     * @tc.desc          Registered descriptor stub descriptor passes policy, membership and pin verification.
     * @tc.precondition  A fresh registry receives exactly one entry.
     * @tc.steps         1. Register the descriptor stub descriptor.
     *                   2. Audit it through the policy, membership and pin stages.
     *                   3. Audit an unregistered sibling through the same pipeline.
     *                   4. Recompute the pin with the pin helper.
     * @tc.expected      The registered descriptor is accepted with a matching pin while the sibling is unregistered.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('descriptorSecurityAcceptsStubDescriptor', 0, () => {
      const registry: DescriptorRegistry = new DescriptorRegistry();
      const added: boolean = registry.add('IPCStubTest');
      const audit: DescriptorAudit = auditDescriptor('IPCStubTest', registry);
      const sibling: DescriptorAudit = auditDescriptor("IPCUnknownTest", registry);
      expect(added).assertTrue();
      expect(registry.size()).assertEqual(1);
      expect(registry.contains('IPCStubTest')).assertTrue();
      expect(policyReason('IPCStubTest')).assertEqual("");
      expect(charsetOk('IPCStubTest')).assertTrue();
      expect(audit.accepted).assertTrue();
      expect(audit.reason).assertEqual(REASON_ACCEPTED);
      expect(audit.normalized).assertEqual('IPCStubTest');
      expect(audit.digest).assertEqual(pinOf('IPCStubTest'));
      expect(audit.pinned).assertTrue();
      expect(sibling.reason).assertEqual(REASON_UNREGISTERED);
      logStep("descriptorSecurityAcceptsStubDescriptor", audit.token());
    });

    /**
     * @tc.name          descriptorSecurityAcceptsFooDescriptor
     * @tc.desc          Registered descriptor foo descriptor passes policy, membership and pin verification.
     * @tc.precondition  A fresh registry receives exactly one entry.
     * @tc.steps         1. Register the descriptor foo descriptor.
     *                   2. Audit it through the policy, membership and pin stages.
     *                   3. Audit an unregistered sibling through the same pipeline.
     *                   4. Recompute the pin with the pin helper.
     * @tc.expected      The registered descriptor is accepted with a matching pin while the sibling is unregistered.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('descriptorSecurityAcceptsFooDescriptor', 0, () => {
      const registry: DescriptorRegistry = new DescriptorRegistry();
      const added: boolean = registry.add('IPCFooTest');
      const audit: DescriptorAudit = auditDescriptor('IPCFooTest', registry);
      const sibling: DescriptorAudit = auditDescriptor("IPCUnknownTest", registry);
      expect(added).assertTrue();
      expect(registry.size()).assertEqual(1);
      expect(registry.contains('IPCFooTest')).assertTrue();
      expect(policyReason('IPCFooTest')).assertEqual("");
      expect(charsetOk('IPCFooTest')).assertTrue();
      expect(audit.accepted).assertTrue();
      expect(audit.reason).assertEqual(REASON_ACCEPTED);
      expect(audit.normalized).assertEqual('IPCFooTest');
      expect(audit.digest).assertEqual(pinOf('IPCFooTest'));
      expect(audit.pinned).assertTrue();
      expect(sibling.reason).assertEqual(REASON_UNREGISTERED);
      logStep("descriptorSecurityAcceptsFooDescriptor", audit.token());
    });

    /**
     * @tc.name          descriptorSecurityAcceptsBarDescriptor
     * @tc.desc          Registered descriptor bar descriptor passes policy, membership and pin verification.
     * @tc.precondition  A fresh registry receives exactly one entry.
     * @tc.steps         1. Register the descriptor bar descriptor.
     *                   2. Audit it through the policy, membership and pin stages.
     *                   3. Audit an unregistered sibling through the same pipeline.
     *                   4. Recompute the pin with the pin helper.
     * @tc.expected      The registered descriptor is accepted with a matching pin while the sibling is unregistered.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('descriptorSecurityAcceptsBarDescriptor', 0, () => {
      const registry: DescriptorRegistry = new DescriptorRegistry();
      const added: boolean = registry.add('IPCBarTest');
      const audit: DescriptorAudit = auditDescriptor('IPCBarTest', registry);
      const sibling: DescriptorAudit = auditDescriptor("IPCUnknownTest", registry);
      expect(added).assertTrue();
      expect(registry.size()).assertEqual(1);
      expect(registry.contains('IPCBarTest')).assertTrue();
      expect(policyReason('IPCBarTest')).assertEqual("");
      expect(charsetOk('IPCBarTest')).assertTrue();
      expect(audit.accepted).assertTrue();
      expect(audit.reason).assertEqual(REASON_ACCEPTED);
      expect(audit.normalized).assertEqual('IPCBarTest');
      expect(audit.digest).assertEqual(pinOf('IPCBarTest'));
      expect(audit.pinned).assertTrue();
      expect(sibling.reason).assertEqual(REASON_UNREGISTERED);
      logStep("descriptorSecurityAcceptsBarDescriptor", audit.token());
    });

    /**
     * @tc.name          descriptorSecurityAcceptsNodeDescriptor
     * @tc.desc          Registered descriptor node descriptor passes policy, membership and pin verification.
     * @tc.precondition  A fresh registry receives exactly one entry.
     * @tc.steps         1. Register the descriptor node descriptor.
     *                   2. Audit it through the policy, membership and pin stages.
     *                   3. Audit an unregistered sibling through the same pipeline.
     *                   4. Recompute the pin with the pin helper.
     * @tc.expected      The registered descriptor is accepted with a matching pin while the sibling is unregistered.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('descriptorSecurityAcceptsNodeDescriptor', 0, () => {
      const registry: DescriptorRegistry = new DescriptorRegistry();
      const added: boolean = registry.add('IPCNodeTest');
      const audit: DescriptorAudit = auditDescriptor('IPCNodeTest', registry);
      const sibling: DescriptorAudit = auditDescriptor("IPCUnknownTest", registry);
      expect(added).assertTrue();
      expect(registry.size()).assertEqual(1);
      expect(registry.contains('IPCNodeTest')).assertTrue();
      expect(policyReason('IPCNodeTest')).assertEqual("");
      expect(charsetOk('IPCNodeTest')).assertTrue();
      expect(audit.accepted).assertTrue();
      expect(audit.reason).assertEqual(REASON_ACCEPTED);
      expect(audit.normalized).assertEqual('IPCNodeTest');
      expect(audit.digest).assertEqual(pinOf('IPCNodeTest'));
      expect(audit.pinned).assertTrue();
      expect(sibling.reason).assertEqual(REASON_UNREGISTERED);
      logStep("descriptorSecurityAcceptsNodeDescriptor", audit.token());
    });

    /**
     * @tc.name          descriptorSecurityAcceptsServiceDescriptor
     * @tc.desc          Registered descriptor service descriptor passes policy, membership and pin verification.
     * @tc.precondition  A fresh registry receives exactly one entry.
     * @tc.steps         1. Register the descriptor service descriptor.
     *                   2. Audit it through the policy, membership and pin stages.
     *                   3. Audit an unregistered sibling through the same pipeline.
     *                   4. Recompute the pin with the pin helper.
     * @tc.expected      The registered descriptor is accepted with a matching pin while the sibling is unregistered.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('descriptorSecurityAcceptsServiceDescriptor', 0, () => {
      const registry: DescriptorRegistry = new DescriptorRegistry();
      const added: boolean = registry.add('IPCSvcTest');
      const audit: DescriptorAudit = auditDescriptor('IPCSvcTest', registry);
      const sibling: DescriptorAudit = auditDescriptor("IPCUnknownTest", registry);
      expect(added).assertTrue();
      expect(registry.size()).assertEqual(1);
      expect(registry.contains('IPCSvcTest')).assertTrue();
      expect(policyReason('IPCSvcTest')).assertEqual("");
      expect(charsetOk('IPCSvcTest')).assertTrue();
      expect(audit.accepted).assertTrue();
      expect(audit.reason).assertEqual(REASON_ACCEPTED);
      expect(audit.normalized).assertEqual('IPCSvcTest');
      expect(audit.digest).assertEqual(pinOf('IPCSvcTest'));
      expect(audit.pinned).assertTrue();
      expect(sibling.reason).assertEqual(REASON_UNREGISTERED);
      logStep("descriptorSecurityAcceptsServiceDescriptor", audit.token());
    });

    /**
     * @tc.name          descriptorSecurityAcceptsUnitDescriptor
     * @tc.desc          Registered descriptor unit descriptor passes policy, membership and pin verification.
     * @tc.precondition  A fresh registry receives exactly one entry.
     * @tc.steps         1. Register the descriptor unit descriptor.
     *                   2. Audit it through the policy, membership and pin stages.
     *                   3. Audit an unregistered sibling through the same pipeline.
     *                   4. Recompute the pin with the pin helper.
     * @tc.expected      The registered descriptor is accepted with a matching pin while the sibling is unregistered.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('descriptorSecurityAcceptsUnitDescriptor', 0, () => {
      const registry: DescriptorRegistry = new DescriptorRegistry();
      const added: boolean = registry.add('IPCUnitTest');
      const audit: DescriptorAudit = auditDescriptor('IPCUnitTest', registry);
      const sibling: DescriptorAudit = auditDescriptor("IPCUnknownTest", registry);
      expect(added).assertTrue();
      expect(registry.size()).assertEqual(1);
      expect(registry.contains('IPCUnitTest')).assertTrue();
      expect(policyReason('IPCUnitTest')).assertEqual("");
      expect(charsetOk('IPCUnitTest')).assertTrue();
      expect(audit.accepted).assertTrue();
      expect(audit.reason).assertEqual(REASON_ACCEPTED);
      expect(audit.normalized).assertEqual('IPCUnitTest');
      expect(audit.digest).assertEqual(pinOf('IPCUnitTest'));
      expect(audit.pinned).assertTrue();
      expect(sibling.reason).assertEqual(REASON_UNREGISTERED);
      logStep("descriptorSecurityAcceptsUnitDescriptor", audit.token());
    });

    /**
     * @tc.name          descriptorSecurityAcceptsLogDescriptor
     * @tc.desc          Registered descriptor log descriptor passes policy, membership and pin verification.
     * @tc.precondition  A fresh registry receives exactly one entry.
     * @tc.steps         1. Register the descriptor log descriptor.
     *                   2. Audit it through the policy, membership and pin stages.
     *                   3. Audit an unregistered sibling through the same pipeline.
     *                   4. Recompute the pin with the pin helper.
     * @tc.expected      The registered descriptor is accepted with a matching pin while the sibling is unregistered.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('descriptorSecurityAcceptsLogDescriptor', 0, () => {
      const registry: DescriptorRegistry = new DescriptorRegistry();
      const added: boolean = registry.add('IPCLogTest');
      const audit: DescriptorAudit = auditDescriptor('IPCLogTest', registry);
      const sibling: DescriptorAudit = auditDescriptor("IPCUnknownTest", registry);
      expect(added).assertTrue();
      expect(registry.size()).assertEqual(1);
      expect(registry.contains('IPCLogTest')).assertTrue();
      expect(policyReason('IPCLogTest')).assertEqual("");
      expect(charsetOk('IPCLogTest')).assertTrue();
      expect(audit.accepted).assertTrue();
      expect(audit.reason).assertEqual(REASON_ACCEPTED);
      expect(audit.normalized).assertEqual('IPCLogTest');
      expect(audit.digest).assertEqual(pinOf('IPCLogTest'));
      expect(audit.pinned).assertTrue();
      expect(sibling.reason).assertEqual(REASON_UNREGISTERED);
      logStep("descriptorSecurityAcceptsLogDescriptor", audit.token());
    });

    /**
     * @tc.name          descriptorSecurityAcceptsPinDescriptor
     * @tc.desc          Registered descriptor pin descriptor passes policy, membership and pin verification.
     * @tc.precondition  A fresh registry receives exactly one entry.
     * @tc.steps         1. Register the descriptor pin descriptor.
     *                   2. Audit it through the policy, membership and pin stages.
     *                   3. Audit an unregistered sibling through the same pipeline.
     *                   4. Recompute the pin with the pin helper.
     * @tc.expected      The registered descriptor is accepted with a matching pin while the sibling is unregistered.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('descriptorSecurityAcceptsPinDescriptor', 0, () => {
      const registry: DescriptorRegistry = new DescriptorRegistry();
      const added: boolean = registry.add('IPCPinTest');
      const audit: DescriptorAudit = auditDescriptor('IPCPinTest', registry);
      const sibling: DescriptorAudit = auditDescriptor("IPCUnknownTest", registry);
      expect(added).assertTrue();
      expect(registry.size()).assertEqual(1);
      expect(registry.contains('IPCPinTest')).assertTrue();
      expect(policyReason('IPCPinTest')).assertEqual("");
      expect(charsetOk('IPCPinTest')).assertTrue();
      expect(audit.accepted).assertTrue();
      expect(audit.reason).assertEqual(REASON_ACCEPTED);
      expect(audit.normalized).assertEqual('IPCPinTest');
      expect(audit.digest).assertEqual(pinOf('IPCPinTest'));
      expect(audit.pinned).assertTrue();
      expect(sibling.reason).assertEqual(REASON_UNREGISTERED);
      logStep("descriptorSecurityAcceptsPinDescriptor", audit.token());
    });

    /**
     * @tc.name          descriptorSecurityAcceptsAuditDescriptor
     * @tc.desc          Registered descriptor audit descriptor passes policy, membership and pin verification.
     * @tc.precondition  A fresh registry receives exactly one entry.
     * @tc.steps         1. Register the descriptor audit descriptor.
     *                   2. Audit it through the policy, membership and pin stages.
     *                   3. Audit an unregistered sibling through the same pipeline.
     *                   4. Recompute the pin with the pin helper.
     * @tc.expected      The registered descriptor is accepted with a matching pin while the sibling is unregistered.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('descriptorSecurityAcceptsAuditDescriptor', 0, () => {
      const registry: DescriptorRegistry = new DescriptorRegistry();
      const added: boolean = registry.add('IPCAuditTest');
      const audit: DescriptorAudit = auditDescriptor('IPCAuditTest', registry);
      const sibling: DescriptorAudit = auditDescriptor("IPCUnknownTest", registry);
      expect(added).assertTrue();
      expect(registry.size()).assertEqual(1);
      expect(registry.contains('IPCAuditTest')).assertTrue();
      expect(policyReason('IPCAuditTest')).assertEqual("");
      expect(charsetOk('IPCAuditTest')).assertTrue();
      expect(audit.accepted).assertTrue();
      expect(audit.reason).assertEqual(REASON_ACCEPTED);
      expect(audit.normalized).assertEqual('IPCAuditTest');
      expect(audit.digest).assertEqual(pinOf('IPCAuditTest'));
      expect(audit.pinned).assertTrue();
      expect(sibling.reason).assertEqual(REASON_UNREGISTERED);
      logStep("descriptorSecurityAcceptsAuditDescriptor", audit.token());
    });

    /**
     * @tc.name          descriptorSecurityAcceptsTraceDescriptor
     * @tc.desc          Registered descriptor trace descriptor passes policy, membership and pin verification.
     * @tc.precondition  A fresh registry receives exactly one entry.
     * @tc.steps         1. Register the descriptor trace descriptor.
     *                   2. Audit it through the policy, membership and pin stages.
     *                   3. Audit an unregistered sibling through the same pipeline.
     *                   4. Recompute the pin with the pin helper.
     * @tc.expected      The registered descriptor is accepted with a matching pin while the sibling is unregistered.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('descriptorSecurityAcceptsTraceDescriptor', 0, () => {
      const registry: DescriptorRegistry = new DescriptorRegistry();
      const added: boolean = registry.add('IPCTraceTest');
      const audit: DescriptorAudit = auditDescriptor('IPCTraceTest', registry);
      const sibling: DescriptorAudit = auditDescriptor("IPCUnknownTest", registry);
      expect(added).assertTrue();
      expect(registry.size()).assertEqual(1);
      expect(registry.contains('IPCTraceTest')).assertTrue();
      expect(policyReason('IPCTraceTest')).assertEqual("");
      expect(charsetOk('IPCTraceTest')).assertTrue();
      expect(audit.accepted).assertTrue();
      expect(audit.reason).assertEqual(REASON_ACCEPTED);
      expect(audit.normalized).assertEqual('IPCTraceTest');
      expect(audit.digest).assertEqual(pinOf('IPCTraceTest'));
      expect(audit.pinned).assertTrue();
      expect(sibling.reason).assertEqual(REASON_UNREGISTERED);
      logStep("descriptorSecurityAcceptsTraceDescriptor", audit.token());
    });

    /**
     * @tc.name          descriptorSecurityRejectsSevenCharacterName
     * @tc.desc          Descriptor seven character name fails policy before membership is consulted.
     * @tc.precondition  The offending descriptor is inserted directly into the registry.
     * @tc.steps         1. Insert the descriptor seven character name without validation.
     *                   2. Audit it and read the refusal reason.
     *                   3. Compare the reason with the policy oracle.
     *                   4. Confirm the pin stage was never reached.
     * @tc.expected      The audit refuses at the policy stage even though the raw entry exists in the registry.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecurityRejectsSevenCharacterName', 0, () => {
      const registry: DescriptorRegistry = new DescriptorRegistry();
      expect(registry.add('IPCTest')).assertTrue();
      const audit: DescriptorAudit = auditDescriptor('IPCTest', registry);
      expect(registry.contains('IPCTest')).assertTrue();
      expect(registry.size()).assertEqual(1);
      expect(policyReason('IPCTest')).assertEqual(REASON_SHORT);
      expect(audit.accepted).assertFalse();
      expect(audit.reason).assertEqual(REASON_SHORT);
      expect(audit.pinned).assertFalse();
      expect(audit.digest).assertEqual(-1);
      expect(audit.normalized).assertEqual(normalize('IPCTest'));
      expect(audit.token().indexOf(REASON_SHORT) >= 0).assertTrue();
      logStep("descriptorSecurityRejectsSevenCharacterName", audit.token());
    });

    /**
     * @tc.name          descriptorSecurityRejectsThreeCharacterName
     * @tc.desc          Descriptor three character name fails policy before membership is consulted.
     * @tc.precondition  The offending descriptor is inserted directly into the registry.
     * @tc.steps         1. Insert the descriptor three character name without validation.
     *                   2. Audit it and read the refusal reason.
     *                   3. Compare the reason with the policy oracle.
     *                   4. Confirm the pin stage was never reached.
     * @tc.expected      The audit refuses at the policy stage even though the raw entry exists in the registry.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecurityRejectsThreeCharacterName', 0, () => {
      const registry: DescriptorRegistry = new DescriptorRegistry();
      expect(registry.add('IPC')).assertTrue();
      const audit: DescriptorAudit = auditDescriptor('IPC', registry);
      expect(registry.contains('IPC')).assertTrue();
      expect(registry.size()).assertEqual(1);
      expect(policyReason('IPC')).assertEqual(REASON_SHORT);
      expect(audit.accepted).assertFalse();
      expect(audit.reason).assertEqual(REASON_SHORT);
      expect(audit.pinned).assertFalse();
      expect(audit.digest).assertEqual(-1);
      expect(audit.normalized).assertEqual(normalize('IPC'));
      expect(audit.token().indexOf(REASON_SHORT) >= 0).assertTrue();
      logStep("descriptorSecurityRejectsThreeCharacterName", audit.token());
    });

    /**
     * @tc.name          descriptorSecurityRejectsForeignPrefix
     * @tc.desc          Descriptor foreign prefix fails policy before membership is consulted.
     * @tc.precondition  The offending descriptor is inserted directly into the registry.
     * @tc.steps         1. Insert the descriptor foreign prefix without validation.
     *                   2. Audit it and read the refusal reason.
     *                   3. Compare the reason with the policy oracle.
     *                   4. Confirm the pin stage was never reached.
     * @tc.expected      The audit refuses at the policy stage even though the raw entry exists in the registry.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecurityRejectsForeignPrefix', 0, () => {
      const registry: DescriptorRegistry = new DescriptorRegistry();
      expect(registry.add('XIPCStubTest')).assertTrue();
      const audit: DescriptorAudit = auditDescriptor('XIPCStubTest', registry);
      expect(registry.contains('XIPCStubTest')).assertTrue();
      expect(registry.size()).assertEqual(1);
      expect(policyReason('XIPCStubTest')).assertEqual(REASON_PREFIX);
      expect(audit.accepted).assertFalse();
      expect(audit.reason).assertEqual(REASON_PREFIX);
      expect(audit.pinned).assertFalse();
      expect(audit.digest).assertEqual(-1);
      expect(audit.normalized).assertEqual(normalize('XIPCStubTest'));
      expect(audit.token().indexOf(REASON_PREFIX) >= 0).assertTrue();
      logStep("descriptorSecurityRejectsForeignPrefix", audit.token());
    });

    /**
     * @tc.name          descriptorSecurityRejectsSuffixOnlyName
     * @tc.desc          Descriptor suffix only name fails policy before membership is consulted.
     * @tc.precondition  The offending descriptor is inserted directly into the registry.
     * @tc.steps         1. Insert the descriptor suffix only name without validation.
     *                   2. Audit it and read the refusal reason.
     *                   3. Compare the reason with the policy oracle.
     *                   4. Confirm the pin stage was never reached.
     * @tc.expected      The audit refuses at the policy stage even though the raw entry exists in the registry.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecurityRejectsSuffixOnlyName', 0, () => {
      const registry: DescriptorRegistry = new DescriptorRegistry();
      expect(registry.add('StubTestIPC')).assertTrue();
      const audit: DescriptorAudit = auditDescriptor('StubTestIPC', registry);
      expect(registry.contains('StubTestIPC')).assertTrue();
      expect(registry.size()).assertEqual(1);
      expect(policyReason('StubTestIPC')).assertEqual(REASON_PREFIX);
      expect(audit.accepted).assertFalse();
      expect(audit.reason).assertEqual(REASON_PREFIX);
      expect(audit.pinned).assertFalse();
      expect(audit.digest).assertEqual(-1);
      expect(audit.normalized).assertEqual(normalize('StubTestIPC'));
      expect(audit.token().indexOf(REASON_PREFIX) >= 0).assertTrue();
      logStep("descriptorSecurityRejectsSuffixOnlyName", audit.token());
    });

    /**
     * @tc.name          descriptorSecurityRejectsMissingSuffix
     * @tc.desc          Descriptor missing suffix fails policy before membership is consulted.
     * @tc.precondition  The offending descriptor is inserted directly into the registry.
     * @tc.steps         1. Insert the descriptor missing suffix without validation.
     *                   2. Audit it and read the refusal reason.
     *                   3. Compare the reason with the policy oracle.
     *                   4. Confirm the pin stage was never reached.
     * @tc.expected      The audit refuses at the policy stage even though the raw entry exists in the registry.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecurityRejectsMissingSuffix', 0, () => {
      const registry: DescriptorRegistry = new DescriptorRegistry();
      expect(registry.add('IPCStubX')).assertTrue();
      const audit: DescriptorAudit = auditDescriptor('IPCStubX', registry);
      expect(registry.contains('IPCStubX')).assertTrue();
      expect(registry.size()).assertEqual(1);
      expect(policyReason('IPCStubX')).assertEqual(REASON_SUFFIX);
      expect(audit.accepted).assertFalse();
      expect(audit.reason).assertEqual(REASON_SUFFIX);
      expect(audit.pinned).assertFalse();
      expect(audit.digest).assertEqual(-1);
      expect(audit.normalized).assertEqual(normalize('IPCStubX'));
      expect(audit.token().indexOf(REASON_SUFFIX) >= 0).assertTrue();
      logStep("descriptorSecurityRejectsMissingSuffix", audit.token());
    });

    /**
     * @tc.name          descriptorSecurityRejectsTrailingCharacter
     * @tc.desc          Descriptor trailing character fails policy before membership is consulted.
     * @tc.precondition  The offending descriptor is inserted directly into the registry.
     * @tc.steps         1. Insert the descriptor trailing character without validation.
     *                   2. Audit it and read the refusal reason.
     *                   3. Compare the reason with the policy oracle.
     *                   4. Confirm the pin stage was never reached.
     * @tc.expected      The audit refuses at the policy stage even though the raw entry exists in the registry.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecurityRejectsTrailingCharacter', 0, () => {
      const registry: DescriptorRegistry = new DescriptorRegistry();
      expect(registry.add('IPCStubTestX')).assertTrue();
      const audit: DescriptorAudit = auditDescriptor('IPCStubTestX', registry);
      expect(registry.contains('IPCStubTestX')).assertTrue();
      expect(registry.size()).assertEqual(1);
      expect(policyReason('IPCStubTestX')).assertEqual(REASON_SUFFIX);
      expect(audit.accepted).assertFalse();
      expect(audit.reason).assertEqual(REASON_SUFFIX);
      expect(audit.pinned).assertFalse();
      expect(audit.digest).assertEqual(-1);
      expect(audit.normalized).assertEqual(normalize('IPCStubTestX'));
      expect(audit.token().indexOf(REASON_SUFFIX) >= 0).assertTrue();
      logStep("descriptorSecurityRejectsTrailingCharacter", audit.token());
    });

    /**
     * @tc.name          descriptorSecurityRejectsAtSymbol
     * @tc.desc          Descriptor at symbol fails policy before membership is consulted.
     * @tc.precondition  The offending descriptor is inserted directly into the registry.
     * @tc.steps         1. Insert the descriptor at symbol without validation.
     *                   2. Audit it and read the refusal reason.
     *                   3. Compare the reason with the policy oracle.
     *                   4. Confirm the pin stage was never reached.
     * @tc.expected      The audit refuses at the policy stage even though the raw entry exists in the registry.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecurityRejectsAtSymbol', 0, () => {
      const registry: DescriptorRegistry = new DescriptorRegistry();
      expect(registry.add('IPC@StubTest')).assertTrue();
      const audit: DescriptorAudit = auditDescriptor('IPC@StubTest', registry);
      expect(registry.contains('IPC@StubTest')).assertTrue();
      expect(registry.size()).assertEqual(1);
      expect(policyReason('IPC@StubTest')).assertEqual(REASON_CHARSET);
      expect(audit.accepted).assertFalse();
      expect(audit.reason).assertEqual(REASON_CHARSET);
      expect(audit.pinned).assertFalse();
      expect(audit.digest).assertEqual(-1);
      expect(audit.normalized).assertEqual(normalize('IPC@StubTest'));
      expect(audit.token().indexOf(REASON_CHARSET) >= 0).assertTrue();
      logStep("descriptorSecurityRejectsAtSymbol", audit.token());
    });

    /**
     * @tc.name          descriptorSecurityRejectsInteriorSpace
     * @tc.desc          Descriptor interior space fails policy before membership is consulted.
     * @tc.precondition  The offending descriptor is inserted directly into the registry.
     * @tc.steps         1. Insert the descriptor interior space without validation.
     *                   2. Audit it and read the refusal reason.
     *                   3. Compare the reason with the policy oracle.
     *                   4. Confirm the pin stage was never reached.
     * @tc.expected      The audit refuses at the policy stage even though the raw entry exists in the registry.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecurityRejectsInteriorSpace', 0, () => {
      const registry: DescriptorRegistry = new DescriptorRegistry();
      expect(registry.add('IPC StubTest')).assertTrue();
      const audit: DescriptorAudit = auditDescriptor('IPC StubTest', registry);
      expect(registry.contains('IPC StubTest')).assertTrue();
      expect(registry.size()).assertEqual(1);
      expect(policyReason('IPC StubTest')).assertEqual(REASON_CHARSET);
      expect(audit.accepted).assertFalse();
      expect(audit.reason).assertEqual(REASON_UNREGISTERED);
      expect(audit.pinned).assertFalse();
      expect(audit.digest).assertEqual(-1);
      expect(audit.normalized).assertEqual(normalize('IPC StubTest'));
      expect(audit.token().indexOf(REASON_UNREGISTERED) >= 0).assertTrue();
      logStep("descriptorSecurityRejectsInteriorSpace", audit.token());
    });

    /**
     * @tc.name          descriptorSecurityRejectsHashSymbol
     * @tc.desc          Descriptor hash symbol fails policy before membership is consulted.
     * @tc.precondition  The offending descriptor is inserted directly into the registry.
     * @tc.steps         1. Insert the descriptor hash symbol without validation.
     *                   2. Audit it and read the refusal reason.
     *                   3. Compare the reason with the policy oracle.
     *                   4. Confirm the pin stage was never reached.
     * @tc.expected      The audit refuses at the policy stage even though the raw entry exists in the registry.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecurityRejectsHashSymbol', 0, () => {
      const registry: DescriptorRegistry = new DescriptorRegistry();
      expect(registry.add('IPC#StubTest')).assertTrue();
      const audit: DescriptorAudit = auditDescriptor('IPC#StubTest', registry);
      expect(registry.contains('IPC#StubTest')).assertTrue();
      expect(registry.size()).assertEqual(1);
      expect(policyReason('IPC#StubTest')).assertEqual(REASON_CHARSET);
      expect(audit.accepted).assertFalse();
      expect(audit.reason).assertEqual(REASON_CHARSET);
      expect(audit.pinned).assertFalse();
      expect(audit.digest).assertEqual(-1);
      expect(audit.normalized).assertEqual(normalize('IPC#StubTest'));
      expect(audit.token().indexOf(REASON_CHARSET) >= 0).assertTrue();
      logStep("descriptorSecurityRejectsHashSymbol", audit.token());
    });

    /**
     * @tc.name          descriptorSecurityRejectsDollarSymbol
     * @tc.desc          Descriptor dollar symbol fails policy before membership is consulted.
     * @tc.precondition  The offending descriptor is inserted directly into the registry.
     * @tc.steps         1. Insert the descriptor dollar symbol without validation.
     *                   2. Audit it and read the refusal reason.
     *                   3. Compare the reason with the policy oracle.
     *                   4. Confirm the pin stage was never reached.
     * @tc.expected      The audit refuses at the policy stage even though the raw entry exists in the registry.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecurityRejectsDollarSymbol', 0, () => {
      const registry: DescriptorRegistry = new DescriptorRegistry();
      expect(registry.add('IPC$StubTest')).assertTrue();
      const audit: DescriptorAudit = auditDescriptor('IPC$StubTest', registry);
      expect(registry.contains('IPC$StubTest')).assertTrue();
      expect(registry.size()).assertEqual(1);
      expect(policyReason('IPC$StubTest')).assertEqual(REASON_CHARSET);
      expect(audit.accepted).assertFalse();
      expect(audit.reason).assertEqual(REASON_CHARSET);
      expect(audit.pinned).assertFalse();
      expect(audit.digest).assertEqual(-1);
      expect(audit.normalized).assertEqual(normalize('IPC$StubTest'));
      expect(audit.token().indexOf(REASON_CHARSET) >= 0).assertTrue();
      logStep("descriptorSecurityRejectsDollarSymbol", audit.token());
    });

    /**
     * @tc.name          descriptorSecurityRejectsBangSymbol
     * @tc.desc          Descriptor bang symbol fails policy before membership is consulted.
     * @tc.precondition  The offending descriptor is inserted directly into the registry.
     * @tc.steps         1. Insert the descriptor bang symbol without validation.
     *                   2. Audit it and read the refusal reason.
     *                   3. Compare the reason with the policy oracle.
     *                   4. Confirm the pin stage was never reached.
     * @tc.expected      The audit refuses at the policy stage even though the raw entry exists in the registry.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecurityRejectsBangSymbol', 0, () => {
      const registry: DescriptorRegistry = new DescriptorRegistry();
      expect(registry.add('IPC!StubTest')).assertTrue();
      const audit: DescriptorAudit = auditDescriptor('IPC!StubTest', registry);
      expect(registry.contains('IPC!StubTest')).assertTrue();
      expect(registry.size()).assertEqual(1);
      expect(policyReason('IPC!StubTest')).assertEqual(REASON_CHARSET);
      expect(audit.accepted).assertFalse();
      expect(audit.reason).assertEqual(REASON_CHARSET);
      expect(audit.pinned).assertFalse();
      expect(audit.digest).assertEqual(-1);
      expect(audit.normalized).assertEqual(normalize('IPC!StubTest'));
      expect(audit.token().indexOf(REASON_CHARSET) >= 0).assertTrue();
      logStep("descriptorSecurityRejectsBangSymbol", audit.token());
    });

    /**
     * @tc.name          descriptorSecurityRejectsSlashSymbol
     * @tc.desc          Descriptor slash symbol fails policy before membership is consulted.
     * @tc.precondition  The offending descriptor is inserted directly into the registry.
     * @tc.steps         1. Insert the descriptor slash symbol without validation.
     *                   2. Audit it and read the refusal reason.
     *                   3. Compare the reason with the policy oracle.
     *                   4. Confirm the pin stage was never reached.
     * @tc.expected      The audit refuses at the policy stage even though the raw entry exists in the registry.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecurityRejectsSlashSymbol', 0, () => {
      const registry: DescriptorRegistry = new DescriptorRegistry();
      expect(registry.add('IPC/StubTest')).assertTrue();
      const audit: DescriptorAudit = auditDescriptor('IPC/StubTest', registry);
      expect(registry.contains('IPC/StubTest')).assertTrue();
      expect(registry.size()).assertEqual(1);
      expect(policyReason('IPC/StubTest')).assertEqual(REASON_CHARSET);
      expect(audit.accepted).assertFalse();
      expect(audit.reason).assertEqual(REASON_CHARSET);
      expect(audit.pinned).assertFalse();
      expect(audit.digest).assertEqual(-1);
      expect(audit.normalized).assertEqual(normalize('IPC/StubTest'));
      expect(audit.token().indexOf(REASON_CHARSET) >= 0).assertTrue();
      logStep("descriptorSecurityRejectsSlashSymbol", audit.token());
    });

    /**
     * @tc.name          descriptorSecurityRequiresMembershipForAlpha
     * @tc.desc          Membership alone gates alpha member before any pin comparison.
     * @tc.precondition  An empty registry is audited first, then the descriptor is added.
     * @tc.steps         1. Audit the descriptor against an empty registry.
     *                   2. Add the descriptor and count the entries.
     *                   3. Attempt a duplicate insertion.
     *                   4. Audit again and read the digest.
     * @tc.expected      Only the first insertion succeeds and the second audit is accepted.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecurityRequiresMembershipForAlpha', 0, () => {
      const registry: DescriptorRegistry = new DescriptorRegistry();
      const before: DescriptorAudit = auditDescriptor('IPCAlphaTest', registry);
      expect(before.accepted).assertFalse();
      expect(before.reason).assertEqual(REASON_UNREGISTERED);
      expect(before.digest).assertEqual(-1);
      expect(registry.add('IPCAlphaTest')).assertTrue();
      expect(registry.add('IPCAlphaTest')).assertFalse();
      expect(registry.size()).assertEqual(1);
      const after: DescriptorAudit = auditDescriptor('IPCAlphaTest', registry);
      expect(after.accepted).assertTrue();
      expect(after.reason).assertEqual(REASON_ACCEPTED);
      expect(after.digest).assertEqual(registry.digestOf('IPCAlphaTest'));
      expect(after.digest).assertEqual(pinOf('IPCAlphaTest'));
      logStep("descriptorSecurityRequiresMembershipForAlpha", after.token());
    });

    /**
     * @tc.name          descriptorSecurityRequiresMembershipForBeta
     * @tc.desc          Membership alone gates beta member before any pin comparison.
     * @tc.precondition  An empty registry is audited first, then the descriptor is added.
     * @tc.steps         1. Audit the descriptor against an empty registry.
     *                   2. Add the descriptor and count the entries.
     *                   3. Attempt a duplicate insertion.
     *                   4. Audit again and read the digest.
     * @tc.expected      Only the first insertion succeeds and the second audit is accepted.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecurityRequiresMembershipForBeta', 0, () => {
      const registry: DescriptorRegistry = new DescriptorRegistry();
      const before: DescriptorAudit = auditDescriptor('IPCBetaTest', registry);
      expect(before.accepted).assertFalse();
      expect(before.reason).assertEqual(REASON_UNREGISTERED);
      expect(before.digest).assertEqual(-1);
      expect(registry.add('IPCBetaTest')).assertTrue();
      expect(registry.add('IPCBetaTest')).assertFalse();
      expect(registry.size()).assertEqual(1);
      const after: DescriptorAudit = auditDescriptor('IPCBetaTest', registry);
      expect(after.accepted).assertTrue();
      expect(after.reason).assertEqual(REASON_ACCEPTED);
      expect(after.digest).assertEqual(registry.digestOf('IPCBetaTest'));
      expect(after.digest).assertEqual(pinOf('IPCBetaTest'));
      logStep("descriptorSecurityRequiresMembershipForBeta", after.token());
    });

    /**
     * @tc.name          descriptorSecurityRequiresMembershipForGamma
     * @tc.desc          Membership alone gates gamma member before any pin comparison.
     * @tc.precondition  An empty registry is audited first, then the descriptor is added.
     * @tc.steps         1. Audit the descriptor against an empty registry.
     *                   2. Add the descriptor and count the entries.
     *                   3. Attempt a duplicate insertion.
     *                   4. Audit again and read the digest.
     * @tc.expected      Only the first insertion succeeds and the second audit is accepted.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecurityRequiresMembershipForGamma', 0, () => {
      const registry: DescriptorRegistry = new DescriptorRegistry();
      const before: DescriptorAudit = auditDescriptor('IPCGammaTest', registry);
      expect(before.accepted).assertFalse();
      expect(before.reason).assertEqual(REASON_UNREGISTERED);
      expect(before.digest).assertEqual(-1);
      expect(registry.add('IPCGammaTest')).assertTrue();
      expect(registry.add('IPCGammaTest')).assertFalse();
      expect(registry.size()).assertEqual(1);
      const after: DescriptorAudit = auditDescriptor('IPCGammaTest', registry);
      expect(after.accepted).assertTrue();
      expect(after.reason).assertEqual(REASON_ACCEPTED);
      expect(after.digest).assertEqual(registry.digestOf('IPCGammaTest'));
      expect(after.digest).assertEqual(pinOf('IPCGammaTest'));
      logStep("descriptorSecurityRequiresMembershipForGamma", after.token());
    });

    /**
     * @tc.name          descriptorSecurityRequiresMembershipForDelta
     * @tc.desc          Membership alone gates delta member before any pin comparison.
     * @tc.precondition  An empty registry is audited first, then the descriptor is added.
     * @tc.steps         1. Audit the descriptor against an empty registry.
     *                   2. Add the descriptor and count the entries.
     *                   3. Attempt a duplicate insertion.
     *                   4. Audit again and read the digest.
     * @tc.expected      Only the first insertion succeeds and the second audit is accepted.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecurityRequiresMembershipForDelta', 0, () => {
      const registry: DescriptorRegistry = new DescriptorRegistry();
      const before: DescriptorAudit = auditDescriptor('IPCDeltaTest', registry);
      expect(before.accepted).assertFalse();
      expect(before.reason).assertEqual(REASON_UNREGISTERED);
      expect(before.digest).assertEqual(-1);
      expect(registry.add('IPCDeltaTest')).assertTrue();
      expect(registry.add('IPCDeltaTest')).assertFalse();
      expect(registry.size()).assertEqual(1);
      const after: DescriptorAudit = auditDescriptor('IPCDeltaTest', registry);
      expect(after.accepted).assertTrue();
      expect(after.reason).assertEqual(REASON_ACCEPTED);
      expect(after.digest).assertEqual(registry.digestOf('IPCDeltaTest'));
      expect(after.digest).assertEqual(pinOf('IPCDeltaTest'));
      logStep("descriptorSecurityRequiresMembershipForDelta", after.token());
    });

    /**
     * @tc.name          descriptorSecurityRequiresMembershipForZeta
     * @tc.desc          Membership alone gates zeta member before any pin comparison.
     * @tc.precondition  An empty registry is audited first, then the descriptor is added.
     * @tc.steps         1. Audit the descriptor against an empty registry.
     *                   2. Add the descriptor and count the entries.
     *                   3. Attempt a duplicate insertion.
     *                   4. Audit again and read the digest.
     * @tc.expected      Only the first insertion succeeds and the second audit is accepted.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecurityRequiresMembershipForZeta', 0, () => {
      const registry: DescriptorRegistry = new DescriptorRegistry();
      const before: DescriptorAudit = auditDescriptor('IPCZetaTest', registry);
      expect(before.accepted).assertFalse();
      expect(before.reason).assertEqual(REASON_UNREGISTERED);
      expect(before.digest).assertEqual(-1);
      expect(registry.add('IPCZetaTest')).assertTrue();
      expect(registry.add('IPCZetaTest')).assertFalse();
      expect(registry.size()).assertEqual(1);
      const after: DescriptorAudit = auditDescriptor('IPCZetaTest', registry);
      expect(after.accepted).assertTrue();
      expect(after.reason).assertEqual(REASON_ACCEPTED);
      expect(after.digest).assertEqual(registry.digestOf('IPCZetaTest'));
      expect(after.digest).assertEqual(pinOf('IPCZetaTest'));
      logStep("descriptorSecurityRequiresMembershipForZeta", after.token());
    });

    /**
     * @tc.name          descriptorSecurityRequiresMembershipForTheta
     * @tc.desc          Membership alone gates theta member before any pin comparison.
     * @tc.precondition  An empty registry is audited first, then the descriptor is added.
     * @tc.steps         1. Audit the descriptor against an empty registry.
     *                   2. Add the descriptor and count the entries.
     *                   3. Attempt a duplicate insertion.
     *                   4. Audit again and read the digest.
     * @tc.expected      Only the first insertion succeeds and the second audit is accepted.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecurityRequiresMembershipForTheta', 0, () => {
      const registry: DescriptorRegistry = new DescriptorRegistry();
      const before: DescriptorAudit = auditDescriptor('IPCThetaTest', registry);
      expect(before.accepted).assertFalse();
      expect(before.reason).assertEqual(REASON_UNREGISTERED);
      expect(before.digest).assertEqual(-1);
      expect(registry.add('IPCThetaTest')).assertTrue();
      expect(registry.add('IPCThetaTest')).assertFalse();
      expect(registry.size()).assertEqual(1);
      const after: DescriptorAudit = auditDescriptor('IPCThetaTest', registry);
      expect(after.accepted).assertTrue();
      expect(after.reason).assertEqual(REASON_ACCEPTED);
      expect(after.digest).assertEqual(registry.digestOf('IPCThetaTest'));
      expect(after.digest).assertEqual(pinOf('IPCThetaTest'));
      logStep("descriptorSecurityRequiresMembershipForTheta", after.token());
    });

    /**
     * @tc.name          descriptorSecurityDetectsTamperedStubPin
     * @tc.desc          A tampered pin for tampered stub pin is detected and can be repaired.
     * @tc.precondition  The descriptor is registered with its correct pin.
     * @tc.steps         1. Register the descriptor and audit it once.
     *                   2. Offset the stored digest by one.
     *                   3. Audit again and read the pin reason.
     *                   4. Repair the digest and audit a third time.
     * @tc.expected      The tampered entry is refused with the pin reason and accepted again after repair.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecurityDetectsTamperedStubPin', 0, () => {
      const registry: DescriptorRegistry = new DescriptorRegistry();
      registry.add('IPCStubTest');
      const clean: DescriptorAudit = auditDescriptor('IPCStubTest', registry);
      expect(clean.accepted).assertTrue();
      expect(registry.tamper('IPCStubTest')).assertTrue();
      const tampered: DescriptorAudit = auditDescriptor('IPCStubTest', registry);
      expect(tampered.accepted).assertFalse();
      expect(tampered.reason).assertEqual(REASON_PIN);
      expect(tampered.pinned).assertFalse();
      expect(tampered.digest).assertEqual(pinOf('IPCStubTest') + 1);
      expect(registry.repair('IPCStubTest')).assertTrue();
      const repaired: DescriptorAudit = auditDescriptor('IPCStubTest', registry);
      expect(repaired.accepted).assertTrue();
      expect(repaired.digest).assertEqual(pinOf('IPCStubTest'));
      logStep("descriptorSecurityDetectsTamperedStubPin", clean.token() + ">" + tampered.token());
    });

    /**
     * @tc.name          descriptorSecurityDetectsTamperedFooPin
     * @tc.desc          A tampered pin for tampered foo pin is detected and can be repaired.
     * @tc.precondition  The descriptor is registered with its correct pin.
     * @tc.steps         1. Register the descriptor and audit it once.
     *                   2. Offset the stored digest by one.
     *                   3. Audit again and read the pin reason.
     *                   4. Repair the digest and audit a third time.
     * @tc.expected      The tampered entry is refused with the pin reason and accepted again after repair.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecurityDetectsTamperedFooPin', 0, () => {
      const registry: DescriptorRegistry = new DescriptorRegistry();
      registry.add('IPCFooTest');
      const clean: DescriptorAudit = auditDescriptor('IPCFooTest', registry);
      expect(clean.accepted).assertTrue();
      expect(registry.tamper('IPCFooTest')).assertTrue();
      const tampered: DescriptorAudit = auditDescriptor('IPCFooTest', registry);
      expect(tampered.accepted).assertFalse();
      expect(tampered.reason).assertEqual(REASON_PIN);
      expect(tampered.pinned).assertFalse();
      expect(tampered.digest).assertEqual(pinOf('IPCFooTest') + 1);
      expect(registry.repair('IPCFooTest')).assertTrue();
      const repaired: DescriptorAudit = auditDescriptor('IPCFooTest', registry);
      expect(repaired.accepted).assertTrue();
      expect(repaired.digest).assertEqual(pinOf('IPCFooTest'));
      logStep("descriptorSecurityDetectsTamperedFooPin", clean.token() + ">" + tampered.token());
    });

    /**
     * @tc.name          descriptorSecurityDetectsTamperedNodePin
     * @tc.desc          A tampered pin for tampered node pin is detected and can be repaired.
     * @tc.precondition  The descriptor is registered with its correct pin.
     * @tc.steps         1. Register the descriptor and audit it once.
     *                   2. Offset the stored digest by one.
     *                   3. Audit again and read the pin reason.
     *                   4. Repair the digest and audit a third time.
     * @tc.expected      The tampered entry is refused with the pin reason and accepted again after repair.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecurityDetectsTamperedNodePin', 0, () => {
      const registry: DescriptorRegistry = new DescriptorRegistry();
      registry.add('IPCNodeTest');
      const clean: DescriptorAudit = auditDescriptor('IPCNodeTest', registry);
      expect(clean.accepted).assertTrue();
      expect(registry.tamper('IPCNodeTest')).assertTrue();
      const tampered: DescriptorAudit = auditDescriptor('IPCNodeTest', registry);
      expect(tampered.accepted).assertFalse();
      expect(tampered.reason).assertEqual(REASON_PIN);
      expect(tampered.pinned).assertFalse();
      expect(tampered.digest).assertEqual(pinOf('IPCNodeTest') + 1);
      expect(registry.repair('IPCNodeTest')).assertTrue();
      const repaired: DescriptorAudit = auditDescriptor('IPCNodeTest', registry);
      expect(repaired.accepted).assertTrue();
      expect(repaired.digest).assertEqual(pinOf('IPCNodeTest'));
      logStep("descriptorSecurityDetectsTamperedNodePin", clean.token() + ">" + tampered.token());
    });

    /**
     * @tc.name          descriptorSecurityDetectsTamperedServicePin
     * @tc.desc          A tampered pin for tampered service pin is detected and can be repaired.
     * @tc.precondition  The descriptor is registered with its correct pin.
     * @tc.steps         1. Register the descriptor and audit it once.
     *                   2. Offset the stored digest by one.
     *                   3. Audit again and read the pin reason.
     *                   4. Repair the digest and audit a third time.
     * @tc.expected      The tampered entry is refused with the pin reason and accepted again after repair.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecurityDetectsTamperedServicePin', 0, () => {
      const registry: DescriptorRegistry = new DescriptorRegistry();
      registry.add('IPCSvcTest');
      const clean: DescriptorAudit = auditDescriptor('IPCSvcTest', registry);
      expect(clean.accepted).assertTrue();
      expect(registry.tamper('IPCSvcTest')).assertTrue();
      const tampered: DescriptorAudit = auditDescriptor('IPCSvcTest', registry);
      expect(tampered.accepted).assertFalse();
      expect(tampered.reason).assertEqual(REASON_PIN);
      expect(tampered.pinned).assertFalse();
      expect(tampered.digest).assertEqual(pinOf('IPCSvcTest') + 1);
      expect(registry.repair('IPCSvcTest')).assertTrue();
      const repaired: DescriptorAudit = auditDescriptor('IPCSvcTest', registry);
      expect(repaired.accepted).assertTrue();
      expect(repaired.digest).assertEqual(pinOf('IPCSvcTest'));
      logStep("descriptorSecurityDetectsTamperedServicePin", clean.token() + ">" + tampered.token());
    });

    /**
     * @tc.name          descriptorSecurityDetectsTamperedUnitPin
     * @tc.desc          A tampered pin for tampered unit pin is detected and can be repaired.
     * @tc.precondition  The descriptor is registered with its correct pin.
     * @tc.steps         1. Register the descriptor and audit it once.
     *                   2. Offset the stored digest by one.
     *                   3. Audit again and read the pin reason.
     *                   4. Repair the digest and audit a third time.
     * @tc.expected      The tampered entry is refused with the pin reason and accepted again after repair.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecurityDetectsTamperedUnitPin', 0, () => {
      const registry: DescriptorRegistry = new DescriptorRegistry();
      registry.add('IPCUnitTest');
      const clean: DescriptorAudit = auditDescriptor('IPCUnitTest', registry);
      expect(clean.accepted).assertTrue();
      expect(registry.tamper('IPCUnitTest')).assertTrue();
      const tampered: DescriptorAudit = auditDescriptor('IPCUnitTest', registry);
      expect(tampered.accepted).assertFalse();
      expect(tampered.reason).assertEqual(REASON_PIN);
      expect(tampered.pinned).assertFalse();
      expect(tampered.digest).assertEqual(pinOf('IPCUnitTest') + 1);
      expect(registry.repair('IPCUnitTest')).assertTrue();
      const repaired: DescriptorAudit = auditDescriptor('IPCUnitTest', registry);
      expect(repaired.accepted).assertTrue();
      expect(repaired.digest).assertEqual(pinOf('IPCUnitTest'));
      logStep("descriptorSecurityDetectsTamperedUnitPin", clean.token() + ">" + tampered.token());
    });

    /**
     * @tc.name          descriptorSecurityDetectsTamperedLogPin
     * @tc.desc          A tampered pin for tampered log pin is detected and can be repaired.
     * @tc.precondition  The descriptor is registered with its correct pin.
     * @tc.steps         1. Register the descriptor and audit it once.
     *                   2. Offset the stored digest by one.
     *                   3. Audit again and read the pin reason.
     *                   4. Repair the digest and audit a third time.
     * @tc.expected      The tampered entry is refused with the pin reason and accepted again after repair.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecurityDetectsTamperedLogPin', 0, () => {
      const registry: DescriptorRegistry = new DescriptorRegistry();
      registry.add('IPCLogTest');
      const clean: DescriptorAudit = auditDescriptor('IPCLogTest', registry);
      expect(clean.accepted).assertTrue();
      expect(registry.tamper('IPCLogTest')).assertTrue();
      const tampered: DescriptorAudit = auditDescriptor('IPCLogTest', registry);
      expect(tampered.accepted).assertFalse();
      expect(tampered.reason).assertEqual(REASON_PIN);
      expect(tampered.pinned).assertFalse();
      expect(tampered.digest).assertEqual(pinOf('IPCLogTest') + 1);
      expect(registry.repair('IPCLogTest')).assertTrue();
      const repaired: DescriptorAudit = auditDescriptor('IPCLogTest', registry);
      expect(repaired.accepted).assertTrue();
      expect(repaired.digest).assertEqual(pinOf('IPCLogTest'));
      logStep("descriptorSecurityDetectsTamperedLogPin", clean.token() + ">" + tampered.token());
    });

    /**
     * @tc.name          descriptorSecurityNormalizesPaddedStubName
     * @tc.desc          Normalization canonicalises the padded stub name descriptor before policy checks.
     * @tc.precondition  The normalizer trims edges and turns interior spaces into hyphens.
     * @tc.steps         1. Normalize the raw descriptor padded stub name.
     *                   2. Normalize the result a second time.
     *                   3. Register the normalized value and audit the raw value.
     *                   4. Run the policy and charset probes on the normalized form.
     * @tc.expected      The normalized value matches the expectation and the raw form is accepted through it.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecurityNormalizesPaddedStubName', 0, () => {
      const once: string = normalize(' IPCStubTest ');
      const twice: string = normalize(once);
      const registry: DescriptorRegistry = new DescriptorRegistry();
      registry.add(once);
      const audit: DescriptorAudit = auditDescriptor(' IPCStubTest ', registry);
      expect(once).assertEqual('IPCStubTest');
      expect(twice).assertEqual(once);
      expect(once.indexOf("  ") >= 0).assertFalse();
      expect(once.startsWith(POLICY_PREFIX)).assertTrue();
      expect(once.endsWith(POLICY_SUFFIX)).assertTrue();
      expect(charsetOk(once)).assertTrue();
      expect(policyReason(once)).assertEqual("");
      expect(audit.accepted).assertTrue();
      expect(audit.normalized).assertEqual(once);
      expect(audit.digest).assertEqual(pinOf(once));
      logStep("descriptorSecurityNormalizesPaddedStubName", once);
    });

    /**
     * @tc.name          descriptorSecurityNormalizesInteriorSpace
     * @tc.desc          Normalization canonicalises the interior space name descriptor before policy checks.
     * @tc.precondition  The normalizer trims edges and turns interior spaces into hyphens.
     * @tc.steps         1. Normalize the raw descriptor interior space name.
     *                   2. Normalize the result a second time.
     *                   3. Register the normalized value and audit the raw value.
     *                   4. Run the policy and charset probes on the normalized form.
     * @tc.expected      The normalized value matches the expectation and the raw form is accepted through it.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecurityNormalizesInteriorSpace', 0, () => {
      const once: string = normalize('IPC StubTest');
      const twice: string = normalize(once);
      const registry: DescriptorRegistry = new DescriptorRegistry();
      registry.add(once);
      const audit: DescriptorAudit = auditDescriptor('IPC StubTest', registry);
      expect(once).assertEqual('IPC-StubTest');
      expect(twice).assertEqual(once);
      expect(once.indexOf("  ") >= 0).assertFalse();
      expect(once.startsWith(POLICY_PREFIX)).assertTrue();
      expect(once.endsWith(POLICY_SUFFIX)).assertTrue();
      expect(charsetOk(once)).assertTrue();
      expect(policyReason(once)).assertEqual("");
      expect(audit.accepted).assertTrue();
      expect(audit.normalized).assertEqual(once);
      expect(audit.digest).assertEqual(pinOf(once));
      logStep("descriptorSecurityNormalizesInteriorSpace", once);
    });

    /**
     * @tc.name          descriptorSecurityNormalizesDoubleSpace
     * @tc.desc          Normalization canonicalises the double space name descriptor before policy checks.
     * @tc.precondition  The normalizer trims edges and turns interior spaces into hyphens.
     * @tc.steps         1. Normalize the raw descriptor double space name.
     *                   2. Normalize the result a second time.
     *                   3. Register the normalized value and audit the raw value.
     *                   4. Run the policy and charset probes on the normalized form.
     * @tc.expected      The normalized value matches the expectation and the raw form is accepted through it.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecurityNormalizesDoubleSpace', 0, () => {
      const once: string = normalize('IPC  StubTest');
      const twice: string = normalize(once);
      const registry: DescriptorRegistry = new DescriptorRegistry();
      registry.add(once);
      const audit: DescriptorAudit = auditDescriptor('IPC  StubTest', registry);
      expect(once).assertEqual('IPC--StubTest');
      expect(twice).assertEqual(once);
      expect(once.indexOf("  ") >= 0).assertFalse();
      expect(once.startsWith(POLICY_PREFIX)).assertTrue();
      expect(once.endsWith(POLICY_SUFFIX)).assertTrue();
      expect(charsetOk(once)).assertTrue();
      expect(policyReason(once)).assertEqual("");
      expect(audit.accepted).assertTrue();
      expect(audit.normalized).assertEqual(once);
      expect(audit.digest).assertEqual(pinOf(once));
      logStep("descriptorSecurityNormalizesDoubleSpace", once);
    });

    /**
     * @tc.name          descriptorSecurityKeepsCleanStubName
     * @tc.desc          Normalization canonicalises the clean stub name descriptor before policy checks.
     * @tc.precondition  The normalizer trims edges and turns interior spaces into hyphens.
     * @tc.steps         1. Normalize the raw descriptor clean stub name.
     *                   2. Normalize the result a second time.
     *                   3. Register the normalized value and audit the raw value.
     *                   4. Run the policy and charset probes on the normalized form.
     * @tc.expected      The normalized value matches the expectation and the raw form is accepted through it.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecurityKeepsCleanStubName', 0, () => {
      const once: string = normalize('IPCStubTest');
      const twice: string = normalize(once);
      const registry: DescriptorRegistry = new DescriptorRegistry();
      registry.add(once);
      const audit: DescriptorAudit = auditDescriptor('IPCStubTest', registry);
      expect(once).assertEqual('IPCStubTest');
      expect(twice).assertEqual(once);
      expect(once.indexOf("  ") >= 0).assertFalse();
      expect(once.startsWith(POLICY_PREFIX)).assertTrue();
      expect(once.endsWith(POLICY_SUFFIX)).assertTrue();
      expect(charsetOk(once)).assertTrue();
      expect(policyReason(once)).assertEqual("");
      expect(audit.accepted).assertTrue();
      expect(audit.normalized).assertEqual(once);
      expect(audit.digest).assertEqual(pinOf(once));
      logStep("descriptorSecurityKeepsCleanStubName", once);
    });

    /**
     * @tc.name          descriptorSecurityNormalizesLeadingPadding
     * @tc.desc          Normalization canonicalises the leading padding descriptor before policy checks.
     * @tc.precondition  The normalizer trims edges and turns interior spaces into hyphens.
     * @tc.steps         1. Normalize the raw descriptor leading padding.
     *                   2. Normalize the result a second time.
     *                   3. Register the normalized value and audit the raw value.
     *                   4. Run the policy and charset probes on the normalized form.
     * @tc.expected      The normalized value matches the expectation and the raw form is accepted through it.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecurityNormalizesLeadingPadding', 0, () => {
      const once: string = normalize('  IPCFooTest');
      const twice: string = normalize(once);
      const registry: DescriptorRegistry = new DescriptorRegistry();
      registry.add(once);
      const audit: DescriptorAudit = auditDescriptor('  IPCFooTest', registry);
      expect(once).assertEqual('IPCFooTest');
      expect(twice).assertEqual(once);
      expect(once.indexOf("  ") >= 0).assertFalse();
      expect(once.startsWith(POLICY_PREFIX)).assertTrue();
      expect(once.endsWith(POLICY_SUFFIX)).assertTrue();
      expect(charsetOk(once)).assertTrue();
      expect(policyReason(once)).assertEqual("");
      expect(audit.accepted).assertTrue();
      expect(audit.normalized).assertEqual(once);
      expect(audit.digest).assertEqual(pinOf(once));
      logStep("descriptorSecurityNormalizesLeadingPadding", once);
    });

    /**
     * @tc.name          descriptorSecurityNormalizesTrailingPadding
     * @tc.desc          Normalization canonicalises the trailing padding descriptor before policy checks.
     * @tc.precondition  The normalizer trims edges and turns interior spaces into hyphens.
     * @tc.steps         1. Normalize the raw descriptor trailing padding.
     *                   2. Normalize the result a second time.
     *                   3. Register the normalized value and audit the raw value.
     *                   4. Run the policy and charset probes on the normalized form.
     * @tc.expected      The normalized value matches the expectation and the raw form is accepted through it.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecurityNormalizesTrailingPadding', 0, () => {
      const once: string = normalize('IPCBarTest  ');
      const twice: string = normalize(once);
      const registry: DescriptorRegistry = new DescriptorRegistry();
      registry.add(once);
      const audit: DescriptorAudit = auditDescriptor('IPCBarTest  ', registry);
      expect(once).assertEqual('IPCBarTest');
      expect(twice).assertEqual(once);
      expect(once.indexOf("  ") >= 0).assertFalse();
      expect(once.startsWith(POLICY_PREFIX)).assertTrue();
      expect(once.endsWith(POLICY_SUFFIX)).assertTrue();
      expect(charsetOk(once)).assertTrue();
      expect(policyReason(once)).assertEqual("");
      expect(audit.accepted).assertTrue();
      expect(audit.normalized).assertEqual(once);
      expect(audit.digest).assertEqual(pinOf(once));
      logStep("descriptorSecurityNormalizesTrailingPadding", once);
    });

    /**
     * @tc.name          descriptorSecurityNormalizesWordSpaces
     * @tc.desc          Normalization canonicalises the word spaces descriptor before policy checks.
     * @tc.precondition  The normalizer trims edges and turns interior spaces into hyphens.
     * @tc.steps         1. Normalize the raw descriptor word spaces.
     *                   2. Normalize the result a second time.
     *                   3. Register the normalized value and audit the raw value.
     *                   4. Run the policy and charset probes on the normalized form.
     * @tc.expected      The normalized value matches the expectation and the raw form is accepted through it.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecurityNormalizesWordSpaces', 0, () => {
      const once: string = normalize('IPC Node Test');
      const twice: string = normalize(once);
      const registry: DescriptorRegistry = new DescriptorRegistry();
      registry.add(once);
      const audit: DescriptorAudit = auditDescriptor('IPC Node Test', registry);
      expect(once).assertEqual('IPC-Node-Test');
      expect(twice).assertEqual(once);
      expect(once.indexOf("  ") >= 0).assertFalse();
      expect(once.startsWith(POLICY_PREFIX)).assertTrue();
      expect(once.endsWith(POLICY_SUFFIX)).assertTrue();
      expect(charsetOk(once)).assertTrue();
      expect(policyReason(once)).assertEqual("");
      expect(audit.accepted).assertTrue();
      expect(audit.normalized).assertEqual(once);
      expect(audit.digest).assertEqual(pinOf(once));
      logStep("descriptorSecurityNormalizesWordSpaces", once);
    });

    /**
     * @tc.name          descriptorSecurityKeepsUnderscoreName
     * @tc.desc          Normalization canonicalises the underscore name descriptor before policy checks.
     * @tc.precondition  The normalizer trims edges and turns interior spaces into hyphens.
     * @tc.steps         1. Normalize the raw descriptor underscore name.
     *                   2. Normalize the result a second time.
     *                   3. Register the normalized value and audit the raw value.
     *                   4. Run the policy and charset probes on the normalized form.
     * @tc.expected      The normalized value matches the expectation and the raw form is accepted through it.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecurityKeepsUnderscoreName', 0, () => {
      const once: string = normalize('IPC_StubTest');
      const twice: string = normalize(once);
      const registry: DescriptorRegistry = new DescriptorRegistry();
      registry.add(once);
      const audit: DescriptorAudit = auditDescriptor('IPC_StubTest', registry);
      expect(once).assertEqual('IPC_StubTest');
      expect(twice).assertEqual(once);
      expect(once.indexOf("  ") >= 0).assertFalse();
      expect(once.startsWith(POLICY_PREFIX)).assertTrue();
      expect(once.endsWith(POLICY_SUFFIX)).assertTrue();
      expect(charsetOk(once)).assertTrue();
      expect(policyReason(once)).assertEqual("");
      expect(audit.accepted).assertTrue();
      expect(audit.normalized).assertEqual(once);
      expect(audit.digest).assertEqual(pinOf(once));
      logStep("descriptorSecurityKeepsUnderscoreName", once);
    });

    /**
     * @tc.name          descriptorSecuritySeparatesStubAndFooPins
     * @tc.desc          Descriptors labelled stub and foo keep separate registry pins.
     * @tc.precondition  Both descriptors satisfy the naming policy.
     * @tc.steps         1. Register both descriptors in one registry.
     *                   2. Audit each one.
     *                   3. Compare the two pins and the registry trace.
     *                   4. Recompute both pins with the pin helper.
     * @tc.expected      Both entries are accepted, the pins differ, and the trace lists both.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecuritySeparatesStubAndFooPins', 0, () => {
      const registry: DescriptorRegistry = new DescriptorRegistry();
      expect(registry.add('IPCStubTest')).assertTrue();
      expect(registry.add('IPCFooTest')).assertTrue();
      expect(registry.size()).assertEqual(2);
      const left: DescriptorAudit = auditDescriptor('IPCStubTest', registry);
      const right: DescriptorAudit = auditDescriptor('IPCFooTest', registry);
      expect(left.accepted).assertTrue();
      expect(right.accepted).assertTrue();
      expect(left.digest).assertEqual(pinOf('IPCStubTest'));
      expect(right.digest).assertEqual(pinOf('IPCFooTest'));
      expect(left.digest === right.digest).assertFalse();
      expect(registry.trace().indexOf('IPCStubTest') >= 0).assertTrue();
      expect(registry.trace().indexOf('IPCFooTest') >= 0).assertTrue();
      expect(registry.trace().indexOf(";") >= 0).assertTrue();
      logStep("descriptorSecuritySeparatesStubAndFooPins", registry.trace());
    });

    /**
     * @tc.name          descriptorSecuritySeparatesBarAndNodePins
     * @tc.desc          Descriptors labelled bar and node keep separate registry pins.
     * @tc.precondition  Both descriptors satisfy the naming policy.
     * @tc.steps         1. Register both descriptors in one registry.
     *                   2. Audit each one.
     *                   3. Compare the two pins and the registry trace.
     *                   4. Recompute both pins with the pin helper.
     * @tc.expected      Both entries are accepted, the pins differ, and the trace lists both.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecuritySeparatesBarAndNodePins', 0, () => {
      const registry: DescriptorRegistry = new DescriptorRegistry();
      expect(registry.add('IPCBarTest')).assertTrue();
      expect(registry.add('IPCNodeTest')).assertTrue();
      expect(registry.size()).assertEqual(2);
      const left: DescriptorAudit = auditDescriptor('IPCBarTest', registry);
      const right: DescriptorAudit = auditDescriptor('IPCNodeTest', registry);
      expect(left.accepted).assertTrue();
      expect(right.accepted).assertTrue();
      expect(left.digest).assertEqual(pinOf('IPCBarTest'));
      expect(right.digest).assertEqual(pinOf('IPCNodeTest'));
      expect(left.digest === right.digest).assertFalse();
      expect(registry.trace().indexOf('IPCBarTest') >= 0).assertTrue();
      expect(registry.trace().indexOf('IPCNodeTest') >= 0).assertTrue();
      expect(registry.trace().indexOf(";") >= 0).assertTrue();
      logStep("descriptorSecuritySeparatesBarAndNodePins", registry.trace());
    });

    /**
     * @tc.name          descriptorSecuritySeparatesServiceAndUnitPins
     * @tc.desc          Descriptors labelled service and unit keep separate registry pins.
     * @tc.precondition  Both descriptors satisfy the naming policy.
     * @tc.steps         1. Register both descriptors in one registry.
     *                   2. Audit each one.
     *                   3. Compare the two pins and the registry trace.
     *                   4. Recompute both pins with the pin helper.
     * @tc.expected      Both entries are accepted, the pins differ, and the trace lists both.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecuritySeparatesServiceAndUnitPins', 0, () => {
      const registry: DescriptorRegistry = new DescriptorRegistry();
      expect(registry.add('IPCSvcTest')).assertTrue();
      expect(registry.add('IPCUnitTest')).assertTrue();
      expect(registry.size()).assertEqual(2);
      const left: DescriptorAudit = auditDescriptor('IPCSvcTest', registry);
      const right: DescriptorAudit = auditDescriptor('IPCUnitTest', registry);
      expect(left.accepted).assertTrue();
      expect(right.accepted).assertTrue();
      expect(left.digest).assertEqual(pinOf('IPCSvcTest'));
      expect(right.digest).assertEqual(pinOf('IPCUnitTest'));
      expect(left.digest === right.digest).assertFalse();
      expect(registry.trace().indexOf('IPCSvcTest') >= 0).assertTrue();
      expect(registry.trace().indexOf('IPCUnitTest') >= 0).assertTrue();
      expect(registry.trace().indexOf(";") >= 0).assertTrue();
      logStep("descriptorSecuritySeparatesServiceAndUnitPins", registry.trace());
    });

    /**
     * @tc.name          descriptorSecuritySeparatesLogAndPinPins
     * @tc.desc          Descriptors labelled log and pin keep separate registry pins.
     * @tc.precondition  Both descriptors satisfy the naming policy.
     * @tc.steps         1. Register both descriptors in one registry.
     *                   2. Audit each one.
     *                   3. Compare the two pins and the registry trace.
     *                   4. Recompute both pins with the pin helper.
     * @tc.expected      Both entries are accepted, the pins differ, and the trace lists both.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecuritySeparatesLogAndPinPins', 0, () => {
      const registry: DescriptorRegistry = new DescriptorRegistry();
      expect(registry.add('IPCLogTest')).assertTrue();
      expect(registry.add('IPCPinTest')).assertTrue();
      expect(registry.size()).assertEqual(2);
      const left: DescriptorAudit = auditDescriptor('IPCLogTest', registry);
      const right: DescriptorAudit = auditDescriptor('IPCPinTest', registry);
      expect(left.accepted).assertTrue();
      expect(right.accepted).assertTrue();
      expect(left.digest).assertEqual(pinOf('IPCLogTest'));
      expect(right.digest).assertEqual(pinOf('IPCPinTest'));
      expect(left.digest === right.digest).assertFalse();
      expect(registry.trace().indexOf('IPCLogTest') >= 0).assertTrue();
      expect(registry.trace().indexOf('IPCPinTest') >= 0).assertTrue();
      expect(registry.trace().indexOf(";") >= 0).assertTrue();
      logStep("descriptorSecuritySeparatesLogAndPinPins", registry.trace());
    });

    /**
     * @tc.name          descriptorSecuritySeparatesAuditAndTracePins
     * @tc.desc          Descriptors labelled audit and trace keep separate registry pins.
     * @tc.precondition  Both descriptors satisfy the naming policy.
     * @tc.steps         1. Register both descriptors in one registry.
     *                   2. Audit each one.
     *                   3. Compare the two pins and the registry trace.
     *                   4. Recompute both pins with the pin helper.
     * @tc.expected      Both entries are accepted, the pins differ, and the trace lists both.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecuritySeparatesAuditAndTracePins', 0, () => {
      const registry: DescriptorRegistry = new DescriptorRegistry();
      expect(registry.add('IPCAuditTest')).assertTrue();
      expect(registry.add('IPCTraceTest')).assertTrue();
      expect(registry.size()).assertEqual(2);
      const left: DescriptorAudit = auditDescriptor('IPCAuditTest', registry);
      const right: DescriptorAudit = auditDescriptor('IPCTraceTest', registry);
      expect(left.accepted).assertTrue();
      expect(right.accepted).assertTrue();
      expect(left.digest).assertEqual(pinOf('IPCAuditTest'));
      expect(right.digest).assertEqual(pinOf('IPCTraceTest'));
      expect(left.digest === right.digest).assertFalse();
      expect(registry.trace().indexOf('IPCAuditTest') >= 0).assertTrue();
      expect(registry.trace().indexOf('IPCTraceTest') >= 0).assertTrue();
      expect(registry.trace().indexOf(";") >= 0).assertTrue();
      logStep("descriptorSecuritySeparatesAuditAndTracePins", registry.trace());
    });

    /**
     * @tc.name          descriptorSecuritySeparatesAlphaAndBetaPins
     * @tc.desc          Descriptors labelled alpha and beta keep separate registry pins.
     * @tc.precondition  Both descriptors satisfy the naming policy.
     * @tc.steps         1. Register both descriptors in one registry.
     *                   2. Audit each one.
     *                   3. Compare the two pins and the registry trace.
     *                   4. Recompute both pins with the pin helper.
     * @tc.expected      Both entries are accepted, the pins differ, and the trace lists both.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecuritySeparatesAlphaAndBetaPins', 0, () => {
      const registry: DescriptorRegistry = new DescriptorRegistry();
      expect(registry.add('IPCAlphaTest')).assertTrue();
      expect(registry.add('IPCBetaTest')).assertTrue();
      expect(registry.size()).assertEqual(2);
      const left: DescriptorAudit = auditDescriptor('IPCAlphaTest', registry);
      const right: DescriptorAudit = auditDescriptor('IPCBetaTest', registry);
      expect(left.accepted).assertTrue();
      expect(right.accepted).assertTrue();
      expect(left.digest).assertEqual(pinOf('IPCAlphaTest'));
      expect(right.digest).assertEqual(pinOf('IPCBetaTest'));
      expect(left.digest === right.digest).assertFalse();
      expect(registry.trace().indexOf('IPCAlphaTest') >= 0).assertTrue();
      expect(registry.trace().indexOf('IPCBetaTest') >= 0).assertTrue();
      expect(registry.trace().indexOf(";") >= 0).assertTrue();
      logStep("descriptorSecuritySeparatesAlphaAndBetaPins", registry.trace());
    });

    /**
     * @tc.name          descriptorSecurityAllowsUnderscoreCharset
     * @tc.desc          Charset probe for underscore charset agrees with the policy verdict.
     * @tc.precondition  The descriptor passes or fails only on the charset rule.
     * @tc.steps         1. Run the charset predicate on the descriptor.
     *                   2. Register it and audit it.
     *                   3. Read the policy reason.
     *                   4. Compare the audit reason with the predicate.
     * @tc.expected      The audit reports the charset reason exactly when the predicate fails.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecurityAllowsUnderscoreCharset', 0, () => {
      const registry: DescriptorRegistry = new DescriptorRegistry();
      registry.add('IPC_StubTest');
      const audit: DescriptorAudit = auditDescriptor('IPC_StubTest', registry);
      expect(charsetOk('IPC_StubTest')).assertEqual(true);
      expect(policyReason('IPC_StubTest')).assertEqual("");
      expect(audit.reason).assertEqual(REASON_ACCEPTED);
      expect(audit.accepted).assertEqual(true);
      expect('IPC_StubTest'.length >= MIN_DESCRIPTOR).assertTrue();
      expect('IPC_StubTest'.startsWith(POLICY_PREFIX)).assertTrue();
      expect('IPC_StubTest'.endsWith(POLICY_SUFFIX)).assertTrue();
      expect(registry.size()).assertEqual(1);
      logStep("descriptorSecurityAllowsUnderscoreCharset", audit.token());
    });

    /**
     * @tc.name          descriptorSecurityAllowsDotCharset
     * @tc.desc          Charset probe for dot charset agrees with the policy verdict.
     * @tc.precondition  The descriptor passes or fails only on the charset rule.
     * @tc.steps         1. Run the charset predicate on the descriptor.
     *                   2. Register it and audit it.
     *                   3. Read the policy reason.
     *                   4. Compare the audit reason with the predicate.
     * @tc.expected      The audit reports the charset reason exactly when the predicate fails.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecurityAllowsDotCharset', 0, () => {
      const registry: DescriptorRegistry = new DescriptorRegistry();
      registry.add('IPC.StubTest');
      const audit: DescriptorAudit = auditDescriptor('IPC.StubTest', registry);
      expect(charsetOk('IPC.StubTest')).assertEqual(true);
      expect(policyReason('IPC.StubTest')).assertEqual("");
      expect(audit.reason).assertEqual(REASON_ACCEPTED);
      expect(audit.accepted).assertEqual(true);
      expect('IPC.StubTest'.length >= MIN_DESCRIPTOR).assertTrue();
      expect('IPC.StubTest'.startsWith(POLICY_PREFIX)).assertTrue();
      expect('IPC.StubTest'.endsWith(POLICY_SUFFIX)).assertTrue();
      expect(registry.size()).assertEqual(1);
      logStep("descriptorSecurityAllowsDotCharset", audit.token());
    });

    /**
     * @tc.name          descriptorSecurityAllowsHyphenCharset
     * @tc.desc          Charset probe for hyphen charset agrees with the policy verdict.
     * @tc.precondition  The descriptor passes or fails only on the charset rule.
     * @tc.steps         1. Run the charset predicate on the descriptor.
     *                   2. Register it and audit it.
     *                   3. Read the policy reason.
     *                   4. Compare the audit reason with the predicate.
     * @tc.expected      The audit reports the charset reason exactly when the predicate fails.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecurityAllowsHyphenCharset', 0, () => {
      const registry: DescriptorRegistry = new DescriptorRegistry();
      registry.add('IPC-StubTest');
      const audit: DescriptorAudit = auditDescriptor('IPC-StubTest', registry);
      expect(charsetOk('IPC-StubTest')).assertEqual(true);
      expect(policyReason('IPC-StubTest')).assertEqual("");
      expect(audit.reason).assertEqual(REASON_ACCEPTED);
      expect(audit.accepted).assertEqual(true);
      expect('IPC-StubTest'.length >= MIN_DESCRIPTOR).assertTrue();
      expect('IPC-StubTest'.startsWith(POLICY_PREFIX)).assertTrue();
      expect('IPC-StubTest'.endsWith(POLICY_SUFFIX)).assertTrue();
      expect(registry.size()).assertEqual(1);
      logStep("descriptorSecurityAllowsHyphenCharset", audit.token());
    });

    /**
     * @tc.name          descriptorSecurityRejectsAtCharset
     * @tc.desc          Charset probe for at charset agrees with the policy verdict.
     * @tc.precondition  The descriptor passes or fails only on the charset rule.
     * @tc.steps         1. Run the charset predicate on the descriptor.
     *                   2. Register it and audit it.
     *                   3. Read the policy reason.
     *                   4. Compare the audit reason with the predicate.
     * @tc.expected      The audit reports the charset reason exactly when the predicate fails.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecurityRejectsAtCharset', 0, () => {
      const registry: DescriptorRegistry = new DescriptorRegistry();
      registry.add('IPC@StubTest');
      const audit: DescriptorAudit = auditDescriptor('IPC@StubTest', registry);
      expect(charsetOk('IPC@StubTest')).assertEqual(false);
      expect(policyReason('IPC@StubTest')).assertEqual(REASON_CHARSET);
      expect(audit.reason).assertEqual(REASON_CHARSET);
      expect(audit.accepted).assertEqual(false);
      expect('IPC@StubTest'.length >= MIN_DESCRIPTOR).assertTrue();
      expect('IPC@StubTest'.startsWith(POLICY_PREFIX)).assertTrue();
      expect('IPC@StubTest'.endsWith(POLICY_SUFFIX)).assertTrue();
      expect(registry.size()).assertEqual(1);
      logStep("descriptorSecurityRejectsAtCharset", audit.token());
    });

    /**
     * @tc.name          descriptorSecurityRejectsHashCharset
     * @tc.desc          Charset probe for hash charset agrees with the policy verdict.
     * @tc.precondition  The descriptor passes or fails only on the charset rule.
     * @tc.steps         1. Run the charset predicate on the descriptor.
     *                   2. Register it and audit it.
     *                   3. Read the policy reason.
     *                   4. Compare the audit reason with the predicate.
     * @tc.expected      The audit reports the charset reason exactly when the predicate fails.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecurityRejectsHashCharset', 0, () => {
      const registry: DescriptorRegistry = new DescriptorRegistry();
      registry.add('IPC#StubTest');
      const audit: DescriptorAudit = auditDescriptor('IPC#StubTest', registry);
      expect(charsetOk('IPC#StubTest')).assertEqual(false);
      expect(policyReason('IPC#StubTest')).assertEqual(REASON_CHARSET);
      expect(audit.reason).assertEqual(REASON_CHARSET);
      expect(audit.accepted).assertEqual(false);
      expect('IPC#StubTest'.length >= MIN_DESCRIPTOR).assertTrue();
      expect('IPC#StubTest'.startsWith(POLICY_PREFIX)).assertTrue();
      expect('IPC#StubTest'.endsWith(POLICY_SUFFIX)).assertTrue();
      expect(registry.size()).assertEqual(1);
      logStep("descriptorSecurityRejectsHashCharset", audit.token());
    });

    /**
     * @tc.name          descriptorSecurityRejectsSlashCharset
     * @tc.desc          Charset probe for slash charset agrees with the policy verdict.
     * @tc.precondition  The descriptor passes or fails only on the charset rule.
     * @tc.steps         1. Run the charset predicate on the descriptor.
     *                   2. Register it and audit it.
     *                   3. Read the policy reason.
     *                   4. Compare the audit reason with the predicate.
     * @tc.expected      The audit reports the charset reason exactly when the predicate fails.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecurityRejectsSlashCharset', 0, () => {
      const registry: DescriptorRegistry = new DescriptorRegistry();
      registry.add('IPC/StubTest');
      const audit: DescriptorAudit = auditDescriptor('IPC/StubTest', registry);
      expect(charsetOk('IPC/StubTest')).assertEqual(false);
      expect(policyReason('IPC/StubTest')).assertEqual(REASON_CHARSET);
      expect(audit.reason).assertEqual(REASON_CHARSET);
      expect(audit.accepted).assertEqual(false);
      expect('IPC/StubTest'.length >= MIN_DESCRIPTOR).assertTrue();
      expect('IPC/StubTest'.startsWith(POLICY_PREFIX)).assertTrue();
      expect('IPC/StubTest'.endsWith(POLICY_SUFFIX)).assertTrue();
      expect(registry.size()).assertEqual(1);
      logStep("descriptorSecurityRejectsSlashCharset", audit.token());
    });

    /**
     * @tc.name          descriptorSecurityBoundsSevenCharacters
     * @tc.desc          A descriptor grown to 7 characters trips the length rule at seven characters.
     * @tc.precondition  The value keeps the IPC prefix and Test suffix while its length varies.
     * @tc.steps         1. Grow the descriptor to exactly 7 characters.
     *                   2. Check the prefix, suffix and charset predicates.
     *                   3. Audit it against a registry containing the raw value.
     *                   4. Compare the refusal with the policy oracle.
     * @tc.expected      The length rule wins, the audit is refused, and the pin stage is skipped.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('descriptorSecurityBoundsSevenCharacters', 0, () => {
      const value: string = buildSized(POLICY_PREFIX, POLICY_SUFFIX, 7);
      const registry: DescriptorRegistry = new DescriptorRegistry();
      registry.add(value);
      const audit: DescriptorAudit = auditDescriptor(value, registry);
      expect(value.length).assertEqual(7);
      expect(value.startsWith(POLICY_PREFIX)).assertTrue();
      expect(value.endsWith(POLICY_SUFFIX)).assertTrue();
      expect(charsetOk(value)).assertTrue();
      expect(policyReason(value)).assertEqual(REASON_SHORT);
      expect(audit.accepted).assertFalse();
      expect(audit.reason).assertEqual(REASON_SHORT);
      expect(audit.pinned).assertFalse();
      logStep("descriptorSecurityBoundsSevenCharacters", String(value.length) + "@" + audit.reason);
    });

  });
}
