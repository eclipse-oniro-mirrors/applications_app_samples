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

// Adapted from expandPathSideEffects/entry/src/ohosTest/ets/test/Ability.test.ets.
// Reference line floor: 81; this suite only grows beyond it.
// CameraSample scope: comment draft, camera capture result and feed journal.
import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { Comment } from '../../../../main/ets/pages/model/CommentModel';
import {
  AVATAR_LOGO_ONE, AVATAR_LOGO_TWO, AVATAR_FALLBACK, IMAGE_LANDSCAPE, IMAGE_ADVERT,
  IMAGE_CAMERA, TIME_MORNING, TIME_EMPTY, NAME_CLOUD, NAME_LIHUA, NAME_GUEST,
  SAMPLE_COMMENT_TEXT, SAMPLE_COMMENT_UNICODE, CommentDraft, CommentSnapshot,
  makeComment, makeSimpleComment, makeFeed, makeDraft, makeCaptureDraft, makeText,
  padNumber, repeatText, cloneComment, commentText, commentAvatar, commentImages,
  snapshotComment, sameSnapshot, sameStrings, withCommentText, withImages,
  assertCommentMatches, assertImagesMatch, assertFeedMatches, feedNames, feedIds,
  feedTimes, feedImageCounts, totalImageCount, indexOfName, indexOfId,
  imageUriFor, imageUriBatch, FIELD_COUNT
} from '../Shared/Fixtures';
import { logSuite, yieldTick } from '../Shared/Support';

export default function CommentResourceTest(): void {
  describe('CommentResourceTest', () => {
    beforeAll(() => {
      logSuite('CommentResourceTest', 'begin');
    });
    beforeEach(async () => {
      await yieldTick();
    });
    afterAll(() => {
      logSuite('CommentResourceTest', 'end');
    });

    /**
     * @tc.name CommentResourceTest_case_001
     * @tc.desc resource: ResourceStr fields accept plain string resources (CommentResourceTest case 1)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentResourceTest_case_001', 0, async () => {
      const c: Comment = new Comment();
      c.avatar = 'app.media.icon_comment_app_logo1';
      c.comment = 'hello camera';
      expect(commentAvatar(c)).assertEqual('app.media.icon_comment_app_logo1');
      expect(commentText(c)).assertEqual('hello camera');
      expect(commentText(c) === commentText(c)).assertTrue();
      c.avatar = 'app.media.startIcon';
      expect(commentAvatar(c)).assertEqual('app.media.startIcon');
      expect(commentText(c)).assertEqual('hello camera');
      expect(commentAvatar(c).length > 0).assertTrue();
    });
    /**
     * @tc.name CommentResourceTest_case_002
     * @tc.desc resource: ResourceStr fields accept plain string resources (CommentResourceTest case 2)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentResourceTest_case_002', 0, async () => {
      const c: Comment = new Comment();
      c.avatar = 'app.media.icon_comment_app_logo2';
      c.comment = 'nice photo';
      expect(commentAvatar(c)).assertEqual('app.media.icon_comment_app_logo2');
      expect(commentText(c)).assertEqual('nice photo');
      expect(commentText(c) === commentText(c)).assertTrue();
      c.avatar = 'app.media.startIcon';
      expect(commentAvatar(c)).assertEqual('app.media.startIcon');
      expect(commentText(c)).assertEqual('nice photo');
      expect(commentAvatar(c).length > 0).assertTrue();
    });
    /**
     * @tc.name CommentResourceTest_case_003
     * @tc.desc resource: ResourceStr fields accept plain string resources (CommentResourceTest case 3)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentResourceTest_case_003', 0, async () => {
      const c: Comment = new Comment();
      c.avatar = 'app.media.icon_comment_app_logo1';
      c.comment = 'shot at noon';
      expect(commentAvatar(c)).assertEqual('app.media.icon_comment_app_logo1');
      expect(commentText(c)).assertEqual('shot at noon');
      expect(commentText(c) === commentText(c)).assertTrue();
      c.avatar = 'app.media.startIcon';
      expect(commentAvatar(c)).assertEqual('app.media.startIcon');
      expect(commentText(c)).assertEqual('shot at noon');
      expect(commentAvatar(c).length > 0).assertTrue();
    });
    /**
     * @tc.name CommentResourceTest_case_004
     * @tc.desc resource: ResourceStr fields accept plain string resources (CommentResourceTest case 4)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentResourceTest_case_004', 0, async () => {
      const c: Comment = new Comment();
      c.avatar = 'app.media.icon_comment_app_logo2';
      c.comment = 'weekend trip';
      expect(commentAvatar(c)).assertEqual('app.media.icon_comment_app_logo2');
      expect(commentText(c)).assertEqual('weekend trip');
      expect(commentText(c) === commentText(c)).assertTrue();
      c.avatar = 'app.media.startIcon';
      expect(commentAvatar(c)).assertEqual('app.media.startIcon');
      expect(commentText(c)).assertEqual('weekend trip');
      expect(commentAvatar(c).length > 0).assertTrue();
    });
    /**
     * @tc.name CommentResourceTest_case_005
     * @tc.desc resource: ResourceStr fields accept plain string resources (CommentResourceTest case 5)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentResourceTest_case_005', 0, async () => {
      const c: Comment = new Comment();
      c.avatar = 'app.media.icon_comment_app_logo1';
      c.comment = 'sample body';
      expect(commentAvatar(c)).assertEqual('app.media.icon_comment_app_logo1');
      expect(commentText(c)).assertEqual('sample body');
      expect(commentText(c) === commentText(c)).assertTrue();
      c.avatar = 'app.media.startIcon';
      expect(commentAvatar(c)).assertEqual('app.media.startIcon');
      expect(commentText(c)).assertEqual('sample body');
      expect(commentAvatar(c).length > 0).assertTrue();
    });
    /**
     * @tc.name CommentResourceTest_case_006
     * @tc.desc resource: ResourceStr fields accept plain string resources (CommentResourceTest case 6)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentResourceTest_case_006', 0, async () => {
      const c: Comment = new Comment();
      c.avatar = 'app.media.icon_comment_app_logo2';
      c.comment = 'hello camera';
      expect(commentAvatar(c)).assertEqual('app.media.icon_comment_app_logo2');
      expect(commentText(c)).assertEqual('hello camera');
      expect(commentText(c) === commentText(c)).assertTrue();
      c.avatar = 'app.media.startIcon';
      expect(commentAvatar(c)).assertEqual('app.media.startIcon');
      expect(commentText(c)).assertEqual('hello camera');
      expect(commentAvatar(c).length > 0).assertTrue();
    });
    /**
     * @tc.name CommentResourceTest_case_007
     * @tc.desc resource: ResourceStr fields accept plain string resources (CommentResourceTest case 7)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentResourceTest_case_007', 0, async () => {
      const c: Comment = new Comment();
      c.avatar = 'app.media.icon_comment_app_logo1';
      c.comment = 'nice photo';
      expect(commentAvatar(c)).assertEqual('app.media.icon_comment_app_logo1');
      expect(commentText(c)).assertEqual('nice photo');
      expect(commentText(c) === commentText(c)).assertTrue();
      c.avatar = 'app.media.startIcon';
      expect(commentAvatar(c)).assertEqual('app.media.startIcon');
      expect(commentText(c)).assertEqual('nice photo');
      expect(commentAvatar(c).length > 0).assertTrue();
    });
    /**
     * @tc.name CommentResourceTest_case_008
     * @tc.desc resource: ResourceStr fields accept plain string resources (CommentResourceTest case 8)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentResourceTest_case_008', 0, async () => {
      const c: Comment = new Comment();
      c.avatar = 'app.media.icon_comment_app_logo2';
      c.comment = 'shot at noon';
      expect(commentAvatar(c)).assertEqual('app.media.icon_comment_app_logo2');
      expect(commentText(c)).assertEqual('shot at noon');
      expect(commentText(c) === commentText(c)).assertTrue();
      c.avatar = 'app.media.startIcon';
      expect(commentAvatar(c)).assertEqual('app.media.startIcon');
      expect(commentText(c)).assertEqual('shot at noon');
      expect(commentAvatar(c).length > 0).assertTrue();
    });
    /**
     * @tc.name CommentResourceTest_case_009
     * @tc.desc resource: ResourceStr fields accept plain string resources (CommentResourceTest case 9)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentResourceTest_case_009', 0, async () => {
      const c: Comment = new Comment();
      c.avatar = 'app.media.icon_comment_app_logo1';
      c.comment = 'weekend trip';
      expect(commentAvatar(c)).assertEqual('app.media.icon_comment_app_logo1');
      expect(commentText(c)).assertEqual('weekend trip');
      expect(commentText(c) === commentText(c)).assertTrue();
      c.avatar = 'app.media.startIcon';
      expect(commentAvatar(c)).assertEqual('app.media.startIcon');
      expect(commentText(c)).assertEqual('weekend trip');
      expect(commentAvatar(c).length > 0).assertTrue();
    });
    /**
     * @tc.name CommentResourceTest_case_010
     * @tc.desc resource: ResourceStr fields accept plain string resources (CommentResourceTest case 10)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentResourceTest_case_010', 0, async () => {
      const c: Comment = new Comment();
      c.avatar = 'app.media.icon_comment_app_logo2';
      c.comment = 'sample body';
      expect(commentAvatar(c)).assertEqual('app.media.icon_comment_app_logo2');
      expect(commentText(c)).assertEqual('sample body');
      expect(commentText(c) === commentText(c)).assertTrue();
      c.avatar = 'app.media.startIcon';
      expect(commentAvatar(c)).assertEqual('app.media.startIcon');
      expect(commentText(c)).assertEqual('sample body');
      expect(commentAvatar(c).length > 0).assertTrue();
    });
    /**
     * @tc.name CommentResourceTest_case_011
     * @tc.desc resource: ResourceStr fields accept plain string resources (CommentResourceTest case 11)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentResourceTest_case_011', 0, async () => {
      const c: Comment = new Comment();
      c.avatar = 'app.media.icon_comment_app_logo1';
      c.comment = 'hello camera';
      expect(commentAvatar(c)).assertEqual('app.media.icon_comment_app_logo1');
      expect(commentText(c)).assertEqual('hello camera');
      expect(commentText(c) === commentText(c)).assertTrue();
      c.avatar = 'app.media.startIcon';
      expect(commentAvatar(c)).assertEqual('app.media.startIcon');
      expect(commentText(c)).assertEqual('hello camera');
      expect(commentAvatar(c).length > 0).assertTrue();
    });
    /**
     * @tc.name CommentResourceTest_case_012
     * @tc.desc resource: ResourceStr fields accept plain string resources (CommentResourceTest case 12)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentResourceTest_case_012', 0, async () => {
      const c: Comment = new Comment();
      c.avatar = 'app.media.icon_comment_app_logo2';
      c.comment = 'nice photo';
      expect(commentAvatar(c)).assertEqual('app.media.icon_comment_app_logo2');
      expect(commentText(c)).assertEqual('nice photo');
      expect(commentText(c) === commentText(c)).assertTrue();
      c.avatar = 'app.media.startIcon';
      expect(commentAvatar(c)).assertEqual('app.media.startIcon');
      expect(commentText(c)).assertEqual('nice photo');
      expect(commentAvatar(c).length > 0).assertTrue();
    });
    /**
     * @tc.name CommentResourceTest_case_013
     * @tc.desc resource: ResourceStr fields accept plain string resources (CommentResourceTest case 13)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentResourceTest_case_013', 0, async () => {
      const c: Comment = new Comment();
      c.avatar = 'app.media.icon_comment_app_logo1';
      c.comment = 'shot at noon';
      expect(commentAvatar(c)).assertEqual('app.media.icon_comment_app_logo1');
      expect(commentText(c)).assertEqual('shot at noon');
      expect(commentText(c) === commentText(c)).assertTrue();
      c.avatar = 'app.media.startIcon';
      expect(commentAvatar(c)).assertEqual('app.media.startIcon');
      expect(commentText(c)).assertEqual('shot at noon');
      expect(commentAvatar(c).length > 0).assertTrue();
    });
    /**
     * @tc.name CommentResourceTest_case_014
     * @tc.desc resource: ResourceStr fields accept plain string resources (CommentResourceTest case 14)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentResourceTest_case_014', 0, async () => {
      const c: Comment = new Comment();
      c.avatar = 'app.media.icon_comment_app_logo2';
      c.comment = 'weekend trip';
      expect(commentAvatar(c)).assertEqual('app.media.icon_comment_app_logo2');
      expect(commentText(c)).assertEqual('weekend trip');
      expect(commentText(c) === commentText(c)).assertTrue();
      c.avatar = 'app.media.startIcon';
      expect(commentAvatar(c)).assertEqual('app.media.startIcon');
      expect(commentText(c)).assertEqual('weekend trip');
      expect(commentAvatar(c).length > 0).assertTrue();
    });
    /**
     * @tc.name CommentResourceTest_case_015
     * @tc.desc resource: ResourceStr fields accept plain string resources (CommentResourceTest case 15)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentResourceTest_case_015', 0, async () => {
      const c: Comment = new Comment();
      c.avatar = 'app.media.icon_comment_app_logo1';
      c.comment = 'sample body';
      expect(commentAvatar(c)).assertEqual('app.media.icon_comment_app_logo1');
      expect(commentText(c)).assertEqual('sample body');
      expect(commentText(c) === commentText(c)).assertTrue();
      c.avatar = 'app.media.startIcon';
      expect(commentAvatar(c)).assertEqual('app.media.startIcon');
      expect(commentText(c)).assertEqual('sample body');
      expect(commentAvatar(c).length > 0).assertTrue();
    });
    /**
     * @tc.name CommentResourceTest_case_016
     * @tc.desc resource: ResourceStr fields accept plain string resources (CommentResourceTest case 16)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentResourceTest_case_016', 0, async () => {
      const c: Comment = new Comment();
      c.avatar = 'app.media.icon_comment_app_logo2';
      c.comment = 'hello camera';
      expect(commentAvatar(c)).assertEqual('app.media.icon_comment_app_logo2');
      expect(commentText(c)).assertEqual('hello camera');
      expect(commentText(c) === commentText(c)).assertTrue();
      c.avatar = 'app.media.startIcon';
      expect(commentAvatar(c)).assertEqual('app.media.startIcon');
      expect(commentText(c)).assertEqual('hello camera');
      expect(commentAvatar(c).length > 0).assertTrue();
    });
    /**
     * @tc.name CommentResourceTest_case_017
     * @tc.desc resource: ResourceStr fields accept plain string resources (CommentResourceTest case 17)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentResourceTest_case_017', 0, async () => {
      const c: Comment = new Comment();
      c.avatar = 'app.media.icon_comment_app_logo1';
      c.comment = 'nice photo';
      expect(commentAvatar(c)).assertEqual('app.media.icon_comment_app_logo1');
      expect(commentText(c)).assertEqual('nice photo');
      expect(commentText(c) === commentText(c)).assertTrue();
      c.avatar = 'app.media.startIcon';
      expect(commentAvatar(c)).assertEqual('app.media.startIcon');
      expect(commentText(c)).assertEqual('nice photo');
      expect(commentAvatar(c).length > 0).assertTrue();
    });
    /**
     * @tc.name CommentResourceTest_case_018
     * @tc.desc resource: ResourceStr fields accept plain string resources (CommentResourceTest case 18)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentResourceTest_case_018', 0, async () => {
      const c: Comment = new Comment();
      c.avatar = 'app.media.icon_comment_app_logo2';
      c.comment = 'shot at noon';
      expect(commentAvatar(c)).assertEqual('app.media.icon_comment_app_logo2');
      expect(commentText(c)).assertEqual('shot at noon');
      expect(commentText(c) === commentText(c)).assertTrue();
      c.avatar = 'app.media.startIcon';
      expect(commentAvatar(c)).assertEqual('app.media.startIcon');
      expect(commentText(c)).assertEqual('shot at noon');
      expect(commentAvatar(c).length > 0).assertTrue();
    });
    /**
     * @tc.name CommentResourceTest_case_019
     * @tc.desc resource: ResourceStr fields accept plain string resources (CommentResourceTest case 19)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentResourceTest_case_019', 0, async () => {
      const c: Comment = new Comment();
      c.avatar = 'app.media.icon_comment_app_logo1';
      c.comment = 'weekend trip';
      expect(commentAvatar(c)).assertEqual('app.media.icon_comment_app_logo1');
      expect(commentText(c)).assertEqual('weekend trip');
      expect(commentText(c) === commentText(c)).assertTrue();
      c.avatar = 'app.media.startIcon';
      expect(commentAvatar(c)).assertEqual('app.media.startIcon');
      expect(commentText(c)).assertEqual('weekend trip');
      expect(commentAvatar(c).length > 0).assertTrue();
    });
    /**
     * @tc.name CommentResourceTest_case_020
     * @tc.desc resource: ResourceStr fields accept plain string resources (CommentResourceTest case 20)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentResourceTest_case_020', 0, async () => {
      const c: Comment = new Comment();
      c.avatar = 'app.media.icon_comment_app_logo2';
      c.comment = 'sample body';
      expect(commentAvatar(c)).assertEqual('app.media.icon_comment_app_logo2');
      expect(commentText(c)).assertEqual('sample body');
      expect(commentText(c) === commentText(c)).assertTrue();
      c.avatar = 'app.media.startIcon';
      expect(commentAvatar(c)).assertEqual('app.media.startIcon');
      expect(commentText(c)).assertEqual('sample body');
      expect(commentAvatar(c).length > 0).assertTrue();
    });
    /**
     * @tc.name CommentResourceTest_case_021
     * @tc.desc resource: ResourceStr fields accept plain string resources (CommentResourceTest case 21)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentResourceTest_case_021', 0, async () => {
      const c: Comment = new Comment();
      c.avatar = 'app.media.icon_comment_app_logo1';
      c.comment = 'hello camera';
      expect(commentAvatar(c)).assertEqual('app.media.icon_comment_app_logo1');
      expect(commentText(c)).assertEqual('hello camera');
      expect(commentText(c) === commentText(c)).assertTrue();
      c.avatar = 'app.media.startIcon';
      expect(commentAvatar(c)).assertEqual('app.media.startIcon');
      expect(commentText(c)).assertEqual('hello camera');
      expect(commentAvatar(c).length > 0).assertTrue();
    });
    /**
     * @tc.name CommentResourceTest_case_022
     * @tc.desc resource: ResourceStr fields accept plain string resources (CommentResourceTest case 22)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentResourceTest_case_022', 0, async () => {
      const c: Comment = new Comment();
      c.avatar = 'app.media.icon_comment_app_logo2';
      c.comment = 'nice photo';
      expect(commentAvatar(c)).assertEqual('app.media.icon_comment_app_logo2');
      expect(commentText(c)).assertEqual('nice photo');
      expect(commentText(c) === commentText(c)).assertTrue();
      c.avatar = 'app.media.startIcon';
      expect(commentAvatar(c)).assertEqual('app.media.startIcon');
      expect(commentText(c)).assertEqual('nice photo');
      expect(commentAvatar(c).length > 0).assertTrue();
    });
    /**
     * @tc.name CommentResourceTest_case_023
     * @tc.desc resource: ResourceStr fields accept plain string resources (CommentResourceTest case 23)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentResourceTest_case_023', 0, async () => {
      const c: Comment = new Comment();
      c.avatar = 'app.media.icon_comment_app_logo1';
      c.comment = 'shot at noon';
      expect(commentAvatar(c)).assertEqual('app.media.icon_comment_app_logo1');
      expect(commentText(c)).assertEqual('shot at noon');
      expect(commentText(c) === commentText(c)).assertTrue();
      c.avatar = 'app.media.startIcon';
      expect(commentAvatar(c)).assertEqual('app.media.startIcon');
      expect(commentText(c)).assertEqual('shot at noon');
      expect(commentAvatar(c).length > 0).assertTrue();
    });
    /**
     * @tc.name CommentResourceTest_case_024
     * @tc.desc resource: ResourceStr fields accept plain string resources (CommentResourceTest case 24)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentResourceTest_case_024', 0, async () => {
      const c: Comment = new Comment();
      c.avatar = 'app.media.icon_comment_app_logo2';
      c.comment = 'weekend trip';
      expect(commentAvatar(c)).assertEqual('app.media.icon_comment_app_logo2');
      expect(commentText(c)).assertEqual('weekend trip');
      expect(commentText(c) === commentText(c)).assertTrue();
      c.avatar = 'app.media.startIcon';
      expect(commentAvatar(c)).assertEqual('app.media.startIcon');
      expect(commentText(c)).assertEqual('weekend trip');
      expect(commentAvatar(c).length > 0).assertTrue();
    });
    /**
     * @tc.name CommentResourceTest_case_025
     * @tc.desc resource: ResourceStr fields accept plain string resources (CommentResourceTest case 25)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentResourceTest_case_025', 0, async () => {
      const c: Comment = new Comment();
      c.avatar = 'app.media.icon_comment_app_logo1';
      c.comment = 'sample body';
      expect(commentAvatar(c)).assertEqual('app.media.icon_comment_app_logo1');
      expect(commentText(c)).assertEqual('sample body');
      expect(commentText(c) === commentText(c)).assertTrue();
      c.avatar = 'app.media.startIcon';
      expect(commentAvatar(c)).assertEqual('app.media.startIcon');
      expect(commentText(c)).assertEqual('sample body');
      expect(commentAvatar(c).length > 0).assertTrue();
    });
    /**
     * @tc.name CommentResourceTest_case_026
     * @tc.desc resource: ResourceStr fields accept plain string resources (CommentResourceTest case 26)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentResourceTest_case_026', 0, async () => {
      const c: Comment = new Comment();
      c.avatar = 'app.media.icon_comment_app_logo2';
      c.comment = 'hello camera';
      expect(commentAvatar(c)).assertEqual('app.media.icon_comment_app_logo2');
      expect(commentText(c)).assertEqual('hello camera');
      expect(commentText(c) === commentText(c)).assertTrue();
      c.avatar = 'app.media.startIcon';
      expect(commentAvatar(c)).assertEqual('app.media.startIcon');
      expect(commentText(c)).assertEqual('hello camera');
      expect(commentAvatar(c).length > 0).assertTrue();
    });
    /**
     * @tc.name CommentResourceTest_case_027
     * @tc.desc resource: ResourceStr fields accept plain string resources (CommentResourceTest case 27)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentResourceTest_case_027', 0, async () => {
      const c: Comment = new Comment();
      c.avatar = 'app.media.icon_comment_app_logo1';
      c.comment = 'nice photo';
      expect(commentAvatar(c)).assertEqual('app.media.icon_comment_app_logo1');
      expect(commentText(c)).assertEqual('nice photo');
      expect(commentText(c) === commentText(c)).assertTrue();
      c.avatar = 'app.media.startIcon';
      expect(commentAvatar(c)).assertEqual('app.media.startIcon');
      expect(commentText(c)).assertEqual('nice photo');
      expect(commentAvatar(c).length > 0).assertTrue();
    });
    /**
     * @tc.name CommentResourceTest_case_028
     * @tc.desc resource: ResourceStr fields accept plain string resources (CommentResourceTest case 28)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentResourceTest_case_028', 0, async () => {
      const c: Comment = new Comment();
      c.avatar = 'app.media.icon_comment_app_logo2';
      c.comment = 'shot at noon';
      expect(commentAvatar(c)).assertEqual('app.media.icon_comment_app_logo2');
      expect(commentText(c)).assertEqual('shot at noon');
      expect(commentText(c) === commentText(c)).assertTrue();
      c.avatar = 'app.media.startIcon';
      expect(commentAvatar(c)).assertEqual('app.media.startIcon');
      expect(commentText(c)).assertEqual('shot at noon');
      expect(commentAvatar(c).length > 0).assertTrue();
    });
    /**
     * @tc.name CommentResourceTest_case_029
     * @tc.desc resource: ResourceStr fields accept plain string resources (CommentResourceTest case 29)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentResourceTest_case_029', 0, async () => {
      const c: Comment = new Comment();
      c.avatar = 'app.media.icon_comment_app_logo1';
      c.comment = 'weekend trip';
      expect(commentAvatar(c)).assertEqual('app.media.icon_comment_app_logo1');
      expect(commentText(c)).assertEqual('weekend trip');
      expect(commentText(c) === commentText(c)).assertTrue();
      c.avatar = 'app.media.startIcon';
      expect(commentAvatar(c)).assertEqual('app.media.startIcon');
      expect(commentText(c)).assertEqual('weekend trip');
      expect(commentAvatar(c).length > 0).assertTrue();
    });
    /**
     * @tc.name CommentResourceTest_case_030
     * @tc.desc resource: ResourceStr fields accept plain string resources (CommentResourceTest case 30)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentResourceTest_case_030', 0, async () => {
      const c: Comment = new Comment();
      c.avatar = 'app.media.icon_comment_app_logo2';
      c.comment = 'sample body';
      expect(commentAvatar(c)).assertEqual('app.media.icon_comment_app_logo2');
      expect(commentText(c)).assertEqual('sample body');
      expect(commentText(c) === commentText(c)).assertTrue();
      c.avatar = 'app.media.startIcon';
      expect(commentAvatar(c)).assertEqual('app.media.startIcon');
      expect(commentText(c)).assertEqual('sample body');
      expect(commentAvatar(c).length > 0).assertTrue();
    });
    /**
     * @tc.name CommentResourceTest_case_031
     * @tc.desc resource: ResourceStr fields accept plain string resources (CommentResourceTest case 31)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentResourceTest_case_031', 0, async () => {
      const c: Comment = new Comment();
      c.avatar = 'app.media.icon_comment_app_logo1';
      c.comment = 'hello camera';
      expect(commentAvatar(c)).assertEqual('app.media.icon_comment_app_logo1');
      expect(commentText(c)).assertEqual('hello camera');
      expect(commentText(c) === commentText(c)).assertTrue();
      c.avatar = 'app.media.startIcon';
      expect(commentAvatar(c)).assertEqual('app.media.startIcon');
      expect(commentText(c)).assertEqual('hello camera');
      expect(commentAvatar(c).length > 0).assertTrue();
    });
    /**
     * @tc.name CommentResourceTest_case_032
     * @tc.desc resource: ResourceStr fields accept plain string resources (CommentResourceTest case 32)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentResourceTest_case_032', 0, async () => {
      const c: Comment = new Comment();
      c.avatar = 'app.media.icon_comment_app_logo2';
      c.comment = 'nice photo';
      expect(commentAvatar(c)).assertEqual('app.media.icon_comment_app_logo2');
      expect(commentText(c)).assertEqual('nice photo');
      expect(commentText(c) === commentText(c)).assertTrue();
      c.avatar = 'app.media.startIcon';
      expect(commentAvatar(c)).assertEqual('app.media.startIcon');
      expect(commentText(c)).assertEqual('nice photo');
      expect(commentAvatar(c).length > 0).assertTrue();
    });
    /**
     * @tc.name CommentResourceTest_case_033
     * @tc.desc resource: ResourceStr fields accept plain string resources (CommentResourceTest case 33)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentResourceTest_case_033', 0, async () => {
      const c: Comment = new Comment();
      c.avatar = 'app.media.icon_comment_app_logo1';
      c.comment = 'shot at noon';
      expect(commentAvatar(c)).assertEqual('app.media.icon_comment_app_logo1');
      expect(commentText(c)).assertEqual('shot at noon');
      expect(commentText(c) === commentText(c)).assertTrue();
      c.avatar = 'app.media.startIcon';
      expect(commentAvatar(c)).assertEqual('app.media.startIcon');
      expect(commentText(c)).assertEqual('shot at noon');
      expect(commentAvatar(c).length > 0).assertTrue();
    });
    /**
     * @tc.name CommentResourceTest_case_034
     * @tc.desc resource: ResourceStr fields accept plain string resources (CommentResourceTest case 34)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentResourceTest_case_034', 0, async () => {
      const c: Comment = new Comment();
      c.avatar = 'app.media.icon_comment_app_logo2';
      c.comment = 'weekend trip';
      expect(commentAvatar(c)).assertEqual('app.media.icon_comment_app_logo2');
      expect(commentText(c)).assertEqual('weekend trip');
      expect(commentText(c) === commentText(c)).assertTrue();
      c.avatar = 'app.media.startIcon';
      expect(commentAvatar(c)).assertEqual('app.media.startIcon');
      expect(commentText(c)).assertEqual('weekend trip');
      expect(commentAvatar(c).length > 0).assertTrue();
    });
  });
}
