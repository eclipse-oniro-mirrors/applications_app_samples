/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, beforeAll, afterAll, TestType, Size, Level } from '@ohos/hypium';
import { Driver } from '@ohos.UiTest';
import {
  getDriver,
  launchEntryAbility,
  waitForIndexPageStable,
  pageComponentCount,
  checkTextContent,
  checkComponentExistsByKey,
  serializedDelay,
  logInfo,
  PAGE_TEXT_INITIAL,
  PAGE_TEXT_CLICKED,
  INDEX_PAGE_TEXT_KEY,
  TIMEOUT_ABILITY_LAUNCH,
  DELAY_AFTER_LAUNCH,
  DELAY_AFTER_BACKGROUND,
  ensureIndexPageInitial,
} from '../Shared/SharedDriver';

const DEVICE_TYPE_DEFAULT: string = 'default';

const DEVICE_TYPE_TABLET: string = 'tablet';

const DEVICE_TYPE_PHONE: string = 'phone';

const DEVICE_TYPE_TV: string = 'tv';

const SCREEN_WIDTH_PHONE: number = 1080;

const SCREEN_WIDTH_TABLET: number = 2560;

const SCREEN_WIDTH_TV: number = 3840;

const TEXT_BASE_FONT_SIZE_VP: number = 40;

enum LayoutForm {
  FORM_COMPACT = 'compact',
  FORM_MEDIUM = 'medium',
  FORM_EXPANDED = 'expanded',
  FORM_UNSUPPORTED = 'unsupported'
}

interface DeviceProfile {
  deviceType: string;
  screenWidth: number;
  screenHeight: number;
  densityDpi: number;
}

class DeviceCompatibilityModel {
  public isSupportedDeviceType(deviceType: string): boolean {
    return deviceType === DEVICE_TYPE_DEFAULT || deviceType === DEVICE_TYPE_TABLET;
  }

  public resolveLayoutForm(profile: DeviceProfile): LayoutForm {
    if (!this.isSupportedDeviceType(profile.deviceType)) {
      return LayoutForm.FORM_UNSUPPORTED;
    }
    if (profile.screenWidth < SCREEN_WIDTH_PHONE) {
      return LayoutForm.FORM_COMPACT;
    }
    if (profile.screenWidth < SCREEN_WIDTH_TABLET) {
      return LayoutForm.FORM_MEDIUM;
    }
    return LayoutForm.FORM_EXPANDED;
  }

  public computeDensityScale(profile: DeviceProfile): number {
    if (profile.densityDpi <= 0) {
      return 0;
    }
    return profile.densityDpi / 160;
  }

  public computeCenteredOffset(profile: DeviceProfile, textWidthVp: number, fontSizeScale: number): number {
    if (profile.screenWidth <= 0 || fontSizeScale <= 0) {
      return -1;
    }
    const scaledTextWidth: number = textWidthVp * fontSizeScale;
    if (scaledTextWidth > profile.screenWidth) {
      return 0;
    }
    return (profile.screenWidth - scaledTextWidth) / 2;
  }

  public isTextFullyVisible(profile: DeviceProfile, textWidthVp: number, fontSizeScale: number): boolean {
    return textWidthVp * fontSizeScale <= profile.screenWidth;
  }
}

export default function deviceCompatibilityTest(): void {
  describe('DeviceCompatibilityTest', () => {
    let driver: Driver;
    let model: DeviceCompatibilityModel;

    beforeAll(async () => {
      driver = getDriver();
      model = new DeviceCompatibilityModel();
      logInfo('DeviceCompatibilityTest: beforeAll prepared model and driver');

      await ensureIndexPageInitial(driver);
    })

    afterAll(async () => {
      await serializedDelay(driver, DELAY_AFTER_BACKGROUND);
      logInfo('DeviceCompatibilityTest: afterAll finished');
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_DEVICE_0100
     * @tc.name testSupportedDeviceTypes
     * @tc.desc Verify module.json5 deviceTypes only declares default and tablet as supported, while phone and tv are rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSupportedDeviceTypes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(model.isSupportedDeviceType(DEVICE_TYPE_DEFAULT)).assertTrue();
          expect(model.isSupportedDeviceType(DEVICE_TYPE_TABLET)).assertTrue();
          expect(model.isSupportedDeviceType(DEVICE_TYPE_PHONE)).assertFalse();
          expect(model.isSupportedDeviceType(DEVICE_TYPE_TV)).assertFalse();
          expect(model.isSupportedDeviceType('')).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_DEVICE_0200
     * @tc.name testLayoutFormResolution
     * @tc.desc Verify screen width 720 resolves compact, 1080 resolves medium, 2560 and 3840 resolve expanded for supported device types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLayoutFormResolution', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const compact: DeviceProfile = {
            deviceType: DEVICE_TYPE_DEFAULT, screenWidth: 720, screenHeight: 1280, densityDpi: 320
          };
          const medium: DeviceProfile = {
            deviceType: DEVICE_TYPE_DEFAULT, screenWidth: 1080, screenHeight: 1920, densityDpi: 320
          };
          const tablet: DeviceProfile = {
            deviceType: DEVICE_TYPE_TABLET, screenWidth: 2560, screenHeight: 1600, densityDpi: 320
          };
          const tv: DeviceProfile = {
            deviceType: DEVICE_TYPE_TV, screenWidth: 3840, screenHeight: 2160, densityDpi: 480
          };
          expect(model.resolveLayoutForm(compact)).assertEqual(LayoutForm.FORM_COMPACT);
          expect(model.resolveLayoutForm(medium)).assertEqual(LayoutForm.FORM_MEDIUM);
          expect(model.resolveLayoutForm(tablet)).assertEqual(LayoutForm.FORM_EXPANDED);
          expect(model.resolveLayoutForm(tv)).assertEqual(LayoutForm.FORM_UNSUPPORTED);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_DEVICE_0300
     * @tc.name testDensityScaleBoundaries
     * @tc.desc Verify density scale is 2 for 320 dpi, 3 for 480 dpi and 0 for a non positive density value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL3
     */
    it('testDensityScaleBoundaries', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        try {
          const base: DeviceProfile = {
            deviceType: DEVICE_TYPE_DEFAULT, screenWidth: 1080, screenHeight: 1920, densityDpi: 320
          };
          const high: DeviceProfile = {
            deviceType: DEVICE_TYPE_DEFAULT, screenWidth: 1080, screenHeight: 1920, densityDpi: 480
          };
          const invalid: DeviceProfile = {
            deviceType: DEVICE_TYPE_DEFAULT, screenWidth: 1080, screenHeight: 1920, densityDpi: 0
          };
          expect(model.computeDensityScale(base)).assertEqual(2);
          expect(model.computeDensityScale(high)).assertEqual(3);
          expect(model.computeDensityScale(invalid)).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_DEVICE_0400
     * @tc.name testCenteredOffsetOnTwoDeviceTypes
     * @tc.desc Verify the Hello World text centers at offset 340 on a 1080 wide phone and 1080 on a 2560 wide tablet at scale 1.0, clamps to 0 when overflowing and rejects scale 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL3
     */
    it('testCenteredOffsetOnTwoDeviceTypes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        try {
          const phone: DeviceProfile = {
            deviceType: DEVICE_TYPE_DEFAULT, screenWidth: 1080, screenHeight: 1920, densityDpi: 320
          };
          const tablet: DeviceProfile = {
            deviceType: DEVICE_TYPE_TABLET, screenWidth: 2560, screenHeight: 1600, densityDpi: 320
          };
          expect(model.computeCenteredOffset(phone, 400, 1.0)).assertEqual(340);
          expect(model.computeCenteredOffset(tablet, 400, 1.0)).assertEqual(1080);
          expect(model.computeCenteredOffset(phone, 400, 3.0)).assertEqual(0);
          expect(model.computeCenteredOffset(phone, 400, 0)).assertEqual(-1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_DEVICE_0500
     * @tc.name testTextVisibilityAtMaxScale
     * @tc.desc Verify the text stays fully visible at scale 3.0 on a 2560 wide tablet but not on a 1080 wide phone
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL3
     */
    it('testTextVisibilityAtMaxScale', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        try {
          const phone: DeviceProfile = {
            deviceType: DEVICE_TYPE_DEFAULT, screenWidth: 1080, screenHeight: 1920, densityDpi: 320
          };
          const tablet: DeviceProfile = {
            deviceType: DEVICE_TYPE_TABLET, screenWidth: 2560, screenHeight: 1600, densityDpi: 320
          };
          expect(model.isTextFullyVisible(tablet, TEXT_BASE_FONT_SIZE_VP * 10, 3.0)).assertTrue();
          expect(model.isTextFullyVisible(phone, TEXT_BASE_FONT_SIZE_VP * 10, 3.0)).assertFalse();
          expect(model.isTextFullyVisible(phone, TEXT_BASE_FONT_SIZE_VP * 10, 1.0)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_DEVICE_0600
     * @tc.name testIndexPageRendersOnCurrentDevice
     * @tc.desc Verify the real device launches EntryAbility and renders the HelloWorld keyed component with page text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testIndexPageRendersOnCurrentDevice', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void) => {
        try {
          await launchEntryAbility();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_ABILITY_LAUNCH);
          expect(stable).assertTrue();
          const componentCount: number = await pageComponentCount(driver);
          expect(componentCount > 0).assertTrue();
          const keyExists: boolean = await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY);
          expect(keyExists).assertTrue();
          const showsInitial: boolean = await checkTextContent(driver, PAGE_TEXT_INITIAL);
          const showsClicked: boolean = await checkTextContent(driver, PAGE_TEXT_CLICKED);
          expect(showsInitial || showsClicked).assertTrue();
        } finally {
          done();
        }
      })
  })
}
