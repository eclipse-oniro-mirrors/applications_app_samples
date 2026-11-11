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
 
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import {
  buildDownloadContent,
  buildDownloadFileName,
  formatBytes,
  formatDateTime,
  formatDuration,
  formatPercent,
  formatTime,
  pad2,
  progressBucket,
  truncateMiddle
} from '../../../main/ets/utils/FormatUtil';

const FIXED_TIME: Date = new Date(2026, 0, 2, 3, 4, 5);

export default function formatUtilTest() {
  describe('formatUtilTest', () => {

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_FORMATUTIL_0100
     * @tc.name pad2RoundsTwoDigits001
     * @tc.desc Verify pad2 keeps two digits and prefixes single-digit values with zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('pad2_roundsTwoDigits', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(pad2(0)).assertEqual('00');
      expect(pad2(5)).assertEqual('05');
      expect(pad2(9)).assertEqual('09');
      expect(pad2(10)).assertEqual('10');
      expect(pad2(59)).assertEqual('59');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_FORMATUTIL_0200
     * @tc.name formatTimePadsFields002
     * @tc.desc Verify formatTime renders hours, minutes and seconds with two digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatTime_padsFields', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(formatTime(FIXED_TIME)).assertEqual('03:04:05');
      expect(formatTime(new Date(2026, 0, 2, 0, 0, 0))).assertEqual('00:00:00');
      expect(formatTime(new Date(2026, 0, 2, 23, 59, 59))).assertEqual('23:59:59');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_FORMATUTIL_0300
     * @tc.name formatDateTimeFullStamp003
     * @tc.desc Verify formatDateTime combines the date and the padded time
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatDateTime_fullStamp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(formatDateTime(FIXED_TIME)).assertEqual('2026-01-02 03:04:05');
      expect(formatDateTime(new Date(2026, 11, 31, 12, 0, 0))).assertEqual('2026-12-31 12:00:00');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_FORMATUTIL_0400
     * @tc.name formatDurationBoundaries004
     * @tc.desc Verify formatDuration switches units at the millisecond, second and minute boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatDuration_boundaries', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(formatDuration(-1)).assertEqual('0 ms');
      expect(formatDuration(0)).assertEqual('0 ms');
      expect(formatDuration(999)).assertEqual('999 ms');
      expect(formatDuration(1000)).assertEqual('1.0 s');
      expect(formatDuration(1500)).assertEqual('1.5 s');
      expect(formatDuration(60000)).assertEqual('1 min 0 s');
      expect(formatDuration(90000)).assertEqual('1 min 30 s');
      expect(formatDuration(3600000)).assertEqual('60 min 0 s');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_FORMATUTIL_0500
     * @tc.name formatBytesBoundaries005
     * @tc.desc Verify formatBytes switches between B, KB and MB at the 1024 boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatBytes_boundaries', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(formatBytes(0)).assertEqual('0 B');
      expect(formatBytes(1023)).assertEqual('1023 B');
      expect(formatBytes(1024)).assertEqual('1.0 KB');
      expect(formatBytes(1536)).assertEqual('1.5 KB');
      expect(formatBytes(1024 * 1024)).assertEqual('1.0 MB');
      expect(formatBytes(1024 * 1024 * 3 / 2)).assertEqual('1.5 MB');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_FORMATUTIL_0600
     * @tc.name formatPercentClamps006
     * @tc.desc Verify formatPercent rounds to integers, clamps to 0-100 and guards a zero total
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatPercent_clamps', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(formatPercent(0, 0)).assertEqual('0%');
      expect(formatPercent(50, 200)).assertEqual('25%');
      expect(formatPercent(1, 3)).assertEqual('33%');
      expect(formatPercent(-10, 100)).assertEqual('0%');
      expect(formatPercent(200, 100)).assertEqual('100%');
      expect(formatPercent(0, -5)).assertEqual('0%');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_FORMATUTIL_0700
     * @tc.name progressBucketBoundaries007
     * @tc.desc Verify progressBucket maps progress into five buckets and guards invalid values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('progressBucket_boundaries', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(progressBucket(0)).assertEqual(0);
      expect(progressBucket(-5)).assertEqual(0);
      expect(progressBucket(0.5)).assertEqual(0);
      expect(progressBucket(24)).assertEqual(0);
      expect(progressBucket(25)).assertEqual(1);
      expect(progressBucket(50)).assertEqual(2);
      expect(progressBucket(75)).assertEqual(3);
      expect(progressBucket(100)).assertEqual(4);
      expect(progressBucket(250)).assertEqual(4);
      expect(progressBucket(Number.NaN)).assertEqual(0);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_FORMATUTIL_0800
     * @tc.name truncateMiddleKeepsEnds008
     * @tc.desc Verify truncateMiddle keeps both ends and inserts an ellipsis in the middle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('truncateMiddle_keepsEnds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(truncateMiddle('abcdefghij', 6)).assertEqual('abc…ij');
      expect(truncateMiddle('abcdefgh', 7)).assertEqual('abc…fgh');
      expect(truncateMiddle('abcdefgh', 5)).assertEqual('ab…gh');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_FORMATUTIL_0900
     * @tc.name truncateMiddleShortInput009
     * @tc.desc Verify truncateMiddle returns the input unchanged for short text or tiny limits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('truncateMiddle_shortInput', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(truncateMiddle('abc', 3)).assertEqual('abc');
      expect(truncateMiddle('abcdef', 3)).assertEqual('abcdef');
      expect(truncateMiddle('', 10)).assertEqual('');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_FORMATUTIL_1000
     * @tc.name buildDownloadFileNameStampsDate010
     * @tc.desc Verify buildDownloadFileName produces the timestamped txt file name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildDownloadFileName_stampsDate', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(buildDownloadFileName(FIXED_TIME)).assertEqual('atomic-service-demo-20260102-030405.txt');
      expect(buildDownloadFileName(new Date(2026, 9, 27, 23, 59, 9)))
        .assertEqual('atomic-service-demo-20261027-235909.txt');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_FORMATUTIL_1100
     * @tc.name buildDownloadContentSections011
     * @tc.desc Verify buildDownloadContent joins the title, timestamp and notes into four lines
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildDownloadContent_sections', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const content = buildDownloadContent(FIXED_TIME);
      const lines = content.split('\n');
      expect(lines.length).assertEqual(4);
      expect(lines[0]).assertEqual('AtomicServiceComponents sample download file');
      expect(lines[1]).assertEqual('Generated at: 2026-01-02 03:04:05');
      expect(lines[2].indexOf('DownloadFileButton') >= 0).assertTrue();
      expect(lines[3].indexOf('sandbox') >= 0).assertTrue();
    });
  });
}
