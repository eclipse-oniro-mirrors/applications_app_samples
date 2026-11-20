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
import { BreakpointType } from '../../../main/ets/common/utils/BreakpointSystem';
import { BreakpointConstants } from '../../../main/ets/common/constants/BreakpointConstants';
import { paceTurn } from './TestPace';

const TAG: string = 'Sample_AudioMusicPlayer';
const DOMAIN: number = 0xF811;
const BUNDLE: string = 'AudioMusicPlayer_';
const SM: string = 'sm';
const MD: string = 'md';
const LG: string = 'lg';

/**
 * 独立复算断点分档：vp 宽度小于 600 为小屏，小于 840 为中屏，其余为大屏。
 * 阈值直接取断点常量，判定顺序与独立实现无关。
 */
function tierOf(widthVp: number): string {
  if (widthVp < BreakpointConstants.BREAKPOINT_VALUE_NUMBER[1]) {
    return SM;
  }
  if (widthVp < BreakpointConstants.BREAKPOINT_VALUE_NUMBER[2]) {
    return MD;
  }
  return LG;
}

export default function ResponsiveLayoutSuite() {
  describe('ResponsiveLayoutSuite', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_RESPONSIVE_0100
     * @tc.name      testResponsive0001
     * @tc.desc      验证断点取值按当前档位返回对应值：三档各自返回自己的值，未知档位按大屏返回，大小屏取值互不相同
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testResponsive0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Responsive_TierValue_0001 begin');
      let fontSize: BreakpointType<number> = new BreakpointType<number>({ sm: 20, md: 24, lg: 28 });
      let smValue: number = fontSize.getValue(SM);
      let mdValue: number = fontSize.getValue(MD);
      let lgValue: number = fontSize.getValue(LG);
      let unknownValue: number = fontSize.getValue('xl');
      hilog.info(DOMAIN, TAG, '%{public}s',
        `sm=${smValue}, md=${mdValue}, lg=${lgValue}, 未知档位=${unknownValue}`);
      expect(smValue).assertEqual(20);
      expect(mdValue).assertEqual(24);
      expect(lgValue).assertEqual(28);
      expect(unknownValue).assertEqual(lgValue);
      expect(new Set<number>([smValue, mdValue, lgValue]).size).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Responsive_TierValue_0001 end');
    });

    /**
     * @tc.number    SUB_RESPONSIVE_0200
     * @tc.name      testResponsive0002
     * @tc.desc      验证断点取值对非数值类型同样生效：字符串、布尔值与资源标识都按档位原样返回，缺省档位返回未定义
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testResponsive0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Responsive_GenericValue_0002 begin');
      let colors: BreakpointType<string> = new BreakpointType<string>({ sm: '#FFFFFF', md: '#000000', lg: '#808080' });
      let flags: BreakpointType<boolean> = new BreakpointType<boolean>({ sm: true, md: false, lg: true });
      let partial: BreakpointType<string> = new BreakpointType<string>({ sm: 'only_sm', lg: 'only_lg' });
      let missing: string = partial.getValue(MD);
      hilog.info(DOMAIN, TAG, '%{public}s',
        `sm色=${colors.getValue(SM)}, md色=${colors.getValue(MD)}, sm标志=${flags.getValue(SM)}, md标志=${flags.getValue(MD)}, 缺省md=${missing}`);
      expect(colors.getValue(SM)).assertEqual('#FFFFFF');
      expect(colors.getValue(LG)).assertEqual('#808080');
      expect(flags.getValue(SM)).assertTrue();
      expect(flags.getValue(MD)).assertFalse();
      expect(partial.getValue(SM)).assertEqual('only_sm');
      expect(missing === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Responsive_GenericValue_0002 end');
    });

    /**
     * @tc.number    SUB_RESPONSIVE_0300
     * @tc.name      testResponsive0003
     * @tc.desc      验证按宽度分档：599 与 600、839 与 840 四个临界宽度分别落在小屏、中屏、中屏、大屏，极窄与极宽宽度分档正确
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testResponsive0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Responsive_WidthBoundary_0003 begin');
      let widths: number[] = [0, 320, 599, 600, 839, 840, 1280, 2560];
      let tiers: string[] = [];
      for (let width of widths) {
        tiers.push(tierOf(width));
      }
      let mediumThreshold: number = BreakpointConstants.BREAKPOINT_VALUE_NUMBER[1];
      let largeThreshold: number = BreakpointConstants.BREAKPOINT_VALUE_NUMBER[2];
      hilog.info(DOMAIN, TAG, '%{public}s',
        `宽度=${widths.join(',')}, 分档=${tiers.join(',')}, 中屏阈值=${mediumThreshold}, 大屏阈值=${largeThreshold}, ` +
        `阈值处档位变化=${tierOf(mediumThreshold - 1) !== tierOf(mediumThreshold) && tierOf(largeThreshold - 1) !== tierOf(largeThreshold)}`);
      expect(tiers.slice(0, 3)).assertDeepEquals([SM, SM, SM]);
      expect(tiers[3]).assertEqual(MD);
      expect(tiers[4]).assertEqual(MD);
      expect(tiers.slice(5)).assertDeepEquals([LG, LG, LG]);
      expect(tierOf(mediumThreshold - 1)).assertEqual(SM);
      expect(tierOf(mediumThreshold)).assertEqual(MD);
      expect(tierOf(largeThreshold - 1)).assertEqual(MD);
      expect(tierOf(largeThreshold)).assertEqual(LG);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Responsive_WidthBoundary_0003 end');
    });

    /**
     * @tc.number    SUB_RESPONSIVE_0400
     * @tc.name      testResponsive0004
     * @tc.desc      验证三个断点名称互不相同且与分档结果一一对应，档位名不会重复也不会互相包含
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testResponsive0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Responsive_TierNames_0004 begin');
      let names: string[] = [BreakpointConstants.BREAKPOINT_SM, BreakpointConstants.BREAKPOINT_MD,
        BreakpointConstants.BREAKPOINT_LG];
      let samples: number[] = [360, 720, 1200];
      let matched: string[] = [];
      for (let sample of samples) {
        matched.push(tierOf(sample));
      }
      let distinct: number = new Set<string>(matched).size;
      hilog.info(DOMAIN, TAG, '%{public}s',
        `档位名=${names.join(',')}, 三档样本=${samples.join(',')} 分档=${matched.join(',')}, 互不相同=${distinct}`);
      expect(names).assertDeepEquals([SM, MD, LG]);
      expect(new Set<string>(names).size).assertEqual(3);
      expect(matched).assertDeepEquals(names);
      expect(distinct).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Responsive_TierNames_0004 end');
    });

    /**
     * @tc.number    SUB_RESPONSIVE_0500
     * @tc.name      testResponsive0005
     * @tc.desc      验证分档随宽度单调：宽度每增加一档的结果不降级，从最窄扫到最宽只出现一次小屏到中屏、一次中屏到大屏的切换
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testResponsive0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Responsive_Monotonic_0005 begin');
      let rank: Map<string, number> = new Map<string, number>();
      rank.set(SM, 0);
      rank.set(MD, 1);
      rank.set(LG, 2);
      let changes: number = 0;
      let previous: string = tierOf(0);
      let monotonic: boolean = true;
      for (let width = 1; width <= 1300; width++) {
        let tier: string = tierOf(width);
        if ((rank.get(tier) as number) < (rank.get(previous) as number)) {
          monotonic = false;
        }
        if (tier !== previous) {
          changes++;
        }
        previous = tier;
      }
      hilog.info(DOMAIN, TAG, '%{public}s',
        `扫描宽度 0~1300vp, 档位变化次数=${changes}, 单调不降级=${monotonic}, 最窄=${tierOf(0)}, 最宽=${tierOf(1300)}`);
      expect(monotonic).assertTrue();
      expect(changes).assertEqual(2);
      expect(tierOf(0)).assertEqual(SM);
      expect(tierOf(1300)).assertEqual(LG);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Responsive_Monotonic_0005 end');
    });
  });
}
