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

const HEADER_CONTENT_TYPE: string = 'content-Type';

const HEADER_AUTHORIZATION: string = 'Authorization';

const HEADER_USER_AGENT: string = 'User-Agent';

const MAX_HEADER_NAME: number = 64;

const MAX_HEADER_VALUE: number = 512;

const FORBIDDEN_HEADERS: string[] = ['X-Debug', 'X-Internal-Token'];

// Validates HTTP headers before requests are sent
class HeaderValidator {
  public static isNameValid(name: string): boolean {
    const pattern: RegExp = new RegExp('^[A-Za-z0-9-]+$');
    return name.length > 0 && name.length <= MAX_HEADER_NAME && pattern.test(name);
  }

  public static isValueValid(value: string): boolean {
    return value.length <= MAX_HEADER_VALUE && value.indexOf('\n') < 0 && value.indexOf('\r') < 0;
  }

  public static isForbidden(name: string): boolean {
    for (let i = 0; i < FORBIDDEN_HEADERS.length; i++) {
      if (FORBIDDEN_HEADERS[i].toLowerCase() === name.toLowerCase()) {
        return true;
      }
    }
    return false;
  }

  public static isValid(name: string, value: string): boolean {
    return HeaderValidator.isNameValid(name) && HeaderValidator.isValueValid(value) &&
      !HeaderValidator.isForbidden(name);
  }

  public static isSensitive(name: string): boolean {
    return name.toLowerCase() === HEADER_AUTHORIZATION.toLowerCase();
  }
}

// Builds request headers with sensitive value masking
class HeaderBuilder {
  private headers: Map<string, string> = new Map<string, string>();
  private rejected: number = 0;

  public set(name: string, value: string): boolean {
    if (!HeaderValidator.isValid(name, value)) {
      this.rejected++;
      return false;
    }
    this.headers.set(name.toLowerCase(), value);
    return true;
  }

  public get(name: string): string {
    const value = this.headers.get(name.toLowerCase());
    return value === undefined ? '' : value;
  }

  public has(name: string): boolean {
    return this.headers.has(name.toLowerCase());
  }

  public remove(name: string): boolean {
    return this.headers.delete(name.toLowerCase());
  }

  public size(): number {
    return this.headers.size;
  }

  public getRejected(): number {
    return this.rejected;
  }

  public names(): string[] {
    const result: string[] = [];
    this.headers.forEach((value: string, name: string) => {
      result.push(name);
    });
    return result;
  }

  public maskedValue(name: string): string {
    const value = this.get(name);
    if (value.length <= 8) {
      return '***';
    }
    return value.substring(0, 4) + '***' + value.substring(value.length - 4);
  }

  public clear(): void {
    this.headers = new Map<string, string>();
    this.rejected = 0;
  }
}

// Audits header usage per endpoint
class HeaderAudit {
  private requests: number = 0;
  private authorized: number = 0;
  private rejected: number = 0;

  public recordRequest(withAuth: boolean): void {
    this.requests++;
    if (withAuth) {
      this.authorized++;
    }
  }

  public recordRejection(): void {
    this.rejected++;
  }

  public getRequests(): number {
    return this.requests;
  }

  public getAuthorized(): number {
    return this.authorized;
  }

  public getRejected(): number {
    return this.rejected;
  }

  public authRate(): number {
    return this.requests === 0 ? 0 : this.authorized * 100 / this.requests;
  }

  public reset(): void {
    this.requests = 0;
    this.authorized = 0;
    this.rejected = 0;
  }
}

export default function securityHeaderValidationTest() {
  describe('SecurityHeaderValidation_Test', () => {

    it('validator_should_check_names', 0, () => {
      expect(HeaderValidator.isNameValid(HEADER_CONTENT_TYPE)).assertTrue();
      expect(HeaderValidator.isNameValid(HEADER_USER_AGENT)).assertTrue();
      expect(HeaderValidator.isNameValid('X-Custom-Header')).assertTrue();
      expect(HeaderValidator.isNameValid('bad header')).assertFalse();
      expect(HeaderValidator.isNameValid('bad_header')).assertFalse();
      expect(HeaderValidator.isNameValid('')).assertFalse();
      expect(HeaderValidator.isNameValid('a'.repeat(MAX_HEADER_NAME + 1))).assertFalse();
    });

    it('validator_should_check_values', 0, () => {
      expect(HeaderValidator.isValueValid('application/json')).assertTrue();
      expect(HeaderValidator.isValueValid('a'.repeat(MAX_HEADER_VALUE))).assertTrue();
      expect(HeaderValidator.isValueValid('a'.repeat(MAX_HEADER_VALUE + 1))).assertFalse();
      expect(HeaderValidator.isValueValid('line\nbreak')).assertFalse();
      expect(HeaderValidator.isValueValid('carriage\rreturn')).assertFalse();
    });

    it('validator_should_block_forbidden_headers', 0, () => {
      expect(HeaderValidator.isForbidden('X-Debug')).assertTrue();
      expect(HeaderValidator.isForbidden('x-debug')).assertTrue();
      expect(HeaderValidator.isForbidden('X-Internal-Token')).assertTrue();
      expect(HeaderValidator.isForbidden(HEADER_CONTENT_TYPE)).assertFalse();
      expect(HeaderValidator.isValid('X-Debug', '1')).assertFalse();
    });

    it('validator_should_mark_sensitive_headers', 0, () => {
      expect(HeaderValidator.isSensitive(HEADER_AUTHORIZATION)).assertTrue();
      expect(HeaderValidator.isSensitive('authorization')).assertTrue();
      expect(HeaderValidator.isSensitive(HEADER_CONTENT_TYPE)).assertFalse();
      expect(HeaderValidator.isValid(HEADER_AUTHORIZATION, 'Bearer token123')).assertTrue();
    });

    it('builder_should_set_headers', 0, () => {
      const builder = new HeaderBuilder();
      expect(builder.set(HEADER_CONTENT_TYPE, 'application/json')).assertTrue();
      expect(builder.get(HEADER_CONTENT_TYPE)).assertEqual('application/json');
      expect(builder.get('content-type')).assertEqual('application/json');
      expect(builder.has(HEADER_CONTENT_TYPE)).assertTrue();
      expect(builder.size()).assertEqual(1);
      expect(builder.getRejected()).assertEqual(0);
    });

    it('builder_should_override_case_insensitively', 0, () => {
      const builder = new HeaderBuilder();
      builder.set(HEADER_CONTENT_TYPE, 'text/plain');
      builder.set('content-type', 'application/json');
      expect(builder.size()).assertEqual(1);
      expect(builder.get(HEADER_CONTENT_TYPE)).assertEqual('application/json');
      expect(builder.names()).assertDeepEquals(['content-type']);
    });

    it('builder_should_reject_invalid_headers', 0, () => {
      const builder = new HeaderBuilder();
      expect(builder.set('bad header', 'value')).assertFalse();
      expect(builder.set('X-Debug', '1')).assertFalse();
      expect(builder.set(HEADER_CONTENT_TYPE, 'a'.repeat(MAX_HEADER_VALUE + 1))).assertFalse();
      expect(builder.size()).assertEqual(0);
      expect(builder.getRejected()).assertEqual(3);
    });

    it('builder_should_remove_and_clear', 0, () => {
      const builder = new HeaderBuilder();
      builder.set(HEADER_CONTENT_TYPE, 'application/json');
      builder.set(HEADER_USER_AGENT, 'BetaClub/1.0');
      expect(builder.remove(HEADER_CONTENT_TYPE)).assertTrue();
      expect(builder.remove(HEADER_CONTENT_TYPE)).assertFalse();
      expect(builder.size()).assertEqual(1);
      builder.clear();
      expect(builder.size()).assertEqual(0);
      expect(builder.getRejected()).assertEqual(0);
    });

    it('builder_should_mask_sensitive_values', 0, () => {
      const builder = new HeaderBuilder();
      builder.set(HEADER_AUTHORIZATION, 'Bearer secret-token');
      const masked = builder.maskedValue(HEADER_AUTHORIZATION);
      expect(masked).assertContain('***');
      expect(masked.startsWith('Bear')).assertTrue();
      expect(masked.endsWith('oken')).assertTrue();
      expect(builder.maskedValue('missing')).assertEqual('***');
      builder.set('X-Short', 'abc');
      expect(builder.maskedValue('X-Short')).assertEqual('***');
    });

    it('audit_should_track_header_usage', 0, () => {
      const audit = new HeaderAudit();
      audit.recordRequest(true);
      audit.recordRequest(true);
      audit.recordRequest(false);
      audit.recordRejection();
      expect(audit.getRequests()).assertEqual(3);
      expect(audit.getAuthorized()).assertEqual(2);
      expect(audit.getRejected()).assertEqual(1);
      expect(audit.authRate()).assertLarger(66);
      audit.reset();
      expect(audit.getRequests()).assertEqual(0);
      expect(audit.authRate()).assertEqual(0);
    });

    it('header_flow_should_build_secure_request', 0, () => {
      const builder = new HeaderBuilder();
      const audit = new HeaderAudit();
      builder.set(HEADER_CONTENT_TYPE, 'application/json');
      builder.set(HEADER_AUTHORIZATION, 'Bearer token12345');
      builder.set(HEADER_USER_AGENT, 'BetaClub/1.0');
      expect(builder.size()).assertEqual(3);
      audit.recordRequest(builder.has(HEADER_AUTHORIZATION));
      expect(audit.authRate()).assertEqual(100);
      expect(HeaderValidator.isSensitive(HEADER_AUTHORIZATION)).assertTrue();
      expect(builder.maskedValue(HEADER_AUTHORIZATION).includes('token')).assertFalse();
      expect(HeaderValidator.isValid('X-Debug', '1')).assertFalse();
    });

    it('header_constants_should_be_stable', 0, () => {
      expect(HEADER_CONTENT_TYPE).assertEqual('content-Type');
      expect(HEADER_AUTHORIZATION).assertEqual('Authorization');
      expect(HEADER_USER_AGENT).assertEqual('User-Agent');
      expect(MAX_HEADER_NAME).assertEqual(64);
      expect(MAX_HEADER_VALUE).assertEqual(512);
      expect(FORBIDDEN_HEADERS.length).assertEqual(2);
    });
  });
}

