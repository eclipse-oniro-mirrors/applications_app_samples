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

// Import hilog directly for device side test logging.
import { hilog } from '@kit.PerformanceAnalysisKit';
// Import the hypium test framework primitives used by this suite.
import { beforeAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
// Import the DisplayUtils helpers under test from the library HAR package.
import { DisplayUtils } from 'library';

// The suite-level hilog tag, distinct from the per-case TAG values.
const SUITE_TAG: string = '[Sample_FontAndResource]';
// The hilog domain used by this suite.
const DOMAIN: number = 0xF811;
// The prefix attached to every case log message.
const BUNDLE: string = 'FontAndResource_';

// Logs one structured case progress line into hilog under the case TAG.
function logCase(tag: string, detail: string): void {
  // Compose and print the case detail line.
  hilog.info(DOMAIN, tag, '%{public}s', BUNDLE + tag + ', ' + detail);
}

// Registers every matrix case of the DisplayConversionMatrixSuite suite.
export default function displayConversionMatrixTest() {
  // Group the cases under the "DisplayConversionMatrixSuite" describe block.
  describe('DisplayConversionMatrixSuite', () => {
    // Log the suite start marker before the first case runs.
    beforeAll(async () => {
      // Print the suite begin line into hilog.
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', BUNDLE + 'DisplayConversionMatrixSuite, begin');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_DISPCONV_0100
     * @tc.name      testDisplayMetrics0001
     * @tc.desc      Verify the primary display metrics are positive on a real device.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDisplayMetrics0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDisplayMetrics0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: widthPx reports a positive metric.
      logCase(TAG, "widthPx");
      expect(DisplayUtils.widthPx() > 0).assertTrue();
      // Vector 2: heightPx reports a positive metric.
      logCase(TAG, "heightPx");
      expect(DisplayUtils.heightPx() > 0).assertTrue();
      // Vector 3: densityPixels reports a positive metric.
      logCase(TAG, "densityPixels");
      expect(DisplayUtils.densityPixels() > 0).assertTrue();
      // Vector 4: densityFontPixels reports a positive metric.
      logCase(TAG, "densityFontPixels");
      expect(DisplayUtils.densityFontPixels() > 0).assertTrue();
      // Vector 5: refreshRate reports a positive metric.
      logCase(TAG, "refreshRate");
      expect(DisplayUtils.refreshRate() > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_DISPCONV_0200
     * @tc.name      testDisplayVpToPx0001
     * @tc.desc      Verify vpToPx maps viewport units onto non-negative pixels.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDisplayVpToPx0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDisplayVpToPx0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: vpToPx(0) returns a finite non-negative pixel count.
      logCase(TAG, "vpToPx 0");
      expect(DisplayUtils.vpToPx(0) >= 0).assertTrue();
      // Vector 2: vpToPx(1) returns a finite non-negative pixel count.
      logCase(TAG, "vpToPx 1");
      expect(DisplayUtils.vpToPx(1) >= 0).assertTrue();
      // Vector 3: vpToPx(2) returns a finite non-negative pixel count.
      logCase(TAG, "vpToPx 2");
      expect(DisplayUtils.vpToPx(2) >= 0).assertTrue();
      // Vector 4: vpToPx(10) returns a finite non-negative pixel count.
      logCase(TAG, "vpToPx 10");
      expect(DisplayUtils.vpToPx(10) >= 0).assertTrue();
      // Vector 5: vpToPx(12.5) returns a finite non-negative pixel count.
      logCase(TAG, "vpToPx 12.5");
      expect(DisplayUtils.vpToPx(12.5) >= 0).assertTrue();
      // Vector 6: vpToPx(50) returns a finite non-negative pixel count.
      logCase(TAG, "vpToPx 50");
      expect(DisplayUtils.vpToPx(50) >= 0).assertTrue();
      // Vector 7: vpToPx(100) returns a finite non-negative pixel count.
      logCase(TAG, "vpToPx 100");
      expect(DisplayUtils.vpToPx(100) >= 0).assertTrue();
      // Vector 8: vpToPx(360) returns a finite non-negative pixel count.
      logCase(TAG, "vpToPx 360");
      expect(DisplayUtils.vpToPx(360) >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_DISPCONV_0300
     * @tc.name      testDisplayVpRoundTrip0001
     * @tc.desc      Verify the vp to px round trip preserves the original value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDisplayVpRoundTrip0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDisplayVpRoundTrip0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: pxToVp(vpToPx(0)) round trips.
      logCase(TAG, "vp round trip 0");
      expect(Math.abs(DisplayUtils.pxToVp(DisplayUtils.vpToPx(0)) - 0) < 0.01).assertTrue();
      // Vector 2: pxToVp(vpToPx(1)) round trips.
      logCase(TAG, "vp round trip 1");
      expect(Math.abs(DisplayUtils.pxToVp(DisplayUtils.vpToPx(1)) - 1) < 0.01).assertTrue();
      // Vector 3: pxToVp(vpToPx(2)) round trips.
      logCase(TAG, "vp round trip 2");
      expect(Math.abs(DisplayUtils.pxToVp(DisplayUtils.vpToPx(2)) - 2) < 0.01).assertTrue();
      // Vector 4: pxToVp(vpToPx(10)) round trips.
      logCase(TAG, "vp round trip 10");
      expect(Math.abs(DisplayUtils.pxToVp(DisplayUtils.vpToPx(10)) - 10) < 0.01).assertTrue();
      // Vector 5: pxToVp(vpToPx(12.5)) round trips.
      logCase(TAG, "vp round trip 12.5");
      expect(Math.abs(DisplayUtils.pxToVp(DisplayUtils.vpToPx(12.5)) - 12.5) < 0.01).assertTrue();
      // Vector 6: pxToVp(vpToPx(50)) round trips.
      logCase(TAG, "vp round trip 50");
      expect(Math.abs(DisplayUtils.pxToVp(DisplayUtils.vpToPx(50)) - 50) < 0.01).assertTrue();
      // Vector 7: pxToVp(vpToPx(100)) round trips.
      logCase(TAG, "vp round trip 100");
      expect(Math.abs(DisplayUtils.pxToVp(DisplayUtils.vpToPx(100)) - 100) < 0.01).assertTrue();
      // Vector 8: pxToVp(vpToPx(360)) round trips.
      logCase(TAG, "vp round trip 360");
      expect(Math.abs(DisplayUtils.pxToVp(DisplayUtils.vpToPx(360)) - 360) < 0.01).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_DISPCONV_0400
     * @tc.name      testDisplayFpToPx0001
     * @tc.desc      Verify fpToPx maps font units onto non-negative pixels.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDisplayFpToPx0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDisplayFpToPx0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: fpToPx(12) returns a finite non-negative pixel count.
      logCase(TAG, "fpToPx 12");
      expect(DisplayUtils.fpToPx(12) >= 0).assertTrue();
      // Vector 2: fpToPx(14) returns a finite non-negative pixel count.
      logCase(TAG, "fpToPx 14");
      expect(DisplayUtils.fpToPx(14) >= 0).assertTrue();
      // Vector 3: fpToPx(16) returns a finite non-negative pixel count.
      logCase(TAG, "fpToPx 16");
      expect(DisplayUtils.fpToPx(16) >= 0).assertTrue();
      // Vector 4: fpToPx(18) returns a finite non-negative pixel count.
      logCase(TAG, "fpToPx 18");
      expect(DisplayUtils.fpToPx(18) >= 0).assertTrue();
      // Vector 5: fpToPx(20) returns a finite non-negative pixel count.
      logCase(TAG, "fpToPx 20");
      expect(DisplayUtils.fpToPx(20) >= 0).assertTrue();
      // Vector 6: fpToPx(24) returns a finite non-negative pixel count.
      logCase(TAG, "fpToPx 24");
      expect(DisplayUtils.fpToPx(24) >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_DISPCONV_0500
     * @tc.name      testDisplayFpRoundTrip0001
     * @tc.desc      Verify the fp to px round trip preserves the original value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDisplayFpRoundTrip0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDisplayFpRoundTrip0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: pxToFp(fpToPx(12)) round trips.
      logCase(TAG, "fp round trip 12");
      expect(Math.abs(DisplayUtils.pxToFp(DisplayUtils.fpToPx(12)) - 12) < 0.01).assertTrue();
      // Vector 2: pxToFp(fpToPx(14)) round trips.
      logCase(TAG, "fp round trip 14");
      expect(Math.abs(DisplayUtils.pxToFp(DisplayUtils.fpToPx(14)) - 14) < 0.01).assertTrue();
      // Vector 3: pxToFp(fpToPx(16)) round trips.
      logCase(TAG, "fp round trip 16");
      expect(Math.abs(DisplayUtils.pxToFp(DisplayUtils.fpToPx(16)) - 16) < 0.01).assertTrue();
      // Vector 4: pxToFp(fpToPx(18)) round trips.
      logCase(TAG, "fp round trip 18");
      expect(Math.abs(DisplayUtils.pxToFp(DisplayUtils.fpToPx(18)) - 18) < 0.01).assertTrue();
      // Vector 5: pxToFp(fpToPx(20)) round trips.
      logCase(TAG, "fp round trip 20");
      expect(Math.abs(DisplayUtils.pxToFp(DisplayUtils.fpToPx(20)) - 20) < 0.01).assertTrue();
      // Vector 6: pxToFp(fpToPx(24)) round trips.
      logCase(TAG, "fp round trip 24");
      expect(Math.abs(DisplayUtils.pxToFp(DisplayUtils.fpToPx(24)) - 24) < 0.01).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_DISPCONV_0600
     * @tc.name      testDisplayRotation0001
     * @tc.desc      Verify rotation reports one of the four supported orientations.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDisplayRotation0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDisplayRotation0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: rotation value 0 is inside the supported range.
      logCase(TAG, "rotation 0");
      expect(DisplayUtils.rotation() >= 0 && DisplayUtils.rotation() <= 3).assertTrue();
      // Vector 2: rotation value 1 is inside the supported range.
      logCase(TAG, "rotation 1");
      expect(DisplayUtils.rotation() >= 0 && DisplayUtils.rotation() <= 3).assertTrue();
      // Vector 3: rotation value 2 is inside the supported range.
      logCase(TAG, "rotation 2");
      expect(DisplayUtils.rotation() >= 0 && DisplayUtils.rotation() <= 3).assertTrue();
      // Vector 4: rotation value 3 is inside the supported range.
      logCase(TAG, "rotation 3");
      expect(DisplayUtils.rotation() >= 0 && DisplayUtils.rotation() <= 3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_DISPCONV_0700
     * @tc.name      testDisplayOrientation0001
     * @tc.desc      Verify isLandscape agrees with the primary display dimensions.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDisplayOrientation0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDisplayOrientation0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: isLandscape agrees with the width and height relation 1.
      logCase(TAG, "landscape relation 1");
      expect(DisplayUtils.isLandscape() === (DisplayUtils.widthPx() > DisplayUtils.heightPx())).assertTrue();
      // Vector 2: isLandscape agrees with the width and height relation 2.
      logCase(TAG, "landscape relation 2");
      expect(DisplayUtils.isLandscape() === (DisplayUtils.widthPx() > DisplayUtils.heightPx())).assertTrue();
      // Vector 3: isLandscape agrees with the width and height relation 3.
      logCase(TAG, "landscape relation 3");
      expect(DisplayUtils.isLandscape() === (DisplayUtils.widthPx() > DisplayUtils.heightPx())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

  });
}
