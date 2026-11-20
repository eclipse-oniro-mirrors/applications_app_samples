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
// Import the DateUtils helpers under test from the library HAR package.
import { DateUtils } from 'library';

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

// Registers every matrix case of the DateDurationMatrixSuite suite.
export default function dateDurationMatrixTest() {
  // Group the cases under the "DateDurationMatrixSuite" describe block.
  describe('DateDurationMatrixSuite', () => {
    // Log the suite start marker before the first case runs.
    beforeAll(async () => {
      // Print the suite begin line into hilog.
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', BUNDLE + 'DateDurationMatrixSuite, begin');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_DATEDUR_0100
     * @tc.name      testDateDurationSeconds0001
     * @tc.desc      Verify durationText composes the human readable duration form.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateDurationSeconds0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDateDurationSeconds0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: durationText(0) returns 0s.
      logCase(TAG, "durationText(0)");
      expect(DateUtils.durationText(0)).assertEqual("0s");
      // Vector 2: durationText(1) returns 0s.
      logCase(TAG, "durationText(1)");
      expect(DateUtils.durationText(1)).assertEqual("0s");
      // Vector 3: durationText(30) returns 0s.
      logCase(TAG, "durationText(30)");
      expect(DateUtils.durationText(30)).assertEqual("0s");
      // Vector 4: durationText(59) returns 0s.
      logCase(TAG, "durationText(59)");
      expect(DateUtils.durationText(59)).assertEqual("0s");
      // Vector 5: durationText(1000) returns 1s.
      logCase(TAG, "durationText(1000)");
      expect(DateUtils.durationText(1000)).assertEqual("1s");
      // Vector 6: durationText(59000) returns 59s.
      logCase(TAG, "durationText(59000)");
      expect(DateUtils.durationText(59000)).assertEqual("59s");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_DATEDUR_0200
     * @tc.name      testDateDurationMinutes0001
     * @tc.desc      Verify durationText composes the human readable duration form.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateDurationMinutes0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDateDurationMinutes0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: durationText(60000) returns 1m 0s.
      logCase(TAG, "durationText(60000)");
      expect(DateUtils.durationText(60000)).assertEqual("1m 0s");
      // Vector 2: durationText(61000) returns 1m 1s.
      logCase(TAG, "durationText(61000)");
      expect(DateUtils.durationText(61000)).assertEqual("1m 1s");
      // Vector 3: durationText(119000) returns 1m 59s.
      logCase(TAG, "durationText(119000)");
      expect(DateUtils.durationText(119000)).assertEqual("1m 59s");
      // Vector 4: durationText(3599000) returns 59m 59s.
      logCase(TAG, "durationText(3599000)");
      expect(DateUtils.durationText(3599000)).assertEqual("59m 59s");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_DATEDUR_0300
     * @tc.name      testDateDurationHours0001
     * @tc.desc      Verify durationText composes the human readable duration form.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateDurationHours0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDateDurationHours0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: durationText(3600000) returns 1h 0m 0s.
      logCase(TAG, "durationText(3600000)");
      expect(DateUtils.durationText(3600000)).assertEqual("1h 0m 0s");
      // Vector 2: durationText(3661000) returns 1h 1m 1s.
      logCase(TAG, "durationText(3661000)");
      expect(DateUtils.durationText(3661000)).assertEqual("1h 1m 1s");
      // Vector 3: durationText(7200000) returns 2h 0m 0s.
      logCase(TAG, "durationText(7200000)");
      expect(DateUtils.durationText(7200000)).assertEqual("2h 0m 0s");
      // Vector 4: durationText(86399000) returns 23h 59m 59s.
      logCase(TAG, "durationText(86399000)");
      expect(DateUtils.durationText(86399000)).assertEqual("23h 59m 59s");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_DATEDUR_0400
     * @tc.name      testDateDurationDays0001
     * @tc.desc      Verify durationText composes the human readable duration form.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateDurationDays0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDateDurationDays0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: durationText(86400000) returns 24h 0m 0s.
      logCase(TAG, "durationText(86400000)");
      expect(DateUtils.durationText(86400000)).assertEqual("24h 0m 0s");
      // Vector 2: durationText(90061000) returns 25h 1m 1s.
      logCase(TAG, "durationText(90061000)");
      expect(DateUtils.durationText(90061000)).assertEqual("25h 1m 1s");
      // Vector 3: durationText(172800000) returns 48h 0m 0s.
      logCase(TAG, "durationText(172800000)");
      expect(DateUtils.durationText(172800000)).assertEqual("48h 0m 0s");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

  });
}
