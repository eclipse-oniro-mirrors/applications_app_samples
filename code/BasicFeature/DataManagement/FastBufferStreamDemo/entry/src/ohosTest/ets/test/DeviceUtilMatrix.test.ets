import { describe, it, expect } from '@ohos/hypium';
import { DeviceUtil } from '../../../main/ets/model/utils/DeviceUtil';

/**
 * DeviceUtil 断点矩阵测试
 *
 * 断点规则：sm < 600vp ≤ md < 840vp ≤ lg；双栏偏好 = 断点不为 sm。
 * 对边界宽度逐个成对断言断点与双栏偏好，避免两份判断逻辑分叉。
 */

export default function deviceUtilMatrixTest() {
  describe('deviceUtilMatrixTest', () => {
    /**
     * @tc.number SUB_FASTBUFFER_STREAM_DEVICEUTILMATRIX_0100
     * @tc.name breakpoint_zero
     * @tc.desc Verify a zero width falls into the sm breakpoint with single-column preference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('breakpoint_zero', 0, () => {
      expect(DeviceUtil.getBreakpoint(0)).assertEqual('sm');
      expect(DeviceUtil.preferTwoColumn(0)).assertFalse();
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_DEVICEUTILMATRIX_0200
     * @tc.name breakpoint_phone_320
     * @tc.desc Verify a three-hundred-twenty viewport width stays in the sm breakpoint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('breakpoint_phone_320', 0, () => {
      expect(DeviceUtil.getBreakpoint(320)).assertEqual('sm');
      expect(DeviceUtil.preferTwoColumn(320)).assertFalse();
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_DEVICEUTILMATRIX_0300
     * @tc.name breakpoint_below_md
     * @tc.desc Verify five hundred ninety-nine is the last width classified as sm
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('breakpoint_below_md', 0, () => {
      expect(DeviceUtil.getBreakpoint(599)).assertEqual('sm');
      expect(DeviceUtil.preferTwoColumn(599)).assertFalse();
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_DEVICEUTILMATRIX_0400
     * @tc.name breakpoint_md_lower_bound
     * @tc.desc Verify six hundred is the first width classified as md and switches to two columns
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('breakpoint_md_lower_bound', 0, () => {
      expect(DeviceUtil.getBreakpoint(600)).assertEqual('md');
      expect(DeviceUtil.preferTwoColumn(600)).assertTrue();
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_DEVICEUTILMATRIX_0500
     * @tc.name breakpoint_tablet_720
     * @tc.desc Verify a seven-hundred-twenty viewport width classifies as md with two columns
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('breakpoint_tablet_720', 0, () => {
      expect(DeviceUtil.getBreakpoint(720)).assertEqual('md');
      expect(DeviceUtil.preferTwoColumn(720)).assertTrue();
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_DEVICEUTILMATRIX_0600
     * @tc.name breakpoint_below_lg
     * @tc.desc Verify eight hundred thirty-nine is the last width classified as md
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('breakpoint_below_lg', 0, () => {
      expect(DeviceUtil.getBreakpoint(839)).assertEqual('md');
      expect(DeviceUtil.preferTwoColumn(839)).assertTrue();
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_DEVICEUTILMATRIX_0700
     * @tc.name breakpoint_lg_lower_bound
     * @tc.desc Verify eight hundred forty is the first width classified as lg
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('breakpoint_lg_lower_bound', 0, () => {
      expect(DeviceUtil.getBreakpoint(840)).assertEqual('lg');
      expect(DeviceUtil.preferTwoColumn(840)).assertTrue();
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_DEVICEUTILMATRIX_0800
     * @tc.name breakpoint_desktop_1280
     * @tc.desc Verify a twelve-hundred-eighty viewport width classifies as lg with two columns
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('breakpoint_desktop_1280', 0, () => {
      expect(DeviceUtil.getBreakpoint(1280)).assertEqual('lg');
      expect(DeviceUtil.preferTwoColumn(1280)).assertTrue();
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_DEVICEUTILMATRIX_0900
     * @tc.name two_column_turns_on_between_599_and_600
     * @tc.desc Verify two-column preference flips exactly at the md threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('two_column_turns_on_between_599_and_600', 0, () => {
      expect(DeviceUtil.preferTwoColumn(599)).assertFalse();
      expect(DeviceUtil.preferTwoColumn(600)).assertTrue();
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_DEVICEUTILMATRIX_1000
     * @tc.name breakpoint_is_monotonic
     * @tc.desc Verify increasing widths never downgrade the breakpoint from sm to md to lg
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('breakpoint_is_monotonic', 0, () => {
      expect(DeviceUtil.getBreakpoint(100)).assertEqual('sm');
      expect(DeviceUtil.getBreakpoint(700)).assertEqual('md');
      expect(DeviceUtil.getBreakpoint(900)).assertEqual('lg');
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_DEVICEUTILMATRIX_1100
     * @tc.name wide_screen_flag_is_boolean
     * @tc.desc Verify isWideScreen always returns a boolean value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('wide_screen_flag_is_boolean', 0, () => {
      expect(typeof DeviceUtil.isWideScreen() === 'boolean').assertTrue();
    });
  });
}
