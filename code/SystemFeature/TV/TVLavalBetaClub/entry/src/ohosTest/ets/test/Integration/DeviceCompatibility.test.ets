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

const EXPECTED_BOOT_HARDWARE: string = 'uis7885';

const SUPPORTED_MODELS: string[] = ['LHT16', 'oriole'];

const MIN_API_LEVEL: number = 12;

const MIN_SCREEN_WIDTH: number = 1280;

const MIN_SCREEN_HEIGHT: number = 720;

const DEVICE_TYPE_TV: string = 'tv';

interface DeviceProfile {
  model: string;
  hardware: string;
  apiLevel: number;
  screenWidth: number;
  screenHeight: number;
  deviceType: string;
}

interface CompatibilityResult {
  compatible: boolean;
  reasons: string[];
}

// Builds device profiles for common TV configurations
class DeviceProfileFactory {
  public static supported(): DeviceProfile {
    return {
      model: 'LHT16',
      hardware: EXPECTED_BOOT_HARDWARE,
      apiLevel: 14,
      screenWidth: 1920,
      screenHeight: 1080,
      deviceType: DEVICE_TYPE_TV
    };
  }

  public static supportedOriole(): DeviceProfile {
    return {
      model: 'oriole',
      hardware: EXPECTED_BOOT_HARDWARE,
      apiLevel: MIN_API_LEVEL,
      screenWidth: 3840,
      screenHeight: 2160,
      deviceType: DEVICE_TYPE_TV
    };
  }

  public static unsupported(): DeviceProfile {
    return {
      model: 'phone-x',
      hardware: 'generic',
      apiLevel: 9,
      screenWidth: 720,
      screenHeight: 1280,
      deviceType: 'phone'
    };
  }

  public static copy(source: DeviceProfile): DeviceProfile {
    return {
      model: source.model,
      hardware: source.hardware,
      apiLevel: source.apiLevel,
      screenWidth: source.screenWidth,
      screenHeight: source.screenHeight,
      deviceType: source.deviceType
    };
  }
}

// Evaluates device profiles against supported hardware and models
class CompatibilityMatrix {
  public static check(profile: DeviceProfile): CompatibilityResult {
    const reasons: string[] = [];
    if (profile.hardware !== EXPECTED_BOOT_HARDWARE) {
      reasons.push('hardware');
    }
    if (!SUPPORTED_MODELS.includes(profile.model)) {
      reasons.push('model');
    }
    if (profile.apiLevel < MIN_API_LEVEL) {
      reasons.push('apiLevel');
    }
    if (profile.screenWidth < MIN_SCREEN_WIDTH || profile.screenHeight < MIN_SCREEN_HEIGHT) {
      reasons.push('screen');
    }
    if (profile.deviceType !== DEVICE_TYPE_TV) {
      reasons.push('deviceType');
    }
    return { compatible: reasons.length === 0, reasons: reasons };
  }

  public static isCompatible(profile: DeviceProfile): boolean {
    return CompatibilityMatrix.check(profile).compatible;
  }

  public static isHardwareSupported(hardware: string): boolean {
    return hardware === EXPECTED_BOOT_HARDWARE;
  }

  public static isModelSupported(model: string): boolean {
    return SUPPORTED_MODELS.includes(model);
  }

  public static isScreenSupported(width: number, height: number): boolean {
    return width >= MIN_SCREEN_WIDTH && height >= MIN_SCREEN_HEIGHT;
  }

  public static isLandscape(profile: DeviceProfile): boolean {
    return profile.screenWidth > profile.screenHeight;
  }
}

// Gates optional features by API level
class FeatureGate {
  private requirements: Map<string, number> = new Map<string, number>();

  public define(feature: string, minApiLevel: number): boolean {
    if (feature.length === 0 || minApiLevel <= 0) {
      return false;
    }
    this.requirements.set(feature, minApiLevel);
    return true;
  }

  public minApiLevelOf(feature: string): number {
    const value = this.requirements.get(feature);
    return value === undefined ? -1 : value;
  }

  public isAvailable(feature: string, apiLevel: number): boolean {
    const required = this.minApiLevelOf(feature);
    return required >= 0 && apiLevel >= required;
  }

  public availableFeatures(apiLevel: number): string[] {
    const result: string[] = [];
    this.requirements.forEach((required: number, feature: string) => {
      if (apiLevel >= required) {
        result.push(feature);
      }
    });
    return result;
  }

  public size(): number {
    return this.requirements.size;
  }
}

// Probes input capabilities expected on TV devices
class CapabilityProbe {
  public static readonly REMOTE: string = 'remote';
  public static readonly MOUSE: string = 'mouse';
  public static readonly TOUCH: string = 'touch';
  public static readonly KEYBOARD: string = 'keyboard';

  public static supportedCapabilities(profile: DeviceProfile): string[] {
    if (profile.deviceType === DEVICE_TYPE_TV) {
      return [CapabilityProbe.REMOTE, CapabilityProbe.MOUSE, CapabilityProbe.KEYBOARD];
    }
    return [CapabilityProbe.TOUCH];
  }

  public static supports(capability: string, profile: DeviceProfile): boolean {
    return CapabilityProbe.supportedCapabilities(profile).includes(capability);
  }

  public static requiresRemoteFirst(profile: DeviceProfile): boolean {
    return profile.deviceType === DEVICE_TYPE_TV;
  }

  public static isTouchOnly(profile: DeviceProfile): boolean {
    const capabilities = CapabilityProbe.supportedCapabilities(profile);
    return capabilities.length === 1 && capabilities[0] === CapabilityProbe.TOUCH;
  }
}

// Aggregates compatibility checks into a report
class CompatibilityReport {
  private checks: string[] = [];
  private failureItems: string[] = [];

  public check(name: string, passed: boolean): void {
    this.checks.push(name);
    if (!passed) {
      this.failureItems.push(name);
    }
  }

  public getCheckCount(): number {
    return this.checks.length;
  }

  public getFailures(): string[] {
    return [...this.failureItems];
  }

  public isCompatible(): boolean {
    return this.checks.length > 0 && this.failureItems.length === 0;
  }

  public summary(): string {
    return this.isCompatible() ? 'compatible' : 'incompatible';
  }

  public reset(): void {
    this.checks = [];
    this.failureItems = [];
  }
}

export default function deviceCompatibilityTest() {
  describe('DeviceCompatibility_Test', () => {

    it('profile_factory_should_build_supported_devices', 0, () => {
      const lht = DeviceProfileFactory.supported();
      const oriole = DeviceProfileFactory.supportedOriole();
      expect(lht.model).assertEqual('LHT16');
      expect(lht.hardware).assertEqual(EXPECTED_BOOT_HARDWARE);
      expect(oriole.model).assertEqual('oriole');
      expect(oriole.apiLevel).assertEqual(MIN_API_LEVEL);
      expect(lht.deviceType).assertEqual(DEVICE_TYPE_TV);
      expect(CompatibilityMatrix.isCompatible(lht)).assertTrue();
      expect(CompatibilityMatrix.isCompatible(oriole)).assertTrue();
    });

    it('matrix_should_reject_unsupported_device', 0, () => {
      const profile = DeviceProfileFactory.unsupported();
      const result = CompatibilityMatrix.check(profile);
      expect(result.compatible).assertFalse();
      expect(result.reasons.includes('hardware')).assertTrue();
      expect(result.reasons.includes('model')).assertTrue();
      expect(result.reasons.includes('apiLevel')).assertTrue();
      expect(result.reasons.includes('deviceType')).assertTrue();
      expect(result.reasons.length).assertEqual(5);
    });

    it('matrix_should_validate_each_rule', 0, () => {
      expect(CompatibilityMatrix.isHardwareSupported(EXPECTED_BOOT_HARDWARE)).assertTrue();
      expect(CompatibilityMatrix.isHardwareSupported('generic')).assertFalse();
      expect(CompatibilityMatrix.isModelSupported('LHT16')).assertTrue();
      expect(CompatibilityMatrix.isModelSupported('oriole')).assertTrue();
      expect(CompatibilityMatrix.isModelSupported('phone-x')).assertFalse();
      expect(CompatibilityMatrix.isScreenSupported(1280, 720)).assertTrue();
      expect(CompatibilityMatrix.isScreenSupported(1279, 720)).assertFalse();
      expect(CompatibilityMatrix.isScreenSupported(1920, 719)).assertFalse();
    });

    it('matrix_should_reject_invalid_api_level', 0, () => {
      const profile = DeviceProfileFactory.supported();
      profile.apiLevel = MIN_API_LEVEL - 1;
      const result = CompatibilityMatrix.check(profile);
      expect(result.compatible).assertFalse();
      expect(result.reasons).assertDeepEquals(['apiLevel']);
      profile.apiLevel = MIN_API_LEVEL;
      expect(CompatibilityMatrix.isCompatible(profile)).assertTrue();
    });

    it('matrix_should_detect_landscape_only', 0, () => {
      const landscape = DeviceProfileFactory.supported();
      const portrait = DeviceProfileFactory.copy(landscape);
      portrait.screenWidth = 1080;
      portrait.screenHeight = 1920;
      expect(CompatibilityMatrix.isLandscape(landscape)).assertTrue();
      expect(CompatibilityMatrix.isLandscape(portrait)).assertFalse();
      expect(CompatibilityMatrix.isCompatible(portrait)).assertFalse();
    });

    it('profile_copy_should_be_independent', 0, () => {
      const source = DeviceProfileFactory.supported();
      const copy = DeviceProfileFactory.copy(source);
      copy.model = 'modified';
      copy.apiLevel = 1;
      expect(source.model).assertEqual('LHT16');
      expect(source.apiLevel).assertEqual(14);
      expect(copy.model).assertEqual('modified');
    });

    it('feature_gate_should_filter_by_api_level', 0, () => {
      const gate = new FeatureGate();
      expect(gate.define('basic', 12)).assertTrue();
      expect(gate.define('advanced', 14)).assertTrue();
      expect(gate.define('', 12)).assertFalse();
      expect(gate.define('invalid', 0)).assertFalse();
      expect(gate.size()).assertEqual(2);
      expect(gate.isAvailable('basic', 12)).assertTrue();
      expect(gate.isAvailable('advanced', 12)).assertFalse();
      expect(gate.isAvailable('advanced', 14)).assertTrue();
      expect(gate.isAvailable('missing', 99)).assertFalse();
    });

    it('feature_gate_should_list_available_features', 0, () => {
      const gate = new FeatureGate();
      gate.define('basic', 12);
      gate.define('advanced', 14);
      gate.define('future', 18);
      expect(gate.availableFeatures(12).length).assertEqual(1);
      expect(gate.availableFeatures(14).length).assertEqual(2);
      expect(gate.availableFeatures(18).length).assertEqual(3);
      expect(gate.minApiLevelOf('advanced')).assertEqual(14);
      expect(gate.minApiLevelOf('missing')).assertEqual(-1);
    });

    it('capability_probe_should_describe_tv_inputs', 0, () => {
      const tv = DeviceProfileFactory.supported();
      const phone = DeviceProfileFactory.unsupported();
      expect(CapabilityProbe.supports(CapabilityProbe.REMOTE, tv)).assertTrue();
      expect(CapabilityProbe.supports(CapabilityProbe.MOUSE, tv)).assertTrue();
      expect(CapabilityProbe.supports(CapabilityProbe.TOUCH, tv)).assertFalse();
      expect(CapabilityProbe.requiresRemoteFirst(tv)).assertTrue();
      expect(CapabilityProbe.isTouchOnly(tv)).assertFalse();
      expect(CapabilityProbe.isTouchOnly(phone)).assertTrue();
      expect(CapabilityProbe.supportedCapabilities(phone).length).assertEqual(1);
    });

    it('report_should_aggregate_checks', 0, () => {
      const report = new CompatibilityReport();
      const tv = DeviceProfileFactory.supported();
      report.check('hardware', CompatibilityMatrix.isHardwareSupported(tv.hardware));
      report.check('model', CompatibilityMatrix.isModelSupported(tv.model));
      report.check('screen', CompatibilityMatrix.isScreenSupported(tv.screenWidth, tv.screenHeight));
      expect(report.getCheckCount()).assertEqual(3);
      expect(report.isCompatible()).assertTrue();
      expect(report.summary()).assertEqual('compatible');
      report.check('apiLevel', false);
      expect(report.isCompatible()).assertFalse();
      expect(report.getFailures()).assertDeepEquals(['apiLevel']);
      expect(report.summary()).assertEqual('incompatible');
    });

    it('report_should_reset', 0, () => {
      const report = new CompatibilityReport();
      report.check('hardware', true);
      report.check('model', false);
      report.reset();
      expect(report.getCheckCount()).assertEqual(0);
      expect(report.getFailures().length).assertEqual(0);
      expect(report.isCompatible()).assertFalse();
      report.check('hardware', true);
      expect(report.isCompatible()).assertTrue();
    });

    it('compatibility_flow_should_gate_features', 0, () => {
      const tv = DeviceProfileFactory.supported();
      const gate = new FeatureGate();
      gate.define('videoAttachment', 12);
      gate.define('logExport', 14);
      const compatible = CompatibilityMatrix.isCompatible(tv);
      expect(compatible).assertTrue();
      expect(gate.isAvailable('videoAttachment', tv.apiLevel)).assertTrue();
      expect(gate.isAvailable('logExport', tv.apiLevel)).assertTrue();
      tv.apiLevel = 12;
      expect(gate.isAvailable('logExport', tv.apiLevel)).assertFalse();
      expect(gate.availableFeatures(tv.apiLevel).length).assertEqual(1);
    });

    it('compatibility_constants_should_be_stable', 0, () => {
      expect(EXPECTED_BOOT_HARDWARE).assertEqual('uis7885');
      expect(SUPPORTED_MODELS.length).assertEqual(2);
      expect(MIN_API_LEVEL).assertEqual(12);
      expect(MIN_SCREEN_WIDTH).assertEqual(1280);
      expect(MIN_SCREEN_HEIGHT).assertEqual(720);
      expect(DEVICE_TYPE_TV).assertEqual('tv');
    });
  });
}

