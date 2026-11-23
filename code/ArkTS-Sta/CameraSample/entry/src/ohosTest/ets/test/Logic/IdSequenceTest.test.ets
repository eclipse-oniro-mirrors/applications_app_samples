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

export default function IdSequenceTest(): void {
  describe('IdSequenceTest', () => {
    beforeAll(() => {
      logSuite('IdSequenceTest', 'begin');
    });
    beforeEach(async () => {
      await yieldTick();
    });
    afterAll(() => {
      logSuite('IdSequenceTest', 'end');
    });

    /**
     * @tc.name IdSequenceTest_case_001
     * @tc.desc sequence: id generator hands out increasing unique values from 1 (IdSequenceTest case 1)
     * @tc.type Function
     * @tc.level Level1
     */
    it('IdSequenceTest_case_001', 0, async () => {
      const sequence: IdSequence = new IdSequence(1);
      expect(sequence.peekNext()).assertEqual(1);
      expect(sequence.next()).assertEqual(1);
      expect(sequence.next()).assertEqual(2);
      expect(sequence.peekNext()).assertEqual(3);
      sequence.reset(100);
      expect(sequence.next()).assertEqual(100);
      expect(sequence.next()).assertEqual(101);
      const seen: number[] = [];
      for (let index = 0; index < 5; index++) {
        seen.push(sequence.next());
      }
      expect(seen.length).assertEqual(5);
      expect(seen[0] === seen[1]).assertFalse();
    });
    /**
     * @tc.name IdSequenceTest_case_002
     * @tc.desc sequence: id generator hands out increasing unique values from 2 (IdSequenceTest case 2)
     * @tc.type Function
     * @tc.level Level1
     */
    it('IdSequenceTest_case_002', 0, async () => {
      const sequence: IdSequence = new IdSequence(2);
      expect(sequence.peekNext()).assertEqual(2);
      expect(sequence.next()).assertEqual(2);
      expect(sequence.next()).assertEqual(3);
      expect(sequence.peekNext()).assertEqual(4);
      sequence.reset(100);
      expect(sequence.next()).assertEqual(100);
      expect(sequence.next()).assertEqual(101);
      const seen: number[] = [];
      for (let index = 0; index < 5; index++) {
        seen.push(sequence.next());
      }
      expect(seen.length).assertEqual(5);
      expect(seen[0] === seen[1]).assertFalse();
    });
    /**
     * @tc.name IdSequenceTest_case_003
     * @tc.desc sequence: id generator hands out increasing unique values from 3 (IdSequenceTest case 3)
     * @tc.type Function
     * @tc.level Level1
     */
    it('IdSequenceTest_case_003', 0, async () => {
      const sequence: IdSequence = new IdSequence(3);
      expect(sequence.peekNext()).assertEqual(3);
      expect(sequence.next()).assertEqual(3);
      expect(sequence.next()).assertEqual(4);
      expect(sequence.peekNext()).assertEqual(5);
      sequence.reset(100);
      expect(sequence.next()).assertEqual(100);
      expect(sequence.next()).assertEqual(101);
      const seen: number[] = [];
      for (let index = 0; index < 5; index++) {
        seen.push(sequence.next());
      }
      expect(seen.length).assertEqual(5);
      expect(seen[0] === seen[1]).assertFalse();
    });
    /**
     * @tc.name IdSequenceTest_case_004
     * @tc.desc sequence: id generator hands out increasing unique values from 4 (IdSequenceTest case 4)
     * @tc.type Function
     * @tc.level Level1
     */
    it('IdSequenceTest_case_004', 0, async () => {
      const sequence: IdSequence = new IdSequence(4);
      expect(sequence.peekNext()).assertEqual(4);
      expect(sequence.next()).assertEqual(4);
      expect(sequence.next()).assertEqual(5);
      expect(sequence.peekNext()).assertEqual(6);
      sequence.reset(100);
      expect(sequence.next()).assertEqual(100);
      expect(sequence.next()).assertEqual(101);
      const seen: number[] = [];
      for (let index = 0; index < 5; index++) {
        seen.push(sequence.next());
      }
      expect(seen.length).assertEqual(5);
      expect(seen[0] === seen[1]).assertFalse();
    });
    /**
     * @tc.name IdSequenceTest_case_005
     * @tc.desc sequence: id generator hands out increasing unique values from 5 (IdSequenceTest case 5)
     * @tc.type Function
     * @tc.level Level1
     */
    it('IdSequenceTest_case_005', 0, async () => {
      const sequence: IdSequence = new IdSequence(5);
      expect(sequence.peekNext()).assertEqual(5);
      expect(sequence.next()).assertEqual(5);
      expect(sequence.next()).assertEqual(6);
      expect(sequence.peekNext()).assertEqual(7);
      sequence.reset(100);
      expect(sequence.next()).assertEqual(100);
      expect(sequence.next()).assertEqual(101);
      const seen: number[] = [];
      for (let index = 0; index < 5; index++) {
        seen.push(sequence.next());
      }
      expect(seen.length).assertEqual(5);
      expect(seen[0] === seen[1]).assertFalse();
    });
    /**
     * @tc.name IdSequenceTest_case_006
     * @tc.desc sequence: id generator hands out increasing unique values from 6 (IdSequenceTest case 6)
     * @tc.type Function
     * @tc.level Level1
     */
    it('IdSequenceTest_case_006', 0, async () => {
      const sequence: IdSequence = new IdSequence(6);
      expect(sequence.peekNext()).assertEqual(6);
      expect(sequence.next()).assertEqual(6);
      expect(sequence.next()).assertEqual(7);
      expect(sequence.peekNext()).assertEqual(8);
      sequence.reset(100);
      expect(sequence.next()).assertEqual(100);
      expect(sequence.next()).assertEqual(101);
      const seen: number[] = [];
      for (let index = 0; index < 5; index++) {
        seen.push(sequence.next());
      }
      expect(seen.length).assertEqual(5);
      expect(seen[0] === seen[1]).assertFalse();
    });
    /**
     * @tc.name IdSequenceTest_case_007
     * @tc.desc sequence: id generator hands out increasing unique values from 7 (IdSequenceTest case 7)
     * @tc.type Function
     * @tc.level Level1
     */
    it('IdSequenceTest_case_007', 0, async () => {
      const sequence: IdSequence = new IdSequence(7);
      expect(sequence.peekNext()).assertEqual(7);
      expect(sequence.next()).assertEqual(7);
      expect(sequence.next()).assertEqual(8);
      expect(sequence.peekNext()).assertEqual(9);
      sequence.reset(100);
      expect(sequence.next()).assertEqual(100);
      expect(sequence.next()).assertEqual(101);
      const seen: number[] = [];
      for (let index = 0; index < 5; index++) {
        seen.push(sequence.next());
      }
      expect(seen.length).assertEqual(5);
      expect(seen[0] === seen[1]).assertFalse();
    });
    /**
     * @tc.name IdSequenceTest_case_008
     * @tc.desc sequence: id generator hands out increasing unique values from 8 (IdSequenceTest case 8)
     * @tc.type Function
     * @tc.level Level1
     */
    it('IdSequenceTest_case_008', 0, async () => {
      const sequence: IdSequence = new IdSequence(8);
      expect(sequence.peekNext()).assertEqual(8);
      expect(sequence.next()).assertEqual(8);
      expect(sequence.next()).assertEqual(9);
      expect(sequence.peekNext()).assertEqual(10);
      sequence.reset(100);
      expect(sequence.next()).assertEqual(100);
      expect(sequence.next()).assertEqual(101);
      const seen: number[] = [];
      for (let index = 0; index < 5; index++) {
        seen.push(sequence.next());
      }
      expect(seen.length).assertEqual(5);
      expect(seen[0] === seen[1]).assertFalse();
    });
    /**
     * @tc.name IdSequenceTest_case_009
     * @tc.desc sequence: id generator hands out increasing unique values from 9 (IdSequenceTest case 9)
     * @tc.type Function
     * @tc.level Level1
     */
    it('IdSequenceTest_case_009', 0, async () => {
      const sequence: IdSequence = new IdSequence(9);
      expect(sequence.peekNext()).assertEqual(9);
      expect(sequence.next()).assertEqual(9);
      expect(sequence.next()).assertEqual(10);
      expect(sequence.peekNext()).assertEqual(11);
      sequence.reset(100);
      expect(sequence.next()).assertEqual(100);
      expect(sequence.next()).assertEqual(101);
      const seen: number[] = [];
      for (let index = 0; index < 5; index++) {
        seen.push(sequence.next());
      }
      expect(seen.length).assertEqual(5);
      expect(seen[0] === seen[1]).assertFalse();
    });
    /**
     * @tc.name IdSequenceTest_case_010
     * @tc.desc sequence: id generator hands out increasing unique values from 10 (IdSequenceTest case 10)
     * @tc.type Function
     * @tc.level Level1
     */
    it('IdSequenceTest_case_010', 0, async () => {
      const sequence: IdSequence = new IdSequence(10);
      expect(sequence.peekNext()).assertEqual(10);
      expect(sequence.next()).assertEqual(10);
      expect(sequence.next()).assertEqual(11);
      expect(sequence.peekNext()).assertEqual(12);
      sequence.reset(100);
      expect(sequence.next()).assertEqual(100);
      expect(sequence.next()).assertEqual(101);
      const seen: number[] = [];
      for (let index = 0; index < 5; index++) {
        seen.push(sequence.next());
      }
      expect(seen.length).assertEqual(5);
      expect(seen[0] === seen[1]).assertFalse();
    });
    /**
     * @tc.name IdSequenceTest_case_011
     * @tc.desc sequence: id generator hands out increasing unique values from 11 (IdSequenceTest case 11)
     * @tc.type Function
     * @tc.level Level1
     */
    it('IdSequenceTest_case_011', 0, async () => {
      const sequence: IdSequence = new IdSequence(11);
      expect(sequence.peekNext()).assertEqual(11);
      expect(sequence.next()).assertEqual(11);
      expect(sequence.next()).assertEqual(12);
      expect(sequence.peekNext()).assertEqual(13);
      sequence.reset(100);
      expect(sequence.next()).assertEqual(100);
      expect(sequence.next()).assertEqual(101);
      const seen: number[] = [];
      for (let index = 0; index < 5; index++) {
        seen.push(sequence.next());
      }
      expect(seen.length).assertEqual(5);
      expect(seen[0] === seen[1]).assertFalse();
    });
    /**
     * @tc.name IdSequenceTest_case_012
     * @tc.desc sequence: id generator hands out increasing unique values from 12 (IdSequenceTest case 12)
     * @tc.type Function
     * @tc.level Level1
     */
    it('IdSequenceTest_case_012', 0, async () => {
      const sequence: IdSequence = new IdSequence(12);
      expect(sequence.peekNext()).assertEqual(12);
      expect(sequence.next()).assertEqual(12);
      expect(sequence.next()).assertEqual(13);
      expect(sequence.peekNext()).assertEqual(14);
      sequence.reset(100);
      expect(sequence.next()).assertEqual(100);
      expect(sequence.next()).assertEqual(101);
      const seen: number[] = [];
      for (let index = 0; index < 5; index++) {
        seen.push(sequence.next());
      }
      expect(seen.length).assertEqual(5);
      expect(seen[0] === seen[1]).assertFalse();
    });
    /**
     * @tc.name IdSequenceTest_case_013
     * @tc.desc sequence: id generator hands out increasing unique values from 13 (IdSequenceTest case 13)
     * @tc.type Function
     * @tc.level Level1
     */
    it('IdSequenceTest_case_013', 0, async () => {
      const sequence: IdSequence = new IdSequence(13);
      expect(sequence.peekNext()).assertEqual(13);
      expect(sequence.next()).assertEqual(13);
      expect(sequence.next()).assertEqual(14);
      expect(sequence.peekNext()).assertEqual(15);
      sequence.reset(100);
      expect(sequence.next()).assertEqual(100);
      expect(sequence.next()).assertEqual(101);
      const seen: number[] = [];
      for (let index = 0; index < 5; index++) {
        seen.push(sequence.next());
      }
      expect(seen.length).assertEqual(5);
      expect(seen[0] === seen[1]).assertFalse();
    });
    /**
     * @tc.name IdSequenceTest_case_014
     * @tc.desc sequence: id generator hands out increasing unique values from 14 (IdSequenceTest case 14)
     * @tc.type Function
     * @tc.level Level1
     */
    it('IdSequenceTest_case_014', 0, async () => {
      const sequence: IdSequence = new IdSequence(14);
      expect(sequence.peekNext()).assertEqual(14);
      expect(sequence.next()).assertEqual(14);
      expect(sequence.next()).assertEqual(15);
      expect(sequence.peekNext()).assertEqual(16);
      sequence.reset(100);
      expect(sequence.next()).assertEqual(100);
      expect(sequence.next()).assertEqual(101);
      const seen: number[] = [];
      for (let index = 0; index < 5; index++) {
        seen.push(sequence.next());
      }
      expect(seen.length).assertEqual(5);
      expect(seen[0] === seen[1]).assertFalse();
    });
    /**
     * @tc.name IdSequenceTest_case_015
     * @tc.desc sequence: id generator hands out increasing unique values from 15 (IdSequenceTest case 15)
     * @tc.type Function
     * @tc.level Level1
     */
    it('IdSequenceTest_case_015', 0, async () => {
      const sequence: IdSequence = new IdSequence(15);
      expect(sequence.peekNext()).assertEqual(15);
      expect(sequence.next()).assertEqual(15);
      expect(sequence.next()).assertEqual(16);
      expect(sequence.peekNext()).assertEqual(17);
      sequence.reset(100);
      expect(sequence.next()).assertEqual(100);
      expect(sequence.next()).assertEqual(101);
      const seen: number[] = [];
      for (let index = 0; index < 5; index++) {
        seen.push(sequence.next());
      }
      expect(seen.length).assertEqual(5);
      expect(seen[0] === seen[1]).assertFalse();
    });
    /**
     * @tc.name IdSequenceTest_case_016
     * @tc.desc sequence: id generator hands out increasing unique values from 16 (IdSequenceTest case 16)
     * @tc.type Function
     * @tc.level Level1
     */
    it('IdSequenceTest_case_016', 0, async () => {
      const sequence: IdSequence = new IdSequence(16);
      expect(sequence.peekNext()).assertEqual(16);
      expect(sequence.next()).assertEqual(16);
      expect(sequence.next()).assertEqual(17);
      expect(sequence.peekNext()).assertEqual(18);
      sequence.reset(100);
      expect(sequence.next()).assertEqual(100);
      expect(sequence.next()).assertEqual(101);
      const seen: number[] = [];
      for (let index = 0; index < 5; index++) {
        seen.push(sequence.next());
      }
      expect(seen.length).assertEqual(5);
      expect(seen[0] === seen[1]).assertFalse();
    });
    /**
     * @tc.name IdSequenceTest_case_017
     * @tc.desc sequence: id generator hands out increasing unique values from 17 (IdSequenceTest case 17)
     * @tc.type Function
     * @tc.level Level1
     */
    it('IdSequenceTest_case_017', 0, async () => {
      const sequence: IdSequence = new IdSequence(17);
      expect(sequence.peekNext()).assertEqual(17);
      expect(sequence.next()).assertEqual(17);
      expect(sequence.next()).assertEqual(18);
      expect(sequence.peekNext()).assertEqual(19);
      sequence.reset(100);
      expect(sequence.next()).assertEqual(100);
      expect(sequence.next()).assertEqual(101);
      const seen: number[] = [];
      for (let index = 0; index < 5; index++) {
        seen.push(sequence.next());
      }
      expect(seen.length).assertEqual(5);
      expect(seen[0] === seen[1]).assertFalse();
    });
    /**
     * @tc.name IdSequenceTest_case_018
     * @tc.desc sequence: id generator hands out increasing unique values from 18 (IdSequenceTest case 18)
     * @tc.type Function
     * @tc.level Level1
     */
    it('IdSequenceTest_case_018', 0, async () => {
      const sequence: IdSequence = new IdSequence(18);
      expect(sequence.peekNext()).assertEqual(18);
      expect(sequence.next()).assertEqual(18);
      expect(sequence.next()).assertEqual(19);
      expect(sequence.peekNext()).assertEqual(20);
      sequence.reset(100);
      expect(sequence.next()).assertEqual(100);
      expect(sequence.next()).assertEqual(101);
      const seen: number[] = [];
      for (let index = 0; index < 5; index++) {
        seen.push(sequence.next());
      }
      expect(seen.length).assertEqual(5);
      expect(seen[0] === seen[1]).assertFalse();
    });
    /**
     * @tc.name IdSequenceTest_case_019
     * @tc.desc sequence: id generator hands out increasing unique values from 19 (IdSequenceTest case 19)
     * @tc.type Function
     * @tc.level Level1
     */
    it('IdSequenceTest_case_019', 0, async () => {
      const sequence: IdSequence = new IdSequence(19);
      expect(sequence.peekNext()).assertEqual(19);
      expect(sequence.next()).assertEqual(19);
      expect(sequence.next()).assertEqual(20);
      expect(sequence.peekNext()).assertEqual(21);
      sequence.reset(100);
      expect(sequence.next()).assertEqual(100);
      expect(sequence.next()).assertEqual(101);
      const seen: number[] = [];
      for (let index = 0; index < 5; index++) {
        seen.push(sequence.next());
      }
      expect(seen.length).assertEqual(5);
      expect(seen[0] === seen[1]).assertFalse();
    });
    /**
     * @tc.name IdSequenceTest_case_020
     * @tc.desc sequence: id generator hands out increasing unique values from 20 (IdSequenceTest case 20)
     * @tc.type Function
     * @tc.level Level1
     */
    it('IdSequenceTest_case_020', 0, async () => {
      const sequence: IdSequence = new IdSequence(20);
      expect(sequence.peekNext()).assertEqual(20);
      expect(sequence.next()).assertEqual(20);
      expect(sequence.next()).assertEqual(21);
      expect(sequence.peekNext()).assertEqual(22);
      sequence.reset(100);
      expect(sequence.next()).assertEqual(100);
      expect(sequence.next()).assertEqual(101);
      const seen: number[] = [];
      for (let index = 0; index < 5; index++) {
        seen.push(sequence.next());
      }
      expect(seen.length).assertEqual(5);
      expect(seen[0] === seen[1]).assertFalse();
    });
    /**
     * @tc.name IdSequenceTest_case_021
     * @tc.desc sequence: id generator hands out increasing unique values from 21 (IdSequenceTest case 21)
     * @tc.type Function
     * @tc.level Level1
     */
    it('IdSequenceTest_case_021', 0, async () => {
      const sequence: IdSequence = new IdSequence(21);
      expect(sequence.peekNext()).assertEqual(21);
      expect(sequence.next()).assertEqual(21);
      expect(sequence.next()).assertEqual(22);
      expect(sequence.peekNext()).assertEqual(23);
      sequence.reset(100);
      expect(sequence.next()).assertEqual(100);
      expect(sequence.next()).assertEqual(101);
      const seen: number[] = [];
      for (let index = 0; index < 5; index++) {
        seen.push(sequence.next());
      }
      expect(seen.length).assertEqual(5);
      expect(seen[0] === seen[1]).assertFalse();
    });
    /**
     * @tc.name IdSequenceTest_case_022
     * @tc.desc sequence: id generator hands out increasing unique values from 22 (IdSequenceTest case 22)
     * @tc.type Function
     * @tc.level Level1
     */
    it('IdSequenceTest_case_022', 0, async () => {
      const sequence: IdSequence = new IdSequence(22);
      expect(sequence.peekNext()).assertEqual(22);
      expect(sequence.next()).assertEqual(22);
      expect(sequence.next()).assertEqual(23);
      expect(sequence.peekNext()).assertEqual(24);
      sequence.reset(100);
      expect(sequence.next()).assertEqual(100);
      expect(sequence.next()).assertEqual(101);
      const seen: number[] = [];
      for (let index = 0; index < 5; index++) {
        seen.push(sequence.next());
      }
      expect(seen.length).assertEqual(5);
      expect(seen[0] === seen[1]).assertFalse();
    });
    /**
     * @tc.name IdSequenceTest_case_023
     * @tc.desc sequence: id generator hands out increasing unique values from 23 (IdSequenceTest case 23)
     * @tc.type Function
     * @tc.level Level1
     */
    it('IdSequenceTest_case_023', 0, async () => {
      const sequence: IdSequence = new IdSequence(23);
      expect(sequence.peekNext()).assertEqual(23);
      expect(sequence.next()).assertEqual(23);
      expect(sequence.next()).assertEqual(24);
      expect(sequence.peekNext()).assertEqual(25);
      sequence.reset(100);
      expect(sequence.next()).assertEqual(100);
      expect(sequence.next()).assertEqual(101);
      const seen: number[] = [];
      for (let index = 0; index < 5; index++) {
        seen.push(sequence.next());
      }
      expect(seen.length).assertEqual(5);
      expect(seen[0] === seen[1]).assertFalse();
    });
    /**
     * @tc.name IdSequenceTest_case_024
     * @tc.desc sequence: id generator hands out increasing unique values from 24 (IdSequenceTest case 24)
     * @tc.type Function
     * @tc.level Level1
     */
    it('IdSequenceTest_case_024', 0, async () => {
      const sequence: IdSequence = new IdSequence(24);
      expect(sequence.peekNext()).assertEqual(24);
      expect(sequence.next()).assertEqual(24);
      expect(sequence.next()).assertEqual(25);
      expect(sequence.peekNext()).assertEqual(26);
      sequence.reset(100);
      expect(sequence.next()).assertEqual(100);
      expect(sequence.next()).assertEqual(101);
      const seen: number[] = [];
      for (let index = 0; index < 5; index++) {
        seen.push(sequence.next());
      }
      expect(seen.length).assertEqual(5);
      expect(seen[0] === seen[1]).assertFalse();
    });
    /**
     * @tc.name IdSequenceTest_case_025
     * @tc.desc sequence: id generator hands out increasing unique values from 25 (IdSequenceTest case 25)
     * @tc.type Function
     * @tc.level Level1
     */
    it('IdSequenceTest_case_025', 0, async () => {
      const sequence: IdSequence = new IdSequence(25);
      expect(sequence.peekNext()).assertEqual(25);
      expect(sequence.next()).assertEqual(25);
      expect(sequence.next()).assertEqual(26);
      expect(sequence.peekNext()).assertEqual(27);
      sequence.reset(100);
      expect(sequence.next()).assertEqual(100);
      expect(sequence.next()).assertEqual(101);
      const seen: number[] = [];
      for (let index = 0; index < 5; index++) {
        seen.push(sequence.next());
      }
      expect(seen.length).assertEqual(5);
      expect(seen[0] === seen[1]).assertFalse();
    });
    /**
     * @tc.name IdSequenceTest_case_026
     * @tc.desc sequence: id generator hands out increasing unique values from 26 (IdSequenceTest case 26)
     * @tc.type Function
     * @tc.level Level1
     */
    it('IdSequenceTest_case_026', 0, async () => {
      const sequence: IdSequence = new IdSequence(26);
      expect(sequence.peekNext()).assertEqual(26);
      expect(sequence.next()).assertEqual(26);
      expect(sequence.next()).assertEqual(27);
      expect(sequence.peekNext()).assertEqual(28);
      sequence.reset(100);
      expect(sequence.next()).assertEqual(100);
      expect(sequence.next()).assertEqual(101);
      const seen: number[] = [];
      for (let index = 0; index < 5; index++) {
        seen.push(sequence.next());
      }
      expect(seen.length).assertEqual(5);
      expect(seen[0] === seen[1]).assertFalse();
    });
    /**
     * @tc.name IdSequenceTest_case_027
     * @tc.desc sequence: id generator hands out increasing unique values from 27 (IdSequenceTest case 27)
     * @tc.type Function
     * @tc.level Level1
     */
    it('IdSequenceTest_case_027', 0, async () => {
      const sequence: IdSequence = new IdSequence(27);
      expect(sequence.peekNext()).assertEqual(27);
      expect(sequence.next()).assertEqual(27);
      expect(sequence.next()).assertEqual(28);
      expect(sequence.peekNext()).assertEqual(29);
      sequence.reset(100);
      expect(sequence.next()).assertEqual(100);
      expect(sequence.next()).assertEqual(101);
      const seen: number[] = [];
      for (let index = 0; index < 5; index++) {
        seen.push(sequence.next());
      }
      expect(seen.length).assertEqual(5);
      expect(seen[0] === seen[1]).assertFalse();
    });
    /**
     * @tc.name IdSequenceTest_case_028
     * @tc.desc sequence: id generator hands out increasing unique values from 28 (IdSequenceTest case 28)
     * @tc.type Function
     * @tc.level Level1
     */
    it('IdSequenceTest_case_028', 0, async () => {
      const sequence: IdSequence = new IdSequence(28);
      expect(sequence.peekNext()).assertEqual(28);
      expect(sequence.next()).assertEqual(28);
      expect(sequence.next()).assertEqual(29);
      expect(sequence.peekNext()).assertEqual(30);
      sequence.reset(100);
      expect(sequence.next()).assertEqual(100);
      expect(sequence.next()).assertEqual(101);
      const seen: number[] = [];
      for (let index = 0; index < 5; index++) {
        seen.push(sequence.next());
      }
      expect(seen.length).assertEqual(5);
      expect(seen[0] === seen[1]).assertFalse();
    });
    /**
     * @tc.name IdSequenceTest_case_029
     * @tc.desc sequence: id generator hands out increasing unique values from 29 (IdSequenceTest case 29)
     * @tc.type Function
     * @tc.level Level1
     */
    it('IdSequenceTest_case_029', 0, async () => {
      const sequence: IdSequence = new IdSequence(29);
      expect(sequence.peekNext()).assertEqual(29);
      expect(sequence.next()).assertEqual(29);
      expect(sequence.next()).assertEqual(30);
      expect(sequence.peekNext()).assertEqual(31);
      sequence.reset(100);
      expect(sequence.next()).assertEqual(100);
      expect(sequence.next()).assertEqual(101);
      const seen: number[] = [];
      for (let index = 0; index < 5; index++) {
        seen.push(sequence.next());
      }
      expect(seen.length).assertEqual(5);
      expect(seen[0] === seen[1]).assertFalse();
    });
    /**
     * @tc.name IdSequenceTest_case_030
     * @tc.desc sequence: id generator hands out increasing unique values from 30 (IdSequenceTest case 30)
     * @tc.type Function
     * @tc.level Level1
     */
    it('IdSequenceTest_case_030', 0, async () => {
      const sequence: IdSequence = new IdSequence(30);
      expect(sequence.peekNext()).assertEqual(30);
      expect(sequence.next()).assertEqual(30);
      expect(sequence.next()).assertEqual(31);
      expect(sequence.peekNext()).assertEqual(32);
      sequence.reset(100);
      expect(sequence.next()).assertEqual(100);
      expect(sequence.next()).assertEqual(101);
      const seen: number[] = [];
      for (let index = 0; index < 5; index++) {
        seen.push(sequence.next());
      }
      expect(seen.length).assertEqual(5);
      expect(seen[0] === seen[1]).assertFalse();
    });
    /**
     * @tc.name IdSequenceTest_case_031
     * @tc.desc sequence: id generator hands out increasing unique values from 31 (IdSequenceTest case 31)
     * @tc.type Function
     * @tc.level Level1
     */
    it('IdSequenceTest_case_031', 0, async () => {
      const sequence: IdSequence = new IdSequence(31);
      expect(sequence.peekNext()).assertEqual(31);
      expect(sequence.next()).assertEqual(31);
      expect(sequence.next()).assertEqual(32);
      expect(sequence.peekNext()).assertEqual(33);
      sequence.reset(100);
      expect(sequence.next()).assertEqual(100);
      expect(sequence.next()).assertEqual(101);
      const seen: number[] = [];
      for (let index = 0; index < 5; index++) {
        seen.push(sequence.next());
      }
      expect(seen.length).assertEqual(5);
      expect(seen[0] === seen[1]).assertFalse();
    });
    /**
     * @tc.name IdSequenceTest_case_032
     * @tc.desc sequence: id generator hands out increasing unique values from 32 (IdSequenceTest case 32)
     * @tc.type Function
     * @tc.level Level1
     */
    it('IdSequenceTest_case_032', 0, async () => {
      const sequence: IdSequence = new IdSequence(32);
      expect(sequence.peekNext()).assertEqual(32);
      expect(sequence.next()).assertEqual(32);
      expect(sequence.next()).assertEqual(33);
      expect(sequence.peekNext()).assertEqual(34);
      sequence.reset(100);
      expect(sequence.next()).assertEqual(100);
      expect(sequence.next()).assertEqual(101);
      const seen: number[] = [];
      for (let index = 0; index < 5; index++) {
        seen.push(sequence.next());
      }
      expect(seen.length).assertEqual(5);
      expect(seen[0] === seen[1]).assertFalse();
    });
    /**
     * @tc.name IdSequenceTest_case_033
     * @tc.desc sequence: id generator hands out increasing unique values from 33 (IdSequenceTest case 33)
     * @tc.type Function
     * @tc.level Level1
     */
    it('IdSequenceTest_case_033', 0, async () => {
      const sequence: IdSequence = new IdSequence(33);
      expect(sequence.peekNext()).assertEqual(33);
      expect(sequence.next()).assertEqual(33);
      expect(sequence.next()).assertEqual(34);
      expect(sequence.peekNext()).assertEqual(35);
      sequence.reset(100);
      expect(sequence.next()).assertEqual(100);
      expect(sequence.next()).assertEqual(101);
      const seen: number[] = [];
      for (let index = 0; index < 5; index++) {
        seen.push(sequence.next());
      }
      expect(seen.length).assertEqual(5);
      expect(seen[0] === seen[1]).assertFalse();
    });
    /**
     * @tc.name IdSequenceTest_case_034
     * @tc.desc sequence: id generator hands out increasing unique values from 34 (IdSequenceTest case 34)
     * @tc.type Function
     * @tc.level Level1
     */
    it('IdSequenceTest_case_034', 0, async () => {
      const sequence: IdSequence = new IdSequence(34);
      expect(sequence.peekNext()).assertEqual(34);
      expect(sequence.next()).assertEqual(34);
      expect(sequence.next()).assertEqual(35);
      expect(sequence.peekNext()).assertEqual(36);
      sequence.reset(100);
      expect(sequence.next()).assertEqual(100);
      expect(sequence.next()).assertEqual(101);
      const seen: number[] = [];
      for (let index = 0; index < 5; index++) {
        seen.push(sequence.next());
      }
      expect(seen.length).assertEqual(5);
      expect(seen[0] === seen[1]).assertFalse();
    });
  });
}
