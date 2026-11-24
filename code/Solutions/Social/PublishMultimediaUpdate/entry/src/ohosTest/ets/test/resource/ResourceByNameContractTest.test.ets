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
import resourceManager from '@ohos.resourceManager';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Logger from '../Logger';
import { BUNDLE, TAG } from '../common/TestConstant';
/**
 * Name based resource lookup.
 * The $r based suites resolve resources through compile time ids; this suite
 * resolves the same names through the manager's name index, which is the path
 * used by dynamically configured widgets and by tooling that has no generated
 * reference. A name present in one path but missing in the other is a build
 * packaging defect, so both paths are pinned.
 */
const manager: resourceManager.ResourceManager = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().resourceManager;
export default function resourceByNameContractTest() {
  describe('ResourceByNameContractTest', () => {
    beforeAll(async (): Promise<void> => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_BYNAME_0100
     * @tc.name ToolbarLabelsByName001
     * @tc.desc Verify toolbar labels by name
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ToolbarLabelsByName_001', 0, (): void => {
      Logger.info(TAG, 'ToolbarLabelsByName_001 begin');
      expect(manager.getStringByNameSync('toolbarList_home')).assertEqual('Home');
      expect(manager.getStringByNameSync('toolbarList_discover')).assertEqual('Discover');
      expect(manager.getStringByNameSync('toolbarList_Super_Group')).assertEqual('Super Group');
      expect(manager.getStringByNameSync('toolbarList_Message')).assertEqual('Message');
      expect(manager.getStringByNameSync('toolbarList_more')).assertEqual('more');
      Logger.info(TAG, 'ToolbarLabelsByName_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_BYNAME_0200
     * @tc.name TabCaptionsByName002
     * @tc.desc Verify tab captions by name
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'TabCaptionsByName_002', 0, (): void => {
      Logger.info(TAG, 'TabCaptionsByName_002 begin');
      expect(manager.getStringByNameSync('publish_multimedia_updates_following')).assertEqual('Following');
      expect(manager.getStringByNameSync('publish_multimedia_updates_for_you')).assertEqual('For You');
      Logger.info(TAG, 'TabCaptionsByName_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_BYNAME_0300
     * @tc.name MenuLabelsByName003
     * @tc.desc Verify menu labels by name
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'MenuLabelsByName_003', 0, (): void => {
      Logger.info(TAG, 'MenuLabelsByName_003 begin');
      const pairs: Array<Array<string>> = [
        ['publish_multimedia_updates_post', 'Post '],
        ['publish_multimedia_updates_photo', 'Photo'],
        ['publish_multimedia_updates_video', 'Video'],
        ['publish_multimedia_updates_review', 'Review'],
        ['publish_multimedia_updates_live', 'Live']
      ];
      let wrong: number = 0;
      for (let index: number = 0; index < pairs.length; index++) {
        const actual: string = manager.getStringByNameSync(pairs[index][0]);
        if (actual !== pairs[index][1]) {
          wrong += 1;
        }
      }
      expect(wrong).assertEqual(0);
      Logger.info(TAG, 'MenuLabelsByName_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_BYNAME_0400
     * @tc.name PublishLabelByName004
     * @tc.desc Verify publish label by name
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'PublishLabelByName_004', 0, (): void => {
      Logger.info(TAG, 'PublishLabelByName_004 begin');
      const label: string = manager.getStringByNameSync('image_comment_publish');
      expect(label).assertEqual('发布');
      expect(label.length).assertEqual(2);
      Logger.info(TAG, 'PublishLabelByName_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_BYNAME_0500
     * @tc.name GuardTextsByName005
     * @tc.desc Verify guard texts by name
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'GuardTextsByName_005', 0, (): void => {
      Logger.info(TAG, 'GuardTextsByName_005 begin');
      expect(manager.getStringByNameSync('publish_multimedia_updates_input_comment')).assertEqual('请输入评论内容');
      expect(manager.getStringByNameSync('publish_multimedia_updates_input_image')).assertEqual('请选择图片');
      expect(manager.getStringByNameSync('publish_multimedia_updates_input_video')).assertEqual('请选择视频');
      Logger.info(TAG, 'GuardTextsByName_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_BYNAME_0600
     * @tc.name StubToastByName006
     * @tc.desc Verify stub toast by name
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'StubToastByName_006', 0, (): void => {
      Logger.info(TAG, 'StubToastByName_006 begin');
      const message: string = manager.getStringByNameSync('publish_multimedia_updates_other_function');
      expect(message).assertEqual('仅演示，可自行实现业务功能');
      Logger.info(TAG, 'StubToastByName_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_BYNAME_0700
     * @tc.name LayoutPercentsByName007
     * @tc.desc Verify layout percents by name
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'LayoutPercentsByName_007', 0, (): void => {
      Logger.info(TAG, 'LayoutPercentsByName_007 begin');
      expect(manager.getStringByNameSync('publish_multimedia_updates_layout_100')).assertEqual('100%');
      expect(manager.getStringByNameSync('publish_multimedia_updates_layout_94')).assertEqual('94%');
      expect(manager.getStringByNameSync('publish_multimedia_updates_layout_40')).assertEqual('40%');
      expect(manager.getStringByNameSync('publish_multimedia_updates_layout_30')).assertEqual('30%');
      Logger.info(TAG, 'LayoutPercentsByName_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_BYNAME_0800
     * @tc.name DividerNumbersByName008
     * @tc.desc Verify divider numbers by name
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'DividerNumbersByName_008', 0, (): void => {
      Logger.info(TAG, 'DividerNumbersByName_008 begin');
      expect(manager.getNumberByName('publish_multimedia_updates_divider_width')).assertEqual(1);
      expect(manager.getNumberByName('publish_multimedia_updates_list_divider_margin')).assertEqual(12);
      Logger.info(TAG, 'DividerNumbersByName_008 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_BYNAME_0900
     * @tc.name ImageSizeNumbersByName009
     * @tc.desc Verify image size numbers by name
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ImageSizeNumbersByName_009', 0, (): void => {
      Logger.info(TAG, 'ImageSizeNumbersByName_009 begin');
      expect(manager.getNumberByName('publish_multimedia_updates_single_image_width')).assertEqual(184);
      expect(manager.getNumberByName('publish_multimedia_updates_single_image_height')).assertEqual(112);
      expect(manager.getNumberByName('publish_multimedia_updates_single_image_radius')).assertEqual(16);
      Logger.info(TAG, 'ImageSizeNumbersByName_009 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_BYNAME_1000
     * @tc.name TextColorsByName010
     * @tc.desc Verify text colors by name
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'TextColorsByName_010', 0, (): void => {
      Logger.info(TAG, 'TextColorsByName_010 begin');
      expect(manager.getColorByNameSync('publish_multimedia_updates_title_font_color')).assertEqual(0xFF182431);
      expect(manager.getColorByNameSync('publish_multimedia_updates_divider_color')).assertEqual(0x0C000000);
      Logger.info(TAG, 'TextColorsByName_010 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_BYNAME_1100
     * @tc.name PublishButtonColorByName011
     * @tc.desc Verify publish button color by name
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'PublishButtonColorByName_011', 0, (): void => {
      Logger.info(TAG, 'PublishButtonColorByName_011 begin');
      expect(manager.getColorByNameSync('image_comment_button_publish_background')).assertEqual(0xFFBE1D1D);
      Logger.info(TAG, 'PublishButtonColorByName_011 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_BYNAME_1200
     * @tc.name OpacityByName012
     * @tc.desc Verify opacity by name
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'OpacityByName_012', 0, (): void => {
      Logger.info(TAG, 'OpacityByName_012 begin');
      const opacity: number = manager.getNumberByName('publish_multimedia_updates_opacity');
      const check01: boolean = Math.round(opacity * 10) === 6;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'OpacityByName_012 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_BYNAME_1300
     * @tc.name MissingNameThrows013
     * @tc.desc Verify missing name throws
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'MissingNameThrows_013', 0, (): void => {
      Logger.info(TAG, 'MissingNameThrows_013 begin');
      let threw: boolean = false;
      try {
        manager.getStringByNameSync('publish_multimedia_updates_not_declared');
      }
      catch (error) {
        threw = true;
      }
      const check01: boolean = threw;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'MissingNameThrows_013 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_BYNAME_1400
     * @tc.name RepeatedLookupStable014
     * @tc.desc Verify repeated lookup stable
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'RepeatedLookupStable_014', 0, (): void => {
      Logger.info(TAG, 'RepeatedLookupStable_014 begin');
      const first: string = manager.getStringByNameSync('publish_multimedia_updates_share');
      const second: string = manager.getStringByNameSync('publish_multimedia_updates_share');
      expect(first).assertEqual(second);
      expect(first).assertEqual('分享');
      Logger.info(TAG, 'RepeatedLookupStable_014 end');
    });
  });
}
