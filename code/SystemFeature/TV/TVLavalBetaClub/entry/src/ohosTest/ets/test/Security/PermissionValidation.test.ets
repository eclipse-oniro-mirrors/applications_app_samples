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

const PERM_READ_MEDIA: string = 'ohos.permission.READ_MEDIA';

const PERM_READ_IMAGEVIDEO: string = 'ohos.permission.READ_IMAGEVIDEO';

const PERM_INTERNET: string = 'ohos.permission.INTERNET';

const PERM_CAMERA: string = 'ohos.permission.CAMERA';

const GRANTED: number = 0;

const DENIED: number = -1;

const PERMISSION_PREFIX: string = 'ohos.permission.';

interface PermissionRequest {
  name: string;
  reason: string;
  result: number;
}

// Validates permission names and request reasons
class PermissionValidator {
  public static isNameValid(name: string): boolean {
    return name.startsWith(PERMISSION_PREFIX) && name.length > PERMISSION_PREFIX.length;
  }

  public static isKnown(name: string): boolean {
    return name === PERM_READ_MEDIA || name === PERM_READ_IMAGEVIDEO ||
      name === PERM_INTERNET || name === PERM_CAMERA;
  }

  public static isReasonValid(reason: string): boolean {
    return reason.length >= 4 && reason.length <= 200;
  }

  public static isResultValid(result: number): boolean {
    return result === GRANTED || result === DENIED;
  }

  public static isRequestValid(request: PermissionRequest): boolean {
    return PermissionValidator.isNameValid(request.name) &&
      PermissionValidator.isReasonValid(request.reason) &&
      PermissionValidator.isResultValid(request.result);
  }
}

// Stores grant state for requested permissions
class PermissionRegistry {
  private results: Map<string, number> = new Map<string, number>();
  private denials: number = 0;

  public record(request: PermissionRequest): boolean {
    if (!PermissionValidator.isRequestValid(request)) {
      return false;
    }
    this.results.set(request.name, request.result);
    if (request.result === DENIED) {
      this.denials++;
    }
    return true;
  }

  public isGranted(name: string): boolean {
    return this.results.get(name) === GRANTED;
  }

  public isDenied(name: string): boolean {
    return this.results.get(name) === DENIED;
  }

  public resultOf(name: string): number {
    const result = this.results.get(name);
    return result === undefined ? DENIED : result;
  }

  public grantedCount(): number {
    let count: number = 0;
    this.results.forEach((result: number) => {
      if (result === GRANTED) {
        count++;
      }
    });
    return count;
  }

  public size(): number {
    return this.results.size;
  }

  public getDenials(): number {
    return this.denials;
  }

  public grantedNames(): string[] {
    const names: string[] = [];
    this.results.forEach((result: number, name: string) => {
      if (result === GRANTED) {
        names.push(name);
      }
    });
    return names;
  }

  public revoke(name: string): boolean {
    return this.results.delete(name);
  }

  public reset(): void {
    this.results = new Map<string, number>();
    this.denials = 0;
  }
}

// Maps features to the permissions they require
class PermissionPolicy {
  private requirements: Map<string, string[]> = new Map<string, string[]>();

  public define(feature: string, permissions: string[]): boolean {
    if (feature.length === 0 || permissions.length === 0) {
      return false;
    }
    for (let i = 0; i < permissions.length; i++) {
      if (!PermissionValidator.isNameValid(permissions[i])) {
        return false;
      }
    }
    this.requirements.set(feature, [...permissions]);
    return true;
  }

  public permissionsFor(feature: string): string[] {
    const value = this.requirements.get(feature);
    return value === undefined ? [] : [...value];
  }

  public isAllowed(feature: string, registry: PermissionRegistry): boolean {
    const required = this.permissionsFor(feature);
    if (required.length === 0) {
      return false;
    }
    for (let i = 0; i < required.length; i++) {
      if (!registry.isGranted(required[i])) {
        return false;
      }
    }
    return true;
  }

  public missing(feature: string, registry: PermissionRegistry): string[] {
    const result: string[] = [];
    const required = this.permissionsFor(feature);
    for (let i = 0; i < required.length; i++) {
      if (!registry.isGranted(required[i])) {
        result.push(required[i]);
      }
    }
    return result;
  }

  public features(): string[] {
    const result: string[] = [];
    this.requirements.forEach((permissions: string[], feature: string) => {
      result.push(feature);
    });
    return result;
  }
}

// Audits permission requests for diagnostics
class PermissionAudit {
  private requests: number = 0;
  private granted: number = 0;
  private denied: number = 0;

  public record(result: number): void {
    this.requests++;
    if (result === GRANTED) {
      this.granted++;
    } else {
      this.denied++;
    }
  }

  public getRequests(): number {
    return this.requests;
  }

  public getGranted(): number {
    return this.granted;
  }

  public getDenied(): number {
    return this.denied;
  }

  public grantRate(): number {
    return this.requests === 0 ? 0 : this.granted * 100 / this.requests;
  }

  public isFullyGranted(): boolean {
    return this.requests > 0 && this.denied === 0;
  }

  public reset(): void {
    this.requests = 0;
    this.granted = 0;
    this.denied = 0;
  }
}

export default function permissionValidationTest() {
  describe('PermissionValidation_Test', () => {

    it('validator_should_check_permission_names', 0, () => {
      expect(PermissionValidator.isNameValid(PERM_READ_MEDIA)).assertTrue();
      expect(PermissionValidator.isNameValid('ohos.permission.')).assertFalse();
      expect(PermissionValidator.isNameValid('com.example.permission.CAMERA')).assertFalse();
      expect(PermissionValidator.isKnown(PERM_READ_MEDIA)).assertTrue();
      expect(PermissionValidator.isKnown(PERM_READ_IMAGEVIDEO)).assertTrue();
      expect(PermissionValidator.isKnown(PERM_INTERNET)).assertTrue();
      expect(PermissionValidator.isKnown(PERM_CAMERA)).assertTrue();
      expect(PermissionValidator.isKnown('ohos.permission.UNKNOWN')).assertFalse();
    });

    it('validator_should_check_reason_and_result', 0, () => {
      expect(PermissionValidator.isReasonValid('read media')).assertTrue();
      expect(PermissionValidator.isReasonValid('abc')).assertFalse();
      expect(PermissionValidator.isReasonValid('a'.repeat(201))).assertFalse();
      expect(PermissionValidator.isResultValid(GRANTED)).assertTrue();
      expect(PermissionValidator.isResultValid(DENIED)).assertTrue();
      expect(PermissionValidator.isResultValid(1)).assertFalse();
    });

    it('validator_should_check_full_request', 0, () => {
      expect(PermissionValidator.isRequestValid({
        name: PERM_READ_MEDIA, reason: 'read media', result: GRANTED
      })).assertTrue();
      expect(PermissionValidator.isRequestValid({
        name: 'bad', reason: 'read media', result: GRANTED
      })).assertFalse();
      expect(PermissionValidator.isRequestValid({
        name: PERM_READ_MEDIA, reason: '', result: GRANTED
      })).assertFalse();
      expect(PermissionValidator.isRequestValid({
        name: PERM_READ_MEDIA, reason: 'read media', result: 2
      })).assertFalse();
    });

    it('registry_should_record_results', 0, () => {
      const registry = new PermissionRegistry();
      expect(registry.record({
        name: PERM_READ_MEDIA, reason: 'read media', result: GRANTED
      })).assertTrue();
      expect(registry.record({
        name: PERM_INTERNET, reason: 'network access', result: DENIED
      })).assertTrue();
      expect(registry.isGranted(PERM_READ_MEDIA)).assertTrue();
      expect(registry.isDenied(PERM_INTERNET)).assertTrue();
      expect(registry.resultOf(PERM_READ_MEDIA)).assertEqual(GRANTED);
      expect(registry.size()).assertEqual(2);
      expect(registry.grantedCount()).assertEqual(1);
      expect(registry.getDenials()).assertEqual(1);
    });

    it('registry_should_reject_invalid_requests', 0, () => {
      const registry = new PermissionRegistry();
      expect(registry.record({
        name: 'bad', reason: 'read media', result: GRANTED
      })).assertFalse();
      expect(registry.size()).assertEqual(0);
      expect(registry.isGranted('bad')).assertFalse();
      expect(registry.isDenied('bad')).assertFalse();
      expect(registry.resultOf('bad')).assertEqual(DENIED);
    });

    it('registry_should_list_and_revoke', 0, () => {
      const registry = new PermissionRegistry();
      registry.record({ name: PERM_READ_MEDIA, reason: 'read media', result: GRANTED });
      registry.record({ name: PERM_INTERNET, reason: 'network access', result: GRANTED });
      expect(registry.grantedNames().length).assertEqual(2);
      expect(registry.revoke(PERM_READ_MEDIA)).assertTrue();
      expect(registry.revoke(PERM_READ_MEDIA)).assertFalse();
      expect(registry.isGranted(PERM_READ_MEDIA)).assertFalse();
      expect(registry.grantedCount()).assertEqual(1);
      registry.reset();
      expect(registry.size()).assertEqual(0);
      expect(registry.getDenials()).assertEqual(0);
    });

    it('policy_should_define_feature_requirements', 0, () => {
      const policy = new PermissionPolicy();
      expect(policy.define('attachMedia', [PERM_READ_MEDIA])).assertTrue();
      expect(policy.define('attachVideo', [PERM_READ_MEDIA, PERM_READ_IMAGEVIDEO])).assertTrue();
      expect(policy.define('', [PERM_READ_MEDIA])).assertFalse();
      expect(policy.define('empty', [])).assertFalse();
      expect(policy.define('bad', ['bad.permission'])).assertFalse();
      expect(policy.features().length).assertEqual(2);
      expect(policy.permissionsFor('attachVideo').length).assertEqual(2);
    });

    it('policy_should_check_grants', 0, () => {
      const policy = new PermissionPolicy();
      const registry = new PermissionRegistry();
      policy.define('attachMedia', [PERM_READ_MEDIA]);
      policy.define('attachVideo', [PERM_READ_MEDIA, PERM_READ_IMAGEVIDEO]);
      registry.record({ name: PERM_READ_MEDIA, reason: 'read media', result: GRANTED });
      expect(policy.isAllowed('attachMedia', registry)).assertTrue();
      expect(policy.isAllowed('attachVideo', registry)).assertFalse();
      expect(policy.isAllowed('unknown', registry)).assertFalse();
      expect(policy.missing('attachVideo', registry).length).assertEqual(1);
    });

    it('policy_should_return_copied_permissions', 0, () => {
      const policy = new PermissionPolicy();
      policy.define('attachMedia', [PERM_READ_MEDIA]);
      const permissions = policy.permissionsFor('attachMedia');
      permissions.push(PERM_CAMERA);
      expect(policy.permissionsFor('attachMedia').length).assertEqual(1);
      expect(policy.permissionsFor('unknown').length).assertEqual(0);
    });

    it('audit_should_track_grant_rate', 0, () => {
      const audit = new PermissionAudit();
      audit.record(GRANTED);
      audit.record(GRANTED);
      audit.record(DENIED);
      expect(audit.getRequests()).assertEqual(3);
      expect(audit.getGranted()).assertEqual(2);
      expect(audit.getDenied()).assertEqual(1);
      expect(audit.grantRate()).assertLarger(66);
      expect(audit.isFullyGranted()).assertFalse();
      audit.reset();
      expect(audit.getRequests()).assertEqual(0);
      expect(audit.grantRate()).assertEqual(0);
    });

    it('audit_should_detect_full_grant', 0, () => {
      const audit = new PermissionAudit();
      audit.record(GRANTED);
      audit.record(GRANTED);
      expect(audit.grantRate()).assertEqual(100);
      expect(audit.isFullyGranted()).assertTrue();
      audit.record(DENIED);
      expect(audit.isFullyGranted()).assertFalse();
    });

    it('permission_flow_should_gate_media_upload', 0, () => {
      const policy = new PermissionPolicy();
      const registry = new PermissionRegistry();
      const audit = new PermissionAudit();
      policy.define('attach', [PERM_READ_MEDIA, PERM_READ_IMAGEVIDEO]);
      const requests: PermissionRequest[] = [
        { name: PERM_READ_MEDIA, reason: 'read media', result: GRANTED },
        { name: PERM_READ_IMAGEVIDEO, reason: 'read video', result: GRANTED }
      ];
      for (let i = 0; i < requests.length; i++) {
        if (registry.record(requests[i])) {
          audit.record(requests[i].result);
        }
      }
      expect(policy.isAllowed('attach', registry)).assertTrue();
      expect(policy.missing('attach', registry).length).assertEqual(0);
      expect(audit.isFullyGranted()).assertTrue();
      expect(registry.grantedCount()).assertEqual(2);
    });

    it('permission_constants_should_be_stable', 0, () => {
      expect(PERM_READ_MEDIA).assertEqual('ohos.permission.READ_MEDIA');
      expect(PERM_READ_IMAGEVIDEO).assertEqual('ohos.permission.READ_IMAGEVIDEO');
      expect(PERM_INTERNET).assertEqual('ohos.permission.INTERNET');
      expect(GRANTED).assertEqual(0);
      expect(DENIED).assertEqual(-1);
      expect(PERMISSION_PREFIX).assertEqual('ohos.permission.');
    });
  });
}

