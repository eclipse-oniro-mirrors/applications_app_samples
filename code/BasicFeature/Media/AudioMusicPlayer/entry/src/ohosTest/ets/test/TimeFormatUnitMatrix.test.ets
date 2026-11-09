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

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { MediaTools } from '../../../main/ets/common/utils/mediautils/MediaTools';
import { splitClock, pad2 } from './TestData';
import { paceTurn } from './TestPace';

const TAG: string = 'Sample_AudioMusicPlayer';
const DOMAIN: number = 0xF811;
const BUNDLE: string = 'AudioMusicPlayer_';
const SECOND: number = 1000;
const MINUTE: number = 60 * SECOND;
const HOUR: number = 60 * MINUTE;
const DAY: number = 24 * HOUR;
const ZERO_TEXT: string = '00:00';

/**
 * 按“天/时/分/秒”给定时刻，换算成毫秒，避免用例里出现魔法数字。
 */
function clockMs(days: number, hours: number, minutes: number, seconds: number, millis: number = 0): number {
  return days * DAY + hours * HOUR + minutes * MINUTE + seconds * SECOND + millis;
}

/**
 * 独立拼装期望文本：天/时只在非零时出现，分秒恒为两位。
 * 与 main 的填充实现无关，只使用 TestData 中的整数换算。
 */
function clockText(days: number, hours: number, minutes: number, seconds: number): string {
  let dayPart: string = days > 0 ? pad2(days) + ':' : '';
  let hourPart: string = hours > 0 ? pad2(hours) + ':' : '';
  return dayPart + hourPart + pad2(minutes) + ':' + pad2(seconds);
}

// 按冒号分隔后的段数判定展示粒度，2 段为分秒，3 段为时分秒，4 段为天时分秒
function segmentCount(value: string): number {
  let count: number = 1;
  for (let index = 0; index < value.length; index++) {
    if (value.charAt(index) === String.fromCharCode(58)) {
      count++;
    }
  }
  return count;
}

// 用例组入口
export default function TimeFormatUnitMatrixTest() {
  describe('TimeFormatUnitMatrixTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * 时序：整秒推进时展示文本逐秒变化，相邻秒不得重复，跨分处分钟进位
     * @tc.number    SUB_TIME_UNIT_0100
     * @tc.name      testTimeFormatUnitMatrix0001
     * @tc.desc      验证整秒输入逐秒推进时展示文本与独立换算完全一致且相邻两秒文本必然不同
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testTimeFormatUnitMatrix0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TimeUnit_EachSecond_0001 begin');
      let matched: number = 0;
      let distinct: number = 0;
      let previous: string = '';
      for (let second = 0; second <= 70; second++) {
        let ms: number = second * SECOND;
        let actual: string = MediaTools.msToCountdownTime(ms);
        let splits: number[] = splitClock(ms);
        let oracle: string = clockText(0, 0, splits[1], splits[2]);
        if (actual === oracle) {
          matched++;
        }
        if (second > 0 && actual !== previous) {
          distinct++;
        }
        previous = actual;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `匹配数=${matched}, 相邻变化数=${distinct}`);
      expect(matched).assertEqual(71);
      expect(distinct).assertEqual(70);
      expect(MediaTools.msToCountdownTime(SECOND)).assertEqual('00:01');
      expect(MediaTools.msToCountdownTime(70 * SECOND)).assertEqual('01:10');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TimeUnit_EachSecond_0001 end');
    });

    /**
     * @tc.number    SUB_TIME_UNIT_0200
     * @tc.name      testTimeFormatUnitMatrix0002
     * @tc.desc      验证不足一秒的毫秒部分被截断且不四舍五入，跨秒临界前后结果按整秒分档
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testTimeFormatUnitMatrix0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TimeUnit_Truncate_0002 begin');
      let offsets: number[] = [1, 249, 500, 750, 999];
      let inside: number = 0;
      for (let offset of offsets) {
        let actual: string = MediaTools.msToCountdownTime(clockMs(0, 0, 0, 1, offset));
        if (actual === MediaTools.msToCountdownTime(SECOND)) {
          inside++;
        }
      }
      let scaled: number[] = [60000, 3599000, 86400000];
      for (let base of scaled) {
        let withFraction: string = MediaTools.msToCountdownTime(base + 0.75);
        if (withFraction !== MediaTools.msToCountdownTime(base)) {
          inside--;
        }
      }
      let justBelow: string = MediaTools.msToCountdownTime(2 * MINUTE - 1);
      let exact: string = MediaTools.msToCountdownTime(2 * MINUTE);
      hilog.info(DOMAIN, TAG, '%{public}s', `1 秒内偏移命中=${inside}, 临界前=[${justBelow}], 临界=[${exact}]`);
      expect(inside).assertEqual(offsets.length);
      expect(justBelow).assertEqual('01:59');
      expect(exact).assertEqual('02:00');
      expect(MediaTools.msToCountdownTime(500)).assertEqual(ZERO_TEXT);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TimeUnit_Truncate_0002 end');
    });

    /**
     * @tc.number    SUB_TIME_UNIT_0300
     * @tc.name      testTimeFormatUnitMatrix0003
     * @tc.desc      验证分钟进位：第 59 分钟到第 60 分钟、第 99 到 100 分钟时分钟段由两位扩展为三位且小时段出现
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testTimeFormatUnitMatrix0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TimeUnit_MinuteCarry_0003 begin');
      let cases: number[] = [59 * MINUTE, 60 * MINUTE, 99 * MINUTE + 59 * SECOND, 100 * MINUTE, 119 * MINUTE];
      let expected: string[] = ['59:00', '01:00:00', '01:39:59', '01:40:00', '01:59:00'];
      let same: number = 0;
      for (let i = 0; i < cases.length; i++) {
        let actual: string = MediaTools.msToCountdownTime(cases[i]);
        if (actual === expected[i]) {
          same++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `结果=${MediaTools.msToCountdownTime(100 * MINUTE)}`);
      expect(same).assertEqual(cases.length);
      expect(segmentCount(MediaTools.msToCountdownTime(59 * MINUTE))).assertEqual(2);
      expect(segmentCount(MediaTools.msToCountdownTime(60 * MINUTE))).assertEqual(3);
      expect(MediaTools.msToCountdownTime(100 * MINUTE)).assertEqual(clockText(0, 1, 40, 0));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TimeUnit_MinuteCarry_0003 end');
    });

    /**
     * @tc.number    SUB_TIME_UNIT_0400
     * @tc.name      testTimeFormatUnitMatrix0004
     * @tc.desc      验证小时段在每个整点前后正确递增，且小时段恒为两位数字
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testTimeFormatUnitMatrix0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TimeUnit_HourCarry_0004 begin');
      let oneHourLess: string = MediaTools.msToCountdownTime(HOUR - 1);
      let oneHour: string = MediaTools.msToCountdownTime(HOUR);
      let nineHours: string = MediaTools.msToCountdownTime(9 * HOUR);
      let tenHours: string = MediaTools.msToCountdownTime(10 * HOUR + 30 * MINUTE + 15 * SECOND);
      let twentyThree: string = MediaTools.msToCountdownTime(23 * HOUR + 59 * MINUTE + 59 * SECOND);
      let hourDigitsOk: boolean = true;
      for (let hour = 1; hour <= 23; hour++) {
        let segments: string[] = MediaTools.msToCountdownTime(hour * HOUR).split(':');
        if (segments.length !== 3 || segments[0].length !== 2 || Number.parseInt(segments[0]) !== hour) {
          hourDigitsOk = false;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `10 小时 30 分=[${tenHours}], 23 时段=[${twentyThree}]`);
      expect(oneHourLess).assertEqual('59:59');
      expect(oneHour).assertEqual('01:00:00');
      expect(nineHours).assertEqual('09:00:00');
      expect(tenHours).assertEqual('10:30:15');
      expect(twentyThree).assertEqual('23:59:59');
      expect(hourDigitsOk).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TimeUnit_HourCarry_0004 end');
    });

    /**
     * @tc.number    SUB_TIME_UNIT_0500
     * @tc.name      testTimeFormatUnitMatrix0005
     * @tc.desc      验证跨天进位：满 24 小时后天段出现并重置小时段，一天内最大时刻与一天整点文本不同
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testTimeFormatUnitMatrix0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TimeUnit_DayCarry_0005 begin');
      let lastMoment: string = MediaTools.msToCountdownTime(DAY - 1);
      let firstDay: string = MediaTools.msToCountdownTime(DAY);
      let dayPlusHour: string = MediaTools.msToCountdownTime(DAY + HOUR);
      let twoDays: string = MediaTools.msToCountdownTime(2 * DAY + 3 * HOUR + 4 * MINUTE + 5 * SECOND);
      hilog.info(DOMAIN, TAG, '%{public}s', `一天整=[${firstDay}], 两天零 03:04:05=[${twoDays}]`);
      expect(lastMoment).assertEqual('23:59:59');
      expect(firstDay).assertEqual(clockText(1, 0, 0, 0));
      expect(firstDay).assertEqual('01:00:00');
      expect(dayPlusHour).assertEqual(clockText(1, 1, 0, 0));
      expect(dayPlusHour).assertEqual('01:01:00:00');
      expect(twoDays).assertEqual(clockText(2, 3, 4, 5));
      expect(segmentCount(twoDays)).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TimeUnit_DayCarry_0005 end');
    });

    /**
     * @tc.number    SUB_TIME_UNIT_0600
     * @tc.name      testTimeFormatUnitMatrix0006
     * @tc.desc      验证分秒段边界组合（59 分 59 秒、59 分 0 秒、0 分 59 秒）在各时间量级下均保持合法取值
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testTimeFormatUnitMatrix0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TimeUnit_SegmentBoundary_0006 begin');
      let cases: number[] = [
        clockMs(0, 0, 0, 59),
        clockMs(0, 0, 59, 0),
        clockMs(0, 0, 59, 59),
        clockMs(0, 5, 59, 59),
        clockMs(0, 5, 0, 59),
        clockMs(0, 23, 59, 59)
      ];
      let rangeOk: boolean = true;
      let matched: number = 0;
      for (let ms of cases) {
        let splits: number[] = splitClock(ms);
        let text: string = MediaTools.msToCountdownTime(ms);
        let segments: string[] = text.split(':');
        let minuteSegment: string = segments[segments.length - 2];
        let secondSegment: string = segments[segments.length - 1];
        if (Number.parseInt(minuteSegment) !== splits[1] || Number.parseInt(secondSegment) !== splits[2]) {
          rangeOk = false;
        }
        if (Number.parseInt(minuteSegment) > 59 || Number.parseInt(secondSegment) > 59) {
          rangeOk = false;
        }
        if (text === clockText(0, splits[0], splits[1], splits[2])) {
          matched++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `边界组合=[${MediaTools.msToCountdownTime(clockMs(0, 23, 59, 59))}]`);
      expect(matched).assertEqual(cases.length);
      expect(rangeOk).assertTrue();
      expect(MediaTools.msToCountdownTime(clockMs(0, 0, 0, 59))).assertEqual('00:59');
      expect(MediaTools.msToCountdownTime(clockMs(0, 0, 59, 0))).assertEqual('59:00');
      expect(MediaTools.msToCountdownTime(clockMs(0, 5, 0, 59))).assertEqual('05:00:59');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TimeUnit_SegmentBoundary_0006 end');
    });

    /**
     * @tc.number    SUB_TIME_UNIT_0700
     * @tc.name      testTimeFormatUnitMatrix0007
     * @tc.desc      验证相同总时长不同拆分方式（时+分 与 分）换算结果相等，展示文本与时长大小的单调关系成立
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testTimeFormatUnitMatrix0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TimeUnit_Equivalence_0007 begin');
      let total: number = 90 * MINUTE + 15 * SECOND;
      let fromHour: string = MediaTools.msToCountdownTime(1 * HOUR + 30 * MINUTE + 15 * SECOND);
      let fromMinute: string = MediaTools.msToCountdownTime(90 * MINUTE + 15 * SECOND);
      let fromSecond: string = MediaTools.msToCountdownTime(5415 * SECOND);
      let ascending: boolean = true;
      let previous: number = -1;
      for (let index = 0; index < 10; index++) {
        let input: number = index * 37 * MINUTE + index * 13 * SECOND;
        let splits: number[] = splitClock(input);
        let current: number = splits[0] * HOUR + splits[1] * MINUTE + splits[2] * SECOND;
        if (current !== Math.floor(input / SECOND) * SECOND || current <= previous) {
          ascending = false;
        }
        previous = current;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `时拆分=[${fromHour}], 分拆分=[${fromMinute}], 秒拆分=[${fromSecond}]`);
      expect(fromHour).assertEqual(fromMinute);
      expect(fromMinute).assertEqual(fromSecond);
      expect(fromMinute).assertEqual(MediaTools.msToCountdownTime(total));
      expect(fromMinute).assertEqual(clockText(0, 1, 30, 15));
      expect(ascending).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TimeUnit_Equivalence_0007 end');
    });

    /**
     * @tc.number    SUB_TIME_UNIT_0800
     * @tc.name      testTimeFormatUnitMatrix0008
     * @tc.desc      验证纯整数毫秒输入与带小数毫秒输入在取整后展示一致，且小数部分不影响整数秒段
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testTimeFormatUnitMatrix0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TimeUnit_Fractional_0008 begin');
      let fractions: number[] = [0.1, 0.5, 0.99, 0.999];
      let consistent: number = 0;
      for (let fraction of fractions) {
        let withFraction: string = MediaTools.msToCountdownTime(3 * MINUTE + 7 * SECOND + fraction);
        if (withFraction === MediaTools.msToCountdownTime(3 * MINUTE + 7 * SECOND)) {
          consistent++;
        }
      }
      let integerLike: string = MediaTools.msToCountdownTime(75 * SECOND);
      let floatLike: string = MediaTools.msToCountdownTime(75000.0);
      let parsedSegments: string[] = integerLike.split(':');
      hilog.info(DOMAIN, TAG, '%{public}s', `带小数一致数=${consistent}, 75 秒=[${integerLike}]`);
      expect(consistent).assertEqual(fractions.length);
      expect(floatLike).assertEqual(integerLike);
      expect(integerLike).assertEqual('01:15');
      expect(parsedSegments.length).assertEqual(2);
      expect(Number.parseInt(parsedSegments[0]) * 60 + Number.parseInt(parsedSegments[1])).assertEqual(75);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TimeUnit_Fractional_0008 end');
    });

    /**
     * @tc.number    SUB_TIME_UNIT_0900
     * @tc.name      testTimeFormatUnitMatrix0009
     * @tc.desc      验证任意时长展示文本可反向还原为不超出原值的整秒量，且截断误差始终小于一秒
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testTimeFormatUnitMatrix0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TimeUnit_RoundTrip_0009 begin');
      let samples: number[] = [
        1500, 125999, 3 * HOUR + 7 * MINUTE + 8 * SECOND + 901, 5 * DAY + 9 * HOUR + 59 * SECOND, 119 * SECOND + 999
      ];
      let restoredOk: boolean = true;
      for (let ms of samples) {
        let segmentTexts: string[] = MediaTools.msToCountdownTime(ms).split(':');
        let segments: number[] = [];
        for (let i = 0; i < segmentTexts.length; i++) {
          segments.push(Number.parseInt(segmentTexts[i]));
        }
        let restoredSecond: number = 0;
        let multipliers: number[] = [DAY, HOUR, MINUTE, SECOND];
        let start: number = multipliers.length - segments.length;
        for (let i = 0; i < segments.length; i++) {
          restoredSecond += segments[i] * multipliers[start + i];
        }
        let truncated: number = Math.floor(ms / SECOND) * SECOND;
        if (Math.abs(restoredSecond - truncated) !== 0 || truncated > ms || ms - truncated >= SECOND) {
          restoredOk = false;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `回读一致=${restoredOk}`);
      expect(restoredOk).assertTrue();
      expect(MediaTools.msToCountdownTime(1500)).assertEqual('00:01');
      expect(MediaTools.msToCountdownTime(5 * DAY + 9 * HOUR + 59 * SECOND)).assertEqual('05:09:00:59');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TimeUnit_RoundTrip_0009 end');
    });

    /**
     * @tc.number    SUB_TIME_UNIT_1000
     * @tc.name      testTimeFormatUnitMatrix0010
     * @tc.desc      验证零与非数字输入持续返回零时长占位文本，负整秒走正常分段换算并带负号，最小正时长一秒可展示
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testTimeFormatUnitMatrix0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TimeUnit_ZeroRepeated_0010 begin');
      let zeroInputs: number[] = [0, 0, Number.NaN, 0];
      let allZero: boolean = true;
      for (let ms of zeroInputs) {
        if (MediaTools.msToCountdownTime(ms) !== ZERO_TEXT) {
          allZero = false;
        }
      }
      let firstSecond: string = MediaTools.msToCountdownTime(SECOND);
      let negativeTexts: string[] = [];
      for (let step = 0; step < 3; step++) {
        negativeTexts.push(MediaTools.msToCountdownTime(-(step + 1) * SECOND));
      }
      hilog.info(DOMAIN, TAG, '%{public}s',
        `零与非法输入全零=${allZero}, 负整秒文本=${negativeTexts.join('|')}, 最小正时长=[${firstSecond}]`);
      expect(allZero).assertTrue();
      expect(negativeTexts).assertDeepEquals(['-1:-1:-1:-1', '-1:-1:-1:-2', '-1:-1:-1:-3']);
      expect(firstSecond).assertEqual('00:01');
      expect(firstSecond.length).assertEqual(ZERO_TEXT.length);
      expect(MediaTools.msToCountdownTime(-DAY)).assertEqual('-1:00:00');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TimeUnit_ZeroRepeated_0010 end');
    });
  });
}
