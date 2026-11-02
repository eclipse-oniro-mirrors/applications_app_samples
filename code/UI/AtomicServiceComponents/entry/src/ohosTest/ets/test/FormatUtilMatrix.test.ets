import { describe, it, expect } from '@ohos/hypium';
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

export default function formatUtilMatrixTest() {
  describe('formatUtilMatrixTest', () => {

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_FORMATUTILMATRIX_0100
     * @tc.name pad2Zero010
     * @tc.desc Verify pad2 renders zero as two digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('pad2_zero', 0, () => {
      expect(pad2(0)).assertEqual('00');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_FORMATUTILMATRIX_0200
     * @tc.name pad2SingleDigit020
     * @tc.desc Verify pad2 prefixes a single-digit value with zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('pad2_singleDigit', 0, () => {
      expect(pad2(5)).assertEqual('05');
      expect(pad2(9)).assertEqual('09');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_FORMATUTILMATRIX_0300
     * @tc.name pad2TwoDigits030
     * @tc.desc Verify pad2 leaves a two-digit value unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('pad2_twoDigits', 0, () => {
      expect(pad2(10)).assertEqual('10');
      expect(pad2(42)).assertEqual('42');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_FORMATUTILMATRIX_0400
     * @tc.name pad2WideValue040
     * @tc.desc Verify pad2 does not truncate a value with more than two digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('pad2_wideValue', 0, () => {
      expect(pad2(100)).assertEqual('100');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_FORMATUTILMATRIX_0500
     * @tc.name formatTimeMidnight050
     * @tc.desc Verify formatTime renders midnight as 00:00:00
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatTime_midnight', 0, () => {
      expect(formatTime(new Date(2026, 0, 2, 0, 0, 0))).assertEqual('00:00:00');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_FORMATUTILMATRIX_0600
     * @tc.name formatTimeMorning060
     * @tc.desc Verify formatTime pads every field of a morning timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatTime_morning', 0, () => {
      expect(formatTime(new Date(2026, 0, 2, 9, 8, 7))).assertEqual('09:08:07');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_FORMATUTILMATRIX_0700
     * @tc.name formatTimeLateNight070
     * @tc.desc Verify formatTime renders the last second of the day
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatTime_lateNight', 0, () => {
      expect(formatTime(new Date(2026, 0, 2, 23, 59, 59))).assertEqual('23:59:59');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_FORMATUTILMATRIX_0800
     * @tc.name formatDateTimeJanuary080
     * @tc.desc Verify formatDateTime renders a single-digit month and day with zero padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatDateTime_january', 0, () => {
      expect(formatDateTime(new Date(2026, 0, 2, 3, 4, 5))).assertEqual('2026-01-02 03:04:05');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_FORMATUTILMATRIX_0900
     * @tc.name formatDateTimeDecember090
     * @tc.desc Verify formatDateTime renders the last second of the year
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatDateTime_december', 0, () => {
      expect(formatDateTime(new Date(2026, 11, 31, 23, 59, 59))).assertEqual('2026-12-31 23:59:59');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_FORMATUTILMATRIX_1000
     * @tc.name formatDateTimeLeapDay100
     * @tc.desc Verify formatDateTime renders a leap day without shifting the month
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatDateTime_leapDay', 0, () => {
      expect(formatDateTime(new Date(2024, 1, 29, 12, 34, 56))).assertEqual('2024-02-29 12:34:56');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_FORMATUTILMATRIX_1100
     * @tc.name formatDurationNegative110
     * @tc.desc Verify a negative duration collapses to zero milliseconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatDuration_negative', 0, () => {
      expect(formatDuration(-100)).assertEqual('0 ms');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_FORMATUTILMATRIX_1200
     * @tc.name formatDurationZero120
     * @tc.desc Verify a zero duration renders as zero milliseconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatDuration_zero', 0, () => {
      expect(formatDuration(0)).assertEqual('0 ms');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_FORMATUTILMATRIX_1300
     * @tc.name formatDurationSubSecond130
     * @tc.desc Verify a sub-second duration stays in milliseconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatDuration_subSecond', 0, () => {
      expect(formatDuration(999)).assertEqual('999 ms');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_FORMATUTILMATRIX_1400
     * @tc.name formatDurationOneSecond140
     * @tc.desc Verify exactly one second switches to the seconds unit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatDuration_oneSecond', 0, () => {
      expect(formatDuration(1000)).assertEqual('1.0 s');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_FORMATUTILMATRIX_1500
     * @tc.name formatDurationFraction150
     * @tc.desc Verify a fractional second keeps one decimal place
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatDuration_fraction', 0, () => {
      expect(formatDuration(1500)).assertEqual('1.5 s');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_FORMATUTILMATRIX_1600
     * @tc.name formatDurationRoundUp160
     * @tc.desc Verify a duration just below one minute rounds up to 60.0 s still in seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatDuration_roundUp', 0, () => {
      expect(formatDuration(59999)).assertEqual('60.0 s');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_FORMATUTILMATRIX_1700
     * @tc.name formatDurationOneMinute170
     * @tc.desc Verify exactly one minute switches to the minutes and seconds format
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatDuration_oneMinute', 0, () => {
      expect(formatDuration(60000)).assertEqual('1 min 0 s');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_FORMATUTILMATRIX_1800
     * @tc.name formatDurationNinetySeconds180
     * @tc.desc Verify a minute and a half renders as one minute thirty seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatDuration_ninetySeconds', 0, () => {
      expect(formatDuration(90000)).assertEqual('1 min 30 s');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_FORMATUTILMATRIX_1900
     * @tc.name formatDurationOneHour190
     * @tc.desc Verify one hour keeps counting minutes instead of introducing an hour unit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatDuration_oneHour', 0, () => {
      expect(formatDuration(3600000)).assertEqual('60 min 0 s');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_FORMATUTILMATRIX_2000
     * @tc.name formatBytesZero200
     * @tc.desc Verify zero bytes render as 0 B
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatBytes_zero', 0, () => {
      expect(formatBytes(0)).assertEqual('0 B');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_FORMATUTILMATRIX_2100
     * @tc.name formatBytesBelowKb210
     * @tc.desc Verify 1023 bytes stay in bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatBytes_belowKb', 0, () => {
      expect(formatBytes(1023)).assertEqual('1023 B');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_FORMATUTILMATRIX_2200
     * @tc.name formatBytesOneKb220
     * @tc.desc Verify 1024 bytes switch to one kilobyte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatBytes_oneKb', 0, () => {
      expect(formatBytes(1024)).assertEqual('1.0 KB');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_FORMATUTILMATRIX_2300
     * @tc.name formatBytesFractionalKb230
     * @tc.desc Verify 1536 bytes render as one and a half kilobytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatBytes_fractionalKb', 0, () => {
      expect(formatBytes(1536)).assertEqual('1.5 KB');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_FORMATUTILMATRIX_2400
     * @tc.name formatBytesBelowMb240
     * @tc.desc Verify one byte below a megabyte stays in the kilobyte unit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatBytes_belowMb', 0, () => {
      expect(formatBytes(1024 * 1024 - 1)).assertEqual('1024.0 KB');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_FORMATUTILMATRIX_2500
     * @tc.name formatBytesOneMb250
     * @tc.desc Verify 1024 kilobytes switch to one megabyte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatBytes_oneMb', 0, () => {
      expect(formatBytes(1024 * 1024)).assertEqual('1.0 MB');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_FORMATUTILMATRIX_2600
     * @tc.name formatBytesFractionalMb260
     * @tc.desc Verify one and a half megabytes keep one decimal place
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatBytes_fractionalMb', 0, () => {
      expect(formatBytes(1024 * 1024 * 3 / 2)).assertEqual('1.5 MB');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_FORMATUTILMATRIX_2700
     * @tc.name formatPercentZeroTotal270
     * @tc.desc Verify a zero total yields 0% instead of dividing by zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatPercent_zeroTotal', 0, () => {
      expect(formatPercent(0, 0)).assertEqual('0%');
      expect(formatPercent(50, 0)).assertEqual('0%');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_FORMATUTILMATRIX_2800
     * @tc.name formatPercentQuarter280
     * @tc.desc Verify one quarter of a total renders as 25%
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatPercent_quarter', 0, () => {
      expect(formatPercent(50, 200)).assertEqual('25%');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_FORMATUTILMATRIX_2900
     * @tc.name formatPercentRounds290
     * @tc.desc Verify a repeating percentage is rounded to the nearest integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatPercent_rounds', 0, () => {
      expect(formatPercent(1, 3)).assertEqual('33%');
      expect(formatPercent(3, 8)).assertEqual('38%');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_FORMATUTILMATRIX_3000
     * @tc.name formatPercentClampLow300
     * @tc.desc Verify a negative value clamps to 0%
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatPercent_clampLow', 0, () => {
      expect(formatPercent(-10, 100)).assertEqual('0%');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_FORMATUTILMATRIX_3100
     * @tc.name formatPercentClampHigh310
     * @tc.desc Verify a value above the total clamps to 100%
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatPercent_clampHigh', 0, () => {
      expect(formatPercent(200, 100)).assertEqual('100%');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_FORMATUTILMATRIX_3200
     * @tc.name formatPercentNegativeTotal320
     * @tc.desc Verify a negative total yields 0%
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatPercent_negativeTotal', 0, () => {
      expect(formatPercent(10, -5)).assertEqual('0%');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_FORMATUTILMATRIX_3300
     * @tc.name progressBucketNegative330
     * @tc.desc Verify a negative progress maps to bucket zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('progressBucket_negative', 0, () => {
      expect(progressBucket(-1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_FORMATUTILMATRIX_3400
     * @tc.name progressBucketZero340
     * @tc.desc Verify zero progress maps to bucket zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('progressBucket_zero', 0, () => {
      expect(progressBucket(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_FORMATUTILMATRIX_3500
     * @tc.name progressBucketJustBelowFirst350
     * @tc.desc Verify progress below 25 still maps to bucket zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('progressBucket_belowFirst', 0, () => {
      expect(progressBucket(24.9)).assertEqual(0);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_FORMATUTILMATRIX_3600
     * @tc.name progressBucketFirstBoundary360
     * @tc.desc Verify 25 progress enters the first bucket
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('progressBucket_firstBoundary', 0, () => {
      expect(progressBucket(25)).assertEqual(1);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_FORMATUTILMATRIX_3700
     * @tc.name progressBucketThirdBoundary370
     * @tc.desc Verify 75 progress enters the third bucket
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('progressBucket_thirdBoundary', 0, () => {
      expect(progressBucket(75)).assertEqual(3);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_FORMATUTILMATRIX_3800
     * @tc.name progressBucketFull380
     * @tc.desc Verify 100 progress reaches the last bucket
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('progressBucket_full', 0, () => {
      expect(progressBucket(100)).assertEqual(4);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_FORMATUTILMATRIX_3900
     * @tc.name progressBucketOverflow390
     * @tc.desc Verify progress above 100 stays clamped to the last bucket
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('progressBucket_overflow', 0, () => {
      expect(progressBucket(250)).assertEqual(4);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_FORMATUTILMATRIX_4000
     * @tc.name progressBucketNan400
     * @tc.desc Verify a NaN progress maps to bucket zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('progressBucket_nan', 0, () => {
      expect(progressBucket(Number.NaN)).assertEqual(0);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_FORMATUTILMATRIX_4100
     * @tc.name truncateMiddleTenToSix410
     * @tc.desc Verify truncating a ten-character text to six keeps three characters on both ends
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('truncateMiddle_tenToSix', 0, () => {
      expect(truncateMiddle('abcdefghij', 6)).assertEqual('abc…ij');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_FORMATUTILMATRIX_4200
     * @tc.name truncateMiddleEightToSeven420
     * @tc.desc Verify truncating an eight-character text to seven keeps three characters on both ends
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('truncateMiddle_eightToSeven', 0, () => {
      expect(truncateMiddle('abcdefgh', 7)).assertEqual('abc…fgh');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_FORMATUTILMATRIX_4300
     * @tc.name truncateMiddleEightToFive430
     * @tc.desc Verify truncating to five keeps two characters on both ends
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('truncateMiddle_eightToFive', 0, () => {
      expect(truncateMiddle('abcdefgh', 5)).assertEqual('ab…gh');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_FORMATUTILMATRIX_4400
     * @tc.name truncateMiddleOddKeep440
     * @tc.desc Verify an odd remainder gives the head the extra character before the ellipsis
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('truncateMiddle_oddKeep', 0, () => {
      expect(truncateMiddle('abcdefgh', 4)).assertEqual('ab…h');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_FORMATUTILMATRIX_4500
     * @tc.name truncateMiddleTinyLimit450
     * @tc.desc Verify a limit of three or less leaves the text unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('truncateMiddle_tinyLimit', 0, () => {
      expect(truncateMiddle('abcdef', 3)).assertEqual('abcdef');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_FORMATUTILMATRIX_4600
     * @tc.name downloadFileNameMarch460
     * @tc.desc Verify the download file name encodes the padded month, day and time
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('downloadFileName_march', 0, () => {
      expect(buildDownloadFileName(new Date(2026, 2, 4, 5, 6, 7)))
        .assertEqual('atomic-service-demo-20260304-050607.txt');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_FORMATUTILMATRIX_4700
     * @tc.name downloadFileNameLateNight470
     * @tc.desc Verify the file name keeps the full timestamp near midnight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('downloadFileName_lateNight', 0, () => {
      expect(buildDownloadFileName(new Date(2026, 9, 27, 23, 59, 9)))
        .assertEqual('atomic-service-demo-20261027-235909.txt');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_FORMATUTILMATRIX_4800
     * @tc.name downloadContentLineCount480
     * @tc.desc Verify the download content is a four-line document with the expected title
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('downloadContent_lineCount', 0, () => {
      const lines = buildDownloadContent(new Date(2026, 0, 2, 3, 4, 5)).split('\n');
      expect(lines.length).assertEqual(4);
      expect(lines[0]).assertEqual('AtomicServiceComponents 示例下载文件');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_FORMATUTILMATRIX_4900
     * @tc.name downloadContentTimestamp490
     * @tc.desc Verify the download content embeds the formatted generation timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('downloadContent_timestamp', 0, () => {
      const content = buildDownloadContent(new Date(2026, 0, 2, 3, 4, 5));
      expect(content.includes('生成时间：2026-01-02 03:04:05')).assertTrue();
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_FORMATUTILMATRIX_5000
     * @tc.name downloadContentNotes500
     * @tc.desc Verify the download content mentions the component and the sandbox fallback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('downloadContent_notes', 0, () => {
      const content = buildDownloadContent(new Date(2026, 0, 2, 3, 4, 5));
      expect(content.includes('DownloadFileButton')).assertTrue();
      expect(content.includes('沙箱')).assertTrue();
    });
  });
}
