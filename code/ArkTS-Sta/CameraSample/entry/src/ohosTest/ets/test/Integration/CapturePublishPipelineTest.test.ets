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

export default function CapturePublishPipelineTest(): void {
  describe('CapturePublishPipelineTest', () => {
    beforeAll(() => {
      logSuite('CapturePublishPipelineTest', 'begin');
    });
    beforeEach(async () => {
      await yieldTick();
    });
    afterAll(() => {
      logSuite('CapturePublishPipelineTest', 'end');
    });

    /**
     * @tc.name CapturePublishPipelineTest_case_001
     * @tc.desc pipeline: capture result becomes the next published feed entry 1 (CapturePublishPipelineTest case 1)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CapturePublishPipelineTest_case_001', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      const outcome: CaptureOutcome = new CaptureOutcome(0, 0, true, imageUriFor(1), 'ok');
      const state: CaptureState = new CaptureState();
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(state.onCaptureResult(outcome)).assertTrue();
      expect(state.canPublish()).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'capture 1', 'app.media.icon_comment_app_logo2', '02-07 13:25', [state.peek()]);
      const journal: CommentJournal = new CommentJournal();
      expect(journal.appendDraft(draft) !== undefined).assertTrue();
      expect(journal.size()).assertEqual(1);
      const latest: Comment | undefined = journal.latest();
      expect(latest === undefined).assertFalse();
      if (latest !== undefined) {
        expect(latest.images.length).assertEqual(1);
      }
      expect(state.consume()).assertEqual(draft.images[0]);
      expect(state.canPublish()).assertFalse();
    });
    /**
     * @tc.name CapturePublishPipelineTest_case_002
     * @tc.desc pipeline: capture result becomes the next published feed entry 2 (CapturePublishPipelineTest case 2)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CapturePublishPipelineTest_case_002', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      const outcome: CaptureOutcome = new CaptureOutcome(0, 0, true, imageUriFor(2), 'ok');
      const state: CaptureState = new CaptureState();
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(state.onCaptureResult(outcome)).assertTrue();
      expect(state.canPublish()).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'capture 2', 'app.media.icon_comment_app_logo2', '02-07 13:25', [state.peek()]);
      const journal: CommentJournal = new CommentJournal();
      expect(journal.appendDraft(draft) !== undefined).assertTrue();
      expect(journal.size()).assertEqual(1);
      const latest: Comment | undefined = journal.latest();
      expect(latest === undefined).assertFalse();
      if (latest !== undefined) {
        expect(latest.images.length).assertEqual(1);
      }
      expect(state.consume()).assertEqual(draft.images[0]);
      expect(state.canPublish()).assertFalse();
    });
    /**
     * @tc.name CapturePublishPipelineTest_case_003
     * @tc.desc pipeline: capture result becomes the next published feed entry 3 (CapturePublishPipelineTest case 3)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CapturePublishPipelineTest_case_003', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      const outcome: CaptureOutcome = new CaptureOutcome(0, 0, true, imageUriFor(3), 'ok');
      const state: CaptureState = new CaptureState();
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(state.onCaptureResult(outcome)).assertTrue();
      expect(state.canPublish()).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'capture 3', 'app.media.icon_comment_app_logo2', '02-07 13:25', [state.peek()]);
      const journal: CommentJournal = new CommentJournal();
      expect(journal.appendDraft(draft) !== undefined).assertTrue();
      expect(journal.size()).assertEqual(1);
      const latest: Comment | undefined = journal.latest();
      expect(latest === undefined).assertFalse();
      if (latest !== undefined) {
        expect(latest.images.length).assertEqual(1);
      }
      expect(state.consume()).assertEqual(draft.images[0]);
      expect(state.canPublish()).assertFalse();
    });
    /**
     * @tc.name CapturePublishPipelineTest_case_004
     * @tc.desc pipeline: capture result becomes the next published feed entry 4 (CapturePublishPipelineTest case 4)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CapturePublishPipelineTest_case_004', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      const outcome: CaptureOutcome = new CaptureOutcome(0, 0, true, imageUriFor(4), 'ok');
      const state: CaptureState = new CaptureState();
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(state.onCaptureResult(outcome)).assertTrue();
      expect(state.canPublish()).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'capture 4', 'app.media.icon_comment_app_logo2', '02-07 13:25', [state.peek()]);
      const journal: CommentJournal = new CommentJournal();
      expect(journal.appendDraft(draft) !== undefined).assertTrue();
      expect(journal.size()).assertEqual(1);
      const latest: Comment | undefined = journal.latest();
      expect(latest === undefined).assertFalse();
      if (latest !== undefined) {
        expect(latest.images.length).assertEqual(1);
      }
      expect(state.consume()).assertEqual(draft.images[0]);
      expect(state.canPublish()).assertFalse();
    });
    /**
     * @tc.name CapturePublishPipelineTest_case_005
     * @tc.desc pipeline: capture result becomes the next published feed entry 5 (CapturePublishPipelineTest case 5)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CapturePublishPipelineTest_case_005', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      const outcome: CaptureOutcome = new CaptureOutcome(0, 0, true, imageUriFor(5), 'ok');
      const state: CaptureState = new CaptureState();
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(state.onCaptureResult(outcome)).assertTrue();
      expect(state.canPublish()).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'capture 5', 'app.media.icon_comment_app_logo2', '02-07 13:25', [state.peek()]);
      const journal: CommentJournal = new CommentJournal();
      expect(journal.appendDraft(draft) !== undefined).assertTrue();
      expect(journal.size()).assertEqual(1);
      const latest: Comment | undefined = journal.latest();
      expect(latest === undefined).assertFalse();
      if (latest !== undefined) {
        expect(latest.images.length).assertEqual(1);
      }
      expect(state.consume()).assertEqual(draft.images[0]);
      expect(state.canPublish()).assertFalse();
    });
    /**
     * @tc.name CapturePublishPipelineTest_case_006
     * @tc.desc pipeline: capture result becomes the next published feed entry 6 (CapturePublishPipelineTest case 6)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CapturePublishPipelineTest_case_006', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      const outcome: CaptureOutcome = new CaptureOutcome(0, 0, true, imageUriFor(6), 'ok');
      const state: CaptureState = new CaptureState();
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(state.onCaptureResult(outcome)).assertTrue();
      expect(state.canPublish()).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'capture 6', 'app.media.icon_comment_app_logo2', '02-07 13:25', [state.peek()]);
      const journal: CommentJournal = new CommentJournal();
      expect(journal.appendDraft(draft) !== undefined).assertTrue();
      expect(journal.size()).assertEqual(1);
      const latest: Comment | undefined = journal.latest();
      expect(latest === undefined).assertFalse();
      if (latest !== undefined) {
        expect(latest.images.length).assertEqual(1);
      }
      expect(state.consume()).assertEqual(draft.images[0]);
      expect(state.canPublish()).assertFalse();
    });
    /**
     * @tc.name CapturePublishPipelineTest_case_007
     * @tc.desc pipeline: capture result becomes the next published feed entry 7 (CapturePublishPipelineTest case 7)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CapturePublishPipelineTest_case_007', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      const outcome: CaptureOutcome = new CaptureOutcome(0, 0, true, imageUriFor(7), 'ok');
      const state: CaptureState = new CaptureState();
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(state.onCaptureResult(outcome)).assertTrue();
      expect(state.canPublish()).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'capture 7', 'app.media.icon_comment_app_logo2', '02-07 13:25', [state.peek()]);
      const journal: CommentJournal = new CommentJournal();
      expect(journal.appendDraft(draft) !== undefined).assertTrue();
      expect(journal.size()).assertEqual(1);
      const latest: Comment | undefined = journal.latest();
      expect(latest === undefined).assertFalse();
      if (latest !== undefined) {
        expect(latest.images.length).assertEqual(1);
      }
      expect(state.consume()).assertEqual(draft.images[0]);
      expect(state.canPublish()).assertFalse();
    });
    /**
     * @tc.name CapturePublishPipelineTest_case_008
     * @tc.desc pipeline: capture result becomes the next published feed entry 8 (CapturePublishPipelineTest case 8)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CapturePublishPipelineTest_case_008', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      const outcome: CaptureOutcome = new CaptureOutcome(0, 0, true, imageUriFor(8), 'ok');
      const state: CaptureState = new CaptureState();
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(state.onCaptureResult(outcome)).assertTrue();
      expect(state.canPublish()).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'capture 8', 'app.media.icon_comment_app_logo2', '02-07 13:25', [state.peek()]);
      const journal: CommentJournal = new CommentJournal();
      expect(journal.appendDraft(draft) !== undefined).assertTrue();
      expect(journal.size()).assertEqual(1);
      const latest: Comment | undefined = journal.latest();
      expect(latest === undefined).assertFalse();
      if (latest !== undefined) {
        expect(latest.images.length).assertEqual(1);
      }
      expect(state.consume()).assertEqual(draft.images[0]);
      expect(state.canPublish()).assertFalse();
    });
    /**
     * @tc.name CapturePublishPipelineTest_case_009
     * @tc.desc pipeline: capture result becomes the next published feed entry 9 (CapturePublishPipelineTest case 9)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CapturePublishPipelineTest_case_009', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      const outcome: CaptureOutcome = new CaptureOutcome(0, 0, true, imageUriFor(9), 'ok');
      const state: CaptureState = new CaptureState();
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(state.onCaptureResult(outcome)).assertTrue();
      expect(state.canPublish()).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'capture 9', 'app.media.icon_comment_app_logo2', '02-07 13:25', [state.peek()]);
      const journal: CommentJournal = new CommentJournal();
      expect(journal.appendDraft(draft) !== undefined).assertTrue();
      expect(journal.size()).assertEqual(1);
      const latest: Comment | undefined = journal.latest();
      expect(latest === undefined).assertFalse();
      if (latest !== undefined) {
        expect(latest.images.length).assertEqual(1);
      }
      expect(state.consume()).assertEqual(draft.images[0]);
      expect(state.canPublish()).assertFalse();
    });
    /**
     * @tc.name CapturePublishPipelineTest_case_010
     * @tc.desc pipeline: capture result becomes the next published feed entry 10 (CapturePublishPipelineTest case 10)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CapturePublishPipelineTest_case_010', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      const outcome: CaptureOutcome = new CaptureOutcome(0, 0, true, imageUriFor(10), 'ok');
      const state: CaptureState = new CaptureState();
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(state.onCaptureResult(outcome)).assertTrue();
      expect(state.canPublish()).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'capture 10', 'app.media.icon_comment_app_logo2', '02-07 13:25', [state.peek()]);
      const journal: CommentJournal = new CommentJournal();
      expect(journal.appendDraft(draft) !== undefined).assertTrue();
      expect(journal.size()).assertEqual(1);
      const latest: Comment | undefined = journal.latest();
      expect(latest === undefined).assertFalse();
      if (latest !== undefined) {
        expect(latest.images.length).assertEqual(1);
      }
      expect(state.consume()).assertEqual(draft.images[0]);
      expect(state.canPublish()).assertFalse();
    });
    /**
     * @tc.name CapturePublishPipelineTest_case_011
     * @tc.desc pipeline: capture result becomes the next published feed entry 11 (CapturePublishPipelineTest case 11)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CapturePublishPipelineTest_case_011', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      const outcome: CaptureOutcome = new CaptureOutcome(0, 0, true, imageUriFor(11), 'ok');
      const state: CaptureState = new CaptureState();
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(state.onCaptureResult(outcome)).assertTrue();
      expect(state.canPublish()).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'capture 11', 'app.media.icon_comment_app_logo2', '02-07 13:25', [state.peek()]);
      const journal: CommentJournal = new CommentJournal();
      expect(journal.appendDraft(draft) !== undefined).assertTrue();
      expect(journal.size()).assertEqual(1);
      const latest: Comment | undefined = journal.latest();
      expect(latest === undefined).assertFalse();
      if (latest !== undefined) {
        expect(latest.images.length).assertEqual(1);
      }
      expect(state.consume()).assertEqual(draft.images[0]);
      expect(state.canPublish()).assertFalse();
    });
    /**
     * @tc.name CapturePublishPipelineTest_case_012
     * @tc.desc pipeline: capture result becomes the next published feed entry 12 (CapturePublishPipelineTest case 12)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CapturePublishPipelineTest_case_012', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      const outcome: CaptureOutcome = new CaptureOutcome(0, 0, true, imageUriFor(12), 'ok');
      const state: CaptureState = new CaptureState();
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(state.onCaptureResult(outcome)).assertTrue();
      expect(state.canPublish()).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'capture 12', 'app.media.icon_comment_app_logo2', '02-07 13:25', [state.peek()]);
      const journal: CommentJournal = new CommentJournal();
      expect(journal.appendDraft(draft) !== undefined).assertTrue();
      expect(journal.size()).assertEqual(1);
      const latest: Comment | undefined = journal.latest();
      expect(latest === undefined).assertFalse();
      if (latest !== undefined) {
        expect(latest.images.length).assertEqual(1);
      }
      expect(state.consume()).assertEqual(draft.images[0]);
      expect(state.canPublish()).assertFalse();
    });
    /**
     * @tc.name CapturePublishPipelineTest_case_013
     * @tc.desc pipeline: capture result becomes the next published feed entry 13 (CapturePublishPipelineTest case 13)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CapturePublishPipelineTest_case_013', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      const outcome: CaptureOutcome = new CaptureOutcome(0, 0, true, imageUriFor(13), 'ok');
      const state: CaptureState = new CaptureState();
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(state.onCaptureResult(outcome)).assertTrue();
      expect(state.canPublish()).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'capture 13', 'app.media.icon_comment_app_logo2', '02-07 13:25', [state.peek()]);
      const journal: CommentJournal = new CommentJournal();
      expect(journal.appendDraft(draft) !== undefined).assertTrue();
      expect(journal.size()).assertEqual(1);
      const latest: Comment | undefined = journal.latest();
      expect(latest === undefined).assertFalse();
      if (latest !== undefined) {
        expect(latest.images.length).assertEqual(1);
      }
      expect(state.consume()).assertEqual(draft.images[0]);
      expect(state.canPublish()).assertFalse();
    });
    /**
     * @tc.name CapturePublishPipelineTest_case_014
     * @tc.desc pipeline: capture result becomes the next published feed entry 14 (CapturePublishPipelineTest case 14)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CapturePublishPipelineTest_case_014', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      const outcome: CaptureOutcome = new CaptureOutcome(0, 0, true, imageUriFor(14), 'ok');
      const state: CaptureState = new CaptureState();
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(state.onCaptureResult(outcome)).assertTrue();
      expect(state.canPublish()).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'capture 14', 'app.media.icon_comment_app_logo2', '02-07 13:25', [state.peek()]);
      const journal: CommentJournal = new CommentJournal();
      expect(journal.appendDraft(draft) !== undefined).assertTrue();
      expect(journal.size()).assertEqual(1);
      const latest: Comment | undefined = journal.latest();
      expect(latest === undefined).assertFalse();
      if (latest !== undefined) {
        expect(latest.images.length).assertEqual(1);
      }
      expect(state.consume()).assertEqual(draft.images[0]);
      expect(state.canPublish()).assertFalse();
    });
    /**
     * @tc.name CapturePublishPipelineTest_case_015
     * @tc.desc pipeline: capture result becomes the next published feed entry 15 (CapturePublishPipelineTest case 15)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CapturePublishPipelineTest_case_015', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      const outcome: CaptureOutcome = new CaptureOutcome(0, 0, true, imageUriFor(15), 'ok');
      const state: CaptureState = new CaptureState();
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(state.onCaptureResult(outcome)).assertTrue();
      expect(state.canPublish()).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'capture 15', 'app.media.icon_comment_app_logo2', '02-07 13:25', [state.peek()]);
      const journal: CommentJournal = new CommentJournal();
      expect(journal.appendDraft(draft) !== undefined).assertTrue();
      expect(journal.size()).assertEqual(1);
      const latest: Comment | undefined = journal.latest();
      expect(latest === undefined).assertFalse();
      if (latest !== undefined) {
        expect(latest.images.length).assertEqual(1);
      }
      expect(state.consume()).assertEqual(draft.images[0]);
      expect(state.canPublish()).assertFalse();
    });
    /**
     * @tc.name CapturePublishPipelineTest_case_016
     * @tc.desc pipeline: capture result becomes the next published feed entry 16 (CapturePublishPipelineTest case 16)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CapturePublishPipelineTest_case_016', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      const outcome: CaptureOutcome = new CaptureOutcome(0, 0, true, imageUriFor(16), 'ok');
      const state: CaptureState = new CaptureState();
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(state.onCaptureResult(outcome)).assertTrue();
      expect(state.canPublish()).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'capture 16', 'app.media.icon_comment_app_logo2', '02-07 13:25', [state.peek()]);
      const journal: CommentJournal = new CommentJournal();
      expect(journal.appendDraft(draft) !== undefined).assertTrue();
      expect(journal.size()).assertEqual(1);
      const latest: Comment | undefined = journal.latest();
      expect(latest === undefined).assertFalse();
      if (latest !== undefined) {
        expect(latest.images.length).assertEqual(1);
      }
      expect(state.consume()).assertEqual(draft.images[0]);
      expect(state.canPublish()).assertFalse();
    });
    /**
     * @tc.name CapturePublishPipelineTest_case_017
     * @tc.desc pipeline: capture result becomes the next published feed entry 17 (CapturePublishPipelineTest case 17)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CapturePublishPipelineTest_case_017', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      const outcome: CaptureOutcome = new CaptureOutcome(0, 0, true, imageUriFor(17), 'ok');
      const state: CaptureState = new CaptureState();
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(state.onCaptureResult(outcome)).assertTrue();
      expect(state.canPublish()).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'capture 17', 'app.media.icon_comment_app_logo2', '02-07 13:25', [state.peek()]);
      const journal: CommentJournal = new CommentJournal();
      expect(journal.appendDraft(draft) !== undefined).assertTrue();
      expect(journal.size()).assertEqual(1);
      const latest: Comment | undefined = journal.latest();
      expect(latest === undefined).assertFalse();
      if (latest !== undefined) {
        expect(latest.images.length).assertEqual(1);
      }
      expect(state.consume()).assertEqual(draft.images[0]);
      expect(state.canPublish()).assertFalse();
    });
    /**
     * @tc.name CapturePublishPipelineTest_case_018
     * @tc.desc pipeline: capture result becomes the next published feed entry 18 (CapturePublishPipelineTest case 18)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CapturePublishPipelineTest_case_018', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      const outcome: CaptureOutcome = new CaptureOutcome(0, 0, true, imageUriFor(18), 'ok');
      const state: CaptureState = new CaptureState();
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(state.onCaptureResult(outcome)).assertTrue();
      expect(state.canPublish()).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'capture 18', 'app.media.icon_comment_app_logo2', '02-07 13:25', [state.peek()]);
      const journal: CommentJournal = new CommentJournal();
      expect(journal.appendDraft(draft) !== undefined).assertTrue();
      expect(journal.size()).assertEqual(1);
      const latest: Comment | undefined = journal.latest();
      expect(latest === undefined).assertFalse();
      if (latest !== undefined) {
        expect(latest.images.length).assertEqual(1);
      }
      expect(state.consume()).assertEqual(draft.images[0]);
      expect(state.canPublish()).assertFalse();
    });
    /**
     * @tc.name CapturePublishPipelineTest_case_019
     * @tc.desc pipeline: capture result becomes the next published feed entry 19 (CapturePublishPipelineTest case 19)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CapturePublishPipelineTest_case_019', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      const outcome: CaptureOutcome = new CaptureOutcome(0, 0, true, imageUriFor(19), 'ok');
      const state: CaptureState = new CaptureState();
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(state.onCaptureResult(outcome)).assertTrue();
      expect(state.canPublish()).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'capture 19', 'app.media.icon_comment_app_logo2', '02-07 13:25', [state.peek()]);
      const journal: CommentJournal = new CommentJournal();
      expect(journal.appendDraft(draft) !== undefined).assertTrue();
      expect(journal.size()).assertEqual(1);
      const latest: Comment | undefined = journal.latest();
      expect(latest === undefined).assertFalse();
      if (latest !== undefined) {
        expect(latest.images.length).assertEqual(1);
      }
      expect(state.consume()).assertEqual(draft.images[0]);
      expect(state.canPublish()).assertFalse();
    });
    /**
     * @tc.name CapturePublishPipelineTest_case_020
     * @tc.desc pipeline: capture result becomes the next published feed entry 20 (CapturePublishPipelineTest case 20)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CapturePublishPipelineTest_case_020', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      const outcome: CaptureOutcome = new CaptureOutcome(0, 0, true, imageUriFor(20), 'ok');
      const state: CaptureState = new CaptureState();
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(state.onCaptureResult(outcome)).assertTrue();
      expect(state.canPublish()).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'capture 20', 'app.media.icon_comment_app_logo2', '02-07 13:25', [state.peek()]);
      const journal: CommentJournal = new CommentJournal();
      expect(journal.appendDraft(draft) !== undefined).assertTrue();
      expect(journal.size()).assertEqual(1);
      const latest: Comment | undefined = journal.latest();
      expect(latest === undefined).assertFalse();
      if (latest !== undefined) {
        expect(latest.images.length).assertEqual(1);
      }
      expect(state.consume()).assertEqual(draft.images[0]);
      expect(state.canPublish()).assertFalse();
    });
    /**
     * @tc.name CapturePublishPipelineTest_case_021
     * @tc.desc pipeline: capture result becomes the next published feed entry 21 (CapturePublishPipelineTest case 21)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CapturePublishPipelineTest_case_021', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      const outcome: CaptureOutcome = new CaptureOutcome(0, 0, true, imageUriFor(21), 'ok');
      const state: CaptureState = new CaptureState();
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(state.onCaptureResult(outcome)).assertTrue();
      expect(state.canPublish()).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'capture 21', 'app.media.icon_comment_app_logo2', '02-07 13:25', [state.peek()]);
      const journal: CommentJournal = new CommentJournal();
      expect(journal.appendDraft(draft) !== undefined).assertTrue();
      expect(journal.size()).assertEqual(1);
      const latest: Comment | undefined = journal.latest();
      expect(latest === undefined).assertFalse();
      if (latest !== undefined) {
        expect(latest.images.length).assertEqual(1);
      }
      expect(state.consume()).assertEqual(draft.images[0]);
      expect(state.canPublish()).assertFalse();
    });
    /**
     * @tc.name CapturePublishPipelineTest_case_022
     * @tc.desc pipeline: capture result becomes the next published feed entry 22 (CapturePublishPipelineTest case 22)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CapturePublishPipelineTest_case_022', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      const outcome: CaptureOutcome = new CaptureOutcome(0, 0, true, imageUriFor(22), 'ok');
      const state: CaptureState = new CaptureState();
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(state.onCaptureResult(outcome)).assertTrue();
      expect(state.canPublish()).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'capture 22', 'app.media.icon_comment_app_logo2', '02-07 13:25', [state.peek()]);
      const journal: CommentJournal = new CommentJournal();
      expect(journal.appendDraft(draft) !== undefined).assertTrue();
      expect(journal.size()).assertEqual(1);
      const latest: Comment | undefined = journal.latest();
      expect(latest === undefined).assertFalse();
      if (latest !== undefined) {
        expect(latest.images.length).assertEqual(1);
      }
      expect(state.consume()).assertEqual(draft.images[0]);
      expect(state.canPublish()).assertFalse();
    });
    /**
     * @tc.name CapturePublishPipelineTest_case_023
     * @tc.desc pipeline: capture result becomes the next published feed entry 23 (CapturePublishPipelineTest case 23)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CapturePublishPipelineTest_case_023', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      const outcome: CaptureOutcome = new CaptureOutcome(0, 0, true, imageUriFor(23), 'ok');
      const state: CaptureState = new CaptureState();
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(state.onCaptureResult(outcome)).assertTrue();
      expect(state.canPublish()).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'capture 23', 'app.media.icon_comment_app_logo2', '02-07 13:25', [state.peek()]);
      const journal: CommentJournal = new CommentJournal();
      expect(journal.appendDraft(draft) !== undefined).assertTrue();
      expect(journal.size()).assertEqual(1);
      const latest: Comment | undefined = journal.latest();
      expect(latest === undefined).assertFalse();
      if (latest !== undefined) {
        expect(latest.images.length).assertEqual(1);
      }
      expect(state.consume()).assertEqual(draft.images[0]);
      expect(state.canPublish()).assertFalse();
    });
    /**
     * @tc.name CapturePublishPipelineTest_case_024
     * @tc.desc pipeline: capture result becomes the next published feed entry 24 (CapturePublishPipelineTest case 24)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CapturePublishPipelineTest_case_024', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      const outcome: CaptureOutcome = new CaptureOutcome(0, 0, true, imageUriFor(24), 'ok');
      const state: CaptureState = new CaptureState();
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(state.onCaptureResult(outcome)).assertTrue();
      expect(state.canPublish()).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'capture 24', 'app.media.icon_comment_app_logo2', '02-07 13:25', [state.peek()]);
      const journal: CommentJournal = new CommentJournal();
      expect(journal.appendDraft(draft) !== undefined).assertTrue();
      expect(journal.size()).assertEqual(1);
      const latest: Comment | undefined = journal.latest();
      expect(latest === undefined).assertFalse();
      if (latest !== undefined) {
        expect(latest.images.length).assertEqual(1);
      }
      expect(state.consume()).assertEqual(draft.images[0]);
      expect(state.canPublish()).assertFalse();
    });
    /**
     * @tc.name CapturePublishPipelineTest_case_025
     * @tc.desc pipeline: capture result becomes the next published feed entry 25 (CapturePublishPipelineTest case 25)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CapturePublishPipelineTest_case_025', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      const outcome: CaptureOutcome = new CaptureOutcome(0, 0, true, imageUriFor(25), 'ok');
      const state: CaptureState = new CaptureState();
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(state.onCaptureResult(outcome)).assertTrue();
      expect(state.canPublish()).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'capture 25', 'app.media.icon_comment_app_logo2', '02-07 13:25', [state.peek()]);
      const journal: CommentJournal = new CommentJournal();
      expect(journal.appendDraft(draft) !== undefined).assertTrue();
      expect(journal.size()).assertEqual(1);
      const latest: Comment | undefined = journal.latest();
      expect(latest === undefined).assertFalse();
      if (latest !== undefined) {
        expect(latest.images.length).assertEqual(1);
      }
      expect(state.consume()).assertEqual(draft.images[0]);
      expect(state.canPublish()).assertFalse();
    });
    /**
     * @tc.name CapturePublishPipelineTest_case_026
     * @tc.desc pipeline: capture result becomes the next published feed entry 26 (CapturePublishPipelineTest case 26)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CapturePublishPipelineTest_case_026', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      const outcome: CaptureOutcome = new CaptureOutcome(0, 0, true, imageUriFor(26), 'ok');
      const state: CaptureState = new CaptureState();
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(state.onCaptureResult(outcome)).assertTrue();
      expect(state.canPublish()).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'capture 26', 'app.media.icon_comment_app_logo2', '02-07 13:25', [state.peek()]);
      const journal: CommentJournal = new CommentJournal();
      expect(journal.appendDraft(draft) !== undefined).assertTrue();
      expect(journal.size()).assertEqual(1);
      const latest: Comment | undefined = journal.latest();
      expect(latest === undefined).assertFalse();
      if (latest !== undefined) {
        expect(latest.images.length).assertEqual(1);
      }
      expect(state.consume()).assertEqual(draft.images[0]);
      expect(state.canPublish()).assertFalse();
    });
    /**
     * @tc.name CapturePublishPipelineTest_case_027
     * @tc.desc pipeline: capture result becomes the next published feed entry 27 (CapturePublishPipelineTest case 27)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CapturePublishPipelineTest_case_027', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      const outcome: CaptureOutcome = new CaptureOutcome(0, 0, true, imageUriFor(27), 'ok');
      const state: CaptureState = new CaptureState();
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(state.onCaptureResult(outcome)).assertTrue();
      expect(state.canPublish()).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'capture 27', 'app.media.icon_comment_app_logo2', '02-07 13:25', [state.peek()]);
      const journal: CommentJournal = new CommentJournal();
      expect(journal.appendDraft(draft) !== undefined).assertTrue();
      expect(journal.size()).assertEqual(1);
      const latest: Comment | undefined = journal.latest();
      expect(latest === undefined).assertFalse();
      if (latest !== undefined) {
        expect(latest.images.length).assertEqual(1);
      }
      expect(state.consume()).assertEqual(draft.images[0]);
      expect(state.canPublish()).assertFalse();
    });
    /**
     * @tc.name CapturePublishPipelineTest_case_028
     * @tc.desc pipeline: capture result becomes the next published feed entry 28 (CapturePublishPipelineTest case 28)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CapturePublishPipelineTest_case_028', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      const outcome: CaptureOutcome = new CaptureOutcome(0, 0, true, imageUriFor(28), 'ok');
      const state: CaptureState = new CaptureState();
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(state.onCaptureResult(outcome)).assertTrue();
      expect(state.canPublish()).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'capture 28', 'app.media.icon_comment_app_logo2', '02-07 13:25', [state.peek()]);
      const journal: CommentJournal = new CommentJournal();
      expect(journal.appendDraft(draft) !== undefined).assertTrue();
      expect(journal.size()).assertEqual(1);
      const latest: Comment | undefined = journal.latest();
      expect(latest === undefined).assertFalse();
      if (latest !== undefined) {
        expect(latest.images.length).assertEqual(1);
      }
      expect(state.consume()).assertEqual(draft.images[0]);
      expect(state.canPublish()).assertFalse();
    });
    /**
     * @tc.name CapturePublishPipelineTest_case_029
     * @tc.desc pipeline: capture result becomes the next published feed entry 29 (CapturePublishPipelineTest case 29)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CapturePublishPipelineTest_case_029', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      const outcome: CaptureOutcome = new CaptureOutcome(0, 0, true, imageUriFor(29), 'ok');
      const state: CaptureState = new CaptureState();
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(state.onCaptureResult(outcome)).assertTrue();
      expect(state.canPublish()).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'capture 29', 'app.media.icon_comment_app_logo2', '02-07 13:25', [state.peek()]);
      const journal: CommentJournal = new CommentJournal();
      expect(journal.appendDraft(draft) !== undefined).assertTrue();
      expect(journal.size()).assertEqual(1);
      const latest: Comment | undefined = journal.latest();
      expect(latest === undefined).assertFalse();
      if (latest !== undefined) {
        expect(latest.images.length).assertEqual(1);
      }
      expect(state.consume()).assertEqual(draft.images[0]);
      expect(state.canPublish()).assertFalse();
    });
    /**
     * @tc.name CapturePublishPipelineTest_case_030
     * @tc.desc pipeline: capture result becomes the next published feed entry 30 (CapturePublishPipelineTest case 30)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CapturePublishPipelineTest_case_030', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      const outcome: CaptureOutcome = new CaptureOutcome(0, 0, true, imageUriFor(30), 'ok');
      const state: CaptureState = new CaptureState();
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(state.onCaptureResult(outcome)).assertTrue();
      expect(state.canPublish()).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'capture 30', 'app.media.icon_comment_app_logo2', '02-07 13:25', [state.peek()]);
      const journal: CommentJournal = new CommentJournal();
      expect(journal.appendDraft(draft) !== undefined).assertTrue();
      expect(journal.size()).assertEqual(1);
      const latest: Comment | undefined = journal.latest();
      expect(latest === undefined).assertFalse();
      if (latest !== undefined) {
        expect(latest.images.length).assertEqual(1);
      }
      expect(state.consume()).assertEqual(draft.images[0]);
      expect(state.canPublish()).assertFalse();
    });
    /**
     * @tc.name CapturePublishPipelineTest_case_031
     * @tc.desc pipeline: capture result becomes the next published feed entry 31 (CapturePublishPipelineTest case 31)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CapturePublishPipelineTest_case_031', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      const outcome: CaptureOutcome = new CaptureOutcome(0, 0, true, imageUriFor(31), 'ok');
      const state: CaptureState = new CaptureState();
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(state.onCaptureResult(outcome)).assertTrue();
      expect(state.canPublish()).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'capture 31', 'app.media.icon_comment_app_logo2', '02-07 13:25', [state.peek()]);
      const journal: CommentJournal = new CommentJournal();
      expect(journal.appendDraft(draft) !== undefined).assertTrue();
      expect(journal.size()).assertEqual(1);
      const latest: Comment | undefined = journal.latest();
      expect(latest === undefined).assertFalse();
      if (latest !== undefined) {
        expect(latest.images.length).assertEqual(1);
      }
      expect(state.consume()).assertEqual(draft.images[0]);
      expect(state.canPublish()).assertFalse();
    });
    /**
     * @tc.name CapturePublishPipelineTest_case_032
     * @tc.desc pipeline: capture result becomes the next published feed entry 32 (CapturePublishPipelineTest case 32)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CapturePublishPipelineTest_case_032', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      const outcome: CaptureOutcome = new CaptureOutcome(0, 0, true, imageUriFor(32), 'ok');
      const state: CaptureState = new CaptureState();
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(state.onCaptureResult(outcome)).assertTrue();
      expect(state.canPublish()).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'capture 32', 'app.media.icon_comment_app_logo2', '02-07 13:25', [state.peek()]);
      const journal: CommentJournal = new CommentJournal();
      expect(journal.appendDraft(draft) !== undefined).assertTrue();
      expect(journal.size()).assertEqual(1);
      const latest: Comment | undefined = journal.latest();
      expect(latest === undefined).assertFalse();
      if (latest !== undefined) {
        expect(latest.images.length).assertEqual(1);
      }
      expect(state.consume()).assertEqual(draft.images[0]);
      expect(state.canPublish()).assertFalse();
    });
    /**
     * @tc.name CapturePublishPipelineTest_case_033
     * @tc.desc pipeline: capture result becomes the next published feed entry 33 (CapturePublishPipelineTest case 33)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CapturePublishPipelineTest_case_033', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      const outcome: CaptureOutcome = new CaptureOutcome(0, 0, true, imageUriFor(33), 'ok');
      const state: CaptureState = new CaptureState();
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(state.onCaptureResult(outcome)).assertTrue();
      expect(state.canPublish()).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'capture 33', 'app.media.icon_comment_app_logo2', '02-07 13:25', [state.peek()]);
      const journal: CommentJournal = new CommentJournal();
      expect(journal.appendDraft(draft) !== undefined).assertTrue();
      expect(journal.size()).assertEqual(1);
      const latest: Comment | undefined = journal.latest();
      expect(latest === undefined).assertFalse();
      if (latest !== undefined) {
        expect(latest.images.length).assertEqual(1);
      }
      expect(state.consume()).assertEqual(draft.images[0]);
      expect(state.canPublish()).assertFalse();
    });
    /**
     * @tc.name CapturePublishPipelineTest_case_034
     * @tc.desc pipeline: capture result becomes the next published feed entry 34 (CapturePublishPipelineTest case 34)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CapturePublishPipelineTest_case_034', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      const outcome: CaptureOutcome = new CaptureOutcome(0, 0, true, imageUriFor(34), 'ok');
      const state: CaptureState = new CaptureState();
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(state.onCaptureResult(outcome)).assertTrue();
      expect(state.canPublish()).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'capture 34', 'app.media.icon_comment_app_logo2', '02-07 13:25', [state.peek()]);
      const journal: CommentJournal = new CommentJournal();
      expect(journal.appendDraft(draft) !== undefined).assertTrue();
      expect(journal.size()).assertEqual(1);
      const latest: Comment | undefined = journal.latest();
      expect(latest === undefined).assertFalse();
      if (latest !== undefined) {
        expect(latest.images.length).assertEqual(1);
      }
      expect(state.consume()).assertEqual(draft.images[0]);
      expect(state.canPublish()).assertFalse();
    });
    /**
     * @tc.name CapturePublishPipelineTest_case_035
     * @tc.desc pipeline: capture result becomes the next published feed entry 35 (CapturePublishPipelineTest case 35)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CapturePublishPipelineTest_case_035', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      const outcome: CaptureOutcome = new CaptureOutcome(0, 0, true, imageUriFor(35), 'ok');
      const state: CaptureState = new CaptureState();
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(state.onCaptureResult(outcome)).assertTrue();
      expect(state.canPublish()).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'capture 35', 'app.media.icon_comment_app_logo2', '02-07 13:25', [state.peek()]);
      const journal: CommentJournal = new CommentJournal();
      expect(journal.appendDraft(draft) !== undefined).assertTrue();
      expect(journal.size()).assertEqual(1);
      const latest: Comment | undefined = journal.latest();
      expect(latest === undefined).assertFalse();
      if (latest !== undefined) {
        expect(latest.images.length).assertEqual(1);
      }
      expect(state.consume()).assertEqual(draft.images[0]);
      expect(state.canPublish()).assertFalse();
    });
    /**
     * @tc.name CapturePublishPipelineTest_case_036
     * @tc.desc pipeline: capture result becomes the next published feed entry 36 (CapturePublishPipelineTest case 36)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CapturePublishPipelineTest_case_036', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      const outcome: CaptureOutcome = new CaptureOutcome(0, 0, true, imageUriFor(36), 'ok');
      const state: CaptureState = new CaptureState();
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(state.onCaptureResult(outcome)).assertTrue();
      expect(state.canPublish()).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'capture 36', 'app.media.icon_comment_app_logo2', '02-07 13:25', [state.peek()]);
      const journal: CommentJournal = new CommentJournal();
      expect(journal.appendDraft(draft) !== undefined).assertTrue();
      expect(journal.size()).assertEqual(1);
      const latest: Comment | undefined = journal.latest();
      expect(latest === undefined).assertFalse();
      if (latest !== undefined) {
        expect(latest.images.length).assertEqual(1);
      }
      expect(state.consume()).assertEqual(draft.images[0]);
      expect(state.canPublish()).assertFalse();
    });
    /**
     * @tc.name CapturePublishPipelineTest_case_037
     * @tc.desc pipeline: capture result becomes the next published feed entry 37 (CapturePublishPipelineTest case 37)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CapturePublishPipelineTest_case_037', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      const outcome: CaptureOutcome = new CaptureOutcome(0, 0, true, imageUriFor(37), 'ok');
      const state: CaptureState = new CaptureState();
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(state.onCaptureResult(outcome)).assertTrue();
      expect(state.canPublish()).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'capture 37', 'app.media.icon_comment_app_logo2', '02-07 13:25', [state.peek()]);
      const journal: CommentJournal = new CommentJournal();
      expect(journal.appendDraft(draft) !== undefined).assertTrue();
      expect(journal.size()).assertEqual(1);
      const latest: Comment | undefined = journal.latest();
      expect(latest === undefined).assertFalse();
      if (latest !== undefined) {
        expect(latest.images.length).assertEqual(1);
      }
      expect(state.consume()).assertEqual(draft.images[0]);
      expect(state.canPublish()).assertFalse();
    });
    /**
     * @tc.name CapturePublishPipelineTest_case_038
     * @tc.desc pipeline: capture result becomes the next published feed entry 38 (CapturePublishPipelineTest case 38)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CapturePublishPipelineTest_case_038', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      const outcome: CaptureOutcome = new CaptureOutcome(0, 0, true, imageUriFor(38), 'ok');
      const state: CaptureState = new CaptureState();
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(state.onCaptureResult(outcome)).assertTrue();
      expect(state.canPublish()).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'capture 38', 'app.media.icon_comment_app_logo2', '02-07 13:25', [state.peek()]);
      const journal: CommentJournal = new CommentJournal();
      expect(journal.appendDraft(draft) !== undefined).assertTrue();
      expect(journal.size()).assertEqual(1);
      const latest: Comment | undefined = journal.latest();
      expect(latest === undefined).assertFalse();
      if (latest !== undefined) {
        expect(latest.images.length).assertEqual(1);
      }
      expect(state.consume()).assertEqual(draft.images[0]);
      expect(state.canPublish()).assertFalse();
    });
    /**
     * @tc.name CapturePublishPipelineTest_case_039
     * @tc.desc pipeline: capture result becomes the next published feed entry 39 (CapturePublishPipelineTest case 39)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CapturePublishPipelineTest_case_039', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      const outcome: CaptureOutcome = new CaptureOutcome(0, 0, true, imageUriFor(39), 'ok');
      const state: CaptureState = new CaptureState();
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(state.onCaptureResult(outcome)).assertTrue();
      expect(state.canPublish()).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'capture 39', 'app.media.icon_comment_app_logo2', '02-07 13:25', [state.peek()]);
      const journal: CommentJournal = new CommentJournal();
      expect(journal.appendDraft(draft) !== undefined).assertTrue();
      expect(journal.size()).assertEqual(1);
      const latest: Comment | undefined = journal.latest();
      expect(latest === undefined).assertFalse();
      if (latest !== undefined) {
        expect(latest.images.length).assertEqual(1);
      }
      expect(state.consume()).assertEqual(draft.images[0]);
      expect(state.canPublish()).assertFalse();
    });
    /**
     * @tc.name CapturePublishPipelineTest_case_040
     * @tc.desc pipeline: capture result becomes the next published feed entry 40 (CapturePublishPipelineTest case 40)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CapturePublishPipelineTest_case_040', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      const outcome: CaptureOutcome = new CaptureOutcome(0, 0, true, imageUriFor(40), 'ok');
      const state: CaptureState = new CaptureState();
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(state.onCaptureResult(outcome)).assertTrue();
      expect(state.canPublish()).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'capture 40', 'app.media.icon_comment_app_logo2', '02-07 13:25', [state.peek()]);
      const journal: CommentJournal = new CommentJournal();
      expect(journal.appendDraft(draft) !== undefined).assertTrue();
      expect(journal.size()).assertEqual(1);
      const latest: Comment | undefined = journal.latest();
      expect(latest === undefined).assertFalse();
      if (latest !== undefined) {
        expect(latest.images.length).assertEqual(1);
      }
      expect(state.consume()).assertEqual(draft.images[0]);
      expect(state.canPublish()).assertFalse();
    });
    /**
     * @tc.name CapturePublishPipelineTest_case_041
     * @tc.desc pipeline: capture result becomes the next published feed entry 41 (CapturePublishPipelineTest case 41)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CapturePublishPipelineTest_case_041', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      const outcome: CaptureOutcome = new CaptureOutcome(0, 0, true, imageUriFor(41), 'ok');
      const state: CaptureState = new CaptureState();
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(state.onCaptureResult(outcome)).assertTrue();
      expect(state.canPublish()).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'capture 41', 'app.media.icon_comment_app_logo2', '02-07 13:25', [state.peek()]);
      const journal: CommentJournal = new CommentJournal();
      expect(journal.appendDraft(draft) !== undefined).assertTrue();
      expect(journal.size()).assertEqual(1);
      const latest: Comment | undefined = journal.latest();
      expect(latest === undefined).assertFalse();
      if (latest !== undefined) {
        expect(latest.images.length).assertEqual(1);
      }
      expect(state.consume()).assertEqual(draft.images[0]);
      expect(state.canPublish()).assertFalse();
    });
    /**
     * @tc.name CapturePublishPipelineTest_case_042
     * @tc.desc pipeline: capture result becomes the next published feed entry 42 (CapturePublishPipelineTest case 42)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CapturePublishPipelineTest_case_042', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      const outcome: CaptureOutcome = new CaptureOutcome(0, 0, true, imageUriFor(42), 'ok');
      const state: CaptureState = new CaptureState();
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(state.onCaptureResult(outcome)).assertTrue();
      expect(state.canPublish()).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'capture 42', 'app.media.icon_comment_app_logo2', '02-07 13:25', [state.peek()]);
      const journal: CommentJournal = new CommentJournal();
      expect(journal.appendDraft(draft) !== undefined).assertTrue();
      expect(journal.size()).assertEqual(1);
      const latest: Comment | undefined = journal.latest();
      expect(latest === undefined).assertFalse();
      if (latest !== undefined) {
        expect(latest.images.length).assertEqual(1);
      }
      expect(state.consume()).assertEqual(draft.images[0]);
      expect(state.canPublish()).assertFalse();
    });
    /**
     * @tc.name CapturePublishPipelineTest_case_043
     * @tc.desc pipeline: capture result becomes the next published feed entry 43 (CapturePublishPipelineTest case 43)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CapturePublishPipelineTest_case_043', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      const outcome: CaptureOutcome = new CaptureOutcome(0, 0, true, imageUriFor(43), 'ok');
      const state: CaptureState = new CaptureState();
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(state.onCaptureResult(outcome)).assertTrue();
      expect(state.canPublish()).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'capture 43', 'app.media.icon_comment_app_logo2', '02-07 13:25', [state.peek()]);
      const journal: CommentJournal = new CommentJournal();
      expect(journal.appendDraft(draft) !== undefined).assertTrue();
      expect(journal.size()).assertEqual(1);
      const latest: Comment | undefined = journal.latest();
      expect(latest === undefined).assertFalse();
      if (latest !== undefined) {
        expect(latest.images.length).assertEqual(1);
      }
      expect(state.consume()).assertEqual(draft.images[0]);
      expect(state.canPublish()).assertFalse();
    });
    /**
     * @tc.name CapturePublishPipelineTest_case_044
     * @tc.desc pipeline: capture result becomes the next published feed entry 44 (CapturePublishPipelineTest case 44)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CapturePublishPipelineTest_case_044', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      const outcome: CaptureOutcome = new CaptureOutcome(0, 0, true, imageUriFor(44), 'ok');
      const state: CaptureState = new CaptureState();
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(state.onCaptureResult(outcome)).assertTrue();
      expect(state.canPublish()).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'capture 44', 'app.media.icon_comment_app_logo2', '02-07 13:25', [state.peek()]);
      const journal: CommentJournal = new CommentJournal();
      expect(journal.appendDraft(draft) !== undefined).assertTrue();
      expect(journal.size()).assertEqual(1);
      const latest: Comment | undefined = journal.latest();
      expect(latest === undefined).assertFalse();
      if (latest !== undefined) {
        expect(latest.images.length).assertEqual(1);
      }
      expect(state.consume()).assertEqual(draft.images[0]);
      expect(state.canPublish()).assertFalse();
    });
    /**
     * @tc.name CapturePublishPipelineTest_case_045
     * @tc.desc pipeline: capture result becomes the next published feed entry 45 (CapturePublishPipelineTest case 45)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CapturePublishPipelineTest_case_045', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      const outcome: CaptureOutcome = new CaptureOutcome(0, 0, true, imageUriFor(45), 'ok');
      const state: CaptureState = new CaptureState();
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(state.onCaptureResult(outcome)).assertTrue();
      expect(state.canPublish()).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'capture 45', 'app.media.icon_comment_app_logo2', '02-07 13:25', [state.peek()]);
      const journal: CommentJournal = new CommentJournal();
      expect(journal.appendDraft(draft) !== undefined).assertTrue();
      expect(journal.size()).assertEqual(1);
      const latest: Comment | undefined = journal.latest();
      expect(latest === undefined).assertFalse();
      if (latest !== undefined) {
        expect(latest.images.length).assertEqual(1);
      }
      expect(state.consume()).assertEqual(draft.images[0]);
      expect(state.canPublish()).assertFalse();
    });
    /**
     * @tc.name CapturePublishPipelineTest_case_046
     * @tc.desc pipeline: capture result becomes the next published feed entry 46 (CapturePublishPipelineTest case 46)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CapturePublishPipelineTest_case_046', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      const outcome: CaptureOutcome = new CaptureOutcome(0, 0, true, imageUriFor(46), 'ok');
      const state: CaptureState = new CaptureState();
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(state.onCaptureResult(outcome)).assertTrue();
      expect(state.canPublish()).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'capture 46', 'app.media.icon_comment_app_logo2', '02-07 13:25', [state.peek()]);
      const journal: CommentJournal = new CommentJournal();
      expect(journal.appendDraft(draft) !== undefined).assertTrue();
      expect(journal.size()).assertEqual(1);
      const latest: Comment | undefined = journal.latest();
      expect(latest === undefined).assertFalse();
      if (latest !== undefined) {
        expect(latest.images.length).assertEqual(1);
      }
      expect(state.consume()).assertEqual(draft.images[0]);
      expect(state.canPublish()).assertFalse();
    });
    /**
     * @tc.name CapturePublishPipelineTest_case_047
     * @tc.desc pipeline: capture result becomes the next published feed entry 47 (CapturePublishPipelineTest case 47)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CapturePublishPipelineTest_case_047', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      const outcome: CaptureOutcome = new CaptureOutcome(0, 0, true, imageUriFor(47), 'ok');
      const state: CaptureState = new CaptureState();
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(state.onCaptureResult(outcome)).assertTrue();
      expect(state.canPublish()).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'capture 47', 'app.media.icon_comment_app_logo2', '02-07 13:25', [state.peek()]);
      const journal: CommentJournal = new CommentJournal();
      expect(journal.appendDraft(draft) !== undefined).assertTrue();
      expect(journal.size()).assertEqual(1);
      const latest: Comment | undefined = journal.latest();
      expect(latest === undefined).assertFalse();
      if (latest !== undefined) {
        expect(latest.images.length).assertEqual(1);
      }
      expect(state.consume()).assertEqual(draft.images[0]);
      expect(state.canPublish()).assertFalse();
    });
    /**
     * @tc.name CapturePublishPipelineTest_case_048
     * @tc.desc pipeline: capture result becomes the next published feed entry 48 (CapturePublishPipelineTest case 48)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CapturePublishPipelineTest_case_048', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      const outcome: CaptureOutcome = new CaptureOutcome(0, 0, true, imageUriFor(48), 'ok');
      const state: CaptureState = new CaptureState();
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(state.onCaptureResult(outcome)).assertTrue();
      expect(state.canPublish()).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'capture 48', 'app.media.icon_comment_app_logo2', '02-07 13:25', [state.peek()]);
      const journal: CommentJournal = new CommentJournal();
      expect(journal.appendDraft(draft) !== undefined).assertTrue();
      expect(journal.size()).assertEqual(1);
      const latest: Comment | undefined = journal.latest();
      expect(latest === undefined).assertFalse();
      if (latest !== undefined) {
        expect(latest.images.length).assertEqual(1);
      }
      expect(state.consume()).assertEqual(draft.images[0]);
      expect(state.canPublish()).assertFalse();
    });
    /**
     * @tc.name CapturePublishPipelineTest_case_049
     * @tc.desc pipeline: capture result becomes the next published feed entry 49 (CapturePublishPipelineTest case 49)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CapturePublishPipelineTest_case_049', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      const outcome: CaptureOutcome = new CaptureOutcome(0, 0, true, imageUriFor(49), 'ok');
      const state: CaptureState = new CaptureState();
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(state.onCaptureResult(outcome)).assertTrue();
      expect(state.canPublish()).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'capture 49', 'app.media.icon_comment_app_logo2', '02-07 13:25', [state.peek()]);
      const journal: CommentJournal = new CommentJournal();
      expect(journal.appendDraft(draft) !== undefined).assertTrue();
      expect(journal.size()).assertEqual(1);
      const latest: Comment | undefined = journal.latest();
      expect(latest === undefined).assertFalse();
      if (latest !== undefined) {
        expect(latest.images.length).assertEqual(1);
      }
      expect(state.consume()).assertEqual(draft.images[0]);
      expect(state.canPublish()).assertFalse();
    });
    /**
     * @tc.name CapturePublishPipelineTest_case_050
     * @tc.desc pipeline: capture result becomes the next published feed entry 50 (CapturePublishPipelineTest case 50)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CapturePublishPipelineTest_case_050', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      const outcome: CaptureOutcome = new CaptureOutcome(0, 0, true, imageUriFor(50), 'ok');
      const state: CaptureState = new CaptureState();
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(state.onCaptureResult(outcome)).assertTrue();
      expect(state.canPublish()).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'capture 50', 'app.media.icon_comment_app_logo2', '02-07 13:25', [state.peek()]);
      const journal: CommentJournal = new CommentJournal();
      expect(journal.appendDraft(draft) !== undefined).assertTrue();
      expect(journal.size()).assertEqual(1);
      const latest: Comment | undefined = journal.latest();
      expect(latest === undefined).assertFalse();
      if (latest !== undefined) {
        expect(latest.images.length).assertEqual(1);
      }
      expect(state.consume()).assertEqual(draft.images[0]);
      expect(state.canPublish()).assertFalse();
    });
    /**
     * @tc.name CapturePublishPipelineTest_case_051
     * @tc.desc pipeline: capture result becomes the next published feed entry 51 (CapturePublishPipelineTest case 51)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CapturePublishPipelineTest_case_051', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      const outcome: CaptureOutcome = new CaptureOutcome(0, 0, true, imageUriFor(51), 'ok');
      const state: CaptureState = new CaptureState();
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(state.onCaptureResult(outcome)).assertTrue();
      expect(state.canPublish()).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'capture 51', 'app.media.icon_comment_app_logo2', '02-07 13:25', [state.peek()]);
      const journal: CommentJournal = new CommentJournal();
      expect(journal.appendDraft(draft) !== undefined).assertTrue();
      expect(journal.size()).assertEqual(1);
      const latest: Comment | undefined = journal.latest();
      expect(latest === undefined).assertFalse();
      if (latest !== undefined) {
        expect(latest.images.length).assertEqual(1);
      }
      expect(state.consume()).assertEqual(draft.images[0]);
      expect(state.canPublish()).assertFalse();
    });
    /**
     * @tc.name CapturePublishPipelineTest_case_052
     * @tc.desc pipeline: capture result becomes the next published feed entry 52 (CapturePublishPipelineTest case 52)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CapturePublishPipelineTest_case_052', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      const outcome: CaptureOutcome = new CaptureOutcome(0, 0, true, imageUriFor(52), 'ok');
      const state: CaptureState = new CaptureState();
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(state.onCaptureResult(outcome)).assertTrue();
      expect(state.canPublish()).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'capture 52', 'app.media.icon_comment_app_logo2', '02-07 13:25', [state.peek()]);
      const journal: CommentJournal = new CommentJournal();
      expect(journal.appendDraft(draft) !== undefined).assertTrue();
      expect(journal.size()).assertEqual(1);
      const latest: Comment | undefined = journal.latest();
      expect(latest === undefined).assertFalse();
      if (latest !== undefined) {
        expect(latest.images.length).assertEqual(1);
      }
      expect(state.consume()).assertEqual(draft.images[0]);
      expect(state.canPublish()).assertFalse();
    });
    /**
     * @tc.name CapturePublishPipelineTest_case_053
     * @tc.desc pipeline: capture result becomes the next published feed entry 53 (CapturePublishPipelineTest case 53)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CapturePublishPipelineTest_case_053', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      const outcome: CaptureOutcome = new CaptureOutcome(0, 0, true, imageUriFor(53), 'ok');
      const state: CaptureState = new CaptureState();
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(state.onCaptureResult(outcome)).assertTrue();
      expect(state.canPublish()).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'capture 53', 'app.media.icon_comment_app_logo2', '02-07 13:25', [state.peek()]);
      const journal: CommentJournal = new CommentJournal();
      expect(journal.appendDraft(draft) !== undefined).assertTrue();
      expect(journal.size()).assertEqual(1);
      const latest: Comment | undefined = journal.latest();
      expect(latest === undefined).assertFalse();
      if (latest !== undefined) {
        expect(latest.images.length).assertEqual(1);
      }
      expect(state.consume()).assertEqual(draft.images[0]);
      expect(state.canPublish()).assertFalse();
    });
    /**
     * @tc.name CapturePublishPipelineTest_case_054
     * @tc.desc pipeline: capture result becomes the next published feed entry 54 (CapturePublishPipelineTest case 54)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CapturePublishPipelineTest_case_054', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      const outcome: CaptureOutcome = new CaptureOutcome(0, 0, true, imageUriFor(54), 'ok');
      const state: CaptureState = new CaptureState();
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(state.onCaptureResult(outcome)).assertTrue();
      expect(state.canPublish()).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'capture 54', 'app.media.icon_comment_app_logo2', '02-07 13:25', [state.peek()]);
      const journal: CommentJournal = new CommentJournal();
      expect(journal.appendDraft(draft) !== undefined).assertTrue();
      expect(journal.size()).assertEqual(1);
      const latest: Comment | undefined = journal.latest();
      expect(latest === undefined).assertFalse();
      if (latest !== undefined) {
        expect(latest.images.length).assertEqual(1);
      }
      expect(state.consume()).assertEqual(draft.images[0]);
      expect(state.canPublish()).assertFalse();
    });
    /**
     * @tc.name CapturePublishPipelineTest_case_055
     * @tc.desc pipeline: capture result becomes the next published feed entry 55 (CapturePublishPipelineTest case 55)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CapturePublishPipelineTest_case_055', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      const outcome: CaptureOutcome = new CaptureOutcome(0, 0, true, imageUriFor(55), 'ok');
      const state: CaptureState = new CaptureState();
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(state.onCaptureResult(outcome)).assertTrue();
      expect(state.canPublish()).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'capture 55', 'app.media.icon_comment_app_logo2', '02-07 13:25', [state.peek()]);
      const journal: CommentJournal = new CommentJournal();
      expect(journal.appendDraft(draft) !== undefined).assertTrue();
      expect(journal.size()).assertEqual(1);
      const latest: Comment | undefined = journal.latest();
      expect(latest === undefined).assertFalse();
      if (latest !== undefined) {
        expect(latest.images.length).assertEqual(1);
      }
      expect(state.consume()).assertEqual(draft.images[0]);
      expect(state.canPublish()).assertFalse();
    });
  });
}
