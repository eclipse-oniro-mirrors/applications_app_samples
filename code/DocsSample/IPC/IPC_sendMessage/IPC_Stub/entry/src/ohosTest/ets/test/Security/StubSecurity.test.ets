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
  STUB_DESCRIPTOR, REQUEST_CODE, REQUEST_PAYLOAD, REPLY_PAYLOAD, ERROR_NONE, ERROR_STUB_REJECTED,
  StubRemoteObjectModel, RequestResultModel, InProcessClient, StubMetrics, textFingerprint
} from '../Shared/SharedDriver';

const TRUSTED: string[] = ['IPCStubTest'];
const DESCRIPTOR_MAX: number = 64;
const REASON_ALLOWED: string = 'allowed';
const REASON_EMPTY: string = 'empty';
const REASON_BLANK: string = 'blank';
const REASON_LENGTH: string = 'length';
const REASON_SHAPE: string = 'shape';
const REASON_UNKNOWN: string = 'unknown';

class DescriptorVerdict {
  public allowed: boolean;
  public reason: string;
  public observed: string;
  public normalized: string;
  public digest: number;
  public length: number;

  constructor(allowed: boolean, reason: string, observed: string, normalized: string) {
    this.allowed = allowed;
    this.reason = reason;
    this.observed = observed;
    this.normalized = normalized;
    this.digest = textFingerprint(normalized);
    this.length = observed.length;
  }

  public token(): string {
    return this.reason + ":" + this.normalized + ":" + String(this.length) + ":" + String(this.digest);
  }
}

function hasControlChar(text: string): boolean {
  for (let index = 0; index < text.length; index++) {
    const unit: number = text.charCodeAt(index);
    if (unit < 32 || unit === 127) {
      return true;
    }
  }
  return false;
}

function hasAsciiOnly(text: string): boolean {
  for (let index = 0; index < text.length; index++) {
    if (text.charCodeAt(index) > 126) {
      return false;
    }
  }
  return true;
}

function shapeOk(text: string): boolean {
  if (text.indexOf('/') >= 0 || text.indexOf('\\') >= 0 || text.indexOf('..') >= 0) {
    return false;
  }
  if (text.indexOf(' ') >= 0 || text.indexOf('\\t') >= 0) {
    return false;
  }
  return hasAsciiOnly(text) && !hasControlChar(text);
}

function buildLong(size: number): string {
  let text = 'IPC';
  while (text.length < size) {
    text = text + 'x';
  }
  return text;
}

function evaluateDescriptor(candidate: string, allowlist: string[]): DescriptorVerdict {
  if (candidate.length === 0) {
    return new DescriptorVerdict(false, REASON_EMPTY, candidate, '');
  }
  if (candidate.trim().length === 0) {
    return new DescriptorVerdict(false, REASON_BLANK, candidate, candidate.trim());
  }
  if (candidate.length > DESCRIPTOR_MAX) {
    return new DescriptorVerdict(false, REASON_LENGTH, candidate, candidate.trim());
  }
  if (!shapeOk(candidate)) {
    return new DescriptorVerdict(false, REASON_SHAPE, candidate, candidate.trim());
  }
  if (allowlist.indexOf(candidate) < 0) {
    return new DescriptorVerdict(false, REASON_UNKNOWN, candidate, candidate);
  }
  return new DescriptorVerdict(true, REASON_ALLOWED, candidate, candidate);
}

class GatedStub {
  public stub: StubRemoteObjectModel;
  public verdict: DescriptorVerdict;
  public forwarded: number = 0;
  public blocked: number = 0;
  public blockedCodes: number[] = [];

  constructor(descriptor: string, allowlist: string[] = TRUSTED) {
    this.stub = new StubRemoteObjectModel(descriptor);
    this.verdict = evaluateDescriptor(descriptor, allowlist);
  }

  public send(code: number, payload: string = REQUEST_PAYLOAD): RequestResultModel {
    if (!this.verdict.allowed) {
      this.blocked = this.blocked + 1;
      this.blockedCodes.push(code);
      return new RequestResultModel(ERROR_STUB_REJECTED, '', false);
    }
    this.forwarded = this.forwarded + 1;
    const client: InProcessClient = new InProcessClient(this.stub);
    return client.send(code, payload);
  }
}

export default function stubSecurity(): void {
  describe('StubSecurityTest', () => {
    beforeAll(() => {
      logSuite('StubSecurityTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('StubSecurityTest', 'end');
    });

    /**
     * @tc.name          stubSecurityAdmitsProductionDescriptorAsSoleEntry
     * @tc.desc          A well-formed descriptor labelled production literal is admitted when it is the only allowlist entry.
     * @tc.precondition  A dedicated allowlist is built that contains exactly the candidate descriptor.
     * @tc.steps         1. Construct the candidate descriptor string production literal.
     *                   2. Evaluate it with evaluateDescriptor against the dedicated allowlist.
     *                   3. Repeat the same evaluation to confirm determinism.
     *                   4. Recompute the digest independently with textFingerprint.
     * @tc.expected      The verdict is allowed, the normalized value equals the candidate, and both evaluations agree.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stubSecurityAdmitsProductionDescriptorAsSoleEntry', 0, () => {
      const candidate: string = 'IPCStubTest';
      const allow: string[] = [candidate];
      const verdict: DescriptorVerdict = evaluateDescriptor(candidate, allow);
      const again: DescriptorVerdict = evaluateDescriptor(candidate, allow);
      expect(verdict.allowed).assertTrue();
      expect(verdict.reason).assertEqual(REASON_ALLOWED);
      expect(verdict.observed).assertEqual(candidate);
      expect(verdict.normalized).assertEqual(candidate);
      expect(verdict.length).assertEqual(candidate.length);
      expect(verdict.digest).assertEqual(textFingerprint(candidate));
      expect(verdict.digest).assertEqual(again.digest);
      expect(verdict.token()).assertEqual(again.token());
      expect(evaluateDescriptor(candidate, []).allowed).assertFalse();
      logStep("stubSecurityAdmitsProductionDescriptorAsSoleEntry", verdict.token());
    });

    /**
     * @tc.name          stubSecurityAdmitsNumberedVariantWhenAllowlisted
     * @tc.desc          A well-formed descriptor labelled numbered variant is admitted when it is the only allowlist entry.
     * @tc.precondition  A dedicated allowlist is built that contains exactly the candidate descriptor.
     * @tc.steps         1. Construct the candidate descriptor string numbered variant.
     *                   2. Evaluate it with evaluateDescriptor against the dedicated allowlist.
     *                   3. Repeat the same evaluation to confirm determinism.
     *                   4. Recompute the digest independently with textFingerprint.
     * @tc.expected      The verdict is allowed, the normalized value equals the candidate, and both evaluations agree.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stubSecurityAdmitsNumberedVariantWhenAllowlisted', 0, () => {
      const candidate: string = 'IPCStubTest2';
      const allow: string[] = [candidate];
      const verdict: DescriptorVerdict = evaluateDescriptor(candidate, allow);
      const again: DescriptorVerdict = evaluateDescriptor(candidate, allow);
      expect(verdict.allowed).assertTrue();
      expect(verdict.reason).assertEqual(REASON_ALLOWED);
      expect(verdict.observed).assertEqual(candidate);
      expect(verdict.normalized).assertEqual(candidate);
      expect(verdict.length).assertEqual(candidate.length);
      expect(verdict.digest).assertEqual(textFingerprint(candidate));
      expect(verdict.digest).assertEqual(again.digest);
      expect(verdict.token()).assertEqual(again.token());
      expect(evaluateDescriptor(candidate, []).allowed).assertFalse();
      logStep("stubSecurityAdmitsNumberedVariantWhenAllowlisted", verdict.token());
    });

    /**
     * @tc.name          stubSecurityAdmitsSingleCharacterDescriptor
     * @tc.desc          A well-formed descriptor labelled single character is admitted when it is the only allowlist entry.
     * @tc.precondition  A dedicated allowlist is built that contains exactly the candidate descriptor.
     * @tc.steps         1. Construct the candidate descriptor string single character.
     *                   2. Evaluate it with evaluateDescriptor against the dedicated allowlist.
     *                   3. Repeat the same evaluation to confirm determinism.
     *                   4. Recompute the digest independently with textFingerprint.
     * @tc.expected      The verdict is allowed, the normalized value equals the candidate, and both evaluations agree.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stubSecurityAdmitsSingleCharacterDescriptor', 0, () => {
      const candidate: string = 'a';
      const allow: string[] = [candidate];
      const verdict: DescriptorVerdict = evaluateDescriptor(candidate, allow);
      const again: DescriptorVerdict = evaluateDescriptor(candidate, allow);
      expect(verdict.allowed).assertTrue();
      expect(verdict.reason).assertEqual(REASON_ALLOWED);
      expect(verdict.observed).assertEqual(candidate);
      expect(verdict.normalized).assertEqual(candidate);
      expect(verdict.length).assertEqual(candidate.length);
      expect(verdict.digest).assertEqual(textFingerprint(candidate));
      expect(verdict.digest).assertEqual(again.digest);
      expect(verdict.token()).assertEqual(again.token());
      expect(evaluateDescriptor(candidate, []).allowed).assertFalse();
      logStep("stubSecurityAdmitsSingleCharacterDescriptor", verdict.token());
    });

    /**
     * @tc.name          stubSecurityAdmitsUnderscorePairDescriptor
     * @tc.desc          A well-formed descriptor labelled underscore pair is admitted when it is the only allowlist entry.
     * @tc.precondition  A dedicated allowlist is built that contains exactly the candidate descriptor.
     * @tc.steps         1. Construct the candidate descriptor string underscore pair.
     *                   2. Evaluate it with evaluateDescriptor against the dedicated allowlist.
     *                   3. Repeat the same evaluation to confirm determinism.
     *                   4. Recompute the digest independently with textFingerprint.
     * @tc.expected      The verdict is allowed, the normalized value equals the candidate, and both evaluations agree.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stubSecurityAdmitsUnderscorePairDescriptor', 0, () => {
      const candidate: string = 'A_B';
      const allow: string[] = [candidate];
      const verdict: DescriptorVerdict = evaluateDescriptor(candidate, allow);
      const again: DescriptorVerdict = evaluateDescriptor(candidate, allow);
      expect(verdict.allowed).assertTrue();
      expect(verdict.reason).assertEqual(REASON_ALLOWED);
      expect(verdict.observed).assertEqual(candidate);
      expect(verdict.normalized).assertEqual(candidate);
      expect(verdict.length).assertEqual(candidate.length);
      expect(verdict.digest).assertEqual(textFingerprint(candidate));
      expect(verdict.digest).assertEqual(again.digest);
      expect(verdict.token()).assertEqual(again.token());
      expect(evaluateDescriptor(candidate, []).allowed).assertFalse();
      logStep("stubSecurityAdmitsUnderscorePairDescriptor", verdict.token());
    });

    /**
     * @tc.name          stubSecurityAdmitsDottedDescriptor
     * @tc.desc          A well-formed descriptor labelled dotted name is admitted when it is the only allowlist entry.
     * @tc.precondition  A dedicated allowlist is built that contains exactly the candidate descriptor.
     * @tc.steps         1. Construct the candidate descriptor string dotted name.
     *                   2. Evaluate it with evaluateDescriptor against the dedicated allowlist.
     *                   3. Repeat the same evaluation to confirm determinism.
     *                   4. Recompute the digest independently with textFingerprint.
     * @tc.expected      The verdict is allowed, the normalized value equals the candidate, and both evaluations agree.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stubSecurityAdmitsDottedDescriptor', 0, () => {
      const candidate: string = 'x.y';
      const allow: string[] = [candidate];
      const verdict: DescriptorVerdict = evaluateDescriptor(candidate, allow);
      const again: DescriptorVerdict = evaluateDescriptor(candidate, allow);
      expect(verdict.allowed).assertTrue();
      expect(verdict.reason).assertEqual(REASON_ALLOWED);
      expect(verdict.observed).assertEqual(candidate);
      expect(verdict.normalized).assertEqual(candidate);
      expect(verdict.length).assertEqual(candidate.length);
      expect(verdict.digest).assertEqual(textFingerprint(candidate));
      expect(verdict.digest).assertEqual(again.digest);
      expect(verdict.token()).assertEqual(again.token());
      expect(evaluateDescriptor(candidate, []).allowed).assertFalse();
      logStep("stubSecurityAdmitsDottedDescriptor", verdict.token());
    });

    /**
     * @tc.name          stubSecurityAdmitsHyphenatedServiceName
     * @tc.desc          A well-formed descriptor labelled hyphenated name is admitted when it is the only allowlist entry.
     * @tc.precondition  A dedicated allowlist is built that contains exactly the candidate descriptor.
     * @tc.steps         1. Construct the candidate descriptor string hyphenated name.
     *                   2. Evaluate it with evaluateDescriptor against the dedicated allowlist.
     *                   3. Repeat the same evaluation to confirm determinism.
     *                   4. Recompute the digest independently with textFingerprint.
     * @tc.expected      The verdict is allowed, the normalized value equals the candidate, and both evaluations agree.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stubSecurityAdmitsHyphenatedServiceName', 0, () => {
      const candidate: string = 'svc-1';
      const allow: string[] = [candidate];
      const verdict: DescriptorVerdict = evaluateDescriptor(candidate, allow);
      const again: DescriptorVerdict = evaluateDescriptor(candidate, allow);
      expect(verdict.allowed).assertTrue();
      expect(verdict.reason).assertEqual(REASON_ALLOWED);
      expect(verdict.observed).assertEqual(candidate);
      expect(verdict.normalized).assertEqual(candidate);
      expect(verdict.length).assertEqual(candidate.length);
      expect(verdict.digest).assertEqual(textFingerprint(candidate));
      expect(verdict.digest).assertEqual(again.digest);
      expect(verdict.token()).assertEqual(again.token());
      expect(evaluateDescriptor(candidate, []).allowed).assertFalse();
      logStep("stubSecurityAdmitsHyphenatedServiceName", verdict.token());
    });

    /**
     * @tc.name          stubSecurityAdmitsMixedUnderscoreDescriptor
     * @tc.desc          A well-formed descriptor labelled mixed underscore is admitted when it is the only allowlist entry.
     * @tc.precondition  A dedicated allowlist is built that contains exactly the candidate descriptor.
     * @tc.steps         1. Construct the candidate descriptor string mixed underscore.
     *                   2. Evaluate it with evaluateDescriptor against the dedicated allowlist.
     *                   3. Repeat the same evaluation to confirm determinism.
     *                   4. Recompute the digest independently with textFingerprint.
     * @tc.expected      The verdict is allowed, the normalized value equals the candidate, and both evaluations agree.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stubSecurityAdmitsMixedUnderscoreDescriptor', 0, () => {
      const candidate: string = 'IPC_Stub';
      const allow: string[] = [candidate];
      const verdict: DescriptorVerdict = evaluateDescriptor(candidate, allow);
      const again: DescriptorVerdict = evaluateDescriptor(candidate, allow);
      expect(verdict.allowed).assertTrue();
      expect(verdict.reason).assertEqual(REASON_ALLOWED);
      expect(verdict.observed).assertEqual(candidate);
      expect(verdict.normalized).assertEqual(candidate);
      expect(verdict.length).assertEqual(candidate.length);
      expect(verdict.digest).assertEqual(textFingerprint(candidate));
      expect(verdict.digest).assertEqual(again.digest);
      expect(verdict.token()).assertEqual(again.token());
      expect(evaluateDescriptor(candidate, []).allowed).assertFalse();
      logStep("stubSecurityAdmitsMixedUnderscoreDescriptor", verdict.token());
    });

    /**
     * @tc.name          stubSecurityAdmitsNumericSuffixDescriptor
     * @tc.desc          A well-formed descriptor labelled numeric suffix is admitted when it is the only allowlist entry.
     * @tc.precondition  A dedicated allowlist is built that contains exactly the candidate descriptor.
     * @tc.steps         1. Construct the candidate descriptor string numeric suffix.
     *                   2. Evaluate it with evaluateDescriptor against the dedicated allowlist.
     *                   3. Repeat the same evaluation to confirm determinism.
     *                   4. Recompute the digest independently with textFingerprint.
     * @tc.expected      The verdict is allowed, the normalized value equals the candidate, and both evaluations agree.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stubSecurityAdmitsNumericSuffixDescriptor', 0, () => {
      const candidate: string = 'stub01';
      const allow: string[] = [candidate];
      const verdict: DescriptorVerdict = evaluateDescriptor(candidate, allow);
      const again: DescriptorVerdict = evaluateDescriptor(candidate, allow);
      expect(verdict.allowed).assertTrue();
      expect(verdict.reason).assertEqual(REASON_ALLOWED);
      expect(verdict.observed).assertEqual(candidate);
      expect(verdict.normalized).assertEqual(candidate);
      expect(verdict.length).assertEqual(candidate.length);
      expect(verdict.digest).assertEqual(textFingerprint(candidate));
      expect(verdict.digest).assertEqual(again.digest);
      expect(verdict.token()).assertEqual(again.token());
      expect(evaluateDescriptor(candidate, []).allowed).assertFalse();
      logStep("stubSecurityAdmitsNumericSuffixDescriptor", verdict.token());
    });

    /**
     * @tc.name          stubSecurityAdmitsShortAlphanumericDescriptor
     * @tc.desc          A well-formed descriptor labelled short alphanumeric is admitted when it is the only allowlist entry.
     * @tc.precondition  A dedicated allowlist is built that contains exactly the candidate descriptor.
     * @tc.steps         1. Construct the candidate descriptor string short alphanumeric.
     *                   2. Evaluate it with evaluateDescriptor against the dedicated allowlist.
     *                   3. Repeat the same evaluation to confirm determinism.
     *                   4. Recompute the digest independently with textFingerprint.
     * @tc.expected      The verdict is allowed, the normalized value equals the candidate, and both evaluations agree.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stubSecurityAdmitsShortAlphanumericDescriptor', 0, () => {
      const candidate: string = 'Z9';
      const allow: string[] = [candidate];
      const verdict: DescriptorVerdict = evaluateDescriptor(candidate, allow);
      const again: DescriptorVerdict = evaluateDescriptor(candidate, allow);
      expect(verdict.allowed).assertTrue();
      expect(verdict.reason).assertEqual(REASON_ALLOWED);
      expect(verdict.observed).assertEqual(candidate);
      expect(verdict.normalized).assertEqual(candidate);
      expect(verdict.length).assertEqual(candidate.length);
      expect(verdict.digest).assertEqual(textFingerprint(candidate));
      expect(verdict.digest).assertEqual(again.digest);
      expect(verdict.token()).assertEqual(again.token());
      expect(evaluateDescriptor(candidate, []).allowed).assertFalse();
      logStep("stubSecurityAdmitsShortAlphanumericDescriptor", verdict.token());
    });

    /**
     * @tc.name          stubSecurityAdmitsLowercaseEntryWhenListedVerbatim
     * @tc.desc          A well-formed descriptor labelled lowercase verbatim is admitted when it is the only allowlist entry.
     * @tc.precondition  A dedicated allowlist is built that contains exactly the candidate descriptor.
     * @tc.steps         1. Construct the candidate descriptor string lowercase verbatim.
     *                   2. Evaluate it with evaluateDescriptor against the dedicated allowlist.
     *                   3. Repeat the same evaluation to confirm determinism.
     *                   4. Recompute the digest independently with textFingerprint.
     * @tc.expected      The verdict is allowed, the normalized value equals the candidate, and both evaluations agree.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stubSecurityAdmitsLowercaseEntryWhenListedVerbatim', 0, () => {
      const candidate: string = 'ipcstubtest';
      const allow: string[] = [candidate];
      const verdict: DescriptorVerdict = evaluateDescriptor(candidate, allow);
      const again: DescriptorVerdict = evaluateDescriptor(candidate, allow);
      expect(verdict.allowed).assertTrue();
      expect(verdict.reason).assertEqual(REASON_ALLOWED);
      expect(verdict.observed).assertEqual(candidate);
      expect(verdict.normalized).assertEqual(candidate);
      expect(verdict.length).assertEqual(candidate.length);
      expect(verdict.digest).assertEqual(textFingerprint(candidate));
      expect(verdict.digest).assertEqual(again.digest);
      expect(verdict.token()).assertEqual(again.token());
      expect(evaluateDescriptor(candidate, []).allowed).assertFalse();
      logStep("stubSecurityAdmitsLowercaseEntryWhenListedVerbatim", verdict.token());
    });

    /**
     * @tc.name          stubSecurityRejectsEmptyDescriptor
     * @tc.desc          The descriptor variant described as empty value is refused before any request reaches the stub.
     * @tc.precondition  A gated stub is created with the candidate descriptor and the production allowlist.
     * @tc.steps         1. Create a GatedStub for the candidate empty value.
     *                   2. Send request code 1 through the gate.
     *                   3. Inspect the verdict reason and the gate counters.
     *                   4. Confirm the underlying stub recorded no request.
     * @tc.expected      The gate blocks the request, reports the expected reason, and leaves the stub ledger empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSecurityRejectsEmptyDescriptor', 0, () => {
      const candidate: string = '';
      const gate: GatedStub = new GatedStub(candidate);
      const result: RequestResultModel = gate.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(gate.verdict.allowed).assertFalse();
      expect(gate.verdict.reason).assertEqual("empty");
      expect(gate.verdict.length).assertEqual(candidate.length);
      expect(result.isSuccess()).assertFalse();
      expect(result.errCode).assertEqual(ERROR_STUB_REJECTED);
      expect(result.replyText).assertEqual('');
      expect(gate.forwarded).assertEqual(0);
      expect(gate.blocked).assertEqual(1);
      expect(gate.blockedCodes[0]).assertEqual(REQUEST_CODE);
      expect(gate.stub.requestCount()).assertEqual(0);
      expect(gate.stub.descriptor).assertEqual(candidate);
      logStep("stubSecurityRejectsEmptyDescriptor", gate.verdict.token());
    });

    /**
     * @tc.name          stubSecurityRejectsWhitespaceOnlyDescriptor
     * @tc.desc          The descriptor variant described as whitespace only is refused before any request reaches the stub.
     * @tc.precondition  A gated stub is created with the candidate descriptor and the production allowlist.
     * @tc.steps         1. Create a GatedStub for the candidate whitespace only.
     *                   2. Send request code 1 through the gate.
     *                   3. Inspect the verdict reason and the gate counters.
     *                   4. Confirm the underlying stub recorded no request.
     * @tc.expected      The gate blocks the request, reports the expected reason, and leaves the stub ledger empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSecurityRejectsWhitespaceOnlyDescriptor', 0, () => {
      const candidate: string = '   ';
      const gate: GatedStub = new GatedStub(candidate);
      const result: RequestResultModel = gate.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(gate.verdict.allowed).assertFalse();
      expect(gate.verdict.reason).assertEqual("blank");
      expect(gate.verdict.length).assertEqual(candidate.length);
      expect(result.isSuccess()).assertFalse();
      expect(result.errCode).assertEqual(ERROR_STUB_REJECTED);
      expect(result.replyText).assertEqual('');
      expect(gate.forwarded).assertEqual(0);
      expect(gate.blocked).assertEqual(1);
      expect(gate.blockedCodes[0]).assertEqual(REQUEST_CODE);
      expect(gate.stub.requestCount()).assertEqual(0);
      expect(gate.stub.descriptor).assertEqual(candidate);
      logStep("stubSecurityRejectsWhitespaceOnlyDescriptor", gate.verdict.token());
    });

    /**
     * @tc.name          stubSecurityRejectsTrailingSpaceDescriptor
     * @tc.desc          The descriptor variant described as trailing space is refused before any request reaches the stub.
     * @tc.precondition  A gated stub is created with the candidate descriptor and the production allowlist.
     * @tc.steps         1. Create a GatedStub for the candidate trailing space.
     *                   2. Send request code 1 through the gate.
     *                   3. Inspect the verdict reason and the gate counters.
     *                   4. Confirm the underlying stub recorded no request.
     * @tc.expected      The gate blocks the request, reports the expected reason, and leaves the stub ledger empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSecurityRejectsTrailingSpaceDescriptor', 0, () => {
      const candidate: string = 'IPCStubTest ';
      const gate: GatedStub = new GatedStub(candidate);
      const result: RequestResultModel = gate.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(gate.verdict.allowed).assertFalse();
      expect(gate.verdict.reason).assertEqual("shape");
      expect(gate.verdict.length).assertEqual(candidate.length);
      expect(result.isSuccess()).assertFalse();
      expect(result.errCode).assertEqual(ERROR_STUB_REJECTED);
      expect(result.replyText).assertEqual('');
      expect(gate.forwarded).assertEqual(0);
      expect(gate.blocked).assertEqual(1);
      expect(gate.blockedCodes[0]).assertEqual(REQUEST_CODE);
      expect(gate.stub.requestCount()).assertEqual(0);
      expect(gate.stub.descriptor).assertEqual(candidate);
      logStep("stubSecurityRejectsTrailingSpaceDescriptor", gate.verdict.token());
    });

    /**
     * @tc.name          stubSecurityRejectsLeadingSpaceDescriptor
     * @tc.desc          The descriptor variant described as leading space is refused before any request reaches the stub.
     * @tc.precondition  A gated stub is created with the candidate descriptor and the production allowlist.
     * @tc.steps         1. Create a GatedStub for the candidate leading space.
     *                   2. Send request code 1 through the gate.
     *                   3. Inspect the verdict reason and the gate counters.
     *                   4. Confirm the underlying stub recorded no request.
     * @tc.expected      The gate blocks the request, reports the expected reason, and leaves the stub ledger empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSecurityRejectsLeadingSpaceDescriptor', 0, () => {
      const candidate: string = ' IPCStubTest';
      const gate: GatedStub = new GatedStub(candidate);
      const result: RequestResultModel = gate.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(gate.verdict.allowed).assertFalse();
      expect(gate.verdict.reason).assertEqual("shape");
      expect(gate.verdict.length).assertEqual(candidate.length);
      expect(result.isSuccess()).assertFalse();
      expect(result.errCode).assertEqual(ERROR_STUB_REJECTED);
      expect(result.replyText).assertEqual('');
      expect(gate.forwarded).assertEqual(0);
      expect(gate.blocked).assertEqual(1);
      expect(gate.blockedCodes[0]).assertEqual(REQUEST_CODE);
      expect(gate.stub.requestCount()).assertEqual(0);
      expect(gate.stub.descriptor).assertEqual(candidate);
      logStep("stubSecurityRejectsLeadingSpaceDescriptor", gate.verdict.token());
    });

    /**
     * @tc.name          stubSecurityRejectsEmbeddedTabDescriptor
     * @tc.desc          The descriptor variant described as embedded tab is refused before any request reaches the stub.
     * @tc.precondition  A gated stub is created with the candidate descriptor and the production allowlist.
     * @tc.steps         1. Create a GatedStub for the candidate embedded tab.
     *                   2. Send request code 1 through the gate.
     *                   3. Inspect the verdict reason and the gate counters.
     *                   4. Confirm the underlying stub recorded no request.
     * @tc.expected      The gate blocks the request, reports the expected reason, and leaves the stub ledger empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSecurityRejectsEmbeddedTabDescriptor', 0, () => {
      const candidate: string = 'IPC\tStub';
      const gate: GatedStub = new GatedStub(candidate);
      const result: RequestResultModel = gate.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(gate.verdict.allowed).assertFalse();
      expect(gate.verdict.reason).assertEqual("shape");
      expect(gate.verdict.length).assertEqual(candidate.length);
      expect(result.isSuccess()).assertFalse();
      expect(result.errCode).assertEqual(ERROR_STUB_REJECTED);
      expect(result.replyText).assertEqual('');
      expect(gate.forwarded).assertEqual(0);
      expect(gate.blocked).assertEqual(1);
      expect(gate.blockedCodes[0]).assertEqual(REQUEST_CODE);
      expect(gate.stub.requestCount()).assertEqual(0);
      expect(gate.stub.descriptor).assertEqual(candidate);
      logStep("stubSecurityRejectsEmbeddedTabDescriptor", gate.verdict.token());
    });

    /**
     * @tc.name          stubSecurityRejectsEmbeddedNewlineDescriptor
     * @tc.desc          The descriptor variant described as embedded newline is refused before any request reaches the stub.
     * @tc.precondition  A gated stub is created with the candidate descriptor and the production allowlist.
     * @tc.steps         1. Create a GatedStub for the candidate embedded newline.
     *                   2. Send request code 1 through the gate.
     *                   3. Inspect the verdict reason and the gate counters.
     *                   4. Confirm the underlying stub recorded no request.
     * @tc.expected      The gate blocks the request, reports the expected reason, and leaves the stub ledger empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSecurityRejectsEmbeddedNewlineDescriptor', 0, () => {
      const candidate: string = 'IPC\nStub';
      const gate: GatedStub = new GatedStub(candidate);
      const result: RequestResultModel = gate.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(gate.verdict.allowed).assertFalse();
      expect(gate.verdict.reason).assertEqual("shape");
      expect(gate.verdict.length).assertEqual(candidate.length);
      expect(result.isSuccess()).assertFalse();
      expect(result.errCode).assertEqual(ERROR_STUB_REJECTED);
      expect(result.replyText).assertEqual('');
      expect(gate.forwarded).assertEqual(0);
      expect(gate.blocked).assertEqual(1);
      expect(gate.blockedCodes[0]).assertEqual(REQUEST_CODE);
      expect(gate.stub.requestCount()).assertEqual(0);
      expect(gate.stub.descriptor).assertEqual(candidate);
      logStep("stubSecurityRejectsEmbeddedNewlineDescriptor", gate.verdict.token());
    });

    /**
     * @tc.name          stubSecurityRejectsLowercaseDescriptor
     * @tc.desc          The descriptor variant described as lowercase variant is refused before any request reaches the stub.
     * @tc.precondition  A gated stub is created with the candidate descriptor and the production allowlist.
     * @tc.steps         1. Create a GatedStub for the candidate lowercase variant.
     *                   2. Send request code 1 through the gate.
     *                   3. Inspect the verdict reason and the gate counters.
     *                   4. Confirm the underlying stub recorded no request.
     * @tc.expected      The gate blocks the request, reports the expected reason, and leaves the stub ledger empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSecurityRejectsLowercaseDescriptor', 0, () => {
      const candidate: string = 'ipcstubtest';
      const gate: GatedStub = new GatedStub(candidate);
      const result: RequestResultModel = gate.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(gate.verdict.allowed).assertFalse();
      expect(gate.verdict.reason).assertEqual("unknown");
      expect(gate.verdict.length).assertEqual(candidate.length);
      expect(result.isSuccess()).assertFalse();
      expect(result.errCode).assertEqual(ERROR_STUB_REJECTED);
      expect(result.replyText).assertEqual('');
      expect(gate.forwarded).assertEqual(0);
      expect(gate.blocked).assertEqual(1);
      expect(gate.blockedCodes[0]).assertEqual(REQUEST_CODE);
      expect(gate.stub.requestCount()).assertEqual(0);
      expect(gate.stub.descriptor).assertEqual(candidate);
      logStep("stubSecurityRejectsLowercaseDescriptor", gate.verdict.token());
    });

    /**
     * @tc.name          stubSecurityRejectsUppercaseDescriptor
     * @tc.desc          The descriptor variant described as uppercase variant is refused before any request reaches the stub.
     * @tc.precondition  A gated stub is created with the candidate descriptor and the production allowlist.
     * @tc.steps         1. Create a GatedStub for the candidate uppercase variant.
     *                   2. Send request code 1 through the gate.
     *                   3. Inspect the verdict reason and the gate counters.
     *                   4. Confirm the underlying stub recorded no request.
     * @tc.expected      The gate blocks the request, reports the expected reason, and leaves the stub ledger empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSecurityRejectsUppercaseDescriptor', 0, () => {
      const candidate: string = 'IPCSTUBTEST';
      const gate: GatedStub = new GatedStub(candidate);
      const result: RequestResultModel = gate.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(gate.verdict.allowed).assertFalse();
      expect(gate.verdict.reason).assertEqual("unknown");
      expect(gate.verdict.length).assertEqual(candidate.length);
      expect(result.isSuccess()).assertFalse();
      expect(result.errCode).assertEqual(ERROR_STUB_REJECTED);
      expect(result.replyText).assertEqual('');
      expect(gate.forwarded).assertEqual(0);
      expect(gate.blocked).assertEqual(1);
      expect(gate.blockedCodes[0]).assertEqual(REQUEST_CODE);
      expect(gate.stub.requestCount()).assertEqual(0);
      expect(gate.stub.descriptor).assertEqual(candidate);
      logStep("stubSecurityRejectsUppercaseDescriptor", gate.verdict.token());
    });

    /**
     * @tc.name          stubSecurityRejectsSuffixedDescriptor
     * @tc.desc          The descriptor variant described as suffixed variant is refused before any request reaches the stub.
     * @tc.precondition  A gated stub is created with the candidate descriptor and the production allowlist.
     * @tc.steps         1. Create a GatedStub for the candidate suffixed variant.
     *                   2. Send request code 1 through the gate.
     *                   3. Inspect the verdict reason and the gate counters.
     *                   4. Confirm the underlying stub recorded no request.
     * @tc.expected      The gate blocks the request, reports the expected reason, and leaves the stub ledger empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSecurityRejectsSuffixedDescriptor', 0, () => {
      const candidate: string = 'IPCStubTestX';
      const gate: GatedStub = new GatedStub(candidate);
      const result: RequestResultModel = gate.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(gate.verdict.allowed).assertFalse();
      expect(gate.verdict.reason).assertEqual("unknown");
      expect(gate.verdict.length).assertEqual(candidate.length);
      expect(result.isSuccess()).assertFalse();
      expect(result.errCode).assertEqual(ERROR_STUB_REJECTED);
      expect(result.replyText).assertEqual('');
      expect(gate.forwarded).assertEqual(0);
      expect(gate.blocked).assertEqual(1);
      expect(gate.blockedCodes[0]).assertEqual(REQUEST_CODE);
      expect(gate.stub.requestCount()).assertEqual(0);
      expect(gate.stub.descriptor).assertEqual(candidate);
      logStep("stubSecurityRejectsSuffixedDescriptor", gate.verdict.token());
    });

    /**
     * @tc.name          stubSecurityRejectsPrefixedDescriptor
     * @tc.desc          The descriptor variant described as prefixed variant is refused before any request reaches the stub.
     * @tc.precondition  A gated stub is created with the candidate descriptor and the production allowlist.
     * @tc.steps         1. Create a GatedStub for the candidate prefixed variant.
     *                   2. Send request code 1 through the gate.
     *                   3. Inspect the verdict reason and the gate counters.
     *                   4. Confirm the underlying stub recorded no request.
     * @tc.expected      The gate blocks the request, reports the expected reason, and leaves the stub ledger empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSecurityRejectsPrefixedDescriptor', 0, () => {
      const candidate: string = 'XIPCStubTest';
      const gate: GatedStub = new GatedStub(candidate);
      const result: RequestResultModel = gate.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(gate.verdict.allowed).assertFalse();
      expect(gate.verdict.reason).assertEqual("unknown");
      expect(gate.verdict.length).assertEqual(candidate.length);
      expect(result.isSuccess()).assertFalse();
      expect(result.errCode).assertEqual(ERROR_STUB_REJECTED);
      expect(result.replyText).assertEqual('');
      expect(gate.forwarded).assertEqual(0);
      expect(gate.blocked).assertEqual(1);
      expect(gate.blockedCodes[0]).assertEqual(REQUEST_CODE);
      expect(gate.stub.requestCount()).assertEqual(0);
      expect(gate.stub.descriptor).assertEqual(candidate);
      logStep("stubSecurityRejectsPrefixedDescriptor", gate.verdict.token());
    });

    /**
     * @tc.name          stubSecurityRejectsParentTraversalDescriptor
     * @tc.desc          The descriptor variant described as parent traversal is refused before any request reaches the stub.
     * @tc.precondition  A gated stub is created with the candidate descriptor and the production allowlist.
     * @tc.steps         1. Create a GatedStub for the candidate parent traversal.
     *                   2. Send request code 1 through the gate.
     *                   3. Inspect the verdict reason and the gate counters.
     *                   4. Confirm the underlying stub recorded no request.
     * @tc.expected      The gate blocks the request, reports the expected reason, and leaves the stub ledger empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSecurityRejectsParentTraversalDescriptor', 0, () => {
      const candidate: string = '../IPCStubTest';
      const gate: GatedStub = new GatedStub(candidate);
      const result: RequestResultModel = gate.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(gate.verdict.allowed).assertFalse();
      expect(gate.verdict.reason).assertEqual("shape");
      expect(gate.verdict.length).assertEqual(candidate.length);
      expect(result.isSuccess()).assertFalse();
      expect(result.errCode).assertEqual(ERROR_STUB_REJECTED);
      expect(result.replyText).assertEqual('');
      expect(gate.forwarded).assertEqual(0);
      expect(gate.blocked).assertEqual(1);
      expect(gate.blockedCodes[0]).assertEqual(REQUEST_CODE);
      expect(gate.stub.requestCount()).assertEqual(0);
      expect(gate.stub.descriptor).assertEqual(candidate);
      logStep("stubSecurityRejectsParentTraversalDescriptor", gate.verdict.token());
    });

    /**
     * @tc.name          stubSecurityRejectsForwardSlashDescriptor
     * @tc.desc          The descriptor variant described as forward slash is refused before any request reaches the stub.
     * @tc.precondition  A gated stub is created with the candidate descriptor and the production allowlist.
     * @tc.steps         1. Create a GatedStub for the candidate forward slash.
     *                   2. Send request code 1 through the gate.
     *                   3. Inspect the verdict reason and the gate counters.
     *                   4. Confirm the underlying stub recorded no request.
     * @tc.expected      The gate blocks the request, reports the expected reason, and leaves the stub ledger empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSecurityRejectsForwardSlashDescriptor', 0, () => {
      const candidate: string = 'IPC/Stub';
      const gate: GatedStub = new GatedStub(candidate);
      const result: RequestResultModel = gate.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(gate.verdict.allowed).assertFalse();
      expect(gate.verdict.reason).assertEqual("shape");
      expect(gate.verdict.length).assertEqual(candidate.length);
      expect(result.isSuccess()).assertFalse();
      expect(result.errCode).assertEqual(ERROR_STUB_REJECTED);
      expect(result.replyText).assertEqual('');
      expect(gate.forwarded).assertEqual(0);
      expect(gate.blocked).assertEqual(1);
      expect(gate.blockedCodes[0]).assertEqual(REQUEST_CODE);
      expect(gate.stub.requestCount()).assertEqual(0);
      expect(gate.stub.descriptor).assertEqual(candidate);
      logStep("stubSecurityRejectsForwardSlashDescriptor", gate.verdict.token());
    });

    /**
     * @tc.name          stubSecurityRejectsBackslashDescriptor
     * @tc.desc          The descriptor variant described as backslash separator is refused before any request reaches the stub.
     * @tc.precondition  A gated stub is created with the candidate descriptor and the production allowlist.
     * @tc.steps         1. Create a GatedStub for the candidate backslash separator.
     *                   2. Send request code 1 through the gate.
     *                   3. Inspect the verdict reason and the gate counters.
     *                   4. Confirm the underlying stub recorded no request.
     * @tc.expected      The gate blocks the request, reports the expected reason, and leaves the stub ledger empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSecurityRejectsBackslashDescriptor', 0, () => {
      const candidate: string = 'IPC\\Stub';
      const gate: GatedStub = new GatedStub(candidate);
      const result: RequestResultModel = gate.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(gate.verdict.allowed).assertFalse();
      expect(gate.verdict.reason).assertEqual("shape");
      expect(gate.verdict.length).assertEqual(candidate.length);
      expect(result.isSuccess()).assertFalse();
      expect(result.errCode).assertEqual(ERROR_STUB_REJECTED);
      expect(result.replyText).assertEqual('');
      expect(gate.forwarded).assertEqual(0);
      expect(gate.blocked).assertEqual(1);
      expect(gate.blockedCodes[0]).assertEqual(REQUEST_CODE);
      expect(gate.stub.requestCount()).assertEqual(0);
      expect(gate.stub.descriptor).assertEqual(candidate);
      logStep("stubSecurityRejectsBackslashDescriptor", gate.verdict.token());
    });

    /**
     * @tc.name          stubSecurityRejectsNullByteDescriptor
     * @tc.desc          The descriptor variant described as null byte suffix is refused before any request reaches the stub.
     * @tc.precondition  A gated stub is created with the candidate descriptor and the production allowlist.
     * @tc.steps         1. Create a GatedStub for the candidate null byte suffix.
     *                   2. Send request code 1 through the gate.
     *                   3. Inspect the verdict reason and the gate counters.
     *                   4. Confirm the underlying stub recorded no request.
     * @tc.expected      The gate blocks the request, reports the expected reason, and leaves the stub ledger empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSecurityRejectsNullByteDescriptor', 0, () => {
      const candidate: string = 'IPC\u0000Stub';
      const gate: GatedStub = new GatedStub(candidate);
      const result: RequestResultModel = gate.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(gate.verdict.allowed).assertFalse();
      expect(gate.verdict.reason).assertEqual("shape");
      expect(gate.verdict.length).assertEqual(candidate.length);
      expect(result.isSuccess()).assertFalse();
      expect(result.errCode).assertEqual(ERROR_STUB_REJECTED);
      expect(result.replyText).assertEqual('');
      expect(gate.forwarded).assertEqual(0);
      expect(gate.blocked).assertEqual(1);
      expect(gate.blockedCodes[0]).assertEqual(REQUEST_CODE);
      expect(gate.stub.requestCount()).assertEqual(0);
      expect(gate.stub.descriptor).assertEqual(candidate);
      logStep("stubSecurityRejectsNullByteDescriptor", gate.verdict.token());
    });

    /**
     * @tc.name          stubSecurityRejectsNonAsciiDescriptor
     * @tc.desc          The descriptor variant described as non ascii suffix is refused before any request reaches the stub.
     * @tc.precondition  A gated stub is created with the candidate descriptor and the production allowlist.
     * @tc.steps         1. Create a GatedStub for the candidate non ascii suffix.
     *                   2. Send request code 1 through the gate.
     *                   3. Inspect the verdict reason and the gate counters.
     *                   4. Confirm the underlying stub recorded no request.
     * @tc.expected      The gate blocks the request, reports the expected reason, and leaves the stub ledger empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSecurityRejectsNonAsciiDescriptor', 0, () => {
      const candidate: string = 'IPC\u8282\u70b9';
      const gate: GatedStub = new GatedStub(candidate);
      const result: RequestResultModel = gate.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(gate.verdict.allowed).assertFalse();
      expect(gate.verdict.reason).assertEqual("shape");
      expect(gate.verdict.length).assertEqual(candidate.length);
      expect(result.isSuccess()).assertFalse();
      expect(result.errCode).assertEqual(ERROR_STUB_REJECTED);
      expect(result.replyText).assertEqual('');
      expect(gate.forwarded).assertEqual(0);
      expect(gate.blocked).assertEqual(1);
      expect(gate.blockedCodes[0]).assertEqual(REQUEST_CODE);
      expect(gate.stub.requestCount()).assertEqual(0);
      expect(gate.stub.descriptor).assertEqual(candidate);
      logStep("stubSecurityRejectsNonAsciiDescriptor", gate.verdict.token());
    });

    /**
     * @tc.name          stubSecurityRejectsUnlistedWellFormedDescriptor
     * @tc.desc          The descriptor variant described as unlisted well formed is refused before any request reaches the stub.
     * @tc.precondition  A gated stub is created with the candidate descriptor and the production allowlist.
     * @tc.steps         1. Create a GatedStub for the candidate unlisted well formed.
     *                   2. Send request code 1 through the gate.
     *                   3. Inspect the verdict reason and the gate counters.
     *                   4. Confirm the underlying stub recorded no request.
     * @tc.expected      The gate blocks the request, reports the expected reason, and leaves the stub ledger empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSecurityRejectsUnlistedWellFormedDescriptor', 0, () => {
      const candidate: string = 'IPCStubTest2';
      const gate: GatedStub = new GatedStub(candidate);
      const result: RequestResultModel = gate.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(gate.verdict.allowed).assertFalse();
      expect(gate.verdict.reason).assertEqual("unknown");
      expect(gate.verdict.length).assertEqual(candidate.length);
      expect(result.isSuccess()).assertFalse();
      expect(result.errCode).assertEqual(ERROR_STUB_REJECTED);
      expect(result.replyText).assertEqual('');
      expect(gate.forwarded).assertEqual(0);
      expect(gate.blocked).assertEqual(1);
      expect(gate.blockedCodes[0]).assertEqual(REQUEST_CODE);
      expect(gate.stub.requestCount()).assertEqual(0);
      expect(gate.stub.descriptor).assertEqual(candidate);
      logStep("stubSecurityRejectsUnlistedWellFormedDescriptor", gate.verdict.token());
    });

    /**
     * @tc.name          stubSecurityRejectsDoubleDotDescriptor
     * @tc.desc          The descriptor variant described as double dot is refused before any request reaches the stub.
     * @tc.precondition  A gated stub is created with the candidate descriptor and the production allowlist.
     * @tc.steps         1. Create a GatedStub for the candidate double dot.
     *                   2. Send request code 1 through the gate.
     *                   3. Inspect the verdict reason and the gate counters.
     *                   4. Confirm the underlying stub recorded no request.
     * @tc.expected      The gate blocks the request, reports the expected reason, and leaves the stub ledger empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSecurityRejectsDoubleDotDescriptor', 0, () => {
      const candidate: string = 'IPC..Stub';
      const gate: GatedStub = new GatedStub(candidate);
      const result: RequestResultModel = gate.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(gate.verdict.allowed).assertFalse();
      expect(gate.verdict.reason).assertEqual("shape");
      expect(gate.verdict.length).assertEqual(candidate.length);
      expect(result.isSuccess()).assertFalse();
      expect(result.errCode).assertEqual(ERROR_STUB_REJECTED);
      expect(result.replyText).assertEqual('');
      expect(gate.forwarded).assertEqual(0);
      expect(gate.blocked).assertEqual(1);
      expect(gate.blockedCodes[0]).assertEqual(REQUEST_CODE);
      expect(gate.stub.requestCount()).assertEqual(0);
      expect(gate.stub.descriptor).assertEqual(candidate);
      logStep("stubSecurityRejectsDoubleDotDescriptor", gate.verdict.token());
    });

    /**
     * @tc.name          stubSecurityGateForwardsProductionCode
     * @tc.desc          A trusted descriptor forwards code 1 to the stub and mirrors the production outcome.
     * @tc.precondition  A GatedStub is constructed with the production descriptor and production allowlist.
     * @tc.steps         1. Create the gated stub with the trusted descriptor.
     *                   2. Send request code 1 with the production payload.
     *                   3. Read the last stub record together with aggregate metrics.
     *                   4. Compare the outcome with the code oracle.
     * @tc.expected      The gate forwards exactly one request and the result follows the single-code protocol.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSecurityGateForwardsProductionCode', 0, () => {
      const gate: GatedStub = new GatedStub(STUB_DESCRIPTOR);
      const result: RequestResultModel = gate.send(1, REQUEST_PAYLOAD);
      const record = gate.stub.lastRequest();
      const metrics: StubMetrics = StubMetrics.from(gate.stub);
      expect(gate.verdict.allowed).assertTrue();
      expect(gate.forwarded).assertEqual(1);
      expect(gate.blocked).assertEqual(0);
      expect(result.errCode).assertEqual(true ? ERROR_NONE : ERROR_STUB_REJECTED);
      expect(result.handled).assertEqual(true);
      expect(gate.stub.requestCount()).assertEqual(1);
      expect(record?.code).assertEqual(1);
      expect(metrics.requests).assertEqual(1);
      expect(metrics.handled).assertEqual(true ? 1 : 0);
      expect(metrics.rejected).assertEqual(true ? 0 : 1);
      expect(result.replyText).assertEqual(true ? REPLY_PAYLOAD : '');
      logStep("stubSecurityGateForwardsProductionCode", result.errCode + ":" + result.replyText);
    });

    /**
     * @tc.name          stubSecurityGateRejectsZeroCode
     * @tc.desc          A trusted descriptor forwards code 0 to the stub and mirrors the production outcome.
     * @tc.precondition  A GatedStub is constructed with the production descriptor and production allowlist.
     * @tc.steps         1. Create the gated stub with the trusted descriptor.
     *                   2. Send request code 0 with the production payload.
     *                   3. Read the last stub record together with aggregate metrics.
     *                   4. Compare the outcome with the code oracle.
     * @tc.expected      The gate forwards exactly one request and the result follows the single-code protocol.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSecurityGateRejectsZeroCode', 0, () => {
      const gate: GatedStub = new GatedStub(STUB_DESCRIPTOR);
      const result: RequestResultModel = gate.send(0, REQUEST_PAYLOAD);
      const record = gate.stub.lastRequest();
      const metrics: StubMetrics = StubMetrics.from(gate.stub);
      expect(gate.verdict.allowed).assertTrue();
      expect(gate.forwarded).assertEqual(1);
      expect(gate.blocked).assertEqual(0);
      expect(result.errCode).assertEqual(false ? ERROR_NONE : ERROR_STUB_REJECTED);
      expect(result.handled).assertEqual(false);
      expect(gate.stub.requestCount()).assertEqual(1);
      expect(record?.code).assertEqual(0);
      expect(metrics.requests).assertEqual(1);
      expect(metrics.handled).assertEqual(false ? 1 : 0);
      expect(metrics.rejected).assertEqual(false ? 0 : 1);
      expect(result.replyText).assertEqual(false ? REPLY_PAYLOAD : '');
      logStep("stubSecurityGateRejectsZeroCode", result.errCode + ":" + result.replyText);
    });

    /**
     * @tc.name          stubSecurityGateRejectsCodeTwo
     * @tc.desc          A trusted descriptor forwards code 2 to the stub and mirrors the production outcome.
     * @tc.precondition  A GatedStub is constructed with the production descriptor and production allowlist.
     * @tc.steps         1. Create the gated stub with the trusted descriptor.
     *                   2. Send request code 2 with the production payload.
     *                   3. Read the last stub record together with aggregate metrics.
     *                   4. Compare the outcome with the code oracle.
     * @tc.expected      The gate forwards exactly one request and the result follows the single-code protocol.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSecurityGateRejectsCodeTwo', 0, () => {
      const gate: GatedStub = new GatedStub(STUB_DESCRIPTOR);
      const result: RequestResultModel = gate.send(2, REQUEST_PAYLOAD);
      const record = gate.stub.lastRequest();
      const metrics: StubMetrics = StubMetrics.from(gate.stub);
      expect(gate.verdict.allowed).assertTrue();
      expect(gate.forwarded).assertEqual(1);
      expect(gate.blocked).assertEqual(0);
      expect(result.errCode).assertEqual(false ? ERROR_NONE : ERROR_STUB_REJECTED);
      expect(result.handled).assertEqual(false);
      expect(gate.stub.requestCount()).assertEqual(1);
      expect(record?.code).assertEqual(2);
      expect(metrics.requests).assertEqual(1);
      expect(metrics.handled).assertEqual(false ? 1 : 0);
      expect(metrics.rejected).assertEqual(false ? 0 : 1);
      expect(result.replyText).assertEqual(false ? REPLY_PAYLOAD : '');
      logStep("stubSecurityGateRejectsCodeTwo", result.errCode + ":" + result.replyText);
    });

    /**
     * @tc.name          stubSecurityGateRejectsNegativeCode
     * @tc.desc          A trusted descriptor forwards code -1 to the stub and mirrors the production outcome.
     * @tc.precondition  A GatedStub is constructed with the production descriptor and production allowlist.
     * @tc.steps         1. Create the gated stub with the trusted descriptor.
     *                   2. Send request code -1 with the production payload.
     *                   3. Read the last stub record together with aggregate metrics.
     *                   4. Compare the outcome with the code oracle.
     * @tc.expected      The gate forwards exactly one request and the result follows the single-code protocol.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSecurityGateRejectsNegativeCode', 0, () => {
      const gate: GatedStub = new GatedStub(STUB_DESCRIPTOR);
      const result: RequestResultModel = gate.send(-1, REQUEST_PAYLOAD);
      const record = gate.stub.lastRequest();
      const metrics: StubMetrics = StubMetrics.from(gate.stub);
      expect(gate.verdict.allowed).assertTrue();
      expect(gate.forwarded).assertEqual(1);
      expect(gate.blocked).assertEqual(0);
      expect(result.errCode).assertEqual(false ? ERROR_NONE : ERROR_STUB_REJECTED);
      expect(result.handled).assertEqual(false);
      expect(gate.stub.requestCount()).assertEqual(1);
      expect(record?.code).assertEqual(-1);
      expect(metrics.requests).assertEqual(1);
      expect(metrics.handled).assertEqual(false ? 1 : 0);
      expect(metrics.rejected).assertEqual(false ? 0 : 1);
      expect(result.replyText).assertEqual(false ? REPLY_PAYLOAD : '');
      logStep("stubSecurityGateRejectsNegativeCode", result.errCode + ":" + result.replyText);
    });

    /**
     * @tc.name          stubSecurityGateRejectsLargeCode
     * @tc.desc          A trusted descriptor forwards code 99 to the stub and mirrors the production outcome.
     * @tc.precondition  A GatedStub is constructed with the production descriptor and production allowlist.
     * @tc.steps         1. Create the gated stub with the trusted descriptor.
     *                   2. Send request code 99 with the production payload.
     *                   3. Read the last stub record together with aggregate metrics.
     *                   4. Compare the outcome with the code oracle.
     * @tc.expected      The gate forwards exactly one request and the result follows the single-code protocol.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSecurityGateRejectsLargeCode', 0, () => {
      const gate: GatedStub = new GatedStub(STUB_DESCRIPTOR);
      const result: RequestResultModel = gate.send(99, REQUEST_PAYLOAD);
      const record = gate.stub.lastRequest();
      const metrics: StubMetrics = StubMetrics.from(gate.stub);
      expect(gate.verdict.allowed).assertTrue();
      expect(gate.forwarded).assertEqual(1);
      expect(gate.blocked).assertEqual(0);
      expect(result.errCode).assertEqual(false ? ERROR_NONE : ERROR_STUB_REJECTED);
      expect(result.handled).assertEqual(false);
      expect(gate.stub.requestCount()).assertEqual(1);
      expect(record?.code).assertEqual(99);
      expect(metrics.requests).assertEqual(1);
      expect(metrics.handled).assertEqual(false ? 1 : 0);
      expect(metrics.rejected).assertEqual(false ? 0 : 1);
      expect(result.replyText).assertEqual(false ? REPLY_PAYLOAD : '');
      logStep("stubSecurityGateRejectsLargeCode", result.errCode + ":" + result.replyText);
    });

    /**
     * @tc.name          stubSecurityGateRejectsCodeSeven
     * @tc.desc          A trusted descriptor forwards code 7 to the stub and mirrors the production outcome.
     * @tc.precondition  A GatedStub is constructed with the production descriptor and production allowlist.
     * @tc.steps         1. Create the gated stub with the trusted descriptor.
     *                   2. Send request code 7 with the production payload.
     *                   3. Read the last stub record together with aggregate metrics.
     *                   4. Compare the outcome with the code oracle.
     * @tc.expected      The gate forwards exactly one request and the result follows the single-code protocol.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSecurityGateRejectsCodeSeven', 0, () => {
      const gate: GatedStub = new GatedStub(STUB_DESCRIPTOR);
      const result: RequestResultModel = gate.send(7, REQUEST_PAYLOAD);
      const record = gate.stub.lastRequest();
      const metrics: StubMetrics = StubMetrics.from(gate.stub);
      expect(gate.verdict.allowed).assertTrue();
      expect(gate.forwarded).assertEqual(1);
      expect(gate.blocked).assertEqual(0);
      expect(result.errCode).assertEqual(false ? ERROR_NONE : ERROR_STUB_REJECTED);
      expect(result.handled).assertEqual(false);
      expect(gate.stub.requestCount()).assertEqual(1);
      expect(record?.code).assertEqual(7);
      expect(metrics.requests).assertEqual(1);
      expect(metrics.handled).assertEqual(false ? 1 : 0);
      expect(metrics.rejected).assertEqual(false ? 0 : 1);
      expect(result.replyText).assertEqual(false ? REPLY_PAYLOAD : '');
      logStep("stubSecurityGateRejectsCodeSeven", result.errCode + ":" + result.replyText);
    });

    /**
     * @tc.name          stubSecuritySeparatesNumberedAndBaseDigests
     * @tc.desc          Two distinct shaped descriptors labelled numbered pair keep independent, stable digests.
     * @tc.precondition  Each descriptor is evaluated against an allowlist containing only itself.
     * @tc.steps         1. Evaluate the first descriptor twice.
     *                   2. Evaluate the second descriptor once.
     *                   3. Compare normalized values, lengths and digests.
     *                   4. Recompute both digests with the fingerprint helper.
     * @tc.expected      Each descriptor is admitted, repeats are stable, and the pair is not conflated.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSecuritySeparatesNumberedAndBaseDigests', 0, () => {
      const first: DescriptorVerdict = evaluateDescriptor('IPCStubTest', ['IPCStubTest']);
      const second: DescriptorVerdict = evaluateDescriptor('IPCStubTest2', ['IPCStubTest2']);
      const repeat: DescriptorVerdict = evaluateDescriptor('IPCStubTest', ['IPCStubTest']);
      expect(first.allowed).assertTrue();
      expect(second.allowed).assertTrue();
      expect(first.normalized).assertEqual('IPCStubTest');
      expect(second.normalized).assertEqual('IPCStubTest2');
      expect(first.digest).assertEqual(textFingerprint('IPCStubTest'));
      expect(second.digest).assertEqual(textFingerprint('IPCStubTest2'));
      expect(first.digest).assertEqual(repeat.digest);
      expect(first.token()).assertEqual(repeat.token());
      expect(first.length).assertEqual('IPCStubTest'.length);
      expect(second.length).assertEqual('IPCStubTest2'.length);
      logStep("stubSecuritySeparatesNumberedAndBaseDigests", String(first.digest) + ":" + String(second.digest));
    });

    /**
     * @tc.name          stubSecuritySeparatesCaseVariantDigests
     * @tc.desc          Two distinct shaped descriptors labelled case pair keep independent, stable digests.
     * @tc.precondition  Each descriptor is evaluated against an allowlist containing only itself.
     * @tc.steps         1. Evaluate the first descriptor twice.
     *                   2. Evaluate the second descriptor once.
     *                   3. Compare normalized values, lengths and digests.
     *                   4. Recompute both digests with the fingerprint helper.
     * @tc.expected      Each descriptor is admitted, repeats are stable, and the pair is not conflated.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSecuritySeparatesCaseVariantDigests', 0, () => {
      const first: DescriptorVerdict = evaluateDescriptor('IPCStubTest', ['IPCStubTest']);
      const second: DescriptorVerdict = evaluateDescriptor('ipcstubtest', ['ipcstubtest']);
      const repeat: DescriptorVerdict = evaluateDescriptor('IPCStubTest', ['IPCStubTest']);
      expect(first.allowed).assertTrue();
      expect(second.allowed).assertTrue();
      expect(first.normalized).assertEqual('IPCStubTest');
      expect(second.normalized).assertEqual('ipcstubtest');
      expect(first.digest).assertEqual(textFingerprint('IPCStubTest'));
      expect(second.digest).assertEqual(textFingerprint('ipcstubtest'));
      expect(first.digest).assertEqual(repeat.digest);
      expect(first.token()).assertEqual(repeat.token());
      expect(first.length).assertEqual('IPCStubTest'.length);
      expect(second.length).assertEqual('ipcstubtest'.length);
      logStep("stubSecuritySeparatesCaseVariantDigests", String(first.digest) + ":" + String(second.digest));
    });

    /**
     * @tc.name          stubSecuritySeparatesAlphaAndCapsDigests
     * @tc.desc          Two distinct shaped descriptors labelled alpha pair keep independent, stable digests.
     * @tc.precondition  Each descriptor is evaluated against an allowlist containing only itself.
     * @tc.steps         1. Evaluate the first descriptor twice.
     *                   2. Evaluate the second descriptor once.
     *                   3. Compare normalized values, lengths and digests.
     *                   4. Recompute both digests with the fingerprint helper.
     * @tc.expected      Each descriptor is admitted, repeats are stable, and the pair is not conflated.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSecuritySeparatesAlphaAndCapsDigests', 0, () => {
      const first: DescriptorVerdict = evaluateDescriptor('alpha', ['alpha']);
      const second: DescriptorVerdict = evaluateDescriptor('Alpha', ['Alpha']);
      const repeat: DescriptorVerdict = evaluateDescriptor('alpha', ['alpha']);
      expect(first.allowed).assertTrue();
      expect(second.allowed).assertTrue();
      expect(first.normalized).assertEqual('alpha');
      expect(second.normalized).assertEqual('Alpha');
      expect(first.digest).assertEqual(textFingerprint('alpha'));
      expect(second.digest).assertEqual(textFingerprint('Alpha'));
      expect(first.digest).assertEqual(repeat.digest);
      expect(first.token()).assertEqual(repeat.token());
      expect(first.length).assertEqual('alpha'.length);
      expect(second.length).assertEqual('Alpha'.length);
      logStep("stubSecuritySeparatesAlphaAndCapsDigests", String(first.digest) + ":" + String(second.digest));
    });

    /**
     * @tc.name          stubSecuritySeparatesHyphenAndUnderscoreDigests
     * @tc.desc          Two distinct shaped descriptors labelled separator pair keep independent, stable digests.
     * @tc.precondition  Each descriptor is evaluated against an allowlist containing only itself.
     * @tc.steps         1. Evaluate the first descriptor twice.
     *                   2. Evaluate the second descriptor once.
     *                   3. Compare normalized values, lengths and digests.
     *                   4. Recompute both digests with the fingerprint helper.
     * @tc.expected      Each descriptor is admitted, repeats are stable, and the pair is not conflated.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSecuritySeparatesHyphenAndUnderscoreDigests', 0, () => {
      const first: DescriptorVerdict = evaluateDescriptor('svc-1', ['svc-1']);
      const second: DescriptorVerdict = evaluateDescriptor('svc_1', ['svc_1']);
      const repeat: DescriptorVerdict = evaluateDescriptor('svc-1', ['svc-1']);
      expect(first.allowed).assertTrue();
      expect(second.allowed).assertTrue();
      expect(first.normalized).assertEqual('svc-1');
      expect(second.normalized).assertEqual('svc_1');
      expect(first.digest).assertEqual(textFingerprint('svc-1'));
      expect(second.digest).assertEqual(textFingerprint('svc_1'));
      expect(first.digest).assertEqual(repeat.digest);
      expect(first.token()).assertEqual(repeat.token());
      expect(first.length).assertEqual('svc-1'.length);
      expect(second.length).assertEqual('svc_1'.length);
      logStep("stubSecuritySeparatesHyphenAndUnderscoreDigests", String(first.digest) + ":" + String(second.digest));
    });

    /**
     * @tc.name          stubSecuritySeparatesPrefixLengthDigests
     * @tc.desc          Two distinct shaped descriptors labelled prefix pair keep independent, stable digests.
     * @tc.precondition  Each descriptor is evaluated against an allowlist containing only itself.
     * @tc.steps         1. Evaluate the first descriptor twice.
     *                   2. Evaluate the second descriptor once.
     *                   3. Compare normalized values, lengths and digests.
     *                   4. Recompute both digests with the fingerprint helper.
     * @tc.expected      Each descriptor is admitted, repeats are stable, and the pair is not conflated.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSecuritySeparatesPrefixLengthDigests', 0, () => {
      const first: DescriptorVerdict = evaluateDescriptor('IPCStub', ['IPCStub']);
      const second: DescriptorVerdict = evaluateDescriptor('IPCStubTest', ['IPCStubTest']);
      const repeat: DescriptorVerdict = evaluateDescriptor('IPCStub', ['IPCStub']);
      expect(first.allowed).assertTrue();
      expect(second.allowed).assertTrue();
      expect(first.normalized).assertEqual('IPCStub');
      expect(second.normalized).assertEqual('IPCStubTest');
      expect(first.digest).assertEqual(textFingerprint('IPCStub'));
      expect(second.digest).assertEqual(textFingerprint('IPCStubTest'));
      expect(first.digest).assertEqual(repeat.digest);
      expect(first.token()).assertEqual(repeat.token());
      expect(first.length).assertEqual('IPCStub'.length);
      expect(second.length).assertEqual('IPCStubTest'.length);
      logStep("stubSecuritySeparatesPrefixLengthDigests", String(first.digest) + ":" + String(second.digest));
    });

    /**
     * @tc.name          stubSecuritySeparatesShortCaseDigests
     * @tc.desc          Two distinct shaped descriptors labelled short pair keep independent, stable digests.
     * @tc.precondition  Each descriptor is evaluated against an allowlist containing only itself.
     * @tc.steps         1. Evaluate the first descriptor twice.
     *                   2. Evaluate the second descriptor once.
     *                   3. Compare normalized values, lengths and digests.
     *                   4. Recompute both digests with the fingerprint helper.
     * @tc.expected      Each descriptor is admitted, repeats are stable, and the pair is not conflated.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSecuritySeparatesShortCaseDigests', 0, () => {
      const first: DescriptorVerdict = evaluateDescriptor('Z9', ['Z9']);
      const second: DescriptorVerdict = evaluateDescriptor('z9', ['z9']);
      const repeat: DescriptorVerdict = evaluateDescriptor('Z9', ['Z9']);
      expect(first.allowed).assertTrue();
      expect(second.allowed).assertTrue();
      expect(first.normalized).assertEqual('Z9');
      expect(second.normalized).assertEqual('z9');
      expect(first.digest).assertEqual(textFingerprint('Z9'));
      expect(second.digest).assertEqual(textFingerprint('z9'));
      expect(first.digest).assertEqual(repeat.digest);
      expect(first.token()).assertEqual(repeat.token());
      expect(first.length).assertEqual('Z9'.length);
      expect(second.length).assertEqual('z9'.length);
      logStep("stubSecuritySeparatesShortCaseDigests", String(first.digest) + ":" + String(second.digest));
    });

    /**
     * @tc.name          stubSecurityExtendsAllowlistWithNumberedVariant
     * @tc.desc          An extended allowlist containing numbered extension admits both entries while the narrow list denies the new one.
     * @tc.precondition  The production allowlist and an extended copy are both available.
     * @tc.steps         1. Build an extended allowlist with the production literal and the extra entry.
     *                   2. Evaluate both descriptors against the extended list.
     *                   3. Evaluate the extra entry against the production list.
     *                   4. Evaluate the production literal against an empty list.
     * @tc.expected      Only the extended list admits the extra entry and the empty list denies everything.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSecurityExtendsAllowlistWithNumberedVariant', 0, () => {
      const extra: string = 'IPCStubTest2';
      const extended: string[] = [STUB_DESCRIPTOR, extra];
      const primary: DescriptorVerdict = evaluateDescriptor(STUB_DESCRIPTOR, extended);
      const secondary: DescriptorVerdict = evaluateDescriptor(extra, extended);
      const narrow: DescriptorVerdict = evaluateDescriptor(extra, TRUSTED);
      const none: DescriptorVerdict = evaluateDescriptor(STUB_DESCRIPTOR, []);
      expect(primary.allowed).assertTrue();
      expect(secondary.allowed).assertTrue();
      expect(narrow.allowed).assertFalse();
      expect(narrow.reason).assertEqual(REASON_UNKNOWN);
      expect(none.allowed).assertFalse();
      expect(none.reason).assertEqual(REASON_UNKNOWN);
      expect(extended.length).assertEqual(2);
      expect(primary.digest === secondary.digest).assertFalse();
      logStep("stubSecurityExtendsAllowlistWithNumberedVariant", primary.token() + ">" + secondary.token());
    });

    /**
     * @tc.name          stubSecurityExtendsAllowlistWithCloneVariant
     * @tc.desc          An extended allowlist containing clone extension admits both entries while the narrow list denies the new one.
     * @tc.precondition  The production allowlist and an extended copy are both available.
     * @tc.steps         1. Build an extended allowlist with the production literal and the extra entry.
     *                   2. Evaluate both descriptors against the extended list.
     *                   3. Evaluate the extra entry against the production list.
     *                   4. Evaluate the production literal against an empty list.
     * @tc.expected      Only the extended list admits the extra entry and the empty list denies everything.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSecurityExtendsAllowlistWithCloneVariant', 0, () => {
      const extra: string = 'IPCStubTestClone';
      const extended: string[] = [STUB_DESCRIPTOR, extra];
      const primary: DescriptorVerdict = evaluateDescriptor(STUB_DESCRIPTOR, extended);
      const secondary: DescriptorVerdict = evaluateDescriptor(extra, extended);
      const narrow: DescriptorVerdict = evaluateDescriptor(extra, TRUSTED);
      const none: DescriptorVerdict = evaluateDescriptor(STUB_DESCRIPTOR, []);
      expect(primary.allowed).assertTrue();
      expect(secondary.allowed).assertTrue();
      expect(narrow.allowed).assertFalse();
      expect(narrow.reason).assertEqual(REASON_UNKNOWN);
      expect(none.allowed).assertFalse();
      expect(none.reason).assertEqual(REASON_UNKNOWN);
      expect(extended.length).assertEqual(2);
      expect(primary.digest === secondary.digest).assertFalse();
      logStep("stubSecurityExtendsAllowlistWithCloneVariant", primary.token() + ">" + secondary.token());
    });

    /**
     * @tc.name          stubSecurityExtendsAllowlistWithClientStub
     * @tc.desc          An extended allowlist containing client extension admits both entries while the narrow list denies the new one.
     * @tc.precondition  The production allowlist and an extended copy are both available.
     * @tc.steps         1. Build an extended allowlist with the production literal and the extra entry.
     *                   2. Evaluate both descriptors against the extended list.
     *                   3. Evaluate the extra entry against the production list.
     *                   4. Evaluate the production literal against an empty list.
     * @tc.expected      Only the extended list admits the extra entry and the empty list denies everything.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSecurityExtendsAllowlistWithClientStub', 0, () => {
      const extra: string = 'clientStub';
      const extended: string[] = [STUB_DESCRIPTOR, extra];
      const primary: DescriptorVerdict = evaluateDescriptor(STUB_DESCRIPTOR, extended);
      const secondary: DescriptorVerdict = evaluateDescriptor(extra, extended);
      const narrow: DescriptorVerdict = evaluateDescriptor(extra, TRUSTED);
      const none: DescriptorVerdict = evaluateDescriptor(STUB_DESCRIPTOR, []);
      expect(primary.allowed).assertTrue();
      expect(secondary.allowed).assertTrue();
      expect(narrow.allowed).assertFalse();
      expect(narrow.reason).assertEqual(REASON_UNKNOWN);
      expect(none.allowed).assertFalse();
      expect(none.reason).assertEqual(REASON_UNKNOWN);
      expect(extended.length).assertEqual(2);
      expect(primary.digest === secondary.digest).assertFalse();
      logStep("stubSecurityExtendsAllowlistWithClientStub", primary.token() + ">" + secondary.token());
    });

    /**
     * @tc.name          stubSecurityExtendsAllowlistWithUnderscoreVariant
     * @tc.desc          An extended allowlist containing underscore extension admits both entries while the narrow list denies the new one.
     * @tc.precondition  The production allowlist and an extended copy are both available.
     * @tc.steps         1. Build an extended allowlist with the production literal and the extra entry.
     *                   2. Evaluate both descriptors against the extended list.
     *                   3. Evaluate the extra entry against the production list.
     *                   4. Evaluate the production literal against an empty list.
     * @tc.expected      Only the extended list admits the extra entry and the empty list denies everything.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSecurityExtendsAllowlistWithUnderscoreVariant', 0, () => {
      const extra: string = 'IPC_Stub';
      const extended: string[] = [STUB_DESCRIPTOR, extra];
      const primary: DescriptorVerdict = evaluateDescriptor(STUB_DESCRIPTOR, extended);
      const secondary: DescriptorVerdict = evaluateDescriptor(extra, extended);
      const narrow: DescriptorVerdict = evaluateDescriptor(extra, TRUSTED);
      const none: DescriptorVerdict = evaluateDescriptor(STUB_DESCRIPTOR, []);
      expect(primary.allowed).assertTrue();
      expect(secondary.allowed).assertTrue();
      expect(narrow.allowed).assertFalse();
      expect(narrow.reason).assertEqual(REASON_UNKNOWN);
      expect(none.allowed).assertFalse();
      expect(none.reason).assertEqual(REASON_UNKNOWN);
      expect(extended.length).assertEqual(2);
      expect(primary.digest === secondary.digest).assertFalse();
      logStep("stubSecurityExtendsAllowlistWithUnderscoreVariant", primary.token() + ">" + secondary.token());
    });

    /**
     * @tc.name          stubSecurityExtendsAllowlistWithOtherStub
     * @tc.desc          An extended allowlist containing other extension admits both entries while the narrow list denies the new one.
     * @tc.precondition  The production allowlist and an extended copy are both available.
     * @tc.steps         1. Build an extended allowlist with the production literal and the extra entry.
     *                   2. Evaluate both descriptors against the extended list.
     *                   3. Evaluate the extra entry against the production list.
     *                   4. Evaluate the production literal against an empty list.
     * @tc.expected      Only the extended list admits the extra entry and the empty list denies everything.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSecurityExtendsAllowlistWithOtherStub', 0, () => {
      const extra: string = 'otherStub';
      const extended: string[] = [STUB_DESCRIPTOR, extra];
      const primary: DescriptorVerdict = evaluateDescriptor(STUB_DESCRIPTOR, extended);
      const secondary: DescriptorVerdict = evaluateDescriptor(extra, extended);
      const narrow: DescriptorVerdict = evaluateDescriptor(extra, TRUSTED);
      const none: DescriptorVerdict = evaluateDescriptor(STUB_DESCRIPTOR, []);
      expect(primary.allowed).assertTrue();
      expect(secondary.allowed).assertTrue();
      expect(narrow.allowed).assertFalse();
      expect(narrow.reason).assertEqual(REASON_UNKNOWN);
      expect(none.allowed).assertFalse();
      expect(none.reason).assertEqual(REASON_UNKNOWN);
      expect(extended.length).assertEqual(2);
      expect(primary.digest === secondary.digest).assertFalse();
      logStep("stubSecurityExtendsAllowlistWithOtherStub", primary.token() + ">" + secondary.token());
    });

    /**
     * @tc.name          stubSecurityExtendsAllowlistWithStubTwo
     * @tc.desc          An extended allowlist containing stub two extension admits both entries while the narrow list denies the new one.
     * @tc.precondition  The production allowlist and an extended copy are both available.
     * @tc.steps         1. Build an extended allowlist with the production literal and the extra entry.
     *                   2. Evaluate both descriptors against the extended list.
     *                   3. Evaluate the extra entry against the production list.
     *                   4. Evaluate the production literal against an empty list.
     * @tc.expected      Only the extended list admits the extra entry and the empty list denies everything.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSecurityExtendsAllowlistWithStubTwo', 0, () => {
      const extra: string = 'StubTwo';
      const extended: string[] = [STUB_DESCRIPTOR, extra];
      const primary: DescriptorVerdict = evaluateDescriptor(STUB_DESCRIPTOR, extended);
      const secondary: DescriptorVerdict = evaluateDescriptor(extra, extended);
      const narrow: DescriptorVerdict = evaluateDescriptor(extra, TRUSTED);
      const none: DescriptorVerdict = evaluateDescriptor(STUB_DESCRIPTOR, []);
      expect(primary.allowed).assertTrue();
      expect(secondary.allowed).assertTrue();
      expect(narrow.allowed).assertFalse();
      expect(narrow.reason).assertEqual(REASON_UNKNOWN);
      expect(none.allowed).assertFalse();
      expect(none.reason).assertEqual(REASON_UNKNOWN);
      expect(extended.length).assertEqual(2);
      expect(primary.digest === secondary.digest).assertFalse();
      logStep("stubSecurityExtendsAllowlistWithStubTwo", primary.token() + ">" + secondary.token());
    });

    /**
     * @tc.name          stubSecurityLengthCeilingRejectsSixtyFive
     * @tc.desc          A descriptor of length 65 labelled sixty five bytes is stopped by the length ceiling.
     * @tc.precondition  A synthetic descriptor is grown to the requested size.
     * @tc.steps         1. Build a descriptor of exactly 65 ASCII characters.
     *                   2. Evaluate it against the production allowlist.
     *                   3. Compare its length with the admitted production literal.
     *                   4. Check the shape predicates on the synthetic value.
     * @tc.expected      The verdict is refused with the length reason and the production literal remains admitted.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSecurityLengthCeilingRejectsSixtyFive', 0, () => {
      const long: string = buildLong(65);
      const verdict: DescriptorVerdict = evaluateDescriptor(long, TRUSTED);
      const exact: DescriptorVerdict = evaluateDescriptor(STUB_DESCRIPTOR, TRUSTED);
      expect(long.length).assertEqual(65);
      expect(verdict.allowed).assertFalse();
      expect(verdict.reason).assertEqual(REASON_LENGTH);
      expect(verdict.length).assertEqual(65);
      expect(verdict.normalized.length).assertEqual(65);
      expect(exact.allowed).assertTrue();
      expect(exact.length).assertEqual(STUB_DESCRIPTOR.length);
      expect(exact.length < long.length).assertTrue();
      expect(hasControlChar(long)).assertFalse();
      logStep("stubSecurityLengthCeilingRejectsSixtyFive", String(long.length) + ":" + verdict.reason);
    });

    /**
     * @tc.name          stubSecurityLengthCeilingRejectsEighty
     * @tc.desc          A descriptor of length 80 labelled eighty bytes is stopped by the length ceiling.
     * @tc.precondition  A synthetic descriptor is grown to the requested size.
     * @tc.steps         1. Build a descriptor of exactly 80 ASCII characters.
     *                   2. Evaluate it against the production allowlist.
     *                   3. Compare its length with the admitted production literal.
     *                   4. Check the shape predicates on the synthetic value.
     * @tc.expected      The verdict is refused with the length reason and the production literal remains admitted.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSecurityLengthCeilingRejectsEighty', 0, () => {
      const long: string = buildLong(80);
      const verdict: DescriptorVerdict = evaluateDescriptor(long, TRUSTED);
      const exact: DescriptorVerdict = evaluateDescriptor(STUB_DESCRIPTOR, TRUSTED);
      expect(long.length).assertEqual(80);
      expect(verdict.allowed).assertFalse();
      expect(verdict.reason).assertEqual(REASON_LENGTH);
      expect(verdict.length).assertEqual(80);
      expect(verdict.normalized.length).assertEqual(80);
      expect(exact.allowed).assertTrue();
      expect(exact.length).assertEqual(STUB_DESCRIPTOR.length);
      expect(exact.length < long.length).assertTrue();
      expect(hasControlChar(long)).assertFalse();
      logStep("stubSecurityLengthCeilingRejectsEighty", String(long.length) + ":" + verdict.reason);
    });

    /**
     * @tc.name          stubSecurityLengthCeilingRejectsOneTwentyEight
     * @tc.desc          A descriptor of length 128 labelled one twenty eight bytes is stopped by the length ceiling.
     * @tc.precondition  A synthetic descriptor is grown to the requested size.
     * @tc.steps         1. Build a descriptor of exactly 128 ASCII characters.
     *                   2. Evaluate it against the production allowlist.
     *                   3. Compare its length with the admitted production literal.
     *                   4. Check the shape predicates on the synthetic value.
     * @tc.expected      The verdict is refused with the length reason and the production literal remains admitted.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSecurityLengthCeilingRejectsOneTwentyEight', 0, () => {
      const long: string = buildLong(128);
      const verdict: DescriptorVerdict = evaluateDescriptor(long, TRUSTED);
      const exact: DescriptorVerdict = evaluateDescriptor(STUB_DESCRIPTOR, TRUSTED);
      expect(long.length).assertEqual(128);
      expect(verdict.allowed).assertFalse();
      expect(verdict.reason).assertEqual(REASON_LENGTH);
      expect(verdict.length).assertEqual(128);
      expect(verdict.normalized.length).assertEqual(128);
      expect(exact.allowed).assertTrue();
      expect(exact.length).assertEqual(STUB_DESCRIPTOR.length);
      expect(exact.length < long.length).assertTrue();
      expect(hasControlChar(long)).assertFalse();
      logStep("stubSecurityLengthCeilingRejectsOneTwentyEight", String(long.length) + ":" + verdict.reason);
    });

    /**
     * @tc.name          stubSecurityLengthCeilingRejectsFiveTwelve
     * @tc.desc          A descriptor of length 512 labelled five twelve bytes is stopped by the length ceiling.
     * @tc.precondition  A synthetic descriptor is grown to the requested size.
     * @tc.steps         1. Build a descriptor of exactly 512 ASCII characters.
     *                   2. Evaluate it against the production allowlist.
     *                   3. Compare its length with the admitted production literal.
     *                   4. Check the shape predicates on the synthetic value.
     * @tc.expected      The verdict is refused with the length reason and the production literal remains admitted.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSecurityLengthCeilingRejectsFiveTwelve', 0, () => {
      const long: string = buildLong(512);
      const verdict: DescriptorVerdict = evaluateDescriptor(long, TRUSTED);
      const exact: DescriptorVerdict = evaluateDescriptor(STUB_DESCRIPTOR, TRUSTED);
      expect(long.length).assertEqual(512);
      expect(verdict.allowed).assertFalse();
      expect(verdict.reason).assertEqual(REASON_LENGTH);
      expect(verdict.length).assertEqual(512);
      expect(verdict.normalized.length).assertEqual(512);
      expect(exact.allowed).assertTrue();
      expect(exact.length).assertEqual(STUB_DESCRIPTOR.length);
      expect(exact.length < long.length).assertTrue();
      expect(hasControlChar(long)).assertFalse();
      logStep("stubSecurityLengthCeilingRejectsFiveTwelve", String(long.length) + ":" + verdict.reason);
    });

    /**
     * @tc.name          stubSecurityShapeAdmitsPlainLiteral
     * @tc.desc          Shape predicates classify the plain literal descriptor consistently with the evaluator.
     * @tc.precondition  The candidate is constructed as a raw string literal.
     * @tc.steps         1. Construct the raw candidate plain literal.
     *                   2. Run the control, ASCII and overall shape predicates.
     *                   3. Evaluate the candidate against a self allowlist.
     *                   4. Compare the evaluator verdict with the predicate result.
     * @tc.expected      The evaluator admits exactly the shaped candidates and reports the shape reason otherwise.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSecurityShapeAdmitsPlainLiteral', 0, () => {
      const candidate: string = 'IPCStubTest';
      const verdict: DescriptorVerdict = evaluateDescriptor(candidate, [candidate]);
      expect(hasControlChar(candidate)).assertEqual(false);
      expect(hasAsciiOnly(candidate)).assertEqual(true);
      expect(shapeOk(candidate)).assertEqual(true);
      expect(candidate.length > 0).assertTrue();
      expect(verdict.length).assertEqual(candidate.length);
      expect(verdict.observed).assertEqual(candidate);
      expect(verdict.allowed).assertEqual(true);
      expect(verdict.reason).assertEqual(true ? REASON_ALLOWED : REASON_SHAPE);
      logStep("stubSecurityShapeAdmitsPlainLiteral", verdict.reason + ":" + String(candidate.length));
    });

    /**
     * @tc.name          stubSecurityShapeRejectsInteriorSpace
     * @tc.desc          Shape predicates classify the interior space descriptor consistently with the evaluator.
     * @tc.precondition  The candidate is constructed as a raw string literal.
     * @tc.steps         1. Construct the raw candidate interior space.
     *                   2. Run the control, ASCII and overall shape predicates.
     *                   3. Evaluate the candidate against a self allowlist.
     *                   4. Compare the evaluator verdict with the predicate result.
     * @tc.expected      The evaluator admits exactly the shaped candidates and reports the shape reason otherwise.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSecurityShapeRejectsInteriorSpace', 0, () => {
      const candidate: string = 'IPC Stub';
      const verdict: DescriptorVerdict = evaluateDescriptor(candidate, [candidate]);
      expect(hasControlChar(candidate)).assertEqual(false);
      expect(hasAsciiOnly(candidate)).assertEqual(true);
      expect(shapeOk(candidate)).assertEqual(false);
      expect(candidate.length > 0).assertTrue();
      expect(verdict.length).assertEqual(candidate.length);
      expect(verdict.observed).assertEqual(candidate);
      expect(verdict.allowed).assertEqual(false);
      expect(verdict.reason).assertEqual(false ? REASON_ALLOWED : REASON_SHAPE);
      logStep("stubSecurityShapeRejectsInteriorSpace", verdict.reason + ":" + String(candidate.length));
    });

    /**
     * @tc.name          stubSecurityShapeRejectsTabCharacter
     * @tc.desc          Shape predicates classify the tab character descriptor consistently with the evaluator.
     * @tc.precondition  The candidate is constructed as a raw string literal.
     * @tc.steps         1. Construct the raw candidate tab character.
     *                   2. Run the control, ASCII and overall shape predicates.
     *                   3. Evaluate the candidate against a self allowlist.
     *                   4. Compare the evaluator verdict with the predicate result.
     * @tc.expected      The evaluator admits exactly the shaped candidates and reports the shape reason otherwise.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSecurityShapeRejectsTabCharacter', 0, () => {
      const candidate: string = 'IPC\tStub';
      const verdict: DescriptorVerdict = evaluateDescriptor(candidate, [candidate]);
      expect(hasControlChar(candidate)).assertEqual(true);
      expect(hasAsciiOnly(candidate)).assertEqual(true);
      expect(shapeOk(candidate)).assertEqual(false);
      expect(candidate.length > 0).assertTrue();
      expect(verdict.length).assertEqual(candidate.length);
      expect(verdict.observed).assertEqual(candidate);
      expect(verdict.allowed).assertEqual(false);
      expect(verdict.reason).assertEqual(false ? REASON_ALLOWED : REASON_SHAPE);
      logStep("stubSecurityShapeRejectsTabCharacter", verdict.reason + ":" + String(candidate.length));
    });

    /**
     * @tc.name          stubSecurityShapeRejectsWideCharacter
     * @tc.desc          Shape predicates classify the wide character descriptor consistently with the evaluator.
     * @tc.precondition  The candidate is constructed as a raw string literal.
     * @tc.steps         1. Construct the raw candidate wide character.
     *                   2. Run the control, ASCII and overall shape predicates.
     *                   3. Evaluate the candidate against a self allowlist.
     *                   4. Compare the evaluator verdict with the predicate result.
     * @tc.expected      The evaluator admits exactly the shaped candidates and reports the shape reason otherwise.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSecurityShapeRejectsWideCharacter', 0, () => {
      const candidate: string = 'IPC\u8282';
      const verdict: DescriptorVerdict = evaluateDescriptor(candidate, [candidate]);
      expect(hasControlChar(candidate)).assertEqual(false);
      expect(hasAsciiOnly(candidate)).assertEqual(false);
      expect(shapeOk(candidate)).assertEqual(false);
      expect(candidate.length > 0).assertTrue();
      expect(verdict.length).assertEqual(candidate.length);
      expect(verdict.observed).assertEqual(candidate);
      expect(verdict.allowed).assertEqual(false);
      expect(verdict.reason).assertEqual(false ? REASON_ALLOWED : REASON_SHAPE);
      logStep("stubSecurityShapeRejectsWideCharacter", verdict.reason + ":" + String(candidate.length));
    });

    /**
     * @tc.name          stubSecurityShapeRejectsSlashCharacter
     * @tc.desc          Shape predicates classify the slash character descriptor consistently with the evaluator.
     * @tc.precondition  The candidate is constructed as a raw string literal.
     * @tc.steps         1. Construct the raw candidate slash character.
     *                   2. Run the control, ASCII and overall shape predicates.
     *                   3. Evaluate the candidate against a self allowlist.
     *                   4. Compare the evaluator verdict with the predicate result.
     * @tc.expected      The evaluator admits exactly the shaped candidates and reports the shape reason otherwise.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSecurityShapeRejectsSlashCharacter', 0, () => {
      const candidate: string = 'IPC/Stub';
      const verdict: DescriptorVerdict = evaluateDescriptor(candidate, [candidate]);
      expect(hasControlChar(candidate)).assertEqual(false);
      expect(hasAsciiOnly(candidate)).assertEqual(true);
      expect(shapeOk(candidate)).assertEqual(false);
      expect(candidate.length > 0).assertTrue();
      expect(verdict.length).assertEqual(candidate.length);
      expect(verdict.observed).assertEqual(candidate);
      expect(verdict.allowed).assertEqual(false);
      expect(verdict.reason).assertEqual(false ? REASON_ALLOWED : REASON_SHAPE);
      logStep("stubSecurityShapeRejectsSlashCharacter", verdict.reason + ":" + String(candidate.length));
    });

    /**
     * @tc.name          stubSecurityShapeRejectsDotDotSequence
     * @tc.desc          Shape predicates classify the dot dot sequence descriptor consistently with the evaluator.
     * @tc.precondition  The candidate is constructed as a raw string literal.
     * @tc.steps         1. Construct the raw candidate dot dot sequence.
     *                   2. Run the control, ASCII and overall shape predicates.
     *                   3. Evaluate the candidate against a self allowlist.
     *                   4. Compare the evaluator verdict with the predicate result.
     * @tc.expected      The evaluator admits exactly the shaped candidates and reports the shape reason otherwise.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('stubSecurityShapeRejectsDotDotSequence', 0, () => {
      const candidate: string = 'IPC..Stub';
      const verdict: DescriptorVerdict = evaluateDescriptor(candidate, [candidate]);
      expect(hasControlChar(candidate)).assertEqual(false);
      expect(hasAsciiOnly(candidate)).assertEqual(true);
      expect(shapeOk(candidate)).assertEqual(false);
      expect(candidate.length > 0).assertTrue();
      expect(verdict.length).assertEqual(candidate.length);
      expect(verdict.observed).assertEqual(candidate);
      expect(verdict.allowed).assertEqual(false);
      expect(verdict.reason).assertEqual(false ? REASON_ALLOWED : REASON_SHAPE);
      logStep("stubSecurityShapeRejectsDotDotSequence", verdict.reason + ":" + String(candidate.length));
    });

    /**
     * @tc.name          stubSecurityExactLiteralMatchesProduction
     * @tc.desc          The production literal exact literal is fixed and matches the onConnect descriptor.
     * @tc.precondition  The shared driver exposes the descriptor constant.
     * @tc.steps         1. Read the shared descriptor constant.
     *                   2. Compare it with the expected production literal.
     *                   3. Evaluate it through the allowlist evaluator.
     *                   4. Check the boundary characters of the literal.
     * @tc.expected      The literal equals IPCStubTest and is admitted by the production allowlist.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('stubSecurityExactLiteralMatchesProduction', 0, () => {
      const literal: string = 'IPCStubTest';
      const verdict: DescriptorVerdict = evaluateDescriptor(literal, TRUSTED);
      expect(literal).assertEqual(STUB_DESCRIPTOR);
      expect(literal.length).assertEqual(11);
      expect(verdict.allowed).assertTrue();
      expect(verdict.reason).assertEqual(REASON_ALLOWED);
      expect(verdict.observed).assertEqual(STUB_DESCRIPTOR);
      expect(textFingerprint(literal)).assertEqual(verdict.digest);
      expect(literal.charCodeAt(0)).assertEqual(73);
      expect(literal.charCodeAt(10)).assertEqual(116);
      expect(literal.indexOf(' ')).assertEqual(-1);
      logStep("stubSecurityExactLiteralMatchesProduction", literal + ":" + String(verdict.digest));
    });
  });
}
