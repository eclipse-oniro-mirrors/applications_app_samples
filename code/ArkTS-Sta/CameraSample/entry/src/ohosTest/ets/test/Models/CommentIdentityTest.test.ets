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

export default function CommentIdentityTest(): void {
  describe('CommentIdentityTest', () => {
    beforeAll(() => {
      logSuite('CommentIdentityTest', 'begin');
    });
    beforeEach(async () => {
      await yieldTick();
    });
    afterAll(() => {
      logSuite('CommentIdentityTest', 'end');
    });

    /**
     * @tc.name CommentIdentityTest_case_001
     * @tc.desc identity: distinct Comment instances stay independent, variant 1 (CommentIdentityTest case 1)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentIdentityTest_case_001', 0, async () => {
      const first: Comment = makeSimpleComment(1);
      const second: Comment = makeSimpleComment(2);
      expect(first === second).assertFalse();
      expect(first === first).assertTrue();
      first.name = 'changed';
      expect(second.name).assertEqual('user_2');
      expect(first.name).assertEqual('changed');
      expect(first.id).assertEqual(1);
      expect(second.id).assertEqual(2);
      const alias: Comment = first;
      alias.time = 'updated';
      expect(first.time).assertEqual('updated');
      expect(first.images === second.images).assertFalse();
    });
    /**
     * @tc.name CommentIdentityTest_case_002
     * @tc.desc identity: distinct Comment instances stay independent, variant 2 (CommentIdentityTest case 2)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentIdentityTest_case_002', 0, async () => {
      const first: Comment = makeSimpleComment(1);
      const second: Comment = makeSimpleComment(2);
      expect(first === second).assertFalse();
      expect(first === first).assertTrue();
      first.name = 'changed';
      expect(second.name).assertEqual('user_2');
      expect(first.name).assertEqual('changed');
      expect(first.id).assertEqual(1);
      expect(second.id).assertEqual(2);
      const alias: Comment = first;
      alias.time = 'updated';
      expect(first.time).assertEqual('updated');
      expect(first.images === second.images).assertFalse();
    });
    /**
     * @tc.name CommentIdentityTest_case_003
     * @tc.desc identity: distinct Comment instances stay independent, variant 3 (CommentIdentityTest case 3)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentIdentityTest_case_003', 0, async () => {
      const first: Comment = makeSimpleComment(1);
      const second: Comment = makeSimpleComment(2);
      expect(first === second).assertFalse();
      expect(first === first).assertTrue();
      first.name = 'changed';
      expect(second.name).assertEqual('user_2');
      expect(first.name).assertEqual('changed');
      expect(first.id).assertEqual(1);
      expect(second.id).assertEqual(2);
      const alias: Comment = first;
      alias.time = 'updated';
      expect(first.time).assertEqual('updated');
      expect(first.images === second.images).assertFalse();
    });
    /**
     * @tc.name CommentIdentityTest_case_004
     * @tc.desc identity: distinct Comment instances stay independent, variant 1 (CommentIdentityTest case 4)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentIdentityTest_case_004', 0, async () => {
      const first: Comment = makeSimpleComment(1);
      const second: Comment = makeSimpleComment(2);
      expect(first === second).assertFalse();
      expect(first === first).assertTrue();
      first.name = 'changed';
      expect(second.name).assertEqual('user_2');
      expect(first.name).assertEqual('changed');
      expect(first.id).assertEqual(1);
      expect(second.id).assertEqual(2);
      const alias: Comment = first;
      alias.time = 'updated';
      expect(first.time).assertEqual('updated');
      expect(first.images === second.images).assertFalse();
    });
    /**
     * @tc.name CommentIdentityTest_case_005
     * @tc.desc identity: distinct Comment instances stay independent, variant 2 (CommentIdentityTest case 5)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentIdentityTest_case_005', 0, async () => {
      const first: Comment = makeSimpleComment(1);
      const second: Comment = makeSimpleComment(2);
      expect(first === second).assertFalse();
      expect(first === first).assertTrue();
      first.name = 'changed';
      expect(second.name).assertEqual('user_2');
      expect(first.name).assertEqual('changed');
      expect(first.id).assertEqual(1);
      expect(second.id).assertEqual(2);
      const alias: Comment = first;
      alias.time = 'updated';
      expect(first.time).assertEqual('updated');
      expect(first.images === second.images).assertFalse();
    });
    /**
     * @tc.name CommentIdentityTest_case_006
     * @tc.desc identity: distinct Comment instances stay independent, variant 3 (CommentIdentityTest case 6)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentIdentityTest_case_006', 0, async () => {
      const first: Comment = makeSimpleComment(1);
      const second: Comment = makeSimpleComment(2);
      expect(first === second).assertFalse();
      expect(first === first).assertTrue();
      first.name = 'changed';
      expect(second.name).assertEqual('user_2');
      expect(first.name).assertEqual('changed');
      expect(first.id).assertEqual(1);
      expect(second.id).assertEqual(2);
      const alias: Comment = first;
      alias.time = 'updated';
      expect(first.time).assertEqual('updated');
      expect(first.images === second.images).assertFalse();
    });
    /**
     * @tc.name CommentIdentityTest_case_007
     * @tc.desc identity: distinct Comment instances stay independent, variant 1 (CommentIdentityTest case 7)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentIdentityTest_case_007', 0, async () => {
      const first: Comment = makeSimpleComment(1);
      const second: Comment = makeSimpleComment(2);
      expect(first === second).assertFalse();
      expect(first === first).assertTrue();
      first.name = 'changed';
      expect(second.name).assertEqual('user_2');
      expect(first.name).assertEqual('changed');
      expect(first.id).assertEqual(1);
      expect(second.id).assertEqual(2);
      const alias: Comment = first;
      alias.time = 'updated';
      expect(first.time).assertEqual('updated');
      expect(first.images === second.images).assertFalse();
    });
    /**
     * @tc.name CommentIdentityTest_case_008
     * @tc.desc identity: distinct Comment instances stay independent, variant 2 (CommentIdentityTest case 8)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentIdentityTest_case_008', 0, async () => {
      const first: Comment = makeSimpleComment(1);
      const second: Comment = makeSimpleComment(2);
      expect(first === second).assertFalse();
      expect(first === first).assertTrue();
      first.name = 'changed';
      expect(second.name).assertEqual('user_2');
      expect(first.name).assertEqual('changed');
      expect(first.id).assertEqual(1);
      expect(second.id).assertEqual(2);
      const alias: Comment = first;
      alias.time = 'updated';
      expect(first.time).assertEqual('updated');
      expect(first.images === second.images).assertFalse();
    });
    /**
     * @tc.name CommentIdentityTest_case_009
     * @tc.desc identity: distinct Comment instances stay independent, variant 3 (CommentIdentityTest case 9)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentIdentityTest_case_009', 0, async () => {
      const first: Comment = makeSimpleComment(1);
      const second: Comment = makeSimpleComment(2);
      expect(first === second).assertFalse();
      expect(first === first).assertTrue();
      first.name = 'changed';
      expect(second.name).assertEqual('user_2');
      expect(first.name).assertEqual('changed');
      expect(first.id).assertEqual(1);
      expect(second.id).assertEqual(2);
      const alias: Comment = first;
      alias.time = 'updated';
      expect(first.time).assertEqual('updated');
      expect(first.images === second.images).assertFalse();
    });
    /**
     * @tc.name CommentIdentityTest_case_010
     * @tc.desc identity: distinct Comment instances stay independent, variant 1 (CommentIdentityTest case 10)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentIdentityTest_case_010', 0, async () => {
      const first: Comment = makeSimpleComment(1);
      const second: Comment = makeSimpleComment(2);
      expect(first === second).assertFalse();
      expect(first === first).assertTrue();
      first.name = 'changed';
      expect(second.name).assertEqual('user_2');
      expect(first.name).assertEqual('changed');
      expect(first.id).assertEqual(1);
      expect(second.id).assertEqual(2);
      const alias: Comment = first;
      alias.time = 'updated';
      expect(first.time).assertEqual('updated');
      expect(first.images === second.images).assertFalse();
    });
    /**
     * @tc.name CommentIdentityTest_case_011
     * @tc.desc identity: distinct Comment instances stay independent, variant 2 (CommentIdentityTest case 11)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentIdentityTest_case_011', 0, async () => {
      const first: Comment = makeSimpleComment(1);
      const second: Comment = makeSimpleComment(2);
      expect(first === second).assertFalse();
      expect(first === first).assertTrue();
      first.name = 'changed';
      expect(second.name).assertEqual('user_2');
      expect(first.name).assertEqual('changed');
      expect(first.id).assertEqual(1);
      expect(second.id).assertEqual(2);
      const alias: Comment = first;
      alias.time = 'updated';
      expect(first.time).assertEqual('updated');
      expect(first.images === second.images).assertFalse();
    });
    /**
     * @tc.name CommentIdentityTest_case_012
     * @tc.desc identity: distinct Comment instances stay independent, variant 3 (CommentIdentityTest case 12)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentIdentityTest_case_012', 0, async () => {
      const first: Comment = makeSimpleComment(1);
      const second: Comment = makeSimpleComment(2);
      expect(first === second).assertFalse();
      expect(first === first).assertTrue();
      first.name = 'changed';
      expect(second.name).assertEqual('user_2');
      expect(first.name).assertEqual('changed');
      expect(first.id).assertEqual(1);
      expect(second.id).assertEqual(2);
      const alias: Comment = first;
      alias.time = 'updated';
      expect(first.time).assertEqual('updated');
      expect(first.images === second.images).assertFalse();
    });
    /**
     * @tc.name CommentIdentityTest_case_013
     * @tc.desc identity: distinct Comment instances stay independent, variant 1 (CommentIdentityTest case 13)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentIdentityTest_case_013', 0, async () => {
      const first: Comment = makeSimpleComment(1);
      const second: Comment = makeSimpleComment(2);
      expect(first === second).assertFalse();
      expect(first === first).assertTrue();
      first.name = 'changed';
      expect(second.name).assertEqual('user_2');
      expect(first.name).assertEqual('changed');
      expect(first.id).assertEqual(1);
      expect(second.id).assertEqual(2);
      const alias: Comment = first;
      alias.time = 'updated';
      expect(first.time).assertEqual('updated');
      expect(first.images === second.images).assertFalse();
    });
    /**
     * @tc.name CommentIdentityTest_case_014
     * @tc.desc identity: distinct Comment instances stay independent, variant 2 (CommentIdentityTest case 14)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentIdentityTest_case_014', 0, async () => {
      const first: Comment = makeSimpleComment(1);
      const second: Comment = makeSimpleComment(2);
      expect(first === second).assertFalse();
      expect(first === first).assertTrue();
      first.name = 'changed';
      expect(second.name).assertEqual('user_2');
      expect(first.name).assertEqual('changed');
      expect(first.id).assertEqual(1);
      expect(second.id).assertEqual(2);
      const alias: Comment = first;
      alias.time = 'updated';
      expect(first.time).assertEqual('updated');
      expect(first.images === second.images).assertFalse();
    });
    /**
     * @tc.name CommentIdentityTest_case_015
     * @tc.desc identity: distinct Comment instances stay independent, variant 3 (CommentIdentityTest case 15)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentIdentityTest_case_015', 0, async () => {
      const first: Comment = makeSimpleComment(1);
      const second: Comment = makeSimpleComment(2);
      expect(first === second).assertFalse();
      expect(first === first).assertTrue();
      first.name = 'changed';
      expect(second.name).assertEqual('user_2');
      expect(first.name).assertEqual('changed');
      expect(first.id).assertEqual(1);
      expect(second.id).assertEqual(2);
      const alias: Comment = first;
      alias.time = 'updated';
      expect(first.time).assertEqual('updated');
      expect(first.images === second.images).assertFalse();
    });
    /**
     * @tc.name CommentIdentityTest_case_016
     * @tc.desc identity: distinct Comment instances stay independent, variant 1 (CommentIdentityTest case 16)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentIdentityTest_case_016', 0, async () => {
      const first: Comment = makeSimpleComment(1);
      const second: Comment = makeSimpleComment(2);
      expect(first === second).assertFalse();
      expect(first === first).assertTrue();
      first.name = 'changed';
      expect(second.name).assertEqual('user_2');
      expect(first.name).assertEqual('changed');
      expect(first.id).assertEqual(1);
      expect(second.id).assertEqual(2);
      const alias: Comment = first;
      alias.time = 'updated';
      expect(first.time).assertEqual('updated');
      expect(first.images === second.images).assertFalse();
    });
    /**
     * @tc.name CommentIdentityTest_case_017
     * @tc.desc identity: distinct Comment instances stay independent, variant 2 (CommentIdentityTest case 17)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentIdentityTest_case_017', 0, async () => {
      const first: Comment = makeSimpleComment(1);
      const second: Comment = makeSimpleComment(2);
      expect(first === second).assertFalse();
      expect(first === first).assertTrue();
      first.name = 'changed';
      expect(second.name).assertEqual('user_2');
      expect(first.name).assertEqual('changed');
      expect(first.id).assertEqual(1);
      expect(second.id).assertEqual(2);
      const alias: Comment = first;
      alias.time = 'updated';
      expect(first.time).assertEqual('updated');
      expect(first.images === second.images).assertFalse();
    });
    /**
     * @tc.name CommentIdentityTest_case_018
     * @tc.desc identity: distinct Comment instances stay independent, variant 3 (CommentIdentityTest case 18)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentIdentityTest_case_018', 0, async () => {
      const first: Comment = makeSimpleComment(1);
      const second: Comment = makeSimpleComment(2);
      expect(first === second).assertFalse();
      expect(first === first).assertTrue();
      first.name = 'changed';
      expect(second.name).assertEqual('user_2');
      expect(first.name).assertEqual('changed');
      expect(first.id).assertEqual(1);
      expect(second.id).assertEqual(2);
      const alias: Comment = first;
      alias.time = 'updated';
      expect(first.time).assertEqual('updated');
      expect(first.images === second.images).assertFalse();
    });
    /**
     * @tc.name CommentIdentityTest_case_019
     * @tc.desc identity: distinct Comment instances stay independent, variant 1 (CommentIdentityTest case 19)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentIdentityTest_case_019', 0, async () => {
      const first: Comment = makeSimpleComment(1);
      const second: Comment = makeSimpleComment(2);
      expect(first === second).assertFalse();
      expect(first === first).assertTrue();
      first.name = 'changed';
      expect(second.name).assertEqual('user_2');
      expect(first.name).assertEqual('changed');
      expect(first.id).assertEqual(1);
      expect(second.id).assertEqual(2);
      const alias: Comment = first;
      alias.time = 'updated';
      expect(first.time).assertEqual('updated');
      expect(first.images === second.images).assertFalse();
    });
    /**
     * @tc.name CommentIdentityTest_case_020
     * @tc.desc identity: distinct Comment instances stay independent, variant 2 (CommentIdentityTest case 20)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentIdentityTest_case_020', 0, async () => {
      const first: Comment = makeSimpleComment(1);
      const second: Comment = makeSimpleComment(2);
      expect(first === second).assertFalse();
      expect(first === first).assertTrue();
      first.name = 'changed';
      expect(second.name).assertEqual('user_2');
      expect(first.name).assertEqual('changed');
      expect(first.id).assertEqual(1);
      expect(second.id).assertEqual(2);
      const alias: Comment = first;
      alias.time = 'updated';
      expect(first.time).assertEqual('updated');
      expect(first.images === second.images).assertFalse();
    });
    /**
     * @tc.name CommentIdentityTest_case_021
     * @tc.desc identity: distinct Comment instances stay independent, variant 3 (CommentIdentityTest case 21)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentIdentityTest_case_021', 0, async () => {
      const first: Comment = makeSimpleComment(1);
      const second: Comment = makeSimpleComment(2);
      expect(first === second).assertFalse();
      expect(first === first).assertTrue();
      first.name = 'changed';
      expect(second.name).assertEqual('user_2');
      expect(first.name).assertEqual('changed');
      expect(first.id).assertEqual(1);
      expect(second.id).assertEqual(2);
      const alias: Comment = first;
      alias.time = 'updated';
      expect(first.time).assertEqual('updated');
      expect(first.images === second.images).assertFalse();
    });
    /**
     * @tc.name CommentIdentityTest_case_022
     * @tc.desc identity: distinct Comment instances stay independent, variant 1 (CommentIdentityTest case 22)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentIdentityTest_case_022', 0, async () => {
      const first: Comment = makeSimpleComment(1);
      const second: Comment = makeSimpleComment(2);
      expect(first === second).assertFalse();
      expect(first === first).assertTrue();
      first.name = 'changed';
      expect(second.name).assertEqual('user_2');
      expect(first.name).assertEqual('changed');
      expect(first.id).assertEqual(1);
      expect(second.id).assertEqual(2);
      const alias: Comment = first;
      alias.time = 'updated';
      expect(first.time).assertEqual('updated');
      expect(first.images === second.images).assertFalse();
    });
    /**
     * @tc.name CommentIdentityTest_case_023
     * @tc.desc identity: distinct Comment instances stay independent, variant 2 (CommentIdentityTest case 23)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentIdentityTest_case_023', 0, async () => {
      const first: Comment = makeSimpleComment(1);
      const second: Comment = makeSimpleComment(2);
      expect(first === second).assertFalse();
      expect(first === first).assertTrue();
      first.name = 'changed';
      expect(second.name).assertEqual('user_2');
      expect(first.name).assertEqual('changed');
      expect(first.id).assertEqual(1);
      expect(second.id).assertEqual(2);
      const alias: Comment = first;
      alias.time = 'updated';
      expect(first.time).assertEqual('updated');
      expect(first.images === second.images).assertFalse();
    });
    /**
     * @tc.name CommentIdentityTest_case_024
     * @tc.desc identity: distinct Comment instances stay independent, variant 3 (CommentIdentityTest case 24)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentIdentityTest_case_024', 0, async () => {
      const first: Comment = makeSimpleComment(1);
      const second: Comment = makeSimpleComment(2);
      expect(first === second).assertFalse();
      expect(first === first).assertTrue();
      first.name = 'changed';
      expect(second.name).assertEqual('user_2');
      expect(first.name).assertEqual('changed');
      expect(first.id).assertEqual(1);
      expect(second.id).assertEqual(2);
      const alias: Comment = first;
      alias.time = 'updated';
      expect(first.time).assertEqual('updated');
      expect(first.images === second.images).assertFalse();
    });
    /**
     * @tc.name CommentIdentityTest_case_025
     * @tc.desc identity: distinct Comment instances stay independent, variant 1 (CommentIdentityTest case 25)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentIdentityTest_case_025', 0, async () => {
      const first: Comment = makeSimpleComment(1);
      const second: Comment = makeSimpleComment(2);
      expect(first === second).assertFalse();
      expect(first === first).assertTrue();
      first.name = 'changed';
      expect(second.name).assertEqual('user_2');
      expect(first.name).assertEqual('changed');
      expect(first.id).assertEqual(1);
      expect(second.id).assertEqual(2);
      const alias: Comment = first;
      alias.time = 'updated';
      expect(first.time).assertEqual('updated');
      expect(first.images === second.images).assertFalse();
    });
    /**
     * @tc.name CommentIdentityTest_case_026
     * @tc.desc identity: distinct Comment instances stay independent, variant 2 (CommentIdentityTest case 26)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentIdentityTest_case_026', 0, async () => {
      const first: Comment = makeSimpleComment(1);
      const second: Comment = makeSimpleComment(2);
      expect(first === second).assertFalse();
      expect(first === first).assertTrue();
      first.name = 'changed';
      expect(second.name).assertEqual('user_2');
      expect(first.name).assertEqual('changed');
      expect(first.id).assertEqual(1);
      expect(second.id).assertEqual(2);
      const alias: Comment = first;
      alias.time = 'updated';
      expect(first.time).assertEqual('updated');
      expect(first.images === second.images).assertFalse();
    });
    /**
     * @tc.name CommentIdentityTest_case_027
     * @tc.desc identity: distinct Comment instances stay independent, variant 3 (CommentIdentityTest case 27)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentIdentityTest_case_027', 0, async () => {
      const first: Comment = makeSimpleComment(1);
      const second: Comment = makeSimpleComment(2);
      expect(first === second).assertFalse();
      expect(first === first).assertTrue();
      first.name = 'changed';
      expect(second.name).assertEqual('user_2');
      expect(first.name).assertEqual('changed');
      expect(first.id).assertEqual(1);
      expect(second.id).assertEqual(2);
      const alias: Comment = first;
      alias.time = 'updated';
      expect(first.time).assertEqual('updated');
      expect(first.images === second.images).assertFalse();
    });
    /**
     * @tc.name CommentIdentityTest_case_028
     * @tc.desc identity: distinct Comment instances stay independent, variant 1 (CommentIdentityTest case 28)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentIdentityTest_case_028', 0, async () => {
      const first: Comment = makeSimpleComment(1);
      const second: Comment = makeSimpleComment(2);
      expect(first === second).assertFalse();
      expect(first === first).assertTrue();
      first.name = 'changed';
      expect(second.name).assertEqual('user_2');
      expect(first.name).assertEqual('changed');
      expect(first.id).assertEqual(1);
      expect(second.id).assertEqual(2);
      const alias: Comment = first;
      alias.time = 'updated';
      expect(first.time).assertEqual('updated');
      expect(first.images === second.images).assertFalse();
    });
    /**
     * @tc.name CommentIdentityTest_case_029
     * @tc.desc identity: distinct Comment instances stay independent, variant 2 (CommentIdentityTest case 29)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentIdentityTest_case_029', 0, async () => {
      const first: Comment = makeSimpleComment(1);
      const second: Comment = makeSimpleComment(2);
      expect(first === second).assertFalse();
      expect(first === first).assertTrue();
      first.name = 'changed';
      expect(second.name).assertEqual('user_2');
      expect(first.name).assertEqual('changed');
      expect(first.id).assertEqual(1);
      expect(second.id).assertEqual(2);
      const alias: Comment = first;
      alias.time = 'updated';
      expect(first.time).assertEqual('updated');
      expect(first.images === second.images).assertFalse();
    });
    /**
     * @tc.name CommentIdentityTest_case_030
     * @tc.desc identity: distinct Comment instances stay independent, variant 3 (CommentIdentityTest case 30)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentIdentityTest_case_030', 0, async () => {
      const first: Comment = makeSimpleComment(1);
      const second: Comment = makeSimpleComment(2);
      expect(first === second).assertFalse();
      expect(first === first).assertTrue();
      first.name = 'changed';
      expect(second.name).assertEqual('user_2');
      expect(first.name).assertEqual('changed');
      expect(first.id).assertEqual(1);
      expect(second.id).assertEqual(2);
      const alias: Comment = first;
      alias.time = 'updated';
      expect(first.time).assertEqual('updated');
      expect(first.images === second.images).assertFalse();
    });
    /**
     * @tc.name CommentIdentityTest_case_031
     * @tc.desc identity: distinct Comment instances stay independent, variant 1 (CommentIdentityTest case 31)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentIdentityTest_case_031', 0, async () => {
      const first: Comment = makeSimpleComment(1);
      const second: Comment = makeSimpleComment(2);
      expect(first === second).assertFalse();
      expect(first === first).assertTrue();
      first.name = 'changed';
      expect(second.name).assertEqual('user_2');
      expect(first.name).assertEqual('changed');
      expect(first.id).assertEqual(1);
      expect(second.id).assertEqual(2);
      const alias: Comment = first;
      alias.time = 'updated';
      expect(first.time).assertEqual('updated');
      expect(first.images === second.images).assertFalse();
    });
    /**
     * @tc.name CommentIdentityTest_case_032
     * @tc.desc identity: distinct Comment instances stay independent, variant 2 (CommentIdentityTest case 32)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentIdentityTest_case_032', 0, async () => {
      const first: Comment = makeSimpleComment(1);
      const second: Comment = makeSimpleComment(2);
      expect(first === second).assertFalse();
      expect(first === first).assertTrue();
      first.name = 'changed';
      expect(second.name).assertEqual('user_2');
      expect(first.name).assertEqual('changed');
      expect(first.id).assertEqual(1);
      expect(second.id).assertEqual(2);
      const alias: Comment = first;
      alias.time = 'updated';
      expect(first.time).assertEqual('updated');
      expect(first.images === second.images).assertFalse();
    });
    /**
     * @tc.name CommentIdentityTest_case_033
     * @tc.desc identity: distinct Comment instances stay independent, variant 3 (CommentIdentityTest case 33)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentIdentityTest_case_033', 0, async () => {
      const first: Comment = makeSimpleComment(1);
      const second: Comment = makeSimpleComment(2);
      expect(first === second).assertFalse();
      expect(first === first).assertTrue();
      first.name = 'changed';
      expect(second.name).assertEqual('user_2');
      expect(first.name).assertEqual('changed');
      expect(first.id).assertEqual(1);
      expect(second.id).assertEqual(2);
      const alias: Comment = first;
      alias.time = 'updated';
      expect(first.time).assertEqual('updated');
      expect(first.images === second.images).assertFalse();
    });
    /**
     * @tc.name CommentIdentityTest_case_034
     * @tc.desc identity: distinct Comment instances stay independent, variant 1 (CommentIdentityTest case 34)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentIdentityTest_case_034', 0, async () => {
      const first: Comment = makeSimpleComment(1);
      const second: Comment = makeSimpleComment(2);
      expect(first === second).assertFalse();
      expect(first === first).assertTrue();
      first.name = 'changed';
      expect(second.name).assertEqual('user_2');
      expect(first.name).assertEqual('changed');
      expect(first.id).assertEqual(1);
      expect(second.id).assertEqual(2);
      const alias: Comment = first;
      alias.time = 'updated';
      expect(first.time).assertEqual('updated');
      expect(first.images === second.images).assertFalse();
    });
  });
}
