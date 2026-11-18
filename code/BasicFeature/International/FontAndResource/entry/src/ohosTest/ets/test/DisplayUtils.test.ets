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

// Import the display utility under test through the library facade.
import { DisplayUtils } from 'library';
// Import hilog directly for device side case logging.
import { hilog } from '@kit.PerformanceAnalysisKit';
// Import the hypium test framework primitives used by this suite.
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

// The suite-level hilog tag shared by every case of this suite.
const SUITE_TAG: string = '[Sample_FontAndResource]';
// The hilog domain used by this suite.
const DOMAIN: number = 0xF811;
// The prefix attached to every case log message.
const CASE_PREFIX: string = 'FontAndResource_';

// The absolute tolerance applied to every vp round trip comparison.
const VP_DELTA: number = 0.001;
// The absolute tolerance applied to every fp round trip comparison.
const FP_DELTA: number = 0.001;
// The representative vp amount required by the vp round trip matrix.
const VP_AMOUNT: number = 100;
// The representative fp amount required by the fp round trip matrix.
const FP_AMOUNT: number = 50;
// The plausible minimum refresh rate in Hz for a live display.
const REFRESH_RATE_MIN: number = 1;
// The plausible maximum refresh rate in Hz for a live display.
const REFRESH_RATE_MAX: number = 360;
// The vp samples exercised by the multi value vp round trip loop.
const VP_SAMPLES: number[] = [1, 10, 37.5, 100, 999];
// The fp samples exercised by the multi value fp round trip loop.
const FP_SAMPLES: number[] = [1, 16, 50, 128];

// Logs one structured case progress line into hilog under the case tag.
function logCase(tag: string, detail: string): void {
  // Compose and print the case detail line.
  hilog.info(DOMAIN, SUITE_TAG, '%{public}s', CASE_PREFIX + tag + ', ' + detail);
}

// Registers every logic test case of the DisplayUtils suite.
export default function displayUtilsTest(): void {
  // Group the cases under the DisplayUtilsSuite describe block.
  describe('DisplayUtilsSuite', () => {
    /**
     * @tc.number    SUB_FONTRESOURCE_LT_DISPLAY_0100
     * @tc.name      testDisplay0001
     * @tc.desc      Verify widthPx and heightPx are strictly positive and densityPixels plus densityFontPixels stay at least 1.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDisplay0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      // The per case hilog tag, identical to the it name.
      const TAG: string = 'testDisplay0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Read the physical pixel width of the primary display.
      const widthPx: number = DisplayUtils.widthPx();
      // Log the captured width.
      logCase(TAG, 'widthPx: ' + widthPx);
      // Expect the width to be strictly positive.
      expect(widthPx > 0).assertTrue();

      // Read the physical pixel height of the primary display.
      const heightPx: number = DisplayUtils.heightPx();
      // Log the captured height.
      logCase(TAG, 'heightPx: ' + heightPx);
      // Expect the height to be strictly positive.
      expect(heightPx > 0).assertTrue();

      // Read the screen density factor used by vp conversions.
      const density: number = DisplayUtils.densityPixels();
      // Log the captured density.
      logCase(TAG, 'densityPixels: ' + density);
      // Expect the density to be at least 1.
      expect(density >= 1).assertTrue();

      // Read the font density factor used by fp conversions.
      const fontDensity: number = DisplayUtils.densityFontPixels();
      // Expect the font density to also stay at least 1.
      expect(fontDensity >= 1).assertTrue();
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_DISPLAY_0200
     * @tc.name      testDisplay0002
     * @tc.desc      Verify vpToPx scales by density and the vpToPx then pxToVp round trip restores 100 within 0.001.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDisplay0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      // The per case hilog tag, identical to the it name.
      const TAG: string = 'testDisplay0002';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Read the density once so the definition check stays consistent.
      const density: number = DisplayUtils.densityPixels();
      // Convert the representative vp amount into physical pixels.
      const pxFromVp: number = DisplayUtils.vpToPx(VP_AMOUNT);
      // Log the converted px value.
      logCase(TAG, 'vpToPx(' + VP_AMOUNT + '): ' + pxFromVp);
      // Expect the conversion to scale the vp amount by the density.
      expect(Math.abs(pxFromVp - VP_AMOUNT * density) < VP_DELTA).assertTrue();
      // Expect the converted px value to be strictly positive.
      expect(pxFromVp > 0).assertTrue();

      // Restore the vp value from the converted px value.
      const vpRestored: number = DisplayUtils.pxToVp(pxFromVp);
      // Log the restored vp value.
      logCase(TAG, 'pxToVp restored: ' + vpRestored);
      // Expect the round trip to recover 100 within the absolute tolerance.
      expect(Math.abs(vpRestored - VP_AMOUNT) < VP_DELTA).assertTrue();

      // Exercise one more round trip per entry across the vp sample list.
      for (let i: number = 0; i < VP_SAMPLES.length; i++) {
        // Convert the current vp sample into px and back again.
        const samplePx: number = DisplayUtils.vpToPx(VP_SAMPLES[i]);
        const sampleVp: number = DisplayUtils.pxToVp(samplePx);
        // Expect the sample round trip to recover the original vp value.
        expect(Math.abs(sampleVp - VP_SAMPLES[i]) < VP_DELTA).assertTrue();
      }
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_DISPLAY_0300
     * @tc.name      testDisplay0003
     * @tc.desc      Verify fpToPx scales by font density and the fpToPx then pxToFp round trip restores 50 within 0.001.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDisplay0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      // The per case hilog tag, identical to the it name.
      const TAG: string = 'testDisplay0003';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Read the font density once so the definition check stays consistent.
      const fontDensity: number = DisplayUtils.densityFontPixels();
      // Convert the representative fp amount into physical pixels.
      const pxFromFp: number = DisplayUtils.fpToPx(FP_AMOUNT);
      // Log the converted px value.
      logCase(TAG, 'fpToPx(' + FP_AMOUNT + '): ' + pxFromFp);
      // Expect the conversion to scale the fp amount by the font density.
      expect(Math.abs(pxFromFp - FP_AMOUNT * fontDensity) < FP_DELTA).assertTrue();
      // Expect the converted px value to be strictly positive.
      expect(pxFromFp > 0).assertTrue();

      // Restore the fp value from the converted px value.
      const fpRestored: number = DisplayUtils.pxToFp(pxFromFp);
      // Log the restored fp value.
      logCase(TAG, 'pxToFp restored: ' + fpRestored);
      // Expect the round trip to recover 50 within the absolute tolerance.
      expect(Math.abs(fpRestored - FP_AMOUNT) < FP_DELTA).assertTrue();

      // Exercise one more round trip per entry across the fp sample list.
      for (let i: number = 0; i < FP_SAMPLES.length; i++) {
        // Convert the current fp sample into px and back again.
        const samplePx: number = DisplayUtils.fpToPx(FP_SAMPLES[i]);
        const sampleFp: number = DisplayUtils.pxToFp(samplePx);
        // Expect the sample round trip to recover the original fp value.
        expect(Math.abs(sampleFp - FP_SAMPLES[i]) < FP_DELTA).assertTrue();
      }
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_DISPLAY_0400
     * @tc.name      testDisplay0004
     * @tc.desc      Verify refreshRate stays idle 0 or within [1,360], rotation is one of 0/90/180/270 and isLandscape matches width versus height.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDisplay0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      // The per case hilog tag, identical to the it name.
      const TAG: string = 'testDisplay0004';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Read the reported screen refresh rate in Hz.
      const rate: number = DisplayUtils.refreshRate();
      // Log the captured refresh rate.
      logCase(TAG, 'refreshRate: ' + rate);
      // Expect the rate to be the idle 0 or a plausible Hz value inside [1, 360].
      expect(rate === 0 || (rate >= REFRESH_RATE_MIN && rate <= REFRESH_RATE_MAX)).assertTrue();

      // Read the current display rotation in degrees.
      const rotation: number = DisplayUtils.rotation();
      // Log the captured rotation.
      logCase(TAG, 'rotation: ' + rotation);
      // Expect the rotation to be one of the four supported degree values.
      expect(rotation === 0 || rotation === 90 || rotation === 180 || rotation === 270).assertTrue();

      // Read the landscape verdict of the utility.
      const landscape: boolean = DisplayUtils.isLandscape();
      // Re-read the raw width and height so the comparison stays independent.
      const widthPx: number = DisplayUtils.widthPx();
      const heightPx: number = DisplayUtils.heightPx();
      // Log the landscape verdict together with the raw metrics.
      logCase(TAG, 'landscape: ' + landscape + ', widthPx: ' + widthPx + ', heightPx: ' + heightPx);
      // Expect the landscape verdict to equal the width versus height comparison.
      expect(landscape === (widthPx >= heightPx)).assertTrue();
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}
