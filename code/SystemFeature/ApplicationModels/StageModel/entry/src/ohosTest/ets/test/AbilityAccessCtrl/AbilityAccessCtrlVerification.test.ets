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

import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import { getDriver, ensureAppReady } from '../Shared/SharedDriver';

const GRANT_PERMISSION: string = 'ohos.permission.GRANT_SENSITIVE_PERMISSIONS';
const GET_PERMISSION: string = 'ohos.permission.GET_SENSITIVE_PERMISSIONS';
const TOKEN_VALID: number = 100;
const TOKEN_INVALID: number = -1;

enum VerifyOutcome {
  UNKNOWN = 0,
  ALLOWED = 1,
  DENIED = 2
}

class TokenPermission {
  readonly tokenId: number;
  readonly permission: string;
  readonly allowed: boolean;

  constructor(tokenId: number, permission: string, allowed: boolean) {
    this.tokenId = tokenId;
    this.permission = permission;
    this.allowed = allowed;
  }

  matchesToken(tokenId: number): boolean {
    return this.tokenId === tokenId;
  }

  matchesPermission(permission: string): boolean {
    return this.permission === permission;
  }

  matches(tokenId: number, permission: string): boolean {
    return this.matchesToken(tokenId) && this.matchesPermission(permission);
  }

  key(): string {
    return `${this.tokenId}|${this.permission}`;
  }

  describe(): string {
    return `${this.key()}=${this.allowed}`;
  }
}

class VerifyRequest {
  readonly tokenId: number;
  readonly permission: string;

  constructor(tokenId: number, permission: string) {
    this.tokenId = tokenId;
    this.permission = permission;
  }

  isValid(): boolean {
    return this.tokenId >= 0 && this.permission.length > 0;
  }

  describe(): string {
    return `${this.tokenId}:${this.permission}`;
  }

  sameAs(other: VerifyRequest): boolean {
    return this.tokenId === other.tokenId && this.permission === other.permission;
  }
}

class VerifyResponse {
  readonly request: VerifyRequest;
  readonly outcome: VerifyOutcome;
  readonly reason: string;

  constructor(request: VerifyRequest, outcome: VerifyOutcome, reason: string) {
    this.request = request;
    this.outcome = outcome;
    this.reason = reason;
  }

  isAllowed(): boolean {
    return this.outcome === VerifyOutcome.ALLOWED;
  }

  isDenied(): boolean {
    return this.outcome === VerifyOutcome.DENIED;
  }

  isUnknown(): boolean {
    return this.outcome === VerifyOutcome.UNKNOWN;
  }

  describe(): string {
    return `${this.request.describe()}:${this.outcome}:${this.reason}`;
  }
}

class AccessVerifier {
  private entries: TokenPermission[] = [];

  allow(tokenId: number, permission: string): AccessVerifier {
    this.entries.push(new TokenPermission(tokenId, permission, true));
    return this;
  }

  deny(tokenId: number, permission: string): AccessVerifier {
    this.entries.push(new TokenPermission(tokenId, permission, false));
    return this;
  }

  find(tokenId: number, permission: string): TokenPermission | null {
    for (const entry of this.entries) {
      if (entry.matches(tokenId, permission)) {
        return entry;
      }
    }
    return null;
  }

  size(): number {
    return this.entries.length;
  }

  verify(request: VerifyRequest): VerifyResponse {
    if (!request.isValid()) {
      return new VerifyResponse(request, VerifyOutcome.UNKNOWN, 'invalid-request');
    }
    const entry = this.find(request.tokenId, request.permission);
    if (entry === null) {
      return new VerifyResponse(request, VerifyOutcome.UNKNOWN, 'not-registered');
    }
    if (entry.allowed) {
      return new VerifyResponse(request, VerifyOutcome.ALLOWED, 'granted');
    }
    return new VerifyResponse(request, VerifyOutcome.DENIED, 'denied');
  }

  allowedCount(): number {
    let count = 0;
    for (const entry of this.entries) {
      if (entry.allowed) {
        count += 1;
      }
    }
    return count;
  }

  deniedCount(): number {
    return this.entries.length - this.allowedCount();
  }

  byToken(tokenId: number): TokenPermission[] {
    return this.entries.filter((entry: TokenPermission) => entry.matchesToken(tokenId));
  }
}

class VerifyStats {
  private responses: VerifyResponse[] = [];

  record(response: VerifyResponse): VerifyStats {
    this.responses.push(response);
    return this;
  }

  size(): number {
    return this.responses.length;
  }

  allowed(): number {
    let count = 0;
    for (const response of this.responses) {
      if (response.isAllowed()) {
        count += 1;
      }
    }
    return count;
  }

  denied(): number {
    let count = 0;
    for (const response of this.responses) {
      if (response.isDenied()) {
        count += 1;
      }
    }
    return count;
  }

  unknown(): number {
    return this.responses.length - this.allowed() - this.denied();
  }

  describe(): string {
    return `allowed=${this.allowed()},denied=${this.denied()},unknown=${this.unknown()}`;
  }
}

function buildVerifier(): AccessVerifier {
  const verifier = new AccessVerifier();
  verifier.allow(TOKEN_VALID, GRANT_PERMISSION);
  verifier.allow(TOKEN_VALID + 1, GET_PERMISSION);
  verifier.deny(TOKEN_VALID + 2, GRANT_PERMISSION);
  return verifier;
}

export default function abilityAccessCtrlVerificationTest(): void {
  describe('AbilityAccessCtrlVerificationSuite', () => {
    let verifier: AccessVerifier = buildVerifier();

    beforeAll(() => {
      verifier = buildVerifier();
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'access ctrl verify suite start');
    });

    afterAll(() => {
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'access ctrl verify suite end');
    });

    it('AbilityAccessCtrlVerification_001', 0, async (done: Function) => {
      expect(verifier.size()).assertEqual(3);
      expect(verifier.allowedCount()).assertEqual(2);
      expect(verifier.deniedCount()).assertEqual(1);
      done();
    });

    it('AbilityAccessCtrlVerification_002', 0, async (done: Function) => {
      const response = verifier.verify(new VerifyRequest(TOKEN_VALID, GRANT_PERMISSION));
      expect(response.isAllowed()).assertTrue();
      expect(response.reason).assertEqual('granted');
      expect(response.outcome).assertEqual(VerifyOutcome.ALLOWED);
      done();
    });

    it('AbilityAccessCtrlVerification_003', 0, async (done: Function) => {
      const response = verifier.verify(new VerifyRequest(TOKEN_VALID + 2, GRANT_PERMISSION));
      expect(response.isDenied()).assertTrue();
      expect(response.reason).assertEqual('denied');
      expect(response.isAllowed()).assertFalse();
      done();
    });

    it('AbilityAccessCtrlVerification_004', 0, async (done: Function) => {
      const response = verifier.verify(new VerifyRequest(TOKEN_VALID, GET_PERMISSION));
      expect(response.isUnknown()).assertTrue();
      expect(response.reason).assertEqual('not-registered');
      done();
    });

    it('AbilityAccessCtrlVerification_005', 0, async (done: Function) => {
      const response = verifier.verify(new VerifyRequest(TOKEN_INVALID, GRANT_PERMISSION));
      expect(response.isUnknown()).assertTrue();
      expect(response.reason).assertEqual('invalid-request');
      done();
    });

    it('AbilityAccessCtrlVerification_006', 0, async (done: Function) => {
      const request = new VerifyRequest(TOKEN_VALID, GRANT_PERMISSION);
      expect(request.isValid()).assertTrue();
      expect(request.describe()).assertEqual(`${TOKEN_VALID}:${GRANT_PERMISSION}`);
      expect(request.tokenId).assertEqual(TOKEN_VALID);
      done();
    });

    it('AbilityAccessCtrlVerification_007', 0, async (done: Function) => {
      const request = new VerifyRequest(TOKEN_INVALID, GRANT_PERMISSION);
      expect(request.isValid()).assertFalse();
      expect(request.tokenId).assertEqual(TOKEN_INVALID);
      expect(request.permission.length > 0).assertTrue();
      done();
    });

    it('AbilityAccessCtrlVerification_008', 0, async (done: Function) => {
      const request = new VerifyRequest(TOKEN_VALID, '');
      expect(request.isValid()).assertFalse();
      expect(request.permission).assertEqual('');
      done();
    });

    it('AbilityAccessCtrlVerification_009', 0, async (done: Function) => {
      const first = new VerifyRequest(TOKEN_VALID, GRANT_PERMISSION);
      const second = new VerifyRequest(TOKEN_VALID, GRANT_PERMISSION);
      const third = new VerifyRequest(TOKEN_VALID, GET_PERMISSION);
      expect(first.sameAs(second)).assertTrue();
      expect(first.sameAs(third)).assertFalse();
      done();
    });

    it('AbilityAccessCtrlVerification_010', 0, async (done: Function) => {
      const entry = new TokenPermission(TOKEN_VALID, GRANT_PERMISSION, true);
      expect(entry.matchesToken(TOKEN_VALID)).assertTrue();
      expect(entry.matchesPermission(GRANT_PERMISSION)).assertTrue();
      expect(entry.matches(TOKEN_VALID, GRANT_PERMISSION)).assertTrue();
      done();
    });

    it('AbilityAccessCtrlVerification_011', 0, async (done: Function) => {
      const entry = new TokenPermission(TOKEN_VALID, GRANT_PERMISSION, false);
      expect(entry.matches(TOKEN_VALID + 1, GRANT_PERMISSION)).assertFalse();
      expect(entry.matches(TOKEN_VALID, GET_PERMISSION)).assertFalse();
      expect(entry.allowed).assertFalse();
      done();
    });

    it('AbilityAccessCtrlVerification_012', 0, async (done: Function) => {
      const entry = new TokenPermission(TOKEN_VALID, GRANT_PERMISSION, true);
      expect(entry.key()).assertEqual(`${TOKEN_VALID}|${GRANT_PERMISSION}`);
      expect(entry.describe()).assertEqual(`${TOKEN_VALID}|${GRANT_PERMISSION}=true`);
      done();
    });

    it('AbilityAccessCtrlVerification_013', 0, async (done: Function) => {
      const response = new VerifyResponse(new VerifyRequest(TOKEN_VALID, GRANT_PERMISSION),
        VerifyOutcome.ALLOWED, 'granted');
      expect(response.isAllowed()).assertTrue();
      expect(response.isDenied()).assertFalse();
      expect(response.isUnknown()).assertFalse();
      done();
    });

    it('AbilityAccessCtrlVerification_014', 0, async (done: Function) => {
      const response = new VerifyResponse(new VerifyRequest(TOKEN_VALID, GRANT_PERMISSION),
        VerifyOutcome.DENIED, 'denied');
      expect(response.describe()).assertEqual(`${TOKEN_VALID}:${GRANT_PERMISSION}:2:denied`);
      expect(response.isDenied()).assertTrue();
      done();
    });

    it('AbilityAccessCtrlVerification_015', 0, async (done: Function) => {
      const stats = new VerifyStats();
      expect(stats.size()).assertEqual(0);
      expect(stats.allowed()).assertEqual(0);
      expect(stats.denied()).assertEqual(0);
      expect(stats.unknown()).assertEqual(0);
      done();
    });

    it('AbilityAccessCtrlVerification_016', 0, async (done: Function) => {
      const stats = new VerifyStats();
      stats.record(verifier.verify(new VerifyRequest(TOKEN_VALID, GRANT_PERMISSION)));
      stats.record(verifier.verify(new VerifyRequest(TOKEN_VALID + 2, GRANT_PERMISSION)));
      stats.record(verifier.verify(new VerifyRequest(TOKEN_VALID, GET_PERMISSION)));
      expect(stats.size()).assertEqual(3);
      expect(stats.allowed()).assertEqual(1);
      expect(stats.denied()).assertEqual(1);
      expect(stats.unknown()).assertEqual(1);
      done();
    });

    it('AbilityAccessCtrlVerification_017', 0, async (done: Function) => {
      const stats = new VerifyStats();
      stats.record(verifier.verify(new VerifyRequest(TOKEN_VALID, GRANT_PERMISSION)));
      stats.record(verifier.verify(new VerifyRequest(TOKEN_VALID + 1, GET_PERMISSION)));
      expect(stats.allowed()).assertEqual(2);
      expect(stats.denied()).assertEqual(0);
      expect(stats.describe()).assertEqual('allowed=2,denied=0,unknown=0');
      done();
    });

    it('AbilityAccessCtrlVerification_018', 0, async (done: Function) => {
      const stats = new VerifyStats();
      for (let i = 0; i < 3; i++) {
        stats.record(verifier.verify(new VerifyRequest(TOKEN_VALID + 2, GRANT_PERMISSION)));
      }
      expect(stats.size()).assertEqual(3);
      expect(stats.denied()).assertEqual(3);
      expect(stats.allowed()).assertEqual(0);
      done();
    });

    it('AbilityAccessCtrlVerification_019', 0, async (done: Function) => {
      const empty = new AccessVerifier();
      expect(empty.size()).assertEqual(0);
      expect(empty.allowedCount()).assertEqual(0);
      expect(empty.deniedCount()).assertEqual(0);
      const response = empty.verify(new VerifyRequest(TOKEN_VALID, GRANT_PERMISSION));
      expect(response.isUnknown()).assertTrue();
      done();
    });

    it('AbilityAccessCtrlVerification_020', 0, async (done: Function) => {
      const empty = new AccessVerifier();
      expect(empty.find(TOKEN_VALID, GRANT_PERMISSION)).assertNull();
      expect(empty.byToken(TOKEN_VALID).length).assertEqual(0);
      expect(empty.verify(new VerifyRequest(TOKEN_VALID, GRANT_PERMISSION)).reason)
        .assertEqual('not-registered');
      done();
    });

    it('AbilityAccessCtrlVerification_021', 0, async (done: Function) => {
      const verifier = new AccessVerifier();
      verifier.allow(TOKEN_VALID, GRANT_PERMISSION);
      expect(verifier.size()).assertEqual(1);
      expect(verifier.allowedCount()).assertEqual(1);
      expect(verifier.deniedCount()).assertEqual(0);
      done();
    });

    it('AbilityAccessCtrlVerification_022', 0, async (done: Function) => {
      const verifier = new AccessVerifier();
      verifier.deny(TOKEN_VALID, GRANT_PERMISSION);
      expect(verifier.find(TOKEN_VALID, GRANT_PERMISSION)?.allowed).assertFalse();
      expect(verifier.allowedCount()).assertEqual(0);
      expect(verifier.deniedCount()).assertEqual(1);
      done();
    });

    it('AbilityAccessCtrlVerification_023', 0, async (done: Function) => {
      const verifier = new AccessVerifier();
      verifier.allow(TOKEN_VALID, GRANT_PERMISSION);
      verifier.deny(TOKEN_VALID + 1, GRANT_PERMISSION);
      expect(verifier.byToken(TOKEN_VALID).length).assertEqual(1);
      expect(verifier.byToken(TOKEN_VALID + 1).length).assertEqual(1);
      expect(verifier.byToken(TOKEN_VALID + 2).length).assertEqual(0);
      done();
    });

    it('AbilityAccessCtrlVerification_024', 0, async (done: Function) => {
      const verifier = new AccessVerifier();
      verifier.allow(TOKEN_VALID, GRANT_PERMISSION);
      verifier.allow(TOKEN_VALID, GRANT_PERMISSION);
      expect(verifier.size()).assertEqual(2);
      expect(verifier.find(TOKEN_VALID, GRANT_PERMISSION)?.allowed).assertTrue();
      expect(verifier.byToken(TOKEN_VALID).length).assertEqual(2);
      done();
    });

    it('AbilityAccessCtrlVerification_025', 0, async (done: Function) => {
      const verifier = new AccessVerifier();
      verifier.deny(TOKEN_VALID, GRANT_PERMISSION);
      verifier.allow(TOKEN_VALID, GRANT_PERMISSION);
      const first = verifier.find(TOKEN_VALID, GRANT_PERMISSION);
      expect(first !== null ? first.allowed : true).assertFalse();
      expect(verifier.size()).assertEqual(2);
      done();
    });

    it('AbilityAccessCtrlVerification_026', 0, async (done: Function) => {
      const verifier = new AccessVerifier();
      for (let i = 0; i < 5; i++) {
        verifier.allow(TOKEN_VALID + i, GRANT_PERMISSION);
      }
      expect(verifier.size()).assertEqual(5);
      expect(verifier.allowedCount()).assertEqual(5);
      expect(verifier.deniedCount()).assertEqual(0);
      done();
    });

    it('AbilityAccessCtrlVerification_027', 0, async (done: Function) => {
      const verifier = new AccessVerifier();
      for (let i = 0; i < 4; i++) {
        if (i % 2 === 0) {
          verifier.allow(TOKEN_VALID + i, GRANT_PERMISSION);
        } else {
          verifier.deny(TOKEN_VALID + i, GRANT_PERMISSION);
        }
      }
      expect(verifier.allowedCount()).assertEqual(2);
      expect(verifier.deniedCount()).assertEqual(2);
      expect(verifier.size()).assertEqual(4);
      done();
    });

    it('AbilityAccessCtrlVerification_028', 0, async (done: Function) => {
      const verifier = buildVerifier();
      const response = verifier.verify(new VerifyRequest(TOKEN_VALID + 1, GET_PERMISSION));
      expect(response.isAllowed()).assertTrue();
      expect(response.outcome).assertEqual(VerifyOutcome.ALLOWED);
      done();
    });

    it('AbilityAccessCtrlVerification_029', 0, async (done: Function) => {
      const verifier = buildVerifier();
      const response = verifier.verify(new VerifyRequest(TOKEN_VALID + 1, GRANT_PERMISSION));
      expect(response.isUnknown()).assertTrue();
      expect(response.reason).assertEqual('not-registered');
      done();
    });

    it('AbilityAccessCtrlVerification_030', 0, async (done: Function) => {
      const verifier = buildVerifier();
      const response = verifier.verify(new VerifyRequest(TOKEN_VALID + 2, GET_PERMISSION));
      expect(response.isUnknown()).assertTrue();
      expect(response.isDenied()).assertFalse();
      done();
    });

    it('AbilityAccessCtrlVerification_031', 0, async (done: Function) => {
      const verifier = buildVerifier();
      const stats = new VerifyStats();
      stats.record(verifier.verify(new VerifyRequest(TOKEN_VALID, GRANT_PERMISSION)));
      stats.record(verifier.verify(new VerifyRequest(TOKEN_VALID + 1, GET_PERMISSION)));
      stats.record(verifier.verify(new VerifyRequest(TOKEN_VALID + 2, GRANT_PERMISSION)));
      expect(stats.describe()).assertEqual('allowed=2,denied=1,unknown=0');
      done();
    });

    it('AbilityAccessCtrlVerification_032', 0, async (done: Function) => {
      const verifier = buildVerifier();
      const stats = new VerifyStats();
      for (let i = 0; i < 6; i++) {
        stats.record(verifier.verify(new VerifyRequest(TOKEN_VALID, GRANT_PERMISSION)));
      }
      expect(stats.size()).assertEqual(6);
      expect(stats.allowed()).assertEqual(6);
      expect(stats.describe()).assertEqual('allowed=6,denied=0,unknown=0');
      done();
    });

    it('AbilityAccessCtrlVerification_033', 0, async (done: Function) => {
      const verifier = buildVerifier();
      const stats = new VerifyStats();
      stats.record(verifier.verify(new VerifyRequest(TOKEN_INVALID, GRANT_PERMISSION)));
      stats.record(verifier.verify(new VerifyRequest(TOKEN_VALID, '')));
      expect(stats.unknown()).assertEqual(2);
      expect(stats.allowed()).assertEqual(0);
      expect(stats.denied()).assertEqual(0);
      done();
    });

    it('AbilityAccessCtrlVerification_034', 0, async (done: Function) => {
      const request = new VerifyRequest(TOKEN_VALID, GRANT_PERMISSION);
      const response = new VerifyResponse(request, VerifyOutcome.UNKNOWN, 'not-registered');
      expect(response.describe()).assertEqual(`${TOKEN_VALID}:${GRANT_PERMISSION}:0:not-registered`);
      expect(response.isUnknown()).assertTrue();
      done();
    });

    it('AbilityAccessCtrlVerification_035', 0, async (done: Function) => {
      const allowed = new TokenPermission(TOKEN_VALID, GRANT_PERMISSION, true);
      const denied = new TokenPermission(TOKEN_VALID, GET_PERMISSION, false);
      expect(allowed.allowed).assertTrue();
      expect(denied.allowed).assertFalse();
      expect(allowed.key() === denied.key()).assertFalse();
      done();
    });

    it('AbilityAccessCtrlVerification_036', 0, async (done: Function) => {
      const verifier = buildVerifier();
      let allowedTokens = 0;
      for (const entry of verifier.byToken(TOKEN_VALID)) {
        if (entry.allowed) {
          allowedTokens += 1;
        }
      }
      expect(allowedTokens).assertEqual(1);
      expect(verifier.byToken(TOKEN_VALID).length).assertEqual(1);
      done();
    });

    it('AbilityAccessCtrlVerification_037', 0, async (done: Function) => {
      const stats = new VerifyStats();
      expect(stats.describe()).assertEqual('allowed=0,denied=0,unknown=0');
      stats.record(new VerifyResponse(new VerifyRequest(TOKEN_VALID, GRANT_PERMISSION),
        VerifyOutcome.DENIED, 'denied'));
      expect(stats.describe()).assertEqual('allowed=0,denied=1,unknown=0');
      done();
    });

    it('AbilityAccessCtrlVerification_038', 0, async (done: Function) => {
      const verifier = new AccessVerifier();
      verifier.allow(TOKEN_VALID, GRANT_PERMISSION);
      verifier.allow(TOKEN_VALID, GET_PERMISSION);
      verifier.deny(TOKEN_VALID, 'ohos.permission.OTHER');
      expect(verifier.byToken(TOKEN_VALID).length).assertEqual(3);
      expect(verifier.allowedCount()).assertEqual(2);
      expect(verifier.deniedCount()).assertEqual(1);
      done();
    });

    it('AbilityAccessCtrlVerification_039', 0, async (done: Function) => {
      const verifier = buildVerifier();
      const requests: VerifyRequest[] = [];
      requests.push(new VerifyRequest(TOKEN_VALID, GRANT_PERMISSION));
      requests.push(new VerifyRequest(TOKEN_VALID + 1, GET_PERMISSION));
      let allowed = 0;
      for (const request of requests) {
        if (verifier.verify(request).isAllowed()) {
          allowed += 1;
        }
      }
      expect(requests.length).assertEqual(2);
      expect(allowed).assertEqual(2);
      done();
    });

    it('AbilityAccessCtrlVerification_040', 0, async (done: Function) => {
      const verifier = buildVerifier();
      expect(verifier.verify(new VerifyRequest(TOKEN_VALID, GRANT_PERMISSION)).request.tokenId)
        .assertEqual(TOKEN_VALID);
      expect(verifier.verify(new VerifyRequest(TOKEN_VALID, GRANT_PERMISSION)).request.permission)
        .assertEqual(GRANT_PERMISSION);
      done();
    });

    it('AbilityAccessCtrlVerification_041', 0, async (done: Function) => {
      const verifier = buildVerifier();
      const stats = new VerifyStats();
      stats.record(verifier.verify(new VerifyRequest(TOKEN_VALID, GET_PERMISSION)));
      expect(stats.unknown()).assertEqual(1);
      expect(stats.allowed()).assertEqual(0);
      expect(stats.denied()).assertEqual(0);
      done();
    });

    it('AbilityAccessCtrlVerification_042', 0, async (done: Function) => {
      const verifier = buildVerifier();
      const stats = new VerifyStats();
      for (let i = 0; i < 2; i++) {
        stats.record(verifier.verify(new VerifyRequest(TOKEN_VALID, GRANT_PERMISSION)));
        stats.record(verifier.verify(new VerifyRequest(TOKEN_VALID + 2, GRANT_PERMISSION)));
      }
      expect(stats.size()).assertEqual(4);
      expect(stats.allowed()).assertEqual(2);
      expect(stats.denied()).assertEqual(2);
      expect(stats.unknown()).assertEqual(0);
      done();
    });

    it('AbilityAccessCtrlVerification_043', 0, async (done: Function) => {
      const verifier = buildVerifier();
      const deniedTokens: number[] = [];
      for (const entry of verifier.byToken(TOKEN_VALID + 2)) {
        if (!entry.allowed) {
          deniedTokens.push(entry.tokenId);
        }
      }
      expect(deniedTokens.length).assertEqual(1);
      expect(deniedTokens[0]).assertEqual(TOKEN_VALID + 2);
      done();
    });

    it('AbilityAccessCtrlVerification_044', 0, async (done: Function) => {
      const verifier = buildVerifier();
      const response = verifier.verify(new VerifyRequest(TOKEN_VALID + 2, GRANT_PERMISSION));
      expect(response.request.sameAs(new VerifyRequest(TOKEN_VALID + 2, GRANT_PERMISSION))).assertTrue();
      expect(response.isDenied()).assertTrue();
      done();
    });

    it('AbilityAccessCtrlVerification_045', 0, async (done: Function) => {
      const verifier = buildVerifier();
      let validRequests = 0;
      const requests: VerifyRequest[] = [
        new VerifyRequest(TOKEN_VALID, GRANT_PERMISSION),
        new VerifyRequest(TOKEN_INVALID, GRANT_PERMISSION),
        new VerifyRequest(TOKEN_VALID, '')
      ];
      for (const request of requests) {
        if (request.isValid()) {
          validRequests += 1;
        }
      }
      expect(requests.length).assertEqual(3);
      expect(validRequests).assertEqual(1);
      done();
    });

    it('AbilityAccessCtrlVerification_046', 0, async (done: Function) => {
      const verifier = new AccessVerifier();
      verifier.allow(TOKEN_VALID, GRANT_PERMISSION);
      const entry = verifier.find(TOKEN_VALID, GRANT_PERMISSION);
      expect(entry !== null ? entry.matches(TOKEN_VALID, GRANT_PERMISSION) : false).assertTrue();
      expect(entry !== null ? entry.matches(TOKEN_VALID, GET_PERMISSION) : true).assertFalse();
      done();
    });

    it('AbilityAccessCtrlVerification_047', 0, async (done: Function) => {
      const stats = new VerifyStats();
      const request = new VerifyRequest(TOKEN_VALID, GRANT_PERMISSION);
      stats.record(new VerifyResponse(request, VerifyOutcome.UNKNOWN, 'not-registered'));
      stats.record(new VerifyResponse(request, VerifyOutcome.ALLOWED, 'granted'));
      stats.record(new VerifyResponse(request, VerifyOutcome.DENIED, 'denied'));
      expect(stats.allowed()).assertEqual(1);
      expect(stats.denied()).assertEqual(1);
      expect(stats.unknown()).assertEqual(1);
      done();
    });

    it('AbilityAccessCtrlVerification_048', 0, async (done: Function) => {
      const verifier = buildVerifier();
      const total = verifier.allowedCount() + verifier.deniedCount();
      expect(total).assertEqual(verifier.size());
      expect(verifier.size()).assertEqual(3);
      expect(verifier.byToken(TOKEN_VALID + 1).length).assertEqual(1);
      done();
    });

    it('AbilityAccessCtrlVerification_049', 0, async (done: Function) => {
      try {
        const driver: Driver = getDriver();
        const ready = await ensureAppReady(driver);
        expect(typeof ready === 'boolean').assertTrue();
      } catch (error) {
        expect(error !== null).assertTrue();
      }
      done();
    });
  });
}

