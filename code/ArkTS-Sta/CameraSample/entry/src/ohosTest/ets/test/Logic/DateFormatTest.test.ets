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

export default function DateFormatTest(): void {
  describe('DateFormatTest', () => {
    beforeAll(() => {
      logSuite('DateFormatTest', 'begin');
    });
    beforeEach(async () => {
      await yieldTick();
    });
    afterAll(() => {
      logSuite('DateFormatTest', 'end');
    });

    /**
     * @tc.name DateFormatTest_case_001
     * @tc.desc date: getCurrentDate format for 2025-1-1 stays stable (DateFormatTest case 1)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DateFormatTest_case_001', 0, async () => {
      const stamp: string = formatCommentTimeAt(2025, 0, 1, 0, 0);
      const date: Date = new Date(2025, 0, 1, 0, 0);
      expect(stamp).assertEqual('2025-0-' + String(date.getDay()) + ' 0:0');
      expect(stamp.indexOf('-') > 0).assertTrue();
      expect(stamp.indexOf(':') > 0).assertTrue();
      expect(stamp.startsWith('2025-')).assertTrue();
      expect(stamp.length >= 10).assertTrue();
      expect(formatCommentTime(date)).assertEqual(stamp);
      expect(stamp === formatCommentTime(date)).assertTrue();
      expect(formatCommentTime(new Date(2026, 0, 1, 0, 0)).length > 0).assertTrue();
    });
    /**
     * @tc.name DateFormatTest_case_002
     * @tc.desc date: getCurrentDate format for 2026-2-2 stays stable (DateFormatTest case 2)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DateFormatTest_case_002', 0, async () => {
      const stamp: string = formatCommentTimeAt(2026, 1, 2, 1, 1);
      const date: Date = new Date(2026, 1, 2, 1, 1);
      expect(stamp).assertEqual('2026-1-' + String(date.getDay()) + ' 1:1');
      expect(stamp.indexOf('-') > 0).assertTrue();
      expect(stamp.indexOf(':') > 0).assertTrue();
      expect(stamp.startsWith('2026-')).assertTrue();
      expect(stamp.length >= 10).assertTrue();
      expect(formatCommentTime(date)).assertEqual(stamp);
      expect(stamp === formatCommentTime(date)).assertTrue();
      expect(formatCommentTime(new Date(2026, 0, 1, 0, 0)).length > 0).assertTrue();
    });
    /**
     * @tc.name DateFormatTest_case_003
     * @tc.desc date: getCurrentDate format for 2027-3-3 stays stable (DateFormatTest case 3)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DateFormatTest_case_003', 0, async () => {
      const stamp: string = formatCommentTimeAt(2027, 2, 3, 2, 2);
      const date: Date = new Date(2027, 2, 3, 2, 2);
      expect(stamp).assertEqual('2027-2-' + String(date.getDay()) + ' 2:2');
      expect(stamp.indexOf('-') > 0).assertTrue();
      expect(stamp.indexOf(':') > 0).assertTrue();
      expect(stamp.startsWith('2027-')).assertTrue();
      expect(stamp.length >= 10).assertTrue();
      expect(formatCommentTime(date)).assertEqual(stamp);
      expect(stamp === formatCommentTime(date)).assertTrue();
      expect(formatCommentTime(new Date(2026, 0, 1, 0, 0)).length > 0).assertTrue();
    });
    /**
     * @tc.name DateFormatTest_case_004
     * @tc.desc date: getCurrentDate format for 2025-4-4 stays stable (DateFormatTest case 4)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DateFormatTest_case_004', 0, async () => {
      const stamp: string = formatCommentTimeAt(2025, 3, 4, 3, 3);
      const date: Date = new Date(2025, 3, 4, 3, 3);
      expect(stamp).assertEqual('2025-3-' + String(date.getDay()) + ' 3:3');
      expect(stamp.indexOf('-') > 0).assertTrue();
      expect(stamp.indexOf(':') > 0).assertTrue();
      expect(stamp.startsWith('2025-')).assertTrue();
      expect(stamp.length >= 10).assertTrue();
      expect(formatCommentTime(date)).assertEqual(stamp);
      expect(stamp === formatCommentTime(date)).assertTrue();
      expect(formatCommentTime(new Date(2026, 0, 1, 0, 0)).length > 0).assertTrue();
    });
    /**
     * @tc.name DateFormatTest_case_005
     * @tc.desc date: getCurrentDate format for 2026-5-5 stays stable (DateFormatTest case 5)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DateFormatTest_case_005', 0, async () => {
      const stamp: string = formatCommentTimeAt(2026, 4, 5, 4, 4);
      const date: Date = new Date(2026, 4, 5, 4, 4);
      expect(stamp).assertEqual('2026-4-' + String(date.getDay()) + ' 4:4');
      expect(stamp.indexOf('-') > 0).assertTrue();
      expect(stamp.indexOf(':') > 0).assertTrue();
      expect(stamp.startsWith('2026-')).assertTrue();
      expect(stamp.length >= 10).assertTrue();
      expect(formatCommentTime(date)).assertEqual(stamp);
      expect(stamp === formatCommentTime(date)).assertTrue();
      expect(formatCommentTime(new Date(2026, 0, 1, 0, 0)).length > 0).assertTrue();
    });
    /**
     * @tc.name DateFormatTest_case_006
     * @tc.desc date: getCurrentDate format for 2027-6-6 stays stable (DateFormatTest case 6)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DateFormatTest_case_006', 0, async () => {
      const stamp: string = formatCommentTimeAt(2027, 5, 6, 5, 5);
      const date: Date = new Date(2027, 5, 6, 5, 5);
      expect(stamp).assertEqual('2027-5-' + String(date.getDay()) + ' 5:5');
      expect(stamp.indexOf('-') > 0).assertTrue();
      expect(stamp.indexOf(':') > 0).assertTrue();
      expect(stamp.startsWith('2027-')).assertTrue();
      expect(stamp.length >= 10).assertTrue();
      expect(formatCommentTime(date)).assertEqual(stamp);
      expect(stamp === formatCommentTime(date)).assertTrue();
      expect(formatCommentTime(new Date(2026, 0, 1, 0, 0)).length > 0).assertTrue();
    });
    /**
     * @tc.name DateFormatTest_case_007
     * @tc.desc date: getCurrentDate format for 2025-7-7 stays stable (DateFormatTest case 7)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DateFormatTest_case_007', 0, async () => {
      const stamp: string = formatCommentTimeAt(2025, 6, 7, 6, 6);
      const date: Date = new Date(2025, 6, 7, 6, 6);
      expect(stamp).assertEqual('2025-6-' + String(date.getDay()) + ' 6:6');
      expect(stamp.indexOf('-') > 0).assertTrue();
      expect(stamp.indexOf(':') > 0).assertTrue();
      expect(stamp.startsWith('2025-')).assertTrue();
      expect(stamp.length >= 10).assertTrue();
      expect(formatCommentTime(date)).assertEqual(stamp);
      expect(stamp === formatCommentTime(date)).assertTrue();
      expect(formatCommentTime(new Date(2026, 0, 1, 0, 0)).length > 0).assertTrue();
    });
    /**
     * @tc.name DateFormatTest_case_008
     * @tc.desc date: getCurrentDate format for 2026-8-8 stays stable (DateFormatTest case 8)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DateFormatTest_case_008', 0, async () => {
      const stamp: string = formatCommentTimeAt(2026, 7, 8, 7, 7);
      const date: Date = new Date(2026, 7, 8, 7, 7);
      expect(stamp).assertEqual('2026-7-' + String(date.getDay()) + ' 7:7');
      expect(stamp.indexOf('-') > 0).assertTrue();
      expect(stamp.indexOf(':') > 0).assertTrue();
      expect(stamp.startsWith('2026-')).assertTrue();
      expect(stamp.length >= 10).assertTrue();
      expect(formatCommentTime(date)).assertEqual(stamp);
      expect(stamp === formatCommentTime(date)).assertTrue();
      expect(formatCommentTime(new Date(2026, 0, 1, 0, 0)).length > 0).assertTrue();
    });
    /**
     * @tc.name DateFormatTest_case_009
     * @tc.desc date: getCurrentDate format for 2027-9-9 stays stable (DateFormatTest case 9)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DateFormatTest_case_009', 0, async () => {
      const stamp: string = formatCommentTimeAt(2027, 8, 9, 8, 8);
      const date: Date = new Date(2027, 8, 9, 8, 8);
      expect(stamp).assertEqual('2027-8-' + String(date.getDay()) + ' 8:8');
      expect(stamp.indexOf('-') > 0).assertTrue();
      expect(stamp.indexOf(':') > 0).assertTrue();
      expect(stamp.startsWith('2027-')).assertTrue();
      expect(stamp.length >= 10).assertTrue();
      expect(formatCommentTime(date)).assertEqual(stamp);
      expect(stamp === formatCommentTime(date)).assertTrue();
      expect(formatCommentTime(new Date(2026, 0, 1, 0, 0)).length > 0).assertTrue();
    });
    /**
     * @tc.name DateFormatTest_case_010
     * @tc.desc date: getCurrentDate format for 2025-10-10 stays stable (DateFormatTest case 10)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DateFormatTest_case_010', 0, async () => {
      const stamp: string = formatCommentTimeAt(2025, 9, 10, 9, 9);
      const date: Date = new Date(2025, 9, 10, 9, 9);
      expect(stamp).assertEqual('2025-9-' + String(date.getDay()) + ' 9:9');
      expect(stamp.indexOf('-') > 0).assertTrue();
      expect(stamp.indexOf(':') > 0).assertTrue();
      expect(stamp.startsWith('2025-')).assertTrue();
      expect(stamp.length >= 10).assertTrue();
      expect(formatCommentTime(date)).assertEqual(stamp);
      expect(stamp === formatCommentTime(date)).assertTrue();
      expect(formatCommentTime(new Date(2026, 0, 1, 0, 0)).length > 0).assertTrue();
    });
    /**
     * @tc.name DateFormatTest_case_011
     * @tc.desc date: getCurrentDate format for 2026-11-11 stays stable (DateFormatTest case 11)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DateFormatTest_case_011', 0, async () => {
      const stamp: string = formatCommentTimeAt(2026, 10, 11, 10, 10);
      const date: Date = new Date(2026, 10, 11, 10, 10);
      expect(stamp).assertEqual('2026-10-' + String(date.getDay()) + ' 10:10');
      expect(stamp.indexOf('-') > 0).assertTrue();
      expect(stamp.indexOf(':') > 0).assertTrue();
      expect(stamp.startsWith('2026-')).assertTrue();
      expect(stamp.length >= 10).assertTrue();
      expect(formatCommentTime(date)).assertEqual(stamp);
      expect(stamp === formatCommentTime(date)).assertTrue();
      expect(formatCommentTime(new Date(2026, 0, 1, 0, 0)).length > 0).assertTrue();
    });
    /**
     * @tc.name DateFormatTest_case_012
     * @tc.desc date: getCurrentDate format for 2027-12-12 stays stable (DateFormatTest case 12)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DateFormatTest_case_012', 0, async () => {
      const stamp: string = formatCommentTimeAt(2027, 11, 12, 11, 11);
      const date: Date = new Date(2027, 11, 12, 11, 11);
      expect(stamp).assertEqual('2027-11-' + String(date.getDay()) + ' 11:11');
      expect(stamp.indexOf('-') > 0).assertTrue();
      expect(stamp.indexOf(':') > 0).assertTrue();
      expect(stamp.startsWith('2027-')).assertTrue();
      expect(stamp.length >= 10).assertTrue();
      expect(formatCommentTime(date)).assertEqual(stamp);
      expect(stamp === formatCommentTime(date)).assertTrue();
      expect(formatCommentTime(new Date(2026, 0, 1, 0, 0)).length > 0).assertTrue();
    });
    /**
     * @tc.name DateFormatTest_case_013
     * @tc.desc date: getCurrentDate format for 2025-1-13 stays stable (DateFormatTest case 13)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DateFormatTest_case_013', 0, async () => {
      const stamp: string = formatCommentTimeAt(2025, 0, 13, 12, 12);
      const date: Date = new Date(2025, 0, 13, 12, 12);
      expect(stamp).assertEqual('2025-0-' + String(date.getDay()) + ' 12:12');
      expect(stamp.indexOf('-') > 0).assertTrue();
      expect(stamp.indexOf(':') > 0).assertTrue();
      expect(stamp.startsWith('2025-')).assertTrue();
      expect(stamp.length >= 10).assertTrue();
      expect(formatCommentTime(date)).assertEqual(stamp);
      expect(stamp === formatCommentTime(date)).assertTrue();
      expect(formatCommentTime(new Date(2026, 0, 1, 0, 0)).length > 0).assertTrue();
    });
    /**
     * @tc.name DateFormatTest_case_014
     * @tc.desc date: getCurrentDate format for 2026-2-14 stays stable (DateFormatTest case 14)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DateFormatTest_case_014', 0, async () => {
      const stamp: string = formatCommentTimeAt(2026, 1, 14, 13, 13);
      const date: Date = new Date(2026, 1, 14, 13, 13);
      expect(stamp).assertEqual('2026-1-' + String(date.getDay()) + ' 13:13');
      expect(stamp.indexOf('-') > 0).assertTrue();
      expect(stamp.indexOf(':') > 0).assertTrue();
      expect(stamp.startsWith('2026-')).assertTrue();
      expect(stamp.length >= 10).assertTrue();
      expect(formatCommentTime(date)).assertEqual(stamp);
      expect(stamp === formatCommentTime(date)).assertTrue();
      expect(formatCommentTime(new Date(2026, 0, 1, 0, 0)).length > 0).assertTrue();
    });
    /**
     * @tc.name DateFormatTest_case_015
     * @tc.desc date: getCurrentDate format for 2027-3-15 stays stable (DateFormatTest case 15)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DateFormatTest_case_015', 0, async () => {
      const stamp: string = formatCommentTimeAt(2027, 2, 15, 14, 14);
      const date: Date = new Date(2027, 2, 15, 14, 14);
      expect(stamp).assertEqual('2027-2-' + String(date.getDay()) + ' 14:14');
      expect(stamp.indexOf('-') > 0).assertTrue();
      expect(stamp.indexOf(':') > 0).assertTrue();
      expect(stamp.startsWith('2027-')).assertTrue();
      expect(stamp.length >= 10).assertTrue();
      expect(formatCommentTime(date)).assertEqual(stamp);
      expect(stamp === formatCommentTime(date)).assertTrue();
      expect(formatCommentTime(new Date(2026, 0, 1, 0, 0)).length > 0).assertTrue();
    });
    /**
     * @tc.name DateFormatTest_case_016
     * @tc.desc date: getCurrentDate format for 2025-4-16 stays stable (DateFormatTest case 16)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DateFormatTest_case_016', 0, async () => {
      const stamp: string = formatCommentTimeAt(2025, 3, 16, 15, 15);
      const date: Date = new Date(2025, 3, 16, 15, 15);
      expect(stamp).assertEqual('2025-3-' + String(date.getDay()) + ' 15:15');
      expect(stamp.indexOf('-') > 0).assertTrue();
      expect(stamp.indexOf(':') > 0).assertTrue();
      expect(stamp.startsWith('2025-')).assertTrue();
      expect(stamp.length >= 10).assertTrue();
      expect(formatCommentTime(date)).assertEqual(stamp);
      expect(stamp === formatCommentTime(date)).assertTrue();
      expect(formatCommentTime(new Date(2026, 0, 1, 0, 0)).length > 0).assertTrue();
    });
    /**
     * @tc.name DateFormatTest_case_017
     * @tc.desc date: getCurrentDate format for 2026-5-17 stays stable (DateFormatTest case 17)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DateFormatTest_case_017', 0, async () => {
      const stamp: string = formatCommentTimeAt(2026, 4, 17, 16, 16);
      const date: Date = new Date(2026, 4, 17, 16, 16);
      expect(stamp).assertEqual('2026-4-' + String(date.getDay()) + ' 16:16');
      expect(stamp.indexOf('-') > 0).assertTrue();
      expect(stamp.indexOf(':') > 0).assertTrue();
      expect(stamp.startsWith('2026-')).assertTrue();
      expect(stamp.length >= 10).assertTrue();
      expect(formatCommentTime(date)).assertEqual(stamp);
      expect(stamp === formatCommentTime(date)).assertTrue();
      expect(formatCommentTime(new Date(2026, 0, 1, 0, 0)).length > 0).assertTrue();
    });
    /**
     * @tc.name DateFormatTest_case_018
     * @tc.desc date: getCurrentDate format for 2027-6-18 stays stable (DateFormatTest case 18)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DateFormatTest_case_018', 0, async () => {
      const stamp: string = formatCommentTimeAt(2027, 5, 18, 17, 17);
      const date: Date = new Date(2027, 5, 18, 17, 17);
      expect(stamp).assertEqual('2027-5-' + String(date.getDay()) + ' 17:17');
      expect(stamp.indexOf('-') > 0).assertTrue();
      expect(stamp.indexOf(':') > 0).assertTrue();
      expect(stamp.startsWith('2027-')).assertTrue();
      expect(stamp.length >= 10).assertTrue();
      expect(formatCommentTime(date)).assertEqual(stamp);
      expect(stamp === formatCommentTime(date)).assertTrue();
      expect(formatCommentTime(new Date(2026, 0, 1, 0, 0)).length > 0).assertTrue();
    });
    /**
     * @tc.name DateFormatTest_case_019
     * @tc.desc date: getCurrentDate format for 2025-7-19 stays stable (DateFormatTest case 19)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DateFormatTest_case_019', 0, async () => {
      const stamp: string = formatCommentTimeAt(2025, 6, 19, 18, 18);
      const date: Date = new Date(2025, 6, 19, 18, 18);
      expect(stamp).assertEqual('2025-6-' + String(date.getDay()) + ' 18:18');
      expect(stamp.indexOf('-') > 0).assertTrue();
      expect(stamp.indexOf(':') > 0).assertTrue();
      expect(stamp.startsWith('2025-')).assertTrue();
      expect(stamp.length >= 10).assertTrue();
      expect(formatCommentTime(date)).assertEqual(stamp);
      expect(stamp === formatCommentTime(date)).assertTrue();
      expect(formatCommentTime(new Date(2026, 0, 1, 0, 0)).length > 0).assertTrue();
    });
    /**
     * @tc.name DateFormatTest_case_020
     * @tc.desc date: getCurrentDate format for 2026-8-20 stays stable (DateFormatTest case 20)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DateFormatTest_case_020', 0, async () => {
      const stamp: string = formatCommentTimeAt(2026, 7, 20, 19, 19);
      const date: Date = new Date(2026, 7, 20, 19, 19);
      expect(stamp).assertEqual('2026-7-' + String(date.getDay()) + ' 19:19');
      expect(stamp.indexOf('-') > 0).assertTrue();
      expect(stamp.indexOf(':') > 0).assertTrue();
      expect(stamp.startsWith('2026-')).assertTrue();
      expect(stamp.length >= 10).assertTrue();
      expect(formatCommentTime(date)).assertEqual(stamp);
      expect(stamp === formatCommentTime(date)).assertTrue();
      expect(formatCommentTime(new Date(2026, 0, 1, 0, 0)).length > 0).assertTrue();
    });
    /**
     * @tc.name DateFormatTest_case_021
     * @tc.desc date: getCurrentDate format for 2027-9-21 stays stable (DateFormatTest case 21)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DateFormatTest_case_021', 0, async () => {
      const stamp: string = formatCommentTimeAt(2027, 8, 21, 20, 20);
      const date: Date = new Date(2027, 8, 21, 20, 20);
      expect(stamp).assertEqual('2027-8-' + String(date.getDay()) + ' 20:20');
      expect(stamp.indexOf('-') > 0).assertTrue();
      expect(stamp.indexOf(':') > 0).assertTrue();
      expect(stamp.startsWith('2027-')).assertTrue();
      expect(stamp.length >= 10).assertTrue();
      expect(formatCommentTime(date)).assertEqual(stamp);
      expect(stamp === formatCommentTime(date)).assertTrue();
      expect(formatCommentTime(new Date(2026, 0, 1, 0, 0)).length > 0).assertTrue();
    });
    /**
     * @tc.name DateFormatTest_case_022
     * @tc.desc date: getCurrentDate format for 2025-10-22 stays stable (DateFormatTest case 22)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DateFormatTest_case_022', 0, async () => {
      const stamp: string = formatCommentTimeAt(2025, 9, 22, 21, 21);
      const date: Date = new Date(2025, 9, 22, 21, 21);
      expect(stamp).assertEqual('2025-9-' + String(date.getDay()) + ' 21:21');
      expect(stamp.indexOf('-') > 0).assertTrue();
      expect(stamp.indexOf(':') > 0).assertTrue();
      expect(stamp.startsWith('2025-')).assertTrue();
      expect(stamp.length >= 10).assertTrue();
      expect(formatCommentTime(date)).assertEqual(stamp);
      expect(stamp === formatCommentTime(date)).assertTrue();
      expect(formatCommentTime(new Date(2026, 0, 1, 0, 0)).length > 0).assertTrue();
    });
    /**
     * @tc.name DateFormatTest_case_023
     * @tc.desc date: getCurrentDate format for 2026-11-23 stays stable (DateFormatTest case 23)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DateFormatTest_case_023', 0, async () => {
      const stamp: string = formatCommentTimeAt(2026, 10, 23, 22, 22);
      const date: Date = new Date(2026, 10, 23, 22, 22);
      expect(stamp).assertEqual('2026-10-' + String(date.getDay()) + ' 22:22');
      expect(stamp.indexOf('-') > 0).assertTrue();
      expect(stamp.indexOf(':') > 0).assertTrue();
      expect(stamp.startsWith('2026-')).assertTrue();
      expect(stamp.length >= 10).assertTrue();
      expect(formatCommentTime(date)).assertEqual(stamp);
      expect(stamp === formatCommentTime(date)).assertTrue();
      expect(formatCommentTime(new Date(2026, 0, 1, 0, 0)).length > 0).assertTrue();
    });
    /**
     * @tc.name DateFormatTest_case_024
     * @tc.desc date: getCurrentDate format for 2027-12-24 stays stable (DateFormatTest case 24)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DateFormatTest_case_024', 0, async () => {
      const stamp: string = formatCommentTimeAt(2027, 11, 24, 23, 23);
      const date: Date = new Date(2027, 11, 24, 23, 23);
      expect(stamp).assertEqual('2027-11-' + String(date.getDay()) + ' 23:23');
      expect(stamp.indexOf('-') > 0).assertTrue();
      expect(stamp.indexOf(':') > 0).assertTrue();
      expect(stamp.startsWith('2027-')).assertTrue();
      expect(stamp.length >= 10).assertTrue();
      expect(formatCommentTime(date)).assertEqual(stamp);
      expect(stamp === formatCommentTime(date)).assertTrue();
      expect(formatCommentTime(new Date(2026, 0, 1, 0, 0)).length > 0).assertTrue();
    });
    /**
     * @tc.name DateFormatTest_case_025
     * @tc.desc date: getCurrentDate format for 2025-1-25 stays stable (DateFormatTest case 25)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DateFormatTest_case_025', 0, async () => {
      const stamp: string = formatCommentTimeAt(2025, 0, 25, 0, 24);
      const date: Date = new Date(2025, 0, 25, 0, 24);
      expect(stamp).assertEqual('2025-0-' + String(date.getDay()) + ' 0:24');
      expect(stamp.indexOf('-') > 0).assertTrue();
      expect(stamp.indexOf(':') > 0).assertTrue();
      expect(stamp.startsWith('2025-')).assertTrue();
      expect(stamp.length >= 10).assertTrue();
      expect(formatCommentTime(date)).assertEqual(stamp);
      expect(stamp === formatCommentTime(date)).assertTrue();
      expect(formatCommentTime(new Date(2026, 0, 1, 0, 0)).length > 0).assertTrue();
    });
    /**
     * @tc.name DateFormatTest_case_026
     * @tc.desc date: getCurrentDate format for 2026-2-26 stays stable (DateFormatTest case 26)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DateFormatTest_case_026', 0, async () => {
      const stamp: string = formatCommentTimeAt(2026, 1, 26, 1, 25);
      const date: Date = new Date(2026, 1, 26, 1, 25);
      expect(stamp).assertEqual('2026-1-' + String(date.getDay()) + ' 1:25');
      expect(stamp.indexOf('-') > 0).assertTrue();
      expect(stamp.indexOf(':') > 0).assertTrue();
      expect(stamp.startsWith('2026-')).assertTrue();
      expect(stamp.length >= 10).assertTrue();
      expect(formatCommentTime(date)).assertEqual(stamp);
      expect(stamp === formatCommentTime(date)).assertTrue();
      expect(formatCommentTime(new Date(2026, 0, 1, 0, 0)).length > 0).assertTrue();
    });
    /**
     * @tc.name DateFormatTest_case_027
     * @tc.desc date: getCurrentDate format for 2027-3-27 stays stable (DateFormatTest case 27)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DateFormatTest_case_027', 0, async () => {
      const stamp: string = formatCommentTimeAt(2027, 2, 27, 2, 26);
      const date: Date = new Date(2027, 2, 27, 2, 26);
      expect(stamp).assertEqual('2027-2-' + String(date.getDay()) + ' 2:26');
      expect(stamp.indexOf('-') > 0).assertTrue();
      expect(stamp.indexOf(':') > 0).assertTrue();
      expect(stamp.startsWith('2027-')).assertTrue();
      expect(stamp.length >= 10).assertTrue();
      expect(formatCommentTime(date)).assertEqual(stamp);
      expect(stamp === formatCommentTime(date)).assertTrue();
      expect(formatCommentTime(new Date(2026, 0, 1, 0, 0)).length > 0).assertTrue();
    });
    /**
     * @tc.name DateFormatTest_case_028
     * @tc.desc date: getCurrentDate format for 2025-4-1 stays stable (DateFormatTest case 28)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DateFormatTest_case_028', 0, async () => {
      const stamp: string = formatCommentTimeAt(2025, 3, 1, 3, 27);
      const date: Date = new Date(2025, 3, 1, 3, 27);
      expect(stamp).assertEqual('2025-3-' + String(date.getDay()) + ' 3:27');
      expect(stamp.indexOf('-') > 0).assertTrue();
      expect(stamp.indexOf(':') > 0).assertTrue();
      expect(stamp.startsWith('2025-')).assertTrue();
      expect(stamp.length >= 10).assertTrue();
      expect(formatCommentTime(date)).assertEqual(stamp);
      expect(stamp === formatCommentTime(date)).assertTrue();
      expect(formatCommentTime(new Date(2026, 0, 1, 0, 0)).length > 0).assertTrue();
    });
    /**
     * @tc.name DateFormatTest_case_029
     * @tc.desc date: getCurrentDate format for 2026-5-2 stays stable (DateFormatTest case 29)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DateFormatTest_case_029', 0, async () => {
      const stamp: string = formatCommentTimeAt(2026, 4, 2, 4, 28);
      const date: Date = new Date(2026, 4, 2, 4, 28);
      expect(stamp).assertEqual('2026-4-' + String(date.getDay()) + ' 4:28');
      expect(stamp.indexOf('-') > 0).assertTrue();
      expect(stamp.indexOf(':') > 0).assertTrue();
      expect(stamp.startsWith('2026-')).assertTrue();
      expect(stamp.length >= 10).assertTrue();
      expect(formatCommentTime(date)).assertEqual(stamp);
      expect(stamp === formatCommentTime(date)).assertTrue();
      expect(formatCommentTime(new Date(2026, 0, 1, 0, 0)).length > 0).assertTrue();
    });
    /**
     * @tc.name DateFormatTest_case_030
     * @tc.desc date: getCurrentDate format for 2027-6-3 stays stable (DateFormatTest case 30)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DateFormatTest_case_030', 0, async () => {
      const stamp: string = formatCommentTimeAt(2027, 5, 3, 5, 29);
      const date: Date = new Date(2027, 5, 3, 5, 29);
      expect(stamp).assertEqual('2027-5-' + String(date.getDay()) + ' 5:29');
      expect(stamp.indexOf('-') > 0).assertTrue();
      expect(stamp.indexOf(':') > 0).assertTrue();
      expect(stamp.startsWith('2027-')).assertTrue();
      expect(stamp.length >= 10).assertTrue();
      expect(formatCommentTime(date)).assertEqual(stamp);
      expect(stamp === formatCommentTime(date)).assertTrue();
      expect(formatCommentTime(new Date(2026, 0, 1, 0, 0)).length > 0).assertTrue();
    });
    /**
     * @tc.name DateFormatTest_case_031
     * @tc.desc date: getCurrentDate format for 2025-7-4 stays stable (DateFormatTest case 31)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DateFormatTest_case_031', 0, async () => {
      const stamp: string = formatCommentTimeAt(2025, 6, 4, 6, 30);
      const date: Date = new Date(2025, 6, 4, 6, 30);
      expect(stamp).assertEqual('2025-6-' + String(date.getDay()) + ' 6:30');
      expect(stamp.indexOf('-') > 0).assertTrue();
      expect(stamp.indexOf(':') > 0).assertTrue();
      expect(stamp.startsWith('2025-')).assertTrue();
      expect(stamp.length >= 10).assertTrue();
      expect(formatCommentTime(date)).assertEqual(stamp);
      expect(stamp === formatCommentTime(date)).assertTrue();
      expect(formatCommentTime(new Date(2026, 0, 1, 0, 0)).length > 0).assertTrue();
    });
    /**
     * @tc.name DateFormatTest_case_032
     * @tc.desc date: getCurrentDate format for 2026-8-5 stays stable (DateFormatTest case 32)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DateFormatTest_case_032', 0, async () => {
      const stamp: string = formatCommentTimeAt(2026, 7, 5, 7, 31);
      const date: Date = new Date(2026, 7, 5, 7, 31);
      expect(stamp).assertEqual('2026-7-' + String(date.getDay()) + ' 7:31');
      expect(stamp.indexOf('-') > 0).assertTrue();
      expect(stamp.indexOf(':') > 0).assertTrue();
      expect(stamp.startsWith('2026-')).assertTrue();
      expect(stamp.length >= 10).assertTrue();
      expect(formatCommentTime(date)).assertEqual(stamp);
      expect(stamp === formatCommentTime(date)).assertTrue();
      expect(formatCommentTime(new Date(2026, 0, 1, 0, 0)).length > 0).assertTrue();
    });
    /**
     * @tc.name DateFormatTest_case_033
     * @tc.desc date: getCurrentDate format for 2027-9-6 stays stable (DateFormatTest case 33)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DateFormatTest_case_033', 0, async () => {
      const stamp: string = formatCommentTimeAt(2027, 8, 6, 8, 32);
      const date: Date = new Date(2027, 8, 6, 8, 32);
      expect(stamp).assertEqual('2027-8-' + String(date.getDay()) + ' 8:32');
      expect(stamp.indexOf('-') > 0).assertTrue();
      expect(stamp.indexOf(':') > 0).assertTrue();
      expect(stamp.startsWith('2027-')).assertTrue();
      expect(stamp.length >= 10).assertTrue();
      expect(formatCommentTime(date)).assertEqual(stamp);
      expect(stamp === formatCommentTime(date)).assertTrue();
      expect(formatCommentTime(new Date(2026, 0, 1, 0, 0)).length > 0).assertTrue();
    });
    /**
     * @tc.name DateFormatTest_case_034
     * @tc.desc date: getCurrentDate format for 2025-10-7 stays stable (DateFormatTest case 34)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DateFormatTest_case_034', 0, async () => {
      const stamp: string = formatCommentTimeAt(2025, 9, 7, 9, 33);
      const date: Date = new Date(2025, 9, 7, 9, 33);
      expect(stamp).assertEqual('2025-9-' + String(date.getDay()) + ' 9:33');
      expect(stamp.indexOf('-') > 0).assertTrue();
      expect(stamp.indexOf(':') > 0).assertTrue();
      expect(stamp.startsWith('2025-')).assertTrue();
      expect(stamp.length >= 10).assertTrue();
      expect(formatCommentTime(date)).assertEqual(stamp);
      expect(stamp === formatCommentTime(date)).assertTrue();
      expect(formatCommentTime(new Date(2026, 0, 1, 0, 0)).length > 0).assertTrue();
    });
    /**
     * @tc.name DateFormatTest_case_035
     * @tc.desc date: getCurrentDate format for 2026-11-8 stays stable (DateFormatTest case 35)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DateFormatTest_case_035', 0, async () => {
      const stamp: string = formatCommentTimeAt(2026, 10, 8, 10, 34);
      const date: Date = new Date(2026, 10, 8, 10, 34);
      expect(stamp).assertEqual('2026-10-' + String(date.getDay()) + ' 10:34');
      expect(stamp.indexOf('-') > 0).assertTrue();
      expect(stamp.indexOf(':') > 0).assertTrue();
      expect(stamp.startsWith('2026-')).assertTrue();
      expect(stamp.length >= 10).assertTrue();
      expect(formatCommentTime(date)).assertEqual(stamp);
      expect(stamp === formatCommentTime(date)).assertTrue();
      expect(formatCommentTime(new Date(2026, 0, 1, 0, 0)).length > 0).assertTrue();
    });
    /**
     * @tc.name DateFormatTest_case_036
     * @tc.desc date: getCurrentDate format for 2027-12-9 stays stable (DateFormatTest case 36)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DateFormatTest_case_036', 0, async () => {
      const stamp: string = formatCommentTimeAt(2027, 11, 9, 11, 35);
      const date: Date = new Date(2027, 11, 9, 11, 35);
      expect(stamp).assertEqual('2027-11-' + String(date.getDay()) + ' 11:35');
      expect(stamp.indexOf('-') > 0).assertTrue();
      expect(stamp.indexOf(':') > 0).assertTrue();
      expect(stamp.startsWith('2027-')).assertTrue();
      expect(stamp.length >= 10).assertTrue();
      expect(formatCommentTime(date)).assertEqual(stamp);
      expect(stamp === formatCommentTime(date)).assertTrue();
      expect(formatCommentTime(new Date(2026, 0, 1, 0, 0)).length > 0).assertTrue();
    });
    /**
     * @tc.name DateFormatTest_case_037
     * @tc.desc date: getCurrentDate format for 2025-1-10 stays stable (DateFormatTest case 37)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DateFormatTest_case_037', 0, async () => {
      const stamp: string = formatCommentTimeAt(2025, 0, 10, 12, 36);
      const date: Date = new Date(2025, 0, 10, 12, 36);
      expect(stamp).assertEqual('2025-0-' + String(date.getDay()) + ' 12:36');
      expect(stamp.indexOf('-') > 0).assertTrue();
      expect(stamp.indexOf(':') > 0).assertTrue();
      expect(stamp.startsWith('2025-')).assertTrue();
      expect(stamp.length >= 10).assertTrue();
      expect(formatCommentTime(date)).assertEqual(stamp);
      expect(stamp === formatCommentTime(date)).assertTrue();
      expect(formatCommentTime(new Date(2026, 0, 1, 0, 0)).length > 0).assertTrue();
    });
    /**
     * @tc.name DateFormatTest_case_038
     * @tc.desc date: getCurrentDate format for 2026-2-11 stays stable (DateFormatTest case 38)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DateFormatTest_case_038', 0, async () => {
      const stamp: string = formatCommentTimeAt(2026, 1, 11, 13, 37);
      const date: Date = new Date(2026, 1, 11, 13, 37);
      expect(stamp).assertEqual('2026-1-' + String(date.getDay()) + ' 13:37');
      expect(stamp.indexOf('-') > 0).assertTrue();
      expect(stamp.indexOf(':') > 0).assertTrue();
      expect(stamp.startsWith('2026-')).assertTrue();
      expect(stamp.length >= 10).assertTrue();
      expect(formatCommentTime(date)).assertEqual(stamp);
      expect(stamp === formatCommentTime(date)).assertTrue();
      expect(formatCommentTime(new Date(2026, 0, 1, 0, 0)).length > 0).assertTrue();
    });
    /**
     * @tc.name DateFormatTest_case_039
     * @tc.desc date: getCurrentDate format for 2027-3-12 stays stable (DateFormatTest case 39)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DateFormatTest_case_039', 0, async () => {
      const stamp: string = formatCommentTimeAt(2027, 2, 12, 14, 38);
      const date: Date = new Date(2027, 2, 12, 14, 38);
      expect(stamp).assertEqual('2027-2-' + String(date.getDay()) + ' 14:38');
      expect(stamp.indexOf('-') > 0).assertTrue();
      expect(stamp.indexOf(':') > 0).assertTrue();
      expect(stamp.startsWith('2027-')).assertTrue();
      expect(stamp.length >= 10).assertTrue();
      expect(formatCommentTime(date)).assertEqual(stamp);
      expect(stamp === formatCommentTime(date)).assertTrue();
      expect(formatCommentTime(new Date(2026, 0, 1, 0, 0)).length > 0).assertTrue();
    });
    /**
     * @tc.name DateFormatTest_case_040
     * @tc.desc date: getCurrentDate format for 2025-4-13 stays stable (DateFormatTest case 40)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DateFormatTest_case_040', 0, async () => {
      const stamp: string = formatCommentTimeAt(2025, 3, 13, 15, 39);
      const date: Date = new Date(2025, 3, 13, 15, 39);
      expect(stamp).assertEqual('2025-3-' + String(date.getDay()) + ' 15:39');
      expect(stamp.indexOf('-') > 0).assertTrue();
      expect(stamp.indexOf(':') > 0).assertTrue();
      expect(stamp.startsWith('2025-')).assertTrue();
      expect(stamp.length >= 10).assertTrue();
      expect(formatCommentTime(date)).assertEqual(stamp);
      expect(stamp === formatCommentTime(date)).assertTrue();
      expect(formatCommentTime(new Date(2026, 0, 1, 0, 0)).length > 0).assertTrue();
    });
    /**
     * @tc.name DateFormatTest_case_041
     * @tc.desc date: getCurrentDate format for 2026-5-14 stays stable (DateFormatTest case 41)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DateFormatTest_case_041', 0, async () => {
      const stamp: string = formatCommentTimeAt(2026, 4, 14, 16, 40);
      const date: Date = new Date(2026, 4, 14, 16, 40);
      expect(stamp).assertEqual('2026-4-' + String(date.getDay()) + ' 16:40');
      expect(stamp.indexOf('-') > 0).assertTrue();
      expect(stamp.indexOf(':') > 0).assertTrue();
      expect(stamp.startsWith('2026-')).assertTrue();
      expect(stamp.length >= 10).assertTrue();
      expect(formatCommentTime(date)).assertEqual(stamp);
      expect(stamp === formatCommentTime(date)).assertTrue();
      expect(formatCommentTime(new Date(2026, 0, 1, 0, 0)).length > 0).assertTrue();
    });
    /**
     * @tc.name DateFormatTest_case_042
     * @tc.desc date: getCurrentDate format for 2027-6-15 stays stable (DateFormatTest case 42)
     * @tc.type Function
     * @tc.level Level1
     */
    it('DateFormatTest_case_042', 0, async () => {
      const stamp: string = formatCommentTimeAt(2027, 5, 15, 17, 41);
      const date: Date = new Date(2027, 5, 15, 17, 41);
      expect(stamp).assertEqual('2027-5-' + String(date.getDay()) + ' 17:41');
      expect(stamp.indexOf('-') > 0).assertTrue();
      expect(stamp.indexOf(':') > 0).assertTrue();
      expect(stamp.startsWith('2027-')).assertTrue();
      expect(stamp.length >= 10).assertTrue();
      expect(formatCommentTime(date)).assertEqual(stamp);
      expect(stamp === formatCommentTime(date)).assertTrue();
      expect(formatCommentTime(new Date(2026, 0, 1, 0, 0)).length > 0).assertTrue();
    });
  });
}
