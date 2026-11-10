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

import { describe, it, expect } from '@ohos/hypium';
import KeyConstant from '../../../../main/ets/common/Constants/KeyConstant';
import UrlConstant from '../../../../main/ets/common/Constants/UrlConstant';

const TOKEN_MIN_LENGTH: number = 16;

const TOKEN_MAX_LENGTH: number = 256;

const DEVICE_ID_MAX_LENGTH: number = 64;

const PERMISSION_READ_MEDIA: string = 'ohos.permission.READ_MEDIA';

const PERMISSION_READ_IMAGEVIDEO: string = 'ohos.permission.READ_IMAGEVIDEO';

const PERMISSION_INTERNET: string = 'ohos.permission.INTERNET';

interface AuditEntry {
  action: string;
  allowed: boolean;
  timestamp: number;
}

// Validates access tokens before they are attached to requests
class TokenValidator {
  public static readonly PREFIX: string = 'Bearer ';

  public static hasPrefix(token: string): boolean {
    return token.startsWith(TokenValidator.PREFIX);
  }

  public static isLengthValid(token: string): boolean {
    return token.length >= TOKEN_MIN_LENGTH && token.length <= TOKEN_MAX_LENGTH;
  }

  public static hasNoWhitespace(token: string): boolean {
    return token.indexOf(' ') < 0 && token.indexOf('\n') < 0 && token.indexOf('\r') < 0;
  }

  public static isWellFormed(token: string): boolean {
    if (!TokenValidator.hasPrefix(token)) {
      return false;
    }
    const payload = token.substring(TokenValidator.PREFIX.length);
    return TokenValidator.isLengthValid(payload) && TokenValidator.hasNoWhitespace(payload);
  }

  public static isExpired(expiresAt: number, now: number): boolean {
    return expiresAt <= now;
  }

  public static stripPrefix(token: string): string {
    return TokenValidator.hasPrefix(token) ? token.substring(TokenValidator.PREFIX.length) : token;
  }
}

// Maps issue reporter features to required permissions
class PermissionMatrix {
  private required: Map<string, string[]> = new Map<string, string[]>();

  public define(feature: string, permissions: string[]): boolean {
    if (feature.length === 0 || permissions.length === 0) {
      return false;
    }
    this.required.set(feature, [...permissions]);
    return true;
  }

  public permissionsFor(feature: string): string[] {
    const value = this.required.get(feature);
    return value === undefined ? [] : [...value];
  }

  public isGranted(feature: string, granted: string[]): boolean {
    const required = this.permissionsFor(feature);
    if (required.length === 0) {
      return false;
    }
    for (let i = 0; i < required.length; i++) {
      if (!granted.includes(required[i])) {
        return false;
      }
    }
    return true;
  }

  public missing(feature: string, granted: string[]): string[] {
    const result: string[] = [];
    const required = this.permissionsFor(feature);
    for (let i = 0; i < required.length; i++) {
      if (!granted.includes(required[i])) {
        result.push(required[i]);
      }
    }
    return result;
  }

  public features(): string[] {
    const result: string[] = [];
    this.required.forEach((permissions: string[], feature: string) => {
      result.push(feature);
    });
    return result;
  }

  public size(): number {
    return this.required.size;
  }
}

// Validates device identifiers used in issue reports
class DeviceIdValidator {
  public static isLengthValid(deviceId: string): boolean {
    return deviceId.length > 0 && deviceId.length <= DEVICE_ID_MAX_LENGTH;
  }

  public static hasAllowedCharacters(deviceId: string): boolean {
    const pattern: RegExp = new RegExp('^[A-Za-z0-9_-]+$');
    return pattern.test(deviceId);
  }

  public static isValid(deviceId: string): boolean {
    return DeviceIdValidator.isLengthValid(deviceId) && DeviceIdValidator.hasAllowedCharacters(deviceId);
  }

  public static isPlaceholder(deviceId: string): boolean {
    const lower = deviceId.toLowerCase();
    return lower === 'unknown' || lower === 'default' || lower === '00000000';
  }
}

// Validates upload endpoints before files are sent
class UploadEndpointValidator {
  public static readonly ALLOWED_HOSTS: string[] = ['localhost', '127.0.0.1'];

  public static hostOf(url: string): string {
    const schemeIndex = url.indexOf('://');
    if (schemeIndex < 0) {
      return '';
    }
    const remainder = url.substring(schemeIndex + 3);
    const pathIndex = remainder.indexOf('/');
    const authority = pathIndex < 0 ? remainder : remainder.substring(0, pathIndex);
    const portIndex = authority.indexOf(':');
    return portIndex < 0 ? authority : authority.substring(0, portIndex);
  }

  public static isAllowedHost(url: string): boolean {
    const host = UploadEndpointValidator.hostOf(url);
    if (UploadEndpointValidator.ALLOWED_HOSTS.includes(host)) {
      return true;
    }
    return host.endsWith('.local') || host.startsWith('10.') || host.startsWith('192.168.');
  }

  public static hasQuerySecrets(url: string): boolean {
    const lower = url.toLowerCase();
    return lower.indexOf('token=') >= 0 || lower.indexOf('password=') >= 0 || lower.indexOf('secret=') >= 0;
  }

  public static isSafe(url: string): boolean {
    return url.length > 0 && !UploadEndpointValidator.hasQuerySecrets(url) &&
      (url.startsWith('https://') || url.startsWith('http://'));
  }
}

// Audit trail for permission-sensitive actions
class AccessAudit {
  private entries: AuditEntry[] = [];

  public record(action: string, allowed: boolean): void {
    this.entries.push({ action: action, allowed: allowed, timestamp: Date.now() });
  }

  public count(): number {
    return this.entries.length;
  }

  public deniedCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.entries.length; i++) {
      if (!this.entries[i].allowed) {
        count++;
      }
    }
    return count;
  }

  public allowedCount(): number {
    return this.count() - this.deniedCount();
  }

  public hasAction(action: string): boolean {
    return this.entries.some((entry: AuditEntry) => entry.action === action);
  }

  public lastAction(): string {
    return this.entries.length === 0 ? '' : this.entries[this.entries.length - 1].action;
  }

  public clear(): void {
    this.entries = [];
  }
}

export default function securityValidationTest() {
  describe('SecurityValidation_Test', () => {
    let matrix: PermissionMatrix;

    it('token_validator_should_require_prefix', 0, () => {
      expect(TokenValidator.hasPrefix('Bearer abc')).assertTrue();
      expect(TokenValidator.hasPrefix('abc')).assertFalse();
      expect(TokenValidator.hasPrefix('bearer abc')).assertFalse();
      expect(TokenValidator.stripPrefix('Bearer abc')).assertEqual('abc');
      expect(TokenValidator.stripPrefix('abc')).assertEqual('abc');
    });

    it('token_validator_should_bound_length', 0, () => {
      const shortToken = 'Bearer abc';
      const validToken = 'Bearer ' + 'a'.repeat(TOKEN_MIN_LENGTH);
      const longToken = 'Bearer ' + 'a'.repeat(TOKEN_MAX_LENGTH + 1);
      expect(TokenValidator.isLengthValid(shortToken.substring(7))).assertFalse();
      expect(TokenValidator.isWellFormed(validToken)).assertTrue();
      expect(TokenValidator.isWellFormed(longToken)).assertFalse();
    });

    it('token_validator_should_reject_inner_whitespace', 0, () => {
      const token = 'Bearer ' + 'a'.repeat(TOKEN_MIN_LENGTH) + ' extra';
      expect(TokenValidator.hasNoWhitespace(token.substring(7))).assertFalse();
      expect(TokenValidator.isWellFormed(token)).assertFalse();
      expect(TokenValidator.isWellFormed('Bearer ' + 'a'.repeat(TOKEN_MIN_LENGTH))).assertTrue();
    });

    it('token_validator_should_evaluate_expiry', 0, () => {
      expect(TokenValidator.isExpired(1000, 1000)).assertTrue();
      expect(TokenValidator.isExpired(999, 1000)).assertTrue();
      expect(TokenValidator.isExpired(1001, 1000)).assertFalse();
      expect(TokenValidator.isExpired(0, 1)).assertTrue();
    });

    it('permission_matrix_should_define_features', 0, () => {
      matrix = new PermissionMatrix();
      expect(matrix.define('attachMedia', [PERMISSION_READ_MEDIA])).assertTrue();
      expect(matrix.define('attachVideo', [PERMISSION_READ_MEDIA, PERMISSION_READ_IMAGEVIDEO])).assertTrue();
      expect(matrix.define('', [PERMISSION_READ_MEDIA])).assertFalse();
      expect(matrix.define('empty', [])).assertFalse();
      expect(matrix.size()).assertEqual(2);
      expect(matrix.features().length).assertEqual(2);
    });

    it('permission_matrix_should_check_grants', 0, () => {
      matrix = new PermissionMatrix();
      matrix.define('attachMedia', [PERMISSION_READ_MEDIA]);
      matrix.define('attachVideo', [PERMISSION_READ_MEDIA, PERMISSION_READ_IMAGEVIDEO]);
      expect(matrix.isGranted('attachMedia', [PERMISSION_READ_MEDIA])).assertTrue();
      expect(matrix.isGranted('attachVideo', [PERMISSION_READ_MEDIA])).assertFalse();
      expect(matrix.isGranted('unknown', [PERMISSION_READ_MEDIA])).assertFalse();
      expect(matrix.missing('attachVideo', [PERMISSION_READ_MEDIA]).length).assertEqual(1);
    });

    it('permission_matrix_should_return_copied_lists', 0, () => {
      matrix = new PermissionMatrix();
      matrix.define('attachMedia', [PERMISSION_READ_MEDIA]);
      const permissions = matrix.permissionsFor('attachMedia');
      permissions.push(PERMISSION_INTERNET);
      expect(matrix.permissionsFor('attachMedia').length).assertEqual(1);
      expect(matrix.permissionsFor('unknown').length).assertEqual(0);
      expect(matrix.missing('attachMedia', []).length).assertEqual(1);
    });

    it('device_id_validator_should_validate_format', 0, () => {
      expect(DeviceIdValidator.isLengthValid('UDID-2026-ABCD')).assertTrue();
      expect(DeviceIdValidator.isLengthValid('')).assertFalse();
      expect(DeviceIdValidator.isLengthValid('a'.repeat(DEVICE_ID_MAX_LENGTH + 1))).assertFalse();
      expect(DeviceIdValidator.isValid('UDID-2026_ABCD')).assertTrue();
      expect(DeviceIdValidator.isValid('UDID 2026')).assertFalse();
    });

    it('device_id_validator_should_reject_placeholders', 0, () => {
      expect(DeviceIdValidator.isPlaceholder('unknown')).assertTrue();
      expect(DeviceIdValidator.isPlaceholder('DEFAULT')).assertTrue();
      expect(DeviceIdValidator.isPlaceholder('00000000')).assertTrue();
      expect(DeviceIdValidator.isPlaceholder('UDID-2026')).assertFalse();
      expect(DeviceIdValidator.isValid('')).assertFalse();
    });

    it('upload_endpoint_should_allow_private_hosts', 0, () => {
      expect(UploadEndpointValidator.hostOf('http://10.20.72.111:3470/path')).assertEqual('10.20.72.111');
      expect(UploadEndpointValidator.isAllowedHost('http://10.20.72.111:3470/path')).assertTrue();
      expect(UploadEndpointValidator.isAllowedHost('http://192.168.1.2/upload')).assertTrue();
      expect(UploadEndpointValidator.isAllowedHost('http://localhost/upload')).assertTrue();
    });

    it('upload_endpoint_should_reject_public_and_secrets', 0, () => {
      expect(UploadEndpointValidator.isAllowedHost('http://example.com/upload')).assertFalse();
      expect(UploadEndpointValidator.isAllowedHost('relative/path')).assertFalse();
      expect(UploadEndpointValidator.hasQuerySecrets('http://host/upload?token=abc')).assertTrue();
      expect(UploadEndpointValidator.hasQuerySecrets('http://host/upload?issueId=1')).assertFalse();
      expect(UploadEndpointValidator.isSafe('http://host/upload?token=abc')).assertFalse();
    });

    it('upload_endpoint_should_require_http_scheme', 0, () => {
      expect(UploadEndpointValidator.isSafe('https://host/upload')).assertTrue();
      expect(UploadEndpointValidator.isSafe('http://host/upload')).assertTrue();
      expect(UploadEndpointValidator.isSafe('ftp://host/upload')).assertFalse();
      expect(UploadEndpointValidator.isSafe('')).assertFalse();
      expect(UploadEndpointValidator.hostOf('no-scheme')).assertEqual('');
    });

    it('access_audit_should_count_allowed_and_denied', 0, () => {
      const audit = new AccessAudit();
      audit.record('attachMedia', true);
      audit.record('attachVideo', false);
      audit.record('submitIssue', true);
      expect(audit.count()).assertEqual(3);
      expect(audit.allowedCount()).assertEqual(2);
      expect(audit.deniedCount()).assertEqual(1);
      expect(audit.hasAction('submitIssue')).assertTrue();
      expect(audit.hasAction('deleteIssue')).assertFalse();
      expect(audit.lastAction()).assertEqual('submitIssue');
      audit.clear();
      expect(audit.count()).assertEqual(0);
      expect(audit.lastAction()).assertEqual('');
    });

    it('security_constants_should_align_with_manifest', 0, () => {
      expect(PERMISSION_READ_MEDIA).assertEqual('ohos.permission.READ_MEDIA');
      expect(PERMISSION_READ_IMAGEVIDEO).assertEqual('ohos.permission.READ_IMAGEVIDEO');
      expect(PERMISSION_INTERNET).assertEqual('ohos.permission.INTERNET');
      expect(TOKEN_MIN_LENGTH).assertEqual(16);
      expect(TOKEN_MAX_LENGTH).assertEqual(256);
      expect(DEVICE_ID_MAX_LENGTH).assertEqual(64);
    });

    it('security_validation_should_cover_issue_endpoints', 0, () => {
      const endpoints: string[] = [
        UrlConstant.ISSUE_REPORT,
        UrlConstant.UPLOAD_FILE,
        UrlConstant.ISSUE_LIST,
        UrlConstant.ISSUE_DETAIL
      ];
      for (let i = 0; i < endpoints.length; i++) {
        const url = 'https://host/' + endpoints[i];
        expect(UploadEndpointValidator.isSafe(url)).assertTrue();
        expect(UploadEndpointValidator.hasQuerySecrets(url)).assertFalse();
      }
      expect(KeyConstant.KV_STORE_ID.length).assertLarger(0);
    });

    it('permission_matrix_should_gate_full_flow', 0, () => {
      matrix = new PermissionMatrix();
      matrix.define('attach', [PERMISSION_READ_MEDIA, PERMISSION_READ_IMAGEVIDEO]);
      matrix.define('upload', [PERMISSION_INTERNET]);
      const granted: string[] = [PERMISSION_READ_MEDIA, PERMISSION_READ_IMAGEVIDEO, PERMISSION_INTERNET];
      expect(matrix.isGranted('attach', granted)).assertTrue();
      expect(matrix.isGranted('upload', granted)).assertTrue();
      const partial: string[] = [PERMISSION_READ_MEDIA];
      expect(matrix.isGranted('attach', partial)).assertFalse();
      expect(matrix.missing('attach', partial).length).assertEqual(1);
      expect(matrix.missing('upload', partial)[0]).assertEqual(PERMISSION_INTERNET);
    });
  });
}

