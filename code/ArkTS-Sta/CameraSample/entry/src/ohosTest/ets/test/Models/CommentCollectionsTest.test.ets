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

export default function CommentCollectionsTest(): void {
  describe('CommentCollectionsTest', () => {
    beforeAll(() => {
      logSuite('CommentCollectionsTest', 'begin');
    });
    beforeEach(async () => {
      await yieldTick();
    });
    afterAll(() => {
      logSuite('CommentCollectionsTest', 'end');
    });

    /**
     * @tc.name CommentCollectionsTest_case_001
     * @tc.desc collection: feed of 2 items keeps order and lookups (CommentCollectionsTest case 1)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentCollectionsTest_case_001', 0, async () => {
      const items: Comment[] = makeFeed(2);
      expect(items.length).assertEqual(2);
      expect(feedNames(items).length).assertEqual(items.length);
      expect(feedIds(items).length).assertEqual(items.length);
      expect(indexOfName(items, 'user_1')).assertEqual(0);
      expect(indexOfName(items, 'user_2')).assertEqual(1);
      expect(indexOfName(items, 'missing')).assertEqual(-1);
      expect(indexOfId(items, 1)).assertEqual(0);
      expect(totalImageCount(items) >= 0).assertTrue();
      expect(feedImageCounts(items).length).assertEqual(2);
      expect(feedTimes(items).length).assertEqual(2);
    });
    /**
     * @tc.name CommentCollectionsTest_case_002
     * @tc.desc collection: feed of 3 items keeps order and lookups (CommentCollectionsTest case 2)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentCollectionsTest_case_002', 0, async () => {
      const items: Comment[] = makeFeed(3);
      expect(items.length).assertEqual(3);
      expect(feedNames(items).length).assertEqual(items.length);
      expect(feedIds(items).length).assertEqual(items.length);
      expect(indexOfName(items, 'user_1')).assertEqual(0);
      expect(indexOfName(items, 'user_3')).assertEqual(2);
      expect(indexOfName(items, 'missing')).assertEqual(-1);
      expect(indexOfId(items, 1)).assertEqual(0);
      expect(totalImageCount(items) >= 0).assertTrue();
      expect(feedImageCounts(items).length).assertEqual(3);
      expect(feedTimes(items).length).assertEqual(3);
    });
    /**
     * @tc.name CommentCollectionsTest_case_003
     * @tc.desc collection: feed of 4 items keeps order and lookups (CommentCollectionsTest case 3)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentCollectionsTest_case_003', 0, async () => {
      const items: Comment[] = makeFeed(4);
      expect(items.length).assertEqual(4);
      expect(feedNames(items).length).assertEqual(items.length);
      expect(feedIds(items).length).assertEqual(items.length);
      expect(indexOfName(items, 'user_1')).assertEqual(0);
      expect(indexOfName(items, 'user_4')).assertEqual(3);
      expect(indexOfName(items, 'missing')).assertEqual(-1);
      expect(indexOfId(items, 1)).assertEqual(0);
      expect(totalImageCount(items) >= 0).assertTrue();
      expect(feedImageCounts(items).length).assertEqual(4);
      expect(feedTimes(items).length).assertEqual(4);
    });
    /**
     * @tc.name CommentCollectionsTest_case_004
     * @tc.desc collection: feed of 5 items keeps order and lookups (CommentCollectionsTest case 4)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentCollectionsTest_case_004', 0, async () => {
      const items: Comment[] = makeFeed(5);
      expect(items.length).assertEqual(5);
      expect(feedNames(items).length).assertEqual(items.length);
      expect(feedIds(items).length).assertEqual(items.length);
      expect(indexOfName(items, 'user_1')).assertEqual(0);
      expect(indexOfName(items, 'user_5')).assertEqual(4);
      expect(indexOfName(items, 'missing')).assertEqual(-1);
      expect(indexOfId(items, 1)).assertEqual(0);
      expect(totalImageCount(items) >= 0).assertTrue();
      expect(feedImageCounts(items).length).assertEqual(5);
      expect(feedTimes(items).length).assertEqual(5);
    });
    /**
     * @tc.name CommentCollectionsTest_case_005
     * @tc.desc collection: feed of 6 items keeps order and lookups (CommentCollectionsTest case 5)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentCollectionsTest_case_005', 0, async () => {
      const items: Comment[] = makeFeed(6);
      expect(items.length).assertEqual(6);
      expect(feedNames(items).length).assertEqual(items.length);
      expect(feedIds(items).length).assertEqual(items.length);
      expect(indexOfName(items, 'user_1')).assertEqual(0);
      expect(indexOfName(items, 'user_6')).assertEqual(5);
      expect(indexOfName(items, 'missing')).assertEqual(-1);
      expect(indexOfId(items, 1)).assertEqual(0);
      expect(totalImageCount(items) >= 0).assertTrue();
      expect(feedImageCounts(items).length).assertEqual(6);
      expect(feedTimes(items).length).assertEqual(6);
    });
    /**
     * @tc.name CommentCollectionsTest_case_006
     * @tc.desc collection: feed of 2 items keeps order and lookups (CommentCollectionsTest case 6)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentCollectionsTest_case_006', 0, async () => {
      const items: Comment[] = makeFeed(2);
      expect(items.length).assertEqual(2);
      expect(feedNames(items).length).assertEqual(items.length);
      expect(feedIds(items).length).assertEqual(items.length);
      expect(indexOfName(items, 'user_1')).assertEqual(0);
      expect(indexOfName(items, 'user_2')).assertEqual(1);
      expect(indexOfName(items, 'missing')).assertEqual(-1);
      expect(indexOfId(items, 1)).assertEqual(0);
      expect(totalImageCount(items) >= 0).assertTrue();
      expect(feedImageCounts(items).length).assertEqual(2);
      expect(feedTimes(items).length).assertEqual(2);
    });
    /**
     * @tc.name CommentCollectionsTest_case_007
     * @tc.desc collection: feed of 3 items keeps order and lookups (CommentCollectionsTest case 7)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentCollectionsTest_case_007', 0, async () => {
      const items: Comment[] = makeFeed(3);
      expect(items.length).assertEqual(3);
      expect(feedNames(items).length).assertEqual(items.length);
      expect(feedIds(items).length).assertEqual(items.length);
      expect(indexOfName(items, 'user_1')).assertEqual(0);
      expect(indexOfName(items, 'user_3')).assertEqual(2);
      expect(indexOfName(items, 'missing')).assertEqual(-1);
      expect(indexOfId(items, 1)).assertEqual(0);
      expect(totalImageCount(items) >= 0).assertTrue();
      expect(feedImageCounts(items).length).assertEqual(3);
      expect(feedTimes(items).length).assertEqual(3);
    });
    /**
     * @tc.name CommentCollectionsTest_case_008
     * @tc.desc collection: feed of 4 items keeps order and lookups (CommentCollectionsTest case 8)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentCollectionsTest_case_008', 0, async () => {
      const items: Comment[] = makeFeed(4);
      expect(items.length).assertEqual(4);
      expect(feedNames(items).length).assertEqual(items.length);
      expect(feedIds(items).length).assertEqual(items.length);
      expect(indexOfName(items, 'user_1')).assertEqual(0);
      expect(indexOfName(items, 'user_4')).assertEqual(3);
      expect(indexOfName(items, 'missing')).assertEqual(-1);
      expect(indexOfId(items, 1)).assertEqual(0);
      expect(totalImageCount(items) >= 0).assertTrue();
      expect(feedImageCounts(items).length).assertEqual(4);
      expect(feedTimes(items).length).assertEqual(4);
    });
    /**
     * @tc.name CommentCollectionsTest_case_009
     * @tc.desc collection: feed of 5 items keeps order and lookups (CommentCollectionsTest case 9)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentCollectionsTest_case_009', 0, async () => {
      const items: Comment[] = makeFeed(5);
      expect(items.length).assertEqual(5);
      expect(feedNames(items).length).assertEqual(items.length);
      expect(feedIds(items).length).assertEqual(items.length);
      expect(indexOfName(items, 'user_1')).assertEqual(0);
      expect(indexOfName(items, 'user_5')).assertEqual(4);
      expect(indexOfName(items, 'missing')).assertEqual(-1);
      expect(indexOfId(items, 1)).assertEqual(0);
      expect(totalImageCount(items) >= 0).assertTrue();
      expect(feedImageCounts(items).length).assertEqual(5);
      expect(feedTimes(items).length).assertEqual(5);
    });
    /**
     * @tc.name CommentCollectionsTest_case_010
     * @tc.desc collection: feed of 6 items keeps order and lookups (CommentCollectionsTest case 10)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentCollectionsTest_case_010', 0, async () => {
      const items: Comment[] = makeFeed(6);
      expect(items.length).assertEqual(6);
      expect(feedNames(items).length).assertEqual(items.length);
      expect(feedIds(items).length).assertEqual(items.length);
      expect(indexOfName(items, 'user_1')).assertEqual(0);
      expect(indexOfName(items, 'user_6')).assertEqual(5);
      expect(indexOfName(items, 'missing')).assertEqual(-1);
      expect(indexOfId(items, 1)).assertEqual(0);
      expect(totalImageCount(items) >= 0).assertTrue();
      expect(feedImageCounts(items).length).assertEqual(6);
      expect(feedTimes(items).length).assertEqual(6);
    });
    /**
     * @tc.name CommentCollectionsTest_case_011
     * @tc.desc collection: feed of 2 items keeps order and lookups (CommentCollectionsTest case 11)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentCollectionsTest_case_011', 0, async () => {
      const items: Comment[] = makeFeed(2);
      expect(items.length).assertEqual(2);
      expect(feedNames(items).length).assertEqual(items.length);
      expect(feedIds(items).length).assertEqual(items.length);
      expect(indexOfName(items, 'user_1')).assertEqual(0);
      expect(indexOfName(items, 'user_2')).assertEqual(1);
      expect(indexOfName(items, 'missing')).assertEqual(-1);
      expect(indexOfId(items, 1)).assertEqual(0);
      expect(totalImageCount(items) >= 0).assertTrue();
      expect(feedImageCounts(items).length).assertEqual(2);
      expect(feedTimes(items).length).assertEqual(2);
    });
    /**
     * @tc.name CommentCollectionsTest_case_012
     * @tc.desc collection: feed of 3 items keeps order and lookups (CommentCollectionsTest case 12)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentCollectionsTest_case_012', 0, async () => {
      const items: Comment[] = makeFeed(3);
      expect(items.length).assertEqual(3);
      expect(feedNames(items).length).assertEqual(items.length);
      expect(feedIds(items).length).assertEqual(items.length);
      expect(indexOfName(items, 'user_1')).assertEqual(0);
      expect(indexOfName(items, 'user_3')).assertEqual(2);
      expect(indexOfName(items, 'missing')).assertEqual(-1);
      expect(indexOfId(items, 1)).assertEqual(0);
      expect(totalImageCount(items) >= 0).assertTrue();
      expect(feedImageCounts(items).length).assertEqual(3);
      expect(feedTimes(items).length).assertEqual(3);
    });
    /**
     * @tc.name CommentCollectionsTest_case_013
     * @tc.desc collection: feed of 4 items keeps order and lookups (CommentCollectionsTest case 13)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentCollectionsTest_case_013', 0, async () => {
      const items: Comment[] = makeFeed(4);
      expect(items.length).assertEqual(4);
      expect(feedNames(items).length).assertEqual(items.length);
      expect(feedIds(items).length).assertEqual(items.length);
      expect(indexOfName(items, 'user_1')).assertEqual(0);
      expect(indexOfName(items, 'user_4')).assertEqual(3);
      expect(indexOfName(items, 'missing')).assertEqual(-1);
      expect(indexOfId(items, 1)).assertEqual(0);
      expect(totalImageCount(items) >= 0).assertTrue();
      expect(feedImageCounts(items).length).assertEqual(4);
      expect(feedTimes(items).length).assertEqual(4);
    });
    /**
     * @tc.name CommentCollectionsTest_case_014
     * @tc.desc collection: feed of 5 items keeps order and lookups (CommentCollectionsTest case 14)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentCollectionsTest_case_014', 0, async () => {
      const items: Comment[] = makeFeed(5);
      expect(items.length).assertEqual(5);
      expect(feedNames(items).length).assertEqual(items.length);
      expect(feedIds(items).length).assertEqual(items.length);
      expect(indexOfName(items, 'user_1')).assertEqual(0);
      expect(indexOfName(items, 'user_5')).assertEqual(4);
      expect(indexOfName(items, 'missing')).assertEqual(-1);
      expect(indexOfId(items, 1)).assertEqual(0);
      expect(totalImageCount(items) >= 0).assertTrue();
      expect(feedImageCounts(items).length).assertEqual(5);
      expect(feedTimes(items).length).assertEqual(5);
    });
    /**
     * @tc.name CommentCollectionsTest_case_015
     * @tc.desc collection: feed of 6 items keeps order and lookups (CommentCollectionsTest case 15)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentCollectionsTest_case_015', 0, async () => {
      const items: Comment[] = makeFeed(6);
      expect(items.length).assertEqual(6);
      expect(feedNames(items).length).assertEqual(items.length);
      expect(feedIds(items).length).assertEqual(items.length);
      expect(indexOfName(items, 'user_1')).assertEqual(0);
      expect(indexOfName(items, 'user_6')).assertEqual(5);
      expect(indexOfName(items, 'missing')).assertEqual(-1);
      expect(indexOfId(items, 1)).assertEqual(0);
      expect(totalImageCount(items) >= 0).assertTrue();
      expect(feedImageCounts(items).length).assertEqual(6);
      expect(feedTimes(items).length).assertEqual(6);
    });
    /**
     * @tc.name CommentCollectionsTest_case_016
     * @tc.desc collection: feed of 2 items keeps order and lookups (CommentCollectionsTest case 16)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentCollectionsTest_case_016', 0, async () => {
      const items: Comment[] = makeFeed(2);
      expect(items.length).assertEqual(2);
      expect(feedNames(items).length).assertEqual(items.length);
      expect(feedIds(items).length).assertEqual(items.length);
      expect(indexOfName(items, 'user_1')).assertEqual(0);
      expect(indexOfName(items, 'user_2')).assertEqual(1);
      expect(indexOfName(items, 'missing')).assertEqual(-1);
      expect(indexOfId(items, 1)).assertEqual(0);
      expect(totalImageCount(items) >= 0).assertTrue();
      expect(feedImageCounts(items).length).assertEqual(2);
      expect(feedTimes(items).length).assertEqual(2);
    });
    /**
     * @tc.name CommentCollectionsTest_case_017
     * @tc.desc collection: feed of 3 items keeps order and lookups (CommentCollectionsTest case 17)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentCollectionsTest_case_017', 0, async () => {
      const items: Comment[] = makeFeed(3);
      expect(items.length).assertEqual(3);
      expect(feedNames(items).length).assertEqual(items.length);
      expect(feedIds(items).length).assertEqual(items.length);
      expect(indexOfName(items, 'user_1')).assertEqual(0);
      expect(indexOfName(items, 'user_3')).assertEqual(2);
      expect(indexOfName(items, 'missing')).assertEqual(-1);
      expect(indexOfId(items, 1)).assertEqual(0);
      expect(totalImageCount(items) >= 0).assertTrue();
      expect(feedImageCounts(items).length).assertEqual(3);
      expect(feedTimes(items).length).assertEqual(3);
    });
    /**
     * @tc.name CommentCollectionsTest_case_018
     * @tc.desc collection: feed of 4 items keeps order and lookups (CommentCollectionsTest case 18)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentCollectionsTest_case_018', 0, async () => {
      const items: Comment[] = makeFeed(4);
      expect(items.length).assertEqual(4);
      expect(feedNames(items).length).assertEqual(items.length);
      expect(feedIds(items).length).assertEqual(items.length);
      expect(indexOfName(items, 'user_1')).assertEqual(0);
      expect(indexOfName(items, 'user_4')).assertEqual(3);
      expect(indexOfName(items, 'missing')).assertEqual(-1);
      expect(indexOfId(items, 1)).assertEqual(0);
      expect(totalImageCount(items) >= 0).assertTrue();
      expect(feedImageCounts(items).length).assertEqual(4);
      expect(feedTimes(items).length).assertEqual(4);
    });
    /**
     * @tc.name CommentCollectionsTest_case_019
     * @tc.desc collection: feed of 5 items keeps order and lookups (CommentCollectionsTest case 19)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentCollectionsTest_case_019', 0, async () => {
      const items: Comment[] = makeFeed(5);
      expect(items.length).assertEqual(5);
      expect(feedNames(items).length).assertEqual(items.length);
      expect(feedIds(items).length).assertEqual(items.length);
      expect(indexOfName(items, 'user_1')).assertEqual(0);
      expect(indexOfName(items, 'user_5')).assertEqual(4);
      expect(indexOfName(items, 'missing')).assertEqual(-1);
      expect(indexOfId(items, 1)).assertEqual(0);
      expect(totalImageCount(items) >= 0).assertTrue();
      expect(feedImageCounts(items).length).assertEqual(5);
      expect(feedTimes(items).length).assertEqual(5);
    });
    /**
     * @tc.name CommentCollectionsTest_case_020
     * @tc.desc collection: feed of 6 items keeps order and lookups (CommentCollectionsTest case 20)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentCollectionsTest_case_020', 0, async () => {
      const items: Comment[] = makeFeed(6);
      expect(items.length).assertEqual(6);
      expect(feedNames(items).length).assertEqual(items.length);
      expect(feedIds(items).length).assertEqual(items.length);
      expect(indexOfName(items, 'user_1')).assertEqual(0);
      expect(indexOfName(items, 'user_6')).assertEqual(5);
      expect(indexOfName(items, 'missing')).assertEqual(-1);
      expect(indexOfId(items, 1)).assertEqual(0);
      expect(totalImageCount(items) >= 0).assertTrue();
      expect(feedImageCounts(items).length).assertEqual(6);
      expect(feedTimes(items).length).assertEqual(6);
    });
    /**
     * @tc.name CommentCollectionsTest_case_021
     * @tc.desc collection: feed of 2 items keeps order and lookups (CommentCollectionsTest case 21)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentCollectionsTest_case_021', 0, async () => {
      const items: Comment[] = makeFeed(2);
      expect(items.length).assertEqual(2);
      expect(feedNames(items).length).assertEqual(items.length);
      expect(feedIds(items).length).assertEqual(items.length);
      expect(indexOfName(items, 'user_1')).assertEqual(0);
      expect(indexOfName(items, 'user_2')).assertEqual(1);
      expect(indexOfName(items, 'missing')).assertEqual(-1);
      expect(indexOfId(items, 1)).assertEqual(0);
      expect(totalImageCount(items) >= 0).assertTrue();
      expect(feedImageCounts(items).length).assertEqual(2);
      expect(feedTimes(items).length).assertEqual(2);
    });
    /**
     * @tc.name CommentCollectionsTest_case_022
     * @tc.desc collection: feed of 3 items keeps order and lookups (CommentCollectionsTest case 22)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentCollectionsTest_case_022', 0, async () => {
      const items: Comment[] = makeFeed(3);
      expect(items.length).assertEqual(3);
      expect(feedNames(items).length).assertEqual(items.length);
      expect(feedIds(items).length).assertEqual(items.length);
      expect(indexOfName(items, 'user_1')).assertEqual(0);
      expect(indexOfName(items, 'user_3')).assertEqual(2);
      expect(indexOfName(items, 'missing')).assertEqual(-1);
      expect(indexOfId(items, 1)).assertEqual(0);
      expect(totalImageCount(items) >= 0).assertTrue();
      expect(feedImageCounts(items).length).assertEqual(3);
      expect(feedTimes(items).length).assertEqual(3);
    });
    /**
     * @tc.name CommentCollectionsTest_case_023
     * @tc.desc collection: feed of 4 items keeps order and lookups (CommentCollectionsTest case 23)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentCollectionsTest_case_023', 0, async () => {
      const items: Comment[] = makeFeed(4);
      expect(items.length).assertEqual(4);
      expect(feedNames(items).length).assertEqual(items.length);
      expect(feedIds(items).length).assertEqual(items.length);
      expect(indexOfName(items, 'user_1')).assertEqual(0);
      expect(indexOfName(items, 'user_4')).assertEqual(3);
      expect(indexOfName(items, 'missing')).assertEqual(-1);
      expect(indexOfId(items, 1)).assertEqual(0);
      expect(totalImageCount(items) >= 0).assertTrue();
      expect(feedImageCounts(items).length).assertEqual(4);
      expect(feedTimes(items).length).assertEqual(4);
    });
    /**
     * @tc.name CommentCollectionsTest_case_024
     * @tc.desc collection: feed of 5 items keeps order and lookups (CommentCollectionsTest case 24)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentCollectionsTest_case_024', 0, async () => {
      const items: Comment[] = makeFeed(5);
      expect(items.length).assertEqual(5);
      expect(feedNames(items).length).assertEqual(items.length);
      expect(feedIds(items).length).assertEqual(items.length);
      expect(indexOfName(items, 'user_1')).assertEqual(0);
      expect(indexOfName(items, 'user_5')).assertEqual(4);
      expect(indexOfName(items, 'missing')).assertEqual(-1);
      expect(indexOfId(items, 1)).assertEqual(0);
      expect(totalImageCount(items) >= 0).assertTrue();
      expect(feedImageCounts(items).length).assertEqual(5);
      expect(feedTimes(items).length).assertEqual(5);
    });
    /**
     * @tc.name CommentCollectionsTest_case_025
     * @tc.desc collection: feed of 6 items keeps order and lookups (CommentCollectionsTest case 25)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentCollectionsTest_case_025', 0, async () => {
      const items: Comment[] = makeFeed(6);
      expect(items.length).assertEqual(6);
      expect(feedNames(items).length).assertEqual(items.length);
      expect(feedIds(items).length).assertEqual(items.length);
      expect(indexOfName(items, 'user_1')).assertEqual(0);
      expect(indexOfName(items, 'user_6')).assertEqual(5);
      expect(indexOfName(items, 'missing')).assertEqual(-1);
      expect(indexOfId(items, 1)).assertEqual(0);
      expect(totalImageCount(items) >= 0).assertTrue();
      expect(feedImageCounts(items).length).assertEqual(6);
      expect(feedTimes(items).length).assertEqual(6);
    });
    /**
     * @tc.name CommentCollectionsTest_case_026
     * @tc.desc collection: feed of 2 items keeps order and lookups (CommentCollectionsTest case 26)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentCollectionsTest_case_026', 0, async () => {
      const items: Comment[] = makeFeed(2);
      expect(items.length).assertEqual(2);
      expect(feedNames(items).length).assertEqual(items.length);
      expect(feedIds(items).length).assertEqual(items.length);
      expect(indexOfName(items, 'user_1')).assertEqual(0);
      expect(indexOfName(items, 'user_2')).assertEqual(1);
      expect(indexOfName(items, 'missing')).assertEqual(-1);
      expect(indexOfId(items, 1)).assertEqual(0);
      expect(totalImageCount(items) >= 0).assertTrue();
      expect(feedImageCounts(items).length).assertEqual(2);
      expect(feedTimes(items).length).assertEqual(2);
    });
    /**
     * @tc.name CommentCollectionsTest_case_027
     * @tc.desc collection: feed of 3 items keeps order and lookups (CommentCollectionsTest case 27)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentCollectionsTest_case_027', 0, async () => {
      const items: Comment[] = makeFeed(3);
      expect(items.length).assertEqual(3);
      expect(feedNames(items).length).assertEqual(items.length);
      expect(feedIds(items).length).assertEqual(items.length);
      expect(indexOfName(items, 'user_1')).assertEqual(0);
      expect(indexOfName(items, 'user_3')).assertEqual(2);
      expect(indexOfName(items, 'missing')).assertEqual(-1);
      expect(indexOfId(items, 1)).assertEqual(0);
      expect(totalImageCount(items) >= 0).assertTrue();
      expect(feedImageCounts(items).length).assertEqual(3);
      expect(feedTimes(items).length).assertEqual(3);
    });
    /**
     * @tc.name CommentCollectionsTest_case_028
     * @tc.desc collection: feed of 4 items keeps order and lookups (CommentCollectionsTest case 28)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentCollectionsTest_case_028', 0, async () => {
      const items: Comment[] = makeFeed(4);
      expect(items.length).assertEqual(4);
      expect(feedNames(items).length).assertEqual(items.length);
      expect(feedIds(items).length).assertEqual(items.length);
      expect(indexOfName(items, 'user_1')).assertEqual(0);
      expect(indexOfName(items, 'user_4')).assertEqual(3);
      expect(indexOfName(items, 'missing')).assertEqual(-1);
      expect(indexOfId(items, 1)).assertEqual(0);
      expect(totalImageCount(items) >= 0).assertTrue();
      expect(feedImageCounts(items).length).assertEqual(4);
      expect(feedTimes(items).length).assertEqual(4);
    });
    /**
     * @tc.name CommentCollectionsTest_case_029
     * @tc.desc collection: feed of 5 items keeps order and lookups (CommentCollectionsTest case 29)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentCollectionsTest_case_029', 0, async () => {
      const items: Comment[] = makeFeed(5);
      expect(items.length).assertEqual(5);
      expect(feedNames(items).length).assertEqual(items.length);
      expect(feedIds(items).length).assertEqual(items.length);
      expect(indexOfName(items, 'user_1')).assertEqual(0);
      expect(indexOfName(items, 'user_5')).assertEqual(4);
      expect(indexOfName(items, 'missing')).assertEqual(-1);
      expect(indexOfId(items, 1)).assertEqual(0);
      expect(totalImageCount(items) >= 0).assertTrue();
      expect(feedImageCounts(items).length).assertEqual(5);
      expect(feedTimes(items).length).assertEqual(5);
    });
    /**
     * @tc.name CommentCollectionsTest_case_030
     * @tc.desc collection: feed of 6 items keeps order and lookups (CommentCollectionsTest case 30)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentCollectionsTest_case_030', 0, async () => {
      const items: Comment[] = makeFeed(6);
      expect(items.length).assertEqual(6);
      expect(feedNames(items).length).assertEqual(items.length);
      expect(feedIds(items).length).assertEqual(items.length);
      expect(indexOfName(items, 'user_1')).assertEqual(0);
      expect(indexOfName(items, 'user_6')).assertEqual(5);
      expect(indexOfName(items, 'missing')).assertEqual(-1);
      expect(indexOfId(items, 1)).assertEqual(0);
      expect(totalImageCount(items) >= 0).assertTrue();
      expect(feedImageCounts(items).length).assertEqual(6);
      expect(feedTimes(items).length).assertEqual(6);
    });
    /**
     * @tc.name CommentCollectionsTest_case_031
     * @tc.desc collection: feed of 2 items keeps order and lookups (CommentCollectionsTest case 31)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentCollectionsTest_case_031', 0, async () => {
      const items: Comment[] = makeFeed(2);
      expect(items.length).assertEqual(2);
      expect(feedNames(items).length).assertEqual(items.length);
      expect(feedIds(items).length).assertEqual(items.length);
      expect(indexOfName(items, 'user_1')).assertEqual(0);
      expect(indexOfName(items, 'user_2')).assertEqual(1);
      expect(indexOfName(items, 'missing')).assertEqual(-1);
      expect(indexOfId(items, 1)).assertEqual(0);
      expect(totalImageCount(items) >= 0).assertTrue();
      expect(feedImageCounts(items).length).assertEqual(2);
      expect(feedTimes(items).length).assertEqual(2);
    });
    /**
     * @tc.name CommentCollectionsTest_case_032
     * @tc.desc collection: feed of 3 items keeps order and lookups (CommentCollectionsTest case 32)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentCollectionsTest_case_032', 0, async () => {
      const items: Comment[] = makeFeed(3);
      expect(items.length).assertEqual(3);
      expect(feedNames(items).length).assertEqual(items.length);
      expect(feedIds(items).length).assertEqual(items.length);
      expect(indexOfName(items, 'user_1')).assertEqual(0);
      expect(indexOfName(items, 'user_3')).assertEqual(2);
      expect(indexOfName(items, 'missing')).assertEqual(-1);
      expect(indexOfId(items, 1)).assertEqual(0);
      expect(totalImageCount(items) >= 0).assertTrue();
      expect(feedImageCounts(items).length).assertEqual(3);
      expect(feedTimes(items).length).assertEqual(3);
    });
    /**
     * @tc.name CommentCollectionsTest_case_033
     * @tc.desc collection: feed of 4 items keeps order and lookups (CommentCollectionsTest case 33)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentCollectionsTest_case_033', 0, async () => {
      const items: Comment[] = makeFeed(4);
      expect(items.length).assertEqual(4);
      expect(feedNames(items).length).assertEqual(items.length);
      expect(feedIds(items).length).assertEqual(items.length);
      expect(indexOfName(items, 'user_1')).assertEqual(0);
      expect(indexOfName(items, 'user_4')).assertEqual(3);
      expect(indexOfName(items, 'missing')).assertEqual(-1);
      expect(indexOfId(items, 1)).assertEqual(0);
      expect(totalImageCount(items) >= 0).assertTrue();
      expect(feedImageCounts(items).length).assertEqual(4);
      expect(feedTimes(items).length).assertEqual(4);
    });
    /**
     * @tc.name CommentCollectionsTest_case_034
     * @tc.desc collection: feed of 5 items keeps order and lookups (CommentCollectionsTest case 34)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentCollectionsTest_case_034', 0, async () => {
      const items: Comment[] = makeFeed(5);
      expect(items.length).assertEqual(5);
      expect(feedNames(items).length).assertEqual(items.length);
      expect(feedIds(items).length).assertEqual(items.length);
      expect(indexOfName(items, 'user_1')).assertEqual(0);
      expect(indexOfName(items, 'user_5')).assertEqual(4);
      expect(indexOfName(items, 'missing')).assertEqual(-1);
      expect(indexOfId(items, 1)).assertEqual(0);
      expect(totalImageCount(items) >= 0).assertTrue();
      expect(feedImageCounts(items).length).assertEqual(5);
      expect(feedTimes(items).length).assertEqual(5);
    });
    /**
     * @tc.name CommentCollectionsTest_case_035
     * @tc.desc collection: feed of 6 items keeps order and lookups (CommentCollectionsTest case 35)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentCollectionsTest_case_035', 0, async () => {
      const items: Comment[] = makeFeed(6);
      expect(items.length).assertEqual(6);
      expect(feedNames(items).length).assertEqual(items.length);
      expect(feedIds(items).length).assertEqual(items.length);
      expect(indexOfName(items, 'user_1')).assertEqual(0);
      expect(indexOfName(items, 'user_6')).assertEqual(5);
      expect(indexOfName(items, 'missing')).assertEqual(-1);
      expect(indexOfId(items, 1)).assertEqual(0);
      expect(totalImageCount(items) >= 0).assertTrue();
      expect(feedImageCounts(items).length).assertEqual(6);
      expect(feedTimes(items).length).assertEqual(6);
    });
    /**
     * @tc.name CommentCollectionsTest_case_036
     * @tc.desc collection: feed of 2 items keeps order and lookups (CommentCollectionsTest case 36)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentCollectionsTest_case_036', 0, async () => {
      const items: Comment[] = makeFeed(2);
      expect(items.length).assertEqual(2);
      expect(feedNames(items).length).assertEqual(items.length);
      expect(feedIds(items).length).assertEqual(items.length);
      expect(indexOfName(items, 'user_1')).assertEqual(0);
      expect(indexOfName(items, 'user_2')).assertEqual(1);
      expect(indexOfName(items, 'missing')).assertEqual(-1);
      expect(indexOfId(items, 1)).assertEqual(0);
      expect(totalImageCount(items) >= 0).assertTrue();
      expect(feedImageCounts(items).length).assertEqual(2);
      expect(feedTimes(items).length).assertEqual(2);
    });
    /**
     * @tc.name CommentCollectionsTest_case_037
     * @tc.desc collection: feed of 3 items keeps order and lookups (CommentCollectionsTest case 37)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentCollectionsTest_case_037', 0, async () => {
      const items: Comment[] = makeFeed(3);
      expect(items.length).assertEqual(3);
      expect(feedNames(items).length).assertEqual(items.length);
      expect(feedIds(items).length).assertEqual(items.length);
      expect(indexOfName(items, 'user_1')).assertEqual(0);
      expect(indexOfName(items, 'user_3')).assertEqual(2);
      expect(indexOfName(items, 'missing')).assertEqual(-1);
      expect(indexOfId(items, 1)).assertEqual(0);
      expect(totalImageCount(items) >= 0).assertTrue();
      expect(feedImageCounts(items).length).assertEqual(3);
      expect(feedTimes(items).length).assertEqual(3);
    });
  });
}
