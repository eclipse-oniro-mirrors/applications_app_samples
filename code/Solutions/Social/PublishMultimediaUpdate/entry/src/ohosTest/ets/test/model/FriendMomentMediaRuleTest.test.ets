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
import Logger from '../Logger';
import { CommentData, FriendMoment } from 'publishmultimediaupdate/src/main/ets/model/BasicDataSource';
import { mockData } from 'publishmultimediaupdate/src/main/ets/model/mockdata';
import { BUNDLE, TAG } from '../common/TestConstant';
import { buildFullMoment, buildMoment } from '../common/DataFactory';
/**
 * Media visibility rule of a feed row.
 * OneMoment renders an image only when the slot is truthy and differs from the
 * add placeholder, and does the same for video. The rule decides between the
 * three row shapes (text, photo, video), so it is specified here with the same
 * two operands the page uses.
 */
function imageVisible(moment: FriendMoment): boolean {
  if (moment.image === undefined || moment.image === '') {
    return false;
  }
  return JSON.stringify(moment.image) !== JSON.stringify($r('app.media.add'));
}
function videoVisible(moment: FriendMoment): boolean {
  if (moment.video === undefined || moment.video === '') {
    return false;
  }
  return JSON.stringify(moment.video) !== JSON.stringify($r('app.media.add_video'));
}
export default function friendMomentMediaRuleTest() {
  describe('FriendMomentMediaRuleTest', () => {
    beforeAll(async (): Promise<void> => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MEDIARULE_0100
     * @tc.name AbsentImageHidesPhoto001
     * @tc.desc Verify absent image hides photo
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AbsentImageHidesPhoto_001', 0, (): void => {
      Logger.info(TAG, 'AbsentImageHidesPhoto_001 begin');
      const moment: FriendMoment = buildMoment('rule-0100', 'Author', 'text only');
      const shown: boolean = imageVisible(moment);
      Logger.info(TAG, 'shown=' + JSON.stringify(shown));
      expect(shown).assertFalse();
      Logger.info(TAG, 'AbsentImageHidesPhoto_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MEDIARULE_0200
     * @tc.name EmptyImageHidesPhoto002
     * @tc.desc Verify empty image hides photo
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EmptyImageHidesPhoto_002', 0, (): void => {
      Logger.info(TAG, 'EmptyImageHidesPhoto_002 begin');
      const moment: FriendMoment = buildFullMoment('rule-0200', 'Author', 'video row', '', 'file://clip.mp4');
      const shown: boolean = imageVisible(moment);
      Logger.info(TAG, 'shown=' + JSON.stringify(shown));
      expect(shown).assertFalse();
      Logger.info(TAG, 'EmptyImageHidesPhoto_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MEDIARULE_0300
     * @tc.name PlaceholderImageHidesPhoto003
     * @tc.desc Verify placeholder image hides photo
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'PlaceholderImageHidesPhoto_003', 0, (): void => {
      Logger.info(TAG, 'PlaceholderImageHidesPhoto_003 begin');
      const moment: FriendMoment = buildFullMoment('rule-0300', 'Author', 'placeholder', $r('app.media.add'), '');
      const shown: boolean = imageVisible(moment);
      Logger.info(TAG, 'shown=' + JSON.stringify(shown));
      expect(shown).assertFalse();
      Logger.info(TAG, 'PlaceholderImageHidesPhoto_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MEDIARULE_0400
     * @tc.name RealResourceImageShows004
     * @tc.desc Verify real resource image shows
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'RealResourceImageShows_004', 0, (): void => {
      Logger.info(TAG, 'RealResourceImageShows_004 begin');
      const moment: FriendMoment = buildFullMoment('rule-0400', 'Author', 'photo', $r('app.media.publish_photo_bird'), '');
      const shown: boolean = imageVisible(moment);
      Logger.info(TAG, 'shown=' + JSON.stringify(shown));
      expect(shown).assertTrue();
      Logger.info(TAG, 'RealResourceImageShows_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MEDIARULE_0500
     * @tc.name StringUriImageShows005
     * @tc.desc Verify string uri image shows
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'StringUriImageShows_005', 0, (): void => {
      Logger.info(TAG, 'StringUriImageShows_005 begin');
      const moment: FriendMoment = buildFullMoment('rule-0500', 'Author', 'uri', 'file://media/Photo/1/IMG_1.jpg', '');
      const shown: boolean = imageVisible(moment);
      Logger.info(TAG, 'shown=' + JSON.stringify(shown));
      expect(shown).assertTrue();
      Logger.info(TAG, 'StringUriImageShows_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MEDIARULE_0600
     * @tc.name StringNamedAddStillShows006
     * @tc.desc Verify string named add still shows
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'StringNamedAddStillShows_006', 0, (): void => {
      Logger.info(TAG, 'StringNamedAddStillShows_006 begin');
      const moment: FriendMoment = buildFullMoment('rule-0600', 'Author', 'literal', 'add', '');
      const shown: boolean = imageVisible(moment);
      expect(moment.image === 'add').assertTrue();
      expect(shown).assertTrue();
      Logger.info(TAG, 'StringNamedAddStillShows_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MEDIARULE_0700
     * @tc.name AbsentVideoHidesPlayer007
     * @tc.desc Verify absent video hides player
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AbsentVideoHidesPlayer_007', 0, (): void => {
      Logger.info(TAG, 'AbsentVideoHidesPlayer_007 begin');
      const moment: FriendMoment = buildFullMoment('rule-0700', 'Author', 'photo only', $r('app.media.Building'), '');
      const shown: boolean = videoVisible(moment);
      Logger.info(TAG, 'shown=' + JSON.stringify(shown));
      expect(shown).assertFalse();
      Logger.info(TAG, 'AbsentVideoHidesPlayer_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MEDIARULE_0800
     * @tc.name PlaceholderVideoHidesPlayer008
     * @tc.desc Verify placeholder video hides player
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'PlaceholderVideoHidesPlayer_008', 0, (): void => {
      Logger.info(TAG, 'PlaceholderVideoHidesPlayer_008 begin');
      const moment: FriendMoment = buildFullMoment('rule-0800', 'Author', 'placeholder video', '', $r('app.media.add_video'));
      const shown: boolean = videoVisible(moment);
      Logger.info(TAG, 'shown=' + JSON.stringify(shown));
      expect(shown).assertFalse();
      Logger.info(TAG, 'PlaceholderVideoHidesPlayer_008 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MEDIARULE_0900
     * @tc.name RealVideoShowsPlayer009
     * @tc.desc Verify real video shows player
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'RealVideoShowsPlayer_009', 0, (): void => {
      Logger.info(TAG, 'RealVideoShowsPlayer_009 begin');
      const moment: FriendMoment = buildFullMoment('rule-0900', 'Author', 'clip', '', $r('app.media.Engineer_video'));
      const shown: boolean = videoVisible(moment);
      Logger.info(TAG, 'shown=' + JSON.stringify(shown));
      expect(shown).assertTrue();
      Logger.info(TAG, 'RealVideoShowsPlayer_009 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MEDIARULE_1000
     * @tc.name StringUriVideoShows010
     * @tc.desc Verify string uri video shows
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'StringUriVideoShows_010', 0, (): void => {
      Logger.info(TAG, 'StringUriVideoShows_010 begin');
      const moment: FriendMoment = buildFullMoment('rule-1000', 'Author', 'uri clip', '', 'file://media/Video/1/VID_1.mp4');
      const shown: boolean = videoVisible(moment);
      Logger.info(TAG, 'shown=' + JSON.stringify(shown));
      expect(shown).assertTrue();
      Logger.info(TAG, 'StringUriVideoShows_010 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MEDIARULE_1100
     * @tc.name BothMediaBothVisible011
     * @tc.desc Verify both media both visible
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'BothMediaBothVisible_011', 0, (): void => {
      Logger.info(TAG, 'BothMediaBothVisible_011 begin');
      const moment: FriendMoment = buildFullMoment('rule-1100', 'Author', 'both', $r('app.media.rocket'), $r('app.media.Champagne'));
      const image: boolean = imageVisible(moment);
      const video: boolean = videoVisible(moment);
      const check01: boolean = image && video;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'BothMediaBothVisible_011 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MEDIARULE_1200
     * @tc.name VideoRowHidesPhotoSlot012
     * @tc.desc Verify video row hides photo slot
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'VideoRowHidesPhotoSlot_012', 0, (): void => {
      Logger.info(TAG, 'VideoRowHidesPhotoSlot_012 begin');
      const moment: FriendMoment = buildFullMoment('rule-1200', 'Author', 'clip row', '', $r('app.media.Engineer_video'));
      const image: boolean = imageVisible(moment);
      const video: boolean = videoVisible(moment);
      const check01: boolean = image === false && video === true;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'VideoRowHidesPhotoSlot_012 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MEDIARULE_1300
     * @tc.name PhotoRowHidesVideoSlot013
     * @tc.desc Verify photo row hides video slot
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'PhotoRowHidesVideoSlot_013', 0, (): void => {
      Logger.info(TAG, 'PhotoRowHidesVideoSlot_013 begin');
      const moment: FriendMoment = buildFullMoment('rule-1300', 'Author', 'photo row', $r('app.media.Computer'), '');
      const image: boolean = imageVisible(moment);
      const video: boolean = videoVisible(moment);
      const check01: boolean = image === true && video === false;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'PhotoRowHidesVideoSlot_013 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MEDIARULE_1400
     * @tc.name PlaceholderImageRealVideo014
     * @tc.desc Verify placeholder image real video
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'PlaceholderImageRealVideo_014', 0, (): void => {
      Logger.info(TAG, 'PlaceholderImageRealVideo_014 begin');
      const moment: FriendMoment = buildFullMoment('rule-1400', 'Author', 'mixed', $r('app.media.add'), $r('app.media.Champagne'));
      const image: boolean = imageVisible(moment);
      const video: boolean = videoVisible(moment);
      const check01: boolean = image === false && video === true;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'PlaceholderImageRealVideo_014 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MEDIARULE_1500
     * @tc.name RealImagePlaceholderVideo015
     * @tc.desc Verify real image placeholder video
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'RealImagePlaceholderVideo_015', 0, (): void => {
      Logger.info(TAG, 'RealImagePlaceholderVideo_015 begin');
      const moment: FriendMoment = buildFullMoment('rule-1500', 'Author', 'mixed', $r('app.media.Draw'), $r('app.media.add_video'));
      const image: boolean = imageVisible(moment);
      const video: boolean = videoVisible(moment);
      const check01: boolean = image === true && video === false;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'RealImagePlaceholderVideo_015 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MEDIARULE_1600
     * @tc.name PlaceholderComparisonIsStructural016
     * @tc.desc Verify placeholder comparison is structural
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'PlaceholderComparisonIsStructural_016', 0, (): void => {
      Logger.info(TAG, 'PlaceholderComparisonIsStructural_016 begin');
      const first: string = JSON.stringify($r('app.media.add'));
      const second: string = JSON.stringify($r('app.media.add'));
      expect(first).assertEqual(second);
      const videoFirst: string = JSON.stringify($r('app.media.add_video'));
      const videoSecond: string = JSON.stringify($r('app.media.add_video'));
      expect(videoFirst).assertEqual(videoSecond);
      Logger.info(TAG, 'PlaceholderComparisonIsStructural_016 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MEDIARULE_1700
     * @tc.name PlaceholderDiffersFromOtherResource017
     * @tc.desc Verify placeholder differs from other resource
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'PlaceholderDiffersFromOtherResource_017', 0, (): void => {
      Logger.info(TAG, 'PlaceholderDiffersFromOtherResource_017 begin');
      const placeholder: string = JSON.stringify($r('app.media.add'));
      const photo: string = JSON.stringify($r('app.media.publish_photo_bird'));
      const check01: boolean = placeholder !== photo;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'PlaceholderDiffersFromOtherResource_017 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MEDIARULE_1800
     * @tc.name RuleIndependentOfText018
     * @tc.desc Verify rule independent of text
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'RuleIndependentOfText_018', 0, (): void => {
      Logger.info(TAG, 'RuleIndependentOfText_018 begin');
      const moment: FriendMoment = buildFullMoment('rule-1800', 'Author', 'before', $r('app.media.rocket'), '');
      const before: boolean = imageVisible(moment);
      moment.text = 'after';
      const after: boolean = imageVisible(moment);
      const check01: boolean = before === true && after === true;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'RuleIndependentOfText_018 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MEDIARULE_1900
     * @tc.name RuleFollowsSlotMutation019
     * @tc.desc Verify rule follows slot mutation
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'RuleFollowsSlotMutation_019', 0, (): void => {
      Logger.info(TAG, 'RuleFollowsSlotMutation_019 begin');
      const moment: FriendMoment = buildFullMoment('rule-1900', 'Author', 'mutate', $r('app.media.rocket'), '');
      const before: boolean = imageVisible(moment);
      moment.image = $r('app.media.add');
      const after: boolean = imageVisible(moment);
      const check01: boolean = before === true && after === false;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'RuleFollowsSlotMutation_019 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MEDIARULE_2000
     * @tc.name SeedFirstRowShowsPhoto020
     * @tc.desc Verify seed first row shows photo
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SeedFirstRowShowsPhoto_020', 0, (): void => {
      Logger.info(TAG, 'SeedFirstRowShowsPhoto_020 begin');
      const source: CommentData = mockData();
      const first: FriendMoment = source.getData(0);
      const image: boolean = imageVisible(first);
      const video: boolean = videoVisible(first);
      const check01: boolean = image === true && video === false;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'SeedFirstRowShowsPhoto_020 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MEDIARULE_2100
     * @tc.name SeedEngineerRowShowsVideo021
     * @tc.desc Verify seed engineer row shows video
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SeedEngineerRowShowsVideo_021', 0, (): void => {
      Logger.info(TAG, 'SeedEngineerRowShowsVideo_021 begin');
      const source: CommentData = mockData();
      const engineer: FriendMoment = source.getData(2);
      const image: boolean = imageVisible(engineer);
      const video: boolean = videoVisible(engineer);
      const check01: boolean = image === false && video === true;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'SeedEngineerRowShowsVideo_021 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MEDIARULE_2200
     * @tc.name AllSeedRowsHaveOneShape022
     * @tc.desc Verify all seed rows have one shape
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AllSeedRowsHaveOneShape_022', 0, (): void => {
      Logger.info(TAG, 'AllSeedRowsHaveOneShape_022 begin');
      const source: CommentData = mockData();
      let emptyRows: number = 0;
      for (let index: number = 0; index < source.totalCount(); index++) {
        const row: FriendMoment = source.getData(index);
        if (!imageVisible(row) && !videoVisible(row)) {
          emptyRows += 1;
        }
      }
      expect(emptyRows).assertEqual(0);
      Logger.info(TAG, 'AllSeedRowsHaveOneShape_022 end');
    });
  });
}
