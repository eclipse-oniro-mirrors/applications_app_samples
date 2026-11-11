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
import { StyleConstants } from '../../../main/ets/common/constants/StyleConstants';
import { ContentConstants } from '../../../main/ets/common/constants/ContentConstants';
import { paceTurn } from './TestPace';

const TAG: string = 'Sample_AudioMusicPlayer';
const DOMAIN: number = 0xF811;
const BUNDLE: string = 'AudioMusicPlayer_';

/**
 * 样式中所有“百分比字符串”的最简合法写法：可选负号 + 数字 + %。
 */
const PERCENT_PATTERN: RegExp = new RegExp('^-?\\d+(\\.\\d+)?%$');
/**
 * 样式中所有“vp 尺寸字符串”的最简合法写法：可选负号 + 数字 + vp。
 */
const VP_PATTERN: RegExp = new RegExp('^-?\\d+(\\.\\d+)?vp$');

function isPercent(text: string): boolean {
  return PERCENT_PATTERN.test(text);
}

function isVpSize(text: string): boolean {
  return VP_PATTERN.test(text);
}

function percentNumber(text: string): number {
  return Number.parseFloat(text.substring(0, text.length - 1));
}

function vpNumber(text: string): number {
  return Number.parseFloat(text.substring(0, text.length - 2));
}

export default function StyleConstantsSuiteTest() {
  describe('StyleConstantsSuiteTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_STYLE_CONST_0100
     * @tc.name      testStyleConstants0001
     * @tc.desc      验证全宽全高常量都是 100% 且铺满语义一致
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testStyleConstants0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Style_FullSize_0001 begin');
      hilog.info(DOMAIN, TAG, '%{public}s',
        `FULL_WIDTH=${StyleConstants.FULL_WIDTH}, FULL_HEIGHT=${StyleConstants.FULL_HEIGHT}`);
      expect(StyleConstants.FULL_WIDTH).assertEqual('100%');
      expect(StyleConstants.FULL_HEIGHT).assertEqual('100%');
      expect(isPercent(StyleConstants.FULL_WIDTH)).assertTrue();
      expect(percentNumber(StyleConstants.FULL_WIDTH)).assertEqual(100);
      expect(percentNumber(StyleConstants.FULL_HEIGHT)).assertEqual(100);
      expect(StyleConstants.FULL_WIDTH).assertEqual(StyleConstants.FULL_HEIGHT);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Style_FullSize_0001 end');
    });

    /**
     * @tc.number    SUB_STYLE_CONST_0200
     * @tc.name      testStyleConstants0002
     * @tc.desc      验证横向偏移是正数且不造成整屏位移
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testStyleConstants0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Style_TranslateX_0002 begin');
      let translateX: number = StyleConstants.TRANSLATE_X;
      hilog.info(DOMAIN, TAG, '%{public}s', `TRANSLATE_X=${translateX}`);
      expect(translateX).assertEqual(10);
      expect(translateX > 0).assertTrue();
      expect(Number.isInteger(translateX)).assertTrue();
      expect(translateX < 100).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Style_TranslateX_0002 end');
    });

    /**
     * @tc.number    SUB_STYLE_CONST_0300
     * @tc.name      testStyleConstants0003
     * @tc.desc      验证竖向百分比偏移均为向上位移的负数百分比
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testStyleConstants0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Style_TranslateYPercent_0003 begin');
      let translateY: string = StyleConstants.TRANSLATE_Y;
      hilog.info(DOMAIN, TAG, '%{public}s', `TRANSLATE_Y=${translateY}`);
      expect(translateY).assertEqual('-100%');
      expect(isPercent(translateY)).assertTrue();
      expect(translateY.startsWith('-')).assertTrue();
      expect(percentNumber(translateY)).assertEqual(-100);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Style_TranslateYPercent_0003 end');
    });

    /**
     * @tc.number    SUB_STYLE_CONST_0400
     * @tc.name      testStyleConstants0004
     * @tc.desc      验证播放器上移量为 48vp 的合法尺寸且与底部控件高度成整倍关系
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testStyleConstants0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Style_TranslatePlayer_0004 begin');
      let translatePlayerY: string = StyleConstants.TRANSLATE_PLAYER_Y;
      let height: number = vpNumber(translatePlayerY);
      hilog.info(DOMAIN, TAG, '%{public}s', `TRANSLATE_PLAYER_Y=${translatePlayerY}, 数值=${height}`);
      expect(translatePlayerY).assertEqual('-48vp');
      expect(isVpSize(translatePlayerY)).assertTrue();
      expect(height).assertEqual(-48);
      expect(Math.abs(height) % 24).assertEqual(0);
      expect(Math.abs(height) % 12).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Style_TranslatePlayer_0004 end');
    });

    /**
     * @tc.number    SUB_STYLE_CONST_0500
     * @tc.name      testStyleConstants0005
     * @tc.desc      验证内容区字体增量方向与数值：歌手字号减 4、专辑字号加 2、简介减 2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testStyleConstants0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Content_FontDelta_0005 begin');
      let singerReduce: number = ContentConstants.SINGER_FONT_REDUCE;
      let albumPlus: number = ContentConstants.ALBUM_FONT_PLUS;
      let introReduce: number = ContentConstants.INTRODUCTION_FONT_REDUCE;
      hilog.info(DOMAIN, TAG, '%{public}s',
        `歌手减=${singerReduce}, 专辑加=${albumPlus}, 简介减=${introReduce}`);
      expect(singerReduce).assertEqual(4);
      expect(albumPlus).assertEqual(2);
      expect(introReduce).assertEqual(2);
      expect(singerReduce).assertEqual(2 * albumPlus);
      expect(singerReduce > albumPlus).assertTrue();
      expect(albumPlus).assertEqual(introReduce);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Content_FontDelta_0005 end');
    });

    /**
     * @tc.number    SUB_STYLE_CONST_0600
     * @tc.name      testStyleConstants0006
     * @tc.desc      验证标题与简介的字重组合：标题在 500 档、简介在 400 档、都落在百位整数
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testStyleConstants0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Content_FontWeight_0006 begin');
      let titleWeight: number = ContentConstants.ALBUM_FONT_WEIGHT;
      let introWeight: number = ContentConstants.INTRODUCTION_FONT_WEIGHT;
      hilog.info(DOMAIN, TAG, '%{public}s', `标题字重=${titleWeight}, 简介字重=${introWeight}`);
      expect(titleWeight).assertEqual(500);
      expect(introWeight).assertEqual(400);
      expect(titleWeight > introWeight).assertTrue();
      expect(titleWeight % 100).assertEqual(0);
      expect(introWeight % 100).assertEqual(0);
      expect(titleWeight - introWeight).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Content_FontWeight_0006 end');
    });

    /**
     * @tc.number    SUB_STYLE_CONST_0700
     * @tc.name      testStyleConstants0007
     * @tc.desc      验证分隔线宽度 0.5vp 与封面 1:1 比例、字间距 1 的取值关系
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testStyleConstants0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Content_DividerAndRatio_0007 begin');
      let dividerWidth: number = ContentConstants.DIVIDER_STROKE_WIDTH;
      let aspectRatio: number = ContentConstants.ASPECT_RATIO_ALBUM_COVER;
      let letterSpacing: number = ContentConstants.LETTER_SPACING;
      hilog.info(DOMAIN, TAG, '%{public}s',
        `分隔线=${dividerWidth}, 宽高比=${aspectRatio}, 字间距=${letterSpacing}`);
      expect(dividerWidth).assertEqual(0.5);
      expect(dividerWidth > 0).assertTrue();
      expect(dividerWidth < 1).assertTrue();
      expect(dividerWidth * 2).assertEqual(1);
      expect(aspectRatio).assertEqual(1);
      expect(aspectRatio * 1).assertEqual(aspectRatio);
      expect(letterSpacing).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Content_DividerAndRatio_0007 end');
    });

    /**
     * @tc.number    SUB_STYLE_CONST_0800
     * @tc.name      testStyleConstants0008
     * @tc.desc      验证列表栏数与播放全部区文本行数的约束关系
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testStyleConstants0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Content_LanesAndLines_0008 begin');
      let one: number = ContentConstants.COL_ONE;
      let two: number = ContentConstants.COL_TWO;
      let maxLines: number = ContentConstants.PLAY_ALL_MAX_LINES;
      hilog.info(DOMAIN, TAG, '%{public}s', `单栏=${one}, 双栏=${two}, 最大行数=${maxLines}`);
      expect(one).assertEqual(1);
      expect(two).assertEqual(2);
      expect(two).assertEqual(one + 1);
      expect(two / one).assertEqual(2);
      expect(maxLines).assertEqual(1);
      expect(maxLines).assertEqual(one);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Content_LanesAndLines_0008 end');
    });

    /**
     * @tc.number    SUB_STYLE_CONST_0900
     * @tc.name      testStyleConstants0009
     * @tc.desc      验证封面选项间距按苹果式整倍缩放：0、4、12、24 四个取值呈线性
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testStyleConstants0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Content_CoverOptionSpace_0009 begin');
      let space: number = ContentConstants.COVER_OPTION_SPACE;
      let ladder: number[] = [0, space, space * 3, space * 6];
      hilog.info(DOMAIN, TAG, '%{public}s',
        `封面选项间距=${space}, 阶梯=[${ladder[0]},${ladder[1]},${ladder[2]},${ladder[3]}]`);
      expect(space).assertEqual(4);
      expect(ladder[0]).assertEqual(0);
      expect(ladder[1]).assertEqual(4);
      expect(ladder[2]).assertEqual(12);
      expect(ladder[3]).assertEqual(24);
      expect(ladder[2] - ladder[1]).assertEqual(space * 2);
      expect(ladder[3] - ladder[2]).assertEqual(space * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Content_CoverOptionSpace_0009 end');
    });
  });
}
