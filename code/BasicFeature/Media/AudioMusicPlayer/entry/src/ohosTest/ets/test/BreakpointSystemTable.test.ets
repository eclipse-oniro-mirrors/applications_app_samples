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
import { BreakpointType } from '../../../main/ets/common/utils/BreakpointSystem';
import { paceTurn } from './TestPace';

const TAG: string = 'Sample_AudioMusicPlayer';
const DOMAIN: number = 0xF811;
const BUNDLE: string = 'AudioMusicPlayer_';

/**
 * 区间字符串形如 (320vp<=width<600vp)。用独立正则解析出上下界和开闭性质，
 * 与 BreakpointConstants 的数值表交叉核对。
 */
const RANGE_PATTERN: RegExp = new RegExp('^\\((\\d+)vp<=(width)(<|<=)(\\d+)vp\\)$');

interface RangeInfo {
  valid: boolean;
  lower: number;
  upper: number;
  upperInclusive: boolean;
}

function parseRange(text: string): RangeInfo {
  let match: RegExpMatchArray | null = text.match(RANGE_PATTERN);
  if (!match) {
    return { valid: false, lower: -1, upper: -1, upperInclusive: false };
  }
  return {
    valid: true,
    lower: Number(match[1]),
    upper: Number(match[4]),
    upperInclusive: match[3] === '<='
  };
}

/**
 * 独立计算某个宽度对应的断点：按数值阈值表从大到小判断，首尾闭区间、中间左闭右开。
 */
function breakpointOf(widthVp: number): string {
  let values: number[] = BreakpointConstants.BREAKPOINT_VALUE_NUMBER;
  if (widthVp < values[1]) {
    return BreakpointConstants.BREAKPOINT_SM;
  }
  if (widthVp < values[2]) {
    return BreakpointConstants.BREAKPOINT_MD;
  }
  return BreakpointConstants.BREAKPOINT_LG;
}

export default function BreakpointSystemTableTest() {
  describe('BreakpointSystemTableTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_BREAKPOINT_TABLE_0100
     * @tc.name      testBreakpointTable0001
     * @tc.desc      验证三个断点区间字符串可解析且与阈值数值表一一对应
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testBreakpointTable0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Breakpoint_RangeParse_0001 begin');
      let sm: RangeInfo = parseRange(BreakpointConstants.RANGE_SM);
      let md: RangeInfo = parseRange(BreakpointConstants.RANGE_MD);
      let lg: RangeInfo = parseRange(BreakpointConstants.RANGE_LG);
      hilog.info(DOMAIN, TAG, '%{public}s',
        `sm=[${sm.lower},${sm.upper}), md=[${md.lower},${md.upper}), lg=[${lg.lower},${lg.upper})`);
      expect(sm.valid && md.valid && lg.valid).assertTrue();
      expect(sm.lower).assertEqual(BreakpointConstants.BREAKPOINT_VALUE_NUMBER[0]);
      expect(md.lower).assertEqual(BreakpointConstants.BREAKPOINT_VALUE_NUMBER[1]);
      expect(lg.lower).assertEqual(BreakpointConstants.BREAKPOINT_VALUE_NUMBER[2]);
      expect(sm.upper).assertEqual(md.lower);
      expect(md.upper).assertEqual(lg.lower);
      expect(sm.upperInclusive).assertFalse();
      expect(md.upperInclusive).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Breakpoint_RangeParse_0001 end');
    });

    /**
     * @tc.number    SUB_BREAKPOINT_TABLE_0200
     * @tc.name      testBreakpointTable0002
     * @tc.desc      验证断点字符串值与数值表逐项一致且数值严格递增
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testBreakpointTable0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Breakpoint_ValueTable_0002 begin');
      let texts: string[] = BreakpointConstants.BREAKPOINT_VALUE;
      let numbers: number[] = BreakpointConstants.BREAKPOINT_VALUE_NUMBER;
      let matched: number = 0;
      for (let i = 0; i < texts.length; i++) {
        if (Number.parseFloat(texts[i]) === numbers[i]) {
          matched++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `字符串表=[${texts.join(',')}], 数值表=[${numbers.join(',')}]`);
      expect(texts.length).assertEqual(3);
      expect(numbers.length).assertEqual(texts.length);
      expect(matched).assertEqual(3);
      expect(numbers[0] < numbers[1]).assertTrue();
      expect(numbers[1] < numbers[2]).assertTrue();
      expect(numbers[2] - numbers[1]).assertEqual(240);
      expect(numbers[1] - numbers[0]).assertEqual(280);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Breakpoint_ValueTable_0002 end');
    });

    /**
     * @tc.number    SUB_BREAKPOINT_TABLE_0300
     * @tc.name      testBreakpointTable0003
     * @tc.desc      验证宽度边界：599/600 切换 sm→md，839/840 切换 md→lg
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testBreakpointTable0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Breakpoint_Boundary_0003 begin');
      let at599: string = breakpointOf(599);
      let at600: string = breakpointOf(600);
      let at839: string = breakpointOf(839);
      let at840: string = breakpointOf(840);
      hilog.info(DOMAIN, TAG, '%{public}s',
        `599=${at599}, 600=${at600}, 839=${at839}, 840=${at840}`);
      expect(at599).assertEqual(BreakpointConstants.BREAKPOINT_SM);
      expect(at600).assertEqual(BreakpointConstants.BREAKPOINT_MD);
      expect(at839).assertEqual(BreakpointConstants.BREAKPOINT_MD);
      expect(at840).assertEqual(BreakpointConstants.BREAKPOINT_LG);
      expect(at599 !== at600).assertTrue();
      expect(at839 !== at840).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Breakpoint_Boundary_0003 end');
    });

    /**
     * @tc.number    SUB_BREAKPOINT_TABLE_0400
     * @tc.name      testBreakpointTable0004
     * @tc.desc      验证极值宽度：0 与 319 落在 sm、超大宽度落在 lg
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testBreakpointTable0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Breakpoint_Extremes_0004 begin');
      let widths: number[] = [0, 1, 319, 320, 4096, 100000];
      let results: string[] = [];
      for (let width of widths) {
        results.push(breakpointOf(width));
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `宽度=[${widths.join(',')}] => [${results.join(',')}]`);
      expect(results[0]).assertEqual(BreakpointConstants.BREAKPOINT_SM);
      expect(results[2]).assertEqual(BreakpointConstants.BREAKPOINT_SM);
      expect(results[3]).assertEqual(BreakpointConstants.BREAKPOINT_SM);
      expect(results[4]).assertEqual(BreakpointConstants.BREAKPOINT_LG);
      expect(results[5]).assertEqual(BreakpointConstants.BREAKPOINT_LG);
      expect(results.filter((item: string) => item === BreakpointConstants.BREAKPOINT_SM).length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Breakpoint_Extremes_0004 end');
    });

    /**
     * @tc.number    SUB_BREAKPOINT_TABLE_0500
     * @tc.name      testBreakpointTable0005
     * @tc.desc      验证单行布局列数不超过总列数，且三档区间长度一致
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testBreakpointTable0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Breakpoint_Columns_0005 begin');
      let columnSets: number[][] = [
        [BreakpointConstants.SPAN_SM, BreakpointConstants.COLUMN_SM],
        [BreakpointConstants.SPAN_MD, BreakpointConstants.COLUMN_MD],
        [BreakpointConstants.SPAN_LG, BreakpointConstants.COLUMN_LG],
        [BreakpointConstants.SPAN_LYRIC_LG, BreakpointConstants.COLUMN_LYRIC_LG]
      ];
      let withinCount: number = 0;
      for (let set of columnSets) {
        if (set[0] <= set[1]) {
          withinCount++;
        }
      }
      let sm: RangeInfo = parseRange(BreakpointConstants.RANGE_SM);
      let md: RangeInfo = parseRange(BreakpointConstants.RANGE_MD);
      hilog.info(DOMAIN, TAG, '%{public}s', `列数不超限=${withinCount}/${columnSets.length}`);
      expect(withinCount).assertEqual(4);
      expect(BreakpointConstants.COLUMN_SM).assertEqual(BreakpointConstants.SPAN_SM);
      expect(BreakpointConstants.SPAN_MD < BreakpointConstants.COLUMN_MD).assertTrue();
      expect(BreakpointConstants.SPAN_LG < BreakpointConstants.COLUMN_LG).assertTrue();
      expect(md.upper - md.lower).assertEqual(sm.upper - sm.lower);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Breakpoint_Columns_0005 end');
    });

    /**
     * @tc.number    SUB_BREAKPOINT_TABLE_0600
     * @tc.name      testBreakpointTable0006
     * @tc.desc      验证字体与封面边距随断点单调递增，且 lg 偏移量等于两档偏移之和
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testBreakpointTable0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Breakpoint_FontAndMargin_0006 begin');
      let fonts: number[] = [
        BreakpointConstants.FONT_SIZE_SM, BreakpointConstants.FONT_SIZE_MD, BreakpointConstants.FONT_SIZE_LG
      ];
      let margins: number[] = [
        BreakpointConstants.COVER_MARGIN_SM, BreakpointConstants.COVER_MARGIN_MD, BreakpointConstants.COVER_MARGIN_LG
      ];
      let fontStepsOk: boolean = fonts[0] < fonts[1] && fonts[1] < fonts[2];
      let marginStepsOk: boolean = margins[0] < margins[1] && margins[1] < margins[2];
      hilog.info(DOMAIN, TAG, '%{public}s',
        `字体=${fonts.join(',')}, 边距=${margins.join(',')}, 偏移=[${BreakpointConstants.OFFSET_MD},${BreakpointConstants.OFFSET_LG}]`);
      expect(fontStepsOk).assertTrue();
      expect(marginStepsOk).assertTrue();
      expect(fonts[1] - fonts[0]).assertEqual(2);
      expect(fonts[2] - fonts[1]).assertEqual(2);
      expect(BreakpointConstants.OFFSET_LG).assertEqual(BreakpointConstants.OFFSET_MD * 2);
      expect(margins[2] > margins[1]).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Breakpoint_FontAndMargin_0006 end');
    });

    /**
     * @tc.number    SUB_BREAKPOINT_TABLE_0700
     * @tc.name      testBreakpointTable0007
     * @tc.desc      验证 BreakpointType 按当前断点取值，未知断点按 lg 兜底
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testBreakpointTable0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Breakpoint_TypeOption_0007 begin');
      let type: BreakpointType<string> = new BreakpointType<string>({ sm: 'small', md: 'middle', lg: 'large' });
      let smValue: string = type.getValue(BreakpointConstants.BREAKPOINT_SM);
      let mdValue: string = type.getValue(BreakpointConstants.BREAKPOINT_MD);
      let lgValue: string = type.getValue(BreakpointConstants.BREAKPOINT_LG);
      let unknownValue: string = type.getValue('xl');
      hilog.info(DOMAIN, TAG, '%{public}s',
        `sm=${smValue}, md=${mdValue}, lg=${lgValue}, 未知=${unknownValue}`);
      expect(smValue).assertEqual('small');
      expect(mdValue).assertEqual('middle');
      expect(lgValue).assertEqual('large');
      expect(unknownValue).assertEqual(lgValue);
      expect(new Set<string>([smValue, mdValue, lgValue]).size).assertEqual(3);
      expect(smValue !== mdValue && mdValue !== lgValue).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Breakpoint_TypeOption_0007 end');
    });

    /**
     * @tc.number    SUB_BREAKPOINT_TABLE_0800
     * @tc.name      testBreakpointTable0008
     * @tc.desc      验证 BreakpointType 缺省值时未提供档位得到未定义、提供档位正常返回值
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testBreakpointTable0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Breakpoint_PartialOption_0008 begin');
      let onlyMd: BreakpointType<number> = new BreakpointType<number>({ md: 8 });
      let sm: number | undefined = onlyMd.getValue(BreakpointConstants.BREAKPOINT_SM);
      let md: number | undefined = onlyMd.getValue(BreakpointConstants.BREAKPOINT_MD);
      let lg: number | undefined = onlyMd.getValue(BreakpointConstants.BREAKPOINT_LG);
      hilog.info(DOMAIN, TAG, '%{public}s',
        `sm=${sm === undefined}, md=${md}, lg=${lg === undefined}`);
      expect(sm === undefined).assertTrue();
      expect(md).assertEqual(8);
      expect(lg === undefined).assertTrue();
      expect(md).assertEqual(BreakpointConstants.COLUMN_MD);
      expect(sm === lg).assertTrue();
      expect(onlyMd.options.md).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Breakpoint_PartialOption_0008 end');
    });

    /**
     * @tc.number    SUB_BREAKPOINT_TABLE_0900
     * @tc.name      testBreakpointTable0009
     * @tc.desc      验证记录当前断点的存储键名与三个断点常量互不为空且互不重复
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testBreakpointTable0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Breakpoint_Names_0009 begin');
      let names: string[] = [
        BreakpointConstants.BREAKPOINT_SM, BreakpointConstants.BREAKPOINT_MD,
        BreakpointConstants.BREAKPOINT_LG, BreakpointConstants.CURRENT_BREAKPOINT
      ];
      let empty: number = names.filter((item: string) => item.length === 0).length;
      hilog.info(DOMAIN, TAG, '%{public}s', `名称=[${names.join(',')}]`);
      expect(empty).assertEqual(0);
      expect(new Set<string>(names).size).assertEqual(4);
      expect(BreakpointConstants.CURRENT_BREAKPOINT).assertEqual('currentBreakpoint');
      expect(names[0].length).assertEqual(2);
      expect(names[0]).assertEqual('s' + 'm');
      expect(names[2]).assertEqual('l' + 'g');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Breakpoint_Names_0009 end');
    });

    /**
     * @tc.number    SUB_BREAKPOINT_TABLE_1000
     * @tc.name      testBreakpointTable0010
     * @tc.desc      验证槽间距 12/24 与歌词栅格列宽成整倍关系且封面槽更宽
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testBreakpointTable0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Breakpoint_Gutter_0010 begin');
      let gutterX: number = BreakpointConstants.GUTTER_X;
      let gutterMusicX: number = BreakpointConstants.GUTTER_MUSIC_X;
      hilog.info(DOMAIN, TAG, '%{public}s', `普通槽=${gutterX}, 音乐区槽=${gutterMusicX}`);
      expect(gutterX).assertEqual(12);
      expect(gutterMusicX).assertEqual(24);
      expect(gutterMusicX).assertEqual(gutterX * 2);
      expect(gutterMusicX % gutterX).assertEqual(0);
      expect(BreakpointConstants.COLUMN_LYRIC_LG * gutterX).assertEqual(84);
      expect(gutterMusicX / gutterX).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Breakpoint_Gutter_0010 end');
    });
  });
}
