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
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { LayoutPolicy } from '../../../main/ets/model/LayoutPolicy';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function structureTest() {
  describe('StructureTest', () => {

    /**
     * @tc.name   testStructure0001
     * @tc.number SUB_ACCT_STRUCT_0001
     * @tc.desc   width 839 resolves to single layout at the 840 threshold
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStructure0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0001 begin');
      const result: boolean = LayoutPolicy.isWideLayout(839);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.isWideLayout(840)), String(true));
      expect(LayoutPolicy.isWideLayout(840)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.resolveBundleName('Music')), String('Music'));
      expect(LayoutPolicy.resolveBundleName('Music')).assertEqual('Music');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0001 end');
    })

    /**
     * @tc.name   testStructure0002
     * @tc.number SUB_ACCT_STRUCT_0002
     * @tc.desc   width 840 resolves to split layout at the 840 threshold
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStructure0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0002 begin');
      const result: boolean = LayoutPolicy.isWideLayout(840);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.isWideLayout(839)), String(false));
      expect(LayoutPolicy.isWideLayout(839)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.resolveBundleName('Video')), String('Video'));
      expect(LayoutPolicy.resolveBundleName('Video')).assertEqual('Video');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0002 end');
    })

    /**
     * @tc.name   testStructure0003
     * @tc.number SUB_ACCT_STRUCT_0003
     * @tc.desc   width 841 resolves to split layout at the 840 threshold
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStructure0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0003 begin');
      const result: boolean = LayoutPolicy.isWideLayout(841);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.isWideLayout(840)), String(true));
      expect(LayoutPolicy.isWideLayout(840)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.resolveBundleName('Map')), String('Map'));
      expect(LayoutPolicy.resolveBundleName('Map')).assertEqual('Map');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0003 end');
    })

    /**
     * @tc.name   testStructure0004
     * @tc.number SUB_ACCT_STRUCT_0004
     * @tc.desc   width 0 resolves to single layout at the 840 threshold
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStructure0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0004 begin');
      const result: boolean = LayoutPolicy.isWideLayout(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.isWideLayout(1)), String(false));
      expect(LayoutPolicy.isWideLayout(1)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.resolveBundleName(undefined)), String(''));
      expect(LayoutPolicy.resolveBundleName(undefined)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0004 end');
    })

    /**
     * @tc.name   testStructure0005
     * @tc.number SUB_ACCT_STRUCT_0005
     * @tc.desc   width 1 resolves to single layout at the 840 threshold
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStructure0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0005 begin');
      const result: boolean = LayoutPolicy.isWideLayout(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.isWideLayout(2)), String(false));
      expect(LayoutPolicy.isWideLayout(2)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.resolveBundleName('')), String(''));
      expect(LayoutPolicy.resolveBundleName('')).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0005 end');
    })

    /**
     * @tc.name   testStructure0006
     * @tc.number SUB_ACCT_STRUCT_0006
     * @tc.desc   width 100 resolves to single layout at the 840 threshold
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStructure0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0006 begin');
      const result: boolean = LayoutPolicy.isWideLayout(100);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.isWideLayout(101)), String(false));
      expect(LayoutPolicy.isWideLayout(101)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.resolveBundleName('music')), String('music'));
      expect(LayoutPolicy.resolveBundleName('music')).assertEqual('music');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0006 end');
    })

    /**
     * @tc.name   testStructure0007
     * @tc.number SUB_ACCT_STRUCT_0007
     * @tc.desc   width 320 resolves to single layout at the 840 threshold
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStructure0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0007 begin');
      const result: boolean = LayoutPolicy.isWideLayout(320);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.isWideLayout(321)), String(false));
      expect(LayoutPolicy.isWideLayout(321)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.resolveBundleName('Music2')), String('Music2'));
      expect(LayoutPolicy.resolveBundleName('Music2')).assertEqual('Music2');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0007 end');
    })

    /**
     * @tc.name   testStructure0008
     * @tc.number SUB_ACCT_STRUCT_0008
     * @tc.desc   width 360 resolves to single layout at the 840 threshold
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStructure0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0008 begin');
      const result: boolean = LayoutPolicy.isWideLayout(360);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.isWideLayout(361)), String(false));
      expect(LayoutPolicy.isWideLayout(361)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.resolveBundleName(undefined)), String(''));
      expect(LayoutPolicy.resolveBundleName(undefined)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0008 end');
    })

    /**
     * @tc.name   testStructure0009
     * @tc.number SUB_ACCT_STRUCT_0009
     * @tc.desc   width 480 resolves to single layout at the 840 threshold
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStructure0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0009 begin');
      const result: boolean = LayoutPolicy.isWideLayout(480);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.isWideLayout(481)), String(false));
      expect(LayoutPolicy.isWideLayout(481)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.resolveBundleName('中文app')), String('中文app'));
      expect(LayoutPolicy.resolveBundleName('中文app')).assertEqual('中文app');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0009 end');
    })

    /**
     * @tc.name   testStructure0010
     * @tc.number SUB_ACCT_STRUCT_0010
     * @tc.desc   width 540 resolves to single layout at the 840 threshold
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStructure0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0010 begin');
      const result: boolean = LayoutPolicy.isWideLayout(540);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.isWideLayout(541)), String(false));
      expect(LayoutPolicy.isWideLayout(541)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.resolveBundleName('Music')), String('Music'));
      expect(LayoutPolicy.resolveBundleName('Music')).assertEqual('Music');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0010 end');
    })

    /**
     * @tc.name   testStructure0011
     * @tc.number SUB_ACCT_STRUCT_0011
     * @tc.desc   width 600 resolves to single layout at the 840 threshold
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStructure0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0011 begin');
      const result: boolean = LayoutPolicy.isWideLayout(600);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.isWideLayout(601)), String(false));
      expect(LayoutPolicy.isWideLayout(601)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.resolveBundleName('Video')), String('Video'));
      expect(LayoutPolicy.resolveBundleName('Video')).assertEqual('Video');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0011 end');
    })

    /**
     * @tc.name   testStructure0012
     * @tc.number SUB_ACCT_STRUCT_0012
     * @tc.desc   width 640 resolves to single layout at the 840 threshold
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStructure0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0012 begin');
      const result: boolean = LayoutPolicy.isWideLayout(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.isWideLayout(641)), String(false));
      expect(LayoutPolicy.isWideLayout(641)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.resolveBundleName('Map')), String('Map'));
      expect(LayoutPolicy.resolveBundleName('Map')).assertEqual('Map');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0012 end');
    })

    /**
     * @tc.name   testStructure0013
     * @tc.number SUB_ACCT_STRUCT_0013
     * @tc.desc   width 720 resolves to single layout at the 840 threshold
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStructure0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0013 begin');
      const result: boolean = LayoutPolicy.isWideLayout(720);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.isWideLayout(721)), String(false));
      expect(LayoutPolicy.isWideLayout(721)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.resolveBundleName(undefined)), String(''));
      expect(LayoutPolicy.resolveBundleName(undefined)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0013 end');
    })

    /**
     * @tc.name   testStructure0014
     * @tc.number SUB_ACCT_STRUCT_0014
     * @tc.desc   width 768 resolves to single layout at the 840 threshold
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStructure0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0014 begin');
      const result: boolean = LayoutPolicy.isWideLayout(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.isWideLayout(769)), String(false));
      expect(LayoutPolicy.isWideLayout(769)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.resolveBundleName('')), String(''));
      expect(LayoutPolicy.resolveBundleName('')).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0014 end');
    })

    /**
     * @tc.name   testStructure0015
     * @tc.number SUB_ACCT_STRUCT_0015
     * @tc.desc   width 800 resolves to single layout at the 840 threshold
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStructure0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0015 begin');
      const result: boolean = LayoutPolicy.isWideLayout(800);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.isWideLayout(801)), String(false));
      expect(LayoutPolicy.isWideLayout(801)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.resolveBundleName('music')), String('music'));
      expect(LayoutPolicy.resolveBundleName('music')).assertEqual('music');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0015 end');
    })

    /**
     * @tc.name   testStructure0016
     * @tc.number SUB_ACCT_STRUCT_0016
     * @tc.desc   width 820 resolves to single layout at the 840 threshold
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStructure0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0016 begin');
      const result: boolean = LayoutPolicy.isWideLayout(820);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.isWideLayout(821)), String(false));
      expect(LayoutPolicy.isWideLayout(821)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.resolveBundleName('Music2')), String('Music2'));
      expect(LayoutPolicy.resolveBundleName('Music2')).assertEqual('Music2');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0016 end');
    })

    /**
     * @tc.name   testStructure0017
     * @tc.number SUB_ACCT_STRUCT_0017
     * @tc.desc   width 830 resolves to single layout at the 840 threshold
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStructure0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0017 begin');
      const result: boolean = LayoutPolicy.isWideLayout(830);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.isWideLayout(831)), String(false));
      expect(LayoutPolicy.isWideLayout(831)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.resolveBundleName(undefined)), String(''));
      expect(LayoutPolicy.resolveBundleName(undefined)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0017 end');
    })

    /**
     * @tc.name   testStructure0018
     * @tc.number SUB_ACCT_STRUCT_0018
     * @tc.desc   width 838 resolves to single layout at the 840 threshold
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStructure0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0018 begin');
      const result: boolean = LayoutPolicy.isWideLayout(838);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.isWideLayout(839)), String(false));
      expect(LayoutPolicy.isWideLayout(839)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.resolveBundleName('中文app')), String('中文app'));
      expect(LayoutPolicy.resolveBundleName('中文app')).assertEqual('中文app');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0018 end');
    })

    /**
     * @tc.name   testStructure0019
     * @tc.number SUB_ACCT_STRUCT_0019
     * @tc.desc   width 842 resolves to split layout at the 840 threshold
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStructure0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0019 begin');
      const result: boolean = LayoutPolicy.isWideLayout(842);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.isWideLayout(841)), String(true));
      expect(LayoutPolicy.isWideLayout(841)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.resolveBundleName('Music')), String('Music'));
      expect(LayoutPolicy.resolveBundleName('Music')).assertEqual('Music');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0019 end');
    })

    /**
     * @tc.name   testStructure0020
     * @tc.number SUB_ACCT_STRUCT_0020
     * @tc.desc   width 850 resolves to split layout at the 840 threshold
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStructure0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0020 begin');
      const result: boolean = LayoutPolicy.isWideLayout(850);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.isWideLayout(849)), String(true));
      expect(LayoutPolicy.isWideLayout(849)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.resolveBundleName('Video')), String('Video'));
      expect(LayoutPolicy.resolveBundleName('Video')).assertEqual('Video');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0020 end');
    })

    /**
     * @tc.name   testStructure0021
     * @tc.number SUB_ACCT_STRUCT_0021
     * @tc.desc   width 900 resolves to split layout at the 840 threshold
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStructure0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0021 begin');
      const result: boolean = LayoutPolicy.isWideLayout(900);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.isWideLayout(899)), String(true));
      expect(LayoutPolicy.isWideLayout(899)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.resolveBundleName('Map')), String('Map'));
      expect(LayoutPolicy.resolveBundleName('Map')).assertEqual('Map');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0021 end');
    })

    /**
     * @tc.name   testStructure0022
     * @tc.number SUB_ACCT_STRUCT_0022
     * @tc.desc   width 960 resolves to split layout at the 840 threshold
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStructure0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0022 begin');
      const result: boolean = LayoutPolicy.isWideLayout(960);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.isWideLayout(959)), String(true));
      expect(LayoutPolicy.isWideLayout(959)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.resolveBundleName(undefined)), String(''));
      expect(LayoutPolicy.resolveBundleName(undefined)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0022 end');
    })

    /**
     * @tc.name   testStructure0023
     * @tc.number SUB_ACCT_STRUCT_0023
     * @tc.desc   width 1024 resolves to split layout at the 840 threshold
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStructure0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0023 begin');
      const result: boolean = LayoutPolicy.isWideLayout(1024);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.isWideLayout(1023)), String(true));
      expect(LayoutPolicy.isWideLayout(1023)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.resolveBundleName('')), String(''));
      expect(LayoutPolicy.resolveBundleName('')).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0023 end');
    })

    /**
     * @tc.name   testStructure0024
     * @tc.number SUB_ACCT_STRUCT_0024
     * @tc.desc   width 1080 resolves to split layout at the 840 threshold
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStructure0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0024 begin');
      const result: boolean = LayoutPolicy.isWideLayout(1080);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.isWideLayout(1079)), String(true));
      expect(LayoutPolicy.isWideLayout(1079)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.resolveBundleName('music')), String('music'));
      expect(LayoutPolicy.resolveBundleName('music')).assertEqual('music');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0024 end');
    })

    /**
     * @tc.name   testStructure0025
     * @tc.number SUB_ACCT_STRUCT_0025
     * @tc.desc   width 1280 resolves to split layout at the 840 threshold
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStructure0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0025 begin');
      const result: boolean = LayoutPolicy.isWideLayout(1280);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.isWideLayout(1279)), String(true));
      expect(LayoutPolicy.isWideLayout(1279)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.resolveBundleName('Music2')), String('Music2'));
      expect(LayoutPolicy.resolveBundleName('Music2')).assertEqual('Music2');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0025 end');
    })

    /**
     * @tc.name   testStructure0026
     * @tc.number SUB_ACCT_STRUCT_0026
     * @tc.desc   width 1440 resolves to split layout at the 840 threshold
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStructure0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0026 begin');
      const result: boolean = LayoutPolicy.isWideLayout(1440);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.isWideLayout(1439)), String(true));
      expect(LayoutPolicy.isWideLayout(1439)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.resolveBundleName(undefined)), String(''));
      expect(LayoutPolicy.resolveBundleName(undefined)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0026 end');
    })

    /**
     * @tc.name   testStructure0027
     * @tc.number SUB_ACCT_STRUCT_0027
     * @tc.desc   width 1600 resolves to split layout at the 840 threshold
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStructure0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0027 begin');
      const result: boolean = LayoutPolicy.isWideLayout(1600);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.isWideLayout(1599)), String(true));
      expect(LayoutPolicy.isWideLayout(1599)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.resolveBundleName('中文app')), String('中文app'));
      expect(LayoutPolicy.resolveBundleName('中文app')).assertEqual('中文app');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0027 end');
    })

    /**
     * @tc.name   testStructure0028
     * @tc.number SUB_ACCT_STRUCT_0028
     * @tc.desc   width 1920 resolves to split layout at the 840 threshold
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStructure0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0028 begin');
      const result: boolean = LayoutPolicy.isWideLayout(1920);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.isWideLayout(1919)), String(true));
      expect(LayoutPolicy.isWideLayout(1919)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.resolveBundleName('Music')), String('Music'));
      expect(LayoutPolicy.resolveBundleName('Music')).assertEqual('Music');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0028 end');
    })

    /**
     * @tc.name   testStructure0029
     * @tc.number SUB_ACCT_STRUCT_0029
     * @tc.desc   width 2560 resolves to split layout at the 840 threshold
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStructure0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0029 begin');
      const result: boolean = LayoutPolicy.isWideLayout(2560);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.isWideLayout(2559)), String(true));
      expect(LayoutPolicy.isWideLayout(2559)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.resolveBundleName('Video')), String('Video'));
      expect(LayoutPolicy.resolveBundleName('Video')).assertEqual('Video');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0029 end');
    })

    /**
     * @tc.name   testStructure0030
     * @tc.number SUB_ACCT_STRUCT_0030
     * @tc.desc   width 3840 resolves to split layout at the 840 threshold
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStructure0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0030 begin');
      const result: boolean = LayoutPolicy.isWideLayout(3840);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.isWideLayout(3839)), String(true));
      expect(LayoutPolicy.isWideLayout(3839)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.resolveBundleName('Map')), String('Map'));
      expect(LayoutPolicy.resolveBundleName('Map')).assertEqual('Map');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0030 end');
    })

    /**
     * @tc.name   testStructure0031
     * @tc.number SUB_ACCT_STRUCT_0031
     * @tc.desc   width -1 resolves to single layout at the 840 threshold
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStructure0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0031 begin');
      const result: boolean = LayoutPolicy.isWideLayout(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.isWideLayout(0)), String(false));
      expect(LayoutPolicy.isWideLayout(0)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.resolveBundleName(undefined)), String(''));
      expect(LayoutPolicy.resolveBundleName(undefined)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0031 end');
    })

    /**
     * @tc.name   testStructure0032
     * @tc.number SUB_ACCT_STRUCT_0032
     * @tc.desc   width -100 resolves to single layout at the 840 threshold
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStructure0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0032 begin');
      const result: boolean = LayoutPolicy.isWideLayout(-100);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.isWideLayout(-99)), String(false));
      expect(LayoutPolicy.isWideLayout(-99)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.resolveBundleName('')), String(''));
      expect(LayoutPolicy.resolveBundleName('')).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0032 end');
    })

    /**
     * @tc.name   testStructure0033
     * @tc.number SUB_ACCT_STRUCT_0033
     * @tc.desc   width -1000 resolves to single layout at the 840 threshold
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStructure0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0033 begin');
      const result: boolean = LayoutPolicy.isWideLayout(-1000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.isWideLayout(-999)), String(false));
      expect(LayoutPolicy.isWideLayout(-999)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.resolveBundleName('music')), String('music'));
      expect(LayoutPolicy.resolveBundleName('music')).assertEqual('music');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0033 end');
    })

    /**
     * @tc.name   testStructure0034
     * @tc.number SUB_ACCT_STRUCT_0034
     * @tc.desc   width 0.5 resolves to single layout at the 840 threshold
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStructure0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0034 begin');
      const result: boolean = LayoutPolicy.isWideLayout(0.5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.isWideLayout(1.5)), String(false));
      expect(LayoutPolicy.isWideLayout(1.5)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.resolveBundleName('Music2')), String('Music2'));
      expect(LayoutPolicy.resolveBundleName('Music2')).assertEqual('Music2');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0034 end');
    })

    /**
     * @tc.name   testStructure0035
     * @tc.number SUB_ACCT_STRUCT_0035
     * @tc.desc   width 100.75 resolves to single layout at the 840 threshold
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStructure0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0035 begin');
      const result: boolean = LayoutPolicy.isWideLayout(100.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.isWideLayout(101.75)), String(false));
      expect(LayoutPolicy.isWideLayout(101.75)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.resolveBundleName(undefined)), String(''));
      expect(LayoutPolicy.resolveBundleName(undefined)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0035 end');
    })

    /**
     * @tc.name   testStructure0036
     * @tc.number SUB_ACCT_STRUCT_0036
     * @tc.desc   width 839.9 resolves to single layout at the 840 threshold
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStructure0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0036 begin');
      const result: boolean = LayoutPolicy.isWideLayout(839.9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.isWideLayout(840.9)), String(true));
      expect(LayoutPolicy.isWideLayout(840.9)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.resolveBundleName('中文app')), String('中文app'));
      expect(LayoutPolicy.resolveBundleName('中文app')).assertEqual('中文app');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0036 end');
    })

    /**
     * @tc.name   testStructure0037
     * @tc.number SUB_ACCT_STRUCT_0037
     * @tc.desc   width 840 resolves to split layout at the 840 threshold
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStructure0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0037 begin');
      const result: boolean = LayoutPolicy.isWideLayout(840);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.isWideLayout(839)), String(false));
      expect(LayoutPolicy.isWideLayout(839)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.resolveBundleName('Music')), String('Music'));
      expect(LayoutPolicy.resolveBundleName('Music')).assertEqual('Music');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0037 end');
    })

    /**
     * @tc.name   testStructure0038
     * @tc.number SUB_ACCT_STRUCT_0038
     * @tc.desc   width 840.1 resolves to split layout at the 840 threshold
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStructure0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0038 begin');
      const result: boolean = LayoutPolicy.isWideLayout(840.1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.isWideLayout(839.1)), String(false));
      expect(LayoutPolicy.isWideLayout(839.1)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.resolveBundleName('Video')), String('Video'));
      expect(LayoutPolicy.resolveBundleName('Video')).assertEqual('Video');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0038 end');
    })

    /**
     * @tc.name   testStructure0039
     * @tc.number SUB_ACCT_STRUCT_0039
     * @tc.desc   width 839.999 resolves to single layout at the 840 threshold
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStructure0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0039 begin');
      const result: boolean = LayoutPolicy.isWideLayout(839.999);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.isWideLayout(840.999)), String(true));
      expect(LayoutPolicy.isWideLayout(840.999)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.resolveBundleName('Map')), String('Map'));
      expect(LayoutPolicy.resolveBundleName('Map')).assertEqual('Map');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0039 end');
    })

    /**
     * @tc.name   testStructure0040
     * @tc.number SUB_ACCT_STRUCT_0040
     * @tc.desc   width 840.001 resolves to split layout at the 840 threshold
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStructure0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0040 begin');
      const result: boolean = LayoutPolicy.isWideLayout(840.001);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.isWideLayout(839.001)), String(false));
      expect(LayoutPolicy.isWideLayout(839.001)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.resolveBundleName(undefined)), String(''));
      expect(LayoutPolicy.resolveBundleName(undefined)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0040 end');
    })

    /**
     * @tc.name   testStructure0041
     * @tc.number SUB_ACCT_STRUCT_0041
     * @tc.desc   width 1000000 resolves to split layout at the 840 threshold
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStructure0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0041 begin');
      const result: boolean = LayoutPolicy.isWideLayout(1000000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.isWideLayout(999999)), String(true));
      expect(LayoutPolicy.isWideLayout(999999)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.resolveBundleName('')), String(''));
      expect(LayoutPolicy.resolveBundleName('')).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0041 end');
    })

    /**
     * @tc.name   testStructure0042
     * @tc.number SUB_ACCT_STRUCT_0042
     * @tc.desc   width 1000000000 resolves to split layout at the 840 threshold
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStructure0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0042 begin');
      const result: boolean = LayoutPolicy.isWideLayout(1000000000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.isWideLayout(999999999)), String(true));
      expect(LayoutPolicy.isWideLayout(999999999)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.resolveBundleName('music')), String('music'));
      expect(LayoutPolicy.resolveBundleName('music')).assertEqual('music');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0042 end');
    })

    /**
     * @tc.name   testStructure0043
     * @tc.number SUB_ACCT_STRUCT_0043
     * @tc.desc   width 9007199254740991 resolves to split layout at the 840 threshold
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStructure0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0043 begin');
      const result: boolean = LayoutPolicy.isWideLayout(9007199254740991);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.isWideLayout(9007199254740990)), String(true));
      expect(LayoutPolicy.isWideLayout(9007199254740990)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.resolveBundleName('Music2')), String('Music2'));
      expect(LayoutPolicy.resolveBundleName('Music2')).assertEqual('Music2');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0043 end');
    })

    /**
     * @tc.name   testStructure0044
     * @tc.number SUB_ACCT_STRUCT_0044
     * @tc.desc   width 1023 resolves to split layout at the 840 threshold
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStructure0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0044 begin');
      const result: boolean = LayoutPolicy.isWideLayout(1023);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.isWideLayout(1022)), String(true));
      expect(LayoutPolicy.isWideLayout(1022)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.resolveBundleName(undefined)), String(''));
      expect(LayoutPolicy.resolveBundleName(undefined)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0044 end');
    })

    /**
     * @tc.name   testStructure0045
     * @tc.number SUB_ACCT_STRUCT_0045
     * @tc.desc   width 1025 resolves to split layout at the 840 threshold
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStructure0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0045 begin');
      const result: boolean = LayoutPolicy.isWideLayout(1025);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.isWideLayout(1024)), String(true));
      expect(LayoutPolicy.isWideLayout(1024)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.resolveBundleName('中文app')), String('中文app'));
      expect(LayoutPolicy.resolveBundleName('中文app')).assertEqual('中文app');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0045 end');
    })

    /**
     * @tc.name   testStructure0046
     * @tc.number SUB_ACCT_STRUCT_0046
     * @tc.desc   width 1279 resolves to split layout at the 840 threshold
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStructure0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0046 begin');
      const result: boolean = LayoutPolicy.isWideLayout(1279);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.isWideLayout(1278)), String(true));
      expect(LayoutPolicy.isWideLayout(1278)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.resolveBundleName('Music')), String('Music'));
      expect(LayoutPolicy.resolveBundleName('Music')).assertEqual('Music');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0046 end');
    })

    /**
     * @tc.name   testStructure0047
     * @tc.number SUB_ACCT_STRUCT_0047
     * @tc.desc   width 1281 resolves to split layout at the 840 threshold
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStructure0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0047 begin');
      const result: boolean = LayoutPolicy.isWideLayout(1281);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.isWideLayout(1280)), String(true));
      expect(LayoutPolicy.isWideLayout(1280)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.resolveBundleName('Video')), String('Video'));
      expect(LayoutPolicy.resolveBundleName('Video')).assertEqual('Video');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0047 end');
    })

    /**
     * @tc.name   testStructure0048
     * @tc.number SUB_ACCT_STRUCT_0048
     * @tc.desc   width 1919 resolves to split layout at the 840 threshold
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStructure0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0048 begin');
      const result: boolean = LayoutPolicy.isWideLayout(1919);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.isWideLayout(1918)), String(true));
      expect(LayoutPolicy.isWideLayout(1918)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.resolveBundleName('Map')), String('Map'));
      expect(LayoutPolicy.resolveBundleName('Map')).assertEqual('Map');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0048 end');
    })

    /**
     * @tc.name   testStructure0049
     * @tc.number SUB_ACCT_STRUCT_0049
     * @tc.desc   width 1921 resolves to split layout at the 840 threshold
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStructure0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0049 begin');
      const result: boolean = LayoutPolicy.isWideLayout(1921);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.isWideLayout(1920)), String(true));
      expect(LayoutPolicy.isWideLayout(1920)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.resolveBundleName(undefined)), String(''));
      expect(LayoutPolicy.resolveBundleName(undefined)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0049 end');
    })

    /**
     * @tc.name   testStructure0050
     * @tc.number SUB_ACCT_STRUCT_0050
     * @tc.desc   width 1922 resolves to split layout at the 840 threshold
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStructure0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0050 begin');
      const result: boolean = LayoutPolicy.isWideLayout(1922);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.isWideLayout(1921)), String(true));
      expect(LayoutPolicy.isWideLayout(1921)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(LayoutPolicy.resolveBundleName('')), String(''));
      expect(LayoutPolicy.resolveBundleName('')).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStructure0050 end');
    })

  })
}
