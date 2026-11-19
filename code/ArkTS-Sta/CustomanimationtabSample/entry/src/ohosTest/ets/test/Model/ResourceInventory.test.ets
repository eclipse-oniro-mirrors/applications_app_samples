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
import { resourceManager } from '@kit.LocalizationKit';

/** Per-resource inventory: every name referenced by the page must resolve. */
let manager: resourceManager.ResourceManager;

export default function resourceInventoryTest(): void {
  describe('ResourceInventoryTest', (): void => {
    beforeAll((): void => {
      manager = abilityDelegatorRegistry
        .getAbilityDelegator()
        .getAppContext().resourceManager;
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_INV_0100
    // @tc.name resourceInventoryTest001
    // @tc.desc Verify the selected tab font size resource resolves.
    it('resourceInventoryTest001', 0, async (): Promise<void> => {
      const value: number = manager.getNumber(
        $r('app.float.custom_animation_tab_list_select_font_size'),
      );
      expect(value > 0).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_INV_0200
    // @tc.name resourceInventoryTest002
    // @tc.desc Verify the unselected tab font size resource resolves.
    it('resourceInventoryTest002', 0, async (): Promise<void> => {
      const value: number = manager.getNumber(
        $r('app.float.custom_animation_tab_list_unselect_font_size'),
      );
      expect(value > 0).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_INV_0300
    // @tc.name resourceInventoryTest003
    // @tc.desc Verify the large border radius resource resolves.
    it('resourceInventoryTest003', 0, async (): Promise<void> => {
      const value: number = manager.getNumber(
        $r('app.float.custom_animation_tab_ske_large_border_radius'),
      );
      expect(value > 0).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_INV_0400
    // @tc.name resourceInventoryTest004
    // @tc.desc Verify the small border radius resource resolves.
    it('resourceInventoryTest004', 0, async (): Promise<void> => {
      const value: number = manager.getNumber(
        $r('app.float.custom_animation_tab_ske_small_border_radius'),
      );
      expect(value > 0).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_INV_0500
    // @tc.name resourceInventoryTest005
    // @tc.desc Verify the extra small border radius resource resolves.
    it('resourceInventoryTest005', 0, async (): Promise<void> => {
      const value: number = manager.getNumber(
        $r('app.float.custom_animation_tab_ske_xs_border_radius'),
      );
      expect(value > 0).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_INV_0600
    // @tc.name resourceInventoryTest006
    // @tc.desc Verify the large topic width resource resolves.
    it('resourceInventoryTest006', 0, async (): Promise<void> => {
      const value: number = manager.getNumber(
        $r('app.float.custom_animation_tab_ske_lg_topic_width'),
      );
      expect(value > 0).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_INV_0700
    // @tc.name resourceInventoryTest007
    // @tc.desc Verify the topic height resource resolves.
    it('resourceInventoryTest007', 0, async (): Promise<void> => {
      const value: number = manager.getNumber(
        $r('app.float.custom_animation_tab_ske_topic_height'),
      );
      expect(value > 0).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_INV_0800
    // @tc.name resourceInventoryTest008
    // @tc.desc Verify the action area height resource resolves.
    it('resourceInventoryTest008', 0, async (): Promise<void> => {
      const value: number = manager.getNumber(
        $r('app.float.custom_animation_tab_ske_action_area_height'),
      );
      expect(value > 0).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_INV_0900
    // @tc.name resourceInventoryTest009
    // @tc.desc Verify the card height resource resolves.
    it('resourceInventoryTest009', 0, async (): Promise<void> => {
      const value: number = manager.getNumber(
        $r('app.float.custom_animation_tab_ske_card_height'),
      );
      expect(value > 0).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_INV_1000
    // @tc.name resourceInventoryTest010
    // @tc.desc Verify the card title height resource resolves.
    it('resourceInventoryTest010', 0, async (): Promise<void> => {
      const value: number = manager.getNumber(
        $r('app.float.custom_animation_tab_ske_card_title_height'),
      );
      expect(value > 0).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_INV_1100
    // @tc.name resourceInventoryTest011
    // @tc.desc Verify the card text height resource resolves.
    it('resourceInventoryTest011', 0, async (): Promise<void> => {
      const value: number = manager.getNumber(
        $r('app.float.custom_animation_tab_ske_card_text_height'),
      );
      expect(value > 0).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_INV_1200
    // @tc.name resourceInventoryTest012
    // @tc.desc Verify the image height resource resolves.
    it('resourceInventoryTest012', 0, async (): Promise<void> => {
      const value: number = manager.getNumber(
        $r('app.float.custom_animation_tab_ske_image_height'),
      );
      expect(value > 0).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_INV_1300
    // @tc.name resourceInventoryTest013
    // @tc.desc Verify the medium padding resource resolves.
    it('resourceInventoryTest013', 0, async (): Promise<void> => {
      const value: number = manager.getNumber(
        $r('app.float.custom_animation_tab_ske_md_padding_margin'),
      );
      expect(value > 0).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_INV_1400
    // @tc.name resourceInventoryTest014
    // @tc.desc Verify the row height resource resolves.
    it('resourceInventoryTest014', 0, async (): Promise<void> => {
      const value: number = manager.getNumber(
        $r('app.float.custom_animation_tab_ske_row_height'),
      );
      expect(value > 0).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_INV_1500
    // @tc.name resourceInventoryTest015
    // @tc.desc Verify the medium skeleton color resource resolves.
    it('resourceInventoryTest015', 0, async (): Promise<void> => {
      const value: number = manager.getColorSync(
        $r('app.color.custom_animation_tab_skeleton_color_medium'),
      );
      expect(value !== 0).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_INV_1600
    // @tc.name resourceInventoryTest016
    // @tc.desc Verify the light skeleton color resource resolves.
    it('resourceInventoryTest016', 0, async (): Promise<void> => {
      const value: number = manager.getColorSync(
        $r('app.color.custom_animation_tab_skeleton_color_light'),
      );
      expect(value !== 0).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_INV_1700
    // @tc.name resourceInventoryTest017
    // @tc.desc Verify the start window background color resolves.
    it('resourceInventoryTest017', 0, async (): Promise<void> => {
      const value: number = manager.getColorSync(
        $r('app.color.start_window_background'),
      );
      expect(value !== 0).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_INV_1800
    // @tc.name resourceInventoryTest018
    // @tc.desc Verify the toggle button string resource value.
    it('resourceInventoryTest018', 0, async (): Promise<void> => {
      const value: string = manager.getStringSync(
        $r('app.string.custom_animation_tab_button_text'),
      );
      expect(value).assertEqual('\u4fee\u6539\u80cc\u666f\u6761\u989c\u8272');
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_INV_1900
    // @tc.name resourceInventoryTest019
    // @tc.desc Verify the EntryAbility label resource value.
    it('resourceInventoryTest019', 0, async (): Promise<void> => {
      const value: string = manager.getStringSync(
        $r('app.string.EntryAbility_label'),
      );
      expect(value).assertEqual('CustomanimationtabSample');
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_INV_2000
    // @tc.name resourceInventoryTest020
    // @tc.desc Verify the home icon media resource is non-empty.
    it('resourceInventoryTest020', 0, async (): Promise<void> => {
      const content: Uint8Array = await manager.getMediaContent(
        $r('app.media.return_home_fill'),
      );
      expect(content.length > 0).assertTrue();
    });
  });
}
