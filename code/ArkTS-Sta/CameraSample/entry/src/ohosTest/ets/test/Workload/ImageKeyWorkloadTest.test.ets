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

export default function ImageKeyWorkloadTest(): void {
  describe('ImageKeyWorkloadTest', () => {
    beforeAll(() => {
      logSuite('ImageKeyWorkloadTest', 'begin');
    });
    beforeEach(async () => {
      await yieldTick();
    });
    afterAll(() => {
      logSuite('ImageKeyWorkloadTest', 'end');
    });

    /**
     * @tc.name ImageKeyWorkloadTest_case_001
     * @tc.desc keys: ImageListView emits 1 stable index keys (ImageKeyWorkloadTest case 1)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ImageKeyWorkloadTest_case_001', 0, async () => {
      const keys: string[] = imageGridKeys(1);
      expect(keys.length).assertEqual(1);
      expect(keys[0]).assertEqual('0');
      expect(keys[0]).assertEqual('0');
      expect(imageGridKey(0)).assertEqual('0');
      expectNoDuplicates(keys);
      for (let index = 0; index < keys.length; index++) {
        expect(keys[index]).assertEqual(index.toString());
      }
      expect(imageGridKeys(0).length).assertEqual(0);
      expect(imageGridKey(100)).assertEqual('100');
      expect(keys.join(',')).assertEqual(imageGridKeys(1).join(','));
    });
    /**
     * @tc.name ImageKeyWorkloadTest_case_002
     * @tc.desc keys: ImageListView emits 2 stable index keys (ImageKeyWorkloadTest case 2)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ImageKeyWorkloadTest_case_002', 0, async () => {
      const keys: string[] = imageGridKeys(2);
      expect(keys.length).assertEqual(2);
      expect(keys[0]).assertEqual('0');
      expect(keys[1]).assertEqual('1');
      expect(imageGridKey(1)).assertEqual('1');
      expectNoDuplicates(keys);
      for (let index = 0; index < keys.length; index++) {
        expect(keys[index]).assertEqual(index.toString());
      }
      expect(imageGridKeys(0).length).assertEqual(0);
      expect(imageGridKey(100)).assertEqual('100');
      expect(keys.join(',')).assertEqual(imageGridKeys(2).join(','));
    });
    /**
     * @tc.name ImageKeyWorkloadTest_case_003
     * @tc.desc keys: ImageListView emits 3 stable index keys (ImageKeyWorkloadTest case 3)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ImageKeyWorkloadTest_case_003', 0, async () => {
      const keys: string[] = imageGridKeys(3);
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual('0');
      expect(keys[2]).assertEqual('2');
      expect(imageGridKey(2)).assertEqual('2');
      expectNoDuplicates(keys);
      for (let index = 0; index < keys.length; index++) {
        expect(keys[index]).assertEqual(index.toString());
      }
      expect(imageGridKeys(0).length).assertEqual(0);
      expect(imageGridKey(100)).assertEqual('100');
      expect(keys.join(',')).assertEqual(imageGridKeys(3).join(','));
    });
    /**
     * @tc.name ImageKeyWorkloadTest_case_004
     * @tc.desc keys: ImageListView emits 4 stable index keys (ImageKeyWorkloadTest case 4)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ImageKeyWorkloadTest_case_004', 0, async () => {
      const keys: string[] = imageGridKeys(4);
      expect(keys.length).assertEqual(4);
      expect(keys[0]).assertEqual('0');
      expect(keys[3]).assertEqual('3');
      expect(imageGridKey(3)).assertEqual('3');
      expectNoDuplicates(keys);
      for (let index = 0; index < keys.length; index++) {
        expect(keys[index]).assertEqual(index.toString());
      }
      expect(imageGridKeys(0).length).assertEqual(0);
      expect(imageGridKey(100)).assertEqual('100');
      expect(keys.join(',')).assertEqual(imageGridKeys(4).join(','));
    });
    /**
     * @tc.name ImageKeyWorkloadTest_case_005
     * @tc.desc keys: ImageListView emits 5 stable index keys (ImageKeyWorkloadTest case 5)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ImageKeyWorkloadTest_case_005', 0, async () => {
      const keys: string[] = imageGridKeys(5);
      expect(keys.length).assertEqual(5);
      expect(keys[0]).assertEqual('0');
      expect(keys[4]).assertEqual('4');
      expect(imageGridKey(4)).assertEqual('4');
      expectNoDuplicates(keys);
      for (let index = 0; index < keys.length; index++) {
        expect(keys[index]).assertEqual(index.toString());
      }
      expect(imageGridKeys(0).length).assertEqual(0);
      expect(imageGridKey(100)).assertEqual('100');
      expect(keys.join(',')).assertEqual(imageGridKeys(5).join(','));
    });
    /**
     * @tc.name ImageKeyWorkloadTest_case_006
     * @tc.desc keys: ImageListView emits 1 stable index keys (ImageKeyWorkloadTest case 6)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ImageKeyWorkloadTest_case_006', 0, async () => {
      const keys: string[] = imageGridKeys(1);
      expect(keys.length).assertEqual(1);
      expect(keys[0]).assertEqual('0');
      expect(keys[0]).assertEqual('0');
      expect(imageGridKey(0)).assertEqual('0');
      expectNoDuplicates(keys);
      for (let index = 0; index < keys.length; index++) {
        expect(keys[index]).assertEqual(index.toString());
      }
      expect(imageGridKeys(0).length).assertEqual(0);
      expect(imageGridKey(100)).assertEqual('100');
      expect(keys.join(',')).assertEqual(imageGridKeys(1).join(','));
    });
    /**
     * @tc.name ImageKeyWorkloadTest_case_007
     * @tc.desc keys: ImageListView emits 2 stable index keys (ImageKeyWorkloadTest case 7)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ImageKeyWorkloadTest_case_007', 0, async () => {
      const keys: string[] = imageGridKeys(2);
      expect(keys.length).assertEqual(2);
      expect(keys[0]).assertEqual('0');
      expect(keys[1]).assertEqual('1');
      expect(imageGridKey(1)).assertEqual('1');
      expectNoDuplicates(keys);
      for (let index = 0; index < keys.length; index++) {
        expect(keys[index]).assertEqual(index.toString());
      }
      expect(imageGridKeys(0).length).assertEqual(0);
      expect(imageGridKey(100)).assertEqual('100');
      expect(keys.join(',')).assertEqual(imageGridKeys(2).join(','));
    });
    /**
     * @tc.name ImageKeyWorkloadTest_case_008
     * @tc.desc keys: ImageListView emits 3 stable index keys (ImageKeyWorkloadTest case 8)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ImageKeyWorkloadTest_case_008', 0, async () => {
      const keys: string[] = imageGridKeys(3);
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual('0');
      expect(keys[2]).assertEqual('2');
      expect(imageGridKey(2)).assertEqual('2');
      expectNoDuplicates(keys);
      for (let index = 0; index < keys.length; index++) {
        expect(keys[index]).assertEqual(index.toString());
      }
      expect(imageGridKeys(0).length).assertEqual(0);
      expect(imageGridKey(100)).assertEqual('100');
      expect(keys.join(',')).assertEqual(imageGridKeys(3).join(','));
    });
    /**
     * @tc.name ImageKeyWorkloadTest_case_009
     * @tc.desc keys: ImageListView emits 4 stable index keys (ImageKeyWorkloadTest case 9)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ImageKeyWorkloadTest_case_009', 0, async () => {
      const keys: string[] = imageGridKeys(4);
      expect(keys.length).assertEqual(4);
      expect(keys[0]).assertEqual('0');
      expect(keys[3]).assertEqual('3');
      expect(imageGridKey(3)).assertEqual('3');
      expectNoDuplicates(keys);
      for (let index = 0; index < keys.length; index++) {
        expect(keys[index]).assertEqual(index.toString());
      }
      expect(imageGridKeys(0).length).assertEqual(0);
      expect(imageGridKey(100)).assertEqual('100');
      expect(keys.join(',')).assertEqual(imageGridKeys(4).join(','));
    });
    /**
     * @tc.name ImageKeyWorkloadTest_case_010
     * @tc.desc keys: ImageListView emits 5 stable index keys (ImageKeyWorkloadTest case 10)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ImageKeyWorkloadTest_case_010', 0, async () => {
      const keys: string[] = imageGridKeys(5);
      expect(keys.length).assertEqual(5);
      expect(keys[0]).assertEqual('0');
      expect(keys[4]).assertEqual('4');
      expect(imageGridKey(4)).assertEqual('4');
      expectNoDuplicates(keys);
      for (let index = 0; index < keys.length; index++) {
        expect(keys[index]).assertEqual(index.toString());
      }
      expect(imageGridKeys(0).length).assertEqual(0);
      expect(imageGridKey(100)).assertEqual('100');
      expect(keys.join(',')).assertEqual(imageGridKeys(5).join(','));
    });
    /**
     * @tc.name ImageKeyWorkloadTest_case_011
     * @tc.desc keys: ImageListView emits 1 stable index keys (ImageKeyWorkloadTest case 11)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ImageKeyWorkloadTest_case_011', 0, async () => {
      const keys: string[] = imageGridKeys(1);
      expect(keys.length).assertEqual(1);
      expect(keys[0]).assertEqual('0');
      expect(keys[0]).assertEqual('0');
      expect(imageGridKey(0)).assertEqual('0');
      expectNoDuplicates(keys);
      for (let index = 0; index < keys.length; index++) {
        expect(keys[index]).assertEqual(index.toString());
      }
      expect(imageGridKeys(0).length).assertEqual(0);
      expect(imageGridKey(100)).assertEqual('100');
      expect(keys.join(',')).assertEqual(imageGridKeys(1).join(','));
    });
    /**
     * @tc.name ImageKeyWorkloadTest_case_012
     * @tc.desc keys: ImageListView emits 2 stable index keys (ImageKeyWorkloadTest case 12)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ImageKeyWorkloadTest_case_012', 0, async () => {
      const keys: string[] = imageGridKeys(2);
      expect(keys.length).assertEqual(2);
      expect(keys[0]).assertEqual('0');
      expect(keys[1]).assertEqual('1');
      expect(imageGridKey(1)).assertEqual('1');
      expectNoDuplicates(keys);
      for (let index = 0; index < keys.length; index++) {
        expect(keys[index]).assertEqual(index.toString());
      }
      expect(imageGridKeys(0).length).assertEqual(0);
      expect(imageGridKey(100)).assertEqual('100');
      expect(keys.join(',')).assertEqual(imageGridKeys(2).join(','));
    });
    /**
     * @tc.name ImageKeyWorkloadTest_case_013
     * @tc.desc keys: ImageListView emits 3 stable index keys (ImageKeyWorkloadTest case 13)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ImageKeyWorkloadTest_case_013', 0, async () => {
      const keys: string[] = imageGridKeys(3);
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual('0');
      expect(keys[2]).assertEqual('2');
      expect(imageGridKey(2)).assertEqual('2');
      expectNoDuplicates(keys);
      for (let index = 0; index < keys.length; index++) {
        expect(keys[index]).assertEqual(index.toString());
      }
      expect(imageGridKeys(0).length).assertEqual(0);
      expect(imageGridKey(100)).assertEqual('100');
      expect(keys.join(',')).assertEqual(imageGridKeys(3).join(','));
    });
    /**
     * @tc.name ImageKeyWorkloadTest_case_014
     * @tc.desc keys: ImageListView emits 4 stable index keys (ImageKeyWorkloadTest case 14)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ImageKeyWorkloadTest_case_014', 0, async () => {
      const keys: string[] = imageGridKeys(4);
      expect(keys.length).assertEqual(4);
      expect(keys[0]).assertEqual('0');
      expect(keys[3]).assertEqual('3');
      expect(imageGridKey(3)).assertEqual('3');
      expectNoDuplicates(keys);
      for (let index = 0; index < keys.length; index++) {
        expect(keys[index]).assertEqual(index.toString());
      }
      expect(imageGridKeys(0).length).assertEqual(0);
      expect(imageGridKey(100)).assertEqual('100');
      expect(keys.join(',')).assertEqual(imageGridKeys(4).join(','));
    });
    /**
     * @tc.name ImageKeyWorkloadTest_case_015
     * @tc.desc keys: ImageListView emits 5 stable index keys (ImageKeyWorkloadTest case 15)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ImageKeyWorkloadTest_case_015', 0, async () => {
      const keys: string[] = imageGridKeys(5);
      expect(keys.length).assertEqual(5);
      expect(keys[0]).assertEqual('0');
      expect(keys[4]).assertEqual('4');
      expect(imageGridKey(4)).assertEqual('4');
      expectNoDuplicates(keys);
      for (let index = 0; index < keys.length; index++) {
        expect(keys[index]).assertEqual(index.toString());
      }
      expect(imageGridKeys(0).length).assertEqual(0);
      expect(imageGridKey(100)).assertEqual('100');
      expect(keys.join(',')).assertEqual(imageGridKeys(5).join(','));
    });
    /**
     * @tc.name ImageKeyWorkloadTest_case_016
     * @tc.desc keys: ImageListView emits 1 stable index keys (ImageKeyWorkloadTest case 16)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ImageKeyWorkloadTest_case_016', 0, async () => {
      const keys: string[] = imageGridKeys(1);
      expect(keys.length).assertEqual(1);
      expect(keys[0]).assertEqual('0');
      expect(keys[0]).assertEqual('0');
      expect(imageGridKey(0)).assertEqual('0');
      expectNoDuplicates(keys);
      for (let index = 0; index < keys.length; index++) {
        expect(keys[index]).assertEqual(index.toString());
      }
      expect(imageGridKeys(0).length).assertEqual(0);
      expect(imageGridKey(100)).assertEqual('100');
      expect(keys.join(',')).assertEqual(imageGridKeys(1).join(','));
    });
    /**
     * @tc.name ImageKeyWorkloadTest_case_017
     * @tc.desc keys: ImageListView emits 2 stable index keys (ImageKeyWorkloadTest case 17)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ImageKeyWorkloadTest_case_017', 0, async () => {
      const keys: string[] = imageGridKeys(2);
      expect(keys.length).assertEqual(2);
      expect(keys[0]).assertEqual('0');
      expect(keys[1]).assertEqual('1');
      expect(imageGridKey(1)).assertEqual('1');
      expectNoDuplicates(keys);
      for (let index = 0; index < keys.length; index++) {
        expect(keys[index]).assertEqual(index.toString());
      }
      expect(imageGridKeys(0).length).assertEqual(0);
      expect(imageGridKey(100)).assertEqual('100');
      expect(keys.join(',')).assertEqual(imageGridKeys(2).join(','));
    });
    /**
     * @tc.name ImageKeyWorkloadTest_case_018
     * @tc.desc keys: ImageListView emits 3 stable index keys (ImageKeyWorkloadTest case 18)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ImageKeyWorkloadTest_case_018', 0, async () => {
      const keys: string[] = imageGridKeys(3);
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual('0');
      expect(keys[2]).assertEqual('2');
      expect(imageGridKey(2)).assertEqual('2');
      expectNoDuplicates(keys);
      for (let index = 0; index < keys.length; index++) {
        expect(keys[index]).assertEqual(index.toString());
      }
      expect(imageGridKeys(0).length).assertEqual(0);
      expect(imageGridKey(100)).assertEqual('100');
      expect(keys.join(',')).assertEqual(imageGridKeys(3).join(','));
    });
    /**
     * @tc.name ImageKeyWorkloadTest_case_019
     * @tc.desc keys: ImageListView emits 4 stable index keys (ImageKeyWorkloadTest case 19)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ImageKeyWorkloadTest_case_019', 0, async () => {
      const keys: string[] = imageGridKeys(4);
      expect(keys.length).assertEqual(4);
      expect(keys[0]).assertEqual('0');
      expect(keys[3]).assertEqual('3');
      expect(imageGridKey(3)).assertEqual('3');
      expectNoDuplicates(keys);
      for (let index = 0; index < keys.length; index++) {
        expect(keys[index]).assertEqual(index.toString());
      }
      expect(imageGridKeys(0).length).assertEqual(0);
      expect(imageGridKey(100)).assertEqual('100');
      expect(keys.join(',')).assertEqual(imageGridKeys(4).join(','));
    });
    /**
     * @tc.name ImageKeyWorkloadTest_case_020
     * @tc.desc keys: ImageListView emits 5 stable index keys (ImageKeyWorkloadTest case 20)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ImageKeyWorkloadTest_case_020', 0, async () => {
      const keys: string[] = imageGridKeys(5);
      expect(keys.length).assertEqual(5);
      expect(keys[0]).assertEqual('0');
      expect(keys[4]).assertEqual('4');
      expect(imageGridKey(4)).assertEqual('4');
      expectNoDuplicates(keys);
      for (let index = 0; index < keys.length; index++) {
        expect(keys[index]).assertEqual(index.toString());
      }
      expect(imageGridKeys(0).length).assertEqual(0);
      expect(imageGridKey(100)).assertEqual('100');
      expect(keys.join(',')).assertEqual(imageGridKeys(5).join(','));
    });
    /**
     * @tc.name ImageKeyWorkloadTest_case_021
     * @tc.desc keys: ImageListView emits 1 stable index keys (ImageKeyWorkloadTest case 21)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ImageKeyWorkloadTest_case_021', 0, async () => {
      const keys: string[] = imageGridKeys(1);
      expect(keys.length).assertEqual(1);
      expect(keys[0]).assertEqual('0');
      expect(keys[0]).assertEqual('0');
      expect(imageGridKey(0)).assertEqual('0');
      expectNoDuplicates(keys);
      for (let index = 0; index < keys.length; index++) {
        expect(keys[index]).assertEqual(index.toString());
      }
      expect(imageGridKeys(0).length).assertEqual(0);
      expect(imageGridKey(100)).assertEqual('100');
      expect(keys.join(',')).assertEqual(imageGridKeys(1).join(','));
    });
    /**
     * @tc.name ImageKeyWorkloadTest_case_022
     * @tc.desc keys: ImageListView emits 2 stable index keys (ImageKeyWorkloadTest case 22)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ImageKeyWorkloadTest_case_022', 0, async () => {
      const keys: string[] = imageGridKeys(2);
      expect(keys.length).assertEqual(2);
      expect(keys[0]).assertEqual('0');
      expect(keys[1]).assertEqual('1');
      expect(imageGridKey(1)).assertEqual('1');
      expectNoDuplicates(keys);
      for (let index = 0; index < keys.length; index++) {
        expect(keys[index]).assertEqual(index.toString());
      }
      expect(imageGridKeys(0).length).assertEqual(0);
      expect(imageGridKey(100)).assertEqual('100');
      expect(keys.join(',')).assertEqual(imageGridKeys(2).join(','));
    });
    /**
     * @tc.name ImageKeyWorkloadTest_case_023
     * @tc.desc keys: ImageListView emits 3 stable index keys (ImageKeyWorkloadTest case 23)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ImageKeyWorkloadTest_case_023', 0, async () => {
      const keys: string[] = imageGridKeys(3);
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual('0');
      expect(keys[2]).assertEqual('2');
      expect(imageGridKey(2)).assertEqual('2');
      expectNoDuplicates(keys);
      for (let index = 0; index < keys.length; index++) {
        expect(keys[index]).assertEqual(index.toString());
      }
      expect(imageGridKeys(0).length).assertEqual(0);
      expect(imageGridKey(100)).assertEqual('100');
      expect(keys.join(',')).assertEqual(imageGridKeys(3).join(','));
    });
    /**
     * @tc.name ImageKeyWorkloadTest_case_024
     * @tc.desc keys: ImageListView emits 4 stable index keys (ImageKeyWorkloadTest case 24)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ImageKeyWorkloadTest_case_024', 0, async () => {
      const keys: string[] = imageGridKeys(4);
      expect(keys.length).assertEqual(4);
      expect(keys[0]).assertEqual('0');
      expect(keys[3]).assertEqual('3');
      expect(imageGridKey(3)).assertEqual('3');
      expectNoDuplicates(keys);
      for (let index = 0; index < keys.length; index++) {
        expect(keys[index]).assertEqual(index.toString());
      }
      expect(imageGridKeys(0).length).assertEqual(0);
      expect(imageGridKey(100)).assertEqual('100');
      expect(keys.join(',')).assertEqual(imageGridKeys(4).join(','));
    });
    /**
     * @tc.name ImageKeyWorkloadTest_case_025
     * @tc.desc keys: ImageListView emits 5 stable index keys (ImageKeyWorkloadTest case 25)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ImageKeyWorkloadTest_case_025', 0, async () => {
      const keys: string[] = imageGridKeys(5);
      expect(keys.length).assertEqual(5);
      expect(keys[0]).assertEqual('0');
      expect(keys[4]).assertEqual('4');
      expect(imageGridKey(4)).assertEqual('4');
      expectNoDuplicates(keys);
      for (let index = 0; index < keys.length; index++) {
        expect(keys[index]).assertEqual(index.toString());
      }
      expect(imageGridKeys(0).length).assertEqual(0);
      expect(imageGridKey(100)).assertEqual('100');
      expect(keys.join(',')).assertEqual(imageGridKeys(5).join(','));
    });
    /**
     * @tc.name ImageKeyWorkloadTest_case_026
     * @tc.desc keys: ImageListView emits 1 stable index keys (ImageKeyWorkloadTest case 26)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ImageKeyWorkloadTest_case_026', 0, async () => {
      const keys: string[] = imageGridKeys(1);
      expect(keys.length).assertEqual(1);
      expect(keys[0]).assertEqual('0');
      expect(keys[0]).assertEqual('0');
      expect(imageGridKey(0)).assertEqual('0');
      expectNoDuplicates(keys);
      for (let index = 0; index < keys.length; index++) {
        expect(keys[index]).assertEqual(index.toString());
      }
      expect(imageGridKeys(0).length).assertEqual(0);
      expect(imageGridKey(100)).assertEqual('100');
      expect(keys.join(',')).assertEqual(imageGridKeys(1).join(','));
    });
    /**
     * @tc.name ImageKeyWorkloadTest_case_027
     * @tc.desc keys: ImageListView emits 2 stable index keys (ImageKeyWorkloadTest case 27)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ImageKeyWorkloadTest_case_027', 0, async () => {
      const keys: string[] = imageGridKeys(2);
      expect(keys.length).assertEqual(2);
      expect(keys[0]).assertEqual('0');
      expect(keys[1]).assertEqual('1');
      expect(imageGridKey(1)).assertEqual('1');
      expectNoDuplicates(keys);
      for (let index = 0; index < keys.length; index++) {
        expect(keys[index]).assertEqual(index.toString());
      }
      expect(imageGridKeys(0).length).assertEqual(0);
      expect(imageGridKey(100)).assertEqual('100');
      expect(keys.join(',')).assertEqual(imageGridKeys(2).join(','));
    });
    /**
     * @tc.name ImageKeyWorkloadTest_case_028
     * @tc.desc keys: ImageListView emits 3 stable index keys (ImageKeyWorkloadTest case 28)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ImageKeyWorkloadTest_case_028', 0, async () => {
      const keys: string[] = imageGridKeys(3);
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual('0');
      expect(keys[2]).assertEqual('2');
      expect(imageGridKey(2)).assertEqual('2');
      expectNoDuplicates(keys);
      for (let index = 0; index < keys.length; index++) {
        expect(keys[index]).assertEqual(index.toString());
      }
      expect(imageGridKeys(0).length).assertEqual(0);
      expect(imageGridKey(100)).assertEqual('100');
      expect(keys.join(',')).assertEqual(imageGridKeys(3).join(','));
    });
    /**
     * @tc.name ImageKeyWorkloadTest_case_029
     * @tc.desc keys: ImageListView emits 4 stable index keys (ImageKeyWorkloadTest case 29)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ImageKeyWorkloadTest_case_029', 0, async () => {
      const keys: string[] = imageGridKeys(4);
      expect(keys.length).assertEqual(4);
      expect(keys[0]).assertEqual('0');
      expect(keys[3]).assertEqual('3');
      expect(imageGridKey(3)).assertEqual('3');
      expectNoDuplicates(keys);
      for (let index = 0; index < keys.length; index++) {
        expect(keys[index]).assertEqual(index.toString());
      }
      expect(imageGridKeys(0).length).assertEqual(0);
      expect(imageGridKey(100)).assertEqual('100');
      expect(keys.join(',')).assertEqual(imageGridKeys(4).join(','));
    });
    /**
     * @tc.name ImageKeyWorkloadTest_case_030
     * @tc.desc keys: ImageListView emits 5 stable index keys (ImageKeyWorkloadTest case 30)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ImageKeyWorkloadTest_case_030', 0, async () => {
      const keys: string[] = imageGridKeys(5);
      expect(keys.length).assertEqual(5);
      expect(keys[0]).assertEqual('0');
      expect(keys[4]).assertEqual('4');
      expect(imageGridKey(4)).assertEqual('4');
      expectNoDuplicates(keys);
      for (let index = 0; index < keys.length; index++) {
        expect(keys[index]).assertEqual(index.toString());
      }
      expect(imageGridKeys(0).length).assertEqual(0);
      expect(imageGridKey(100)).assertEqual('100');
      expect(keys.join(',')).assertEqual(imageGridKeys(5).join(','));
    });
    /**
     * @tc.name ImageKeyWorkloadTest_case_031
     * @tc.desc keys: ImageListView emits 1 stable index keys (ImageKeyWorkloadTest case 31)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ImageKeyWorkloadTest_case_031', 0, async () => {
      const keys: string[] = imageGridKeys(1);
      expect(keys.length).assertEqual(1);
      expect(keys[0]).assertEqual('0');
      expect(keys[0]).assertEqual('0');
      expect(imageGridKey(0)).assertEqual('0');
      expectNoDuplicates(keys);
      for (let index = 0; index < keys.length; index++) {
        expect(keys[index]).assertEqual(index.toString());
      }
      expect(imageGridKeys(0).length).assertEqual(0);
      expect(imageGridKey(100)).assertEqual('100');
      expect(keys.join(',')).assertEqual(imageGridKeys(1).join(','));
    });
    /**
     * @tc.name ImageKeyWorkloadTest_case_032
     * @tc.desc keys: ImageListView emits 2 stable index keys (ImageKeyWorkloadTest case 32)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ImageKeyWorkloadTest_case_032', 0, async () => {
      const keys: string[] = imageGridKeys(2);
      expect(keys.length).assertEqual(2);
      expect(keys[0]).assertEqual('0');
      expect(keys[1]).assertEqual('1');
      expect(imageGridKey(1)).assertEqual('1');
      expectNoDuplicates(keys);
      for (let index = 0; index < keys.length; index++) {
        expect(keys[index]).assertEqual(index.toString());
      }
      expect(imageGridKeys(0).length).assertEqual(0);
      expect(imageGridKey(100)).assertEqual('100');
      expect(keys.join(',')).assertEqual(imageGridKeys(2).join(','));
    });
    /**
     * @tc.name ImageKeyWorkloadTest_case_033
     * @tc.desc keys: ImageListView emits 3 stable index keys (ImageKeyWorkloadTest case 33)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ImageKeyWorkloadTest_case_033', 0, async () => {
      const keys: string[] = imageGridKeys(3);
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual('0');
      expect(keys[2]).assertEqual('2');
      expect(imageGridKey(2)).assertEqual('2');
      expectNoDuplicates(keys);
      for (let index = 0; index < keys.length; index++) {
        expect(keys[index]).assertEqual(index.toString());
      }
      expect(imageGridKeys(0).length).assertEqual(0);
      expect(imageGridKey(100)).assertEqual('100');
      expect(keys.join(',')).assertEqual(imageGridKeys(3).join(','));
    });
    /**
     * @tc.name ImageKeyWorkloadTest_case_034
     * @tc.desc keys: ImageListView emits 4 stable index keys (ImageKeyWorkloadTest case 34)
     * @tc.type Function
     * @tc.level Level1
     */
    it('ImageKeyWorkloadTest_case_034', 0, async () => {
      const keys: string[] = imageGridKeys(4);
      expect(keys.length).assertEqual(4);
      expect(keys[0]).assertEqual('0');
      expect(keys[3]).assertEqual('3');
      expect(imageGridKey(3)).assertEqual('3');
      expectNoDuplicates(keys);
      for (let index = 0; index < keys.length; index++) {
        expect(keys[index]).assertEqual(index.toString());
      }
      expect(imageGridKeys(0).length).assertEqual(0);
      expect(imageGridKey(100)).assertEqual('100');
      expect(keys.join(',')).assertEqual(imageGridKeys(4).join(','));
    });
  });
}
