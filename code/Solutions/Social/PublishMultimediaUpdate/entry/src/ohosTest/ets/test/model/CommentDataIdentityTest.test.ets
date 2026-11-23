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
import { CommentData } from 'publishmultimediaupdate/src/main/ets/model/BasicDataSource';
import { FriendMoment } from 'publishmultimediaupdate/src/main/ets/model/BasicDataSource';
import { BUNDLE, TAG } from '../common/TestConstant';
import { buildMoment } from '../common/DataFactory';
/**
 * Reference identity inside the feed.
 * The data source is a plain Array of object references: it never clones a row
 * on the way in or out. The page depends on that because it mutates the row it
 * just built before inserting, and LazyForEach keys on the same object. These
 * cases separate reference identity from value equality.
 */
export default function commentDataIdentityTest() {
  describe('CommentDataIdentityTest', () => {
    beforeAll(async (): Promise<void> => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_IDENTITY_0100
     * @tc.name GetDataReturnsSameReference001
     * @tc.desc Verify get data returns same reference
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'GetDataReturnsSameReference_001', 0, (): void => {
      Logger.info(TAG, 'GetDataReturnsSameReference_001 begin');
      const source: CommentData = new CommentData();
      source.pushData(buildMoment('id-0100', 'Author', 'body'));
      const first: FriendMoment = source.getData(0);
      const second: FriendMoment = source.getData(0);
      const same: boolean = first === second;
      Logger.info(TAG, 'same=' + JSON.stringify(same));
      expect(same).assertTrue();
      Logger.info(TAG, 'GetDataReturnsSameReference_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_IDENTITY_0200
     * @tc.name PushedReferenceIsStored002
     * @tc.desc Verify pushed reference is stored
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'PushedReferenceIsStored_002', 0, (): void => {
      Logger.info(TAG, 'PushedReferenceIsStored_002 begin');
      const source: CommentData = new CommentData();
      const row: FriendMoment = buildMoment('id-0200', 'Author', 'body');
      source.pushData(row);
      const same: boolean = source.getData(0) === row;
      Logger.info(TAG, 'same=' + JSON.stringify(same));
      expect(same).assertTrue();
      Logger.info(TAG, 'PushedReferenceIsStored_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_IDENTITY_0300
     * @tc.name PrependKeepsReference003
     * @tc.desc Verify prepend keeps reference
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'PrependKeepsReference_003', 0, (): void => {
      Logger.info(TAG, 'PrependKeepsReference_003 begin');
      const source: CommentData = new CommentData();
      const row: FriendMoment = buildMoment('id-0300', 'Author', 'body');
      source.pushData(row);
      source.addDataFirst(buildMoment('front-0300', 'Author', 'front'));
      const shifted: boolean = source.getData(1) === row;
      Logger.info(TAG, 'shifted=' + JSON.stringify(shifted));
      expect(shifted).assertTrue();
      Logger.info(TAG, 'PrependKeepsReference_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_IDENTITY_0400
     * @tc.name DuplicatePushSharesReference004
     * @tc.desc Verify duplicate push shares reference
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'DuplicatePushSharesReference_004', 0, (): void => {
      Logger.info(TAG, 'DuplicatePushSharesReference_004 begin');
      const source: CommentData = new CommentData();
      const row: FriendMoment = buildMoment('id-0400', 'Author', 'body');
      source.pushData(row);
      source.pushData(row);
      expect(source.totalCount()).assertEqual(2);
      const shared: boolean = source.getData(0) === source.getData(1);
      Logger.info(TAG, 'shared=' + JSON.stringify(shared));
      expect(shared).assertTrue();
      Logger.info(TAG, 'DuplicatePushSharesReference_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_IDENTITY_0500
     * @tc.name EqualFieldsAreDistinctObjects005
     * @tc.desc Verify equal fields are distinct objects
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EqualFieldsAreDistinctObjects_005', 0, (): void => {
      Logger.info(TAG, 'EqualFieldsAreDistinctObjects_005 begin');
      const source: CommentData = new CommentData();
      source.pushData(buildMoment('same-id', 'Author', 'same body'));
      source.pushData(buildMoment('same-id', 'Author', 'same body'));
      const distinct: boolean = source.getData(0) !== source.getData(1);
      Logger.info(TAG, 'distinct=' + JSON.stringify(distinct));
      expect(distinct).assertTrue();
      const equalByValue: boolean = JSON.stringify(source.getData(0)) === JSON.stringify(source.getData(1));
      Logger.info(TAG, 'equalByValue=' + JSON.stringify(equalByValue));
      expect(equalByValue).assertTrue();
      Logger.info(TAG, 'EqualFieldsAreDistinctObjects_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_IDENTITY_0600
     * @tc.name MutationVisibleThroughBothAliases006
     * @tc.desc Verify mutation visible through both aliases
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'MutationVisibleThroughBothAliases_006', 0, (): void => {
      Logger.info(TAG, 'MutationVisibleThroughBothAliases_006 begin');
      const source: CommentData = new CommentData();
      source.pushData(buildMoment('id-0600', 'Author', 'before'));
      const firstAlias: FriendMoment = source.getData(0);
      const secondAlias: FriendMoment = source.getData(0);
      firstAlias.text = 'after';
      expect(secondAlias.text).assertEqual('after');
      Logger.info(TAG, 'MutationVisibleThroughBothAliases_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_IDENTITY_0700
     * @tc.name ExternalMutationAfterPushVisible007
     * @tc.desc Verify external mutation after push visible
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ExternalMutationAfterPushVisible_007', 0, (): void => {
      Logger.info(TAG, 'ExternalMutationAfterPushVisible_007 begin');
      const source: CommentData = new CommentData();
      const row: FriendMoment = buildMoment('id-0700', 'Author', 'before');
      source.pushData(row);
      row.text = 'after push';
      expect(source.getData(0).text).assertEqual('after push');
      Logger.info(TAG, 'ExternalMutationAfterPushVisible_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_IDENTITY_0800
     * @tc.name IndexOfObjectFindsRow008
     * @tc.desc Verify index of object finds row
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'IndexOfObjectFindsRow_008', 0, (): void => {
      Logger.info(TAG, 'IndexOfObjectFindsRow_008 begin');
      const source: CommentData = new CommentData();
      const first: FriendMoment = buildMoment('id-0800', 'Author', 'one');
      const second: FriendMoment = buildMoment('id-0801', 'Author', 'two');
      source.pushData(first);
      source.pushData(second);
      const rows: Array<FriendMoment> = [source.getData(0), source.getData(1)];
      expect(rows.indexOf(second)).assertEqual(1);
      Logger.info(TAG, 'IndexOfObjectFindsRow_008 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_IDENTITY_0900
     * @tc.name IdentityAcrossManyRows009
     * @tc.desc Verify identity across many rows
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'IdentityAcrossManyRows_009', 0, (): void => {
      Logger.info(TAG, 'IdentityAcrossManyRows_009 begin');
      const source: CommentData = new CommentData();
      let originals: Array<FriendMoment> = [];
      for (let index: number = 0; index < 100; index++) {
        const row: FriendMoment = buildMoment('bulk-' + index, 'Author', 'body_' + index);
        originals.push(row);
        source.pushData(row);
      }
      let mismatched: number = 0;
      for (let index: number = 0; index < originals.length; index++) {
        if (source.getData(index) !== originals[index]) {
          mismatched += 1;
        }
      }
      expect(mismatched).assertEqual(0);
      Logger.info(TAG, 'IdentityAcrossManyRows_009 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_IDENTITY_1000
     * @tc.name TwoSourcesDoNotShareRows010
     * @tc.desc Verify two sources do not share rows
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'TwoSourcesDoNotShareRows_010', 0, (): void => {
      Logger.info(TAG, 'TwoSourcesDoNotShareRows_010 begin');
      const left: CommentData = new CommentData();
      const right: CommentData = new CommentData();
      const leftRow: FriendMoment = buildMoment('left', 'Author', 'left body');
      const rightRow: FriendMoment = buildMoment('right', 'Author', 'right body');
      left.pushData(leftRow);
      right.pushData(rightRow);
      left.getData(0).text = 'changed left';
      expect(right.getData(0).text).assertEqual('right body');
      Logger.info(TAG, 'TwoSourcesDoNotShareRows_010 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_IDENTITY_1100
     * @tc.name RowObjectSurvivesHeadInsertions011
     * @tc.desc Verify row object survives head insertions
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'RowObjectSurvivesHeadInsertions_011', 0, (): void => {
      Logger.info(TAG, 'RowObjectSurvivesHeadInsertions_011 begin');
      const source: CommentData = new CommentData();
      const anchor: FriendMoment = buildMoment('anchor', 'Author', 'anchor body');
      source.pushData(anchor);
      for (let index: number = 0; index < 5; index++) {
        source.addDataFirst(buildMoment('front-' + index, 'Author', 'front_' + index));
      }
      const same: boolean = source.getData(5) === anchor;
      Logger.info(TAG, 'same=' + JSON.stringify(same));
      expect(same).assertTrue();
      Logger.info(TAG, 'RowObjectSurvivesHeadInsertions_011 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_IDENTITY_1200
     * @tc.name GetDataBeyondRangeIsUndefined012
     * @tc.desc Verify get data beyond range is undefined
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'GetDataBeyondRangeIsUndefined_012', 0, (): void => {
      Logger.info(TAG, 'GetDataBeyondRangeIsUndefined_012 begin');
      const source: CommentData = new CommentData();
      source.pushData(buildMoment('only', 'Author', 'only body'));
      expect(source.getData(1)).assertUndefined();
      expect(source.getData(-1)).assertUndefined();
      Logger.info(TAG, 'GetDataBeyondRangeIsUndefined_012 end');
    });
  });
}
