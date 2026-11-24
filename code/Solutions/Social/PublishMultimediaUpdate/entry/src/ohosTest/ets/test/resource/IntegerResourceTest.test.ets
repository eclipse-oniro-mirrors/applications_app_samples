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

import { describe, it, expect, beforeAll } from '@ohos/hypium';
import { yieldToEventLoop } from '../common/TestYield';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import resourceManager from '@ohos.resourceManager';
import Logger from '../Logger';
import { BUNDLE, TAG } from '../common/TestConstant';
const manager: resourceManager.ResourceManager = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().resourceManager;
/**
 * Integer resource table of the module.
 * The table holds the fixed sizes, paddings and margins of the page. It is
 * verified in batches: each case walks one slice of the table and compares the
 * resolved number with the value declared in the resource file. Keeping the
 * slices in one loop per batch avoids one near identical case per constant
 * while still naming the exact resource that drifts.
 */
class IntEntry {
  public readonly resource: Resource;
  public readonly expected: number;
  constructor(resource: Resource, expected: number) {
    this.resource = resource;
    this.expected = expected;
  }
}
export default function integerResourceTest() {
  describe('IntegerResourceTest', () => {
    beforeAll(async (): Promise<void> => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_INTEGER_0100
     * @tc.name AllIntegersResolvable001
     * @tc.desc Verify every declared integer resolves and matches its expected value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AllIntegersResolvable_001', 0, (): void => {
      Logger.info(TAG, 'AllIntegersResolvable_001 begin');
      const entries: Array<IntEntry> = [
        new IntEntry($r('app.integer.publish_multimedia_updates_divider_width'), 1),
        new IntEntry($r('app.integer.publish_multimedia_updates_list_divider_margin'), 12),
        new IntEntry($r('app.integer.publish_multimedia_updates_image_group_padding_left'), 60),
        new IntEntry($r('app.integer.publish_multimedia_updates_image_group_padding_right'), 60),
        new IntEntry($r('app.integer.publish_multimedia_updates_thumbsup_margin_left'), 111),
        new IntEntry($r('app.integer.publish_multimedia_updates_message_margin_left'), 24),
        new IntEntry($r('app.integer.publish_multimedia_updates_single_image_width'), 184),
        new IntEntry($r('app.integer.publish_multimedia_updates_single_image_height'), 112),
        new IntEntry($r('app.integer.publish_multimedia_updates_single_image_radius'), 16),
        new IntEntry($r('app.integer.publish_multimedia_updates_icon_play_width'), 40),
        new IntEntry($r('app.integer.publish_multimedia_updates_icon_play_height'), 40),
        new IntEntry($r('app.integer.publish_multimedia_updates_image_borderRadius'), 5),
        new IntEntry($r('app.integer.publish_multimedia_updates_image_margin_right'), 15),
        new IntEntry($r('app.integer.publish_multimedia_updates_image_margin_top'), -55),
        new IntEntry($r('app.integer.publish_multimedia_updates_owner_margin_bottom'), 20),
        new IntEntry($r('app.integer.publish_multimedia_updates_owner_margin_height'), 20),
        new IntEntry($r('app.integer.publish_multimedia_updates_layout_padding_bottom'), 50),
        new IntEntry($r('app.integer.publish_multimedia_updates_oneMoment_width'), 50),
        new IntEntry($r('app.integer.publish_multimedia_updates_oneMoment_height'), 38),
        new IntEntry($r('app.integer.publish_multimedia_updates_useImage_radius'), 50),
        new IntEntry($r('app.integer.publish_multimedia_updates_useName_fontSize'), 16),
        new IntEntry($r('app.integer.publish_multimedia_updates_useName_line_height'), 22),
        new IntEntry($r('app.integer.publish_multimedia_updates_user_image_width'), 40),
        new IntEntry($r('app.integer.publish_multimedia_updates_user_image_height'), 40),
        new IntEntry($r('app.integer.publish_multimedia_updates_user_image_border_radius'), 20),
        new IntEntry($r('app.integer.publish_multimedia_updates_userText_fontSize'), 14),
        new IntEntry($r('app.integer.publish_multimedia_updates_userText_line_height'), 19),
        new IntEntry($r('app.integer.publish_multimedia_updates_userText_margin_top'), 1),
        new IntEntry($r('app.integer.publish_multimedia_updates_user_col_margin_left'), 8),
        new IntEntry($r('app.integer.publish_multimedia_updates_row_padding_left'), 12),
        new IntEntry($r('app.integer.publish_multimedia_updates_row_padding_right'), 16),
        new IntEntry($r('app.integer.publish_multimedia_updates_row_padding_top'), 10),
        new IntEntry($r('app.integer.publish_multimedia_updates_row_padding_bottom'), 11),
        new IntEntry($r('app.integer.publish_multimedia_updates_grid_gap'), 4),
        new IntEntry($r('app.integer.publish_multimedia_updates_grid_width'), 248),
        new IntEntry($r('app.integer.publish_multimedia_updates_grid_height'), 248),
        new IntEntry($r('app.integer.publish_multimedia_updates_time_fontSize'), 12),
        new IntEntry($r('app.integer.publish_multimedia_updates_time_height'), 15),
        new IntEntry($r('app.integer.publish_multimedia_updates_time_width'), 20),
        new IntEntry($r('app.integer.publish_multimedia_updates_handler_icon_width'), 20),
        new IntEntry($r('app.integer.publish_multimedia_updates_handler_icon_height'), 20),
        new IntEntry($r('app.integer.publish_multimedia_updates_handler_text_font_size'), 12),
        new IntEntry($r('app.integer.publish_multimedia_updates_handler_padding_left'), 60),
        new IntEntry($r('app.integer.publish_multimedia_updates_handler_padding_right'), 16),
        new IntEntry($r('app.integer.publish_multimedia_updates_handler_margin_top'), 14),
        new IntEntry($r('app.integer.publish_multimedia_updates_handler_margin_bottom'), 13),
        new IntEntry($r('app.integer.publish_multimedia_updates_layout'), 5),
        new IntEntry($r('app.integer.publish_multimedia_updates_jump_button_radius'), 20),
        new IntEntry($r('app.integer.publish_multimedia_updates_jump_button_height'), 40),
        new IntEntry($r('app.integer.publish_multimedia_updates_jump_button_width'), 200),
        new IntEntry($r('app.integer.image_comment_text_input_height'), 40),
        new IntEntry($r('app.integer.image_comment_text_input_padding_left'), 10),
        new IntEntry($r('app.integer.image_comment_text_input_padding_right'), 50),
        new IntEntry($r('app.integer.image_comment_text_input_padding_top'), 3),
        new IntEntry($r('app.integer.image_comment_text_input_padding_bottom'), 3),
        new IntEntry($r('app.integer.image_comment_text_input_margin_top'), 10),
        new IntEntry($r('app.integer.image_comment_image_camera_margin_top'), 10),
        new IntEntry($r('app.integer.image_comment_button_publish_width'), 60),
        new IntEntry($r('app.integer.image_comment_button_publish_height'), 30),
        new IntEntry($r('app.integer.image_comment_button_publish_border_radius'), 15),
        new IntEntry($r('app.integer.image_comment_image_camera_width'), 30),
        new IntEntry($r('app.integer.image_comment_image_camera_height'), 30),
        new IntEntry($r('app.integer.image_comment_relative_container_input_height'), 50),
        new IntEntry($r('app.integer.image_comment_column_input_padding'), 10),
        new IntEntry($r('app.integer.image_comment_image_avatar_height'), 50),
        new IntEntry($r('app.integer.image_comment_image_avatar_width'), 50),
        new IntEntry($r('app.integer.image_comment_image_avatar_border_radius'), 25),
        new IntEntry($r('app.integer.image_comment_comment_column_info_margin_left'), 5),
        new IntEntry($r('app.integer.image_comment_text_comment_margin_top'), 5),
        new IntEntry($r('app.integer.image_comment_list_comment_image_margin_top'), 5),
        new IntEntry($r('app.integer.image_comment_view_comment_padding'), 10),
        new IntEntry($r('app.integer.image_comment_image_comment_image_width'), 100),
        new IntEntry($r('app.integer.image_comment_image_comment_image_height'), 100),
        new IntEntry($r('app.integer.image_comment_image_comment_image_border_radius'), 5),
        new IntEntry($r('app.integer.image_comment_list_comment_image_space'), 10),
        new IntEntry($r('app.integer.image_comment_list_comment_image_height'), 120),
        new IntEntry($r('app.integer.image_comment_list_comment_image_padding_top'), 10),
        new IntEntry($r('app.integer.image_comment_list_comment_image_padding_bottom'), 10),
        new IntEntry($r('app.integer.image_comment_text_hot_comment_height'), 40),
        new IntEntry($r('app.integer.image_comment_text_hot_comment_padding_left'), 10),
        new IntEntry($r('app.integer.image_comment_text_hot_comment_border_width_bottom'), 1),
        new IntEntry($r('app.integer.image_comment_list_comment_margin_bottom'), 50),
        new IntEntry($r('app.integer.image_comment_text_no_comment_margin_bottom'), 50),
        new IntEntry($r('app.integer.image_comment_text_input_hint_height'), 40),
        new IntEntry($r('app.integer.image_comment_text_input_hint_border_radius'), 30),
        new IntEntry($r('app.integer.image_comment_text_input_hint_padding_left'), 15),
        new IntEntry($r('app.integer.image_comment_text_input_hint_border_width'), 1),
        new IntEntry($r('app.integer.image_comment_row_input_hint_border_width_top'), 1),
        new IntEntry($r('app.integer.image_comment_row_input_hint_height'), 50),
        new IntEntry($r('app.integer.image_comment_column_input_dialog_offset_y'), 20),
        new IntEntry($r('app.integer.image_comment_image_delete_height'), 20),
        new IntEntry($r('app.integer.image_comment_image_delete_width'), 20),
        new IntEntry($r('app.integer.image_comment_image_relative_container_height'), 110),
        new IntEntry($r('app.integer.image_comment_image_relative_container_width'), 110),
        new IntEntry($r('app.integer.image_comment_dialog_offset_x'), 0),
        new IntEntry($r('app.integer.image_comment_dialog_offset_y'), -20),
        new IntEntry($r('app.integer.media_offset_to_right'), 80),
        new IntEntry($r('app.integer.my_add_position_top'), 20),
        new IntEntry($r('app.integer.my_add_position_right'), 5),
        new IntEntry($r('app.integer.camera_position_top'), 15),
        new IntEntry($r('app.integer.camera_position_left'), 10),
        new IntEntry($r('app.integer.toolbar_height'), 56),
        new IntEntry($r('app.integer.publish_multimedia_updates_toolbar_padding_bottom'), 30),
        new IntEntry($r('app.integer.publish_multimedia_updates_toolbar_padding_top'), 0),
        new IntEntry($r('app.integer.publish_multimedia_updates_list_barwidth'), 360),
        new IntEntry($r('app.integer.publish_multimedia_updates_list_barheight'), 56),
        new IntEntry($r('app.integer.publish_multimedia_updates_list_bar_padding_top'), -20)
      ];
      let failures: number = 0;
      for (let index: number = 0; index < entries.length; index++) {
        try {
          const value: number = manager.getNumber(entries[index].resource);
          if (value !== entries[index].expected) {
            failures += 1;
          }
        }
        catch (error) {
          failures += 1;
        }
      }
      Logger.info(TAG, 'failures=' + failures);
      expect(failures).assertEqual(0);
      expect(entries.length).assertEqual(107);
      Logger.info(TAG, 'AllIntegersResolvable_001 end');
    });
  });
}
