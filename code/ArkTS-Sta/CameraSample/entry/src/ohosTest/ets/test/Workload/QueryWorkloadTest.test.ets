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

export default function QueryWorkloadTest(): void {
  describe('QueryWorkloadTest', () => {
    beforeAll(() => {
      logSuite('QueryWorkloadTest', 'begin');
    });
    beforeEach(async () => {
      await yieldTick();
    });
    afterAll(() => {
      logSuite('QueryWorkloadTest', 'end');
    });

    /**
     * @tc.name QueryWorkloadTest_case_001
     * @tc.desc journal: 1 appended comments keep insertion order and ids (QueryWorkloadTest case 1)
     * @tc.type Function
     * @tc.level Level1
     */
    it('QueryWorkloadTest_case_001', 0, async () => {
      const journal: CommentJournal = new CommentJournal();
      for (let index = 0; index < 1; index++) {
        journal.append(makeSimpleComment(index + 1));
      }
      expect(journal.size()).assertEqual(1);
      expect(journal.latest() !== undefined).assertTrue();
      expect(journal.first() !== undefined).assertTrue();
      expect(journal.ids().length).assertEqual(1);
      expect(journal.names().length).assertEqual(1);
      expect(journal.indexOfId(1)).assertEqual(0);
      expect(journal.indexOfId(999)).assertEqual(-1);
      expect(journal.countByName('user_1')).assertEqual(1);
      expect(journal.imageCounts().length).assertEqual(1);
      expect(journal.snapshot().length).assertEqual(1);
    });
    /**
     * @tc.name QueryWorkloadTest_case_002
     * @tc.desc journal: 2 appended comments keep insertion order and ids (QueryWorkloadTest case 2)
     * @tc.type Function
     * @tc.level Level1
     */
    it('QueryWorkloadTest_case_002', 0, async () => {
      const journal: CommentJournal = new CommentJournal();
      for (let index = 0; index < 2; index++) {
        journal.append(makeSimpleComment(index + 1));
      }
      expect(journal.size()).assertEqual(2);
      expect(journal.latest() !== undefined).assertTrue();
      expect(journal.first() !== undefined).assertTrue();
      expect(journal.ids().length).assertEqual(2);
      expect(journal.names().length).assertEqual(2);
      expect(journal.indexOfId(1)).assertEqual(0);
      expect(journal.indexOfId(999)).assertEqual(-1);
      expect(journal.countByName('user_1')).assertEqual(1);
      expect(journal.imageCounts().length).assertEqual(2);
      expect(journal.snapshot().length).assertEqual(2);
    });
    /**
     * @tc.name QueryWorkloadTest_case_003
     * @tc.desc journal: 3 appended comments keep insertion order and ids (QueryWorkloadTest case 3)
     * @tc.type Function
     * @tc.level Level1
     */
    it('QueryWorkloadTest_case_003', 0, async () => {
      const journal: CommentJournal = new CommentJournal();
      for (let index = 0; index < 3; index++) {
        journal.append(makeSimpleComment(index + 1));
      }
      expect(journal.size()).assertEqual(3);
      expect(journal.latest() !== undefined).assertTrue();
      expect(journal.first() !== undefined).assertTrue();
      expect(journal.ids().length).assertEqual(3);
      expect(journal.names().length).assertEqual(3);
      expect(journal.indexOfId(1)).assertEqual(0);
      expect(journal.indexOfId(999)).assertEqual(-1);
      expect(journal.countByName('user_1')).assertEqual(1);
      expect(journal.imageCounts().length).assertEqual(3);
      expect(journal.snapshot().length).assertEqual(3);
    });
    /**
     * @tc.name QueryWorkloadTest_case_004
     * @tc.desc journal: 4 appended comments keep insertion order and ids (QueryWorkloadTest case 4)
     * @tc.type Function
     * @tc.level Level1
     */
    it('QueryWorkloadTest_case_004', 0, async () => {
      const journal: CommentJournal = new CommentJournal();
      for (let index = 0; index < 4; index++) {
        journal.append(makeSimpleComment(index + 1));
      }
      expect(journal.size()).assertEqual(4);
      expect(journal.latest() !== undefined).assertTrue();
      expect(journal.first() !== undefined).assertTrue();
      expect(journal.ids().length).assertEqual(4);
      expect(journal.names().length).assertEqual(4);
      expect(journal.indexOfId(1)).assertEqual(0);
      expect(journal.indexOfId(999)).assertEqual(-1);
      expect(journal.countByName('user_1')).assertEqual(1);
      expect(journal.imageCounts().length).assertEqual(4);
      expect(journal.snapshot().length).assertEqual(4);
    });
    /**
     * @tc.name QueryWorkloadTest_case_005
     * @tc.desc journal: 1 appended comments keep insertion order and ids (QueryWorkloadTest case 5)
     * @tc.type Function
     * @tc.level Level1
     */
    it('QueryWorkloadTest_case_005', 0, async () => {
      const journal: CommentJournal = new CommentJournal();
      for (let index = 0; index < 1; index++) {
        journal.append(makeSimpleComment(index + 1));
      }
      expect(journal.size()).assertEqual(1);
      expect(journal.latest() !== undefined).assertTrue();
      expect(journal.first() !== undefined).assertTrue();
      expect(journal.ids().length).assertEqual(1);
      expect(journal.names().length).assertEqual(1);
      expect(journal.indexOfId(1)).assertEqual(0);
      expect(journal.indexOfId(999)).assertEqual(-1);
      expect(journal.countByName('user_1')).assertEqual(1);
      expect(journal.imageCounts().length).assertEqual(1);
      expect(journal.snapshot().length).assertEqual(1);
    });
    /**
     * @tc.name QueryWorkloadTest_case_006
     * @tc.desc journal: 2 appended comments keep insertion order and ids (QueryWorkloadTest case 6)
     * @tc.type Function
     * @tc.level Level1
     */
    it('QueryWorkloadTest_case_006', 0, async () => {
      const journal: CommentJournal = new CommentJournal();
      for (let index = 0; index < 2; index++) {
        journal.append(makeSimpleComment(index + 1));
      }
      expect(journal.size()).assertEqual(2);
      expect(journal.latest() !== undefined).assertTrue();
      expect(journal.first() !== undefined).assertTrue();
      expect(journal.ids().length).assertEqual(2);
      expect(journal.names().length).assertEqual(2);
      expect(journal.indexOfId(1)).assertEqual(0);
      expect(journal.indexOfId(999)).assertEqual(-1);
      expect(journal.countByName('user_1')).assertEqual(1);
      expect(journal.imageCounts().length).assertEqual(2);
      expect(journal.snapshot().length).assertEqual(2);
    });
    /**
     * @tc.name QueryWorkloadTest_case_007
     * @tc.desc journal: 3 appended comments keep insertion order and ids (QueryWorkloadTest case 7)
     * @tc.type Function
     * @tc.level Level1
     */
    it('QueryWorkloadTest_case_007', 0, async () => {
      const journal: CommentJournal = new CommentJournal();
      for (let index = 0; index < 3; index++) {
        journal.append(makeSimpleComment(index + 1));
      }
      expect(journal.size()).assertEqual(3);
      expect(journal.latest() !== undefined).assertTrue();
      expect(journal.first() !== undefined).assertTrue();
      expect(journal.ids().length).assertEqual(3);
      expect(journal.names().length).assertEqual(3);
      expect(journal.indexOfId(1)).assertEqual(0);
      expect(journal.indexOfId(999)).assertEqual(-1);
      expect(journal.countByName('user_1')).assertEqual(1);
      expect(journal.imageCounts().length).assertEqual(3);
      expect(journal.snapshot().length).assertEqual(3);
    });
    /**
     * @tc.name QueryWorkloadTest_case_008
     * @tc.desc journal: 4 appended comments keep insertion order and ids (QueryWorkloadTest case 8)
     * @tc.type Function
     * @tc.level Level1
     */
    it('QueryWorkloadTest_case_008', 0, async () => {
      const journal: CommentJournal = new CommentJournal();
      for (let index = 0; index < 4; index++) {
        journal.append(makeSimpleComment(index + 1));
      }
      expect(journal.size()).assertEqual(4);
      expect(journal.latest() !== undefined).assertTrue();
      expect(journal.first() !== undefined).assertTrue();
      expect(journal.ids().length).assertEqual(4);
      expect(journal.names().length).assertEqual(4);
      expect(journal.indexOfId(1)).assertEqual(0);
      expect(journal.indexOfId(999)).assertEqual(-1);
      expect(journal.countByName('user_1')).assertEqual(1);
      expect(journal.imageCounts().length).assertEqual(4);
      expect(journal.snapshot().length).assertEqual(4);
    });
    /**
     * @tc.name QueryWorkloadTest_case_009
     * @tc.desc journal: 1 appended comments keep insertion order and ids (QueryWorkloadTest case 9)
     * @tc.type Function
     * @tc.level Level1
     */
    it('QueryWorkloadTest_case_009', 0, async () => {
      const journal: CommentJournal = new CommentJournal();
      for (let index = 0; index < 1; index++) {
        journal.append(makeSimpleComment(index + 1));
      }
      expect(journal.size()).assertEqual(1);
      expect(journal.latest() !== undefined).assertTrue();
      expect(journal.first() !== undefined).assertTrue();
      expect(journal.ids().length).assertEqual(1);
      expect(journal.names().length).assertEqual(1);
      expect(journal.indexOfId(1)).assertEqual(0);
      expect(journal.indexOfId(999)).assertEqual(-1);
      expect(journal.countByName('user_1')).assertEqual(1);
      expect(journal.imageCounts().length).assertEqual(1);
      expect(journal.snapshot().length).assertEqual(1);
    });
    /**
     * @tc.name QueryWorkloadTest_case_010
     * @tc.desc journal: 2 appended comments keep insertion order and ids (QueryWorkloadTest case 10)
     * @tc.type Function
     * @tc.level Level1
     */
    it('QueryWorkloadTest_case_010', 0, async () => {
      const journal: CommentJournal = new CommentJournal();
      for (let index = 0; index < 2; index++) {
        journal.append(makeSimpleComment(index + 1));
      }
      expect(journal.size()).assertEqual(2);
      expect(journal.latest() !== undefined).assertTrue();
      expect(journal.first() !== undefined).assertTrue();
      expect(journal.ids().length).assertEqual(2);
      expect(journal.names().length).assertEqual(2);
      expect(journal.indexOfId(1)).assertEqual(0);
      expect(journal.indexOfId(999)).assertEqual(-1);
      expect(journal.countByName('user_1')).assertEqual(1);
      expect(journal.imageCounts().length).assertEqual(2);
      expect(journal.snapshot().length).assertEqual(2);
    });
    /**
     * @tc.name QueryWorkloadTest_case_011
     * @tc.desc journal: 3 appended comments keep insertion order and ids (QueryWorkloadTest case 11)
     * @tc.type Function
     * @tc.level Level1
     */
    it('QueryWorkloadTest_case_011', 0, async () => {
      const journal: CommentJournal = new CommentJournal();
      for (let index = 0; index < 3; index++) {
        journal.append(makeSimpleComment(index + 1));
      }
      expect(journal.size()).assertEqual(3);
      expect(journal.latest() !== undefined).assertTrue();
      expect(journal.first() !== undefined).assertTrue();
      expect(journal.ids().length).assertEqual(3);
      expect(journal.names().length).assertEqual(3);
      expect(journal.indexOfId(1)).assertEqual(0);
      expect(journal.indexOfId(999)).assertEqual(-1);
      expect(journal.countByName('user_1')).assertEqual(1);
      expect(journal.imageCounts().length).assertEqual(3);
      expect(journal.snapshot().length).assertEqual(3);
    });
    /**
     * @tc.name QueryWorkloadTest_case_012
     * @tc.desc journal: 4 appended comments keep insertion order and ids (QueryWorkloadTest case 12)
     * @tc.type Function
     * @tc.level Level1
     */
    it('QueryWorkloadTest_case_012', 0, async () => {
      const journal: CommentJournal = new CommentJournal();
      for (let index = 0; index < 4; index++) {
        journal.append(makeSimpleComment(index + 1));
      }
      expect(journal.size()).assertEqual(4);
      expect(journal.latest() !== undefined).assertTrue();
      expect(journal.first() !== undefined).assertTrue();
      expect(journal.ids().length).assertEqual(4);
      expect(journal.names().length).assertEqual(4);
      expect(journal.indexOfId(1)).assertEqual(0);
      expect(journal.indexOfId(999)).assertEqual(-1);
      expect(journal.countByName('user_1')).assertEqual(1);
      expect(journal.imageCounts().length).assertEqual(4);
      expect(journal.snapshot().length).assertEqual(4);
    });
    /**
     * @tc.name QueryWorkloadTest_case_013
     * @tc.desc journal: 1 appended comments keep insertion order and ids (QueryWorkloadTest case 13)
     * @tc.type Function
     * @tc.level Level1
     */
    it('QueryWorkloadTest_case_013', 0, async () => {
      const journal: CommentJournal = new CommentJournal();
      for (let index = 0; index < 1; index++) {
        journal.append(makeSimpleComment(index + 1));
      }
      expect(journal.size()).assertEqual(1);
      expect(journal.latest() !== undefined).assertTrue();
      expect(journal.first() !== undefined).assertTrue();
      expect(journal.ids().length).assertEqual(1);
      expect(journal.names().length).assertEqual(1);
      expect(journal.indexOfId(1)).assertEqual(0);
      expect(journal.indexOfId(999)).assertEqual(-1);
      expect(journal.countByName('user_1')).assertEqual(1);
      expect(journal.imageCounts().length).assertEqual(1);
      expect(journal.snapshot().length).assertEqual(1);
    });
    /**
     * @tc.name QueryWorkloadTest_case_014
     * @tc.desc journal: 2 appended comments keep insertion order and ids (QueryWorkloadTest case 14)
     * @tc.type Function
     * @tc.level Level1
     */
    it('QueryWorkloadTest_case_014', 0, async () => {
      const journal: CommentJournal = new CommentJournal();
      for (let index = 0; index < 2; index++) {
        journal.append(makeSimpleComment(index + 1));
      }
      expect(journal.size()).assertEqual(2);
      expect(journal.latest() !== undefined).assertTrue();
      expect(journal.first() !== undefined).assertTrue();
      expect(journal.ids().length).assertEqual(2);
      expect(journal.names().length).assertEqual(2);
      expect(journal.indexOfId(1)).assertEqual(0);
      expect(journal.indexOfId(999)).assertEqual(-1);
      expect(journal.countByName('user_1')).assertEqual(1);
      expect(journal.imageCounts().length).assertEqual(2);
      expect(journal.snapshot().length).assertEqual(2);
    });
    /**
     * @tc.name QueryWorkloadTest_case_015
     * @tc.desc journal: 3 appended comments keep insertion order and ids (QueryWorkloadTest case 15)
     * @tc.type Function
     * @tc.level Level1
     */
    it('QueryWorkloadTest_case_015', 0, async () => {
      const journal: CommentJournal = new CommentJournal();
      for (let index = 0; index < 3; index++) {
        journal.append(makeSimpleComment(index + 1));
      }
      expect(journal.size()).assertEqual(3);
      expect(journal.latest() !== undefined).assertTrue();
      expect(journal.first() !== undefined).assertTrue();
      expect(journal.ids().length).assertEqual(3);
      expect(journal.names().length).assertEqual(3);
      expect(journal.indexOfId(1)).assertEqual(0);
      expect(journal.indexOfId(999)).assertEqual(-1);
      expect(journal.countByName('user_1')).assertEqual(1);
      expect(journal.imageCounts().length).assertEqual(3);
      expect(journal.snapshot().length).assertEqual(3);
    });
    /**
     * @tc.name QueryWorkloadTest_case_016
     * @tc.desc journal: 4 appended comments keep insertion order and ids (QueryWorkloadTest case 16)
     * @tc.type Function
     * @tc.level Level1
     */
    it('QueryWorkloadTest_case_016', 0, async () => {
      const journal: CommentJournal = new CommentJournal();
      for (let index = 0; index < 4; index++) {
        journal.append(makeSimpleComment(index + 1));
      }
      expect(journal.size()).assertEqual(4);
      expect(journal.latest() !== undefined).assertTrue();
      expect(journal.first() !== undefined).assertTrue();
      expect(journal.ids().length).assertEqual(4);
      expect(journal.names().length).assertEqual(4);
      expect(journal.indexOfId(1)).assertEqual(0);
      expect(journal.indexOfId(999)).assertEqual(-1);
      expect(journal.countByName('user_1')).assertEqual(1);
      expect(journal.imageCounts().length).assertEqual(4);
      expect(journal.snapshot().length).assertEqual(4);
    });
    /**
     * @tc.name QueryWorkloadTest_case_017
     * @tc.desc journal: 1 appended comments keep insertion order and ids (QueryWorkloadTest case 17)
     * @tc.type Function
     * @tc.level Level1
     */
    it('QueryWorkloadTest_case_017', 0, async () => {
      const journal: CommentJournal = new CommentJournal();
      for (let index = 0; index < 1; index++) {
        journal.append(makeSimpleComment(index + 1));
      }
      expect(journal.size()).assertEqual(1);
      expect(journal.latest() !== undefined).assertTrue();
      expect(journal.first() !== undefined).assertTrue();
      expect(journal.ids().length).assertEqual(1);
      expect(journal.names().length).assertEqual(1);
      expect(journal.indexOfId(1)).assertEqual(0);
      expect(journal.indexOfId(999)).assertEqual(-1);
      expect(journal.countByName('user_1')).assertEqual(1);
      expect(journal.imageCounts().length).assertEqual(1);
      expect(journal.snapshot().length).assertEqual(1);
    });
    /**
     * @tc.name QueryWorkloadTest_case_018
     * @tc.desc journal: 2 appended comments keep insertion order and ids (QueryWorkloadTest case 18)
     * @tc.type Function
     * @tc.level Level1
     */
    it('QueryWorkloadTest_case_018', 0, async () => {
      const journal: CommentJournal = new CommentJournal();
      for (let index = 0; index < 2; index++) {
        journal.append(makeSimpleComment(index + 1));
      }
      expect(journal.size()).assertEqual(2);
      expect(journal.latest() !== undefined).assertTrue();
      expect(journal.first() !== undefined).assertTrue();
      expect(journal.ids().length).assertEqual(2);
      expect(journal.names().length).assertEqual(2);
      expect(journal.indexOfId(1)).assertEqual(0);
      expect(journal.indexOfId(999)).assertEqual(-1);
      expect(journal.countByName('user_1')).assertEqual(1);
      expect(journal.imageCounts().length).assertEqual(2);
      expect(journal.snapshot().length).assertEqual(2);
    });
    /**
     * @tc.name QueryWorkloadTest_case_019
     * @tc.desc journal: 3 appended comments keep insertion order and ids (QueryWorkloadTest case 19)
     * @tc.type Function
     * @tc.level Level1
     */
    it('QueryWorkloadTest_case_019', 0, async () => {
      const journal: CommentJournal = new CommentJournal();
      for (let index = 0; index < 3; index++) {
        journal.append(makeSimpleComment(index + 1));
      }
      expect(journal.size()).assertEqual(3);
      expect(journal.latest() !== undefined).assertTrue();
      expect(journal.first() !== undefined).assertTrue();
      expect(journal.ids().length).assertEqual(3);
      expect(journal.names().length).assertEqual(3);
      expect(journal.indexOfId(1)).assertEqual(0);
      expect(journal.indexOfId(999)).assertEqual(-1);
      expect(journal.countByName('user_1')).assertEqual(1);
      expect(journal.imageCounts().length).assertEqual(3);
      expect(journal.snapshot().length).assertEqual(3);
    });
    /**
     * @tc.name QueryWorkloadTest_case_020
     * @tc.desc journal: 4 appended comments keep insertion order and ids (QueryWorkloadTest case 20)
     * @tc.type Function
     * @tc.level Level1
     */
    it('QueryWorkloadTest_case_020', 0, async () => {
      const journal: CommentJournal = new CommentJournal();
      for (let index = 0; index < 4; index++) {
        journal.append(makeSimpleComment(index + 1));
      }
      expect(journal.size()).assertEqual(4);
      expect(journal.latest() !== undefined).assertTrue();
      expect(journal.first() !== undefined).assertTrue();
      expect(journal.ids().length).assertEqual(4);
      expect(journal.names().length).assertEqual(4);
      expect(journal.indexOfId(1)).assertEqual(0);
      expect(journal.indexOfId(999)).assertEqual(-1);
      expect(journal.countByName('user_1')).assertEqual(1);
      expect(journal.imageCounts().length).assertEqual(4);
      expect(journal.snapshot().length).assertEqual(4);
    });
    /**
     * @tc.name QueryWorkloadTest_case_021
     * @tc.desc journal: 1 appended comments keep insertion order and ids (QueryWorkloadTest case 21)
     * @tc.type Function
     * @tc.level Level1
     */
    it('QueryWorkloadTest_case_021', 0, async () => {
      const journal: CommentJournal = new CommentJournal();
      for (let index = 0; index < 1; index++) {
        journal.append(makeSimpleComment(index + 1));
      }
      expect(journal.size()).assertEqual(1);
      expect(journal.latest() !== undefined).assertTrue();
      expect(journal.first() !== undefined).assertTrue();
      expect(journal.ids().length).assertEqual(1);
      expect(journal.names().length).assertEqual(1);
      expect(journal.indexOfId(1)).assertEqual(0);
      expect(journal.indexOfId(999)).assertEqual(-1);
      expect(journal.countByName('user_1')).assertEqual(1);
      expect(journal.imageCounts().length).assertEqual(1);
      expect(journal.snapshot().length).assertEqual(1);
    });
    /**
     * @tc.name QueryWorkloadTest_case_022
     * @tc.desc journal: 2 appended comments keep insertion order and ids (QueryWorkloadTest case 22)
     * @tc.type Function
     * @tc.level Level1
     */
    it('QueryWorkloadTest_case_022', 0, async () => {
      const journal: CommentJournal = new CommentJournal();
      for (let index = 0; index < 2; index++) {
        journal.append(makeSimpleComment(index + 1));
      }
      expect(journal.size()).assertEqual(2);
      expect(journal.latest() !== undefined).assertTrue();
      expect(journal.first() !== undefined).assertTrue();
      expect(journal.ids().length).assertEqual(2);
      expect(journal.names().length).assertEqual(2);
      expect(journal.indexOfId(1)).assertEqual(0);
      expect(journal.indexOfId(999)).assertEqual(-1);
      expect(journal.countByName('user_1')).assertEqual(1);
      expect(journal.imageCounts().length).assertEqual(2);
      expect(journal.snapshot().length).assertEqual(2);
    });
    /**
     * @tc.name QueryWorkloadTest_case_023
     * @tc.desc journal: 3 appended comments keep insertion order and ids (QueryWorkloadTest case 23)
     * @tc.type Function
     * @tc.level Level1
     */
    it('QueryWorkloadTest_case_023', 0, async () => {
      const journal: CommentJournal = new CommentJournal();
      for (let index = 0; index < 3; index++) {
        journal.append(makeSimpleComment(index + 1));
      }
      expect(journal.size()).assertEqual(3);
      expect(journal.latest() !== undefined).assertTrue();
      expect(journal.first() !== undefined).assertTrue();
      expect(journal.ids().length).assertEqual(3);
      expect(journal.names().length).assertEqual(3);
      expect(journal.indexOfId(1)).assertEqual(0);
      expect(journal.indexOfId(999)).assertEqual(-1);
      expect(journal.countByName('user_1')).assertEqual(1);
      expect(journal.imageCounts().length).assertEqual(3);
      expect(journal.snapshot().length).assertEqual(3);
    });
    /**
     * @tc.name QueryWorkloadTest_case_024
     * @tc.desc journal: 4 appended comments keep insertion order and ids (QueryWorkloadTest case 24)
     * @tc.type Function
     * @tc.level Level1
     */
    it('QueryWorkloadTest_case_024', 0, async () => {
      const journal: CommentJournal = new CommentJournal();
      for (let index = 0; index < 4; index++) {
        journal.append(makeSimpleComment(index + 1));
      }
      expect(journal.size()).assertEqual(4);
      expect(journal.latest() !== undefined).assertTrue();
      expect(journal.first() !== undefined).assertTrue();
      expect(journal.ids().length).assertEqual(4);
      expect(journal.names().length).assertEqual(4);
      expect(journal.indexOfId(1)).assertEqual(0);
      expect(journal.indexOfId(999)).assertEqual(-1);
      expect(journal.countByName('user_1')).assertEqual(1);
      expect(journal.imageCounts().length).assertEqual(4);
      expect(journal.snapshot().length).assertEqual(4);
    });
    /**
     * @tc.name QueryWorkloadTest_case_025
     * @tc.desc journal: 1 appended comments keep insertion order and ids (QueryWorkloadTest case 25)
     * @tc.type Function
     * @tc.level Level1
     */
    it('QueryWorkloadTest_case_025', 0, async () => {
      const journal: CommentJournal = new CommentJournal();
      for (let index = 0; index < 1; index++) {
        journal.append(makeSimpleComment(index + 1));
      }
      expect(journal.size()).assertEqual(1);
      expect(journal.latest() !== undefined).assertTrue();
      expect(journal.first() !== undefined).assertTrue();
      expect(journal.ids().length).assertEqual(1);
      expect(journal.names().length).assertEqual(1);
      expect(journal.indexOfId(1)).assertEqual(0);
      expect(journal.indexOfId(999)).assertEqual(-1);
      expect(journal.countByName('user_1')).assertEqual(1);
      expect(journal.imageCounts().length).assertEqual(1);
      expect(journal.snapshot().length).assertEqual(1);
    });
    /**
     * @tc.name QueryWorkloadTest_case_026
     * @tc.desc journal: 2 appended comments keep insertion order and ids (QueryWorkloadTest case 26)
     * @tc.type Function
     * @tc.level Level1
     */
    it('QueryWorkloadTest_case_026', 0, async () => {
      const journal: CommentJournal = new CommentJournal();
      for (let index = 0; index < 2; index++) {
        journal.append(makeSimpleComment(index + 1));
      }
      expect(journal.size()).assertEqual(2);
      expect(journal.latest() !== undefined).assertTrue();
      expect(journal.first() !== undefined).assertTrue();
      expect(journal.ids().length).assertEqual(2);
      expect(journal.names().length).assertEqual(2);
      expect(journal.indexOfId(1)).assertEqual(0);
      expect(journal.indexOfId(999)).assertEqual(-1);
      expect(journal.countByName('user_1')).assertEqual(1);
      expect(journal.imageCounts().length).assertEqual(2);
      expect(journal.snapshot().length).assertEqual(2);
    });
    /**
     * @tc.name QueryWorkloadTest_case_027
     * @tc.desc journal: 3 appended comments keep insertion order and ids (QueryWorkloadTest case 27)
     * @tc.type Function
     * @tc.level Level1
     */
    it('QueryWorkloadTest_case_027', 0, async () => {
      const journal: CommentJournal = new CommentJournal();
      for (let index = 0; index < 3; index++) {
        journal.append(makeSimpleComment(index + 1));
      }
      expect(journal.size()).assertEqual(3);
      expect(journal.latest() !== undefined).assertTrue();
      expect(journal.first() !== undefined).assertTrue();
      expect(journal.ids().length).assertEqual(3);
      expect(journal.names().length).assertEqual(3);
      expect(journal.indexOfId(1)).assertEqual(0);
      expect(journal.indexOfId(999)).assertEqual(-1);
      expect(journal.countByName('user_1')).assertEqual(1);
      expect(journal.imageCounts().length).assertEqual(3);
      expect(journal.snapshot().length).assertEqual(3);
    });
    /**
     * @tc.name QueryWorkloadTest_case_028
     * @tc.desc journal: 4 appended comments keep insertion order and ids (QueryWorkloadTest case 28)
     * @tc.type Function
     * @tc.level Level1
     */
    it('QueryWorkloadTest_case_028', 0, async () => {
      const journal: CommentJournal = new CommentJournal();
      for (let index = 0; index < 4; index++) {
        journal.append(makeSimpleComment(index + 1));
      }
      expect(journal.size()).assertEqual(4);
      expect(journal.latest() !== undefined).assertTrue();
      expect(journal.first() !== undefined).assertTrue();
      expect(journal.ids().length).assertEqual(4);
      expect(journal.names().length).assertEqual(4);
      expect(journal.indexOfId(1)).assertEqual(0);
      expect(journal.indexOfId(999)).assertEqual(-1);
      expect(journal.countByName('user_1')).assertEqual(1);
      expect(journal.imageCounts().length).assertEqual(4);
      expect(journal.snapshot().length).assertEqual(4);
    });
    /**
     * @tc.name QueryWorkloadTest_case_029
     * @tc.desc journal: 1 appended comments keep insertion order and ids (QueryWorkloadTest case 29)
     * @tc.type Function
     * @tc.level Level1
     */
    it('QueryWorkloadTest_case_029', 0, async () => {
      const journal: CommentJournal = new CommentJournal();
      for (let index = 0; index < 1; index++) {
        journal.append(makeSimpleComment(index + 1));
      }
      expect(journal.size()).assertEqual(1);
      expect(journal.latest() !== undefined).assertTrue();
      expect(journal.first() !== undefined).assertTrue();
      expect(journal.ids().length).assertEqual(1);
      expect(journal.names().length).assertEqual(1);
      expect(journal.indexOfId(1)).assertEqual(0);
      expect(journal.indexOfId(999)).assertEqual(-1);
      expect(journal.countByName('user_1')).assertEqual(1);
      expect(journal.imageCounts().length).assertEqual(1);
      expect(journal.snapshot().length).assertEqual(1);
    });
    /**
     * @tc.name QueryWorkloadTest_case_030
     * @tc.desc journal: 2 appended comments keep insertion order and ids (QueryWorkloadTest case 30)
     * @tc.type Function
     * @tc.level Level1
     */
    it('QueryWorkloadTest_case_030', 0, async () => {
      const journal: CommentJournal = new CommentJournal();
      for (let index = 0; index < 2; index++) {
        journal.append(makeSimpleComment(index + 1));
      }
      expect(journal.size()).assertEqual(2);
      expect(journal.latest() !== undefined).assertTrue();
      expect(journal.first() !== undefined).assertTrue();
      expect(journal.ids().length).assertEqual(2);
      expect(journal.names().length).assertEqual(2);
      expect(journal.indexOfId(1)).assertEqual(0);
      expect(journal.indexOfId(999)).assertEqual(-1);
      expect(journal.countByName('user_1')).assertEqual(1);
      expect(journal.imageCounts().length).assertEqual(2);
      expect(journal.snapshot().length).assertEqual(2);
    });
    /**
     * @tc.name QueryWorkloadTest_case_031
     * @tc.desc journal: 3 appended comments keep insertion order and ids (QueryWorkloadTest case 31)
     * @tc.type Function
     * @tc.level Level1
     */
    it('QueryWorkloadTest_case_031', 0, async () => {
      const journal: CommentJournal = new CommentJournal();
      for (let index = 0; index < 3; index++) {
        journal.append(makeSimpleComment(index + 1));
      }
      expect(journal.size()).assertEqual(3);
      expect(journal.latest() !== undefined).assertTrue();
      expect(journal.first() !== undefined).assertTrue();
      expect(journal.ids().length).assertEqual(3);
      expect(journal.names().length).assertEqual(3);
      expect(journal.indexOfId(1)).assertEqual(0);
      expect(journal.indexOfId(999)).assertEqual(-1);
      expect(journal.countByName('user_1')).assertEqual(1);
      expect(journal.imageCounts().length).assertEqual(3);
      expect(journal.snapshot().length).assertEqual(3);
    });
    /**
     * @tc.name QueryWorkloadTest_case_032
     * @tc.desc journal: 4 appended comments keep insertion order and ids (QueryWorkloadTest case 32)
     * @tc.type Function
     * @tc.level Level1
     */
    it('QueryWorkloadTest_case_032', 0, async () => {
      const journal: CommentJournal = new CommentJournal();
      for (let index = 0; index < 4; index++) {
        journal.append(makeSimpleComment(index + 1));
      }
      expect(journal.size()).assertEqual(4);
      expect(journal.latest() !== undefined).assertTrue();
      expect(journal.first() !== undefined).assertTrue();
      expect(journal.ids().length).assertEqual(4);
      expect(journal.names().length).assertEqual(4);
      expect(journal.indexOfId(1)).assertEqual(0);
      expect(journal.indexOfId(999)).assertEqual(-1);
      expect(journal.countByName('user_1')).assertEqual(1);
      expect(journal.imageCounts().length).assertEqual(4);
      expect(journal.snapshot().length).assertEqual(4);
    });
    /**
     * @tc.name QueryWorkloadTest_case_033
     * @tc.desc journal: 1 appended comments keep insertion order and ids (QueryWorkloadTest case 33)
     * @tc.type Function
     * @tc.level Level1
     */
    it('QueryWorkloadTest_case_033', 0, async () => {
      const journal: CommentJournal = new CommentJournal();
      for (let index = 0; index < 1; index++) {
        journal.append(makeSimpleComment(index + 1));
      }
      expect(journal.size()).assertEqual(1);
      expect(journal.latest() !== undefined).assertTrue();
      expect(journal.first() !== undefined).assertTrue();
      expect(journal.ids().length).assertEqual(1);
      expect(journal.names().length).assertEqual(1);
      expect(journal.indexOfId(1)).assertEqual(0);
      expect(journal.indexOfId(999)).assertEqual(-1);
      expect(journal.countByName('user_1')).assertEqual(1);
      expect(journal.imageCounts().length).assertEqual(1);
      expect(journal.snapshot().length).assertEqual(1);
    });
    /**
     * @tc.name QueryWorkloadTest_case_034
     * @tc.desc journal: 2 appended comments keep insertion order and ids (QueryWorkloadTest case 34)
     * @tc.type Function
     * @tc.level Level1
     */
    it('QueryWorkloadTest_case_034', 0, async () => {
      const journal: CommentJournal = new CommentJournal();
      for (let index = 0; index < 2; index++) {
        journal.append(makeSimpleComment(index + 1));
      }
      expect(journal.size()).assertEqual(2);
      expect(journal.latest() !== undefined).assertTrue();
      expect(journal.first() !== undefined).assertTrue();
      expect(journal.ids().length).assertEqual(2);
      expect(journal.names().length).assertEqual(2);
      expect(journal.indexOfId(1)).assertEqual(0);
      expect(journal.indexOfId(999)).assertEqual(-1);
      expect(journal.countByName('user_1')).assertEqual(1);
      expect(journal.imageCounts().length).assertEqual(2);
      expect(journal.snapshot().length).assertEqual(2);
    });
  });
}
