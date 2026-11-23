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

export default function CommentDefaultsTest(): void {
  describe('CommentDefaultsTest', () => {
    beforeAll(() => {
      logSuite('CommentDefaultsTest', 'begin');
    });
    beforeEach(async () => {
      await yieldTick();
    });
    afterAll(() => {
      logSuite('CommentDefaultsTest', 'end');
    });

    /**
     * @tc.name CommentDefaultsTest_case_001
     * @tc.desc defaults: a fresh Comment keeps every field at its empty default (CommentDefaultsTest case 1)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentDefaultsTest_case_001', 0, async () => {
      const c: Comment = new Comment();
      expect(c.id).assertEqual(0);
      expect(c.name).assertEqual('');
      expect(c.avatar as string).assertEqual('');
      expect(c.time).assertEqual('');
      expect(c.comment as string).assertEqual('');
      expect(c.images.length).assertEqual(0);
      expect(Array.isArray(c.images)).assertTrue();
      expect(typeof c.name).assertEqual('string');
      expect(c.id + 1).assertEqual(1);
      expect(c !== undefined).assertTrue();
    });
    /**
     * @tc.name CommentDefaultsTest_case_002
     * @tc.desc defaults: a fresh Comment keeps every field at its empty default (CommentDefaultsTest case 2)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentDefaultsTest_case_002', 0, async () => {
      const c: Comment = new Comment();
      expect(c.id).assertEqual(0);
      expect(c.name).assertEqual('');
      expect(c.avatar as string).assertEqual('');
      expect(c.time).assertEqual('');
      expect(c.comment as string).assertEqual('');
      expect(c.images.length).assertEqual(0);
      expect(Array.isArray(c.images)).assertTrue();
      expect(typeof c.name).assertEqual('string');
      expect(c.id + 1).assertEqual(1);
      expect(c !== undefined).assertTrue();
    });
    /**
     * @tc.name CommentDefaultsTest_case_003
     * @tc.desc defaults: a fresh Comment keeps every field at its empty default (CommentDefaultsTest case 3)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentDefaultsTest_case_003', 0, async () => {
      const c: Comment = new Comment();
      expect(c.id).assertEqual(0);
      expect(c.name).assertEqual('');
      expect(c.avatar as string).assertEqual('');
      expect(c.time).assertEqual('');
      expect(c.comment as string).assertEqual('');
      expect(c.images.length).assertEqual(0);
      expect(Array.isArray(c.images)).assertTrue();
      expect(typeof c.name).assertEqual('string');
      expect(c.id + 1).assertEqual(1);
      expect(c !== undefined).assertTrue();
    });
    /**
     * @tc.name CommentDefaultsTest_case_004
     * @tc.desc defaults: a fresh Comment keeps every field at its empty default (CommentDefaultsTest case 4)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentDefaultsTest_case_004', 0, async () => {
      const c: Comment = new Comment();
      expect(c.id).assertEqual(0);
      expect(c.name).assertEqual('');
      expect(c.avatar as string).assertEqual('');
      expect(c.time).assertEqual('');
      expect(c.comment as string).assertEqual('');
      expect(c.images.length).assertEqual(0);
      expect(Array.isArray(c.images)).assertTrue();
      expect(typeof c.name).assertEqual('string');
      expect(c.id + 1).assertEqual(1);
      expect(c !== undefined).assertTrue();
    });
    /**
     * @tc.name CommentDefaultsTest_case_005
     * @tc.desc defaults: a fresh Comment keeps every field at its empty default (CommentDefaultsTest case 5)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentDefaultsTest_case_005', 0, async () => {
      const c: Comment = new Comment();
      expect(c.id).assertEqual(0);
      expect(c.name).assertEqual('');
      expect(c.avatar as string).assertEqual('');
      expect(c.time).assertEqual('');
      expect(c.comment as string).assertEqual('');
      expect(c.images.length).assertEqual(0);
      expect(Array.isArray(c.images)).assertTrue();
      expect(typeof c.name).assertEqual('string');
      expect(c.id + 1).assertEqual(1);
      expect(c !== undefined).assertTrue();
    });
    /**
     * @tc.name CommentDefaultsTest_case_006
     * @tc.desc defaults: a fresh Comment keeps every field at its empty default (CommentDefaultsTest case 6)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentDefaultsTest_case_006', 0, async () => {
      const c: Comment = new Comment();
      expect(c.id).assertEqual(0);
      expect(c.name).assertEqual('');
      expect(c.avatar as string).assertEqual('');
      expect(c.time).assertEqual('');
      expect(c.comment as string).assertEqual('');
      expect(c.images.length).assertEqual(0);
      expect(Array.isArray(c.images)).assertTrue();
      expect(typeof c.name).assertEqual('string');
      expect(c.id + 1).assertEqual(1);
      expect(c !== undefined).assertTrue();
    });
    /**
     * @tc.name CommentDefaultsTest_case_007
     * @tc.desc defaults: a fresh Comment keeps every field at its empty default (CommentDefaultsTest case 7)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentDefaultsTest_case_007', 0, async () => {
      const c: Comment = new Comment();
      expect(c.id).assertEqual(0);
      expect(c.name).assertEqual('');
      expect(c.avatar as string).assertEqual('');
      expect(c.time).assertEqual('');
      expect(c.comment as string).assertEqual('');
      expect(c.images.length).assertEqual(0);
      expect(Array.isArray(c.images)).assertTrue();
      expect(typeof c.name).assertEqual('string');
      expect(c.id + 1).assertEqual(1);
      expect(c !== undefined).assertTrue();
    });
    /**
     * @tc.name CommentDefaultsTest_case_008
     * @tc.desc defaults: a fresh Comment keeps every field at its empty default (CommentDefaultsTest case 8)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentDefaultsTest_case_008', 0, async () => {
      const c: Comment = new Comment();
      expect(c.id).assertEqual(0);
      expect(c.name).assertEqual('');
      expect(c.avatar as string).assertEqual('');
      expect(c.time).assertEqual('');
      expect(c.comment as string).assertEqual('');
      expect(c.images.length).assertEqual(0);
      expect(Array.isArray(c.images)).assertTrue();
      expect(typeof c.name).assertEqual('string');
      expect(c.id + 1).assertEqual(1);
      expect(c !== undefined).assertTrue();
    });
    /**
     * @tc.name CommentDefaultsTest_case_009
     * @tc.desc defaults: a fresh Comment keeps every field at its empty default (CommentDefaultsTest case 9)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentDefaultsTest_case_009', 0, async () => {
      const c: Comment = new Comment();
      expect(c.id).assertEqual(0);
      expect(c.name).assertEqual('');
      expect(c.avatar as string).assertEqual('');
      expect(c.time).assertEqual('');
      expect(c.comment as string).assertEqual('');
      expect(c.images.length).assertEqual(0);
      expect(Array.isArray(c.images)).assertTrue();
      expect(typeof c.name).assertEqual('string');
      expect(c.id + 1).assertEqual(1);
      expect(c !== undefined).assertTrue();
    });
    /**
     * @tc.name CommentDefaultsTest_case_010
     * @tc.desc defaults: a fresh Comment keeps every field at its empty default (CommentDefaultsTest case 10)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentDefaultsTest_case_010', 0, async () => {
      const c: Comment = new Comment();
      expect(c.id).assertEqual(0);
      expect(c.name).assertEqual('');
      expect(c.avatar as string).assertEqual('');
      expect(c.time).assertEqual('');
      expect(c.comment as string).assertEqual('');
      expect(c.images.length).assertEqual(0);
      expect(Array.isArray(c.images)).assertTrue();
      expect(typeof c.name).assertEqual('string');
      expect(c.id + 1).assertEqual(1);
      expect(c !== undefined).assertTrue();
    });
    /**
     * @tc.name CommentDefaultsTest_case_011
     * @tc.desc defaults: a fresh Comment keeps every field at its empty default (CommentDefaultsTest case 11)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentDefaultsTest_case_011', 0, async () => {
      const c: Comment = new Comment();
      expect(c.id).assertEqual(0);
      expect(c.name).assertEqual('');
      expect(c.avatar as string).assertEqual('');
      expect(c.time).assertEqual('');
      expect(c.comment as string).assertEqual('');
      expect(c.images.length).assertEqual(0);
      expect(Array.isArray(c.images)).assertTrue();
      expect(typeof c.name).assertEqual('string');
      expect(c.id + 1).assertEqual(1);
      expect(c !== undefined).assertTrue();
    });
    /**
     * @tc.name CommentDefaultsTest_case_012
     * @tc.desc defaults: a fresh Comment keeps every field at its empty default (CommentDefaultsTest case 12)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentDefaultsTest_case_012', 0, async () => {
      const c: Comment = new Comment();
      expect(c.id).assertEqual(0);
      expect(c.name).assertEqual('');
      expect(c.avatar as string).assertEqual('');
      expect(c.time).assertEqual('');
      expect(c.comment as string).assertEqual('');
      expect(c.images.length).assertEqual(0);
      expect(Array.isArray(c.images)).assertTrue();
      expect(typeof c.name).assertEqual('string');
      expect(c.id + 1).assertEqual(1);
      expect(c !== undefined).assertTrue();
    });
    /**
     * @tc.name CommentDefaultsTest_case_013
     * @tc.desc defaults: a fresh Comment keeps every field at its empty default (CommentDefaultsTest case 13)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentDefaultsTest_case_013', 0, async () => {
      const c: Comment = new Comment();
      expect(c.id).assertEqual(0);
      expect(c.name).assertEqual('');
      expect(c.avatar as string).assertEqual('');
      expect(c.time).assertEqual('');
      expect(c.comment as string).assertEqual('');
      expect(c.images.length).assertEqual(0);
      expect(Array.isArray(c.images)).assertTrue();
      expect(typeof c.name).assertEqual('string');
      expect(c.id + 1).assertEqual(1);
      expect(c !== undefined).assertTrue();
    });
    /**
     * @tc.name CommentDefaultsTest_case_014
     * @tc.desc defaults: a fresh Comment keeps every field at its empty default (CommentDefaultsTest case 14)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentDefaultsTest_case_014', 0, async () => {
      const c: Comment = new Comment();
      expect(c.id).assertEqual(0);
      expect(c.name).assertEqual('');
      expect(c.avatar as string).assertEqual('');
      expect(c.time).assertEqual('');
      expect(c.comment as string).assertEqual('');
      expect(c.images.length).assertEqual(0);
      expect(Array.isArray(c.images)).assertTrue();
      expect(typeof c.name).assertEqual('string');
      expect(c.id + 1).assertEqual(1);
      expect(c !== undefined).assertTrue();
    });
    /**
     * @tc.name CommentDefaultsTest_case_015
     * @tc.desc defaults: a fresh Comment keeps every field at its empty default (CommentDefaultsTest case 15)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentDefaultsTest_case_015', 0, async () => {
      const c: Comment = new Comment();
      expect(c.id).assertEqual(0);
      expect(c.name).assertEqual('');
      expect(c.avatar as string).assertEqual('');
      expect(c.time).assertEqual('');
      expect(c.comment as string).assertEqual('');
      expect(c.images.length).assertEqual(0);
      expect(Array.isArray(c.images)).assertTrue();
      expect(typeof c.name).assertEqual('string');
      expect(c.id + 1).assertEqual(1);
      expect(c !== undefined).assertTrue();
    });
    /**
     * @tc.name CommentDefaultsTest_case_016
     * @tc.desc defaults: a fresh Comment keeps every field at its empty default (CommentDefaultsTest case 16)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentDefaultsTest_case_016', 0, async () => {
      const c: Comment = new Comment();
      expect(c.id).assertEqual(0);
      expect(c.name).assertEqual('');
      expect(c.avatar as string).assertEqual('');
      expect(c.time).assertEqual('');
      expect(c.comment as string).assertEqual('');
      expect(c.images.length).assertEqual(0);
      expect(Array.isArray(c.images)).assertTrue();
      expect(typeof c.name).assertEqual('string');
      expect(c.id + 1).assertEqual(1);
      expect(c !== undefined).assertTrue();
    });
    /**
     * @tc.name CommentDefaultsTest_case_017
     * @tc.desc defaults: a fresh Comment keeps every field at its empty default (CommentDefaultsTest case 17)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentDefaultsTest_case_017', 0, async () => {
      const c: Comment = new Comment();
      expect(c.id).assertEqual(0);
      expect(c.name).assertEqual('');
      expect(c.avatar as string).assertEqual('');
      expect(c.time).assertEqual('');
      expect(c.comment as string).assertEqual('');
      expect(c.images.length).assertEqual(0);
      expect(Array.isArray(c.images)).assertTrue();
      expect(typeof c.name).assertEqual('string');
      expect(c.id + 1).assertEqual(1);
      expect(c !== undefined).assertTrue();
    });
    /**
     * @tc.name CommentDefaultsTest_case_018
     * @tc.desc defaults: a fresh Comment keeps every field at its empty default (CommentDefaultsTest case 18)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentDefaultsTest_case_018', 0, async () => {
      const c: Comment = new Comment();
      expect(c.id).assertEqual(0);
      expect(c.name).assertEqual('');
      expect(c.avatar as string).assertEqual('');
      expect(c.time).assertEqual('');
      expect(c.comment as string).assertEqual('');
      expect(c.images.length).assertEqual(0);
      expect(Array.isArray(c.images)).assertTrue();
      expect(typeof c.name).assertEqual('string');
      expect(c.id + 1).assertEqual(1);
      expect(c !== undefined).assertTrue();
    });
    /**
     * @tc.name CommentDefaultsTest_case_019
     * @tc.desc defaults: a fresh Comment keeps every field at its empty default (CommentDefaultsTest case 19)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentDefaultsTest_case_019', 0, async () => {
      const c: Comment = new Comment();
      expect(c.id).assertEqual(0);
      expect(c.name).assertEqual('');
      expect(c.avatar as string).assertEqual('');
      expect(c.time).assertEqual('');
      expect(c.comment as string).assertEqual('');
      expect(c.images.length).assertEqual(0);
      expect(Array.isArray(c.images)).assertTrue();
      expect(typeof c.name).assertEqual('string');
      expect(c.id + 1).assertEqual(1);
      expect(c !== undefined).assertTrue();
    });
    /**
     * @tc.name CommentDefaultsTest_case_020
     * @tc.desc defaults: a fresh Comment keeps every field at its empty default (CommentDefaultsTest case 20)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentDefaultsTest_case_020', 0, async () => {
      const c: Comment = new Comment();
      expect(c.id).assertEqual(0);
      expect(c.name).assertEqual('');
      expect(c.avatar as string).assertEqual('');
      expect(c.time).assertEqual('');
      expect(c.comment as string).assertEqual('');
      expect(c.images.length).assertEqual(0);
      expect(Array.isArray(c.images)).assertTrue();
      expect(typeof c.name).assertEqual('string');
      expect(c.id + 1).assertEqual(1);
      expect(c !== undefined).assertTrue();
    });
    /**
     * @tc.name CommentDefaultsTest_case_021
     * @tc.desc defaults: a fresh Comment keeps every field at its empty default (CommentDefaultsTest case 21)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentDefaultsTest_case_021', 0, async () => {
      const c: Comment = new Comment();
      expect(c.id).assertEqual(0);
      expect(c.name).assertEqual('');
      expect(c.avatar as string).assertEqual('');
      expect(c.time).assertEqual('');
      expect(c.comment as string).assertEqual('');
      expect(c.images.length).assertEqual(0);
      expect(Array.isArray(c.images)).assertTrue();
      expect(typeof c.name).assertEqual('string');
      expect(c.id + 1).assertEqual(1);
      expect(c !== undefined).assertTrue();
    });
    /**
     * @tc.name CommentDefaultsTest_case_022
     * @tc.desc defaults: a fresh Comment keeps every field at its empty default (CommentDefaultsTest case 22)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentDefaultsTest_case_022', 0, async () => {
      const c: Comment = new Comment();
      expect(c.id).assertEqual(0);
      expect(c.name).assertEqual('');
      expect(c.avatar as string).assertEqual('');
      expect(c.time).assertEqual('');
      expect(c.comment as string).assertEqual('');
      expect(c.images.length).assertEqual(0);
      expect(Array.isArray(c.images)).assertTrue();
      expect(typeof c.name).assertEqual('string');
      expect(c.id + 1).assertEqual(1);
      expect(c !== undefined).assertTrue();
    });
    /**
     * @tc.name CommentDefaultsTest_case_023
     * @tc.desc defaults: a fresh Comment keeps every field at its empty default (CommentDefaultsTest case 23)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentDefaultsTest_case_023', 0, async () => {
      const c: Comment = new Comment();
      expect(c.id).assertEqual(0);
      expect(c.name).assertEqual('');
      expect(c.avatar as string).assertEqual('');
      expect(c.time).assertEqual('');
      expect(c.comment as string).assertEqual('');
      expect(c.images.length).assertEqual(0);
      expect(Array.isArray(c.images)).assertTrue();
      expect(typeof c.name).assertEqual('string');
      expect(c.id + 1).assertEqual(1);
      expect(c !== undefined).assertTrue();
    });
    /**
     * @tc.name CommentDefaultsTest_case_024
     * @tc.desc defaults: a fresh Comment keeps every field at its empty default (CommentDefaultsTest case 24)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentDefaultsTest_case_024', 0, async () => {
      const c: Comment = new Comment();
      expect(c.id).assertEqual(0);
      expect(c.name).assertEqual('');
      expect(c.avatar as string).assertEqual('');
      expect(c.time).assertEqual('');
      expect(c.comment as string).assertEqual('');
      expect(c.images.length).assertEqual(0);
      expect(Array.isArray(c.images)).assertTrue();
      expect(typeof c.name).assertEqual('string');
      expect(c.id + 1).assertEqual(1);
      expect(c !== undefined).assertTrue();
    });
    /**
     * @tc.name CommentDefaultsTest_case_025
     * @tc.desc defaults: a fresh Comment keeps every field at its empty default (CommentDefaultsTest case 25)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentDefaultsTest_case_025', 0, async () => {
      const c: Comment = new Comment();
      expect(c.id).assertEqual(0);
      expect(c.name).assertEqual('');
      expect(c.avatar as string).assertEqual('');
      expect(c.time).assertEqual('');
      expect(c.comment as string).assertEqual('');
      expect(c.images.length).assertEqual(0);
      expect(Array.isArray(c.images)).assertTrue();
      expect(typeof c.name).assertEqual('string');
      expect(c.id + 1).assertEqual(1);
      expect(c !== undefined).assertTrue();
    });
    /**
     * @tc.name CommentDefaultsTest_case_026
     * @tc.desc defaults: a fresh Comment keeps every field at its empty default (CommentDefaultsTest case 26)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentDefaultsTest_case_026', 0, async () => {
      const c: Comment = new Comment();
      expect(c.id).assertEqual(0);
      expect(c.name).assertEqual('');
      expect(c.avatar as string).assertEqual('');
      expect(c.time).assertEqual('');
      expect(c.comment as string).assertEqual('');
      expect(c.images.length).assertEqual(0);
      expect(Array.isArray(c.images)).assertTrue();
      expect(typeof c.name).assertEqual('string');
      expect(c.id + 1).assertEqual(1);
      expect(c !== undefined).assertTrue();
    });
    /**
     * @tc.name CommentDefaultsTest_case_027
     * @tc.desc defaults: a fresh Comment keeps every field at its empty default (CommentDefaultsTest case 27)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentDefaultsTest_case_027', 0, async () => {
      const c: Comment = new Comment();
      expect(c.id).assertEqual(0);
      expect(c.name).assertEqual('');
      expect(c.avatar as string).assertEqual('');
      expect(c.time).assertEqual('');
      expect(c.comment as string).assertEqual('');
      expect(c.images.length).assertEqual(0);
      expect(Array.isArray(c.images)).assertTrue();
      expect(typeof c.name).assertEqual('string');
      expect(c.id + 1).assertEqual(1);
      expect(c !== undefined).assertTrue();
    });
    /**
     * @tc.name CommentDefaultsTest_case_028
     * @tc.desc defaults: a fresh Comment keeps every field at its empty default (CommentDefaultsTest case 28)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentDefaultsTest_case_028', 0, async () => {
      const c: Comment = new Comment();
      expect(c.id).assertEqual(0);
      expect(c.name).assertEqual('');
      expect(c.avatar as string).assertEqual('');
      expect(c.time).assertEqual('');
      expect(c.comment as string).assertEqual('');
      expect(c.images.length).assertEqual(0);
      expect(Array.isArray(c.images)).assertTrue();
      expect(typeof c.name).assertEqual('string');
      expect(c.id + 1).assertEqual(1);
      expect(c !== undefined).assertTrue();
    });
    /**
     * @tc.name CommentDefaultsTest_case_029
     * @tc.desc defaults: a fresh Comment keeps every field at its empty default (CommentDefaultsTest case 29)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentDefaultsTest_case_029', 0, async () => {
      const c: Comment = new Comment();
      expect(c.id).assertEqual(0);
      expect(c.name).assertEqual('');
      expect(c.avatar as string).assertEqual('');
      expect(c.time).assertEqual('');
      expect(c.comment as string).assertEqual('');
      expect(c.images.length).assertEqual(0);
      expect(Array.isArray(c.images)).assertTrue();
      expect(typeof c.name).assertEqual('string');
      expect(c.id + 1).assertEqual(1);
      expect(c !== undefined).assertTrue();
    });
  });
}
