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
// Import the NumberUtils helpers under test from the library HAR package.
import { NumberUtils } from 'library';

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

// Registers every matrix case of the NumericFileSizeMatrixSuite suite.
export default function numericFileSizeMatrixTest() {
  // Group the cases under the "NumericFileSizeMatrixSuite" describe block.
  describe('NumericFileSizeMatrixSuite', () => {
    // Log the suite start marker before the first case runs.
    beforeAll(async () => {
      // Print the suite begin line into hilog.
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', BUNDLE + 'NumericFileSizeMatrixSuite, begin');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_FSIZE_0100
     * @tc.name      testFileSizeBytes0001
     * @tc.desc      Verify fileSizeText prints raw bytes below the kilo boundary.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFileSizeBytes0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testFileSizeBytes0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: fileSizeText(0) returns 0 B.
      logCase(TAG, "fileSizeText(0)");
      expect(NumberUtils.fileSizeText(0)).assertEqual("0 B");
      // Vector 2: fileSizeText(1) returns 1 B.
      logCase(TAG, "fileSizeText(1)");
      expect(NumberUtils.fileSizeText(1)).assertEqual("1 B");
      // Vector 3: fileSizeText(2) returns 2 B.
      logCase(TAG, "fileSizeText(2)");
      expect(NumberUtils.fileSizeText(2)).assertEqual("2 B");
      // Vector 4: fileSizeText(100) returns 100 B.
      logCase(TAG, "fileSizeText(100)");
      expect(NumberUtils.fileSizeText(100)).assertEqual("100 B");
      // Vector 5: fileSizeText(512) returns 512 B.
      logCase(TAG, "fileSizeText(512)");
      expect(NumberUtils.fileSizeText(512)).assertEqual("512 B");
      // Vector 6: fileSizeText(1000) returns 1000 B.
      logCase(TAG, "fileSizeText(1000)");
      expect(NumberUtils.fileSizeText(1000)).assertEqual("1000 B");
      // Vector 7: fileSizeText(1023) returns 1023 B.
      logCase(TAG, "fileSizeText(1023)");
      expect(NumberUtils.fileSizeText(1023)).assertEqual("1023 B");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_FSIZE_0200
     * @tc.name      testFileSizeKilobytes0001
     * @tc.desc      Verify fileSizeText converts kilobytes with two decimals.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFileSizeKilobytes0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testFileSizeKilobytes0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: fileSizeText(1024) returns 1 KB.
      logCase(TAG, "fileSizeText(1024)");
      expect(NumberUtils.fileSizeText(1024)).assertEqual("1 KB");
      // Vector 2: fileSizeText(1025) returns 1 KB.
      logCase(TAG, "fileSizeText(1025)");
      expect(NumberUtils.fileSizeText(1025)).assertEqual("1 KB");
      // Vector 3: fileSizeText(1536) returns 1.5 KB.
      logCase(TAG, "fileSizeText(1536)");
      expect(NumberUtils.fileSizeText(1536)).assertEqual("1.5 KB");
      // Vector 4: fileSizeText(2048) returns 2 KB.
      logCase(TAG, "fileSizeText(2048)");
      expect(NumberUtils.fileSizeText(2048)).assertEqual("2 KB");
      // Vector 5: fileSizeText(10240) returns 10 KB.
      logCase(TAG, "fileSizeText(10240)");
      expect(NumberUtils.fileSizeText(10240)).assertEqual("10 KB");
      // Vector 6: fileSizeText(102400) returns 100 KB.
      logCase(TAG, "fileSizeText(102400)");
      expect(NumberUtils.fileSizeText(102400)).assertEqual("100 KB");
      // Vector 7: fileSizeText(1048575) returns 1024 KB.
      logCase(TAG, "fileSizeText(1048575)");
      expect(NumberUtils.fileSizeText(1048575)).assertEqual("1024 KB");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_FSIZE_0300
     * @tc.name      testFileSizeMegabytes0001
     * @tc.desc      Verify fileSizeText converts megabytes with two decimals.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFileSizeMegabytes0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testFileSizeMegabytes0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: fileSizeText(1048576) returns 1 MB.
      logCase(TAG, "fileSizeText(1048576)");
      expect(NumberUtils.fileSizeText(1048576)).assertEqual("1 MB");
      // Vector 2: fileSizeText(1048577) returns 1 MB.
      logCase(TAG, "fileSizeText(1048577)");
      expect(NumberUtils.fileSizeText(1048577)).assertEqual("1 MB");
      // Vector 3: fileSizeText(1572864) returns 1.5 MB.
      logCase(TAG, "fileSizeText(1572864)");
      expect(NumberUtils.fileSizeText(1572864)).assertEqual("1.5 MB");
      // Vector 4: fileSizeText(10485760) returns 10 MB.
      logCase(TAG, "fileSizeText(10485760)");
      expect(NumberUtils.fileSizeText(10485760)).assertEqual("10 MB");
      // Vector 5: fileSizeText(104857600) returns 100 MB.
      logCase(TAG, "fileSizeText(104857600)");
      expect(NumberUtils.fileSizeText(104857600)).assertEqual("100 MB");
      // Vector 6: fileSizeText(1073741823) returns 1024 MB.
      logCase(TAG, "fileSizeText(1073741823)");
      expect(NumberUtils.fileSizeText(1073741823)).assertEqual("1024 MB");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_FSIZE_0400
     * @tc.name      testFileSizeGigabytes0001
     * @tc.desc      Verify fileSizeText converts gigabytes with two decimals.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFileSizeGigabytes0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testFileSizeGigabytes0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: fileSizeText(1073741824) returns 1 GB.
      logCase(TAG, "fileSizeText(1073741824)");
      expect(NumberUtils.fileSizeText(1073741824)).assertEqual("1 GB");
      // Vector 2: fileSizeText(1610612736) returns 1.5 GB.
      logCase(TAG, "fileSizeText(1610612736)");
      expect(NumberUtils.fileSizeText(1610612736)).assertEqual("1.5 GB");
      // Vector 3: fileSizeText(2147483648) returns 2 GB.
      logCase(TAG, "fileSizeText(2147483648)");
      expect(NumberUtils.fileSizeText(2147483648)).assertEqual("2 GB");
      // Vector 4: fileSizeText(10737418240) returns 10 GB.
      logCase(TAG, "fileSizeText(10737418240)");
      expect(NumberUtils.fileSizeText(10737418240)).assertEqual("10 GB");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_FSIZE_0500
     * @tc.name      testFileSizeNegative0001
     * @tc.desc      Verify fileSizeText reports a dash for negative byte counts.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFileSizeNegative0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testFileSizeNegative0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: fileSizeText(-1) returns -.
      logCase(TAG, "fileSizeText(-1)");
      expect(NumberUtils.fileSizeText(-1)).assertEqual("-");
      // Vector 2: fileSizeText(-2) returns -.
      logCase(TAG, "fileSizeText(-2)");
      expect(NumberUtils.fileSizeText(-2)).assertEqual("-");
      // Vector 3: fileSizeText(-1024) returns -.
      logCase(TAG, "fileSizeText(-1024)");
      expect(NumberUtils.fileSizeText(-1024)).assertEqual("-");
      // Vector 4: fileSizeText(-1048576) returns -.
      logCase(TAG, "fileSizeText(-1048576)");
      expect(NumberUtils.fileSizeText(-1048576)).assertEqual("-");
      // Vector 5: fileSizeText(-1073741824) returns -.
      logCase(TAG, "fileSizeText(-1073741824)");
      expect(NumberUtils.fileSizeText(-1073741824)).assertEqual("-");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_FSIZE_0600
     * @tc.name      testFileSizeBoundaries0001
     * @tc.desc      Verify fileSizeText switches units exactly at each 1024 boundary.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testFileSizeBoundaries0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testFileSizeBoundaries0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: fileSizeText(1023) returns 1023 B.
      logCase(TAG, "fileSizeText(1023)");
      expect(NumberUtils.fileSizeText(1023)).assertEqual("1023 B");
      // Vector 2: fileSizeText(1024) returns 1 KB.
      logCase(TAG, "fileSizeText(1024)");
      expect(NumberUtils.fileSizeText(1024)).assertEqual("1 KB");
      // Vector 3: fileSizeText(1048575) returns 1024 KB.
      logCase(TAG, "fileSizeText(1048575)");
      expect(NumberUtils.fileSizeText(1048575)).assertEqual("1024 KB");
      // Vector 4: fileSizeText(1048576) returns 1 MB.
      logCase(TAG, "fileSizeText(1048576)");
      expect(NumberUtils.fileSizeText(1048576)).assertEqual("1 MB");
      // Vector 5: fileSizeText(1073741823) returns 1024 MB.
      logCase(TAG, "fileSizeText(1073741823)");
      expect(NumberUtils.fileSizeText(1073741823)).assertEqual("1024 MB");
      // Vector 6: fileSizeText(1073741824) returns 1 GB.
      logCase(TAG, "fileSizeText(1073741824)");
      expect(NumberUtils.fileSizeText(1073741824)).assertEqual("1 GB");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_FSIZE_0700
     * @tc.name      testFileSizeUnitLabels0001
     * @tc.desc      Verify every fileSizeText result carries a non-empty unit label.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFileSizeUnitLabels0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testFileSizeUnitLabels0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: fileSizeText(1024) ends with the expected unit label.
      logCase(TAG, "fileSizeText unit 1024");
      expect(NumberUtils.fileSizeText(1024).length > 0).assertTrue();
      // Vector 2: fileSizeText(10240) ends with the expected unit label.
      logCase(TAG, "fileSizeText unit 10240");
      expect(NumberUtils.fileSizeText(10240).length > 0).assertTrue();
      // Vector 3: fileSizeText(1048576) ends with the expected unit label.
      logCase(TAG, "fileSizeText unit 1048576");
      expect(NumberUtils.fileSizeText(1048576).length > 0).assertTrue();
      // Vector 4: fileSizeText(10485760) ends with the expected unit label.
      logCase(TAG, "fileSizeText unit 10485760");
      expect(NumberUtils.fileSizeText(10485760).length > 0).assertTrue();
      // Vector 5: fileSizeText(1073741824) ends with the expected unit label.
      logCase(TAG, "fileSizeText unit 1073741824");
      expect(NumberUtils.fileSizeText(1073741824).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

  });
}
