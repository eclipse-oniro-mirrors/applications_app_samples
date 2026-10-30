// FormatUtil 单测：时间/时长/字节/百分比格式化、中间截断、下载文件名与内容、Web 进度分档。
// 这些格式化函数被日志面板、下载演示页与 Web 演示页直接复用，边界值（0、阈值前后一位）必须稳定。

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
} from '../main/ets/utils/FormatUtil';

export default function formatUtilTest() {
  describe('FormatUtilTest', () => {
    // pad2：两位补零的四个区间——个位数补 0、十位数原样、两位上界不变、三位数不截断
    it('pad2_boundary', 0, () => {
      expect(pad2(0)).assertEqual('00');
      expect(pad2(9)).assertEqual('09');
      expect(pad2(10)).assertEqual('10');
      expect(pad2(59)).assertEqual('59');
      expect(pad2(99)).assertEqual('99');
      expect(pad2(100)).assertEqual('100');
    });

    // formatTime：时分秒逐级补零，覆盖零点与深夜两个极端时刻
    it('formatTime_pads', 0, () => {
      expect(formatTime(new Date(2026, 0, 2, 3, 4, 5))).assertEqual('03:04:05');
      expect(formatTime(new Date(2026, 0, 2, 0, 0, 0))).assertEqual('00:00:00');
      expect(formatTime(new Date(2026, 9, 27, 23, 59, 58))).assertEqual('23:59:58');
    });

    // formatDateTime：日期 + 时间完整拼接、逐位补零，且时间部分与 formatTime 输出严格一致、总长固定 19 字符
    it('formatDateTime_full', 0, () => {
      const date = new Date(2026, 9, 27, 8, 9, 10);
      expect(formatDateTime(date)).assertEqual('2026-10-27 08:09:10');
      expect(formatDateTime(new Date(2026, 0, 1, 0, 0, 0))).assertEqual('2026-01-01 00:00:00');
      expect(formatDateTime(date).endsWith(formatTime(date))).assertTrue();
      expect(formatDateTime(date).length).assertEqual(19);
    });

    // formatDuration：四档单位——负数与 0 归零、毫秒原样、秒（一位小数）、分钟+秒
    it('formatDuration_units', 0, () => {
      expect(formatDuration(-5)).assertEqual('0 ms');
      expect(formatDuration(0)).assertEqual('0 ms');
      expect(formatDuration(500)).assertEqual('500 ms');
      expect(formatDuration(1500)).assertEqual('1.5 s');
      expect(formatDuration(6000)).assertEqual('6.0 s');
      expect(formatDuration(65000)).assertEqual('1 min 5 s');
    });

    // formatDuration：单位换算的精确边界——999/1000、59999/60000、整小时（60 min）、61 min 1 s 的取整规则
    it('formatDuration_exactMinuteBoundary', 0, () => {
      expect(formatDuration(999)).assertEqual('999 ms');
      expect(formatDuration(1000)).assertEqual('1.0 s');
      expect(formatDuration(59999)).assertEqual('60.0 s');
      expect(formatDuration(60000)).assertEqual('1 min 0 s');
      expect(formatDuration(60001)).assertEqual('1 min 0 s');
      expect(formatDuration(119999)).assertEqual('1 min 59 s');
      expect(formatDuration(3600000)).assertEqual('60 min 0 s');
      expect(formatDuration(3661000)).assertEqual('61 min 1 s');
    });

    // formatBytes：四档单位——0、单字节、KB（一位小数）、MB（一位小数）
    it('formatBytes_units', 0, () => {
      expect(formatBytes(0)).assertEqual('0 B');
      expect(formatBytes(1)).assertEqual('1 B');
      expect(formatBytes(512)).assertEqual('512 B');
      expect(formatBytes(1536)).assertEqual('1.5 KB');
      expect(formatBytes(2 * 1024 * 1024)).assertEqual('2.0 MB');
    });

    // formatBytes：1024 与 1MB 阈值前后一位，确认没有 off-by-one
    it('formatBytes_boundaries', 0, () => {
      expect(formatBytes(1023)).assertEqual('1023 B');
      expect(formatBytes(1024)).assertEqual('1.0 KB');
      expect(formatBytes(1048575)).assertEqual('1024.0 KB');
      expect(formatBytes(1048576)).assertEqual('1.0 MB');
      expect(formatBytes(1048577)).assertEqual('1.0 MB');
    });

    // formatPercent：总数为 0 或负数直接返回 0%；正常值四舍五入到整数（1/3→33、2/3→67）；超 100% 截断
    it('formatPercent_zeroTotalAndClamp', 0, () => {
      expect(formatPercent(1, 0)).assertEqual('0%');
      expect(formatPercent(1, -5)).assertEqual('0%');
      expect(formatPercent(0, 100)).assertEqual('0%');
      expect(formatPercent(-10, 100)).assertEqual('0%');
      expect(formatPercent(1, 3)).assertEqual('33%');
      expect(formatPercent(2, 3)).assertEqual('67%');
      expect(formatPercent(150, 200)).assertEqual('75%');
      expect(formatPercent(300, 200)).assertEqual('100%');
    });

    // truncateMiddle：中间省略号保留首尾；字符串不超长或长度已到下限时原样返回
    it('truncateMiddle_keepsEnds', 0, () => {
      expect(truncateMiddle('abcdefghij', 5)).assertEqual('ab…ij');
      expect(truncateMiddle('abcdefgh', 6)).assertEqual('abc…gh');
      expect(truncateMiddle('abc', 10)).assertEqual('abc');
      expect(truncateMiddle('abcdefghij', 3)).assertEqual('abcdefghij');
    });

    // truncateMiddle：恰好等于上限不截断、空串安全、maxLength≤3 的守卫分支、省略号占 1 个字符位
    it('truncateMiddle_exactMax', 0, () => {
      expect(truncateMiddle('abc', 3)).assertEqual('abc');
      expect(truncateMiddle('abcd', 4)).assertEqual('abcd');
      expect(truncateMiddle('abcde', 4)).assertEqual('ab…e');
      expect(truncateMiddle('', 5)).assertEqual('');
      expect(truncateMiddle('abcdef', 4)).assertEqual('ab…f');
      expect(truncateMiddle('abcdef', 2)).assertEqual('abcdef');
      expect(truncateMiddle('abcdef', 0)).assertEqual('abcdef');
    });

    // 下载文件名与内容：文件名按时间戳拼接；正文固定 4 行、包含组件名/完整时间/保存方式说明
    it('fileNameAndContent_timestamp', 0, () => {
      const date = new Date(2026, 9, 27, 8, 9, 10);
      expect(buildDownloadFileName(date)).assertEqual('atomic-service-demo-20261027-080910.txt');
      const content = buildDownloadContent(date);
      expect(content.includes('DownloadFileButton')).assertTrue();
      expect(content.includes('2026-10-27 08:09:10')).assertTrue();
      expect(content.includes('DocumentViewPicker')).assertTrue();
      expect(content.includes('应用沙箱')).assertTrue();
      expect(content.split('\n').length).assertEqual(4);
    });

    // progressBucket：25% 一档共 5 档（0/25/50/75/100），Web 页靠它避免进度回调刷屏；小数进度落在 0 档
    it('progressBucket_steps', 0, () => {
      expect(progressBucket(0)).assertEqual(0);
      expect(progressBucket(0.5)).assertEqual(0);
      expect(progressBucket(10)).assertEqual(0);
      expect(progressBucket(24)).assertEqual(0);
      expect(progressBucket(25)).assertEqual(1);
      expect(progressBucket(49)).assertEqual(1);
      expect(progressBucket(50)).assertEqual(2);
      expect(progressBucket(74)).assertEqual(2);
      expect(progressBucket(75)).assertEqual(3);
      expect(progressBucket(99)).assertEqual(3);
      expect(progressBucket(100)).assertEqual(4);
    });

    // progressBucket：越界与非法输入——负数、超 100、NaN 都归 0 档（NaN 不大于 0 被守卫拦截）
    it('progressBucket_clampsOutOfRange', 0, () => {
      expect(progressBucket(-5)).assertEqual(0);
      expect(progressBucket(120)).assertEqual(4);
      expect(progressBucket(1000)).assertEqual(4);
      expect(progressBucket(Number.NaN)).assertEqual(0);
    });
  });
}
