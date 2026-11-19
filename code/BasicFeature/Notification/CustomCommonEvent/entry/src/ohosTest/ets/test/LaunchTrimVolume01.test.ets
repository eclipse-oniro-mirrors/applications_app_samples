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
import launchFeature from '../../../main/ets/feature/LaunchFeature';
import { arr } from './helper/VolumeSupport';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_CustomCommonEvent]';

export default function launchTrimVolume01Test(): void {
  describe('LaunchTrimVolume01Test', () => {

    /**
     * @tc.name   testLaunchTrimVolume010001
     * @tc.number SUB_CCE_LAUNCHTRIM_01_0001
     * @tc.desc   记录数=0 时裁剪得到 0 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume010001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010001 begin');
      const records: Array<string> = arr('');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[]'));
      expect(JSON.stringify(result)).assertEqual('[]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(0));
      expect(records.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010001 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume010002
     * @tc.number SUB_CCE_LAUNCHTRIM_01_0002
     * @tc.desc   记录数=1 时裁剪得到 0 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume010002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010002 begin');
      const records: Array<string> = arr('e0');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[]'));
      expect(JSON.stringify(result)).assertEqual('[]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(1));
      expect(records.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010002 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume010003
     * @tc.number SUB_CCE_LAUNCHTRIM_01_0003
     * @tc.desc   记录数=2 时裁剪得到 0 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume010003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010003 begin');
      const records: Array<string> = arr('e0|e1');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[]'));
      expect(JSON.stringify(result)).assertEqual('[]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(2));
      expect(records.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010003 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume010004
     * @tc.number SUB_CCE_LAUNCHTRIM_01_0004
     * @tc.desc   记录数=3 时裁剪得到 0 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume010004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010004 begin');
      const records: Array<string> = arr('e0|e1|e2');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[]'));
      expect(JSON.stringify(result)).assertEqual('[]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(3));
      expect(records.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010004 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume010005
     * @tc.number SUB_CCE_LAUNCHTRIM_01_0005
     * @tc.desc   记录数=4 时裁剪得到 0 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume010005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010005 begin');
      const records: Array<string> = arr('e0|e1|e2|e3');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[]'));
      expect(JSON.stringify(result)).assertEqual('[]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(4));
      expect(records.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010005 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume010006
     * @tc.number SUB_CCE_LAUNCHTRIM_01_0006
     * @tc.desc   记录数=5 时裁剪得到 0 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume010006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010006 begin');
      const records: Array<string> = arr('e0|e1|e2|e3|e4');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[]'));
      expect(JSON.stringify(result)).assertEqual('[]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(5));
      expect(records.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010006 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume010007
     * @tc.number SUB_CCE_LAUNCHTRIM_01_0007
     * @tc.desc   记录数=6 时裁剪得到 0 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume010007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010007 begin');
      const records: Array<string> = arr('e0|e1|e2|e3|e4|e5');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[]'));
      expect(JSON.stringify(result)).assertEqual('[]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(6));
      expect(records.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010007 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume010008
     * @tc.number SUB_CCE_LAUNCHTRIM_01_0008
     * @tc.desc   记录数=7 时裁剪得到 0 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume010008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010008 begin');
      const records: Array<string> = arr('e0|e1|e2|e3|e4|e5|e6');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[]'));
      expect(JSON.stringify(result)).assertEqual('[]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(7));
      expect(records.length).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010008 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume010009
     * @tc.number SUB_CCE_LAUNCHTRIM_01_0009
     * @tc.desc   记录数=8 时裁剪得到 0 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume010009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010009 begin');
      const records: Array<string> = arr('e0|e1|e2|e3|e4|e5|e6|e7');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[]'));
      expect(JSON.stringify(result)).assertEqual('[]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(8));
      expect(records.length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010009 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume010010
     * @tc.number SUB_CCE_LAUNCHTRIM_01_0010
     * @tc.desc   记录数=9 时裁剪得到 0 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume010010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010010 begin');
      const records: Array<string> = arr('e0|e1|e2|e3|e4|e5|e6|e7|e8');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[]'));
      expect(JSON.stringify(result)).assertEqual('[]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(9));
      expect(records.length).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010010 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume010011
     * @tc.number SUB_CCE_LAUNCHTRIM_01_0011
     * @tc.desc   记录数=10 时裁剪得到 0 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume010011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010011 begin');
      const records: Array<string> = arr('e0|e1|e2|e3|e4|e5|e6|e7|e8|e9');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[]'));
      expect(JSON.stringify(result)).assertEqual('[]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(10));
      expect(records.length).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010011 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume010012
     * @tc.number SUB_CCE_LAUNCHTRIM_01_0012
     * @tc.desc   记录数=11 时裁剪得到 1 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume010012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010012 begin');
      const records: Array<string> = arr('e0|e1|e2|e3|e4|e5|e6|e7|e8|e9|e10');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["e10"]'));
      expect(JSON.stringify(result)).assertEqual('["e10"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(11));
      expect(records.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010012 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume010013
     * @tc.number SUB_CCE_LAUNCHTRIM_01_0013
     * @tc.desc   记录数=12 时裁剪得到 1 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume010013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010013 begin');
      const records: Array<string> = arr('e0|e1|e2|e3|e4|e5|e6|e7|e8|e9|e10|e11');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["e10"]'));
      expect(JSON.stringify(result)).assertEqual('["e10"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(12));
      expect(records.length).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010013 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume010014
     * @tc.number SUB_CCE_LAUNCHTRIM_01_0014
     * @tc.desc   记录数=15 时裁剪得到 1 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume010014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010014 begin');
      const records: Array<string> = arr('f0|f1|f2|f3|f4|f5|f6|f7|f8|f9|f10|f11|f12|f13|f14');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["f10"]'));
      expect(JSON.stringify(result)).assertEqual('["f10"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(15));
      expect(records.length).assertEqual(15);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010014 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume010015
     * @tc.number SUB_CCE_LAUNCHTRIM_01_0015
     * @tc.desc   记录数=20 时裁剪得到 1 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume010015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010015 begin');
      const records: Array<string> = arr('f0|f1|f2|f3|f4|f5|f6|f7|f8|f9|f10|f11|f12|f13|f14|f15|f16|f17|f18|f19');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["f10"]'));
      expect(JSON.stringify(result)).assertEqual('["f10"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(20));
      expect(records.length).assertEqual(20);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010015 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume010016
     * @tc.number SUB_CCE_LAUNCHTRIM_01_0016
     * @tc.desc   记录数=25 时裁剪得到 1 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume010016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010016 begin');
      const records: Array<string> = arr('f0|f1|f2|f3|f4|f5|f6|f7|f8|f9|f10|f11|f12|f13|f14|f15|f16|f17|f18|f19|f20|f21|f22|f23|f24');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["f10"]'));
      expect(JSON.stringify(result)).assertEqual('["f10"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(25));
      expect(records.length).assertEqual(25);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010016 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume010017
     * @tc.number SUB_CCE_LAUNCHTRIM_01_0017
     * @tc.desc   记录数=30 时裁剪得到 1 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume010017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010017 begin');
      const records: Array<string> = arr('f0|f1|f2|f3|f4|f5|f6|f7|f8|f9|f10|f11|f12|f13|f14|f15|f16|f17|f18|f19|f20|f21|f22|f23|f24|f25|f26|f27|f28|f29');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["f10"]'));
      expect(JSON.stringify(result)).assertEqual('["f10"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(30));
      expect(records.length).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010017 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume010018
     * @tc.number SUB_CCE_LAUNCHTRIM_01_0018
     * @tc.desc   记录数=40 时裁剪得到 1 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume010018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010018 begin');
      const records: Array<string> = arr('f0|f1|f2|f3|f4|f5|f6|f7|f8|f9|f10|f11|f12|f13|f14|f15|f16|f17|f18|f19|f20|f21|f22|f23|f24|f25|f26|f27|f28|f29|f30|f31|f32|f33|f34|f35|f36|f37|f38|f39');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["f10"]'));
      expect(JSON.stringify(result)).assertEqual('["f10"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(40));
      expect(records.length).assertEqual(40);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010018 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume010019
     * @tc.number SUB_CCE_LAUNCHTRIM_01_0019
     * @tc.desc   记录数=50 时裁剪得到 1 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume010019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010019 begin');
      const records: Array<string> = arr('f0|f1|f2|f3|f4|f5|f6|f7|f8|f9|f10|f11|f12|f13|f14|f15|f16|f17|f18|f19|f20|f21|f22|f23|f24|f25|f26|f27|f28|f29|f30|f31|f32|f33|f34|f35|f36|f37|f38|f39|f40|f41|f42|f43|f44|f45|f46|f47|f48|f49');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["f10"]'));
      expect(JSON.stringify(result)).assertEqual('["f10"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(50));
      expect(records.length).assertEqual(50);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010019 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume010020
     * @tc.number SUB_CCE_LAUNCHTRIM_01_0020
     * @tc.desc   记录数=60 时裁剪得到 1 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume010020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010020 begin');
      const records: Array<string> = arr('f0|f1|f2|f3|f4|f5|f6|f7|f8|f9|f10|f11|f12|f13|f14|f15|f16|f17|f18|f19|f20|f21|f22|f23|f24|f25|f26|f27|f28|f29|f30|f31|f32|f33|f34|f35|f36|f37|f38|f39|f40|f41|f42|f43|f44|f45|f46|f47|f48|f49|f50|f51|f52|f53|f54|f55|f56|f57|f58|f59');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["f10"]'));
      expect(JSON.stringify(result)).assertEqual('["f10"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(60));
      expect(records.length).assertEqual(60);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010020 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume010021
     * @tc.number SUB_CCE_LAUNCHTRIM_01_0021
     * @tc.desc   记录数=70 时裁剪得到 1 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume010021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010021 begin');
      const records: Array<string> = arr('f0|f1|f2|f3|f4|f5|f6|f7|f8|f9|f10|f11|f12|f13|f14|f15|f16|f17|f18|f19|f20|f21|f22|f23|f24|f25|f26|f27|f28|f29|f30|f31|f32|f33|f34|f35|f36|f37|f38|f39|f40|f41|f42|f43|f44|f45|f46|f47|f48|f49|f50|f51|f52|f53|f54|f55|f56|f57|f58|f59|f60|f61|f62|f63|f64|f65|f66|f67|f68|f69');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["f10"]'));
      expect(JSON.stringify(result)).assertEqual('["f10"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(70));
      expect(records.length).assertEqual(70);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010021 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume010022
     * @tc.number SUB_CCE_LAUNCHTRIM_01_0022
     * @tc.desc   记录数=80 时裁剪得到 1 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume010022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010022 begin');
      const records: Array<string> = arr('f0|f1|f2|f3|f4|f5|f6|f7|f8|f9|f10|f11|f12|f13|f14|f15|f16|f17|f18|f19|f20|f21|f22|f23|f24|f25|f26|f27|f28|f29|f30|f31|f32|f33|f34|f35|f36|f37|f38|f39|f40|f41|f42|f43|f44|f45|f46|f47|f48|f49|f50|f51|f52|f53|f54|f55|f56|f57|f58|f59|f60|f61|f62|f63|f64|f65|f66|f67|f68|f69|f70|f71|f72|f73|f74|f75|f76|f77|f78|f79');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["f10"]'));
      expect(JSON.stringify(result)).assertEqual('["f10"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(80));
      expect(records.length).assertEqual(80);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010022 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume010023
     * @tc.number SUB_CCE_LAUNCHTRIM_01_0023
     * @tc.desc   记录数=90 时裁剪得到 1 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume010023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010023 begin');
      const records: Array<string> = arr('f0|f1|f2|f3|f4|f5|f6|f7|f8|f9|f10|f11|f12|f13|f14|f15|f16|f17|f18|f19|f20|f21|f22|f23|f24|f25|f26|f27|f28|f29|f30|f31|f32|f33|f34|f35|f36|f37|f38|f39|f40|f41|f42|f43|f44|f45|f46|f47|f48|f49|f50|f51|f52|f53|f54|f55|f56|f57|f58|f59|f60|f61|f62|f63|f64|f65|f66|f67|f68|f69|f70|f71|f72|f73|f74|f75|f76|f77|f78|f79|f80|f81|f82|f83|f84|f85|f86|f87|f88|f89');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["f10"]'));
      expect(JSON.stringify(result)).assertEqual('["f10"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(90));
      expect(records.length).assertEqual(90);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010023 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume010024
     * @tc.number SUB_CCE_LAUNCHTRIM_01_0024
     * @tc.desc   记录数=100 时裁剪得到 1 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume010024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010024 begin');
      const records: Array<string> = arr('f0|f1|f2|f3|f4|f5|f6|f7|f8|f9|f10|f11|f12|f13|f14|f15|f16|f17|f18|f19|f20|f21|f22|f23|f24|f25|f26|f27|f28|f29|f30|f31|f32|f33|f34|f35|f36|f37|f38|f39|f40|f41|f42|f43|f44|f45|f46|f47|f48|f49|f50|f51|f52|f53|f54|f55|f56|f57|f58|f59|f60|f61|f62|f63|f64|f65|f66|f67|f68|f69|f70|f71|f72|f73|f74|f75|f76|f77|f78|f79|f80|f81|f82|f83|f84|f85|f86|f87|f88|f89|f90|f91|f92|f93|f94|f95|f96|f97|f98|f99');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["f10"]'));
      expect(JSON.stringify(result)).assertEqual('["f10"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(100));
      expect(records.length).assertEqual(100);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010024 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume010025
     * @tc.number SUB_CCE_LAUNCHTRIM_01_0025
     * @tc.desc   记录数=11 时裁剪得到 1 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume010025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010025 begin');
      const records: Array<string> = arr('g0|g1|g2|g3|g4|g5|g6|g7|g8|g9|bb');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["bb"]'));
      expect(JSON.stringify(result)).assertEqual('["bb"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(11));
      expect(records.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010025 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume010026
     * @tc.number SUB_CCE_LAUNCHTRIM_01_0026
     * @tc.desc   记录数=12 时裁剪得到 1 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume010026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010026 begin');
      const records: Array<string> = arr('g0|g1|g2|g3|g4|g5|g6|g7|g8|g9|g10|bb');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["g10"]'));
      expect(JSON.stringify(result)).assertEqual('["g10"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(12));
      expect(records.length).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010026 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume010027
     * @tc.number SUB_CCE_LAUNCHTRIM_01_0027
     * @tc.desc   记录数=11 时裁剪得到 1 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume010027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010027 begin');
      const records: Array<string> = arr('g0|g1|g2|g3|g4|g5|g6|g7|g8|g9|zz');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["zz"]'));
      expect(JSON.stringify(result)).assertEqual('["zz"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(11));
      expect(records.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010027 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume010028
     * @tc.number SUB_CCE_LAUNCHTRIM_01_0028
     * @tc.desc   记录数=12 时裁剪得到 1 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume010028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010028 begin');
      const records: Array<string> = arr('g0|g1|g2|g3|g4|g5|g6|g7|g8|g9|g10|zz');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["g10"]'));
      expect(JSON.stringify(result)).assertEqual('["g10"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(12));
      expect(records.length).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010028 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume010029
     * @tc.number SUB_CCE_LAUNCHTRIM_01_0029
     * @tc.desc   记录数=11 时裁剪得到 1 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume010029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010029 begin');
      const records: Array<string> = arr('g0|g1|g2|g3|g4|g5|g6|g7|g8|g9|中文');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["中文"]'));
      expect(JSON.stringify(result)).assertEqual('["中文"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(11));
      expect(records.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010029 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume010030
     * @tc.number SUB_CCE_LAUNCHTRIM_01_0030
     * @tc.desc   记录数=12 时裁剪得到 1 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume010030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010030 begin');
      const records: Array<string> = arr('g0|g1|g2|g3|g4|g5|g6|g7|g8|g9|g10|中文');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["g10"]'));
      expect(JSON.stringify(result)).assertEqual('["g10"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(12));
      expect(records.length).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010030 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume010031
     * @tc.number SUB_CCE_LAUNCHTRIM_01_0031
     * @tc.desc   记录数=11 时裁剪得到 1 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume010031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010031 begin');
      const records: Array<string> = arr('g0|g1|g2|g3|g4|g5|g6|g7|g8|g9|k=v');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["k=v"]'));
      expect(JSON.stringify(result)).assertEqual('["k=v"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(11));
      expect(records.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010031 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume010032
     * @tc.number SUB_CCE_LAUNCHTRIM_01_0032
     * @tc.desc   记录数=12 时裁剪得到 1 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume010032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010032 begin');
      const records: Array<string> = arr('g0|g1|g2|g3|g4|g5|g6|g7|g8|g9|g10|k=v');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["g10"]'));
      expect(JSON.stringify(result)).assertEqual('["g10"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(12));
      expect(records.length).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010032 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume010033
     * @tc.number SUB_CCE_LAUNCHTRIM_01_0033
     * @tc.desc   记录数=11 时裁剪得到 1 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume010033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010033 begin');
      const records: Array<string> = arr('g0|g1|g2|g3|g4|g5|g6|g7|g8|g9|[]');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["[]"]'));
      expect(JSON.stringify(result)).assertEqual('["[]"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(11));
      expect(records.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010033 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume010034
     * @tc.number SUB_CCE_LAUNCHTRIM_01_0034
     * @tc.desc   记录数=12 时裁剪得到 1 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume010034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010034 begin');
      const records: Array<string> = arr('g0|g1|g2|g3|g4|g5|g6|g7|g8|g9|g10|[]');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["g10"]'));
      expect(JSON.stringify(result)).assertEqual('["g10"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(12));
      expect(records.length).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010034 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume010035
     * @tc.number SUB_CCE_LAUNCHTRIM_01_0035
     * @tc.desc   记录数=11 时裁剪得到 1 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume010035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010035 begin');
      const records: Array<string> = arr('g0|g1|g2|g3|g4|g5|g6|g7|g8|g9|-1');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["-1"]'));
      expect(JSON.stringify(result)).assertEqual('["-1"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(11));
      expect(records.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010035 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume010036
     * @tc.number SUB_CCE_LAUNCHTRIM_01_0036
     * @tc.desc   记录数=12 时裁剪得到 1 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume010036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010036 begin');
      const records: Array<string> = arr('g0|g1|g2|g3|g4|g5|g6|g7|g8|g9|g10|-1');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["g10"]'));
      expect(JSON.stringify(result)).assertEqual('["g10"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(12));
      expect(records.length).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010036 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume010037
     * @tc.number SUB_CCE_LAUNCHTRIM_01_0037
     * @tc.desc   记录数=11 时裁剪得到 1 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume010037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010037 begin');
      const records: Array<string> = arr('g0|g1|g2|g3|g4|g5|g6|g7|g8|g9|true');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["true"]'));
      expect(JSON.stringify(result)).assertEqual('["true"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(11));
      expect(records.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010037 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume010038
     * @tc.number SUB_CCE_LAUNCHTRIM_01_0038
     * @tc.desc   记录数=12 时裁剪得到 1 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume010038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010038 begin');
      const records: Array<string> = arr('g0|g1|g2|g3|g4|g5|g6|g7|g8|g9|g10|true');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["g10"]'));
      expect(JSON.stringify(result)).assertEqual('["g10"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(12));
      expect(records.length).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010038 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume010039
     * @tc.number SUB_CCE_LAUNCHTRIM_01_0039
     * @tc.desc   记录数=11 时裁剪得到 1 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume010039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010039 begin');
      const records: Array<string> = arr('g0|g1|g2|g3|g4|g5|g6|g7|g8|g9|A');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["A"]'));
      expect(JSON.stringify(result)).assertEqual('["A"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(11));
      expect(records.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010039 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume010040
     * @tc.number SUB_CCE_LAUNCHTRIM_01_0040
     * @tc.desc   记录数=12 时裁剪得到 1 条
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume010040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010040 begin');
      const records: Array<string> = arr('g0|g1|g2|g3|g4|g5|g6|g7|g8|g9|g10|A');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["g10"]'));
      expect(JSON.stringify(result)).assertEqual('["g10"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(12));
      expect(records.length).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010040 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume010041
     * @tc.number SUB_CCE_LAUNCHTRIM_01_0041
     * @tc.desc   恰好 10 条时裁剪为空，11 条时只取第 11 条，且入参不被修改
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume010041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010041 begin');
      const ten: Array<string> = ['r0', 'r1', 'r2', 'r3', 'r4', 'r5', 'r6', 'r7', 'r8', 'r9'];
      const eleven: Array<string> = ['r0', 'r1', 'r2', 'r3', 'r4', 'r5', 'r6', 'r7', 'r8', 'r9', 'r10'];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(launchFeature.trimRecords(ten).length), '0');
      expect(launchFeature.trimRecords(ten).length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', JSON.stringify(launchFeature.trimRecords(eleven)), '["r10"]');
      expect(JSON.stringify(launchFeature.trimRecords(eleven))).assertEqual('["r10"]');
      expect(eleven[0]).assertEqual('r0');
      expect(eleven.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume010041 end');
    })
  })
}
