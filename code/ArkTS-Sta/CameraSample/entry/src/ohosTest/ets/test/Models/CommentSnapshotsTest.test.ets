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

export default function CommentSnapshotsTest(): void {
  describe('CommentSnapshotsTest', () => {
    beforeAll(() => {
      logSuite('CommentSnapshotsTest', 'begin');
    });
    beforeEach(async () => {
      await yieldTick();
    });
    afterAll(() => {
      logSuite('CommentSnapshotsTest', 'end');
    });

    /**
     * @tc.name CommentSnapshotsTest_case_001
     * @tc.desc snapshot: projection is an immutable copy, variant 1 (CommentSnapshotsTest case 1)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentSnapshotsTest_case_001', 0, async () => {
      const c: Comment = makeComment(2, 'user_2', 'comment body 2', 'app.media.icon_comment_app_logo1', '02-07 13:25', []);
      const snap: CommentSnapshot = snapshotComment(c);
      expect(snap.id).assertEqual(c.id);
      expect(snap.name).assertEqual(c.name);
      expect(snap.content).assertEqual(commentText(c));
      c.name = 'mutated';
      c.images.push(imageUriFor(50));
      expect(snap.name).assertEqual('user_2');
      expect(snap.images.length).assertEqual(0);
      const snap2: CommentSnapshot = snapshotComment(c);
      expect(sameSnapshot(snap, snap2)).assertFalse();
      expect(snap.content.length > 0).assertTrue();
    });
    /**
     * @tc.name CommentSnapshotsTest_case_002
     * @tc.desc snapshot: projection is an immutable copy, variant 2 (CommentSnapshotsTest case 2)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentSnapshotsTest_case_002', 0, async () => {
      const c: Comment = makeComment(3, 'user_3', 'comment body 3', 'app.media.icon_comment_app_logo1', '02-07 13:25', []);
      const snap: CommentSnapshot = snapshotComment(c);
      expect(snap.id).assertEqual(c.id);
      expect(snap.name).assertEqual(c.name);
      expect(snap.content).assertEqual(commentText(c));
      c.name = 'mutated';
      c.images.push(imageUriFor(50));
      expect(snap.name).assertEqual('user_3');
      expect(snap.images.length).assertEqual(0);
      const snap2: CommentSnapshot = snapshotComment(c);
      expect(sameSnapshot(snap, snap2)).assertFalse();
      expect(snap.content.length > 0).assertTrue();
    });
    /**
     * @tc.name CommentSnapshotsTest_case_003
     * @tc.desc snapshot: projection is an immutable copy, variant 3 (CommentSnapshotsTest case 3)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentSnapshotsTest_case_003', 0, async () => {
      const c: Comment = makeComment(4, 'user_4', 'comment body 4', 'app.media.icon_comment_app_logo1', '02-07 13:25', []);
      const snap: CommentSnapshot = snapshotComment(c);
      expect(snap.id).assertEqual(c.id);
      expect(snap.name).assertEqual(c.name);
      expect(snap.content).assertEqual(commentText(c));
      c.name = 'mutated';
      c.images.push(imageUriFor(50));
      expect(snap.name).assertEqual('user_4');
      expect(snap.images.length).assertEqual(0);
      const snap2: CommentSnapshot = snapshotComment(c);
      expect(sameSnapshot(snap, snap2)).assertFalse();
      expect(snap.content.length > 0).assertTrue();
    });
    /**
     * @tc.name CommentSnapshotsTest_case_004
     * @tc.desc snapshot: projection is an immutable copy, variant 1 (CommentSnapshotsTest case 4)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentSnapshotsTest_case_004', 0, async () => {
      const c: Comment = makeComment(5, 'user_5', 'comment body 5', 'app.media.icon_comment_app_logo1', '02-07 13:25', []);
      const snap: CommentSnapshot = snapshotComment(c);
      expect(snap.id).assertEqual(c.id);
      expect(snap.name).assertEqual(c.name);
      expect(snap.content).assertEqual(commentText(c));
      c.name = 'mutated';
      c.images.push(imageUriFor(50));
      expect(snap.name).assertEqual('user_5');
      expect(snap.images.length).assertEqual(0);
      const snap2: CommentSnapshot = snapshotComment(c);
      expect(sameSnapshot(snap, snap2)).assertFalse();
      expect(snap.content.length > 0).assertTrue();
    });
    /**
     * @tc.name CommentSnapshotsTest_case_005
     * @tc.desc snapshot: projection is an immutable copy, variant 2 (CommentSnapshotsTest case 5)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentSnapshotsTest_case_005', 0, async () => {
      const c: Comment = makeComment(6, 'user_6', 'comment body 6', 'app.media.icon_comment_app_logo1', '02-07 13:25', []);
      const snap: CommentSnapshot = snapshotComment(c);
      expect(snap.id).assertEqual(c.id);
      expect(snap.name).assertEqual(c.name);
      expect(snap.content).assertEqual(commentText(c));
      c.name = 'mutated';
      c.images.push(imageUriFor(50));
      expect(snap.name).assertEqual('user_6');
      expect(snap.images.length).assertEqual(0);
      const snap2: CommentSnapshot = snapshotComment(c);
      expect(sameSnapshot(snap, snap2)).assertFalse();
      expect(snap.content.length > 0).assertTrue();
    });
    /**
     * @tc.name CommentSnapshotsTest_case_006
     * @tc.desc snapshot: projection is an immutable copy, variant 3 (CommentSnapshotsTest case 6)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentSnapshotsTest_case_006', 0, async () => {
      const c: Comment = makeComment(7, 'user_7', 'comment body 7', 'app.media.icon_comment_app_logo1', '02-07 13:25', []);
      const snap: CommentSnapshot = snapshotComment(c);
      expect(snap.id).assertEqual(c.id);
      expect(snap.name).assertEqual(c.name);
      expect(snap.content).assertEqual(commentText(c));
      c.name = 'mutated';
      c.images.push(imageUriFor(50));
      expect(snap.name).assertEqual('user_7');
      expect(snap.images.length).assertEqual(0);
      const snap2: CommentSnapshot = snapshotComment(c);
      expect(sameSnapshot(snap, snap2)).assertFalse();
      expect(snap.content.length > 0).assertTrue();
    });
    /**
     * @tc.name CommentSnapshotsTest_case_007
     * @tc.desc snapshot: projection is an immutable copy, variant 1 (CommentSnapshotsTest case 7)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentSnapshotsTest_case_007', 0, async () => {
      const c: Comment = makeComment(8, 'user_8', 'comment body 8', 'app.media.icon_comment_app_logo1', '02-07 13:25', []);
      const snap: CommentSnapshot = snapshotComment(c);
      expect(snap.id).assertEqual(c.id);
      expect(snap.name).assertEqual(c.name);
      expect(snap.content).assertEqual(commentText(c));
      c.name = 'mutated';
      c.images.push(imageUriFor(50));
      expect(snap.name).assertEqual('user_8');
      expect(snap.images.length).assertEqual(0);
      const snap2: CommentSnapshot = snapshotComment(c);
      expect(sameSnapshot(snap, snap2)).assertFalse();
      expect(snap.content.length > 0).assertTrue();
    });
    /**
     * @tc.name CommentSnapshotsTest_case_008
     * @tc.desc snapshot: projection is an immutable copy, variant 2 (CommentSnapshotsTest case 8)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentSnapshotsTest_case_008', 0, async () => {
      const c: Comment = makeComment(9, 'user_9', 'comment body 9', 'app.media.icon_comment_app_logo1', '02-07 13:25', []);
      const snap: CommentSnapshot = snapshotComment(c);
      expect(snap.id).assertEqual(c.id);
      expect(snap.name).assertEqual(c.name);
      expect(snap.content).assertEqual(commentText(c));
      c.name = 'mutated';
      c.images.push(imageUriFor(50));
      expect(snap.name).assertEqual('user_9');
      expect(snap.images.length).assertEqual(0);
      const snap2: CommentSnapshot = snapshotComment(c);
      expect(sameSnapshot(snap, snap2)).assertFalse();
      expect(snap.content.length > 0).assertTrue();
    });
    /**
     * @tc.name CommentSnapshotsTest_case_009
     * @tc.desc snapshot: projection is an immutable copy, variant 3 (CommentSnapshotsTest case 9)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentSnapshotsTest_case_009', 0, async () => {
      const c: Comment = makeComment(10, 'user_10', 'comment body 10', 'app.media.icon_comment_app_logo1', '02-07 13:25', []);
      const snap: CommentSnapshot = snapshotComment(c);
      expect(snap.id).assertEqual(c.id);
      expect(snap.name).assertEqual(c.name);
      expect(snap.content).assertEqual(commentText(c));
      c.name = 'mutated';
      c.images.push(imageUriFor(50));
      expect(snap.name).assertEqual('user_10');
      expect(snap.images.length).assertEqual(0);
      const snap2: CommentSnapshot = snapshotComment(c);
      expect(sameSnapshot(snap, snap2)).assertFalse();
      expect(snap.content.length > 0).assertTrue();
    });
    /**
     * @tc.name CommentSnapshotsTest_case_010
     * @tc.desc snapshot: projection is an immutable copy, variant 1 (CommentSnapshotsTest case 10)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentSnapshotsTest_case_010', 0, async () => {
      const c: Comment = makeComment(11, 'user_11', 'comment body 11', 'app.media.icon_comment_app_logo1', '02-07 13:25', []);
      const snap: CommentSnapshot = snapshotComment(c);
      expect(snap.id).assertEqual(c.id);
      expect(snap.name).assertEqual(c.name);
      expect(snap.content).assertEqual(commentText(c));
      c.name = 'mutated';
      c.images.push(imageUriFor(50));
      expect(snap.name).assertEqual('user_11');
      expect(snap.images.length).assertEqual(0);
      const snap2: CommentSnapshot = snapshotComment(c);
      expect(sameSnapshot(snap, snap2)).assertFalse();
      expect(snap.content.length > 0).assertTrue();
    });
    /**
     * @tc.name CommentSnapshotsTest_case_011
     * @tc.desc snapshot: projection is an immutable copy, variant 2 (CommentSnapshotsTest case 11)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentSnapshotsTest_case_011', 0, async () => {
      const c: Comment = makeComment(12, 'user_12', 'comment body 12', 'app.media.icon_comment_app_logo1', '02-07 13:25', []);
      const snap: CommentSnapshot = snapshotComment(c);
      expect(snap.id).assertEqual(c.id);
      expect(snap.name).assertEqual(c.name);
      expect(snap.content).assertEqual(commentText(c));
      c.name = 'mutated';
      c.images.push(imageUriFor(50));
      expect(snap.name).assertEqual('user_12');
      expect(snap.images.length).assertEqual(0);
      const snap2: CommentSnapshot = snapshotComment(c);
      expect(sameSnapshot(snap, snap2)).assertFalse();
      expect(snap.content.length > 0).assertTrue();
    });
    /**
     * @tc.name CommentSnapshotsTest_case_012
     * @tc.desc snapshot: projection is an immutable copy, variant 3 (CommentSnapshotsTest case 12)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentSnapshotsTest_case_012', 0, async () => {
      const c: Comment = makeComment(13, 'user_13', 'comment body 13', 'app.media.icon_comment_app_logo1', '02-07 13:25', []);
      const snap: CommentSnapshot = snapshotComment(c);
      expect(snap.id).assertEqual(c.id);
      expect(snap.name).assertEqual(c.name);
      expect(snap.content).assertEqual(commentText(c));
      c.name = 'mutated';
      c.images.push(imageUriFor(50));
      expect(snap.name).assertEqual('user_13');
      expect(snap.images.length).assertEqual(0);
      const snap2: CommentSnapshot = snapshotComment(c);
      expect(sameSnapshot(snap, snap2)).assertFalse();
      expect(snap.content.length > 0).assertTrue();
    });
    /**
     * @tc.name CommentSnapshotsTest_case_013
     * @tc.desc snapshot: projection is an immutable copy, variant 1 (CommentSnapshotsTest case 13)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentSnapshotsTest_case_013', 0, async () => {
      const c: Comment = makeComment(14, 'user_14', 'comment body 14', 'app.media.icon_comment_app_logo1', '02-07 13:25', []);
      const snap: CommentSnapshot = snapshotComment(c);
      expect(snap.id).assertEqual(c.id);
      expect(snap.name).assertEqual(c.name);
      expect(snap.content).assertEqual(commentText(c));
      c.name = 'mutated';
      c.images.push(imageUriFor(50));
      expect(snap.name).assertEqual('user_14');
      expect(snap.images.length).assertEqual(0);
      const snap2: CommentSnapshot = snapshotComment(c);
      expect(sameSnapshot(snap, snap2)).assertFalse();
      expect(snap.content.length > 0).assertTrue();
    });
    /**
     * @tc.name CommentSnapshotsTest_case_014
     * @tc.desc snapshot: projection is an immutable copy, variant 2 (CommentSnapshotsTest case 14)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentSnapshotsTest_case_014', 0, async () => {
      const c: Comment = makeComment(15, 'user_15', 'comment body 15', 'app.media.icon_comment_app_logo1', '02-07 13:25', []);
      const snap: CommentSnapshot = snapshotComment(c);
      expect(snap.id).assertEqual(c.id);
      expect(snap.name).assertEqual(c.name);
      expect(snap.content).assertEqual(commentText(c));
      c.name = 'mutated';
      c.images.push(imageUriFor(50));
      expect(snap.name).assertEqual('user_15');
      expect(snap.images.length).assertEqual(0);
      const snap2: CommentSnapshot = snapshotComment(c);
      expect(sameSnapshot(snap, snap2)).assertFalse();
      expect(snap.content.length > 0).assertTrue();
    });
    /**
     * @tc.name CommentSnapshotsTest_case_015
     * @tc.desc snapshot: projection is an immutable copy, variant 3 (CommentSnapshotsTest case 15)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentSnapshotsTest_case_015', 0, async () => {
      const c: Comment = makeComment(16, 'user_16', 'comment body 16', 'app.media.icon_comment_app_logo1', '02-07 13:25', []);
      const snap: CommentSnapshot = snapshotComment(c);
      expect(snap.id).assertEqual(c.id);
      expect(snap.name).assertEqual(c.name);
      expect(snap.content).assertEqual(commentText(c));
      c.name = 'mutated';
      c.images.push(imageUriFor(50));
      expect(snap.name).assertEqual('user_16');
      expect(snap.images.length).assertEqual(0);
      const snap2: CommentSnapshot = snapshotComment(c);
      expect(sameSnapshot(snap, snap2)).assertFalse();
      expect(snap.content.length > 0).assertTrue();
    });
    /**
     * @tc.name CommentSnapshotsTest_case_016
     * @tc.desc snapshot: projection is an immutable copy, variant 1 (CommentSnapshotsTest case 16)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentSnapshotsTest_case_016', 0, async () => {
      const c: Comment = makeComment(17, 'user_17', 'comment body 17', 'app.media.icon_comment_app_logo1', '02-07 13:25', []);
      const snap: CommentSnapshot = snapshotComment(c);
      expect(snap.id).assertEqual(c.id);
      expect(snap.name).assertEqual(c.name);
      expect(snap.content).assertEqual(commentText(c));
      c.name = 'mutated';
      c.images.push(imageUriFor(50));
      expect(snap.name).assertEqual('user_17');
      expect(snap.images.length).assertEqual(0);
      const snap2: CommentSnapshot = snapshotComment(c);
      expect(sameSnapshot(snap, snap2)).assertFalse();
      expect(snap.content.length > 0).assertTrue();
    });
    /**
     * @tc.name CommentSnapshotsTest_case_017
     * @tc.desc snapshot: projection is an immutable copy, variant 2 (CommentSnapshotsTest case 17)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentSnapshotsTest_case_017', 0, async () => {
      const c: Comment = makeComment(18, 'user_18', 'comment body 18', 'app.media.icon_comment_app_logo1', '02-07 13:25', []);
      const snap: CommentSnapshot = snapshotComment(c);
      expect(snap.id).assertEqual(c.id);
      expect(snap.name).assertEqual(c.name);
      expect(snap.content).assertEqual(commentText(c));
      c.name = 'mutated';
      c.images.push(imageUriFor(50));
      expect(snap.name).assertEqual('user_18');
      expect(snap.images.length).assertEqual(0);
      const snap2: CommentSnapshot = snapshotComment(c);
      expect(sameSnapshot(snap, snap2)).assertFalse();
      expect(snap.content.length > 0).assertTrue();
    });
    /**
     * @tc.name CommentSnapshotsTest_case_018
     * @tc.desc snapshot: projection is an immutable copy, variant 3 (CommentSnapshotsTest case 18)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentSnapshotsTest_case_018', 0, async () => {
      const c: Comment = makeComment(19, 'user_19', 'comment body 19', 'app.media.icon_comment_app_logo1', '02-07 13:25', []);
      const snap: CommentSnapshot = snapshotComment(c);
      expect(snap.id).assertEqual(c.id);
      expect(snap.name).assertEqual(c.name);
      expect(snap.content).assertEqual(commentText(c));
      c.name = 'mutated';
      c.images.push(imageUriFor(50));
      expect(snap.name).assertEqual('user_19');
      expect(snap.images.length).assertEqual(0);
      const snap2: CommentSnapshot = snapshotComment(c);
      expect(sameSnapshot(snap, snap2)).assertFalse();
      expect(snap.content.length > 0).assertTrue();
    });
    /**
     * @tc.name CommentSnapshotsTest_case_019
     * @tc.desc snapshot: projection is an immutable copy, variant 1 (CommentSnapshotsTest case 19)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentSnapshotsTest_case_019', 0, async () => {
      const c: Comment = makeComment(20, 'user_20', 'comment body 20', 'app.media.icon_comment_app_logo1', '02-07 13:25', []);
      const snap: CommentSnapshot = snapshotComment(c);
      expect(snap.id).assertEqual(c.id);
      expect(snap.name).assertEqual(c.name);
      expect(snap.content).assertEqual(commentText(c));
      c.name = 'mutated';
      c.images.push(imageUriFor(50));
      expect(snap.name).assertEqual('user_20');
      expect(snap.images.length).assertEqual(0);
      const snap2: CommentSnapshot = snapshotComment(c);
      expect(sameSnapshot(snap, snap2)).assertFalse();
      expect(snap.content.length > 0).assertTrue();
    });
    /**
     * @tc.name CommentSnapshotsTest_case_020
     * @tc.desc snapshot: projection is an immutable copy, variant 2 (CommentSnapshotsTest case 20)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentSnapshotsTest_case_020', 0, async () => {
      const c: Comment = makeComment(21, 'user_21', 'comment body 21', 'app.media.icon_comment_app_logo1', '02-07 13:25', []);
      const snap: CommentSnapshot = snapshotComment(c);
      expect(snap.id).assertEqual(c.id);
      expect(snap.name).assertEqual(c.name);
      expect(snap.content).assertEqual(commentText(c));
      c.name = 'mutated';
      c.images.push(imageUriFor(50));
      expect(snap.name).assertEqual('user_21');
      expect(snap.images.length).assertEqual(0);
      const snap2: CommentSnapshot = snapshotComment(c);
      expect(sameSnapshot(snap, snap2)).assertFalse();
      expect(snap.content.length > 0).assertTrue();
    });
    /**
     * @tc.name CommentSnapshotsTest_case_021
     * @tc.desc snapshot: projection is an immutable copy, variant 3 (CommentSnapshotsTest case 21)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentSnapshotsTest_case_021', 0, async () => {
      const c: Comment = makeComment(22, 'user_22', 'comment body 22', 'app.media.icon_comment_app_logo1', '02-07 13:25', []);
      const snap: CommentSnapshot = snapshotComment(c);
      expect(snap.id).assertEqual(c.id);
      expect(snap.name).assertEqual(c.name);
      expect(snap.content).assertEqual(commentText(c));
      c.name = 'mutated';
      c.images.push(imageUriFor(50));
      expect(snap.name).assertEqual('user_22');
      expect(snap.images.length).assertEqual(0);
      const snap2: CommentSnapshot = snapshotComment(c);
      expect(sameSnapshot(snap, snap2)).assertFalse();
      expect(snap.content.length > 0).assertTrue();
    });
    /**
     * @tc.name CommentSnapshotsTest_case_022
     * @tc.desc snapshot: projection is an immutable copy, variant 1 (CommentSnapshotsTest case 22)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentSnapshotsTest_case_022', 0, async () => {
      const c: Comment = makeComment(23, 'user_23', 'comment body 23', 'app.media.icon_comment_app_logo1', '02-07 13:25', []);
      const snap: CommentSnapshot = snapshotComment(c);
      expect(snap.id).assertEqual(c.id);
      expect(snap.name).assertEqual(c.name);
      expect(snap.content).assertEqual(commentText(c));
      c.name = 'mutated';
      c.images.push(imageUriFor(50));
      expect(snap.name).assertEqual('user_23');
      expect(snap.images.length).assertEqual(0);
      const snap2: CommentSnapshot = snapshotComment(c);
      expect(sameSnapshot(snap, snap2)).assertFalse();
      expect(snap.content.length > 0).assertTrue();
    });
    /**
     * @tc.name CommentSnapshotsTest_case_023
     * @tc.desc snapshot: projection is an immutable copy, variant 2 (CommentSnapshotsTest case 23)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentSnapshotsTest_case_023', 0, async () => {
      const c: Comment = makeComment(24, 'user_24', 'comment body 24', 'app.media.icon_comment_app_logo1', '02-07 13:25', []);
      const snap: CommentSnapshot = snapshotComment(c);
      expect(snap.id).assertEqual(c.id);
      expect(snap.name).assertEqual(c.name);
      expect(snap.content).assertEqual(commentText(c));
      c.name = 'mutated';
      c.images.push(imageUriFor(50));
      expect(snap.name).assertEqual('user_24');
      expect(snap.images.length).assertEqual(0);
      const snap2: CommentSnapshot = snapshotComment(c);
      expect(sameSnapshot(snap, snap2)).assertFalse();
      expect(snap.content.length > 0).assertTrue();
    });
    /**
     * @tc.name CommentSnapshotsTest_case_024
     * @tc.desc snapshot: projection is an immutable copy, variant 3 (CommentSnapshotsTest case 24)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentSnapshotsTest_case_024', 0, async () => {
      const c: Comment = makeComment(25, 'user_25', 'comment body 25', 'app.media.icon_comment_app_logo1', '02-07 13:25', []);
      const snap: CommentSnapshot = snapshotComment(c);
      expect(snap.id).assertEqual(c.id);
      expect(snap.name).assertEqual(c.name);
      expect(snap.content).assertEqual(commentText(c));
      c.name = 'mutated';
      c.images.push(imageUriFor(50));
      expect(snap.name).assertEqual('user_25');
      expect(snap.images.length).assertEqual(0);
      const snap2: CommentSnapshot = snapshotComment(c);
      expect(sameSnapshot(snap, snap2)).assertFalse();
      expect(snap.content.length > 0).assertTrue();
    });
    /**
     * @tc.name CommentSnapshotsTest_case_025
     * @tc.desc snapshot: projection is an immutable copy, variant 1 (CommentSnapshotsTest case 25)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentSnapshotsTest_case_025', 0, async () => {
      const c: Comment = makeComment(26, 'user_26', 'comment body 26', 'app.media.icon_comment_app_logo1', '02-07 13:25', []);
      const snap: CommentSnapshot = snapshotComment(c);
      expect(snap.id).assertEqual(c.id);
      expect(snap.name).assertEqual(c.name);
      expect(snap.content).assertEqual(commentText(c));
      c.name = 'mutated';
      c.images.push(imageUriFor(50));
      expect(snap.name).assertEqual('user_26');
      expect(snap.images.length).assertEqual(0);
      const snap2: CommentSnapshot = snapshotComment(c);
      expect(sameSnapshot(snap, snap2)).assertFalse();
      expect(snap.content.length > 0).assertTrue();
    });
    /**
     * @tc.name CommentSnapshotsTest_case_026
     * @tc.desc snapshot: projection is an immutable copy, variant 2 (CommentSnapshotsTest case 26)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentSnapshotsTest_case_026', 0, async () => {
      const c: Comment = makeComment(27, 'user_27', 'comment body 27', 'app.media.icon_comment_app_logo1', '02-07 13:25', []);
      const snap: CommentSnapshot = snapshotComment(c);
      expect(snap.id).assertEqual(c.id);
      expect(snap.name).assertEqual(c.name);
      expect(snap.content).assertEqual(commentText(c));
      c.name = 'mutated';
      c.images.push(imageUriFor(50));
      expect(snap.name).assertEqual('user_27');
      expect(snap.images.length).assertEqual(0);
      const snap2: CommentSnapshot = snapshotComment(c);
      expect(sameSnapshot(snap, snap2)).assertFalse();
      expect(snap.content.length > 0).assertTrue();
    });
    /**
     * @tc.name CommentSnapshotsTest_case_027
     * @tc.desc snapshot: projection is an immutable copy, variant 3 (CommentSnapshotsTest case 27)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentSnapshotsTest_case_027', 0, async () => {
      const c: Comment = makeComment(28, 'user_28', 'comment body 28', 'app.media.icon_comment_app_logo1', '02-07 13:25', []);
      const snap: CommentSnapshot = snapshotComment(c);
      expect(snap.id).assertEqual(c.id);
      expect(snap.name).assertEqual(c.name);
      expect(snap.content).assertEqual(commentText(c));
      c.name = 'mutated';
      c.images.push(imageUriFor(50));
      expect(snap.name).assertEqual('user_28');
      expect(snap.images.length).assertEqual(0);
      const snap2: CommentSnapshot = snapshotComment(c);
      expect(sameSnapshot(snap, snap2)).assertFalse();
      expect(snap.content.length > 0).assertTrue();
    });
    /**
     * @tc.name CommentSnapshotsTest_case_028
     * @tc.desc snapshot: projection is an immutable copy, variant 1 (CommentSnapshotsTest case 28)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentSnapshotsTest_case_028', 0, async () => {
      const c: Comment = makeComment(29, 'user_29', 'comment body 29', 'app.media.icon_comment_app_logo1', '02-07 13:25', []);
      const snap: CommentSnapshot = snapshotComment(c);
      expect(snap.id).assertEqual(c.id);
      expect(snap.name).assertEqual(c.name);
      expect(snap.content).assertEqual(commentText(c));
      c.name = 'mutated';
      c.images.push(imageUriFor(50));
      expect(snap.name).assertEqual('user_29');
      expect(snap.images.length).assertEqual(0);
      const snap2: CommentSnapshot = snapshotComment(c);
      expect(sameSnapshot(snap, snap2)).assertFalse();
      expect(snap.content.length > 0).assertTrue();
    });
    /**
     * @tc.name CommentSnapshotsTest_case_029
     * @tc.desc snapshot: projection is an immutable copy, variant 2 (CommentSnapshotsTest case 29)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentSnapshotsTest_case_029', 0, async () => {
      const c: Comment = makeComment(30, 'user_30', 'comment body 30', 'app.media.icon_comment_app_logo1', '02-07 13:25', []);
      const snap: CommentSnapshot = snapshotComment(c);
      expect(snap.id).assertEqual(c.id);
      expect(snap.name).assertEqual(c.name);
      expect(snap.content).assertEqual(commentText(c));
      c.name = 'mutated';
      c.images.push(imageUriFor(50));
      expect(snap.name).assertEqual('user_30');
      expect(snap.images.length).assertEqual(0);
      const snap2: CommentSnapshot = snapshotComment(c);
      expect(sameSnapshot(snap, snap2)).assertFalse();
      expect(snap.content.length > 0).assertTrue();
    });
    /**
     * @tc.name CommentSnapshotsTest_case_030
     * @tc.desc snapshot: projection is an immutable copy, variant 3 (CommentSnapshotsTest case 30)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentSnapshotsTest_case_030', 0, async () => {
      const c: Comment = makeComment(31, 'user_31', 'comment body 31', 'app.media.icon_comment_app_logo1', '02-07 13:25', []);
      const snap: CommentSnapshot = snapshotComment(c);
      expect(snap.id).assertEqual(c.id);
      expect(snap.name).assertEqual(c.name);
      expect(snap.content).assertEqual(commentText(c));
      c.name = 'mutated';
      c.images.push(imageUriFor(50));
      expect(snap.name).assertEqual('user_31');
      expect(snap.images.length).assertEqual(0);
      const snap2: CommentSnapshot = snapshotComment(c);
      expect(sameSnapshot(snap, snap2)).assertFalse();
      expect(snap.content.length > 0).assertTrue();
    });
    /**
     * @tc.name CommentSnapshotsTest_case_031
     * @tc.desc snapshot: projection is an immutable copy, variant 1 (CommentSnapshotsTest case 31)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentSnapshotsTest_case_031', 0, async () => {
      const c: Comment = makeComment(32, 'user_32', 'comment body 32', 'app.media.icon_comment_app_logo1', '02-07 13:25', []);
      const snap: CommentSnapshot = snapshotComment(c);
      expect(snap.id).assertEqual(c.id);
      expect(snap.name).assertEqual(c.name);
      expect(snap.content).assertEqual(commentText(c));
      c.name = 'mutated';
      c.images.push(imageUriFor(50));
      expect(snap.name).assertEqual('user_32');
      expect(snap.images.length).assertEqual(0);
      const snap2: CommentSnapshot = snapshotComment(c);
      expect(sameSnapshot(snap, snap2)).assertFalse();
      expect(snap.content.length > 0).assertTrue();
    });
    /**
     * @tc.name CommentSnapshotsTest_case_032
     * @tc.desc snapshot: projection is an immutable copy, variant 2 (CommentSnapshotsTest case 32)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentSnapshotsTest_case_032', 0, async () => {
      const c: Comment = makeComment(33, 'user_33', 'comment body 33', 'app.media.icon_comment_app_logo1', '02-07 13:25', []);
      const snap: CommentSnapshot = snapshotComment(c);
      expect(snap.id).assertEqual(c.id);
      expect(snap.name).assertEqual(c.name);
      expect(snap.content).assertEqual(commentText(c));
      c.name = 'mutated';
      c.images.push(imageUriFor(50));
      expect(snap.name).assertEqual('user_33');
      expect(snap.images.length).assertEqual(0);
      const snap2: CommentSnapshot = snapshotComment(c);
      expect(sameSnapshot(snap, snap2)).assertFalse();
      expect(snap.content.length > 0).assertTrue();
    });
    /**
     * @tc.name CommentSnapshotsTest_case_033
     * @tc.desc snapshot: projection is an immutable copy, variant 3 (CommentSnapshotsTest case 33)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentSnapshotsTest_case_033', 0, async () => {
      const c: Comment = makeComment(34, 'user_34', 'comment body 34', 'app.media.icon_comment_app_logo1', '02-07 13:25', []);
      const snap: CommentSnapshot = snapshotComment(c);
      expect(snap.id).assertEqual(c.id);
      expect(snap.name).assertEqual(c.name);
      expect(snap.content).assertEqual(commentText(c));
      c.name = 'mutated';
      c.images.push(imageUriFor(50));
      expect(snap.name).assertEqual('user_34');
      expect(snap.images.length).assertEqual(0);
      const snap2: CommentSnapshot = snapshotComment(c);
      expect(sameSnapshot(snap, snap2)).assertFalse();
      expect(snap.content.length > 0).assertTrue();
    });
    /**
     * @tc.name CommentSnapshotsTest_case_034
     * @tc.desc snapshot: projection is an immutable copy, variant 1 (CommentSnapshotsTest case 34)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentSnapshotsTest_case_034', 0, async () => {
      const c: Comment = makeComment(35, 'user_35', 'comment body 35', 'app.media.icon_comment_app_logo1', '02-07 13:25', []);
      const snap: CommentSnapshot = snapshotComment(c);
      expect(snap.id).assertEqual(c.id);
      expect(snap.name).assertEqual(c.name);
      expect(snap.content).assertEqual(commentText(c));
      c.name = 'mutated';
      c.images.push(imageUriFor(50));
      expect(snap.name).assertEqual('user_35');
      expect(snap.images.length).assertEqual(0);
      const snap2: CommentSnapshot = snapshotComment(c);
      expect(sameSnapshot(snap, snap2)).assertFalse();
      expect(snap.content.length > 0).assertTrue();
    });
    /**
     * @tc.name CommentSnapshotsTest_case_035
     * @tc.desc snapshot: projection is an immutable copy, variant 2 (CommentSnapshotsTest case 35)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentSnapshotsTest_case_035', 0, async () => {
      const c: Comment = makeComment(36, 'user_36', 'comment body 36', 'app.media.icon_comment_app_logo1', '02-07 13:25', []);
      const snap: CommentSnapshot = snapshotComment(c);
      expect(snap.id).assertEqual(c.id);
      expect(snap.name).assertEqual(c.name);
      expect(snap.content).assertEqual(commentText(c));
      c.name = 'mutated';
      c.images.push(imageUriFor(50));
      expect(snap.name).assertEqual('user_36');
      expect(snap.images.length).assertEqual(0);
      const snap2: CommentSnapshot = snapshotComment(c);
      expect(sameSnapshot(snap, snap2)).assertFalse();
      expect(snap.content.length > 0).assertTrue();
    });
    /**
     * @tc.name CommentSnapshotsTest_case_036
     * @tc.desc snapshot: projection is an immutable copy, variant 3 (CommentSnapshotsTest case 36)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentSnapshotsTest_case_036', 0, async () => {
      const c: Comment = makeComment(37, 'user_37', 'comment body 37', 'app.media.icon_comment_app_logo1', '02-07 13:25', []);
      const snap: CommentSnapshot = snapshotComment(c);
      expect(snap.id).assertEqual(c.id);
      expect(snap.name).assertEqual(c.name);
      expect(snap.content).assertEqual(commentText(c));
      c.name = 'mutated';
      c.images.push(imageUriFor(50));
      expect(snap.name).assertEqual('user_37');
      expect(snap.images.length).assertEqual(0);
      const snap2: CommentSnapshot = snapshotComment(c);
      expect(sameSnapshot(snap, snap2)).assertFalse();
      expect(snap.content.length > 0).assertTrue();
    });
    /**
     * @tc.name CommentSnapshotsTest_case_037
     * @tc.desc snapshot: projection is an immutable copy, variant 1 (CommentSnapshotsTest case 37)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentSnapshotsTest_case_037', 0, async () => {
      const c: Comment = makeComment(38, 'user_38', 'comment body 38', 'app.media.icon_comment_app_logo1', '02-07 13:25', []);
      const snap: CommentSnapshot = snapshotComment(c);
      expect(snap.id).assertEqual(c.id);
      expect(snap.name).assertEqual(c.name);
      expect(snap.content).assertEqual(commentText(c));
      c.name = 'mutated';
      c.images.push(imageUriFor(50));
      expect(snap.name).assertEqual('user_38');
      expect(snap.images.length).assertEqual(0);
      const snap2: CommentSnapshot = snapshotComment(c);
      expect(sameSnapshot(snap, snap2)).assertFalse();
      expect(snap.content.length > 0).assertTrue();
    });
  });
}
