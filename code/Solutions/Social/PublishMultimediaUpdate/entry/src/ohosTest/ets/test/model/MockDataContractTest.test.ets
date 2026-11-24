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
import { mockData } from 'publishmultimediaupdate/src/main/ets/model/mockdata';
import { BUNDLE, MOCK_COUNT, MOCK_IDS, MOCK_IMAGE_ASSIGNED, MOCK_IMAGE_ROWS, MOCK_TEXTS, MOCK_USER_NAMES, MOCK_VIDEO_ROWS, TAG } from '../common/TestConstant';
/**
 * Contract of the seed data returned by mockData().
 * The first screen of the sample renders this fixed set, so every field of
 * every row is a visible promise: a wrong id breaks the lazy key, a wrong
 * media slot silently swaps a photo for a video, a missing avatar leaves a
 * blank circle. The cases below pin the seed shape row by row.
 */
export default function mockDataContractTest() {
  describe('MockDataContractTest', () => {
    beforeAll(async (): Promise<void> => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MOCK_0100
     * @tc.name TotalCountEqualsSeven001
     * @tc.desc Verify total count equals seven
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'TotalCountEqualsSeven_001', 0, (): void => {
      Logger.info(TAG, 'TotalCountEqualsSeven_001 begin');
      const source: CommentData = mockData();
      const count: number = source.totalCount();
      Logger.info(TAG, 'count=' + count);
      expect(count).assertEqual(7);
      Logger.info(TAG, 'TotalCountEqualsSeven_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MOCK_0200
     * @tc.name TotalCountMatchesSharedConstant002
     * @tc.desc Verify total count matches shared constant
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'TotalCountMatchesSharedConstant_002', 0, (): void => {
      Logger.info(TAG, 'TotalCountMatchesSharedConstant_002 begin');
      const source: CommentData = mockData();
      const check01: boolean = source.totalCount() === MOCK_COUNT;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'TotalCountMatchesSharedConstant_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MOCK_0300
     * @tc.name IdsSequentialAcrossRows003
     * @tc.desc Verify ids sequential across rows
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'IdsSequentialAcrossRows_003', 0, (): void => {
      Logger.info(TAG, 'IdsSequentialAcrossRows_003 begin');
      const source: CommentData = mockData();
      let mismatched: number = 0;
      for (let index: number = 0; index < MOCK_COUNT; index++) {
        const currentId: string = source.getData(index).id;
        if (currentId !== MOCK_IDS[index]) {
          mismatched += 1;
          Logger.info(TAG, 'row ' + index + ' carries id ' + currentId);
        }
      }
      Logger.info(TAG, 'mismatched=' + mismatched);
      expect(mismatched).assertEqual(0);
      Logger.info(TAG, 'IdsSequentialAcrossRows_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MOCK_0400
     * @tc.name FirstRowIdIsZero004
     * @tc.desc Verify first row id is zero
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'FirstRowIdIsZero_004', 0, (): void => {
      Logger.info(TAG, 'FirstRowIdIsZero_004 begin');
      const source: CommentData = mockData();
      const first: FriendMoment = source.getData(0);
      expect(first.id).assertEqual('0');
      expect(first.id.length).assertEqual(1);
      Logger.info(TAG, 'FirstRowIdIsZero_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MOCK_0500
     * @tc.name LastRowIdIsSix005
     * @tc.desc Verify last row id is six
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'LastRowIdIsSix_005', 0, (): void => {
      Logger.info(TAG, 'LastRowIdIsSix_005 begin');
      const source: CommentData = mockData();
      const last: FriendMoment = source.getData(MOCK_COUNT - 1);
      expect(last.id).assertEqual('6');
      const check01: boolean = last.id !== MOCK_IDS[0];
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'LastRowIdIsSix_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MOCK_0600
     * @tc.name UserNamesFollowSeedOrder006
     * @tc.desc Verify user names follow seed order
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UserNamesFollowSeedOrder_006', 0, (): void => {
      Logger.info(TAG, 'UserNamesFollowSeedOrder_006 begin');
      const source: CommentData = mockData();
      let mismatched: number = 0;
      for (let index: number = 0; index < MOCK_COUNT; index++) {
        const currentName: string = source.getData(index).userName;
        if (currentName !== MOCK_USER_NAMES[index]) {
          mismatched += 1;
          Logger.info(TAG, 'row ' + index + ' carries user ' + currentName);
        }
      }
      Logger.info(TAG, 'mismatched=' + mismatched);
      expect(mismatched).assertEqual(0);
      Logger.info(TAG, 'UserNamesFollowSeedOrder_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MOCK_0700
     * @tc.name ChefIsLastRow007
     * @tc.desc Verify chef is last row
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ChefIsLastRow_007', 0, (): void => {
      Logger.info(TAG, 'ChefIsLastRow_007 begin');
      const source: CommentData = mockData();
      const last: FriendMoment = source.getData(MOCK_COUNT - 1);
      expect(last.userName).assertEqual(MOCK_USER_NAMES[MOCK_USER_NAMES.length - 1]);
      expect(last.userName).assertEqual('Chef');
      expect(last.text).assertEqual('来杯香槟');
      Logger.info(TAG, 'ChefIsLastRow_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MOCK_0800
     * @tc.name TextsFollowSeedOrder008
     * @tc.desc Verify texts follow seed order
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'TextsFollowSeedOrder_008', 0, (): void => {
      Logger.info(TAG, 'TextsFollowSeedOrder_008 begin');
      const source: CommentData = mockData();
      let mismatched: number = 0;
      for (let index: number = 0; index < MOCK_COUNT; index++) {
        const currentText: string = source.getData(index).text;
        if (currentText !== MOCK_TEXTS[index]) {
          mismatched += 1;
          Logger.info(TAG, 'row ' + index + ' carries text ' + currentText);
        }
      }
      Logger.info(TAG, 'mismatched=' + mismatched);
      expect(mismatched).assertEqual(0);
      Logger.info(TAG, 'TextsFollowSeedOrder_008 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MOCK_0900
     * @tc.name FirstRowTextFullMatch009
     * @tc.desc Verify first row text full match
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'FirstRowTextFullMatch_009', 0, (): void => {
      Logger.info(TAG, 'FirstRowTextFullMatch_009 begin');
      const source: CommentData = mockData();
      const first: FriendMoment = source.getData(0);
      expect(first.text).assertEqual('好可爱的小鸟啊');
      expect(first.text).assertContain('小鸟');
      expect(first.text).assertContain('可爱');
      Logger.info(TAG, 'FirstRowTextFullMatch_009 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MOCK_1000
     * @tc.name EveryAvatarIsAssigned010
     * @tc.desc Verify every avatar is assigned
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EveryAvatarIsAssigned_010', 0, (): void => {
      Logger.info(TAG, 'EveryAvatarIsAssigned_010 begin');
      const source: CommentData = mockData();
      let missing: number = 0;
      for (let index: number = 0; index < MOCK_COUNT; index++) {
        const current: FriendMoment = source.getData(index);
        if (current.avatar === undefined) {
          missing += 1;
          Logger.info(TAG, 'row ' + index + ' has no avatar');
        }
      }
      Logger.info(TAG, 'missing=' + missing);
      expect(missing).assertEqual(0);
      Logger.info(TAG, 'EveryAvatarIsAssigned_010 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MOCK_1100
     * @tc.name EveryImageSlotIsAssigned011
     * @tc.desc Verify every image slot is assigned
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EveryImageSlotIsAssigned_011', 0, (): void => {
      Logger.info(TAG, 'EveryImageSlotIsAssigned_011 begin');
      const source: CommentData = mockData();
      let mismatched: number = 0;
      for (let index: number = 0; index < MOCK_COUNT; index++) {
        const assigned: boolean = source.getData(index).image !== undefined;
        if (assigned !== MOCK_IMAGE_ASSIGNED[index]) {
          mismatched += 1;
          Logger.info(TAG, 'row ' + index + ' assigned state ' + assigned);
        }
      }
      Logger.info(TAG, 'mismatched=' + mismatched);
      expect(mismatched).assertEqual(0);
      Logger.info(TAG, 'EveryImageSlotIsAssigned_011 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MOCK_1200
     * @tc.name EmptyImageRowsAreDefinedEmptyStrings012
     * @tc.desc Verify empty image rows are defined empty strings
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EmptyImageRowsAreDefinedEmptyStrings_012', 0, (): void => {
      Logger.info(TAG, 'EmptyImageRowsAreDefinedEmptyStrings_012 begin');
      const source: CommentData = mockData();
      for (let position: number = 0; position < MOCK_VIDEO_ROWS.length; position++) {
        const rowIndex: number = MOCK_VIDEO_ROWS[position];
        const row: FriendMoment = source.getData(rowIndex);
        const defined: boolean = row.image !== undefined;
        Logger.info(TAG, 'row ' + rowIndex + ' image defined=' + JSON.stringify(defined));
        expect(defined).assertTrue();
        expect(row.image).assertEqual('');
      }
      Logger.info(TAG, 'EmptyImageRowsAreDefinedEmptyStrings_012 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MOCK_1300
     * @tc.name ImageRowsHaveNoVideo013
     * @tc.desc Verify image rows have no video
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ImageRowsHaveNoVideo_013', 0, (): void => {
      Logger.info(TAG, 'ImageRowsHaveNoVideo_013 begin');
      const source: CommentData = mockData();
      let videoCount: number = 0;
      for (let position: number = 0; position < MOCK_IMAGE_ROWS.length; position++) {
        const rowIndex: number = MOCK_IMAGE_ROWS[position];
        if (source.getData(rowIndex).video !== undefined) {
          videoCount += 1;
          Logger.info(TAG, 'row ' + rowIndex + ' unexpectedly carries video');
        }
      }
      Logger.info(TAG, 'videoCount=' + videoCount);
      expect(videoCount).assertEqual(0);
      Logger.info(TAG, 'ImageRowsHaveNoVideo_013 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MOCK_1400
     * @tc.name VideoRowsCarryVideoSlot014
     * @tc.desc Verify video rows carry video slot
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'VideoRowsCarryVideoSlot_014', 0, (): void => {
      Logger.info(TAG, 'VideoRowsCarryVideoSlot_014 begin');
      const source: CommentData = mockData();
      for (let position: number = 0; position < MOCK_VIDEO_ROWS.length; position++) {
        const rowIndex: number = MOCK_VIDEO_ROWS[position];
        const row: FriendMoment = source.getData(rowIndex);
        const check01: boolean = row.video !== undefined;
        Logger.info(TAG, 'row ' + rowIndex + ' video defined=' + JSON.stringify(check01));
        expect(check01).assertTrue();
      }
      Logger.info(TAG, 'VideoRowsCarryVideoSlot_014 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MOCK_1500
     * @tc.name VideoSlotCountIsExactlyTwo015
     * @tc.desc Verify video slot count is exactly two
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'VideoSlotCountIsExactlyTwo_015', 0, (): void => {
      Logger.info(TAG, 'VideoSlotCountIsExactlyTwo_015 begin');
      const source: CommentData = mockData();
      let videoRows: number = 0;
      for (let index: number = 0; index < MOCK_COUNT; index++) {
        if (source.getData(index).video !== undefined) {
          videoRows += 1;
        }
      }
      Logger.info(TAG, 'videoRows=' + videoRows);
      expect(videoRows).assertEqual(2);
      expect(videoRows).assertEqual(MOCK_VIDEO_ROWS.length);
      Logger.info(TAG, 'VideoSlotCountIsExactlyTwo_015 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MOCK_1600
     * @tc.name EngineerRowMatchesSeedValues016
     * @tc.desc Verify engineer row matches seed values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EngineerRowMatchesSeedValues_016', 0, (): void => {
      Logger.info(TAG, 'EngineerRowMatchesSeedValues_016 begin');
      const source: CommentData = mockData();
      const engineer: FriendMoment = source.getData(2);
      expect(engineer.userName).assertEqual('Engineer');
      expect(engineer.text).assertEqual(MOCK_TEXTS[2]);
      expect(engineer.text).assertContain('图纸');
      const check01: boolean = engineer.id === MOCK_IDS[2];
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'EngineerRowMatchesSeedValues_016 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MOCK_1700
     * @tc.name ChefRowImageIsEmptyString017
     * @tc.desc Verify chef row image is empty string
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ChefRowImageIsEmptyString_017', 0, (): void => {
      Logger.info(TAG, 'ChefRowImageIsEmptyString_017 begin');
      const source: CommentData = mockData();
      const chef: FriendMoment = source.getData(6);
      expect(chef.image).assertEqual('');
      const check01: boolean = chef.image !== undefined;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'ChefRowImageIsEmptyString_017 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MOCK_1800
     * @tc.name ChefRowUsesVideoSlot018
     * @tc.desc Verify chef row uses video slot
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ChefRowUsesVideoSlot_018', 0, (): void => {
      Logger.info(TAG, 'ChefRowUsesVideoSlot_018 begin');
      const source: CommentData = mockData();
      const chef: FriendMoment = source.getData(6);
      const check01: boolean = chef.video !== undefined;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      expect(chef.image).assertEqual('');
      Logger.info(TAG, 'ChefRowUsesVideoSlot_018 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MOCK_1900
     * @tc.name IdsAreSingleCharacterText019
     * @tc.desc Verify ids are single character text
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'IdsAreSingleCharacterText_019', 0, (): void => {
      Logger.info(TAG, 'IdsAreSingleCharacterText_019 begin');
      const source: CommentData = mockData();
      let wrongLength: number = 0;
      for (let index: number = 0; index < MOCK_COUNT; index++) {
        const currentId: string = source.getData(index).id;
        if (currentId.length !== 1) {
          wrongLength += 1;
          Logger.info(TAG, 'row ' + index + ' id length ' + currentId.length);
        }
      }
      Logger.info(TAG, 'wrongLength=' + wrongLength);
      expect(wrongLength).assertEqual(0);
      Logger.info(TAG, 'IdsAreSingleCharacterText_019 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MOCK_2000
     * @tc.name FirstRowImageDiffersFromEmptySlot020
     * @tc.desc Verify first row image differs from empty slot
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'FirstRowImageDiffersFromEmptySlot_020', 0, (): void => {
      Logger.info(TAG, 'FirstRowImageDiffersFromEmptySlot_020 begin');
      const source: CommentData = mockData();
      const emptySlot: ResourceStr = '';
      const firstImage: ResourceStr = source.getData(0).image as ResourceStr;
      const check01: boolean = firstImage !== emptySlot;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'FirstRowImageDiffersFromEmptySlot_020 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MOCK_2100
     * @tc.name UserNamesAreAllDistinct021
     * @tc.desc Verify user names are all distinct
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UserNamesAreAllDistinct_021', 0, (): void => {
      Logger.info(TAG, 'UserNamesAreAllDistinct_021 begin');
      const source: CommentData = mockData();
      let unique: Array<string> = [];
      for (let index: number = 0; index < MOCK_COUNT; index++) {
        const currentName: string = source.getData(index).userName;
        if (unique.indexOf(currentName) < 0) {
          unique.push(currentName);
        }
      }
      Logger.info(TAG, 'uniqueCount=' + unique.length);
      expect(unique.length).assertEqual(MOCK_COUNT);
      Logger.info(TAG, 'UserNamesAreAllDistinct_021 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MOCK_2200
     * @tc.name TextsAreAllDistinct022
     * @tc.desc Verify texts are all distinct
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'TextsAreAllDistinct_022', 0, (): void => {
      Logger.info(TAG, 'TextsAreAllDistinct_022 begin');
      const source: CommentData = mockData();
      let unique: Array<string> = [];
      for (let index: number = 0; index < MOCK_COUNT; index++) {
        const currentText: string = source.getData(index).text;
        if (unique.indexOf(currentText) < 0) {
          unique.push(currentText);
        }
      }
      Logger.info(TAG, 'uniqueCount=' + unique.length);
      expect(unique.length).assertEqual(MOCK_COUNT);
      Logger.info(TAG, 'TextsAreAllDistinct_022 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MOCK_2300
     * @tc.name RowOrderStableAcrossRepeatedReads023
     * @tc.desc Verify row order stable across repeated reads
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'RowOrderStableAcrossRepeatedReads_023', 0, (): void => {
      Logger.info(TAG, 'RowOrderStableAcrossRepeatedReads_023 begin');
      const source: CommentData = mockData();
      let firstPass: string = '';
      let secondPass: string = '';
      for (let index: number = 0; index < MOCK_COUNT; index++) {
        firstPass += source.getData(index).id;
      }
      for (let index: number = 0; index < MOCK_COUNT; index++) {
        secondPass += source.getData(index).id;
      }
      Logger.info(TAG, 'firstPass=' + firstPass);
      expect(secondPass).assertEqual(firstPass);
      const check01: boolean = firstPass === '0123456';
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'RowOrderStableAcrossRepeatedReads_023 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MOCK_2400
     * @tc.name ReadPastLastRowReturnsUndefined024
     * @tc.desc Verify read past last row returns undefined
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ReadPastLastRowReturnsUndefined_024', 0, (): void => {
      Logger.info(TAG, 'ReadPastLastRowReturnsUndefined_024 begin');
      const source: CommentData = mockData();
      expect(source.getData(MOCK_COUNT)).assertUndefined();
      expect(source.getData(MOCK_COUNT + 1)).assertUndefined();
      Logger.info(TAG, 'ReadPastLastRowReturnsUndefined_024 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MOCK_2500
     * @tc.name GetDataIsStableForSameRow025
     * @tc.desc Verify get data is stable for same row
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'GetDataIsStableForSameRow_025', 0, (): void => {
      Logger.info(TAG, 'GetDataIsStableForSameRow_025 begin');
      const source: CommentData = mockData();
      const firstRead: FriendMoment = source.getData(3);
      const secondRead: FriendMoment = source.getData(3);
      const check01: boolean = firstRead === secondRead;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'GetDataIsStableForSameRow_025 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MOCK_2600
     * @tc.name EveryTextCarriesContent026
     * @tc.desc Verify every text carries content
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EveryTextCarriesContent_026', 0, (): void => {
      Logger.info(TAG, 'EveryTextCarriesContent_026 begin');
      const source: CommentData = mockData();
      let emptyText: number = 0;
      for (let index: number = 0; index < MOCK_COUNT; index++) {
        const currentText: string = source.getData(index).text;
        if (currentText.length === 0) {
          emptyText += 1;
        }
      }
      Logger.info(TAG, 'emptyText=' + emptyText);
      expect(emptyText).assertEqual(0);
      Logger.info(TAG, 'EveryTextCarriesContent_026 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MOCK_2700
     * @tc.name FirstRowSnapshotCombinesFields027
     * @tc.desc Verify first row snapshot combines fields
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'FirstRowSnapshotCombinesFields_027', 0, (): void => {
      Logger.info(TAG, 'FirstRowSnapshotCombinesFields_027 begin');
      const source: CommentData = mockData();
      const first: FriendMoment = source.getData(0);
      expect(first.id).assertEqual('0');
      expect(first.userName).assertEqual('Zoologist');
      expect(first.text).assertEqual('好可爱的小鸟啊');
      const check01: boolean = first.avatar !== undefined && first.image !== undefined;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'FirstRowSnapshotCombinesFields_027 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MOCK_2800
     * @tc.name LastRowSnapshotCombinesFields028
     * @tc.desc Verify last row snapshot combines fields
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'LastRowSnapshotCombinesFields_028', 0, (): void => {
      Logger.info(TAG, 'LastRowSnapshotCombinesFields_028 begin');
      const source: CommentData = mockData();
      const last: FriendMoment = source.getData(MOCK_COUNT - 1);
      expect(last.id).assertEqual('6');
      expect(last.userName).assertEqual('Chef');
      expect(last.text).assertEqual('来杯香槟');
      const check01: boolean = last.avatar !== undefined && last.video !== undefined;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'LastRowSnapshotCombinesFields_028 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MOCK_2900
     * @tc.name FirstAndLastRowAreDifferentObjects029
     * @tc.desc Verify first and last row are different objects
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'FirstAndLastRowAreDifferentObjects_029', 0, (): void => {
      Logger.info(TAG, 'FirstAndLastRowAreDifferentObjects_029 begin');
      const source: CommentData = mockData();
      const first: FriendMoment = source.getData(0);
      const last: FriendMoment = source.getData(MOCK_COUNT - 1);
      const check01: boolean = first !== last;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      expect(first.text).assertContain('小鸟');
      expect(last.text).assertContain('香槟');
      Logger.info(TAG, 'FirstAndLastRowAreDifferentObjects_029 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MOCK_3000
     * @tc.name ChineseTextLengthIsPreserved030
     * @tc.desc Verify chinese text length is preserved
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ChineseTextLengthIsPreserved_030', 0, (): void => {
      Logger.info(TAG, 'ChineseTextLengthIsPreserved_030 begin');
      const source: CommentData = mockData();
      const first: FriendMoment = source.getData(0);
      const last: FriendMoment = source.getData(MOCK_COUNT - 1);
      expect(first.text.length).assertEqual(7);
      expect(last.text.length).assertEqual(4);
      const check01: boolean = first.text.length !== last.text.length;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'ChineseTextLengthIsPreserved_030 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MOCK_3100
     * @tc.name SeedRowsPairNameWithKeyword031
     * @tc.desc Verify seed rows pair name with keyword
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SeedRowsPairNameWithKeyword_031', 0, (): void => {
      Logger.info(TAG, 'SeedRowsPairNameWithKeyword_031 begin');
      const source: CommentData = mockData();
      const rowIndexes: Array<number> = [1, 3, 4];
      const keywords: Array<string> = ['火箭', '大楼', '死机'];
      for (let position: number = 0; position < rowIndexes.length; position++) {
        const row: FriendMoment = source.getData(rowIndexes[position]);
        Logger.info(TAG, 'row ' + rowIndexes[position] + ' keyword ' + keywords[position]);
        expect(row.text).assertContain(keywords[position]);
        expect(row.userName).assertEqual(MOCK_USER_NAMES[rowIndexes[position]]);
      }
      Logger.info(TAG, 'SeedRowsPairNameWithKeyword_031 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MOCK_3200
     * @tc.name ArtistRowIsShortestText032
     * @tc.desc Verify artist row is shortest text
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ArtistRowIsShortestText_032', 0, (): void => {
      Logger.info(TAG, 'ArtistRowIsShortestText_032 begin');
      const source: CommentData = mockData();
      let shortest: number = source.getData(0).text.length;
      for (let index: number = 1; index < MOCK_COUNT; index++) {
        const currentLength: number = source.getData(index).text.length;
        if (currentLength < shortest) {
          shortest = currentLength;
        }
      }
      const artist: FriendMoment = source.getData(5);
      Logger.info(TAG, 'shortest=' + shortest + ' artistLength=' + artist.text.length);
      expect(artist.text.length).assertEqual(shortest);
      expect(artist.text).assertEqual('作画');
      Logger.info(TAG, 'ArtistRowIsShortestText_032 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MOCK_3300
     * @tc.name ChefAvatarAssignedAlongsideVideo033
     * @tc.desc Verify chef avatar assigned alongside video
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ChefAvatarAssignedAlongsideVideo_033', 0, (): void => {
      Logger.info(TAG, 'ChefAvatarAssignedAlongsideVideo_033 begin');
      const source: CommentData = mockData();
      const chef: FriendMoment = source.getData(6);
      const check01: boolean = chef.avatar !== undefined && chef.video !== undefined;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      expect(chef.userName).assertEqual('Chef');
      Logger.info(TAG, 'ChefAvatarAssignedAlongsideVideo_033 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MOCK_3400
     * @tc.name VideoRowPositionsAreTwoAndSix034
     * @tc.desc Verify video row positions are two and six
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'VideoRowPositionsAreTwoAndSix_034', 0, (): void => {
      Logger.info(TAG, 'VideoRowPositionsAreTwoAndSix_034 begin');
      const source: CommentData = mockData();
      let positions: Array<number> = [];
      for (let index: number = 0; index < MOCK_COUNT; index++) {
        if (source.getData(index).video !== undefined) {
          positions.push(index);
        }
      }
      Logger.info(TAG, 'positions=' + positions.join(','));
      expect(positions.length).assertEqual(MOCK_VIDEO_ROWS.length);
      for (let position: number = 0; position < positions.length; position++) {
        expect(positions[position]).assertEqual(MOCK_VIDEO_ROWS[position]);
      }
      Logger.info(TAG, 'VideoRowPositionsAreTwoAndSix_034 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MOCK_3500
     * @tc.name NeighbouringRowsAreDistinctObjects035
     * @tc.desc Verify neighbouring rows are distinct objects
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'NeighbouringRowsAreDistinctObjects_035', 0, (): void => {
      Logger.info(TAG, 'NeighbouringRowsAreDistinctObjects_035 begin');
      const source: CommentData = mockData();
      let duplicates: number = 0;
      for (let index: number = 0; index < MOCK_COUNT - 1; index++) {
        const sameObject: boolean = source.getData(index) === source.getData(index + 1);
        if (sameObject) {
          duplicates += 1;
          Logger.info(TAG, 'rows ' + index + ' and ' + (index + 1) + ' share one object');
        }
      }
      Logger.info(TAG, 'duplicates=' + duplicates);
      expect(duplicates).assertEqual(0);
      Logger.info(TAG, 'NeighbouringRowsAreDistinctObjects_035 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MOCK_3600
     * @tc.name RowsSerializeWithVisibleText036
     * @tc.desc Verify rows serialize with visible text
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'RowsSerializeWithVisibleText_036', 0, (): void => {
      Logger.info(TAG, 'RowsSerializeWithVisibleText_036 begin');
      const source: CommentData = mockData();
      const payload: string = JSON.stringify(source.getData(1));
      Logger.info(TAG, 'payloadLength=' + payload.length);
      expect(payload).assertContain('今天研究个大火箭');
      expect(payload).assertContain('Scientist');
      Logger.info(TAG, 'RowsSerializeWithVisibleText_036 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MOCK_3700
     * @tc.name SeedTextsHaveNoSurroundingWhitespace037
     * @tc.desc Verify seed texts have no surrounding whitespace
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SeedTextsHaveNoSurroundingWhitespace_037', 0, (): void => {
      Logger.info(TAG, 'SeedTextsHaveNoSurroundingWhitespace_037 begin');
      const source: CommentData = mockData();
      let padded: number = 0;
      for (let index: number = 0; index < MOCK_COUNT; index++) {
        const currentText: string = source.getData(index).text;
        const trimmed: string = currentText.trim();
        if (currentText !== trimmed) {
          padded += 1;
          Logger.info(TAG, 'row ' + index + ' text carries surrounding whitespace');
        }
      }
      Logger.info(TAG, 'padded=' + padded);
      expect(padded).assertEqual(0);
      Logger.info(TAG, 'SeedTextsHaveNoSurroundingWhitespace_037 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MOCK_3800
     * @tc.name MediaRowsKeepNonEmptyText038
     * @tc.desc Verify media rows keep non empty text
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'MediaRowsKeepNonEmptyText_038', 0, (): void => {
      Logger.info(TAG, 'MediaRowsKeepNonEmptyText_038 begin');
      const source: CommentData = mockData();
      let emptyCaption: number = 0;
      for (let position: number = 0; position < MOCK_VIDEO_ROWS.length; position++) {
        const rowIndex: number = MOCK_VIDEO_ROWS[position];
        if (source.getData(rowIndex).text.length === 0) {
          emptyCaption += 1;
          Logger.info(TAG, 'video row ' + rowIndex + ' has empty caption');
        }
      }
      Logger.info(TAG, 'emptyCaption=' + emptyCaption);
      expect(emptyCaption).assertEqual(0);
      Logger.info(TAG, 'MediaRowsKeepNonEmptyText_038 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_MOCK_3900
     * @tc.name AllRowsFitWithinSeedTextSet039
     * @tc.desc Verify all rows fit within seed text set
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AllRowsFitWithinSeedTextSet_039', 0, (): void => {
      Logger.info(TAG, 'AllRowsFitWithinSeedTextSet_039 begin');
      const source: CommentData = mockData();
      let foreign: number = 0;
      for (let index: number = 0; index < MOCK_COUNT; index++) {
        const currentText: string = source.getData(index).text;
        if (MOCK_TEXTS.indexOf(currentText) < 0) {
          foreign += 1;
          Logger.info(TAG, 'row ' + index + ' text is outside the seed set');
        }
      }
      Logger.info(TAG, 'foreign=' + foreign);
      expect(foreign).assertEqual(0);
      Logger.info(TAG, 'AllRowsFitWithinSeedTextSet_039 end');
    });
  });
}
