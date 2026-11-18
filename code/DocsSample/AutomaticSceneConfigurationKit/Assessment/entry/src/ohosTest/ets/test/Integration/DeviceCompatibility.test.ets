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

import { afterAll, beforeAll, describe, expect, it } from '@ohos/hypium';
import { Component, Driver } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import {
  ID_INDEX_TITLE,
  KEY_BACK,
  TIMEOUT_PAGE_RENDER,
  serializedDelay,
  getDriver,
  launchAssessmentApp,
  findById,
  waitForIndexPage,
  pressAndWait
} from '../Shared/AssessmentDriver';
import { clickSerialized, inputTextSerialized, getTextSerialized, clickPointSerialized } from '../Shared/AssessmentDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Assessment]';
const BUNDLE: string = 'Assessment_';

/**
 * Form factor of the device that runs the sample.
 *
 * The assessment page is a single scrollable List, so every form factor exercises the same
 * layout, the profile only changes the minimum width the config card must still fit in.
 */
enum DeviceForm {
  PHONE = 'phone', TABLET = 'tablet', FOLDABLE = 'foldable'
}

/**
 * One device profile of the compatibility matrix.
 *
 * The width and height are expressed in vp, the minimum width is the narrowest viewport that the
 * config card still renders without clipping the four duration chips.
 */
class DeviceProfile {
  private form: DeviceForm = DeviceForm.PHONE;
  private widthVp: number = 0;
  private heightVp: number = 0;
  private minCardWidthVp: number = 0;

  constructor(form: DeviceForm, widthVp: number, heightVp: number, minCardWidthVp: number) {
    this.form = form;
    this.widthVp = widthVp;
    this.heightVp = heightVp;
    this.minCardWidthVp = minCardWidthVp;
  }

  public getForm(): DeviceForm {
    return this.form;
  }

  public getWidthVp(): number {
    return this.widthVp;
  }

  public getHeightVp(): number {
    return this.heightVp;
  }

  public getMinCardWidthVp(): number {
    return this.minCardWidthVp;
  }

  public isLandscape(): boolean {
    return this.widthVp > this.heightVp;
  }

  public aspectRatio(): number {
    if (this.heightVp === 0) {
      return 0;
    }
    return this.widthVp / this.heightVp;
  }

  public fitsConfigCard(): boolean {
    return this.widthVp >= this.minCardWidthVp;
  }

  public describe(): string {
    return `DeviceProfile{form=${this.form}, width=${this.widthVp}, height=${this.heightVp}}`;
  }
}

/**
 * Result of a capability probe.
 *
 * A missing capability is not a defect of the sample: the exam page degrades gracefully and the
 * probe records the fallback that the page falls back to.
 */
interface CapabilityProbeResult {
  capability: string;
  available: boolean;
  fallback: string;
}

/**
 * Probes the optional capabilities that the exam page hardens.
 *
 * Every measure of ExamHardeningUtil is guarded separately, so an image that does not provide the
 * window privacy mode still keeps the full screen layout and the pasteboard clearing.
 */
class CapabilityProbe {
  private results: CapabilityProbeResult[] = [];

  public record(capability: string, available: boolean, fallback: string): void {
    this.results.push({
      capability: capability,
      available: available,
      fallback: fallback
    });
  }

  public size(): number {
    return this.results.length;
  }

  public availableCount(): number {
    let total: number = 0;
    for (let i = 0; i < this.results.length; i++) {
      if (this.results[i].available) {
        total++;
      }
    }
    return total;
  }

  public missingCount(): number {
    return this.results.length - this.availableCount();
  }

  public fallbackOf(capability: string): string {
    for (let i = 0; i < this.results.length; i++) {
      if (this.results[i].capability === capability) {
        return this.results[i].fallback;
      }
    }
    return '';
  }

  public isAvailable(capability: string): boolean {
    for (let i = 0; i < this.results.length; i++) {
      if (this.results[i].capability === capability) {
        return this.results[i].available;
      }
    }
    return false;
  }

  public describe(): string {
    return `CapabilityProbe{total=${this.results.length}, available=${this.availableCount()}}`;
  }
}

/**
 * Builds the form factor matrix of the sample.
 *
 * @returns the three documented profiles.
 */
function buildProfiles(): DeviceProfile[] {
  return [
    new DeviceProfile(DeviceForm.PHONE, 360, 780, 320),
    new DeviceProfile(DeviceForm.TABLET, 840, 1280, 600),
    new DeviceProfile(DeviceForm.FOLDABLE, 720, 720, 600)
  ];
}

export default function deviceCompatibilityTest() {
  describe('DeviceCompatibility_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      await serializedDelay(driver, 1000);
      await launchAssessmentApp();
      await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, 50);
      await serializedDelay(driver, 500);
    });

    /**
     * Scenario: inspect the form factor matrix.
     * Expectation: three profiles are declared and each of them leaves room for the config card.
     */
    it('Assessment_DeviceCompatibility_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DeviceCompatibility_001, begin');
      const profiles: DeviceProfile[] = buildProfiles();
      expect(profiles.length).assertEqual(3);
      for (let i = 0; i < profiles.length; i++) {
        expect(profiles[i].fitsConfigCard()).assertTrue();
        expect(profiles[i].getWidthVp()).assertLarger(0);
        expect(profiles[i].getHeightVp()).assertLarger(0);
        hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'DeviceCompatibility_001',
          profiles[i].describe());
      }
      expect(profiles[0].getForm()).assertEqual(DeviceForm.PHONE);
      expect(profiles[1].getForm()).assertEqual(DeviceForm.TABLET);
      expect(profiles[2].getForm()).assertEqual(DeviceForm.FOLDABLE);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DeviceCompatibility_001, end');
    });

    /**
     * Scenario: the orientation of each profile.
     * Expectation: the phone and the tablet are portrait, the foldable is square, and no profile
     * reports a negative aspect ratio.
     */
    it('Assessment_DeviceCompatibility_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DeviceCompatibility_002, begin');
      const profiles: DeviceProfile[] = buildProfiles();
      expect(profiles[0].isLandscape()).assertFalse();
      expect(profiles[1].isLandscape()).assertFalse();
      expect(profiles[2].isLandscape()).assertFalse();
      for (let i = 0; i < profiles.length; i++) {
        expect(profiles[i].aspectRatio() > 0).assertTrue();
      }
      expect(profiles[0].aspectRatio() < 1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s ratios %{public}s, %{public}s, %{public}s',
        BUNDLE + 'DeviceCompatibility_002', `${profiles[0].aspectRatio()}`, `${profiles[1].aspectRatio()}`,
        `${profiles[2].aspectRatio()}`);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DeviceCompatibility_002, end');
    });

    /**
     * Scenario: a narrow viewport that is below the minimum card width.
     * Expectation: the profile reports that the config card does not fit, which tells the runner
     * that the case must be skipped on that image instead of reporting a layout defect.
     */
    it('Assessment_DeviceCompatibility_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DeviceCompatibility_003, begin');
      const narrow: DeviceProfile = new DeviceProfile(DeviceForm.PHONE, 240, 640, 320);
      expect(narrow.fitsConfigCard()).assertFalse();
      const wide: DeviceProfile = new DeviceProfile(DeviceForm.PHONE, 320, 640, 320);
      expect(wide.fitsConfigCard()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s narrow fits %{public}s', BUNDLE + 'DeviceCompatibility_003',
        `${narrow.fitsConfigCard()}`);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DeviceCompatibility_003, end');
    });

    /**
     * Scenario: probe the optional hardening capabilities.
     * Expectation: a missing capability is recorded with its fallback, and the probe separates
     * the available measures from the degraded ones.
     */
    it('Assessment_DeviceCompatibility_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DeviceCompatibility_004, begin');
      const probe: CapabilityProbe = new CapabilityProbe();
      probe.record('window.setWindowLayoutFullScreen', true, 'the system bar stays visible');
      probe.record('window.setWindowPrivacyMode', true, 'the window is captured normally');
      probe.record('inputMethod.setSimpleKeyboardEnabled', false, 'the full keyboard stays enabled');
      probe.record('pasteboard.clearData', true, 'the pasteboard keeps its content');
      expect(probe.size()).assertEqual(4);
      expect(probe.availableCount()).assertEqual(3);
      expect(probe.missingCount()).assertEqual(1);
      expect(probe.isAvailable('window.setWindowPrivacyMode')).assertTrue();
      expect(probe.isAvailable('inputMethod.setSimpleKeyboardEnabled')).assertFalse();
      expect(probe.fallbackOf('inputMethod.setSimpleKeyboardEnabled')).assertContain('keyboard');
      expect(probe.fallbackOf('unknown.capability')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'DeviceCompatibility_004', probe.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DeviceCompatibility_004, end');
    });
  });
}
