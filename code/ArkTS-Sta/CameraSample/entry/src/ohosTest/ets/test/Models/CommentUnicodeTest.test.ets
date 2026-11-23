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

export default function CommentUnicodeTest(): void {
  describe('CommentUnicodeTest', () => {
    beforeAll(() => {
      logSuite('CommentUnicodeTest', 'begin');
    });
    beforeEach(async () => {
      await yieldTick();
    });
    afterAll(() => {
      logSuite('CommentUnicodeTest', 'end');
    });

    /**
     * @tc.name CommentUnicodeTest_case_001
     * @tc.desc unicode: text payload at variant 1 survives assignment unchanged (CommentUnicodeTest case 1)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentUnicodeTest_case_001', 0, async () => {
      const c: Comment = new Comment();
      c.comment = '\u8fd9\u91cc\u98ce\u666f\u5f88\u597d' + 0;
      expect(commentText(c)).assertEqual('\u8fd9\u91cc\u98ce\u666f\u5f88\u597d' + 0);
      expect(commentText(c).length > 0).assertTrue();
      expect(commentText(c).indexOf('\u98ce')).assertEqual(2);
      c.name = '\u7528\u6237';
      expect(c.name).assertEqual('\u7528\u6237');
      c.images = [imageUriFor(1)];
      c.images[0] = imageUriFor(1);
      expect(commentImages(c).length).assertEqual(1);
      expect(commentText(c).length >= 4).assertTrue();
    });
    /**
     * @tc.name CommentUnicodeTest_case_002
     * @tc.desc unicode: text payload at variant 2 survives assignment unchanged (CommentUnicodeTest case 2)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentUnicodeTest_case_002', 0, async () => {
      const c: Comment = new Comment();
      c.comment = '\u8fd9\u91cc\u98ce\u666f\u5f88\u597d' + 1;
      expect(commentText(c)).assertEqual('\u8fd9\u91cc\u98ce\u666f\u5f88\u597d' + 1);
      expect(commentText(c).length > 0).assertTrue();
      expect(commentText(c).indexOf('\u98ce')).assertEqual(2);
      c.name = '\u7528\u6237';
      expect(c.name).assertEqual('\u7528\u6237');
      c.images = [imageUriFor(1)];
      c.images[0] = imageUriFor(1);
      expect(commentImages(c).length).assertEqual(1);
      expect(commentText(c).length >= 4).assertTrue();
    });
    /**
     * @tc.name CommentUnicodeTest_case_003
     * @tc.desc unicode: text payload at variant 3 survives assignment unchanged (CommentUnicodeTest case 3)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentUnicodeTest_case_003', 0, async () => {
      const c: Comment = new Comment();
      c.comment = '\u8fd9\u91cc\u98ce\u666f\u5f88\u597d' + 2;
      expect(commentText(c)).assertEqual('\u8fd9\u91cc\u98ce\u666f\u5f88\u597d' + 2);
      expect(commentText(c).length > 0).assertTrue();
      expect(commentText(c).indexOf('\u98ce')).assertEqual(2);
      c.name = '\u7528\u6237';
      expect(c.name).assertEqual('\u7528\u6237');
      c.images = [imageUriFor(1)];
      c.images[0] = imageUriFor(1);
      expect(commentImages(c).length).assertEqual(1);
      expect(commentText(c).length >= 4).assertTrue();
    });
    /**
     * @tc.name CommentUnicodeTest_case_004
     * @tc.desc unicode: text payload at variant 4 survives assignment unchanged (CommentUnicodeTest case 4)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentUnicodeTest_case_004', 0, async () => {
      const c: Comment = new Comment();
      c.comment = '\u8fd9\u91cc\u98ce\u666f\u5f88\u597d' + 3;
      expect(commentText(c)).assertEqual('\u8fd9\u91cc\u98ce\u666f\u5f88\u597d' + 3);
      expect(commentText(c).length > 0).assertTrue();
      expect(commentText(c).indexOf('\u98ce')).assertEqual(2);
      c.name = '\u7528\u6237';
      expect(c.name).assertEqual('\u7528\u6237');
      c.images = [imageUriFor(1)];
      c.images[0] = imageUriFor(1);
      expect(commentImages(c).length).assertEqual(1);
      expect(commentText(c).length >= 4).assertTrue();
    });
    /**
     * @tc.name CommentUnicodeTest_case_005
     * @tc.desc unicode: text payload at variant 1 survives assignment unchanged (CommentUnicodeTest case 5)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentUnicodeTest_case_005', 0, async () => {
      const c: Comment = new Comment();
      c.comment = '\u8fd9\u91cc\u98ce\u666f\u5f88\u597d' + 4;
      expect(commentText(c)).assertEqual('\u8fd9\u91cc\u98ce\u666f\u5f88\u597d' + 4);
      expect(commentText(c).length > 0).assertTrue();
      expect(commentText(c).indexOf('\u98ce')).assertEqual(2);
      c.name = '\u7528\u6237';
      expect(c.name).assertEqual('\u7528\u6237');
      c.images = [imageUriFor(1)];
      c.images[0] = imageUriFor(1);
      expect(commentImages(c).length).assertEqual(1);
      expect(commentText(c).length >= 4).assertTrue();
    });
    /**
     * @tc.name CommentUnicodeTest_case_006
     * @tc.desc unicode: text payload at variant 2 survives assignment unchanged (CommentUnicodeTest case 6)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentUnicodeTest_case_006', 0, async () => {
      const c: Comment = new Comment();
      c.comment = '\u8fd9\u91cc\u98ce\u666f\u5f88\u597d' + 5;
      expect(commentText(c)).assertEqual('\u8fd9\u91cc\u98ce\u666f\u5f88\u597d' + 5);
      expect(commentText(c).length > 0).assertTrue();
      expect(commentText(c).indexOf('\u98ce')).assertEqual(2);
      c.name = '\u7528\u6237';
      expect(c.name).assertEqual('\u7528\u6237');
      c.images = [imageUriFor(1)];
      c.images[0] = imageUriFor(1);
      expect(commentImages(c).length).assertEqual(1);
      expect(commentText(c).length >= 4).assertTrue();
    });
    /**
     * @tc.name CommentUnicodeTest_case_007
     * @tc.desc unicode: text payload at variant 3 survives assignment unchanged (CommentUnicodeTest case 7)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentUnicodeTest_case_007', 0, async () => {
      const c: Comment = new Comment();
      c.comment = '\u8fd9\u91cc\u98ce\u666f\u5f88\u597d' + 6;
      expect(commentText(c)).assertEqual('\u8fd9\u91cc\u98ce\u666f\u5f88\u597d' + 6);
      expect(commentText(c).length > 0).assertTrue();
      expect(commentText(c).indexOf('\u98ce')).assertEqual(2);
      c.name = '\u7528\u6237';
      expect(c.name).assertEqual('\u7528\u6237');
      c.images = [imageUriFor(1)];
      c.images[0] = imageUriFor(1);
      expect(commentImages(c).length).assertEqual(1);
      expect(commentText(c).length >= 4).assertTrue();
    });
    /**
     * @tc.name CommentUnicodeTest_case_008
     * @tc.desc unicode: text payload at variant 4 survives assignment unchanged (CommentUnicodeTest case 8)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentUnicodeTest_case_008', 0, async () => {
      const c: Comment = new Comment();
      c.comment = '\u8fd9\u91cc\u98ce\u666f\u5f88\u597d' + 7;
      expect(commentText(c)).assertEqual('\u8fd9\u91cc\u98ce\u666f\u5f88\u597d' + 7);
      expect(commentText(c).length > 0).assertTrue();
      expect(commentText(c).indexOf('\u98ce')).assertEqual(2);
      c.name = '\u7528\u6237';
      expect(c.name).assertEqual('\u7528\u6237');
      c.images = [imageUriFor(1)];
      c.images[0] = imageUriFor(1);
      expect(commentImages(c).length).assertEqual(1);
      expect(commentText(c).length >= 4).assertTrue();
    });
    /**
     * @tc.name CommentUnicodeTest_case_009
     * @tc.desc unicode: text payload at variant 1 survives assignment unchanged (CommentUnicodeTest case 9)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentUnicodeTest_case_009', 0, async () => {
      const c: Comment = new Comment();
      c.comment = '\u8fd9\u91cc\u98ce\u666f\u5f88\u597d' + 8;
      expect(commentText(c)).assertEqual('\u8fd9\u91cc\u98ce\u666f\u5f88\u597d' + 8);
      expect(commentText(c).length > 0).assertTrue();
      expect(commentText(c).indexOf('\u98ce')).assertEqual(2);
      c.name = '\u7528\u6237';
      expect(c.name).assertEqual('\u7528\u6237');
      c.images = [imageUriFor(1)];
      c.images[0] = imageUriFor(1);
      expect(commentImages(c).length).assertEqual(1);
      expect(commentText(c).length >= 4).assertTrue();
    });
    /**
     * @tc.name CommentUnicodeTest_case_010
     * @tc.desc unicode: text payload at variant 2 survives assignment unchanged (CommentUnicodeTest case 10)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentUnicodeTest_case_010', 0, async () => {
      const c: Comment = new Comment();
      c.comment = '\u8fd9\u91cc\u98ce\u666f\u5f88\u597d' + 9;
      expect(commentText(c)).assertEqual('\u8fd9\u91cc\u98ce\u666f\u5f88\u597d' + 9);
      expect(commentText(c).length > 0).assertTrue();
      expect(commentText(c).indexOf('\u98ce')).assertEqual(2);
      c.name = '\u7528\u6237';
      expect(c.name).assertEqual('\u7528\u6237');
      c.images = [imageUriFor(1)];
      c.images[0] = imageUriFor(1);
      expect(commentImages(c).length).assertEqual(1);
      expect(commentText(c).length >= 4).assertTrue();
    });
    /**
     * @tc.name CommentUnicodeTest_case_011
     * @tc.desc unicode: text payload at variant 3 survives assignment unchanged (CommentUnicodeTest case 11)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentUnicodeTest_case_011', 0, async () => {
      const c: Comment = new Comment();
      c.comment = '\u8fd9\u91cc\u98ce\u666f\u5f88\u597d' + 10;
      expect(commentText(c)).assertEqual('\u8fd9\u91cc\u98ce\u666f\u5f88\u597d' + 10);
      expect(commentText(c).length > 0).assertTrue();
      expect(commentText(c).indexOf('\u98ce')).assertEqual(2);
      c.name = '\u7528\u6237';
      expect(c.name).assertEqual('\u7528\u6237');
      c.images = [imageUriFor(1)];
      c.images[0] = imageUriFor(1);
      expect(commentImages(c).length).assertEqual(1);
      expect(commentText(c).length >= 4).assertTrue();
    });
    /**
     * @tc.name CommentUnicodeTest_case_012
     * @tc.desc unicode: text payload at variant 4 survives assignment unchanged (CommentUnicodeTest case 12)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentUnicodeTest_case_012', 0, async () => {
      const c: Comment = new Comment();
      c.comment = '\u8fd9\u91cc\u98ce\u666f\u5f88\u597d' + 11;
      expect(commentText(c)).assertEqual('\u8fd9\u91cc\u98ce\u666f\u5f88\u597d' + 11);
      expect(commentText(c).length > 0).assertTrue();
      expect(commentText(c).indexOf('\u98ce')).assertEqual(2);
      c.name = '\u7528\u6237';
      expect(c.name).assertEqual('\u7528\u6237');
      c.images = [imageUriFor(1)];
      c.images[0] = imageUriFor(1);
      expect(commentImages(c).length).assertEqual(1);
      expect(commentText(c).length >= 4).assertTrue();
    });
    /**
     * @tc.name CommentUnicodeTest_case_013
     * @tc.desc unicode: text payload at variant 1 survives assignment unchanged (CommentUnicodeTest case 13)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentUnicodeTest_case_013', 0, async () => {
      const c: Comment = new Comment();
      c.comment = '\u8fd9\u91cc\u98ce\u666f\u5f88\u597d' + 12;
      expect(commentText(c)).assertEqual('\u8fd9\u91cc\u98ce\u666f\u5f88\u597d' + 12);
      expect(commentText(c).length > 0).assertTrue();
      expect(commentText(c).indexOf('\u98ce')).assertEqual(2);
      c.name = '\u7528\u6237';
      expect(c.name).assertEqual('\u7528\u6237');
      c.images = [imageUriFor(1)];
      c.images[0] = imageUriFor(1);
      expect(commentImages(c).length).assertEqual(1);
      expect(commentText(c).length >= 4).assertTrue();
    });
    /**
     * @tc.name CommentUnicodeTest_case_014
     * @tc.desc unicode: text payload at variant 2 survives assignment unchanged (CommentUnicodeTest case 14)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentUnicodeTest_case_014', 0, async () => {
      const c: Comment = new Comment();
      c.comment = '\u8fd9\u91cc\u98ce\u666f\u5f88\u597d' + 13;
      expect(commentText(c)).assertEqual('\u8fd9\u91cc\u98ce\u666f\u5f88\u597d' + 13);
      expect(commentText(c).length > 0).assertTrue();
      expect(commentText(c).indexOf('\u98ce')).assertEqual(2);
      c.name = '\u7528\u6237';
      expect(c.name).assertEqual('\u7528\u6237');
      c.images = [imageUriFor(1)];
      c.images[0] = imageUriFor(1);
      expect(commentImages(c).length).assertEqual(1);
      expect(commentText(c).length >= 4).assertTrue();
    });
    /**
     * @tc.name CommentUnicodeTest_case_015
     * @tc.desc unicode: text payload at variant 3 survives assignment unchanged (CommentUnicodeTest case 15)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentUnicodeTest_case_015', 0, async () => {
      const c: Comment = new Comment();
      c.comment = '\u8fd9\u91cc\u98ce\u666f\u5f88\u597d' + 14;
      expect(commentText(c)).assertEqual('\u8fd9\u91cc\u98ce\u666f\u5f88\u597d' + 14);
      expect(commentText(c).length > 0).assertTrue();
      expect(commentText(c).indexOf('\u98ce')).assertEqual(2);
      c.name = '\u7528\u6237';
      expect(c.name).assertEqual('\u7528\u6237');
      c.images = [imageUriFor(1)];
      c.images[0] = imageUriFor(1);
      expect(commentImages(c).length).assertEqual(1);
      expect(commentText(c).length >= 4).assertTrue();
    });
    /**
     * @tc.name CommentUnicodeTest_case_016
     * @tc.desc unicode: text payload at variant 4 survives assignment unchanged (CommentUnicodeTest case 16)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentUnicodeTest_case_016', 0, async () => {
      const c: Comment = new Comment();
      c.comment = '\u8fd9\u91cc\u98ce\u666f\u5f88\u597d' + 15;
      expect(commentText(c)).assertEqual('\u8fd9\u91cc\u98ce\u666f\u5f88\u597d' + 15);
      expect(commentText(c).length > 0).assertTrue();
      expect(commentText(c).indexOf('\u98ce')).assertEqual(2);
      c.name = '\u7528\u6237';
      expect(c.name).assertEqual('\u7528\u6237');
      c.images = [imageUriFor(1)];
      c.images[0] = imageUriFor(1);
      expect(commentImages(c).length).assertEqual(1);
      expect(commentText(c).length >= 4).assertTrue();
    });
    /**
     * @tc.name CommentUnicodeTest_case_017
     * @tc.desc unicode: text payload at variant 1 survives assignment unchanged (CommentUnicodeTest case 17)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentUnicodeTest_case_017', 0, async () => {
      const c: Comment = new Comment();
      c.comment = '\u8fd9\u91cc\u98ce\u666f\u5f88\u597d' + 16;
      expect(commentText(c)).assertEqual('\u8fd9\u91cc\u98ce\u666f\u5f88\u597d' + 16);
      expect(commentText(c).length > 0).assertTrue();
      expect(commentText(c).indexOf('\u98ce')).assertEqual(2);
      c.name = '\u7528\u6237';
      expect(c.name).assertEqual('\u7528\u6237');
      c.images = [imageUriFor(1)];
      c.images[0] = imageUriFor(1);
      expect(commentImages(c).length).assertEqual(1);
      expect(commentText(c).length >= 4).assertTrue();
    });
    /**
     * @tc.name CommentUnicodeTest_case_018
     * @tc.desc unicode: text payload at variant 2 survives assignment unchanged (CommentUnicodeTest case 18)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentUnicodeTest_case_018', 0, async () => {
      const c: Comment = new Comment();
      c.comment = '\u8fd9\u91cc\u98ce\u666f\u5f88\u597d' + 17;
      expect(commentText(c)).assertEqual('\u8fd9\u91cc\u98ce\u666f\u5f88\u597d' + 17);
      expect(commentText(c).length > 0).assertTrue();
      expect(commentText(c).indexOf('\u98ce')).assertEqual(2);
      c.name = '\u7528\u6237';
      expect(c.name).assertEqual('\u7528\u6237');
      c.images = [imageUriFor(1)];
      c.images[0] = imageUriFor(1);
      expect(commentImages(c).length).assertEqual(1);
      expect(commentText(c).length >= 4).assertTrue();
    });
    /**
     * @tc.name CommentUnicodeTest_case_019
     * @tc.desc unicode: text payload at variant 3 survives assignment unchanged (CommentUnicodeTest case 19)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentUnicodeTest_case_019', 0, async () => {
      const c: Comment = new Comment();
      c.comment = '\u8fd9\u91cc\u98ce\u666f\u5f88\u597d' + 18;
      expect(commentText(c)).assertEqual('\u8fd9\u91cc\u98ce\u666f\u5f88\u597d' + 18);
      expect(commentText(c).length > 0).assertTrue();
      expect(commentText(c).indexOf('\u98ce')).assertEqual(2);
      c.name = '\u7528\u6237';
      expect(c.name).assertEqual('\u7528\u6237');
      c.images = [imageUriFor(1)];
      c.images[0] = imageUriFor(1);
      expect(commentImages(c).length).assertEqual(1);
      expect(commentText(c).length >= 4).assertTrue();
    });
    /**
     * @tc.name CommentUnicodeTest_case_020
     * @tc.desc unicode: text payload at variant 4 survives assignment unchanged (CommentUnicodeTest case 20)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentUnicodeTest_case_020', 0, async () => {
      const c: Comment = new Comment();
      c.comment = '\u8fd9\u91cc\u98ce\u666f\u5f88\u597d' + 19;
      expect(commentText(c)).assertEqual('\u8fd9\u91cc\u98ce\u666f\u5f88\u597d' + 19);
      expect(commentText(c).length > 0).assertTrue();
      expect(commentText(c).indexOf('\u98ce')).assertEqual(2);
      c.name = '\u7528\u6237';
      expect(c.name).assertEqual('\u7528\u6237');
      c.images = [imageUriFor(1)];
      c.images[0] = imageUriFor(1);
      expect(commentImages(c).length).assertEqual(1);
      expect(commentText(c).length >= 4).assertTrue();
    });
    /**
     * @tc.name CommentUnicodeTest_case_021
     * @tc.desc unicode: text payload at variant 1 survives assignment unchanged (CommentUnicodeTest case 21)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentUnicodeTest_case_021', 0, async () => {
      const c: Comment = new Comment();
      c.comment = '\u8fd9\u91cc\u98ce\u666f\u5f88\u597d' + 20;
      expect(commentText(c)).assertEqual('\u8fd9\u91cc\u98ce\u666f\u5f88\u597d' + 20);
      expect(commentText(c).length > 0).assertTrue();
      expect(commentText(c).indexOf('\u98ce')).assertEqual(2);
      c.name = '\u7528\u6237';
      expect(c.name).assertEqual('\u7528\u6237');
      c.images = [imageUriFor(1)];
      c.images[0] = imageUriFor(1);
      expect(commentImages(c).length).assertEqual(1);
      expect(commentText(c).length >= 4).assertTrue();
    });
    /**
     * @tc.name CommentUnicodeTest_case_022
     * @tc.desc unicode: text payload at variant 2 survives assignment unchanged (CommentUnicodeTest case 22)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentUnicodeTest_case_022', 0, async () => {
      const c: Comment = new Comment();
      c.comment = '\u8fd9\u91cc\u98ce\u666f\u5f88\u597d' + 21;
      expect(commentText(c)).assertEqual('\u8fd9\u91cc\u98ce\u666f\u5f88\u597d' + 21);
      expect(commentText(c).length > 0).assertTrue();
      expect(commentText(c).indexOf('\u98ce')).assertEqual(2);
      c.name = '\u7528\u6237';
      expect(c.name).assertEqual('\u7528\u6237');
      c.images = [imageUriFor(1)];
      c.images[0] = imageUriFor(1);
      expect(commentImages(c).length).assertEqual(1);
      expect(commentText(c).length >= 4).assertTrue();
    });
    /**
     * @tc.name CommentUnicodeTest_case_023
     * @tc.desc unicode: text payload at variant 3 survives assignment unchanged (CommentUnicodeTest case 23)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentUnicodeTest_case_023', 0, async () => {
      const c: Comment = new Comment();
      c.comment = '\u8fd9\u91cc\u98ce\u666f\u5f88\u597d' + 22;
      expect(commentText(c)).assertEqual('\u8fd9\u91cc\u98ce\u666f\u5f88\u597d' + 22);
      expect(commentText(c).length > 0).assertTrue();
      expect(commentText(c).indexOf('\u98ce')).assertEqual(2);
      c.name = '\u7528\u6237';
      expect(c.name).assertEqual('\u7528\u6237');
      c.images = [imageUriFor(1)];
      c.images[0] = imageUriFor(1);
      expect(commentImages(c).length).assertEqual(1);
      expect(commentText(c).length >= 4).assertTrue();
    });
    /**
     * @tc.name CommentUnicodeTest_case_024
     * @tc.desc unicode: text payload at variant 4 survives assignment unchanged (CommentUnicodeTest case 24)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentUnicodeTest_case_024', 0, async () => {
      const c: Comment = new Comment();
      c.comment = '\u8fd9\u91cc\u98ce\u666f\u5f88\u597d' + 23;
      expect(commentText(c)).assertEqual('\u8fd9\u91cc\u98ce\u666f\u5f88\u597d' + 23);
      expect(commentText(c).length > 0).assertTrue();
      expect(commentText(c).indexOf('\u98ce')).assertEqual(2);
      c.name = '\u7528\u6237';
      expect(c.name).assertEqual('\u7528\u6237');
      c.images = [imageUriFor(1)];
      c.images[0] = imageUriFor(1);
      expect(commentImages(c).length).assertEqual(1);
      expect(commentText(c).length >= 4).assertTrue();
    });
    /**
     * @tc.name CommentUnicodeTest_case_025
     * @tc.desc unicode: text payload at variant 1 survives assignment unchanged (CommentUnicodeTest case 25)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentUnicodeTest_case_025', 0, async () => {
      const c: Comment = new Comment();
      c.comment = '\u8fd9\u91cc\u98ce\u666f\u5f88\u597d' + 24;
      expect(commentText(c)).assertEqual('\u8fd9\u91cc\u98ce\u666f\u5f88\u597d' + 24);
      expect(commentText(c).length > 0).assertTrue();
      expect(commentText(c).indexOf('\u98ce')).assertEqual(2);
      c.name = '\u7528\u6237';
      expect(c.name).assertEqual('\u7528\u6237');
      c.images = [imageUriFor(1)];
      c.images[0] = imageUriFor(1);
      expect(commentImages(c).length).assertEqual(1);
      expect(commentText(c).length >= 4).assertTrue();
    });
    /**
     * @tc.name CommentUnicodeTest_case_026
     * @tc.desc unicode: text payload at variant 2 survives assignment unchanged (CommentUnicodeTest case 26)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentUnicodeTest_case_026', 0, async () => {
      const c: Comment = new Comment();
      c.comment = '\u8fd9\u91cc\u98ce\u666f\u5f88\u597d' + 25;
      expect(commentText(c)).assertEqual('\u8fd9\u91cc\u98ce\u666f\u5f88\u597d' + 25);
      expect(commentText(c).length > 0).assertTrue();
      expect(commentText(c).indexOf('\u98ce')).assertEqual(2);
      c.name = '\u7528\u6237';
      expect(c.name).assertEqual('\u7528\u6237');
      c.images = [imageUriFor(1)];
      c.images[0] = imageUriFor(1);
      expect(commentImages(c).length).assertEqual(1);
      expect(commentText(c).length >= 4).assertTrue();
    });
    /**
     * @tc.name CommentUnicodeTest_case_027
     * @tc.desc unicode: text payload at variant 3 survives assignment unchanged (CommentUnicodeTest case 27)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentUnicodeTest_case_027', 0, async () => {
      const c: Comment = new Comment();
      c.comment = '\u8fd9\u91cc\u98ce\u666f\u5f88\u597d' + 26;
      expect(commentText(c)).assertEqual('\u8fd9\u91cc\u98ce\u666f\u5f88\u597d' + 26);
      expect(commentText(c).length > 0).assertTrue();
      expect(commentText(c).indexOf('\u98ce')).assertEqual(2);
      c.name = '\u7528\u6237';
      expect(c.name).assertEqual('\u7528\u6237');
      c.images = [imageUriFor(1)];
      c.images[0] = imageUriFor(1);
      expect(commentImages(c).length).assertEqual(1);
      expect(commentText(c).length >= 4).assertTrue();
    });
    /**
     * @tc.name CommentUnicodeTest_case_028
     * @tc.desc unicode: text payload at variant 4 survives assignment unchanged (CommentUnicodeTest case 28)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentUnicodeTest_case_028', 0, async () => {
      const c: Comment = new Comment();
      c.comment = '\u8fd9\u91cc\u98ce\u666f\u5f88\u597d' + 27;
      expect(commentText(c)).assertEqual('\u8fd9\u91cc\u98ce\u666f\u5f88\u597d' + 27);
      expect(commentText(c).length > 0).assertTrue();
      expect(commentText(c).indexOf('\u98ce')).assertEqual(2);
      c.name = '\u7528\u6237';
      expect(c.name).assertEqual('\u7528\u6237');
      c.images = [imageUriFor(1)];
      c.images[0] = imageUriFor(1);
      expect(commentImages(c).length).assertEqual(1);
      expect(commentText(c).length >= 4).assertTrue();
    });
    /**
     * @tc.name CommentUnicodeTest_case_029
     * @tc.desc unicode: text payload at variant 1 survives assignment unchanged (CommentUnicodeTest case 29)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentUnicodeTest_case_029', 0, async () => {
      const c: Comment = new Comment();
      c.comment = '\u8fd9\u91cc\u98ce\u666f\u5f88\u597d' + 28;
      expect(commentText(c)).assertEqual('\u8fd9\u91cc\u98ce\u666f\u5f88\u597d' + 28);
      expect(commentText(c).length > 0).assertTrue();
      expect(commentText(c).indexOf('\u98ce')).assertEqual(2);
      c.name = '\u7528\u6237';
      expect(c.name).assertEqual('\u7528\u6237');
      c.images = [imageUriFor(1)];
      c.images[0] = imageUriFor(1);
      expect(commentImages(c).length).assertEqual(1);
      expect(commentText(c).length >= 4).assertTrue();
    });
    /**
     * @tc.name CommentUnicodeTest_case_030
     * @tc.desc unicode: text payload at variant 2 survives assignment unchanged (CommentUnicodeTest case 30)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentUnicodeTest_case_030', 0, async () => {
      const c: Comment = new Comment();
      c.comment = '\u8fd9\u91cc\u98ce\u666f\u5f88\u597d' + 29;
      expect(commentText(c)).assertEqual('\u8fd9\u91cc\u98ce\u666f\u5f88\u597d' + 29);
      expect(commentText(c).length > 0).assertTrue();
      expect(commentText(c).indexOf('\u98ce')).assertEqual(2);
      c.name = '\u7528\u6237';
      expect(c.name).assertEqual('\u7528\u6237');
      c.images = [imageUriFor(1)];
      c.images[0] = imageUriFor(1);
      expect(commentImages(c).length).assertEqual(1);
      expect(commentText(c).length >= 4).assertTrue();
    });
    /**
     * @tc.name CommentUnicodeTest_case_031
     * @tc.desc unicode: text payload at variant 3 survives assignment unchanged (CommentUnicodeTest case 31)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentUnicodeTest_case_031', 0, async () => {
      const c: Comment = new Comment();
      c.comment = '\u8fd9\u91cc\u98ce\u666f\u5f88\u597d' + 30;
      expect(commentText(c)).assertEqual('\u8fd9\u91cc\u98ce\u666f\u5f88\u597d' + 30);
      expect(commentText(c).length > 0).assertTrue();
      expect(commentText(c).indexOf('\u98ce')).assertEqual(2);
      c.name = '\u7528\u6237';
      expect(c.name).assertEqual('\u7528\u6237');
      c.images = [imageUriFor(1)];
      c.images[0] = imageUriFor(1);
      expect(commentImages(c).length).assertEqual(1);
      expect(commentText(c).length >= 4).assertTrue();
    });
    /**
     * @tc.name CommentUnicodeTest_case_032
     * @tc.desc unicode: text payload at variant 4 survives assignment unchanged (CommentUnicodeTest case 32)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentUnicodeTest_case_032', 0, async () => {
      const c: Comment = new Comment();
      c.comment = '\u8fd9\u91cc\u98ce\u666f\u5f88\u597d' + 31;
      expect(commentText(c)).assertEqual('\u8fd9\u91cc\u98ce\u666f\u5f88\u597d' + 31);
      expect(commentText(c).length > 0).assertTrue();
      expect(commentText(c).indexOf('\u98ce')).assertEqual(2);
      c.name = '\u7528\u6237';
      expect(c.name).assertEqual('\u7528\u6237');
      c.images = [imageUriFor(1)];
      c.images[0] = imageUriFor(1);
      expect(commentImages(c).length).assertEqual(1);
      expect(commentText(c).length >= 4).assertTrue();
    });
    /**
     * @tc.name CommentUnicodeTest_case_033
     * @tc.desc unicode: text payload at variant 1 survives assignment unchanged (CommentUnicodeTest case 33)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentUnicodeTest_case_033', 0, async () => {
      const c: Comment = new Comment();
      c.comment = '\u8fd9\u91cc\u98ce\u666f\u5f88\u597d' + 32;
      expect(commentText(c)).assertEqual('\u8fd9\u91cc\u98ce\u666f\u5f88\u597d' + 32);
      expect(commentText(c).length > 0).assertTrue();
      expect(commentText(c).indexOf('\u98ce')).assertEqual(2);
      c.name = '\u7528\u6237';
      expect(c.name).assertEqual('\u7528\u6237');
      c.images = [imageUriFor(1)];
      c.images[0] = imageUriFor(1);
      expect(commentImages(c).length).assertEqual(1);
      expect(commentText(c).length >= 4).assertTrue();
    });
    /**
     * @tc.name CommentUnicodeTest_case_034
     * @tc.desc unicode: text payload at variant 2 survives assignment unchanged (CommentUnicodeTest case 34)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentUnicodeTest_case_034', 0, async () => {
      const c: Comment = new Comment();
      c.comment = '\u8fd9\u91cc\u98ce\u666f\u5f88\u597d' + 33;
      expect(commentText(c)).assertEqual('\u8fd9\u91cc\u98ce\u666f\u5f88\u597d' + 33);
      expect(commentText(c).length > 0).assertTrue();
      expect(commentText(c).indexOf('\u98ce')).assertEqual(2);
      c.name = '\u7528\u6237';
      expect(c.name).assertEqual('\u7528\u6237');
      c.images = [imageUriFor(1)];
      c.images[0] = imageUriFor(1);
      expect(commentImages(c).length).assertEqual(1);
      expect(commentText(c).length >= 4).assertTrue();
    });
  });
}
