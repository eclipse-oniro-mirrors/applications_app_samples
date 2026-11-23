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

export default function CaptureResultTest(): void {
  describe('CaptureResultTest', () => {
    beforeAll(() => {
      logSuite('CaptureResultTest', 'begin');
    });
    beforeEach(async () => {
      await yieldTick();
    });
    afterAll(() => {
      logSuite('CaptureResultTest', 'end');
    });

    /**
     * @tc.name CaptureResultTest_case_001
     * @tc.desc capture: callback outcome success keeps imagePath consistent (CaptureResultTest case 1)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CaptureResultTest_case_001', 0, async () => {
      const outcome: CaptureOutcome = new CaptureOutcome(0, 0, true, 'file://media/Photo/1/IMG_0001.jpg', 'msg');
      expect(captureSucceeded(outcome)).assertTrue();
      const state: CaptureState = new CaptureState();
      expect(state.onCaptureResult(outcome)).assertTrue();
      expect(state.canPublish()).assertTrue();
      expect(state.peek()).assertEqual('file://media/Photo/1/IMG_0001.jpg');
      expect(state.captures).assertEqual(1);
      expect(extractResourceUri(outcome)).assertEqual('file://media/Photo/1/IMG_0001.jpg');
      expect(captureSucceeded(new CaptureOutcome(0, 0, true, ''))).assertTrue();
      expect(captureSucceeded(new CaptureOutcome(1, 0, true, ''))).assertFalse();
      expect(state.canPublish() === (state.peek() !== '')).assertTrue();
    });
    /**
     * @tc.name CaptureResultTest_case_002
     * @tc.desc capture: callback outcome failure keeps imagePath consistent (CaptureResultTest case 2)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CaptureResultTest_case_002', 0, async () => {
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
     * @tc.name CaptureResultTest_case_003
     * @tc.desc capture: callback outcome failure keeps imagePath consistent (CaptureResultTest case 3)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CaptureResultTest_case_003', 0, async () => {
      const outcome: CaptureOutcome = new CaptureOutcome(13900001, 0, false, 'datashare:///media/photo/3', 'msg');
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
     * @tc.name CaptureResultTest_case_004
     * @tc.desc capture: callback outcome failure keeps imagePath empty (CaptureResultTest case 4)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CaptureResultTest_case_004', 0, async () => {
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
     * @tc.name CaptureResultTest_case_005
     * @tc.desc capture: callback outcome success keeps imagePath consistent (CaptureResultTest case 5)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CaptureResultTest_case_005', 0, async () => {
      const outcome: CaptureOutcome = new CaptureOutcome(0, 0, true, 'file://media/Photo/1/IMG_0001.jpg', 'msg');
      expect(captureSucceeded(outcome)).assertTrue();
      const state: CaptureState = new CaptureState();
      expect(state.onCaptureResult(outcome)).assertTrue();
      expect(state.canPublish()).assertTrue();
      expect(state.peek()).assertEqual('file://media/Photo/1/IMG_0001.jpg');
      expect(state.captures).assertEqual(1);
      expect(extractResourceUri(outcome)).assertEqual('file://media/Photo/1/IMG_0001.jpg');
      expect(captureSucceeded(new CaptureOutcome(0, 0, true, ''))).assertTrue();
      expect(captureSucceeded(new CaptureOutcome(1, 0, true, ''))).assertFalse();
      expect(state.canPublish() === (state.peek() !== '')).assertTrue();
    });
    /**
     * @tc.name CaptureResultTest_case_006
     * @tc.desc capture: callback outcome failure keeps imagePath consistent (CaptureResultTest case 6)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CaptureResultTest_case_006', 0, async () => {
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
     * @tc.name CaptureResultTest_case_007
     * @tc.desc capture: callback outcome failure keeps imagePath consistent (CaptureResultTest case 7)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CaptureResultTest_case_007', 0, async () => {
      const outcome: CaptureOutcome = new CaptureOutcome(13900001, 0, false, 'datashare:///media/photo/3', 'msg');
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
     * @tc.name CaptureResultTest_case_008
     * @tc.desc capture: callback outcome failure keeps imagePath empty (CaptureResultTest case 8)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CaptureResultTest_case_008', 0, async () => {
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
     * @tc.name CaptureResultTest_case_009
     * @tc.desc capture: callback outcome success keeps imagePath consistent (CaptureResultTest case 9)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CaptureResultTest_case_009', 0, async () => {
      const outcome: CaptureOutcome = new CaptureOutcome(0, 0, true, 'file://media/Photo/1/IMG_0001.jpg', 'msg');
      expect(captureSucceeded(outcome)).assertTrue();
      const state: CaptureState = new CaptureState();
      expect(state.onCaptureResult(outcome)).assertTrue();
      expect(state.canPublish()).assertTrue();
      expect(state.peek()).assertEqual('file://media/Photo/1/IMG_0001.jpg');
      expect(state.captures).assertEqual(1);
      expect(extractResourceUri(outcome)).assertEqual('file://media/Photo/1/IMG_0001.jpg');
      expect(captureSucceeded(new CaptureOutcome(0, 0, true, ''))).assertTrue();
      expect(captureSucceeded(new CaptureOutcome(1, 0, true, ''))).assertFalse();
      expect(state.canPublish() === (state.peek() !== '')).assertTrue();
    });
    /**
     * @tc.name CaptureResultTest_case_010
     * @tc.desc capture: callback outcome failure keeps imagePath consistent (CaptureResultTest case 10)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CaptureResultTest_case_010', 0, async () => {
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
     * @tc.name CaptureResultTest_case_011
     * @tc.desc capture: callback outcome failure keeps imagePath consistent (CaptureResultTest case 11)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CaptureResultTest_case_011', 0, async () => {
      const outcome: CaptureOutcome = new CaptureOutcome(13900001, 0, false, 'datashare:///media/photo/3', 'msg');
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
     * @tc.name CaptureResultTest_case_012
     * @tc.desc capture: callback outcome failure keeps imagePath empty (CaptureResultTest case 12)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CaptureResultTest_case_012', 0, async () => {
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
     * @tc.name CaptureResultTest_case_013
     * @tc.desc capture: callback outcome success keeps imagePath consistent (CaptureResultTest case 13)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CaptureResultTest_case_013', 0, async () => {
      const outcome: CaptureOutcome = new CaptureOutcome(0, 0, true, 'file://media/Photo/1/IMG_0001.jpg', 'msg');
      expect(captureSucceeded(outcome)).assertTrue();
      const state: CaptureState = new CaptureState();
      expect(state.onCaptureResult(outcome)).assertTrue();
      expect(state.canPublish()).assertTrue();
      expect(state.peek()).assertEqual('file://media/Photo/1/IMG_0001.jpg');
      expect(state.captures).assertEqual(1);
      expect(extractResourceUri(outcome)).assertEqual('file://media/Photo/1/IMG_0001.jpg');
      expect(captureSucceeded(new CaptureOutcome(0, 0, true, ''))).assertTrue();
      expect(captureSucceeded(new CaptureOutcome(1, 0, true, ''))).assertFalse();
      expect(state.canPublish() === (state.peek() !== '')).assertTrue();
    });
    /**
     * @tc.name CaptureResultTest_case_014
     * @tc.desc capture: callback outcome failure keeps imagePath consistent (CaptureResultTest case 14)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CaptureResultTest_case_014', 0, async () => {
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
     * @tc.name CaptureResultTest_case_015
     * @tc.desc capture: callback outcome failure keeps imagePath consistent (CaptureResultTest case 15)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CaptureResultTest_case_015', 0, async () => {
      const outcome: CaptureOutcome = new CaptureOutcome(13900001, 0, false, 'datashare:///media/photo/3', 'msg');
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
     * @tc.name CaptureResultTest_case_016
     * @tc.desc capture: callback outcome failure keeps imagePath empty (CaptureResultTest case 16)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CaptureResultTest_case_016', 0, async () => {
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
     * @tc.name CaptureResultTest_case_017
     * @tc.desc capture: callback outcome success keeps imagePath consistent (CaptureResultTest case 17)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CaptureResultTest_case_017', 0, async () => {
      const outcome: CaptureOutcome = new CaptureOutcome(0, 0, true, 'file://media/Photo/1/IMG_0001.jpg', 'msg');
      expect(captureSucceeded(outcome)).assertTrue();
      const state: CaptureState = new CaptureState();
      expect(state.onCaptureResult(outcome)).assertTrue();
      expect(state.canPublish()).assertTrue();
      expect(state.peek()).assertEqual('file://media/Photo/1/IMG_0001.jpg');
      expect(state.captures).assertEqual(1);
      expect(extractResourceUri(outcome)).assertEqual('file://media/Photo/1/IMG_0001.jpg');
      expect(captureSucceeded(new CaptureOutcome(0, 0, true, ''))).assertTrue();
      expect(captureSucceeded(new CaptureOutcome(1, 0, true, ''))).assertFalse();
      expect(state.canPublish() === (state.peek() !== '')).assertTrue();
    });
    /**
     * @tc.name CaptureResultTest_case_018
     * @tc.desc capture: callback outcome failure keeps imagePath consistent (CaptureResultTest case 18)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CaptureResultTest_case_018', 0, async () => {
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
     * @tc.name CaptureResultTest_case_019
     * @tc.desc capture: callback outcome failure keeps imagePath consistent (CaptureResultTest case 19)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CaptureResultTest_case_019', 0, async () => {
      const outcome: CaptureOutcome = new CaptureOutcome(13900001, 0, false, 'datashare:///media/photo/3', 'msg');
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
     * @tc.name CaptureResultTest_case_020
     * @tc.desc capture: callback outcome failure keeps imagePath empty (CaptureResultTest case 20)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CaptureResultTest_case_020', 0, async () => {
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
     * @tc.name CaptureResultTest_case_021
     * @tc.desc capture: callback outcome success keeps imagePath consistent (CaptureResultTest case 21)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CaptureResultTest_case_021', 0, async () => {
      const outcome: CaptureOutcome = new CaptureOutcome(0, 0, true, 'file://media/Photo/1/IMG_0001.jpg', 'msg');
      expect(captureSucceeded(outcome)).assertTrue();
      const state: CaptureState = new CaptureState();
      expect(state.onCaptureResult(outcome)).assertTrue();
      expect(state.canPublish()).assertTrue();
      expect(state.peek()).assertEqual('file://media/Photo/1/IMG_0001.jpg');
      expect(state.captures).assertEqual(1);
      expect(extractResourceUri(outcome)).assertEqual('file://media/Photo/1/IMG_0001.jpg');
      expect(captureSucceeded(new CaptureOutcome(0, 0, true, ''))).assertTrue();
      expect(captureSucceeded(new CaptureOutcome(1, 0, true, ''))).assertFalse();
      expect(state.canPublish() === (state.peek() !== '')).assertTrue();
    });
    /**
     * @tc.name CaptureResultTest_case_022
     * @tc.desc capture: callback outcome failure keeps imagePath consistent (CaptureResultTest case 22)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CaptureResultTest_case_022', 0, async () => {
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
     * @tc.name CaptureResultTest_case_023
     * @tc.desc capture: callback outcome failure keeps imagePath consistent (CaptureResultTest case 23)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CaptureResultTest_case_023', 0, async () => {
      const outcome: CaptureOutcome = new CaptureOutcome(13900001, 0, false, 'datashare:///media/photo/3', 'msg');
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
     * @tc.name CaptureResultTest_case_024
     * @tc.desc capture: callback outcome failure keeps imagePath empty (CaptureResultTest case 24)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CaptureResultTest_case_024', 0, async () => {
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
     * @tc.name CaptureResultTest_case_025
     * @tc.desc capture: callback outcome success keeps imagePath consistent (CaptureResultTest case 25)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CaptureResultTest_case_025', 0, async () => {
      const outcome: CaptureOutcome = new CaptureOutcome(0, 0, true, 'file://media/Photo/1/IMG_0001.jpg', 'msg');
      expect(captureSucceeded(outcome)).assertTrue();
      const state: CaptureState = new CaptureState();
      expect(state.onCaptureResult(outcome)).assertTrue();
      expect(state.canPublish()).assertTrue();
      expect(state.peek()).assertEqual('file://media/Photo/1/IMG_0001.jpg');
      expect(state.captures).assertEqual(1);
      expect(extractResourceUri(outcome)).assertEqual('file://media/Photo/1/IMG_0001.jpg');
      expect(captureSucceeded(new CaptureOutcome(0, 0, true, ''))).assertTrue();
      expect(captureSucceeded(new CaptureOutcome(1, 0, true, ''))).assertFalse();
      expect(state.canPublish() === (state.peek() !== '')).assertTrue();
    });
    /**
     * @tc.name CaptureResultTest_case_026
     * @tc.desc capture: callback outcome failure keeps imagePath consistent (CaptureResultTest case 26)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CaptureResultTest_case_026', 0, async () => {
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
     * @tc.name CaptureResultTest_case_027
     * @tc.desc capture: callback outcome failure keeps imagePath consistent (CaptureResultTest case 27)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CaptureResultTest_case_027', 0, async () => {
      const outcome: CaptureOutcome = new CaptureOutcome(13900001, 0, false, 'datashare:///media/photo/3', 'msg');
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
     * @tc.name CaptureResultTest_case_028
     * @tc.desc capture: callback outcome failure keeps imagePath empty (CaptureResultTest case 28)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CaptureResultTest_case_028', 0, async () => {
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
     * @tc.name CaptureResultTest_case_029
     * @tc.desc capture: callback outcome success keeps imagePath consistent (CaptureResultTest case 29)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CaptureResultTest_case_029', 0, async () => {
      const outcome: CaptureOutcome = new CaptureOutcome(0, 0, true, 'file://media/Photo/1/IMG_0001.jpg', 'msg');
      expect(captureSucceeded(outcome)).assertTrue();
      const state: CaptureState = new CaptureState();
      expect(state.onCaptureResult(outcome)).assertTrue();
      expect(state.canPublish()).assertTrue();
      expect(state.peek()).assertEqual('file://media/Photo/1/IMG_0001.jpg');
      expect(state.captures).assertEqual(1);
      expect(extractResourceUri(outcome)).assertEqual('file://media/Photo/1/IMG_0001.jpg');
      expect(captureSucceeded(new CaptureOutcome(0, 0, true, ''))).assertTrue();
      expect(captureSucceeded(new CaptureOutcome(1, 0, true, ''))).assertFalse();
      expect(state.canPublish() === (state.peek() !== '')).assertTrue();
    });
    /**
     * @tc.name CaptureResultTest_case_030
     * @tc.desc capture: callback outcome failure keeps imagePath consistent (CaptureResultTest case 30)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CaptureResultTest_case_030', 0, async () => {
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
     * @tc.name CaptureResultTest_case_031
     * @tc.desc capture: callback outcome failure keeps imagePath consistent (CaptureResultTest case 31)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CaptureResultTest_case_031', 0, async () => {
      const outcome: CaptureOutcome = new CaptureOutcome(13900001, 0, false, 'datashare:///media/photo/3', 'msg');
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
     * @tc.name CaptureResultTest_case_032
     * @tc.desc capture: callback outcome failure keeps imagePath empty (CaptureResultTest case 32)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CaptureResultTest_case_032', 0, async () => {
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
     * @tc.name CaptureResultTest_case_033
     * @tc.desc capture: callback outcome success keeps imagePath consistent (CaptureResultTest case 33)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CaptureResultTest_case_033', 0, async () => {
      const outcome: CaptureOutcome = new CaptureOutcome(0, 0, true, 'file://media/Photo/1/IMG_0001.jpg', 'msg');
      expect(captureSucceeded(outcome)).assertTrue();
      const state: CaptureState = new CaptureState();
      expect(state.onCaptureResult(outcome)).assertTrue();
      expect(state.canPublish()).assertTrue();
      expect(state.peek()).assertEqual('file://media/Photo/1/IMG_0001.jpg');
      expect(state.captures).assertEqual(1);
      expect(extractResourceUri(outcome)).assertEqual('file://media/Photo/1/IMG_0001.jpg');
      expect(captureSucceeded(new CaptureOutcome(0, 0, true, ''))).assertTrue();
      expect(captureSucceeded(new CaptureOutcome(1, 0, true, ''))).assertFalse();
      expect(state.canPublish() === (state.peek() !== '')).assertTrue();
    });
    /**
     * @tc.name CaptureResultTest_case_034
     * @tc.desc capture: callback outcome failure keeps imagePath consistent (CaptureResultTest case 34)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CaptureResultTest_case_034', 0, async () => {
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
     * @tc.name CaptureResultTest_case_035
     * @tc.desc capture: callback outcome failure keeps imagePath consistent (CaptureResultTest case 35)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CaptureResultTest_case_035', 0, async () => {
      const outcome: CaptureOutcome = new CaptureOutcome(13900001, 0, false, 'datashare:///media/photo/3', 'msg');
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
     * @tc.name CaptureResultTest_case_036
     * @tc.desc capture: callback outcome failure keeps imagePath empty (CaptureResultTest case 36)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CaptureResultTest_case_036', 0, async () => {
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
     * @tc.name CaptureResultTest_case_037
     * @tc.desc capture: callback outcome success keeps imagePath consistent (CaptureResultTest case 37)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CaptureResultTest_case_037', 0, async () => {
      const outcome: CaptureOutcome = new CaptureOutcome(0, 0, true, 'file://media/Photo/1/IMG_0001.jpg', 'msg');
      expect(captureSucceeded(outcome)).assertTrue();
      const state: CaptureState = new CaptureState();
      expect(state.onCaptureResult(outcome)).assertTrue();
      expect(state.canPublish()).assertTrue();
      expect(state.peek()).assertEqual('file://media/Photo/1/IMG_0001.jpg');
      expect(state.captures).assertEqual(1);
      expect(extractResourceUri(outcome)).assertEqual('file://media/Photo/1/IMG_0001.jpg');
      expect(captureSucceeded(new CaptureOutcome(0, 0, true, ''))).assertTrue();
      expect(captureSucceeded(new CaptureOutcome(1, 0, true, ''))).assertFalse();
      expect(state.canPublish() === (state.peek() !== '')).assertTrue();
    });
    /**
     * @tc.name CaptureResultTest_case_038
     * @tc.desc capture: callback outcome failure keeps imagePath consistent (CaptureResultTest case 38)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CaptureResultTest_case_038', 0, async () => {
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
     * @tc.name CaptureResultTest_case_039
     * @tc.desc capture: callback outcome failure keeps imagePath consistent (CaptureResultTest case 39)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CaptureResultTest_case_039', 0, async () => {
      const outcome: CaptureOutcome = new CaptureOutcome(13900001, 0, false, 'datashare:///media/photo/3', 'msg');
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
     * @tc.name CaptureResultTest_case_040
     * @tc.desc capture: callback outcome failure keeps imagePath empty (CaptureResultTest case 40)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CaptureResultTest_case_040', 0, async () => {
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
     * @tc.name CaptureResultTest_case_041
     * @tc.desc capture: callback outcome success keeps imagePath consistent (CaptureResultTest case 41)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CaptureResultTest_case_041', 0, async () => {
      const outcome: CaptureOutcome = new CaptureOutcome(0, 0, true, 'file://media/Photo/1/IMG_0001.jpg', 'msg');
      expect(captureSucceeded(outcome)).assertTrue();
      const state: CaptureState = new CaptureState();
      expect(state.onCaptureResult(outcome)).assertTrue();
      expect(state.canPublish()).assertTrue();
      expect(state.peek()).assertEqual('file://media/Photo/1/IMG_0001.jpg');
      expect(state.captures).assertEqual(1);
      expect(extractResourceUri(outcome)).assertEqual('file://media/Photo/1/IMG_0001.jpg');
      expect(captureSucceeded(new CaptureOutcome(0, 0, true, ''))).assertTrue();
      expect(captureSucceeded(new CaptureOutcome(1, 0, true, ''))).assertFalse();
      expect(state.canPublish() === (state.peek() !== '')).assertTrue();
    });
    /**
     * @tc.name CaptureResultTest_case_042
     * @tc.desc capture: callback outcome failure keeps imagePath consistent (CaptureResultTest case 42)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CaptureResultTest_case_042', 0, async () => {
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
     * @tc.name CaptureResultTest_case_043
     * @tc.desc capture: callback outcome failure keeps imagePath consistent (CaptureResultTest case 43)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CaptureResultTest_case_043', 0, async () => {
      const outcome: CaptureOutcome = new CaptureOutcome(13900001, 0, false, 'datashare:///media/photo/3', 'msg');
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
     * @tc.name CaptureResultTest_case_044
     * @tc.desc capture: callback outcome failure keeps imagePath empty (CaptureResultTest case 44)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CaptureResultTest_case_044', 0, async () => {
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
     * @tc.name CaptureResultTest_case_045
     * @tc.desc capture: callback outcome success keeps imagePath consistent (CaptureResultTest case 45)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CaptureResultTest_case_045', 0, async () => {
      const outcome: CaptureOutcome = new CaptureOutcome(0, 0, true, 'file://media/Photo/1/IMG_0001.jpg', 'msg');
      expect(captureSucceeded(outcome)).assertTrue();
      const state: CaptureState = new CaptureState();
      expect(state.onCaptureResult(outcome)).assertTrue();
      expect(state.canPublish()).assertTrue();
      expect(state.peek()).assertEqual('file://media/Photo/1/IMG_0001.jpg');
      expect(state.captures).assertEqual(1);
      expect(extractResourceUri(outcome)).assertEqual('file://media/Photo/1/IMG_0001.jpg');
      expect(captureSucceeded(new CaptureOutcome(0, 0, true, ''))).assertTrue();
      expect(captureSucceeded(new CaptureOutcome(1, 0, true, ''))).assertFalse();
      expect(state.canPublish() === (state.peek() !== '')).assertTrue();
    });
    /**
     * @tc.name CaptureResultTest_case_046
     * @tc.desc capture: callback outcome failure keeps imagePath consistent (CaptureResultTest case 46)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CaptureResultTest_case_046', 0, async () => {
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
     * @tc.name CaptureResultTest_case_047
     * @tc.desc capture: callback outcome failure keeps imagePath consistent (CaptureResultTest case 47)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CaptureResultTest_case_047', 0, async () => {
      const outcome: CaptureOutcome = new CaptureOutcome(13900001, 0, false, 'datashare:///media/photo/3', 'msg');
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
     * @tc.name CaptureResultTest_case_048
     * @tc.desc capture: callback outcome failure keeps imagePath empty (CaptureResultTest case 48)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CaptureResultTest_case_048', 0, async () => {
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
     * @tc.name CaptureResultTest_case_049
     * @tc.desc capture: callback outcome success keeps imagePath consistent (CaptureResultTest case 49)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CaptureResultTest_case_049', 0, async () => {
      const outcome: CaptureOutcome = new CaptureOutcome(0, 0, true, 'file://media/Photo/1/IMG_0001.jpg', 'msg');
      expect(captureSucceeded(outcome)).assertTrue();
      const state: CaptureState = new CaptureState();
      expect(state.onCaptureResult(outcome)).assertTrue();
      expect(state.canPublish()).assertTrue();
      expect(state.peek()).assertEqual('file://media/Photo/1/IMG_0001.jpg');
      expect(state.captures).assertEqual(1);
      expect(extractResourceUri(outcome)).assertEqual('file://media/Photo/1/IMG_0001.jpg');
      expect(captureSucceeded(new CaptureOutcome(0, 0, true, ''))).assertTrue();
      expect(captureSucceeded(new CaptureOutcome(1, 0, true, ''))).assertFalse();
      expect(state.canPublish() === (state.peek() !== '')).assertTrue();
    });
    /**
     * @tc.name CaptureResultTest_case_050
     * @tc.desc capture: callback outcome failure keeps imagePath consistent (CaptureResultTest case 50)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CaptureResultTest_case_050', 0, async () => {
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
     * @tc.name CaptureResultTest_case_051
     * @tc.desc capture: callback outcome failure keeps imagePath consistent (CaptureResultTest case 51)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CaptureResultTest_case_051', 0, async () => {
      const outcome: CaptureOutcome = new CaptureOutcome(13900001, 0, false, 'datashare:///media/photo/3', 'msg');
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
     * @tc.name CaptureResultTest_case_052
     * @tc.desc capture: callback outcome failure keeps imagePath empty (CaptureResultTest case 52)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CaptureResultTest_case_052', 0, async () => {
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
     * @tc.name CaptureResultTest_case_053
     * @tc.desc capture: callback outcome success keeps imagePath consistent (CaptureResultTest case 53)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CaptureResultTest_case_053', 0, async () => {
      const outcome: CaptureOutcome = new CaptureOutcome(0, 0, true, 'file://media/Photo/1/IMG_0001.jpg', 'msg');
      expect(captureSucceeded(outcome)).assertTrue();
      const state: CaptureState = new CaptureState();
      expect(state.onCaptureResult(outcome)).assertTrue();
      expect(state.canPublish()).assertTrue();
      expect(state.peek()).assertEqual('file://media/Photo/1/IMG_0001.jpg');
      expect(state.captures).assertEqual(1);
      expect(extractResourceUri(outcome)).assertEqual('file://media/Photo/1/IMG_0001.jpg');
      expect(captureSucceeded(new CaptureOutcome(0, 0, true, ''))).assertTrue();
      expect(captureSucceeded(new CaptureOutcome(1, 0, true, ''))).assertFalse();
      expect(state.canPublish() === (state.peek() !== '')).assertTrue();
    });
    /**
     * @tc.name CaptureResultTest_case_054
     * @tc.desc capture: callback outcome failure keeps imagePath consistent (CaptureResultTest case 54)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CaptureResultTest_case_054', 0, async () => {
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
     * @tc.name CaptureResultTest_case_055
     * @tc.desc capture: callback outcome failure keeps imagePath consistent (CaptureResultTest case 55)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CaptureResultTest_case_055', 0, async () => {
      const outcome: CaptureOutcome = new CaptureOutcome(13900001, 0, false, 'datashare:///media/photo/3', 'msg');
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
  });
}
