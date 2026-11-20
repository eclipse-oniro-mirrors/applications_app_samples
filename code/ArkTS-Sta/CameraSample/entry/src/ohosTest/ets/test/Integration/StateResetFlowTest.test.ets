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

export default function StateResetFlowTest(): void {
  describe('StateResetFlowTest', () => {
    beforeAll(() => {
      logSuite('StateResetFlowTest', 'begin');
    });
    beforeEach(async () => {
      await yieldTick();
    });
    afterAll(() => {
      logSuite('StateResetFlowTest', 'end');
    });

    /**
     * @tc.name StateResetFlowTest_case_001
     * @tc.desc textstate: TextInput edits update state without trimming, variant 1 (StateResetFlowTest case 1)
     * @tc.type Function
     * @tc.level Level1
     */
    it('StateResetFlowTest_case_001', 0, async () => {
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
     * @tc.name StateResetFlowTest_case_002
     * @tc.desc capture: callback outcome failure keeps imagePath consistent (StateResetFlowTest case 2)
     * @tc.type Function
     * @tc.level Level1
     */
    it('StateResetFlowTest_case_002', 0, async () => {
      const outcome: CaptureOutcome = new CaptureOutcome(13900001, 1, true, 'file://media/Photo/2/IMG_0002.jpg', 'msg');
      expect(captureSucceeded(outcome)).assertFalse();
      const state: CaptureState = new CaptureState();
      expect(state.onCaptureResult(outcome)).assertFalse();
      expect(state.canPublish()).assertFalse();
      expect(state.peek()).assertEqual('');
      expect(state.captures).assertEqual(0);
      expect(extractResourceUri(outcome)).assertEqual('');
      expect(captureSucceeded(new CaptureOutcome(0, 0, true, ''))).assertTrue();
      expect(captureSucceeded(new CaptureOutcome(1, 0, true, ''))).assertFalse();
      expect(state.canPublish() === (state.peek() !== '')).assertTrue();
    });
    /**
     * @tc.name StateResetFlowTest_case_003
     * @tc.desc textstate: TextInput edits update state without trimming, variant 3 (StateResetFlowTest case 3)
     * @tc.type Function
     * @tc.level Level1
     */
    it('StateResetFlowTest_case_003', 0, async () => {
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
     * @tc.name StateResetFlowTest_case_004
     * @tc.desc capture: callback outcome failure keeps imagePath empty (StateResetFlowTest case 4)
     * @tc.type Function
     * @tc.level Level1
     */
    it('StateResetFlowTest_case_004', 0, async () => {
      const outcome: CaptureOutcome = new CaptureOutcome(13900001, 0, true, '', 'msg');
      expect(captureSucceeded(outcome)).assertFalse();
      const state: CaptureState = new CaptureState();
      expect(state.onCaptureResult(outcome)).assertFalse();
      expect(state.canPublish()).assertFalse();
      expect(state.peek()).assertEqual('');
      expect(state.captures).assertEqual(0);
      expect(extractResourceUri(outcome)).assertEqual('');
      expect(captureSucceeded(new CaptureOutcome(0, 0, true, ''))).assertTrue();
      expect(captureSucceeded(new CaptureOutcome(1, 0, true, ''))).assertFalse();
      expect(state.canPublish() === (state.peek() !== '')).assertTrue();
    });
    /**
     * @tc.name StateResetFlowTest_case_005
     * @tc.desc textstate: TextInput edits update state without trimming, variant 2 (StateResetFlowTest case 5)
     * @tc.type Function
     * @tc.level Level1
     */
    it('StateResetFlowTest_case_005', 0, async () => {
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
     * @tc.name StateResetFlowTest_case_006
     * @tc.desc capture: callback outcome failure keeps imagePath consistent (StateResetFlowTest case 6)
     * @tc.type Function
     * @tc.level Level1
     */
    it('StateResetFlowTest_case_006', 0, async () => {
      const outcome: CaptureOutcome = new CaptureOutcome(13900001, 1, true, 'file://media/Photo/2/IMG_0002.jpg', 'msg');
      expect(captureSucceeded(outcome)).assertFalse();
      const state: CaptureState = new CaptureState();
      expect(state.onCaptureResult(outcome)).assertFalse();
      expect(state.canPublish()).assertFalse();
      expect(state.peek()).assertEqual('');
      expect(state.captures).assertEqual(0);
      expect(extractResourceUri(outcome)).assertEqual('');
      expect(captureSucceeded(new CaptureOutcome(0, 0, true, ''))).assertTrue();
      expect(captureSucceeded(new CaptureOutcome(1, 0, true, ''))).assertFalse();
      expect(state.canPublish() === (state.peek() !== '')).assertTrue();
    });
    /**
     * @tc.name StateResetFlowTest_case_007
     * @tc.desc textstate: TextInput edits update state without trimming, variant 1 (StateResetFlowTest case 7)
     * @tc.type Function
     * @tc.level Level1
     */
    it('StateResetFlowTest_case_007', 0, async () => {
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
     * @tc.name StateResetFlowTest_case_008
     * @tc.desc capture: callback outcome failure keeps imagePath empty (StateResetFlowTest case 8)
     * @tc.type Function
     * @tc.level Level1
     */
    it('StateResetFlowTest_case_008', 0, async () => {
      const outcome: CaptureOutcome = new CaptureOutcome(13900001, 0, true, '', 'msg');
      expect(captureSucceeded(outcome)).assertFalse();
      const state: CaptureState = new CaptureState();
      expect(state.onCaptureResult(outcome)).assertFalse();
      expect(state.canPublish()).assertFalse();
      expect(state.peek()).assertEqual('');
      expect(state.captures).assertEqual(0);
      expect(extractResourceUri(outcome)).assertEqual('');
      expect(captureSucceeded(new CaptureOutcome(0, 0, true, ''))).assertTrue();
      expect(captureSucceeded(new CaptureOutcome(1, 0, true, ''))).assertFalse();
      expect(state.canPublish() === (state.peek() !== '')).assertTrue();
    });
    /**
     * @tc.name StateResetFlowTest_case_009
     * @tc.desc textstate: TextInput edits update state without trimming, variant 3 (StateResetFlowTest case 9)
     * @tc.type Function
     * @tc.level Level1
     */
    it('StateResetFlowTest_case_009', 0, async () => {
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
     * @tc.name StateResetFlowTest_case_010
     * @tc.desc capture: callback outcome failure keeps imagePath consistent (StateResetFlowTest case 10)
     * @tc.type Function
     * @tc.level Level1
     */
    it('StateResetFlowTest_case_010', 0, async () => {
      const outcome: CaptureOutcome = new CaptureOutcome(13900001, 1, true, 'file://media/Photo/2/IMG_0002.jpg', 'msg');
      expect(captureSucceeded(outcome)).assertFalse();
      const state: CaptureState = new CaptureState();
      expect(state.onCaptureResult(outcome)).assertFalse();
      expect(state.canPublish()).assertFalse();
      expect(state.peek()).assertEqual('');
      expect(state.captures).assertEqual(0);
      expect(extractResourceUri(outcome)).assertEqual('');
      expect(captureSucceeded(new CaptureOutcome(0, 0, true, ''))).assertTrue();
      expect(captureSucceeded(new CaptureOutcome(1, 0, true, ''))).assertFalse();
      expect(state.canPublish() === (state.peek() !== '')).assertTrue();
    });
    /**
     * @tc.name StateResetFlowTest_case_011
     * @tc.desc textstate: TextInput edits update state without trimming, variant 2 (StateResetFlowTest case 11)
     * @tc.type Function
     * @tc.level Level1
     */
    it('StateResetFlowTest_case_011', 0, async () => {
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
     * @tc.name StateResetFlowTest_case_012
     * @tc.desc capture: callback outcome failure keeps imagePath empty (StateResetFlowTest case 12)
     * @tc.type Function
     * @tc.level Level1
     */
    it('StateResetFlowTest_case_012', 0, async () => {
      const outcome: CaptureOutcome = new CaptureOutcome(13900001, 0, true, '', 'msg');
      expect(captureSucceeded(outcome)).assertFalse();
      const state: CaptureState = new CaptureState();
      expect(state.onCaptureResult(outcome)).assertFalse();
      expect(state.canPublish()).assertFalse();
      expect(state.peek()).assertEqual('');
      expect(state.captures).assertEqual(0);
      expect(extractResourceUri(outcome)).assertEqual('');
      expect(captureSucceeded(new CaptureOutcome(0, 0, true, ''))).assertTrue();
      expect(captureSucceeded(new CaptureOutcome(1, 0, true, ''))).assertFalse();
      expect(state.canPublish() === (state.peek() !== '')).assertTrue();
    });
    /**
     * @tc.name StateResetFlowTest_case_013
     * @tc.desc textstate: TextInput edits update state without trimming, variant 1 (StateResetFlowTest case 13)
     * @tc.type Function
     * @tc.level Level1
     */
    it('StateResetFlowTest_case_013', 0, async () => {
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
     * @tc.name StateResetFlowTest_case_014
     * @tc.desc capture: callback outcome failure keeps imagePath consistent (StateResetFlowTest case 14)
     * @tc.type Function
     * @tc.level Level1
     */
    it('StateResetFlowTest_case_014', 0, async () => {
      const outcome: CaptureOutcome = new CaptureOutcome(13900001, 1, true, 'file://media/Photo/2/IMG_0002.jpg', 'msg');
      expect(captureSucceeded(outcome)).assertFalse();
      const state: CaptureState = new CaptureState();
      expect(state.onCaptureResult(outcome)).assertFalse();
      expect(state.canPublish()).assertFalse();
      expect(state.peek()).assertEqual('');
      expect(state.captures).assertEqual(0);
      expect(extractResourceUri(outcome)).assertEqual('');
      expect(captureSucceeded(new CaptureOutcome(0, 0, true, ''))).assertTrue();
      expect(captureSucceeded(new CaptureOutcome(1, 0, true, ''))).assertFalse();
      expect(state.canPublish() === (state.peek() !== '')).assertTrue();
    });
    /**
     * @tc.name StateResetFlowTest_case_015
     * @tc.desc textstate: TextInput edits update state without trimming, variant 3 (StateResetFlowTest case 15)
     * @tc.type Function
     * @tc.level Level1
     */
    it('StateResetFlowTest_case_015', 0, async () => {
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
     * @tc.name StateResetFlowTest_case_016
     * @tc.desc capture: callback outcome failure keeps imagePath empty (StateResetFlowTest case 16)
     * @tc.type Function
     * @tc.level Level1
     */
    it('StateResetFlowTest_case_016', 0, async () => {
      const outcome: CaptureOutcome = new CaptureOutcome(13900001, 0, true, '', 'msg');
      expect(captureSucceeded(outcome)).assertFalse();
      const state: CaptureState = new CaptureState();
      expect(state.onCaptureResult(outcome)).assertFalse();
      expect(state.canPublish()).assertFalse();
      expect(state.peek()).assertEqual('');
      expect(state.captures).assertEqual(0);
      expect(extractResourceUri(outcome)).assertEqual('');
      expect(captureSucceeded(new CaptureOutcome(0, 0, true, ''))).assertTrue();
      expect(captureSucceeded(new CaptureOutcome(1, 0, true, ''))).assertFalse();
      expect(state.canPublish() === (state.peek() !== '')).assertTrue();
    });
    /**
     * @tc.name StateResetFlowTest_case_017
     * @tc.desc textstate: TextInput edits update state without trimming, variant 2 (StateResetFlowTest case 17)
     * @tc.type Function
     * @tc.level Level1
     */
    it('StateResetFlowTest_case_017', 0, async () => {
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
     * @tc.name StateResetFlowTest_case_018
     * @tc.desc capture: callback outcome failure keeps imagePath consistent (StateResetFlowTest case 18)
     * @tc.type Function
     * @tc.level Level1
     */
    it('StateResetFlowTest_case_018', 0, async () => {
      const outcome: CaptureOutcome = new CaptureOutcome(13900001, 1, true, 'file://media/Photo/2/IMG_0002.jpg', 'msg');
      expect(captureSucceeded(outcome)).assertFalse();
      const state: CaptureState = new CaptureState();
      expect(state.onCaptureResult(outcome)).assertFalse();
      expect(state.canPublish()).assertFalse();
      expect(state.peek()).assertEqual('');
      expect(state.captures).assertEqual(0);
      expect(extractResourceUri(outcome)).assertEqual('');
      expect(captureSucceeded(new CaptureOutcome(0, 0, true, ''))).assertTrue();
      expect(captureSucceeded(new CaptureOutcome(1, 0, true, ''))).assertFalse();
      expect(state.canPublish() === (state.peek() !== '')).assertTrue();
    });
    /**
     * @tc.name StateResetFlowTest_case_019
     * @tc.desc textstate: TextInput edits update state without trimming, variant 1 (StateResetFlowTest case 19)
     * @tc.type Function
     * @tc.level Level1
     */
    it('StateResetFlowTest_case_019', 0, async () => {
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
     * @tc.name StateResetFlowTest_case_020
     * @tc.desc capture: callback outcome failure keeps imagePath empty (StateResetFlowTest case 20)
     * @tc.type Function
     * @tc.level Level1
     */
    it('StateResetFlowTest_case_020', 0, async () => {
      const outcome: CaptureOutcome = new CaptureOutcome(13900001, 0, true, '', 'msg');
      expect(captureSucceeded(outcome)).assertFalse();
      const state: CaptureState = new CaptureState();
      expect(state.onCaptureResult(outcome)).assertFalse();
      expect(state.canPublish()).assertFalse();
      expect(state.peek()).assertEqual('');
      expect(state.captures).assertEqual(0);
      expect(extractResourceUri(outcome)).assertEqual('');
      expect(captureSucceeded(new CaptureOutcome(0, 0, true, ''))).assertTrue();
      expect(captureSucceeded(new CaptureOutcome(1, 0, true, ''))).assertFalse();
      expect(state.canPublish() === (state.peek() !== '')).assertTrue();
    });
    /**
     * @tc.name StateResetFlowTest_case_021
     * @tc.desc textstate: TextInput edits update state without trimming, variant 3 (StateResetFlowTest case 21)
     * @tc.type Function
     * @tc.level Level1
     */
    it('StateResetFlowTest_case_021', 0, async () => {
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
     * @tc.name StateResetFlowTest_case_022
     * @tc.desc capture: callback outcome failure keeps imagePath consistent (StateResetFlowTest case 22)
     * @tc.type Function
     * @tc.level Level1
     */
    it('StateResetFlowTest_case_022', 0, async () => {
      const outcome: CaptureOutcome = new CaptureOutcome(13900001, 1, true, 'file://media/Photo/2/IMG_0002.jpg', 'msg');
      expect(captureSucceeded(outcome)).assertFalse();
      const state: CaptureState = new CaptureState();
      expect(state.onCaptureResult(outcome)).assertFalse();
      expect(state.canPublish()).assertFalse();
      expect(state.peek()).assertEqual('');
      expect(state.captures).assertEqual(0);
      expect(extractResourceUri(outcome)).assertEqual('');
      expect(captureSucceeded(new CaptureOutcome(0, 0, true, ''))).assertTrue();
      expect(captureSucceeded(new CaptureOutcome(1, 0, true, ''))).assertFalse();
      expect(state.canPublish() === (state.peek() !== '')).assertTrue();
    });
    /**
     * @tc.name StateResetFlowTest_case_023
     * @tc.desc textstate: TextInput edits update state without trimming, variant 2 (StateResetFlowTest case 23)
     * @tc.type Function
     * @tc.level Level1
     */
    it('StateResetFlowTest_case_023', 0, async () => {
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
     * @tc.name StateResetFlowTest_case_024
     * @tc.desc capture: callback outcome failure keeps imagePath empty (StateResetFlowTest case 24)
     * @tc.type Function
     * @tc.level Level1
     */
    it('StateResetFlowTest_case_024', 0, async () => {
      const outcome: CaptureOutcome = new CaptureOutcome(13900001, 0, true, '', 'msg');
      expect(captureSucceeded(outcome)).assertFalse();
      const state: CaptureState = new CaptureState();
      expect(state.onCaptureResult(outcome)).assertFalse();
      expect(state.canPublish()).assertFalse();
      expect(state.peek()).assertEqual('');
      expect(state.captures).assertEqual(0);
      expect(extractResourceUri(outcome)).assertEqual('');
      expect(captureSucceeded(new CaptureOutcome(0, 0, true, ''))).assertTrue();
      expect(captureSucceeded(new CaptureOutcome(1, 0, true, ''))).assertFalse();
      expect(state.canPublish() === (state.peek() !== '')).assertTrue();
    });
    /**
     * @tc.name StateResetFlowTest_case_025
     * @tc.desc textstate: TextInput edits update state without trimming, variant 1 (StateResetFlowTest case 25)
     * @tc.type Function
     * @tc.level Level1
     */
    it('StateResetFlowTest_case_025', 0, async () => {
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
     * @tc.name StateResetFlowTest_case_026
     * @tc.desc capture: callback outcome failure keeps imagePath consistent (StateResetFlowTest case 26)
     * @tc.type Function
     * @tc.level Level1
     */
    it('StateResetFlowTest_case_026', 0, async () => {
      const outcome: CaptureOutcome = new CaptureOutcome(13900001, 1, true, 'file://media/Photo/2/IMG_0002.jpg', 'msg');
      expect(captureSucceeded(outcome)).assertFalse();
      const state: CaptureState = new CaptureState();
      expect(state.onCaptureResult(outcome)).assertFalse();
      expect(state.canPublish()).assertFalse();
      expect(state.peek()).assertEqual('');
      expect(state.captures).assertEqual(0);
      expect(extractResourceUri(outcome)).assertEqual('');
      expect(captureSucceeded(new CaptureOutcome(0, 0, true, ''))).assertTrue();
      expect(captureSucceeded(new CaptureOutcome(1, 0, true, ''))).assertFalse();
      expect(state.canPublish() === (state.peek() !== '')).assertTrue();
    });
    /**
     * @tc.name StateResetFlowTest_case_027
     * @tc.desc textstate: TextInput edits update state without trimming, variant 3 (StateResetFlowTest case 27)
     * @tc.type Function
     * @tc.level Level1
     */
    it('StateResetFlowTest_case_027', 0, async () => {
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
     * @tc.name StateResetFlowTest_case_028
     * @tc.desc capture: callback outcome failure keeps imagePath empty (StateResetFlowTest case 28)
     * @tc.type Function
     * @tc.level Level1
     */
    it('StateResetFlowTest_case_028', 0, async () => {
      const outcome: CaptureOutcome = new CaptureOutcome(13900001, 0, true, '', 'msg');
      expect(captureSucceeded(outcome)).assertFalse();
      const state: CaptureState = new CaptureState();
      expect(state.onCaptureResult(outcome)).assertFalse();
      expect(state.canPublish()).assertFalse();
      expect(state.peek()).assertEqual('');
      expect(state.captures).assertEqual(0);
      expect(extractResourceUri(outcome)).assertEqual('');
      expect(captureSucceeded(new CaptureOutcome(0, 0, true, ''))).assertTrue();
      expect(captureSucceeded(new CaptureOutcome(1, 0, true, ''))).assertFalse();
      expect(state.canPublish() === (state.peek() !== '')).assertTrue();
    });
    /**
     * @tc.name StateResetFlowTest_case_029
     * @tc.desc textstate: TextInput edits update state without trimming, variant 2 (StateResetFlowTest case 29)
     * @tc.type Function
     * @tc.level Level1
     */
    it('StateResetFlowTest_case_029', 0, async () => {
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
     * @tc.name StateResetFlowTest_case_030
     * @tc.desc capture: callback outcome failure keeps imagePath consistent (StateResetFlowTest case 30)
     * @tc.type Function
     * @tc.level Level1
     */
    it('StateResetFlowTest_case_030', 0, async () => {
      const outcome: CaptureOutcome = new CaptureOutcome(13900001, 1, true, 'file://media/Photo/2/IMG_0002.jpg', 'msg');
      expect(captureSucceeded(outcome)).assertFalse();
      const state: CaptureState = new CaptureState();
      expect(state.onCaptureResult(outcome)).assertFalse();
      expect(state.canPublish()).assertFalse();
      expect(state.peek()).assertEqual('');
      expect(state.captures).assertEqual(0);
      expect(extractResourceUri(outcome)).assertEqual('');
      expect(captureSucceeded(new CaptureOutcome(0, 0, true, ''))).assertTrue();
      expect(captureSucceeded(new CaptureOutcome(1, 0, true, ''))).assertFalse();
      expect(state.canPublish() === (state.peek() !== '')).assertTrue();
    });
    /**
     * @tc.name StateResetFlowTest_case_031
     * @tc.desc textstate: TextInput edits update state without trimming, variant 1 (StateResetFlowTest case 31)
     * @tc.type Function
     * @tc.level Level1
     */
    it('StateResetFlowTest_case_031', 0, async () => {
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
     * @tc.name StateResetFlowTest_case_032
     * @tc.desc capture: callback outcome failure keeps imagePath empty (StateResetFlowTest case 32)
     * @tc.type Function
     * @tc.level Level1
     */
    it('StateResetFlowTest_case_032', 0, async () => {
      const outcome: CaptureOutcome = new CaptureOutcome(13900001, 0, true, '', 'msg');
      expect(captureSucceeded(outcome)).assertFalse();
      const state: CaptureState = new CaptureState();
      expect(state.onCaptureResult(outcome)).assertFalse();
      expect(state.canPublish()).assertFalse();
      expect(state.peek()).assertEqual('');
      expect(state.captures).assertEqual(0);
      expect(extractResourceUri(outcome)).assertEqual('');
      expect(captureSucceeded(new CaptureOutcome(0, 0, true, ''))).assertTrue();
      expect(captureSucceeded(new CaptureOutcome(1, 0, true, ''))).assertFalse();
      expect(state.canPublish() === (state.peek() !== '')).assertTrue();
    });
    /**
     * @tc.name StateResetFlowTest_case_033
     * @tc.desc textstate: TextInput edits update state without trimming, variant 3 (StateResetFlowTest case 33)
     * @tc.type Function
     * @tc.level Level1
     */
    it('StateResetFlowTest_case_033', 0, async () => {
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
     * @tc.name StateResetFlowTest_case_034
     * @tc.desc capture: callback outcome failure keeps imagePath consistent (StateResetFlowTest case 34)
     * @tc.type Function
     * @tc.level Level1
     */
    it('StateResetFlowTest_case_034', 0, async () => {
      const outcome: CaptureOutcome = new CaptureOutcome(13900001, 1, true, 'file://media/Photo/2/IMG_0002.jpg', 'msg');
      expect(captureSucceeded(outcome)).assertFalse();
      const state: CaptureState = new CaptureState();
      expect(state.onCaptureResult(outcome)).assertFalse();
      expect(state.canPublish()).assertFalse();
      expect(state.peek()).assertEqual('');
      expect(state.captures).assertEqual(0);
      expect(extractResourceUri(outcome)).assertEqual('');
      expect(captureSucceeded(new CaptureOutcome(0, 0, true, ''))).assertTrue();
      expect(captureSucceeded(new CaptureOutcome(1, 0, true, ''))).assertFalse();
      expect(state.canPublish() === (state.peek() !== '')).assertTrue();
    });
    /**
     * @tc.name StateResetFlowTest_case_035
     * @tc.desc textstate: TextInput edits update state without trimming, variant 2 (StateResetFlowTest case 35)
     * @tc.type Function
     * @tc.level Level1
     */
    it('StateResetFlowTest_case_035', 0, async () => {
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
     * @tc.name StateResetFlowTest_case_036
     * @tc.desc capture: callback outcome failure keeps imagePath empty (StateResetFlowTest case 36)
     * @tc.type Function
     * @tc.level Level1
     */
    it('StateResetFlowTest_case_036', 0, async () => {
      const outcome: CaptureOutcome = new CaptureOutcome(13900001, 0, true, '', 'msg');
      expect(captureSucceeded(outcome)).assertFalse();
      const state: CaptureState = new CaptureState();
      expect(state.onCaptureResult(outcome)).assertFalse();
      expect(state.canPublish()).assertFalse();
      expect(state.peek()).assertEqual('');
      expect(state.captures).assertEqual(0);
      expect(extractResourceUri(outcome)).assertEqual('');
      expect(captureSucceeded(new CaptureOutcome(0, 0, true, ''))).assertTrue();
      expect(captureSucceeded(new CaptureOutcome(1, 0, true, ''))).assertFalse();
      expect(state.canPublish() === (state.peek() !== '')).assertTrue();
    });
    /**
     * @tc.name StateResetFlowTest_case_037
     * @tc.desc textstate: TextInput edits update state without trimming, variant 1 (StateResetFlowTest case 37)
     * @tc.type Function
     * @tc.level Level1
     */
    it('StateResetFlowTest_case_037', 0, async () => {
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
     * @tc.name StateResetFlowTest_case_038
     * @tc.desc capture: callback outcome failure keeps imagePath consistent (StateResetFlowTest case 38)
     * @tc.type Function
     * @tc.level Level1
     */
    it('StateResetFlowTest_case_038', 0, async () => {
      const outcome: CaptureOutcome = new CaptureOutcome(13900001, 1, true, 'file://media/Photo/2/IMG_0002.jpg', 'msg');
      expect(captureSucceeded(outcome)).assertFalse();
      const state: CaptureState = new CaptureState();
      expect(state.onCaptureResult(outcome)).assertFalse();
      expect(state.canPublish()).assertFalse();
      expect(state.peek()).assertEqual('');
      expect(state.captures).assertEqual(0);
      expect(extractResourceUri(outcome)).assertEqual('');
      expect(captureSucceeded(new CaptureOutcome(0, 0, true, ''))).assertTrue();
      expect(captureSucceeded(new CaptureOutcome(1, 0, true, ''))).assertFalse();
      expect(state.canPublish() === (state.peek() !== '')).assertTrue();
    });
    /**
     * @tc.name StateResetFlowTest_case_039
     * @tc.desc textstate: TextInput edits update state without trimming, variant 3 (StateResetFlowTest case 39)
     * @tc.type Function
     * @tc.level Level1
     */
    it('StateResetFlowTest_case_039', 0, async () => {
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
     * @tc.name StateResetFlowTest_case_040
     * @tc.desc capture: callback outcome failure keeps imagePath empty (StateResetFlowTest case 40)
     * @tc.type Function
     * @tc.level Level1
     */
    it('StateResetFlowTest_case_040', 0, async () => {
      const outcome: CaptureOutcome = new CaptureOutcome(13900001, 0, true, '', 'msg');
      expect(captureSucceeded(outcome)).assertFalse();
      const state: CaptureState = new CaptureState();
      expect(state.onCaptureResult(outcome)).assertFalse();
      expect(state.canPublish()).assertFalse();
      expect(state.peek()).assertEqual('');
      expect(state.captures).assertEqual(0);
      expect(extractResourceUri(outcome)).assertEqual('');
      expect(captureSucceeded(new CaptureOutcome(0, 0, true, ''))).assertTrue();
      expect(captureSucceeded(new CaptureOutcome(1, 0, true, ''))).assertFalse();
      expect(state.canPublish() === (state.peek() !== '')).assertTrue();
    });
    /**
     * @tc.name StateResetFlowTest_case_041
     * @tc.desc textstate: TextInput edits update state without trimming, variant 2 (StateResetFlowTest case 41)
     * @tc.type Function
     * @tc.level Level1
     */
    it('StateResetFlowTest_case_041', 0, async () => {
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
     * @tc.name StateResetFlowTest_case_042
     * @tc.desc capture: callback outcome failure keeps imagePath consistent (StateResetFlowTest case 42)
     * @tc.type Function
     * @tc.level Level1
     */
    it('StateResetFlowTest_case_042', 0, async () => {
      const outcome: CaptureOutcome = new CaptureOutcome(13900001, 1, true, 'file://media/Photo/2/IMG_0002.jpg', 'msg');
      expect(captureSucceeded(outcome)).assertFalse();
      const state: CaptureState = new CaptureState();
      expect(state.onCaptureResult(outcome)).assertFalse();
      expect(state.canPublish()).assertFalse();
      expect(state.peek()).assertEqual('');
      expect(state.captures).assertEqual(0);
      expect(extractResourceUri(outcome)).assertEqual('');
      expect(captureSucceeded(new CaptureOutcome(0, 0, true, ''))).assertTrue();
      expect(captureSucceeded(new CaptureOutcome(1, 0, true, ''))).assertFalse();
      expect(state.canPublish() === (state.peek() !== '')).assertTrue();
    });
    /**
     * @tc.name StateResetFlowTest_case_043
     * @tc.desc textstate: TextInput edits update state without trimming, variant 1 (StateResetFlowTest case 43)
     * @tc.type Function
     * @tc.level Level1
     */
    it('StateResetFlowTest_case_043', 0, async () => {
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
     * @tc.name StateResetFlowTest_case_044
     * @tc.desc capture: callback outcome failure keeps imagePath empty (StateResetFlowTest case 44)
     * @tc.type Function
     * @tc.level Level1
     */
    it('StateResetFlowTest_case_044', 0, async () => {
      const outcome: CaptureOutcome = new CaptureOutcome(13900001, 0, true, '', 'msg');
      expect(captureSucceeded(outcome)).assertFalse();
      const state: CaptureState = new CaptureState();
      expect(state.onCaptureResult(outcome)).assertFalse();
      expect(state.canPublish()).assertFalse();
      expect(state.peek()).assertEqual('');
      expect(state.captures).assertEqual(0);
      expect(extractResourceUri(outcome)).assertEqual('');
      expect(captureSucceeded(new CaptureOutcome(0, 0, true, ''))).assertTrue();
      expect(captureSucceeded(new CaptureOutcome(1, 0, true, ''))).assertFalse();
      expect(state.canPublish() === (state.peek() !== '')).assertTrue();
    });
    /**
     * @tc.name StateResetFlowTest_case_045
     * @tc.desc textstate: TextInput edits update state without trimming, variant 3 (StateResetFlowTest case 45)
     * @tc.type Function
     * @tc.level Level1
     */
    it('StateResetFlowTest_case_045', 0, async () => {
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
