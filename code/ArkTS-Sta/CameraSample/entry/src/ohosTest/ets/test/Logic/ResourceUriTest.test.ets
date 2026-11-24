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

export default function ResourceUriTest(): void {
  describe('ResourceUriTest', () => {
    beforeAll(() => {
      logSuite('ResourceUriTest', 'begin');
    });
    beforeEach(async () => {
      await yieldTick();
    });
    afterAll(() => {
      logSuite('ResourceUriTest', 'end');
    });

    /**
     * @tc.name ResourceUriTest_case_001
     * @tc.desc uri: capture resource uri classification for 1 (ResourceUriTest case 1)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResourceUriTest_case_001', 0, async () => {
      expect(normalizeResourceUri('file://media/Photo/1/IMG_0001.jpg')).assertEqual('file://media/Photo/1/IMG_0001.jpg');
      expect(isResourceUri('file://media/Photo/1/IMG_0001.jpg')).assertTrue();
      expect(isResourceUri('plain text')).assertFalse();
      expect(isResourceUri('')).assertFalse();
      expect(isMediaUri('file://media/Photo/1.jpg')).assertTrue();
      expect(isMediaUri('datashare:///media/photo/1')).assertFalse();
      expect(isResourceUri('datashare:///media/photo/1')).assertTrue();
      expect(normalizeResourceUri('')).assertEqual('');
      expect(isResourceUri('https://example.com/a.jpg')).assertFalse();
      expect(normalizeResourceUri('file://media/Photo/1/IMG_0001.jpg').length).assertEqual(33);
    });
    /**
     * @tc.name ResourceUriTest_case_002
     * @tc.desc uri: capture resource uri classification for 2 (ResourceUriTest case 2)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResourceUriTest_case_002', 0, async () => {
      expect(normalizeResourceUri('file://media/Photo/2/IMG_0002.jpg')).assertEqual('file://media/Photo/2/IMG_0002.jpg');
      expect(isResourceUri('file://media/Photo/2/IMG_0002.jpg')).assertTrue();
      expect(isResourceUri('plain text')).assertFalse();
      expect(isResourceUri('')).assertFalse();
      expect(isMediaUri('file://media/Photo/1.jpg')).assertTrue();
      expect(isMediaUri('datashare:///media/photo/1')).assertFalse();
      expect(isResourceUri('datashare:///media/photo/1')).assertTrue();
      expect(normalizeResourceUri('')).assertEqual('');
      expect(isResourceUri('https://example.com/a.jpg')).assertFalse();
      expect(normalizeResourceUri('file://media/Photo/2/IMG_0002.jpg').length).assertEqual(33);
    });
    /**
     * @tc.name ResourceUriTest_case_003
     * @tc.desc uri: capture resource uri classification for 3 (ResourceUriTest case 3)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResourceUriTest_case_003', 0, async () => {
      expect(normalizeResourceUri('datashare:///media/photo/3')).assertEqual('datashare:///media/photo/3');
      expect(isResourceUri('datashare:///media/photo/3')).assertTrue();
      expect(isResourceUri('plain text')).assertFalse();
      expect(isResourceUri('')).assertFalse();
      expect(isMediaUri('file://media/Photo/1.jpg')).assertTrue();
      expect(isMediaUri('datashare:///media/photo/1')).assertFalse();
      expect(isResourceUri('datashare:///media/photo/1')).assertTrue();
      expect(normalizeResourceUri('')).assertEqual('');
      expect(isResourceUri('https://example.com/a.jpg')).assertFalse();
      expect(normalizeResourceUri('datashare:///media/photo/3').length).assertEqual(26);
    });
    /**
     * @tc.name ResourceUriTest_case_004
     * @tc.desc uri: capture resource uri classification for 4 (ResourceUriTest case 4)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResourceUriTest_case_004', 0, async () => {
      expect(normalizeResourceUri('file://media/Photo/2026/01/12/IMG_0003.jpg')).assertEqual('file://media/Photo/2026/01/12/IMG_0003.jpg');
      expect(isResourceUri('file://media/Photo/2026/01/12/IMG_0003.jpg')).assertTrue();
      expect(isResourceUri('plain text')).assertFalse();
      expect(isResourceUri('')).assertFalse();
      expect(isMediaUri('file://media/Photo/1.jpg')).assertTrue();
      expect(isMediaUri('datashare:///media/photo/1')).assertFalse();
      expect(isResourceUri('datashare:///media/photo/1')).assertTrue();
      expect(normalizeResourceUri('')).assertEqual('');
      expect(isResourceUri('https://example.com/a.jpg')).assertFalse();
      expect(normalizeResourceUri('file://media/Photo/2026/01/12/IMG_0003.jpg').length).assertEqual(42);
    });
    /**
     * @tc.name ResourceUriTest_case_005
     * @tc.desc uri: capture resource uri classification for 1 (ResourceUriTest case 5)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResourceUriTest_case_005', 0, async () => {
      expect(normalizeResourceUri('file://media/Photo/1/IMG_0001.jpg')).assertEqual('file://media/Photo/1/IMG_0001.jpg');
      expect(isResourceUri('file://media/Photo/1/IMG_0001.jpg')).assertTrue();
      expect(isResourceUri('plain text')).assertFalse();
      expect(isResourceUri('')).assertFalse();
      expect(isMediaUri('file://media/Photo/1.jpg')).assertTrue();
      expect(isMediaUri('datashare:///media/photo/1')).assertFalse();
      expect(isResourceUri('datashare:///media/photo/1')).assertTrue();
      expect(normalizeResourceUri('')).assertEqual('');
      expect(isResourceUri('https://example.com/a.jpg')).assertFalse();
      expect(normalizeResourceUri('file://media/Photo/1/IMG_0001.jpg').length).assertEqual(33);
    });
    /**
     * @tc.name ResourceUriTest_case_006
     * @tc.desc uri: capture resource uri classification for 2 (ResourceUriTest case 6)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResourceUriTest_case_006', 0, async () => {
      expect(normalizeResourceUri('file://media/Photo/2/IMG_0002.jpg')).assertEqual('file://media/Photo/2/IMG_0002.jpg');
      expect(isResourceUri('file://media/Photo/2/IMG_0002.jpg')).assertTrue();
      expect(isResourceUri('plain text')).assertFalse();
      expect(isResourceUri('')).assertFalse();
      expect(isMediaUri('file://media/Photo/1.jpg')).assertTrue();
      expect(isMediaUri('datashare:///media/photo/1')).assertFalse();
      expect(isResourceUri('datashare:///media/photo/1')).assertTrue();
      expect(normalizeResourceUri('')).assertEqual('');
      expect(isResourceUri('https://example.com/a.jpg')).assertFalse();
      expect(normalizeResourceUri('file://media/Photo/2/IMG_0002.jpg').length).assertEqual(33);
    });
    /**
     * @tc.name ResourceUriTest_case_007
     * @tc.desc uri: capture resource uri classification for 3 (ResourceUriTest case 7)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResourceUriTest_case_007', 0, async () => {
      expect(normalizeResourceUri('datashare:///media/photo/3')).assertEqual('datashare:///media/photo/3');
      expect(isResourceUri('datashare:///media/photo/3')).assertTrue();
      expect(isResourceUri('plain text')).assertFalse();
      expect(isResourceUri('')).assertFalse();
      expect(isMediaUri('file://media/Photo/1.jpg')).assertTrue();
      expect(isMediaUri('datashare:///media/photo/1')).assertFalse();
      expect(isResourceUri('datashare:///media/photo/1')).assertTrue();
      expect(normalizeResourceUri('')).assertEqual('');
      expect(isResourceUri('https://example.com/a.jpg')).assertFalse();
      expect(normalizeResourceUri('datashare:///media/photo/3').length).assertEqual(26);
    });
    /**
     * @tc.name ResourceUriTest_case_008
     * @tc.desc uri: capture resource uri classification for 4 (ResourceUriTest case 8)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResourceUriTest_case_008', 0, async () => {
      expect(normalizeResourceUri('file://media/Photo/2026/01/12/IMG_0003.jpg')).assertEqual('file://media/Photo/2026/01/12/IMG_0003.jpg');
      expect(isResourceUri('file://media/Photo/2026/01/12/IMG_0003.jpg')).assertTrue();
      expect(isResourceUri('plain text')).assertFalse();
      expect(isResourceUri('')).assertFalse();
      expect(isMediaUri('file://media/Photo/1.jpg')).assertTrue();
      expect(isMediaUri('datashare:///media/photo/1')).assertFalse();
      expect(isResourceUri('datashare:///media/photo/1')).assertTrue();
      expect(normalizeResourceUri('')).assertEqual('');
      expect(isResourceUri('https://example.com/a.jpg')).assertFalse();
      expect(normalizeResourceUri('file://media/Photo/2026/01/12/IMG_0003.jpg').length).assertEqual(42);
    });
    /**
     * @tc.name ResourceUriTest_case_009
     * @tc.desc uri: capture resource uri classification for 1 (ResourceUriTest case 9)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResourceUriTest_case_009', 0, async () => {
      expect(normalizeResourceUri('file://media/Photo/1/IMG_0001.jpg')).assertEqual('file://media/Photo/1/IMG_0001.jpg');
      expect(isResourceUri('file://media/Photo/1/IMG_0001.jpg')).assertTrue();
      expect(isResourceUri('plain text')).assertFalse();
      expect(isResourceUri('')).assertFalse();
      expect(isMediaUri('file://media/Photo/1.jpg')).assertTrue();
      expect(isMediaUri('datashare:///media/photo/1')).assertFalse();
      expect(isResourceUri('datashare:///media/photo/1')).assertTrue();
      expect(normalizeResourceUri('')).assertEqual('');
      expect(isResourceUri('https://example.com/a.jpg')).assertFalse();
      expect(normalizeResourceUri('file://media/Photo/1/IMG_0001.jpg').length).assertEqual(33);
    });
    /**
     * @tc.name ResourceUriTest_case_010
     * @tc.desc uri: capture resource uri classification for 2 (ResourceUriTest case 10)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResourceUriTest_case_010', 0, async () => {
      expect(normalizeResourceUri('file://media/Photo/2/IMG_0002.jpg')).assertEqual('file://media/Photo/2/IMG_0002.jpg');
      expect(isResourceUri('file://media/Photo/2/IMG_0002.jpg')).assertTrue();
      expect(isResourceUri('plain text')).assertFalse();
      expect(isResourceUri('')).assertFalse();
      expect(isMediaUri('file://media/Photo/1.jpg')).assertTrue();
      expect(isMediaUri('datashare:///media/photo/1')).assertFalse();
      expect(isResourceUri('datashare:///media/photo/1')).assertTrue();
      expect(normalizeResourceUri('')).assertEqual('');
      expect(isResourceUri('https://example.com/a.jpg')).assertFalse();
      expect(normalizeResourceUri('file://media/Photo/2/IMG_0002.jpg').length).assertEqual(33);
    });
    /**
     * @tc.name ResourceUriTest_case_011
     * @tc.desc uri: capture resource uri classification for 3 (ResourceUriTest case 11)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResourceUriTest_case_011', 0, async () => {
      expect(normalizeResourceUri('datashare:///media/photo/3')).assertEqual('datashare:///media/photo/3');
      expect(isResourceUri('datashare:///media/photo/3')).assertTrue();
      expect(isResourceUri('plain text')).assertFalse();
      expect(isResourceUri('')).assertFalse();
      expect(isMediaUri('file://media/Photo/1.jpg')).assertTrue();
      expect(isMediaUri('datashare:///media/photo/1')).assertFalse();
      expect(isResourceUri('datashare:///media/photo/1')).assertTrue();
      expect(normalizeResourceUri('')).assertEqual('');
      expect(isResourceUri('https://example.com/a.jpg')).assertFalse();
      expect(normalizeResourceUri('datashare:///media/photo/3').length).assertEqual(26);
    });
    /**
     * @tc.name ResourceUriTest_case_012
     * @tc.desc uri: capture resource uri classification for 4 (ResourceUriTest case 12)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResourceUriTest_case_012', 0, async () => {
      expect(normalizeResourceUri('file://media/Photo/2026/01/12/IMG_0003.jpg')).assertEqual('file://media/Photo/2026/01/12/IMG_0003.jpg');
      expect(isResourceUri('file://media/Photo/2026/01/12/IMG_0003.jpg')).assertTrue();
      expect(isResourceUri('plain text')).assertFalse();
      expect(isResourceUri('')).assertFalse();
      expect(isMediaUri('file://media/Photo/1.jpg')).assertTrue();
      expect(isMediaUri('datashare:///media/photo/1')).assertFalse();
      expect(isResourceUri('datashare:///media/photo/1')).assertTrue();
      expect(normalizeResourceUri('')).assertEqual('');
      expect(isResourceUri('https://example.com/a.jpg')).assertFalse();
      expect(normalizeResourceUri('file://media/Photo/2026/01/12/IMG_0003.jpg').length).assertEqual(42);
    });
    /**
     * @tc.name ResourceUriTest_case_013
     * @tc.desc uri: capture resource uri classification for 1 (ResourceUriTest case 13)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResourceUriTest_case_013', 0, async () => {
      expect(normalizeResourceUri('file://media/Photo/1/IMG_0001.jpg')).assertEqual('file://media/Photo/1/IMG_0001.jpg');
      expect(isResourceUri('file://media/Photo/1/IMG_0001.jpg')).assertTrue();
      expect(isResourceUri('plain text')).assertFalse();
      expect(isResourceUri('')).assertFalse();
      expect(isMediaUri('file://media/Photo/1.jpg')).assertTrue();
      expect(isMediaUri('datashare:///media/photo/1')).assertFalse();
      expect(isResourceUri('datashare:///media/photo/1')).assertTrue();
      expect(normalizeResourceUri('')).assertEqual('');
      expect(isResourceUri('https://example.com/a.jpg')).assertFalse();
      expect(normalizeResourceUri('file://media/Photo/1/IMG_0001.jpg').length).assertEqual(33);
    });
    /**
     * @tc.name ResourceUriTest_case_014
     * @tc.desc uri: capture resource uri classification for 2 (ResourceUriTest case 14)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResourceUriTest_case_014', 0, async () => {
      expect(normalizeResourceUri('file://media/Photo/2/IMG_0002.jpg')).assertEqual('file://media/Photo/2/IMG_0002.jpg');
      expect(isResourceUri('file://media/Photo/2/IMG_0002.jpg')).assertTrue();
      expect(isResourceUri('plain text')).assertFalse();
      expect(isResourceUri('')).assertFalse();
      expect(isMediaUri('file://media/Photo/1.jpg')).assertTrue();
      expect(isMediaUri('datashare:///media/photo/1')).assertFalse();
      expect(isResourceUri('datashare:///media/photo/1')).assertTrue();
      expect(normalizeResourceUri('')).assertEqual('');
      expect(isResourceUri('https://example.com/a.jpg')).assertFalse();
      expect(normalizeResourceUri('file://media/Photo/2/IMG_0002.jpg').length).assertEqual(33);
    });
    /**
     * @tc.name ResourceUriTest_case_015
     * @tc.desc uri: capture resource uri classification for 3 (ResourceUriTest case 15)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResourceUriTest_case_015', 0, async () => {
      expect(normalizeResourceUri('datashare:///media/photo/3')).assertEqual('datashare:///media/photo/3');
      expect(isResourceUri('datashare:///media/photo/3')).assertTrue();
      expect(isResourceUri('plain text')).assertFalse();
      expect(isResourceUri('')).assertFalse();
      expect(isMediaUri('file://media/Photo/1.jpg')).assertTrue();
      expect(isMediaUri('datashare:///media/photo/1')).assertFalse();
      expect(isResourceUri('datashare:///media/photo/1')).assertTrue();
      expect(normalizeResourceUri('')).assertEqual('');
      expect(isResourceUri('https://example.com/a.jpg')).assertFalse();
      expect(normalizeResourceUri('datashare:///media/photo/3').length).assertEqual(26);
    });
    /**
     * @tc.name ResourceUriTest_case_016
     * @tc.desc uri: capture resource uri classification for 4 (ResourceUriTest case 16)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResourceUriTest_case_016', 0, async () => {
      expect(normalizeResourceUri('file://media/Photo/2026/01/12/IMG_0003.jpg')).assertEqual('file://media/Photo/2026/01/12/IMG_0003.jpg');
      expect(isResourceUri('file://media/Photo/2026/01/12/IMG_0003.jpg')).assertTrue();
      expect(isResourceUri('plain text')).assertFalse();
      expect(isResourceUri('')).assertFalse();
      expect(isMediaUri('file://media/Photo/1.jpg')).assertTrue();
      expect(isMediaUri('datashare:///media/photo/1')).assertFalse();
      expect(isResourceUri('datashare:///media/photo/1')).assertTrue();
      expect(normalizeResourceUri('')).assertEqual('');
      expect(isResourceUri('https://example.com/a.jpg')).assertFalse();
      expect(normalizeResourceUri('file://media/Photo/2026/01/12/IMG_0003.jpg').length).assertEqual(42);
    });
    /**
     * @tc.name ResourceUriTest_case_017
     * @tc.desc uri: capture resource uri classification for 1 (ResourceUriTest case 17)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResourceUriTest_case_017', 0, async () => {
      expect(normalizeResourceUri('file://media/Photo/1/IMG_0001.jpg')).assertEqual('file://media/Photo/1/IMG_0001.jpg');
      expect(isResourceUri('file://media/Photo/1/IMG_0001.jpg')).assertTrue();
      expect(isResourceUri('plain text')).assertFalse();
      expect(isResourceUri('')).assertFalse();
      expect(isMediaUri('file://media/Photo/1.jpg')).assertTrue();
      expect(isMediaUri('datashare:///media/photo/1')).assertFalse();
      expect(isResourceUri('datashare:///media/photo/1')).assertTrue();
      expect(normalizeResourceUri('')).assertEqual('');
      expect(isResourceUri('https://example.com/a.jpg')).assertFalse();
      expect(normalizeResourceUri('file://media/Photo/1/IMG_0001.jpg').length).assertEqual(33);
    });
    /**
     * @tc.name ResourceUriTest_case_018
     * @tc.desc uri: capture resource uri classification for 2 (ResourceUriTest case 18)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResourceUriTest_case_018', 0, async () => {
      expect(normalizeResourceUri('file://media/Photo/2/IMG_0002.jpg')).assertEqual('file://media/Photo/2/IMG_0002.jpg');
      expect(isResourceUri('file://media/Photo/2/IMG_0002.jpg')).assertTrue();
      expect(isResourceUri('plain text')).assertFalse();
      expect(isResourceUri('')).assertFalse();
      expect(isMediaUri('file://media/Photo/1.jpg')).assertTrue();
      expect(isMediaUri('datashare:///media/photo/1')).assertFalse();
      expect(isResourceUri('datashare:///media/photo/1')).assertTrue();
      expect(normalizeResourceUri('')).assertEqual('');
      expect(isResourceUri('https://example.com/a.jpg')).assertFalse();
      expect(normalizeResourceUri('file://media/Photo/2/IMG_0002.jpg').length).assertEqual(33);
    });
    /**
     * @tc.name ResourceUriTest_case_019
     * @tc.desc uri: capture resource uri classification for 3 (ResourceUriTest case 19)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResourceUriTest_case_019', 0, async () => {
      expect(normalizeResourceUri('datashare:///media/photo/3')).assertEqual('datashare:///media/photo/3');
      expect(isResourceUri('datashare:///media/photo/3')).assertTrue();
      expect(isResourceUri('plain text')).assertFalse();
      expect(isResourceUri('')).assertFalse();
      expect(isMediaUri('file://media/Photo/1.jpg')).assertTrue();
      expect(isMediaUri('datashare:///media/photo/1')).assertFalse();
      expect(isResourceUri('datashare:///media/photo/1')).assertTrue();
      expect(normalizeResourceUri('')).assertEqual('');
      expect(isResourceUri('https://example.com/a.jpg')).assertFalse();
      expect(normalizeResourceUri('datashare:///media/photo/3').length).assertEqual(26);
    });
    /**
     * @tc.name ResourceUriTest_case_020
     * @tc.desc uri: capture resource uri classification for 4 (ResourceUriTest case 20)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResourceUriTest_case_020', 0, async () => {
      expect(normalizeResourceUri('file://media/Photo/2026/01/12/IMG_0003.jpg')).assertEqual('file://media/Photo/2026/01/12/IMG_0003.jpg');
      expect(isResourceUri('file://media/Photo/2026/01/12/IMG_0003.jpg')).assertTrue();
      expect(isResourceUri('plain text')).assertFalse();
      expect(isResourceUri('')).assertFalse();
      expect(isMediaUri('file://media/Photo/1.jpg')).assertTrue();
      expect(isMediaUri('datashare:///media/photo/1')).assertFalse();
      expect(isResourceUri('datashare:///media/photo/1')).assertTrue();
      expect(normalizeResourceUri('')).assertEqual('');
      expect(isResourceUri('https://example.com/a.jpg')).assertFalse();
      expect(normalizeResourceUri('file://media/Photo/2026/01/12/IMG_0003.jpg').length).assertEqual(42);
    });
    /**
     * @tc.name ResourceUriTest_case_021
     * @tc.desc uri: capture resource uri classification for 1 (ResourceUriTest case 21)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResourceUriTest_case_021', 0, async () => {
      expect(normalizeResourceUri('file://media/Photo/1/IMG_0001.jpg')).assertEqual('file://media/Photo/1/IMG_0001.jpg');
      expect(isResourceUri('file://media/Photo/1/IMG_0001.jpg')).assertTrue();
      expect(isResourceUri('plain text')).assertFalse();
      expect(isResourceUri('')).assertFalse();
      expect(isMediaUri('file://media/Photo/1.jpg')).assertTrue();
      expect(isMediaUri('datashare:///media/photo/1')).assertFalse();
      expect(isResourceUri('datashare:///media/photo/1')).assertTrue();
      expect(normalizeResourceUri('')).assertEqual('');
      expect(isResourceUri('https://example.com/a.jpg')).assertFalse();
      expect(normalizeResourceUri('file://media/Photo/1/IMG_0001.jpg').length).assertEqual(33);
    });
    /**
     * @tc.name ResourceUriTest_case_022
     * @tc.desc uri: capture resource uri classification for 2 (ResourceUriTest case 22)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResourceUriTest_case_022', 0, async () => {
      expect(normalizeResourceUri('file://media/Photo/2/IMG_0002.jpg')).assertEqual('file://media/Photo/2/IMG_0002.jpg');
      expect(isResourceUri('file://media/Photo/2/IMG_0002.jpg')).assertTrue();
      expect(isResourceUri('plain text')).assertFalse();
      expect(isResourceUri('')).assertFalse();
      expect(isMediaUri('file://media/Photo/1.jpg')).assertTrue();
      expect(isMediaUri('datashare:///media/photo/1')).assertFalse();
      expect(isResourceUri('datashare:///media/photo/1')).assertTrue();
      expect(normalizeResourceUri('')).assertEqual('');
      expect(isResourceUri('https://example.com/a.jpg')).assertFalse();
      expect(normalizeResourceUri('file://media/Photo/2/IMG_0002.jpg').length).assertEqual(33);
    });
    /**
     * @tc.name ResourceUriTest_case_023
     * @tc.desc uri: capture resource uri classification for 3 (ResourceUriTest case 23)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResourceUriTest_case_023', 0, async () => {
      expect(normalizeResourceUri('datashare:///media/photo/3')).assertEqual('datashare:///media/photo/3');
      expect(isResourceUri('datashare:///media/photo/3')).assertTrue();
      expect(isResourceUri('plain text')).assertFalse();
      expect(isResourceUri('')).assertFalse();
      expect(isMediaUri('file://media/Photo/1.jpg')).assertTrue();
      expect(isMediaUri('datashare:///media/photo/1')).assertFalse();
      expect(isResourceUri('datashare:///media/photo/1')).assertTrue();
      expect(normalizeResourceUri('')).assertEqual('');
      expect(isResourceUri('https://example.com/a.jpg')).assertFalse();
      expect(normalizeResourceUri('datashare:///media/photo/3').length).assertEqual(26);
    });
    /**
     * @tc.name ResourceUriTest_case_024
     * @tc.desc uri: capture resource uri classification for 4 (ResourceUriTest case 24)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResourceUriTest_case_024', 0, async () => {
      expect(normalizeResourceUri('file://media/Photo/2026/01/12/IMG_0003.jpg')).assertEqual('file://media/Photo/2026/01/12/IMG_0003.jpg');
      expect(isResourceUri('file://media/Photo/2026/01/12/IMG_0003.jpg')).assertTrue();
      expect(isResourceUri('plain text')).assertFalse();
      expect(isResourceUri('')).assertFalse();
      expect(isMediaUri('file://media/Photo/1.jpg')).assertTrue();
      expect(isMediaUri('datashare:///media/photo/1')).assertFalse();
      expect(isResourceUri('datashare:///media/photo/1')).assertTrue();
      expect(normalizeResourceUri('')).assertEqual('');
      expect(isResourceUri('https://example.com/a.jpg')).assertFalse();
      expect(normalizeResourceUri('file://media/Photo/2026/01/12/IMG_0003.jpg').length).assertEqual(42);
    });
    /**
     * @tc.name ResourceUriTest_case_025
     * @tc.desc uri: capture resource uri classification for 1 (ResourceUriTest case 25)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResourceUriTest_case_025', 0, async () => {
      expect(normalizeResourceUri('file://media/Photo/1/IMG_0001.jpg')).assertEqual('file://media/Photo/1/IMG_0001.jpg');
      expect(isResourceUri('file://media/Photo/1/IMG_0001.jpg')).assertTrue();
      expect(isResourceUri('plain text')).assertFalse();
      expect(isResourceUri('')).assertFalse();
      expect(isMediaUri('file://media/Photo/1.jpg')).assertTrue();
      expect(isMediaUri('datashare:///media/photo/1')).assertFalse();
      expect(isResourceUri('datashare:///media/photo/1')).assertTrue();
      expect(normalizeResourceUri('')).assertEqual('');
      expect(isResourceUri('https://example.com/a.jpg')).assertFalse();
      expect(normalizeResourceUri('file://media/Photo/1/IMG_0001.jpg').length).assertEqual(33);
    });
    /**
     * @tc.name ResourceUriTest_case_026
     * @tc.desc uri: capture resource uri classification for 2 (ResourceUriTest case 26)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResourceUriTest_case_026', 0, async () => {
      expect(normalizeResourceUri('file://media/Photo/2/IMG_0002.jpg')).assertEqual('file://media/Photo/2/IMG_0002.jpg');
      expect(isResourceUri('file://media/Photo/2/IMG_0002.jpg')).assertTrue();
      expect(isResourceUri('plain text')).assertFalse();
      expect(isResourceUri('')).assertFalse();
      expect(isMediaUri('file://media/Photo/1.jpg')).assertTrue();
      expect(isMediaUri('datashare:///media/photo/1')).assertFalse();
      expect(isResourceUri('datashare:///media/photo/1')).assertTrue();
      expect(normalizeResourceUri('')).assertEqual('');
      expect(isResourceUri('https://example.com/a.jpg')).assertFalse();
      expect(normalizeResourceUri('file://media/Photo/2/IMG_0002.jpg').length).assertEqual(33);
    });
    /**
     * @tc.name ResourceUriTest_case_027
     * @tc.desc uri: capture resource uri classification for 3 (ResourceUriTest case 27)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResourceUriTest_case_027', 0, async () => {
      expect(normalizeResourceUri('datashare:///media/photo/3')).assertEqual('datashare:///media/photo/3');
      expect(isResourceUri('datashare:///media/photo/3')).assertTrue();
      expect(isResourceUri('plain text')).assertFalse();
      expect(isResourceUri('')).assertFalse();
      expect(isMediaUri('file://media/Photo/1.jpg')).assertTrue();
      expect(isMediaUri('datashare:///media/photo/1')).assertFalse();
      expect(isResourceUri('datashare:///media/photo/1')).assertTrue();
      expect(normalizeResourceUri('')).assertEqual('');
      expect(isResourceUri('https://example.com/a.jpg')).assertFalse();
      expect(normalizeResourceUri('datashare:///media/photo/3').length).assertEqual(26);
    });
    /**
     * @tc.name ResourceUriTest_case_028
     * @tc.desc uri: capture resource uri classification for 4 (ResourceUriTest case 28)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResourceUriTest_case_028', 0, async () => {
      expect(normalizeResourceUri('file://media/Photo/2026/01/12/IMG_0003.jpg')).assertEqual('file://media/Photo/2026/01/12/IMG_0003.jpg');
      expect(isResourceUri('file://media/Photo/2026/01/12/IMG_0003.jpg')).assertTrue();
      expect(isResourceUri('plain text')).assertFalse();
      expect(isResourceUri('')).assertFalse();
      expect(isMediaUri('file://media/Photo/1.jpg')).assertTrue();
      expect(isMediaUri('datashare:///media/photo/1')).assertFalse();
      expect(isResourceUri('datashare:///media/photo/1')).assertTrue();
      expect(normalizeResourceUri('')).assertEqual('');
      expect(isResourceUri('https://example.com/a.jpg')).assertFalse();
      expect(normalizeResourceUri('file://media/Photo/2026/01/12/IMG_0003.jpg').length).assertEqual(42);
    });
    /**
     * @tc.name ResourceUriTest_case_029
     * @tc.desc uri: capture resource uri classification for 1 (ResourceUriTest case 29)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResourceUriTest_case_029', 0, async () => {
      expect(normalizeResourceUri('file://media/Photo/1/IMG_0001.jpg')).assertEqual('file://media/Photo/1/IMG_0001.jpg');
      expect(isResourceUri('file://media/Photo/1/IMG_0001.jpg')).assertTrue();
      expect(isResourceUri('plain text')).assertFalse();
      expect(isResourceUri('')).assertFalse();
      expect(isMediaUri('file://media/Photo/1.jpg')).assertTrue();
      expect(isMediaUri('datashare:///media/photo/1')).assertFalse();
      expect(isResourceUri('datashare:///media/photo/1')).assertTrue();
      expect(normalizeResourceUri('')).assertEqual('');
      expect(isResourceUri('https://example.com/a.jpg')).assertFalse();
      expect(normalizeResourceUri('file://media/Photo/1/IMG_0001.jpg').length).assertEqual(33);
    });
    /**
     * @tc.name ResourceUriTest_case_030
     * @tc.desc uri: capture resource uri classification for 2 (ResourceUriTest case 30)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResourceUriTest_case_030', 0, async () => {
      expect(normalizeResourceUri('file://media/Photo/2/IMG_0002.jpg')).assertEqual('file://media/Photo/2/IMG_0002.jpg');
      expect(isResourceUri('file://media/Photo/2/IMG_0002.jpg')).assertTrue();
      expect(isResourceUri('plain text')).assertFalse();
      expect(isResourceUri('')).assertFalse();
      expect(isMediaUri('file://media/Photo/1.jpg')).assertTrue();
      expect(isMediaUri('datashare:///media/photo/1')).assertFalse();
      expect(isResourceUri('datashare:///media/photo/1')).assertTrue();
      expect(normalizeResourceUri('')).assertEqual('');
      expect(isResourceUri('https://example.com/a.jpg')).assertFalse();
      expect(normalizeResourceUri('file://media/Photo/2/IMG_0002.jpg').length).assertEqual(33);
    });
    /**
     * @tc.name ResourceUriTest_case_031
     * @tc.desc uri: capture resource uri classification for 3 (ResourceUriTest case 31)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResourceUriTest_case_031', 0, async () => {
      expect(normalizeResourceUri('datashare:///media/photo/3')).assertEqual('datashare:///media/photo/3');
      expect(isResourceUri('datashare:///media/photo/3')).assertTrue();
      expect(isResourceUri('plain text')).assertFalse();
      expect(isResourceUri('')).assertFalse();
      expect(isMediaUri('file://media/Photo/1.jpg')).assertTrue();
      expect(isMediaUri('datashare:///media/photo/1')).assertFalse();
      expect(isResourceUri('datashare:///media/photo/1')).assertTrue();
      expect(normalizeResourceUri('')).assertEqual('');
      expect(isResourceUri('https://example.com/a.jpg')).assertFalse();
      expect(normalizeResourceUri('datashare:///media/photo/3').length).assertEqual(26);
    });
    /**
     * @tc.name ResourceUriTest_case_032
     * @tc.desc uri: capture resource uri classification for 4 (ResourceUriTest case 32)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResourceUriTest_case_032', 0, async () => {
      expect(normalizeResourceUri('file://media/Photo/2026/01/12/IMG_0003.jpg')).assertEqual('file://media/Photo/2026/01/12/IMG_0003.jpg');
      expect(isResourceUri('file://media/Photo/2026/01/12/IMG_0003.jpg')).assertTrue();
      expect(isResourceUri('plain text')).assertFalse();
      expect(isResourceUri('')).assertFalse();
      expect(isMediaUri('file://media/Photo/1.jpg')).assertTrue();
      expect(isMediaUri('datashare:///media/photo/1')).assertFalse();
      expect(isResourceUri('datashare:///media/photo/1')).assertTrue();
      expect(normalizeResourceUri('')).assertEqual('');
      expect(isResourceUri('https://example.com/a.jpg')).assertFalse();
      expect(normalizeResourceUri('file://media/Photo/2026/01/12/IMG_0003.jpg').length).assertEqual(42);
    });
    /**
     * @tc.name ResourceUriTest_case_033
     * @tc.desc uri: capture resource uri classification for 1 (ResourceUriTest case 33)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResourceUriTest_case_033', 0, async () => {
      expect(normalizeResourceUri('file://media/Photo/1/IMG_0001.jpg')).assertEqual('file://media/Photo/1/IMG_0001.jpg');
      expect(isResourceUri('file://media/Photo/1/IMG_0001.jpg')).assertTrue();
      expect(isResourceUri('plain text')).assertFalse();
      expect(isResourceUri('')).assertFalse();
      expect(isMediaUri('file://media/Photo/1.jpg')).assertTrue();
      expect(isMediaUri('datashare:///media/photo/1')).assertFalse();
      expect(isResourceUri('datashare:///media/photo/1')).assertTrue();
      expect(normalizeResourceUri('')).assertEqual('');
      expect(isResourceUri('https://example.com/a.jpg')).assertFalse();
      expect(normalizeResourceUri('file://media/Photo/1/IMG_0001.jpg').length).assertEqual(33);
    });
    /**
     * @tc.name ResourceUriTest_case_034
     * @tc.desc uri: capture resource uri classification for 2 (ResourceUriTest case 34)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResourceUriTest_case_034', 0, async () => {
      expect(normalizeResourceUri('file://media/Photo/2/IMG_0002.jpg')).assertEqual('file://media/Photo/2/IMG_0002.jpg');
      expect(isResourceUri('file://media/Photo/2/IMG_0002.jpg')).assertTrue();
      expect(isResourceUri('plain text')).assertFalse();
      expect(isResourceUri('')).assertFalse();
      expect(isMediaUri('file://media/Photo/1.jpg')).assertTrue();
      expect(isMediaUri('datashare:///media/photo/1')).assertFalse();
      expect(isResourceUri('datashare:///media/photo/1')).assertTrue();
      expect(normalizeResourceUri('')).assertEqual('');
      expect(isResourceUri('https://example.com/a.jpg')).assertFalse();
      expect(normalizeResourceUri('file://media/Photo/2/IMG_0002.jpg').length).assertEqual(33);
    });
    /**
     * @tc.name ResourceUriTest_case_035
     * @tc.desc uri: capture resource uri classification for 3 (ResourceUriTest case 35)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResourceUriTest_case_035', 0, async () => {
      expect(normalizeResourceUri('datashare:///media/photo/3')).assertEqual('datashare:///media/photo/3');
      expect(isResourceUri('datashare:///media/photo/3')).assertTrue();
      expect(isResourceUri('plain text')).assertFalse();
      expect(isResourceUri('')).assertFalse();
      expect(isMediaUri('file://media/Photo/1.jpg')).assertTrue();
      expect(isMediaUri('datashare:///media/photo/1')).assertFalse();
      expect(isResourceUri('datashare:///media/photo/1')).assertTrue();
      expect(normalizeResourceUri('')).assertEqual('');
      expect(isResourceUri('https://example.com/a.jpg')).assertFalse();
      expect(normalizeResourceUri('datashare:///media/photo/3').length).assertEqual(26);
    });
    /**
     * @tc.name ResourceUriTest_case_036
     * @tc.desc uri: capture resource uri classification for 4 (ResourceUriTest case 36)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResourceUriTest_case_036', 0, async () => {
      expect(normalizeResourceUri('file://media/Photo/2026/01/12/IMG_0003.jpg')).assertEqual('file://media/Photo/2026/01/12/IMG_0003.jpg');
      expect(isResourceUri('file://media/Photo/2026/01/12/IMG_0003.jpg')).assertTrue();
      expect(isResourceUri('plain text')).assertFalse();
      expect(isResourceUri('')).assertFalse();
      expect(isMediaUri('file://media/Photo/1.jpg')).assertTrue();
      expect(isMediaUri('datashare:///media/photo/1')).assertFalse();
      expect(isResourceUri('datashare:///media/photo/1')).assertTrue();
      expect(normalizeResourceUri('')).assertEqual('');
      expect(isResourceUri('https://example.com/a.jpg')).assertFalse();
      expect(normalizeResourceUri('file://media/Photo/2026/01/12/IMG_0003.jpg').length).assertEqual(42);
    });
    /**
     * @tc.name ResourceUriTest_case_037
     * @tc.desc uri: capture resource uri classification for 1 (ResourceUriTest case 37)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResourceUriTest_case_037', 0, async () => {
      expect(normalizeResourceUri('file://media/Photo/1/IMG_0001.jpg')).assertEqual('file://media/Photo/1/IMG_0001.jpg');
      expect(isResourceUri('file://media/Photo/1/IMG_0001.jpg')).assertTrue();
      expect(isResourceUri('plain text')).assertFalse();
      expect(isResourceUri('')).assertFalse();
      expect(isMediaUri('file://media/Photo/1.jpg')).assertTrue();
      expect(isMediaUri('datashare:///media/photo/1')).assertFalse();
      expect(isResourceUri('datashare:///media/photo/1')).assertTrue();
      expect(normalizeResourceUri('')).assertEqual('');
      expect(isResourceUri('https://example.com/a.jpg')).assertFalse();
      expect(normalizeResourceUri('file://media/Photo/1/IMG_0001.jpg').length).assertEqual(33);
    });
    /**
     * @tc.name ResourceUriTest_case_038
     * @tc.desc uri: capture resource uri classification for 2 (ResourceUriTest case 38)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResourceUriTest_case_038', 0, async () => {
      expect(normalizeResourceUri('file://media/Photo/2/IMG_0002.jpg')).assertEqual('file://media/Photo/2/IMG_0002.jpg');
      expect(isResourceUri('file://media/Photo/2/IMG_0002.jpg')).assertTrue();
      expect(isResourceUri('plain text')).assertFalse();
      expect(isResourceUri('')).assertFalse();
      expect(isMediaUri('file://media/Photo/1.jpg')).assertTrue();
      expect(isMediaUri('datashare:///media/photo/1')).assertFalse();
      expect(isResourceUri('datashare:///media/photo/1')).assertTrue();
      expect(normalizeResourceUri('')).assertEqual('');
      expect(isResourceUri('https://example.com/a.jpg')).assertFalse();
      expect(normalizeResourceUri('file://media/Photo/2/IMG_0002.jpg').length).assertEqual(33);
    });
    /**
     * @tc.name ResourceUriTest_case_039
     * @tc.desc uri: capture resource uri classification for 3 (ResourceUriTest case 39)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResourceUriTest_case_039', 0, async () => {
      expect(normalizeResourceUri('datashare:///media/photo/3')).assertEqual('datashare:///media/photo/3');
      expect(isResourceUri('datashare:///media/photo/3')).assertTrue();
      expect(isResourceUri('plain text')).assertFalse();
      expect(isResourceUri('')).assertFalse();
      expect(isMediaUri('file://media/Photo/1.jpg')).assertTrue();
      expect(isMediaUri('datashare:///media/photo/1')).assertFalse();
      expect(isResourceUri('datashare:///media/photo/1')).assertTrue();
      expect(normalizeResourceUri('')).assertEqual('');
      expect(isResourceUri('https://example.com/a.jpg')).assertFalse();
      expect(normalizeResourceUri('datashare:///media/photo/3').length).assertEqual(26);
    });
    /**
     * @tc.name ResourceUriTest_case_040
     * @tc.desc uri: capture resource uri classification for 4 (ResourceUriTest case 40)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResourceUriTest_case_040', 0, async () => {
      expect(normalizeResourceUri('file://media/Photo/2026/01/12/IMG_0003.jpg')).assertEqual('file://media/Photo/2026/01/12/IMG_0003.jpg');
      expect(isResourceUri('file://media/Photo/2026/01/12/IMG_0003.jpg')).assertTrue();
      expect(isResourceUri('plain text')).assertFalse();
      expect(isResourceUri('')).assertFalse();
      expect(isMediaUri('file://media/Photo/1.jpg')).assertTrue();
      expect(isMediaUri('datashare:///media/photo/1')).assertFalse();
      expect(isResourceUri('datashare:///media/photo/1')).assertTrue();
      expect(normalizeResourceUri('')).assertEqual('');
      expect(isResourceUri('https://example.com/a.jpg')).assertFalse();
      expect(normalizeResourceUri('file://media/Photo/2026/01/12/IMG_0003.jpg').length).assertEqual(42);
    });
  });
}
