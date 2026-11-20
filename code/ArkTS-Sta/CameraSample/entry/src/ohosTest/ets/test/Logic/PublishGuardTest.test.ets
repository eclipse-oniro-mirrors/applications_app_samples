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

export default function PublishGuardTest(): void {
  describe('PublishGuardTest', () => {
    beforeAll(() => {
      logSuite('PublishGuardTest', 'begin');
    });
    beforeEach(async () => {
      await yieldTick();
    });
    afterAll(() => {
      logSuite('PublishGuardTest', 'end');
    });

    /**
     * @tc.name PublishGuardTest_case_001
     * @tc.desc guard: imagePath 'empty' drives publish eligibility (PublishGuardTest case 1)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishGuardTest_case_001', 0, async () => {
      const state: CaptureState = new CaptureState();
      state.imagePath = '';
      expect(state.canPublish()).assertFalse();
      expect(publishEligible('')).assertFalse();
      expect(publishEligible('')).assertFalse();
      expect(publishEligible('file://media/Photo/1/IMG_0001.jpg')).assertTrue();
      expect(publishEligible(' ')).assertTrue();
      expect(publishEligible('x')).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'body', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(draftEligible(draft)).assertFalse();
      draft.images = ['file://media/Photo/1/IMG_0001.jpg'];
      expect(draftEligible(draft)).assertTrue();
    });
    /**
     * @tc.name PublishGuardTest_case_002
     * @tc.desc guard: imagePath 'uri' drives publish eligibility (PublishGuardTest case 2)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishGuardTest_case_002', 0, async () => {
      const state: CaptureState = new CaptureState();
      state.imagePath = 'file://media/Photo/1/IMG_0001.jpg';
      expect(state.canPublish()).assertTrue();
      expect(publishEligible('file://media/Photo/1/IMG_0001.jpg')).assertTrue();
      expect(publishEligible('')).assertFalse();
      expect(publishEligible('file://media/Photo/1/IMG_0001.jpg')).assertTrue();
      expect(publishEligible(' ')).assertTrue();
      expect(publishEligible('x')).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'body', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(draftEligible(draft)).assertFalse();
      draft.images = ['file://media/Photo/1/IMG_0001.jpg'];
      expect(draftEligible(draft)).assertTrue();
    });
    /**
     * @tc.name PublishGuardTest_case_003
     * @tc.desc guard: imagePath 'space' drives publish eligibility (PublishGuardTest case 3)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishGuardTest_case_003', 0, async () => {
      const state: CaptureState = new CaptureState();
      state.imagePath = ' ';
      expect(state.canPublish()).assertTrue();
      expect(publishEligible(' ')).assertTrue();
      expect(publishEligible('')).assertFalse();
      expect(publishEligible('file://media/Photo/1/IMG_0001.jpg')).assertTrue();
      expect(publishEligible(' ')).assertTrue();
      expect(publishEligible('x')).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'body', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(draftEligible(draft)).assertFalse();
      draft.images = ['file://media/Photo/1/IMG_0001.jpg'];
      expect(draftEligible(draft)).assertTrue();
    });
    /**
     * @tc.name PublishGuardTest_case_004
     * @tc.desc guard: imagePath 'uri' drives publish eligibility (PublishGuardTest case 4)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishGuardTest_case_004', 0, async () => {
      const state: CaptureState = new CaptureState();
      state.imagePath = 'datashare:///media/photo/9';
      expect(state.canPublish()).assertTrue();
      expect(publishEligible('datashare:///media/photo/9')).assertTrue();
      expect(publishEligible('')).assertFalse();
      expect(publishEligible('file://media/Photo/1/IMG_0001.jpg')).assertTrue();
      expect(publishEligible(' ')).assertTrue();
      expect(publishEligible('x')).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'body', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(draftEligible(draft)).assertFalse();
      draft.images = ['file://media/Photo/1/IMG_0001.jpg'];
      expect(draftEligible(draft)).assertTrue();
    });
    /**
     * @tc.name PublishGuardTest_case_005
     * @tc.desc guard: imagePath 'uri' drives publish eligibility (PublishGuardTest case 5)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishGuardTest_case_005', 0, async () => {
      const state: CaptureState = new CaptureState();
      state.imagePath = 'x';
      expect(state.canPublish()).assertTrue();
      expect(publishEligible('x')).assertTrue();
      expect(publishEligible('')).assertFalse();
      expect(publishEligible('file://media/Photo/1/IMG_0001.jpg')).assertTrue();
      expect(publishEligible(' ')).assertTrue();
      expect(publishEligible('x')).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'body', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(draftEligible(draft)).assertFalse();
      draft.images = ['file://media/Photo/1/IMG_0001.jpg'];
      expect(draftEligible(draft)).assertTrue();
    });
    /**
     * @tc.name PublishGuardTest_case_006
     * @tc.desc guard: imagePath 'empty' drives publish eligibility (PublishGuardTest case 6)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishGuardTest_case_006', 0, async () => {
      const state: CaptureState = new CaptureState();
      state.imagePath = '';
      expect(state.canPublish()).assertFalse();
      expect(publishEligible('')).assertFalse();
      expect(publishEligible('')).assertFalse();
      expect(publishEligible('file://media/Photo/1/IMG_0001.jpg')).assertTrue();
      expect(publishEligible(' ')).assertTrue();
      expect(publishEligible('x')).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'body', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(draftEligible(draft)).assertFalse();
      draft.images = ['file://media/Photo/1/IMG_0001.jpg'];
      expect(draftEligible(draft)).assertTrue();
    });
    /**
     * @tc.name PublishGuardTest_case_007
     * @tc.desc guard: imagePath 'uri' drives publish eligibility (PublishGuardTest case 7)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishGuardTest_case_007', 0, async () => {
      const state: CaptureState = new CaptureState();
      state.imagePath = 'file://media/Photo/1/IMG_0001.jpg';
      expect(state.canPublish()).assertTrue();
      expect(publishEligible('file://media/Photo/1/IMG_0001.jpg')).assertTrue();
      expect(publishEligible('')).assertFalse();
      expect(publishEligible('file://media/Photo/1/IMG_0001.jpg')).assertTrue();
      expect(publishEligible(' ')).assertTrue();
      expect(publishEligible('x')).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'body', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(draftEligible(draft)).assertFalse();
      draft.images = ['file://media/Photo/1/IMG_0001.jpg'];
      expect(draftEligible(draft)).assertTrue();
    });
    /**
     * @tc.name PublishGuardTest_case_008
     * @tc.desc guard: imagePath 'space' drives publish eligibility (PublishGuardTest case 8)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishGuardTest_case_008', 0, async () => {
      const state: CaptureState = new CaptureState();
      state.imagePath = ' ';
      expect(state.canPublish()).assertTrue();
      expect(publishEligible(' ')).assertTrue();
      expect(publishEligible('')).assertFalse();
      expect(publishEligible('file://media/Photo/1/IMG_0001.jpg')).assertTrue();
      expect(publishEligible(' ')).assertTrue();
      expect(publishEligible('x')).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'body', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(draftEligible(draft)).assertFalse();
      draft.images = ['file://media/Photo/1/IMG_0001.jpg'];
      expect(draftEligible(draft)).assertTrue();
    });
    /**
     * @tc.name PublishGuardTest_case_009
     * @tc.desc guard: imagePath 'uri' drives publish eligibility (PublishGuardTest case 9)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishGuardTest_case_009', 0, async () => {
      const state: CaptureState = new CaptureState();
      state.imagePath = 'datashare:///media/photo/9';
      expect(state.canPublish()).assertTrue();
      expect(publishEligible('datashare:///media/photo/9')).assertTrue();
      expect(publishEligible('')).assertFalse();
      expect(publishEligible('file://media/Photo/1/IMG_0001.jpg')).assertTrue();
      expect(publishEligible(' ')).assertTrue();
      expect(publishEligible('x')).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'body', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(draftEligible(draft)).assertFalse();
      draft.images = ['file://media/Photo/1/IMG_0001.jpg'];
      expect(draftEligible(draft)).assertTrue();
    });
    /**
     * @tc.name PublishGuardTest_case_010
     * @tc.desc guard: imagePath 'uri' drives publish eligibility (PublishGuardTest case 10)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishGuardTest_case_010', 0, async () => {
      const state: CaptureState = new CaptureState();
      state.imagePath = 'x';
      expect(state.canPublish()).assertTrue();
      expect(publishEligible('x')).assertTrue();
      expect(publishEligible('')).assertFalse();
      expect(publishEligible('file://media/Photo/1/IMG_0001.jpg')).assertTrue();
      expect(publishEligible(' ')).assertTrue();
      expect(publishEligible('x')).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'body', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(draftEligible(draft)).assertFalse();
      draft.images = ['file://media/Photo/1/IMG_0001.jpg'];
      expect(draftEligible(draft)).assertTrue();
    });
    /**
     * @tc.name PublishGuardTest_case_011
     * @tc.desc guard: imagePath 'empty' drives publish eligibility (PublishGuardTest case 11)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishGuardTest_case_011', 0, async () => {
      const state: CaptureState = new CaptureState();
      state.imagePath = '';
      expect(state.canPublish()).assertFalse();
      expect(publishEligible('')).assertFalse();
      expect(publishEligible('')).assertFalse();
      expect(publishEligible('file://media/Photo/1/IMG_0001.jpg')).assertTrue();
      expect(publishEligible(' ')).assertTrue();
      expect(publishEligible('x')).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'body', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(draftEligible(draft)).assertFalse();
      draft.images = ['file://media/Photo/1/IMG_0001.jpg'];
      expect(draftEligible(draft)).assertTrue();
    });
    /**
     * @tc.name PublishGuardTest_case_012
     * @tc.desc guard: imagePath 'uri' drives publish eligibility (PublishGuardTest case 12)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishGuardTest_case_012', 0, async () => {
      const state: CaptureState = new CaptureState();
      state.imagePath = 'file://media/Photo/1/IMG_0001.jpg';
      expect(state.canPublish()).assertTrue();
      expect(publishEligible('file://media/Photo/1/IMG_0001.jpg')).assertTrue();
      expect(publishEligible('')).assertFalse();
      expect(publishEligible('file://media/Photo/1/IMG_0001.jpg')).assertTrue();
      expect(publishEligible(' ')).assertTrue();
      expect(publishEligible('x')).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'body', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(draftEligible(draft)).assertFalse();
      draft.images = ['file://media/Photo/1/IMG_0001.jpg'];
      expect(draftEligible(draft)).assertTrue();
    });
    /**
     * @tc.name PublishGuardTest_case_013
     * @tc.desc guard: imagePath 'space' drives publish eligibility (PublishGuardTest case 13)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishGuardTest_case_013', 0, async () => {
      const state: CaptureState = new CaptureState();
      state.imagePath = ' ';
      expect(state.canPublish()).assertTrue();
      expect(publishEligible(' ')).assertTrue();
      expect(publishEligible('')).assertFalse();
      expect(publishEligible('file://media/Photo/1/IMG_0001.jpg')).assertTrue();
      expect(publishEligible(' ')).assertTrue();
      expect(publishEligible('x')).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'body', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(draftEligible(draft)).assertFalse();
      draft.images = ['file://media/Photo/1/IMG_0001.jpg'];
      expect(draftEligible(draft)).assertTrue();
    });
    /**
     * @tc.name PublishGuardTest_case_014
     * @tc.desc guard: imagePath 'uri' drives publish eligibility (PublishGuardTest case 14)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishGuardTest_case_014', 0, async () => {
      const state: CaptureState = new CaptureState();
      state.imagePath = 'datashare:///media/photo/9';
      expect(state.canPublish()).assertTrue();
      expect(publishEligible('datashare:///media/photo/9')).assertTrue();
      expect(publishEligible('')).assertFalse();
      expect(publishEligible('file://media/Photo/1/IMG_0001.jpg')).assertTrue();
      expect(publishEligible(' ')).assertTrue();
      expect(publishEligible('x')).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'body', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(draftEligible(draft)).assertFalse();
      draft.images = ['file://media/Photo/1/IMG_0001.jpg'];
      expect(draftEligible(draft)).assertTrue();
    });
    /**
     * @tc.name PublishGuardTest_case_015
     * @tc.desc guard: imagePath 'uri' drives publish eligibility (PublishGuardTest case 15)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishGuardTest_case_015', 0, async () => {
      const state: CaptureState = new CaptureState();
      state.imagePath = 'x';
      expect(state.canPublish()).assertTrue();
      expect(publishEligible('x')).assertTrue();
      expect(publishEligible('')).assertFalse();
      expect(publishEligible('file://media/Photo/1/IMG_0001.jpg')).assertTrue();
      expect(publishEligible(' ')).assertTrue();
      expect(publishEligible('x')).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'body', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(draftEligible(draft)).assertFalse();
      draft.images = ['file://media/Photo/1/IMG_0001.jpg'];
      expect(draftEligible(draft)).assertTrue();
    });
    /**
     * @tc.name PublishGuardTest_case_016
     * @tc.desc guard: imagePath 'empty' drives publish eligibility (PublishGuardTest case 16)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishGuardTest_case_016', 0, async () => {
      const state: CaptureState = new CaptureState();
      state.imagePath = '';
      expect(state.canPublish()).assertFalse();
      expect(publishEligible('')).assertFalse();
      expect(publishEligible('')).assertFalse();
      expect(publishEligible('file://media/Photo/1/IMG_0001.jpg')).assertTrue();
      expect(publishEligible(' ')).assertTrue();
      expect(publishEligible('x')).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'body', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(draftEligible(draft)).assertFalse();
      draft.images = ['file://media/Photo/1/IMG_0001.jpg'];
      expect(draftEligible(draft)).assertTrue();
    });
    /**
     * @tc.name PublishGuardTest_case_017
     * @tc.desc guard: imagePath 'uri' drives publish eligibility (PublishGuardTest case 17)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishGuardTest_case_017', 0, async () => {
      const state: CaptureState = new CaptureState();
      state.imagePath = 'file://media/Photo/1/IMG_0001.jpg';
      expect(state.canPublish()).assertTrue();
      expect(publishEligible('file://media/Photo/1/IMG_0001.jpg')).assertTrue();
      expect(publishEligible('')).assertFalse();
      expect(publishEligible('file://media/Photo/1/IMG_0001.jpg')).assertTrue();
      expect(publishEligible(' ')).assertTrue();
      expect(publishEligible('x')).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'body', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(draftEligible(draft)).assertFalse();
      draft.images = ['file://media/Photo/1/IMG_0001.jpg'];
      expect(draftEligible(draft)).assertTrue();
    });
    /**
     * @tc.name PublishGuardTest_case_018
     * @tc.desc guard: imagePath 'space' drives publish eligibility (PublishGuardTest case 18)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishGuardTest_case_018', 0, async () => {
      const state: CaptureState = new CaptureState();
      state.imagePath = ' ';
      expect(state.canPublish()).assertTrue();
      expect(publishEligible(' ')).assertTrue();
      expect(publishEligible('')).assertFalse();
      expect(publishEligible('file://media/Photo/1/IMG_0001.jpg')).assertTrue();
      expect(publishEligible(' ')).assertTrue();
      expect(publishEligible('x')).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'body', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(draftEligible(draft)).assertFalse();
      draft.images = ['file://media/Photo/1/IMG_0001.jpg'];
      expect(draftEligible(draft)).assertTrue();
    });
    /**
     * @tc.name PublishGuardTest_case_019
     * @tc.desc guard: imagePath 'uri' drives publish eligibility (PublishGuardTest case 19)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishGuardTest_case_019', 0, async () => {
      const state: CaptureState = new CaptureState();
      state.imagePath = 'datashare:///media/photo/9';
      expect(state.canPublish()).assertTrue();
      expect(publishEligible('datashare:///media/photo/9')).assertTrue();
      expect(publishEligible('')).assertFalse();
      expect(publishEligible('file://media/Photo/1/IMG_0001.jpg')).assertTrue();
      expect(publishEligible(' ')).assertTrue();
      expect(publishEligible('x')).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'body', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(draftEligible(draft)).assertFalse();
      draft.images = ['file://media/Photo/1/IMG_0001.jpg'];
      expect(draftEligible(draft)).assertTrue();
    });
    /**
     * @tc.name PublishGuardTest_case_020
     * @tc.desc guard: imagePath 'uri' drives publish eligibility (PublishGuardTest case 20)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishGuardTest_case_020', 0, async () => {
      const state: CaptureState = new CaptureState();
      state.imagePath = 'x';
      expect(state.canPublish()).assertTrue();
      expect(publishEligible('x')).assertTrue();
      expect(publishEligible('')).assertFalse();
      expect(publishEligible('file://media/Photo/1/IMG_0001.jpg')).assertTrue();
      expect(publishEligible(' ')).assertTrue();
      expect(publishEligible('x')).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'body', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(draftEligible(draft)).assertFalse();
      draft.images = ['file://media/Photo/1/IMG_0001.jpg'];
      expect(draftEligible(draft)).assertTrue();
    });
    /**
     * @tc.name PublishGuardTest_case_021
     * @tc.desc guard: imagePath 'empty' drives publish eligibility (PublishGuardTest case 21)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishGuardTest_case_021', 0, async () => {
      const state: CaptureState = new CaptureState();
      state.imagePath = '';
      expect(state.canPublish()).assertFalse();
      expect(publishEligible('')).assertFalse();
      expect(publishEligible('')).assertFalse();
      expect(publishEligible('file://media/Photo/1/IMG_0001.jpg')).assertTrue();
      expect(publishEligible(' ')).assertTrue();
      expect(publishEligible('x')).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'body', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(draftEligible(draft)).assertFalse();
      draft.images = ['file://media/Photo/1/IMG_0001.jpg'];
      expect(draftEligible(draft)).assertTrue();
    });
    /**
     * @tc.name PublishGuardTest_case_022
     * @tc.desc guard: imagePath 'uri' drives publish eligibility (PublishGuardTest case 22)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishGuardTest_case_022', 0, async () => {
      const state: CaptureState = new CaptureState();
      state.imagePath = 'file://media/Photo/1/IMG_0001.jpg';
      expect(state.canPublish()).assertTrue();
      expect(publishEligible('file://media/Photo/1/IMG_0001.jpg')).assertTrue();
      expect(publishEligible('')).assertFalse();
      expect(publishEligible('file://media/Photo/1/IMG_0001.jpg')).assertTrue();
      expect(publishEligible(' ')).assertTrue();
      expect(publishEligible('x')).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'body', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(draftEligible(draft)).assertFalse();
      draft.images = ['file://media/Photo/1/IMG_0001.jpg'];
      expect(draftEligible(draft)).assertTrue();
    });
    /**
     * @tc.name PublishGuardTest_case_023
     * @tc.desc guard: imagePath 'space' drives publish eligibility (PublishGuardTest case 23)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishGuardTest_case_023', 0, async () => {
      const state: CaptureState = new CaptureState();
      state.imagePath = ' ';
      expect(state.canPublish()).assertTrue();
      expect(publishEligible(' ')).assertTrue();
      expect(publishEligible('')).assertFalse();
      expect(publishEligible('file://media/Photo/1/IMG_0001.jpg')).assertTrue();
      expect(publishEligible(' ')).assertTrue();
      expect(publishEligible('x')).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'body', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(draftEligible(draft)).assertFalse();
      draft.images = ['file://media/Photo/1/IMG_0001.jpg'];
      expect(draftEligible(draft)).assertTrue();
    });
    /**
     * @tc.name PublishGuardTest_case_024
     * @tc.desc guard: imagePath 'uri' drives publish eligibility (PublishGuardTest case 24)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishGuardTest_case_024', 0, async () => {
      const state: CaptureState = new CaptureState();
      state.imagePath = 'datashare:///media/photo/9';
      expect(state.canPublish()).assertTrue();
      expect(publishEligible('datashare:///media/photo/9')).assertTrue();
      expect(publishEligible('')).assertFalse();
      expect(publishEligible('file://media/Photo/1/IMG_0001.jpg')).assertTrue();
      expect(publishEligible(' ')).assertTrue();
      expect(publishEligible('x')).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'body', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(draftEligible(draft)).assertFalse();
      draft.images = ['file://media/Photo/1/IMG_0001.jpg'];
      expect(draftEligible(draft)).assertTrue();
    });
    /**
     * @tc.name PublishGuardTest_case_025
     * @tc.desc guard: imagePath 'uri' drives publish eligibility (PublishGuardTest case 25)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishGuardTest_case_025', 0, async () => {
      const state: CaptureState = new CaptureState();
      state.imagePath = 'x';
      expect(state.canPublish()).assertTrue();
      expect(publishEligible('x')).assertTrue();
      expect(publishEligible('')).assertFalse();
      expect(publishEligible('file://media/Photo/1/IMG_0001.jpg')).assertTrue();
      expect(publishEligible(' ')).assertTrue();
      expect(publishEligible('x')).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'body', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(draftEligible(draft)).assertFalse();
      draft.images = ['file://media/Photo/1/IMG_0001.jpg'];
      expect(draftEligible(draft)).assertTrue();
    });
    /**
     * @tc.name PublishGuardTest_case_026
     * @tc.desc guard: imagePath 'empty' drives publish eligibility (PublishGuardTest case 26)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishGuardTest_case_026', 0, async () => {
      const state: CaptureState = new CaptureState();
      state.imagePath = '';
      expect(state.canPublish()).assertFalse();
      expect(publishEligible('')).assertFalse();
      expect(publishEligible('')).assertFalse();
      expect(publishEligible('file://media/Photo/1/IMG_0001.jpg')).assertTrue();
      expect(publishEligible(' ')).assertTrue();
      expect(publishEligible('x')).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'body', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(draftEligible(draft)).assertFalse();
      draft.images = ['file://media/Photo/1/IMG_0001.jpg'];
      expect(draftEligible(draft)).assertTrue();
    });
    /**
     * @tc.name PublishGuardTest_case_027
     * @tc.desc guard: imagePath 'uri' drives publish eligibility (PublishGuardTest case 27)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishGuardTest_case_027', 0, async () => {
      const state: CaptureState = new CaptureState();
      state.imagePath = 'file://media/Photo/1/IMG_0001.jpg';
      expect(state.canPublish()).assertTrue();
      expect(publishEligible('file://media/Photo/1/IMG_0001.jpg')).assertTrue();
      expect(publishEligible('')).assertFalse();
      expect(publishEligible('file://media/Photo/1/IMG_0001.jpg')).assertTrue();
      expect(publishEligible(' ')).assertTrue();
      expect(publishEligible('x')).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'body', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(draftEligible(draft)).assertFalse();
      draft.images = ['file://media/Photo/1/IMG_0001.jpg'];
      expect(draftEligible(draft)).assertTrue();
    });
    /**
     * @tc.name PublishGuardTest_case_028
     * @tc.desc guard: imagePath 'space' drives publish eligibility (PublishGuardTest case 28)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishGuardTest_case_028', 0, async () => {
      const state: CaptureState = new CaptureState();
      state.imagePath = ' ';
      expect(state.canPublish()).assertTrue();
      expect(publishEligible(' ')).assertTrue();
      expect(publishEligible('')).assertFalse();
      expect(publishEligible('file://media/Photo/1/IMG_0001.jpg')).assertTrue();
      expect(publishEligible(' ')).assertTrue();
      expect(publishEligible('x')).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'body', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(draftEligible(draft)).assertFalse();
      draft.images = ['file://media/Photo/1/IMG_0001.jpg'];
      expect(draftEligible(draft)).assertTrue();
    });
    /**
     * @tc.name PublishGuardTest_case_029
     * @tc.desc guard: imagePath 'uri' drives publish eligibility (PublishGuardTest case 29)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishGuardTest_case_029', 0, async () => {
      const state: CaptureState = new CaptureState();
      state.imagePath = 'datashare:///media/photo/9';
      expect(state.canPublish()).assertTrue();
      expect(publishEligible('datashare:///media/photo/9')).assertTrue();
      expect(publishEligible('')).assertFalse();
      expect(publishEligible('file://media/Photo/1/IMG_0001.jpg')).assertTrue();
      expect(publishEligible(' ')).assertTrue();
      expect(publishEligible('x')).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'body', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(draftEligible(draft)).assertFalse();
      draft.images = ['file://media/Photo/1/IMG_0001.jpg'];
      expect(draftEligible(draft)).assertTrue();
    });
    /**
     * @tc.name PublishGuardTest_case_030
     * @tc.desc guard: imagePath 'uri' drives publish eligibility (PublishGuardTest case 30)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishGuardTest_case_030', 0, async () => {
      const state: CaptureState = new CaptureState();
      state.imagePath = 'x';
      expect(state.canPublish()).assertTrue();
      expect(publishEligible('x')).assertTrue();
      expect(publishEligible('')).assertFalse();
      expect(publishEligible('file://media/Photo/1/IMG_0001.jpg')).assertTrue();
      expect(publishEligible(' ')).assertTrue();
      expect(publishEligible('x')).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'body', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(draftEligible(draft)).assertFalse();
      draft.images = ['file://media/Photo/1/IMG_0001.jpg'];
      expect(draftEligible(draft)).assertTrue();
    });
    /**
     * @tc.name PublishGuardTest_case_031
     * @tc.desc guard: imagePath 'empty' drives publish eligibility (PublishGuardTest case 31)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishGuardTest_case_031', 0, async () => {
      const state: CaptureState = new CaptureState();
      state.imagePath = '';
      expect(state.canPublish()).assertFalse();
      expect(publishEligible('')).assertFalse();
      expect(publishEligible('')).assertFalse();
      expect(publishEligible('file://media/Photo/1/IMG_0001.jpg')).assertTrue();
      expect(publishEligible(' ')).assertTrue();
      expect(publishEligible('x')).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'body', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(draftEligible(draft)).assertFalse();
      draft.images = ['file://media/Photo/1/IMG_0001.jpg'];
      expect(draftEligible(draft)).assertTrue();
    });
    /**
     * @tc.name PublishGuardTest_case_032
     * @tc.desc guard: imagePath 'uri' drives publish eligibility (PublishGuardTest case 32)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishGuardTest_case_032', 0, async () => {
      const state: CaptureState = new CaptureState();
      state.imagePath = 'file://media/Photo/1/IMG_0001.jpg';
      expect(state.canPublish()).assertTrue();
      expect(publishEligible('file://media/Photo/1/IMG_0001.jpg')).assertTrue();
      expect(publishEligible('')).assertFalse();
      expect(publishEligible('file://media/Photo/1/IMG_0001.jpg')).assertTrue();
      expect(publishEligible(' ')).assertTrue();
      expect(publishEligible('x')).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'body', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(draftEligible(draft)).assertFalse();
      draft.images = ['file://media/Photo/1/IMG_0001.jpg'];
      expect(draftEligible(draft)).assertTrue();
    });
    /**
     * @tc.name PublishGuardTest_case_033
     * @tc.desc guard: imagePath 'space' drives publish eligibility (PublishGuardTest case 33)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishGuardTest_case_033', 0, async () => {
      const state: CaptureState = new CaptureState();
      state.imagePath = ' ';
      expect(state.canPublish()).assertTrue();
      expect(publishEligible(' ')).assertTrue();
      expect(publishEligible('')).assertFalse();
      expect(publishEligible('file://media/Photo/1/IMG_0001.jpg')).assertTrue();
      expect(publishEligible(' ')).assertTrue();
      expect(publishEligible('x')).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'body', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(draftEligible(draft)).assertFalse();
      draft.images = ['file://media/Photo/1/IMG_0001.jpg'];
      expect(draftEligible(draft)).assertTrue();
    });
    /**
     * @tc.name PublishGuardTest_case_034
     * @tc.desc guard: imagePath 'uri' drives publish eligibility (PublishGuardTest case 34)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishGuardTest_case_034', 0, async () => {
      const state: CaptureState = new CaptureState();
      state.imagePath = 'datashare:///media/photo/9';
      expect(state.canPublish()).assertTrue();
      expect(publishEligible('datashare:///media/photo/9')).assertTrue();
      expect(publishEligible('')).assertFalse();
      expect(publishEligible('file://media/Photo/1/IMG_0001.jpg')).assertTrue();
      expect(publishEligible(' ')).assertTrue();
      expect(publishEligible('x')).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'body', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(draftEligible(draft)).assertFalse();
      draft.images = ['file://media/Photo/1/IMG_0001.jpg'];
      expect(draftEligible(draft)).assertTrue();
    });
    /**
     * @tc.name PublishGuardTest_case_035
     * @tc.desc guard: imagePath 'uri' drives publish eligibility (PublishGuardTest case 35)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishGuardTest_case_035', 0, async () => {
      const state: CaptureState = new CaptureState();
      state.imagePath = 'x';
      expect(state.canPublish()).assertTrue();
      expect(publishEligible('x')).assertTrue();
      expect(publishEligible('')).assertFalse();
      expect(publishEligible('file://media/Photo/1/IMG_0001.jpg')).assertTrue();
      expect(publishEligible(' ')).assertTrue();
      expect(publishEligible('x')).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'body', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(draftEligible(draft)).assertFalse();
      draft.images = ['file://media/Photo/1/IMG_0001.jpg'];
      expect(draftEligible(draft)).assertTrue();
    });
    /**
     * @tc.name PublishGuardTest_case_036
     * @tc.desc guard: imagePath 'empty' drives publish eligibility (PublishGuardTest case 36)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishGuardTest_case_036', 0, async () => {
      const state: CaptureState = new CaptureState();
      state.imagePath = '';
      expect(state.canPublish()).assertFalse();
      expect(publishEligible('')).assertFalse();
      expect(publishEligible('')).assertFalse();
      expect(publishEligible('file://media/Photo/1/IMG_0001.jpg')).assertTrue();
      expect(publishEligible(' ')).assertTrue();
      expect(publishEligible('x')).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'body', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(draftEligible(draft)).assertFalse();
      draft.images = ['file://media/Photo/1/IMG_0001.jpg'];
      expect(draftEligible(draft)).assertTrue();
    });
    /**
     * @tc.name PublishGuardTest_case_037
     * @tc.desc guard: imagePath 'uri' drives publish eligibility (PublishGuardTest case 37)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishGuardTest_case_037', 0, async () => {
      const state: CaptureState = new CaptureState();
      state.imagePath = 'file://media/Photo/1/IMG_0001.jpg';
      expect(state.canPublish()).assertTrue();
      expect(publishEligible('file://media/Photo/1/IMG_0001.jpg')).assertTrue();
      expect(publishEligible('')).assertFalse();
      expect(publishEligible('file://media/Photo/1/IMG_0001.jpg')).assertTrue();
      expect(publishEligible(' ')).assertTrue();
      expect(publishEligible('x')).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'body', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(draftEligible(draft)).assertFalse();
      draft.images = ['file://media/Photo/1/IMG_0001.jpg'];
      expect(draftEligible(draft)).assertTrue();
    });
    /**
     * @tc.name PublishGuardTest_case_038
     * @tc.desc guard: imagePath 'space' drives publish eligibility (PublishGuardTest case 38)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishGuardTest_case_038', 0, async () => {
      const state: CaptureState = new CaptureState();
      state.imagePath = ' ';
      expect(state.canPublish()).assertTrue();
      expect(publishEligible(' ')).assertTrue();
      expect(publishEligible('')).assertFalse();
      expect(publishEligible('file://media/Photo/1/IMG_0001.jpg')).assertTrue();
      expect(publishEligible(' ')).assertTrue();
      expect(publishEligible('x')).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'body', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(draftEligible(draft)).assertFalse();
      draft.images = ['file://media/Photo/1/IMG_0001.jpg'];
      expect(draftEligible(draft)).assertTrue();
    });
    /**
     * @tc.name PublishGuardTest_case_039
     * @tc.desc guard: imagePath 'uri' drives publish eligibility (PublishGuardTest case 39)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishGuardTest_case_039', 0, async () => {
      const state: CaptureState = new CaptureState();
      state.imagePath = 'datashare:///media/photo/9';
      expect(state.canPublish()).assertTrue();
      expect(publishEligible('datashare:///media/photo/9')).assertTrue();
      expect(publishEligible('')).assertFalse();
      expect(publishEligible('file://media/Photo/1/IMG_0001.jpg')).assertTrue();
      expect(publishEligible(' ')).assertTrue();
      expect(publishEligible('x')).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'body', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(draftEligible(draft)).assertFalse();
      draft.images = ['file://media/Photo/1/IMG_0001.jpg'];
      expect(draftEligible(draft)).assertTrue();
    });
    /**
     * @tc.name PublishGuardTest_case_040
     * @tc.desc guard: imagePath 'uri' drives publish eligibility (PublishGuardTest case 40)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishGuardTest_case_040', 0, async () => {
      const state: CaptureState = new CaptureState();
      state.imagePath = 'x';
      expect(state.canPublish()).assertTrue();
      expect(publishEligible('x')).assertTrue();
      expect(publishEligible('')).assertFalse();
      expect(publishEligible('file://media/Photo/1/IMG_0001.jpg')).assertTrue();
      expect(publishEligible(' ')).assertTrue();
      expect(publishEligible('x')).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'body', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(draftEligible(draft)).assertFalse();
      draft.images = ['file://media/Photo/1/IMG_0001.jpg'];
      expect(draftEligible(draft)).assertTrue();
    });
    /**
     * @tc.name PublishGuardTest_case_041
     * @tc.desc guard: imagePath 'empty' drives publish eligibility (PublishGuardTest case 41)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishGuardTest_case_041', 0, async () => {
      const state: CaptureState = new CaptureState();
      state.imagePath = '';
      expect(state.canPublish()).assertFalse();
      expect(publishEligible('')).assertFalse();
      expect(publishEligible('')).assertFalse();
      expect(publishEligible('file://media/Photo/1/IMG_0001.jpg')).assertTrue();
      expect(publishEligible(' ')).assertTrue();
      expect(publishEligible('x')).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'body', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(draftEligible(draft)).assertFalse();
      draft.images = ['file://media/Photo/1/IMG_0001.jpg'];
      expect(draftEligible(draft)).assertTrue();
    });
    /**
     * @tc.name PublishGuardTest_case_042
     * @tc.desc guard: imagePath 'uri' drives publish eligibility (PublishGuardTest case 42)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishGuardTest_case_042', 0, async () => {
      const state: CaptureState = new CaptureState();
      state.imagePath = 'file://media/Photo/1/IMG_0001.jpg';
      expect(state.canPublish()).assertTrue();
      expect(publishEligible('file://media/Photo/1/IMG_0001.jpg')).assertTrue();
      expect(publishEligible('')).assertFalse();
      expect(publishEligible('file://media/Photo/1/IMG_0001.jpg')).assertTrue();
      expect(publishEligible(' ')).assertTrue();
      expect(publishEligible('x')).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'body', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(draftEligible(draft)).assertFalse();
      draft.images = ['file://media/Photo/1/IMG_0001.jpg'];
      expect(draftEligible(draft)).assertTrue();
    });
    /**
     * @tc.name PublishGuardTest_case_043
     * @tc.desc guard: imagePath 'space' drives publish eligibility (PublishGuardTest case 43)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishGuardTest_case_043', 0, async () => {
      const state: CaptureState = new CaptureState();
      state.imagePath = ' ';
      expect(state.canPublish()).assertTrue();
      expect(publishEligible(' ')).assertTrue();
      expect(publishEligible('')).assertFalse();
      expect(publishEligible('file://media/Photo/1/IMG_0001.jpg')).assertTrue();
      expect(publishEligible(' ')).assertTrue();
      expect(publishEligible('x')).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'body', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(draftEligible(draft)).assertFalse();
      draft.images = ['file://media/Photo/1/IMG_0001.jpg'];
      expect(draftEligible(draft)).assertTrue();
    });
    /**
     * @tc.name PublishGuardTest_case_044
     * @tc.desc guard: imagePath 'uri' drives publish eligibility (PublishGuardTest case 44)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishGuardTest_case_044', 0, async () => {
      const state: CaptureState = new CaptureState();
      state.imagePath = 'datashare:///media/photo/9';
      expect(state.canPublish()).assertTrue();
      expect(publishEligible('datashare:///media/photo/9')).assertTrue();
      expect(publishEligible('')).assertFalse();
      expect(publishEligible('file://media/Photo/1/IMG_0001.jpg')).assertTrue();
      expect(publishEligible(' ')).assertTrue();
      expect(publishEligible('x')).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'body', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(draftEligible(draft)).assertFalse();
      draft.images = ['file://media/Photo/1/IMG_0001.jpg'];
      expect(draftEligible(draft)).assertTrue();
    });
    /**
     * @tc.name PublishGuardTest_case_045
     * @tc.desc guard: imagePath 'uri' drives publish eligibility (PublishGuardTest case 45)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishGuardTest_case_045', 0, async () => {
      const state: CaptureState = new CaptureState();
      state.imagePath = 'x';
      expect(state.canPublish()).assertTrue();
      expect(publishEligible('x')).assertTrue();
      expect(publishEligible('')).assertFalse();
      expect(publishEligible('file://media/Photo/1/IMG_0001.jpg')).assertTrue();
      expect(publishEligible(' ')).assertTrue();
      expect(publishEligible('x')).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'body', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(draftEligible(draft)).assertFalse();
      draft.images = ['file://media/Photo/1/IMG_0001.jpg'];
      expect(draftEligible(draft)).assertTrue();
    });
    /**
     * @tc.name PublishGuardTest_case_046
     * @tc.desc guard: imagePath 'empty' drives publish eligibility (PublishGuardTest case 46)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishGuardTest_case_046', 0, async () => {
      const state: CaptureState = new CaptureState();
      state.imagePath = '';
      expect(state.canPublish()).assertFalse();
      expect(publishEligible('')).assertFalse();
      expect(publishEligible('')).assertFalse();
      expect(publishEligible('file://media/Photo/1/IMG_0001.jpg')).assertTrue();
      expect(publishEligible(' ')).assertTrue();
      expect(publishEligible('x')).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'body', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(draftEligible(draft)).assertFalse();
      draft.images = ['file://media/Photo/1/IMG_0001.jpg'];
      expect(draftEligible(draft)).assertTrue();
    });
    /**
     * @tc.name PublishGuardTest_case_047
     * @tc.desc guard: imagePath 'uri' drives publish eligibility (PublishGuardTest case 47)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishGuardTest_case_047', 0, async () => {
      const state: CaptureState = new CaptureState();
      state.imagePath = 'file://media/Photo/1/IMG_0001.jpg';
      expect(state.canPublish()).assertTrue();
      expect(publishEligible('file://media/Photo/1/IMG_0001.jpg')).assertTrue();
      expect(publishEligible('')).assertFalse();
      expect(publishEligible('file://media/Photo/1/IMG_0001.jpg')).assertTrue();
      expect(publishEligible(' ')).assertTrue();
      expect(publishEligible('x')).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'body', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(draftEligible(draft)).assertFalse();
      draft.images = ['file://media/Photo/1/IMG_0001.jpg'];
      expect(draftEligible(draft)).assertTrue();
    });
    /**
     * @tc.name PublishGuardTest_case_048
     * @tc.desc guard: imagePath 'space' drives publish eligibility (PublishGuardTest case 48)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishGuardTest_case_048', 0, async () => {
      const state: CaptureState = new CaptureState();
      state.imagePath = ' ';
      expect(state.canPublish()).assertTrue();
      expect(publishEligible(' ')).assertTrue();
      expect(publishEligible('')).assertFalse();
      expect(publishEligible('file://media/Photo/1/IMG_0001.jpg')).assertTrue();
      expect(publishEligible(' ')).assertTrue();
      expect(publishEligible('x')).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'body', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(draftEligible(draft)).assertFalse();
      draft.images = ['file://media/Photo/1/IMG_0001.jpg'];
      expect(draftEligible(draft)).assertTrue();
    });
    /**
     * @tc.name PublishGuardTest_case_049
     * @tc.desc guard: imagePath 'uri' drives publish eligibility (PublishGuardTest case 49)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishGuardTest_case_049', 0, async () => {
      const state: CaptureState = new CaptureState();
      state.imagePath = 'datashare:///media/photo/9';
      expect(state.canPublish()).assertTrue();
      expect(publishEligible('datashare:///media/photo/9')).assertTrue();
      expect(publishEligible('')).assertFalse();
      expect(publishEligible('file://media/Photo/1/IMG_0001.jpg')).assertTrue();
      expect(publishEligible(' ')).assertTrue();
      expect(publishEligible('x')).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'body', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(draftEligible(draft)).assertFalse();
      draft.images = ['file://media/Photo/1/IMG_0001.jpg'];
      expect(draftEligible(draft)).assertTrue();
    });
    /**
     * @tc.name PublishGuardTest_case_050
     * @tc.desc guard: imagePath 'uri' drives publish eligibility (PublishGuardTest case 50)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishGuardTest_case_050', 0, async () => {
      const state: CaptureState = new CaptureState();
      state.imagePath = 'x';
      expect(state.canPublish()).assertTrue();
      expect(publishEligible('x')).assertTrue();
      expect(publishEligible('')).assertFalse();
      expect(publishEligible('file://media/Photo/1/IMG_0001.jpg')).assertTrue();
      expect(publishEligible(' ')).assertTrue();
      expect(publishEligible('x')).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'body', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(draftEligible(draft)).assertFalse();
      draft.images = ['file://media/Photo/1/IMG_0001.jpg'];
      expect(draftEligible(draft)).assertTrue();
    });
    /**
     * @tc.name PublishGuardTest_case_051
     * @tc.desc guard: imagePath 'empty' drives publish eligibility (PublishGuardTest case 51)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishGuardTest_case_051', 0, async () => {
      const state: CaptureState = new CaptureState();
      state.imagePath = '';
      expect(state.canPublish()).assertFalse();
      expect(publishEligible('')).assertFalse();
      expect(publishEligible('')).assertFalse();
      expect(publishEligible('file://media/Photo/1/IMG_0001.jpg')).assertTrue();
      expect(publishEligible(' ')).assertTrue();
      expect(publishEligible('x')).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'body', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(draftEligible(draft)).assertFalse();
      draft.images = ['file://media/Photo/1/IMG_0001.jpg'];
      expect(draftEligible(draft)).assertTrue();
    });
    /**
     * @tc.name PublishGuardTest_case_052
     * @tc.desc guard: imagePath 'uri' drives publish eligibility (PublishGuardTest case 52)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishGuardTest_case_052', 0, async () => {
      const state: CaptureState = new CaptureState();
      state.imagePath = 'file://media/Photo/1/IMG_0001.jpg';
      expect(state.canPublish()).assertTrue();
      expect(publishEligible('file://media/Photo/1/IMG_0001.jpg')).assertTrue();
      expect(publishEligible('')).assertFalse();
      expect(publishEligible('file://media/Photo/1/IMG_0001.jpg')).assertTrue();
      expect(publishEligible(' ')).assertTrue();
      expect(publishEligible('x')).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'body', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(draftEligible(draft)).assertFalse();
      draft.images = ['file://media/Photo/1/IMG_0001.jpg'];
      expect(draftEligible(draft)).assertTrue();
    });
    /**
     * @tc.name PublishGuardTest_case_053
     * @tc.desc guard: imagePath 'space' drives publish eligibility (PublishGuardTest case 53)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishGuardTest_case_053', 0, async () => {
      const state: CaptureState = new CaptureState();
      state.imagePath = ' ';
      expect(state.canPublish()).assertTrue();
      expect(publishEligible(' ')).assertTrue();
      expect(publishEligible('')).assertFalse();
      expect(publishEligible('file://media/Photo/1/IMG_0001.jpg')).assertTrue();
      expect(publishEligible(' ')).assertTrue();
      expect(publishEligible('x')).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'body', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(draftEligible(draft)).assertFalse();
      draft.images = ['file://media/Photo/1/IMG_0001.jpg'];
      expect(draftEligible(draft)).assertTrue();
    });
    /**
     * @tc.name PublishGuardTest_case_054
     * @tc.desc guard: imagePath 'uri' drives publish eligibility (PublishGuardTest case 54)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishGuardTest_case_054', 0, async () => {
      const state: CaptureState = new CaptureState();
      state.imagePath = 'datashare:///media/photo/9';
      expect(state.canPublish()).assertTrue();
      expect(publishEligible('datashare:///media/photo/9')).assertTrue();
      expect(publishEligible('')).assertFalse();
      expect(publishEligible('file://media/Photo/1/IMG_0001.jpg')).assertTrue();
      expect(publishEligible(' ')).assertTrue();
      expect(publishEligible('x')).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'body', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(draftEligible(draft)).assertFalse();
      draft.images = ['file://media/Photo/1/IMG_0001.jpg'];
      expect(draftEligible(draft)).assertTrue();
    });
    /**
     * @tc.name PublishGuardTest_case_055
     * @tc.desc guard: imagePath 'uri' drives publish eligibility (PublishGuardTest case 55)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishGuardTest_case_055', 0, async () => {
      const state: CaptureState = new CaptureState();
      state.imagePath = 'x';
      expect(state.canPublish()).assertTrue();
      expect(publishEligible('x')).assertTrue();
      expect(publishEligible('')).assertFalse();
      expect(publishEligible('file://media/Photo/1/IMG_0001.jpg')).assertTrue();
      expect(publishEligible(' ')).assertTrue();
      expect(publishEligible('x')).assertTrue();
      const draft: CommentDraft = new CommentDraft('LiHua', 'body', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(draftEligible(draft)).assertFalse();
      draft.images = ['file://media/Photo/1/IMG_0001.jpg'];
      expect(draftEligible(draft)).assertTrue();
    });
  });
}
