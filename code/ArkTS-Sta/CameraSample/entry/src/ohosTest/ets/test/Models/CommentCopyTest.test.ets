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

export default function CommentCopyTest(): void {
  describe('CommentCopyTest', () => {
    beforeAll(() => {
      logSuite('CommentCopyTest', 'begin');
    });
    beforeEach(async () => {
      await yieldTick();
    });
    afterAll(() => {
      logSuite('CommentCopyTest', 'end');
    });

    /**
     * @tc.name CommentCopyTest_case_001
     * @tc.desc copy: clone values match while later mutations stay local (CommentCopyTest case 1)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentCopyTest_case_001', 0, async () => {
      const source: Comment = makeSimpleComment(3);
      const copy: Comment = cloneComment(source);
      assertCommentMatches(copy, source.id, source.name, source.comment as string, source.images.length);
      expect(commentText(copy)).assertEqual(commentText(source));
      expect(commentAvatar(copy)).assertEqual(commentAvatar(source));
      expect(sameStrings(commentImages(copy), commentImages(source))).assertTrue();
      copy.comment = 'local edit';
      expect(commentText(source)).assertEqual('comment body 3');
      expect(commentText(copy)).assertEqual('local edit');
      copy.images.push(imageUriFor(7));
      expect(copy.images.length).assertEqual(source.images.length + 1);
    });
    /**
     * @tc.name CommentCopyTest_case_002
     * @tc.desc copy: clone values match while later mutations stay local (CommentCopyTest case 2)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentCopyTest_case_002', 0, async () => {
      const source: Comment = makeSimpleComment(3);
      const copy: Comment = cloneComment(source);
      assertCommentMatches(copy, source.id, source.name, source.comment as string, source.images.length);
      expect(commentText(copy)).assertEqual(commentText(source));
      expect(commentAvatar(copy)).assertEqual(commentAvatar(source));
      expect(sameStrings(commentImages(copy), commentImages(source))).assertTrue();
      copy.comment = 'local edit';
      expect(commentText(source)).assertEqual('comment body 3');
      expect(commentText(copy)).assertEqual('local edit');
      copy.images.push(imageUriFor(7));
      expect(copy.images.length).assertEqual(source.images.length + 1);
    });
    /**
     * @tc.name CommentCopyTest_case_003
     * @tc.desc copy: clone values match while later mutations stay local (CommentCopyTest case 3)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentCopyTest_case_003', 0, async () => {
      const source: Comment = makeSimpleComment(3);
      const copy: Comment = cloneComment(source);
      assertCommentMatches(copy, source.id, source.name, source.comment as string, source.images.length);
      expect(commentText(copy)).assertEqual(commentText(source));
      expect(commentAvatar(copy)).assertEqual(commentAvatar(source));
      expect(sameStrings(commentImages(copy), commentImages(source))).assertTrue();
      copy.comment = 'local edit';
      expect(commentText(source)).assertEqual('comment body 3');
      expect(commentText(copy)).assertEqual('local edit');
      copy.images.push(imageUriFor(7));
      expect(copy.images.length).assertEqual(source.images.length + 1);
    });
    /**
     * @tc.name CommentCopyTest_case_004
     * @tc.desc copy: clone values match while later mutations stay local (CommentCopyTest case 4)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentCopyTest_case_004', 0, async () => {
      const source: Comment = makeSimpleComment(3);
      const copy: Comment = cloneComment(source);
      assertCommentMatches(copy, source.id, source.name, source.comment as string, source.images.length);
      expect(commentText(copy)).assertEqual(commentText(source));
      expect(commentAvatar(copy)).assertEqual(commentAvatar(source));
      expect(sameStrings(commentImages(copy), commentImages(source))).assertTrue();
      copy.comment = 'local edit';
      expect(commentText(source)).assertEqual('comment body 3');
      expect(commentText(copy)).assertEqual('local edit');
      copy.images.push(imageUriFor(7));
      expect(copy.images.length).assertEqual(source.images.length + 1);
    });
    /**
     * @tc.name CommentCopyTest_case_005
     * @tc.desc copy: clone values match while later mutations stay local (CommentCopyTest case 5)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentCopyTest_case_005', 0, async () => {
      const source: Comment = makeSimpleComment(3);
      const copy: Comment = cloneComment(source);
      assertCommentMatches(copy, source.id, source.name, source.comment as string, source.images.length);
      expect(commentText(copy)).assertEqual(commentText(source));
      expect(commentAvatar(copy)).assertEqual(commentAvatar(source));
      expect(sameStrings(commentImages(copy), commentImages(source))).assertTrue();
      copy.comment = 'local edit';
      expect(commentText(source)).assertEqual('comment body 3');
      expect(commentText(copy)).assertEqual('local edit');
      copy.images.push(imageUriFor(7));
      expect(copy.images.length).assertEqual(source.images.length + 1);
    });
    /**
     * @tc.name CommentCopyTest_case_006
     * @tc.desc copy: clone values match while later mutations stay local (CommentCopyTest case 6)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentCopyTest_case_006', 0, async () => {
      const source: Comment = makeSimpleComment(3);
      const copy: Comment = cloneComment(source);
      assertCommentMatches(copy, source.id, source.name, source.comment as string, source.images.length);
      expect(commentText(copy)).assertEqual(commentText(source));
      expect(commentAvatar(copy)).assertEqual(commentAvatar(source));
      expect(sameStrings(commentImages(copy), commentImages(source))).assertTrue();
      copy.comment = 'local edit';
      expect(commentText(source)).assertEqual('comment body 3');
      expect(commentText(copy)).assertEqual('local edit');
      copy.images.push(imageUriFor(7));
      expect(copy.images.length).assertEqual(source.images.length + 1);
    });
    /**
     * @tc.name CommentCopyTest_case_007
     * @tc.desc copy: clone values match while later mutations stay local (CommentCopyTest case 7)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentCopyTest_case_007', 0, async () => {
      const source: Comment = makeSimpleComment(3);
      const copy: Comment = cloneComment(source);
      assertCommentMatches(copy, source.id, source.name, source.comment as string, source.images.length);
      expect(commentText(copy)).assertEqual(commentText(source));
      expect(commentAvatar(copy)).assertEqual(commentAvatar(source));
      expect(sameStrings(commentImages(copy), commentImages(source))).assertTrue();
      copy.comment = 'local edit';
      expect(commentText(source)).assertEqual('comment body 3');
      expect(commentText(copy)).assertEqual('local edit');
      copy.images.push(imageUriFor(7));
      expect(copy.images.length).assertEqual(source.images.length + 1);
    });
    /**
     * @tc.name CommentCopyTest_case_008
     * @tc.desc copy: clone values match while later mutations stay local (CommentCopyTest case 8)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentCopyTest_case_008', 0, async () => {
      const source: Comment = makeSimpleComment(3);
      const copy: Comment = cloneComment(source);
      assertCommentMatches(copy, source.id, source.name, source.comment as string, source.images.length);
      expect(commentText(copy)).assertEqual(commentText(source));
      expect(commentAvatar(copy)).assertEqual(commentAvatar(source));
      expect(sameStrings(commentImages(copy), commentImages(source))).assertTrue();
      copy.comment = 'local edit';
      expect(commentText(source)).assertEqual('comment body 3');
      expect(commentText(copy)).assertEqual('local edit');
      copy.images.push(imageUriFor(7));
      expect(copy.images.length).assertEqual(source.images.length + 1);
    });
    /**
     * @tc.name CommentCopyTest_case_009
     * @tc.desc copy: clone values match while later mutations stay local (CommentCopyTest case 9)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentCopyTest_case_009', 0, async () => {
      const source: Comment = makeSimpleComment(3);
      const copy: Comment = cloneComment(source);
      assertCommentMatches(copy, source.id, source.name, source.comment as string, source.images.length);
      expect(commentText(copy)).assertEqual(commentText(source));
      expect(commentAvatar(copy)).assertEqual(commentAvatar(source));
      expect(sameStrings(commentImages(copy), commentImages(source))).assertTrue();
      copy.comment = 'local edit';
      expect(commentText(source)).assertEqual('comment body 3');
      expect(commentText(copy)).assertEqual('local edit');
      copy.images.push(imageUriFor(7));
      expect(copy.images.length).assertEqual(source.images.length + 1);
    });
    /**
     * @tc.name CommentCopyTest_case_010
     * @tc.desc copy: clone values match while later mutations stay local (CommentCopyTest case 10)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentCopyTest_case_010', 0, async () => {
      const source: Comment = makeSimpleComment(3);
      const copy: Comment = cloneComment(source);
      assertCommentMatches(copy, source.id, source.name, source.comment as string, source.images.length);
      expect(commentText(copy)).assertEqual(commentText(source));
      expect(commentAvatar(copy)).assertEqual(commentAvatar(source));
      expect(sameStrings(commentImages(copy), commentImages(source))).assertTrue();
      copy.comment = 'local edit';
      expect(commentText(source)).assertEqual('comment body 3');
      expect(commentText(copy)).assertEqual('local edit');
      copy.images.push(imageUriFor(7));
      expect(copy.images.length).assertEqual(source.images.length + 1);
    });
    /**
     * @tc.name CommentCopyTest_case_011
     * @tc.desc copy: clone values match while later mutations stay local (CommentCopyTest case 11)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentCopyTest_case_011', 0, async () => {
      const source: Comment = makeSimpleComment(3);
      const copy: Comment = cloneComment(source);
      assertCommentMatches(copy, source.id, source.name, source.comment as string, source.images.length);
      expect(commentText(copy)).assertEqual(commentText(source));
      expect(commentAvatar(copy)).assertEqual(commentAvatar(source));
      expect(sameStrings(commentImages(copy), commentImages(source))).assertTrue();
      copy.comment = 'local edit';
      expect(commentText(source)).assertEqual('comment body 3');
      expect(commentText(copy)).assertEqual('local edit');
      copy.images.push(imageUriFor(7));
      expect(copy.images.length).assertEqual(source.images.length + 1);
    });
    /**
     * @tc.name CommentCopyTest_case_012
     * @tc.desc copy: clone values match while later mutations stay local (CommentCopyTest case 12)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentCopyTest_case_012', 0, async () => {
      const source: Comment = makeSimpleComment(3);
      const copy: Comment = cloneComment(source);
      assertCommentMatches(copy, source.id, source.name, source.comment as string, source.images.length);
      expect(commentText(copy)).assertEqual(commentText(source));
      expect(commentAvatar(copy)).assertEqual(commentAvatar(source));
      expect(sameStrings(commentImages(copy), commentImages(source))).assertTrue();
      copy.comment = 'local edit';
      expect(commentText(source)).assertEqual('comment body 3');
      expect(commentText(copy)).assertEqual('local edit');
      copy.images.push(imageUriFor(7));
      expect(copy.images.length).assertEqual(source.images.length + 1);
    });
    /**
     * @tc.name CommentCopyTest_case_013
     * @tc.desc copy: clone values match while later mutations stay local (CommentCopyTest case 13)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentCopyTest_case_013', 0, async () => {
      const source: Comment = makeSimpleComment(3);
      const copy: Comment = cloneComment(source);
      assertCommentMatches(copy, source.id, source.name, source.comment as string, source.images.length);
      expect(commentText(copy)).assertEqual(commentText(source));
      expect(commentAvatar(copy)).assertEqual(commentAvatar(source));
      expect(sameStrings(commentImages(copy), commentImages(source))).assertTrue();
      copy.comment = 'local edit';
      expect(commentText(source)).assertEqual('comment body 3');
      expect(commentText(copy)).assertEqual('local edit');
      copy.images.push(imageUriFor(7));
      expect(copy.images.length).assertEqual(source.images.length + 1);
    });
    /**
     * @tc.name CommentCopyTest_case_014
     * @tc.desc copy: clone values match while later mutations stay local (CommentCopyTest case 14)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentCopyTest_case_014', 0, async () => {
      const source: Comment = makeSimpleComment(3);
      const copy: Comment = cloneComment(source);
      assertCommentMatches(copy, source.id, source.name, source.comment as string, source.images.length);
      expect(commentText(copy)).assertEqual(commentText(source));
      expect(commentAvatar(copy)).assertEqual(commentAvatar(source));
      expect(sameStrings(commentImages(copy), commentImages(source))).assertTrue();
      copy.comment = 'local edit';
      expect(commentText(source)).assertEqual('comment body 3');
      expect(commentText(copy)).assertEqual('local edit');
      copy.images.push(imageUriFor(7));
      expect(copy.images.length).assertEqual(source.images.length + 1);
    });
    /**
     * @tc.name CommentCopyTest_case_015
     * @tc.desc copy: clone values match while later mutations stay local (CommentCopyTest case 15)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentCopyTest_case_015', 0, async () => {
      const source: Comment = makeSimpleComment(3);
      const copy: Comment = cloneComment(source);
      assertCommentMatches(copy, source.id, source.name, source.comment as string, source.images.length);
      expect(commentText(copy)).assertEqual(commentText(source));
      expect(commentAvatar(copy)).assertEqual(commentAvatar(source));
      expect(sameStrings(commentImages(copy), commentImages(source))).assertTrue();
      copy.comment = 'local edit';
      expect(commentText(source)).assertEqual('comment body 3');
      expect(commentText(copy)).assertEqual('local edit');
      copy.images.push(imageUriFor(7));
      expect(copy.images.length).assertEqual(source.images.length + 1);
    });
    /**
     * @tc.name CommentCopyTest_case_016
     * @tc.desc copy: clone values match while later mutations stay local (CommentCopyTest case 16)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentCopyTest_case_016', 0, async () => {
      const source: Comment = makeSimpleComment(3);
      const copy: Comment = cloneComment(source);
      assertCommentMatches(copy, source.id, source.name, source.comment as string, source.images.length);
      expect(commentText(copy)).assertEqual(commentText(source));
      expect(commentAvatar(copy)).assertEqual(commentAvatar(source));
      expect(sameStrings(commentImages(copy), commentImages(source))).assertTrue();
      copy.comment = 'local edit';
      expect(commentText(source)).assertEqual('comment body 3');
      expect(commentText(copy)).assertEqual('local edit');
      copy.images.push(imageUriFor(7));
      expect(copy.images.length).assertEqual(source.images.length + 1);
    });
    /**
     * @tc.name CommentCopyTest_case_017
     * @tc.desc copy: clone values match while later mutations stay local (CommentCopyTest case 17)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentCopyTest_case_017', 0, async () => {
      const source: Comment = makeSimpleComment(3);
      const copy: Comment = cloneComment(source);
      assertCommentMatches(copy, source.id, source.name, source.comment as string, source.images.length);
      expect(commentText(copy)).assertEqual(commentText(source));
      expect(commentAvatar(copy)).assertEqual(commentAvatar(source));
      expect(sameStrings(commentImages(copy), commentImages(source))).assertTrue();
      copy.comment = 'local edit';
      expect(commentText(source)).assertEqual('comment body 3');
      expect(commentText(copy)).assertEqual('local edit');
      copy.images.push(imageUriFor(7));
      expect(copy.images.length).assertEqual(source.images.length + 1);
    });
    /**
     * @tc.name CommentCopyTest_case_018
     * @tc.desc copy: clone values match while later mutations stay local (CommentCopyTest case 18)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentCopyTest_case_018', 0, async () => {
      const source: Comment = makeSimpleComment(3);
      const copy: Comment = cloneComment(source);
      assertCommentMatches(copy, source.id, source.name, source.comment as string, source.images.length);
      expect(commentText(copy)).assertEqual(commentText(source));
      expect(commentAvatar(copy)).assertEqual(commentAvatar(source));
      expect(sameStrings(commentImages(copy), commentImages(source))).assertTrue();
      copy.comment = 'local edit';
      expect(commentText(source)).assertEqual('comment body 3');
      expect(commentText(copy)).assertEqual('local edit');
      copy.images.push(imageUriFor(7));
      expect(copy.images.length).assertEqual(source.images.length + 1);
    });
    /**
     * @tc.name CommentCopyTest_case_019
     * @tc.desc copy: clone values match while later mutations stay local (CommentCopyTest case 19)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentCopyTest_case_019', 0, async () => {
      const source: Comment = makeSimpleComment(3);
      const copy: Comment = cloneComment(source);
      assertCommentMatches(copy, source.id, source.name, source.comment as string, source.images.length);
      expect(commentText(copy)).assertEqual(commentText(source));
      expect(commentAvatar(copy)).assertEqual(commentAvatar(source));
      expect(sameStrings(commentImages(copy), commentImages(source))).assertTrue();
      copy.comment = 'local edit';
      expect(commentText(source)).assertEqual('comment body 3');
      expect(commentText(copy)).assertEqual('local edit');
      copy.images.push(imageUriFor(7));
      expect(copy.images.length).assertEqual(source.images.length + 1);
    });
    /**
     * @tc.name CommentCopyTest_case_020
     * @tc.desc copy: clone values match while later mutations stay local (CommentCopyTest case 20)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentCopyTest_case_020', 0, async () => {
      const source: Comment = makeSimpleComment(3);
      const copy: Comment = cloneComment(source);
      assertCommentMatches(copy, source.id, source.name, source.comment as string, source.images.length);
      expect(commentText(copy)).assertEqual(commentText(source));
      expect(commentAvatar(copy)).assertEqual(commentAvatar(source));
      expect(sameStrings(commentImages(copy), commentImages(source))).assertTrue();
      copy.comment = 'local edit';
      expect(commentText(source)).assertEqual('comment body 3');
      expect(commentText(copy)).assertEqual('local edit');
      copy.images.push(imageUriFor(7));
      expect(copy.images.length).assertEqual(source.images.length + 1);
    });
    /**
     * @tc.name CommentCopyTest_case_021
     * @tc.desc copy: clone values match while later mutations stay local (CommentCopyTest case 21)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentCopyTest_case_021', 0, async () => {
      const source: Comment = makeSimpleComment(3);
      const copy: Comment = cloneComment(source);
      assertCommentMatches(copy, source.id, source.name, source.comment as string, source.images.length);
      expect(commentText(copy)).assertEqual(commentText(source));
      expect(commentAvatar(copy)).assertEqual(commentAvatar(source));
      expect(sameStrings(commentImages(copy), commentImages(source))).assertTrue();
      copy.comment = 'local edit';
      expect(commentText(source)).assertEqual('comment body 3');
      expect(commentText(copy)).assertEqual('local edit');
      copy.images.push(imageUriFor(7));
      expect(copy.images.length).assertEqual(source.images.length + 1);
    });
    /**
     * @tc.name CommentCopyTest_case_022
     * @tc.desc copy: clone values match while later mutations stay local (CommentCopyTest case 22)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentCopyTest_case_022', 0, async () => {
      const source: Comment = makeSimpleComment(3);
      const copy: Comment = cloneComment(source);
      assertCommentMatches(copy, source.id, source.name, source.comment as string, source.images.length);
      expect(commentText(copy)).assertEqual(commentText(source));
      expect(commentAvatar(copy)).assertEqual(commentAvatar(source));
      expect(sameStrings(commentImages(copy), commentImages(source))).assertTrue();
      copy.comment = 'local edit';
      expect(commentText(source)).assertEqual('comment body 3');
      expect(commentText(copy)).assertEqual('local edit');
      copy.images.push(imageUriFor(7));
      expect(copy.images.length).assertEqual(source.images.length + 1);
    });
    /**
     * @tc.name CommentCopyTest_case_023
     * @tc.desc copy: clone values match while later mutations stay local (CommentCopyTest case 23)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentCopyTest_case_023', 0, async () => {
      const source: Comment = makeSimpleComment(3);
      const copy: Comment = cloneComment(source);
      assertCommentMatches(copy, source.id, source.name, source.comment as string, source.images.length);
      expect(commentText(copy)).assertEqual(commentText(source));
      expect(commentAvatar(copy)).assertEqual(commentAvatar(source));
      expect(sameStrings(commentImages(copy), commentImages(source))).assertTrue();
      copy.comment = 'local edit';
      expect(commentText(source)).assertEqual('comment body 3');
      expect(commentText(copy)).assertEqual('local edit');
      copy.images.push(imageUriFor(7));
      expect(copy.images.length).assertEqual(source.images.length + 1);
    });
    /**
     * @tc.name CommentCopyTest_case_024
     * @tc.desc copy: clone values match while later mutations stay local (CommentCopyTest case 24)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentCopyTest_case_024', 0, async () => {
      const source: Comment = makeSimpleComment(3);
      const copy: Comment = cloneComment(source);
      assertCommentMatches(copy, source.id, source.name, source.comment as string, source.images.length);
      expect(commentText(copy)).assertEqual(commentText(source));
      expect(commentAvatar(copy)).assertEqual(commentAvatar(source));
      expect(sameStrings(commentImages(copy), commentImages(source))).assertTrue();
      copy.comment = 'local edit';
      expect(commentText(source)).assertEqual('comment body 3');
      expect(commentText(copy)).assertEqual('local edit');
      copy.images.push(imageUriFor(7));
      expect(copy.images.length).assertEqual(source.images.length + 1);
    });
    /**
     * @tc.name CommentCopyTest_case_025
     * @tc.desc copy: clone values match while later mutations stay local (CommentCopyTest case 25)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentCopyTest_case_025', 0, async () => {
      const source: Comment = makeSimpleComment(3);
      const copy: Comment = cloneComment(source);
      assertCommentMatches(copy, source.id, source.name, source.comment as string, source.images.length);
      expect(commentText(copy)).assertEqual(commentText(source));
      expect(commentAvatar(copy)).assertEqual(commentAvatar(source));
      expect(sameStrings(commentImages(copy), commentImages(source))).assertTrue();
      copy.comment = 'local edit';
      expect(commentText(source)).assertEqual('comment body 3');
      expect(commentText(copy)).assertEqual('local edit');
      copy.images.push(imageUriFor(7));
      expect(copy.images.length).assertEqual(source.images.length + 1);
    });
    /**
     * @tc.name CommentCopyTest_case_026
     * @tc.desc copy: clone values match while later mutations stay local (CommentCopyTest case 26)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentCopyTest_case_026', 0, async () => {
      const source: Comment = makeSimpleComment(3);
      const copy: Comment = cloneComment(source);
      assertCommentMatches(copy, source.id, source.name, source.comment as string, source.images.length);
      expect(commentText(copy)).assertEqual(commentText(source));
      expect(commentAvatar(copy)).assertEqual(commentAvatar(source));
      expect(sameStrings(commentImages(copy), commentImages(source))).assertTrue();
      copy.comment = 'local edit';
      expect(commentText(source)).assertEqual('comment body 3');
      expect(commentText(copy)).assertEqual('local edit');
      copy.images.push(imageUriFor(7));
      expect(copy.images.length).assertEqual(source.images.length + 1);
    });
    /**
     * @tc.name CommentCopyTest_case_027
     * @tc.desc copy: clone values match while later mutations stay local (CommentCopyTest case 27)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentCopyTest_case_027', 0, async () => {
      const source: Comment = makeSimpleComment(3);
      const copy: Comment = cloneComment(source);
      assertCommentMatches(copy, source.id, source.name, source.comment as string, source.images.length);
      expect(commentText(copy)).assertEqual(commentText(source));
      expect(commentAvatar(copy)).assertEqual(commentAvatar(source));
      expect(sameStrings(commentImages(copy), commentImages(source))).assertTrue();
      copy.comment = 'local edit';
      expect(commentText(source)).assertEqual('comment body 3');
      expect(commentText(copy)).assertEqual('local edit');
      copy.images.push(imageUriFor(7));
      expect(copy.images.length).assertEqual(source.images.length + 1);
    });
    /**
     * @tc.name CommentCopyTest_case_028
     * @tc.desc copy: clone values match while later mutations stay local (CommentCopyTest case 28)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentCopyTest_case_028', 0, async () => {
      const source: Comment = makeSimpleComment(3);
      const copy: Comment = cloneComment(source);
      assertCommentMatches(copy, source.id, source.name, source.comment as string, source.images.length);
      expect(commentText(copy)).assertEqual(commentText(source));
      expect(commentAvatar(copy)).assertEqual(commentAvatar(source));
      expect(sameStrings(commentImages(copy), commentImages(source))).assertTrue();
      copy.comment = 'local edit';
      expect(commentText(source)).assertEqual('comment body 3');
      expect(commentText(copy)).assertEqual('local edit');
      copy.images.push(imageUriFor(7));
      expect(copy.images.length).assertEqual(source.images.length + 1);
    });
    /**
     * @tc.name CommentCopyTest_case_029
     * @tc.desc copy: clone values match while later mutations stay local (CommentCopyTest case 29)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentCopyTest_case_029', 0, async () => {
      const source: Comment = makeSimpleComment(3);
      const copy: Comment = cloneComment(source);
      assertCommentMatches(copy, source.id, source.name, source.comment as string, source.images.length);
      expect(commentText(copy)).assertEqual(commentText(source));
      expect(commentAvatar(copy)).assertEqual(commentAvatar(source));
      expect(sameStrings(commentImages(copy), commentImages(source))).assertTrue();
      copy.comment = 'local edit';
      expect(commentText(source)).assertEqual('comment body 3');
      expect(commentText(copy)).assertEqual('local edit');
      copy.images.push(imageUriFor(7));
      expect(copy.images.length).assertEqual(source.images.length + 1);
    });
    /**
     * @tc.name CommentCopyTest_case_030
     * @tc.desc copy: clone values match while later mutations stay local (CommentCopyTest case 30)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentCopyTest_case_030', 0, async () => {
      const source: Comment = makeSimpleComment(3);
      const copy: Comment = cloneComment(source);
      assertCommentMatches(copy, source.id, source.name, source.comment as string, source.images.length);
      expect(commentText(copy)).assertEqual(commentText(source));
      expect(commentAvatar(copy)).assertEqual(commentAvatar(source));
      expect(sameStrings(commentImages(copy), commentImages(source))).assertTrue();
      copy.comment = 'local edit';
      expect(commentText(source)).assertEqual('comment body 3');
      expect(commentText(copy)).assertEqual('local edit');
      copy.images.push(imageUriFor(7));
      expect(copy.images.length).assertEqual(source.images.length + 1);
    });
    /**
     * @tc.name CommentCopyTest_case_031
     * @tc.desc copy: clone values match while later mutations stay local (CommentCopyTest case 31)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentCopyTest_case_031', 0, async () => {
      const source: Comment = makeSimpleComment(3);
      const copy: Comment = cloneComment(source);
      assertCommentMatches(copy, source.id, source.name, source.comment as string, source.images.length);
      expect(commentText(copy)).assertEqual(commentText(source));
      expect(commentAvatar(copy)).assertEqual(commentAvatar(source));
      expect(sameStrings(commentImages(copy), commentImages(source))).assertTrue();
      copy.comment = 'local edit';
      expect(commentText(source)).assertEqual('comment body 3');
      expect(commentText(copy)).assertEqual('local edit');
      copy.images.push(imageUriFor(7));
      expect(copy.images.length).assertEqual(source.images.length + 1);
    });
    /**
     * @tc.name CommentCopyTest_case_032
     * @tc.desc copy: clone values match while later mutations stay local (CommentCopyTest case 32)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentCopyTest_case_032', 0, async () => {
      const source: Comment = makeSimpleComment(3);
      const copy: Comment = cloneComment(source);
      assertCommentMatches(copy, source.id, source.name, source.comment as string, source.images.length);
      expect(commentText(copy)).assertEqual(commentText(source));
      expect(commentAvatar(copy)).assertEqual(commentAvatar(source));
      expect(sameStrings(commentImages(copy), commentImages(source))).assertTrue();
      copy.comment = 'local edit';
      expect(commentText(source)).assertEqual('comment body 3');
      expect(commentText(copy)).assertEqual('local edit');
      copy.images.push(imageUriFor(7));
      expect(copy.images.length).assertEqual(source.images.length + 1);
    });
    /**
     * @tc.name CommentCopyTest_case_033
     * @tc.desc copy: clone values match while later mutations stay local (CommentCopyTest case 33)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentCopyTest_case_033', 0, async () => {
      const source: Comment = makeSimpleComment(3);
      const copy: Comment = cloneComment(source);
      assertCommentMatches(copy, source.id, source.name, source.comment as string, source.images.length);
      expect(commentText(copy)).assertEqual(commentText(source));
      expect(commentAvatar(copy)).assertEqual(commentAvatar(source));
      expect(sameStrings(commentImages(copy), commentImages(source))).assertTrue();
      copy.comment = 'local edit';
      expect(commentText(source)).assertEqual('comment body 3');
      expect(commentText(copy)).assertEqual('local edit');
      copy.images.push(imageUriFor(7));
      expect(copy.images.length).assertEqual(source.images.length + 1);
    });
    /**
     * @tc.name CommentCopyTest_case_034
     * @tc.desc copy: clone values match while later mutations stay local (CommentCopyTest case 34)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentCopyTest_case_034', 0, async () => {
      const source: Comment = makeSimpleComment(3);
      const copy: Comment = cloneComment(source);
      assertCommentMatches(copy, source.id, source.name, source.comment as string, source.images.length);
      expect(commentText(copy)).assertEqual(commentText(source));
      expect(commentAvatar(copy)).assertEqual(commentAvatar(source));
      expect(sameStrings(commentImages(copy), commentImages(source))).assertTrue();
      copy.comment = 'local edit';
      expect(commentText(source)).assertEqual('comment body 3');
      expect(commentText(copy)).assertEqual('local edit');
      copy.images.push(imageUriFor(7));
      expect(copy.images.length).assertEqual(source.images.length + 1);
    });
    /**
     * @tc.name CommentCopyTest_case_035
     * @tc.desc copy: clone values match while later mutations stay local (CommentCopyTest case 35)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentCopyTest_case_035', 0, async () => {
      const source: Comment = makeSimpleComment(3);
      const copy: Comment = cloneComment(source);
      assertCommentMatches(copy, source.id, source.name, source.comment as string, source.images.length);
      expect(commentText(copy)).assertEqual(commentText(source));
      expect(commentAvatar(copy)).assertEqual(commentAvatar(source));
      expect(sameStrings(commentImages(copy), commentImages(source))).assertTrue();
      copy.comment = 'local edit';
      expect(commentText(source)).assertEqual('comment body 3');
      expect(commentText(copy)).assertEqual('local edit');
      copy.images.push(imageUriFor(7));
      expect(copy.images.length).assertEqual(source.images.length + 1);
    });
    /**
     * @tc.name CommentCopyTest_case_036
     * @tc.desc copy: clone values match while later mutations stay local (CommentCopyTest case 36)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentCopyTest_case_036', 0, async () => {
      const source: Comment = makeSimpleComment(3);
      const copy: Comment = cloneComment(source);
      assertCommentMatches(copy, source.id, source.name, source.comment as string, source.images.length);
      expect(commentText(copy)).assertEqual(commentText(source));
      expect(commentAvatar(copy)).assertEqual(commentAvatar(source));
      expect(sameStrings(commentImages(copy), commentImages(source))).assertTrue();
      copy.comment = 'local edit';
      expect(commentText(source)).assertEqual('comment body 3');
      expect(commentText(copy)).assertEqual('local edit');
      copy.images.push(imageUriFor(7));
      expect(copy.images.length).assertEqual(source.images.length + 1);
    });
    /**
     * @tc.name CommentCopyTest_case_037
     * @tc.desc copy: clone values match while later mutations stay local (CommentCopyTest case 37)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentCopyTest_case_037', 0, async () => {
      const source: Comment = makeSimpleComment(3);
      const copy: Comment = cloneComment(source);
      assertCommentMatches(copy, source.id, source.name, source.comment as string, source.images.length);
      expect(commentText(copy)).assertEqual(commentText(source));
      expect(commentAvatar(copy)).assertEqual(commentAvatar(source));
      expect(sameStrings(commentImages(copy), commentImages(source))).assertTrue();
      copy.comment = 'local edit';
      expect(commentText(source)).assertEqual('comment body 3');
      expect(commentText(copy)).assertEqual('local edit');
      copy.images.push(imageUriFor(7));
      expect(copy.images.length).assertEqual(source.images.length + 1);
    });
  });
}
