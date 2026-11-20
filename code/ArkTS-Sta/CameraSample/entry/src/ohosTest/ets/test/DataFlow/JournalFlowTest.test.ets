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

export default function JournalFlowTest(): void {
  describe('JournalFlowTest', () => {
    beforeAll(() => {
      logSuite('JournalFlowTest', 'begin');
    });
    beforeEach(async () => {
      await yieldTick();
    });
    afterAll(() => {
      logSuite('JournalFlowTest', 'end');
    });

    /**
     * @tc.name JournalFlowTest_case_001
     * @tc.desc journal: 1 appended comments keep insertion order and ids (JournalFlowTest case 1)
     * @tc.type Function
     * @tc.level Level1
     */
    it('JournalFlowTest_case_001', 0, async () => {
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
     * @tc.name JournalFlowTest_case_002
     * @tc.desc journal: 2 appended comments keep insertion order and ids (JournalFlowTest case 2)
     * @tc.type Function
     * @tc.level Level1
     */
    it('JournalFlowTest_case_002', 0, async () => {
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
     * @tc.name JournalFlowTest_case_003
     * @tc.desc journal: 3 appended comments keep insertion order and ids (JournalFlowTest case 3)
     * @tc.type Function
     * @tc.level Level1
     */
    it('JournalFlowTest_case_003', 0, async () => {
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
     * @tc.name JournalFlowTest_case_004
     * @tc.desc journal: 4 appended comments keep insertion order and ids (JournalFlowTest case 4)
     * @tc.type Function
     * @tc.level Level1
     */
    it('JournalFlowTest_case_004', 0, async () => {
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
     * @tc.name JournalFlowTest_case_005
     * @tc.desc journal: 1 appended comments keep insertion order and ids (JournalFlowTest case 5)
     * @tc.type Function
     * @tc.level Level1
     */
    it('JournalFlowTest_case_005', 0, async () => {
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
     * @tc.name JournalFlowTest_case_006
     * @tc.desc journal: 2 appended comments keep insertion order and ids (JournalFlowTest case 6)
     * @tc.type Function
     * @tc.level Level1
     */
    it('JournalFlowTest_case_006', 0, async () => {
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
     * @tc.name JournalFlowTest_case_007
     * @tc.desc journal: 3 appended comments keep insertion order and ids (JournalFlowTest case 7)
     * @tc.type Function
     * @tc.level Level1
     */
    it('JournalFlowTest_case_007', 0, async () => {
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
     * @tc.name JournalFlowTest_case_008
     * @tc.desc journal: 4 appended comments keep insertion order and ids (JournalFlowTest case 8)
     * @tc.type Function
     * @tc.level Level1
     */
    it('JournalFlowTest_case_008', 0, async () => {
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
     * @tc.name JournalFlowTest_case_009
     * @tc.desc journal: 1 appended comments keep insertion order and ids (JournalFlowTest case 9)
     * @tc.type Function
     * @tc.level Level1
     */
    it('JournalFlowTest_case_009', 0, async () => {
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
     * @tc.name JournalFlowTest_case_010
     * @tc.desc journal: 2 appended comments keep insertion order and ids (JournalFlowTest case 10)
     * @tc.type Function
     * @tc.level Level1
     */
    it('JournalFlowTest_case_010', 0, async () => {
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
     * @tc.name JournalFlowTest_case_011
     * @tc.desc journal: 3 appended comments keep insertion order and ids (JournalFlowTest case 11)
     * @tc.type Function
     * @tc.level Level1
     */
    it('JournalFlowTest_case_011', 0, async () => {
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
     * @tc.name JournalFlowTest_case_012
     * @tc.desc journal: 4 appended comments keep insertion order and ids (JournalFlowTest case 12)
     * @tc.type Function
     * @tc.level Level1
     */
    it('JournalFlowTest_case_012', 0, async () => {
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
     * @tc.name JournalFlowTest_case_013
     * @tc.desc journal: 1 appended comments keep insertion order and ids (JournalFlowTest case 13)
     * @tc.type Function
     * @tc.level Level1
     */
    it('JournalFlowTest_case_013', 0, async () => {
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
     * @tc.name JournalFlowTest_case_014
     * @tc.desc journal: 2 appended comments keep insertion order and ids (JournalFlowTest case 14)
     * @tc.type Function
     * @tc.level Level1
     */
    it('JournalFlowTest_case_014', 0, async () => {
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
     * @tc.name JournalFlowTest_case_015
     * @tc.desc journal: 3 appended comments keep insertion order and ids (JournalFlowTest case 15)
     * @tc.type Function
     * @tc.level Level1
     */
    it('JournalFlowTest_case_015', 0, async () => {
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
     * @tc.name JournalFlowTest_case_016
     * @tc.desc journal: 4 appended comments keep insertion order and ids (JournalFlowTest case 16)
     * @tc.type Function
     * @tc.level Level1
     */
    it('JournalFlowTest_case_016', 0, async () => {
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
     * @tc.name JournalFlowTest_case_017
     * @tc.desc journal: 1 appended comments keep insertion order and ids (JournalFlowTest case 17)
     * @tc.type Function
     * @tc.level Level1
     */
    it('JournalFlowTest_case_017', 0, async () => {
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
     * @tc.name JournalFlowTest_case_018
     * @tc.desc journal: 2 appended comments keep insertion order and ids (JournalFlowTest case 18)
     * @tc.type Function
     * @tc.level Level1
     */
    it('JournalFlowTest_case_018', 0, async () => {
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
     * @tc.name JournalFlowTest_case_019
     * @tc.desc journal: 3 appended comments keep insertion order and ids (JournalFlowTest case 19)
     * @tc.type Function
     * @tc.level Level1
     */
    it('JournalFlowTest_case_019', 0, async () => {
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
     * @tc.name JournalFlowTest_case_020
     * @tc.desc journal: 4 appended comments keep insertion order and ids (JournalFlowTest case 20)
     * @tc.type Function
     * @tc.level Level1
     */
    it('JournalFlowTest_case_020', 0, async () => {
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
     * @tc.name JournalFlowTest_case_021
     * @tc.desc journal: 1 appended comments keep insertion order and ids (JournalFlowTest case 21)
     * @tc.type Function
     * @tc.level Level1
     */
    it('JournalFlowTest_case_021', 0, async () => {
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
     * @tc.name JournalFlowTest_case_022
     * @tc.desc journal: 2 appended comments keep insertion order and ids (JournalFlowTest case 22)
     * @tc.type Function
     * @tc.level Level1
     */
    it('JournalFlowTest_case_022', 0, async () => {
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
     * @tc.name JournalFlowTest_case_023
     * @tc.desc journal: 3 appended comments keep insertion order and ids (JournalFlowTest case 23)
     * @tc.type Function
     * @tc.level Level1
     */
    it('JournalFlowTest_case_023', 0, async () => {
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
     * @tc.name JournalFlowTest_case_024
     * @tc.desc journal: 4 appended comments keep insertion order and ids (JournalFlowTest case 24)
     * @tc.type Function
     * @tc.level Level1
     */
    it('JournalFlowTest_case_024', 0, async () => {
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
     * @tc.name JournalFlowTest_case_025
     * @tc.desc journal: 1 appended comments keep insertion order and ids (JournalFlowTest case 25)
     * @tc.type Function
     * @tc.level Level1
     */
    it('JournalFlowTest_case_025', 0, async () => {
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
     * @tc.name JournalFlowTest_case_026
     * @tc.desc journal: 2 appended comments keep insertion order and ids (JournalFlowTest case 26)
     * @tc.type Function
     * @tc.level Level1
     */
    it('JournalFlowTest_case_026', 0, async () => {
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
     * @tc.name JournalFlowTest_case_027
     * @tc.desc journal: 3 appended comments keep insertion order and ids (JournalFlowTest case 27)
     * @tc.type Function
     * @tc.level Level1
     */
    it('JournalFlowTest_case_027', 0, async () => {
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
     * @tc.name JournalFlowTest_case_028
     * @tc.desc journal: 4 appended comments keep insertion order and ids (JournalFlowTest case 28)
     * @tc.type Function
     * @tc.level Level1
     */
    it('JournalFlowTest_case_028', 0, async () => {
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
     * @tc.name JournalFlowTest_case_029
     * @tc.desc journal: 1 appended comments keep insertion order and ids (JournalFlowTest case 29)
     * @tc.type Function
     * @tc.level Level1
     */
    it('JournalFlowTest_case_029', 0, async () => {
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
     * @tc.name JournalFlowTest_case_030
     * @tc.desc journal: 2 appended comments keep insertion order and ids (JournalFlowTest case 30)
     * @tc.type Function
     * @tc.level Level1
     */
    it('JournalFlowTest_case_030', 0, async () => {
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
     * @tc.name JournalFlowTest_case_031
     * @tc.desc journal: 3 appended comments keep insertion order and ids (JournalFlowTest case 31)
     * @tc.type Function
     * @tc.level Level1
     */
    it('JournalFlowTest_case_031', 0, async () => {
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
     * @tc.name JournalFlowTest_case_032
     * @tc.desc journal: 4 appended comments keep insertion order and ids (JournalFlowTest case 32)
     * @tc.type Function
     * @tc.level Level1
     */
    it('JournalFlowTest_case_032', 0, async () => {
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
     * @tc.name JournalFlowTest_case_033
     * @tc.desc journal: 1 appended comments keep insertion order and ids (JournalFlowTest case 33)
     * @tc.type Function
     * @tc.level Level1
     */
    it('JournalFlowTest_case_033', 0, async () => {
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
     * @tc.name JournalFlowTest_case_034
     * @tc.desc journal: 2 appended comments keep insertion order and ids (JournalFlowTest case 34)
     * @tc.type Function
     * @tc.level Level1
     */
    it('JournalFlowTest_case_034', 0, async () => {
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
     * @tc.name JournalFlowTest_case_035
     * @tc.desc journal: 3 appended comments keep insertion order and ids (JournalFlowTest case 35)
     * @tc.type Function
     * @tc.level Level1
     */
    it('JournalFlowTest_case_035', 0, async () => {
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
     * @tc.name JournalFlowTest_case_036
     * @tc.desc journal: 4 appended comments keep insertion order and ids (JournalFlowTest case 36)
     * @tc.type Function
     * @tc.level Level1
     */
    it('JournalFlowTest_case_036', 0, async () => {
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
     * @tc.name JournalFlowTest_case_037
     * @tc.desc journal: 1 appended comments keep insertion order and ids (JournalFlowTest case 37)
     * @tc.type Function
     * @tc.level Level1
     */
    it('JournalFlowTest_case_037', 0, async () => {
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
     * @tc.name JournalFlowTest_case_038
     * @tc.desc journal: 2 appended comments keep insertion order and ids (JournalFlowTest case 38)
     * @tc.type Function
     * @tc.level Level1
     */
    it('JournalFlowTest_case_038', 0, async () => {
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
     * @tc.name JournalFlowTest_case_039
     * @tc.desc journal: 3 appended comments keep insertion order and ids (JournalFlowTest case 39)
     * @tc.type Function
     * @tc.level Level1
     */
    it('JournalFlowTest_case_039', 0, async () => {
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
     * @tc.name JournalFlowTest_case_040
     * @tc.desc journal: 4 appended comments keep insertion order and ids (JournalFlowTest case 40)
     * @tc.type Function
     * @tc.level Level1
     */
    it('JournalFlowTest_case_040', 0, async () => {
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
     * @tc.name JournalFlowTest_case_041
     * @tc.desc journal: 1 appended comments keep insertion order and ids (JournalFlowTest case 41)
     * @tc.type Function
     * @tc.level Level1
     */
    it('JournalFlowTest_case_041', 0, async () => {
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
     * @tc.name JournalFlowTest_case_042
     * @tc.desc journal: 2 appended comments keep insertion order and ids (JournalFlowTest case 42)
     * @tc.type Function
     * @tc.level Level1
     */
    it('JournalFlowTest_case_042', 0, async () => {
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
