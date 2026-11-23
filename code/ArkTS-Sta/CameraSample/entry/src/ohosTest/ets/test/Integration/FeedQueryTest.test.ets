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
import { Constants } from '../../../../main/ets/pages/constants/Constants';
import {
  CameraRequest, CameraParameters, CaptureOutcome, CaptureState, TextInputState,
  CommentJournal, DraftCodec, IdSequence, buildCameraRequest, captureSucceeded,
  extractResourceUri, formatCommentTime, formatCommentTimeAt, publishEligible,
  draftEligible, createPublishedComment, appendImmutable, imageGridKey, imageGridKeys,
  normalizeResourceUri, isResourceUri, isMediaUri, buildFeed, sumIds, joinNames
} from '../Shared/CommentLogic';
import { logSuite, yieldTick, Lcg, CallRecorder, expectNoDuplicates } from '../Shared/Support';

export default function FeedQueryTest(): void {
  describe('FeedQueryTest', () => {
    beforeAll(() => {
      logSuite('FeedQueryTest', 'begin');
    });
    beforeEach(async () => {
      await yieldTick();
    });
    afterAll(() => {
      logSuite('FeedQueryTest', 'end');
    });

    /**
     * @tc.name FeedQueryTest_case_001
     * @tc.desc collection: feed of 2 items keeps order and lookups (FeedQueryTest case 1)
     * @tc.type Function
     * @tc.level Level1
     */
    it('FeedQueryTest_case_001', 0, async () => {
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
     * @tc.name FeedQueryTest_case_002
     * @tc.desc collection: feed of 3 items keeps order and lookups (FeedQueryTest case 2)
     * @tc.type Function
     * @tc.level Level1
     */
    it('FeedQueryTest_case_002', 0, async () => {
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
     * @tc.name FeedQueryTest_case_003
     * @tc.desc collection: feed of 4 items keeps order and lookups (FeedQueryTest case 3)
     * @tc.type Function
     * @tc.level Level1
     */
    it('FeedQueryTest_case_003', 0, async () => {
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
     * @tc.name FeedQueryTest_case_004
     * @tc.desc collection: feed of 5 items keeps order and lookups (FeedQueryTest case 4)
     * @tc.type Function
     * @tc.level Level1
     */
    it('FeedQueryTest_case_004', 0, async () => {
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
     * @tc.name FeedQueryTest_case_005
     * @tc.desc collection: feed of 6 items keeps order and lookups (FeedQueryTest case 5)
     * @tc.type Function
     * @tc.level Level1
     */
    it('FeedQueryTest_case_005', 0, async () => {
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
     * @tc.name FeedQueryTest_case_006
     * @tc.desc collection: feed of 2 items keeps order and lookups (FeedQueryTest case 6)
     * @tc.type Function
     * @tc.level Level1
     */
    it('FeedQueryTest_case_006', 0, async () => {
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
     * @tc.name FeedQueryTest_case_007
     * @tc.desc collection: feed of 3 items keeps order and lookups (FeedQueryTest case 7)
     * @tc.type Function
     * @tc.level Level1
     */
    it('FeedQueryTest_case_007', 0, async () => {
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
     * @tc.name FeedQueryTest_case_008
     * @tc.desc collection: feed of 4 items keeps order and lookups (FeedQueryTest case 8)
     * @tc.type Function
     * @tc.level Level1
     */
    it('FeedQueryTest_case_008', 0, async () => {
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
     * @tc.name FeedQueryTest_case_009
     * @tc.desc collection: feed of 5 items keeps order and lookups (FeedQueryTest case 9)
     * @tc.type Function
     * @tc.level Level1
     */
    it('FeedQueryTest_case_009', 0, async () => {
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
     * @tc.name FeedQueryTest_case_010
     * @tc.desc collection: feed of 6 items keeps order and lookups (FeedQueryTest case 10)
     * @tc.type Function
     * @tc.level Level1
     */
    it('FeedQueryTest_case_010', 0, async () => {
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
     * @tc.name FeedQueryTest_case_011
     * @tc.desc collection: feed of 2 items keeps order and lookups (FeedQueryTest case 11)
     * @tc.type Function
     * @tc.level Level1
     */
    it('FeedQueryTest_case_011', 0, async () => {
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
     * @tc.name FeedQueryTest_case_012
     * @tc.desc collection: feed of 3 items keeps order and lookups (FeedQueryTest case 12)
     * @tc.type Function
     * @tc.level Level1
     */
    it('FeedQueryTest_case_012', 0, async () => {
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
     * @tc.name FeedQueryTest_case_013
     * @tc.desc collection: feed of 4 items keeps order and lookups (FeedQueryTest case 13)
     * @tc.type Function
     * @tc.level Level1
     */
    it('FeedQueryTest_case_013', 0, async () => {
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
     * @tc.name FeedQueryTest_case_014
     * @tc.desc collection: feed of 5 items keeps order and lookups (FeedQueryTest case 14)
     * @tc.type Function
     * @tc.level Level1
     */
    it('FeedQueryTest_case_014', 0, async () => {
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
     * @tc.name FeedQueryTest_case_015
     * @tc.desc collection: feed of 6 items keeps order and lookups (FeedQueryTest case 15)
     * @tc.type Function
     * @tc.level Level1
     */
    it('FeedQueryTest_case_015', 0, async () => {
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
     * @tc.name FeedQueryTest_case_016
     * @tc.desc collection: feed of 2 items keeps order and lookups (FeedQueryTest case 16)
     * @tc.type Function
     * @tc.level Level1
     */
    it('FeedQueryTest_case_016', 0, async () => {
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
     * @tc.name FeedQueryTest_case_017
     * @tc.desc collection: feed of 3 items keeps order and lookups (FeedQueryTest case 17)
     * @tc.type Function
     * @tc.level Level1
     */
    it('FeedQueryTest_case_017', 0, async () => {
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
     * @tc.name FeedQueryTest_case_018
     * @tc.desc collection: feed of 4 items keeps order and lookups (FeedQueryTest case 18)
     * @tc.type Function
     * @tc.level Level1
     */
    it('FeedQueryTest_case_018', 0, async () => {
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
     * @tc.name FeedQueryTest_case_019
     * @tc.desc collection: feed of 5 items keeps order and lookups (FeedQueryTest case 19)
     * @tc.type Function
     * @tc.level Level1
     */
    it('FeedQueryTest_case_019', 0, async () => {
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
     * @tc.name FeedQueryTest_case_020
     * @tc.desc collection: feed of 6 items keeps order and lookups (FeedQueryTest case 20)
     * @tc.type Function
     * @tc.level Level1
     */
    it('FeedQueryTest_case_020', 0, async () => {
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
     * @tc.name FeedQueryTest_case_021
     * @tc.desc collection: feed of 2 items keeps order and lookups (FeedQueryTest case 21)
     * @tc.type Function
     * @tc.level Level1
     */
    it('FeedQueryTest_case_021', 0, async () => {
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
     * @tc.name FeedQueryTest_case_022
     * @tc.desc collection: feed of 3 items keeps order and lookups (FeedQueryTest case 22)
     * @tc.type Function
     * @tc.level Level1
     */
    it('FeedQueryTest_case_022', 0, async () => {
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
     * @tc.name FeedQueryTest_case_023
     * @tc.desc collection: feed of 4 items keeps order and lookups (FeedQueryTest case 23)
     * @tc.type Function
     * @tc.level Level1
     */
    it('FeedQueryTest_case_023', 0, async () => {
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
     * @tc.name FeedQueryTest_case_024
     * @tc.desc collection: feed of 5 items keeps order and lookups (FeedQueryTest case 24)
     * @tc.type Function
     * @tc.level Level1
     */
    it('FeedQueryTest_case_024', 0, async () => {
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
     * @tc.name FeedQueryTest_case_025
     * @tc.desc collection: feed of 6 items keeps order and lookups (FeedQueryTest case 25)
     * @tc.type Function
     * @tc.level Level1
     */
    it('FeedQueryTest_case_025', 0, async () => {
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
     * @tc.name FeedQueryTest_case_026
     * @tc.desc collection: feed of 2 items keeps order and lookups (FeedQueryTest case 26)
     * @tc.type Function
     * @tc.level Level1
     */
    it('FeedQueryTest_case_026', 0, async () => {
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
     * @tc.name FeedQueryTest_case_027
     * @tc.desc collection: feed of 3 items keeps order and lookups (FeedQueryTest case 27)
     * @tc.type Function
     * @tc.level Level1
     */
    it('FeedQueryTest_case_027', 0, async () => {
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
     * @tc.name FeedQueryTest_case_028
     * @tc.desc collection: feed of 4 items keeps order and lookups (FeedQueryTest case 28)
     * @tc.type Function
     * @tc.level Level1
     */
    it('FeedQueryTest_case_028', 0, async () => {
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
     * @tc.name FeedQueryTest_case_029
     * @tc.desc collection: feed of 5 items keeps order and lookups (FeedQueryTest case 29)
     * @tc.type Function
     * @tc.level Level1
     */
    it('FeedQueryTest_case_029', 0, async () => {
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
     * @tc.name FeedQueryTest_case_030
     * @tc.desc collection: feed of 6 items keeps order and lookups (FeedQueryTest case 30)
     * @tc.type Function
     * @tc.level Level1
     */
    it('FeedQueryTest_case_030', 0, async () => {
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
     * @tc.name FeedQueryTest_case_031
     * @tc.desc collection: feed of 2 items keeps order and lookups (FeedQueryTest case 31)
     * @tc.type Function
     * @tc.level Level1
     */
    it('FeedQueryTest_case_031', 0, async () => {
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
     * @tc.name FeedQueryTest_case_032
     * @tc.desc collection: feed of 3 items keeps order and lookups (FeedQueryTest case 32)
     * @tc.type Function
     * @tc.level Level1
     */
    it('FeedQueryTest_case_032', 0, async () => {
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
     * @tc.name FeedQueryTest_case_033
     * @tc.desc collection: feed of 4 items keeps order and lookups (FeedQueryTest case 33)
     * @tc.type Function
     * @tc.level Level1
     */
    it('FeedQueryTest_case_033', 0, async () => {
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
     * @tc.name FeedQueryTest_case_034
     * @tc.desc collection: feed of 5 items keeps order and lookups (FeedQueryTest case 34)
     * @tc.type Function
     * @tc.level Level1
     */
    it('FeedQueryTest_case_034', 0, async () => {
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
     * @tc.name FeedQueryTest_case_035
     * @tc.desc collection: feed of 6 items keeps order and lookups (FeedQueryTest case 35)
     * @tc.type Function
     * @tc.level Level1
     */
    it('FeedQueryTest_case_035', 0, async () => {
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
     * @tc.name FeedQueryTest_case_036
     * @tc.desc collection: feed of 2 items keeps order and lookups (FeedQueryTest case 36)
     * @tc.type Function
     * @tc.level Level1
     */
    it('FeedQueryTest_case_036', 0, async () => {
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
     * @tc.name FeedQueryTest_case_037
     * @tc.desc collection: feed of 3 items keeps order and lookups (FeedQueryTest case 37)
     * @tc.type Function
     * @tc.level Level1
     */
    it('FeedQueryTest_case_037', 0, async () => {
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
     * @tc.name FeedQueryTest_case_038
     * @tc.desc collection: feed of 4 items keeps order and lookups (FeedQueryTest case 38)
     * @tc.type Function
     * @tc.level Level1
     */
    it('FeedQueryTest_case_038', 0, async () => {
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
     * @tc.name FeedQueryTest_case_039
     * @tc.desc collection: feed of 5 items keeps order and lookups (FeedQueryTest case 39)
     * @tc.type Function
     * @tc.level Level1
     */
    it('FeedQueryTest_case_039', 0, async () => {
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
     * @tc.name FeedQueryTest_case_040
     * @tc.desc collection: feed of 6 items keeps order and lookups (FeedQueryTest case 40)
     * @tc.type Function
     * @tc.level Level1
     */
    it('FeedQueryTest_case_040', 0, async () => {
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
     * @tc.name FeedQueryTest_case_041
     * @tc.desc collection: feed of 2 items keeps order and lookups (FeedQueryTest case 41)
     * @tc.type Function
     * @tc.level Level1
     */
    it('FeedQueryTest_case_041', 0, async () => {
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
     * @tc.name FeedQueryTest_case_042
     * @tc.desc collection: feed of 3 items keeps order and lookups (FeedQueryTest case 42)
     * @tc.type Function
     * @tc.level Level1
     */
    it('FeedQueryTest_case_042', 0, async () => {
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
     * @tc.name FeedQueryTest_case_043
     * @tc.desc collection: feed of 4 items keeps order and lookups (FeedQueryTest case 43)
     * @tc.type Function
     * @tc.level Level1
     */
    it('FeedQueryTest_case_043', 0, async () => {
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
     * @tc.name FeedQueryTest_case_044
     * @tc.desc collection: feed of 5 items keeps order and lookups (FeedQueryTest case 44)
     * @tc.type Function
     * @tc.level Level1
     */
    it('FeedQueryTest_case_044', 0, async () => {
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
     * @tc.name FeedQueryTest_case_045
     * @tc.desc collection: feed of 6 items keeps order and lookups (FeedQueryTest case 45)
     * @tc.type Function
     * @tc.level Level1
     */
    it('FeedQueryTest_case_045', 0, async () => {
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
  });
}
