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

import { beforeEachIt, describe, expect, it } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import { AppColors } from '../../../main/ets/common/Theme';
import { toneSoftColor, toneTextColor, WidgetTone } from '../../../main/ets/components/CommonWidgets';

/**
 * 组件语气（WidgetTone）到语义色的映射。
 *
 * SectionCard / ActionButton / StatusChip 三处都靠 toneTextColor 与 toneSoftColor 决定
 * 一段文字的前景与底色，这两个函数是页面上唯一允许写颜色的地方。把它们钉住的理由：
 * - 页面只传语气不传颜色，配色错位时界面仍然"能显示"，只是语义反了（成功显示成红色），
 *   肉眼扫一眼未必发现，必须靠断言；
 * - NEUTRAL 落在 switch 的 default 分支，是唯一没有专属常量的语气，兜底文案最容易在重排时丢掉；
 * - 前景与背景必须成对变化，任何一侧被改成同色或改成白底，文字会直接看不见。
 *
 * 断言全部落在 main/ets 的导出函数与 AppColors 常量上，测试里不复制主代码的配对表，
 * 只做通用计算（亮度、通道值、集合去重）。
 */

const TONE_ALL: WidgetTone[] = [
  WidgetTone.NEUTRAL, WidgetTone.PRIMARY, WidgetTone.SUCCESS, WidgetTone.WARNING, WidgetTone.DANGER
];

/** AppColors 的全部取值：用来确认组件层没有漏出硬编码颜色 */
const PALETTE: string[] = [
  AppColors.PAGE_BG, AppColors.CARD_BG, AppColors.PRIMARY, AppColors.PRIMARY_SOFT, AppColors.SUBTLE_BG,
  AppColors.SOFT_BG, AppColors.TEXT_PRIMARY, AppColors.TEXT_SECONDARY, AppColors.TEXT_TERTIARY,
  AppColors.TEXT_MUTED, AppColors.TEXT_STRONG, AppColors.DANGER, AppColors.DANGER_SOFT, AppColors.WARNING,
  AppColors.WARNING_SOFT, AppColors.SUCCESS, AppColors.SUCCESS_SOFT, AppColors.GRADIENT_PRIMARY,
  AppColors.GRADIENT_SECONDARY, AppColors.WHITE
];

function redChannel(color: string): number {
  return parseInt(color.substring(1, 3), 16);
}

function greenChannel(color: string): number {
  return parseInt(color.substring(3, 5), 16);
}

function blueChannel(color: string): number {
  return parseInt(color.substring(5, 7), 16);
}

/** 加权亮度，放大一千倍取整，避免浮点比较带来的抖动 */
function luma(color: string): number {
  return redChannel(color) * 299 + greenChannel(color) * 587 + blueChannel(color) * 114;
}

function isHexColor(color: string): boolean {
  if (color.length !== 7 || color.charAt(0) !== '#') {
    return false;
  }
  for (let i = 1; i < 7; i++) {
    const char = color.charAt(i);
    const isDigit = char >= '0' && char <= '9';
    const isUpperHex = char >= 'A' && char <= 'F';
    if (!isDigit && !isUpperHex) {
      return false;
    }
  }
  return true;
}

function uniqueCount(values: string[]): number {
  const seen: string[] = [];
  for (let i = 0; i < values.length; i++) {
    if (!seen.includes(values[i])) {
      seen.push(values[i]);
    }
  }
  return seen.length;
}

function textColors(): string[] {
  const colors: string[] = [];
  for (let i = 0; i < TONE_ALL.length; i++) {
    colors.push(toneTextColor(TONE_ALL[i]));
  }
  return colors;
}

function softColors(): string[] {
  const colors: string[] = [];
  for (let i = 0; i < TONE_ALL.length; i++) {
    colors.push(toneSoftColor(TONE_ALL[i]));
  }
  return colors;
}

export default function distributedWidgetToneTest() {
  describe('DistributedWidgetToneTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TONE_0100
     * @tc.name testTone0001
     * @tc.desc Verify the five tone names are the lowercase words the pages pass around.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTone0001', 0, () => {
      expect(`${WidgetTone.NEUTRAL}`).assertEqual('neutral');
      expect(`${WidgetTone.PRIMARY}`).assertEqual('primary');
      expect(`${WidgetTone.SUCCESS}`).assertEqual('success');
      expect(`${WidgetTone.WARNING}`).assertEqual('warning');
      expect(`${WidgetTone.DANGER}`).assertEqual('danger');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TONE_0200
     * @tc.name testTone0002
     * @tc.desc Verify the five tone words are distinct and carry no spaces.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTone0002', 0, () => {
      const words: string[] = [];
      for (let i = 0; i < TONE_ALL.length; i++) {
        words.push(`${TONE_ALL[i]}`);
      }
      expect(uniqueCount(words)).assertEqual(5);
      expect(words[0]).assertEqual('neutral');
      for (let i = 0; i < words.length; i++) {
        expect(words[i].indexOf(' ') < 0).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TONE_0300
     * @tc.name testTone0003
     * @tc.desc Verify every tone word is made of lowercase letters only, so lookups stay exact.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testTone0003', 0, () => {
      for (let i = 0; i < TONE_ALL.length; i++) {
        const word = `${TONE_ALL[i]}`;
        expect(word.length >= 4).assertTrue();
        for (let j = 0; j < word.length; j++) {
          const char = word.charAt(j);
          expect(char >= 'a' && char <= 'z').assertTrue();
        }
      }
      expect(`${WidgetTone.DANGER}`).assertEqual(`${WidgetTone.DANGER}`.toLowerCase());
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TONE_0400
     * @tc.name testTone0004
     * @tc.desc Verify the tone list used by the matrix covers exactly the five declared members.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testTone0004', 0, () => {
      expect(TONE_ALL.length).assertEqual(5);
      expect(`${TONE_ALL[0]}`).assertEqual('neutral');
      expect(`${TONE_ALL[1]}`).assertEqual('primary');
      expect(`${TONE_ALL[4]}`).assertEqual('danger');
      expect(uniqueCount(TONE_ALL.map((tone: WidgetTone) => `${tone}`))).assertEqual(5);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TONE_0500
     * @tc.name testTone0005
     * @tc.desc Verify the primary tone paints blue text on the matching soft blue background.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTone0005', 0, () => {
      expect(toneTextColor(WidgetTone.PRIMARY)).assertEqual(AppColors.PRIMARY);
      expect(toneSoftColor(WidgetTone.PRIMARY)).assertEqual(AppColors.PRIMARY_SOFT);
      expect(toneTextColor(WidgetTone.PRIMARY) === toneSoftColor(WidgetTone.PRIMARY)).assertFalse();
      expect(toneSoftColor(WidgetTone.PRIMARY) === AppColors.CARD_BG).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TONE_0600
     * @tc.name testTone0006
     * @tc.desc Verify the success tone paints green text on the matching soft green background.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTone0006', 0, () => {
      expect(toneTextColor(WidgetTone.SUCCESS)).assertEqual(AppColors.SUCCESS);
      expect(toneSoftColor(WidgetTone.SUCCESS)).assertEqual(AppColors.SUCCESS_SOFT);
      expect(toneTextColor(WidgetTone.SUCCESS) === toneSoftColor(WidgetTone.SUCCESS)).assertFalse();
      expect(toneSoftColor(WidgetTone.SUCCESS) === AppColors.CARD_BG).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TONE_0700
     * @tc.name testTone0007
     * @tc.desc Verify the warning tone paints amber text on the matching soft amber background.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTone0007', 0, () => {
      expect(toneTextColor(WidgetTone.WARNING)).assertEqual(AppColors.WARNING);
      expect(toneSoftColor(WidgetTone.WARNING)).assertEqual(AppColors.WARNING_SOFT);
      expect(toneTextColor(WidgetTone.WARNING) === toneSoftColor(WidgetTone.WARNING)).assertFalse();
      expect(toneSoftColor(WidgetTone.WARNING) === AppColors.CARD_BG).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TONE_0800
     * @tc.name testTone0008
     * @tc.desc Verify the danger tone paints red text on the matching soft red background.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTone0008', 0, () => {
      expect(toneTextColor(WidgetTone.DANGER)).assertEqual(AppColors.DANGER);
      expect(toneSoftColor(WidgetTone.DANGER)).assertEqual(AppColors.DANGER_SOFT);
      expect(toneTextColor(WidgetTone.DANGER) === toneSoftColor(WidgetTone.DANGER)).assertFalse();
      expect(toneSoftColor(WidgetTone.DANGER) === AppColors.CARD_BG).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TONE_0900
     * @tc.name testTone0009
     * @tc.desc Verify the neutral tone falls back to secondary text on the plain soft background.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTone0009', 0, () => {
      // NEUTRAL 没有专属 case，走的是 switch 的 default 分支
      expect(toneTextColor(WidgetTone.NEUTRAL)).assertEqual(AppColors.TEXT_SECONDARY);
      expect(toneSoftColor(WidgetTone.NEUTRAL)).assertEqual(AppColors.SOFT_BG);
      expect(toneTextColor(WidgetTone.NEUTRAL) === AppColors.PRIMARY).assertFalse();
      expect(toneSoftColor(WidgetTone.NEUTRAL) === AppColors.PRIMARY_SOFT).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TONE_1000
     * @tc.name testTone0010
     * @tc.desc Verify the five text colours are pairwise distinct and all come from the palette.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTone0010', 0, () => {
      const colors = textColors();
      expect(colors.length).assertEqual(5);
      expect(uniqueCount(colors)).assertEqual(5);
      for (let i = 0; i < colors.length; i++) {
        expect(PALETTE.includes(colors[i])).assertTrue();
      }
      expect(colors[0]).assertEqual(AppColors.TEXT_SECONDARY);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TONE_1100
     * @tc.name testTone0011
     * @tc.desc Verify the five soft backgrounds are pairwise distinct and all come from the palette.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTone0011', 0, () => {
      const colours = softColors();
      expect(colours.length).assertEqual(5);
      expect(uniqueCount(colours)).assertEqual(5);
      for (let i = 0; i < colours.length; i++) {
        expect(PALETTE.includes(colours[i])).assertTrue();
      }
      expect(colours[0]).assertEqual(AppColors.SOFT_BG);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TONE_1200
     * @tc.name testTone0012
     * @tc.desc Verify each soft background stays visible on both the card and the page background.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testTone0012', 0, () => {
      const colours = softColors();
      for (let i = 0; i < colours.length; i++) {
        expect(colours[i] === AppColors.CARD_BG).assertFalse();
        expect(colours[i] === AppColors.PAGE_BG).assertFalse();
      }
      expect(AppColors.PAGE_BG === AppColors.CARD_BG).assertFalse();
      expect(uniqueCount(colours)).assertEqual(5);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TONE_1300
     * @tc.name testTone0013
     * @tc.desc Verify all ten rendered colours are seven character uppercase hex literals.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testTone0013', 0, () => {
      const all: string[] = [];
      const texts = textColors();
      const softs = softColors();
      for (let i = 0; i < texts.length; i++) {
        all.push(texts[i]);
        all.push(softs[i]);
      }
      expect(all.length).assertEqual(10);
      for (let i = 0; i < all.length; i++) {
        expect(isHexColor(all[i])).assertTrue();
        expect(all[i]).assertEqual(all[i].toUpperCase());
      }
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TONE_1400
     * @tc.name testTone0014
     * @tc.desc Verify every tone owns a unique foreground and background pair.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testTone0014', 0, () => {
      const pairs: string[] = [];
      for (let i = 0; i < TONE_ALL.length; i++) {
        pairs.push(`${toneTextColor(TONE_ALL[i])}|${toneSoftColor(TONE_ALL[i])}`);
      }
      expect(pairs.length).assertEqual(5);
      expect(uniqueCount(pairs)).assertEqual(5);
      expect(pairs[1]).assertEqual(`${AppColors.PRIMARY}|${AppColors.PRIMARY_SOFT}`);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TONE_1500
     * @tc.name testTone0015
     * @tc.desc Verify every tone keeps its text darker than its own background.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTone0015', 0, () => {
      for (let i = 0; i < TONE_ALL.length; i++) {
        const text = toneTextColor(TONE_ALL[i]);
        const soft = toneSoftColor(TONE_ALL[i]);
        expect(luma(text) < luma(soft)).assertTrue();
        expect(luma(soft) - luma(text) > 40000).assertTrue();
      }
      expect(luma(toneTextColor(WidgetTone.NEUTRAL))).assertEqual(luma(AppColors.TEXT_SECONDARY));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TONE_1600
     * @tc.name testTone0016
     * @tc.desc Verify dark text stays below the light background band for all five tones.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testTone0016', 0, () => {
      const texts = textColors();
      const softs = softColors();
      for (let i = 0; i < texts.length; i++) {
        expect(luma(texts[i]) < 180000).assertTrue();
        expect(luma(softs[i]) > 235000).assertTrue();
      }
      expect(luma(AppColors.WHITE)).assertEqual(255000);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TONE_1700
     * @tc.name testTone0017
     * @tc.desc Verify the neutral background is slightly darker than white yet still a light fill.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testTone0017', 0, () => {
      const neutral = toneSoftColor(WidgetTone.NEUTRAL);
      expect(luma(neutral) < luma(AppColors.CARD_BG)).assertTrue();
      expect(luma(neutral) > 230000).assertTrue();
      expect(neutral).assertEqual(AppColors.SOFT_BG);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TONE_1800
     * @tc.name testTone0018
     * @tc.desc Verify the hue of each semantic tone from its channel values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testTone0018', 0, () => {
      const primary = toneTextColor(WidgetTone.PRIMARY);
      expect(blueChannel(primary) > redChannel(primary)).assertTrue();
      expect(blueChannel(primary) > greenChannel(primary)).assertTrue();
      const success = toneTextColor(WidgetTone.SUCCESS);
      expect(greenChannel(success) > redChannel(success)).assertTrue();
      expect(greenChannel(success) > blueChannel(success)).assertTrue();
      const warning = toneTextColor(WidgetTone.WARNING);
      expect(redChannel(warning) > greenChannel(warning)).assertTrue();
      expect(greenChannel(warning) > blueChannel(warning)).assertTrue();
      const danger = toneTextColor(WidgetTone.DANGER);
      expect(redChannel(danger) > greenChannel(danger)).assertTrue();
      expect(redChannel(danger) > 200).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TONE_1900
     * @tc.name testTone0019
     * @tc.desc Verify repeated rendering of the same tone never drifts.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testTone0019', 0, () => {
      const text = toneTextColor(WidgetTone.PRIMARY);
      const soft = toneSoftColor(WidgetTone.PRIMARY);
      let stable = true;
      for (let i = 0; i < 40; i++) {
        if (toneTextColor(WidgetTone.PRIMARY) !== text || toneSoftColor(WidgetTone.PRIMARY) !== soft) {
          stable = false;
        }
      }
      expect(stable).assertTrue();
      expect(text).assertEqual(AppColors.PRIMARY);
      expect(soft).assertEqual(AppColors.PRIMARY_SOFT);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TONE_2000
     * @tc.name testTone0020
     * @tc.desc Verify the two lookups are independent of the order they are called in.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testTone0020', 0, () => {
      const textFirst = toneTextColor(WidgetTone.WARNING);
      const softFirst = toneSoftColor(WidgetTone.WARNING);
      const softSecond = toneSoftColor(WidgetTone.WARNING);
      const textSecond = toneTextColor(WidgetTone.WARNING);
      expect(textFirst).assertEqual(textSecond);
      expect(softFirst).assertEqual(softSecond);
      expect(textFirst === softFirst).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TONE_2100
     * @tc.name testTone0021
     * @tc.desc Verify rendering a tone does not mutate the enum value it was asked about.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testTone0021', 0, () => {
      const before = `${WidgetTone.SUCCESS}`;
      toneTextColor(WidgetTone.SUCCESS);
      toneSoftColor(WidgetTone.SUCCESS);
      expect(`${WidgetTone.SUCCESS}`).assertEqual(before);
      expect(`${WidgetTone.SUCCESS}`).assertEqual('success');
      expect(TONE_ALL.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TONE_2200
     * @tc.name testTone0022
     * @tc.desc Verify the foreground set and the background set never overlap.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testTone0022', 0, () => {
      const texts = textColors();
      const softs = softColors();
      let overlap = 0;
      for (let i = 0; i < texts.length; i++) {
        if (softs.includes(texts[i])) {
          overlap++;
        }
      }
      expect(overlap).assertEqual(0);
      expect(texts.length).assertEqual(5);
      expect(softs.length).assertEqual(5);
      expect(uniqueCount(texts)).assertEqual(uniqueCount(softs));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TONE_2300
     * @tc.name testTone0023
     * @tc.desc Verify every rendered colour is declared in the palette instead of hard coded here.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testTone0023', 0, () => {
      const all: string[] = [];
      const texts = textColors();
      const softs = softColors();
      for (let i = 0; i < texts.length; i++) {
        all.push(texts[i]);
        all.push(softs[i]);
      }
      let missing = 0;
      for (let i = 0; i < all.length; i++) {
        if (!PALETTE.includes(all[i])) {
          missing++;
        }
      }
      expect(missing).assertEqual(0);
      expect(all.length).assertEqual(10);
      expect(PALETTE.length).assertEqual(20);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TONE_2400
     * @tc.name testTone0024
     * @tc.desc Verify success and danger sit on opposite hues so the two never read the same.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testTone0024', 0, () => {
      const success = toneTextColor(WidgetTone.SUCCESS);
      const danger = toneTextColor(WidgetTone.DANGER);
      expect(redChannel(danger) > redChannel(success)).assertTrue();
      expect(greenChannel(success) > greenChannel(danger)).assertTrue();
      expect(redChannel(danger) - redChannel(success) > 150).assertTrue();
      expect(greenChannel(success) - greenChannel(danger) > 80).assertTrue();
    });
  });
}
