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

export default function DraftFlowTest(): void {
  describe('DraftFlowTest', () => {
    beforeAll(() => {
      logSuite('DraftFlowTest', 'begin');
    });
    beforeEach(async () => {
      await yieldTick();
    });
    afterAll(() => {
      logSuite('DraftFlowTest', 'end');
    });

    /**
     * @tc.name DraftFlowTest_case_001
     * @tc.desc factory: published comment mirrors the draft fields, variant 1 (DraftFlowTest case 1)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DraftFlowTest_case_001', 0, async () => {
      const draft: CommentDraft = new CommentDraft('Cloud', 'hello camera', 'app.media.icon_comment_app_logo1', '02-07 13:25', ['file://media/Photo/1/IMG_0001.jpg']);
      const c: Comment | undefined = createPublishedComment(draft);
      expect(c !== undefined).assertTrue();
      if (c !== undefined) {
        expect(c.name).assertEqual('Cloud');
        expect(commentText(c)).assertEqual('hello camera');
        expect(commentAvatar(c)).assertEqual('app.media.icon_comment_app_logo1');
        expect(c.time).assertEqual('02-07 13:25');
        expect(c.images.length).assertEqual(1);
        expect(commentImages(c)[0]).assertEqual(draft.images[0]);
      }
      const empty: CommentDraft = new CommentDraft('LiHua', 'text', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(createPublishedComment(empty) === undefined).assertTrue();
      expect(draft.images.length).assertEqual(1);
    });
    /**
     * @tc.name DraftFlowTest_case_002
     * @tc.desc factory: published comment mirrors the draft fields, variant 2 (DraftFlowTest case 2)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DraftFlowTest_case_002', 0, async () => {
      const draft: CommentDraft = new CommentDraft('LiHua', 'nice photo', 'app.media.icon_comment_app_logo2', '02-07 13:25', ['file://media/Photo/2/IMG_0002.jpg']);
      const c: Comment | undefined = createPublishedComment(draft);
      expect(c !== undefined).assertTrue();
      if (c !== undefined) {
        expect(c.name).assertEqual('LiHua');
        expect(commentText(c)).assertEqual('nice photo');
        expect(commentAvatar(c)).assertEqual('app.media.icon_comment_app_logo2');
        expect(c.time).assertEqual('02-07 13:25');
        expect(c.images.length).assertEqual(1);
        expect(commentImages(c)[0]).assertEqual(draft.images[0]);
      }
      const empty: CommentDraft = new CommentDraft('LiHua', 'text', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(createPublishedComment(empty) === undefined).assertTrue();
      expect(draft.images.length).assertEqual(1);
    });
    /**
     * @tc.name DraftFlowTest_case_003
     * @tc.desc factory: published comment mirrors the draft fields, variant 3 (DraftFlowTest case 3)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DraftFlowTest_case_003', 0, async () => {
      const draft: CommentDraft = new CommentDraft('Guest', 'shot at noon', 'app.media.icon_comment_app_logo1', '02-07 13:25', ['datashare:///media/photo/3']);
      const c: Comment | undefined = createPublishedComment(draft);
      expect(c !== undefined).assertTrue();
      if (c !== undefined) {
        expect(c.name).assertEqual('Guest');
        expect(commentText(c)).assertEqual('shot at noon');
        expect(commentAvatar(c)).assertEqual('app.media.icon_comment_app_logo1');
        expect(c.time).assertEqual('02-07 13:25');
        expect(c.images.length).assertEqual(1);
        expect(commentImages(c)[0]).assertEqual(draft.images[0]);
      }
      const empty: CommentDraft = new CommentDraft('LiHua', 'text', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(createPublishedComment(empty) === undefined).assertTrue();
      expect(draft.images.length).assertEqual(1);
    });
    /**
     * @tc.name DraftFlowTest_case_004
     * @tc.desc factory: published comment mirrors the draft fields, variant 1 (DraftFlowTest case 4)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DraftFlowTest_case_004', 0, async () => {
      const draft: CommentDraft = new CommentDraft('Tester', 'weekend trip', 'app.media.icon_comment_app_logo2', '02-07 13:25', ['file://media/Photo/2026/01/12/IMG_0003.jpg']);
      const c: Comment | undefined = createPublishedComment(draft);
      expect(c !== undefined).assertTrue();
      if (c !== undefined) {
        expect(c.name).assertEqual('Tester');
        expect(commentText(c)).assertEqual('weekend trip');
        expect(commentAvatar(c)).assertEqual('app.media.icon_comment_app_logo2');
        expect(c.time).assertEqual('02-07 13:25');
        expect(c.images.length).assertEqual(1);
        expect(commentImages(c)[0]).assertEqual(draft.images[0]);
      }
      const empty: CommentDraft = new CommentDraft('LiHua', 'text', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(createPublishedComment(empty) === undefined).assertTrue();
      expect(draft.images.length).assertEqual(1);
    });
    /**
     * @tc.name DraftFlowTest_case_005
     * @tc.desc factory: published comment mirrors the draft fields, variant 2 (DraftFlowTest case 5)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DraftFlowTest_case_005', 0, async () => {
      const draft: CommentDraft = new CommentDraft('CameraFan', 'sample body', 'app.media.icon_comment_app_logo1', '02-07 13:25', ['file://media/Photo/1/IMG_0001.jpg']);
      const c: Comment | undefined = createPublishedComment(draft);
      expect(c !== undefined).assertTrue();
      if (c !== undefined) {
        expect(c.name).assertEqual('CameraFan');
        expect(commentText(c)).assertEqual('sample body');
        expect(commentAvatar(c)).assertEqual('app.media.icon_comment_app_logo1');
        expect(c.time).assertEqual('02-07 13:25');
        expect(c.images.length).assertEqual(1);
        expect(commentImages(c)[0]).assertEqual(draft.images[0]);
      }
      const empty: CommentDraft = new CommentDraft('LiHua', 'text', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(createPublishedComment(empty) === undefined).assertTrue();
      expect(draft.images.length).assertEqual(1);
    });
    /**
     * @tc.name DraftFlowTest_case_006
     * @tc.desc factory: published comment mirrors the draft fields, variant 3 (DraftFlowTest case 6)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DraftFlowTest_case_006', 0, async () => {
      const draft: CommentDraft = new CommentDraft('Cloud', 'hello camera', 'app.media.icon_comment_app_logo2', '02-07 13:25', ['file://media/Photo/2/IMG_0002.jpg']);
      const c: Comment | undefined = createPublishedComment(draft);
      expect(c !== undefined).assertTrue();
      if (c !== undefined) {
        expect(c.name).assertEqual('Cloud');
        expect(commentText(c)).assertEqual('hello camera');
        expect(commentAvatar(c)).assertEqual('app.media.icon_comment_app_logo2');
        expect(c.time).assertEqual('02-07 13:25');
        expect(c.images.length).assertEqual(1);
        expect(commentImages(c)[0]).assertEqual(draft.images[0]);
      }
      const empty: CommentDraft = new CommentDraft('LiHua', 'text', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(createPublishedComment(empty) === undefined).assertTrue();
      expect(draft.images.length).assertEqual(1);
    });
    /**
     * @tc.name DraftFlowTest_case_007
     * @tc.desc factory: published comment mirrors the draft fields, variant 1 (DraftFlowTest case 7)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DraftFlowTest_case_007', 0, async () => {
      const draft: CommentDraft = new CommentDraft('LiHua', 'nice photo', 'app.media.icon_comment_app_logo1', '02-07 13:25', ['datashare:///media/photo/3']);
      const c: Comment | undefined = createPublishedComment(draft);
      expect(c !== undefined).assertTrue();
      if (c !== undefined) {
        expect(c.name).assertEqual('LiHua');
        expect(commentText(c)).assertEqual('nice photo');
        expect(commentAvatar(c)).assertEqual('app.media.icon_comment_app_logo1');
        expect(c.time).assertEqual('02-07 13:25');
        expect(c.images.length).assertEqual(1);
        expect(commentImages(c)[0]).assertEqual(draft.images[0]);
      }
      const empty: CommentDraft = new CommentDraft('LiHua', 'text', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(createPublishedComment(empty) === undefined).assertTrue();
      expect(draft.images.length).assertEqual(1);
    });
    /**
     * @tc.name DraftFlowTest_case_008
     * @tc.desc factory: published comment mirrors the draft fields, variant 2 (DraftFlowTest case 8)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DraftFlowTest_case_008', 0, async () => {
      const draft: CommentDraft = new CommentDraft('Guest', 'shot at noon', 'app.media.icon_comment_app_logo2', '02-07 13:25', ['file://media/Photo/2026/01/12/IMG_0003.jpg']);
      const c: Comment | undefined = createPublishedComment(draft);
      expect(c !== undefined).assertTrue();
      if (c !== undefined) {
        expect(c.name).assertEqual('Guest');
        expect(commentText(c)).assertEqual('shot at noon');
        expect(commentAvatar(c)).assertEqual('app.media.icon_comment_app_logo2');
        expect(c.time).assertEqual('02-07 13:25');
        expect(c.images.length).assertEqual(1);
        expect(commentImages(c)[0]).assertEqual(draft.images[0]);
      }
      const empty: CommentDraft = new CommentDraft('LiHua', 'text', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(createPublishedComment(empty) === undefined).assertTrue();
      expect(draft.images.length).assertEqual(1);
    });
    /**
     * @tc.name DraftFlowTest_case_009
     * @tc.desc factory: published comment mirrors the draft fields, variant 3 (DraftFlowTest case 9)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DraftFlowTest_case_009', 0, async () => {
      const draft: CommentDraft = new CommentDraft('Tester', 'weekend trip', 'app.media.icon_comment_app_logo1', '02-07 13:25', ['file://media/Photo/1/IMG_0001.jpg']);
      const c: Comment | undefined = createPublishedComment(draft);
      expect(c !== undefined).assertTrue();
      if (c !== undefined) {
        expect(c.name).assertEqual('Tester');
        expect(commentText(c)).assertEqual('weekend trip');
        expect(commentAvatar(c)).assertEqual('app.media.icon_comment_app_logo1');
        expect(c.time).assertEqual('02-07 13:25');
        expect(c.images.length).assertEqual(1);
        expect(commentImages(c)[0]).assertEqual(draft.images[0]);
      }
      const empty: CommentDraft = new CommentDraft('LiHua', 'text', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(createPublishedComment(empty) === undefined).assertTrue();
      expect(draft.images.length).assertEqual(1);
    });
    /**
     * @tc.name DraftFlowTest_case_010
     * @tc.desc factory: published comment mirrors the draft fields, variant 1 (DraftFlowTest case 10)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DraftFlowTest_case_010', 0, async () => {
      const draft: CommentDraft = new CommentDraft('CameraFan', 'sample body', 'app.media.icon_comment_app_logo2', '02-07 13:25', ['file://media/Photo/2/IMG_0002.jpg']);
      const c: Comment | undefined = createPublishedComment(draft);
      expect(c !== undefined).assertTrue();
      if (c !== undefined) {
        expect(c.name).assertEqual('CameraFan');
        expect(commentText(c)).assertEqual('sample body');
        expect(commentAvatar(c)).assertEqual('app.media.icon_comment_app_logo2');
        expect(c.time).assertEqual('02-07 13:25');
        expect(c.images.length).assertEqual(1);
        expect(commentImages(c)[0]).assertEqual(draft.images[0]);
      }
      const empty: CommentDraft = new CommentDraft('LiHua', 'text', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(createPublishedComment(empty) === undefined).assertTrue();
      expect(draft.images.length).assertEqual(1);
    });
    /**
     * @tc.name DraftFlowTest_case_011
     * @tc.desc factory: published comment mirrors the draft fields, variant 2 (DraftFlowTest case 11)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DraftFlowTest_case_011', 0, async () => {
      const draft: CommentDraft = new CommentDraft('Cloud', 'hello camera', 'app.media.icon_comment_app_logo1', '02-07 13:25', ['datashare:///media/photo/3']);
      const c: Comment | undefined = createPublishedComment(draft);
      expect(c !== undefined).assertTrue();
      if (c !== undefined) {
        expect(c.name).assertEqual('Cloud');
        expect(commentText(c)).assertEqual('hello camera');
        expect(commentAvatar(c)).assertEqual('app.media.icon_comment_app_logo1');
        expect(c.time).assertEqual('02-07 13:25');
        expect(c.images.length).assertEqual(1);
        expect(commentImages(c)[0]).assertEqual(draft.images[0]);
      }
      const empty: CommentDraft = new CommentDraft('LiHua', 'text', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(createPublishedComment(empty) === undefined).assertTrue();
      expect(draft.images.length).assertEqual(1);
    });
    /**
     * @tc.name DraftFlowTest_case_012
     * @tc.desc factory: published comment mirrors the draft fields, variant 3 (DraftFlowTest case 12)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DraftFlowTest_case_012', 0, async () => {
      const draft: CommentDraft = new CommentDraft('LiHua', 'nice photo', 'app.media.icon_comment_app_logo2', '02-07 13:25', ['file://media/Photo/2026/01/12/IMG_0003.jpg']);
      const c: Comment | undefined = createPublishedComment(draft);
      expect(c !== undefined).assertTrue();
      if (c !== undefined) {
        expect(c.name).assertEqual('LiHua');
        expect(commentText(c)).assertEqual('nice photo');
        expect(commentAvatar(c)).assertEqual('app.media.icon_comment_app_logo2');
        expect(c.time).assertEqual('02-07 13:25');
        expect(c.images.length).assertEqual(1);
        expect(commentImages(c)[0]).assertEqual(draft.images[0]);
      }
      const empty: CommentDraft = new CommentDraft('LiHua', 'text', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(createPublishedComment(empty) === undefined).assertTrue();
      expect(draft.images.length).assertEqual(1);
    });
    /**
     * @tc.name DraftFlowTest_case_013
     * @tc.desc factory: published comment mirrors the draft fields, variant 1 (DraftFlowTest case 13)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DraftFlowTest_case_013', 0, async () => {
      const draft: CommentDraft = new CommentDraft('Guest', 'shot at noon', 'app.media.icon_comment_app_logo1', '02-07 13:25', ['file://media/Photo/1/IMG_0001.jpg']);
      const c: Comment | undefined = createPublishedComment(draft);
      expect(c !== undefined).assertTrue();
      if (c !== undefined) {
        expect(c.name).assertEqual('Guest');
        expect(commentText(c)).assertEqual('shot at noon');
        expect(commentAvatar(c)).assertEqual('app.media.icon_comment_app_logo1');
        expect(c.time).assertEqual('02-07 13:25');
        expect(c.images.length).assertEqual(1);
        expect(commentImages(c)[0]).assertEqual(draft.images[0]);
      }
      const empty: CommentDraft = new CommentDraft('LiHua', 'text', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(createPublishedComment(empty) === undefined).assertTrue();
      expect(draft.images.length).assertEqual(1);
    });
    /**
     * @tc.name DraftFlowTest_case_014
     * @tc.desc factory: published comment mirrors the draft fields, variant 2 (DraftFlowTest case 14)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DraftFlowTest_case_014', 0, async () => {
      const draft: CommentDraft = new CommentDraft('Tester', 'weekend trip', 'app.media.icon_comment_app_logo2', '02-07 13:25', ['file://media/Photo/2/IMG_0002.jpg']);
      const c: Comment | undefined = createPublishedComment(draft);
      expect(c !== undefined).assertTrue();
      if (c !== undefined) {
        expect(c.name).assertEqual('Tester');
        expect(commentText(c)).assertEqual('weekend trip');
        expect(commentAvatar(c)).assertEqual('app.media.icon_comment_app_logo2');
        expect(c.time).assertEqual('02-07 13:25');
        expect(c.images.length).assertEqual(1);
        expect(commentImages(c)[0]).assertEqual(draft.images[0]);
      }
      const empty: CommentDraft = new CommentDraft('LiHua', 'text', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(createPublishedComment(empty) === undefined).assertTrue();
      expect(draft.images.length).assertEqual(1);
    });
    /**
     * @tc.name DraftFlowTest_case_015
     * @tc.desc factory: published comment mirrors the draft fields, variant 3 (DraftFlowTest case 15)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DraftFlowTest_case_015', 0, async () => {
      const draft: CommentDraft = new CommentDraft('CameraFan', 'sample body', 'app.media.icon_comment_app_logo1', '02-07 13:25', ['datashare:///media/photo/3']);
      const c: Comment | undefined = createPublishedComment(draft);
      expect(c !== undefined).assertTrue();
      if (c !== undefined) {
        expect(c.name).assertEqual('CameraFan');
        expect(commentText(c)).assertEqual('sample body');
        expect(commentAvatar(c)).assertEqual('app.media.icon_comment_app_logo1');
        expect(c.time).assertEqual('02-07 13:25');
        expect(c.images.length).assertEqual(1);
        expect(commentImages(c)[0]).assertEqual(draft.images[0]);
      }
      const empty: CommentDraft = new CommentDraft('LiHua', 'text', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(createPublishedComment(empty) === undefined).assertTrue();
      expect(draft.images.length).assertEqual(1);
    });
    /**
     * @tc.name DraftFlowTest_case_016
     * @tc.desc factory: published comment mirrors the draft fields, variant 1 (DraftFlowTest case 16)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DraftFlowTest_case_016', 0, async () => {
      const draft: CommentDraft = new CommentDraft('Cloud', 'hello camera', 'app.media.icon_comment_app_logo2', '02-07 13:25', ['file://media/Photo/2026/01/12/IMG_0003.jpg']);
      const c: Comment | undefined = createPublishedComment(draft);
      expect(c !== undefined).assertTrue();
      if (c !== undefined) {
        expect(c.name).assertEqual('Cloud');
        expect(commentText(c)).assertEqual('hello camera');
        expect(commentAvatar(c)).assertEqual('app.media.icon_comment_app_logo2');
        expect(c.time).assertEqual('02-07 13:25');
        expect(c.images.length).assertEqual(1);
        expect(commentImages(c)[0]).assertEqual(draft.images[0]);
      }
      const empty: CommentDraft = new CommentDraft('LiHua', 'text', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(createPublishedComment(empty) === undefined).assertTrue();
      expect(draft.images.length).assertEqual(1);
    });
    /**
     * @tc.name DraftFlowTest_case_017
     * @tc.desc factory: published comment mirrors the draft fields, variant 2 (DraftFlowTest case 17)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DraftFlowTest_case_017', 0, async () => {
      const draft: CommentDraft = new CommentDraft('LiHua', 'nice photo', 'app.media.icon_comment_app_logo1', '02-07 13:25', ['file://media/Photo/1/IMG_0001.jpg']);
      const c: Comment | undefined = createPublishedComment(draft);
      expect(c !== undefined).assertTrue();
      if (c !== undefined) {
        expect(c.name).assertEqual('LiHua');
        expect(commentText(c)).assertEqual('nice photo');
        expect(commentAvatar(c)).assertEqual('app.media.icon_comment_app_logo1');
        expect(c.time).assertEqual('02-07 13:25');
        expect(c.images.length).assertEqual(1);
        expect(commentImages(c)[0]).assertEqual(draft.images[0]);
      }
      const empty: CommentDraft = new CommentDraft('LiHua', 'text', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(createPublishedComment(empty) === undefined).assertTrue();
      expect(draft.images.length).assertEqual(1);
    });
    /**
     * @tc.name DraftFlowTest_case_018
     * @tc.desc factory: published comment mirrors the draft fields, variant 3 (DraftFlowTest case 18)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DraftFlowTest_case_018', 0, async () => {
      const draft: CommentDraft = new CommentDraft('Guest', 'shot at noon', 'app.media.icon_comment_app_logo2', '02-07 13:25', ['file://media/Photo/2/IMG_0002.jpg']);
      const c: Comment | undefined = createPublishedComment(draft);
      expect(c !== undefined).assertTrue();
      if (c !== undefined) {
        expect(c.name).assertEqual('Guest');
        expect(commentText(c)).assertEqual('shot at noon');
        expect(commentAvatar(c)).assertEqual('app.media.icon_comment_app_logo2');
        expect(c.time).assertEqual('02-07 13:25');
        expect(c.images.length).assertEqual(1);
        expect(commentImages(c)[0]).assertEqual(draft.images[0]);
      }
      const empty: CommentDraft = new CommentDraft('LiHua', 'text', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(createPublishedComment(empty) === undefined).assertTrue();
      expect(draft.images.length).assertEqual(1);
    });
    /**
     * @tc.name DraftFlowTest_case_019
     * @tc.desc factory: published comment mirrors the draft fields, variant 1 (DraftFlowTest case 19)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DraftFlowTest_case_019', 0, async () => {
      const draft: CommentDraft = new CommentDraft('Tester', 'weekend trip', 'app.media.icon_comment_app_logo1', '02-07 13:25', ['datashare:///media/photo/3']);
      const c: Comment | undefined = createPublishedComment(draft);
      expect(c !== undefined).assertTrue();
      if (c !== undefined) {
        expect(c.name).assertEqual('Tester');
        expect(commentText(c)).assertEqual('weekend trip');
        expect(commentAvatar(c)).assertEqual('app.media.icon_comment_app_logo1');
        expect(c.time).assertEqual('02-07 13:25');
        expect(c.images.length).assertEqual(1);
        expect(commentImages(c)[0]).assertEqual(draft.images[0]);
      }
      const empty: CommentDraft = new CommentDraft('LiHua', 'text', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(createPublishedComment(empty) === undefined).assertTrue();
      expect(draft.images.length).assertEqual(1);
    });
    /**
     * @tc.name DraftFlowTest_case_020
     * @tc.desc factory: published comment mirrors the draft fields, variant 2 (DraftFlowTest case 20)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DraftFlowTest_case_020', 0, async () => {
      const draft: CommentDraft = new CommentDraft('CameraFan', 'sample body', 'app.media.icon_comment_app_logo2', '02-07 13:25', ['file://media/Photo/2026/01/12/IMG_0003.jpg']);
      const c: Comment | undefined = createPublishedComment(draft);
      expect(c !== undefined).assertTrue();
      if (c !== undefined) {
        expect(c.name).assertEqual('CameraFan');
        expect(commentText(c)).assertEqual('sample body');
        expect(commentAvatar(c)).assertEqual('app.media.icon_comment_app_logo2');
        expect(c.time).assertEqual('02-07 13:25');
        expect(c.images.length).assertEqual(1);
        expect(commentImages(c)[0]).assertEqual(draft.images[0]);
      }
      const empty: CommentDraft = new CommentDraft('LiHua', 'text', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(createPublishedComment(empty) === undefined).assertTrue();
      expect(draft.images.length).assertEqual(1);
    });
    /**
     * @tc.name DraftFlowTest_case_021
     * @tc.desc factory: published comment mirrors the draft fields, variant 3 (DraftFlowTest case 21)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DraftFlowTest_case_021', 0, async () => {
      const draft: CommentDraft = new CommentDraft('Cloud', 'hello camera', 'app.media.icon_comment_app_logo1', '02-07 13:25', ['file://media/Photo/1/IMG_0001.jpg']);
      const c: Comment | undefined = createPublishedComment(draft);
      expect(c !== undefined).assertTrue();
      if (c !== undefined) {
        expect(c.name).assertEqual('Cloud');
        expect(commentText(c)).assertEqual('hello camera');
        expect(commentAvatar(c)).assertEqual('app.media.icon_comment_app_logo1');
        expect(c.time).assertEqual('02-07 13:25');
        expect(c.images.length).assertEqual(1);
        expect(commentImages(c)[0]).assertEqual(draft.images[0]);
      }
      const empty: CommentDraft = new CommentDraft('LiHua', 'text', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(createPublishedComment(empty) === undefined).assertTrue();
      expect(draft.images.length).assertEqual(1);
    });
    /**
     * @tc.name DraftFlowTest_case_022
     * @tc.desc factory: published comment mirrors the draft fields, variant 1 (DraftFlowTest case 22)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DraftFlowTest_case_022', 0, async () => {
      const draft: CommentDraft = new CommentDraft('LiHua', 'nice photo', 'app.media.icon_comment_app_logo2', '02-07 13:25', ['file://media/Photo/2/IMG_0002.jpg']);
      const c: Comment | undefined = createPublishedComment(draft);
      expect(c !== undefined).assertTrue();
      if (c !== undefined) {
        expect(c.name).assertEqual('LiHua');
        expect(commentText(c)).assertEqual('nice photo');
        expect(commentAvatar(c)).assertEqual('app.media.icon_comment_app_logo2');
        expect(c.time).assertEqual('02-07 13:25');
        expect(c.images.length).assertEqual(1);
        expect(commentImages(c)[0]).assertEqual(draft.images[0]);
      }
      const empty: CommentDraft = new CommentDraft('LiHua', 'text', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(createPublishedComment(empty) === undefined).assertTrue();
      expect(draft.images.length).assertEqual(1);
    });
    /**
     * @tc.name DraftFlowTest_case_023
     * @tc.desc factory: published comment mirrors the draft fields, variant 2 (DraftFlowTest case 23)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DraftFlowTest_case_023', 0, async () => {
      const draft: CommentDraft = new CommentDraft('Guest', 'shot at noon', 'app.media.icon_comment_app_logo1', '02-07 13:25', ['datashare:///media/photo/3']);
      const c: Comment | undefined = createPublishedComment(draft);
      expect(c !== undefined).assertTrue();
      if (c !== undefined) {
        expect(c.name).assertEqual('Guest');
        expect(commentText(c)).assertEqual('shot at noon');
        expect(commentAvatar(c)).assertEqual('app.media.icon_comment_app_logo1');
        expect(c.time).assertEqual('02-07 13:25');
        expect(c.images.length).assertEqual(1);
        expect(commentImages(c)[0]).assertEqual(draft.images[0]);
      }
      const empty: CommentDraft = new CommentDraft('LiHua', 'text', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(createPublishedComment(empty) === undefined).assertTrue();
      expect(draft.images.length).assertEqual(1);
    });
    /**
     * @tc.name DraftFlowTest_case_024
     * @tc.desc factory: published comment mirrors the draft fields, variant 3 (DraftFlowTest case 24)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DraftFlowTest_case_024', 0, async () => {
      const draft: CommentDraft = new CommentDraft('Tester', 'weekend trip', 'app.media.icon_comment_app_logo2', '02-07 13:25', ['file://media/Photo/2026/01/12/IMG_0003.jpg']);
      const c: Comment | undefined = createPublishedComment(draft);
      expect(c !== undefined).assertTrue();
      if (c !== undefined) {
        expect(c.name).assertEqual('Tester');
        expect(commentText(c)).assertEqual('weekend trip');
        expect(commentAvatar(c)).assertEqual('app.media.icon_comment_app_logo2');
        expect(c.time).assertEqual('02-07 13:25');
        expect(c.images.length).assertEqual(1);
        expect(commentImages(c)[0]).assertEqual(draft.images[0]);
      }
      const empty: CommentDraft = new CommentDraft('LiHua', 'text', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(createPublishedComment(empty) === undefined).assertTrue();
      expect(draft.images.length).assertEqual(1);
    });
    /**
     * @tc.name DraftFlowTest_case_025
     * @tc.desc factory: published comment mirrors the draft fields, variant 1 (DraftFlowTest case 25)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DraftFlowTest_case_025', 0, async () => {
      const draft: CommentDraft = new CommentDraft('CameraFan', 'sample body', 'app.media.icon_comment_app_logo1', '02-07 13:25', ['file://media/Photo/1/IMG_0001.jpg']);
      const c: Comment | undefined = createPublishedComment(draft);
      expect(c !== undefined).assertTrue();
      if (c !== undefined) {
        expect(c.name).assertEqual('CameraFan');
        expect(commentText(c)).assertEqual('sample body');
        expect(commentAvatar(c)).assertEqual('app.media.icon_comment_app_logo1');
        expect(c.time).assertEqual('02-07 13:25');
        expect(c.images.length).assertEqual(1);
        expect(commentImages(c)[0]).assertEqual(draft.images[0]);
      }
      const empty: CommentDraft = new CommentDraft('LiHua', 'text', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(createPublishedComment(empty) === undefined).assertTrue();
      expect(draft.images.length).assertEqual(1);
    });
    /**
     * @tc.name DraftFlowTest_case_026
     * @tc.desc factory: published comment mirrors the draft fields, variant 2 (DraftFlowTest case 26)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DraftFlowTest_case_026', 0, async () => {
      const draft: CommentDraft = new CommentDraft('Cloud', 'hello camera', 'app.media.icon_comment_app_logo2', '02-07 13:25', ['file://media/Photo/2/IMG_0002.jpg']);
      const c: Comment | undefined = createPublishedComment(draft);
      expect(c !== undefined).assertTrue();
      if (c !== undefined) {
        expect(c.name).assertEqual('Cloud');
        expect(commentText(c)).assertEqual('hello camera');
        expect(commentAvatar(c)).assertEqual('app.media.icon_comment_app_logo2');
        expect(c.time).assertEqual('02-07 13:25');
        expect(c.images.length).assertEqual(1);
        expect(commentImages(c)[0]).assertEqual(draft.images[0]);
      }
      const empty: CommentDraft = new CommentDraft('LiHua', 'text', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(createPublishedComment(empty) === undefined).assertTrue();
      expect(draft.images.length).assertEqual(1);
    });
    /**
     * @tc.name DraftFlowTest_case_027
     * @tc.desc factory: published comment mirrors the draft fields, variant 3 (DraftFlowTest case 27)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DraftFlowTest_case_027', 0, async () => {
      const draft: CommentDraft = new CommentDraft('LiHua', 'nice photo', 'app.media.icon_comment_app_logo1', '02-07 13:25', ['datashare:///media/photo/3']);
      const c: Comment | undefined = createPublishedComment(draft);
      expect(c !== undefined).assertTrue();
      if (c !== undefined) {
        expect(c.name).assertEqual('LiHua');
        expect(commentText(c)).assertEqual('nice photo');
        expect(commentAvatar(c)).assertEqual('app.media.icon_comment_app_logo1');
        expect(c.time).assertEqual('02-07 13:25');
        expect(c.images.length).assertEqual(1);
        expect(commentImages(c)[0]).assertEqual(draft.images[0]);
      }
      const empty: CommentDraft = new CommentDraft('LiHua', 'text', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(createPublishedComment(empty) === undefined).assertTrue();
      expect(draft.images.length).assertEqual(1);
    });
    /**
     * @tc.name DraftFlowTest_case_028
     * @tc.desc factory: published comment mirrors the draft fields, variant 1 (DraftFlowTest case 28)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DraftFlowTest_case_028', 0, async () => {
      const draft: CommentDraft = new CommentDraft('Guest', 'shot at noon', 'app.media.icon_comment_app_logo2', '02-07 13:25', ['file://media/Photo/2026/01/12/IMG_0003.jpg']);
      const c: Comment | undefined = createPublishedComment(draft);
      expect(c !== undefined).assertTrue();
      if (c !== undefined) {
        expect(c.name).assertEqual('Guest');
        expect(commentText(c)).assertEqual('shot at noon');
        expect(commentAvatar(c)).assertEqual('app.media.icon_comment_app_logo2');
        expect(c.time).assertEqual('02-07 13:25');
        expect(c.images.length).assertEqual(1);
        expect(commentImages(c)[0]).assertEqual(draft.images[0]);
      }
      const empty: CommentDraft = new CommentDraft('LiHua', 'text', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(createPublishedComment(empty) === undefined).assertTrue();
      expect(draft.images.length).assertEqual(1);
    });
    /**
     * @tc.name DraftFlowTest_case_029
     * @tc.desc factory: published comment mirrors the draft fields, variant 2 (DraftFlowTest case 29)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DraftFlowTest_case_029', 0, async () => {
      const draft: CommentDraft = new CommentDraft('Tester', 'weekend trip', 'app.media.icon_comment_app_logo1', '02-07 13:25', ['file://media/Photo/1/IMG_0001.jpg']);
      const c: Comment | undefined = createPublishedComment(draft);
      expect(c !== undefined).assertTrue();
      if (c !== undefined) {
        expect(c.name).assertEqual('Tester');
        expect(commentText(c)).assertEqual('weekend trip');
        expect(commentAvatar(c)).assertEqual('app.media.icon_comment_app_logo1');
        expect(c.time).assertEqual('02-07 13:25');
        expect(c.images.length).assertEqual(1);
        expect(commentImages(c)[0]).assertEqual(draft.images[0]);
      }
      const empty: CommentDraft = new CommentDraft('LiHua', 'text', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(createPublishedComment(empty) === undefined).assertTrue();
      expect(draft.images.length).assertEqual(1);
    });
    /**
     * @tc.name DraftFlowTest_case_030
     * @tc.desc factory: published comment mirrors the draft fields, variant 3 (DraftFlowTest case 30)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DraftFlowTest_case_030', 0, async () => {
      const draft: CommentDraft = new CommentDraft('CameraFan', 'sample body', 'app.media.icon_comment_app_logo2', '02-07 13:25', ['file://media/Photo/2/IMG_0002.jpg']);
      const c: Comment | undefined = createPublishedComment(draft);
      expect(c !== undefined).assertTrue();
      if (c !== undefined) {
        expect(c.name).assertEqual('CameraFan');
        expect(commentText(c)).assertEqual('sample body');
        expect(commentAvatar(c)).assertEqual('app.media.icon_comment_app_logo2');
        expect(c.time).assertEqual('02-07 13:25');
        expect(c.images.length).assertEqual(1);
        expect(commentImages(c)[0]).assertEqual(draft.images[0]);
      }
      const empty: CommentDraft = new CommentDraft('LiHua', 'text', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(createPublishedComment(empty) === undefined).assertTrue();
      expect(draft.images.length).assertEqual(1);
    });
    /**
     * @tc.name DraftFlowTest_case_031
     * @tc.desc factory: published comment mirrors the draft fields, variant 1 (DraftFlowTest case 31)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DraftFlowTest_case_031', 0, async () => {
      const draft: CommentDraft = new CommentDraft('Cloud', 'hello camera', 'app.media.icon_comment_app_logo1', '02-07 13:25', ['datashare:///media/photo/3']);
      const c: Comment | undefined = createPublishedComment(draft);
      expect(c !== undefined).assertTrue();
      if (c !== undefined) {
        expect(c.name).assertEqual('Cloud');
        expect(commentText(c)).assertEqual('hello camera');
        expect(commentAvatar(c)).assertEqual('app.media.icon_comment_app_logo1');
        expect(c.time).assertEqual('02-07 13:25');
        expect(c.images.length).assertEqual(1);
        expect(commentImages(c)[0]).assertEqual(draft.images[0]);
      }
      const empty: CommentDraft = new CommentDraft('LiHua', 'text', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(createPublishedComment(empty) === undefined).assertTrue();
      expect(draft.images.length).assertEqual(1);
    });
    /**
     * @tc.name DraftFlowTest_case_032
     * @tc.desc factory: published comment mirrors the draft fields, variant 2 (DraftFlowTest case 32)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DraftFlowTest_case_032', 0, async () => {
      const draft: CommentDraft = new CommentDraft('LiHua', 'nice photo', 'app.media.icon_comment_app_logo2', '02-07 13:25', ['file://media/Photo/2026/01/12/IMG_0003.jpg']);
      const c: Comment | undefined = createPublishedComment(draft);
      expect(c !== undefined).assertTrue();
      if (c !== undefined) {
        expect(c.name).assertEqual('LiHua');
        expect(commentText(c)).assertEqual('nice photo');
        expect(commentAvatar(c)).assertEqual('app.media.icon_comment_app_logo2');
        expect(c.time).assertEqual('02-07 13:25');
        expect(c.images.length).assertEqual(1);
        expect(commentImages(c)[0]).assertEqual(draft.images[0]);
      }
      const empty: CommentDraft = new CommentDraft('LiHua', 'text', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(createPublishedComment(empty) === undefined).assertTrue();
      expect(draft.images.length).assertEqual(1);
    });
    /**
     * @tc.name DraftFlowTest_case_033
     * @tc.desc factory: published comment mirrors the draft fields, variant 3 (DraftFlowTest case 33)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DraftFlowTest_case_033', 0, async () => {
      const draft: CommentDraft = new CommentDraft('Guest', 'shot at noon', 'app.media.icon_comment_app_logo1', '02-07 13:25', ['file://media/Photo/1/IMG_0001.jpg']);
      const c: Comment | undefined = createPublishedComment(draft);
      expect(c !== undefined).assertTrue();
      if (c !== undefined) {
        expect(c.name).assertEqual('Guest');
        expect(commentText(c)).assertEqual('shot at noon');
        expect(commentAvatar(c)).assertEqual('app.media.icon_comment_app_logo1');
        expect(c.time).assertEqual('02-07 13:25');
        expect(c.images.length).assertEqual(1);
        expect(commentImages(c)[0]).assertEqual(draft.images[0]);
      }
      const empty: CommentDraft = new CommentDraft('LiHua', 'text', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(createPublishedComment(empty) === undefined).assertTrue();
      expect(draft.images.length).assertEqual(1);
    });
    /**
     * @tc.name DraftFlowTest_case_034
     * @tc.desc factory: published comment mirrors the draft fields, variant 1 (DraftFlowTest case 34)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DraftFlowTest_case_034', 0, async () => {
      const draft: CommentDraft = new CommentDraft('Tester', 'weekend trip', 'app.media.icon_comment_app_logo2', '02-07 13:25', ['file://media/Photo/2/IMG_0002.jpg']);
      const c: Comment | undefined = createPublishedComment(draft);
      expect(c !== undefined).assertTrue();
      if (c !== undefined) {
        expect(c.name).assertEqual('Tester');
        expect(commentText(c)).assertEqual('weekend trip');
        expect(commentAvatar(c)).assertEqual('app.media.icon_comment_app_logo2');
        expect(c.time).assertEqual('02-07 13:25');
        expect(c.images.length).assertEqual(1);
        expect(commentImages(c)[0]).assertEqual(draft.images[0]);
      }
      const empty: CommentDraft = new CommentDraft('LiHua', 'text', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(createPublishedComment(empty) === undefined).assertTrue();
      expect(draft.images.length).assertEqual(1);
    });
    /**
     * @tc.name DraftFlowTest_case_035
     * @tc.desc factory: published comment mirrors the draft fields, variant 2 (DraftFlowTest case 35)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DraftFlowTest_case_035', 0, async () => {
      const draft: CommentDraft = new CommentDraft('CameraFan', 'sample body', 'app.media.icon_comment_app_logo1', '02-07 13:25', ['datashare:///media/photo/3']);
      const c: Comment | undefined = createPublishedComment(draft);
      expect(c !== undefined).assertTrue();
      if (c !== undefined) {
        expect(c.name).assertEqual('CameraFan');
        expect(commentText(c)).assertEqual('sample body');
        expect(commentAvatar(c)).assertEqual('app.media.icon_comment_app_logo1');
        expect(c.time).assertEqual('02-07 13:25');
        expect(c.images.length).assertEqual(1);
        expect(commentImages(c)[0]).assertEqual(draft.images[0]);
      }
      const empty: CommentDraft = new CommentDraft('LiHua', 'text', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(createPublishedComment(empty) === undefined).assertTrue();
      expect(draft.images.length).assertEqual(1);
    });
    /**
     * @tc.name DraftFlowTest_case_036
     * @tc.desc factory: published comment mirrors the draft fields, variant 3 (DraftFlowTest case 36)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DraftFlowTest_case_036', 0, async () => {
      const draft: CommentDraft = new CommentDraft('Cloud', 'hello camera', 'app.media.icon_comment_app_logo2', '02-07 13:25', ['file://media/Photo/2026/01/12/IMG_0003.jpg']);
      const c: Comment | undefined = createPublishedComment(draft);
      expect(c !== undefined).assertTrue();
      if (c !== undefined) {
        expect(c.name).assertEqual('Cloud');
        expect(commentText(c)).assertEqual('hello camera');
        expect(commentAvatar(c)).assertEqual('app.media.icon_comment_app_logo2');
        expect(c.time).assertEqual('02-07 13:25');
        expect(c.images.length).assertEqual(1);
        expect(commentImages(c)[0]).assertEqual(draft.images[0]);
      }
      const empty: CommentDraft = new CommentDraft('LiHua', 'text', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(createPublishedComment(empty) === undefined).assertTrue();
      expect(draft.images.length).assertEqual(1);
    });
    /**
     * @tc.name DraftFlowTest_case_037
     * @tc.desc factory: published comment mirrors the draft fields, variant 1 (DraftFlowTest case 37)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DraftFlowTest_case_037', 0, async () => {
      const draft: CommentDraft = new CommentDraft('LiHua', 'nice photo', 'app.media.icon_comment_app_logo1', '02-07 13:25', ['file://media/Photo/1/IMG_0001.jpg']);
      const c: Comment | undefined = createPublishedComment(draft);
      expect(c !== undefined).assertTrue();
      if (c !== undefined) {
        expect(c.name).assertEqual('LiHua');
        expect(commentText(c)).assertEqual('nice photo');
        expect(commentAvatar(c)).assertEqual('app.media.icon_comment_app_logo1');
        expect(c.time).assertEqual('02-07 13:25');
        expect(c.images.length).assertEqual(1);
        expect(commentImages(c)[0]).assertEqual(draft.images[0]);
      }
      const empty: CommentDraft = new CommentDraft('LiHua', 'text', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(createPublishedComment(empty) === undefined).assertTrue();
      expect(draft.images.length).assertEqual(1);
    });
    /**
     * @tc.name DraftFlowTest_case_038
     * @tc.desc factory: published comment mirrors the draft fields, variant 2 (DraftFlowTest case 38)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DraftFlowTest_case_038', 0, async () => {
      const draft: CommentDraft = new CommentDraft('Guest', 'shot at noon', 'app.media.icon_comment_app_logo2', '02-07 13:25', ['file://media/Photo/2/IMG_0002.jpg']);
      const c: Comment | undefined = createPublishedComment(draft);
      expect(c !== undefined).assertTrue();
      if (c !== undefined) {
        expect(c.name).assertEqual('Guest');
        expect(commentText(c)).assertEqual('shot at noon');
        expect(commentAvatar(c)).assertEqual('app.media.icon_comment_app_logo2');
        expect(c.time).assertEqual('02-07 13:25');
        expect(c.images.length).assertEqual(1);
        expect(commentImages(c)[0]).assertEqual(draft.images[0]);
      }
      const empty: CommentDraft = new CommentDraft('LiHua', 'text', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(createPublishedComment(empty) === undefined).assertTrue();
      expect(draft.images.length).assertEqual(1);
    });
    /**
     * @tc.name DraftFlowTest_case_039
     * @tc.desc factory: published comment mirrors the draft fields, variant 3 (DraftFlowTest case 39)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DraftFlowTest_case_039', 0, async () => {
      const draft: CommentDraft = new CommentDraft('Tester', 'weekend trip', 'app.media.icon_comment_app_logo1', '02-07 13:25', ['datashare:///media/photo/3']);
      const c: Comment | undefined = createPublishedComment(draft);
      expect(c !== undefined).assertTrue();
      if (c !== undefined) {
        expect(c.name).assertEqual('Tester');
        expect(commentText(c)).assertEqual('weekend trip');
        expect(commentAvatar(c)).assertEqual('app.media.icon_comment_app_logo1');
        expect(c.time).assertEqual('02-07 13:25');
        expect(c.images.length).assertEqual(1);
        expect(commentImages(c)[0]).assertEqual(draft.images[0]);
      }
      const empty: CommentDraft = new CommentDraft('LiHua', 'text', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(createPublishedComment(empty) === undefined).assertTrue();
      expect(draft.images.length).assertEqual(1);
    });
    /**
     * @tc.name DraftFlowTest_case_040
     * @tc.desc factory: published comment mirrors the draft fields, variant 1 (DraftFlowTest case 40)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DraftFlowTest_case_040', 0, async () => {
      const draft: CommentDraft = new CommentDraft('CameraFan', 'sample body', 'app.media.icon_comment_app_logo2', '02-07 13:25', ['file://media/Photo/2026/01/12/IMG_0003.jpg']);
      const c: Comment | undefined = createPublishedComment(draft);
      expect(c !== undefined).assertTrue();
      if (c !== undefined) {
        expect(c.name).assertEqual('CameraFan');
        expect(commentText(c)).assertEqual('sample body');
        expect(commentAvatar(c)).assertEqual('app.media.icon_comment_app_logo2');
        expect(c.time).assertEqual('02-07 13:25');
        expect(c.images.length).assertEqual(1);
        expect(commentImages(c)[0]).assertEqual(draft.images[0]);
      }
      const empty: CommentDraft = new CommentDraft('LiHua', 'text', 'app.media.icon_comment_app_logo2', 'time', []);
      expect(createPublishedComment(empty) === undefined).assertTrue();
      expect(draft.images.length).assertEqual(1);
    });
  });
}
