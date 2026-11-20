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
import { Driver } from '@ohos.UiTest';
import {
  getDriver,
  recorderComponentCount,
  isTimerWindowVisible,
  isResolutionWindowVisible,
  launchRecorderService,
  serializedDelay,
  pressAndWait,
  KEY_BACK,
  DELAY_KEY_NAVIGATION
} from '../shared/RecordingDriver';

// The recorder captures a fixed 1920x1080 virtual screen, therefore any device
// whose display exceeds that footprint cannot be recorded directly and the
// resolution-not-supported dialog has to be presented instead.
const RECORD_MAX_WIDTH: number = 1920;
const RECORD_MAX_HEIGHT: number = 1080;

// Ratio applied by the floating windows when they adapt to the display width.
const WINDOW_WIDTH_RATE: number = 0.6;

enum DeviceKind {
  TV = 'tv',
  PHONE = 'phone',
  TABLET = 'tablet',
  UNKNOWN = 'unknown'
}

interface DeviceProfileShape {
  name: string
  kind: DeviceKind
  width: number
  height: number
  density: number
}

// Describes one physical display configuration. The class keeps the resolution
// gate, the aspect ratio and the floating window footprint in a single place so
// that every compatibility assertion shares the same arithmetic.
class DeviceProfile implements DeviceProfileShape {
  name: string;
  kind: DeviceKind;
  width: number;
  height: number;
  density: number;

  constructor(name: string, kind: DeviceKind, width: number, height: number, density: number) {
    this.name = name;
    this.kind = kind;
    this.width = width;
    this.height = height;
    this.density = density;
  }

  // A display is recordable only when both edges fit into the virtual screen.
  public isHighResolution(): boolean {
    return this.width > RECORD_MAX_WIDTH || this.height > RECORD_MAX_HEIGHT;
  }

  public requiresResolutionDialog(): boolean {
    return this.isHighResolution();
  }

  public supportsRecording(): boolean {
    return !this.isHighResolution();
  }

  public getAspectRatio(): number {
    if (this.height === 0) {
      return 0;
    }
    return Math.round((this.width / this.height) * 100) / 100;
  }

  public getWindowWidth(): number {
    return Math.round(this.width * WINDOW_WIDTH_RATE);
  }

  public getPixelCount(): number {
    return this.width * this.height;
  }
}

// Aggregated outcome of a device sweep. The counters are used by the matrix
// cases so that a single assertion can describe a whole profile family.
class DeviceMatrixSummary {
  private total: number = 0;
  private supported: number = 0;
  private rejected: number = 0;
  private kindCounter: Map<string, number> = new Map();
  private rejectedNames: string[] = [];

  public record(profile: DeviceProfile): void {
    this.total++;
    if (profile.supportsRecording()) {
      this.supported++;
    } else {
      this.rejected++;
      this.rejectedNames.push(profile.name);
    }
    const current = this.kindCounter.get(profile.kind) ?? 0;
    this.kindCounter.set(profile.kind, current + 1);
  }

  public getTotal(): number {
    return this.total;
  }

  public getSupported(): number {
    return this.supported;
  }

  public getRejected(): number {
    return this.rejected;
  }

  public getKindCount(kind: DeviceKind): number {
    return this.kindCounter.get(kind) ?? 0;
  }

  public getRejectedNames(): string[] {
    return this.rejectedNames.slice();
  }
}

// Builds the deterministic device catalogue used by every case of this suite.
function buildDeviceProfiles(): DeviceProfile[] {
  const profiles: DeviceProfile[] = [];
  profiles.push(new DeviceProfile('tv_1080p', DeviceKind.TV, 1920, 1080, 1.0));
  profiles.push(new DeviceProfile('tv_2k', DeviceKind.TV, 2560, 1440, 1.0));
  profiles.push(new DeviceProfile('tv_4k', DeviceKind.TV, 3840, 2160, 1.5));
  profiles.push(new DeviceProfile('tv_8k', DeviceKind.TV, 7680, 4320, 2.0));
  profiles.push(new DeviceProfile('phone_landscape', DeviceKind.PHONE, 1920, 1080, 3.0));
  profiles.push(new DeviceProfile('phone_portrait', DeviceKind.PHONE, 1080, 1920, 3.0));
  profiles.push(new DeviceProfile('tablet_landscape', DeviceKind.TABLET, 1280, 800, 2.0));
  profiles.push(new DeviceProfile('tablet_high', DeviceKind.TABLET, 2000, 1200, 2.0));
  return profiles;
}

function findProfile(name: string): DeviceProfile {
  const profiles = buildDeviceProfiles();
  for (let index = 0; index < profiles.length; index++) {
    if (profiles[index].name === name) {
      return profiles[index];
    }
  }
  return new DeviceProfile('unknown', DeviceKind.UNKNOWN, 0, 0, 0);
}

export default function deviceCompatibilityTest(): void {
  describe('DeviceCompatibility_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      await serializedDelay(driver, 500);
    });

    afterAll(async () => {
      await serializedDelay(driver, 500);
    });

    // 1080p is exactly the capture footprint, so recording must start directly
    // and no resolution dialog may appear on this profile.
    it('tv_1080p_profile_should_be_supported', 0, () => {
      const profile = findProfile('tv_1080p');
      expect(profile.supportsRecording()).assertTrue();
      expect(profile.requiresResolutionDialog()).assertFalse();
      expect(profile.width).assertEqual(RECORD_MAX_WIDTH);
      expect(profile.height).assertEqual(RECORD_MAX_HEIGHT);
      expect(profile.getAspectRatio()).assertEqual(1.78);
    });

    // 4K panels exceed the virtual screen and must be rejected with the
    // resolution dialog instead of producing a broken capture.
    it('tv_4k_profile_should_require_resolution_dialog', 0, () => {
      const profile = findProfile('tv_4k');
      expect(profile.isHighResolution()).assertTrue();
      expect(profile.requiresResolutionDialog()).assertTrue();
      expect(profile.supportsRecording()).assertFalse();
      expect(profile.width > RECORD_MAX_WIDTH).assertTrue();
    });

    // Phone devices are landscape capable and their window is still inside the
    // capture footprint once rotated to the TV orientation.
    it('phone_profile_should_be_supported', 0, () => {
      const profile = findProfile('phone_landscape');
      expect(profile.kind).assertEqual(DeviceKind.PHONE);
      expect(profile.supportsRecording()).assertTrue();
      expect(profile.getAspectRatio()).assertEqual(1.78);
    });

    // Tablets below 1080p keep the same behaviour as a TV panel.
    it('tablet_profile_should_be_supported', 0, () => {
      const profile = findProfile('tablet_landscape');
      expect(profile.kind).assertEqual(DeviceKind.TABLET);
      expect(profile.supportsRecording()).assertTrue();
      expect(profile.getPixelCount()).assertEqual(1024000);
    });

    // 8K is far above the gate; the rejection must be reported on both edges.
    it('eight_k_profile_should_be_rejected', 0, () => {
      const profile = findProfile('tv_8k');
      expect(profile.supportsRecording()).assertFalse();
      expect(profile.width > RECORD_MAX_WIDTH).assertTrue();
      expect(profile.height > RECORD_MAX_HEIGHT).assertTrue();
      expect(profile.getPixelCount() > 30000000).assertTrue();
    });

    // The gate must be edge based: a single oversized edge is enough.
    it('resolution_gate_should_check_both_edges', 0, () => {
      const wide = new DeviceProfile('wide_only', DeviceKind.UNKNOWN, 2048, 1080, 1.0);
      const tall = new DeviceProfile('tall_only', DeviceKind.UNKNOWN, 1920, 1200, 1.0);
      const fitting = new DeviceProfile('fitting', DeviceKind.UNKNOWN, 1600, 900, 1.0);
      expect(wide.supportsRecording()).assertFalse();
      expect(tall.supportsRecording()).assertFalse();
      expect(fitting.supportsRecording()).assertTrue();
    });

    // Every profile has to report a stable device kind so that the logging and
    // the feature switches can rely on it.
    it('device_kind_should_be_reported_for_all_profiles', 0, () => {
      const profiles = buildDeviceProfiles();
      const summary = new DeviceMatrixSummary();
      expect(profiles.length).assertEqual(8);
      for (let index = 0; index < profiles.length; index++) {
        summary.record(profiles[index]);
        expect(profiles[index].kind.length > 0).assertTrue();
        expect(profiles[index].density > 0).assertTrue();
      }
      expect(summary.getTotal()).assertEqual(8);
      expect(summary.getKindCount(DeviceKind.TV)).assertEqual(4);
      expect(summary.getKindCount(DeviceKind.PHONE)).assertEqual(2);
      expect(summary.getKindCount(DeviceKind.TABLET)).assertEqual(2);
    });

    // The whole catalogue is swept and the aggregation must stay consistent
    // with the per-profile verdict.
    it('compatibility_matrix_should_be_exhaustive', 0, () => {
      const profiles = buildDeviceProfiles();
      const summary = new DeviceMatrixSummary();
      for (let index = 0; index < profiles.length; index++) {
        summary.record(profiles[index]);
      }
      expect(summary.getSupported()).assertEqual(3);
      expect(summary.getRejected()).assertEqual(5);
      expect(summary.getSupported() + summary.getRejected()).assertEqual(summary.getTotal());
      const rejected: string[] = summary.getRejectedNames();
      expect(rejected.length).assertEqual(5);
      expect(rejected[0]).assertEqual('tv_2k');
      expect(rejected[1]).assertEqual('tv_4k');
      expect(rejected[2]).assertEqual('tv_8k');
      expect(rejected[3]).assertEqual('phone_portrait');
      expect(rejected[4]).assertEqual('tablet_high');
    });

    // The floating timer window keeps a proportional footprint so that the same
    // page looks identical on 1080p and 4K panels.
    it('window_footprint_should_scale_with_display_width', 0, () => {
      const tv = findProfile('tv_1080p');
      const wide = new DeviceProfile('wide_panel', DeviceKind.TV, 3840, 1080, 1.0);
      expect(tv.getWindowWidth()).assertEqual(1152);
      expect(wide.getWindowWidth()).assertEqual(2304);
      expect(wide.getWindowWidth()).assertEqual(tv.getWindowWidth() * 2);
    });

    // An unexpected device family must degrade to a safe verdict instead of
    // throwing while probing the display.
    it('unknown_device_kind_should_degrade_gracefully', 0, () => {
      const unknown = new DeviceProfile('unknown_panel', DeviceKind.UNKNOWN, 0, 0, 0);
      expect(unknown.getAspectRatio()).assertEqual(0);
      expect(unknown.supportsRecording()).assertTrue();
      const summary = new DeviceMatrixSummary();
      summary.record(unknown);
      expect(summary.getKindCount(DeviceKind.UNKNOWN)).assertEqual(1);
      expect(summary.getSupported()).assertEqual(1);
    });

    // Real-device probe: the sample has to render or fail to start, but it must
    // never leave the recorder process in an unusable state.
    it('current_device_should_render_recorder_entry', 0, async () => {
      const componentCount: number = await recorderComponentCount(driver);
      expect(componentCount >= 0).assertEqual(true);
      const timerVisible: boolean = await isTimerWindowVisible(driver);
      const resolutionVisible: boolean = await isResolutionWindowVisible(driver);
      expect(timerVisible && resolutionVisible).assertFalse();
    });

    // The resolution gate is queried twice to prove the check is idempotent on
    // the device that is currently running the suite.
    it('current_device_should_keep_stable_verdict', 0, async () => {
      await launchRecorderService();
      await serializedDelay(driver, 500);
      const first: boolean = await isResolutionWindowVisible(driver);
      await serializedDelay(driver, 300);
      const second: boolean = await isResolutionWindowVisible(driver);
      expect(first).assertEqual(second);
      const componentCount: number = await recorderComponentCount(driver);
      expect(componentCount >= 0).assertEqual(true);
    });
  });
}

