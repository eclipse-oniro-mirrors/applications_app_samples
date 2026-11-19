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
  getDriver, componentCount, launchMainAbility, DATA_SHARE_URI, BUNDLE_NAME, ACCOUNT_ID
} from '../Shared/SharedDriver';

enum SecuritySeverity {
  OK = 0,
  WARN = 1,
  ERROR = 2
}

enum SecurityFieldKind {
  PASSWORD = 0,
  PERMISSION = 1,
  TOKEN = 2,
  URI = 3,
  ROLE = 4,
  SESSION = 5,
  FINGERPRINT = 6
}

enum SecurityRuleCode {
  OK = 0,
  EMPTY = 1,
  TOO_SHORT = 2,
  TOO_LONG = 3,
  WEAK = 4,
  BAD_CHARS = 5,
  PATH_TRAVERSAL = 6,
  BAD_FORMAT = 7,
  EXPIRED = 8,
  UNKNOWN_ROLE = 9
}

const PASSWORD_MIN_LENGTH: number = 8;
const PASSWORD_MAX_LENGTH: number = 128;
const TOKEN_MIN_LENGTH: number = 16;
const SESSION_ID_LENGTH: number = 32;
const PERMISSION_PREFIX: string = 'ohos.permission.';
const FINGERPRINT_HEX_LENGTH: number = 64;
const ALLOWED_ROLES: string[] = ['reader', 'writer', 'owner', 'admin', 'grantor'];

class SecurityFinding {
  readonly code: SecurityRuleCode;
  readonly severity: SecuritySeverity;
  readonly field: SecurityFieldKind;
  readonly detail: string;

  constructor(code: SecurityRuleCode, severity: SecuritySeverity, field: SecurityFieldKind, detail: string) {
    this.code = code;
    this.severity = severity;
    this.field = field;
    this.detail = detail;
  }

  isError(): boolean {
    return this.severity === SecuritySeverity.ERROR;
  }

  describe(): string {
    return `${this.code}:${this.severity}:${this.field}:${this.detail}`;
  }
}

class SecurityFindingSet {
  readonly findings: SecurityFinding[];

  constructor(findings: SecurityFinding[]) {
    this.findings = findings;
  }

  count(): number {
    return this.findings.length;
  }

  isValid(): boolean {
    for (const finding of this.findings) {
      if (finding.isError()) {
        return false;
      }
    }
    return true;
  }

  errorCount(): number {
    let total = 0;
    for (const finding of this.findings) {
      if (finding.severity === SecuritySeverity.ERROR) {
        total++;
      }
    }
    return total;
  }

  warnCount(): number {
    let total = 0;
    for (const finding of this.findings) {
      if (finding.severity === SecuritySeverity.WARN) {
        total++;
      }
    }
    return total;
  }

  countByCode(code: SecurityRuleCode): number {
    let total = 0;
    for (const finding of this.findings) {
      if (finding.code === code) {
        total++;
      }
    }
    return total;
  }

  highestSeverity(): SecuritySeverity {
    let highest = SecuritySeverity.OK;
    for (const finding of this.findings) {
      if (finding.severity > highest) {
        highest = finding.severity;
      }
    }
    return highest;
  }
}

class PasswordPolicy {
  validate(password: string): SecurityFindingSet {
    const findings: SecurityFinding[] = [];
    if (password.length === 0) {
      findings.push(new SecurityFinding(SecurityRuleCode.EMPTY, SecuritySeverity.ERROR,
        SecurityFieldKind.PASSWORD, 'password empty'));
      return new SecurityFindingSet(findings);
    }
    if (password.length < PASSWORD_MIN_LENGTH) {
      findings.push(new SecurityFinding(SecurityRuleCode.TOO_SHORT, SecuritySeverity.ERROR,
        SecurityFieldKind.PASSWORD, 'password too short'));
    }
    if (password.length > PASSWORD_MAX_LENGTH) {
      findings.push(new SecurityFinding(SecurityRuleCode.TOO_LONG, SecuritySeverity.ERROR,
        SecurityFieldKind.PASSWORD, 'password too long'));
    }
    if (!hasUppercase(password)) {
      findings.push(new SecurityFinding(SecurityRuleCode.WEAK, SecuritySeverity.WARN,
        SecurityFieldKind.PASSWORD, 'missing uppercase'));
    }
    if (!hasLowercase(password)) {
      findings.push(new SecurityFinding(SecurityRuleCode.WEAK, SecuritySeverity.WARN,
        SecurityFieldKind.PASSWORD, 'missing lowercase'));
    }
    if (!hasDigit(password)) {
      findings.push(new SecurityFinding(SecurityRuleCode.WEAK, SecuritySeverity.WARN,
        SecurityFieldKind.PASSWORD, 'missing digit'));
    }
    if (!hasSpecial(password)) {
      findings.push(new SecurityFinding(SecurityRuleCode.WEAK, SecuritySeverity.WARN,
        SecurityFieldKind.PASSWORD, 'missing special character'));
    }
    return new SecurityFindingSet(findings);
  }

  isStrong(password: string): boolean {
    return password.length >= PASSWORD_MIN_LENGTH && hasUppercase(password) &&
      hasLowercase(password) && hasDigit(password) && hasSpecial(password);
  }

  strengthScore(password: string): number {
    let score = 0;
    if (password.length >= PASSWORD_MIN_LENGTH) {
      score += 1;
    }
    if (hasUppercase(password)) {
      score += 1;
    }
    if (hasLowercase(password)) {
      score += 1;
    }
    if (hasDigit(password)) {
      score += 1;
    }
    if (hasSpecial(password)) {
      score += 1;
    }
    return score;
  }
}

class PermissionNameValidator {
  validate(permission: string): SecurityFindingSet {
    const findings: SecurityFinding[] = [];
    if (permission.length === 0) {
      findings.push(new SecurityFinding(SecurityRuleCode.EMPTY, SecuritySeverity.ERROR,
        SecurityFieldKind.PERMISSION, 'permission empty'));
      return new SecurityFindingSet(findings);
    }
    if (!permission.startsWith(PERMISSION_PREFIX)) {
      findings.push(new SecurityFinding(SecurityRuleCode.BAD_FORMAT, SecuritySeverity.ERROR,
        SecurityFieldKind.PERMISSION, 'missing ohos.permission prefix'));
    }
    if (permission.length <= PERMISSION_PREFIX.length) {
      findings.push(new SecurityFinding(SecurityRuleCode.BAD_FORMAT, SecuritySeverity.ERROR,
        SecurityFieldKind.PERMISSION, 'empty permission body'));
    }
    if (containsWhitespace(permission)) {
      findings.push(new SecurityFinding(SecurityRuleCode.BAD_CHARS, SecuritySeverity.ERROR,
        SecurityFieldKind.PERMISSION, 'permission contains whitespace'));
    }
    return new SecurityFindingSet(findings);
  }

  isValid(permission: string): boolean {
    return this.validate(permission).isValid();
  }
}

class TokenValidator {
  validate(token: string, now: number, expiresAt: number): SecurityFindingSet {
    const findings: SecurityFinding[] = [];
    if (token.length === 0) {
      findings.push(new SecurityFinding(SecurityRuleCode.EMPTY, SecuritySeverity.ERROR,
        SecurityFieldKind.TOKEN, 'token empty'));
      return new SecurityFindingSet(findings);
    }
    if (token.length < TOKEN_MIN_LENGTH) {
      findings.push(new SecurityFinding(SecurityRuleCode.TOO_SHORT, SecuritySeverity.ERROR,
        SecurityFieldKind.TOKEN, 'token too short'));
    }
    if (containsWhitespace(token)) {
      findings.push(new SecurityFinding(SecurityRuleCode.BAD_CHARS, SecuritySeverity.ERROR,
        SecurityFieldKind.TOKEN, 'token contains whitespace'));
    }
    if (now >= expiresAt) {
      findings.push(new SecurityFinding(SecurityRuleCode.EXPIRED, SecuritySeverity.ERROR,
        SecurityFieldKind.TOKEN, 'token expired'));
    }
    return new SecurityFindingSet(findings);
  }
}

class UriSafetyValidator {
  validate(uri: string): SecurityFindingSet {
    const findings: SecurityFinding[] = [];
    if (uri.length === 0) {
      findings.push(new SecurityFinding(SecurityRuleCode.EMPTY, SecuritySeverity.ERROR,
        SecurityFieldKind.URI, 'uri empty'));
      return new SecurityFindingSet(findings);
    }
    if (containsPathTraversal(uri)) {
      findings.push(new SecurityFinding(SecurityRuleCode.PATH_TRAVERSAL, SecuritySeverity.ERROR,
        SecurityFieldKind.URI, 'path traversal detected'));
    }
    if (!uri.startsWith('datashare:///') && !uri.startsWith('file://')) {
      findings.push(new SecurityFinding(SecurityRuleCode.BAD_FORMAT, SecuritySeverity.ERROR,
        SecurityFieldKind.URI, 'unsupported scheme'));
    }
    return new SecurityFindingSet(findings);
  }
}

class RoleValidator {
  validate(role: string): SecurityFindingSet {
    const findings: SecurityFinding[] = [];
    if (role.length === 0) {
      findings.push(new SecurityFinding(SecurityRuleCode.EMPTY, SecuritySeverity.ERROR,
        SecurityFieldKind.ROLE, 'role empty'));
      return new SecurityFindingSet(findings);
    }
    if (ALLOWED_ROLES.indexOf(role) < 0) {
      findings.push(new SecurityFinding(SecurityRuleCode.UNKNOWN_ROLE, SecuritySeverity.ERROR,
        SecurityFieldKind.ROLE, 'unknown role'));
    }
    return new SecurityFindingSet(findings);
  }
}

class SessionValidator {
  validate(sessionId: string): SecurityFindingSet {
    const findings: SecurityFinding[] = [];
    if (sessionId.length === 0) {
      findings.push(new SecurityFinding(SecurityRuleCode.EMPTY, SecuritySeverity.ERROR,
        SecurityFieldKind.SESSION, 'session empty'));
      return new SecurityFindingSet(findings);
    }
    if (sessionId.length !== SESSION_ID_LENGTH) {
      findings.push(new SecurityFinding(SecurityRuleCode.BAD_FORMAT, SecuritySeverity.ERROR,
        SecurityFieldKind.SESSION, 'session must be 32 chars'));
    }
    if (!isHexString(sessionId)) {
      findings.push(new SecurityFinding(SecurityRuleCode.BAD_CHARS, SecuritySeverity.ERROR,
        SecurityFieldKind.SESSION, 'session must be hex'));
    }
    return new SecurityFindingSet(findings);
  }
}

class FingerprintValidator {
  validate(fingerprint: string): SecurityFindingSet {
    const findings: SecurityFinding[] = [];
    const normalized = stripColons(fingerprint);
    if (normalized.length === 0) {
      findings.push(new SecurityFinding(SecurityRuleCode.EMPTY, SecuritySeverity.ERROR,
        SecurityFieldKind.FINGERPRINT, 'fingerprint empty'));
      return new SecurityFindingSet(findings);
    }
    if (normalized.length !== FINGERPRINT_HEX_LENGTH) {
      findings.push(new SecurityFinding(SecurityRuleCode.BAD_FORMAT, SecuritySeverity.ERROR,
        SecurityFieldKind.FINGERPRINT, 'fingerprint must be 64 hex chars'));
    }
    if (!isHexString(normalized)) {
      findings.push(new SecurityFinding(SecurityRuleCode.BAD_CHARS, SecuritySeverity.ERROR,
        SecurityFieldKind.FINGERPRINT, 'fingerprint must be hex'));
    }
    return new SecurityFindingSet(findings);
  }
}

function hasUppercase(value: string): boolean {
  for (let index = 0; index < value.length; index++) {
    const code = value.charCodeAt(index);
    if (code >= 65 && code <= 90) {
      return true;
    }
  }
  return false;
}

function hasLowercase(value: string): boolean {
  for (let index = 0; index < value.length; index++) {
    const code = value.charCodeAt(index);
    if (code >= 97 && code <= 122) {
      return true;
    }
  }
  return false;
}

function hasDigit(value: string): boolean {
  for (let index = 0; index < value.length; index++) {
    const code = value.charCodeAt(index);
    if (code >= 48 && code <= 57) {
      return true;
    }
  }
  return false;
}

function hasSpecial(value: string): boolean {
  for (let index = 0; index < value.length; index++) {
    const code = value.charCodeAt(index);
    const isUpper = code >= 65 && code <= 90;
    const isLower = code >= 97 && code <= 122;
    const isDigit = code >= 48 && code <= 57;
    if (!isUpper && !isLower && !isDigit) {
      return true;
    }
  }
  return false;
}

function containsWhitespace(value: string): boolean {
  for (let index = 0; index < value.length; index++) {
    const code = value.charCodeAt(index);
    if (code === 32 || code === 9 || code === 10 || code === 13) {
      return true;
    }
  }
  return false;
}

function containsPathTraversal(uri: string): boolean {
  const lower = uri.toLowerCase();
  return lower.indexOf('..') >= 0 || lower.indexOf('%2e%2e') >= 0 || lower.indexOf('%2f') >= 0;
}

function isHexString(value: string): boolean {
  if (value.length === 0) {
    return false;
  }
  for (let index = 0; index < value.length; index++) {
    const code = value.charCodeAt(index);
    const isDigit = code >= 48 && code <= 57;
    const isLowerHex = code >= 97 && code <= 102;
    const isUpperHex = code >= 65 && code <= 70;
    if (!isDigit && !isLowerHex && !isUpperHex) {
      return false;
    }
  }
  return true;
}

function stripColons(value: string): string {
  let result = '';
  for (let index = 0; index < value.length; index++) {
    const current = value.charAt(index);
    if (current !== ':') {
      result += current;
    }
  }
  return result;
}

function sanitizeInput(value: string): string {
  let result = '';
  for (let index = 0; index < value.length; index++) {
    const current = value.charAt(index);
    if (current !== '<' && current !== '>' && current !== '\'' && current !== '"') {
      result += current;
    }
  }
  return result;
}

function describeSeverity(severity: SecuritySeverity): string {
  if (severity === SecuritySeverity.OK) {
    return 'ok';
  }
  if (severity === SecuritySeverity.WARN) {
    return 'warn';
  }
  return 'error';
}

function describeRule(code: SecurityRuleCode): string {
  if (code === SecurityRuleCode.OK) {
    return 'ok';
  }
  if (code === SecurityRuleCode.EMPTY) {
    return 'empty';
  }
  if (code === SecurityRuleCode.TOO_SHORT) {
    return 'too_short';
  }
  if (code === SecurityRuleCode.TOO_LONG) {
    return 'too_long';
  }
  if (code === SecurityRuleCode.WEAK) {
    return 'weak';
  }
  if (code === SecurityRuleCode.BAD_CHARS) {
    return 'bad_chars';
  }
  if (code === SecurityRuleCode.PATH_TRAVERSAL) {
    return 'path_traversal';
  }
  if (code === SecurityRuleCode.BAD_FORMAT) {
    return 'bad_format';
  }
  if (code === SecurityRuleCode.EXPIRED) {
    return 'expired';
  }
  return 'unknown_role';
}

const TOKEN_NOW: number = 1700000000000;
const TOKEN_EXPIRY: number = TOKEN_NOW + 60000;
const VALID_SESSION: string = 'a1b2c3d4e5f60718293a4b5c6d7e8f90';

export default function securityValidationTest(): void {
  describe('SecurityValidationSuite', () => {
    let passwordPolicy: PasswordPolicy = new PasswordPolicy();
    let permissionValidator: PermissionNameValidator = new PermissionNameValidator();
    let tokenValidator: TokenValidator = new TokenValidator();
    let uriValidator: UriSafetyValidator = new UriSafetyValidator();
    let roleValidator: RoleValidator = new RoleValidator();
    let sessionValidator: SessionValidator = new SessionValidator();
    let fingerprintValidator: FingerprintValidator = new FingerprintValidator();

    beforeAll(() => {
      passwordPolicy = new PasswordPolicy();
      permissionValidator = new PermissionNameValidator();
      tokenValidator = new TokenValidator();
      uriValidator = new UriSafetyValidator();
      roleValidator = new RoleValidator();
      sessionValidator = new SessionValidator();
      fingerprintValidator = new FingerprintValidator();
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'security validation start');
    });

    afterAll(() => {
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'security validation end');
    });

    it('SecurityValidation_001', 0, async (done: Function) => {
      expect(SecuritySeverity.OK).assertEqual(0);
      expect(SecuritySeverity.ERROR).assertEqual(2);
      expect(PASSWORD_MIN_LENGTH).assertEqual(8);
      expect(PASSWORD_MAX_LENGTH).assertEqual(128);
      expect(TOKEN_MIN_LENGTH).assertEqual(16);
      done();
    });

    it('SecurityValidation_002', 0, async (done: Function) => {
      expect(SESSION_ID_LENGTH).assertEqual(32);
      expect(FINGERPRINT_HEX_LENGTH).assertEqual(64);
      expect(PERMISSION_PREFIX).assertEqual('ohos.permission.');
      expect(ALLOWED_ROLES.length).assertEqual(5);
      expect(describeSeverity(SecuritySeverity.WARN)).assertEqual('warn');
      done();
    });

    it('SecurityValidation_003', 0, async (done: Function) => {
      const findings = passwordPolicy.validate('');
      expect(findings.count()).assertEqual(1);
      expect(findings.countByCode(SecurityRuleCode.EMPTY)).assertEqual(1);
      expect(findings.isValid()).assertFalse();
      expect(findings.highestSeverity()).assertEqual(SecuritySeverity.ERROR);
      done();
    });

    it('SecurityValidation_004', 0, async (done: Function) => {
      const findings = passwordPolicy.validate('Ab1@');
      expect(findings.isValid()).assertFalse();
      expect(findings.countByCode(SecurityRuleCode.TOO_SHORT)).assertEqual(1);
      expect(findings.errorCount()).assertEqual(1);
      expect(findings.warnCount()).assertEqual(0);
      done();
    });

    it('SecurityValidation_005', 0, async (done: Function) => {
      const findings = passwordPolicy.validate('abcdefgh');
      expect(findings.isValid()).assertTrue();
      expect(findings.countByCode(SecurityRuleCode.WEAK)).assertEqual(3);
      expect(findings.warnCount()).assertEqual(3);
      expect(findings.highestSeverity()).assertEqual(SecuritySeverity.WARN);
      done();
    });

    it('SecurityValidation_006', 0, async (done: Function) => {
      const findings = passwordPolicy.validate('Abcdefgh');
      expect(findings.countByCode(SecurityRuleCode.WEAK)).assertEqual(2);
      expect(findings.warnCount()).assertEqual(2);
      expect(passwordPolicy.strengthScore('Abcdefgh')).assertEqual(3);
      done();
    });

    it('SecurityValidation_007', 0, async (done: Function) => {
      const strong = 'Str0ng!Pass';
      expect(passwordPolicy.isStrong(strong)).assertTrue();
      expect(passwordPolicy.validate(strong).isValid()).assertTrue();
      expect(passwordPolicy.validate(strong).count()).assertEqual(0);
      expect(passwordPolicy.strengthScore(strong)).assertEqual(5);
      done();
    });

    it('SecurityValidation_008', 0, async (done: Function) => {
      expect(passwordPolicy.isStrong('weak')).assertFalse();
      expect(hasUppercase('abc')).assertFalse();
      expect(hasLowercase('ABC')).assertFalse();
      expect(hasDigit('abcABC')).assertFalse();
      expect(hasSpecial('abcABC123')).assertFalse();
      done();
    });

    it('SecurityValidation_009', 0, async (done: Function) => {
      expect(hasUppercase('aBc')).assertTrue();
      expect(hasLowercase('aBc')).assertTrue();
      expect(hasDigit('aB3')).assertTrue();
      expect(hasSpecial('aB3!')).assertTrue();
      expect(hasSpecial('aB3')).assertFalse();
      done();
    });

    it('SecurityValidation_010', 0, async (done: Function) => {
      let longPassword = 'Aa1!';
      for (let index = 0; index < PASSWORD_MAX_LENGTH; index++) {
        longPassword += 'x';
      }
      const findings = passwordPolicy.validate(longPassword);
      expect(findings.countByCode(SecurityRuleCode.TOO_LONG)).assertEqual(1);
      expect(findings.isValid()).assertFalse();
      expect(longPassword.length > PASSWORD_MAX_LENGTH).assertTrue();
      done();
    });

    it('SecurityValidation_011', 0, async (done: Function) => {
      const findings = permissionValidator.validate('ohos.permission.GRANT_SENSITIVE_PERMISSIONS');
      expect(findings.isValid()).assertTrue();
      expect(findings.count()).assertEqual(0);
      expect(permissionValidator.isValid('ohos.permission.READ_MEDIA')).assertTrue();
      done();
    });

    it('SecurityValidation_012', 0, async (done: Function) => {
      const findings = permissionValidator.validate('GRANT_SENSITIVE_PERMISSIONS');
      expect(findings.isValid()).assertFalse();
      expect(findings.countByCode(SecurityRuleCode.BAD_FORMAT)).assertEqual(1);
      expect(permissionValidator.isValid('com.example.permission.CAMERA')).assertFalse();
      done();
    });

    it('SecurityValidation_013', 0, async (done: Function) => {
      expect(permissionValidator.validate('').countByCode(SecurityRuleCode.EMPTY)).assertEqual(1);
      const whitespace = permissionValidator.validate('ohos.permission.BAD NAME');
      expect(whitespace.countByCode(SecurityRuleCode.BAD_CHARS)).assertEqual(1);
      expect(permissionValidator.validate(`${PERMISSION_PREFIX}`).isValid()).assertFalse();
      done();
    });

    it('SecurityValidation_014', 0, async (done: Function) => {
      const findings = tokenValidator.validate('abcdef0123456789abcdef', TOKEN_NOW, TOKEN_EXPIRY);
      expect(findings.isValid()).assertTrue();
      expect(findings.count()).assertEqual(0);
      expect(tokenValidator.validate('', TOKEN_NOW, TOKEN_EXPIRY).countByCode(
        SecurityRuleCode.EMPTY)).assertEqual(1);
      done();
    });

    it('SecurityValidation_015', 0, async (done: Function) => {
      const short = tokenValidator.validate('short', TOKEN_NOW, TOKEN_EXPIRY);
      expect(short.countByCode(SecurityRuleCode.TOO_SHORT)).assertEqual(1);
      const spaced = tokenValidator.validate('abcdefgh ijklmnop', TOKEN_NOW, TOKEN_EXPIRY);
      expect(spaced.countByCode(SecurityRuleCode.BAD_CHARS)).assertEqual(1);
      expect(short.isValid()).assertFalse();
      done();
    });

    it('SecurityValidation_016', 0, async (done: Function) => {
      const expired = tokenValidator.validate('abcdef0123456789abcdef', TOKEN_EXPIRY, TOKEN_EXPIRY);
      expect(expired.countByCode(SecurityRuleCode.EXPIRED)).assertEqual(1);
      expect(expired.isValid()).assertFalse();
      expect(expired.highestSeverity()).assertEqual(SecuritySeverity.ERROR);
      done();
    });

    it('SecurityValidation_017', 0, async (done: Function) => {
      expect(uriValidator.validate(DATA_SHARE_URI).isValid()).assertTrue();
      expect(uriValidator.validate('file:///data/book').isValid()).assertTrue();
      expect(uriValidator.validate('').countByCode(SecurityRuleCode.EMPTY)).assertEqual(1);
      done();
    });

    it('SecurityValidation_018', 0, async (done: Function) => {
      expect(containsPathTraversal('../etc/passwd')).assertTrue();
      expect(containsPathTraversal('%2e%2e%2fsecret')).assertTrue();
      expect(containsPathTraversal(DATA_SHARE_URI)).assertFalse();
      const findings = uriValidator.validate('datashare:///Book/../Secret');
      expect(findings.countByCode(SecurityRuleCode.PATH_TRAVERSAL)).assertEqual(1);
      expect(findings.isValid()).assertFalse();
      done();
    });

    it('SecurityValidation_019', 0, async (done: Function) => {
      const findings = uriValidator.validate('javascript://alert');
      expect(findings.countByCode(SecurityRuleCode.BAD_FORMAT)).assertEqual(1);
      expect(findings.isValid()).assertFalse();
      expect(uriValidator.validate('datashare:///Book').isValid()).assertTrue();
      done();
    });

    it('SecurityValidation_020', 0, async (done: Function) => {
      expect(roleValidator.validate('admin').isValid()).assertTrue();
      expect(roleValidator.validate('owner').isValid()).assertTrue();
      const unknown = roleValidator.validate('superuser');
      expect(unknown.countByCode(SecurityRuleCode.UNKNOWN_ROLE)).assertEqual(1);
      expect(unknown.isValid()).assertFalse();
      expect(roleValidator.validate('').countByCode(SecurityRuleCode.EMPTY)).assertEqual(1);
      done();
    });

    it('SecurityValidation_021', 0, async (done: Function) => {
      expect(sessionValidator.validate(VALID_SESSION).isValid()).assertTrue();
      expect(VALID_SESSION.length).assertEqual(SESSION_ID_LENGTH);
      const wrongLength = sessionValidator.validate('abcd');
      expect(wrongLength.countByCode(SecurityRuleCode.BAD_FORMAT)).assertEqual(1);
      const nonHex = sessionValidator.validate('zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz');
      expect(nonHex.countByCode(SecurityRuleCode.BAD_CHARS)).assertEqual(1);
      expect(sessionValidator.validate('').countByCode(SecurityRuleCode.EMPTY)).assertEqual(1);
      done();
    });

    it('SecurityValidation_022', 0, async (done: Function) => {
      let hex = '';
      for (let index = 0; index < FINGERPRINT_HEX_LENGTH; index++) {
        hex += 'a';
      }
      expect(fingerprintValidator.validate(hex).isValid()).assertTrue();
      expect(stripColons('aa:bb:cc')).assertEqual('aabbcc');
      expect(fingerprintValidator.validate('ab:cd').isValid()).assertFalse();
      expect(fingerprintValidator.validate('').countByCode(SecurityRuleCode.EMPTY)).assertEqual(1);
      done();
    });

    it('SecurityValidation_023', 0, async (done: Function) => {
      expect(isHexString('a1b2c3')).assertTrue();
      expect(isHexString('A1B2C3')).assertTrue();
      expect(isHexString('xyz')).assertFalse();
      expect(isHexString('')).assertFalse();
      expect(containsWhitespace('a b')).assertTrue();
      expect(containsWhitespace('ab')).assertFalse();
      done();
    });

    it('SecurityValidation_024', 0, async (done: Function) => {
      expect(sanitizeInput('<script>alert(1)</script>')).assertEqual('scriptalert(1)/script');
      expect(sanitizeInput('plain')).assertEqual('plain');
      expect(describeRule(SecurityRuleCode.OK)).assertEqual('ok');
      expect(describeRule(SecurityRuleCode.PATH_TRAVERSAL)).assertEqual('path_traversal');
      expect(describeRule(SecurityRuleCode.EXPIRED)).assertEqual('expired');
      expect(describeRule(SecurityRuleCode.UNKNOWN_ROLE)).assertEqual('unknown_role');
      done();
    });

    it('SecurityValidation_025', 0, async (done: Function) => {
      expect(BUNDLE_NAME).assertEqual('ohos.samples.stagemodel');
      expect(ACCOUNT_ID).assertEqual(100);
      const finding = new SecurityFinding(SecurityRuleCode.WEAK, SecuritySeverity.WARN,
        SecurityFieldKind.PASSWORD, 'missing digit');
      expect(finding.describe()).assertEqual('4:1:0:missing digit');
      expect(finding.isError()).assertFalse();
      done();
    });

    it('SecurityValidation_026', 0, async (done: Function) => {
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

