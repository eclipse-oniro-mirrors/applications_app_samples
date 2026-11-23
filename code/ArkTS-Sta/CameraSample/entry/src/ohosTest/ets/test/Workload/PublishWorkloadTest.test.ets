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

export default function PublishWorkloadTest(): void {
  describe('PublishWorkloadTest', () => {
    beforeAll(() => {
      logSuite('PublishWorkloadTest', 'begin');
    });
    beforeEach(async () => {
      await yieldTick();
    });
    afterAll(() => {
      logSuite('PublishWorkloadTest', 'end');
    });

    /**
     * @tc.name PublishWorkloadTest_case_001
     * @tc.desc workload: 20 publish cycles keep id and name bookkeeping (PublishWorkloadTest case 1)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishWorkloadTest_case_001', 0, async () => {
      const journal: CommentJournal = new CommentJournal();
      const lcg: Lcg = new Lcg(1);
      for (let index = 0; index < 20; index++) {
        const draft: CommentDraft = new CommentDraft('user_' + (index % 3), 'body ' + index, 'app.media.icon_comment_app_logo1', '02-07 13:25', [imageUriFor(index)]);
        journal.appendDraft(draft);
      }
      expect(journal.size()).assertEqual(20);
      expect(journal.ids().length).assertEqual(20);
      expect(journal.totalImages()).assertEqual(20);
      expect(journal.countByName('user_0') + journal.countByName('user_1') + journal.countByName('user_2')).assertEqual(20);
      expect(journal.ids()[0]).assertEqual(1);
      expect(lcg.nextInt(10) >= 0).assertTrue();
      expect(journal.joinTexts(',').length > 0).assertTrue();
    });
    /**
     * @tc.name PublishWorkloadTest_case_002
     * @tc.desc workload: 30 publish cycles keep id and name bookkeeping (PublishWorkloadTest case 2)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishWorkloadTest_case_002', 0, async () => {
      const journal: CommentJournal = new CommentJournal();
      const lcg: Lcg = new Lcg(2);
      for (let index = 0; index < 30; index++) {
        const draft: CommentDraft = new CommentDraft('user_' + (index % 3), 'body ' + index, 'app.media.icon_comment_app_logo1', '02-07 13:25', [imageUriFor(index)]);
        journal.appendDraft(draft);
      }
      expect(journal.size()).assertEqual(30);
      expect(journal.ids().length).assertEqual(30);
      expect(journal.totalImages()).assertEqual(30);
      expect(journal.countByName('user_0') + journal.countByName('user_1') + journal.countByName('user_2')).assertEqual(30);
      expect(journal.ids()[0]).assertEqual(1);
      expect(lcg.nextInt(10) >= 0).assertTrue();
      expect(journal.joinTexts(',').length > 0).assertTrue();
    });
    /**
     * @tc.name PublishWorkloadTest_case_003
     * @tc.desc workload: 40 publish cycles keep id and name bookkeeping (PublishWorkloadTest case 3)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishWorkloadTest_case_003', 0, async () => {
      const journal: CommentJournal = new CommentJournal();
      const lcg: Lcg = new Lcg(3);
      for (let index = 0; index < 40; index++) {
        const draft: CommentDraft = new CommentDraft('user_' + (index % 3), 'body ' + index, 'app.media.icon_comment_app_logo1', '02-07 13:25', [imageUriFor(index)]);
        journal.appendDraft(draft);
      }
      expect(journal.size()).assertEqual(40);
      expect(journal.ids().length).assertEqual(40);
      expect(journal.totalImages()).assertEqual(40);
      expect(journal.countByName('user_0') + journal.countByName('user_1') + journal.countByName('user_2')).assertEqual(40);
      expect(journal.ids()[0]).assertEqual(1);
      expect(lcg.nextInt(10) >= 0).assertTrue();
      expect(journal.joinTexts(',').length > 0).assertTrue();
    });
    /**
     * @tc.name PublishWorkloadTest_case_004
     * @tc.desc workload: 50 publish cycles keep id and name bookkeeping (PublishWorkloadTest case 4)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishWorkloadTest_case_004', 0, async () => {
      const journal: CommentJournal = new CommentJournal();
      const lcg: Lcg = new Lcg(4);
      for (let index = 0; index < 50; index++) {
        const draft: CommentDraft = new CommentDraft('user_' + (index % 3), 'body ' + index, 'app.media.icon_comment_app_logo1', '02-07 13:25', [imageUriFor(index)]);
        journal.appendDraft(draft);
      }
      expect(journal.size()).assertEqual(50);
      expect(journal.ids().length).assertEqual(50);
      expect(journal.totalImages()).assertEqual(50);
      expect(journal.countByName('user_0') + journal.countByName('user_1') + journal.countByName('user_2')).assertEqual(50);
      expect(journal.ids()[0]).assertEqual(1);
      expect(lcg.nextInt(10) >= 0).assertTrue();
      expect(journal.joinTexts(',').length > 0).assertTrue();
    });
    /**
     * @tc.name PublishWorkloadTest_case_005
     * @tc.desc workload: 60 publish cycles keep id and name bookkeeping (PublishWorkloadTest case 5)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishWorkloadTest_case_005', 0, async () => {
      const journal: CommentJournal = new CommentJournal();
      const lcg: Lcg = new Lcg(5);
      for (let index = 0; index < 60; index++) {
        const draft: CommentDraft = new CommentDraft('user_' + (index % 3), 'body ' + index, 'app.media.icon_comment_app_logo1', '02-07 13:25', [imageUriFor(index)]);
        journal.appendDraft(draft);
      }
      expect(journal.size()).assertEqual(60);
      expect(journal.ids().length).assertEqual(60);
      expect(journal.totalImages()).assertEqual(60);
      expect(journal.countByName('user_0') + journal.countByName('user_1') + journal.countByName('user_2')).assertEqual(60);
      expect(journal.ids()[0]).assertEqual(1);
      expect(lcg.nextInt(10) >= 0).assertTrue();
      expect(journal.joinTexts(',').length > 0).assertTrue();
    });
    /**
     * @tc.name PublishWorkloadTest_case_006
     * @tc.desc workload: 20 publish cycles keep id and name bookkeeping (PublishWorkloadTest case 6)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishWorkloadTest_case_006', 0, async () => {
      const journal: CommentJournal = new CommentJournal();
      const lcg: Lcg = new Lcg(6);
      for (let index = 0; index < 20; index++) {
        const draft: CommentDraft = new CommentDraft('user_' + (index % 3), 'body ' + index, 'app.media.icon_comment_app_logo1', '02-07 13:25', [imageUriFor(index)]);
        journal.appendDraft(draft);
      }
      expect(journal.size()).assertEqual(20);
      expect(journal.ids().length).assertEqual(20);
      expect(journal.totalImages()).assertEqual(20);
      expect(journal.countByName('user_0') + journal.countByName('user_1') + journal.countByName('user_2')).assertEqual(20);
      expect(journal.ids()[0]).assertEqual(1);
      expect(lcg.nextInt(10) >= 0).assertTrue();
      expect(journal.joinTexts(',').length > 0).assertTrue();
    });
    /**
     * @tc.name PublishWorkloadTest_case_007
     * @tc.desc workload: 30 publish cycles keep id and name bookkeeping (PublishWorkloadTest case 7)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishWorkloadTest_case_007', 0, async () => {
      const journal: CommentJournal = new CommentJournal();
      const lcg: Lcg = new Lcg(7);
      for (let index = 0; index < 30; index++) {
        const draft: CommentDraft = new CommentDraft('user_' + (index % 3), 'body ' + index, 'app.media.icon_comment_app_logo1', '02-07 13:25', [imageUriFor(index)]);
        journal.appendDraft(draft);
      }
      expect(journal.size()).assertEqual(30);
      expect(journal.ids().length).assertEqual(30);
      expect(journal.totalImages()).assertEqual(30);
      expect(journal.countByName('user_0') + journal.countByName('user_1') + journal.countByName('user_2')).assertEqual(30);
      expect(journal.ids()[0]).assertEqual(1);
      expect(lcg.nextInt(10) >= 0).assertTrue();
      expect(journal.joinTexts(',').length > 0).assertTrue();
    });
    /**
     * @tc.name PublishWorkloadTest_case_008
     * @tc.desc workload: 40 publish cycles keep id and name bookkeeping (PublishWorkloadTest case 8)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishWorkloadTest_case_008', 0, async () => {
      const journal: CommentJournal = new CommentJournal();
      const lcg: Lcg = new Lcg(8);
      for (let index = 0; index < 40; index++) {
        const draft: CommentDraft = new CommentDraft('user_' + (index % 3), 'body ' + index, 'app.media.icon_comment_app_logo1', '02-07 13:25', [imageUriFor(index)]);
        journal.appendDraft(draft);
      }
      expect(journal.size()).assertEqual(40);
      expect(journal.ids().length).assertEqual(40);
      expect(journal.totalImages()).assertEqual(40);
      expect(journal.countByName('user_0') + journal.countByName('user_1') + journal.countByName('user_2')).assertEqual(40);
      expect(journal.ids()[0]).assertEqual(1);
      expect(lcg.nextInt(10) >= 0).assertTrue();
      expect(journal.joinTexts(',').length > 0).assertTrue();
    });
    /**
     * @tc.name PublishWorkloadTest_case_009
     * @tc.desc workload: 50 publish cycles keep id and name bookkeeping (PublishWorkloadTest case 9)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishWorkloadTest_case_009', 0, async () => {
      const journal: CommentJournal = new CommentJournal();
      const lcg: Lcg = new Lcg(9);
      for (let index = 0; index < 50; index++) {
        const draft: CommentDraft = new CommentDraft('user_' + (index % 3), 'body ' + index, 'app.media.icon_comment_app_logo1', '02-07 13:25', [imageUriFor(index)]);
        journal.appendDraft(draft);
      }
      expect(journal.size()).assertEqual(50);
      expect(journal.ids().length).assertEqual(50);
      expect(journal.totalImages()).assertEqual(50);
      expect(journal.countByName('user_0') + journal.countByName('user_1') + journal.countByName('user_2')).assertEqual(50);
      expect(journal.ids()[0]).assertEqual(1);
      expect(lcg.nextInt(10) >= 0).assertTrue();
      expect(journal.joinTexts(',').length > 0).assertTrue();
    });
    /**
     * @tc.name PublishWorkloadTest_case_010
     * @tc.desc workload: 60 publish cycles keep id and name bookkeeping (PublishWorkloadTest case 10)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishWorkloadTest_case_010', 0, async () => {
      const journal: CommentJournal = new CommentJournal();
      const lcg: Lcg = new Lcg(10);
      for (let index = 0; index < 60; index++) {
        const draft: CommentDraft = new CommentDraft('user_' + (index % 3), 'body ' + index, 'app.media.icon_comment_app_logo1', '02-07 13:25', [imageUriFor(index)]);
        journal.appendDraft(draft);
      }
      expect(journal.size()).assertEqual(60);
      expect(journal.ids().length).assertEqual(60);
      expect(journal.totalImages()).assertEqual(60);
      expect(journal.countByName('user_0') + journal.countByName('user_1') + journal.countByName('user_2')).assertEqual(60);
      expect(journal.ids()[0]).assertEqual(1);
      expect(lcg.nextInt(10) >= 0).assertTrue();
      expect(journal.joinTexts(',').length > 0).assertTrue();
    });
    /**
     * @tc.name PublishWorkloadTest_case_011
     * @tc.desc workload: 20 publish cycles keep id and name bookkeeping (PublishWorkloadTest case 11)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishWorkloadTest_case_011', 0, async () => {
      const journal: CommentJournal = new CommentJournal();
      const lcg: Lcg = new Lcg(11);
      for (let index = 0; index < 20; index++) {
        const draft: CommentDraft = new CommentDraft('user_' + (index % 3), 'body ' + index, 'app.media.icon_comment_app_logo1', '02-07 13:25', [imageUriFor(index)]);
        journal.appendDraft(draft);
      }
      expect(journal.size()).assertEqual(20);
      expect(journal.ids().length).assertEqual(20);
      expect(journal.totalImages()).assertEqual(20);
      expect(journal.countByName('user_0') + journal.countByName('user_1') + journal.countByName('user_2')).assertEqual(20);
      expect(journal.ids()[0]).assertEqual(1);
      expect(lcg.nextInt(10) >= 0).assertTrue();
      expect(journal.joinTexts(',').length > 0).assertTrue();
    });
    /**
     * @tc.name PublishWorkloadTest_case_012
     * @tc.desc workload: 30 publish cycles keep id and name bookkeeping (PublishWorkloadTest case 12)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishWorkloadTest_case_012', 0, async () => {
      const journal: CommentJournal = new CommentJournal();
      const lcg: Lcg = new Lcg(12);
      for (let index = 0; index < 30; index++) {
        const draft: CommentDraft = new CommentDraft('user_' + (index % 3), 'body ' + index, 'app.media.icon_comment_app_logo1', '02-07 13:25', [imageUriFor(index)]);
        journal.appendDraft(draft);
      }
      expect(journal.size()).assertEqual(30);
      expect(journal.ids().length).assertEqual(30);
      expect(journal.totalImages()).assertEqual(30);
      expect(journal.countByName('user_0') + journal.countByName('user_1') + journal.countByName('user_2')).assertEqual(30);
      expect(journal.ids()[0]).assertEqual(1);
      expect(lcg.nextInt(10) >= 0).assertTrue();
      expect(journal.joinTexts(',').length > 0).assertTrue();
    });
    /**
     * @tc.name PublishWorkloadTest_case_013
     * @tc.desc workload: 40 publish cycles keep id and name bookkeeping (PublishWorkloadTest case 13)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishWorkloadTest_case_013', 0, async () => {
      const journal: CommentJournal = new CommentJournal();
      const lcg: Lcg = new Lcg(13);
      for (let index = 0; index < 40; index++) {
        const draft: CommentDraft = new CommentDraft('user_' + (index % 3), 'body ' + index, 'app.media.icon_comment_app_logo1', '02-07 13:25', [imageUriFor(index)]);
        journal.appendDraft(draft);
      }
      expect(journal.size()).assertEqual(40);
      expect(journal.ids().length).assertEqual(40);
      expect(journal.totalImages()).assertEqual(40);
      expect(journal.countByName('user_0') + journal.countByName('user_1') + journal.countByName('user_2')).assertEqual(40);
      expect(journal.ids()[0]).assertEqual(1);
      expect(lcg.nextInt(10) >= 0).assertTrue();
      expect(journal.joinTexts(',').length > 0).assertTrue();
    });
    /**
     * @tc.name PublishWorkloadTest_case_014
     * @tc.desc workload: 50 publish cycles keep id and name bookkeeping (PublishWorkloadTest case 14)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishWorkloadTest_case_014', 0, async () => {
      const journal: CommentJournal = new CommentJournal();
      const lcg: Lcg = new Lcg(14);
      for (let index = 0; index < 50; index++) {
        const draft: CommentDraft = new CommentDraft('user_' + (index % 3), 'body ' + index, 'app.media.icon_comment_app_logo1', '02-07 13:25', [imageUriFor(index)]);
        journal.appendDraft(draft);
      }
      expect(journal.size()).assertEqual(50);
      expect(journal.ids().length).assertEqual(50);
      expect(journal.totalImages()).assertEqual(50);
      expect(journal.countByName('user_0') + journal.countByName('user_1') + journal.countByName('user_2')).assertEqual(50);
      expect(journal.ids()[0]).assertEqual(1);
      expect(lcg.nextInt(10) >= 0).assertTrue();
      expect(journal.joinTexts(',').length > 0).assertTrue();
    });
    /**
     * @tc.name PublishWorkloadTest_case_015
     * @tc.desc workload: 60 publish cycles keep id and name bookkeeping (PublishWorkloadTest case 15)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishWorkloadTest_case_015', 0, async () => {
      const journal: CommentJournal = new CommentJournal();
      const lcg: Lcg = new Lcg(15);
      for (let index = 0; index < 60; index++) {
        const draft: CommentDraft = new CommentDraft('user_' + (index % 3), 'body ' + index, 'app.media.icon_comment_app_logo1', '02-07 13:25', [imageUriFor(index)]);
        journal.appendDraft(draft);
      }
      expect(journal.size()).assertEqual(60);
      expect(journal.ids().length).assertEqual(60);
      expect(journal.totalImages()).assertEqual(60);
      expect(journal.countByName('user_0') + journal.countByName('user_1') + journal.countByName('user_2')).assertEqual(60);
      expect(journal.ids()[0]).assertEqual(1);
      expect(lcg.nextInt(10) >= 0).assertTrue();
      expect(journal.joinTexts(',').length > 0).assertTrue();
    });
    /**
     * @tc.name PublishWorkloadTest_case_016
     * @tc.desc workload: 20 publish cycles keep id and name bookkeeping (PublishWorkloadTest case 16)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishWorkloadTest_case_016', 0, async () => {
      const journal: CommentJournal = new CommentJournal();
      const lcg: Lcg = new Lcg(16);
      for (let index = 0; index < 20; index++) {
        const draft: CommentDraft = new CommentDraft('user_' + (index % 3), 'body ' + index, 'app.media.icon_comment_app_logo1', '02-07 13:25', [imageUriFor(index)]);
        journal.appendDraft(draft);
      }
      expect(journal.size()).assertEqual(20);
      expect(journal.ids().length).assertEqual(20);
      expect(journal.totalImages()).assertEqual(20);
      expect(journal.countByName('user_0') + journal.countByName('user_1') + journal.countByName('user_2')).assertEqual(20);
      expect(journal.ids()[0]).assertEqual(1);
      expect(lcg.nextInt(10) >= 0).assertTrue();
      expect(journal.joinTexts(',').length > 0).assertTrue();
    });
    /**
     * @tc.name PublishWorkloadTest_case_017
     * @tc.desc workload: 30 publish cycles keep id and name bookkeeping (PublishWorkloadTest case 17)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishWorkloadTest_case_017', 0, async () => {
      const journal: CommentJournal = new CommentJournal();
      const lcg: Lcg = new Lcg(17);
      for (let index = 0; index < 30; index++) {
        const draft: CommentDraft = new CommentDraft('user_' + (index % 3), 'body ' + index, 'app.media.icon_comment_app_logo1', '02-07 13:25', [imageUriFor(index)]);
        journal.appendDraft(draft);
      }
      expect(journal.size()).assertEqual(30);
      expect(journal.ids().length).assertEqual(30);
      expect(journal.totalImages()).assertEqual(30);
      expect(journal.countByName('user_0') + journal.countByName('user_1') + journal.countByName('user_2')).assertEqual(30);
      expect(journal.ids()[0]).assertEqual(1);
      expect(lcg.nextInt(10) >= 0).assertTrue();
      expect(journal.joinTexts(',').length > 0).assertTrue();
    });
    /**
     * @tc.name PublishWorkloadTest_case_018
     * @tc.desc workload: 40 publish cycles keep id and name bookkeeping (PublishWorkloadTest case 18)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishWorkloadTest_case_018', 0, async () => {
      const journal: CommentJournal = new CommentJournal();
      const lcg: Lcg = new Lcg(18);
      for (let index = 0; index < 40; index++) {
        const draft: CommentDraft = new CommentDraft('user_' + (index % 3), 'body ' + index, 'app.media.icon_comment_app_logo1', '02-07 13:25', [imageUriFor(index)]);
        journal.appendDraft(draft);
      }
      expect(journal.size()).assertEqual(40);
      expect(journal.ids().length).assertEqual(40);
      expect(journal.totalImages()).assertEqual(40);
      expect(journal.countByName('user_0') + journal.countByName('user_1') + journal.countByName('user_2')).assertEqual(40);
      expect(journal.ids()[0]).assertEqual(1);
      expect(lcg.nextInt(10) >= 0).assertTrue();
      expect(journal.joinTexts(',').length > 0).assertTrue();
    });
    /**
     * @tc.name PublishWorkloadTest_case_019
     * @tc.desc workload: 50 publish cycles keep id and name bookkeeping (PublishWorkloadTest case 19)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishWorkloadTest_case_019', 0, async () => {
      const journal: CommentJournal = new CommentJournal();
      const lcg: Lcg = new Lcg(19);
      for (let index = 0; index < 50; index++) {
        const draft: CommentDraft = new CommentDraft('user_' + (index % 3), 'body ' + index, 'app.media.icon_comment_app_logo1', '02-07 13:25', [imageUriFor(index)]);
        journal.appendDraft(draft);
      }
      expect(journal.size()).assertEqual(50);
      expect(journal.ids().length).assertEqual(50);
      expect(journal.totalImages()).assertEqual(50);
      expect(journal.countByName('user_0') + journal.countByName('user_1') + journal.countByName('user_2')).assertEqual(50);
      expect(journal.ids()[0]).assertEqual(1);
      expect(lcg.nextInt(10) >= 0).assertTrue();
      expect(journal.joinTexts(',').length > 0).assertTrue();
    });
    /**
     * @tc.name PublishWorkloadTest_case_020
     * @tc.desc workload: 60 publish cycles keep id and name bookkeeping (PublishWorkloadTest case 20)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishWorkloadTest_case_020', 0, async () => {
      const journal: CommentJournal = new CommentJournal();
      const lcg: Lcg = new Lcg(20);
      for (let index = 0; index < 60; index++) {
        const draft: CommentDraft = new CommentDraft('user_' + (index % 3), 'body ' + index, 'app.media.icon_comment_app_logo1', '02-07 13:25', [imageUriFor(index)]);
        journal.appendDraft(draft);
      }
      expect(journal.size()).assertEqual(60);
      expect(journal.ids().length).assertEqual(60);
      expect(journal.totalImages()).assertEqual(60);
      expect(journal.countByName('user_0') + journal.countByName('user_1') + journal.countByName('user_2')).assertEqual(60);
      expect(journal.ids()[0]).assertEqual(1);
      expect(lcg.nextInt(10) >= 0).assertTrue();
      expect(journal.joinTexts(',').length > 0).assertTrue();
    });
    /**
     * @tc.name PublishWorkloadTest_case_021
     * @tc.desc workload: 20 publish cycles keep id and name bookkeeping (PublishWorkloadTest case 21)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishWorkloadTest_case_021', 0, async () => {
      const journal: CommentJournal = new CommentJournal();
      const lcg: Lcg = new Lcg(21);
      for (let index = 0; index < 20; index++) {
        const draft: CommentDraft = new CommentDraft('user_' + (index % 3), 'body ' + index, 'app.media.icon_comment_app_logo1', '02-07 13:25', [imageUriFor(index)]);
        journal.appendDraft(draft);
      }
      expect(journal.size()).assertEqual(20);
      expect(journal.ids().length).assertEqual(20);
      expect(journal.totalImages()).assertEqual(20);
      expect(journal.countByName('user_0') + journal.countByName('user_1') + journal.countByName('user_2')).assertEqual(20);
      expect(journal.ids()[0]).assertEqual(1);
      expect(lcg.nextInt(10) >= 0).assertTrue();
      expect(journal.joinTexts(',').length > 0).assertTrue();
    });
    /**
     * @tc.name PublishWorkloadTest_case_022
     * @tc.desc workload: 30 publish cycles keep id and name bookkeeping (PublishWorkloadTest case 22)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishWorkloadTest_case_022', 0, async () => {
      const journal: CommentJournal = new CommentJournal();
      const lcg: Lcg = new Lcg(22);
      for (let index = 0; index < 30; index++) {
        const draft: CommentDraft = new CommentDraft('user_' + (index % 3), 'body ' + index, 'app.media.icon_comment_app_logo1', '02-07 13:25', [imageUriFor(index)]);
        journal.appendDraft(draft);
      }
      expect(journal.size()).assertEqual(30);
      expect(journal.ids().length).assertEqual(30);
      expect(journal.totalImages()).assertEqual(30);
      expect(journal.countByName('user_0') + journal.countByName('user_1') + journal.countByName('user_2')).assertEqual(30);
      expect(journal.ids()[0]).assertEqual(1);
      expect(lcg.nextInt(10) >= 0).assertTrue();
      expect(journal.joinTexts(',').length > 0).assertTrue();
    });
    /**
     * @tc.name PublishWorkloadTest_case_023
     * @tc.desc workload: 40 publish cycles keep id and name bookkeeping (PublishWorkloadTest case 23)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishWorkloadTest_case_023', 0, async () => {
      const journal: CommentJournal = new CommentJournal();
      const lcg: Lcg = new Lcg(23);
      for (let index = 0; index < 40; index++) {
        const draft: CommentDraft = new CommentDraft('user_' + (index % 3), 'body ' + index, 'app.media.icon_comment_app_logo1', '02-07 13:25', [imageUriFor(index)]);
        journal.appendDraft(draft);
      }
      expect(journal.size()).assertEqual(40);
      expect(journal.ids().length).assertEqual(40);
      expect(journal.totalImages()).assertEqual(40);
      expect(journal.countByName('user_0') + journal.countByName('user_1') + journal.countByName('user_2')).assertEqual(40);
      expect(journal.ids()[0]).assertEqual(1);
      expect(lcg.nextInt(10) >= 0).assertTrue();
      expect(journal.joinTexts(',').length > 0).assertTrue();
    });
    /**
     * @tc.name PublishWorkloadTest_case_024
     * @tc.desc workload: 50 publish cycles keep id and name bookkeeping (PublishWorkloadTest case 24)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishWorkloadTest_case_024', 0, async () => {
      const journal: CommentJournal = new CommentJournal();
      const lcg: Lcg = new Lcg(24);
      for (let index = 0; index < 50; index++) {
        const draft: CommentDraft = new CommentDraft('user_' + (index % 3), 'body ' + index, 'app.media.icon_comment_app_logo1', '02-07 13:25', [imageUriFor(index)]);
        journal.appendDraft(draft);
      }
      expect(journal.size()).assertEqual(50);
      expect(journal.ids().length).assertEqual(50);
      expect(journal.totalImages()).assertEqual(50);
      expect(journal.countByName('user_0') + journal.countByName('user_1') + journal.countByName('user_2')).assertEqual(50);
      expect(journal.ids()[0]).assertEqual(1);
      expect(lcg.nextInt(10) >= 0).assertTrue();
      expect(journal.joinTexts(',').length > 0).assertTrue();
    });
    /**
     * @tc.name PublishWorkloadTest_case_025
     * @tc.desc workload: 60 publish cycles keep id and name bookkeeping (PublishWorkloadTest case 25)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishWorkloadTest_case_025', 0, async () => {
      const journal: CommentJournal = new CommentJournal();
      const lcg: Lcg = new Lcg(25);
      for (let index = 0; index < 60; index++) {
        const draft: CommentDraft = new CommentDraft('user_' + (index % 3), 'body ' + index, 'app.media.icon_comment_app_logo1', '02-07 13:25', [imageUriFor(index)]);
        journal.appendDraft(draft);
      }
      expect(journal.size()).assertEqual(60);
      expect(journal.ids().length).assertEqual(60);
      expect(journal.totalImages()).assertEqual(60);
      expect(journal.countByName('user_0') + journal.countByName('user_1') + journal.countByName('user_2')).assertEqual(60);
      expect(journal.ids()[0]).assertEqual(1);
      expect(lcg.nextInt(10) >= 0).assertTrue();
      expect(journal.joinTexts(',').length > 0).assertTrue();
    });
    /**
     * @tc.name PublishWorkloadTest_case_026
     * @tc.desc workload: 20 publish cycles keep id and name bookkeeping (PublishWorkloadTest case 26)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishWorkloadTest_case_026', 0, async () => {
      const journal: CommentJournal = new CommentJournal();
      const lcg: Lcg = new Lcg(26);
      for (let index = 0; index < 20; index++) {
        const draft: CommentDraft = new CommentDraft('user_' + (index % 3), 'body ' + index, 'app.media.icon_comment_app_logo1', '02-07 13:25', [imageUriFor(index)]);
        journal.appendDraft(draft);
      }
      expect(journal.size()).assertEqual(20);
      expect(journal.ids().length).assertEqual(20);
      expect(journal.totalImages()).assertEqual(20);
      expect(journal.countByName('user_0') + journal.countByName('user_1') + journal.countByName('user_2')).assertEqual(20);
      expect(journal.ids()[0]).assertEqual(1);
      expect(lcg.nextInt(10) >= 0).assertTrue();
      expect(journal.joinTexts(',').length > 0).assertTrue();
    });
    /**
     * @tc.name PublishWorkloadTest_case_027
     * @tc.desc workload: 30 publish cycles keep id and name bookkeeping (PublishWorkloadTest case 27)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishWorkloadTest_case_027', 0, async () => {
      const journal: CommentJournal = new CommentJournal();
      const lcg: Lcg = new Lcg(27);
      for (let index = 0; index < 30; index++) {
        const draft: CommentDraft = new CommentDraft('user_' + (index % 3), 'body ' + index, 'app.media.icon_comment_app_logo1', '02-07 13:25', [imageUriFor(index)]);
        journal.appendDraft(draft);
      }
      expect(journal.size()).assertEqual(30);
      expect(journal.ids().length).assertEqual(30);
      expect(journal.totalImages()).assertEqual(30);
      expect(journal.countByName('user_0') + journal.countByName('user_1') + journal.countByName('user_2')).assertEqual(30);
      expect(journal.ids()[0]).assertEqual(1);
      expect(lcg.nextInt(10) >= 0).assertTrue();
      expect(journal.joinTexts(',').length > 0).assertTrue();
    });
    /**
     * @tc.name PublishWorkloadTest_case_028
     * @tc.desc workload: 40 publish cycles keep id and name bookkeeping (PublishWorkloadTest case 28)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishWorkloadTest_case_028', 0, async () => {
      const journal: CommentJournal = new CommentJournal();
      const lcg: Lcg = new Lcg(28);
      for (let index = 0; index < 40; index++) {
        const draft: CommentDraft = new CommentDraft('user_' + (index % 3), 'body ' + index, 'app.media.icon_comment_app_logo1', '02-07 13:25', [imageUriFor(index)]);
        journal.appendDraft(draft);
      }
      expect(journal.size()).assertEqual(40);
      expect(journal.ids().length).assertEqual(40);
      expect(journal.totalImages()).assertEqual(40);
      expect(journal.countByName('user_0') + journal.countByName('user_1') + journal.countByName('user_2')).assertEqual(40);
      expect(journal.ids()[0]).assertEqual(1);
      expect(lcg.nextInt(10) >= 0).assertTrue();
      expect(journal.joinTexts(',').length > 0).assertTrue();
    });
    /**
     * @tc.name PublishWorkloadTest_case_029
     * @tc.desc workload: 50 publish cycles keep id and name bookkeeping (PublishWorkloadTest case 29)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishWorkloadTest_case_029', 0, async () => {
      const journal: CommentJournal = new CommentJournal();
      const lcg: Lcg = new Lcg(29);
      for (let index = 0; index < 50; index++) {
        const draft: CommentDraft = new CommentDraft('user_' + (index % 3), 'body ' + index, 'app.media.icon_comment_app_logo1', '02-07 13:25', [imageUriFor(index)]);
        journal.appendDraft(draft);
      }
      expect(journal.size()).assertEqual(50);
      expect(journal.ids().length).assertEqual(50);
      expect(journal.totalImages()).assertEqual(50);
      expect(journal.countByName('user_0') + journal.countByName('user_1') + journal.countByName('user_2')).assertEqual(50);
      expect(journal.ids()[0]).assertEqual(1);
      expect(lcg.nextInt(10) >= 0).assertTrue();
      expect(journal.joinTexts(',').length > 0).assertTrue();
    });
    /**
     * @tc.name PublishWorkloadTest_case_030
     * @tc.desc workload: 60 publish cycles keep id and name bookkeeping (PublishWorkloadTest case 30)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishWorkloadTest_case_030', 0, async () => {
      const journal: CommentJournal = new CommentJournal();
      const lcg: Lcg = new Lcg(30);
      for (let index = 0; index < 60; index++) {
        const draft: CommentDraft = new CommentDraft('user_' + (index % 3), 'body ' + index, 'app.media.icon_comment_app_logo1', '02-07 13:25', [imageUriFor(index)]);
        journal.appendDraft(draft);
      }
      expect(journal.size()).assertEqual(60);
      expect(journal.ids().length).assertEqual(60);
      expect(journal.totalImages()).assertEqual(60);
      expect(journal.countByName('user_0') + journal.countByName('user_1') + journal.countByName('user_2')).assertEqual(60);
      expect(journal.ids()[0]).assertEqual(1);
      expect(lcg.nextInt(10) >= 0).assertTrue();
      expect(journal.joinTexts(',').length > 0).assertTrue();
    });
    /**
     * @tc.name PublishWorkloadTest_case_031
     * @tc.desc workload: 20 publish cycles keep id and name bookkeeping (PublishWorkloadTest case 31)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishWorkloadTest_case_031', 0, async () => {
      const journal: CommentJournal = new CommentJournal();
      const lcg: Lcg = new Lcg(31);
      for (let index = 0; index < 20; index++) {
        const draft: CommentDraft = new CommentDraft('user_' + (index % 3), 'body ' + index, 'app.media.icon_comment_app_logo1', '02-07 13:25', [imageUriFor(index)]);
        journal.appendDraft(draft);
      }
      expect(journal.size()).assertEqual(20);
      expect(journal.ids().length).assertEqual(20);
      expect(journal.totalImages()).assertEqual(20);
      expect(journal.countByName('user_0') + journal.countByName('user_1') + journal.countByName('user_2')).assertEqual(20);
      expect(journal.ids()[0]).assertEqual(1);
      expect(lcg.nextInt(10) >= 0).assertTrue();
      expect(journal.joinTexts(',').length > 0).assertTrue();
    });
    /**
     * @tc.name PublishWorkloadTest_case_032
     * @tc.desc workload: 30 publish cycles keep id and name bookkeeping (PublishWorkloadTest case 32)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishWorkloadTest_case_032', 0, async () => {
      const journal: CommentJournal = new CommentJournal();
      const lcg: Lcg = new Lcg(32);
      for (let index = 0; index < 30; index++) {
        const draft: CommentDraft = new CommentDraft('user_' + (index % 3), 'body ' + index, 'app.media.icon_comment_app_logo1', '02-07 13:25', [imageUriFor(index)]);
        journal.appendDraft(draft);
      }
      expect(journal.size()).assertEqual(30);
      expect(journal.ids().length).assertEqual(30);
      expect(journal.totalImages()).assertEqual(30);
      expect(journal.countByName('user_0') + journal.countByName('user_1') + journal.countByName('user_2')).assertEqual(30);
      expect(journal.ids()[0]).assertEqual(1);
      expect(lcg.nextInt(10) >= 0).assertTrue();
      expect(journal.joinTexts(',').length > 0).assertTrue();
    });
    /**
     * @tc.name PublishWorkloadTest_case_033
     * @tc.desc workload: 40 publish cycles keep id and name bookkeeping (PublishWorkloadTest case 33)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishWorkloadTest_case_033', 0, async () => {
      const journal: CommentJournal = new CommentJournal();
      const lcg: Lcg = new Lcg(33);
      for (let index = 0; index < 40; index++) {
        const draft: CommentDraft = new CommentDraft('user_' + (index % 3), 'body ' + index, 'app.media.icon_comment_app_logo1', '02-07 13:25', [imageUriFor(index)]);
        journal.appendDraft(draft);
      }
      expect(journal.size()).assertEqual(40);
      expect(journal.ids().length).assertEqual(40);
      expect(journal.totalImages()).assertEqual(40);
      expect(journal.countByName('user_0') + journal.countByName('user_1') + journal.countByName('user_2')).assertEqual(40);
      expect(journal.ids()[0]).assertEqual(1);
      expect(lcg.nextInt(10) >= 0).assertTrue();
      expect(journal.joinTexts(',').length > 0).assertTrue();
    });
    /**
     * @tc.name PublishWorkloadTest_case_034
     * @tc.desc workload: 50 publish cycles keep id and name bookkeeping (PublishWorkloadTest case 34)
     * @tc.type Function
     * @tc.level Level1
     */
    it('PublishWorkloadTest_case_034', 0, async () => {
      const journal: CommentJournal = new CommentJournal();
      const lcg: Lcg = new Lcg(34);
      for (let index = 0; index < 50; index++) {
        const draft: CommentDraft = new CommentDraft('user_' + (index % 3), 'body ' + index, 'app.media.icon_comment_app_logo1', '02-07 13:25', [imageUriFor(index)]);
        journal.appendDraft(draft);
      }
      expect(journal.size()).assertEqual(50);
      expect(journal.ids().length).assertEqual(50);
      expect(journal.totalImages()).assertEqual(50);
      expect(journal.countByName('user_0') + journal.countByName('user_1') + journal.countByName('user_2')).assertEqual(50);
      expect(journal.ids()[0]).assertEqual(1);
      expect(lcg.nextInt(10) >= 0).assertTrue();
      expect(journal.joinTexts(',').length > 0).assertTrue();
    });
  });
}
