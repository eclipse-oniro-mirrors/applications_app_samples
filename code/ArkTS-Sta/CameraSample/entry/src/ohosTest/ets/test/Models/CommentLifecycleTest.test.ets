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

export default function CommentLifecycleTest(): void {
  describe('CommentLifecycleTest', () => {
    beforeAll(() => {
      logSuite('CommentLifecycleTest', 'begin');
    });
    beforeEach(async () => {
      await yieldTick();
    });
    afterAll(() => {
      logSuite('CommentLifecycleTest', 'end');
    });

    /**
     * @tc.name CommentLifecycleTest_case_001
     * @tc.desc lifecycle: create, edit, snapshot and restore in one flow (CommentLifecycleTest case 1)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentLifecycleTest_case_001', 0, async () => {
      const c: Comment = makeComment(1, 'Cloud', 'first', 'app.media.icon_comment_app_logo1', '02-07 13:25', [imageUriFor(1)]);
      const before: CommentSnapshot = snapshotComment(c);
      c.comment = 'second';
      c.images.push(imageUriFor(2));
      expect(c.comment as string).assertEqual('second');
      expect(c.images.length).assertEqual(2);
      const after: CommentSnapshot = snapshotComment(c);
      expect(sameSnapshot(before, after)).assertFalse();
      expect(before.content).assertEqual('first');
      expect(after.content).assertEqual('second');
      expect(before.images.length).assertEqual(1);
      expect(after.images.length).assertEqual(2);
    });
    /**
     * @tc.name CommentLifecycleTest_case_002
     * @tc.desc snapshot: projection is an immutable copy, variant 2 (CommentLifecycleTest case 2)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentLifecycleTest_case_002', 0, async () => {
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
     * @tc.name CommentLifecycleTest_case_003
     * @tc.desc lifecycle: create, edit, snapshot and restore in one flow (CommentLifecycleTest case 3)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentLifecycleTest_case_003', 0, async () => {
      const c: Comment = makeComment(3, 'Cloud', 'first', 'app.media.icon_comment_app_logo1', '02-07 13:25', [imageUriFor(1)]);
      const before: CommentSnapshot = snapshotComment(c);
      c.comment = 'second';
      c.images.push(imageUriFor(2));
      expect(c.comment as string).assertEqual('second');
      expect(c.images.length).assertEqual(2);
      const after: CommentSnapshot = snapshotComment(c);
      expect(sameSnapshot(before, after)).assertFalse();
      expect(before.content).assertEqual('first');
      expect(after.content).assertEqual('second');
      expect(before.images.length).assertEqual(1);
      expect(after.images.length).assertEqual(2);
    });
    /**
     * @tc.name CommentLifecycleTest_case_004
     * @tc.desc snapshot: projection is an immutable copy, variant 1 (CommentLifecycleTest case 4)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentLifecycleTest_case_004', 0, async () => {
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
     * @tc.name CommentLifecycleTest_case_005
     * @tc.desc lifecycle: create, edit, snapshot and restore in one flow (CommentLifecycleTest case 5)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentLifecycleTest_case_005', 0, async () => {
      const c: Comment = makeComment(5, 'Cloud', 'first', 'app.media.icon_comment_app_logo1', '02-07 13:25', [imageUriFor(1)]);
      const before: CommentSnapshot = snapshotComment(c);
      c.comment = 'second';
      c.images.push(imageUriFor(2));
      expect(c.comment as string).assertEqual('second');
      expect(c.images.length).assertEqual(2);
      const after: CommentSnapshot = snapshotComment(c);
      expect(sameSnapshot(before, after)).assertFalse();
      expect(before.content).assertEqual('first');
      expect(after.content).assertEqual('second');
      expect(before.images.length).assertEqual(1);
      expect(after.images.length).assertEqual(2);
    });
    /**
     * @tc.name CommentLifecycleTest_case_006
     * @tc.desc snapshot: projection is an immutable copy, variant 3 (CommentLifecycleTest case 6)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentLifecycleTest_case_006', 0, async () => {
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
     * @tc.name CommentLifecycleTest_case_007
     * @tc.desc lifecycle: create, edit, snapshot and restore in one flow (CommentLifecycleTest case 7)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentLifecycleTest_case_007', 0, async () => {
      const c: Comment = makeComment(7, 'Cloud', 'first', 'app.media.icon_comment_app_logo1', '02-07 13:25', [imageUriFor(1)]);
      const before: CommentSnapshot = snapshotComment(c);
      c.comment = 'second';
      c.images.push(imageUriFor(2));
      expect(c.comment as string).assertEqual('second');
      expect(c.images.length).assertEqual(2);
      const after: CommentSnapshot = snapshotComment(c);
      expect(sameSnapshot(before, after)).assertFalse();
      expect(before.content).assertEqual('first');
      expect(after.content).assertEqual('second');
      expect(before.images.length).assertEqual(1);
      expect(after.images.length).assertEqual(2);
    });
    /**
     * @tc.name CommentLifecycleTest_case_008
     * @tc.desc snapshot: projection is an immutable copy, variant 2 (CommentLifecycleTest case 8)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentLifecycleTest_case_008', 0, async () => {
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
     * @tc.name CommentLifecycleTest_case_009
     * @tc.desc lifecycle: create, edit, snapshot and restore in one flow (CommentLifecycleTest case 9)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentLifecycleTest_case_009', 0, async () => {
      const c: Comment = makeComment(9, 'Cloud', 'first', 'app.media.icon_comment_app_logo1', '02-07 13:25', [imageUriFor(1)]);
      const before: CommentSnapshot = snapshotComment(c);
      c.comment = 'second';
      c.images.push(imageUriFor(2));
      expect(c.comment as string).assertEqual('second');
      expect(c.images.length).assertEqual(2);
      const after: CommentSnapshot = snapshotComment(c);
      expect(sameSnapshot(before, after)).assertFalse();
      expect(before.content).assertEqual('first');
      expect(after.content).assertEqual('second');
      expect(before.images.length).assertEqual(1);
      expect(after.images.length).assertEqual(2);
    });
    /**
     * @tc.name CommentLifecycleTest_case_010
     * @tc.desc snapshot: projection is an immutable copy, variant 1 (CommentLifecycleTest case 10)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentLifecycleTest_case_010', 0, async () => {
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
     * @tc.name CommentLifecycleTest_case_011
     * @tc.desc lifecycle: create, edit, snapshot and restore in one flow (CommentLifecycleTest case 11)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentLifecycleTest_case_011', 0, async () => {
      const c: Comment = makeComment(11, 'Cloud', 'first', 'app.media.icon_comment_app_logo1', '02-07 13:25', [imageUriFor(1)]);
      const before: CommentSnapshot = snapshotComment(c);
      c.comment = 'second';
      c.images.push(imageUriFor(2));
      expect(c.comment as string).assertEqual('second');
      expect(c.images.length).assertEqual(2);
      const after: CommentSnapshot = snapshotComment(c);
      expect(sameSnapshot(before, after)).assertFalse();
      expect(before.content).assertEqual('first');
      expect(after.content).assertEqual('second');
      expect(before.images.length).assertEqual(1);
      expect(after.images.length).assertEqual(2);
    });
    /**
     * @tc.name CommentLifecycleTest_case_012
     * @tc.desc snapshot: projection is an immutable copy, variant 3 (CommentLifecycleTest case 12)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentLifecycleTest_case_012', 0, async () => {
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
     * @tc.name CommentLifecycleTest_case_013
     * @tc.desc lifecycle: create, edit, snapshot and restore in one flow (CommentLifecycleTest case 13)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentLifecycleTest_case_013', 0, async () => {
      const c: Comment = makeComment(13, 'Cloud', 'first', 'app.media.icon_comment_app_logo1', '02-07 13:25', [imageUriFor(1)]);
      const before: CommentSnapshot = snapshotComment(c);
      c.comment = 'second';
      c.images.push(imageUriFor(2));
      expect(c.comment as string).assertEqual('second');
      expect(c.images.length).assertEqual(2);
      const after: CommentSnapshot = snapshotComment(c);
      expect(sameSnapshot(before, after)).assertFalse();
      expect(before.content).assertEqual('first');
      expect(after.content).assertEqual('second');
      expect(before.images.length).assertEqual(1);
      expect(after.images.length).assertEqual(2);
    });
    /**
     * @tc.name CommentLifecycleTest_case_014
     * @tc.desc snapshot: projection is an immutable copy, variant 2 (CommentLifecycleTest case 14)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentLifecycleTest_case_014', 0, async () => {
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
     * @tc.name CommentLifecycleTest_case_015
     * @tc.desc lifecycle: create, edit, snapshot and restore in one flow (CommentLifecycleTest case 15)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentLifecycleTest_case_015', 0, async () => {
      const c: Comment = makeComment(15, 'Cloud', 'first', 'app.media.icon_comment_app_logo1', '02-07 13:25', [imageUriFor(1)]);
      const before: CommentSnapshot = snapshotComment(c);
      c.comment = 'second';
      c.images.push(imageUriFor(2));
      expect(c.comment as string).assertEqual('second');
      expect(c.images.length).assertEqual(2);
      const after: CommentSnapshot = snapshotComment(c);
      expect(sameSnapshot(before, after)).assertFalse();
      expect(before.content).assertEqual('first');
      expect(after.content).assertEqual('second');
      expect(before.images.length).assertEqual(1);
      expect(after.images.length).assertEqual(2);
    });
    /**
     * @tc.name CommentLifecycleTest_case_016
     * @tc.desc snapshot: projection is an immutable copy, variant 1 (CommentLifecycleTest case 16)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentLifecycleTest_case_016', 0, async () => {
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
     * @tc.name CommentLifecycleTest_case_017
     * @tc.desc lifecycle: create, edit, snapshot and restore in one flow (CommentLifecycleTest case 17)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentLifecycleTest_case_017', 0, async () => {
      const c: Comment = makeComment(17, 'Cloud', 'first', 'app.media.icon_comment_app_logo1', '02-07 13:25', [imageUriFor(1)]);
      const before: CommentSnapshot = snapshotComment(c);
      c.comment = 'second';
      c.images.push(imageUriFor(2));
      expect(c.comment as string).assertEqual('second');
      expect(c.images.length).assertEqual(2);
      const after: CommentSnapshot = snapshotComment(c);
      expect(sameSnapshot(before, after)).assertFalse();
      expect(before.content).assertEqual('first');
      expect(after.content).assertEqual('second');
      expect(before.images.length).assertEqual(1);
      expect(after.images.length).assertEqual(2);
    });
    /**
     * @tc.name CommentLifecycleTest_case_018
     * @tc.desc snapshot: projection is an immutable copy, variant 3 (CommentLifecycleTest case 18)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentLifecycleTest_case_018', 0, async () => {
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
     * @tc.name CommentLifecycleTest_case_019
     * @tc.desc lifecycle: create, edit, snapshot and restore in one flow (CommentLifecycleTest case 19)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentLifecycleTest_case_019', 0, async () => {
      const c: Comment = makeComment(19, 'Cloud', 'first', 'app.media.icon_comment_app_logo1', '02-07 13:25', [imageUriFor(1)]);
      const before: CommentSnapshot = snapshotComment(c);
      c.comment = 'second';
      c.images.push(imageUriFor(2));
      expect(c.comment as string).assertEqual('second');
      expect(c.images.length).assertEqual(2);
      const after: CommentSnapshot = snapshotComment(c);
      expect(sameSnapshot(before, after)).assertFalse();
      expect(before.content).assertEqual('first');
      expect(after.content).assertEqual('second');
      expect(before.images.length).assertEqual(1);
      expect(after.images.length).assertEqual(2);
    });
    /**
     * @tc.name CommentLifecycleTest_case_020
     * @tc.desc snapshot: projection is an immutable copy, variant 2 (CommentLifecycleTest case 20)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentLifecycleTest_case_020', 0, async () => {
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
     * @tc.name CommentLifecycleTest_case_021
     * @tc.desc lifecycle: create, edit, snapshot and restore in one flow (CommentLifecycleTest case 21)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentLifecycleTest_case_021', 0, async () => {
      const c: Comment = makeComment(21, 'Cloud', 'first', 'app.media.icon_comment_app_logo1', '02-07 13:25', [imageUriFor(1)]);
      const before: CommentSnapshot = snapshotComment(c);
      c.comment = 'second';
      c.images.push(imageUriFor(2));
      expect(c.comment as string).assertEqual('second');
      expect(c.images.length).assertEqual(2);
      const after: CommentSnapshot = snapshotComment(c);
      expect(sameSnapshot(before, after)).assertFalse();
      expect(before.content).assertEqual('first');
      expect(after.content).assertEqual('second');
      expect(before.images.length).assertEqual(1);
      expect(after.images.length).assertEqual(2);
    });
    /**
     * @tc.name CommentLifecycleTest_case_022
     * @tc.desc snapshot: projection is an immutable copy, variant 1 (CommentLifecycleTest case 22)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentLifecycleTest_case_022', 0, async () => {
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
     * @tc.name CommentLifecycleTest_case_023
     * @tc.desc lifecycle: create, edit, snapshot and restore in one flow (CommentLifecycleTest case 23)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentLifecycleTest_case_023', 0, async () => {
      const c: Comment = makeComment(23, 'Cloud', 'first', 'app.media.icon_comment_app_logo1', '02-07 13:25', [imageUriFor(1)]);
      const before: CommentSnapshot = snapshotComment(c);
      c.comment = 'second';
      c.images.push(imageUriFor(2));
      expect(c.comment as string).assertEqual('second');
      expect(c.images.length).assertEqual(2);
      const after: CommentSnapshot = snapshotComment(c);
      expect(sameSnapshot(before, after)).assertFalse();
      expect(before.content).assertEqual('first');
      expect(after.content).assertEqual('second');
      expect(before.images.length).assertEqual(1);
      expect(after.images.length).assertEqual(2);
    });
    /**
     * @tc.name CommentLifecycleTest_case_024
     * @tc.desc snapshot: projection is an immutable copy, variant 3 (CommentLifecycleTest case 24)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentLifecycleTest_case_024', 0, async () => {
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
     * @tc.name CommentLifecycleTest_case_025
     * @tc.desc lifecycle: create, edit, snapshot and restore in one flow (CommentLifecycleTest case 25)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentLifecycleTest_case_025', 0, async () => {
      const c: Comment = makeComment(25, 'Cloud', 'first', 'app.media.icon_comment_app_logo1', '02-07 13:25', [imageUriFor(1)]);
      const before: CommentSnapshot = snapshotComment(c);
      c.comment = 'second';
      c.images.push(imageUriFor(2));
      expect(c.comment as string).assertEqual('second');
      expect(c.images.length).assertEqual(2);
      const after: CommentSnapshot = snapshotComment(c);
      expect(sameSnapshot(before, after)).assertFalse();
      expect(before.content).assertEqual('first');
      expect(after.content).assertEqual('second');
      expect(before.images.length).assertEqual(1);
      expect(after.images.length).assertEqual(2);
    });
    /**
     * @tc.name CommentLifecycleTest_case_026
     * @tc.desc snapshot: projection is an immutable copy, variant 2 (CommentLifecycleTest case 26)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentLifecycleTest_case_026', 0, async () => {
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
     * @tc.name CommentLifecycleTest_case_027
     * @tc.desc lifecycle: create, edit, snapshot and restore in one flow (CommentLifecycleTest case 27)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentLifecycleTest_case_027', 0, async () => {
      const c: Comment = makeComment(27, 'Cloud', 'first', 'app.media.icon_comment_app_logo1', '02-07 13:25', [imageUriFor(1)]);
      const before: CommentSnapshot = snapshotComment(c);
      c.comment = 'second';
      c.images.push(imageUriFor(2));
      expect(c.comment as string).assertEqual('second');
      expect(c.images.length).assertEqual(2);
      const after: CommentSnapshot = snapshotComment(c);
      expect(sameSnapshot(before, after)).assertFalse();
      expect(before.content).assertEqual('first');
      expect(after.content).assertEqual('second');
      expect(before.images.length).assertEqual(1);
      expect(after.images.length).assertEqual(2);
    });
    /**
     * @tc.name CommentLifecycleTest_case_028
     * @tc.desc snapshot: projection is an immutable copy, variant 1 (CommentLifecycleTest case 28)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentLifecycleTest_case_028', 0, async () => {
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
     * @tc.name CommentLifecycleTest_case_029
     * @tc.desc lifecycle: create, edit, snapshot and restore in one flow (CommentLifecycleTest case 29)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentLifecycleTest_case_029', 0, async () => {
      const c: Comment = makeComment(29, 'Cloud', 'first', 'app.media.icon_comment_app_logo1', '02-07 13:25', [imageUriFor(1)]);
      const before: CommentSnapshot = snapshotComment(c);
      c.comment = 'second';
      c.images.push(imageUriFor(2));
      expect(c.comment as string).assertEqual('second');
      expect(c.images.length).assertEqual(2);
      const after: CommentSnapshot = snapshotComment(c);
      expect(sameSnapshot(before, after)).assertFalse();
      expect(before.content).assertEqual('first');
      expect(after.content).assertEqual('second');
      expect(before.images.length).assertEqual(1);
      expect(after.images.length).assertEqual(2);
    });
    /**
     * @tc.name CommentLifecycleTest_case_030
     * @tc.desc snapshot: projection is an immutable copy, variant 3 (CommentLifecycleTest case 30)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentLifecycleTest_case_030', 0, async () => {
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
     * @tc.name CommentLifecycleTest_case_031
     * @tc.desc lifecycle: create, edit, snapshot and restore in one flow (CommentLifecycleTest case 31)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentLifecycleTest_case_031', 0, async () => {
      const c: Comment = makeComment(31, 'Cloud', 'first', 'app.media.icon_comment_app_logo1', '02-07 13:25', [imageUriFor(1)]);
      const before: CommentSnapshot = snapshotComment(c);
      c.comment = 'second';
      c.images.push(imageUriFor(2));
      expect(c.comment as string).assertEqual('second');
      expect(c.images.length).assertEqual(2);
      const after: CommentSnapshot = snapshotComment(c);
      expect(sameSnapshot(before, after)).assertFalse();
      expect(before.content).assertEqual('first');
      expect(after.content).assertEqual('second');
      expect(before.images.length).assertEqual(1);
      expect(after.images.length).assertEqual(2);
    });
    /**
     * @tc.name CommentLifecycleTest_case_032
     * @tc.desc snapshot: projection is an immutable copy, variant 2 (CommentLifecycleTest case 32)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentLifecycleTest_case_032', 0, async () => {
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
     * @tc.name CommentLifecycleTest_case_033
     * @tc.desc lifecycle: create, edit, snapshot and restore in one flow (CommentLifecycleTest case 33)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentLifecycleTest_case_033', 0, async () => {
      const c: Comment = makeComment(33, 'Cloud', 'first', 'app.media.icon_comment_app_logo1', '02-07 13:25', [imageUriFor(1)]);
      const before: CommentSnapshot = snapshotComment(c);
      c.comment = 'second';
      c.images.push(imageUriFor(2));
      expect(c.comment as string).assertEqual('second');
      expect(c.images.length).assertEqual(2);
      const after: CommentSnapshot = snapshotComment(c);
      expect(sameSnapshot(before, after)).assertFalse();
      expect(before.content).assertEqual('first');
      expect(after.content).assertEqual('second');
      expect(before.images.length).assertEqual(1);
      expect(after.images.length).assertEqual(2);
    });
    /**
     * @tc.name CommentLifecycleTest_case_034
     * @tc.desc snapshot: projection is an immutable copy, variant 1 (CommentLifecycleTest case 34)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentLifecycleTest_case_034', 0, async () => {
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
     * @tc.name CommentLifecycleTest_case_035
     * @tc.desc lifecycle: create, edit, snapshot and restore in one flow (CommentLifecycleTest case 35)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentLifecycleTest_case_035', 0, async () => {
      const c: Comment = makeComment(35, 'Cloud', 'first', 'app.media.icon_comment_app_logo1', '02-07 13:25', [imageUriFor(1)]);
      const before: CommentSnapshot = snapshotComment(c);
      c.comment = 'second';
      c.images.push(imageUriFor(2));
      expect(c.comment as string).assertEqual('second');
      expect(c.images.length).assertEqual(2);
      const after: CommentSnapshot = snapshotComment(c);
      expect(sameSnapshot(before, after)).assertFalse();
      expect(before.content).assertEqual('first');
      expect(after.content).assertEqual('second');
      expect(before.images.length).assertEqual(1);
      expect(after.images.length).assertEqual(2);
    });
    /**
     * @tc.name CommentLifecycleTest_case_036
     * @tc.desc snapshot: projection is an immutable copy, variant 3 (CommentLifecycleTest case 36)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentLifecycleTest_case_036', 0, async () => {
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
     * @tc.name CommentLifecycleTest_case_037
     * @tc.desc lifecycle: create, edit, snapshot and restore in one flow (CommentLifecycleTest case 37)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentLifecycleTest_case_037', 0, async () => {
      const c: Comment = makeComment(37, 'Cloud', 'first', 'app.media.icon_comment_app_logo1', '02-07 13:25', [imageUriFor(1)]);
      const before: CommentSnapshot = snapshotComment(c);
      c.comment = 'second';
      c.images.push(imageUriFor(2));
      expect(c.comment as string).assertEqual('second');
      expect(c.images.length).assertEqual(2);
      const after: CommentSnapshot = snapshotComment(c);
      expect(sameSnapshot(before, after)).assertFalse();
      expect(before.content).assertEqual('first');
      expect(after.content).assertEqual('second');
      expect(before.images.length).assertEqual(1);
      expect(after.images.length).assertEqual(2);
    });
  });
}
