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
import { EMPTY_RESOURCE, buildImageMoment, buildMoment, buildMoments, buildVideoMoment, textOfLength } from '../common/DataFactory';
/**
 * Boundary behaviour of the CommentData lazy list source.
 * The lazy list asks for indices the page computed from a stale count, so every
 * out-of-range read must fail softly instead of corrupting the feed.
 */
export default function commentDataBoundaryTest() {
  describe('CommentDataBoundaryTest', () => {
    beforeAll(async (): Promise<void> => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_0100
     * @tc.name NegativeIndexUndefined001
     * @tc.desc Verify negative index undefined
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'NegativeIndexUndefined_001', 0, (): void => {
      Logger.info(TAG, 'NegativeIndexUndefined_001 begin');
      const source: CommentData = new CommentData();
      const rows: Array<FriendMoment> = buildMoments(3, 'neg_');
      for (let index: number = 0; index < rows.length; index++) {
        source.pushData(rows[index]);
      }
      const probes: Array<number> = [-1, -2, -10];
      for (let position: number = 0; position < probes.length; position++) {
        expect(source.getData(probes[position])).assertUndefined();
      }
      const check01: boolean = source.totalCount() === 3;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'NegativeIndexUndefined_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_0200
     * @tc.name IndexEqualToCountUndefined002
     * @tc.desc Verify index equal to count undefined
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'IndexEqualToCountUndefined_002', 0, (): void => {
      Logger.info(TAG, 'IndexEqualToCountUndefined_002 begin');
      const source: CommentData = new CommentData();
      const rows: Array<FriendMoment> = buildMoments(3, 'edge_');
      for (let index: number = 0; index < rows.length; index++) {
        source.pushData(rows[index]);
      }
      const boundary: number = source.totalCount();
      expect(boundary).assertEqual(3);
      expect(source.getData(boundary)).assertUndefined();
      const check01: boolean = source.getData(boundary - 1) !== undefined;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'IndexEqualToCountUndefined_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_0300
     * @tc.name IndexFarBeyondCountUndefined003
     * @tc.desc Verify index far beyond count undefined
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'IndexFarBeyondCountUndefined_003', 0, (): void => {
      Logger.info(TAG, 'IndexFarBeyondCountUndefined_003 begin');
      const source: CommentData = new CommentData();
      source.pushData(buildMoment('far-5300', 'Author', 'only'));
      const farIndex: number = source.totalCount() + 1000;
      expect(farIndex).assertEqual(1001);
      expect(source.getData(farIndex)).assertUndefined();
      expect(source.getData(100000)).assertUndefined();
      Logger.info(TAG, 'IndexFarBeyondCountUndefined_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_0400
     * @tc.name FractionalIndexUndefined004
     * @tc.desc Verify fractional index undefined
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'FractionalIndexUndefined_004', 0, (): void => {
      Logger.info(TAG, 'FractionalIndexUndefined_004 begin');
      const source: CommentData = new CommentData();
      const rows: Array<FriendMoment> = buildMoments(3, 'frac_');
      for (let index: number = 0; index < rows.length; index++) {
        source.pushData(rows[index]);
      }
      expect(source.getData(1.5)).assertUndefined();
      expect(source.getData(2.75)).assertUndefined();
      const check01: boolean = source.getData(1.5) === undefined;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'FractionalIndexUndefined_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_0500
     * @tc.name NaNIndexUndefined005
     * @tc.desc Verify na n index undefined
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'NaNIndexUndefined_005', 0, (): void => {
      Logger.info(TAG, 'NaNIndexUndefined_005 begin');
      const source: CommentData = new CommentData();
      source.pushData(buildMoment('nan-5500', 'Author', 'row'));
      const notANumber: number = Number.NaN;
      expect(source.getData(notANumber)).assertUndefined();
      const check01: boolean = source.getData(notANumber) === undefined;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      expect(source.totalCount()).assertEqual(1);
      Logger.info(TAG, 'NaNIndexUndefined_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_0600
     * @tc.name LargeNegativeIndexUndefined006
     * @tc.desc Verify large negative index undefined
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'LargeNegativeIndexUndefined_006', 0, (): void => {
      Logger.info(TAG, 'LargeNegativeIndexUndefined_006 begin');
      const source: CommentData = new CommentData();
      const rows: Array<FriendMoment> = buildMoments(2, 'lneg_');
      for (let index: number = 0; index < rows.length; index++) {
        source.pushData(rows[index]);
      }
      expect(source.getData(-1000000)).assertUndefined();
      const probe: number = -999999;
      const check01: boolean = source.getData(probe) === undefined;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'LargeNegativeIndexUndefined_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_0700
     * @tc.name MaxSafeIntegerIndexUndefined007
     * @tc.desc Verify max safe integer index undefined
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'MaxSafeIntegerIndexUndefined_007', 0, (): void => {
      Logger.info(TAG, 'MaxSafeIntegerIndexUndefined_007 begin');
      const source: CommentData = new CommentData();
      source.pushData(buildMoment('huge-5700', 'Author', 'row'));
      const hugeIndex: number = 9007199254740991;
      expect(source.getData(hugeIndex)).assertUndefined();
      const check01: boolean = source.getData(hugeIndex) === undefined;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'MaxSafeIntegerIndexUndefined_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_0800
     * @tc.name NegativeZeroIndexReturnsFirstRow008
     * @tc.desc Verify negative zero index returns first row
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'NegativeZeroIndexReturnsFirstRow_008', 0, (): void => {
      Logger.info(TAG, 'NegativeZeroIndexReturnsFirstRow_008 begin');
      const source: CommentData = new CommentData();
      const head: FriendMoment = buildMoment('zero-5800', 'Author', 'head');
      source.pushData(head);
      source.pushData(buildMoment('zero-5801', 'Author', 'tail'));
      const negativeZero: number = -0;
      const check01: boolean = source.getData(negativeZero) === head;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      expect(source.getData(negativeZero).id).assertEqual('zero-5800');
      Logger.info(TAG, 'NegativeZeroIndexReturnsFirstRow_008 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_0900
     * @tc.name SingleRowValidAndBeyond009
     * @tc.desc Verify single row valid and beyond
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SingleRowValidAndBeyond_009', 0, (): void => {
      Logger.info(TAG, 'SingleRowValidAndBeyond_009 begin');
      const source: CommentData = new CommentData();
      source.pushData(buildMoment('single-5900', 'Author', 'only'));
      expect(source.getData(0).id).assertEqual('single-5900');
      expect(source.getData(1)).assertUndefined();
      const check01: boolean = source.getData(0) !== undefined && source.getData(1) === undefined;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'SingleRowValidAndBeyond_009 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_1000
     * @tc.name EmptySourceMutationYieldsOneRow010
     * @tc.desc Verify empty source mutation yields one row
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EmptySourceMutationYieldsOneRow_010', 0, (): void => {
      Logger.info(TAG, 'EmptySourceMutationYieldsOneRow_010 begin');
      const pushedSource: CommentData = new CommentData();
      const prependedSource: CommentData = new CommentData();
      const row: FriendMoment = buildMoment('empty-6000', 'Author', 'first ever');
      pushedSource.pushData(row);
      prependedSource.addDataFirst(row);
      expect(pushedSource.totalCount()).assertEqual(1);
      expect(prependedSource.totalCount()).assertEqual(1);
      const check01: boolean = pushedSource.getData(0) === row && prependedSource.getData(0) === row;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'EmptySourceMutationYieldsOneRow_010 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_1100
     * @tc.name EmptyTextMomentStored011
     * @tc.desc Verify empty text moment stored
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EmptyTextMomentStored_011', 0, (): void => {
      Logger.info(TAG, 'EmptyTextMomentStored_011 begin');
      const source: CommentData = new CommentData();
      const row: FriendMoment = buildMoment('empty-6100', 'Author', EMPTY_RESOURCE);
      source.pushData(row);
      expect(source.totalCount()).assertEqual(1);
      expect(source.getData(0).text).assertEqual(EMPTY_RESOURCE);
      const check01: boolean = source.getData(0).text === '';
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'EmptyTextMomentStored_011 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_1200
     * @tc.name PlainRowMediaUndefined012
     * @tc.desc Verify plain row media undefined
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'PlainRowMediaUndefined_012', 0, (): void => {
      Logger.info(TAG, 'PlainRowMediaUndefined_012 begin');
      const source: CommentData = new CommentData();
      source.pushData(buildMoment('plain-6200', 'Author', 'plain body'));
      expect(source.getData(0).image).assertUndefined();
      expect(source.getData(0).video).assertUndefined();
      expect(source.getData(0).text).assertEqual('plain body');
      Logger.info(TAG, 'PlainRowMediaUndefined_012 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_1300
     * @tc.name EmptyStringImagePreserved013
     * @tc.desc Verify empty string image preserved
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EmptyStringImagePreserved_013', 0, (): void => {
      Logger.info(TAG, 'EmptyStringImagePreserved_013 begin');
      const source: CommentData = new CommentData();
      source.pushData(buildImageMoment('empty-6300', 'Author', 'no picture', EMPTY_RESOURCE));
      expect(source.getData(0).image).assertEqual(EMPTY_RESOURCE);
      const check01: boolean = source.getData(0).image !== undefined;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      expect(source.getData(0).image).assertEqual('');
      Logger.info(TAG, 'EmptyStringImagePreserved_013 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_1400
     * @tc.name MutationVisibleThroughSecondRead014
     * @tc.desc Verify mutation visible through second read
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'MutationVisibleThroughSecondRead_014', 0, (): void => {
      Logger.info(TAG, 'MutationVisibleThroughSecondRead_014 begin');
      const source: CommentData = new CommentData();
      source.pushData(buildMoment('mutate-6400', 'Author', 'before'));
      const firstView: FriendMoment = source.getData(0);
      firstView.text = 'after';
      const secondView: FriendMoment = source.getData(0);
      expect(secondView.text).assertEqual('after');
      const check01: boolean = secondView === firstView;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'MutationVisibleThroughSecondRead_014 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_1500
     * @tc.name ThousandRowsBoundary015
     * @tc.desc Verify thousand rows boundary
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ThousandRowsBoundary_015', 0, (): void => {
      Logger.info(TAG, 'ThousandRowsBoundary_015 begin');
      const source: CommentData = new CommentData();
      const rows: Array<FriendMoment> = buildMoments(1000, 'thousand_');
      for (let index: number = 0; index < rows.length; index++) {
        source.pushData(rows[index]);
      }
      expect(source.totalCount()).assertEqual(1000);
      expect(source.getData(0).id).assertEqual('thousand_0');
      expect(source.getData(999).id).assertEqual('thousand_999');
      const check01: boolean = source.getData(999) === rows[999];
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'ThousandRowsBoundary_015 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_1600
     * @tc.name HundredAddFirstBoundary016
     * @tc.desc Verify hundred add first boundary
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'HundredAddFirstBoundary_016', 0, (): void => {
      Logger.info(TAG, 'HundredAddFirstBoundary_016 begin');
      const source: CommentData = new CommentData();
      const rows: Array<FriendMoment> = buildMoments(100, 'prepend_');
      for (let index: number = 0; index < rows.length; index++) {
        source.addDataFirst(rows[index]);
      }
      expect(source.totalCount()).assertEqual(100);
      expect(source.getData(0).id).assertEqual('prepend_99');
      expect(source.getData(99).id).assertEqual('prepend_0');
      const check01: boolean = source.getData(0) === rows[99];
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'HundredAddFirstBoundary_016 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_1700
     * @tc.name GetDataReturnsSameObject017
     * @tc.desc Verify get data returns same object
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'GetDataReturnsSameObject_017', 0, (): void => {
      Logger.info(TAG, 'GetDataReturnsSameObject_017 begin');
      const source: CommentData = new CommentData();
      const row: FriendMoment = buildMoment('same-6700', 'Author', 'body');
      source.pushData(row);
      const check01: boolean = source.getData(0) === source.getData(0);
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const check02: boolean = source.getData(0) === row;
      Logger.info(TAG, 'check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      Logger.info(TAG, 'GetDataReturnsSameObject_017 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_1800
     * @tc.name IndependentInstancesHaveIndependentCounts018
     * @tc.desc Verify independent instances have independent counts
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'IndependentInstancesHaveIndependentCounts_018', 0, (): void => {
      Logger.info(TAG, 'IndependentInstancesHaveIndependentCounts_018 begin');
      const first: CommentData = new CommentData();
      const second: CommentData = new CommentData();
      first.pushData(buildMoment('indep-6800', 'Author', 'one'));
      first.pushData(buildMoment('indep-6801', 'Author', 'two'));
      second.pushData(buildMoment('indep-6802', 'Author', 'three'));
      expect(first.totalCount()).assertEqual(2);
      expect(second.totalCount()).assertEqual(1);
      const check01: boolean = second.totalCount() === 1;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      expect(second.getData(1)).assertUndefined();
      Logger.info(TAG, 'IndependentInstancesHaveIndependentCounts_018 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_1900
     * @tc.name EmptyUserNamePreserved019
     * @tc.desc Verify empty user name preserved
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EmptyUserNamePreserved_019', 0, (): void => {
      Logger.info(TAG, 'EmptyUserNamePreserved_019 begin');
      const source: CommentData = new CommentData();
      source.pushData(buildMoment('noname-6900', EMPTY_RESOURCE, 'text'));
      expect(source.getData(0).userName).assertEqual(EMPTY_RESOURCE);
      const check01: boolean = source.getData(0).userName.length === 0;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'EmptyUserNamePreserved_019 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_2000
     * @tc.name EmptyIdPreserved020
     * @tc.desc Verify empty id preserved, as covered by the comment data boundary test suite
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EmptyIdPreserved_020', 0, (): void => {
      Logger.info(TAG, 'EmptyIdPreserved_020 begin');
      const source: CommentData = new CommentData();
      source.pushData(buildMoment(EMPTY_RESOURCE, 'Author', 'no key'));
      expect(source.getData(0).id).assertEqual(EMPTY_RESOURCE);
      const check01: boolean = source.getData(0).id.length === 0;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      expect(source.totalCount()).assertEqual(1);
      Logger.info(TAG, 'EmptyIdPreserved_020 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_2100
     * @tc.name WhitespaceTextPreserved021
     * @tc.desc Verify whitespace text preserved
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'WhitespaceTextPreserved_021', 0, (): void => {
      Logger.info(TAG, 'WhitespaceTextPreserved_021 begin');
      const source: CommentData = new CommentData();
      const padded: string = '  padded  ';
      source.pushData(buildMoment('space-7100', 'Author', padded));
      expect(source.getData(0).text).assertEqual(padded);
      const check01: boolean = source.getData(0).text.length === 10;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'WhitespaceTextPreserved_021 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_2200
     * @tc.name TenThousandCharTextRetrievable022
     * @tc.desc Verify ten thousand char text retrievable
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'TenThousandCharTextRetrievable_022', 0, (): void => {
      Logger.info(TAG, 'TenThousandCharTextRetrievable_022 begin');
      const source: CommentData = new CommentData();
      const body: string = textOfLength(10000, 'long-form ');
      source.pushData(buildMoment('long-7200', 'Author', body));
      expect(source.getData(0).text.length).assertEqual(10000);
      const check01: boolean = source.getData(0).text === body;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'TenThousandCharTextRetrievable_022 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_2300
     * @tc.name PushAfterThousandRows023
     * @tc.desc Verify push after thousand rows
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'PushAfterThousandRows_023', 0, (): void => {
      Logger.info(TAG, 'PushAfterThousandRows_023 begin');
      const source: CommentData = new CommentData();
      const rows: Array<FriendMoment> = buildMoments(1000, 'deep_');
      for (let index: number = 0; index < rows.length; index++) {
        source.pushData(rows[index]);
      }
      source.pushData(buildMoment('deep-7300', 'Author', 'appended'));
      expect(source.totalCount()).assertEqual(1001);
      expect(source.getData(1000).id).assertEqual('deep-7300');
      expect(source.getData(999).id).assertEqual('deep_999');
      Logger.info(TAG, 'PushAfterThousandRows_023 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_2400
     * @tc.name AddFirstAfterThousandRows024
     * @tc.desc Verify add first after thousand rows
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AddFirstAfterThousandRows_024', 0, (): void => {
      Logger.info(TAG, 'AddFirstAfterThousandRows_024 begin');
      const source: CommentData = new CommentData();
      const rows: Array<FriendMoment> = buildMoments(1000, 'shift_');
      for (let index: number = 0; index < rows.length; index++) {
        source.pushData(rows[index]);
      }
      source.addDataFirst(buildMoment('shift-7400', 'Author', 'prepended'));
      expect(source.totalCount()).assertEqual(1001);
      expect(source.getData(0).id).assertEqual('shift-7400');
      expect(source.getData(1).id).assertEqual('shift_0');
      expect(source.getData(1000).id).assertEqual('shift_999');
      Logger.info(TAG, 'AddFirstAfterThousandRows_024 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_2500
     * @tc.name OutOfRangeReadsDoNotMutate025
     * @tc.desc Verify out of range reads do not mutate
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'OutOfRangeReadsDoNotMutate_025', 0, (): void => {
      Logger.info(TAG, 'OutOfRangeReadsDoNotMutate_025 begin');
      const source: CommentData = new CommentData();
      const rows: Array<FriendMoment> = buildMoments(3, 'probe_');
      for (let index: number = 0; index < rows.length; index++) {
        source.pushData(rows[index]);
      }
      expect(source.getData(-1)).assertUndefined();
      expect(source.getData(3)).assertUndefined();
      expect(source.getData(5000)).assertUndefined();
      expect(source.totalCount()).assertEqual(3);
      const check01: boolean = source.getData(0) === rows[0] && source.getData(2) === rows[2];
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'OutOfRangeReadsDoNotMutate_025 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_2600
     * @tc.name NumericIdStaysText026
     * @tc.desc Verify numeric id stays text, as covered by the comment data boundary test suite
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'NumericIdStaysText_026', 0, (): void => {
      Logger.info(TAG, 'NumericIdStaysText_026 begin');
      const source: CommentData = new CommentData();
      source.pushData(buildMoment('007', 'Author', 'numeric key'));
      expect(source.getData(0).id).assertEqual('007');
      const check01: boolean = source.getData(0).id.length === 3;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      expect(source.getData(0).id).assertContain('00');
      Logger.info(TAG, 'NumericIdStaysText_026 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_2700
     * @tc.name MultilineTextPreserved027
     * @tc.desc Verify multiline text preserved
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'MultilineTextPreserved_027', 0, (): void => {
      Logger.info(TAG, 'MultilineTextPreserved_027 begin');
      const source: CommentData = new CommentData();
      const body: string = 'first line\nsecond line';
      source.pushData(buildMoment('multi-7700', 'Author', body));
      expect(source.getData(0).text).assertContain('\n');
      const check01: boolean = source.getData(0).text.length === 22;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      expect(source.getData(0).text).assertEqual(body);
      Logger.info(TAG, 'MultilineTextPreserved_027 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_2800
     * @tc.name EmojiTextPreserved028
     * @tc.desc Verify emoji text preserved
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EmojiTextPreserved_028', 0, (): void => {
      Logger.info(TAG, 'EmojiTextPreserved_028 begin');
      const source: CommentData = new CommentData();
      source.pushData(buildMoment('emoji-7800', 'Artist', '作画 🎨'));
      expect(source.getData(0).text).assertContain('🎨');
      const check01: boolean = source.getData(0).text.length === 5;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'EmojiTextPreserved_028 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_2900
     * @tc.name LongUserNamePreserved029
     * @tc.desc Verify long user name preserved
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'LongUserNamePreserved_029', 0, (): void => {
      Logger.info(TAG, 'LongUserNamePreserved_029 begin');
      const source: CommentData = new CommentData();
      const userName: string = textOfLength(512, 'member-');
      source.pushData(buildMoment('longname-7900', userName, 'text'));
      expect(source.getData(0).userName.length).assertEqual(512);
      const check01: boolean = source.getData(0).userName === userName;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'LongUserNamePreserved_029 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_3000
     * @tc.name VideoMomentImageEmpty030
     * @tc.desc Verify video moment image empty
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'VideoMomentImageEmpty_030', 0, (): void => {
      Logger.info(TAG, 'VideoMomentImageEmpty_030 begin');
      const source: CommentData = new CommentData();
      source.pushData(buildVideoMoment('clip-8000', 'Engineer', 'drawing', 'file://clip_8000'));
      expect(source.getData(0).image).assertEqual(EMPTY_RESOURCE);
      const check01: boolean = source.getData(0).image !== undefined;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      expect(source.getData(0).video).assertEqual('file://clip_8000');
      Logger.info(TAG, 'VideoMomentImageEmpty_030 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_3100
     * @tc.name BoundaryFollowsAddFirst031
     * @tc.desc Verify boundary follows add first
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'BoundaryFollowsAddFirst_031', 0, (): void => {
      Logger.info(TAG, 'BoundaryFollowsAddFirst_031 begin');
      const source: CommentData = new CommentData();
      source.addDataFirst(buildMoment('shift-8100', 'Author', 'only'));
      expect(source.totalCount()).assertEqual(1);
      expect(source.getData(0).id).assertEqual('shift-8100');
      expect(source.getData(1)).assertUndefined();
      const check01: boolean = source.getData(0) !== undefined && source.getData(1) === undefined;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'BoundaryFollowsAddFirst_031 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_3200
     * @tc.name MixedWritesCountBoundary032
     * @tc.desc Verify mixed writes count boundary
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'MixedWritesCountBoundary_032', 0, (): void => {
      Logger.info(TAG, 'MixedWritesCountBoundary_032 begin');
      const source: CommentData = new CommentData();
      const pushed: Array<FriendMoment> = buildMoments(1000, 'deep_');
      for (let index: number = 0; index < pushed.length; index++) {
        source.pushData(pushed[index]);
      }
      const prepended: Array<FriendMoment> = buildMoments(100, 'front_');
      for (let index: number = 0; index < prepended.length; index++) {
        source.addDataFirst(prepended[index]);
      }
      expect(source.totalCount()).assertEqual(1100);
      expect(source.getData(0).id).assertEqual('front_99');
      expect(source.getData(100).id).assertEqual('deep_0');
      expect(source.getData(1099).id).assertEqual('deep_999');
      const check01: boolean = source.getData(0) === prepended[99];
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'MixedWritesCountBoundary_032 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_3300
     * @tc.name EmptyAvatarPreserved033
     * @tc.desc Verify empty avatar preserved
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EmptyAvatarPreserved_033', 0, (): void => {
      Logger.info(TAG, 'EmptyAvatarPreserved_033 begin');
      const source: CommentData = new CommentData();
      const row: FriendMoment = new FriendMoment('noavatar-8300', 'Author', EMPTY_RESOURCE, 'text');
      source.pushData(row);
      expect(source.getData(0).avatar).assertEqual(EMPTY_RESOURCE);
      const check01: boolean = source.getData(0).avatar !== undefined;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'EmptyAvatarPreserved_033 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_3400
     * @tc.name EmptyTextWithImageKept034
     * @tc.desc Verify empty text with image kept
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EmptyTextWithImageKept_034', 0, (): void => {
      Logger.info(TAG, 'EmptyTextWithImageKept_034 begin');
      const source: CommentData = new CommentData();
      source.pushData(buildImageMoment('photo-8400', 'Zoologist', EMPTY_RESOURCE, 'file://photo_8400'));
      expect(source.getData(0).text).assertEqual(EMPTY_RESOURCE);
      expect(source.getData(0).image).assertEqual('file://photo_8400');
      const check01: boolean = source.getData(0).text.length === 0;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      expect(source.totalCount()).assertEqual(1);
      Logger.info(TAG, 'EmptyTextWithImageKept_034 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_3500
     * @tc.name LongIdPreserved035
     * @tc.desc Verify long id preserved
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'LongIdPreserved_035', 0, (): void => {
      Logger.info(TAG, 'LongIdPreserved_035 begin');
      const source: CommentData = new CommentData();
      const id: string = textOfLength(1024, 'id-2026-');
      source.pushData(buildMoment(id, 'Author', 'text'));
      expect(source.getData(0).id.length).assertEqual(1024);
      const check01: boolean = source.getData(0).id === id;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'LongIdPreserved_035 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_3600
     * @tc.name ChineseUserNamePreserved036
     * @tc.desc Verify chinese user name preserved
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ChineseUserNamePreserved_036', 0, (): void => {
      Logger.info(TAG, 'ChineseUserNamePreserved_036 begin');
      const source: CommentData = new CommentData();
      source.pushData(buildMoment('cn-8600', '工程师', 'text'));
      expect(source.getData(0).userName).assertEqual('工程师');
      const check01: boolean = source.getData(0).userName.length === 3;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'ChineseUserNamePreserved_036 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_3700
     * @tc.name WhitespaceOnlyTextPreserved037
     * @tc.desc Verify whitespace only text preserved
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'WhitespaceOnlyTextPreserved_037', 0, (): void => {
      Logger.info(TAG, 'WhitespaceOnlyTextPreserved_037 begin');
      const source: CommentData = new CommentData();
      source.pushData(buildMoment('blank-8700', 'Author', '   '));
      expect(source.getData(0).text).assertEqual('   ');
      const check01: boolean = source.getData(0).text.length === 3;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'WhitespaceOnlyTextPreserved_037 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_3800
     * @tc.name AllEmptyStringFieldsTogether038
     * @tc.desc Verify all empty string fields together
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AllEmptyStringFieldsTogether_038', 0, (): void => {
      Logger.info(TAG, 'AllEmptyStringFieldsTogether_038 begin');
      const source: CommentData = new CommentData();
      const row: FriendMoment = new FriendMoment(EMPTY_RESOURCE, EMPTY_RESOURCE, EMPTY_RESOURCE, EMPTY_RESOURCE);
      source.pushData(row);
      expect(source.getData(0).id).assertEqual(EMPTY_RESOURCE);
      expect(source.getData(0).userName).assertEqual(EMPTY_RESOURCE);
      expect(source.getData(0).avatar).assertEqual(EMPTY_RESOURCE);
      expect(source.getData(0).text).assertEqual(EMPTY_RESOURCE);
      const check01: boolean = source.getData(0).image === undefined;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'AllEmptyStringFieldsTogether_038 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_3900
     * @tc.name ZeroLengthBodyWithVideoKept039
     * @tc.desc Verify zero length body with video kept
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ZeroLengthBodyWithVideoKept_039', 0, (): void => {
      Logger.info(TAG, 'ZeroLengthBodyWithVideoKept_039 begin');
      const source: CommentData = new CommentData();
      source.pushData(buildVideoMoment('clip-8900', 'Engineer', EMPTY_RESOURCE, 'file://clip_8900'));
      expect(source.getData(0).text).assertEqual(EMPTY_RESOURCE);
      expect(source.getData(0).video).assertEqual('file://clip_8900');
      const check01: boolean = source.getData(0).text.length === 0;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      expect(source.getData(0).image).assertEqual(EMPTY_RESOURCE);
      Logger.info(TAG, 'ZeroLengthBodyWithVideoKept_039 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_4000
     * @tc.name IdContainingNewlinePreserved040
     * @tc.desc Verify id containing newline preserved
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'IdContainingNewlinePreserved_040', 0, (): void => {
      Logger.info(TAG, 'IdContainingNewlinePreserved_040 begin');
      const source: CommentData = new CommentData();
      const id: string = 'line\nbreak';
      source.pushData(buildMoment(id, 'Author', 'text'));
      expect(source.getData(0).id).assertContain('\n');
      const check01: boolean = source.getData(0).id.length === 10;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      expect(source.getData(0).id).assertEqual(id);
      Logger.info(TAG, 'IdContainingNewlinePreserved_040 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_COMMENTDATA_4100
     * @tc.name CountSurvivesManyFailedReads041
     * @tc.desc Verify count survives many failed reads
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'CountSurvivesManyFailedReads_041', 0, (): void => {
      Logger.info(TAG, 'CountSurvivesManyFailedReads_041 begin');
      const source: CommentData = new CommentData();
      const rows: Array<FriendMoment> = buildMoments(3, 'stable_');
      for (let index: number = 0; index < rows.length; index++) {
        source.pushData(rows[index]);
      }
      let probes: number = 0;
      for (let round: number = 0; round < 1000; round++) {
        source.getData(-1);
        source.getData(3);
        probes += 1;
      }
      expect(probes).assertEqual(1000);
      expect(source.totalCount()).assertEqual(3);
      const check01: boolean = source.getData(0) === rows[0];
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'CountSurvivesManyFailedReads_041 end');
    });
  });
}
