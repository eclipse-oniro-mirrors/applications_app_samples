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

export default function TextInputStateTest(): void {
  describe('TextInputStateTest', () => {
    beforeAll(() => {
      logSuite('TextInputStateTest', 'begin');
    });
    beforeEach(async () => {
      await yieldTick();
    });
    afterAll(() => {
      logSuite('TextInputStateTest', 'end');
    });

    /**
     * @tc.name TextInputStateTest_case_001
     * @tc.desc textstate: TextInput edits update state without trimming, variant 1 (TextInputStateTest case 1)
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextInputStateTest_case_001', 0, async () => {
      const state: TextInputState = new TextInputState('');
      expect(state.length()).assertEqual(0);
      expect(state.isEmpty()).assertTrue();
      state.update('a comment');
      expect(state.value).assertEqual('a comment');
      expect(state.updates).assertEqual(1);
      expect(state.contains('comment')).assertTrue();
      expect(state.preview(4)).assertEqual('a co...');
      state.reset();
      expect(state.value).assertEqual('');
      expect(state.isEmpty()).assertTrue();
      state.update('  padded  ');
      expect(state.trimmed()).assertEqual('padded');
      expect(state.length()).assertEqual(10);
    });
    /**
     * @tc.name TextInputStateTest_case_002
     * @tc.desc textstate: TextInput edits update state without trimming, variant 2 (TextInputStateTest case 2)
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextInputStateTest_case_002', 0, async () => {
      const state: TextInputState = new TextInputState('seed text');
      expect(state.length()).assertEqual(9);
      expect(state.isEmpty()).assertFalse();
      state.update('a comment');
      expect(state.value).assertEqual('a comment');
      expect(state.updates).assertEqual(1);
      expect(state.contains('comment')).assertTrue();
      expect(state.preview(4)).assertEqual('a co...');
      state.reset();
      expect(state.value).assertEqual('');
      expect(state.isEmpty()).assertTrue();
      state.update('  padded  ');
      expect(state.trimmed()).assertEqual('padded');
      expect(state.length()).assertEqual(10);
    });
    /**
     * @tc.name TextInputStateTest_case_003
     * @tc.desc textstate: TextInput edits update state without trimming, variant 3 (TextInputStateTest case 3)
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextInputStateTest_case_003', 0, async () => {
      const state: TextInputState = new TextInputState('');
      expect(state.length()).assertEqual(0);
      expect(state.isEmpty()).assertTrue();
      state.update('a comment');
      expect(state.value).assertEqual('a comment');
      expect(state.updates).assertEqual(1);
      expect(state.contains('comment')).assertTrue();
      expect(state.preview(4)).assertEqual('a co...');
      state.reset();
      expect(state.value).assertEqual('');
      expect(state.isEmpty()).assertTrue();
      state.update('  padded  ');
      expect(state.trimmed()).assertEqual('padded');
      expect(state.length()).assertEqual(10);
    });
    /**
     * @tc.name TextInputStateTest_case_004
     * @tc.desc textstate: TextInput edits update state without trimming, variant 1 (TextInputStateTest case 4)
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextInputStateTest_case_004', 0, async () => {
      const state: TextInputState = new TextInputState('seed text');
      expect(state.length()).assertEqual(9);
      expect(state.isEmpty()).assertFalse();
      state.update('a comment');
      expect(state.value).assertEqual('a comment');
      expect(state.updates).assertEqual(1);
      expect(state.contains('comment')).assertTrue();
      expect(state.preview(4)).assertEqual('a co...');
      state.reset();
      expect(state.value).assertEqual('');
      expect(state.isEmpty()).assertTrue();
      state.update('  padded  ');
      expect(state.trimmed()).assertEqual('padded');
      expect(state.length()).assertEqual(10);
    });
    /**
     * @tc.name TextInputStateTest_case_005
     * @tc.desc textstate: TextInput edits update state without trimming, variant 2 (TextInputStateTest case 5)
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextInputStateTest_case_005', 0, async () => {
      const state: TextInputState = new TextInputState('');
      expect(state.length()).assertEqual(0);
      expect(state.isEmpty()).assertTrue();
      state.update('a comment');
      expect(state.value).assertEqual('a comment');
      expect(state.updates).assertEqual(1);
      expect(state.contains('comment')).assertTrue();
      expect(state.preview(4)).assertEqual('a co...');
      state.reset();
      expect(state.value).assertEqual('');
      expect(state.isEmpty()).assertTrue();
      state.update('  padded  ');
      expect(state.trimmed()).assertEqual('padded');
      expect(state.length()).assertEqual(10);
    });
    /**
     * @tc.name TextInputStateTest_case_006
     * @tc.desc textstate: TextInput edits update state without trimming, variant 3 (TextInputStateTest case 6)
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextInputStateTest_case_006', 0, async () => {
      const state: TextInputState = new TextInputState('seed text');
      expect(state.length()).assertEqual(9);
      expect(state.isEmpty()).assertFalse();
      state.update('a comment');
      expect(state.value).assertEqual('a comment');
      expect(state.updates).assertEqual(1);
      expect(state.contains('comment')).assertTrue();
      expect(state.preview(4)).assertEqual('a co...');
      state.reset();
      expect(state.value).assertEqual('');
      expect(state.isEmpty()).assertTrue();
      state.update('  padded  ');
      expect(state.trimmed()).assertEqual('padded');
      expect(state.length()).assertEqual(10);
    });
    /**
     * @tc.name TextInputStateTest_case_007
     * @tc.desc textstate: TextInput edits update state without trimming, variant 1 (TextInputStateTest case 7)
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextInputStateTest_case_007', 0, async () => {
      const state: TextInputState = new TextInputState('');
      expect(state.length()).assertEqual(0);
      expect(state.isEmpty()).assertTrue();
      state.update('a comment');
      expect(state.value).assertEqual('a comment');
      expect(state.updates).assertEqual(1);
      expect(state.contains('comment')).assertTrue();
      expect(state.preview(4)).assertEqual('a co...');
      state.reset();
      expect(state.value).assertEqual('');
      expect(state.isEmpty()).assertTrue();
      state.update('  padded  ');
      expect(state.trimmed()).assertEqual('padded');
      expect(state.length()).assertEqual(10);
    });
    /**
     * @tc.name TextInputStateTest_case_008
     * @tc.desc textstate: TextInput edits update state without trimming, variant 2 (TextInputStateTest case 8)
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextInputStateTest_case_008', 0, async () => {
      const state: TextInputState = new TextInputState('seed text');
      expect(state.length()).assertEqual(9);
      expect(state.isEmpty()).assertFalse();
      state.update('a comment');
      expect(state.value).assertEqual('a comment');
      expect(state.updates).assertEqual(1);
      expect(state.contains('comment')).assertTrue();
      expect(state.preview(4)).assertEqual('a co...');
      state.reset();
      expect(state.value).assertEqual('');
      expect(state.isEmpty()).assertTrue();
      state.update('  padded  ');
      expect(state.trimmed()).assertEqual('padded');
      expect(state.length()).assertEqual(10);
    });
    /**
     * @tc.name TextInputStateTest_case_009
     * @tc.desc textstate: TextInput edits update state without trimming, variant 3 (TextInputStateTest case 9)
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextInputStateTest_case_009', 0, async () => {
      const state: TextInputState = new TextInputState('');
      expect(state.length()).assertEqual(0);
      expect(state.isEmpty()).assertTrue();
      state.update('a comment');
      expect(state.value).assertEqual('a comment');
      expect(state.updates).assertEqual(1);
      expect(state.contains('comment')).assertTrue();
      expect(state.preview(4)).assertEqual('a co...');
      state.reset();
      expect(state.value).assertEqual('');
      expect(state.isEmpty()).assertTrue();
      state.update('  padded  ');
      expect(state.trimmed()).assertEqual('padded');
      expect(state.length()).assertEqual(10);
    });
    /**
     * @tc.name TextInputStateTest_case_010
     * @tc.desc textstate: TextInput edits update state without trimming, variant 1 (TextInputStateTest case 10)
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextInputStateTest_case_010', 0, async () => {
      const state: TextInputState = new TextInputState('seed text');
      expect(state.length()).assertEqual(9);
      expect(state.isEmpty()).assertFalse();
      state.update('a comment');
      expect(state.value).assertEqual('a comment');
      expect(state.updates).assertEqual(1);
      expect(state.contains('comment')).assertTrue();
      expect(state.preview(4)).assertEqual('a co...');
      state.reset();
      expect(state.value).assertEqual('');
      expect(state.isEmpty()).assertTrue();
      state.update('  padded  ');
      expect(state.trimmed()).assertEqual('padded');
      expect(state.length()).assertEqual(10);
    });
    /**
     * @tc.name TextInputStateTest_case_011
     * @tc.desc textstate: TextInput edits update state without trimming, variant 2 (TextInputStateTest case 11)
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextInputStateTest_case_011', 0, async () => {
      const state: TextInputState = new TextInputState('');
      expect(state.length()).assertEqual(0);
      expect(state.isEmpty()).assertTrue();
      state.update('a comment');
      expect(state.value).assertEqual('a comment');
      expect(state.updates).assertEqual(1);
      expect(state.contains('comment')).assertTrue();
      expect(state.preview(4)).assertEqual('a co...');
      state.reset();
      expect(state.value).assertEqual('');
      expect(state.isEmpty()).assertTrue();
      state.update('  padded  ');
      expect(state.trimmed()).assertEqual('padded');
      expect(state.length()).assertEqual(10);
    });
    /**
     * @tc.name TextInputStateTest_case_012
     * @tc.desc textstate: TextInput edits update state without trimming, variant 3 (TextInputStateTest case 12)
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextInputStateTest_case_012', 0, async () => {
      const state: TextInputState = new TextInputState('seed text');
      expect(state.length()).assertEqual(9);
      expect(state.isEmpty()).assertFalse();
      state.update('a comment');
      expect(state.value).assertEqual('a comment');
      expect(state.updates).assertEqual(1);
      expect(state.contains('comment')).assertTrue();
      expect(state.preview(4)).assertEqual('a co...');
      state.reset();
      expect(state.value).assertEqual('');
      expect(state.isEmpty()).assertTrue();
      state.update('  padded  ');
      expect(state.trimmed()).assertEqual('padded');
      expect(state.length()).assertEqual(10);
    });
    /**
     * @tc.name TextInputStateTest_case_013
     * @tc.desc textstate: TextInput edits update state without trimming, variant 1 (TextInputStateTest case 13)
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextInputStateTest_case_013', 0, async () => {
      const state: TextInputState = new TextInputState('');
      expect(state.length()).assertEqual(0);
      expect(state.isEmpty()).assertTrue();
      state.update('a comment');
      expect(state.value).assertEqual('a comment');
      expect(state.updates).assertEqual(1);
      expect(state.contains('comment')).assertTrue();
      expect(state.preview(4)).assertEqual('a co...');
      state.reset();
      expect(state.value).assertEqual('');
      expect(state.isEmpty()).assertTrue();
      state.update('  padded  ');
      expect(state.trimmed()).assertEqual('padded');
      expect(state.length()).assertEqual(10);
    });
    /**
     * @tc.name TextInputStateTest_case_014
     * @tc.desc textstate: TextInput edits update state without trimming, variant 2 (TextInputStateTest case 14)
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextInputStateTest_case_014', 0, async () => {
      const state: TextInputState = new TextInputState('seed text');
      expect(state.length()).assertEqual(9);
      expect(state.isEmpty()).assertFalse();
      state.update('a comment');
      expect(state.value).assertEqual('a comment');
      expect(state.updates).assertEqual(1);
      expect(state.contains('comment')).assertTrue();
      expect(state.preview(4)).assertEqual('a co...');
      state.reset();
      expect(state.value).assertEqual('');
      expect(state.isEmpty()).assertTrue();
      state.update('  padded  ');
      expect(state.trimmed()).assertEqual('padded');
      expect(state.length()).assertEqual(10);
    });
    /**
     * @tc.name TextInputStateTest_case_015
     * @tc.desc textstate: TextInput edits update state without trimming, variant 3 (TextInputStateTest case 15)
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextInputStateTest_case_015', 0, async () => {
      const state: TextInputState = new TextInputState('');
      expect(state.length()).assertEqual(0);
      expect(state.isEmpty()).assertTrue();
      state.update('a comment');
      expect(state.value).assertEqual('a comment');
      expect(state.updates).assertEqual(1);
      expect(state.contains('comment')).assertTrue();
      expect(state.preview(4)).assertEqual('a co...');
      state.reset();
      expect(state.value).assertEqual('');
      expect(state.isEmpty()).assertTrue();
      state.update('  padded  ');
      expect(state.trimmed()).assertEqual('padded');
      expect(state.length()).assertEqual(10);
    });
    /**
     * @tc.name TextInputStateTest_case_016
     * @tc.desc textstate: TextInput edits update state without trimming, variant 1 (TextInputStateTest case 16)
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextInputStateTest_case_016', 0, async () => {
      const state: TextInputState = new TextInputState('seed text');
      expect(state.length()).assertEqual(9);
      expect(state.isEmpty()).assertFalse();
      state.update('a comment');
      expect(state.value).assertEqual('a comment');
      expect(state.updates).assertEqual(1);
      expect(state.contains('comment')).assertTrue();
      expect(state.preview(4)).assertEqual('a co...');
      state.reset();
      expect(state.value).assertEqual('');
      expect(state.isEmpty()).assertTrue();
      state.update('  padded  ');
      expect(state.trimmed()).assertEqual('padded');
      expect(state.length()).assertEqual(10);
    });
    /**
     * @tc.name TextInputStateTest_case_017
     * @tc.desc textstate: TextInput edits update state without trimming, variant 2 (TextInputStateTest case 17)
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextInputStateTest_case_017', 0, async () => {
      const state: TextInputState = new TextInputState('');
      expect(state.length()).assertEqual(0);
      expect(state.isEmpty()).assertTrue();
      state.update('a comment');
      expect(state.value).assertEqual('a comment');
      expect(state.updates).assertEqual(1);
      expect(state.contains('comment')).assertTrue();
      expect(state.preview(4)).assertEqual('a co...');
      state.reset();
      expect(state.value).assertEqual('');
      expect(state.isEmpty()).assertTrue();
      state.update('  padded  ');
      expect(state.trimmed()).assertEqual('padded');
      expect(state.length()).assertEqual(10);
    });
    /**
     * @tc.name TextInputStateTest_case_018
     * @tc.desc textstate: TextInput edits update state without trimming, variant 3 (TextInputStateTest case 18)
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextInputStateTest_case_018', 0, async () => {
      const state: TextInputState = new TextInputState('seed text');
      expect(state.length()).assertEqual(9);
      expect(state.isEmpty()).assertFalse();
      state.update('a comment');
      expect(state.value).assertEqual('a comment');
      expect(state.updates).assertEqual(1);
      expect(state.contains('comment')).assertTrue();
      expect(state.preview(4)).assertEqual('a co...');
      state.reset();
      expect(state.value).assertEqual('');
      expect(state.isEmpty()).assertTrue();
      state.update('  padded  ');
      expect(state.trimmed()).assertEqual('padded');
      expect(state.length()).assertEqual(10);
    });
    /**
     * @tc.name TextInputStateTest_case_019
     * @tc.desc textstate: TextInput edits update state without trimming, variant 1 (TextInputStateTest case 19)
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextInputStateTest_case_019', 0, async () => {
      const state: TextInputState = new TextInputState('');
      expect(state.length()).assertEqual(0);
      expect(state.isEmpty()).assertTrue();
      state.update('a comment');
      expect(state.value).assertEqual('a comment');
      expect(state.updates).assertEqual(1);
      expect(state.contains('comment')).assertTrue();
      expect(state.preview(4)).assertEqual('a co...');
      state.reset();
      expect(state.value).assertEqual('');
      expect(state.isEmpty()).assertTrue();
      state.update('  padded  ');
      expect(state.trimmed()).assertEqual('padded');
      expect(state.length()).assertEqual(10);
    });
    /**
     * @tc.name TextInputStateTest_case_020
     * @tc.desc textstate: TextInput edits update state without trimming, variant 2 (TextInputStateTest case 20)
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextInputStateTest_case_020', 0, async () => {
      const state: TextInputState = new TextInputState('seed text');
      expect(state.length()).assertEqual(9);
      expect(state.isEmpty()).assertFalse();
      state.update('a comment');
      expect(state.value).assertEqual('a comment');
      expect(state.updates).assertEqual(1);
      expect(state.contains('comment')).assertTrue();
      expect(state.preview(4)).assertEqual('a co...');
      state.reset();
      expect(state.value).assertEqual('');
      expect(state.isEmpty()).assertTrue();
      state.update('  padded  ');
      expect(state.trimmed()).assertEqual('padded');
      expect(state.length()).assertEqual(10);
    });
    /**
     * @tc.name TextInputStateTest_case_021
     * @tc.desc textstate: TextInput edits update state without trimming, variant 3 (TextInputStateTest case 21)
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextInputStateTest_case_021', 0, async () => {
      const state: TextInputState = new TextInputState('');
      expect(state.length()).assertEqual(0);
      expect(state.isEmpty()).assertTrue();
      state.update('a comment');
      expect(state.value).assertEqual('a comment');
      expect(state.updates).assertEqual(1);
      expect(state.contains('comment')).assertTrue();
      expect(state.preview(4)).assertEqual('a co...');
      state.reset();
      expect(state.value).assertEqual('');
      expect(state.isEmpty()).assertTrue();
      state.update('  padded  ');
      expect(state.trimmed()).assertEqual('padded');
      expect(state.length()).assertEqual(10);
    });
    /**
     * @tc.name TextInputStateTest_case_022
     * @tc.desc textstate: TextInput edits update state without trimming, variant 1 (TextInputStateTest case 22)
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextInputStateTest_case_022', 0, async () => {
      const state: TextInputState = new TextInputState('seed text');
      expect(state.length()).assertEqual(9);
      expect(state.isEmpty()).assertFalse();
      state.update('a comment');
      expect(state.value).assertEqual('a comment');
      expect(state.updates).assertEqual(1);
      expect(state.contains('comment')).assertTrue();
      expect(state.preview(4)).assertEqual('a co...');
      state.reset();
      expect(state.value).assertEqual('');
      expect(state.isEmpty()).assertTrue();
      state.update('  padded  ');
      expect(state.trimmed()).assertEqual('padded');
      expect(state.length()).assertEqual(10);
    });
    /**
     * @tc.name TextInputStateTest_case_023
     * @tc.desc textstate: TextInput edits update state without trimming, variant 2 (TextInputStateTest case 23)
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextInputStateTest_case_023', 0, async () => {
      const state: TextInputState = new TextInputState('');
      expect(state.length()).assertEqual(0);
      expect(state.isEmpty()).assertTrue();
      state.update('a comment');
      expect(state.value).assertEqual('a comment');
      expect(state.updates).assertEqual(1);
      expect(state.contains('comment')).assertTrue();
      expect(state.preview(4)).assertEqual('a co...');
      state.reset();
      expect(state.value).assertEqual('');
      expect(state.isEmpty()).assertTrue();
      state.update('  padded  ');
      expect(state.trimmed()).assertEqual('padded');
      expect(state.length()).assertEqual(10);
    });
    /**
     * @tc.name TextInputStateTest_case_024
     * @tc.desc textstate: TextInput edits update state without trimming, variant 3 (TextInputStateTest case 24)
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextInputStateTest_case_024', 0, async () => {
      const state: TextInputState = new TextInputState('seed text');
      expect(state.length()).assertEqual(9);
      expect(state.isEmpty()).assertFalse();
      state.update('a comment');
      expect(state.value).assertEqual('a comment');
      expect(state.updates).assertEqual(1);
      expect(state.contains('comment')).assertTrue();
      expect(state.preview(4)).assertEqual('a co...');
      state.reset();
      expect(state.value).assertEqual('');
      expect(state.isEmpty()).assertTrue();
      state.update('  padded  ');
      expect(state.trimmed()).assertEqual('padded');
      expect(state.length()).assertEqual(10);
    });
    /**
     * @tc.name TextInputStateTest_case_025
     * @tc.desc textstate: TextInput edits update state without trimming, variant 1 (TextInputStateTest case 25)
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextInputStateTest_case_025', 0, async () => {
      const state: TextInputState = new TextInputState('');
      expect(state.length()).assertEqual(0);
      expect(state.isEmpty()).assertTrue();
      state.update('a comment');
      expect(state.value).assertEqual('a comment');
      expect(state.updates).assertEqual(1);
      expect(state.contains('comment')).assertTrue();
      expect(state.preview(4)).assertEqual('a co...');
      state.reset();
      expect(state.value).assertEqual('');
      expect(state.isEmpty()).assertTrue();
      state.update('  padded  ');
      expect(state.trimmed()).assertEqual('padded');
      expect(state.length()).assertEqual(10);
    });
    /**
     * @tc.name TextInputStateTest_case_026
     * @tc.desc textstate: TextInput edits update state without trimming, variant 2 (TextInputStateTest case 26)
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextInputStateTest_case_026', 0, async () => {
      const state: TextInputState = new TextInputState('seed text');
      expect(state.length()).assertEqual(9);
      expect(state.isEmpty()).assertFalse();
      state.update('a comment');
      expect(state.value).assertEqual('a comment');
      expect(state.updates).assertEqual(1);
      expect(state.contains('comment')).assertTrue();
      expect(state.preview(4)).assertEqual('a co...');
      state.reset();
      expect(state.value).assertEqual('');
      expect(state.isEmpty()).assertTrue();
      state.update('  padded  ');
      expect(state.trimmed()).assertEqual('padded');
      expect(state.length()).assertEqual(10);
    });
    /**
     * @tc.name TextInputStateTest_case_027
     * @tc.desc textstate: TextInput edits update state without trimming, variant 3 (TextInputStateTest case 27)
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextInputStateTest_case_027', 0, async () => {
      const state: TextInputState = new TextInputState('');
      expect(state.length()).assertEqual(0);
      expect(state.isEmpty()).assertTrue();
      state.update('a comment');
      expect(state.value).assertEqual('a comment');
      expect(state.updates).assertEqual(1);
      expect(state.contains('comment')).assertTrue();
      expect(state.preview(4)).assertEqual('a co...');
      state.reset();
      expect(state.value).assertEqual('');
      expect(state.isEmpty()).assertTrue();
      state.update('  padded  ');
      expect(state.trimmed()).assertEqual('padded');
      expect(state.length()).assertEqual(10);
    });
    /**
     * @tc.name TextInputStateTest_case_028
     * @tc.desc textstate: TextInput edits update state without trimming, variant 1 (TextInputStateTest case 28)
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextInputStateTest_case_028', 0, async () => {
      const state: TextInputState = new TextInputState('seed text');
      expect(state.length()).assertEqual(9);
      expect(state.isEmpty()).assertFalse();
      state.update('a comment');
      expect(state.value).assertEqual('a comment');
      expect(state.updates).assertEqual(1);
      expect(state.contains('comment')).assertTrue();
      expect(state.preview(4)).assertEqual('a co...');
      state.reset();
      expect(state.value).assertEqual('');
      expect(state.isEmpty()).assertTrue();
      state.update('  padded  ');
      expect(state.trimmed()).assertEqual('padded');
      expect(state.length()).assertEqual(10);
    });
    /**
     * @tc.name TextInputStateTest_case_029
     * @tc.desc textstate: TextInput edits update state without trimming, variant 2 (TextInputStateTest case 29)
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextInputStateTest_case_029', 0, async () => {
      const state: TextInputState = new TextInputState('');
      expect(state.length()).assertEqual(0);
      expect(state.isEmpty()).assertTrue();
      state.update('a comment');
      expect(state.value).assertEqual('a comment');
      expect(state.updates).assertEqual(1);
      expect(state.contains('comment')).assertTrue();
      expect(state.preview(4)).assertEqual('a co...');
      state.reset();
      expect(state.value).assertEqual('');
      expect(state.isEmpty()).assertTrue();
      state.update('  padded  ');
      expect(state.trimmed()).assertEqual('padded');
      expect(state.length()).assertEqual(10);
    });
    /**
     * @tc.name TextInputStateTest_case_030
     * @tc.desc textstate: TextInput edits update state without trimming, variant 3 (TextInputStateTest case 30)
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextInputStateTest_case_030', 0, async () => {
      const state: TextInputState = new TextInputState('seed text');
      expect(state.length()).assertEqual(9);
      expect(state.isEmpty()).assertFalse();
      state.update('a comment');
      expect(state.value).assertEqual('a comment');
      expect(state.updates).assertEqual(1);
      expect(state.contains('comment')).assertTrue();
      expect(state.preview(4)).assertEqual('a co...');
      state.reset();
      expect(state.value).assertEqual('');
      expect(state.isEmpty()).assertTrue();
      state.update('  padded  ');
      expect(state.trimmed()).assertEqual('padded');
      expect(state.length()).assertEqual(10);
    });
    /**
     * @tc.name TextInputStateTest_case_031
     * @tc.desc textstate: TextInput edits update state without trimming, variant 1 (TextInputStateTest case 31)
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextInputStateTest_case_031', 0, async () => {
      const state: TextInputState = new TextInputState('');
      expect(state.length()).assertEqual(0);
      expect(state.isEmpty()).assertTrue();
      state.update('a comment');
      expect(state.value).assertEqual('a comment');
      expect(state.updates).assertEqual(1);
      expect(state.contains('comment')).assertTrue();
      expect(state.preview(4)).assertEqual('a co...');
      state.reset();
      expect(state.value).assertEqual('');
      expect(state.isEmpty()).assertTrue();
      state.update('  padded  ');
      expect(state.trimmed()).assertEqual('padded');
      expect(state.length()).assertEqual(10);
    });
    /**
     * @tc.name TextInputStateTest_case_032
     * @tc.desc textstate: TextInput edits update state without trimming, variant 2 (TextInputStateTest case 32)
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextInputStateTest_case_032', 0, async () => {
      const state: TextInputState = new TextInputState('seed text');
      expect(state.length()).assertEqual(9);
      expect(state.isEmpty()).assertFalse();
      state.update('a comment');
      expect(state.value).assertEqual('a comment');
      expect(state.updates).assertEqual(1);
      expect(state.contains('comment')).assertTrue();
      expect(state.preview(4)).assertEqual('a co...');
      state.reset();
      expect(state.value).assertEqual('');
      expect(state.isEmpty()).assertTrue();
      state.update('  padded  ');
      expect(state.trimmed()).assertEqual('padded');
      expect(state.length()).assertEqual(10);
    });
    /**
     * @tc.name TextInputStateTest_case_033
     * @tc.desc textstate: TextInput edits update state without trimming, variant 3 (TextInputStateTest case 33)
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextInputStateTest_case_033', 0, async () => {
      const state: TextInputState = new TextInputState('');
      expect(state.length()).assertEqual(0);
      expect(state.isEmpty()).assertTrue();
      state.update('a comment');
      expect(state.value).assertEqual('a comment');
      expect(state.updates).assertEqual(1);
      expect(state.contains('comment')).assertTrue();
      expect(state.preview(4)).assertEqual('a co...');
      state.reset();
      expect(state.value).assertEqual('');
      expect(state.isEmpty()).assertTrue();
      state.update('  padded  ');
      expect(state.trimmed()).assertEqual('padded');
      expect(state.length()).assertEqual(10);
    });
    /**
     * @tc.name TextInputStateTest_case_034
     * @tc.desc textstate: TextInput edits update state without trimming, variant 1 (TextInputStateTest case 34)
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextInputStateTest_case_034', 0, async () => {
      const state: TextInputState = new TextInputState('seed text');
      expect(state.length()).assertEqual(9);
      expect(state.isEmpty()).assertFalse();
      state.update('a comment');
      expect(state.value).assertEqual('a comment');
      expect(state.updates).assertEqual(1);
      expect(state.contains('comment')).assertTrue();
      expect(state.preview(4)).assertEqual('a co...');
      state.reset();
      expect(state.value).assertEqual('');
      expect(state.isEmpty()).assertTrue();
      state.update('  padded  ');
      expect(state.trimmed()).assertEqual('padded');
      expect(state.length()).assertEqual(10);
    });
    /**
     * @tc.name TextInputStateTest_case_035
     * @tc.desc textstate: TextInput edits update state without trimming, variant 2 (TextInputStateTest case 35)
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextInputStateTest_case_035', 0, async () => {
      const state: TextInputState = new TextInputState('');
      expect(state.length()).assertEqual(0);
      expect(state.isEmpty()).assertTrue();
      state.update('a comment');
      expect(state.value).assertEqual('a comment');
      expect(state.updates).assertEqual(1);
      expect(state.contains('comment')).assertTrue();
      expect(state.preview(4)).assertEqual('a co...');
      state.reset();
      expect(state.value).assertEqual('');
      expect(state.isEmpty()).assertTrue();
      state.update('  padded  ');
      expect(state.trimmed()).assertEqual('padded');
      expect(state.length()).assertEqual(10);
    });
    /**
     * @tc.name TextInputStateTest_case_036
     * @tc.desc textstate: TextInput edits update state without trimming, variant 3 (TextInputStateTest case 36)
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextInputStateTest_case_036', 0, async () => {
      const state: TextInputState = new TextInputState('seed text');
      expect(state.length()).assertEqual(9);
      expect(state.isEmpty()).assertFalse();
      state.update('a comment');
      expect(state.value).assertEqual('a comment');
      expect(state.updates).assertEqual(1);
      expect(state.contains('comment')).assertTrue();
      expect(state.preview(4)).assertEqual('a co...');
      state.reset();
      expect(state.value).assertEqual('');
      expect(state.isEmpty()).assertTrue();
      state.update('  padded  ');
      expect(state.trimmed()).assertEqual('padded');
      expect(state.length()).assertEqual(10);
    });
    /**
     * @tc.name TextInputStateTest_case_037
     * @tc.desc textstate: TextInput edits update state without trimming, variant 1 (TextInputStateTest case 37)
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextInputStateTest_case_037', 0, async () => {
      const state: TextInputState = new TextInputState('');
      expect(state.length()).assertEqual(0);
      expect(state.isEmpty()).assertTrue();
      state.update('a comment');
      expect(state.value).assertEqual('a comment');
      expect(state.updates).assertEqual(1);
      expect(state.contains('comment')).assertTrue();
      expect(state.preview(4)).assertEqual('a co...');
      state.reset();
      expect(state.value).assertEqual('');
      expect(state.isEmpty()).assertTrue();
      state.update('  padded  ');
      expect(state.trimmed()).assertEqual('padded');
      expect(state.length()).assertEqual(10);
    });
    /**
     * @tc.name TextInputStateTest_case_038
     * @tc.desc textstate: TextInput edits update state without trimming, variant 2 (TextInputStateTest case 38)
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextInputStateTest_case_038', 0, async () => {
      const state: TextInputState = new TextInputState('seed text');
      expect(state.length()).assertEqual(9);
      expect(state.isEmpty()).assertFalse();
      state.update('a comment');
      expect(state.value).assertEqual('a comment');
      expect(state.updates).assertEqual(1);
      expect(state.contains('comment')).assertTrue();
      expect(state.preview(4)).assertEqual('a co...');
      state.reset();
      expect(state.value).assertEqual('');
      expect(state.isEmpty()).assertTrue();
      state.update('  padded  ');
      expect(state.trimmed()).assertEqual('padded');
      expect(state.length()).assertEqual(10);
    });
    /**
     * @tc.name TextInputStateTest_case_039
     * @tc.desc textstate: TextInput edits update state without trimming, variant 3 (TextInputStateTest case 39)
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextInputStateTest_case_039', 0, async () => {
      const state: TextInputState = new TextInputState('');
      expect(state.length()).assertEqual(0);
      expect(state.isEmpty()).assertTrue();
      state.update('a comment');
      expect(state.value).assertEqual('a comment');
      expect(state.updates).assertEqual(1);
      expect(state.contains('comment')).assertTrue();
      expect(state.preview(4)).assertEqual('a co...');
      state.reset();
      expect(state.value).assertEqual('');
      expect(state.isEmpty()).assertTrue();
      state.update('  padded  ');
      expect(state.trimmed()).assertEqual('padded');
      expect(state.length()).assertEqual(10);
    });
    /**
     * @tc.name TextInputStateTest_case_040
     * @tc.desc textstate: TextInput edits update state without trimming, variant 1 (TextInputStateTest case 40)
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextInputStateTest_case_040', 0, async () => {
      const state: TextInputState = new TextInputState('seed text');
      expect(state.length()).assertEqual(9);
      expect(state.isEmpty()).assertFalse();
      state.update('a comment');
      expect(state.value).assertEqual('a comment');
      expect(state.updates).assertEqual(1);
      expect(state.contains('comment')).assertTrue();
      expect(state.preview(4)).assertEqual('a co...');
      state.reset();
      expect(state.value).assertEqual('');
      expect(state.isEmpty()).assertTrue();
      state.update('  padded  ');
      expect(state.trimmed()).assertEqual('padded');
      expect(state.length()).assertEqual(10);
    });
    /**
     * @tc.name TextInputStateTest_case_041
     * @tc.desc textstate: TextInput edits update state without trimming, variant 2 (TextInputStateTest case 41)
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextInputStateTest_case_041', 0, async () => {
      const state: TextInputState = new TextInputState('');
      expect(state.length()).assertEqual(0);
      expect(state.isEmpty()).assertTrue();
      state.update('a comment');
      expect(state.value).assertEqual('a comment');
      expect(state.updates).assertEqual(1);
      expect(state.contains('comment')).assertTrue();
      expect(state.preview(4)).assertEqual('a co...');
      state.reset();
      expect(state.value).assertEqual('');
      expect(state.isEmpty()).assertTrue();
      state.update('  padded  ');
      expect(state.trimmed()).assertEqual('padded');
      expect(state.length()).assertEqual(10);
    });
    /**
     * @tc.name TextInputStateTest_case_042
     * @tc.desc textstate: TextInput edits update state without trimming, variant 3 (TextInputStateTest case 42)
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextInputStateTest_case_042', 0, async () => {
      const state: TextInputState = new TextInputState('seed text');
      expect(state.length()).assertEqual(9);
      expect(state.isEmpty()).assertFalse();
      state.update('a comment');
      expect(state.value).assertEqual('a comment');
      expect(state.updates).assertEqual(1);
      expect(state.contains('comment')).assertTrue();
      expect(state.preview(4)).assertEqual('a co...');
      state.reset();
      expect(state.value).assertEqual('');
      expect(state.isEmpty()).assertTrue();
      state.update('  padded  ');
      expect(state.trimmed()).assertEqual('padded');
      expect(state.length()).assertEqual(10);
    });
    /**
     * @tc.name TextInputStateTest_case_043
     * @tc.desc textstate: TextInput edits update state without trimming, variant 1 (TextInputStateTest case 43)
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextInputStateTest_case_043', 0, async () => {
      const state: TextInputState = new TextInputState('');
      expect(state.length()).assertEqual(0);
      expect(state.isEmpty()).assertTrue();
      state.update('a comment');
      expect(state.value).assertEqual('a comment');
      expect(state.updates).assertEqual(1);
      expect(state.contains('comment')).assertTrue();
      expect(state.preview(4)).assertEqual('a co...');
      state.reset();
      expect(state.value).assertEqual('');
      expect(state.isEmpty()).assertTrue();
      state.update('  padded  ');
      expect(state.trimmed()).assertEqual('padded');
      expect(state.length()).assertEqual(10);
    });
    /**
     * @tc.name TextInputStateTest_case_044
     * @tc.desc textstate: TextInput edits update state without trimming, variant 2 (TextInputStateTest case 44)
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextInputStateTest_case_044', 0, async () => {
      const state: TextInputState = new TextInputState('seed text');
      expect(state.length()).assertEqual(9);
      expect(state.isEmpty()).assertFalse();
      state.update('a comment');
      expect(state.value).assertEqual('a comment');
      expect(state.updates).assertEqual(1);
      expect(state.contains('comment')).assertTrue();
      expect(state.preview(4)).assertEqual('a co...');
      state.reset();
      expect(state.value).assertEqual('');
      expect(state.isEmpty()).assertTrue();
      state.update('  padded  ');
      expect(state.trimmed()).assertEqual('padded');
      expect(state.length()).assertEqual(10);
    });
    /**
     * @tc.name TextInputStateTest_case_045
     * @tc.desc textstate: TextInput edits update state without trimming, variant 3 (TextInputStateTest case 45)
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextInputStateTest_case_045', 0, async () => {
      const state: TextInputState = new TextInputState('');
      expect(state.length()).assertEqual(0);
      expect(state.isEmpty()).assertTrue();
      state.update('a comment');
      expect(state.value).assertEqual('a comment');
      expect(state.updates).assertEqual(1);
      expect(state.contains('comment')).assertTrue();
      expect(state.preview(4)).assertEqual('a co...');
      state.reset();
      expect(state.value).assertEqual('');
      expect(state.isEmpty()).assertTrue();
      state.update('  padded  ');
      expect(state.trimmed()).assertEqual('padded');
      expect(state.length()).assertEqual(10);
    });
  });
}
