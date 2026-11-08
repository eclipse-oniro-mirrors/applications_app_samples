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
import { BreakpointConstants } from '../../../main/ets/common/constants/BreakpointConstants';
import { ContentConstants } from '../../../main/ets/common/constants/ContentConstants';
import { BreakpointType } from '../../../main/ets/common/utils/BreakpointSystem';
import { paceTurn } from './TestPace';

const TAG: string = 'Sample_AudioMusicPlayer';
const DOMAIN: number = 0xF811;
const BUNDLE: string = 'AudioMusicPlayer_';
const BREAKPOINTS: string[] = [
  BreakpointConstants.BREAKPOINT_SM,
  BreakpointConstants.BREAKPOINT_MD,
  BreakpointConstants.BREAKPOINT_LG
];

interface TierSample {
  name: string;
  sm: number;
  md: number;
  lg: number;
}

const TIERS: TierSample[] = [
  {
    name: '栏数', sm: BreakpointConstants.COLUMN_SM, md: BreakpointConstants.COLUMN_MD,
    lg: BreakpointConstants.COLUMN_LG
  },
  {
    name: '普通跨度', sm: BreakpointConstants.SPAN_SM, md: BreakpointConstants.SPAN_MD,
    lg: BreakpointConstants.SPAN_LG
  },
  {
    name: '字号', sm: BreakpointConstants.FONT_SIZE_SM, md: BreakpointConstants.FONT_SIZE_MD,
    lg: BreakpointConstants.FONT_SIZE_LG
  },
  {
    name: '封面边距', sm: BreakpointConstants.COVER_MARGIN_SM, md: BreakpointConstants.COVER_MARGIN_MD,
    lg: BreakpointConstants.COVER_MARGIN_LG
  }
];

function tierOf(width: number): string {
  if (width < BreakpointConstants.BREAKPOINT_VALUE_NUMBER[1]) {
    return BreakpointConstants.BREAKPOINT_SM;
  }
  if (width < BreakpointConstants.BREAKPOINT_VALUE_NUMBER[2]) {
    return BreakpointConstants.BREAKPOINT_MD;
  }
  return BreakpointConstants.BREAKPOINT_LG;
}

function spanFitsBlock(span: number, offset: number): boolean {
  return offset >= 0 && offset + span <= 12;
}

function isPositiveInteger(value: number): boolean {
  return value > 0 && Math.floor(value) === value;
}

export default function BreakpointCombinationTest() {
  describe('BreakpointCombinationTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_BREAKPOINT_COMBO_0100
     * @tc.name      testBreakpointCombination0001
     * @tc.desc      验证栏数、跨度、字号与封面边距四组取值在三档断点下组合使用都落在合法区间，跨度不超过栏数
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testBreakpointCombination0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BreakpointCombo_TierTable_0100 begin');
      let violations: string[] = [];
      let widened: number = 0;
      for (let tier of TIERS) {
        let values: number[] = [tier.sm, tier.md, tier.lg];
        if (!(tier.sm < tier.md && tier.md < tier.lg)) {
          violations.push(`${tier.name}:not-ascending`);
        }
        if (!values.every((value: number) => isPositiveInteger(value))) {
          violations.push(`${tier.name}:not-positive-int`);
        }
        widened++;
      }
      let spanPairs: string[] = [
        `${BreakpointConstants.SPAN_SM}/${BreakpointConstants.COLUMN_SM}`,
        `${BreakpointConstants.SPAN_MD}/${BreakpointConstants.COLUMN_MD}`,
        `${BreakpointConstants.SPAN_LG}/${BreakpointConstants.COLUMN_LG}`
      ];
      let spanFits: boolean = BreakpointConstants.SPAN_SM <= BreakpointConstants.COLUMN_SM &&
        BreakpointConstants.SPAN_MD <= BreakpointConstants.COLUMN_MD &&
        BreakpointConstants.SPAN_LG <= BreakpointConstants.COLUMN_LG;
      hilog.info(DOMAIN, TAG, '%{public}s',
        `违例=${violations.join(',') || '无'}, 校验组数=${widened}, 跨度/栏数=${spanPairs.join(',')}, 跨度合法=${spanFits}`);
      expect(violations).assertDeepEquals([]);
      expect(widened).assertEqual(TIERS.length);
      expect(spanFits).assertTrue();
      expect(BreakpointConstants.SPAN_LYRIC_LG <= BreakpointConstants.COLUMN_LYRIC_LG).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BreakpointCombo_TierTable_0100 end');
    });

    /**
     * @tc.number    SUB_BREAKPOINT_COMBO_0200
     * @tc.name      testBreakpointCombination0002
     * @tc.desc      验证任意断点取值下普通布局偏移与跨度之和不超过总栏数，歌词布局使用独立跨度且仍可容纳
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testBreakpointCombination0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BreakpointCombo_GridFit_0200 begin');
      let layout: string[] = [];
      let failing: number = 0;
      for (let breakpoint of BREAKPOINTS) {
        let span: number = new BreakpointType<number>({
          sm: BreakpointConstants.SPAN_SM,
          md: BreakpointConstants.SPAN_MD,
          lg: BreakpointConstants.SPAN_LG
        }).getValue(breakpoint);
        let offset: number = new BreakpointType<number>({
          sm: 0,
          md: BreakpointConstants.OFFSET_MD,
          lg: BreakpointConstants.OFFSET_LG
        }).getValue(breakpoint);
        if (!spanFitsBlock(span, offset)) {
          failing++;
        }
        layout.push(`${breakpoint}:${offset}+${span}`);
        let lyricSpan: number = new BreakpointType<number>({
          sm: BreakpointConstants.SPAN_SM,
          md: BreakpointConstants.SPAN_MD,
          lg: BreakpointConstants.SPAN_LYRIC_LG
        }).getValue(breakpoint);
        if (!spanFitsBlock(lyricSpan, offset)) {
          failing++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `布局=${layout.join(',')}, 越界次数=${failing}`);
      expect(failing).assertEqual(0);
      expect(layout.length).assertEqual(3);
      expect(BreakpointConstants.COLUMN_LYRIC_LG < BreakpointConstants.COLUMN_LG).assertTrue();
      expect(BreakpointConstants.OFFSET_LG).assertEqual(BreakpointConstants.OFFSET_MD * 2);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BreakpointCombo_GridFit_0200 end');
    });

    /**
     * @tc.number    SUB_BREAKPOINT_COMBO_0300
     * @tc.name      testBreakpointCombination0003
     * @tc.desc      验证每个断点档位下播放列表列数与封面比例组合：小中屏单列、大屏双列，列数与栏数不冲突
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testBreakpointCombination0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BreakpointCombo_Lanes_0300 begin');
      let lanes: number[] = BREAKPOINTS.map((breakpoint: string) => breakpoint === BreakpointConstants.BREAKPOINT_LG ?
        ContentConstants.COL_TWO : ContentConstants.COL_ONE);
      let perLaneSpan: number[] = BREAKPOINTS.map((breakpoint: string) => {
        let column: number = new BreakpointType<number>({
          sm: BreakpointConstants.COLUMN_SM,
          md: BreakpointConstants.COLUMN_MD,
          lg: BreakpointConstants.COLUMN_LG
        }).getValue(breakpoint);
        let lane: number = breakpoint === BreakpointConstants.BREAKPOINT_LG ?
          ContentConstants.COL_TWO : ContentConstants.COL_ONE;
        return column / lane;
      });
      hilog.info(DOMAIN, TAG, '%{public}s',
        `列数=${lanes.join(',')}, 单列分到栏数=${perLaneSpan.join(',')}, 封面比例=${ContentConstants.ASPECT_RATIO_ALBUM_COVER}`);
      expect(lanes).assertDeepEquals([ContentConstants.COL_ONE, ContentConstants.COL_ONE, ContentConstants.COL_TWO]);
      expect(perLaneSpan.every((value: number) => isPositiveInteger(value))).assertTrue();
      expect(perLaneSpan[2]).assertEqual(BreakpointConstants.COLUMN_LG / 2);
      expect(ContentConstants.ASPECT_RATIO_ALBUM_COVER).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BreakpointCombo_Lanes_0300 end');
    });

    /**
     * @tc.number    SUB_BREAKPOINT_COMBO_0400
     * @tc.name      testBreakpointCombination0004
     * @tc.desc      验证在断点阈值前后各一单位采样时档位在 600 与 840 两处切换，三档全部命中且首尾分别为窄屏与宽屏
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testBreakpointCombination0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BreakpointCombo_Sweep_0400 begin');
      let widths: number[] = [];
      for (let threshold of BreakpointConstants.BREAKPOINT_VALUE_NUMBER) {
        widths.push(threshold - 1, threshold, threshold + 1);
      }
      let tiers: string[] = widths.map((width: number) => tierOf(width));
      let transitions: number = 0;
      for (let index = 1; index < tiers.length; index++) {
        if (tiers[index] !== tiers[index - 1]) {
          transitions++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s',
        `采样宽度=${widths.join(',')}, 档位=${tiers.join(',')}, 切换次数=${transitions}`);
      // 第 0 个阈值与窗口最小宽度同为 SM 下界，平滑采样不会在它附近产生切换。
      expect(transitions).assertEqual(BreakpointConstants.BREAKPOINT_VALUE_NUMBER.length - 1);
      expect(new Set<string>(tiers).size).assertEqual(3);
      expect(tiers[0]).assertEqual(BreakpointConstants.BREAKPOINT_SM);
      expect(tiers[tiers.length - 1]).assertEqual(BreakpointConstants.BREAKPOINT_LG);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BreakpointCombo_Sweep_0400 end');
    });

    /**
     * @tc.number    SUB_BREAKPOINT_COMBO_0500
     * @tc.name      testBreakpointCombination0005
     * @tc.desc      验证媒体查询区间字符串与数值阈值一一对应：区间下界与断点数值一致，相邻区间首尾衔接
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testBreakpointCombination0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BreakpointCombo_RangeMatch_0500 begin');
      let ranges: string[] = [
        BreakpointConstants.RANGE_SM,
        BreakpointConstants.RANGE_MD,
        BreakpointConstants.RANGE_LG
      ];
      let lowerBounds: number[] = ranges.map((range: string) => {
        let match: RegExpMatchArray | null = range.match(/(\d+)vp/);
        return match === null ? -1 : Number(match[1]);
      });
      let chained: number = 0;
      for (let index = 0; index < ranges.length - 1; index++) {
        let upper: RegExpMatchArray | null = ranges[index].match(/width<(\d+)vp/);
        if (upper !== null && Number(upper[1]) === lowerBounds[index + 1]) {
          chained++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s',
        `区间下界=${lowerBounds.join(',')}, 断点数值=${BreakpointConstants.BREAKPOINT_VALUE_NUMBER.slice(1).join(',')}, ` +
        `衔接数=${chained}`);
      expect(lowerBounds).assertDeepEquals(BreakpointConstants.BREAKPOINT_VALUE_NUMBER);
      expect(chained).assertEqual(2);
      expect(BreakpointConstants.BREAKPOINT_VALUE.length).assertEqual(3);
      expect(BreakpointConstants.BREAKPOINT_VALUE[2])
        .assertEqual(`${BreakpointConstants.BREAKPOINT_VALUE_NUMBER[2]}vp`);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BreakpointCombo_RangeMatch_0500 end');
    });
  });
}
