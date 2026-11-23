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

export default function CommentMutabilityTest(): void {
  describe('CommentMutabilityTest', () => {
    beforeAll(() => {
      logSuite('CommentMutabilityTest', 'begin');
    });
    beforeEach(async () => {
      await yieldTick();
    });
    afterAll(() => {
      logSuite('CommentMutabilityTest', 'end');
    });

    /**
     * @tc.name CommentMutabilityTest_case_001
     * @tc.desc mutability: derived copies never write through to the source (CommentMutabilityTest case 1)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentMutabilityTest_case_001', 0, async () => {
      const source: Comment = makeSimpleComment(4);
      const updated: Comment = withCommentText(source, 'replacement 0');
      expect(commentText(updated)).assertEqual('replacement 0');
      expect(commentText(source)).assertEqual('comment body 4');
      expect(updated === source).assertFalse();
      const extended: Comment = withImages(source, imageUriBatch(2));
      expect(extended.images.length).assertEqual(2);
      expect(source.images.length).assertEqual(0);
      extended.images.push(imageUriFor(60));
      expect(extended.images.length).assertEqual(3);
      expect(source.images.length).assertEqual(0);
      expect(commentText(extended)).assertEqual(commentText(source));
    });
    /**
     * @tc.name CommentMutabilityTest_case_002
     * @tc.desc mutability: derived copies never write through to the source (CommentMutabilityTest case 2)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentMutabilityTest_case_002', 0, async () => {
      const source: Comment = makeSimpleComment(4);
      const updated: Comment = withCommentText(source, 'replacement 1');
      expect(commentText(updated)).assertEqual('replacement 1');
      expect(commentText(source)).assertEqual('comment body 4');
      expect(updated === source).assertFalse();
      const extended: Comment = withImages(source, imageUriBatch(2));
      expect(extended.images.length).assertEqual(2);
      expect(source.images.length).assertEqual(0);
      extended.images.push(imageUriFor(60));
      expect(extended.images.length).assertEqual(3);
      expect(source.images.length).assertEqual(0);
      expect(commentText(extended)).assertEqual(commentText(source));
    });
    /**
     * @tc.name CommentMutabilityTest_case_003
     * @tc.desc mutability: derived copies never write through to the source (CommentMutabilityTest case 3)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentMutabilityTest_case_003', 0, async () => {
      const source: Comment = makeSimpleComment(4);
      const updated: Comment = withCommentText(source, 'replacement 2');
      expect(commentText(updated)).assertEqual('replacement 2');
      expect(commentText(source)).assertEqual('comment body 4');
      expect(updated === source).assertFalse();
      const extended: Comment = withImages(source, imageUriBatch(2));
      expect(extended.images.length).assertEqual(2);
      expect(source.images.length).assertEqual(0);
      extended.images.push(imageUriFor(60));
      expect(extended.images.length).assertEqual(3);
      expect(source.images.length).assertEqual(0);
      expect(commentText(extended)).assertEqual(commentText(source));
    });
    /**
     * @tc.name CommentMutabilityTest_case_004
     * @tc.desc mutability: derived copies never write through to the source (CommentMutabilityTest case 4)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentMutabilityTest_case_004', 0, async () => {
      const source: Comment = makeSimpleComment(4);
      const updated: Comment = withCommentText(source, 'replacement 3');
      expect(commentText(updated)).assertEqual('replacement 3');
      expect(commentText(source)).assertEqual('comment body 4');
      expect(updated === source).assertFalse();
      const extended: Comment = withImages(source, imageUriBatch(2));
      expect(extended.images.length).assertEqual(2);
      expect(source.images.length).assertEqual(0);
      extended.images.push(imageUriFor(60));
      expect(extended.images.length).assertEqual(3);
      expect(source.images.length).assertEqual(0);
      expect(commentText(extended)).assertEqual(commentText(source));
    });
    /**
     * @tc.name CommentMutabilityTest_case_005
     * @tc.desc mutability: derived copies never write through to the source (CommentMutabilityTest case 5)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentMutabilityTest_case_005', 0, async () => {
      const source: Comment = makeSimpleComment(4);
      const updated: Comment = withCommentText(source, 'replacement 4');
      expect(commentText(updated)).assertEqual('replacement 4');
      expect(commentText(source)).assertEqual('comment body 4');
      expect(updated === source).assertFalse();
      const extended: Comment = withImages(source, imageUriBatch(2));
      expect(extended.images.length).assertEqual(2);
      expect(source.images.length).assertEqual(0);
      extended.images.push(imageUriFor(60));
      expect(extended.images.length).assertEqual(3);
      expect(source.images.length).assertEqual(0);
      expect(commentText(extended)).assertEqual(commentText(source));
    });
    /**
     * @tc.name CommentMutabilityTest_case_006
     * @tc.desc mutability: derived copies never write through to the source (CommentMutabilityTest case 6)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentMutabilityTest_case_006', 0, async () => {
      const source: Comment = makeSimpleComment(4);
      const updated: Comment = withCommentText(source, 'replacement 5');
      expect(commentText(updated)).assertEqual('replacement 5');
      expect(commentText(source)).assertEqual('comment body 4');
      expect(updated === source).assertFalse();
      const extended: Comment = withImages(source, imageUriBatch(2));
      expect(extended.images.length).assertEqual(2);
      expect(source.images.length).assertEqual(0);
      extended.images.push(imageUriFor(60));
      expect(extended.images.length).assertEqual(3);
      expect(source.images.length).assertEqual(0);
      expect(commentText(extended)).assertEqual(commentText(source));
    });
    /**
     * @tc.name CommentMutabilityTest_case_007
     * @tc.desc mutability: derived copies never write through to the source (CommentMutabilityTest case 7)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentMutabilityTest_case_007', 0, async () => {
      const source: Comment = makeSimpleComment(4);
      const updated: Comment = withCommentText(source, 'replacement 6');
      expect(commentText(updated)).assertEqual('replacement 6');
      expect(commentText(source)).assertEqual('comment body 4');
      expect(updated === source).assertFalse();
      const extended: Comment = withImages(source, imageUriBatch(2));
      expect(extended.images.length).assertEqual(2);
      expect(source.images.length).assertEqual(0);
      extended.images.push(imageUriFor(60));
      expect(extended.images.length).assertEqual(3);
      expect(source.images.length).assertEqual(0);
      expect(commentText(extended)).assertEqual(commentText(source));
    });
    /**
     * @tc.name CommentMutabilityTest_case_008
     * @tc.desc mutability: derived copies never write through to the source (CommentMutabilityTest case 8)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentMutabilityTest_case_008', 0, async () => {
      const source: Comment = makeSimpleComment(4);
      const updated: Comment = withCommentText(source, 'replacement 7');
      expect(commentText(updated)).assertEqual('replacement 7');
      expect(commentText(source)).assertEqual('comment body 4');
      expect(updated === source).assertFalse();
      const extended: Comment = withImages(source, imageUriBatch(2));
      expect(extended.images.length).assertEqual(2);
      expect(source.images.length).assertEqual(0);
      extended.images.push(imageUriFor(60));
      expect(extended.images.length).assertEqual(3);
      expect(source.images.length).assertEqual(0);
      expect(commentText(extended)).assertEqual(commentText(source));
    });
    /**
     * @tc.name CommentMutabilityTest_case_009
     * @tc.desc mutability: derived copies never write through to the source (CommentMutabilityTest case 9)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentMutabilityTest_case_009', 0, async () => {
      const source: Comment = makeSimpleComment(4);
      const updated: Comment = withCommentText(source, 'replacement 8');
      expect(commentText(updated)).assertEqual('replacement 8');
      expect(commentText(source)).assertEqual('comment body 4');
      expect(updated === source).assertFalse();
      const extended: Comment = withImages(source, imageUriBatch(2));
      expect(extended.images.length).assertEqual(2);
      expect(source.images.length).assertEqual(0);
      extended.images.push(imageUriFor(60));
      expect(extended.images.length).assertEqual(3);
      expect(source.images.length).assertEqual(0);
      expect(commentText(extended)).assertEqual(commentText(source));
    });
    /**
     * @tc.name CommentMutabilityTest_case_010
     * @tc.desc mutability: derived copies never write through to the source (CommentMutabilityTest case 10)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentMutabilityTest_case_010', 0, async () => {
      const source: Comment = makeSimpleComment(4);
      const updated: Comment = withCommentText(source, 'replacement 9');
      expect(commentText(updated)).assertEqual('replacement 9');
      expect(commentText(source)).assertEqual('comment body 4');
      expect(updated === source).assertFalse();
      const extended: Comment = withImages(source, imageUriBatch(2));
      expect(extended.images.length).assertEqual(2);
      expect(source.images.length).assertEqual(0);
      extended.images.push(imageUriFor(60));
      expect(extended.images.length).assertEqual(3);
      expect(source.images.length).assertEqual(0);
      expect(commentText(extended)).assertEqual(commentText(source));
    });
    /**
     * @tc.name CommentMutabilityTest_case_011
     * @tc.desc mutability: derived copies never write through to the source (CommentMutabilityTest case 11)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentMutabilityTest_case_011', 0, async () => {
      const source: Comment = makeSimpleComment(4);
      const updated: Comment = withCommentText(source, 'replacement 10');
      expect(commentText(updated)).assertEqual('replacement 10');
      expect(commentText(source)).assertEqual('comment body 4');
      expect(updated === source).assertFalse();
      const extended: Comment = withImages(source, imageUriBatch(2));
      expect(extended.images.length).assertEqual(2);
      expect(source.images.length).assertEqual(0);
      extended.images.push(imageUriFor(60));
      expect(extended.images.length).assertEqual(3);
      expect(source.images.length).assertEqual(0);
      expect(commentText(extended)).assertEqual(commentText(source));
    });
    /**
     * @tc.name CommentMutabilityTest_case_012
     * @tc.desc mutability: derived copies never write through to the source (CommentMutabilityTest case 12)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentMutabilityTest_case_012', 0, async () => {
      const source: Comment = makeSimpleComment(4);
      const updated: Comment = withCommentText(source, 'replacement 11');
      expect(commentText(updated)).assertEqual('replacement 11');
      expect(commentText(source)).assertEqual('comment body 4');
      expect(updated === source).assertFalse();
      const extended: Comment = withImages(source, imageUriBatch(2));
      expect(extended.images.length).assertEqual(2);
      expect(source.images.length).assertEqual(0);
      extended.images.push(imageUriFor(60));
      expect(extended.images.length).assertEqual(3);
      expect(source.images.length).assertEqual(0);
      expect(commentText(extended)).assertEqual(commentText(source));
    });
    /**
     * @tc.name CommentMutabilityTest_case_013
     * @tc.desc mutability: derived copies never write through to the source (CommentMutabilityTest case 13)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentMutabilityTest_case_013', 0, async () => {
      const source: Comment = makeSimpleComment(4);
      const updated: Comment = withCommentText(source, 'replacement 12');
      expect(commentText(updated)).assertEqual('replacement 12');
      expect(commentText(source)).assertEqual('comment body 4');
      expect(updated === source).assertFalse();
      const extended: Comment = withImages(source, imageUriBatch(2));
      expect(extended.images.length).assertEqual(2);
      expect(source.images.length).assertEqual(0);
      extended.images.push(imageUriFor(60));
      expect(extended.images.length).assertEqual(3);
      expect(source.images.length).assertEqual(0);
      expect(commentText(extended)).assertEqual(commentText(source));
    });
    /**
     * @tc.name CommentMutabilityTest_case_014
     * @tc.desc mutability: derived copies never write through to the source (CommentMutabilityTest case 14)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentMutabilityTest_case_014', 0, async () => {
      const source: Comment = makeSimpleComment(4);
      const updated: Comment = withCommentText(source, 'replacement 13');
      expect(commentText(updated)).assertEqual('replacement 13');
      expect(commentText(source)).assertEqual('comment body 4');
      expect(updated === source).assertFalse();
      const extended: Comment = withImages(source, imageUriBatch(2));
      expect(extended.images.length).assertEqual(2);
      expect(source.images.length).assertEqual(0);
      extended.images.push(imageUriFor(60));
      expect(extended.images.length).assertEqual(3);
      expect(source.images.length).assertEqual(0);
      expect(commentText(extended)).assertEqual(commentText(source));
    });
    /**
     * @tc.name CommentMutabilityTest_case_015
     * @tc.desc mutability: derived copies never write through to the source (CommentMutabilityTest case 15)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentMutabilityTest_case_015', 0, async () => {
      const source: Comment = makeSimpleComment(4);
      const updated: Comment = withCommentText(source, 'replacement 14');
      expect(commentText(updated)).assertEqual('replacement 14');
      expect(commentText(source)).assertEqual('comment body 4');
      expect(updated === source).assertFalse();
      const extended: Comment = withImages(source, imageUriBatch(2));
      expect(extended.images.length).assertEqual(2);
      expect(source.images.length).assertEqual(0);
      extended.images.push(imageUriFor(60));
      expect(extended.images.length).assertEqual(3);
      expect(source.images.length).assertEqual(0);
      expect(commentText(extended)).assertEqual(commentText(source));
    });
    /**
     * @tc.name CommentMutabilityTest_case_016
     * @tc.desc mutability: derived copies never write through to the source (CommentMutabilityTest case 16)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentMutabilityTest_case_016', 0, async () => {
      const source: Comment = makeSimpleComment(4);
      const updated: Comment = withCommentText(source, 'replacement 15');
      expect(commentText(updated)).assertEqual('replacement 15');
      expect(commentText(source)).assertEqual('comment body 4');
      expect(updated === source).assertFalse();
      const extended: Comment = withImages(source, imageUriBatch(2));
      expect(extended.images.length).assertEqual(2);
      expect(source.images.length).assertEqual(0);
      extended.images.push(imageUriFor(60));
      expect(extended.images.length).assertEqual(3);
      expect(source.images.length).assertEqual(0);
      expect(commentText(extended)).assertEqual(commentText(source));
    });
    /**
     * @tc.name CommentMutabilityTest_case_017
     * @tc.desc mutability: derived copies never write through to the source (CommentMutabilityTest case 17)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentMutabilityTest_case_017', 0, async () => {
      const source: Comment = makeSimpleComment(4);
      const updated: Comment = withCommentText(source, 'replacement 16');
      expect(commentText(updated)).assertEqual('replacement 16');
      expect(commentText(source)).assertEqual('comment body 4');
      expect(updated === source).assertFalse();
      const extended: Comment = withImages(source, imageUriBatch(2));
      expect(extended.images.length).assertEqual(2);
      expect(source.images.length).assertEqual(0);
      extended.images.push(imageUriFor(60));
      expect(extended.images.length).assertEqual(3);
      expect(source.images.length).assertEqual(0);
      expect(commentText(extended)).assertEqual(commentText(source));
    });
    /**
     * @tc.name CommentMutabilityTest_case_018
     * @tc.desc mutability: derived copies never write through to the source (CommentMutabilityTest case 18)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentMutabilityTest_case_018', 0, async () => {
      const source: Comment = makeSimpleComment(4);
      const updated: Comment = withCommentText(source, 'replacement 17');
      expect(commentText(updated)).assertEqual('replacement 17');
      expect(commentText(source)).assertEqual('comment body 4');
      expect(updated === source).assertFalse();
      const extended: Comment = withImages(source, imageUriBatch(2));
      expect(extended.images.length).assertEqual(2);
      expect(source.images.length).assertEqual(0);
      extended.images.push(imageUriFor(60));
      expect(extended.images.length).assertEqual(3);
      expect(source.images.length).assertEqual(0);
      expect(commentText(extended)).assertEqual(commentText(source));
    });
    /**
     * @tc.name CommentMutabilityTest_case_019
     * @tc.desc mutability: derived copies never write through to the source (CommentMutabilityTest case 19)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentMutabilityTest_case_019', 0, async () => {
      const source: Comment = makeSimpleComment(4);
      const updated: Comment = withCommentText(source, 'replacement 18');
      expect(commentText(updated)).assertEqual('replacement 18');
      expect(commentText(source)).assertEqual('comment body 4');
      expect(updated === source).assertFalse();
      const extended: Comment = withImages(source, imageUriBatch(2));
      expect(extended.images.length).assertEqual(2);
      expect(source.images.length).assertEqual(0);
      extended.images.push(imageUriFor(60));
      expect(extended.images.length).assertEqual(3);
      expect(source.images.length).assertEqual(0);
      expect(commentText(extended)).assertEqual(commentText(source));
    });
    /**
     * @tc.name CommentMutabilityTest_case_020
     * @tc.desc mutability: derived copies never write through to the source (CommentMutabilityTest case 20)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentMutabilityTest_case_020', 0, async () => {
      const source: Comment = makeSimpleComment(4);
      const updated: Comment = withCommentText(source, 'replacement 19');
      expect(commentText(updated)).assertEqual('replacement 19');
      expect(commentText(source)).assertEqual('comment body 4');
      expect(updated === source).assertFalse();
      const extended: Comment = withImages(source, imageUriBatch(2));
      expect(extended.images.length).assertEqual(2);
      expect(source.images.length).assertEqual(0);
      extended.images.push(imageUriFor(60));
      expect(extended.images.length).assertEqual(3);
      expect(source.images.length).assertEqual(0);
      expect(commentText(extended)).assertEqual(commentText(source));
    });
    /**
     * @tc.name CommentMutabilityTest_case_021
     * @tc.desc mutability: derived copies never write through to the source (CommentMutabilityTest case 21)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentMutabilityTest_case_021', 0, async () => {
      const source: Comment = makeSimpleComment(4);
      const updated: Comment = withCommentText(source, 'replacement 20');
      expect(commentText(updated)).assertEqual('replacement 20');
      expect(commentText(source)).assertEqual('comment body 4');
      expect(updated === source).assertFalse();
      const extended: Comment = withImages(source, imageUriBatch(2));
      expect(extended.images.length).assertEqual(2);
      expect(source.images.length).assertEqual(0);
      extended.images.push(imageUriFor(60));
      expect(extended.images.length).assertEqual(3);
      expect(source.images.length).assertEqual(0);
      expect(commentText(extended)).assertEqual(commentText(source));
    });
    /**
     * @tc.name CommentMutabilityTest_case_022
     * @tc.desc mutability: derived copies never write through to the source (CommentMutabilityTest case 22)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentMutabilityTest_case_022', 0, async () => {
      const source: Comment = makeSimpleComment(4);
      const updated: Comment = withCommentText(source, 'replacement 21');
      expect(commentText(updated)).assertEqual('replacement 21');
      expect(commentText(source)).assertEqual('comment body 4');
      expect(updated === source).assertFalse();
      const extended: Comment = withImages(source, imageUriBatch(2));
      expect(extended.images.length).assertEqual(2);
      expect(source.images.length).assertEqual(0);
      extended.images.push(imageUriFor(60));
      expect(extended.images.length).assertEqual(3);
      expect(source.images.length).assertEqual(0);
      expect(commentText(extended)).assertEqual(commentText(source));
    });
    /**
     * @tc.name CommentMutabilityTest_case_023
     * @tc.desc mutability: derived copies never write through to the source (CommentMutabilityTest case 23)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentMutabilityTest_case_023', 0, async () => {
      const source: Comment = makeSimpleComment(4);
      const updated: Comment = withCommentText(source, 'replacement 22');
      expect(commentText(updated)).assertEqual('replacement 22');
      expect(commentText(source)).assertEqual('comment body 4');
      expect(updated === source).assertFalse();
      const extended: Comment = withImages(source, imageUriBatch(2));
      expect(extended.images.length).assertEqual(2);
      expect(source.images.length).assertEqual(0);
      extended.images.push(imageUriFor(60));
      expect(extended.images.length).assertEqual(3);
      expect(source.images.length).assertEqual(0);
      expect(commentText(extended)).assertEqual(commentText(source));
    });
    /**
     * @tc.name CommentMutabilityTest_case_024
     * @tc.desc mutability: derived copies never write through to the source (CommentMutabilityTest case 24)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentMutabilityTest_case_024', 0, async () => {
      const source: Comment = makeSimpleComment(4);
      const updated: Comment = withCommentText(source, 'replacement 23');
      expect(commentText(updated)).assertEqual('replacement 23');
      expect(commentText(source)).assertEqual('comment body 4');
      expect(updated === source).assertFalse();
      const extended: Comment = withImages(source, imageUriBatch(2));
      expect(extended.images.length).assertEqual(2);
      expect(source.images.length).assertEqual(0);
      extended.images.push(imageUriFor(60));
      expect(extended.images.length).assertEqual(3);
      expect(source.images.length).assertEqual(0);
      expect(commentText(extended)).assertEqual(commentText(source));
    });
    /**
     * @tc.name CommentMutabilityTest_case_025
     * @tc.desc mutability: derived copies never write through to the source (CommentMutabilityTest case 25)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentMutabilityTest_case_025', 0, async () => {
      const source: Comment = makeSimpleComment(4);
      const updated: Comment = withCommentText(source, 'replacement 24');
      expect(commentText(updated)).assertEqual('replacement 24');
      expect(commentText(source)).assertEqual('comment body 4');
      expect(updated === source).assertFalse();
      const extended: Comment = withImages(source, imageUriBatch(2));
      expect(extended.images.length).assertEqual(2);
      expect(source.images.length).assertEqual(0);
      extended.images.push(imageUriFor(60));
      expect(extended.images.length).assertEqual(3);
      expect(source.images.length).assertEqual(0);
      expect(commentText(extended)).assertEqual(commentText(source));
    });
    /**
     * @tc.name CommentMutabilityTest_case_026
     * @tc.desc mutability: derived copies never write through to the source (CommentMutabilityTest case 26)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentMutabilityTest_case_026', 0, async () => {
      const source: Comment = makeSimpleComment(4);
      const updated: Comment = withCommentText(source, 'replacement 25');
      expect(commentText(updated)).assertEqual('replacement 25');
      expect(commentText(source)).assertEqual('comment body 4');
      expect(updated === source).assertFalse();
      const extended: Comment = withImages(source, imageUriBatch(2));
      expect(extended.images.length).assertEqual(2);
      expect(source.images.length).assertEqual(0);
      extended.images.push(imageUriFor(60));
      expect(extended.images.length).assertEqual(3);
      expect(source.images.length).assertEqual(0);
      expect(commentText(extended)).assertEqual(commentText(source));
    });
    /**
     * @tc.name CommentMutabilityTest_case_027
     * @tc.desc mutability: derived copies never write through to the source (CommentMutabilityTest case 27)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentMutabilityTest_case_027', 0, async () => {
      const source: Comment = makeSimpleComment(4);
      const updated: Comment = withCommentText(source, 'replacement 26');
      expect(commentText(updated)).assertEqual('replacement 26');
      expect(commentText(source)).assertEqual('comment body 4');
      expect(updated === source).assertFalse();
      const extended: Comment = withImages(source, imageUriBatch(2));
      expect(extended.images.length).assertEqual(2);
      expect(source.images.length).assertEqual(0);
      extended.images.push(imageUriFor(60));
      expect(extended.images.length).assertEqual(3);
      expect(source.images.length).assertEqual(0);
      expect(commentText(extended)).assertEqual(commentText(source));
    });
    /**
     * @tc.name CommentMutabilityTest_case_028
     * @tc.desc mutability: derived copies never write through to the source (CommentMutabilityTest case 28)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentMutabilityTest_case_028', 0, async () => {
      const source: Comment = makeSimpleComment(4);
      const updated: Comment = withCommentText(source, 'replacement 27');
      expect(commentText(updated)).assertEqual('replacement 27');
      expect(commentText(source)).assertEqual('comment body 4');
      expect(updated === source).assertFalse();
      const extended: Comment = withImages(source, imageUriBatch(2));
      expect(extended.images.length).assertEqual(2);
      expect(source.images.length).assertEqual(0);
      extended.images.push(imageUriFor(60));
      expect(extended.images.length).assertEqual(3);
      expect(source.images.length).assertEqual(0);
      expect(commentText(extended)).assertEqual(commentText(source));
    });
    /**
     * @tc.name CommentMutabilityTest_case_029
     * @tc.desc mutability: derived copies never write through to the source (CommentMutabilityTest case 29)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentMutabilityTest_case_029', 0, async () => {
      const source: Comment = makeSimpleComment(4);
      const updated: Comment = withCommentText(source, 'replacement 28');
      expect(commentText(updated)).assertEqual('replacement 28');
      expect(commentText(source)).assertEqual('comment body 4');
      expect(updated === source).assertFalse();
      const extended: Comment = withImages(source, imageUriBatch(2));
      expect(extended.images.length).assertEqual(2);
      expect(source.images.length).assertEqual(0);
      extended.images.push(imageUriFor(60));
      expect(extended.images.length).assertEqual(3);
      expect(source.images.length).assertEqual(0);
      expect(commentText(extended)).assertEqual(commentText(source));
    });
    /**
     * @tc.name CommentMutabilityTest_case_030
     * @tc.desc mutability: derived copies never write through to the source (CommentMutabilityTest case 30)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentMutabilityTest_case_030', 0, async () => {
      const source: Comment = makeSimpleComment(4);
      const updated: Comment = withCommentText(source, 'replacement 29');
      expect(commentText(updated)).assertEqual('replacement 29');
      expect(commentText(source)).assertEqual('comment body 4');
      expect(updated === source).assertFalse();
      const extended: Comment = withImages(source, imageUriBatch(2));
      expect(extended.images.length).assertEqual(2);
      expect(source.images.length).assertEqual(0);
      extended.images.push(imageUriFor(60));
      expect(extended.images.length).assertEqual(3);
      expect(source.images.length).assertEqual(0);
      expect(commentText(extended)).assertEqual(commentText(source));
    });
    /**
     * @tc.name CommentMutabilityTest_case_031
     * @tc.desc mutability: derived copies never write through to the source (CommentMutabilityTest case 31)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentMutabilityTest_case_031', 0, async () => {
      const source: Comment = makeSimpleComment(4);
      const updated: Comment = withCommentText(source, 'replacement 30');
      expect(commentText(updated)).assertEqual('replacement 30');
      expect(commentText(source)).assertEqual('comment body 4');
      expect(updated === source).assertFalse();
      const extended: Comment = withImages(source, imageUriBatch(2));
      expect(extended.images.length).assertEqual(2);
      expect(source.images.length).assertEqual(0);
      extended.images.push(imageUriFor(60));
      expect(extended.images.length).assertEqual(3);
      expect(source.images.length).assertEqual(0);
      expect(commentText(extended)).assertEqual(commentText(source));
    });
    /**
     * @tc.name CommentMutabilityTest_case_032
     * @tc.desc mutability: derived copies never write through to the source (CommentMutabilityTest case 32)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentMutabilityTest_case_032', 0, async () => {
      const source: Comment = makeSimpleComment(4);
      const updated: Comment = withCommentText(source, 'replacement 31');
      expect(commentText(updated)).assertEqual('replacement 31');
      expect(commentText(source)).assertEqual('comment body 4');
      expect(updated === source).assertFalse();
      const extended: Comment = withImages(source, imageUriBatch(2));
      expect(extended.images.length).assertEqual(2);
      expect(source.images.length).assertEqual(0);
      extended.images.push(imageUriFor(60));
      expect(extended.images.length).assertEqual(3);
      expect(source.images.length).assertEqual(0);
      expect(commentText(extended)).assertEqual(commentText(source));
    });
    /**
     * @tc.name CommentMutabilityTest_case_033
     * @tc.desc mutability: derived copies never write through to the source (CommentMutabilityTest case 33)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentMutabilityTest_case_033', 0, async () => {
      const source: Comment = makeSimpleComment(4);
      const updated: Comment = withCommentText(source, 'replacement 32');
      expect(commentText(updated)).assertEqual('replacement 32');
      expect(commentText(source)).assertEqual('comment body 4');
      expect(updated === source).assertFalse();
      const extended: Comment = withImages(source, imageUriBatch(2));
      expect(extended.images.length).assertEqual(2);
      expect(source.images.length).assertEqual(0);
      extended.images.push(imageUriFor(60));
      expect(extended.images.length).assertEqual(3);
      expect(source.images.length).assertEqual(0);
      expect(commentText(extended)).assertEqual(commentText(source));
    });
    /**
     * @tc.name CommentMutabilityTest_case_034
     * @tc.desc mutability: derived copies never write through to the source (CommentMutabilityTest case 34)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentMutabilityTest_case_034', 0, async () => {
      const source: Comment = makeSimpleComment(4);
      const updated: Comment = withCommentText(source, 'replacement 33');
      expect(commentText(updated)).assertEqual('replacement 33');
      expect(commentText(source)).assertEqual('comment body 4');
      expect(updated === source).assertFalse();
      const extended: Comment = withImages(source, imageUriBatch(2));
      expect(extended.images.length).assertEqual(2);
      expect(source.images.length).assertEqual(0);
      extended.images.push(imageUriFor(60));
      expect(extended.images.length).assertEqual(3);
      expect(source.images.length).assertEqual(0);
      expect(commentText(extended)).assertEqual(commentText(source));
    });
  });
}
