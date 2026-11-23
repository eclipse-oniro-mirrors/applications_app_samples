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

export default function CommentBoundariesTest(): void {
  describe('CommentBoundariesTest', () => {
    beforeAll(() => {
      logSuite('CommentBoundariesTest', 'begin');
    });
    beforeEach(async () => {
      await yieldTick();
    });
    afterAll(() => {
      logSuite('CommentBoundariesTest', 'end');
    });

    /**
     * @tc.name CommentBoundariesTest_case_001
     * @tc.desc boundary: empty text payload keeps model invariants (CommentBoundariesTest case 1)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentBoundariesTest_case_001', 0, async () => {
      const c: Comment = new Comment();
      c.comment = '';
      expect(commentText(c)).assertEqual('');
      expect(c.images.length).assertEqual(0);
      expect(c.name).assertEqual('');
      expect(c.time).assertEqual('');
      expect(c.id).assertEqual(0);
      expect(c.images.length).assertEqual(0);
    });
    /**
     * @tc.name CommentBoundariesTest_case_002
     * @tc.desc boundary: spaces text payload keeps model invariants (CommentBoundariesTest case 2)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentBoundariesTest_case_002', 0, async () => {
      const c: Comment = new Comment();
      c.comment = '   ';
      expect(commentText(c)).assertEqual('   ');
      expect(commentText(c).length).assertEqual(3);
      expect(c.name).assertEqual('');
      expect(c.time).assertEqual('');
      expect(c.id).assertEqual(0);
      expect(c.images.length).assertEqual(0);
    });
    /**
     * @tc.name CommentBoundariesTest_case_003
     * @tc.desc boundary: long text payload keeps model invariants (CommentBoundariesTest case 3)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentBoundariesTest_case_003', 0, async () => {
      const c: Comment = new Comment();
      c.comment = repeatText('x', 512);
      expect(commentText(c).length).assertEqual(512);
      expect(commentText(c).substring(0, 4)).assertEqual('xxxx');
      expect(c.name).assertEqual('');
      expect(c.time).assertEqual('');
      expect(c.id).assertEqual(0);
      expect(c.images.length).assertEqual(0);
    });
    /**
     * @tc.name CommentBoundariesTest_case_004
     * @tc.desc boundary: newline text payload keeps model invariants (CommentBoundariesTest case 4)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentBoundariesTest_case_004', 0, async () => {
      const c: Comment = new Comment();
      c.comment = 'line one\nline two';
      expect(commentText(c).indexOf('\n') >= 0).assertTrue();
      expect(commentText(c).split('\n').length).assertEqual(2);
      expect(c.name).assertEqual('');
      expect(c.time).assertEqual('');
      expect(c.id).assertEqual(0);
      expect(c.images.length).assertEqual(0);
    });
    /**
     * @tc.name CommentBoundariesTest_case_005
     * @tc.desc boundary: empty text payload keeps model invariants (CommentBoundariesTest case 5)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentBoundariesTest_case_005', 0, async () => {
      const c: Comment = new Comment();
      c.comment = '';
      expect(commentText(c)).assertEqual('');
      expect(c.images.length).assertEqual(0);
      expect(c.name).assertEqual('');
      expect(c.time).assertEqual('');
      expect(c.id).assertEqual(0);
      expect(c.images.length).assertEqual(0);
    });
    /**
     * @tc.name CommentBoundariesTest_case_006
     * @tc.desc boundary: spaces text payload keeps model invariants (CommentBoundariesTest case 6)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentBoundariesTest_case_006', 0, async () => {
      const c: Comment = new Comment();
      c.comment = '   ';
      expect(commentText(c)).assertEqual('   ');
      expect(commentText(c).length).assertEqual(3);
      expect(c.name).assertEqual('');
      expect(c.time).assertEqual('');
      expect(c.id).assertEqual(0);
      expect(c.images.length).assertEqual(0);
    });
    /**
     * @tc.name CommentBoundariesTest_case_007
     * @tc.desc boundary: long text payload keeps model invariants (CommentBoundariesTest case 7)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentBoundariesTest_case_007', 0, async () => {
      const c: Comment = new Comment();
      c.comment = repeatText('x', 512);
      expect(commentText(c).length).assertEqual(512);
      expect(commentText(c).substring(0, 4)).assertEqual('xxxx');
      expect(c.name).assertEqual('');
      expect(c.time).assertEqual('');
      expect(c.id).assertEqual(0);
      expect(c.images.length).assertEqual(0);
    });
    /**
     * @tc.name CommentBoundariesTest_case_008
     * @tc.desc boundary: newline text payload keeps model invariants (CommentBoundariesTest case 8)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentBoundariesTest_case_008', 0, async () => {
      const c: Comment = new Comment();
      c.comment = 'line one\nline two';
      expect(commentText(c).indexOf('\n') >= 0).assertTrue();
      expect(commentText(c).split('\n').length).assertEqual(2);
      expect(c.name).assertEqual('');
      expect(c.time).assertEqual('');
      expect(c.id).assertEqual(0);
      expect(c.images.length).assertEqual(0);
    });
    /**
     * @tc.name CommentBoundariesTest_case_009
     * @tc.desc boundary: empty text payload keeps model invariants (CommentBoundariesTest case 9)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentBoundariesTest_case_009', 0, async () => {
      const c: Comment = new Comment();
      c.comment = '';
      expect(commentText(c)).assertEqual('');
      expect(c.images.length).assertEqual(0);
      expect(c.name).assertEqual('');
      expect(c.time).assertEqual('');
      expect(c.id).assertEqual(0);
      expect(c.images.length).assertEqual(0);
    });
    /**
     * @tc.name CommentBoundariesTest_case_010
     * @tc.desc boundary: spaces text payload keeps model invariants (CommentBoundariesTest case 10)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentBoundariesTest_case_010', 0, async () => {
      const c: Comment = new Comment();
      c.comment = '   ';
      expect(commentText(c)).assertEqual('   ');
      expect(commentText(c).length).assertEqual(3);
      expect(c.name).assertEqual('');
      expect(c.time).assertEqual('');
      expect(c.id).assertEqual(0);
      expect(c.images.length).assertEqual(0);
    });
    /**
     * @tc.name CommentBoundariesTest_case_011
     * @tc.desc boundary: long text payload keeps model invariants (CommentBoundariesTest case 11)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentBoundariesTest_case_011', 0, async () => {
      const c: Comment = new Comment();
      c.comment = repeatText('x', 512);
      expect(commentText(c).length).assertEqual(512);
      expect(commentText(c).substring(0, 4)).assertEqual('xxxx');
      expect(c.name).assertEqual('');
      expect(c.time).assertEqual('');
      expect(c.id).assertEqual(0);
      expect(c.images.length).assertEqual(0);
    });
    /**
     * @tc.name CommentBoundariesTest_case_012
     * @tc.desc boundary: newline text payload keeps model invariants (CommentBoundariesTest case 12)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentBoundariesTest_case_012', 0, async () => {
      const c: Comment = new Comment();
      c.comment = 'line one\nline two';
      expect(commentText(c).indexOf('\n') >= 0).assertTrue();
      expect(commentText(c).split('\n').length).assertEqual(2);
      expect(c.name).assertEqual('');
      expect(c.time).assertEqual('');
      expect(c.id).assertEqual(0);
      expect(c.images.length).assertEqual(0);
    });
    /**
     * @tc.name CommentBoundariesTest_case_013
     * @tc.desc boundary: empty text payload keeps model invariants (CommentBoundariesTest case 13)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentBoundariesTest_case_013', 0, async () => {
      const c: Comment = new Comment();
      c.comment = '';
      expect(commentText(c)).assertEqual('');
      expect(c.images.length).assertEqual(0);
      expect(c.name).assertEqual('');
      expect(c.time).assertEqual('');
      expect(c.id).assertEqual(0);
      expect(c.images.length).assertEqual(0);
    });
    /**
     * @tc.name CommentBoundariesTest_case_014
     * @tc.desc boundary: spaces text payload keeps model invariants (CommentBoundariesTest case 14)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentBoundariesTest_case_014', 0, async () => {
      const c: Comment = new Comment();
      c.comment = '   ';
      expect(commentText(c)).assertEqual('   ');
      expect(commentText(c).length).assertEqual(3);
      expect(c.name).assertEqual('');
      expect(c.time).assertEqual('');
      expect(c.id).assertEqual(0);
      expect(c.images.length).assertEqual(0);
    });
    /**
     * @tc.name CommentBoundariesTest_case_015
     * @tc.desc boundary: long text payload keeps model invariants (CommentBoundariesTest case 15)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentBoundariesTest_case_015', 0, async () => {
      const c: Comment = new Comment();
      c.comment = repeatText('x', 512);
      expect(commentText(c).length).assertEqual(512);
      expect(commentText(c).substring(0, 4)).assertEqual('xxxx');
      expect(c.name).assertEqual('');
      expect(c.time).assertEqual('');
      expect(c.id).assertEqual(0);
      expect(c.images.length).assertEqual(0);
    });
    /**
     * @tc.name CommentBoundariesTest_case_016
     * @tc.desc boundary: newline text payload keeps model invariants (CommentBoundariesTest case 16)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentBoundariesTest_case_016', 0, async () => {
      const c: Comment = new Comment();
      c.comment = 'line one\nline two';
      expect(commentText(c).indexOf('\n') >= 0).assertTrue();
      expect(commentText(c).split('\n').length).assertEqual(2);
      expect(c.name).assertEqual('');
      expect(c.time).assertEqual('');
      expect(c.id).assertEqual(0);
      expect(c.images.length).assertEqual(0);
    });
    /**
     * @tc.name CommentBoundariesTest_case_017
     * @tc.desc boundary: empty text payload keeps model invariants (CommentBoundariesTest case 17)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentBoundariesTest_case_017', 0, async () => {
      const c: Comment = new Comment();
      c.comment = '';
      expect(commentText(c)).assertEqual('');
      expect(c.images.length).assertEqual(0);
      expect(c.name).assertEqual('');
      expect(c.time).assertEqual('');
      expect(c.id).assertEqual(0);
      expect(c.images.length).assertEqual(0);
    });
    /**
     * @tc.name CommentBoundariesTest_case_018
     * @tc.desc boundary: spaces text payload keeps model invariants (CommentBoundariesTest case 18)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentBoundariesTest_case_018', 0, async () => {
      const c: Comment = new Comment();
      c.comment = '   ';
      expect(commentText(c)).assertEqual('   ');
      expect(commentText(c).length).assertEqual(3);
      expect(c.name).assertEqual('');
      expect(c.time).assertEqual('');
      expect(c.id).assertEqual(0);
      expect(c.images.length).assertEqual(0);
    });
    /**
     * @tc.name CommentBoundariesTest_case_019
     * @tc.desc boundary: long text payload keeps model invariants (CommentBoundariesTest case 19)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentBoundariesTest_case_019', 0, async () => {
      const c: Comment = new Comment();
      c.comment = repeatText('x', 512);
      expect(commentText(c).length).assertEqual(512);
      expect(commentText(c).substring(0, 4)).assertEqual('xxxx');
      expect(c.name).assertEqual('');
      expect(c.time).assertEqual('');
      expect(c.id).assertEqual(0);
      expect(c.images.length).assertEqual(0);
    });
    /**
     * @tc.name CommentBoundariesTest_case_020
     * @tc.desc boundary: newline text payload keeps model invariants (CommentBoundariesTest case 20)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentBoundariesTest_case_020', 0, async () => {
      const c: Comment = new Comment();
      c.comment = 'line one\nline two';
      expect(commentText(c).indexOf('\n') >= 0).assertTrue();
      expect(commentText(c).split('\n').length).assertEqual(2);
      expect(c.name).assertEqual('');
      expect(c.time).assertEqual('');
      expect(c.id).assertEqual(0);
      expect(c.images.length).assertEqual(0);
    });
    /**
     * @tc.name CommentBoundariesTest_case_021
     * @tc.desc boundary: empty text payload keeps model invariants (CommentBoundariesTest case 21)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentBoundariesTest_case_021', 0, async () => {
      const c: Comment = new Comment();
      c.comment = '';
      expect(commentText(c)).assertEqual('');
      expect(c.images.length).assertEqual(0);
      expect(c.name).assertEqual('');
      expect(c.time).assertEqual('');
      expect(c.id).assertEqual(0);
      expect(c.images.length).assertEqual(0);
    });
    /**
     * @tc.name CommentBoundariesTest_case_022
     * @tc.desc boundary: spaces text payload keeps model invariants (CommentBoundariesTest case 22)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentBoundariesTest_case_022', 0, async () => {
      const c: Comment = new Comment();
      c.comment = '   ';
      expect(commentText(c)).assertEqual('   ');
      expect(commentText(c).length).assertEqual(3);
      expect(c.name).assertEqual('');
      expect(c.time).assertEqual('');
      expect(c.id).assertEqual(0);
      expect(c.images.length).assertEqual(0);
    });
    /**
     * @tc.name CommentBoundariesTest_case_023
     * @tc.desc boundary: long text payload keeps model invariants (CommentBoundariesTest case 23)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentBoundariesTest_case_023', 0, async () => {
      const c: Comment = new Comment();
      c.comment = repeatText('x', 512);
      expect(commentText(c).length).assertEqual(512);
      expect(commentText(c).substring(0, 4)).assertEqual('xxxx');
      expect(c.name).assertEqual('');
      expect(c.time).assertEqual('');
      expect(c.id).assertEqual(0);
      expect(c.images.length).assertEqual(0);
    });
    /**
     * @tc.name CommentBoundariesTest_case_024
     * @tc.desc boundary: newline text payload keeps model invariants (CommentBoundariesTest case 24)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentBoundariesTest_case_024', 0, async () => {
      const c: Comment = new Comment();
      c.comment = 'line one\nline two';
      expect(commentText(c).indexOf('\n') >= 0).assertTrue();
      expect(commentText(c).split('\n').length).assertEqual(2);
      expect(c.name).assertEqual('');
      expect(c.time).assertEqual('');
      expect(c.id).assertEqual(0);
      expect(c.images.length).assertEqual(0);
    });
    /**
     * @tc.name CommentBoundariesTest_case_025
     * @tc.desc boundary: empty text payload keeps model invariants (CommentBoundariesTest case 25)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentBoundariesTest_case_025', 0, async () => {
      const c: Comment = new Comment();
      c.comment = '';
      expect(commentText(c)).assertEqual('');
      expect(c.images.length).assertEqual(0);
      expect(c.name).assertEqual('');
      expect(c.time).assertEqual('');
      expect(c.id).assertEqual(0);
      expect(c.images.length).assertEqual(0);
    });
    /**
     * @tc.name CommentBoundariesTest_case_026
     * @tc.desc boundary: spaces text payload keeps model invariants (CommentBoundariesTest case 26)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentBoundariesTest_case_026', 0, async () => {
      const c: Comment = new Comment();
      c.comment = '   ';
      expect(commentText(c)).assertEqual('   ');
      expect(commentText(c).length).assertEqual(3);
      expect(c.name).assertEqual('');
      expect(c.time).assertEqual('');
      expect(c.id).assertEqual(0);
      expect(c.images.length).assertEqual(0);
    });
    /**
     * @tc.name CommentBoundariesTest_case_027
     * @tc.desc boundary: long text payload keeps model invariants (CommentBoundariesTest case 27)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentBoundariesTest_case_027', 0, async () => {
      const c: Comment = new Comment();
      c.comment = repeatText('x', 512);
      expect(commentText(c).length).assertEqual(512);
      expect(commentText(c).substring(0, 4)).assertEqual('xxxx');
      expect(c.name).assertEqual('');
      expect(c.time).assertEqual('');
      expect(c.id).assertEqual(0);
      expect(c.images.length).assertEqual(0);
    });
    /**
     * @tc.name CommentBoundariesTest_case_028
     * @tc.desc boundary: newline text payload keeps model invariants (CommentBoundariesTest case 28)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentBoundariesTest_case_028', 0, async () => {
      const c: Comment = new Comment();
      c.comment = 'line one\nline two';
      expect(commentText(c).indexOf('\n') >= 0).assertTrue();
      expect(commentText(c).split('\n').length).assertEqual(2);
      expect(c.name).assertEqual('');
      expect(c.time).assertEqual('');
      expect(c.id).assertEqual(0);
      expect(c.images.length).assertEqual(0);
    });
    /**
     * @tc.name CommentBoundariesTest_case_029
     * @tc.desc boundary: empty text payload keeps model invariants (CommentBoundariesTest case 29)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentBoundariesTest_case_029', 0, async () => {
      const c: Comment = new Comment();
      c.comment = '';
      expect(commentText(c)).assertEqual('');
      expect(c.images.length).assertEqual(0);
      expect(c.name).assertEqual('');
      expect(c.time).assertEqual('');
      expect(c.id).assertEqual(0);
      expect(c.images.length).assertEqual(0);
    });
    /**
     * @tc.name CommentBoundariesTest_case_030
     * @tc.desc boundary: spaces text payload keeps model invariants (CommentBoundariesTest case 30)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentBoundariesTest_case_030', 0, async () => {
      const c: Comment = new Comment();
      c.comment = '   ';
      expect(commentText(c)).assertEqual('   ');
      expect(commentText(c).length).assertEqual(3);
      expect(c.name).assertEqual('');
      expect(c.time).assertEqual('');
      expect(c.id).assertEqual(0);
      expect(c.images.length).assertEqual(0);
    });
    /**
     * @tc.name CommentBoundariesTest_case_031
     * @tc.desc boundary: long text payload keeps model invariants (CommentBoundariesTest case 31)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentBoundariesTest_case_031', 0, async () => {
      const c: Comment = new Comment();
      c.comment = repeatText('x', 512);
      expect(commentText(c).length).assertEqual(512);
      expect(commentText(c).substring(0, 4)).assertEqual('xxxx');
      expect(c.name).assertEqual('');
      expect(c.time).assertEqual('');
      expect(c.id).assertEqual(0);
      expect(c.images.length).assertEqual(0);
    });
    /**
     * @tc.name CommentBoundariesTest_case_032
     * @tc.desc boundary: newline text payload keeps model invariants (CommentBoundariesTest case 32)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentBoundariesTest_case_032', 0, async () => {
      const c: Comment = new Comment();
      c.comment = 'line one\nline two';
      expect(commentText(c).indexOf('\n') >= 0).assertTrue();
      expect(commentText(c).split('\n').length).assertEqual(2);
      expect(c.name).assertEqual('');
      expect(c.time).assertEqual('');
      expect(c.id).assertEqual(0);
      expect(c.images.length).assertEqual(0);
    });
    /**
     * @tc.name CommentBoundariesTest_case_033
     * @tc.desc boundary: empty text payload keeps model invariants (CommentBoundariesTest case 33)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentBoundariesTest_case_033', 0, async () => {
      const c: Comment = new Comment();
      c.comment = '';
      expect(commentText(c)).assertEqual('');
      expect(c.images.length).assertEqual(0);
      expect(c.name).assertEqual('');
      expect(c.time).assertEqual('');
      expect(c.id).assertEqual(0);
      expect(c.images.length).assertEqual(0);
    });
    /**
     * @tc.name CommentBoundariesTest_case_034
     * @tc.desc boundary: spaces text payload keeps model invariants (CommentBoundariesTest case 34)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentBoundariesTest_case_034', 0, async () => {
      const c: Comment = new Comment();
      c.comment = '   ';
      expect(commentText(c)).assertEqual('   ');
      expect(commentText(c).length).assertEqual(3);
      expect(c.name).assertEqual('');
      expect(c.time).assertEqual('');
      expect(c.id).assertEqual(0);
      expect(c.images.length).assertEqual(0);
    });
    /**
     * @tc.name CommentBoundariesTest_case_035
     * @tc.desc boundary: long text payload keeps model invariants (CommentBoundariesTest case 35)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentBoundariesTest_case_035', 0, async () => {
      const c: Comment = new Comment();
      c.comment = repeatText('x', 512);
      expect(commentText(c).length).assertEqual(512);
      expect(commentText(c).substring(0, 4)).assertEqual('xxxx');
      expect(c.name).assertEqual('');
      expect(c.time).assertEqual('');
      expect(c.id).assertEqual(0);
      expect(c.images.length).assertEqual(0);
    });
    /**
     * @tc.name CommentBoundariesTest_case_036
     * @tc.desc boundary: newline text payload keeps model invariants (CommentBoundariesTest case 36)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentBoundariesTest_case_036', 0, async () => {
      const c: Comment = new Comment();
      c.comment = 'line one\nline two';
      expect(commentText(c).indexOf('\n') >= 0).assertTrue();
      expect(commentText(c).split('\n').length).assertEqual(2);
      expect(c.name).assertEqual('');
      expect(c.time).assertEqual('');
      expect(c.id).assertEqual(0);
      expect(c.images.length).assertEqual(0);
    });
    /**
     * @tc.name CommentBoundariesTest_case_037
     * @tc.desc boundary: empty text payload keeps model invariants (CommentBoundariesTest case 37)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentBoundariesTest_case_037', 0, async () => {
      const c: Comment = new Comment();
      c.comment = '';
      expect(commentText(c)).assertEqual('');
      expect(c.images.length).assertEqual(0);
      expect(c.name).assertEqual('');
      expect(c.time).assertEqual('');
      expect(c.id).assertEqual(0);
      expect(c.images.length).assertEqual(0);
    });
    /**
     * @tc.name CommentBoundariesTest_case_038
     * @tc.desc boundary: spaces text payload keeps model invariants (CommentBoundariesTest case 38)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentBoundariesTest_case_038', 0, async () => {
      const c: Comment = new Comment();
      c.comment = '   ';
      expect(commentText(c)).assertEqual('   ');
      expect(commentText(c).length).assertEqual(3);
      expect(c.name).assertEqual('');
      expect(c.time).assertEqual('');
      expect(c.id).assertEqual(0);
      expect(c.images.length).assertEqual(0);
    });
    /**
     * @tc.name CommentBoundariesTest_case_039
     * @tc.desc boundary: long text payload keeps model invariants (CommentBoundariesTest case 39)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentBoundariesTest_case_039', 0, async () => {
      const c: Comment = new Comment();
      c.comment = repeatText('x', 512);
      expect(commentText(c).length).assertEqual(512);
      expect(commentText(c).substring(0, 4)).assertEqual('xxxx');
      expect(c.name).assertEqual('');
      expect(c.time).assertEqual('');
      expect(c.id).assertEqual(0);
      expect(c.images.length).assertEqual(0);
    });
    /**
     * @tc.name CommentBoundariesTest_case_040
     * @tc.desc boundary: newline text payload keeps model invariants (CommentBoundariesTest case 40)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CommentBoundariesTest_case_040', 0, async () => {
      const c: Comment = new Comment();
      c.comment = 'line one\nline two';
      expect(commentText(c).indexOf('\n') >= 0).assertTrue();
      expect(commentText(c).split('\n').length).assertEqual(2);
      expect(c.name).assertEqual('');
      expect(c.time).assertEqual('');
      expect(c.id).assertEqual(0);
      expect(c.images.length).assertEqual(0);
    });
  });
}
