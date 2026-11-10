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

const TRUSTED_HARDWARE: string = 'uis7885';

const TRUSTED_MODELS: string[] = ['LHT16', 'oriole'];

const MIN_API_LEVEL: number = 12;

const SECURE_BOOT_ENABLED: boolean = true;

const UDID_MIN_LENGTH: number = 8;

const DEVICE_TV: string = 'tv';

interface DeviceIdentity {
  udid: string;
  model: string;
  hardware: string;
  apiLevel: number;
  secureBoot: boolean;
  deviceType: string;
}

// Validates device identity fields
class DeviceIdentityValidator {
  public static isUdidValid(udid: string): boolean {
    return udid.length >= UDID_MIN_LENGTH && udid.indexOf(' ') < 0;
  }

  public static isHardwareTrusted(hardware: string): boolean {
    return hardware === TRUSTED_HARDWARE;
  }

  public static isModelTrusted(model: string): boolean {
    return TRUSTED_MODELS.includes(model);
  }

  public static isApiLevelSupported(apiLevel: number): boolean {
    return apiLevel >= MIN_API_LEVEL;
  }

  public static isSecureBootEnabled(secureBoot: boolean): boolean {
    return secureBoot === SECURE_BOOT_ENABLED;
  }

  public static isTv(deviceType: string): boolean {
    return deviceType === DEVICE_TV;
  }

  public static validate(identity: DeviceIdentity): string[] {
    const issues: string[] = [];
    if (!DeviceIdentityValidator.isUdidValid(identity.udid)) {
      issues.push('udid');
    }
    if (!DeviceIdentityValidator.isHardwareTrusted(identity.hardware)) {
      issues.push('hardware');
    }
    if (!DeviceIdentityValidator.isModelTrusted(identity.model)) {
      issues.push('model');
    }
    if (!DeviceIdentityValidator.isApiLevelSupported(identity.apiLevel)) {
      issues.push('apiLevel');
    }
    if (!DeviceIdentityValidator.isSecureBootEnabled(identity.secureBoot)) {
      issues.push('secureBoot');
    }
    if (!DeviceIdentityValidator.isTv(identity.deviceType)) {
      issues.push('deviceType');
    }
    return issues;
  }
}

// Gates app features on device trust
class DeviceSecurityGate {
  private identity: DeviceIdentity;

  constructor(identity: DeviceIdentity) {
    this.identity = {
      udid: identity.udid,
      model: identity.model,
      hardware: identity.hardware,
      apiLevel: identity.apiLevel,
      secureBoot: identity.secureBoot,
      deviceType: identity.deviceType
    };
  }

  public isTrusted(): boolean {
    return DeviceIdentityValidator.validate(this.identity).length === 0;
  }

  public issues(): string[] {
    return DeviceIdentityValidator.validate(this.identity);
  }

  public canSubmitIssue(): boolean {
    return this.isTrusted();
  }

  public canUploadLogs(): boolean {
    return this.isTrusted() && this.identity.secureBoot;
  }

  public requiresDeveloperMode(): boolean {
    return !DeviceIdentityValidator.isHardwareTrusted(this.identity.hardware);
  }

  public maskUdid(): string {
    const udid = this.identity.udid;
    if (udid.length <= 6) {
      return '***';
    }
    return udid.substring(0, 3) + '***' + udid.substring(udid.length - 3);
  }

  public getIdentity(): DeviceIdentity {
    return {
      udid: this.identity.udid,
      model: this.identity.model,
      hardware: this.identity.hardware,
      apiLevel: this.identity.apiLevel,
      secureBoot: this.identity.secureBoot,
      deviceType: this.identity.deviceType
    };
  }
}

// Builds known device identities for tests
class DeviceIdentityFactory {
  public static trusted(): DeviceIdentity {
    return {
      udid: 'UDID-2026-ABCDEFGH',
      model: 'LHT16',
      hardware: TRUSTED_HARDWARE,
      apiLevel: 14,
      secureBoot: true,
      deviceType: DEVICE_TV
    };
  }

  public static trustedOriole(): DeviceIdentity {
    return {
      udid: 'UDID-2026-ORIOLE01',
      model: 'oriole',
      hardware: TRUSTED_HARDWARE,
      apiLevel: MIN_API_LEVEL,
      secureBoot: true,
      deviceType: DEVICE_TV
    };
  }

  public static untrusted(): DeviceIdentity {
    return {
      udid: 'short',
      model: 'phone-x',
      hardware: 'generic',
      apiLevel: 9,
      secureBoot: false,
      deviceType: 'phone'
    };
  }
}

// Summarizes security checks
class DeviceSecurityReport {
  private checks: string[] = [];
  private failureItems: string[] = [];

  public check(name: string, passed: boolean): void {
    this.checks.push(name);
    if (!passed) {
      this.failureItems.push(name);
    }
  }

  public count(): number {
    return this.checks.length;
  }

  public failures(): string[] {
    return [...this.failureItems];
  }

  public isPassed(): boolean {
    return this.checks.length > 0 && this.failureItems.length === 0;
  }

  public reset(): void {
    this.checks = [];
    this.failureItems = [];
  }
}

export default function deviceSecurityTest() {
  describe('DeviceSecurity_Test', () => {

    it('validator_should_check_udid', 0, () => {
      expect(DeviceIdentityValidator.isUdidValid('UDID-2026-ABCDEFGH')).assertTrue();
      expect(DeviceIdentityValidator.isUdidValid('12345678')).assertTrue();
      expect(DeviceIdentityValidator.isUdidValid('short')).assertFalse();
      expect(DeviceIdentityValidator.isUdidValid('has space')).assertFalse();
    });

    it('validator_should_check_trusted_hardware', 0, () => {
      expect(DeviceIdentityValidator.isHardwareTrusted(TRUSTED_HARDWARE)).assertTrue();
      expect(DeviceIdentityValidator.isHardwareTrusted('generic')).assertFalse();
      expect(DeviceIdentityValidator.isModelTrusted('LHT16')).assertTrue();
      expect(DeviceIdentityValidator.isModelTrusted('oriole')).assertTrue();
      expect(DeviceIdentityValidator.isModelTrusted('phone-x')).assertFalse();
    });

    it('validator_should_check_platform_flags', 0, () => {
      expect(DeviceIdentityValidator.isApiLevelSupported(MIN_API_LEVEL)).assertTrue();
      expect(DeviceIdentityValidator.isApiLevelSupported(MIN_API_LEVEL - 1)).assertFalse();
      expect(DeviceIdentityValidator.isSecureBootEnabled(true)).assertTrue();
      expect(DeviceIdentityValidator.isSecureBootEnabled(false)).assertFalse();
      expect(DeviceIdentityValidator.isTv(DEVICE_TV)).assertTrue();
      expect(DeviceIdentityValidator.isTv('phone')).assertFalse();
    });

    it('validator_should_report_all_issues', 0, () => {
      const issues = DeviceIdentityValidator.validate(DeviceIdentityFactory.untrusted());
      expect(issues.length).assertEqual(6);
      expect(issues.includes('udid')).assertTrue();
      expect(issues.includes('hardware')).assertTrue();
      expect(issues.includes('model')).assertTrue();
      expect(issues.includes('apiLevel')).assertTrue();
      expect(issues.includes('secureBoot')).assertTrue();
      expect(issues.includes('deviceType')).assertTrue();
    });

    it('validator_should_accept_trusted_devices', 0, () => {
      expect(DeviceIdentityValidator.validate(DeviceIdentityFactory.trusted()).length).assertEqual(0);
      expect(DeviceIdentityValidator.validate(DeviceIdentityFactory.trustedOriole()).length)
        .assertEqual(0);
    });

    it('gate_should_allow_trusted_device', 0, () => {
      const gate = new DeviceSecurityGate(DeviceIdentityFactory.trusted());
      expect(gate.isTrusted()).assertTrue();
      expect(gate.issues().length).assertEqual(0);
      expect(gate.canSubmitIssue()).assertTrue();
      expect(gate.canUploadLogs()).assertTrue();
      expect(gate.requiresDeveloperMode()).assertFalse();
    });

    it('gate_should_block_untrusted_device', 0, () => {
      const gate = new DeviceSecurityGate(DeviceIdentityFactory.untrusted());
      expect(gate.isTrusted()).assertFalse();
      expect(gate.canSubmitIssue()).assertFalse();
      expect(gate.canUploadLogs()).assertFalse();
      expect(gate.requiresDeveloperMode()).assertTrue();
      expect(gate.issues().length).assertEqual(6);
    });

    it('gate_should_mask_udid', 0, () => {
      const gate = new DeviceSecurityGate(DeviceIdentityFactory.trusted());
      const masked = gate.maskUdid();
      expect(masked).assertContain('***');
      expect(masked.startsWith('UDI')).assertTrue();
      expect(masked.endsWith('FGH')).assertTrue();
      expect(masked.includes('2026')).assertFalse();
      const identity = gate.getIdentity();
      expect(identity.udid).assertEqual('UDID-2026-ABCDEFGH');
    });

    it('gate_should_copy_identity', 0, () => {
      const source = DeviceIdentityFactory.trusted();
      const gate = new DeviceSecurityGate(source);
      source.model = 'mutated';
      expect(gate.getIdentity().model).assertEqual('LHT16');
      const copy = gate.getIdentity();
      copy.apiLevel = 1;
      expect(gate.getIdentity().apiLevel).assertEqual(14);
    });

    it('gate_should_require_secure_boot_for_logs', 0, () => {
      const identity = DeviceIdentityFactory.trusted();
      identity.secureBoot = false;
      const gate = new DeviceSecurityGate(identity);
      expect(gate.canSubmitIssue()).assertFalse();
      expect(gate.canUploadLogs()).assertFalse();
      expect(gate.issues()).assertDeepEquals(['secureBoot']);
    });

    it('report_should_aggregate_security_checks', 0, () => {
      const report = new DeviceSecurityReport();
      const gate = new DeviceSecurityGate(DeviceIdentityFactory.trusted());
      report.check('trusted', gate.isTrusted());
      report.check('submit', gate.canSubmitIssue());
      report.check('logs', gate.canUploadLogs());
      expect(report.count()).assertEqual(3);
      expect(report.isPassed()).assertTrue();
      report.check('force', false);
      expect(report.isPassed()).assertFalse();
      expect(report.failures()).assertDeepEquals(['force']);
      report.reset();
      expect(report.count()).assertEqual(0);
    });

    it('security_constants_should_be_stable', 0, () => {
      expect(TRUSTED_HARDWARE).assertEqual('uis7885');
      expect(TRUSTED_MODELS.length).assertEqual(2);
      expect(MIN_API_LEVEL).assertEqual(12);
      expect(SECURE_BOOT_ENABLED).assertTrue();
      expect(UDID_MIN_LENGTH).assertEqual(8);
      expect(DEVICE_TV).assertEqual('tv');
    });
  });
}

