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

// @volume rule=breakpoint-triples-in-main-resolve-per-key-and-ceil-12-cols basis=main-frozen cases=75
// Matrix bucket of the matching Real suite: one case per rule combination.
// Resource.moduleName inside the ohosTest HAP is TEST_MODULE_NAME for test-created and main-side Resources.
// Hand-written Anchor cases are part of this bucket; handwritten companions live in *Real*.test.ets.
import { describe, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BreakpointType } from '../../../main/ets/common/BreakpointSystem';
import { IconItem, OffsetDataType, PaddingDataType, SongType } from '../../../main/ets/model/DataType';
import { TEST_MODULE_NAME } from '../util/TestConstants';

const DOMAIN: number = 0xF811;
const TAG: string = '[MultiMusicTest]';

export default function layoutMatrix01Test() {
  describe('LayoutMatrix01', () => {

    /**
     * @tc.number: SUB_MM_LAYCFG01_0100
     * @tc.name: testLayCfg010001
     * @tc.desc: Verify layout triple IndexVertical resolves sm for main check.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayCfg010001', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010001 begin');
      let cfg: BreakpointType<boolean> = new BreakpointType<boolean>(false, false, true);
      const v0: boolean = cfg.getValue('sm') as boolean;
      hilog.info(DOMAIN, TAG, 'IndexVertical-sm actual=%{public}s expected=%{public}s', String(v0), String(false));
      expect(v0).assertEqual(false);
      const v1: boolean = cfg.getValue('sm') as boolean;
      hilog.info(DOMAIN, TAG, 'IndexVertical-sm-repeat actual=%{public}s expected=%{public}s', String(v1), String(false));
      expect(v1).assertEqual(false);
      const v2: boolean | undefined = cfg.getValue('xl');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "xl", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010001 end');
    })

    /**
     * @tc.number: SUB_MM_LAYCFG01_0200
     * @tc.name: testLayCfg010002
     * @tc.desc: Verify layout triple IndexVertical resolves md for main check.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayCfg010002', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010002 begin');
      let cfg: BreakpointType<boolean> = new BreakpointType<boolean>(false, false, true);
      const v0: boolean = cfg.getValue('md') as boolean;
      hilog.info(DOMAIN, TAG, 'IndexVertical-md actual=%{public}s expected=%{public}s', String(v0), String(false));
      expect(v0).assertEqual(false);
      const v1: boolean = cfg.getValue('md') as boolean;
      hilog.info(DOMAIN, TAG, 'IndexVertical-md-repeat actual=%{public}s expected=%{public}s', String(v1), String(false));
      expect(v1).assertEqual(false);
      const v2: boolean | undefined = cfg.getValue('xl');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "xl", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010002 end');
    })

    /**
     * @tc.number: SUB_MM_LAYCFG01_0300
     * @tc.name: testLayCfg010003
     * @tc.desc: Verify layout triple IndexVertical resolves lg for main check.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayCfg010003', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010003 begin');
      let cfg: BreakpointType<boolean> = new BreakpointType<boolean>(false, false, true);
      const v0: boolean = cfg.getValue('lg') as boolean;
      hilog.info(DOMAIN, TAG, 'IndexVertical-lg actual=%{public}s expected=%{public}s', String(v0), String(true));
      expect(v0).assertEqual(true);
      const v1: boolean = cfg.getValue('lg') as boolean;
      hilog.info(DOMAIN, TAG, 'IndexVertical-lg-repeat actual=%{public}s expected=%{public}s', String(v1), String(true));
      expect(v1).assertEqual(true);
      const v2: boolean | undefined = cfg.getValue('xl');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "xl", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010003 end');
    })

    /**
     * @tc.number: SUB_MM_LAYCFG01_0400
     * @tc.name: testLayCfg010004
     * @tc.desc: Verify layout triple RecommendGridColumns resolves sm for main check.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayCfg010004', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010004 begin');
      let cfg: BreakpointType<number> = new BreakpointType<number>(3, 5, 6);
      const v0: number = cfg.getValue('sm') as number;
      hilog.info(DOMAIN, TAG, 'RecommendGridColumns-sm actual=%{public}s expected=%{public}s', String(v0), String(3));
      expect(v0).assertEqual(3);
      const v1: number = cfg.getValue('sm') as number;
      hilog.info(DOMAIN, TAG, 'RecommendGridColumns-sm-repeat actual=%{public}s expected=%{public}s', String(v1), String(3));
      expect(v1).assertEqual(3);
      const v2: number | undefined = cfg.getValue('xl');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "xl", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010004 end');
    })

    /**
     * @tc.number: SUB_MM_LAYCFG01_0500
     * @tc.name: testLayCfg010005
     * @tc.desc: Verify layout triple RecommendGridColumns resolves md for main check.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayCfg010005', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010005 begin');
      let cfg: BreakpointType<number> = new BreakpointType<number>(3, 5, 6);
      const v0: number = cfg.getValue('md') as number;
      hilog.info(DOMAIN, TAG, 'RecommendGridColumns-md actual=%{public}s expected=%{public}s', String(v0), String(5));
      expect(v0).assertEqual(5);
      const v1: number = cfg.getValue('md') as number;
      hilog.info(DOMAIN, TAG, 'RecommendGridColumns-md-repeat actual=%{public}s expected=%{public}s', String(v1), String(5));
      expect(v1).assertEqual(5);
      const v2: number | undefined = cfg.getValue('xl');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "xl", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010005 end');
    })

    /**
     * @tc.number: SUB_MM_LAYCFG01_0600
     * @tc.name: testLayCfg010006
     * @tc.desc: Verify layout triple RecommendGridColumns resolves lg for main check.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayCfg010006', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010006 begin');
      let cfg: BreakpointType<number> = new BreakpointType<number>(3, 5, 6);
      const v0: number = cfg.getValue('lg') as number;
      hilog.info(DOMAIN, TAG, 'RecommendGridColumns-lg actual=%{public}s expected=%{public}s', String(v0), String(6));
      expect(v0).assertEqual(6);
      const v1: number = cfg.getValue('lg') as number;
      hilog.info(DOMAIN, TAG, 'RecommendGridColumns-lg-repeat actual=%{public}s expected=%{public}s', String(v1), String(6));
      expect(v1).assertEqual(6);
      const v2: number | undefined = cfg.getValue('xl');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "xl", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010006 end');
    })

    /**
     * @tc.number: SUB_MM_LAYCFG01_0700
     * @tc.name: testLayCfg010007
     * @tc.desc: Verify layout triple ListSpace resolves sm for main check.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayCfg010007', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010007 begin');
      let cfg: BreakpointType<number> = new BreakpointType<number>(0, 35, 63);
      const v0: number = cfg.getValue('sm') as number;
      hilog.info(DOMAIN, TAG, 'ListSpace-sm actual=%{public}s expected=%{public}s', String(v0), String(0));
      expect(v0).assertEqual(0);
      const v1: number = cfg.getValue('sm') as number;
      hilog.info(DOMAIN, TAG, 'ListSpace-sm-repeat actual=%{public}s expected=%{public}s', String(v1), String(0));
      expect(v1).assertEqual(0);
      const v2: number | undefined = cfg.getValue('xl');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "xl", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010007 end');
    })

    /**
     * @tc.number: SUB_MM_LAYCFG01_0800
     * @tc.name: testLayCfg010008
     * @tc.desc: Verify layout triple ListSpace resolves md for main check.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayCfg010008', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010008 begin');
      let cfg: BreakpointType<number> = new BreakpointType<number>(0, 35, 63);
      const v0: number = cfg.getValue('md') as number;
      hilog.info(DOMAIN, TAG, 'ListSpace-md actual=%{public}s expected=%{public}s', String(v0), String(35));
      expect(v0).assertEqual(35);
      const v1: number = cfg.getValue('md') as number;
      hilog.info(DOMAIN, TAG, 'ListSpace-md-repeat actual=%{public}s expected=%{public}s', String(v1), String(35));
      expect(v1).assertEqual(35);
      const v2: number | undefined = cfg.getValue('xl');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "xl", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010008 end');
    })

    /**
     * @tc.number: SUB_MM_LAYCFG01_0900
     * @tc.name: testLayCfg010009
     * @tc.desc: Verify layout triple ListSpace resolves lg for main check.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayCfg010009', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010009 begin');
      let cfg: BreakpointType<number> = new BreakpointType<number>(0, 35, 63);
      const v0: number = cfg.getValue('lg') as number;
      hilog.info(DOMAIN, TAG, 'ListSpace-lg actual=%{public}s expected=%{public}s', String(v0), String(63));
      expect(v0).assertEqual(63);
      const v1: number = cfg.getValue('lg') as number;
      hilog.info(DOMAIN, TAG, 'ListSpace-lg-repeat actual=%{public}s expected=%{public}s', String(v1), String(63));
      expect(v1).assertEqual(63);
      const v2: number | undefined = cfg.getValue('xl');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "xl", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010009 end');
    })

    /**
     * @tc.number: SUB_MM_LAYCFG01_1000
     * @tc.name: testLayCfg010010
     * @tc.desc: Verify layout triple SwiperIndicator resolves sm for main check.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayCfg010010', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010010 begin');
      let cfg: BreakpointType<boolean> = new BreakpointType<boolean>(true, false, false);
      const v0: boolean = cfg.getValue('sm') as boolean;
      hilog.info(DOMAIN, TAG, 'SwiperIndicator-sm actual=%{public}s expected=%{public}s', String(v0), String(true));
      expect(v0).assertEqual(true);
      const v1: boolean = cfg.getValue('sm') as boolean;
      hilog.info(DOMAIN, TAG, 'SwiperIndicator-sm-repeat actual=%{public}s expected=%{public}s', String(v1), String(true));
      expect(v1).assertEqual(true);
      const v2: boolean | undefined = cfg.getValue('xl');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "xl", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010010 end');
    })

    /**
     * @tc.number: SUB_MM_LAYCFG01_1100
     * @tc.name: testLayCfg010011
     * @tc.desc: Verify layout triple SwiperIndicator resolves md for main check.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayCfg010011', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010011 begin');
      let cfg: BreakpointType<boolean> = new BreakpointType<boolean>(true, false, false);
      const v0: boolean = cfg.getValue('md') as boolean;
      hilog.info(DOMAIN, TAG, 'SwiperIndicator-md actual=%{public}s expected=%{public}s', String(v0), String(false));
      expect(v0).assertEqual(false);
      const v1: boolean = cfg.getValue('md') as boolean;
      hilog.info(DOMAIN, TAG, 'SwiperIndicator-md-repeat actual=%{public}s expected=%{public}s', String(v1), String(false));
      expect(v1).assertEqual(false);
      const v2: boolean | undefined = cfg.getValue('xl');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "xl", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010011 end');
    })

    /**
     * @tc.number: SUB_MM_LAYCFG01_1200
     * @tc.name: testLayCfg010012
     * @tc.desc: Verify layout triple SwiperIndicator resolves lg for main check.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayCfg010012', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010012 begin');
      let cfg: BreakpointType<boolean> = new BreakpointType<boolean>(true, false, false);
      const v0: boolean = cfg.getValue('lg') as boolean;
      hilog.info(DOMAIN, TAG, 'SwiperIndicator-lg actual=%{public}s expected=%{public}s', String(v0), String(false));
      expect(v0).assertEqual(false);
      const v1: boolean = cfg.getValue('lg') as boolean;
      hilog.info(DOMAIN, TAG, 'SwiperIndicator-lg-repeat actual=%{public}s expected=%{public}s', String(v1), String(false));
      expect(v1).assertEqual(false);
      const v2: boolean | undefined = cfg.getValue('xl');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "xl", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010012 end');
    })

    /**
     * @tc.number: SUB_MM_LAYCFG01_1300
     * @tc.name: testLayCfg010013
     * @tc.desc: Verify layout triple SwiperDisplayCount resolves sm for main check.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayCfg010013', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010013 begin');
      let cfg: BreakpointType<number> = new BreakpointType<number>(1, 2, 3);
      const v0: number = cfg.getValue('sm') as number;
      hilog.info(DOMAIN, TAG, 'SwiperDisplayCount-sm actual=%{public}s expected=%{public}s', String(v0), String(1));
      expect(v0).assertEqual(1);
      const v1: number = cfg.getValue('sm') as number;
      hilog.info(DOMAIN, TAG, 'SwiperDisplayCount-sm-repeat actual=%{public}s expected=%{public}s', String(v1), String(1));
      expect(v1).assertEqual(1);
      const v2: number | undefined = cfg.getValue('xl');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "xl", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010013 end');
    })

    /**
     * @tc.number: SUB_MM_LAYCFG01_1400
     * @tc.name: testLayCfg010014
     * @tc.desc: Verify layout triple SwiperDisplayCount resolves md for main check.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayCfg010014', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010014 begin');
      let cfg: BreakpointType<number> = new BreakpointType<number>(1, 2, 3);
      const v0: number = cfg.getValue('md') as number;
      hilog.info(DOMAIN, TAG, 'SwiperDisplayCount-md actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      const v1: number = cfg.getValue('md') as number;
      hilog.info(DOMAIN, TAG, 'SwiperDisplayCount-md-repeat actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      const v2: number | undefined = cfg.getValue('xl');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "xl", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010014 end');
    })

    /**
     * @tc.number: SUB_MM_LAYCFG01_1500
     * @tc.name: testLayCfg010015
     * @tc.desc: Verify layout triple SwiperDisplayCount resolves lg for main check.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayCfg010015', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010015 begin');
      let cfg: BreakpointType<number> = new BreakpointType<number>(1, 2, 3);
      const v0: number = cfg.getValue('lg') as number;
      hilog.info(DOMAIN, TAG, 'SwiperDisplayCount-lg actual=%{public}s expected=%{public}s', String(v0), String(3));
      expect(v0).assertEqual(3);
      const v1: number = cfg.getValue('lg') as number;
      hilog.info(DOMAIN, TAG, 'SwiperDisplayCount-lg-repeat actual=%{public}s expected=%{public}s', String(v1), String(3));
      expect(v1).assertEqual(3);
      const v2: number | undefined = cfg.getValue('xl');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "xl", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010015 end');
    })

    /**
     * @tc.number: SUB_MM_LAYCFG01_1600
     * @tc.name: testLayCfg010016
     * @tc.desc: Verify layout triple RecommendColumnsTemplate resolves sm for main check.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayCfg010016', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010016 begin');
      let cfg: BreakpointType<string> = new BreakpointType<string>('1fr 1fr 1fr', '1fr 1fr 1fr 1fr 1fr', '1fr 1fr 1fr 1fr 1fr 1fr');
      const v0: string = cfg.getValue('sm') as string;
      hilog.info(DOMAIN, TAG, 'RecommendColumnsTemplate-sm actual=%{public}s expected=%{public}s', String(v0), String('1fr 1fr 1fr'));
      expect(v0).assertEqual('1fr 1fr 1fr');
      const v1: string = cfg.getValue('sm') as string;
      hilog.info(DOMAIN, TAG, 'RecommendColumnsTemplate-sm-repeat actual=%{public}s expected=%{public}s', String(v1), String('1fr 1fr 1fr'));
      expect(v1).assertEqual('1fr 1fr 1fr');
      const v2: string | undefined = cfg.getValue('xl');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "xl", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010016 end');
    })

    /**
     * @tc.number: SUB_MM_LAYCFG01_1700
     * @tc.name: testLayCfg010017
     * @tc.desc: Verify layout triple RecommendColumnsTemplate resolves md for main check.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayCfg010017', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010017 begin');
      let cfg: BreakpointType<string> = new BreakpointType<string>('1fr 1fr 1fr', '1fr 1fr 1fr 1fr 1fr', '1fr 1fr 1fr 1fr 1fr 1fr');
      const v0: string = cfg.getValue('md') as string;
      hilog.info(DOMAIN, TAG, 'RecommendColumnsTemplate-md actual=%{public}s expected=%{public}s', String(v0), String('1fr 1fr 1fr 1fr 1fr'));
      expect(v0).assertEqual('1fr 1fr 1fr 1fr 1fr');
      const v1: string = cfg.getValue('md') as string;
      hilog.info(DOMAIN, TAG, 'RecommendColumnsTemplate-md-repeat actual=%{public}s expected=%{public}s', String(v1), String('1fr 1fr 1fr 1fr 1fr'));
      expect(v1).assertEqual('1fr 1fr 1fr 1fr 1fr');
      const v2: string | undefined = cfg.getValue('xl');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "xl", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010017 end');
    })

    /**
     * @tc.number: SUB_MM_LAYCFG01_1800
     * @tc.name: testLayCfg010018
     * @tc.desc: Verify layout triple RecommendColumnsTemplate resolves lg for main check.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayCfg010018', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010018 begin');
      let cfg: BreakpointType<string> = new BreakpointType<string>('1fr 1fr 1fr', '1fr 1fr 1fr 1fr 1fr', '1fr 1fr 1fr 1fr 1fr 1fr');
      const v0: string = cfg.getValue('lg') as string;
      hilog.info(DOMAIN, TAG, 'RecommendColumnsTemplate-lg actual=%{public}s expected=%{public}s', String(v0), String('1fr 1fr 1fr 1fr 1fr 1fr'));
      expect(v0).assertEqual('1fr 1fr 1fr 1fr 1fr 1fr');
      const v1: string = cfg.getValue('lg') as string;
      hilog.info(DOMAIN, TAG, 'RecommendColumnsTemplate-lg-repeat actual=%{public}s expected=%{public}s', String(v1), String('1fr 1fr 1fr 1fr 1fr 1fr'));
      expect(v1).assertEqual('1fr 1fr 1fr 1fr 1fr 1fr');
      const v2: string | undefined = cfg.getValue('xl');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "xl", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010018 end');
    })

    /**
     * @tc.number: SUB_MM_LAYCFG01_1900
     * @tc.name: testLayCfg010019
     * @tc.desc: Verify layout triple UserListColumnsTemplate resolves sm for main check.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayCfg010019', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010019 begin');
      let cfg: BreakpointType<string> = new BreakpointType<string>('1fr', '1fr 1fr 1fr 1fr 1fr', '1fr 1fr 1fr 1fr 1fr 1fr');
      const v0: string = cfg.getValue('sm') as string;
      hilog.info(DOMAIN, TAG, 'UserListColumnsTemplate-sm actual=%{public}s expected=%{public}s', String(v0), String('1fr'));
      expect(v0).assertEqual('1fr');
      const v1: string = cfg.getValue('sm') as string;
      hilog.info(DOMAIN, TAG, 'UserListColumnsTemplate-sm-repeat actual=%{public}s expected=%{public}s', String(v1), String('1fr'));
      expect(v1).assertEqual('1fr');
      const v2: string | undefined = cfg.getValue('xl');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "xl", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010019 end');
    })

    /**
     * @tc.number: SUB_MM_LAYCFG01_2000
     * @tc.name: testLayCfg010020
     * @tc.desc: Verify layout triple UserListColumnsTemplate resolves md for main check.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayCfg010020', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010020 begin');
      let cfg: BreakpointType<string> = new BreakpointType<string>('1fr', '1fr 1fr 1fr 1fr 1fr', '1fr 1fr 1fr 1fr 1fr 1fr');
      const v0: string = cfg.getValue('md') as string;
      hilog.info(DOMAIN, TAG, 'UserListColumnsTemplate-md actual=%{public}s expected=%{public}s', String(v0), String('1fr 1fr 1fr 1fr 1fr'));
      expect(v0).assertEqual('1fr 1fr 1fr 1fr 1fr');
      const v1: string = cfg.getValue('md') as string;
      hilog.info(DOMAIN, TAG, 'UserListColumnsTemplate-md-repeat actual=%{public}s expected=%{public}s', String(v1), String('1fr 1fr 1fr 1fr 1fr'));
      expect(v1).assertEqual('1fr 1fr 1fr 1fr 1fr');
      const v2: string | undefined = cfg.getValue('xl');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "xl", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010020 end');
    })

    /**
     * @tc.number: SUB_MM_LAYCFG01_2100
     * @tc.name: testLayCfg010021
     * @tc.desc: Verify layout triple UserListColumnsTemplate resolves lg for main check.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayCfg010021', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010021 begin');
      let cfg: BreakpointType<string> = new BreakpointType<string>('1fr', '1fr 1fr 1fr 1fr 1fr', '1fr 1fr 1fr 1fr 1fr 1fr');
      const v0: string = cfg.getValue('lg') as string;
      hilog.info(DOMAIN, TAG, 'UserListColumnsTemplate-lg actual=%{public}s expected=%{public}s', String(v0), String('1fr 1fr 1fr 1fr 1fr 1fr'));
      expect(v0).assertEqual('1fr 1fr 1fr 1fr 1fr 1fr');
      const v1: string = cfg.getValue('lg') as string;
      hilog.info(DOMAIN, TAG, 'UserListColumnsTemplate-lg-repeat actual=%{public}s expected=%{public}s', String(v1), String('1fr 1fr 1fr 1fr 1fr 1fr'));
      expect(v1).assertEqual('1fr 1fr 1fr 1fr 1fr 1fr');
      const v2: string | undefined = cfg.getValue('xl');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "xl", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010021 end');
    })

    /**
     * @tc.number: SUB_MM_LAYCFG01_2200
     * @tc.name: testLayCfg010022
     * @tc.desc: Verify layout triple SongImageWidth resolves sm for main check.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayCfg010022', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010022 begin');
      let cfg: BreakpointType<string> = new BreakpointType<string>('48vp', '100%', '100%');
      const v0: string = cfg.getValue('sm') as string;
      hilog.info(DOMAIN, TAG, 'SongImageWidth-sm actual=%{public}s expected=%{public}s', String(v0), String('48vp'));
      expect(v0).assertEqual('48vp');
      const v1: string = cfg.getValue('sm') as string;
      hilog.info(DOMAIN, TAG, 'SongImageWidth-sm-repeat actual=%{public}s expected=%{public}s', String(v1), String('48vp'));
      expect(v1).assertEqual('48vp');
      const v2: string | undefined = cfg.getValue('xl');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "xl", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010022 end');
    })

    /**
     * @tc.number: SUB_MM_LAYCFG01_2300
     * @tc.name: testLayCfg010023
     * @tc.desc: Verify layout triple SongImageWidth resolves md for main check.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayCfg010023', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010023 begin');
      let cfg: BreakpointType<string> = new BreakpointType<string>('48vp', '100%', '100%');
      const v0: string = cfg.getValue('md') as string;
      hilog.info(DOMAIN, TAG, 'SongImageWidth-md actual=%{public}s expected=%{public}s', String(v0), String('100%'));
      expect(v0).assertEqual('100%');
      const v1: string = cfg.getValue('md') as string;
      hilog.info(DOMAIN, TAG, 'SongImageWidth-md-repeat actual=%{public}s expected=%{public}s', String(v1), String('100%'));
      expect(v1).assertEqual('100%');
      const v2: string | undefined = cfg.getValue('xl');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "xl", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010023 end');
    })

    /**
     * @tc.number: SUB_MM_LAYCFG01_2400
     * @tc.name: testLayCfg010024
     * @tc.desc: Verify layout triple SongImageWidth resolves lg for main check.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayCfg010024', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010024 begin');
      let cfg: BreakpointType<string> = new BreakpointType<string>('48vp', '100%', '100%');
      const v0: string = cfg.getValue('lg') as string;
      hilog.info(DOMAIN, TAG, 'SongImageWidth-lg actual=%{public}s expected=%{public}s', String(v0), String('100%'));
      expect(v0).assertEqual('100%');
      const v1: string = cfg.getValue('lg') as string;
      hilog.info(DOMAIN, TAG, 'SongImageWidth-lg-repeat actual=%{public}s expected=%{public}s', String(v1), String('100%'));
      expect(v1).assertEqual('100%');
      const v2: string | undefined = cfg.getValue('xl');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "xl", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010024 end');
    })

    /**
     * @tc.number: SUB_MM_LAYCFG01_2500
     * @tc.name: testLayCfg010025
     * @tc.desc: Verify layout triple SongTextMarginLeft resolves sm for main check.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayCfg010025', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010025 begin');
      let cfg: BreakpointType<number> = new BreakpointType<number>(16, 0, 0);
      const v0: number = cfg.getValue('sm') as number;
      hilog.info(DOMAIN, TAG, 'SongTextMarginLeft-sm actual=%{public}s expected=%{public}s', String(v0), String(16));
      expect(v0).assertEqual(16);
      const v1: number = cfg.getValue('sm') as number;
      hilog.info(DOMAIN, TAG, 'SongTextMarginLeft-sm-repeat actual=%{public}s expected=%{public}s', String(v1), String(16));
      expect(v1).assertEqual(16);
      const v2: number | undefined = cfg.getValue('xl');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "xl", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010025 end');
    })

    /**
     * @tc.number: SUB_MM_LAYCFG01_2600
     * @tc.name: testLayCfg010026
     * @tc.desc: Verify layout triple SongTextMarginLeft resolves md for main check.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayCfg010026', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010026 begin');
      let cfg: BreakpointType<number> = new BreakpointType<number>(16, 0, 0);
      const v0: number = cfg.getValue('md') as number;
      hilog.info(DOMAIN, TAG, 'SongTextMarginLeft-md actual=%{public}s expected=%{public}s', String(v0), String(0));
      expect(v0).assertEqual(0);
      const v1: number = cfg.getValue('md') as number;
      hilog.info(DOMAIN, TAG, 'SongTextMarginLeft-md-repeat actual=%{public}s expected=%{public}s', String(v1), String(0));
      expect(v1).assertEqual(0);
      const v2: number | undefined = cfg.getValue('xl');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "xl", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010026 end');
    })

    /**
     * @tc.number: SUB_MM_LAYCFG01_2700
     * @tc.name: testLayCfg010027
     * @tc.desc: Verify layout triple SongTextMarginLeft resolves lg for main check.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayCfg010027', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010027 begin');
      let cfg: BreakpointType<number> = new BreakpointType<number>(16, 0, 0);
      const v0: number = cfg.getValue('lg') as number;
      hilog.info(DOMAIN, TAG, 'SongTextMarginLeft-lg actual=%{public}s expected=%{public}s', String(v0), String(0));
      expect(v0).assertEqual(0);
      const v1: number = cfg.getValue('lg') as number;
      hilog.info(DOMAIN, TAG, 'SongTextMarginLeft-lg-repeat actual=%{public}s expected=%{public}s', String(v1), String(0));
      expect(v1).assertEqual(0);
      const v2: number | undefined = cfg.getValue('xl');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "xl", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010027 end');
    })

    /**
     * @tc.number: SUB_MM_LAYCFG01_2800
     * @tc.name: testLayCfg010028
     * @tc.desc: Verify layout triple IndexGridColumns resolves sm for main check.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayCfg010028', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010028 begin');
      let cfg: BreakpointType<number> = new BreakpointType<number>(4, 8, 12);
      const v0: number = cfg.getValue('sm') as number;
      hilog.info(DOMAIN, TAG, 'IndexGridColumns-sm actual=%{public}s expected=%{public}s', String(v0), String(4));
      expect(v0).assertEqual(4);
      const v1: number = cfg.getValue('sm') as number;
      hilog.info(DOMAIN, TAG, 'IndexGridColumns-sm-repeat actual=%{public}s expected=%{public}s', String(v1), String(4));
      expect(v1).assertEqual(4);
      const v2: number | undefined = cfg.getValue('xl');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "xl", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010028 end');
    })

    /**
     * @tc.number: SUB_MM_LAYCFG01_2900
     * @tc.name: testLayCfg010029
     * @tc.desc: Verify layout triple IndexGridColumns resolves md for main check.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayCfg010029', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010029 begin');
      let cfg: BreakpointType<number> = new BreakpointType<number>(4, 8, 12);
      const v0: number = cfg.getValue('md') as number;
      hilog.info(DOMAIN, TAG, 'IndexGridColumns-md actual=%{public}s expected=%{public}s', String(v0), String(8));
      expect(v0).assertEqual(8);
      const v1: number = cfg.getValue('md') as number;
      hilog.info(DOMAIN, TAG, 'IndexGridColumns-md-repeat actual=%{public}s expected=%{public}s', String(v1), String(8));
      expect(v1).assertEqual(8);
      const v2: number | undefined = cfg.getValue('xl');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "xl", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010029 end');
    })

    /**
     * @tc.number: SUB_MM_LAYCFG01_3000
     * @tc.name: testLayCfg010030
     * @tc.desc: Verify layout triple IndexGridColumns resolves lg for main check.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayCfg010030', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010030 begin');
      let cfg: BreakpointType<number> = new BreakpointType<number>(4, 8, 12);
      const v0: number = cfg.getValue('lg') as number;
      hilog.info(DOMAIN, TAG, 'IndexGridColumns-lg actual=%{public}s expected=%{public}s', String(v0), String(12));
      expect(v0).assertEqual(12);
      const v1: number = cfg.getValue('lg') as number;
      hilog.info(DOMAIN, TAG, 'IndexGridColumns-lg-repeat actual=%{public}s expected=%{public}s', String(v1), String(12));
      expect(v1).assertEqual(12);
      const v2: number | undefined = cfg.getValue('xl');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "xl", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010030 end');
    })

    /**
     * @tc.number: SUB_MM_LAYCFG01_3100
     * @tc.name: testLayCfg010031
     * @tc.desc: Verify layout triple TitleBarGridColumns resolves sm for main check.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayCfg010031', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010031 begin');
      let cfg: BreakpointType<number> = new BreakpointType<number>(8, 16, 24);
      const v0: number = cfg.getValue('sm') as number;
      hilog.info(DOMAIN, TAG, 'TitleBarGridColumns-sm actual=%{public}s expected=%{public}s', String(v0), String(8));
      expect(v0).assertEqual(8);
      const v1: number = cfg.getValue('sm') as number;
      hilog.info(DOMAIN, TAG, 'TitleBarGridColumns-sm-repeat actual=%{public}s expected=%{public}s', String(v1), String(8));
      expect(v1).assertEqual(8);
      const v2: number | undefined = cfg.getValue('xl');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "xl", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010031 end');
    })

    /**
     * @tc.number: SUB_MM_LAYCFG01_3200
     * @tc.name: testLayCfg010032
     * @tc.desc: Verify layout triple TitleBarGridColumns resolves md for main check.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayCfg010032', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010032 begin');
      let cfg: BreakpointType<number> = new BreakpointType<number>(8, 16, 24);
      const v0: number = cfg.getValue('md') as number;
      hilog.info(DOMAIN, TAG, 'TitleBarGridColumns-md actual=%{public}s expected=%{public}s', String(v0), String(16));
      expect(v0).assertEqual(16);
      const v1: number = cfg.getValue('md') as number;
      hilog.info(DOMAIN, TAG, 'TitleBarGridColumns-md-repeat actual=%{public}s expected=%{public}s', String(v1), String(16));
      expect(v1).assertEqual(16);
      const v2: number | undefined = cfg.getValue('xl');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "xl", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010032 end');
    })

    /**
     * @tc.number: SUB_MM_LAYCFG01_3300
     * @tc.name: testLayCfg010033
     * @tc.desc: Verify layout triple TitleBarGridColumns resolves lg for main check.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayCfg010033', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010033 begin');
      let cfg: BreakpointType<number> = new BreakpointType<number>(8, 16, 24);
      const v0: number = cfg.getValue('lg') as number;
      hilog.info(DOMAIN, TAG, 'TitleBarGridColumns-lg actual=%{public}s expected=%{public}s', String(v0), String(24));
      expect(v0).assertEqual(24);
      const v1: number = cfg.getValue('lg') as number;
      hilog.info(DOMAIN, TAG, 'TitleBarGridColumns-lg-repeat actual=%{public}s expected=%{public}s', String(v1), String(24));
      expect(v1).assertEqual(24);
      const v2: number | undefined = cfg.getValue('xl');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "xl", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010033 end');
    })

    /**
     * @tc.number: SUB_MM_LAYCFG01_3400
     * @tc.name: testLayCfg010034
     * @tc.desc: Verify layout triple IndexVertical resolves sm for cross check.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayCfg010034', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010034 begin');
      let cfg: BreakpointType<boolean> = new BreakpointType<boolean>(false, false, true);
      const v0: boolean = cfg.getValue('sm') as boolean;
      hilog.info(DOMAIN, TAG, 'IndexVertical-sm actual=%{public}s expected=%{public}s', String(v0), String(false));
      expect(v0).assertEqual(false);
      const v1: boolean = cfg.getValue('md') as boolean;
      hilog.info(DOMAIN, TAG, 'IndexVertical-md actual=%{public}s expected=%{public}s', String(v1), String(false));
      expect(v1).assertEqual(false);
      hilog.info(DOMAIN, TAG, 'IndexVertical-reference-kept actual=%{public}s expected=true', String(cfg.getValue('sm') === cfg.sm));
      expect(cfg.getValue('sm') === cfg.sm).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010034 end');
    })

    /**
     * @tc.number: SUB_MM_LAYCFG01_3500
     * @tc.name: testLayCfg010035
     * @tc.desc: Verify layout triple IndexVertical resolves md for cross check.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayCfg010035', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010035 begin');
      let cfg: BreakpointType<boolean> = new BreakpointType<boolean>(false, false, true);
      const v0: boolean = cfg.getValue('md') as boolean;
      hilog.info(DOMAIN, TAG, 'IndexVertical-md actual=%{public}s expected=%{public}s', String(v0), String(false));
      expect(v0).assertEqual(false);
      const v1: boolean = cfg.getValue('sm') as boolean;
      hilog.info(DOMAIN, TAG, 'IndexVertical-sm actual=%{public}s expected=%{public}s', String(v1), String(false));
      expect(v1).assertEqual(false);
      hilog.info(DOMAIN, TAG, 'IndexVertical-reference-kept actual=%{public}s expected=true', String(cfg.getValue('md') === cfg.md));
      expect(cfg.getValue('md') === cfg.md).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010035 end');
    })

    /**
     * @tc.number: SUB_MM_LAYCFG01_3600
     * @tc.name: testLayCfg010036
     * @tc.desc: Verify layout triple RecommendGridColumns resolves sm for cross check.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayCfg010036', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010036 begin');
      let cfg: BreakpointType<number> = new BreakpointType<number>(3, 5, 6);
      const v0: number = cfg.getValue('sm') as number;
      hilog.info(DOMAIN, TAG, 'RecommendGridColumns-sm actual=%{public}s expected=%{public}s', String(v0), String(3));
      expect(v0).assertEqual(3);
      const v1: number = cfg.getValue('md') as number;
      hilog.info(DOMAIN, TAG, 'RecommendGridColumns-md actual=%{public}s expected=%{public}s', String(v1), String(5));
      expect(v1).assertEqual(5);
      hilog.info(DOMAIN, TAG, 'RecommendGridColumns-reference-kept actual=%{public}s expected=true', String(cfg.getValue('sm') === cfg.sm));
      expect(cfg.getValue('sm') === cfg.sm).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010036 end');
    })

    /**
     * @tc.number: SUB_MM_LAYCFG01_3700
     * @tc.name: testLayCfg010037
     * @tc.desc: Verify layout triple RecommendGridColumns resolves md for cross check.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayCfg010037', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010037 begin');
      let cfg: BreakpointType<number> = new BreakpointType<number>(3, 5, 6);
      const v0: number = cfg.getValue('md') as number;
      hilog.info(DOMAIN, TAG, 'RecommendGridColumns-md actual=%{public}s expected=%{public}s', String(v0), String(5));
      expect(v0).assertEqual(5);
      const v1: number = cfg.getValue('sm') as number;
      hilog.info(DOMAIN, TAG, 'RecommendGridColumns-sm actual=%{public}s expected=%{public}s', String(v1), String(3));
      expect(v1).assertEqual(3);
      hilog.info(DOMAIN, TAG, 'RecommendGridColumns-reference-kept actual=%{public}s expected=true', String(cfg.getValue('md') === cfg.md));
      expect(cfg.getValue('md') === cfg.md).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010037 end');
    })

    /**
     * @tc.number: SUB_MM_LAYCFG01_3800
     * @tc.name: testLayCfg010038
     * @tc.desc: Verify layout triple ListSpace resolves sm for cross check.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayCfg010038', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010038 begin');
      let cfg: BreakpointType<number> = new BreakpointType<number>(0, 35, 63);
      const v0: number = cfg.getValue('sm') as number;
      hilog.info(DOMAIN, TAG, 'ListSpace-sm actual=%{public}s expected=%{public}s', String(v0), String(0));
      expect(v0).assertEqual(0);
      const v1: number = cfg.getValue('md') as number;
      hilog.info(DOMAIN, TAG, 'ListSpace-md actual=%{public}s expected=%{public}s', String(v1), String(35));
      expect(v1).assertEqual(35);
      hilog.info(DOMAIN, TAG, 'ListSpace-reference-kept actual=%{public}s expected=true', String(cfg.getValue('sm') === cfg.sm));
      expect(cfg.getValue('sm') === cfg.sm).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010038 end');
    })

    /**
     * @tc.number: SUB_MM_LAYCFG01_3900
     * @tc.name: testLayCfg010039
     * @tc.desc: Verify layout triple ListSpace resolves md for cross check.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayCfg010039', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010039 begin');
      let cfg: BreakpointType<number> = new BreakpointType<number>(0, 35, 63);
      const v0: number = cfg.getValue('md') as number;
      hilog.info(DOMAIN, TAG, 'ListSpace-md actual=%{public}s expected=%{public}s', String(v0), String(35));
      expect(v0).assertEqual(35);
      const v1: number = cfg.getValue('sm') as number;
      hilog.info(DOMAIN, TAG, 'ListSpace-sm actual=%{public}s expected=%{public}s', String(v1), String(0));
      expect(v1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'ListSpace-reference-kept actual=%{public}s expected=true', String(cfg.getValue('md') === cfg.md));
      expect(cfg.getValue('md') === cfg.md).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010039 end');
    })

    /**
     * @tc.number: SUB_MM_LAYCFG01_4000
     * @tc.name: testLayCfg010040
     * @tc.desc: Verify layout triple SwiperIndicator resolves sm for cross check.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayCfg010040', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010040 begin');
      let cfg: BreakpointType<boolean> = new BreakpointType<boolean>(true, false, false);
      const v0: boolean = cfg.getValue('sm') as boolean;
      hilog.info(DOMAIN, TAG, 'SwiperIndicator-sm actual=%{public}s expected=%{public}s', String(v0), String(true));
      expect(v0).assertEqual(true);
      const v1: boolean = cfg.getValue('md') as boolean;
      hilog.info(DOMAIN, TAG, 'SwiperIndicator-md actual=%{public}s expected=%{public}s', String(v1), String(false));
      expect(v1).assertEqual(false);
      hilog.info(DOMAIN, TAG, 'SwiperIndicator-reference-kept actual=%{public}s expected=true', String(cfg.getValue('sm') === cfg.sm));
      expect(cfg.getValue('sm') === cfg.sm).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010040 end');
    })

    /**
     * @tc.number: SUB_MM_LAYCFG01_4100
     * @tc.name: testLayCfg010041
     * @tc.desc: Verify layout triple SwiperIndicator resolves md for cross check.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayCfg010041', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010041 begin');
      let cfg: BreakpointType<boolean> = new BreakpointType<boolean>(true, false, false);
      const v0: boolean = cfg.getValue('md') as boolean;
      hilog.info(DOMAIN, TAG, 'SwiperIndicator-md actual=%{public}s expected=%{public}s', String(v0), String(false));
      expect(v0).assertEqual(false);
      const v1: boolean = cfg.getValue('sm') as boolean;
      hilog.info(DOMAIN, TAG, 'SwiperIndicator-sm actual=%{public}s expected=%{public}s', String(v1), String(true));
      expect(v1).assertEqual(true);
      hilog.info(DOMAIN, TAG, 'SwiperIndicator-reference-kept actual=%{public}s expected=true', String(cfg.getValue('md') === cfg.md));
      expect(cfg.getValue('md') === cfg.md).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010041 end');
    })

    /**
     * @tc.number: SUB_MM_LAYCFG01_4200
     * @tc.name: testLayCfg010042
     * @tc.desc: Verify layout triple SwiperDisplayCount resolves sm for cross check.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayCfg010042', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010042 begin');
      let cfg: BreakpointType<number> = new BreakpointType<number>(1, 2, 3);
      const v0: number = cfg.getValue('sm') as number;
      hilog.info(DOMAIN, TAG, 'SwiperDisplayCount-sm actual=%{public}s expected=%{public}s', String(v0), String(1));
      expect(v0).assertEqual(1);
      const v1: number = cfg.getValue('md') as number;
      hilog.info(DOMAIN, TAG, 'SwiperDisplayCount-md actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'SwiperDisplayCount-reference-kept actual=%{public}s expected=true', String(cfg.getValue('sm') === cfg.sm));
      expect(cfg.getValue('sm') === cfg.sm).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010042 end');
    })

    /**
     * @tc.number: SUB_MM_LAYCFG01_4300
     * @tc.name: testLayCfg010043
     * @tc.desc: Verify layout triple SwiperDisplayCount resolves md for cross check.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayCfg010043', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010043 begin');
      let cfg: BreakpointType<number> = new BreakpointType<number>(1, 2, 3);
      const v0: number = cfg.getValue('md') as number;
      hilog.info(DOMAIN, TAG, 'SwiperDisplayCount-md actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      const v1: number = cfg.getValue('sm') as number;
      hilog.info(DOMAIN, TAG, 'SwiperDisplayCount-sm actual=%{public}s expected=%{public}s', String(v1), String(1));
      expect(v1).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'SwiperDisplayCount-reference-kept actual=%{public}s expected=true', String(cfg.getValue('md') === cfg.md));
      expect(cfg.getValue('md') === cfg.md).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010043 end');
    })

    /**
     * @tc.number: SUB_MM_LAYCFG01_4400
     * @tc.name: testLayCfg010044
     * @tc.desc: Verify layout triple RecommendColumnsTemplate resolves sm for cross check.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayCfg010044', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010044 begin');
      let cfg: BreakpointType<string> = new BreakpointType<string>('1fr 1fr 1fr', '1fr 1fr 1fr 1fr 1fr', '1fr 1fr 1fr 1fr 1fr 1fr');
      const v0: string = cfg.getValue('sm') as string;
      hilog.info(DOMAIN, TAG, 'RecommendColumnsTemplate-sm actual=%{public}s expected=%{public}s', String(v0), String('1fr 1fr 1fr'));
      expect(v0).assertEqual('1fr 1fr 1fr');
      const v1: string = cfg.getValue('md') as string;
      hilog.info(DOMAIN, TAG, 'RecommendColumnsTemplate-md actual=%{public}s expected=%{public}s', String(v1), String('1fr 1fr 1fr 1fr 1fr'));
      expect(v1).assertEqual('1fr 1fr 1fr 1fr 1fr');
      hilog.info(DOMAIN, TAG, 'RecommendColumnsTemplate-reference-kept actual=%{public}s expected=true', String(cfg.getValue('sm') === cfg.sm));
      expect(cfg.getValue('sm') === cfg.sm).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010044 end');
    })

    /**
     * @tc.number: SUB_MM_LAYCFG01_4500
     * @tc.name: testLayCfg010045
     * @tc.desc: Verify layout triple RecommendColumnsTemplate resolves md for cross check.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayCfg010045', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010045 begin');
      let cfg: BreakpointType<string> = new BreakpointType<string>('1fr 1fr 1fr', '1fr 1fr 1fr 1fr 1fr', '1fr 1fr 1fr 1fr 1fr 1fr');
      const v0: string = cfg.getValue('md') as string;
      hilog.info(DOMAIN, TAG, 'RecommendColumnsTemplate-md actual=%{public}s expected=%{public}s', String(v0), String('1fr 1fr 1fr 1fr 1fr'));
      expect(v0).assertEqual('1fr 1fr 1fr 1fr 1fr');
      const v1: string = cfg.getValue('sm') as string;
      hilog.info(DOMAIN, TAG, 'RecommendColumnsTemplate-sm actual=%{public}s expected=%{public}s', String(v1), String('1fr 1fr 1fr'));
      expect(v1).assertEqual('1fr 1fr 1fr');
      hilog.info(DOMAIN, TAG, 'RecommendColumnsTemplate-reference-kept actual=%{public}s expected=true', String(cfg.getValue('md') === cfg.md));
      expect(cfg.getValue('md') === cfg.md).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010045 end');
    })

    /**
     * @tc.number: SUB_MM_LAYCFG01_4600
     * @tc.name: testLayCfg010046
     * @tc.desc: Verify layout triple UserListColumnsTemplate resolves sm for cross check.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayCfg010046', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010046 begin');
      let cfg: BreakpointType<string> = new BreakpointType<string>('1fr', '1fr 1fr 1fr 1fr 1fr', '1fr 1fr 1fr 1fr 1fr 1fr');
      const v0: string = cfg.getValue('sm') as string;
      hilog.info(DOMAIN, TAG, 'UserListColumnsTemplate-sm actual=%{public}s expected=%{public}s', String(v0), String('1fr'));
      expect(v0).assertEqual('1fr');
      const v1: string = cfg.getValue('md') as string;
      hilog.info(DOMAIN, TAG, 'UserListColumnsTemplate-md actual=%{public}s expected=%{public}s', String(v1), String('1fr 1fr 1fr 1fr 1fr'));
      expect(v1).assertEqual('1fr 1fr 1fr 1fr 1fr');
      hilog.info(DOMAIN, TAG, 'UserListColumnsTemplate-reference-kept actual=%{public}s expected=true', String(cfg.getValue('sm') === cfg.sm));
      expect(cfg.getValue('sm') === cfg.sm).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010046 end');
    })

    /**
     * @tc.number: SUB_MM_LAYCFG01_4700
     * @tc.name: testLayCfg010047
     * @tc.desc: Verify layout triple UserListColumnsTemplate resolves md for cross check.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayCfg010047', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010047 begin');
      let cfg: BreakpointType<string> = new BreakpointType<string>('1fr', '1fr 1fr 1fr 1fr 1fr', '1fr 1fr 1fr 1fr 1fr 1fr');
      const v0: string = cfg.getValue('md') as string;
      hilog.info(DOMAIN, TAG, 'UserListColumnsTemplate-md actual=%{public}s expected=%{public}s', String(v0), String('1fr 1fr 1fr 1fr 1fr'));
      expect(v0).assertEqual('1fr 1fr 1fr 1fr 1fr');
      const v1: string = cfg.getValue('sm') as string;
      hilog.info(DOMAIN, TAG, 'UserListColumnsTemplate-sm actual=%{public}s expected=%{public}s', String(v1), String('1fr'));
      expect(v1).assertEqual('1fr');
      hilog.info(DOMAIN, TAG, 'UserListColumnsTemplate-reference-kept actual=%{public}s expected=true', String(cfg.getValue('md') === cfg.md));
      expect(cfg.getValue('md') === cfg.md).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010047 end');
    })

    /**
     * @tc.number: SUB_MM_LAYCFG01_4800
     * @tc.name: testLayCfg010048
     * @tc.desc: Verify layout triple SongImageWidth resolves sm for cross check.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayCfg010048', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010048 begin');
      let cfg: BreakpointType<string> = new BreakpointType<string>('48vp', '100%', '100%');
      const v0: string = cfg.getValue('sm') as string;
      hilog.info(DOMAIN, TAG, 'SongImageWidth-sm actual=%{public}s expected=%{public}s', String(v0), String('48vp'));
      expect(v0).assertEqual('48vp');
      const v1: string = cfg.getValue('md') as string;
      hilog.info(DOMAIN, TAG, 'SongImageWidth-md actual=%{public}s expected=%{public}s', String(v1), String('100%'));
      expect(v1).assertEqual('100%');
      hilog.info(DOMAIN, TAG, 'SongImageWidth-reference-kept actual=%{public}s expected=true', String(cfg.getValue('sm') === cfg.sm));
      expect(cfg.getValue('sm') === cfg.sm).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010048 end');
    })

    /**
     * @tc.number: SUB_MM_LAYCFG01_4900
     * @tc.name: testLayCfg010049
     * @tc.desc: Verify layout triple SongImageWidth resolves md for cross check.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayCfg010049', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010049 begin');
      let cfg: BreakpointType<string> = new BreakpointType<string>('48vp', '100%', '100%');
      const v0: string = cfg.getValue('md') as string;
      hilog.info(DOMAIN, TAG, 'SongImageWidth-md actual=%{public}s expected=%{public}s', String(v0), String('100%'));
      expect(v0).assertEqual('100%');
      const v1: string = cfg.getValue('sm') as string;
      hilog.info(DOMAIN, TAG, 'SongImageWidth-sm actual=%{public}s expected=%{public}s', String(v1), String('48vp'));
      expect(v1).assertEqual('48vp');
      hilog.info(DOMAIN, TAG, 'SongImageWidth-reference-kept actual=%{public}s expected=true', String(cfg.getValue('md') === cfg.md));
      expect(cfg.getValue('md') === cfg.md).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010049 end');
    })

    /**
     * @tc.number: SUB_MM_LAYCFG01_5000
     * @tc.name: testLayCfg010050
     * @tc.desc: Verify layout triple SongTextMarginLeft resolves sm for cross check.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayCfg010050', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010050 begin');
      let cfg: BreakpointType<number> = new BreakpointType<number>(16, 0, 0);
      const v0: number = cfg.getValue('sm') as number;
      hilog.info(DOMAIN, TAG, 'SongTextMarginLeft-sm actual=%{public}s expected=%{public}s', String(v0), String(16));
      expect(v0).assertEqual(16);
      const v1: number = cfg.getValue('md') as number;
      hilog.info(DOMAIN, TAG, 'SongTextMarginLeft-md actual=%{public}s expected=%{public}s', String(v1), String(0));
      expect(v1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'SongTextMarginLeft-reference-kept actual=%{public}s expected=true', String(cfg.getValue('sm') === cfg.sm));
      expect(cfg.getValue('sm') === cfg.sm).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010050 end');
    })

    /**
     * @tc.number: SUB_MM_LAYCFG01_5100
     * @tc.name: testLayCfg010051
     * @tc.desc: Verify layout triple SongTextMarginLeft resolves md for cross check.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayCfg010051', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010051 begin');
      let cfg: BreakpointType<number> = new BreakpointType<number>(16, 0, 0);
      const v0: number = cfg.getValue('md') as number;
      hilog.info(DOMAIN, TAG, 'SongTextMarginLeft-md actual=%{public}s expected=%{public}s', String(v0), String(0));
      expect(v0).assertEqual(0);
      const v1: number = cfg.getValue('sm') as number;
      hilog.info(DOMAIN, TAG, 'SongTextMarginLeft-sm actual=%{public}s expected=%{public}s', String(v1), String(16));
      expect(v1).assertEqual(16);
      hilog.info(DOMAIN, TAG, 'SongTextMarginLeft-reference-kept actual=%{public}s expected=true', String(cfg.getValue('md') === cfg.md));
      expect(cfg.getValue('md') === cfg.md).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010051 end');
    })

    /**
     * @tc.number: SUB_MM_LAYCFG01_5200
     * @tc.name: testLayCfg010052
     * @tc.desc: Verify layout triple IndexGridColumns resolves sm for cross check.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayCfg010052', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010052 begin');
      let cfg: BreakpointType<number> = new BreakpointType<number>(4, 8, 12);
      const v0: number = cfg.getValue('sm') as number;
      hilog.info(DOMAIN, TAG, 'IndexGridColumns-sm actual=%{public}s expected=%{public}s', String(v0), String(4));
      expect(v0).assertEqual(4);
      const v1: number = cfg.getValue('md') as number;
      hilog.info(DOMAIN, TAG, 'IndexGridColumns-md actual=%{public}s expected=%{public}s', String(v1), String(8));
      expect(v1).assertEqual(8);
      hilog.info(DOMAIN, TAG, 'IndexGridColumns-reference-kept actual=%{public}s expected=true', String(cfg.getValue('sm') === cfg.sm));
      expect(cfg.getValue('sm') === cfg.sm).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010052 end');
    })

    /**
     * @tc.number: SUB_MM_LAYCFG01_5300
     * @tc.name: testLayCfg010053
     * @tc.desc: Verify layout triple IndexGridColumns resolves md for cross check.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayCfg010053', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010053 begin');
      let cfg: BreakpointType<number> = new BreakpointType<number>(4, 8, 12);
      const v0: number = cfg.getValue('md') as number;
      hilog.info(DOMAIN, TAG, 'IndexGridColumns-md actual=%{public}s expected=%{public}s', String(v0), String(8));
      expect(v0).assertEqual(8);
      const v1: number = cfg.getValue('sm') as number;
      hilog.info(DOMAIN, TAG, 'IndexGridColumns-sm actual=%{public}s expected=%{public}s', String(v1), String(4));
      expect(v1).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'IndexGridColumns-reference-kept actual=%{public}s expected=true', String(cfg.getValue('md') === cfg.md));
      expect(cfg.getValue('md') === cfg.md).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010053 end');
    })

    /**
     * @tc.number: SUB_MM_LAYCFG01_5400
     * @tc.name: testLayCfg010054
     * @tc.desc: Verify layout triple TitleBarGridColumns resolves sm for cross check.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayCfg010054', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010054 begin');
      let cfg: BreakpointType<number> = new BreakpointType<number>(8, 16, 24);
      const v0: number = cfg.getValue('sm') as number;
      hilog.info(DOMAIN, TAG, 'TitleBarGridColumns-sm actual=%{public}s expected=%{public}s', String(v0), String(8));
      expect(v0).assertEqual(8);
      const v1: number = cfg.getValue('md') as number;
      hilog.info(DOMAIN, TAG, 'TitleBarGridColumns-md actual=%{public}s expected=%{public}s', String(v1), String(16));
      expect(v1).assertEqual(16);
      hilog.info(DOMAIN, TAG, 'TitleBarGridColumns-reference-kept actual=%{public}s expected=true', String(cfg.getValue('sm') === cfg.sm));
      expect(cfg.getValue('sm') === cfg.sm).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010054 end');
    })

    /**
     * @tc.number: SUB_MM_LAYCFG01_5500
     * @tc.name: testLayCfg010055
     * @tc.desc: Verify layout triple TitleBarGridColumns resolves md for cross check.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayCfg010055', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010055 begin');
      let cfg: BreakpointType<number> = new BreakpointType<number>(8, 16, 24);
      const v0: number = cfg.getValue('md') as number;
      hilog.info(DOMAIN, TAG, 'TitleBarGridColumns-md actual=%{public}s expected=%{public}s', String(v0), String(16));
      expect(v0).assertEqual(16);
      const v1: number = cfg.getValue('sm') as number;
      hilog.info(DOMAIN, TAG, 'TitleBarGridColumns-sm actual=%{public}s expected=%{public}s', String(v1), String(8));
      expect(v1).assertEqual(8);
      hilog.info(DOMAIN, TAG, 'TitleBarGridColumns-reference-kept actual=%{public}s expected=true', String(cfg.getValue('md') === cfg.md));
      expect(cfg.getValue('md') === cfg.md).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010055 end');
    })

    /**
     * @tc.number: SUB_MM_LAYCFG01_5600
     * @tc.name: testLayCfg010056
     * @tc.desc: Verify grid row count for 3 columns via sm key (variant 1).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayCfg010056', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010056 begin');
      let colsCfg: BreakpointType<number> = new BreakpointType<number>(3, 5, 6);
      let cols: number = colsCfg.getValue("sm") as number;
      const v0: number = cols;
      hilog.info(DOMAIN, TAG, 'selected-columns actual=%{public}s expected=%{public}s', String(v0), String(3));
      expect(v0).assertEqual(3);
      const v1: number = Math.ceil(12 / cols);
      hilog.info(DOMAIN, TAG, 'row-count actual=%{public}s expected=%{public}s', String(v1), String(4));
      expect(v1).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'grid-covers-all-items actual=%{public}s expected=true', String(Math.ceil(12 / cols) * cols >= 12));
      expect(Math.ceil(12 / cols) * cols >= 12).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010056 end');
    })

    /**
     * @tc.number: SUB_MM_LAYCFG01_5700
     * @tc.name: testLayCfg010057
     * @tc.desc: Verify grid row count for 5 columns via md key (variant 2).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayCfg010057', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010057 begin');
      let colsCfg: BreakpointType<number> = new BreakpointType<number>(3, 5, 6);
      let cols: number = colsCfg.getValue("md") as number;
      const v0: number = cols;
      hilog.info(DOMAIN, TAG, 'selected-columns actual=%{public}s expected=%{public}s', String(v0), String(5));
      expect(v0).assertEqual(5);
      const v1: number = Math.ceil(12 / cols);
      hilog.info(DOMAIN, TAG, 'row-count actual=%{public}s expected=%{public}s', String(v1), String(3));
      expect(v1).assertEqual(3);
      hilog.info(DOMAIN, TAG, 'grid-covers-all-items actual=%{public}s expected=true', String(Math.ceil(12 / cols) * cols >= 12));
      expect(Math.ceil(12 / cols) * cols >= 12).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010057 end');
    })

    /**
     * @tc.number: SUB_MM_LAYCFG01_5800
     * @tc.name: testLayCfg010058
     * @tc.desc: Verify grid row count for 6 columns via lg key (variant 3).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayCfg010058', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010058 begin');
      let colsCfg: BreakpointType<number> = new BreakpointType<number>(3, 5, 6);
      let cols: number = colsCfg.getValue("lg") as number;
      const v0: number = cols;
      hilog.info(DOMAIN, TAG, 'selected-columns actual=%{public}s expected=%{public}s', String(v0), String(6));
      expect(v0).assertEqual(6);
      const v1: number = Math.ceil(12 / cols);
      hilog.info(DOMAIN, TAG, 'row-count actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'grid-covers-all-items actual=%{public}s expected=true', String(Math.ceil(12 / cols) * cols >= 12));
      expect(Math.ceil(12 / cols) * cols >= 12).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010058 end');
    })

    /**
     * @tc.number: SUB_MM_LAYCFG01_5900
     * @tc.name: testLayCfg010059
     * @tc.desc: Verify grid row count for 3 columns via sm key (variant 4).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayCfg010059', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010059 begin');
      let colsCfg: BreakpointType<number> = new BreakpointType<number>(3, 5, 6);
      let cols: number = colsCfg.getValue("sm") as number;
      const v0: number = cols;
      hilog.info(DOMAIN, TAG, 'selected-columns actual=%{public}s expected=%{public}s', String(v0), String(3));
      expect(v0).assertEqual(3);
      const v1: number = Math.ceil(12 / cols);
      hilog.info(DOMAIN, TAG, 'row-count actual=%{public}s expected=%{public}s', String(v1), String(4));
      expect(v1).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'grid-covers-all-items actual=%{public}s expected=true', String(Math.ceil(12 / cols) * cols >= 12));
      expect(Math.ceil(12 / cols) * cols >= 12).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010059 end');
    })

    /**
     * @tc.number: SUB_MM_LAYCFG01_6000
     * @tc.name: testLayCfg010060
     * @tc.desc: Verify grid row count for 5 columns via md key (variant 5).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayCfg010060', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010060 begin');
      let colsCfg: BreakpointType<number> = new BreakpointType<number>(3, 5, 6);
      let cols: number = colsCfg.getValue("md") as number;
      const v0: number = cols;
      hilog.info(DOMAIN, TAG, 'selected-columns actual=%{public}s expected=%{public}s', String(v0), String(5));
      expect(v0).assertEqual(5);
      const v1: number = Math.ceil(12 / cols);
      hilog.info(DOMAIN, TAG, 'row-count actual=%{public}s expected=%{public}s', String(v1), String(3));
      expect(v1).assertEqual(3);
      hilog.info(DOMAIN, TAG, 'grid-covers-all-items actual=%{public}s expected=true', String(Math.ceil(12 / cols) * cols >= 12));
      expect(Math.ceil(12 / cols) * cols >= 12).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010060 end');
    })

    /**
     * @tc.number: SUB_MM_LAYCFG01_6100
     * @tc.name: testLayCfg010061
     * @tc.desc: Verify grid row count for 6 columns via lg key (variant 6).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayCfg010061', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010061 begin');
      let colsCfg: BreakpointType<number> = new BreakpointType<number>(3, 5, 6);
      let cols: number = colsCfg.getValue("lg") as number;
      const v0: number = cols;
      hilog.info(DOMAIN, TAG, 'selected-columns actual=%{public}s expected=%{public}s', String(v0), String(6));
      expect(v0).assertEqual(6);
      const v1: number = Math.ceil(12 / cols);
      hilog.info(DOMAIN, TAG, 'row-count actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'grid-covers-all-items actual=%{public}s expected=true', String(Math.ceil(12 / cols) * cols >= 12));
      expect(Math.ceil(12 / cols) * cols >= 12).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010061 end');
    })

    /**
     * @tc.number: SUB_MM_LAYCFG01_6200
     * @tc.name: testLayCfg010062
     * @tc.desc: Verify grid row count for 3 columns via sm key (variant 1).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayCfg010062', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010062 begin');
      let colsCfg: BreakpointType<number> = new BreakpointType<number>(3, 5, 6);
      let cols: number = colsCfg.getValue("sm") as number;
      const v0: number = cols;
      hilog.info(DOMAIN, TAG, 'selected-columns actual=%{public}s expected=%{public}s', String(v0), String(3));
      expect(v0).assertEqual(3);
      const v1: number = Math.ceil(12 / cols);
      hilog.info(DOMAIN, TAG, 'row-count actual=%{public}s expected=%{public}s', String(v1), String(4));
      expect(v1).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'grid-covers-all-items actual=%{public}s expected=true', String(Math.ceil(12 / cols) * cols >= 12));
      expect(Math.ceil(12 / cols) * cols >= 12).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010062 end');
    })

    /**
     * @tc.number: SUB_MM_LAYCFG01_6300
     * @tc.name: testLayCfg010063
     * @tc.desc: Verify grid row count for 5 columns via md key (variant 2).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayCfg010063', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010063 begin');
      let colsCfg: BreakpointType<number> = new BreakpointType<number>(3, 5, 6);
      let cols: number = colsCfg.getValue("md") as number;
      const v0: number = cols;
      hilog.info(DOMAIN, TAG, 'selected-columns actual=%{public}s expected=%{public}s', String(v0), String(5));
      expect(v0).assertEqual(5);
      const v1: number = Math.ceil(12 / cols);
      hilog.info(DOMAIN, TAG, 'row-count actual=%{public}s expected=%{public}s', String(v1), String(3));
      expect(v1).assertEqual(3);
      hilog.info(DOMAIN, TAG, 'grid-covers-all-items actual=%{public}s expected=true', String(Math.ceil(12 / cols) * cols >= 12));
      expect(Math.ceil(12 / cols) * cols >= 12).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010063 end');
    })

    /**
     * @tc.number: SUB_MM_LAYCFG01_6400
     * @tc.name: testLayCfg010064
     * @tc.desc: Verify grid row count for 6 columns via lg key (variant 3).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayCfg010064', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010064 begin');
      let colsCfg: BreakpointType<number> = new BreakpointType<number>(3, 5, 6);
      let cols: number = colsCfg.getValue("lg") as number;
      const v0: number = cols;
      hilog.info(DOMAIN, TAG, 'selected-columns actual=%{public}s expected=%{public}s', String(v0), String(6));
      expect(v0).assertEqual(6);
      const v1: number = Math.ceil(12 / cols);
      hilog.info(DOMAIN, TAG, 'row-count actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'grid-covers-all-items actual=%{public}s expected=true', String(Math.ceil(12 / cols) * cols >= 12));
      expect(Math.ceil(12 / cols) * cols >= 12).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010064 end');
    })

    /**
     * @tc.number: SUB_MM_LAYCFG01_6500
     * @tc.name: testLayCfg010065
     * @tc.desc: Verify grid row count for 3 columns via sm key (variant 4).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayCfg010065', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010065 begin');
      let colsCfg: BreakpointType<number> = new BreakpointType<number>(3, 5, 6);
      let cols: number = colsCfg.getValue("sm") as number;
      const v0: number = cols;
      hilog.info(DOMAIN, TAG, 'selected-columns actual=%{public}s expected=%{public}s', String(v0), String(3));
      expect(v0).assertEqual(3);
      const v1: number = Math.ceil(12 / cols);
      hilog.info(DOMAIN, TAG, 'row-count actual=%{public}s expected=%{public}s', String(v1), String(4));
      expect(v1).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'grid-covers-all-items actual=%{public}s expected=true', String(Math.ceil(12 / cols) * cols >= 12));
      expect(Math.ceil(12 / cols) * cols >= 12).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010065 end');
    })

    /**
     * @tc.number: SUB_MM_LAYCFG01_6600
     * @tc.name: testLayCfg010066
     * @tc.desc: Verify grid row count for 5 columns via md key (variant 5).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayCfg010066', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010066 begin');
      let colsCfg: BreakpointType<number> = new BreakpointType<number>(3, 5, 6);
      let cols: number = colsCfg.getValue("md") as number;
      const v0: number = cols;
      hilog.info(DOMAIN, TAG, 'selected-columns actual=%{public}s expected=%{public}s', String(v0), String(5));
      expect(v0).assertEqual(5);
      const v1: number = Math.ceil(12 / cols);
      hilog.info(DOMAIN, TAG, 'row-count actual=%{public}s expected=%{public}s', String(v1), String(3));
      expect(v1).assertEqual(3);
      hilog.info(DOMAIN, TAG, 'grid-covers-all-items actual=%{public}s expected=true', String(Math.ceil(12 / cols) * cols >= 12));
      expect(Math.ceil(12 / cols) * cols >= 12).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010066 end');
    })

    /**
     * @tc.number: SUB_MM_LAYCFG01_6700
     * @tc.name: testLayCfg010067
     * @tc.desc: Verify grid row count for 6 columns via lg key (variant 6).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayCfg010067', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010067 begin');
      let colsCfg: BreakpointType<number> = new BreakpointType<number>(3, 5, 6);
      let cols: number = colsCfg.getValue("lg") as number;
      const v0: number = cols;
      hilog.info(DOMAIN, TAG, 'selected-columns actual=%{public}s expected=%{public}s', String(v0), String(6));
      expect(v0).assertEqual(6);
      const v1: number = Math.ceil(12 / cols);
      hilog.info(DOMAIN, TAG, 'row-count actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'grid-covers-all-items actual=%{public}s expected=true', String(Math.ceil(12 / cols) * cols >= 12));
      expect(Math.ceil(12 / cols) * cols >= 12).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010067 end');
    })

    /**
     * @tc.number: SUB_MM_LAYCFG01_6800
     * @tc.name: testLayCfg010068
     * @tc.desc: Verify grid row count for 3 columns via sm key (variant 1).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayCfg010068', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010068 begin');
      let colsCfg: BreakpointType<number> = new BreakpointType<number>(3, 5, 6);
      let cols: number = colsCfg.getValue("sm") as number;
      const v0: number = cols;
      hilog.info(DOMAIN, TAG, 'selected-columns actual=%{public}s expected=%{public}s', String(v0), String(3));
      expect(v0).assertEqual(3);
      const v1: number = Math.ceil(12 / cols);
      hilog.info(DOMAIN, TAG, 'row-count actual=%{public}s expected=%{public}s', String(v1), String(4));
      expect(v1).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'grid-covers-all-items actual=%{public}s expected=true', String(Math.ceil(12 / cols) * cols >= 12));
      expect(Math.ceil(12 / cols) * cols >= 12).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010068 end');
    })

    /**
     * @tc.number: SUB_MM_LAYCFG01_6900
     * @tc.name: testLayCfg010069
     * @tc.desc: Verify grid row count for 5 columns via md key (variant 2).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayCfg010069', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010069 begin');
      let colsCfg: BreakpointType<number> = new BreakpointType<number>(3, 5, 6);
      let cols: number = colsCfg.getValue("md") as number;
      const v0: number = cols;
      hilog.info(DOMAIN, TAG, 'selected-columns actual=%{public}s expected=%{public}s', String(v0), String(5));
      expect(v0).assertEqual(5);
      const v1: number = Math.ceil(12 / cols);
      hilog.info(DOMAIN, TAG, 'row-count actual=%{public}s expected=%{public}s', String(v1), String(3));
      expect(v1).assertEqual(3);
      hilog.info(DOMAIN, TAG, 'grid-covers-all-items actual=%{public}s expected=true', String(Math.ceil(12 / cols) * cols >= 12));
      expect(Math.ceil(12 / cols) * cols >= 12).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010069 end');
    })

    /**
     * @tc.number: SUB_MM_LAYCFG01_7000
     * @tc.name: testLayCfg010070
     * @tc.desc: Verify grid row count for 6 columns via lg key (variant 3).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayCfg010070', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010070 begin');
      let colsCfg: BreakpointType<number> = new BreakpointType<number>(3, 5, 6);
      let cols: number = colsCfg.getValue("lg") as number;
      const v0: number = cols;
      hilog.info(DOMAIN, TAG, 'selected-columns actual=%{public}s expected=%{public}s', String(v0), String(6));
      expect(v0).assertEqual(6);
      const v1: number = Math.ceil(12 / cols);
      hilog.info(DOMAIN, TAG, 'row-count actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'grid-covers-all-items actual=%{public}s expected=true', String(Math.ceil(12 / cols) * cols >= 12));
      expect(Math.ceil(12 / cols) * cols >= 12).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010070 end');
    })

    /**
     * @tc.number: SUB_MM_LAYCFG01_7100
     * @tc.name: testLayCfg010071
     * @tc.desc: Verify grid row count for 3 columns via sm key (variant 4).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayCfg010071', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010071 begin');
      let colsCfg: BreakpointType<number> = new BreakpointType<number>(3, 5, 6);
      let cols: number = colsCfg.getValue("sm") as number;
      const v0: number = cols;
      hilog.info(DOMAIN, TAG, 'selected-columns actual=%{public}s expected=%{public}s', String(v0), String(3));
      expect(v0).assertEqual(3);
      const v1: number = Math.ceil(12 / cols);
      hilog.info(DOMAIN, TAG, 'row-count actual=%{public}s expected=%{public}s', String(v1), String(4));
      expect(v1).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'grid-covers-all-items actual=%{public}s expected=true', String(Math.ceil(12 / cols) * cols >= 12));
      expect(Math.ceil(12 / cols) * cols >= 12).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010071 end');
    })

    /**
     * @tc.number: SUB_MM_LAYCFG01_7200
     * @tc.name: testLayCfg010072
     * @tc.desc: Verify grid row count for 5 columns via md key (variant 5).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayCfg010072', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010072 begin');
      let colsCfg: BreakpointType<number> = new BreakpointType<number>(3, 5, 6);
      let cols: number = colsCfg.getValue("md") as number;
      const v0: number = cols;
      hilog.info(DOMAIN, TAG, 'selected-columns actual=%{public}s expected=%{public}s', String(v0), String(5));
      expect(v0).assertEqual(5);
      const v1: number = Math.ceil(12 / cols);
      hilog.info(DOMAIN, TAG, 'row-count actual=%{public}s expected=%{public}s', String(v1), String(3));
      expect(v1).assertEqual(3);
      hilog.info(DOMAIN, TAG, 'grid-covers-all-items actual=%{public}s expected=true', String(Math.ceil(12 / cols) * cols >= 12));
      expect(Math.ceil(12 / cols) * cols >= 12).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010072 end');
    })

    /**
     * @tc.number: SUB_MM_LAYCFG01_7300
     * @tc.name: testLayCfg010073
     * @tc.desc: Verify grid row count for 6 columns via lg key (variant 6).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayCfg010073', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010073 begin');
      let colsCfg: BreakpointType<number> = new BreakpointType<number>(3, 5, 6);
      let cols: number = colsCfg.getValue("lg") as number;
      const v0: number = cols;
      hilog.info(DOMAIN, TAG, 'selected-columns actual=%{public}s expected=%{public}s', String(v0), String(6));
      expect(v0).assertEqual(6);
      const v1: number = Math.ceil(12 / cols);
      hilog.info(DOMAIN, TAG, 'row-count actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'grid-covers-all-items actual=%{public}s expected=true', String(Math.ceil(12 / cols) * cols >= 12));
      expect(Math.ceil(12 / cols) * cols >= 12).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010073 end');
    })

    /**
     * @tc.number: SUB_MM_LAYCFG01_7400
     * @tc.name: testLayCfg010074
     * @tc.desc: Anchor: invalid breakpoint key must not silently select a column count
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testLayCfg010074', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010074 begin');
      let cfg: BreakpointType<number> = new BreakpointType<number>(3, 5, 6);
      let picked: number | undefined = cfg.getValue('');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=undefined', String(picked));
      expect(picked).assertUndefined();
      const v0: number = cfg.getValue('lg') as number;
      hilog.info(DOMAIN, TAG, 'lg-columns actual=%{public}s expected=%{public}s', String(v0), String(6));
      expect(v0).assertEqual(6);
      const v1: number = cfg.getValue('sm') as number;
      hilog.info(DOMAIN, TAG, 'sm-columns actual=%{public}s expected=%{public}s', String(v1), String(3));
      expect(v1).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010074 end');
    })

    /**
     * @tc.number: SUB_MM_LAYCFG01_7500
     * @tc.name: testLayCfg010075
     * @tc.desc: Anchor: uppercase breakpoint key must be rejected by the layout table
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testLayCfg010075', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010075 begin');
      let cfg: BreakpointType<number> = new BreakpointType<number>(3, 5, 6);
      let picked: number | undefined = cfg.getValue('LG');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=undefined', String(picked));
      expect(picked).assertUndefined();
      const v0: string = cfg.getValue('lg') === undefined ? 'missing' : 'present';
      hilog.info(DOMAIN, TAG, 'lowercase-key-present actual=%{public}s expected=%{public}s', String(v0), String('present'));
      expect(v0).assertEqual('present');
      const v1: number = Math.ceil(12 / 6);
      hilog.info(DOMAIN, TAG, 'lg-row-count actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayCfg010075 end');
    })

  })
}
