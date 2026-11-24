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
import { CommentData, FriendMoment } from 'publishmultimediaupdate/src/main/ets/model/BasicDataSource';
import { BUNDLE, TAG } from '../common/TestConstant';
import { DEFAULT_AVATAR, EMPTY_RESOURCE, OWNER_NAME, buildFullMoment, buildImageMoment, buildMoment, buildMoments, buildVideoMoment, textOfLength } from '../common/DataFactory';
/**
 * Collection contract of the CommentData lazy list source.
 * The page keeps one source per feed tab and appends every published update
 * through it, so the count and the insertion order decide what the user sees.
 */
export default function commentDataCollectionTest() {
  describe('CommentDataCollectionTest', () => {
    beforeAll(async (): Promise<void> => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_0100
     * @tc.name InitialCountIsZero001
     * @tc.desc Verify initial count is zero
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'InitialCountIsZero_001', 0, (): void => {
      Logger.info(TAG, 'InitialCountIsZero_001 begin');
      const source: CommentData = new CommentData();
      expect(source.totalCount()).assertEqual(0);
      const count: number = source.totalCount();
      const check01: boolean = Number.isInteger(count);
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'InitialCountIsZero_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_0200
     * @tc.name EmptySourceFirstReadUndefined002
     * @tc.desc Verify empty source first read undefined
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EmptySourceFirstReadUndefined_002', 0, (): void => {
      Logger.info(TAG, 'EmptySourceFirstReadUndefined_002 begin');
      const source: CommentData = new CommentData();
      expect(source.getData(0)).assertUndefined();
      const check01: boolean = source.totalCount() === 0;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'EmptySourceFirstReadUndefined_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_0300
     * @tc.name PushIncrementsCount003
     * @tc.desc Verify push increments count
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'PushIncrementsCount_003', 0, (): void => {
      Logger.info(TAG, 'PushIncrementsCount_003 begin');
      const source: CommentData = new CommentData();
      const first: FriendMoment = buildMoment('collect-0300', 'Author', 'first');
      const second: FriendMoment = buildMoment('collect-0301', 'Author', 'second');
      source.pushData(first);
      const afterFirst: number = source.totalCount();
      source.pushData(second);
      const afterSecond: number = source.totalCount();
      expect(afterFirst).assertEqual(1);
      expect(afterSecond).assertEqual(2);
      const check01: boolean = afterSecond === afterFirst + 1;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'PushIncrementsCount_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_0400
     * @tc.name PushAppendsToTail004
     * @tc.desc Verify push appends to tail
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'PushAppendsToTail_004', 0, (): void => {
      Logger.info(TAG, 'PushAppendsToTail_004 begin');
      const source: CommentData = new CommentData();
      const head: FriendMoment = buildMoment('collect-0400', 'Author', 'head');
      const tail: FriendMoment = buildMoment('collect-0401', 'Author', 'tail');
      source.pushData(head);
      source.pushData(tail);
      expect(source.getData(1).id).assertEqual('collect-0401');
      const check01: boolean = source.getData(1) === tail;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const check02: boolean = source.getData(0) === head;
      Logger.info(TAG, 'check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      Logger.info(TAG, 'PushAppendsToTail_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_0500
     * @tc.name PushKeepsPushedReference005
     * @tc.desc Verify push keeps pushed reference
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'PushKeepsPushedReference_005', 0, (): void => {
      Logger.info(TAG, 'PushKeepsPushedReference_005 begin');
      const source: CommentData = new CommentData();
      const row: FriendMoment = buildMoment('collect-0500', 'Author', 'identity');
      source.pushData(row);
      const fetched: FriendMoment = source.getData(0);
      const check01: boolean = fetched === row;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      expect(fetched.id).assertEqual('collect-0500');
      Logger.info(TAG, 'PushKeepsPushedReference_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_0600
     * @tc.name AddFirstIncrementsCount006
     * @tc.desc Verify add first increments count
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AddFirstIncrementsCount_006', 0, (): void => {
      Logger.info(TAG, 'AddFirstIncrementsCount_006 begin');
      const source: CommentData = new CommentData();
      const first: FriendMoment = buildMoment('collect-0600', 'Author', 'first');
      const second: FriendMoment = buildMoment('collect-0601', 'Author', 'second');
      source.addDataFirst(first);
      const afterFirst: number = source.totalCount();
      source.addDataFirst(second);
      const afterSecond: number = source.totalCount();
      expect(afterFirst).assertEqual(1);
      expect(afterSecond).assertEqual(2);
      const check01: boolean = afterSecond === afterFirst + 1;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'AddFirstIncrementsCount_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_0700
     * @tc.name AddFirstPlacesRowAtZero007
     * @tc.desc Verify add first stores the row at zero
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AddFirstPlacesRowAtZero_007', 0, (): void => {
      Logger.info(TAG, 'AddFirstPlacesRowAtZero_007 begin');
      const source: CommentData = new CommentData();
      const older: FriendMoment = buildMoment('collect-0700', 'Author', 'older');
      const newer: FriendMoment = buildMoment('collect-0701', 'Author', 'newer');
      source.pushData(older);
      source.addDataFirst(newer);
      const check01: boolean = source.getData(0) === newer;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      expect(source.getData(0).id).assertEqual('collect-0701');
      Logger.info(TAG, 'AddFirstPlacesRowAtZero_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_0800
     * @tc.name AddFirstShiftsOldRowToOne008
     * @tc.desc Verify add first shifts old row to one
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AddFirstShiftsOldRowToOne_008', 0, (): void => {
      Logger.info(TAG, 'AddFirstShiftsOldRowToOne_008 begin');
      const source: CommentData = new CommentData();
      const resident: FriendMoment = buildMoment('collect-0800', 'Scientist', 'resident');
      const arriving: FriendMoment = buildMoment('collect-0801', 'Engineer', 'arriving');
      source.pushData(resident);
      source.addDataFirst(arriving);
      expect(source.totalCount()).assertEqual(2);
      const check01: boolean = source.getData(1) === resident;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      expect(source.getData(1).text).assertEqual('resident');
      Logger.info(TAG, 'AddFirstShiftsOldRowToOne_008 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_0900
     * @tc.name AddFirstOnEmptyIsSingleRow009
     * @tc.desc Verify add first on empty is single row
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AddFirstOnEmptyIsSingleRow_009', 0, (): void => {
      Logger.info(TAG, 'AddFirstOnEmptyIsSingleRow_009 begin');
      const source: CommentData = new CommentData();
      const row: FriendMoment = buildMoment('collect-0900', 'Artist', 'only');
      source.addDataFirst(row);
      expect(source.totalCount()).assertEqual(1);
      const check01: boolean = source.totalCount() === 1 && source.getData(0) === row;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'AddFirstOnEmptyIsSingleRow_009 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_1000
     * @tc.name MixedPushAddFirstOrder010
     * @tc.desc Verify mixed push add first order
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'MixedPushAddFirstOrder_010', 0, (): void => {
      Logger.info(TAG, 'MixedPushAddFirstOrder_010 begin');
      const source: CommentData = new CommentData();
      const alpha: FriendMoment = buildMoment('collect-1000', 'Alpha', 'one');
      const beta: FriendMoment = buildMoment('collect-1001', 'Beta', 'two');
      const gamma: FriendMoment = buildMoment('collect-1002', 'Gamma', 'three');
      source.pushData(alpha);
      source.pushData(beta);
      source.addDataFirst(gamma);
      expect(source.totalCount()).assertEqual(3);
      expect(source.getData(0).id).assertEqual('collect-1002');
      expect(source.getData(1).id).assertEqual('collect-1000');
      expect(source.getData(2).id).assertEqual('collect-1001');
      Logger.info(TAG, 'MixedPushAddFirstOrder_010 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_1100
     * @tc.name CountMatchesPushCount011
     * @tc.desc Verify count matches push count
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'CountMatchesPushCount_011', 0, (): void => {
      Logger.info(TAG, 'CountMatchesPushCount_011 begin');
      const targets: Array<number> = [1, 2, 3, 5, 8, 13];
      let matched: number = 0;
      for (let position: number = 0; position < targets.length; position++) {
        const target: number = targets[position];
        const source: CommentData = new CommentData();
        const rows: Array<FriendMoment> = buildMoments(target, 'sweep_');
        for (let index: number = 0; index < rows.length; index++) {
          source.pushData(rows[index]);
        }
        if (source.totalCount() === target) {
          matched += 1;
        }
      }
      expect(matched).assertEqual(targets.length);
      Logger.info(TAG, 'CountMatchesPushCount_011 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_1200
     * @tc.name InsertionOrderAcrossIndices012
     * @tc.desc Verify insertion order across indices
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'InsertionOrderAcrossIndices_012', 0, (): void => {
      Logger.info(TAG, 'InsertionOrderAcrossIndices_012 begin');
      const source: CommentData = new CommentData();
      const rows: Array<FriendMoment> = buildMoments(5, 'order_');
      for (let index: number = 0; index < rows.length; index++) {
        source.pushData(rows[index]);
      }
      let matched: number = 0;
      for (let index: number = 0; index < rows.length; index++) {
        if (source.getData(index).id === 'order_' + index) {
          matched += 1;
        }
      }
      expect(matched).assertEqual(5);
      expect(source.getData(0).id).assertEqual('order_0');
      expect(source.getData(4).id).assertEqual('order_4');
      Logger.info(TAG, 'InsertionOrderAcrossIndices_012 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_1300
     * @tc.name HundredRowsInsertionOrder013
     * @tc.desc Verify hundred rows insertion order
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'HundredRowsInsertionOrder_013', 0, (): void => {
      Logger.info(TAG, 'HundredRowsInsertionOrder_013 begin');
      const source: CommentData = new CommentData();
      const rows: Array<FriendMoment> = buildMoments(100, 'hundred_');
      for (let index: number = 0; index < rows.length; index++) {
        source.pushData(rows[index]);
      }
      let mismatched: number = 0;
      for (let index: number = 0; index < rows.length; index++) {
        if (source.getData(index).id !== 'hundred_' + index) {
          mismatched += 1;
        }
      }
      expect(source.totalCount()).assertEqual(100);
      expect(mismatched).assertEqual(0);
      Logger.info(TAG, 'HundredRowsInsertionOrder_013 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_1400
     * @tc.name SameInstanceStoredTwice014
     * @tc.desc Verify same instance stored twice
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SameInstanceStoredTwice_014', 0, (): void => {
      Logger.info(TAG, 'SameInstanceStoredTwice_014 begin');
      const source: CommentData = new CommentData();
      const row: FriendMoment = buildMoment('collect-1400', 'Author', 'shared');
      source.pushData(row);
      source.pushData(row);
      expect(source.totalCount()).assertEqual(2);
      const check01: boolean = source.getData(0) === source.getData(1);
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const check02: boolean = source.getData(0) === row && source.getData(1) === row;
      Logger.info(TAG, 'check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      Logger.info(TAG, 'SameInstanceStoredTwice_014 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_1500
     * @tc.name CountIsIntegerType015
     * @tc.desc Verify count is integer type
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'CountIsIntegerType_015', 0, (): void => {
      Logger.info(TAG, 'CountIsIntegerType_015 begin');
      const source: CommentData = new CommentData();
      const rows: Array<FriendMoment> = buildMoments(3, 'type_');
      for (let index: number = 0; index < rows.length; index++) {
        source.pushData(rows[index]);
      }
      const count: number = source.totalCount();
      const check01: boolean = Number.isInteger(count);
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const check02: boolean = count === 3;
      Logger.info(TAG, 'check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      expect(count).assertEqual(3);
      Logger.info(TAG, 'CountIsIntegerType_015 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_1600
     * @tc.name PushedImageRowKeepsImage016
     * @tc.desc Verify pushed image row keeps image
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'PushedImageRowKeepsImage_016', 0, (): void => {
      Logger.info(TAG, 'PushedImageRowKeepsImage_016 begin');
      const source: CommentData = new CommentData();
      const row: FriendMoment = buildImageMoment('collect-1700', 'Zoologist', 'bird', 'file://photo_1700');
      source.pushData(row);
      expect(source.totalCount()).assertEqual(1);
      expect(source.getData(0).image).assertEqual('file://photo_1700');
      const check01: boolean = source.getData(0) === row;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'PushedImageRowKeepsImage_016 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_1700
     * @tc.name PushedVideoRowKeepsVideo017
     * @tc.desc Verify pushed video row keeps video
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'PushedVideoRowKeepsVideo_017', 0, (): void => {
      Logger.info(TAG, 'PushedVideoRowKeepsVideo_017 begin');
      const source: CommentData = new CommentData();
      const row: FriendMoment = buildVideoMoment('collect-1800', 'Engineer', 'drawing', 'file://clip_1800');
      source.pushData(row);
      expect(source.getData(0).video).assertEqual('file://clip_1800');
      const check01: boolean = source.getData(0).video === 'file://clip_1800';
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'PushedVideoRowKeepsVideo_017 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_1800
     * @tc.name PushedFullRowKeepsBothMedia018
     * @tc.desc Verify pushed full row keeps both media
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'PushedFullRowKeepsBothMedia_018', 0, (): void => {
      Logger.info(TAG, 'PushedFullRowKeepsBothMedia_018 begin');
      const source: CommentData = new CommentData();
      const row: FriendMoment = buildFullMoment('collect-1900', 'Architect', 'both', 'file://photo_1900', 'file://clip_1900');
      source.pushData(row);
      expect(source.getData(0).image).assertEqual('file://photo_1900');
      expect(source.getData(0).video).assertEqual('file://clip_1900');
      const check01: boolean = source.getData(0).image !== source.getData(0).video;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'PushedFullRowKeepsBothMedia_018 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_1900
     * @tc.name MediaSlotsNotCrossed019
     * @tc.desc Verify media slots not crossed
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'MediaSlotsNotCrossed_019', 0, (): void => {
      Logger.info(TAG, 'MediaSlotsNotCrossed_019 begin');
      const source: CommentData = new CommentData();
      const row: FriendMoment = buildFullMoment('collect-2000', 'IT Engineer', 'cross', 'file://image_2000', 'file://video_2000');
      source.pushData(row);
      expect(source.getData(0).image).assertContain('image_2000');
      const check01: boolean = source.getData(0).video === 'file://image_2000';
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertFalse();
      const check02: boolean = source.getData(0).image === 'file://video_2000';
      Logger.info(TAG, 'check02=' + JSON.stringify(check02));
      expect(check02).assertFalse();
      Logger.info(TAG, 'MediaSlotsNotCrossed_019 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_2000
     * @tc.name LastIndexShowsNewestPush020
     * @tc.desc Verify last index shows newest push
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'LastIndexShowsNewestPush_020', 0, (): void => {
      Logger.info(TAG, 'LastIndexShowsNewestPush_020 begin');
      const source: CommentData = new CommentData();
      const rows: Array<FriendMoment> = buildMoments(4, 'newest_');
      for (let index: number = 0; index < rows.length; index++) {
        source.pushData(rows[index]);
      }
      const lastIndex: number = source.totalCount() - 1;
      expect(lastIndex).assertEqual(3);
      const check01: boolean = source.getData(lastIndex) === rows[3];
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      expect(source.getData(3).id).assertEqual('newest_3');
      Logger.info(TAG, 'LastIndexShowsNewestPush_020 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_2100
     * @tc.name DistinctRowsAreDifferentObjects021
     * @tc.desc Verify distinct rows are different objects
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'DistinctRowsAreDifferentObjects_021', 0, (): void => {
      Logger.info(TAG, 'DistinctRowsAreDifferentObjects_021 begin');
      const source: CommentData = new CommentData();
      const first: FriendMoment = buildMoment('collect-2200', 'Author', 'same text');
      const second: FriendMoment = buildMoment('collect-2201', 'Author', 'same text');
      source.pushData(first);
      source.pushData(second);
      const check01: boolean = source.getData(0) === source.getData(1);
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertFalse();
      const check02: boolean = source.getData(0).id !== source.getData(1).id;
      Logger.info(TAG, 'check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      Logger.info(TAG, 'DistinctRowsAreDifferentObjects_021 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_2200
     * @tc.name RowFieldsSurviveCollection022
     * @tc.desc Verify row fields survive collection
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'RowFieldsSurviveCollection_022', 0, (): void => {
      Logger.info(TAG, 'RowFieldsSurviveCollection_022 begin');
      const source: CommentData = new CommentData();
      const row: FriendMoment = buildMoment('collect-2300', 'Scientist', '今天研究个大火箭');
      source.pushData(row);
      expect(source.getData(0).userName).assertEqual('Scientist');
      expect(source.getData(0).text).assertContain('大火箭');
      expect(source.getData(0).avatar).assertEqual(DEFAULT_AVATAR);
      const check01: boolean = source.getData(0).userName === 'Scientist';
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'RowFieldsSurviveCollection_022 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_2300
     * @tc.name AddFirstTwiceNewestFirst023
     * @tc.desc Verify add first twice newest first
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AddFirstTwiceNewestFirst_023', 0, (): void => {
      Logger.info(TAG, 'AddFirstTwiceNewestFirst_023 begin');
      const source: CommentData = new CommentData();
      const base: FriendMoment = buildMoment('collect-2400', 'Author', 'base');
      const first: FriendMoment = buildMoment('collect-2401', 'Author', 'first added');
      const second: FriendMoment = buildMoment('collect-2402', 'Author', 'second added');
      source.pushData(base);
      source.addDataFirst(first);
      source.addDataFirst(second);
      expect(source.totalCount()).assertEqual(3);
      expect(source.getData(0).id).assertEqual('collect-2402');
      expect(source.getData(1).id).assertEqual('collect-2401');
      expect(source.getData(2).id).assertEqual('collect-2400');
      Logger.info(TAG, 'AddFirstTwiceNewestFirst_023 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_2400
     * @tc.name CountGrowsByOnePerPush024
     * @tc.desc Verify count grows by one per push
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'CountGrowsByOnePerPush_024', 0, (): void => {
      Logger.info(TAG, 'CountGrowsByOnePerPush_024 begin');
      const source: CommentData = new CommentData();
      const rows: Array<FriendMoment> = buildMoments(10, 'step_');
      let matched: number = 0;
      for (let index: number = 0; index < rows.length; index++) {
        source.pushData(rows[index]);
        if (source.totalCount() === index + 1) {
          matched += 1;
        }
      }
      expect(matched).assertEqual(10);
      expect(source.totalCount()).assertEqual(10);
      Logger.info(TAG, 'CountGrowsByOnePerPush_024 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_2500
     * @tc.name IdsUniqueAcrossBatch025
     * @tc.desc Verify ids unique across batch
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'IdsUniqueAcrossBatch_025', 0, (): void => {
      Logger.info(TAG, 'IdsUniqueAcrossBatch_025 begin');
      const source: CommentData = new CommentData();
      const rows: Array<FriendMoment> = buildMoments(100, 'unique_');
      for (let index: number = 0; index < rows.length; index++) {
        source.pushData(rows[index]);
      }
      const seen: Array<string> = [];
      for (let index: number = 0; index < rows.length; index++) {
        const id: string = source.getData(index).id;
        if (seen.indexOf(id) < 0) {
          seen.push(id);
        }
      }
      expect(seen.length).assertEqual(100);
      const check01: boolean = seen.length === source.totalCount();
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'IdsUniqueAcrossBatch_025 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_2600
     * @tc.name OwnerMomentStored026
     * @tc.desc Verify owner moment stored
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'OwnerMomentStored_026', 0, (): void => {
      Logger.info(TAG, 'OwnerMomentStored_026 begin');
      const source: CommentData = new CommentData();
      const row: FriendMoment = buildMoment('collect-2700', OWNER_NAME, '发布内容');
      source.pushData(row);
      expect(source.getData(0).userName).assertEqual(String.fromCharCode(25105, 30340));
      expect(source.getData(0).text).assertEqual('发布内容');
      const check01: boolean = source.getData(0).userName === OWNER_NAME;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'OwnerMomentStored_026 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_2700
     * @tc.name PushAfterAddFirstAppendsAtTail027
     * @tc.desc Verify push after add first appends at tail
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'PushAfterAddFirstAppendsAtTail_027', 0, (): void => {
      Logger.info(TAG, 'PushAfterAddFirstAppendsAtTail_027 begin');
      const source: CommentData = new CommentData();
      const prepended: FriendMoment = buildMoment('collect-2800', 'Author', 'prepended');
      const appended: FriendMoment = buildMoment('collect-2801', 'Author', 'appended');
      source.addDataFirst(prepended);
      source.pushData(appended);
      expect(source.totalCount()).assertEqual(2);
      expect(source.getData(0).id).assertEqual('collect-2800');
      const check01: boolean = source.getData(1) === appended;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'PushAfterAddFirstAppendsAtTail_027 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_2800
     * @tc.name LongTextRowKeepsLength028
     * @tc.desc Verify long text row keeps length
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'LongTextRowKeepsLength_028', 0, (): void => {
      Logger.info(TAG, 'LongTextRowKeepsLength_028 begin');
      const source: CommentData = new CommentData();
      const body: string = textOfLength(4096, 'publish');
      const row: FriendMoment = buildMoment('collect-2900', 'Author', body);
      source.pushData(row);
      expect(source.getData(0).text.length).assertEqual(4096);
      const check01: boolean = source.getData(0).text === body;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'LongTextRowKeepsLength_028 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_2900
     * @tc.name SameTextDifferentIdsKeptApart029
     * @tc.desc Verify same text different ids kept apart
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SameTextDifferentIdsKeptApart_029', 0, (): void => {
      Logger.info(TAG, 'SameTextDifferentIdsKeptApart_029 begin');
      const source: CommentData = new CommentData();
      source.pushData(buildMoment('collect-3000', 'Chef', '来杯香槟'));
      source.pushData(buildMoment('collect-3001', 'Chef', '来杯香槟'));
      expect(source.totalCount()).assertEqual(2);
      expect(source.getData(0).text).assertEqual(source.getData(1).text);
      const check01: boolean = source.getData(0).id !== source.getData(1).id;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'SameTextDifferentIdsKeptApart_029 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_3000
     * @tc.name ReadsDoNotChangeCount030
     * @tc.desc Verify reads do not change count
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ReadsDoNotChangeCount_030', 0, (): void => {
      Logger.info(TAG, 'ReadsDoNotChangeCount_030 begin');
      const source: CommentData = new CommentData();
      const rows: Array<FriendMoment> = buildMoments(3, 'read_');
      for (let index: number = 0; index < rows.length; index++) {
        source.pushData(rows[index]);
      }
      const before: number = source.totalCount();
      for (let round: number = 0; round < 5; round++) {
        source.getData(0);
        source.getData(1);
        source.getData(2);
      }
      const after: number = source.totalCount();
      expect(before).assertEqual(3);
      expect(after).assertEqual(3);
      const check01: boolean = before === after;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'ReadsDoNotChangeCount_030 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_3100
     * @tc.name BatchOfFortyPushAll031
     * @tc.desc Verify batch of forty push all
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'BatchOfFortyPushAll_031', 0, (): void => {
      Logger.info(TAG, 'BatchOfFortyPushAll_031 begin');
      const source: CommentData = new CommentData();
      const rows: Array<FriendMoment> = buildMoments(40, 'batch_');
      for (let index: number = 0; index < rows.length; index++) {
        source.pushData(rows[index]);
      }
      expect(source.totalCount()).assertEqual(40);
      expect(source.getData(39).id).assertEqual('batch_39');
      const check01: boolean = source.getData(39) === rows[39];
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      expect(source.getData(39).text).assertEqual('text_batch_39');
      Logger.info(TAG, 'BatchOfFortyPushAll_031 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_3200
     * @tc.name FirstRowSurvivesManyAppends032
     * @tc.desc Verify first row survives many appends
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'FirstRowSurvivesManyAppends_032', 0, (): void => {
      Logger.info(TAG, 'FirstRowSurvivesManyAppends_032 begin');
      const source: CommentData = new CommentData();
      const first: FriendMoment = buildMoment('collect-3300', 'Author', 'earliest');
      source.pushData(first);
      const later: Array<FriendMoment> = buildMoments(50, 'later_');
      for (let index: number = 0; index < later.length; index++) {
        source.pushData(later[index]);
      }
      expect(source.totalCount()).assertEqual(51);
      expect(source.getData(0).id).assertEqual('collect-3300');
      const check01: boolean = source.getData(0) === first;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'FirstRowSurvivesManyAppends_032 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_3300
     * @tc.name ImageRowHasUndefinedVideo033
     * @tc.desc Verify image row has undefined video
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ImageRowHasUndefinedVideo_033', 0, (): void => {
      Logger.info(TAG, 'ImageRowHasUndefinedVideo_033 begin');
      const source: CommentData = new CommentData();
      const row: FriendMoment = buildImageMoment('collect-3400', 'Artist', 'drawing', 'file://photo_3400');
      source.pushData(row);
      expect(source.getData(0).video).assertUndefined();
      const check01: boolean = source.getData(0).image !== undefined;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'ImageRowHasUndefinedVideo_033 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_3400
     * @tc.name MixedMediaRowsCoexist034
     * @tc.desc Verify mixed media rows coexist
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'MixedMediaRowsCoexist_034', 0, (): void => {
      Logger.info(TAG, 'MixedMediaRowsCoexist_034 begin');
      const source: CommentData = new CommentData();
      const imageRow: FriendMoment = buildImageMoment('collect-3500', 'Zoologist', 'bird', 'file://photo_3500');
      const videoRow: FriendMoment = buildVideoMoment('collect-3501', 'Chef', 'cheers', 'file://clip_3500');
      source.pushData(imageRow);
      source.pushData(videoRow);
      expect(source.getData(0).image).assertEqual('file://photo_3500');
      expect(source.getData(1).video).assertEqual('file://clip_3500');
      expect(source.getData(1).image).assertEqual(EMPTY_RESOURCE);
      Logger.info(TAG, 'MixedMediaRowsCoexist_034 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_3500
     * @tc.name CountAfterMixedWrites035
     * @tc.desc Verify count after mixed writes
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'CountAfterMixedWrites_035', 0, (): void => {
      Logger.info(TAG, 'CountAfterMixedWrites_035 begin');
      const source: CommentData = new CommentData();
      const pushed: Array<FriendMoment> = buildMoments(2, 'mixed_');
      source.pushData(pushed[0]);
      source.pushData(pushed[1]);
      const prepended: Array<FriendMoment> = buildMoments(3, 'front_');
      for (let index: number = 0; index < prepended.length; index++) {
        source.addDataFirst(prepended[index]);
      }
      expect(source.totalCount()).assertEqual(5);
      expect(source.getData(0).id).assertEqual('front_2');
      expect(source.getData(4).id).assertEqual('mixed_1');
      const check01: boolean = source.totalCount() === 2 + 3;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'CountAfterMixedWrites_035 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_3600
     * @tc.name AddFirstOnlyListOrder036
     * @tc.desc Verify add first only list order
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AddFirstOnlyListOrder_036', 0, (): void => {
      Logger.info(TAG, 'AddFirstOnlyListOrder_036 begin');
      const source: CommentData = new CommentData();
      source.addDataFirst(buildMoment('collect-3700', 'Author', 'earliest'));
      source.addDataFirst(buildMoment('collect-3701', 'Author', 'middle'));
      source.addDataFirst(buildMoment('collect-3702', 'Author', 'latest'));
      expect(source.totalCount()).assertEqual(3);
      expect(source.getData(0).id).assertEqual('collect-3702');
      expect(source.getData(1).id).assertEqual('collect-3701');
      expect(source.getData(2).id).assertEqual('collect-3700');
      Logger.info(TAG, 'AddFirstOnlyListOrder_036 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_3700
     * @tc.name RePushDoesNotMoveRow037
     * @tc.desc Verify re push does not move row
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'RePushDoesNotMoveRow_037', 0, (): void => {
      Logger.info(TAG, 'RePushDoesNotMoveRow_037 begin');
      const source: CommentData = new CommentData();
      const marker: FriendMoment = buildMoment('collect-3800', 'Author', 'marker');
      const neighbor: FriendMoment = buildMoment('collect-3801', 'Author', 'neighbor');
      source.pushData(marker);
      source.pushData(neighbor);
      source.pushData(marker);
      expect(source.totalCount()).assertEqual(3);
      expect(source.getData(0).id).assertEqual('collect-3800');
      expect(source.getData(1).id).assertEqual('collect-3801');
      const check01: boolean = source.getData(1) === neighbor;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'RePushDoesNotMoveRow_037 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_3800
     * @tc.name AddFirstAfterThirtyPushes038
     * @tc.desc Verify add first after thirty pushes
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AddFirstAfterThirtyPushes_038', 0, (): void => {
      Logger.info(TAG, 'AddFirstAfterThirtyPushes_038 begin');
      const source: CommentData = new CommentData();
      const rows: Array<FriendMoment> = buildMoments(30, 'deep_');
      for (let index: number = 0; index < rows.length; index++) {
        source.pushData(rows[index]);
      }
      const fresh: FriendMoment = buildMoment('collect-3900', 'Author', 'fresh');
      source.addDataFirst(fresh);
      expect(source.totalCount()).assertEqual(31);
      expect(source.getData(0).id).assertEqual('collect-3900');
      expect(source.getData(1).id).assertEqual('deep_0');
      expect(source.getData(30).id).assertEqual('deep_29');
      const check01: boolean = source.getData(0) === fresh;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'AddFirstAfterThirtyPushes_038 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_3900
     * @tc.name QuotedTextRowKeepsContent039
     * @tc.desc Verify quoted text row keeps content
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'QuotedTextRowKeepsContent_039', 0, (): void => {
      Logger.info(TAG, 'QuotedTextRowKeepsContent_039 begin');
      const source: CommentData = new CommentData();
      const body: string = 'say "hi" and \\done\\';
      const row: FriendMoment = buildMoment('collect-4000', 'Author', body);
      source.pushData(row);
      expect(source.getData(0).text).assertContain('"hi"');
      expect(source.getData(0).text).assertContain('\\done\\');
      const check01: boolean = source.getData(0).text === body;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'QuotedTextRowKeepsContent_039 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_4000
     * @tc.name AvatarResourceIdentityKept040
     * @tc.desc Verify avatar resource identity kept
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AvatarResourceIdentityKept_040', 0, (): void => {
      Logger.info(TAG, 'AvatarResourceIdentityKept_040 begin');
      const source: CommentData = new CommentData();
      const avatar: Resource = $r('app.media.Zoologist');
      const row: FriendMoment = new FriendMoment('collect-4100', 'Zoologist', avatar, 'bird');
      source.pushData(row);
      const check01: boolean = source.getData(0).avatar === avatar;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      expect(source.getData(0).userName).assertEqual('Zoologist');
      Logger.info(TAG, 'AvatarResourceIdentityKept_040 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_4100
     * @tc.name MiddleIndexAfterBatch041
     * @tc.desc Verify middle index after batch
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'MiddleIndexAfterBatch_041', 0, (): void => {
      Logger.info(TAG, 'MiddleIndexAfterBatch_041 begin');
      const source: CommentData = new CommentData();
      const rows: Array<FriendMoment> = buildMoments(60, 'middle_');
      for (let index: number = 0; index < rows.length; index++) {
        source.pushData(rows[index]);
      }
      expect(source.totalCount()).assertEqual(60);
      expect(source.getData(30).id).assertEqual('middle_30');
      const check01: boolean = source.getData(30) === rows[30];
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      expect(source.getData(30).userName).assertEqual('user_middle_30');
      Logger.info(TAG, 'MiddleIndexAfterBatch_041 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_4200
     * @tc.name MixedWritesCountPerStep042
     * @tc.desc Verify mixed writes count per step
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'MixedWritesCountPerStep_042', 0, (): void => {
      Logger.info(TAG, 'MixedWritesCountPerStep_042 begin');
      const source: CommentData = new CommentData();
      let operations: number = 0;
      let matched: number = 0;
      source.pushData(buildMoment('collect-4300', 'Author', 'one'));
      operations += 1;
      if (source.totalCount() === operations) {
        matched += 1;
      }
      source.addDataFirst(buildMoment('collect-4301', 'Author', 'two'));
      operations += 1;
      if (source.totalCount() === operations) {
        matched += 1;
      }
      source.pushData(buildMoment('collect-4302', 'Author', 'three'));
      operations += 1;
      if (source.totalCount() === operations) {
        matched += 1;
      }
      source.addDataFirst(buildMoment('collect-4303', 'Author', 'four'));
      operations += 1;
      if (source.totalCount() === operations) {
        matched += 1;
      }
      source.addDataFirst(buildMoment('collect-4304', 'Author', 'five'));
      operations += 1;
      if (source.totalCount() === operations) {
        matched += 1;
      }
      expect(matched).assertEqual(5);
      expect(source.totalCount()).assertEqual(5);
      Logger.info(TAG, 'MixedWritesCountPerStep_042 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_4300
     * @tc.name BatchUserNamesMatchHelper043
     * @tc.desc Verify batch user names match helper
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'BatchUserNamesMatchHelper_043', 0, (): void => {
      Logger.info(TAG, 'BatchUserNamesMatchHelper_043 begin');
      const source: CommentData = new CommentData();
      const rows: Array<FriendMoment> = buildMoments(20, 'meta_');
      for (let index: number = 0; index < rows.length; index++) {
        source.pushData(rows[index]);
      }
      let mismatched: number = 0;
      for (let index: number = 0; index < rows.length; index++) {
        if (source.getData(index).userName !== 'user_meta_' + index) {
          mismatched += 1;
        }
      }
      expect(mismatched).assertEqual(0);
      const check01: boolean = source.getData(19).userName === 'user_meta_19';
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'BatchUserNamesMatchHelper_043 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_4400
     * @tc.name IdWithSpacesKept044
     * @tc.desc Verify id with spaces kept
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'IdWithSpacesKept_044', 0, (): void => {
      Logger.info(TAG, 'IdWithSpacesKept_044 begin');
      const source: CommentData = new CommentData();
      const row: FriendMoment = buildMoment('id with spaces 4500', 'Author', 'spaced');
      source.pushData(row);
      expect(source.getData(0).id).assertEqual('id with spaces 4500');
      expect(source.getData(0).id).assertContain(' with ');
      const check01: boolean = source.getData(0).id.length === 19;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'IdWithSpacesKept_044 end');
    });
  });
}
