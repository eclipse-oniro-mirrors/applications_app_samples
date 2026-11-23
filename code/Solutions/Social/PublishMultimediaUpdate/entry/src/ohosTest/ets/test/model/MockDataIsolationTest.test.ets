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

import { describe, it, expect, beforeAll } from '@ohos/hypium';
import { yieldToEventLoop } from '../common/TestYield';
import Logger from '../Logger';
import { FriendMoment } from 'publishmultimediaupdate/src/main/ets/model/BasicDataSource';
import { CommentData } from 'publishmultimediaupdate/src/main/ets/model/BasicDataSource';
import { mockData } from 'publishmultimediaupdate/src/main/ets/model/mockdata';
import { BUNDLE, MOCK_COUNT, MOCK_IDS, MOCK_TEXTS, MOCK_USER_NAMES, MOCK_VIDEO_ROWS, TAG } from '../common/TestConstant';
/**
 * Isolation between two snapshots returned by mockData().
 * The page may call the factory again when the list is rebuilt, so a caller
 * that edits, appends or prepends a row must never see its edits leak into the
 * next snapshot. Every case builds two independent snapshots and mutates only
 * the first one.
 */
export default function mockDataIsolationTest() {
  describe('MockDataIsolationTest', () => {
    beforeAll(async (): Promise<void> => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MOCK_0100
     * @tc.name TwoCallsReturnDistinctSources001
     * @tc.desc Verify two calls return distinct sources
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'TwoCallsReturnDistinctSources_001', 0, (): void => {
      Logger.info(TAG, 'TwoCallsReturnDistinctSources_001 begin');
      const first: CommentData = mockData();
      const second: CommentData = mockData();
      const check01: boolean = first !== second;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      expect(first.totalCount()).assertEqual(MOCK_COUNT);
      expect(second.totalCount()).assertEqual(MOCK_COUNT);
      Logger.info(TAG, 'TwoCallsReturnDistinctSources_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MOCK_0200
     * @tc.name TwoCallsReturnDistinctFirstRows002
     * @tc.desc Verify two calls return distinct first rows
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'TwoCallsReturnDistinctFirstRows_002', 0, (): void => {
      Logger.info(TAG, 'TwoCallsReturnDistinctFirstRows_002 begin');
      const first: CommentData = mockData();
      const second: CommentData = mockData();
      const firstRow: FriendMoment = first.getData(0);
      const secondRow: FriendMoment = second.getData(0);
      const check01: boolean = firstRow !== secondRow;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      expect(secondRow.text).assertEqual(MOCK_TEXTS[0]);
      Logger.info(TAG, 'TwoCallsReturnDistinctFirstRows_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MOCK_0300
     * @tc.name EveryRowIsFreshPerCall003
     * @tc.desc Verify every row is fresh per call
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EveryRowIsFreshPerCall_003', 0, (): void => {
      Logger.info(TAG, 'EveryRowIsFreshPerCall_003 begin');
      const first: CommentData = mockData();
      const second: CommentData = mockData();
      let shared: number = 0;
      for (let index: number = 0; index < MOCK_COUNT; index++) {
        const check01: boolean = first.getData(index) === second.getData(index);
        if (check01) {
          shared += 1;
          Logger.info(TAG, 'row ' + index + ' is shared between snapshots');
        }
      }
      Logger.info(TAG, 'shared=' + shared);
      expect(shared).assertEqual(0);
      Logger.info(TAG, 'EveryRowIsFreshPerCall_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MOCK_0400
     * @tc.name TextMutationStaysLocal004
     * @tc.desc Verify text mutation stays local
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'TextMutationStaysLocal_004', 0, (): void => {
      Logger.info(TAG, 'TextMutationStaysLocal_004 begin');
      const first: CommentData = mockData();
      const second: CommentData = mockData();
      first.getData(0).text = 'edited by caller';
      expect(first.getData(0).text).assertEqual('edited by caller');
      expect(second.getData(0).text).assertEqual(MOCK_TEXTS[0]);
      const check01: boolean = second.getData(0).text !== 'edited by caller';
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'TextMutationStaysLocal_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MOCK_0500
     * @tc.name UserNameMutationStaysLocal005
     * @tc.desc Verify user name mutation stays local
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UserNameMutationStaysLocal_005', 0, (): void => {
      Logger.info(TAG, 'UserNameMutationStaysLocal_005 begin');
      const first: CommentData = mockData();
      const second: CommentData = mockData();
      first.getData(4).userName = 'Renamed Caller';
      expect(first.getData(4).userName).assertEqual('Renamed Caller');
      expect(second.getData(4).userName).assertEqual(MOCK_USER_NAMES[4]);
      expect(second.getData(4).userName).assertEqual('IT Engineer');
      Logger.info(TAG, 'UserNameMutationStaysLocal_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MOCK_0600
     * @tc.name IdMutationStaysLocal006
     * @tc.desc Verify id mutation stays local
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'IdMutationStaysLocal_006', 0, (): void => {
      Logger.info(TAG, 'IdMutationStaysLocal_006 begin');
      const first: CommentData = mockData();
      const second: CommentData = mockData();
      first.getData(3).id = 'temporary-key';
      expect(first.getData(3).id).assertEqual('temporary-key');
      expect(second.getData(3).id).assertEqual(MOCK_IDS[3]);
      const check01: boolean = second.getData(3).userName === 'Architect';
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'IdMutationStaysLocal_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MOCK_0700
     * @tc.name ImageMutationStaysLocal007
     * @tc.desc Verify image mutation stays local
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ImageMutationStaysLocal_007', 0, (): void => {
      Logger.info(TAG, 'ImageMutationStaysLocal_007 begin');
      const first: CommentData = mockData();
      const second: CommentData = mockData();
      first.getData(2).image = 'mutated-image-text';
      expect(first.getData(2).image).assertEqual('mutated-image-text');
      expect(second.getData(2).image).assertEqual('');
      const check01: boolean = second.getData(2).video !== undefined;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'ImageMutationStaysLocal_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MOCK_0800
     * @tc.name VideoSlotClearingStaysLocal008
     * @tc.desc Verify video slot clearing stays local
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'VideoSlotClearingStaysLocal_008', 0, (): void => {
      Logger.info(TAG, 'VideoSlotClearingStaysLocal_008 begin');
      const first: CommentData = mockData();
      const second: CommentData = mockData();
      first.getData(2).video = undefined;
      expect(first.getData(2).video).assertUndefined();
      const check01: boolean = second.getData(2).video !== undefined;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'VideoSlotClearingStaysLocal_008 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MOCK_0900
     * @tc.name PushedRowIsLocalToFirstCall009
     * @tc.desc Verify pushed row is local to first call
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'PushedRowIsLocalToFirstCall_009', 0, (): void => {
      Logger.info(TAG, 'PushedRowIsLocalToFirstCall_009 begin');
      const first: CommentData = mockData();
      const second: CommentData = mockData();
      first.pushData(new FriendMoment('extra', 'Extra', 'avatar-extra', 'extra row'));
      expect(first.totalCount()).assertEqual(MOCK_COUNT + 1);
      expect(second.totalCount()).assertEqual(MOCK_COUNT);
      expect(second.getData(MOCK_COUNT)).assertUndefined();
      Logger.info(TAG, 'PushedRowIsLocalToFirstCall_009 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MOCK_1000
     * @tc.name PrependedRowIsLocalToFirstCall010
     * @tc.desc Verify prepended row is local to first call
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'PrependedRowIsLocalToFirstCall_010', 0, (): void => {
      Logger.info(TAG, 'PrependedRowIsLocalToFirstCall_010 begin');
      const first: CommentData = mockData();
      const second: CommentData = mockData();
      first.addDataFirst(new FriendMoment('head', 'Head', 'avatar-head', 'head row'));
      expect(first.getData(0).text).assertEqual('head row');
      expect(second.getData(0).text).assertEqual(MOCK_TEXTS[0]);
      const check01: boolean = second.getData(0).id === MOCK_IDS[0];
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'PrependedRowIsLocalToFirstCall_010 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MOCK_1100
     * @tc.name IdSequencesMatchAcrossCalls011
     * @tc.desc Verify id sequences match across calls
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'IdSequencesMatchAcrossCalls_011', 0, (): void => {
      Logger.info(TAG, 'IdSequencesMatchAcrossCalls_011 begin');
      const first: CommentData = mockData();
      const second: CommentData = mockData();
      let mismatched: number = 0;
      for (let index: number = 0; index < MOCK_COUNT; index++) {
        if (first.getData(index).id !== second.getData(index).id) {
          mismatched += 1;
          Logger.info(TAG, 'id mismatch at row ' + index);
        }
      }
      Logger.info(TAG, 'mismatched=' + mismatched);
      expect(mismatched).assertEqual(0);
      Logger.info(TAG, 'IdSequencesMatchAcrossCalls_011 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MOCK_1200
     * @tc.name TextSequencesMatchAcrossCalls012
     * @tc.desc Verify text sequences match across calls
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'TextSequencesMatchAcrossCalls_012', 0, (): void => {
      Logger.info(TAG, 'TextSequencesMatchAcrossCalls_012 begin');
      const first: CommentData = mockData();
      const second: CommentData = mockData();
      let mismatched: number = 0;
      for (let index: number = 0; index < MOCK_COUNT; index++) {
        if (first.getData(index).text !== second.getData(index).text) {
          mismatched += 1;
          Logger.info(TAG, 'text mismatch at row ' + index);
        }
      }
      Logger.info(TAG, 'mismatched=' + mismatched);
      expect(mismatched).assertEqual(0);
      Logger.info(TAG, 'TextSequencesMatchAcrossCalls_012 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MOCK_1300
     * @tc.name UserNameSequencesMatchAcrossCalls013
     * @tc.desc Verify user name sequences match across calls
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UserNameSequencesMatchAcrossCalls_013', 0, (): void => {
      Logger.info(TAG, 'UserNameSequencesMatchAcrossCalls_013 begin');
      const first: CommentData = mockData();
      const second: CommentData = mockData();
      let mismatched: number = 0;
      for (let index: number = 0; index < MOCK_COUNT; index++) {
        if (first.getData(index).userName !== second.getData(index).userName) {
          mismatched += 1;
          Logger.info(TAG, 'user name mismatch at row ' + index);
        }
      }
      Logger.info(TAG, 'mismatched=' + mismatched);
      expect(mismatched).assertEqual(0);
      Logger.info(TAG, 'UserNameSequencesMatchAcrossCalls_013 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MOCK_1400
     * @tc.name RepeatedCallsKeepConstantCount014
     * @tc.desc Verify repeated calls keep constant count
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'RepeatedCallsKeepConstantCount_014', 0, (): void => {
      Logger.info(TAG, 'RepeatedCallsKeepConstantCount_014 begin');
      let wrongCount: number = 0;
      for (let attempt: number = 0; attempt < 5; attempt++) {
        const source: CommentData = mockData();
        const check01: boolean = source.totalCount() === MOCK_COUNT;
        if (!check01) {
          wrongCount += 1;
          Logger.info(TAG, 'attempt ' + attempt + ' count=' + source.totalCount());
        }
      }
      Logger.info(TAG, 'wrongCount=' + wrongCount);
      expect(wrongCount).assertEqual(0);
      Logger.info(TAG, 'RepeatedCallsKeepConstantCount_014 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MOCK_1500
     * @tc.name ThreeCallsProduceThreeDistinctSources015
     * @tc.desc Verify three calls produce three distinct sources
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ThreeCallsProduceThreeDistinctSources_015', 0, (): void => {
      Logger.info(TAG, 'ThreeCallsProduceThreeDistinctSources_015 begin');
      const first: CommentData = mockData();
      const second: CommentData = mockData();
      const third: CommentData = mockData();
      const check01: boolean = first !== second && second !== third && first !== third;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      expect(first.totalCount()).assertEqual(third.totalCount());
      Logger.info(TAG, 'ThreeCallsProduceThreeDistinctSources_015 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MOCK_1600
     * @tc.name FullRowRewriteDoesNotLeak016
     * @tc.desc Verify full row rewrite does not leak
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'FullRowRewriteDoesNotLeak_016', 0, (): void => {
      Logger.info(TAG, 'FullRowRewriteDoesNotLeak_016 begin');
      const first: CommentData = mockData();
      const second: CommentData = mockData();
      const row: FriendMoment = first.getData(1);
      row.id = 'rewritten';
      row.userName = 'Rewriter';
      row.text = 'rewritten text';
      row.image = 'rewritten-image';
      row.video = 'rewritten-video';
      const peer: FriendMoment = second.getData(1);
      expect(peer.id).assertEqual(MOCK_IDS[1]);
      expect(peer.userName).assertEqual(MOCK_USER_NAMES[1]);
      expect(peer.text).assertEqual(MOCK_TEXTS[1]);
      const check01: boolean = peer.video === undefined;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'FullRowRewriteDoesNotLeak_016 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MOCK_1700
     * @tc.name ReturnedSourceBehavesAsCommentData017
     * @tc.desc Verify returned source behaves as comment data
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ReturnedSourceBehavesAsCommentData_017', 0, (): void => {
      Logger.info(TAG, 'ReturnedSourceBehavesAsCommentData_017 begin');
      const source: CommentData = mockData();
      const before: number = source.totalCount();
      const extra: FriendMoment = new FriendMoment('extra', 'Extra', 'avatar-extra', 'extra row');
      source.pushData(extra);
      const after: number = source.totalCount();
      const check01: boolean = after === before + 1;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const check02: boolean = source.getData(after - 1) === extra;
      Logger.info(TAG, 'check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      Logger.info(TAG, 'ReturnedSourceBehavesAsCommentData_017 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MOCK_1800
     * @tc.name MediaSlotsOfSecondCallRemainSeeded018
     * @tc.desc Verify media slots of second call remain seeded
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'MediaSlotsOfSecondCallRemainSeeded_018', 0, (): void => {
      Logger.info(TAG, 'MediaSlotsOfSecondCallRemainSeeded_018 begin');
      const first: CommentData = mockData();
      first.getData(2).image = 'temporary-image';
      first.getData(2).video = undefined;
      const second: CommentData = mockData();
      expect(second.getData(2).image).assertEqual('');
      expect(second.getData(6).image).assertEqual('');
      const check01: boolean = second.getData(2).video !== undefined && second.getData(6).video !== undefined;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'MediaSlotsOfSecondCallRemainSeeded_018 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MOCK_1900
     * @tc.name CountUnaffectedByRowMutation019
     * @tc.desc Verify count unaffected by row mutation
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'CountUnaffectedByRowMutation_019', 0, (): void => {
      Logger.info(TAG, 'CountUnaffectedByRowMutation_019 begin');
      const first: CommentData = mockData();
      const second: CommentData = mockData();
      for (let index: number = 0; index < MOCK_COUNT; index++) {
        first.getData(index).text = 'rewritten-' + index;
      }
      expect(second.totalCount()).assertEqual(MOCK_COUNT);
      expect(second.getData(MOCK_COUNT - 1).text).assertEqual(MOCK_TEXTS[MOCK_COUNT - 1]);
      Logger.info(TAG, 'CountUnaffectedByRowMutation_019 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MOCK_2000
     * @tc.name BatchMutationDoesNotDriftAcrossCalls020
     * @tc.desc Verify batch mutation does not drift across calls
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'BatchMutationDoesNotDriftAcrossCalls_020', 0, (): void => {
      Logger.info(TAG, 'BatchMutationDoesNotDriftAcrossCalls_020 begin');
      const first: CommentData = mockData();
      const second: CommentData = mockData();
      for (let index: number = 0; index < 4; index++) {
        first.getData(index).text = 'batch-' + index;
      }
      let mismatched: number = 0;
      for (let index: number = 0; index < MOCK_COUNT; index++) {
        if (second.getData(index).text !== MOCK_TEXTS[index]) {
          mismatched += 1;
          Logger.info(TAG, 'drift at row ' + index);
        }
      }
      Logger.info(TAG, 'mismatched=' + mismatched);
      expect(mismatched).assertEqual(0);
      Logger.info(TAG, 'BatchMutationDoesNotDriftAcrossCalls_020 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MOCK_2100
     * @tc.name EmptyStringTextRewriteStaysLocal021
     * @tc.desc Verify empty string text rewrite stays local
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EmptyStringTextRewriteStaysLocal_021', 0, (): void => {
      Logger.info(TAG, 'EmptyStringTextRewriteStaysLocal_021 begin');
      const first: CommentData = mockData();
      const second: CommentData = mockData();
      first.getData(0).text = '';
      expect(first.getData(0).text).assertEqual('');
      expect(second.getData(0).text).assertEqual(MOCK_TEXTS[0]);
      const check01: boolean = second.getData(0).text.length !== 0;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'EmptyStringTextRewriteStaysLocal_021 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MOCK_2200
     * @tc.name ChefVideoClearingStaysLocal022
     * @tc.desc Verify chef video clearing stays local
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ChefVideoClearingStaysLocal_022', 0, (): void => {
      Logger.info(TAG, 'ChefVideoClearingStaysLocal_022 begin');
      const first: CommentData = mockData();
      const second: CommentData = mockData();
      first.getData(6).video = undefined;
      expect(first.getData(6).video).assertUndefined();
      const check01: boolean = second.getData(6).video !== undefined;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      expect(second.getData(6).text).assertEqual(MOCK_TEXTS[6]);
      Logger.info(TAG, 'ChefVideoClearingStaysLocal_022 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MOCK_2300
     * @tc.name ThirdSnapshotUnaffectedByFirstMutation023
     * @tc.desc Verify third snapshot unaffected by first mutation
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ThirdSnapshotUnaffectedByFirstMutation_023', 0, (): void => {
      Logger.info(TAG, 'ThirdSnapshotUnaffectedByFirstMutation_023 begin');
      const first: CommentData = mockData();
      const second: CommentData = mockData();
      const third: CommentData = mockData();
      first.getData(2).text = 'changed in first snapshot';
      expect(second.getData(2).text).assertEqual(MOCK_TEXTS[2]);
      expect(third.getData(2).text).assertEqual(MOCK_TEXTS[2]);
      const check01: boolean = second.getData(2) !== first.getData(2) && third.getData(2) !== first.getData(2);
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'ThirdSnapshotUnaffectedByFirstMutation_023 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MOCK_2400
     * @tc.name EqualValuedRowsAreStillDistinctObjects024
     * @tc.desc Verify equal valued rows are still distinct objects
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EqualValuedRowsAreStillDistinctObjects_024', 0, (): void => {
      Logger.info(TAG, 'EqualValuedRowsAreStillDistinctObjects_024 begin');
      const first: CommentData = mockData();
      const second: CommentData = mockData();
      let sharedPairs: number = 0;
      let equalPairs: number = 0;
      for (let index: number = 0; index < MOCK_COUNT; index++) {
        const left: FriendMoment = first.getData(index);
        const right: FriendMoment = second.getData(index);
        const sameIdentity: boolean = left === right;
        if (sameIdentity) {
          sharedPairs += 1;
        }
        const sameValue: boolean = left.id === right.id && left.userName === right.userName && left.text === right.text;
        if (sameValue) {
          equalPairs += 1;
        }
      }
      Logger.info(TAG, 'equalPairs=' + equalPairs + ' sharedPairs=' + sharedPairs);
      expect(equalPairs).assertEqual(MOCK_COUNT);
      expect(sharedPairs).assertEqual(0);
      Logger.info(TAG, 'EqualValuedRowsAreStillDistinctObjects_024 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MOCK_2500
     * @tc.name FiveCallsYieldFiveDistinctFirstRows025
     * @tc.desc Verify five calls yield five distinct first rows
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'FiveCallsYieldFiveDistinctFirstRows_025', 0, (): void => {
      Logger.info(TAG, 'FiveCallsYieldFiveDistinctFirstRows_025 begin');
      let rows: Array<FriendMoment> = [];
      for (let attempt: number = 0; attempt < 5; attempt++) {
        rows.push(mockData().getData(0));
      }
      let unique: number = 0;
      for (let position: number = 0; position < rows.length; position++) {
        if (rows.indexOf(rows[position]) === position) {
          unique += 1;
        }
      }
      Logger.info(TAG, 'unique=' + unique);
      expect(unique).assertEqual(5);
      expect(rows.length).assertEqual(5);
      Logger.info(TAG, 'FiveCallsYieldFiveDistinctFirstRows_025 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MOCK_2600
     * @tc.name VideoPositionsOfSecondStayFixed026
     * @tc.desc Verify video positions of second stay fixed
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'VideoPositionsOfSecondStayFixed_026', 0, (): void => {
      Logger.info(TAG, 'VideoPositionsOfSecondStayFixed_026 begin');
      const first: CommentData = mockData();
      first.getData(2).video = undefined;
      first.getData(0).video = 'late-video';
      const second: CommentData = mockData();
      let positions: Array<number> = [];
      for (let index: number = 0; index < MOCK_COUNT; index++) {
        if (second.getData(index).video !== undefined) {
          positions.push(index);
        }
      }
      Logger.info(TAG, 'positions=' + positions.join(','));
      expect(positions.length).assertEqual(MOCK_VIDEO_ROWS.length);
      for (let position: number = 0; position < positions.length; position++) {
        expect(positions[position]).assertEqual(MOCK_VIDEO_ROWS[position]);
      }
      Logger.info(TAG, 'VideoPositionsOfSecondStayFixed_026 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MOCK_2700
     * @tc.name AvatarClearingStaysLocal027
     * @tc.desc Verify avatar clearing stays local
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AvatarClearingStaysLocal_027', 0, (): void => {
      Logger.info(TAG, 'AvatarClearingStaysLocal_027 begin');
      const first: CommentData = mockData();
      const second: CommentData = mockData();
      first.getData(0).avatar = '';
      expect(first.getData(0).avatar).assertEqual('');
      const check01: boolean = second.getData(0).avatar !== undefined;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      expect(second.getData(0).userName).assertEqual(MOCK_USER_NAMES[0]);
      Logger.info(TAG, 'AvatarClearingStaysLocal_027 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MOCK_2800
     * @tc.name VideoAddedToImageRowStaysLocal028
     * @tc.desc Verify video added to image row stays local
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'VideoAddedToImageRowStaysLocal_028', 0, (): void => {
      Logger.info(TAG, 'VideoAddedToImageRowStaysLocal_028 begin');
      const first: CommentData = mockData();
      const second: CommentData = mockData();
      first.getData(0).video = 'late-video';
      expect(first.getData(0).video).assertEqual('late-video');
      const check01: boolean = second.getData(0).video === undefined;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      expect(second.getData(0).text).assertEqual(MOCK_TEXTS[0]);
      Logger.info(TAG, 'VideoAddedToImageRowStaysLocal_028 end');
    });
  });
}
