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
 * String resource table of the module.
 * Values are checked by family: one case walks every entry of a family and
 * compares it with the design value, so the table stays a single contract
 * instead of one near identical case per entry. Properties that apply to the
 * whole table - non emptiness, percent suffix, casing, padding - keep their
 * own cases below.
 */
class TextEntry {
  public readonly resource: Resource;
  public readonly expected: string;
  constructor(resource: Resource, expected: string) {
    this.resource = resource;
    this.expected = expected;
  }
}
export default function stringResourceTest() {
  describe('StringResourceTest', () => {
    beforeAll(async (): Promise<void> => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_STRING_0100
     * @tc.name ActionLabels001
     * @tc.desc Verify action labels
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ActionLabels_001', 0, (): void => {
      Logger.info(TAG, 'ActionLabels_001 begin');
      const entries: Array<TextEntry> = [
        new TextEntry($r('app.string.publish_multimedia_updates_share'), '分享'),
        new TextEntry($r('app.string.publish_multimedia_updates_thumbs_up'), '点赞'),
        new TextEntry($r('app.string.publish_multimedia_updates_message'), '评论'),
        new TextEntry($r('app.string.image_comment_publish'), '发布')
      ];
      let mismatched: number = 0;
      for (let index: number = 0; index < entries.length; index++) {
        const value: string = manager.getStringSync(entries[index].resource);
        if (value !== entries[index].expected) {
          mismatched += 1;
        }
      }
      Logger.info(TAG, 'mismatched=' + mismatched);
      expect(mismatched).assertEqual(0);
      Logger.info(TAG, 'ActionLabels_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_STRING_0200
     * @tc.name LayoutPercentages002
     * @tc.desc Verify layout percentages
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'LayoutPercentages_002', 0, (): void => {
      Logger.info(TAG, 'LayoutPercentages_002 begin');
      const entries: Array<TextEntry> = [
        new TextEntry($r('app.string.publish_multimedia_updates_layout_100'), '100%'),
        new TextEntry($r('app.string.publish_multimedia_updates_layout_94'), '94%'),
        new TextEntry($r('app.string.publish_multimedia_updates_layout_40'), '40%'),
        new TextEntry($r('app.string.publish_multimedia_updates_layout_30'), '30%'),
        new TextEntry($r('app.string.publish_multimedia_updates_jump_position_x'), '50%'),
        new TextEntry($r('app.string.publish_multimedia_updates_jump_position_y'), '90%'),
        new TextEntry($r('app.string.publish_multimedia_updates_jump_markAnchor_x'), '50%')
      ];
      let mismatched: number = 0;
      for (let index: number = 0; index < entries.length; index++) {
        const value: string = manager.getStringSync(entries[index].resource);
        if (value !== entries[index].expected) {
          mismatched += 1;
        }
      }
      Logger.info(TAG, 'mismatched=' + mismatched);
      expect(mismatched).assertEqual(0);
      Logger.info(TAG, 'LayoutPercentages_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_STRING_0300
     * @tc.name ToolbarLabels003
     * @tc.desc Verify toolbar labels
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ToolbarLabels_003', 0, (): void => {
      Logger.info(TAG, 'ToolbarLabels_003 begin');
      const entries: Array<TextEntry> = [
        new TextEntry($r('app.string.toolbarList_home'), 'Home'),
        new TextEntry($r('app.string.toolbarList_discover'), 'Discover'),
        new TextEntry($r('app.string.toolbarList_Super_Group'), 'Super Group'),
        new TextEntry($r('app.string.toolbarList_Message'), 'Message'),
        new TextEntry($r('app.string.toolbarList_more'), 'more')
      ];
      let mismatched: number = 0;
      for (let index: number = 0; index < entries.length; index++) {
        const value: string = manager.getStringSync(entries[index].resource);
        if (value !== entries[index].expected) {
          mismatched += 1;
        }
      }
      Logger.info(TAG, 'mismatched=' + mismatched);
      expect(mismatched).assertEqual(0);
      Logger.info(TAG, 'ToolbarLabels_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_STRING_0400
     * @tc.name TabAndMenuLabels004
     * @tc.desc Verify tab and menu labels
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'TabAndMenuLabels_004', 0, (): void => {
      Logger.info(TAG, 'TabAndMenuLabels_004 begin');
      const entries: Array<TextEntry> = [
        new TextEntry($r('app.string.publish_multimedia_updates_following'), 'Following'),
        new TextEntry($r('app.string.publish_multimedia_updates_for_you'), 'For You'),
        new TextEntry($r('app.string.publish_multimedia_updates_live'), 'Live'),
        new TextEntry($r('app.string.publish_multimedia_updates_review'), 'Review'),
        new TextEntry($r('app.string.publish_multimedia_updates_video'), 'Video'),
        new TextEntry($r('app.string.publish_multimedia_updates_photo'), 'Photo')
      ];
      let mismatched: number = 0;
      for (let index: number = 0; index < entries.length; index++) {
        const value: string = manager.getStringSync(entries[index].resource);
        if (value !== entries[index].expected) {
          mismatched += 1;
        }
      }
      Logger.info(TAG, 'mismatched=' + mismatched);
      expect(mismatched).assertEqual(0);
      Logger.info(TAG, 'TabAndMenuLabels_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_STRING_0500
     * @tc.name InputHintLabels005
     * @tc.desc Verify input hint labels
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'InputHintLabels_005', 0, (): void => {
      Logger.info(TAG, 'InputHintLabels_005 begin');
      const entries: Array<TextEntry> = [
        new TextEntry($r('app.string.publish_multimedia_updates_input_comment'), '请输入评论内容'),
        new TextEntry($r('app.string.publish_multimedia_updates_input_image'), '请选择图片'),
        new TextEntry($r('app.string.publish_multimedia_updates_input_video'), '请选择视频')
      ];
      let mismatched: number = 0;
      for (let index: number = 0; index < entries.length; index++) {
        const value: string = manager.getStringSync(entries[index].resource);
        if (value !== entries[index].expected) {
          mismatched += 1;
        }
      }
      Logger.info(TAG, 'mismatched=' + mismatched);
      expect(mismatched).assertEqual(0);
      Logger.info(TAG, 'InputHintLabels_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_STRING_0600
     * @tc.name PostLabelKeepsSpace006
     * @tc.desc Verify post label keeps space
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'PostLabelKeepsSpace_006', 0, (): void => {
      Logger.info(TAG, 'PostLabelKeepsSpace_006 begin');
      const text: string = manager.getStringSync($r('app.string.publish_multimedia_updates_post'));
      expect(text).assertEqual('Post ');
      expect(text.length).assertEqual(5);
      expect(text.trim()).assertEqual('Post');
      Logger.info(TAG, 'PostLabelKeepsSpace_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_STRING_0700
     * @tc.name FontFamily007
     * @tc.desc Verify font family
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'FontFamily_007', 0, (): void => {
      Logger.info(TAG, 'FontFamily_007 begin');
      const text: string = manager.getStringSync($r('app.string.publish_multimedia_updates_harmony_hei_ti'));
      expect(text).assertEqual('HarmonyHeiTi');
      Logger.info(TAG, 'FontFamily_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_STRING_0800
     * @tc.name ModuleDescriptionPresent008
     * @tc.desc Verify module description present
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ModuleDescriptionPresent_008', 0, (): void => {
      Logger.info(TAG, 'ModuleDescriptionPresent_008 begin');
      const text: string = manager.getStringSync($r('app.string.module_desc'));
      const present: boolean = text.length !== 0;
      Logger.info(TAG, 'present=' + JSON.stringify(present));
      expect(present).assertTrue();
      Logger.info(TAG, 'ModuleDescriptionPresent_008 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_STRING_0900
     * @tc.name ActionLabelsDistinct009
     * @tc.desc Verify action labels distinct, as covered by the string resource test suite
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ActionLabelsDistinct_009', 0, (): void => {
      Logger.info(TAG, 'ActionLabelsDistinct_009 begin');
      const share: string = manager.getStringSync($r('app.string.publish_multimedia_updates_share'));
      const thumbsUp: string = manager.getStringSync($r('app.string.publish_multimedia_updates_thumbs_up'));
      const comment: string = manager.getStringSync($r('app.string.publish_multimedia_updates_message'));
      const shareDiffersThumbsUp: boolean = share !== thumbsUp;
      expect(shareDiffersThumbsUp).assertTrue();
      const shareDiffersComment: boolean = share !== comment;
      expect(shareDiffersComment).assertTrue();
      const thumbsUpDiffersComment: boolean = thumbsUp !== comment;
      expect(thumbsUpDiffersComment).assertTrue();
      Logger.info(TAG, 'ActionLabelsDistinct_009 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_STRING_1000
     * @tc.name TabLabelsDistinct010
     * @tc.desc Verify tab labels distinct
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'TabLabelsDistinct_010', 0, (): void => {
      Logger.info(TAG, 'TabLabelsDistinct_010 begin');
      const following: string = manager.getStringSync($r('app.string.publish_multimedia_updates_following'));
      const forYou: string = manager.getStringSync($r('app.string.publish_multimedia_updates_for_you'));
      const distinct: boolean = following !== forYou;
      expect(distinct).assertTrue();
      expect(following).assertEqual('Following');
      expect(forYou).assertEqual('For You');
      Logger.info(TAG, 'TabLabelsDistinct_010 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_STRING_1100
     * @tc.name PercentageSuffix011
     * @tc.desc Verify percentage suffix
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'PercentageSuffix_011', 0, (): void => {
      Logger.info(TAG, 'PercentageSuffix_011 begin');
      const percentageIds: Array<Resource> = [
        $r('app.string.publish_multimedia_updates_layout_100'),
        $r('app.string.publish_multimedia_updates_layout_94'),
        $r('app.string.publish_multimedia_updates_layout_40'),
        $r('app.string.publish_multimedia_updates_layout_30'),
        $r('app.string.publish_multimedia_updates_jump_position_x'),
        $r('app.string.publish_multimedia_updates_jump_position_y')
      ];
      let missingSign: number = 0;
      for (let index: number = 0; index < percentageIds.length; index++) {
        const value: string = manager.getStringSync(percentageIds[index]);
        const hasSign: boolean = value.indexOf('%') !== -1;
        if (hasSign === false) {
          missingSign += 1;
        }
      }
      expect(missingSign).assertEqual(0);
      Logger.info(TAG, 'PercentageSuffix_011 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_STRING_1200
     * @tc.name AllStringsNonEmpty012
     * @tc.desc Verify all strings non empty
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AllStringsNonEmpty_012', 0, (): void => {
      Logger.info(TAG, 'AllStringsNonEmpty_012 begin');
      const allIds: Array<Resource> = [
        $r('app.string.module_desc'),
        $r('app.string.publish_multimedia_updates_share'),
        $r('app.string.publish_multimedia_updates_thumbs_up'),
        $r('app.string.publish_multimedia_updates_message'),
        $r('app.string.publish_multimedia_updates_layout_100'),
        $r('app.string.publish_multimedia_updates_jump_position_x'),
        $r('app.string.publish_multimedia_updates_jump_position_y'),
        $r('app.string.publish_multimedia_updates_jump_markAnchor_x'),
        $r('app.string.publish_multimedia_updates_other_function'),
        $r('app.string.image_comment_publish'),
        $r('app.string.toolbarList_more'),
        $r('app.string.toolbarList_Message'),
        $r('app.string.toolbarList_Super_Group'),
        $r('app.string.toolbarList_discover'),
        $r('app.string.toolbarList_home'),
        $r('app.string.publish_multimedia_updates_harmony_hei_ti'),
        $r('app.string.publish_multimedia_updates_layout_94'),
        $r('app.string.publish_multimedia_updates_following'),
        $r('app.string.publish_multimedia_updates_for_you'),
        $r('app.string.publish_multimedia_updates_layout_40'),
        $r('app.string.publish_multimedia_updates_layout_30'),
        $r('app.string.publish_multimedia_updates_live'),
        $r('app.string.publish_multimedia_updates_review'),
        $r('app.string.publish_multimedia_updates_video'),
        $r('app.string.publish_multimedia_updates_photo'),
        $r('app.string.publish_multimedia_updates_post'),
        $r('app.string.publish_multimedia_updates_input_comment'),
        $r('app.string.publish_multimedia_updates_input_video'),
        $r('app.string.publish_multimedia_updates_input_image')
      ];
      let emptyCount: number = 0;
      for (let index: number = 0; index < allIds.length; index++) {
        const value: string = manager.getStringSync(allIds[index]);
        if (value.length === 0) {
          emptyCount += 1;
        }
      }
      expect(allIds.length).assertEqual(29);
      expect(emptyCount).assertEqual(0);
      Logger.info(TAG, 'AllStringsNonEmpty_012 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_STRING_1300
     * @tc.name PercentageNumericPrefix013
     * @tc.desc Verify percentage numeric prefix
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'PercentageNumericPrefix_013', 0, (): void => {
      Logger.info(TAG, 'PercentageNumericPrefix_013 begin');
      const full: string = manager.getStringSync($r('app.string.publish_multimedia_updates_layout_100'));
      const wide: string = manager.getStringSync($r('app.string.publish_multimedia_updates_layout_94'));
      const medium: string = manager.getStringSync($r('app.string.publish_multimedia_updates_layout_40'));
      const narrow: string = manager.getStringSync($r('app.string.publish_multimedia_updates_layout_30'));
      const anchorX: string = manager.getStringSync($r('app.string.publish_multimedia_updates_jump_position_x'));
      const anchorY: string = manager.getStringSync($r('app.string.publish_multimedia_updates_jump_position_y'));
      expect(parseInt(full, 10)).assertEqual(100);
      expect(parseInt(wide, 10)).assertEqual(94);
      expect(parseInt(medium, 10)).assertEqual(40);
      expect(parseInt(narrow, 10)).assertEqual(30);
      expect(parseInt(anchorX, 10)).assertEqual(50);
      expect(parseInt(anchorY, 10)).assertEqual(90);
      Logger.info(TAG, 'PercentageNumericPrefix_013 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_STRING_1400
     * @tc.name ToolbarInitialCase014
     * @tc.desc Verify toolbar initial case
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ToolbarInitialCase_014', 0, (): void => {
      Logger.info(TAG, 'ToolbarInitialCase_014 begin');
      const home: string = manager.getStringSync($r('app.string.toolbarList_home'));
      const discover: string = manager.getStringSync($r('app.string.toolbarList_discover'));
      const message: string = manager.getStringSync($r('app.string.toolbarList_Message'));
      const more: string = manager.getStringSync($r('app.string.toolbarList_more'));
      const homeUpper: boolean = home.charAt(0) === 'H';
      const discoverUpper: boolean = discover.charAt(0) === 'D';
      const messageUpper: boolean = message.charAt(0) === 'M';
      const moreLower: boolean = more.charAt(0) === 'm';
      expect(homeUpper).assertTrue();
      expect(discoverUpper).assertTrue();
      expect(messageUpper).assertTrue();
      expect(moreLower).assertTrue();
      Logger.info(TAG, 'ToolbarInitialCase_014 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_STRING_1500
     * @tc.name HintTextsCarryNoFormatSpecifier015
     * @tc.desc Verify hint texts carry no format specifier
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'HintTextsCarryNoFormatSpecifier_015', 0, (): void => {
      Logger.info(TAG, 'HintTextsCarryNoFormatSpecifier_015 begin');
      const hints: Array<Resource> = [
        $r('app.string.publish_multimedia_updates_other_function'),
        $r('app.string.publish_multimedia_updates_input_comment'),
        $r('app.string.publish_multimedia_updates_input_image'),
        $r('app.string.publish_multimedia_updates_input_video')
      ];
      let withPercent: number = 0;
      for (let index: number = 0; index < hints.length; index++) {
        const value: string = manager.getStringSync(hints[index]);
        if (value.indexOf('%') !== -1) {
          withPercent += 1;
        }
      }
      expect(withPercent).assertEqual(0);
      const stub: string = manager.getStringSync($r('app.string.publish_multimedia_updates_other_function'));
      expect(stub.substring(0, 1)).assertEqual('仅');
      Logger.info(TAG, 'HintTextsCarryNoFormatSpecifier_015 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_STRING_1600
     * @tc.name LabelsHaveNoPadding016
     * @tc.desc Verify labels have no padding
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'LabelsHaveNoPadding_016', 0, (): void => {
      Logger.info(TAG, 'LabelsHaveNoPadding_016 begin');
      const labels: Array<Resource> = [
        $r('app.string.publish_multimedia_updates_share'),
        $r('app.string.publish_multimedia_updates_thumbs_up'),
        $r('app.string.publish_multimedia_updates_message'),
        $r('app.string.publish_multimedia_updates_following'),
        $r('app.string.publish_multimedia_updates_for_you')
      ];
      let padded: number = 0;
      for (let index: number = 0; index < labels.length; index++) {
        const value: string = manager.getStringSync(labels[index]);
        if (value !== value.trim()) {
          padded += 1;
        }
      }
      expect(padded).assertEqual(0);
      const share: string = manager.getStringSync($r('app.string.publish_multimedia_updates_share'));
      expect(share.length).assertEqual(2);
      Logger.info(TAG, 'LabelsHaveNoPadding_016 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_STRING_1700
     * @tc.name ForYouSingleSpace017
     * @tc.desc Verify for you single space
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ForYouSingleSpace_017', 0, (): void => {
      Logger.info(TAG, 'ForYouSingleSpace_017 begin');
      const forYou: string = manager.getStringSync($r('app.string.publish_multimedia_updates_for_you'));
      const firstSpace: number = forYou.indexOf(' ');
      const lastSpace: number = forYou.lastIndexOf(' ');
      expect(firstSpace).assertEqual(3);
      const singleSpace: boolean = firstSpace === lastSpace;
      expect(singleSpace).assertTrue();
      expect(forYou.substring(4)).assertEqual('You');
      Logger.info(TAG, 'ForYouSingleSpace_017 end');
    });
  });
}
