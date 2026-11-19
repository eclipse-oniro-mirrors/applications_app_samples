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
import { beforeAll, describe, expect, it } from '@ohos/hypium';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { bundleManager } from '@kit.AbilityKit';
import { resourceManager } from '@kit.LocalizationKit';

/**
 * Resource and bundle contract suite. These cases do not start the page and do
 * not use UiTest; they validate that the resources referenced by Index.ets and
 * SkeletonLayout.ets still exist with sane relative values.
 */
let manager: resourceManager.ResourceManager;

export default function resourceContractTest(): void {
  describe('ResourceContractTest', (): void => {
    beforeAll((): void => {
      manager = abilityDelegatorRegistry
        .getAbilityDelegator()
        .getAppContext().resourceManager;
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_RES_0100
    // @tc.name resourceContractTest001
    // @tc.desc Verify the toggle button string resource matches the page text.
    it('resourceContractTest001', 0, async (): Promise<void> => {
      const text: string = manager.getStringSync(
        $r('app.string.custom_animation_tab_button_text'),
      );
      expect(text).assertEqual('\u4fee\u6539\u80cc\u666f\u6761\u989c\u8272');
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_RES_0200
    // @tc.name resourceContractTest002
    // @tc.desc Verify selected tab font is larger than the unselected font.
    it('resourceContractTest002', 0, async (): Promise<void> => {
      const selected: number = manager.getNumber(
        $r('app.float.custom_animation_tab_list_select_font_size'),
      );
      const unselected: number = manager.getNumber(
        $r('app.float.custom_animation_tab_list_unselect_font_size'),
      );
      expect(selected > unselected).assertTrue();
      expect(unselected > 0).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_RES_0300
    // @tc.name resourceContractTest003
    // @tc.desc Verify the selected/unselected font size ratio matches 18/17.
    it('resourceContractTest003', 0, async (): Promise<void> => {
      const selected: number = manager.getNumber(
        $r('app.float.custom_animation_tab_list_select_font_size'),
      );
      const unselected: number = manager.getNumber(
        $r('app.float.custom_animation_tab_list_unselect_font_size'),
      );
      const ratio: number = selected / unselected;
      expect(Math.abs(ratio - 18 / 17) < 0.05).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_RES_0400
    // @tc.name resourceContractTest004
    // @tc.desc Verify large and small skeleton border radii match.
    it('resourceContractTest004', 0, async (): Promise<void> => {
      const large: number = manager.getNumber(
        $r('app.float.custom_animation_tab_ske_large_border_radius'),
      );
      const small: number = manager.getNumber(
        $r('app.float.custom_animation_tab_ske_small_border_radius'),
      );
      expect(large).assertEqual(small);
      expect(large > 0).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_RES_0500
    // @tc.name resourceContractTest005
    // @tc.desc Verify the extra small radius is smaller than the large radius.
    it('resourceContractTest005', 0, async (): Promise<void> => {
      const large: number = manager.getNumber(
        $r('app.float.custom_animation_tab_ske_large_border_radius'),
      );
      const tiny: number = manager.getNumber(
        $r('app.float.custom_animation_tab_ske_xs_border_radius'),
      );
      expect(tiny > 0).assertTrue();
      expect(tiny < large).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_RES_0600
    // @tc.name resourceContractTest006
    // @tc.desc Verify the skeleton topic width resource is positive.
    it('resourceContractTest006', 0, async (): Promise<void> => {
      const width: number = manager.getNumber(
        $r('app.float.custom_animation_tab_ske_lg_topic_width'),
      );
      expect(width > 0).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_RES_0700
    // @tc.name resourceContractTest007
    // @tc.desc Verify the skeleton topic height resource is positive.
    it('resourceContractTest007', 0, async (): Promise<void> => {
      const height: number = manager.getNumber(
        $r('app.float.custom_animation_tab_ske_topic_height'),
      );
      expect(height > 0).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_RES_0800
    // @tc.name resourceContractTest008
    // @tc.desc Verify the action area is taller than the topic tag.
    it('resourceContractTest008', 0, async (): Promise<void> => {
      const action: number = manager.getNumber(
        $r('app.float.custom_animation_tab_ske_action_area_height'),
      );
      const topic: number = manager.getNumber(
        $r('app.float.custom_animation_tab_ske_topic_height'),
      );
      expect(action > topic).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_RES_0900
    // @tc.name resourceContractTest009
    // @tc.desc Verify the row height is taller than the action area.
    it('resourceContractTest009', 0, async (): Promise<void> => {
      const row: number = manager.getNumber(
        $r('app.float.custom_animation_tab_ske_row_height'),
      );
      const action: number = manager.getNumber(
        $r('app.float.custom_animation_tab_ske_action_area_height'),
      );
      expect(row > action).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_RES_1000
    // @tc.name resourceContractTest010
    // @tc.desc Verify the card height is taller than the row height.
    it('resourceContractTest010', 0, async (): Promise<void> => {
      const card: number = manager.getNumber(
        $r('app.float.custom_animation_tab_ske_card_height'),
      );
      const row: number = manager.getNumber(
        $r('app.float.custom_animation_tab_ske_row_height'),
      );
      expect(card > row).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_RES_1100
    // @tc.name resourceContractTest011
    // @tc.desc Verify title and text placeholder heights match.
    it('resourceContractTest011', 0, async (): Promise<void> => {
      const title: number = manager.getNumber(
        $r('app.float.custom_animation_tab_ske_card_title_height'),
      );
      const text: number = manager.getNumber(
        $r('app.float.custom_animation_tab_ske_card_text_height'),
      );
      expect(title).assertEqual(text);
      expect(title > 0).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_RES_1200
    // @tc.name resourceContractTest012
    // @tc.desc Verify the image placeholder is shorter than the card.
    it('resourceContractTest012', 0, async (): Promise<void> => {
      const image: number = manager.getNumber(
        $r('app.float.custom_animation_tab_ske_image_height'),
      );
      const card: number = manager.getNumber(
        $r('app.float.custom_animation_tab_ske_card_height'),
      );
      expect(image > 0).assertTrue();
      expect(image < card).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_RES_1300
    // @tc.name resourceContractTest013
    // @tc.desc Verify the skeleton padding is positive and smaller than the row.
    it('resourceContractTest013', 0, async (): Promise<void> => {
      const padding: number = manager.getNumber(
        $r('app.float.custom_animation_tab_ske_md_padding_margin'),
      );
      const row: number = manager.getNumber(
        $r('app.float.custom_animation_tab_ske_row_height'),
      );
      expect(padding > 0).assertTrue();
      expect(padding < row).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_RES_1400
    // @tc.name resourceContractTest014
    // @tc.desc Verify the medium skeleton color resolves to a non-zero value.
    it('resourceContractTest014', 0, async (): Promise<void> => {
      const color: number = manager.getColorSync(
        $r('app.color.custom_animation_tab_skeleton_color_medium'),
      );
      expect(color !== 0).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_RES_1500
    // @tc.name resourceContractTest015
    // @tc.desc Verify the light skeleton color resolves to a non-zero value.
    it('resourceContractTest015', 0, async (): Promise<void> => {
      const color: number = manager.getColorSync(
        $r('app.color.custom_animation_tab_skeleton_color_light'),
      );
      expect(color !== 0).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_RES_1600
    // @tc.name resourceContractTest016
    // @tc.desc Verify the two skeleton colors are different.
    it('resourceContractTest016', 0, async (): Promise<void> => {
      const medium: number = manager.getColorSync(
        $r('app.color.custom_animation_tab_skeleton_color_medium'),
      );
      const light: number = manager.getColorSync(
        $r('app.color.custom_animation_tab_skeleton_color_light'),
      );
      expect(medium !== light).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_RES_1700
    // @tc.name resourceContractTest017
    // @tc.desc Verify the start window background color resolves.
    it('resourceContractTest017', 0, async (): Promise<void> => {
      const color: number = manager.getColorSync(
        $r('app.color.start_window_background'),
      );
      expect(color !== 0).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_RES_1800
    // @tc.name resourceContractTest018
    // @tc.desc Verify the bundle identity exposed by bundleManager.
    it('resourceContractTest018', 0, (): void => {
      const info: bundleManager.BundleInfo =
        bundleManager.getBundleInfoForSelfSync(
          bundleManager.BundleFlag.GET_BUNDLE_INFO_DEFAULT,
        );
      expect(info.name).assertEqual('com.samples.CustomanimationtabSample');
      expect(info.versionName).assertEqual('1.0.0');
      expect(info.versionCode).assertEqual(1000000);
    });
  });
}
