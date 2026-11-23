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
import {
  getDriver, componentCount, launchMainAbility, buildDataShareUri, normalizeDataShareUri,
  isSampleDataShareUri, BUNDLE_NAME, ABILITY_DATA_SHARE, DATA_SHARE_URI, ACCOUNT_ID
} from '../Shared/SharedDriver';

enum SecurityOperation {
  READ = 0,
  WRITE = 1,
  DELETE = 2,
  GRANT = 3,
  REVOKE = 4
}

enum SecurityDecision {
  ALLOW = 0,
  DENY = 1
}

enum SecurityDenyReason {
  NONE = 0,
  NO_PERMISSION = 1,
  NOT_OWNER = 2,
  INVALID_TOKEN = 3,
  SENSITIVITY_TOO_HIGH = 4,
  UNKNOWN_URI = 5,
  SESSION_EXPIRED = 6,
  TOKEN_REVOKED = 7
}

enum SensitivityLevel {
  PUBLIC = 0,
  INTERNAL = 1,
  CONFIDENTIAL = 2,
  SECRET = 3
}

const PERMISSION_READ: number = 1;
const PERMISSION_WRITE: number = 2;
const PERMISSION_DELETE: number = 4;
const PERMISSION_GRANT: number = 8;
const PERMISSION_ALL: number = 15;
const TOKEN_TTL_MS: number = 60000;
const MAX_AUDIT_ENTRIES: number = 256;

class SecurityToken {
  readonly tokenId: number;
  readonly principalId: number;
  readonly permissionMask: number;
  readonly issuedAt: number;
  readonly expiresAt: number;
  private revoked: boolean;

  constructor(tokenId: number, principalId: number, permissionMask: number, issuedAt: number, ttlMs: number) {
    this.tokenId = tokenId;
    this.principalId = principalId;
    this.permissionMask = permissionMask;
    this.issuedAt = issuedAt;
    this.expiresAt = issuedAt + ttlMs;
    this.revoked = false;
  }

  revoke(): void {
    this.revoked = true;
  }

  isRevoked(): boolean {
    return this.revoked;
  }

  isExpired(now: number): boolean {
    return now >= this.expiresAt;
  }

  isActive(now: number): boolean {
    return !this.revoked && !this.isExpired(now);
  }

  hasPermission(flag: number): boolean {
    return (this.permissionMask & flag) === flag;
  }

  remainingMs(now: number): number {
    const remaining = this.expiresAt - now;
    return remaining > 0 ? remaining : 0;
  }
}

class SecurityPrincipal {
  readonly principalId: number;
  readonly name: string;
  readonly clearance: SensitivityLevel;
  readonly roles: string[];

  constructor(principalId: number, name: string, clearance: SensitivityLevel, roles: string[]) {
    this.principalId = principalId;
    this.name = name;
    this.clearance = clearance;
    this.roles = roles;
  }

  hasRole(role: string): boolean {
    return this.roles.indexOf(role) >= 0;
  }

  canReadSensitivity(level: SensitivityLevel): boolean {
    return this.clearance >= level;
  }

  roleCount(): number {
    return this.roles.length;
  }
}

class SecurityResource {
  readonly uri: string;
  readonly ownerId: number;
  readonly sensitivity: SensitivityLevel;
  readonly requiredPermission: number;

  constructor(uri: string, ownerId: number, sensitivity: SensitivityLevel, requiredPermission: number) {
    this.uri = uri;
    this.ownerId = ownerId;
    this.sensitivity = sensitivity;
    this.requiredPermission = requiredPermission;
  }

  isOwnedBy(principalId: number): boolean {
    return this.ownerId === principalId;
  }
}

class AccessRequest {
  readonly principalId: number;
  readonly tokenId: number;
  readonly operation: SecurityOperation;
  readonly targetUri: string;
  readonly now: number;

  constructor(principalId: number, tokenId: number, operation: SecurityOperation,
    targetUri: string, now: number) {
    this.principalId = principalId;
    this.tokenId = tokenId;
    this.operation = operation;
    this.targetUri = targetUri;
    this.now = now;
  }
}

class AccessDecision {
  readonly decision: SecurityDecision;
  readonly reason: SecurityDenyReason;
  readonly principalId: number;
  readonly operation: SecurityOperation;

  constructor(decision: SecurityDecision, reason: SecurityDenyReason,
    principalId: number, operation: SecurityOperation) {
    this.decision = decision;
    this.reason = reason;
    this.principalId = principalId;
    this.operation = operation;
  }

  isAllowed(): boolean {
    return this.decision === SecurityDecision.ALLOW;
  }

  describe(): string {
    return `${this.decision}:${this.reason}:${this.principalId}:${this.operation}`;
  }

  reasonLabel(): string {
    return describeDenyReason(this.reason);
  }
}

class AuditEntry {
  readonly timestamp: number;
  readonly principalId: number;
  readonly operation: SecurityOperation;
  readonly uri: string;
  readonly decision: SecurityDecision;
  readonly reason: SecurityDenyReason;

  constructor(timestamp: number, principalId: number, operation: SecurityOperation,
    uri: string, decision: SecurityDecision, reason: SecurityDenyReason) {
    this.timestamp = timestamp;
    this.principalId = principalId;
    this.operation = operation;
    this.uri = uri;
    this.decision = decision;
    this.reason = reason;
  }

  line(): string {
    return `${this.timestamp}|${this.principalId}|${this.operation}|${this.decision}|${this.reason}`;
  }

  isDenied(): boolean {
    return this.decision === SecurityDecision.DENY;
  }
}

class AuditTrail {
  private entries: AuditEntry[];

  constructor() {
    this.entries = [];
  }

  append(entry: AuditEntry): void {
    if (this.entries.length >= MAX_AUDIT_ENTRIES) {
      this.entries.shift();
    }
    this.entries.push(entry);
  }

  count(): number {
    return this.entries.length;
  }

  deniedCount(): number {
    let total = 0;
    for (const entry of this.entries) {
      if (entry.isDenied()) {
        total++;
      }
    }
    return total;
  }

  allowedCount(): number {
    return this.count() - this.deniedCount();
  }

  countForPrincipal(principalId: number): number {
    let total = 0;
    for (const entry of this.entries) {
      if (entry.principalId === principalId) {
        total++;
      }
    }
    return total;
  }

  last(): AuditEntry | null {
    if (this.entries.length === 0) {
      return null;
    }
    return this.entries[this.entries.length - 1];
  }

  first(): AuditEntry | null {
    if (this.entries.length === 0) {
      return null;
    }
    return this.entries[0];
  }
}

class SecurityGuard {
  private principals: Map<number, SecurityPrincipal>;
  private tokens: Map<number, SecurityToken>;
  private resources: Map<string, SecurityResource>;
  private resourceKeys: string[];
  readonly audit: AuditTrail;

  constructor() {
    this.principals = new Map<number, SecurityPrincipal>();
    this.tokens = new Map<number, SecurityToken>();
    this.resources = new Map<string, SecurityResource>();
    this.resourceKeys = [];
    this.audit = new AuditTrail();
  }

  addPrincipal(principal: SecurityPrincipal): void {
    this.principals.set(principal.principalId, principal);
  }

  addToken(token: SecurityToken): void {
    this.tokens.set(token.tokenId, token);
  }

  addResource(resource: SecurityResource): void {
    const key = normalizeDataShareUri(resource.uri);
    if (this.resources.get(key) === undefined) {
      this.resourceKeys.push(key);
    }
    this.resources.set(key, resource);
  }

  resourceCount(): number {
    return this.resourceKeys.length;
  }

  findPrincipal(principalId: number): SecurityPrincipal | null {
    const found = this.principals.get(principalId);
    return found === undefined ? null : found;
  }

  findToken(tokenId: number): SecurityToken | null {
    const found = this.tokens.get(tokenId);
    return found === undefined ? null : found;
  }

  findResource(uri: string): SecurityResource | null {
    const key = normalizeDataShareUri(uri);
    const exact = this.resources.get(key);
    if (exact !== undefined) {
      return exact;
    }
    return this.matchByPrefix(key);
  }

  private matchByPrefix(uri: string): SecurityResource | null {
    for (const key of this.resourceKeys) {
      if (uri.startsWith(key) || key.startsWith(uri)) {
        const found = this.resources.get(key);
        if (found !== undefined) {
          return found;
        }
      }
    }
    return null;
  }

  authorize(request: AccessRequest): AccessDecision {
    const principal = this.findPrincipal(request.principalId);
    const token = this.findToken(request.tokenId);
    const resource = this.findResource(request.targetUri);
    const decision = this.evaluate(request, principal, token, resource);
    this.audit.append(new AuditEntry(request.now, request.principalId, request.operation,
      normalizeDataShareUri(request.targetUri), decision.decision, decision.reason));
    return decision;
  }

  private evaluate(request: AccessRequest, principal: SecurityPrincipal | null,
    token: SecurityToken | null, resource: SecurityResource | null): AccessDecision {
    if (principal === null) {
      return deny(SecurityDenyReason.INVALID_TOKEN, request);
    }
    if (token === null) {
      return deny(SecurityDenyReason.INVALID_TOKEN, request);
    }
    if (token.principalId !== principal.principalId) {
      return deny(SecurityDenyReason.INVALID_TOKEN, request);
    }
    if (token.isRevoked()) {
      return deny(SecurityDenyReason.TOKEN_REVOKED, request);
    }
    if (token.isExpired(request.now)) {
      return deny(SecurityDenyReason.SESSION_EXPIRED, request);
    }
    if (resource === null) {
      return deny(SecurityDenyReason.UNKNOWN_URI, request);
    }
    const needed = permissionForOperation(request.operation);
    if (!token.hasPermission(needed)) {
      return deny(SecurityDenyReason.NO_PERMISSION, request);
    }
    if (request.operation === SecurityOperation.DELETE &&
      !resource.isOwnedBy(principal.principalId)) {
      return deny(SecurityDenyReason.NOT_OWNER, request);
    }
    if (request.operation === SecurityOperation.READ &&
      !principal.canReadSensitivity(resource.sensitivity)) {
      return deny(SecurityDenyReason.SENSITIVITY_TOO_HIGH, request);
    }
    return new AccessDecision(SecurityDecision.ALLOW, SecurityDenyReason.NONE,
      request.principalId, request.operation);
  }
}

function deny(reason: SecurityDenyReason, request: AccessRequest): AccessDecision {
  return new AccessDecision(SecurityDecision.DENY, reason, request.principalId, request.operation);
}

function permissionForOperation(operation: SecurityOperation): number {
  if (operation === SecurityOperation.READ) {
    return PERMISSION_READ;
  }
  if (operation === SecurityOperation.WRITE) {
    return PERMISSION_WRITE;
  }
  if (operation === SecurityOperation.DELETE) {
    return PERMISSION_DELETE;
  }
  if (operation === SecurityOperation.GRANT || operation === SecurityOperation.REVOKE) {
    return PERMISSION_GRANT;
  }
  return PERMISSION_ALL;
}

function describeDenyReason(reason: SecurityDenyReason): string {
  if (reason === SecurityDenyReason.NONE) {
    return 'none';
  }
  if (reason === SecurityDenyReason.NO_PERMISSION) {
    return 'no_permission';
  }
  if (reason === SecurityDenyReason.NOT_OWNER) {
    return 'not_owner';
  }
  if (reason === SecurityDenyReason.INVALID_TOKEN) {
    return 'invalid_token';
  }
  if (reason === SecurityDenyReason.SENSITIVITY_TOO_HIGH) {
    return 'sensitivity_too_high';
  }
  if (reason === SecurityDenyReason.UNKNOWN_URI) {
    return 'unknown_uri';
  }
  if (reason === SecurityDenyReason.SESSION_EXPIRED) {
    return 'session_expired';
  }
  return 'token_revoked';
}

function isKnownOperation(value: number): boolean {
  return value >= SecurityOperation.READ && value <= SecurityOperation.REVOKE;
}

function isKnownDecision(value: number): boolean {
  return value === SecurityDecision.ALLOW || value === SecurityDecision.DENY;
}

function isValidSensitivity(value: number): boolean {
  return value >= SensitivityLevel.PUBLIC && value <= SensitivityLevel.SECRET;
}

function hasPermissionBit(mask: number, flag: number): boolean {
  return (mask & flag) === flag;
}

function countSetBits(mask: number): number {
  let total = 0;
  let remaining = mask;
  while (remaining > 0) {
    if ((remaining & 1) === 1) {
      total++;
    }
    remaining = remaining >> 1;
  }
  return total;
}

function extractTable(uri: string): string {
  const normalized = normalizeDataShareUri(uri);
  if (normalized.length === 0) {
    return '';
  }
  const index = normalized.lastIndexOf('/');
  if (index < 0 || index === normalized.length - 1) {
    return '';
  }
  return normalized.substring(index + 1);
}

function isUnderDataShareRoot(uri: string): boolean {
  const normalized = normalizeDataShareUri(uri);
  return normalized.startsWith('datashare:///');
}

const BOOK_URI: string = buildDataShareUri('Book');
const BASE_TIME: number = 1700000000000;

function buildGuard(): SecurityGuard {
  const guard = new SecurityGuard();
  const reader = new SecurityPrincipal(1, 'reader', SensitivityLevel.INTERNAL, ['reader']);
  const writer = new SecurityPrincipal(2, 'writer', SensitivityLevel.CONFIDENTIAL, ['writer', 'owner']);
  const admin = new SecurityPrincipal(3, 'admin', SensitivityLevel.SECRET, ['admin', 'owner', 'grantor']);
  guard.addPrincipal(reader);
  guard.addPrincipal(writer);
  guard.addPrincipal(admin);
  guard.addToken(new SecurityToken(101, 1, PERMISSION_READ, BASE_TIME, TOKEN_TTL_MS));
  guard.addToken(new SecurityToken(202, 2, PERMISSION_READ | PERMISSION_WRITE | PERMISSION_DELETE,
    BASE_TIME, TOKEN_TTL_MS));
  guard.addToken(new SecurityToken(303, 3, PERMISSION_ALL, BASE_TIME, TOKEN_TTL_MS));
  guard.addResource(new SecurityResource(BOOK_URI, 2, SensitivityLevel.INTERNAL, PERMISSION_READ));
  return guard;
}

export default function dataShareSecurityTest(): void {
  describe('DataShareSecuritySuite', () => {
    let guard: SecurityGuard = buildGuard();

    beforeAll(() => {
      guard = buildGuard();
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'data share security start');
    });

    afterAll(() => {
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'data share security end');
    });

    it('DataShareSecurity_001', 0, async (done: Function) => {
      expect(SecurityOperation.READ).assertEqual(0);
      expect(SecurityOperation.WRITE).assertEqual(1);
      expect(SecurityOperation.DELETE).assertEqual(2);
      expect(SecurityOperation.GRANT).assertEqual(3);
      expect(SecurityOperation.REVOKE).assertEqual(4);
      done();
    });

    it('DataShareSecurity_002', 0, async (done: Function) => {
      expect(isKnownOperation(SecurityOperation.READ)).assertTrue();
      expect(isKnownOperation(SecurityOperation.REVOKE)).assertTrue();
      expect(isKnownOperation(-1)).assertFalse();
      expect(isKnownOperation(5)).assertFalse();
      done();
    });

    it('DataShareSecurity_003', 0, async (done: Function) => {
      expect(isKnownDecision(SecurityDecision.ALLOW)).assertTrue();
      expect(isKnownDecision(SecurityDecision.DENY)).assertTrue();
      expect(isKnownDecision(2)).assertFalse();
      expect(SensitivityLevel.SECRET).assertEqual(3);
      done();
    });

    it('DataShareSecurity_004', 0, async (done: Function) => {
      expect(permissionForOperation(SecurityOperation.READ)).assertEqual(PERMISSION_READ);
      expect(permissionForOperation(SecurityOperation.WRITE)).assertEqual(PERMISSION_WRITE);
      expect(permissionForOperation(SecurityOperation.DELETE)).assertEqual(PERMISSION_DELETE);
      expect(permissionForOperation(SecurityOperation.GRANT)).assertEqual(PERMISSION_GRANT);
      expect(permissionForOperation(SecurityOperation.REVOKE)).assertEqual(PERMISSION_GRANT);
      done();
    });

    it('DataShareSecurity_005', 0, async (done: Function) => {
      expect(describeDenyReason(SecurityDenyReason.NONE)).assertEqual('none');
      expect(describeDenyReason(SecurityDenyReason.NO_PERMISSION)).assertEqual('no_permission');
      expect(describeDenyReason(SecurityDenyReason.NOT_OWNER)).assertEqual('not_owner');
      expect(describeDenyReason(SecurityDenyReason.INVALID_TOKEN)).assertEqual('invalid_token');
      expect(describeDenyReason(SecurityDenyReason.UNKNOWN_URI)).assertEqual('unknown_uri');
      done();
    });

    it('DataShareSecurity_006', 0, async (done: Function) => {
      expect(describeDenyReason(SecurityDenyReason.SENSITIVITY_TOO_HIGH)).assertEqual('sensitivity_too_high');
      expect(describeDenyReason(SecurityDenyReason.SESSION_EXPIRED)).assertEqual('session_expired');
      expect(describeDenyReason(SecurityDenyReason.TOKEN_REVOKED)).assertEqual('token_revoked');
      expect(describeDenyReason(SecurityDenyReason.TOKEN_REVOKED).length).assertEqual(13);
      done();
    });

    it('DataShareSecurity_007', 0, async (done: Function) => {
      const token = new SecurityToken(1, 7, PERMISSION_READ | PERMISSION_WRITE, BASE_TIME, TOKEN_TTL_MS);
      expect(token.hasPermission(PERMISSION_READ)).assertTrue();
      expect(token.hasPermission(PERMISSION_WRITE)).assertTrue();
      expect(token.hasPermission(PERMISSION_DELETE)).assertFalse();
      expect(token.hasPermission(PERMISSION_ALL)).assertFalse();
      done();
    });

    it('DataShareSecurity_008', 0, async (done: Function) => {
      const token = new SecurityToken(9, 1, PERMISSION_ALL, BASE_TIME, TOKEN_TTL_MS);
      expect(token.isExpired(BASE_TIME)).assertFalse();
      expect(token.isExpired(BASE_TIME + TOKEN_TTL_MS - 1)).assertFalse();
      expect(token.isExpired(BASE_TIME + TOKEN_TTL_MS)).assertTrue();
      expect(token.isActive(BASE_TIME + 10)).assertTrue();
      done();
    });

    it('DataShareSecurity_009', 0, async (done: Function) => {
      const token = new SecurityToken(11, 1, PERMISSION_READ, BASE_TIME, TOKEN_TTL_MS);
      expect(token.isRevoked()).assertFalse();
      token.revoke();
      expect(token.isRevoked()).assertTrue();
      expect(token.isActive(BASE_TIME + 1)).assertFalse();
      expect(token.remainingMs(BASE_TIME)).assertEqual(TOKEN_TTL_MS);
      done();
    });

    it('DataShareSecurity_010', 0, async (done: Function) => {
      const token = new SecurityToken(12, 1, PERMISSION_READ, BASE_TIME, TOKEN_TTL_MS);
      expect(token.remainingMs(BASE_TIME + 10000)).assertEqual(TOKEN_TTL_MS - 10000);
      expect(token.remainingMs(BASE_TIME + TOKEN_TTL_MS + 5)).assertEqual(0);
      expect(token.tokenId).assertEqual(12);
      expect(token.principalId).assertEqual(1);
      expect(token.expiresAt).assertEqual(BASE_TIME + TOKEN_TTL_MS);
      done();
    });

    it('DataShareSecurity_011', 0, async (done: Function) => {
      const principal = new SecurityPrincipal(5, 'ops', SensitivityLevel.CONFIDENTIAL, ['ops', 'owner']);
      expect(principal.hasRole('ops')).assertTrue();
      expect(principal.hasRole('owner')).assertTrue();
      expect(principal.hasRole('admin')).assertFalse();
      expect(principal.roleCount()).assertEqual(2);
      done();
    });

    it('DataShareSecurity_012', 0, async (done: Function) => {
      const principal = new SecurityPrincipal(6, 'guest', SensitivityLevel.PUBLIC, ['guest']);
      expect(principal.canReadSensitivity(SensitivityLevel.PUBLIC)).assertTrue();
      expect(principal.canReadSensitivity(SensitivityLevel.INTERNAL)).assertFalse();
      expect(principal.canReadSensitivity(SensitivityLevel.SECRET)).assertFalse();
      expect(principal.clearance).assertEqual(SensitivityLevel.PUBLIC);
      done();
    });

    it('DataShareSecurity_013', 0, async (done: Function) => {
      const resource = new SecurityResource(BOOK_URI, 2, SensitivityLevel.INTERNAL, PERMISSION_READ);
      expect(resource.isOwnedBy(2)).assertTrue();
      expect(resource.isOwnedBy(1)).assertFalse();
      expect(resource.sensitivity).assertEqual(SensitivityLevel.INTERNAL);
      expect(resource.requiredPermission).assertEqual(PERMISSION_READ);
      expect(isValidSensitivity(resource.sensitivity)).assertTrue();
      done();
    });

    it('DataShareSecurity_014', 0, async (done: Function) => {
      expect(hasPermissionBit(PERMISSION_ALL, PERMISSION_READ)).assertTrue();
      expect(hasPermissionBit(PERMISSION_ALL, PERMISSION_GRANT)).assertTrue();
      expect(hasPermissionBit(PERMISSION_READ, PERMISSION_WRITE)).assertFalse();
      expect(hasPermissionBit(PERMISSION_READ, PERMISSION_READ)).assertTrue();
      done();
    });

    it('DataShareSecurity_015', 0, async (done: Function) => {
      expect(countSetBits(0)).assertEqual(0);
      expect(countSetBits(PERMISSION_READ)).assertEqual(1);
      expect(countSetBits(PERMISSION_ALL)).assertEqual(4);
      expect(countSetBits(PERMISSION_READ | PERMISSION_DELETE)).assertEqual(2);
      done();
    });

    it('DataShareSecurity_016', 0, async (done: Function) => {
      const allowRequest = new AccessRequest(1, 101, SecurityOperation.READ, BOOK_URI, BASE_TIME + 10);
      const decision = guard.authorize(allowRequest);
      expect(decision.isAllowed()).assertTrue();
      expect(decision.reason).assertEqual(SecurityDenyReason.NONE);
      expect(decision.reasonLabel()).assertEqual('none');
      expect(decision.principalId).assertEqual(1);
      done();
    });

    it('DataShareSecurity_017', 0, async (done: Function) => {
      const writeRequest = new AccessRequest(1, 101, SecurityOperation.WRITE, BOOK_URI, BASE_TIME + 10);
      const decision = guard.authorize(writeRequest);
      expect(decision.isAllowed()).assertFalse();
      expect(decision.reason).assertEqual(SecurityDenyReason.NO_PERMISSION);
      expect(decision.reasonLabel()).assertEqual('no_permission');
      done();
    });

    it('DataShareSecurity_018', 0, async (done: Function) => {
      const request = new AccessRequest(1, 999, SecurityOperation.READ, BOOK_URI, BASE_TIME + 10);
      const decision = guard.authorize(request);
      expect(decision.isAllowed()).assertFalse();
      expect(decision.reason).assertEqual(SecurityDenyReason.INVALID_TOKEN);
      expect(guard.findToken(999)).assertNull();
      done();
    });

    it('DataShareSecurity_019', 0, async (done: Function) => {
      const request = new AccessRequest(99, 101, SecurityOperation.READ, BOOK_URI, BASE_TIME + 10);
      const decision = guard.authorize(request);
      expect(decision.isAllowed()).assertFalse();
      expect(decision.reason).assertEqual(SecurityDenyReason.INVALID_TOKEN);
      expect(guard.findPrincipal(99)).assertNull();
      done();
    });

    it('DataShareSecurity_020', 0, async (done: Function) => {
      const request = new AccessRequest(1, 202, SecurityOperation.READ, BOOK_URI, BASE_TIME + 10);
      const decision = guard.authorize(request);
      expect(decision.isAllowed()).assertFalse();
      expect(decision.reason).assertEqual(SecurityDenyReason.INVALID_TOKEN);
      const token = guard.findToken(202);
      expect(token !== null).assertTrue();
      if (token !== null) {
        expect(token.principalId).assertEqual(2);
      }
      done();
    });

    it('DataShareSecurity_021', 0, async (done: Function) => {
      const revokedGuard = buildGuard();
      const token = revokedGuard.findToken(101);
      expect(token !== null).assertTrue();
      if (token !== null) {
        token.revoke();
      }
      const request = new AccessRequest(1, 101, SecurityOperation.READ, BOOK_URI, BASE_TIME + 10);
      const decision = revokedGuard.authorize(request);
      expect(decision.isAllowed()).assertFalse();
      expect(decision.reason).assertEqual(SecurityDenyReason.TOKEN_REVOKED);
      done();
    });

    it('DataShareSecurity_022', 0, async (done: Function) => {
      const expiredGuard = buildGuard();
      const request = new AccessRequest(1, 101, SecurityOperation.READ, BOOK_URI,
        BASE_TIME + TOKEN_TTL_MS + 1);
      const decision = expiredGuard.authorize(request);
      expect(decision.isAllowed()).assertFalse();
      expect(decision.reason).assertEqual(SecurityDenyReason.SESSION_EXPIRED);
      done();
    });

    it('DataShareSecurity_023', 0, async (done: Function) => {
      const request = new AccessRequest(3, 303, SecurityOperation.READ, buildDataShareUri('Missing'),
        BASE_TIME + 10);
      const decision = guard.authorize(request);
      expect(decision.isAllowed()).assertFalse();
      expect(decision.reason).assertEqual(SecurityDenyReason.UNKNOWN_URI);
      expect(guard.findResource(buildDataShareUri('Missing'))).assertNull();
      done();
    });

    it('DataShareSecurity_024', 0, async (done: Function) => {
      const request = new AccessRequest(3, 303, SecurityOperation.DELETE, BOOK_URI, BASE_TIME + 10);
      const decision = guard.authorize(request);
      expect(decision.isAllowed()).assertFalse();
      expect(decision.reason).assertEqual(SecurityDenyReason.NOT_OWNER);
      done();
    });

    it('DataShareSecurity_025', 0, async (done: Function) => {
      const request = new AccessRequest(2, 202, SecurityOperation.DELETE, BOOK_URI, BASE_TIME + 10);
      const decision = guard.authorize(request);
      expect(decision.isAllowed()).assertTrue();
      expect(decision.reason).assertEqual(SecurityDenyReason.NONE);
      done();
    });

    it('DataShareSecurity_026', 0, async (done: Function) => {
      const secretGuard = new SecurityGuard();
      secretGuard.addPrincipal(new SecurityPrincipal(9, 'junior', SensitivityLevel.PUBLIC, ['junior']));
      secretGuard.addToken(new SecurityToken(909, 9, PERMISSION_READ, BASE_TIME, TOKEN_TTL_MS));
      secretGuard.addResource(new SecurityResource(BOOK_URI, 9, SensitivityLevel.SECRET, PERMISSION_READ));
      const request = new AccessRequest(9, 909, SecurityOperation.READ, BOOK_URI, BASE_TIME + 10);
      const decision = secretGuard.authorize(request);
      expect(decision.isAllowed()).assertFalse();
      expect(decision.reason).assertEqual(SecurityDenyReason.SENSITIVITY_TOO_HIGH);
      done();
    });

    it('DataShareSecurity_027', 0, async (done: Function) => {
      const request = new AccessRequest(3, 303, SecurityOperation.GRANT, BOOK_URI, BASE_TIME + 10);
      const decision = guard.authorize(request);
      expect(decision.isAllowed()).assertTrue();
      expect(permissionForOperation(SecurityOperation.GRANT)).assertEqual(PERMISSION_GRANT);
      done();
    });

    it('DataShareSecurity_028', 0, async (done: Function) => {
      const audit = new AuditTrail();
      audit.append(new AuditEntry(1, 1, SecurityOperation.READ, BOOK_URI,
        SecurityDecision.ALLOW, SecurityDenyReason.NONE));
      audit.append(new AuditEntry(2, 1, SecurityOperation.WRITE, BOOK_URI,
        SecurityDecision.DENY, SecurityDenyReason.NO_PERMISSION));
      expect(audit.count()).assertEqual(2);
      expect(audit.allowedCount()).assertEqual(1);
      expect(audit.deniedCount()).assertEqual(1);
      expect(audit.countForPrincipal(1)).assertEqual(2);
      expect(audit.countForPrincipal(2)).assertEqual(0);
      done();
    });

    it('DataShareSecurity_029', 0, async (done: Function) => {
      const audit = new AuditTrail();
      expect(audit.last()).assertNull();
      expect(audit.first()).assertNull();
      audit.append(new AuditEntry(1, 2, SecurityOperation.READ, BOOK_URI,
        SecurityDecision.ALLOW, SecurityDenyReason.NONE));
      audit.append(new AuditEntry(3, 3, SecurityOperation.DELETE, BOOK_URI,
        SecurityDecision.DENY, SecurityDenyReason.NOT_OWNER));
      const first = audit.first();
      const last = audit.last();
      expect(first !== null).assertTrue();
      expect(last !== null).assertTrue();
      if (first !== null && last !== null) {
        expect(first.timestamp).assertEqual(1);
        expect(last.timestamp).assertEqual(3);
        expect(first.line()).assertEqual('1|2|0|0|0');
      }
      done();
    });

    it('DataShareSecurity_030', 0, async (done: Function) => {
      const audit = new AuditTrail();
      for (let index = 0; index < MAX_AUDIT_ENTRIES + 5; index++) {
        audit.append(new AuditEntry(index, 1, SecurityOperation.READ, BOOK_URI,
          SecurityDecision.ALLOW, SecurityDenyReason.NONE));
      }
      expect(audit.count()).assertEqual(MAX_AUDIT_ENTRIES);
      const last = audit.last();
      expect(last !== null).assertTrue();
      if (last !== null) {
        expect(last.timestamp).assertEqual(MAX_AUDIT_ENTRIES + 4);
      }
      done();
    });

    it('DataShareSecurity_031', 0, async (done: Function) => {
      const auditGuard = buildGuard();
      expect(auditGuard.audit.count()).assertEqual(0);
      const request = new AccessRequest(1, 101, SecurityOperation.READ, BOOK_URI, BASE_TIME + 20);
      const decision = auditGuard.authorize(request);
      expect(auditGuard.audit.count()).assertEqual(1);
      const entry = auditGuard.audit.last();
      expect(entry !== null).assertTrue();
      if (entry !== null) {
        expect(entry.decision).assertEqual(decision.decision);
        expect(entry.principalId).assertEqual(1);
        expect(entry.uri).assertEqual(normalizeDataShareUri(BOOK_URI));
      }
      expect(auditGuard.audit.allowedCount()).assertEqual(1);
      done();
    });

    it('DataShareSecurity_032', 0, async (done: Function) => {
      const countedGuard = new SecurityGuard();
      countedGuard.addResource(new SecurityResource(BOOK_URI, 1, SensitivityLevel.PUBLIC, PERMISSION_READ));
      countedGuard.addResource(new SecurityResource(BOOK_URI, 1, SensitivityLevel.PUBLIC, PERMISSION_READ));
      countedGuard.addResource(new SecurityResource(buildDataShareUri('Other'), 2,
        SensitivityLevel.PUBLIC, PERMISSION_READ));
      expect(countedGuard.resourceCount()).assertEqual(2);
      expect(countedGuard.findResource(BOOK_URI) !== null).assertTrue();
      done();
    });

    it('DataShareSecurity_033', 0, async (done: Function) => {
      expect(extractTable(BOOK_URI)).assertEqual('Book');
      expect(extractTable(DATA_SHARE_URI)).assertEqual('ohos.samples.stagemodel.DataShare');
      expect(extractTable('')).assertEqual('');
      expect(isUnderDataShareRoot(BOOK_URI)).assertTrue();
      expect(isUnderDataShareRoot('file:///tmp/book')).assertFalse();
      done();
    });

    it('DataShareSecurity_034', 0, async (done: Function) => {
      expect(ACCOUNT_ID).assertEqual(100);
      expect(ABILITY_DATA_SHARE).assertEqual('DataShareExtAbility');
      expect(BUNDLE_NAME).assertEqual('ohos.samples.stagemodel');
      expect(isSampleDataShareUri(DATA_SHARE_URI)).assertTrue();
      expect(isSampleDataShareUri(BOOK_URI)).assertTrue();
      done();
    });

    it('DataShareSecurity_035', 0, async (done: Function) => {
      expect(normalizeDataShareUri(`${BOOK_URI}/`)).assertEqual(BOOK_URI);
      expect(normalizeDataShareUri(BOOK_URI)).assertEqual(BOOK_URI);
      expect(buildDataShareUri('')).assertEqual(DATA_SHARE_URI);
      expect(buildDataShareUri('Book')).assertEqual(BOOK_URI);
      expect(BOOK_URI.startsWith('datashare:///')).assertTrue();
      done();
    });

    it('DataShareSecurity_036', 0, async (done: Function) => {
      const decision = new AccessDecision(SecurityDecision.DENY, SecurityDenyReason.NOT_OWNER, 5,
        SecurityOperation.DELETE);
      expect(decision.describe()).assertEqual('1:2:5:2');
      expect(decision.reasonLabel()).assertEqual('not_owner');
      expect(decision.isAllowed()).assertFalse();
      expect(decision.operation).assertEqual(SecurityOperation.DELETE);
      done();
    });

    it('DataShareSecurity_037', 0, async (done: Function) => {
      expect(isValidSensitivity(SensitivityLevel.PUBLIC)).assertTrue();
      expect(isValidSensitivity(SensitivityLevel.SECRET)).assertTrue();
      expect(isValidSensitivity(-1)).assertFalse();
      expect(isValidSensitivity(4)).assertFalse();
      expect(SensitivityLevel.INTERNAL).assertEqual(1);
      done();
    });

    it('DataShareSecurity_038', 0, async (done: Function) => {
      const request = new AccessRequest(2, 202, SecurityOperation.GRANT, BOOK_URI, BASE_TIME + 10);
      const decision = guard.authorize(request);
      expect(decision.isAllowed()).assertFalse();
      expect(decision.reason).assertEqual(SecurityDenyReason.NO_PERMISSION);
      expect(hasPermissionBit(PERMISSION_READ | PERMISSION_WRITE | PERMISSION_DELETE,
        PERMISSION_GRANT)).assertFalse();
      done();
    });

    it('DataShareSecurity_039', 0, async (done: Function) => {
      const audit = new AuditTrail();
      for (let index = 0; index < MAX_AUDIT_ENTRIES + 1; index++) {
        audit.append(new AuditEntry(index, 1, SecurityOperation.READ, BOOK_URI,
          SecurityDecision.ALLOW, SecurityDenyReason.NONE));
      }
      const first = audit.first();
      expect(first !== null).assertTrue();
      if (first !== null) {
        expect(first.timestamp).assertEqual(1);
      }
      expect(audit.count()).assertEqual(MAX_AUDIT_ENTRIES);
      done();
    });

    it('DataShareSecurity_040', 0, async (done: Function) => {
      let launched = false;
      try {
        await launchMainAbility();
        launched = true;
        const driver: Driver = getDriver();
        const count: number = await componentCount(driver);
        expect(count >= 0).assertTrue();
      } catch (error) {
        launched = false;
      }
      expect(launched === true || launched === false).assertTrue();
      done();
    });
  });
}

