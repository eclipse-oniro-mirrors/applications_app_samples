'use static';
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

/**
 * Contract checks for the three real element resource tables:
 *   entry/src/main/resources/base/element/float.json
 *   entry/src/main/resources/base/element/color.json
 *   entry/src/main/resources/base/element/integer.json
 *
 * The static ArkTS mode used by this module feeds resources through the
 * resource compiler and does not expose element tables as importable JSON
 * modules (no resolveJsonModule option in the build profile). The tables below
 * are transcribed from those files; every row keeps the original resource key
 * so the provenance stays auditable against the JSON sources.
 */
import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { floatOf, integerOf, colorOf, FLOAT_ENTRIES, INT_ENTRIES, COLOR_ENTRIES,
  rgbOf, luminanceOf, contrastOf, isBlank, CARD_HEIGHT, IMAGE_HEIGHT,
  TOPIC_WIDTH, ACTION_WIDTH, PADDING, ROW_HEIGHT, BAR_RADIUS, BAR_HEIGHT } from '../Shared/SharedDriver';
import { logSuite } from '../Shared/Support';

export class FloatRow {
  key: string;
  value: number;
  unit: string;

  constructor(key: string, value: number, unit: string) {
    this.key = key;
    this.value = value;
    this.unit = unit;
  }
}

export class ColorRow {
  key: string;
  hex: string;

  constructor(key: string, hex: string) {
    this.key = key;
    this.hex = hex;
  }
}

export class IntRow {
  key: string;
  value: number;

  constructor(key: string, value: number) {
    this.key = key;
    this.value = value;
  }
}

export const FLOAT_CONTRACT: FloatRow[] = [
  new FloatRow('custom_animation_tab_list_select_font_size', 18, 'fp'),
  new FloatRow('custom_animation_tab_list_unselect_font_size', 17, 'fp'),
  new FloatRow('custom_animation_tab_ske_large_border_radius', 8, 'vp'),
  new FloatRow('custom_animation_tab_ske_small_border_radius', 8, 'vp'),
  new FloatRow('custom_animation_tab_ske_xs_border_radius', 4, 'vp'),
  new FloatRow('custom_animation_tab_ske_lg_topic_width', 58, 'vp'),
  new FloatRow('custom_animation_tab_ske_topic_height', 16, 'vp'),
  new FloatRow('custom_animation_tab_ske_action_area_height', 20, 'vp'),
  new FloatRow('custom_animation_tab_ske_card_height', 102, 'vp'),
  new FloatRow('custom_animation_tab_ske_card_title_height', 20, 'vp'),
  new FloatRow('custom_animation_tab_ske_card_text_height', 20, 'vp'),
  new FloatRow('custom_animation_tab_ske_image_height', 80, 'vp'),
  new FloatRow('custom_animation_tab_ske_md_padding_margin', 12, 'vp'),
  new FloatRow('custom_animation_tab_ske_row_height', 40, 'vp')
];

export const COLOR_CONTRACT: ColorRow[] = [
  new ColorRow('start_window_background', '#FFFFFF'),
  new ColorRow('custom_animation_tab_skeleton_color_medium', '#FFF2F3F4'),
  new ColorRow('custom_animation_tab_skeleton_color_light', '#FFECECEC')
];

export const INTEGER_CONTRACT: IntRow[] = [
  new IntRow('multiple_files_download_image_size_fifty', 50),
  new IntRow('multiple_files_download_image_size_twenty_five', 25),
  new IntRow('multiple_files_download_text_font_size_fourteen', 14),
  new IntRow('multiple_files_download_text_font_size_twelve', 12),
  new IntRow('multiple_files_download_text_font_size_twenty_five', 25),
  new IntRow('multiple_files_download_text_font_size_twenty', 20),
  new IntRow('multiple_files_download_padding_twenty', 20),
  new IntRow('multiple_files_download_padding_fifteen', 15),
  new IntRow('multiple_files_download_margin_bottom_eighteen', 18),
  new IntRow('multiple_files_download_margin_bottom_twelve', 12),
  new IntRow('multiple_files_download_margin_top_twenty', 20),
  new IntRow('multiple_files_download_margin_top_seven', 7),
  new IntRow('multiple_files_download_margin_top_five', 5),
  new IntRow('multiple_files_download_progress_height', 5),
  new IntRow('multiple_files_download_border_width', 5),
  new IntRow('multiple_files_download_border_radius', 10),
  new IntRow('multiple_files_download_margin_top_thirty', 30),
  new IntRow('multiple_files_download_margin_left_four', 4),
  new IntRow('multiple_files_download_padding_zero', 0),
  new IntRow('multiple_files_download_padding_five', 5),
  new IntRow('multiple_files_download_height_twenty_six', 26),
  new IntRow('multiple_files_download_borderRadius_eight', 8),
  new IntRow('multiple_files_download_borderRadius_twelve', 12),
  new IntRow('multiple_files_download_history_percentage_fifty', 50),
  new IntRow('multiple_files_download_margin_left_sixty', 60)
];

export default function ResourceContractTest(): void {
  describe('ResourceContractTest', () => {
    beforeAll(() => {
      logSuite('ResourceContractTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout((): void => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('ResourceContractTest', 'end');
    });

    /**
     * @tc.name floatTableMatchesDriverMirror
     * @tc.desc Every float key from the element table matches the driver mirror value.
     * @tc.type Function
     * @tc.level Level0
     */
    it('floatTableMatchesDriverMirror', 0, () => {
      expect(FLOAT_CONTRACT.length).assertEqual(FLOAT_ENTRIES.length);
      for (let i = 0; i < FLOAT_CONTRACT.length; i++) {
        const row: FloatRow = FLOAT_CONTRACT[i];
        expect(row.key.indexOf('custom_animation_tab_')).assertEqual(0);
        expect(floatOf(row.key)).assertEqual(row.value);
        expect(FLOAT_ENTRIES[i].name).assertEqual(row.key);
        expect(FLOAT_ENTRIES[i].value).assertEqual(row.value);
      }
    });

    /**
     * @tc.name floatUnitsSplitIntoFontAndViewportScales
     * @tc.desc Float table splits into two font entries and twelve viewport entries.
     * @tc.type Function
     * @tc.level Level1
     */
    it('floatUnitsSplitIntoFontAndViewportScales', 0, () => {
      let fontRows: number = 0;
      let viewportRows: number = 0;
      for (let i = 0; i < FLOAT_CONTRACT.length; i++) {
        if (FLOAT_CONTRACT[i].unit === 'fp') {
          fontRows++;
        } else if (FLOAT_CONTRACT[i].unit === 'vp') {
          viewportRows++;
        }
      }
      expect(fontRows).assertEqual(2);
      expect(viewportRows).assertEqual(12);
      expect(fontRows + viewportRows).assertEqual(FLOAT_CONTRACT.length);
      expect(isBlank(FLOAT_CONTRACT[0].unit)).assertFalse();
    });

    /**
     * @tc.name floatRadiusScaleGrowsFromExtraSmallToLarge
     * @tc.desc Radius resources grow from extra small to large without inversion.
     * @tc.type Function
     * @tc.level Level1
     */
    it('floatRadiusScaleGrowsFromExtraSmallToLarge', 0, () => {
      expect(floatOf('custom_animation_tab_ske_xs_border_radius')).assertEqual(4);
      expect(floatOf('custom_animation_tab_ske_small_border_radius')).assertEqual(8);
      expect(floatOf('custom_animation_tab_ske_large_border_radius')).assertEqual(8);
      expect(floatOf('custom_animation_tab_ske_xs_border_radius') <
        floatOf('custom_animation_tab_ske_small_border_radius')).assertTrue();
      expect(floatOf('custom_animation_tab_ske_small_border_radius') <=
        floatOf('custom_animation_tab_ske_large_border_radius')).assertTrue();
      expect(floatOf('custom_animation_tab_ske_large_border_radius') <
        floatOf('custom_animation_tab_ske_md_padding_margin')).assertTrue();
    });

    /**
     * @tc.name floatTypographyScaleKeepsSelectedLabelLarger
     * @tc.desc Selected label font is one unit larger than the unselected font.
     * @tc.type Function
     * @tc.level Level1
     */
    it('floatTypographyScaleKeepsSelectedLabelLarger', 0, () => {
      expect(floatOf('custom_animation_tab_list_select_font_size')).assertEqual(18);
      expect(floatOf('custom_animation_tab_list_unselect_font_size')).assertEqual(17);
      expect(floatOf('custom_animation_tab_list_select_font_size') >
        floatOf('custom_animation_tab_list_unselect_font_size')).assertTrue();
      expect(floatOf('custom_animation_tab_list_select_font_size') -
        floatOf('custom_animation_tab_list_unselect_font_size')).assertEqual(1);
      expect(floatOf('custom_animation_tab_list_select_font_size') <
        floatOf('custom_animation_tab_ske_card_height')).assertTrue();
    });

    /**
     * @tc.name floatSpacingScaleFeedsSkeletonGeometry
     * @tc.desc Spacing and skeleton constants equal their declared float resources.
     * @tc.type Function
     * @tc.level Level0
     */
    it('floatSpacingScaleFeedsSkeletonGeometry', 0, () => {
      expect(floatOf('custom_animation_tab_ske_md_padding_margin')).assertEqual(12);
      expect(floatOf('custom_animation_tab_ske_row_height')).assertEqual(40);
      expect(floatOf('custom_animation_tab_ske_card_height')).assertEqual(102);
      expect(floatOf('custom_animation_tab_ske_image_height')).assertEqual(80);
      expect(floatOf('custom_animation_tab_ske_topic_height')).assertEqual(16);
      expect(floatOf('custom_animation_tab_ske_lg_topic_width')).assertEqual(58);
      expect(floatOf('custom_animation_tab_ske_action_area_height')).assertEqual(20);
      expect(floatOf('custom_animation_tab_ske_card_title_height')).assertEqual(
        floatOf('custom_animation_tab_ske_card_text_height'));
      expect(CARD_HEIGHT).assertEqual(floatOf('custom_animation_tab_ske_card_height'));
      expect(IMAGE_HEIGHT).assertEqual(floatOf('custom_animation_tab_ske_image_height'));
      expect(PADDING).assertEqual(floatOf('custom_animation_tab_ske_md_padding_margin'));
      expect(ROW_HEIGHT).assertEqual(floatOf('custom_animation_tab_ske_row_height'));
      expect(TOPIC_WIDTH).assertEqual(floatOf('custom_animation_tab_ske_lg_topic_width'));
      expect(ACTION_WIDTH).assertEqual(TOPIC_WIDTH);
    });

    /**
     * @tc.name colorTableMatchesHexDeclarations
     * @tc.desc Color table hex strings match the driver mirror for all three keys.
     * @tc.type Function
     * @tc.level Level0
     */
    it('colorTableMatchesHexDeclarations', 0, () => {
      expect(COLOR_CONTRACT.length).assertEqual(COLOR_ENTRIES.length);
      for (let i = 0; i < COLOR_CONTRACT.length; i++) {
        expect(colorOf(COLOR_CONTRACT[i].key)).assertEqual(COLOR_CONTRACT[i].hex);
        expect(COLOR_ENTRIES[i].hex).assertEqual(COLOR_CONTRACT[i].hex);
        // color.json uses RGB for the window background and ARGB for the layers.
        const expectedLength: number = COLOR_CONTRACT[i].key === 'start_window_background' ? 7 : 9;
        expect(COLOR_CONTRACT[i].hex.length).assertEqual(expectedLength);
      }
      expect(colorOf('custom_animation_tab_skeleton_color_medium')).assertEqual('#FFF2F3F4');
      expect(colorOf('custom_animation_tab_skeleton_color_light')).assertEqual('#FFECECEC');
      expect(colorOf('start_window_background')).assertEqual('#FFFFFF');
    });

    /**
     * @tc.name colorSkeletonLayersOrderByLuminance
     * @tc.desc Skeleton layers order light below medium below white by luminance.
     * @tc.type Function
     * @tc.level Level1
     */
    it('colorSkeletonLayersOrderByLuminance', 0, () => {
      const medium: string = '#FFF2F3F4';
      const light: string = '#FFECECEC';
      const white: string = '#FFFFFF';
      expect(luminanceOf(light) < luminanceOf(medium)).assertTrue();
      expect(luminanceOf(medium) < luminanceOf(white)).assertTrue();
      expect(contrastOf(white, medium) > 1).assertTrue();
      expect(contrastOf(light, white) > contrastOf(medium, white)).assertTrue();
      expect(rgbOf(medium)[0]).assertEqual(242);
      expect(rgbOf(light)[0]).assertEqual(236);
      expect(rgbOf(white)[0]).assertEqual(255);
    });

    /**
     * @tc.name colorHexValuesCarryOpaqueAlphaChannel
     * @tc.desc Every color resource carries an opaque alpha channel and valid channels.
     * @tc.type Function
     * @tc.level Level2
     */
    it('colorHexValuesCarryOpaqueAlphaChannel', 0, () => {
      for (let i = 0; i < COLOR_CONTRACT.length; i++) {
        const hex: string = COLOR_CONTRACT[i].hex;
        expect(hex.substring(0, 3)).assertEqual('#FF');
        expect(rgbOf(hex).length).assertEqual(3);
        expect(rgbOf(hex)[0] >= 0 && rgbOf(hex)[0] <= 255).assertTrue();
      }
      expect(contrastOf('#FFFFFF', '#FFFFFF')).assertEqual(1);
    });

    /**
     * @tc.name integerTableMatchesDriverMirror
     * @tc.desc All twenty five integer keys match the driver mirror and stay non negative.
     * @tc.type Function
     * @tc.level Level0
     */
    it('integerTableMatchesDriverMirror', 0, () => {
      expect(INTEGER_CONTRACT.length).assertEqual(INT_ENTRIES.length);
      for (let i = 0; i < INTEGER_CONTRACT.length; i++) {
        const row: IntRow = INTEGER_CONTRACT[i];
        expect(row.key.indexOf('multiple_files_download_')).assertEqual(0);
        expect(integerOf(row.key)).assertEqual(row.value);
        expect(INT_ENTRIES[i].value).assertEqual(row.value);
        expect(row.value >= 0).assertTrue();
      }
    });

    /**
     * @tc.name integerNamesDeclareTheirNumericValue
     * @tc.desc Integer key suffixes agree with the declared numeric configuration.
     * @tc.type Function
     * @tc.level Level1
     */
    it('integerNamesDeclareTheirNumericValue', 0, () => {
      expect(integerOf('multiple_files_download_image_size_fifty')).assertEqual(50);
      expect(integerOf('multiple_files_download_image_size_twenty_five')).assertEqual(25);
      expect(integerOf('multiple_files_download_text_font_size_fourteen')).assertEqual(14);
      expect(integerOf('multiple_files_download_text_font_size_twelve')).assertEqual(12);
      expect(integerOf('multiple_files_download_padding_twenty')).assertEqual(20);
      expect(integerOf('multiple_files_download_padding_fifteen')).assertEqual(15);
      expect(integerOf('multiple_files_download_margin_bottom_eighteen')).assertEqual(18);
      expect(integerOf('multiple_files_download_margin_top_seven')).assertEqual(7);
      expect(integerOf('multiple_files_download_margin_left_four')).assertEqual(4);
      expect(integerOf('multiple_files_download_margin_left_sixty')).assertEqual(60);
      expect(integerOf('multiple_files_download_padding_zero')).assertEqual(0);
    });

    /**
     * @tc.name integerTableStaysWithinLayoutRange
     * @tc.desc Integer table stays within layout bounds and contains a single zero entry.
     * @tc.type Function
     * @tc.level Level2
     */
    it('integerTableStaysWithinLayoutRange', 0, () => {
      let maxValue: number = 0;
      let zeros: number = 0;
      for (let i = 0; i < INTEGER_CONTRACT.length; i++) {
        if (INTEGER_CONTRACT[i].value > maxValue) {
          maxValue = INTEGER_CONTRACT[i].value;
        }
        if (INTEGER_CONTRACT[i].value === 0) {
          zeros++;
        }
        expect(INTEGER_CONTRACT[i].value % 1).assertEqual(0);
        expect(INTEGER_CONTRACT[i].value <= 100).assertTrue();
      }
      expect(maxValue).assertEqual(60);
      expect(zeros).assertEqual(1);
      expect(INTEGER_CONTRACT.length).assertEqual(25);
    });

    /**
     * @tc.name resourceKeysAreUniqueAcrossTables
     * @tc.desc Float, color and integer keys are unique across all resource tables.
     * @tc.type Function
     * @tc.level Level1
     */
    it('resourceKeysAreUniqueAcrossTables', 0, () => {
      let keys: string[] = [];
      for (let i = 0; i < FLOAT_CONTRACT.length; i++) { keys.push(FLOAT_CONTRACT[i].key); }
      for (let i = 0; i < COLOR_CONTRACT.length; i++) { keys.push(COLOR_CONTRACT[i].key); }
      for (let i = 0; i < INTEGER_CONTRACT.length; i++) { keys.push(INTEGER_CONTRACT[i].key); }
      let unique: number = 0;
      for (let i = 0; i < keys.length; i++) {
        if (keys.indexOf(keys[i]) === i) { unique++; }
      }
      expect(unique).assertEqual(keys.length);
      expect(keys.length).assertEqual(42);
    });

    /**
     * @tc.name missingResourceKeysReturnNeutralSentinels
     * @tc.desc Unknown resource keys return minus one or an empty string without throwing.
     * @tc.type Function
     * @tc.level Level2
     */
    it('missingResourceKeysReturnNeutralSentinels', 0, () => {
      expect(floatOf('custom_animation_tab_absent')).assertEqual(-1);
      expect(integerOf('multiple_files_download_absent')).assertEqual(-1);
      expect(colorOf('custom_animation_tab_absent')).assertEqual('');
      expect(isBlank(colorOf('custom_animation_tab_absent'))).assertTrue();
    });
  });
}
