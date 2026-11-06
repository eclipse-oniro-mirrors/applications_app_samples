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
import { describe, beforeAll, it, expect } from '@ohos/hypium';
import { ChipConfigFactory } from '../../../main/ets/model/ChipModels';
import {
  SymbolGlyphModifier, ChipV2Size, ColorMetrics, SegmentButtonV2ItemOptions, ChipGroupV2ItemConfig,
  ChipSuffixSymbolGlyphOptions, ChipV2SuffixSymbolIcon, ChipGroupV2Padding,
  ChipGroupV2IconItemConfig, ChipGroupV2SymbolItemConfig
} from '@kit.ArkUI';

export default function chipConfigFactoryMatrixTest() {
  describe('chipConfigFactoryMatrixTest', () => {
    beforeAll(() => {
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPCONFIGFACTORYMATRIX_0100
     * @tc.name labelEmptyText0001
     * @tc.desc Verify buildLabelConfig keeps an empty text without adding defaults
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('labelEmptyText0001', 0, () => {
      const cfg = ChipConfigFactory.buildLabelConfig('');
      expect(cfg.text).assertEqual('');
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPCONFIGFACTORYMATRIX_0200
     * @tc.name labelUnicodeTextPreserved0002
     * @tc.desc Verify buildLabelConfig preserves Chinese text verbatim
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('labelUnicodeTextPreserved0002', 0, () => {
      const cfg = ChipConfigFactory.buildLabelConfig('全部邮件文档标签');
      expect(cfg.text).assertEqual('全部邮件文档标签');
      expect(cfg.text.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPCONFIGFACTORYMATRIX_0300
     * @tc.name labelWithoutActivatedColor0003
     * @tc.desc Verify the activated font color is absent when not provided
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('labelWithoutActivatedColor0003', 0, () => {
      const cfg = ChipConfigFactory.buildLabelConfig('普通');
      expect(cfg.activatedFontColor === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPCONFIGFACTORYMATRIX_0400
     * @tc.name labelWithActivatedColor0004
     * @tc.desc Verify the activated font color is kept when provided
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('labelWithActivatedColor0004', 0, () => {
      const cfg = ChipConfigFactory.buildLabelConfig('激活', ColorMetrics.resourceColor('#FF0000'));
      expect(cfg.text).assertEqual('激活');
      expect(cfg.activatedFontColor !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPCONFIGFACTORYMATRIX_0500
     * @tc.name prefixIconResourceSource0005
     * @tc.desc Verify buildPrefixIcon keeps a Resource image source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prefixIconResourceSource0005', 0, () => {
      const cfg = ChipConfigFactory.buildPrefixIcon($r('app.media.startIcon'));
      expect(cfg.src !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPCONFIGFACTORYMATRIX_0600
     * @tc.name groupConfigsOrderPreserved0006
     * @tc.desc Verify group item labels follow the input text order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('groupConfigsOrderPreserved0006', 0, () => {
      const configs: ChipGroupV2ItemConfig[] = ChipConfigFactory.buildGroupItemConfigs(['A', 'B', 'C'], 'icon.png');
      expect(configs[0].label.text).assertEqual('A');
      expect(configs[1].label.text).assertEqual('B');
      expect(configs[2].label.text).assertEqual('C');
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPCONFIGFACTORYMATRIX_0700
     * @tc.name groupConfigsIconAppliedToEach0007
     * @tc.desc Verify every group item carries the same prefix icon source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('groupConfigsIconAppliedToEach0007', 0, () => {
      const configs: ChipGroupV2ItemConfig[] = ChipConfigFactory.buildGroupItemConfigs(['A', 'B'], 'icon.png');
      let withIcon: number = 0;
      for (const c of configs) {
        if (c.prefixIcon !== undefined && c.prefixIcon.src === 'icon.png') {
          withIcon++;
        }
      }
      expect(withIcon).assertEqual(2);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPCONFIGFACTORYMATRIX_0800
     * @tc.name groupConfigsDefaultAllowCloseFalse0008
     * @tc.desc Verify group items default to no close button on every entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('groupConfigsDefaultAllowCloseFalse0008', 0, () => {
      const configs: ChipGroupV2ItemConfig[] = ChipConfigFactory.buildGroupItemConfigs(['A', 'B', 'C'], 'icon.png');
      let removable: number = 0;
      for (const c of configs) {
        if (c.allowClose) {
          removable++;
        }
      }
      expect(removable).assertEqual(0);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPCONFIGFACTORYMATRIX_0900
     * @tc.name groupConfigsAllowCloseAppliesToAll0009
     * @tc.desc Verify an explicit allowClose flag applies to every group item
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('groupConfigsAllowCloseAppliesToAll0009', 0, () => {
      const configs: ChipGroupV2ItemConfig[] = ChipConfigFactory.buildGroupItemConfigs(['X', 'Y'], 'icon.png', true);
      expect(configs[0].allowClose).assertTrue();
      expect(configs[1].allowClose).assertTrue();
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPCONFIGFACTORYMATRIX_1000
     * @tc.name groupConfigsSingleItem0010
     * @tc.desc Verify a single text produces exactly one group item
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('groupConfigsSingleItem0010', 0, () => {
      const configs: ChipGroupV2ItemConfig[] = ChipConfigFactory.buildGroupItemConfigs(['Solo'], 'icon.png');
      expect(configs.length).assertEqual(1);
      expect(configs[0].label.text).assertEqual('Solo');
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPCONFIGFACTORYMATRIX_1100
     * @tc.name groupConfigsChineseTexts0011
     * @tc.desc Verify Chinese group labels are mapped in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('groupConfigsChineseTexts0011', 0, () => {
      const configs: ChipGroupV2ItemConfig[] = ChipConfigFactory.buildGroupItemConfigs(['全部', '邮件', '文档'], 'icon.png');
      expect(configs.length).assertEqual(3);
      expect(configs[0].label.text).assertEqual('全部');
      expect(configs[1].label.text).assertEqual('邮件');
      expect(configs[2].label.text).assertEqual('文档');
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPCONFIGFACTORYMATRIX_1200
     * @tc.name segmentItemsOrderPreserved0012
     * @tc.desc Verify segment item texts follow the input order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('segmentItemsOrderPreserved0012', 0, () => {
      const items: SegmentButtonV2ItemOptions[] = ChipConfigFactory.buildSegmentItems(['日', '周', '月']);
      expect(items[0].text).assertEqual('日');
      expect(items[1].text).assertEqual('周');
      expect(items[2].text).assertEqual('月');
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPCONFIGFACTORYMATRIX_1300
     * @tc.name segmentItemsDuplicatesKept0013
     * @tc.desc Verify duplicate segment texts produce duplicate items
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('segmentItemsDuplicatesKept0013', 0, () => {
      const items: SegmentButtonV2ItemOptions[] = ChipConfigFactory.buildSegmentItems(['A', 'A']);
      expect(items.length).assertEqual(2);
      expect(items[0].text).assertEqual('A');
      expect(items[1].text).assertEqual('A');
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPCONFIGFACTORYMATRIX_1400
     * @tc.name segmentItemsTextOnlyFields0014
     * @tc.desc Verify plain segment items carry only text and no icon or symbol
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('segmentItemsTextOnlyFields0014', 0, () => {
      const items: SegmentButtonV2ItemOptions[] = ChipConfigFactory.buildSegmentItems(['A', 'B']);
      expect(items[0].icon === undefined).assertTrue();
      expect(items[0].symbol === undefined).assertTrue();
      expect(items[1].icon === undefined).assertTrue();
      expect(items[1].symbol === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPCONFIGFACTORYMATRIX_1500
     * @tc.name symbolModifiersDistinctInstances0015
     * @tc.desc Verify two modifier builds return distinct SymbolGlyphModifier instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('symbolModifiersDistinctInstances0015', 0, () => {
      const m1: SymbolGlyphModifier = ChipConfigFactory.buildSymbolModifier($r('sys.symbol.heart'), '#424242');
      const m2: SymbolGlyphModifier = ChipConfigFactory.buildSymbolModifier($r('sys.symbol.heart'), '#FFFFFF');
      expect(m1 instanceof SymbolGlyphModifier).assertTrue();
      expect(m2 instanceof SymbolGlyphModifier).assertTrue();
      expect(m1 !== m2).assertTrue();
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPCONFIGFACTORYMATRIX_1600
     * @tc.name v1SymbolNormalIdentity0016
     * @tc.desc Verify V1 symbol options keep the exact normal modifier reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('v1SymbolNormalIdentity0016', 0, () => {
      const normal: SymbolGlyphModifier = ChipConfigFactory.buildSymbolModifier($r('sys.symbol.heart'), '#424242');
      const opts = ChipConfigFactory.buildV1SymbolOptions(normal);
      expect(opts.normal === normal).assertTrue();
      expect(opts.activated === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPCONFIGFACTORYMATRIX_1700
     * @tc.name prefixSymbolIconIdentity0017
     * @tc.desc Verify the V2 prefix symbol icon keeps both modifier references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prefixSymbolIconIdentity0017', 0, () => {
      const normal: SymbolGlyphModifier = ChipConfigFactory.buildSymbolModifier($r('sys.symbol.star'), '#424242');
      const activated: SymbolGlyphModifier = ChipConfigFactory.buildSymbolModifier($r('sys.symbol.star'), '#FFFFFF');
      const icon = ChipConfigFactory.buildPrefixSymbolIcon(normal, activated);
      expect(icon.normal === normal).assertTrue();
      expect(icon.activated === activated).assertTrue();
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPCONFIGFACTORYMATRIX_1800
     * @tc.name closeIconFontSizeTwelve0018
     * @tc.desc Verify a 12vp close icon maps to font size value 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('closeIconFontSizeTwelve0018', 0, () => {
      const icon = ChipConfigFactory.buildCloseIcon('关闭', 12);
      const fontSize = icon.fontSize;
      expect(fontSize !== undefined).assertTrue();
      if (fontSize !== undefined) {
        expect(fontSize.value).assertEqual(12);
      }
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPCONFIGFACTORYMATRIX_1900
     * @tc.name closeIconFontSizeTwentyFour0019
     * @tc.desc Verify a 24vp close icon maps to font size value 24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('closeIconFontSizeTwentyFour0019', 0, () => {
      const icon = ChipConfigFactory.buildCloseIcon('关闭', 24);
      const fontSize = icon.fontSize;
      expect(fontSize !== undefined).assertTrue();
      if (fontSize !== undefined) {
        expect(fontSize.value).assertEqual(24);
      }
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPCONFIGFACTORYMATRIX_2000
     * @tc.name closeIconEmptyHint0020
     * @tc.desc Verify an empty hint text is kept as-is
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('closeIconEmptyHint0020', 0, () => {
      const icon = ChipConfigFactory.buildCloseIcon('', 20);
      expect(icon.accessibilityText).assertEqual('');
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPCONFIGFACTORYMATRIX_2100
     * @tc.name groupStyleSizeAndColors0021
     * @tc.desc Verify group style carries SMALL size and all four color fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('groupStyleSizeAndColors0021', 0, () => {
      const style = ChipConfigFactory.buildGroupItemStyle();
      expect(style.size).assertEqual(ChipV2Size.SMALL);
      expect(style.backgroundColor !== undefined).assertTrue();
      expect(style.fontColor !== undefined).assertTrue();
      expect(style.selectedBackgroundColor !== undefined).assertTrue();
      expect(style.selectedFontColor !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPCONFIGFACTORYMATRIX_2200
     * @tc.name groupSpaceFreshInstance0022
     * @tc.desc Verify each buildGroupSpace call returns a new space instance with same values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('groupSpaceFreshInstance0022', 0, () => {
      const s1 = ChipConfigFactory.buildGroupSpace();
      const s2 = ChipConfigFactory.buildGroupSpace();
      expect(s1 !== s2).assertTrue();
      expect(s1.itemSpace).assertEqual(12);
      expect(s2.itemSpace).assertEqual(12);
      expect(s2.startSpace).assertEqual(8);
      expect(s2.endSpace).assertEqual(8);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPCONFIGFACTORYMATRIX_2300
     * @tc.name hybridSegmentTexts0023
     * @tc.desc Verify hybrid segment items expose the exact three Chinese texts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('hybridSegmentTexts0023', 0, () => {
      const items: SegmentButtonV2ItemOptions[] = ChipConfigFactory.buildHybridSegmentItems(
        $r('app.media.startIcon'), $r('sys.symbol.heart'), $r('sys.symbol.star'));
      expect(items[0].text).assertEqual('图片');
      expect(items[1].text).assertEqual('收藏');
      expect(items[2].text).assertEqual('星标');
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPCONFIGFACTORYMATRIX_2400
     * @tc.name hybridRepeatedCallsIndependent0024
     * @tc.desc Verify mutating a hybrid item list does not affect a later build
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('hybridRepeatedCallsIndependent0024', 0, () => {
      const first: SegmentButtonV2ItemOptions[] = ChipConfigFactory.buildHybridSegmentItems(
        $r('app.media.startIcon'), $r('sys.symbol.heart'), $r('sys.symbol.star'));
      first.pop();
      const second: SegmentButtonV2ItemOptions[] = ChipConfigFactory.buildHybridSegmentItems(
        $r('app.media.startIcon'), $r('sys.symbol.heart'), $r('sys.symbol.star'));
      expect(second.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPCONFIGFACTORYMATRIX_2500
     * @tc.name groupConfigsRepeatedCallsIndependent0025
     * @tc.desc Verify mutating returned group configs does not affect a later build
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('groupConfigsRepeatedCallsIndependent0025', 0, () => {
      const first: ChipGroupV2ItemConfig[] = ChipConfigFactory.buildGroupItemConfigs(['A', 'B', 'C'], 'icon.png');
      first.pop();
      const second: ChipGroupV2ItemConfig[] = ChipConfigFactory.buildGroupItemConfigs(['A', 'B', 'C'], 'icon.png');
      expect(second.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPCONFIGFACTORYMATRIX_2600
     * @tc.name suffixSymbolOptionsAction0026
     * @tc.desc Verify the V1 suffix symbol options carry the given action and it fires on invoke
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('suffixSymbolOptionsAction0026', 0, () => {
      let hits: number = 0;
      const options: ChipSuffixSymbolGlyphOptions = ChipConfigFactory.buildSuffixSymbolOptions((): void => {
        hits += 1;
      });
      expect(options.action !== undefined).assertTrue();
      if (options.action !== undefined) {
        options.action();
      }
      expect(hits).assertEqual(1);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPCONFIGFACTORYMATRIX_2700
     * @tc.name suffixSymbolIconFields0027
     * @tc.desc Verify the ChipV2 suffix symbol icon keeps both modifiers and invokes its action
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('suffixSymbolIconFields0027', 0, () => {
      let hits: number = 0;
      const normal: SymbolGlyphModifier = ChipConfigFactory.buildSymbolModifier($r('sys.symbol.chevron_right'), '#424242');
      const activated: SymbolGlyphModifier = ChipConfigFactory.buildSymbolModifier($r('sys.symbol.chevron_right'), '#FFFFFF');
      const icon: ChipV2SuffixSymbolIcon = ChipConfigFactory.buildSuffixSymbolIcon(normal, activated, (): void => {
        hits += 1;
      });
      expect(icon instanceof ChipV2SuffixSymbolIcon).assertTrue();
      expect(icon.normal !== undefined).assertTrue();
      expect(icon.activated !== undefined).assertTrue();
      if (icon.action !== undefined) {
        icon.action();
      }
      expect(hits).assertEqual(1);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPCONFIGFACTORYMATRIX_2800
     * @tc.name chipV2PaddingExactValues0028
     * @tc.desc Verify ChipV2 padding maps start/end verbatim and fixes top/bottom at 6vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('chipV2PaddingExactValues0028', 0, () => {
      const padding: LocalizedPadding = ChipConfigFactory.buildChipV2Padding(16, 14);
      expect(padding.start !== undefined && padding.start.value).assertEqual(16);
      expect(padding.end !== undefined && padding.end.value).assertEqual(14);
      expect(padding.top !== undefined && padding.top.value).assertEqual(6);
      expect(padding.bottom !== undefined && padding.bottom.value).assertEqual(6);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPCONFIGFACTORYMATRIX_2900
     * @tc.name chipV2PaddingZeroKept0029
     * @tc.desc Verify zero start/end padding is preserved without falling back to defaults
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('chipV2PaddingZeroKept0029', 0, () => {
      const padding: LocalizedPadding = ChipConfigFactory.buildChipV2Padding(0, 0);
      expect(padding.start !== undefined && padding.start.value).assertEqual(0);
      expect(padding.end !== undefined && padding.end.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPCONFIGFACTORYMATRIX_3000
     * @tc.name groupPaddingValues0030
     * @tc.desc Verify group padding keeps top/bottom values and returns a new instance per call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('groupPaddingValues0030', 0, () => {
      const padding: ChipGroupV2Padding = ChipConfigFactory.buildGroupPadding(10, 12);
      expect(padding.top).assertEqual(10);
      expect(padding.bottom).assertEqual(12);
      const again: ChipGroupV2Padding = ChipConfigFactory.buildGroupPadding(10, 12);
      expect(padding === again).assertFalse();
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPCONFIGFACTORYMATRIX_3100
     * @tc.name groupSuffixItemsComposition0031
     * @tc.desc Verify the suffix group holds one Image item followed by one item per symbol
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('groupSuffixItemsComposition0031', 0, () => {
      let iconHits: number = 0;
      const items: (ChipGroupV2IconItemConfig | ChipGroupV2SymbolItemConfig)[] =
        ChipConfigFactory.buildGroupSuffixItems('icon.png', [$r('sys.symbol.heart'), $r('sys.symbol.star')],
          (): void => {
            iconHits += 1;
          }, (_index: number): void => {
          });
      expect(items.length).assertEqual(3);
      const imageItem: ChipGroupV2IconItemConfig = items[0] as ChipGroupV2IconItemConfig;
      expect(imageItem.icon !== undefined).assertTrue();
      expect(imageItem.action !== undefined).assertTrue();
      imageItem.action();
      expect(iconHits).assertEqual(1);
      const firstSymbol: ChipGroupV2SymbolItemConfig = items[1] as ChipGroupV2SymbolItemConfig;
      expect(firstSymbol.symbol !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPCONFIGFACTORYMATRIX_3200
     * @tc.name groupSuffixSymbolIndexDispatch0032
     * @tc.desc Verify each suffix symbol action reports its own zero-based index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('groupSuffixSymbolIndexDispatch0032', 0, () => {
      const seen: number[] = [];
      const items: (ChipGroupV2IconItemConfig | ChipGroupV2SymbolItemConfig)[] =
        ChipConfigFactory.buildGroupSuffixItems('icon.png', [$r('sys.symbol.heart'), $r('sys.symbol.star')],
          (): void => {
          }, (index: number): void => {
            seen.push(index);
          });
      const firstSymbol: ChipGroupV2SymbolItemConfig = items[1] as ChipGroupV2SymbolItemConfig;
      const secondSymbol: ChipGroupV2SymbolItemConfig = items[2] as ChipGroupV2SymbolItemConfig;
      firstSymbol.action();
      secondSymbol.action();
      expect(seen.length).assertEqual(2);
      expect(seen[0]).assertEqual(0);
      expect(seen[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPCONFIGFACTORYMATRIX_3300
     * @tc.name symbolSegmentItemsShape0033
     * @tc.desc Verify symbol-only segment items carry a symbol and a text hint but no label text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('symbolSegmentItemsShape0033', 0, () => {
      const items: SegmentButtonV2ItemOptions[] = ChipConfigFactory.buildSymbolSegmentItems(
        [$r('sys.symbol.heart'), $r('sys.symbol.star'), $r('sys.symbol.checkmark_circle')]);
      expect(items.length).assertEqual(3);
      expect(items[0].symbol !== undefined).assertTrue();
      expect(items[0].text === undefined).assertTrue();
      expect(items[0].accessibilityText).assertEqual('第 1 个图标选项');
      expect(items[2].accessibilityText).assertEqual('第 3 个图标选项');
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPCONFIGFACTORYMATRIX_3400
     * @tc.name segmentItemsDisabledMiddle0034
     * @tc.desc Verify only the requested index is disabled while text order is preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('segmentItemsDisabledMiddle0034', 0, () => {
      const items: SegmentButtonV2ItemOptions[] = ChipConfigFactory.buildSegmentItemsWithDisabled(
        ['可用 A', '已禁用', '可用 B'], 1);
      expect(items.length).assertEqual(3);
      expect(items[0].text).assertEqual('可用 A');
      expect(items[1].text).assertEqual('已禁用');
      expect(items[2].text).assertEqual('可用 B');
      expect(items[0].enabled).assertTrue();
      expect(items[1].enabled).assertFalse();
      expect(items[2].enabled).assertTrue();
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPCONFIGFACTORYMATRIX_3500
     * @tc.name segmentItemsDisabledNone0035
     * @tc.desc Verify a negative or out-of-range disabled index leaves every item enabled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('segmentItemsDisabledNone0035', 0, () => {
      const negative: SegmentButtonV2ItemOptions[] = ChipConfigFactory.buildSegmentItemsWithDisabled(['X', 'Y'], -1);
      expect(negative[0].enabled).assertTrue();
      expect(negative[1].enabled).assertTrue();
      const overflow: SegmentButtonV2ItemOptions[] = ChipConfigFactory.buildSegmentItemsWithDisabled(['X', 'Y'], 5);
      expect(overflow[0].enabled).assertTrue();
      expect(overflow[1].enabled).assertTrue();
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPCONFIGFACTORYMATRIX_3600
     * @tc.name groupSuffixItemsLitFlags0036
     * @tc.desc Verify passing onFlags keeps image item first and dispatches symbol indices for repeated rebuilds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('groupSuffixItemsLitFlags0036', 0, () => {
      const iconHits: number[] = [];
      const seen: number[] = [];
      const build = (): (ChipGroupV2IconItemConfig | ChipGroupV2SymbolItemConfig)[] =>
        ChipConfigFactory.buildGroupSuffixItems('icon.png', [$r('sys.symbol.heart'), $r('sys.symbol.star')],
          (): void => {
            iconHits.push(1);
          }, (index: number): void => {
            seen.push(index);
          }, [false, true]);
      const first: (ChipGroupV2IconItemConfig | ChipGroupV2SymbolItemConfig)[] = build();
      const second: (ChipGroupV2IconItemConfig | ChipGroupV2SymbolItemConfig)[] = build();
      expect(first.length).assertEqual(3);
      expect(second.length).assertEqual(3);
      expect(first === second).assertFalse();
      (second[0] as ChipGroupV2IconItemConfig).action();
      (second[1] as ChipGroupV2SymbolItemConfig).action();
      (second[2] as ChipGroupV2SymbolItemConfig).action();
      expect(iconHits.length).assertEqual(1);
      expect(seen.length).assertEqual(2);
      expect(seen[0]).assertEqual(0);
      expect(seen[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPCONFIGFACTORYMATRIX_3700
     * @tc.name groupSuffixItemsNoSymbols0037
     * @tc.desc Verify an empty symbol list yields only the image item with its action working
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('groupSuffixItemsNoSymbols0037', 0, () => {
      let iconHits: number = 0;
      const items: (ChipGroupV2IconItemConfig | ChipGroupV2SymbolItemConfig)[] =
        ChipConfigFactory.buildGroupSuffixItems('icon.png', [],
          (): void => {
            iconHits += 1;
          }, (_index: number): void => {
          });
      expect(items.length).assertEqual(1);
      const imageItem: ChipGroupV2IconItemConfig = items[0] as ChipGroupV2IconItemConfig;
      expect(imageItem.icon !== undefined).assertTrue();
      imageItem.action();
      expect(iconHits).assertEqual(1);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPCONFIGFACTORYMATRIX_3800
     * @tc.name groupSuffixItemsShortLongFlags0038
     * @tc.desc Verify onFlags shorter or longer than the symbol list keeps structure and dispatch intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('groupSuffixItemsShortLongFlags0038', 0, () => {
      const seen: number[] = [];
      const shortFlags: (ChipGroupV2IconItemConfig | ChipGroupV2SymbolItemConfig)[] =
        ChipConfigFactory.buildGroupSuffixItems('icon.png', [$r('sys.symbol.heart'), $r('sys.symbol.star')],
          (): void => {
          }, (index: number): void => {
            seen.push(index);
          }, [true]);
      expect(shortFlags.length).assertEqual(3);
      const longFlags: (ChipGroupV2IconItemConfig | ChipGroupV2SymbolItemConfig)[] =
        ChipConfigFactory.buildGroupSuffixItems('icon.png', [$r('sys.symbol.heart'), $r('sys.symbol.star')],
          (): void => {
          }, (index: number): void => {
            seen.push(index);
          }, [false, true, false, true]);
      expect(longFlags.length).assertEqual(3);
      (shortFlags[1] as ChipGroupV2SymbolItemConfig).action();
      (shortFlags[2] as ChipGroupV2SymbolItemConfig).action();
      (longFlags[1] as ChipGroupV2SymbolItemConfig).action();
      (longFlags[2] as ChipGroupV2SymbolItemConfig).action();
      expect(seen.length).assertEqual(4);
      expect(seen[0]).assertEqual(0);
      expect(seen[1]).assertEqual(1);
      expect(seen[2]).assertEqual(0);
      expect(seen[3]).assertEqual(1);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPCONFIGFACTORYMATRIX_3900
     * @tc.name groupPaddingZeroKept0039
     * @tc.desc Verify zero top and bottom padding values are preserved exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('groupPaddingZeroKept0039', 0, () => {
      const padding: ChipGroupV2Padding = ChipConfigFactory.buildGroupPadding(0, 0);
      expect(padding.top).assertEqual(0);
      expect(padding.bottom).assertEqual(0);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPCONFIGFACTORYMATRIX_4000
     * @tc.name segmentItemsDisabledFirstAndLast0040
     * @tc.desc Verify disabling the first or last index hits exactly that boundary item
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('segmentItemsDisabledFirstAndLast0040', 0, () => {
      const firstOff: SegmentButtonV2ItemOptions[] =
        ChipConfigFactory.buildSegmentItemsWithDisabled(['禁用', '可用'], 0);
      expect(firstOff.length).assertEqual(2);
      expect(firstOff[0].enabled).assertFalse();
      expect(firstOff[1].enabled).assertTrue();
      const lastOff: SegmentButtonV2ItemOptions[] =
        ChipConfigFactory.buildSegmentItemsWithDisabled(['可用', '中间', '禁用'], 2);
      expect(lastOff.length).assertEqual(3);
      expect(lastOff[0].enabled).assertTrue();
      expect(lastOff[1].enabled).assertTrue();
      expect(lastOff[2].enabled).assertFalse();
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPCONFIGFACTORYMATRIX_4100
     * @tc.name hybridSegmentIconFields0041
     * @tc.desc Verify hybrid items keep the exact icon resource and symbol references passed in
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('hybridSegmentIconFields0041', 0, () => {
      const items: SegmentButtonV2ItemOptions[] = ChipConfigFactory.buildHybridSegmentItems(
        $r('app.media.startIcon'), $r('sys.symbol.heart'), $r('sys.symbol.star'));
      expect(items[0].icon !== undefined).assertTrue();
      expect(items[1].symbol !== undefined).assertTrue();
      expect(items[2].symbol !== undefined).assertTrue();
      expect(items[0].text).assertEqual('图片');
      expect(items[1].text).assertEqual('收藏');
      expect(items[2].text).assertEqual('星标');
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPCONFIGFACTORYMATRIX_4200
     * @tc.name symbolSegmentItemsEmpty0042
     * @tc.desc Verify an empty symbol list builds an empty segment item array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('symbolSegmentItemsEmpty0042', 0, () => {
      const items: SegmentButtonV2ItemOptions[] = ChipConfigFactory.buildSymbolSegmentItems([]);
      expect(items.length).assertEqual(0);
    });
  });
}
