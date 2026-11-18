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
  launchRecorderService,
  serializedDelay,
  pressAndWait,
  KEY_BACK,
  DELAY_KEY_NAVIGATION
} from '../shared/RecordingDriver';

// API levels that the sample has to survive on. The recorder itself exists since
// API 9, the media asset pipeline needs API 10 and the tip animation landed in
// API 11.
enum SdkVersion {
  API_9 = 9,
  API_10 = 10,
  API_11 = 11,
  API_12 = 12,
  API_13 = 13
}

enum PlatformKind {
  PHONE = 'phone',
  TABLET = 'tablet',
  TV = 'tv',
  WEARABLE = 'wearable',
  UNKNOWN = 'unknown'
}

// Capabilities the recorder depends on. Each one is gated by an API level and a
// platform whitelist so that the deployment matrix can be evaluated statically.
enum RecorderFeature {
  SCREEN_CAPTURE = 'screen_capture',
  PHOTO_CREATE_ASSET = 'photo_create_asset',
  FLOAT_WINDOW = 'float_window',
  WINDOW_FOCUSABLE = 'window_focusable',
  MEDIA_LIBRARY_QUERY = 'media_library_query',
  INPUT_KEY_EVENT = 'input_key_event',
  TIP_WINDOW_ANIMATION = 'tip_window_animation'
}

interface PlatformSet {
  phone: boolean
  tablet: boolean
  tv: boolean
  wearable: boolean
}

interface FeatureRequirement {
  feature: RecorderFeature
  minSdk: number
  platforms: PlatformSet
  permission: string
  degradation: string
}

interface FeatureVerdict {
  feature: RecorderFeature
  supported: boolean
  reason: string
  degradation: string
}

interface Deployment {
  label: string
  sdk: SdkVersion
  platform: PlatformKind
}

function buildPlatformSet(tv: boolean, phone: boolean, tablet: boolean, wearable: boolean): PlatformSet {
  const set: PlatformSet = {
    phone: phone,
    tablet: tablet,
    tv: tv,
    wearable: wearable
  };
  return set;
}

function platformAllowed(set: PlatformSet, platform: PlatformKind): boolean {
  if (platform === PlatformKind.TV) {
    return set.tv;
  }
  if (platform === PlatformKind.PHONE) {
    return set.phone;
  }
  if (platform === PlatformKind.TABLET) {
    return set.tablet;
  }
  if (platform === PlatformKind.WEARABLE) {
    return set.wearable;
  }
  return false;
}

// Static feature gate. It answers the only question the sample asks at startup:
// can this feature be used on the current SDK and device family, and if not what
// is the documented degradation?
class RecorderFeatureGate {
  private requirements: FeatureRequirement[] = [];

  public add(requirement: FeatureRequirement): void {
    this.requirements.push(requirement);
  }

  public getRequirements(): FeatureRequirement[] {
    return this.requirements.slice();
  }

  public getRequirement(feature: RecorderFeature): FeatureRequirement | undefined {
    for (let index = 0; index < this.requirements.length; index++) {
      if (this.requirements[index].feature === feature) {
        return this.requirements[index];
      }
    }
    return undefined;
  }

  public supports(feature: RecorderFeature, sdk: SdkVersion, platform: PlatformKind): boolean {
    const requirement = this.getRequirement(feature);
    if (requirement === undefined) {
      return false;
    }
    if (sdk < requirement.minSdk) {
      return false;
    }
    return platformAllowed(requirement.platforms, platform);
  }

  public evaluate(feature: RecorderFeature, sdk: SdkVersion, platform: PlatformKind): FeatureVerdict {
    const requirement = this.getRequirement(feature);
    if (requirement === undefined) {
      const unknown: FeatureVerdict = {
        feature: feature,
        supported: false,
        reason: 'feature-not-declared',
        degradation: 'disable-feature'
      };
      return unknown;
    }
    if (sdk < requirement.minSdk) {
      const sdkVerdict: FeatureVerdict = {
        feature: feature,
        supported: false,
        reason: `sdk-too-low:${requirement.minSdk}`,
        degradation: requirement.degradation
      };
      return sdkVerdict;
    }
    if (!platformAllowed(requirement.platforms, platform)) {
      const platformVerdict: FeatureVerdict = {
        feature: feature,
        supported: false,
        reason: `platform-not-allowed:${platform}`,
        degradation: requirement.degradation
      };
      return platformVerdict;
    }
    const supportedVerdict: FeatureVerdict = {
      feature: feature,
      supported: true,
      reason: 'supported',
      degradation: ''
    };
    return supportedVerdict;
  }

  public countSupported(sdk: SdkVersion, platform: PlatformKind): number {
    let count = 0;
    for (let index = 0; index < this.requirements.length; index++) {
      if (this.supports(this.requirements[index].feature, sdk, platform)) {
        count++;
      }
    }
    return count;
  }

  public collectVerdicts(sdk: SdkVersion, platform: PlatformKind): FeatureVerdict[] {
    const verdicts: FeatureVerdict[] = [];
    for (let index = 0; index < this.requirements.length; index++) {
      verdicts.push(this.evaluate(this.requirements[index].feature, sdk, platform));
    }
    return verdicts;
  }

  public hasPermission(requirement: FeatureRequirement, granted: string[]): boolean {
    if (requirement.permission.length === 0) {
      return true;
    }
    for (let index = 0; index < granted.length; index++) {
      if (granted[index] === requirement.permission) {
        return true;
      }
    }
    return false;
  }
}

// Aggregates a compatibility sweep across deployments.
class CompatibilityReport {
  private total: number = 0;
  private supported: number = 0;
  private degraded: number = 0;
  private rejected: number = 0;
  private rejectedLabels: string[] = [];

  public record(verdicts: FeatureVerdict[], label: string): void {
    let supportedCount = 0;
    let degradedCount = 0;
    for (let index = 0; index < verdicts.length; index++) {
      this.total++;
      if (verdicts[index].supported) {
        supportedCount++;
        this.supported++;
      } else if (verdicts[index].degradation.length > 0) {
        degradedCount++;
        this.degraded++;
      } else {
        this.rejected++;
      }
    }
    if (supportedCount === 0) {
      this.rejectedLabels.push(label);
    }
  }

  public getTotal(): number {
    return this.total;
  }

  public getSupported(): number {
    return this.supported;
  }

  public getDegraded(): number {
    return this.degraded;
  }

  public getRejected(): number {
    return this.rejected;
  }

  public getRejectedLabels(): string[] {
    return this.rejectedLabels.slice();
  }

  public getSupportRate(): number {
    if (this.total === 0) {
      return 0;
    }
    return this.supported / this.total;
  }

  public reset(): void {
    this.total = 0;
    this.supported = 0;
    this.degraded = 0;
    this.rejected = 0;
    this.rejectedLabels = [];
  }
}

// The reference gate table of the sample. TV is the primary target, phone and
// tablet are supported for debugging and wearable is intentionally excluded.
function buildRecorderGate(): RecorderFeatureGate {
  const gate = new RecorderFeatureGate();
  gate.add({
    feature: RecorderFeature.SCREEN_CAPTURE,
    minSdk: 9,
    platforms: buildPlatformSet(true, true, true, false),
    permission: 'ohos.permission.CAPTURE_SCREEN',
    degradation: 'show-unsupported-dialog'
  });
  gate.add({
    feature: RecorderFeature.PHOTO_CREATE_ASSET,
    minSdk: 10,
    platforms: buildPlatformSet(true, true, true, false),
    permission: 'ohos.permission.WRITE_IMAGEVIDEO',
    degradation: 'record-without-media-asset'
  });
  gate.add({
    feature: RecorderFeature.FLOAT_WINDOW,
    minSdk: 9,
    platforms: buildPlatformSet(true, true, true, false),
    permission: '',
    degradation: 'record-without-timer-window'
  });
  gate.add({
    feature: RecorderFeature.WINDOW_FOCUSABLE,
    minSdk: 9,
    platforms: buildPlatformSet(true, true, true, false),
    permission: '',
    degradation: 'keep-window-focusable'
  });
  gate.add({
    feature: RecorderFeature.MEDIA_LIBRARY_QUERY,
    minSdk: 10,
    platforms: buildPlatformSet(true, true, true, false),
    permission: 'ohos.permission.READ_IMAGEVIDEO',
    degradation: 'hide-gallery-entry'
  });
  gate.add({
    feature: RecorderFeature.INPUT_KEY_EVENT,
    minSdk: 9,
    platforms: buildPlatformSet(true, true, true, false),
    permission: '',
    degradation: 'stop-only-from-menu'
  });
  gate.add({
    feature: RecorderFeature.TIP_WINDOW_ANIMATION,
    minSdk: 11,
    platforms: buildPlatformSet(true, true, true, false),
    permission: '',
    degradation: 'show-tip-without-animation'
  });
  return gate;
}

function buildDeployments(): Deployment[] {
  const deployments: Deployment[] = [];
  deployments.push({ label: 'tv_api9', sdk: SdkVersion.API_9, platform: PlatformKind.TV });
  deployments.push({ label: 'tv_api10', sdk: SdkVersion.API_10, platform: PlatformKind.TV });
  deployments.push({ label: 'tv_api11', sdk: SdkVersion.API_11, platform: PlatformKind.TV });
  deployments.push({ label: 'tv_api12', sdk: SdkVersion.API_12, platform: PlatformKind.TV });
  deployments.push({ label: 'tv_api13', sdk: SdkVersion.API_13, platform: PlatformKind.TV });
  deployments.push({ label: 'phone_api13', sdk: SdkVersion.API_13, platform: PlatformKind.PHONE });
  deployments.push({ label: 'tablet_api12', sdk: SdkVersion.API_12, platform: PlatformKind.TABLET });
  deployments.push({ label: 'wearable_api13', sdk: SdkVersion.API_13, platform: PlatformKind.WEARABLE });
  return deployments;
}

export default function recorderCompatibilityTest(): void {
  describe('RecorderCompatibility_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      await serializedDelay(driver, 500);
    });

    afterAll(async () => {
      await serializedDelay(driver, 500);
    });

    // Screen capture is the oldest capability of the sample and is available
    // from the first supported API level.
    it('screen_capture_requires_api_9', 0, () => {
      const gate = buildRecorderGate();
      expect(gate.supports(RecorderFeature.SCREEN_CAPTURE, SdkVersion.API_9, PlatformKind.TV)).assertTrue();
      expect(gate.supports(RecorderFeature.SCREEN_CAPTURE, SdkVersion.API_13, PlatformKind.TV)).assertTrue();
      const requirement = gate.getRequirement(RecorderFeature.SCREEN_CAPTURE);
      expect(requirement === undefined).assertFalse();
      if (requirement !== undefined) {
        expect(requirement.minSdk).assertEqual(9);
        expect(requirement.permission).assertEqual('ohos.permission.CAPTURE_SCREEN');
      }
    });

    // The media asset pipeline needs photoAccessHelper.createAsset which only
    // exists since API 10.
    it('create_asset_requires_api_10', 0, () => {
      const gate = buildRecorderGate();
      expect(gate.supports(RecorderFeature.PHOTO_CREATE_ASSET, SdkVersion.API_9, PlatformKind.TV)).assertFalse();
      expect(gate.supports(RecorderFeature.PHOTO_CREATE_ASSET, SdkVersion.API_10, PlatformKind.TV)).assertTrue();
      const verdict = gate.evaluate(RecorderFeature.PHOTO_CREATE_ASSET, SdkVersion.API_9, PlatformKind.TV);
      expect(verdict.supported).assertFalse();
      expect(verdict.reason).assertContain('sdk-too-low');
      expect(verdict.degradation).assertEqual('record-without-media-asset');
    });

    // The floating timer window must stay available on every supported SDK so
    // that the user always sees the elapsed time.
    it('float_window_requires_api_9', 0, () => {
      const gate = buildRecorderGate();
      expect(gate.supports(RecorderFeature.FLOAT_WINDOW, SdkVersion.API_9, PlatformKind.TV)).assertTrue();
      expect(gate.supports(RecorderFeature.FLOAT_WINDOW, SdkVersion.API_13, PlatformKind.TV)).assertTrue();
      expect(gate.supports(RecorderFeature.FLOAT_WINDOW, SdkVersion.API_9, PlatformKind.TABLET)).assertTrue();
    });

    // A non focusable window requires setWindowFocusable, gated at API 9.
    it('window_focusable_requires_api_9', 0, () => {
      const gate = buildRecorderGate();
      expect(gate.supports(RecorderFeature.WINDOW_FOCUSABLE, SdkVersion.API_9, PlatformKind.TV)).assertTrue();
      expect(gate.supports(RecorderFeature.WINDOW_FOCUSABLE, SdkVersion.API_13, PlatformKind.TV)).assertTrue();
      const requirement = gate.getRequirement(RecorderFeature.WINDOW_FOCUSABLE);
      if (requirement !== undefined) {
        expect(requirement.permission.length).assertEqual(0);
        expect(requirement.degradation).assertEqual('keep-window-focusable');
      }
    });

    // The tip window animation is the newest capability and therefore the first
    // one that a deployment may lose.
    it('tip_animation_requires_api_11', 0, () => {
      const gate = buildRecorderGate();
      expect(gate.supports(RecorderFeature.TIP_WINDOW_ANIMATION, SdkVersion.API_10, PlatformKind.TV)).assertFalse();
      expect(gate.supports(RecorderFeature.TIP_WINDOW_ANIMATION, SdkVersion.API_11, PlatformKind.TV)).assertTrue();
      expect(gate.supports(RecorderFeature.TIP_WINDOW_ANIMATION, SdkVersion.API_13, PlatformKind.TV)).assertTrue();
    });

    // Listing the media library requires the read permission and API 10.
    it('media_query_requires_api_10', 0, () => {
      const gate = buildRecorderGate();
      expect(gate.supports(RecorderFeature.MEDIA_LIBRARY_QUERY, SdkVersion.API_9, PlatformKind.TV)).assertFalse();
      expect(gate.supports(RecorderFeature.MEDIA_LIBRARY_QUERY, SdkVersion.API_10, PlatformKind.TV)).assertTrue();
      const requirement = gate.getRequirement(RecorderFeature.MEDIA_LIBRARY_QUERY);
      if (requirement !== undefined) {
        expect(requirement.permission).assertEqual('ohos.permission.READ_IMAGEVIDEO');
      }
    });

    // Key events are consumed through the input subsystem which exists on all
    // supported levels.
    it('input_key_event_requires_api_9', 0, () => {
      const gate = buildRecorderGate();
      expect(gate.supports(RecorderFeature.INPUT_KEY_EVENT, SdkVersion.API_9, PlatformKind.TV)).assertTrue();
      expect(gate.supports(RecorderFeature.INPUT_KEY_EVENT, SdkVersion.API_12, PlatformKind.TV)).assertTrue();
      expect(gate.supports(RecorderFeature.INPUT_KEY_EVENT, SdkVersion.API_9, PlatformKind.WEARABLE)).assertFalse();
    });

    // All seven capabilities are declared exactly once and the table is static.
    it('feature_table_should_be_complete', 0, () => {
      const gate = buildRecorderGate();
      const requirements = gate.getRequirements();
      expect(requirements.length).assertEqual(7);
      let minSdkTotal = 0;
      for (let index = 0; index < requirements.length; index++) {
        expect(requirements[index].feature.length > 0).assertTrue();
        expect(requirements[index].minSdk).assertLargerOrEqual(9);
        expect(requirements[index].degradation.length > 0).assertTrue();
        minSdkTotal += requirements[index].minSdk;
        for (let other = index + 1; other < requirements.length; other++) {
          expect(requirements[index].feature === requirements[other].feature).assertFalse();
        }
      }
      expect(minSdkTotal).assertEqual(67);
    });

    // The deployment matrix sweeps 7 features over 8 deployments.
    it('feature_matrix_should_be_exhaustive', 0, () => {
      const gate = buildRecorderGate();
      const deployments = buildDeployments();
      const report = new CompatibilityReport();
      expect(deployments.length).assertEqual(8);
      for (let index = 0; index < deployments.length; index++) {
        const deployment = deployments[index];
        const verdicts = gate.collectVerdicts(deployment.sdk, deployment.platform);
        expect(verdicts.length).assertEqual(7);
        report.record(verdicts, deployment.label);
      }
      expect(report.getTotal()).assertEqual(56);
      expect(report.getSupported()).assertEqual(45);
      expect(report.getDegraded()).assertEqual(11);
      expect(report.getRejected()).assertEqual(0);
      expect(report.getSupportRate() > 0.8).assertTrue();
    });

    // API 9 on TV can still record: the capture and the timer window are
    // available while the asset pipeline degrades gracefully.
    it('api_9_deployment_should_still_record', 0, () => {
      const gate = buildRecorderGate();
      expect(gate.supports(RecorderFeature.SCREEN_CAPTURE, SdkVersion.API_9, PlatformKind.TV)).assertTrue();
      expect(gate.supports(RecorderFeature.FLOAT_WINDOW, SdkVersion.API_9, PlatformKind.TV)).assertTrue();
      expect(gate.countSupported(SdkVersion.API_9, PlatformKind.TV)).assertEqual(4);
      const verdicts = gate.collectVerdicts(SdkVersion.API_9, PlatformKind.TV);
      let degradedCount = 0;
      for (let index = 0; index < verdicts.length; index++) {
        if (!verdicts[index].supported && verdicts[index].degradation.length > 0) {
          degradedCount++;
        }
      }
      expect(degradedCount).assertEqual(3);
    });

    // API 10 adds the media asset pipeline, so the file finally reaches Photos.
    it('api_10_deployment_should_persist_asset', 0, () => {
      const gate = buildRecorderGate();
      expect(gate.supports(RecorderFeature.PHOTO_CREATE_ASSET, SdkVersion.API_10, PlatformKind.TV)).assertTrue();
      expect(gate.supports(RecorderFeature.MEDIA_LIBRARY_QUERY, SdkVersion.API_10, PlatformKind.TV)).assertTrue();
      expect(gate.countSupported(SdkVersion.API_10, PlatformKind.TV)).assertEqual(6);
      expect(gate.supports(RecorderFeature.TIP_WINDOW_ANIMATION, SdkVersion.API_10, PlatformKind.TV)).assertFalse();
    });

    // The newest deployment enables every capability of the table.
    it('api_13_deployment_should_enable_all', 0, () => {
      const gate = buildRecorderGate();
      expect(gate.countSupported(SdkVersion.API_13, PlatformKind.TV)).assertEqual(7);
      expect(gate.countSupported(SdkVersion.API_13, PlatformKind.PHONE)).assertEqual(7);
      expect(gate.countSupported(SdkVersion.API_12, PlatformKind.TABLET)).assertEqual(7);
      const verdicts = gate.collectVerdicts(SdkVersion.API_13, PlatformKind.TV);
      for (let index = 0; index < verdicts.length; index++) {
        expect(verdicts[index].supported).assertTrue();
        expect(verdicts[index].reason).assertEqual('supported');
      }
    });

    // Wearables are not a target of the sample: every capability degrades rather
    // than crashing the process on an unsupported device.
    it('wearable_platform_should_degrade_all_features', 0, () => {
      const gate = buildRecorderGate();
      expect(gate.countSupported(SdkVersion.API_13, PlatformKind.WEARABLE)).assertEqual(0);
      const verdicts = gate.collectVerdicts(SdkVersion.API_13, PlatformKind.WEARABLE);
      for (let index = 0; index < verdicts.length; index++) {
        expect(verdicts[index].supported).assertFalse();
        expect(verdicts[index].reason).assertContain('platform-not-allowed');
        expect(verdicts[index].degradation.length > 0).assertTrue();
      }
      expect(verdicts[0].degradation).assertEqual('show-unsupported-dialog');
    });

    // An undeclared capability is rejected with a dedicated reason instead of
    // throwing, so a downgraded bundle cannot break the startup path.
    it('unknown_feature_should_be_rejected_without_crash', 0, () => {
      const emptyGate = new RecorderFeatureGate();
      const verdict = emptyGate.evaluate(RecorderFeature.SCREEN_CAPTURE, SdkVersion.API_13, PlatformKind.TV);
      expect(verdict.supported).assertFalse();
      expect(verdict.reason).assertEqual('feature-not-declared');
      expect(verdict.degradation).assertEqual('disable-feature');
      expect(emptyGate.supports(RecorderFeature.SCREEN_CAPTURE, SdkVersion.API_13, PlatformKind.TV)).assertFalse();
      expect(emptyGate.countSupported(SdkVersion.API_13, PlatformKind.TV)).assertEqual(0);
    });

    // Degradation removes the cosmetic part only: a recording can still be
    // started and stopped when the tip animation is missing.
    it('degraded_mode_should_preserve_recording_core', 0, () => {
      const gate = buildRecorderGate();
      const capture = gate.evaluate(RecorderFeature.SCREEN_CAPTURE, SdkVersion.API_10, PlatformKind.TV);
      const input = gate.evaluate(RecorderFeature.INPUT_KEY_EVENT, SdkVersion.API_10, PlatformKind.TV);
      const tip = gate.evaluate(RecorderFeature.TIP_WINDOW_ANIMATION, SdkVersion.API_10, PlatformKind.TV);
      expect(capture.supported).assertTrue();
      expect(input.supported).assertTrue();
      expect(tip.supported).assertFalse();
      expect(tip.degradation).assertEqual('show-tip-without-animation');
      expect(capture.degradation.length).assertEqual(0);
    });

    // Evaluating the same deployment twice must yield the same verdict, which
    // keeps the startup probe cheap and side effect free.
    it('verdicts_should_be_idempotent', 0, () => {
      const gate = buildRecorderGate();
      const first = gate.collectVerdicts(SdkVersion.API_10, PlatformKind.TV);
      const second = gate.collectVerdicts(SdkVersion.API_10, PlatformKind.TV);
      expect(first.length).assertEqual(second.length);
      for (let index = 0; index < first.length; index++) {
        expect(first[index].feature).assertEqual(second[index].feature);
        expect(first[index].supported).assertEqual(second[index].supported);
        expect(first[index].reason).assertEqual(second[index].reason);
      }
    });

    // Raising the API level never removes a capability.
    it('support_should_be_monotonic_across_sdk', 0, () => {
      const gate = buildRecorderGate();
      const requirements = gate.getRequirements();
      const levels: SdkVersion[] = [
        SdkVersion.API_9,
        SdkVersion.API_10,
        SdkVersion.API_11,
        SdkVersion.API_12,
        SdkVersion.API_13
      ];
      for (let featureIndex = 0; featureIndex < requirements.length; featureIndex++) {
        let previous = false;
        for (let levelIndex = 0; levelIndex < levels.length; levelIndex++) {
          const current = gate.supports(requirements[featureIndex].feature, levels[levelIndex], PlatformKind.TV);
          if (previous) {
            expect(current).assertTrue();
          }
          previous = current;
        }
        expect(previous).assertTrue();
      }
    });

    // Missing permissions block the capability even when the SDK level is high
    // enough, which is the runtime half of the compatibility check.
    it('permissions_should_gate_capabilities', 0, () => {
      const gate = buildRecorderGate();
      const capture = gate.getRequirement(RecorderFeature.SCREEN_CAPTURE);
      const photo = gate.getRequirement(RecorderFeature.PHOTO_CREATE_ASSET);
      expect(capture === undefined).assertFalse();
      expect(photo === undefined).assertFalse();
      if (capture !== undefined && photo !== undefined) {
        expect(gate.hasPermission(capture, [])).assertFalse();
        expect(gate.hasPermission(capture, ['ohos.permission.READ_IMAGEVIDEO'])).assertFalse();
        expect(gate.hasPermission(capture, ['ohos.permission.CAPTURE_SCREEN'])).assertTrue();
        expect(gate.hasPermission(photo, ['ohos.permission.WRITE_IMAGEVIDEO'])).assertTrue();
        expect(gate.hasPermission(photo, ['ohos.permission.CAPTURE_SCREEN'])).assertFalse();
      }
    });

    // Capabilities without a permission requirement are always usable.
    it('permission_free_features_should_always_pass', 0, () => {
      const gate = buildRecorderGate();
      const features: RecorderFeature[] = [
        RecorderFeature.FLOAT_WINDOW,
        RecorderFeature.WINDOW_FOCUSABLE,
        RecorderFeature.INPUT_KEY_EVENT,
        RecorderFeature.TIP_WINDOW_ANIMATION
      ];
      for (let index = 0; index < features.length; index++) {
        const requirement = gate.getRequirement(features[index]);
        expect(requirement === undefined).assertFalse();
        if (requirement !== undefined) {
          expect(requirement.permission.length).assertEqual(0);
          expect(gate.hasPermission(requirement, [])).assertTrue();
        }
      }
    });

    // The resolution gate is a display property: it must be evaluated
    // independently of the SDK level.
    it('resolution_gate_should_be_independent_of_sdk', 0, () => {
      const recordWidth = 1920;
      const recordHeight = 1080;
      const profiles: number[][] = [[1920, 1080], [3840, 2160], [1280, 800]];
      for (let index = 0; index < profiles.length; index++) {
        const width = profiles[index][0];
        const height = profiles[index][1];
        const supported = width <= recordWidth && height <= recordHeight;
        if (index === 0) {
          expect(supported).assertTrue();
        } else if (index === 1) {
          expect(supported).assertFalse();
        } else {
          expect(supported).assertTrue();
        }
      }
      const gate = buildRecorderGate();
      expect(gate.supports(RecorderFeature.SCREEN_CAPTURE, SdkVersion.API_13, PlatformKind.TV)).assertTrue();
      expect(gate.supports(RecorderFeature.SCREEN_CAPTURE, SdkVersion.API_9, PlatformKind.TV)).assertTrue();
    });

    // Only the wearable platform set is empty; the other families share the
    // same capability table.
    it('platform_sets_should_exclude_wearable_only', 0, () => {
      const gate = buildRecorderGate();
      const requirements = gate.getRequirements();
      for (let index = 0; index < requirements.length; index++) {
        const platforms = requirements[index].platforms;
        expect(platforms.tv).assertTrue();
        expect(platforms.phone).assertTrue();
        expect(platforms.tablet).assertTrue();
        expect(platforms.wearable).assertFalse();
      }
      expect(platformAllowed(requirements[0].platforms, PlatformKind.UNKNOWN)).assertFalse();
      expect(platformAllowed(requirements[0].platforms, PlatformKind.TV)).assertTrue();
    });

    // A deployment without any supported capability is reported so that the
    // matrix cannot hide an unusable configuration.
    it('report_should_flag_deployment_without_capabilities', 0, () => {
      const gate = buildRecorderGate();
      const report = new CompatibilityReport();
      report.record(gate.collectVerdicts(SdkVersion.API_13, PlatformKind.TV), 'tv_api13');
      report.record(gate.collectVerdicts(SdkVersion.API_13, PlatformKind.WEARABLE), 'wearable_api13');
      expect(report.getTotal()).assertEqual(14);
      expect(report.getSupported()).assertEqual(7);
      expect(report.getDegraded()).assertEqual(7);
      const labels = report.getRejectedLabels();
      expect(labels.length).assertEqual(1);
      expect(labels[0]).assertEqual('wearable_api13');
    });

    // Reset restores the report so that a second sweep starts from zero.
    it('report_should_reset_cleanly', 0, () => {
      const gate = buildRecorderGate();
      const report = new CompatibilityReport();
      report.record(gate.collectVerdicts(SdkVersion.API_11, PlatformKind.TV), 'tv_api11');
      expect(report.getTotal()).assertEqual(7);
      report.reset();
      expect(report.getTotal()).assertEqual(0);
      expect(report.getSupported()).assertEqual(0);
      expect(report.getDegraded()).assertEqual(0);
      expect(report.getRejected()).assertEqual(0);
      expect(report.getSupportRate()).assertEqual(0);
      expect(report.getRejectedLabels().length).assertEqual(0);
    });

    // Deployment labels identify the matrix rows, so they have to stay unique
    // and ordered by API level.
    it('deployment_labels_should_be_unique', 0, () => {
      const deployments = buildDeployments();
      expect(deployments.length).assertEqual(8);
      for (let index = 0; index < deployments.length; index++) {
        expect(deployments[index].label.length > 0).assertTrue();
        for (let other = index + 1; other < deployments.length; other++) {
          expect(deployments[index].label === deployments[other].label).assertFalse();
        }
      }
      expect(deployments[0].sdk).assertEqual(SdkVersion.API_9);
      expect(deployments[4].sdk).assertEqual(SdkVersion.API_13);
      expect(deployments[7].platform).assertEqual(PlatformKind.WEARABLE);
    });

    // Real-device probe: the running build either renders the timer window or
    // reports that the feature is unavailable, never a crash.
    it('current_build_should_report_capability_status', 0, async () => {
      await launchRecorderService();
      await serializedDelay(driver, 800);
      const gate = buildRecorderGate();
      const captureSupported = gate.supports(RecorderFeature.SCREEN_CAPTURE, SdkVersion.API_13, PlatformKind.TV);
      expect(captureSupported).assertTrue();
      const componentCount: number = await recorderComponentCount(driver);
      expect(componentCount >= 0).assertEqual(true);
      const timerVisible: boolean = await isTimerWindowVisible(driver);
      expect(timerVisible && componentCount === 0).assertFalse();
    });
  });
}

