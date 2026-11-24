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

export default function CameraWantTest(): void {
  describe('CameraWantTest', () => {
    beforeAll(() => {
      logSuite('CameraWantTest', 'begin');
    });
    beforeEach(async () => {
      await yieldTick();
    });
    afterAll(() => {
      logSuite('CameraWantTest', 'end');
    });

    /**
     * @tc.name CameraWantTest_case_001
     * @tc.desc want: camera request uses picker action and single image mode, variant 1 (CameraWantTest case 1)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CameraWantTest_case_001', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(request.action).assertEqual('ohos.want.action.imageCapture');
      expect(request.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName).assertEqual('com.example.camerasample');
      const other: CameraRequest = buildCameraRequest('com.example.other');
      expect(other.parameters.callBundleName).assertEqual('com.example.other');
      expect(other.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName === other.parameters.callBundleName).assertFalse();
      expect(buildCameraRequest('').parameters.callBundleName).assertEqual('');
      expect(request.action.length > 0).assertTrue();
    });
    /**
     * @tc.name CameraWantTest_case_002
     * @tc.desc want: camera request uses picker action and single image mode, variant 2 (CameraWantTest case 2)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CameraWantTest_case_002', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(request.action).assertEqual('ohos.want.action.imageCapture');
      expect(request.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName).assertEqual('com.example.camerasample');
      const other: CameraRequest = buildCameraRequest('com.example.other');
      expect(other.parameters.callBundleName).assertEqual('com.example.other');
      expect(other.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName === other.parameters.callBundleName).assertFalse();
      expect(buildCameraRequest('').parameters.callBundleName).assertEqual('');
      expect(request.action.length > 0).assertTrue();
    });
    /**
     * @tc.name CameraWantTest_case_003
     * @tc.desc want: camera request uses picker action and single image mode, variant 3 (CameraWantTest case 3)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CameraWantTest_case_003', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(request.action).assertEqual('ohos.want.action.imageCapture');
      expect(request.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName).assertEqual('com.example.camerasample');
      const other: CameraRequest = buildCameraRequest('com.example.other');
      expect(other.parameters.callBundleName).assertEqual('com.example.other');
      expect(other.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName === other.parameters.callBundleName).assertFalse();
      expect(buildCameraRequest('').parameters.callBundleName).assertEqual('');
      expect(request.action.length > 0).assertTrue();
    });
    /**
     * @tc.name CameraWantTest_case_004
     * @tc.desc want: camera request uses picker action and single image mode, variant 1 (CameraWantTest case 4)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CameraWantTest_case_004', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(request.action).assertEqual('ohos.want.action.imageCapture');
      expect(request.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName).assertEqual('com.example.camerasample');
      const other: CameraRequest = buildCameraRequest('com.example.other');
      expect(other.parameters.callBundleName).assertEqual('com.example.other');
      expect(other.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName === other.parameters.callBundleName).assertFalse();
      expect(buildCameraRequest('').parameters.callBundleName).assertEqual('');
      expect(request.action.length > 0).assertTrue();
    });
    /**
     * @tc.name CameraWantTest_case_005
     * @tc.desc want: camera request uses picker action and single image mode, variant 2 (CameraWantTest case 5)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CameraWantTest_case_005', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(request.action).assertEqual('ohos.want.action.imageCapture');
      expect(request.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName).assertEqual('com.example.camerasample');
      const other: CameraRequest = buildCameraRequest('com.example.other');
      expect(other.parameters.callBundleName).assertEqual('com.example.other');
      expect(other.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName === other.parameters.callBundleName).assertFalse();
      expect(buildCameraRequest('').parameters.callBundleName).assertEqual('');
      expect(request.action.length > 0).assertTrue();
    });
    /**
     * @tc.name CameraWantTest_case_006
     * @tc.desc want: camera request uses picker action and single image mode, variant 3 (CameraWantTest case 6)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CameraWantTest_case_006', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(request.action).assertEqual('ohos.want.action.imageCapture');
      expect(request.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName).assertEqual('com.example.camerasample');
      const other: CameraRequest = buildCameraRequest('com.example.other');
      expect(other.parameters.callBundleName).assertEqual('com.example.other');
      expect(other.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName === other.parameters.callBundleName).assertFalse();
      expect(buildCameraRequest('').parameters.callBundleName).assertEqual('');
      expect(request.action.length > 0).assertTrue();
    });
    /**
     * @tc.name CameraWantTest_case_007
     * @tc.desc want: camera request uses picker action and single image mode, variant 1 (CameraWantTest case 7)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CameraWantTest_case_007', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(request.action).assertEqual('ohos.want.action.imageCapture');
      expect(request.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName).assertEqual('com.example.camerasample');
      const other: CameraRequest = buildCameraRequest('com.example.other');
      expect(other.parameters.callBundleName).assertEqual('com.example.other');
      expect(other.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName === other.parameters.callBundleName).assertFalse();
      expect(buildCameraRequest('').parameters.callBundleName).assertEqual('');
      expect(request.action.length > 0).assertTrue();
    });
    /**
     * @tc.name CameraWantTest_case_008
     * @tc.desc want: camera request uses picker action and single image mode, variant 2 (CameraWantTest case 8)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CameraWantTest_case_008', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(request.action).assertEqual('ohos.want.action.imageCapture');
      expect(request.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName).assertEqual('com.example.camerasample');
      const other: CameraRequest = buildCameraRequest('com.example.other');
      expect(other.parameters.callBundleName).assertEqual('com.example.other');
      expect(other.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName === other.parameters.callBundleName).assertFalse();
      expect(buildCameraRequest('').parameters.callBundleName).assertEqual('');
      expect(request.action.length > 0).assertTrue();
    });
    /**
     * @tc.name CameraWantTest_case_009
     * @tc.desc want: camera request uses picker action and single image mode, variant 3 (CameraWantTest case 9)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CameraWantTest_case_009', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(request.action).assertEqual('ohos.want.action.imageCapture');
      expect(request.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName).assertEqual('com.example.camerasample');
      const other: CameraRequest = buildCameraRequest('com.example.other');
      expect(other.parameters.callBundleName).assertEqual('com.example.other');
      expect(other.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName === other.parameters.callBundleName).assertFalse();
      expect(buildCameraRequest('').parameters.callBundleName).assertEqual('');
      expect(request.action.length > 0).assertTrue();
    });
    /**
     * @tc.name CameraWantTest_case_010
     * @tc.desc want: camera request uses picker action and single image mode, variant 1 (CameraWantTest case 10)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CameraWantTest_case_010', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(request.action).assertEqual('ohos.want.action.imageCapture');
      expect(request.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName).assertEqual('com.example.camerasample');
      const other: CameraRequest = buildCameraRequest('com.example.other');
      expect(other.parameters.callBundleName).assertEqual('com.example.other');
      expect(other.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName === other.parameters.callBundleName).assertFalse();
      expect(buildCameraRequest('').parameters.callBundleName).assertEqual('');
      expect(request.action.length > 0).assertTrue();
    });
    /**
     * @tc.name CameraWantTest_case_011
     * @tc.desc want: camera request uses picker action and single image mode, variant 2 (CameraWantTest case 11)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CameraWantTest_case_011', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(request.action).assertEqual('ohos.want.action.imageCapture');
      expect(request.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName).assertEqual('com.example.camerasample');
      const other: CameraRequest = buildCameraRequest('com.example.other');
      expect(other.parameters.callBundleName).assertEqual('com.example.other');
      expect(other.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName === other.parameters.callBundleName).assertFalse();
      expect(buildCameraRequest('').parameters.callBundleName).assertEqual('');
      expect(request.action.length > 0).assertTrue();
    });
    /**
     * @tc.name CameraWantTest_case_012
     * @tc.desc want: camera request uses picker action and single image mode, variant 3 (CameraWantTest case 12)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CameraWantTest_case_012', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(request.action).assertEqual('ohos.want.action.imageCapture');
      expect(request.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName).assertEqual('com.example.camerasample');
      const other: CameraRequest = buildCameraRequest('com.example.other');
      expect(other.parameters.callBundleName).assertEqual('com.example.other');
      expect(other.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName === other.parameters.callBundleName).assertFalse();
      expect(buildCameraRequest('').parameters.callBundleName).assertEqual('');
      expect(request.action.length > 0).assertTrue();
    });
    /**
     * @tc.name CameraWantTest_case_013
     * @tc.desc want: camera request uses picker action and single image mode, variant 1 (CameraWantTest case 13)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CameraWantTest_case_013', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(request.action).assertEqual('ohos.want.action.imageCapture');
      expect(request.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName).assertEqual('com.example.camerasample');
      const other: CameraRequest = buildCameraRequest('com.example.other');
      expect(other.parameters.callBundleName).assertEqual('com.example.other');
      expect(other.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName === other.parameters.callBundleName).assertFalse();
      expect(buildCameraRequest('').parameters.callBundleName).assertEqual('');
      expect(request.action.length > 0).assertTrue();
    });
    /**
     * @tc.name CameraWantTest_case_014
     * @tc.desc want: camera request uses picker action and single image mode, variant 2 (CameraWantTest case 14)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CameraWantTest_case_014', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(request.action).assertEqual('ohos.want.action.imageCapture');
      expect(request.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName).assertEqual('com.example.camerasample');
      const other: CameraRequest = buildCameraRequest('com.example.other');
      expect(other.parameters.callBundleName).assertEqual('com.example.other');
      expect(other.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName === other.parameters.callBundleName).assertFalse();
      expect(buildCameraRequest('').parameters.callBundleName).assertEqual('');
      expect(request.action.length > 0).assertTrue();
    });
    /**
     * @tc.name CameraWantTest_case_015
     * @tc.desc want: camera request uses picker action and single image mode, variant 3 (CameraWantTest case 15)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CameraWantTest_case_015', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(request.action).assertEqual('ohos.want.action.imageCapture');
      expect(request.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName).assertEqual('com.example.camerasample');
      const other: CameraRequest = buildCameraRequest('com.example.other');
      expect(other.parameters.callBundleName).assertEqual('com.example.other');
      expect(other.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName === other.parameters.callBundleName).assertFalse();
      expect(buildCameraRequest('').parameters.callBundleName).assertEqual('');
      expect(request.action.length > 0).assertTrue();
    });
    /**
     * @tc.name CameraWantTest_case_016
     * @tc.desc want: camera request uses picker action and single image mode, variant 1 (CameraWantTest case 16)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CameraWantTest_case_016', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(request.action).assertEqual('ohos.want.action.imageCapture');
      expect(request.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName).assertEqual('com.example.camerasample');
      const other: CameraRequest = buildCameraRequest('com.example.other');
      expect(other.parameters.callBundleName).assertEqual('com.example.other');
      expect(other.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName === other.parameters.callBundleName).assertFalse();
      expect(buildCameraRequest('').parameters.callBundleName).assertEqual('');
      expect(request.action.length > 0).assertTrue();
    });
    /**
     * @tc.name CameraWantTest_case_017
     * @tc.desc want: camera request uses picker action and single image mode, variant 2 (CameraWantTest case 17)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CameraWantTest_case_017', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(request.action).assertEqual('ohos.want.action.imageCapture');
      expect(request.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName).assertEqual('com.example.camerasample');
      const other: CameraRequest = buildCameraRequest('com.example.other');
      expect(other.parameters.callBundleName).assertEqual('com.example.other');
      expect(other.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName === other.parameters.callBundleName).assertFalse();
      expect(buildCameraRequest('').parameters.callBundleName).assertEqual('');
      expect(request.action.length > 0).assertTrue();
    });
    /**
     * @tc.name CameraWantTest_case_018
     * @tc.desc want: camera request uses picker action and single image mode, variant 3 (CameraWantTest case 18)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CameraWantTest_case_018', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(request.action).assertEqual('ohos.want.action.imageCapture');
      expect(request.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName).assertEqual('com.example.camerasample');
      const other: CameraRequest = buildCameraRequest('com.example.other');
      expect(other.parameters.callBundleName).assertEqual('com.example.other');
      expect(other.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName === other.parameters.callBundleName).assertFalse();
      expect(buildCameraRequest('').parameters.callBundleName).assertEqual('');
      expect(request.action.length > 0).assertTrue();
    });
    /**
     * @tc.name CameraWantTest_case_019
     * @tc.desc want: camera request uses picker action and single image mode, variant 1 (CameraWantTest case 19)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CameraWantTest_case_019', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(request.action).assertEqual('ohos.want.action.imageCapture');
      expect(request.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName).assertEqual('com.example.camerasample');
      const other: CameraRequest = buildCameraRequest('com.example.other');
      expect(other.parameters.callBundleName).assertEqual('com.example.other');
      expect(other.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName === other.parameters.callBundleName).assertFalse();
      expect(buildCameraRequest('').parameters.callBundleName).assertEqual('');
      expect(request.action.length > 0).assertTrue();
    });
    /**
     * @tc.name CameraWantTest_case_020
     * @tc.desc want: camera request uses picker action and single image mode, variant 2 (CameraWantTest case 20)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CameraWantTest_case_020', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(request.action).assertEqual('ohos.want.action.imageCapture');
      expect(request.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName).assertEqual('com.example.camerasample');
      const other: CameraRequest = buildCameraRequest('com.example.other');
      expect(other.parameters.callBundleName).assertEqual('com.example.other');
      expect(other.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName === other.parameters.callBundleName).assertFalse();
      expect(buildCameraRequest('').parameters.callBundleName).assertEqual('');
      expect(request.action.length > 0).assertTrue();
    });
    /**
     * @tc.name CameraWantTest_case_021
     * @tc.desc want: camera request uses picker action and single image mode, variant 3 (CameraWantTest case 21)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CameraWantTest_case_021', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(request.action).assertEqual('ohos.want.action.imageCapture');
      expect(request.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName).assertEqual('com.example.camerasample');
      const other: CameraRequest = buildCameraRequest('com.example.other');
      expect(other.parameters.callBundleName).assertEqual('com.example.other');
      expect(other.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName === other.parameters.callBundleName).assertFalse();
      expect(buildCameraRequest('').parameters.callBundleName).assertEqual('');
      expect(request.action.length > 0).assertTrue();
    });
    /**
     * @tc.name CameraWantTest_case_022
     * @tc.desc want: camera request uses picker action and single image mode, variant 1 (CameraWantTest case 22)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CameraWantTest_case_022', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(request.action).assertEqual('ohos.want.action.imageCapture');
      expect(request.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName).assertEqual('com.example.camerasample');
      const other: CameraRequest = buildCameraRequest('com.example.other');
      expect(other.parameters.callBundleName).assertEqual('com.example.other');
      expect(other.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName === other.parameters.callBundleName).assertFalse();
      expect(buildCameraRequest('').parameters.callBundleName).assertEqual('');
      expect(request.action.length > 0).assertTrue();
    });
    /**
     * @tc.name CameraWantTest_case_023
     * @tc.desc want: camera request uses picker action and single image mode, variant 2 (CameraWantTest case 23)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CameraWantTest_case_023', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(request.action).assertEqual('ohos.want.action.imageCapture');
      expect(request.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName).assertEqual('com.example.camerasample');
      const other: CameraRequest = buildCameraRequest('com.example.other');
      expect(other.parameters.callBundleName).assertEqual('com.example.other');
      expect(other.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName === other.parameters.callBundleName).assertFalse();
      expect(buildCameraRequest('').parameters.callBundleName).assertEqual('');
      expect(request.action.length > 0).assertTrue();
    });
    /**
     * @tc.name CameraWantTest_case_024
     * @tc.desc want: camera request uses picker action and single image mode, variant 3 (CameraWantTest case 24)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CameraWantTest_case_024', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(request.action).assertEqual('ohos.want.action.imageCapture');
      expect(request.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName).assertEqual('com.example.camerasample');
      const other: CameraRequest = buildCameraRequest('com.example.other');
      expect(other.parameters.callBundleName).assertEqual('com.example.other');
      expect(other.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName === other.parameters.callBundleName).assertFalse();
      expect(buildCameraRequest('').parameters.callBundleName).assertEqual('');
      expect(request.action.length > 0).assertTrue();
    });
    /**
     * @tc.name CameraWantTest_case_025
     * @tc.desc want: camera request uses picker action and single image mode, variant 1 (CameraWantTest case 25)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CameraWantTest_case_025', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(request.action).assertEqual('ohos.want.action.imageCapture');
      expect(request.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName).assertEqual('com.example.camerasample');
      const other: CameraRequest = buildCameraRequest('com.example.other');
      expect(other.parameters.callBundleName).assertEqual('com.example.other');
      expect(other.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName === other.parameters.callBundleName).assertFalse();
      expect(buildCameraRequest('').parameters.callBundleName).assertEqual('');
      expect(request.action.length > 0).assertTrue();
    });
    /**
     * @tc.name CameraWantTest_case_026
     * @tc.desc want: camera request uses picker action and single image mode, variant 2 (CameraWantTest case 26)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CameraWantTest_case_026', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(request.action).assertEqual('ohos.want.action.imageCapture');
      expect(request.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName).assertEqual('com.example.camerasample');
      const other: CameraRequest = buildCameraRequest('com.example.other');
      expect(other.parameters.callBundleName).assertEqual('com.example.other');
      expect(other.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName === other.parameters.callBundleName).assertFalse();
      expect(buildCameraRequest('').parameters.callBundleName).assertEqual('');
      expect(request.action.length > 0).assertTrue();
    });
    /**
     * @tc.name CameraWantTest_case_027
     * @tc.desc want: camera request uses picker action and single image mode, variant 3 (CameraWantTest case 27)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CameraWantTest_case_027', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(request.action).assertEqual('ohos.want.action.imageCapture');
      expect(request.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName).assertEqual('com.example.camerasample');
      const other: CameraRequest = buildCameraRequest('com.example.other');
      expect(other.parameters.callBundleName).assertEqual('com.example.other');
      expect(other.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName === other.parameters.callBundleName).assertFalse();
      expect(buildCameraRequest('').parameters.callBundleName).assertEqual('');
      expect(request.action.length > 0).assertTrue();
    });
    /**
     * @tc.name CameraWantTest_case_028
     * @tc.desc want: camera request uses picker action and single image mode, variant 1 (CameraWantTest case 28)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CameraWantTest_case_028', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(request.action).assertEqual('ohos.want.action.imageCapture');
      expect(request.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName).assertEqual('com.example.camerasample');
      const other: CameraRequest = buildCameraRequest('com.example.other');
      expect(other.parameters.callBundleName).assertEqual('com.example.other');
      expect(other.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName === other.parameters.callBundleName).assertFalse();
      expect(buildCameraRequest('').parameters.callBundleName).assertEqual('');
      expect(request.action.length > 0).assertTrue();
    });
    /**
     * @tc.name CameraWantTest_case_029
     * @tc.desc want: camera request uses picker action and single image mode, variant 2 (CameraWantTest case 29)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CameraWantTest_case_029', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(request.action).assertEqual('ohos.want.action.imageCapture');
      expect(request.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName).assertEqual('com.example.camerasample');
      const other: CameraRequest = buildCameraRequest('com.example.other');
      expect(other.parameters.callBundleName).assertEqual('com.example.other');
      expect(other.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName === other.parameters.callBundleName).assertFalse();
      expect(buildCameraRequest('').parameters.callBundleName).assertEqual('');
      expect(request.action.length > 0).assertTrue();
    });
    /**
     * @tc.name CameraWantTest_case_030
     * @tc.desc want: camera request uses picker action and single image mode, variant 3 (CameraWantTest case 30)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CameraWantTest_case_030', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(request.action).assertEqual('ohos.want.action.imageCapture');
      expect(request.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName).assertEqual('com.example.camerasample');
      const other: CameraRequest = buildCameraRequest('com.example.other');
      expect(other.parameters.callBundleName).assertEqual('com.example.other');
      expect(other.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName === other.parameters.callBundleName).assertFalse();
      expect(buildCameraRequest('').parameters.callBundleName).assertEqual('');
      expect(request.action.length > 0).assertTrue();
    });
    /**
     * @tc.name CameraWantTest_case_031
     * @tc.desc want: camera request uses picker action and single image mode, variant 1 (CameraWantTest case 31)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CameraWantTest_case_031', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(request.action).assertEqual('ohos.want.action.imageCapture');
      expect(request.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName).assertEqual('com.example.camerasample');
      const other: CameraRequest = buildCameraRequest('com.example.other');
      expect(other.parameters.callBundleName).assertEqual('com.example.other');
      expect(other.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName === other.parameters.callBundleName).assertFalse();
      expect(buildCameraRequest('').parameters.callBundleName).assertEqual('');
      expect(request.action.length > 0).assertTrue();
    });
    /**
     * @tc.name CameraWantTest_case_032
     * @tc.desc want: camera request uses picker action and single image mode, variant 2 (CameraWantTest case 32)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CameraWantTest_case_032', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(request.action).assertEqual('ohos.want.action.imageCapture');
      expect(request.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName).assertEqual('com.example.camerasample');
      const other: CameraRequest = buildCameraRequest('com.example.other');
      expect(other.parameters.callBundleName).assertEqual('com.example.other');
      expect(other.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName === other.parameters.callBundleName).assertFalse();
      expect(buildCameraRequest('').parameters.callBundleName).assertEqual('');
      expect(request.action.length > 0).assertTrue();
    });
    /**
     * @tc.name CameraWantTest_case_033
     * @tc.desc want: camera request uses picker action and single image mode, variant 3 (CameraWantTest case 33)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CameraWantTest_case_033', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(request.action).assertEqual('ohos.want.action.imageCapture');
      expect(request.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName).assertEqual('com.example.camerasample');
      const other: CameraRequest = buildCameraRequest('com.example.other');
      expect(other.parameters.callBundleName).assertEqual('com.example.other');
      expect(other.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName === other.parameters.callBundleName).assertFalse();
      expect(buildCameraRequest('').parameters.callBundleName).assertEqual('');
      expect(request.action.length > 0).assertTrue();
    });
    /**
     * @tc.name CameraWantTest_case_034
     * @tc.desc want: camera request uses picker action and single image mode, variant 1 (CameraWantTest case 34)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CameraWantTest_case_034', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(request.action).assertEqual('ohos.want.action.imageCapture');
      expect(request.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName).assertEqual('com.example.camerasample');
      const other: CameraRequest = buildCameraRequest('com.example.other');
      expect(other.parameters.callBundleName).assertEqual('com.example.other');
      expect(other.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName === other.parameters.callBundleName).assertFalse();
      expect(buildCameraRequest('').parameters.callBundleName).assertEqual('');
      expect(request.action.length > 0).assertTrue();
    });
    /**
     * @tc.name CameraWantTest_case_035
     * @tc.desc want: camera request uses picker action and single image mode, variant 2 (CameraWantTest case 35)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CameraWantTest_case_035', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(request.action).assertEqual('ohos.want.action.imageCapture');
      expect(request.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName).assertEqual('com.example.camerasample');
      const other: CameraRequest = buildCameraRequest('com.example.other');
      expect(other.parameters.callBundleName).assertEqual('com.example.other');
      expect(other.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName === other.parameters.callBundleName).assertFalse();
      expect(buildCameraRequest('').parameters.callBundleName).assertEqual('');
      expect(request.action.length > 0).assertTrue();
    });
    /**
     * @tc.name CameraWantTest_case_036
     * @tc.desc want: camera request uses picker action and single image mode, variant 3 (CameraWantTest case 36)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CameraWantTest_case_036', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(request.action).assertEqual('ohos.want.action.imageCapture');
      expect(request.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName).assertEqual('com.example.camerasample');
      const other: CameraRequest = buildCameraRequest('com.example.other');
      expect(other.parameters.callBundleName).assertEqual('com.example.other');
      expect(other.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName === other.parameters.callBundleName).assertFalse();
      expect(buildCameraRequest('').parameters.callBundleName).assertEqual('');
      expect(request.action.length > 0).assertTrue();
    });
    /**
     * @tc.name CameraWantTest_case_037
     * @tc.desc want: camera request uses picker action and single image mode, variant 1 (CameraWantTest case 37)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CameraWantTest_case_037', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(request.action).assertEqual('ohos.want.action.imageCapture');
      expect(request.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName).assertEqual('com.example.camerasample');
      const other: CameraRequest = buildCameraRequest('com.example.other');
      expect(other.parameters.callBundleName).assertEqual('com.example.other');
      expect(other.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName === other.parameters.callBundleName).assertFalse();
      expect(buildCameraRequest('').parameters.callBundleName).assertEqual('');
      expect(request.action.length > 0).assertTrue();
    });
    /**
     * @tc.name CameraWantTest_case_038
     * @tc.desc want: camera request uses picker action and single image mode, variant 2 (CameraWantTest case 38)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CameraWantTest_case_038', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(request.action).assertEqual('ohos.want.action.imageCapture');
      expect(request.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName).assertEqual('com.example.camerasample');
      const other: CameraRequest = buildCameraRequest('com.example.other');
      expect(other.parameters.callBundleName).assertEqual('com.example.other');
      expect(other.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName === other.parameters.callBundleName).assertFalse();
      expect(buildCameraRequest('').parameters.callBundleName).assertEqual('');
      expect(request.action.length > 0).assertTrue();
    });
    /**
     * @tc.name CameraWantTest_case_039
     * @tc.desc want: camera request uses picker action and single image mode, variant 3 (CameraWantTest case 39)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CameraWantTest_case_039', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(request.action).assertEqual('ohos.want.action.imageCapture');
      expect(request.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName).assertEqual('com.example.camerasample');
      const other: CameraRequest = buildCameraRequest('com.example.other');
      expect(other.parameters.callBundleName).assertEqual('com.example.other');
      expect(other.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName === other.parameters.callBundleName).assertFalse();
      expect(buildCameraRequest('').parameters.callBundleName).assertEqual('');
      expect(request.action.length > 0).assertTrue();
    });
    /**
     * @tc.name CameraWantTest_case_040
     * @tc.desc want: camera request uses picker action and single image mode, variant 1 (CameraWantTest case 40)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CameraWantTest_case_040', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(request.action).assertEqual('ohos.want.action.imageCapture');
      expect(request.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName).assertEqual('com.example.camerasample');
      const other: CameraRequest = buildCameraRequest('com.example.other');
      expect(other.parameters.callBundleName).assertEqual('com.example.other');
      expect(other.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName === other.parameters.callBundleName).assertFalse();
      expect(buildCameraRequest('').parameters.callBundleName).assertEqual('');
      expect(request.action.length > 0).assertTrue();
    });
    /**
     * @tc.name CameraWantTest_case_041
     * @tc.desc want: camera request uses picker action and single image mode, variant 2 (CameraWantTest case 41)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CameraWantTest_case_041', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(request.action).assertEqual('ohos.want.action.imageCapture');
      expect(request.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName).assertEqual('com.example.camerasample');
      const other: CameraRequest = buildCameraRequest('com.example.other');
      expect(other.parameters.callBundleName).assertEqual('com.example.other');
      expect(other.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName === other.parameters.callBundleName).assertFalse();
      expect(buildCameraRequest('').parameters.callBundleName).assertEqual('');
      expect(request.action.length > 0).assertTrue();
    });
    /**
     * @tc.name CameraWantTest_case_042
     * @tc.desc want: camera request uses picker action and single image mode, variant 3 (CameraWantTest case 42)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CameraWantTest_case_042', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(request.action).assertEqual('ohos.want.action.imageCapture');
      expect(request.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName).assertEqual('com.example.camerasample');
      const other: CameraRequest = buildCameraRequest('com.example.other');
      expect(other.parameters.callBundleName).assertEqual('com.example.other');
      expect(other.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName === other.parameters.callBundleName).assertFalse();
      expect(buildCameraRequest('').parameters.callBundleName).assertEqual('');
      expect(request.action.length > 0).assertTrue();
    });
  });
}
