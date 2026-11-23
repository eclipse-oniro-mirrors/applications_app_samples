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

import { ResourceStr } from '@ohos.arkui.component';

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

export default function ImageFlowTest(): void {
  describe('ImageFlowTest', () => {
    beforeAll(() => {
      logSuite('ImageFlowTest', 'begin');
    });
    beforeEach(async () => {
      await yieldTick();
    });
    afterAll(() => {
      logSuite('ImageFlowTest', 'end');
    });

    /**
     * @tc.name ImageFlowTest_case_001
     * @tc.desc images: a Comment stores 1 capture uri entries in order (ImageFlowTest case 1)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ImageFlowTest_case_001', 0, async () => {
      const c: Comment = new Comment();
      const uris: ResourceStr[] = [...imageUriBatch(1)];
      c.images = uris;
      expect(c.images.length).assertEqual(1);
      expect(c.images[0] as string).assertEqual(uris[0]);
      expect(c.images[0] as string).assertEqual(uris[0]);
      expect(uris.indexOf(c.images[0] as string)).assertEqual(0);
      expect(c.images.length > 0).assertTrue();
      c.images.push(imageUriFor(99));
      expect(c.images.length).assertEqual(2);
      expect(c.images[c.images.length - 1] as string).assertEqual(imageUriFor(99));
    });
    /**
     * @tc.name ImageFlowTest_case_002
     * @tc.desc images: a Comment stores 2 capture uri entries in order (ImageFlowTest case 2)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ImageFlowTest_case_002', 0, async () => {
      const c: Comment = new Comment();
      const uris: ResourceStr[] = [...imageUriBatch(2)];
      c.images = uris;
      expect(c.images.length).assertEqual(2);
      expect(c.images[0] as string).assertEqual(uris[0]);
      expect(c.images[1] as string).assertEqual(uris[1]);
      expect(uris.indexOf(c.images[0] as string)).assertEqual(0);
      expect(c.images.length > 0).assertTrue();
      c.images.push(imageUriFor(99));
      expect(c.images.length).assertEqual(3);
      expect(c.images[c.images.length - 1] as string).assertEqual(imageUriFor(99));
    });
    /**
     * @tc.name ImageFlowTest_case_003
     * @tc.desc images: a Comment stores 3 capture uri entries in order (ImageFlowTest case 3)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ImageFlowTest_case_003', 0, async () => {
      const c: Comment = new Comment();
      const uris: ResourceStr[] = [...imageUriBatch(3)];
      c.images = uris;
      expect(c.images.length).assertEqual(3);
      expect(c.images[0] as string).assertEqual(uris[0]);
      expect(c.images[2] as string).assertEqual(uris[2]);
      expect(uris.indexOf(c.images[0] as string)).assertEqual(0);
      expect(c.images.length > 0).assertTrue();
      c.images.push(imageUriFor(99));
      expect(c.images.length).assertEqual(4);
      expect(c.images[c.images.length - 1] as string).assertEqual(imageUriFor(99));
    });
    /**
     * @tc.name ImageFlowTest_case_004
     * @tc.desc images: a Comment stores 4 capture uri entries in order (ImageFlowTest case 4)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ImageFlowTest_case_004', 0, async () => {
      const c: Comment = new Comment();
      const uris: ResourceStr[] = [...imageUriBatch(4)];
      c.images = uris;
      expect(c.images.length).assertEqual(4);
      expect(c.images[0] as string).assertEqual(uris[0]);
      expect(c.images[3] as string).assertEqual(uris[3]);
      expect(uris.indexOf(c.images[0] as string)).assertEqual(0);
      expect(c.images.length > 0).assertTrue();
      c.images.push(imageUriFor(99));
      expect(c.images.length).assertEqual(5);
      expect(c.images[c.images.length - 1] as string).assertEqual(imageUriFor(99));
    });
    /**
     * @tc.name ImageFlowTest_case_005
     * @tc.desc images: a Comment stores 1 capture uri entries in order (ImageFlowTest case 5)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ImageFlowTest_case_005', 0, async () => {
      const c: Comment = new Comment();
      const uris: ResourceStr[] = [...imageUriBatch(1)];
      c.images = uris;
      expect(c.images.length).assertEqual(1);
      expect(c.images[0] as string).assertEqual(uris[0]);
      expect(c.images[0] as string).assertEqual(uris[0]);
      expect(uris.indexOf(c.images[0] as string)).assertEqual(0);
      expect(c.images.length > 0).assertTrue();
      c.images.push(imageUriFor(99));
      expect(c.images.length).assertEqual(2);
      expect(c.images[c.images.length - 1] as string).assertEqual(imageUriFor(99));
    });
    /**
     * @tc.name ImageFlowTest_case_006
     * @tc.desc images: a Comment stores 2 capture uri entries in order (ImageFlowTest case 6)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ImageFlowTest_case_006', 0, async () => {
      const c: Comment = new Comment();
      const uris: ResourceStr[] = [...imageUriBatch(2)];
      c.images = uris;
      expect(c.images.length).assertEqual(2);
      expect(c.images[0] as string).assertEqual(uris[0]);
      expect(c.images[1] as string).assertEqual(uris[1]);
      expect(uris.indexOf(c.images[0] as string)).assertEqual(0);
      expect(c.images.length > 0).assertTrue();
      c.images.push(imageUriFor(99));
      expect(c.images.length).assertEqual(3);
      expect(c.images[c.images.length - 1] as string).assertEqual(imageUriFor(99));
    });
    /**
     * @tc.name ImageFlowTest_case_007
     * @tc.desc images: a Comment stores 3 capture uri entries in order (ImageFlowTest case 7)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ImageFlowTest_case_007', 0, async () => {
      const c: Comment = new Comment();
      const uris: ResourceStr[] = [...imageUriBatch(3)];
      c.images = uris;
      expect(c.images.length).assertEqual(3);
      expect(c.images[0] as string).assertEqual(uris[0]);
      expect(c.images[2] as string).assertEqual(uris[2]);
      expect(uris.indexOf(c.images[0] as string)).assertEqual(0);
      expect(c.images.length > 0).assertTrue();
      c.images.push(imageUriFor(99));
      expect(c.images.length).assertEqual(4);
      expect(c.images[c.images.length - 1] as string).assertEqual(imageUriFor(99));
    });
    /**
     * @tc.name ImageFlowTest_case_008
     * @tc.desc images: a Comment stores 4 capture uri entries in order (ImageFlowTest case 8)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ImageFlowTest_case_008', 0, async () => {
      const c: Comment = new Comment();
      const uris: ResourceStr[] = [...imageUriBatch(4)];
      c.images = uris;
      expect(c.images.length).assertEqual(4);
      expect(c.images[0] as string).assertEqual(uris[0]);
      expect(c.images[3] as string).assertEqual(uris[3]);
      expect(uris.indexOf(c.images[0] as string)).assertEqual(0);
      expect(c.images.length > 0).assertTrue();
      c.images.push(imageUriFor(99));
      expect(c.images.length).assertEqual(5);
      expect(c.images[c.images.length - 1] as string).assertEqual(imageUriFor(99));
    });
    /**
     * @tc.name ImageFlowTest_case_009
     * @tc.desc images: a Comment stores 1 capture uri entries in order (ImageFlowTest case 9)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ImageFlowTest_case_009', 0, async () => {
      const c: Comment = new Comment();
      const uris: ResourceStr[] = [...imageUriBatch(1)];
      c.images = uris;
      expect(c.images.length).assertEqual(1);
      expect(c.images[0] as string).assertEqual(uris[0]);
      expect(c.images[0] as string).assertEqual(uris[0]);
      expect(uris.indexOf(c.images[0] as string)).assertEqual(0);
      expect(c.images.length > 0).assertTrue();
      c.images.push(imageUriFor(99));
      expect(c.images.length).assertEqual(2);
      expect(c.images[c.images.length - 1] as string).assertEqual(imageUriFor(99));
    });
    /**
     * @tc.name ImageFlowTest_case_010
     * @tc.desc images: a Comment stores 2 capture uri entries in order (ImageFlowTest case 10)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ImageFlowTest_case_010', 0, async () => {
      const c: Comment = new Comment();
      const uris: ResourceStr[] = [...imageUriBatch(2)];
      c.images = uris;
      expect(c.images.length).assertEqual(2);
      expect(c.images[0] as string).assertEqual(uris[0]);
      expect(c.images[1] as string).assertEqual(uris[1]);
      expect(uris.indexOf(c.images[0] as string)).assertEqual(0);
      expect(c.images.length > 0).assertTrue();
      c.images.push(imageUriFor(99));
      expect(c.images.length).assertEqual(3);
      expect(c.images[c.images.length - 1] as string).assertEqual(imageUriFor(99));
    });
    /**
     * @tc.name ImageFlowTest_case_011
     * @tc.desc images: a Comment stores 3 capture uri entries in order (ImageFlowTest case 11)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ImageFlowTest_case_011', 0, async () => {
      const c: Comment = new Comment();
      const uris: ResourceStr[] = [...imageUriBatch(3)];
      c.images = uris;
      expect(c.images.length).assertEqual(3);
      expect(c.images[0] as string).assertEqual(uris[0]);
      expect(c.images[2] as string).assertEqual(uris[2]);
      expect(uris.indexOf(c.images[0] as string)).assertEqual(0);
      expect(c.images.length > 0).assertTrue();
      c.images.push(imageUriFor(99));
      expect(c.images.length).assertEqual(4);
      expect(c.images[c.images.length - 1] as string).assertEqual(imageUriFor(99));
    });
    /**
     * @tc.name ImageFlowTest_case_012
     * @tc.desc images: a Comment stores 4 capture uri entries in order (ImageFlowTest case 12)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ImageFlowTest_case_012', 0, async () => {
      const c: Comment = new Comment();
      const uris: ResourceStr[] = [...imageUriBatch(4)];
      c.images = uris;
      expect(c.images.length).assertEqual(4);
      expect(c.images[0] as string).assertEqual(uris[0]);
      expect(c.images[3] as string).assertEqual(uris[3]);
      expect(uris.indexOf(c.images[0] as string)).assertEqual(0);
      expect(c.images.length > 0).assertTrue();
      c.images.push(imageUriFor(99));
      expect(c.images.length).assertEqual(5);
      expect(c.images[c.images.length - 1] as string).assertEqual(imageUriFor(99));
    });
    /**
     * @tc.name ImageFlowTest_case_013
     * @tc.desc images: a Comment stores 1 capture uri entries in order (ImageFlowTest case 13)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ImageFlowTest_case_013', 0, async () => {
      const c: Comment = new Comment();
      const uris: ResourceStr[] = [...imageUriBatch(1)];
      c.images = uris;
      expect(c.images.length).assertEqual(1);
      expect(c.images[0] as string).assertEqual(uris[0]);
      expect(c.images[0] as string).assertEqual(uris[0]);
      expect(uris.indexOf(c.images[0] as string)).assertEqual(0);
      expect(c.images.length > 0).assertTrue();
      c.images.push(imageUriFor(99));
      expect(c.images.length).assertEqual(2);
      expect(c.images[c.images.length - 1] as string).assertEqual(imageUriFor(99));
    });
    /**
     * @tc.name ImageFlowTest_case_014
     * @tc.desc images: a Comment stores 2 capture uri entries in order (ImageFlowTest case 14)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ImageFlowTest_case_014', 0, async () => {
      const c: Comment = new Comment();
      const uris: ResourceStr[] = [...imageUriBatch(2)];
      c.images = uris;
      expect(c.images.length).assertEqual(2);
      expect(c.images[0] as string).assertEqual(uris[0]);
      expect(c.images[1] as string).assertEqual(uris[1]);
      expect(uris.indexOf(c.images[0] as string)).assertEqual(0);
      expect(c.images.length > 0).assertTrue();
      c.images.push(imageUriFor(99));
      expect(c.images.length).assertEqual(3);
      expect(c.images[c.images.length - 1] as string).assertEqual(imageUriFor(99));
    });
    /**
     * @tc.name ImageFlowTest_case_015
     * @tc.desc images: a Comment stores 3 capture uri entries in order (ImageFlowTest case 15)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ImageFlowTest_case_015', 0, async () => {
      const c: Comment = new Comment();
      const uris: ResourceStr[] = [...imageUriBatch(3)];
      c.images = uris;
      expect(c.images.length).assertEqual(3);
      expect(c.images[0] as string).assertEqual(uris[0]);
      expect(c.images[2] as string).assertEqual(uris[2]);
      expect(uris.indexOf(c.images[0] as string)).assertEqual(0);
      expect(c.images.length > 0).assertTrue();
      c.images.push(imageUriFor(99));
      expect(c.images.length).assertEqual(4);
      expect(c.images[c.images.length - 1] as string).assertEqual(imageUriFor(99));
    });
    /**
     * @tc.name ImageFlowTest_case_016
     * @tc.desc images: a Comment stores 4 capture uri entries in order (ImageFlowTest case 16)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ImageFlowTest_case_016', 0, async () => {
      const c: Comment = new Comment();
      const uris: ResourceStr[] = [...imageUriBatch(4)];
      c.images = uris;
      expect(c.images.length).assertEqual(4);
      expect(c.images[0] as string).assertEqual(uris[0]);
      expect(c.images[3] as string).assertEqual(uris[3]);
      expect(uris.indexOf(c.images[0] as string)).assertEqual(0);
      expect(c.images.length > 0).assertTrue();
      c.images.push(imageUriFor(99));
      expect(c.images.length).assertEqual(5);
      expect(c.images[c.images.length - 1] as string).assertEqual(imageUriFor(99));
    });
    /**
     * @tc.name ImageFlowTest_case_017
     * @tc.desc images: a Comment stores 1 capture uri entries in order (ImageFlowTest case 17)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ImageFlowTest_case_017', 0, async () => {
      const c: Comment = new Comment();
      const uris: ResourceStr[] = [...imageUriBatch(1)];
      c.images = uris;
      expect(c.images.length).assertEqual(1);
      expect(c.images[0] as string).assertEqual(uris[0]);
      expect(c.images[0] as string).assertEqual(uris[0]);
      expect(uris.indexOf(c.images[0] as string)).assertEqual(0);
      expect(c.images.length > 0).assertTrue();
      c.images.push(imageUriFor(99));
      expect(c.images.length).assertEqual(2);
      expect(c.images[c.images.length - 1] as string).assertEqual(imageUriFor(99));
    });
    /**
     * @tc.name ImageFlowTest_case_018
     * @tc.desc images: a Comment stores 2 capture uri entries in order (ImageFlowTest case 18)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ImageFlowTest_case_018', 0, async () => {
      const c: Comment = new Comment();
      const uris: ResourceStr[] = [...imageUriBatch(2)];
      c.images = uris;
      expect(c.images.length).assertEqual(2);
      expect(c.images[0] as string).assertEqual(uris[0]);
      expect(c.images[1] as string).assertEqual(uris[1]);
      expect(uris.indexOf(c.images[0] as string)).assertEqual(0);
      expect(c.images.length > 0).assertTrue();
      c.images.push(imageUriFor(99));
      expect(c.images.length).assertEqual(3);
      expect(c.images[c.images.length - 1] as string).assertEqual(imageUriFor(99));
    });
    /**
     * @tc.name ImageFlowTest_case_019
     * @tc.desc images: a Comment stores 3 capture uri entries in order (ImageFlowTest case 19)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ImageFlowTest_case_019', 0, async () => {
      const c: Comment = new Comment();
      const uris: ResourceStr[] = [...imageUriBatch(3)];
      c.images = uris;
      expect(c.images.length).assertEqual(3);
      expect(c.images[0] as string).assertEqual(uris[0]);
      expect(c.images[2] as string).assertEqual(uris[2]);
      expect(uris.indexOf(c.images[0] as string)).assertEqual(0);
      expect(c.images.length > 0).assertTrue();
      c.images.push(imageUriFor(99));
      expect(c.images.length).assertEqual(4);
      expect(c.images[c.images.length - 1] as string).assertEqual(imageUriFor(99));
    });
    /**
     * @tc.name ImageFlowTest_case_020
     * @tc.desc images: a Comment stores 4 capture uri entries in order (ImageFlowTest case 20)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ImageFlowTest_case_020', 0, async () => {
      const c: Comment = new Comment();
      const uris: ResourceStr[] = [...imageUriBatch(4)];
      c.images = uris;
      expect(c.images.length).assertEqual(4);
      expect(c.images[0] as string).assertEqual(uris[0]);
      expect(c.images[3] as string).assertEqual(uris[3]);
      expect(uris.indexOf(c.images[0] as string)).assertEqual(0);
      expect(c.images.length > 0).assertTrue();
      c.images.push(imageUriFor(99));
      expect(c.images.length).assertEqual(5);
      expect(c.images[c.images.length - 1] as string).assertEqual(imageUriFor(99));
    });
    /**
     * @tc.name ImageFlowTest_case_021
     * @tc.desc images: a Comment stores 1 capture uri entries in order (ImageFlowTest case 21)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ImageFlowTest_case_021', 0, async () => {
      const c: Comment = new Comment();
      const uris: ResourceStr[] = [...imageUriBatch(1)];
      c.images = uris;
      expect(c.images.length).assertEqual(1);
      expect(c.images[0] as string).assertEqual(uris[0]);
      expect(c.images[0] as string).assertEqual(uris[0]);
      expect(uris.indexOf(c.images[0] as string)).assertEqual(0);
      expect(c.images.length > 0).assertTrue();
      c.images.push(imageUriFor(99));
      expect(c.images.length).assertEqual(2);
      expect(c.images[c.images.length - 1] as string).assertEqual(imageUriFor(99));
    });
    /**
     * @tc.name ImageFlowTest_case_022
     * @tc.desc images: a Comment stores 2 capture uri entries in order (ImageFlowTest case 22)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ImageFlowTest_case_022', 0, async () => {
      const c: Comment = new Comment();
      const uris: ResourceStr[] = [...imageUriBatch(2)];
      c.images = uris;
      expect(c.images.length).assertEqual(2);
      expect(c.images[0] as string).assertEqual(uris[0]);
      expect(c.images[1] as string).assertEqual(uris[1]);
      expect(uris.indexOf(c.images[0] as string)).assertEqual(0);
      expect(c.images.length > 0).assertTrue();
      c.images.push(imageUriFor(99));
      expect(c.images.length).assertEqual(3);
      expect(c.images[c.images.length - 1] as string).assertEqual(imageUriFor(99));
    });
    /**
     * @tc.name ImageFlowTest_case_023
     * @tc.desc images: a Comment stores 3 capture uri entries in order (ImageFlowTest case 23)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ImageFlowTest_case_023', 0, async () => {
      const c: Comment = new Comment();
      const uris: ResourceStr[] = [...imageUriBatch(3)];
      c.images = uris;
      expect(c.images.length).assertEqual(3);
      expect(c.images[0] as string).assertEqual(uris[0]);
      expect(c.images[2] as string).assertEqual(uris[2]);
      expect(uris.indexOf(c.images[0] as string)).assertEqual(0);
      expect(c.images.length > 0).assertTrue();
      c.images.push(imageUriFor(99));
      expect(c.images.length).assertEqual(4);
      expect(c.images[c.images.length - 1] as string).assertEqual(imageUriFor(99));
    });
    /**
     * @tc.name ImageFlowTest_case_024
     * @tc.desc images: a Comment stores 4 capture uri entries in order (ImageFlowTest case 24)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ImageFlowTest_case_024', 0, async () => {
      const c: Comment = new Comment();
      const uris: ResourceStr[] = [...imageUriBatch(4)];
      c.images = uris;
      expect(c.images.length).assertEqual(4);
      expect(c.images[0] as string).assertEqual(uris[0]);
      expect(c.images[3] as string).assertEqual(uris[3]);
      expect(uris.indexOf(c.images[0] as string)).assertEqual(0);
      expect(c.images.length > 0).assertTrue();
      c.images.push(imageUriFor(99));
      expect(c.images.length).assertEqual(5);
      expect(c.images[c.images.length - 1] as string).assertEqual(imageUriFor(99));
    });
    /**
     * @tc.name ImageFlowTest_case_025
     * @tc.desc images: a Comment stores 1 capture uri entries in order (ImageFlowTest case 25)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ImageFlowTest_case_025', 0, async () => {
      const c: Comment = new Comment();
      const uris: ResourceStr[] = [...imageUriBatch(1)];
      c.images = uris;
      expect(c.images.length).assertEqual(1);
      expect(c.images[0] as string).assertEqual(uris[0]);
      expect(c.images[0] as string).assertEqual(uris[0]);
      expect(uris.indexOf(c.images[0] as string)).assertEqual(0);
      expect(c.images.length > 0).assertTrue();
      c.images.push(imageUriFor(99));
      expect(c.images.length).assertEqual(2);
      expect(c.images[c.images.length - 1] as string).assertEqual(imageUriFor(99));
    });
    /**
     * @tc.name ImageFlowTest_case_026
     * @tc.desc images: a Comment stores 2 capture uri entries in order (ImageFlowTest case 26)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ImageFlowTest_case_026', 0, async () => {
      const c: Comment = new Comment();
      const uris: ResourceStr[] = [...imageUriBatch(2)];
      c.images = uris;
      expect(c.images.length).assertEqual(2);
      expect(c.images[0] as string).assertEqual(uris[0]);
      expect(c.images[1] as string).assertEqual(uris[1]);
      expect(uris.indexOf(c.images[0] as string)).assertEqual(0);
      expect(c.images.length > 0).assertTrue();
      c.images.push(imageUriFor(99));
      expect(c.images.length).assertEqual(3);
      expect(c.images[c.images.length - 1] as string).assertEqual(imageUriFor(99));
    });
    /**
     * @tc.name ImageFlowTest_case_027
     * @tc.desc images: a Comment stores 3 capture uri entries in order (ImageFlowTest case 27)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ImageFlowTest_case_027', 0, async () => {
      const c: Comment = new Comment();
      const uris: ResourceStr[] = [...imageUriBatch(3)];
      c.images = uris;
      expect(c.images.length).assertEqual(3);
      expect(c.images[0] as string).assertEqual(uris[0]);
      expect(c.images[2] as string).assertEqual(uris[2]);
      expect(uris.indexOf(c.images[0] as string)).assertEqual(0);
      expect(c.images.length > 0).assertTrue();
      c.images.push(imageUriFor(99));
      expect(c.images.length).assertEqual(4);
      expect(c.images[c.images.length - 1] as string).assertEqual(imageUriFor(99));
    });
    /**
     * @tc.name ImageFlowTest_case_028
     * @tc.desc images: a Comment stores 4 capture uri entries in order (ImageFlowTest case 28)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ImageFlowTest_case_028', 0, async () => {
      const c: Comment = new Comment();
      const uris: ResourceStr[] = [...imageUriBatch(4)];
      c.images = uris;
      expect(c.images.length).assertEqual(4);
      expect(c.images[0] as string).assertEqual(uris[0]);
      expect(c.images[3] as string).assertEqual(uris[3]);
      expect(uris.indexOf(c.images[0] as string)).assertEqual(0);
      expect(c.images.length > 0).assertTrue();
      c.images.push(imageUriFor(99));
      expect(c.images.length).assertEqual(5);
      expect(c.images[c.images.length - 1] as string).assertEqual(imageUriFor(99));
    });
    /**
     * @tc.name ImageFlowTest_case_029
     * @tc.desc images: a Comment stores 1 capture uri entries in order (ImageFlowTest case 29)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ImageFlowTest_case_029', 0, async () => {
      const c: Comment = new Comment();
      const uris: ResourceStr[] = [...imageUriBatch(1)];
      c.images = uris;
      expect(c.images.length).assertEqual(1);
      expect(c.images[0] as string).assertEqual(uris[0]);
      expect(c.images[0] as string).assertEqual(uris[0]);
      expect(uris.indexOf(c.images[0] as string)).assertEqual(0);
      expect(c.images.length > 0).assertTrue();
      c.images.push(imageUriFor(99));
      expect(c.images.length).assertEqual(2);
      expect(c.images[c.images.length - 1] as string).assertEqual(imageUriFor(99));
    });
    /**
     * @tc.name ImageFlowTest_case_030
     * @tc.desc images: a Comment stores 2 capture uri entries in order (ImageFlowTest case 30)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ImageFlowTest_case_030', 0, async () => {
      const c: Comment = new Comment();
      const uris: ResourceStr[] = [...imageUriBatch(2)];
      c.images = uris;
      expect(c.images.length).assertEqual(2);
      expect(c.images[0] as string).assertEqual(uris[0]);
      expect(c.images[1] as string).assertEqual(uris[1]);
      expect(uris.indexOf(c.images[0] as string)).assertEqual(0);
      expect(c.images.length > 0).assertTrue();
      c.images.push(imageUriFor(99));
      expect(c.images.length).assertEqual(3);
      expect(c.images[c.images.length - 1] as string).assertEqual(imageUriFor(99));
    });
    /**
     * @tc.name ImageFlowTest_case_031
     * @tc.desc images: a Comment stores 3 capture uri entries in order (ImageFlowTest case 31)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ImageFlowTest_case_031', 0, async () => {
      const c: Comment = new Comment();
      const uris: ResourceStr[] = [...imageUriBatch(3)];
      c.images = uris;
      expect(c.images.length).assertEqual(3);
      expect(c.images[0] as string).assertEqual(uris[0]);
      expect(c.images[2] as string).assertEqual(uris[2]);
      expect(uris.indexOf(c.images[0] as string)).assertEqual(0);
      expect(c.images.length > 0).assertTrue();
      c.images.push(imageUriFor(99));
      expect(c.images.length).assertEqual(4);
      expect(c.images[c.images.length - 1] as string).assertEqual(imageUriFor(99));
    });
    /**
     * @tc.name ImageFlowTest_case_032
     * @tc.desc images: a Comment stores 4 capture uri entries in order (ImageFlowTest case 32)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ImageFlowTest_case_032', 0, async () => {
      const c: Comment = new Comment();
      const uris: ResourceStr[] = [...imageUriBatch(4)];
      c.images = uris;
      expect(c.images.length).assertEqual(4);
      expect(c.images[0] as string).assertEqual(uris[0]);
      expect(c.images[3] as string).assertEqual(uris[3]);
      expect(uris.indexOf(c.images[0] as string)).assertEqual(0);
      expect(c.images.length > 0).assertTrue();
      c.images.push(imageUriFor(99));
      expect(c.images.length).assertEqual(5);
      expect(c.images[c.images.length - 1] as string).assertEqual(imageUriFor(99));
    });
    /**
     * @tc.name ImageFlowTest_case_033
     * @tc.desc images: a Comment stores 1 capture uri entries in order (ImageFlowTest case 33)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ImageFlowTest_case_033', 0, async () => {
      const c: Comment = new Comment();
      const uris: ResourceStr[] = [...imageUriBatch(1)];
      c.images = uris;
      expect(c.images.length).assertEqual(1);
      expect(c.images[0] as string).assertEqual(uris[0]);
      expect(c.images[0] as string).assertEqual(uris[0]);
      expect(uris.indexOf(c.images[0] as string)).assertEqual(0);
      expect(c.images.length > 0).assertTrue();
      c.images.push(imageUriFor(99));
      expect(c.images.length).assertEqual(2);
      expect(c.images[c.images.length - 1] as string).assertEqual(imageUriFor(99));
    });
    /**
     * @tc.name ImageFlowTest_case_034
     * @tc.desc images: a Comment stores 2 capture uri entries in order (ImageFlowTest case 34)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ImageFlowTest_case_034', 0, async () => {
      const c: Comment = new Comment();
      const uris: ResourceStr[] = [...imageUriBatch(2)];
      c.images = uris;
      expect(c.images.length).assertEqual(2);
      expect(c.images[0] as string).assertEqual(uris[0]);
      expect(c.images[1] as string).assertEqual(uris[1]);
      expect(uris.indexOf(c.images[0] as string)).assertEqual(0);
      expect(c.images.length > 0).assertTrue();
      c.images.push(imageUriFor(99));
      expect(c.images.length).assertEqual(3);
      expect(c.images[c.images.length - 1] as string).assertEqual(imageUriFor(99));
    });
    /**
     * @tc.name ImageFlowTest_case_035
     * @tc.desc images: a Comment stores 3 capture uri entries in order (ImageFlowTest case 35)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ImageFlowTest_case_035', 0, async () => {
      const c: Comment = new Comment();
      const uris: ResourceStr[] = [...imageUriBatch(3)];
      c.images = uris;
      expect(c.images.length).assertEqual(3);
      expect(c.images[0] as string).assertEqual(uris[0]);
      expect(c.images[2] as string).assertEqual(uris[2]);
      expect(uris.indexOf(c.images[0] as string)).assertEqual(0);
      expect(c.images.length > 0).assertTrue();
      c.images.push(imageUriFor(99));
      expect(c.images.length).assertEqual(4);
      expect(c.images[c.images.length - 1] as string).assertEqual(imageUriFor(99));
    });
    /**
     * @tc.name ImageFlowTest_case_036
     * @tc.desc images: a Comment stores 4 capture uri entries in order (ImageFlowTest case 36)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ImageFlowTest_case_036', 0, async () => {
      const c: Comment = new Comment();
      const uris: ResourceStr[] = [...imageUriBatch(4)];
      c.images = uris;
      expect(c.images.length).assertEqual(4);
      expect(c.images[0] as string).assertEqual(uris[0]);
      expect(c.images[3] as string).assertEqual(uris[3]);
      expect(uris.indexOf(c.images[0] as string)).assertEqual(0);
      expect(c.images.length > 0).assertTrue();
      c.images.push(imageUriFor(99));
      expect(c.images.length).assertEqual(5);
      expect(c.images[c.images.length - 1] as string).assertEqual(imageUriFor(99));
    });
    /**
     * @tc.name ImageFlowTest_case_037
     * @tc.desc images: a Comment stores 1 capture uri entries in order (ImageFlowTest case 37)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ImageFlowTest_case_037', 0, async () => {
      const c: Comment = new Comment();
      const uris: ResourceStr[] = [...imageUriBatch(1)];
      c.images = uris;
      expect(c.images.length).assertEqual(1);
      expect(c.images[0] as string).assertEqual(uris[0]);
      expect(c.images[0] as string).assertEqual(uris[0]);
      expect(uris.indexOf(c.images[0] as string)).assertEqual(0);
      expect(c.images.length > 0).assertTrue();
      c.images.push(imageUriFor(99));
      expect(c.images.length).assertEqual(2);
      expect(c.images[c.images.length - 1] as string).assertEqual(imageUriFor(99));
    });
    /**
     * @tc.name ImageFlowTest_case_038
     * @tc.desc images: a Comment stores 2 capture uri entries in order (ImageFlowTest case 38)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ImageFlowTest_case_038', 0, async () => {
      const c: Comment = new Comment();
      const uris: ResourceStr[] = [...imageUriBatch(2)];
      c.images = uris;
      expect(c.images.length).assertEqual(2);
      expect(c.images[0] as string).assertEqual(uris[0]);
      expect(c.images[1] as string).assertEqual(uris[1]);
      expect(uris.indexOf(c.images[0] as string)).assertEqual(0);
      expect(c.images.length > 0).assertTrue();
      c.images.push(imageUriFor(99));
      expect(c.images.length).assertEqual(3);
      expect(c.images[c.images.length - 1] as string).assertEqual(imageUriFor(99));
    });
    /**
     * @tc.name ImageFlowTest_case_039
     * @tc.desc images: a Comment stores 3 capture uri entries in order (ImageFlowTest case 39)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ImageFlowTest_case_039', 0, async () => {
      const c: Comment = new Comment();
      const uris: ResourceStr[] = [...imageUriBatch(3)];
      c.images = uris;
      expect(c.images.length).assertEqual(3);
      expect(c.images[0] as string).assertEqual(uris[0]);
      expect(c.images[2] as string).assertEqual(uris[2]);
      expect(uris.indexOf(c.images[0] as string)).assertEqual(0);
      expect(c.images.length > 0).assertTrue();
      c.images.push(imageUriFor(99));
      expect(c.images.length).assertEqual(4);
      expect(c.images[c.images.length - 1] as string).assertEqual(imageUriFor(99));
    });
    /**
     * @tc.name ImageFlowTest_case_040
     * @tc.desc images: a Comment stores 4 capture uri entries in order (ImageFlowTest case 40)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ImageFlowTest_case_040', 0, async () => {
      const c: Comment = new Comment();
      const uris: ResourceStr[] = [...imageUriBatch(4)];
      c.images = uris;
      expect(c.images.length).assertEqual(4);
      expect(c.images[0] as string).assertEqual(uris[0]);
      expect(c.images[3] as string).assertEqual(uris[3]);
      expect(uris.indexOf(c.images[0] as string)).assertEqual(0);
      expect(c.images.length > 0).assertTrue();
      c.images.push(imageUriFor(99));
      expect(c.images.length).assertEqual(5);
      expect(c.images[c.images.length - 1] as string).assertEqual(imageUriFor(99));
    });
  });
}
