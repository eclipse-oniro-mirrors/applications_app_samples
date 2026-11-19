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

export default function launchTrimVolume02Test(): void {
  describe('LaunchTrimVolume02Test', () => {

    /**
     * @tc.name   testLaunchTrimVolume020001
     * @tc.number SUB_CCE_LAUNCHTRIM_02_0001
     * @tc.desc   记录数=13 时裁剪得到第 11 条 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume020001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020001 begin');
      const records: Array<string> = arr('t01|t02|t03|t04|t05|t06|t07|t08|t09|t10|t11|t12|t13');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["t11"]'));
      expect(JSON.stringify(result)).assertEqual('["t11"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(13));
      expect(records.length).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020001 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume020002
     * @tc.number SUB_CCE_LAUNCHTRIM_02_0002
     * @tc.desc   记录数=14 时裁剪得到第 11 条 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume020002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020002 begin');
      const records: Array<string> = arr('t01|t02|t03|t04|t05|t06|t07|t08|t09|t10|t11|t12|t13|t14');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["t11"]'));
      expect(JSON.stringify(result)).assertEqual('["t11"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(14));
      expect(records.length).assertEqual(14);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020002 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume020003
     * @tc.number SUB_CCE_LAUNCHTRIM_02_0003
     * @tc.desc   记录数=16 时裁剪得到第 11 条 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume020003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020003 begin');
      const records: Array<string> = arr('t01|t02|t03|t04|t05|t06|t07|t08|t09|t10|t11|t12|t13|t14|t15|t16');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["t11"]'));
      expect(JSON.stringify(result)).assertEqual('["t11"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(16));
      expect(records.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020003 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume020004
     * @tc.number SUB_CCE_LAUNCHTRIM_02_0004
     * @tc.desc   记录数=17 时裁剪得到第 11 条 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume020004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020004 begin');
      const records: Array<string> = arr('t01|t02|t03|t04|t05|t06|t07|t08|t09|t10|t11|t12|t13|t14|t15|t16|t17');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["t11"]'));
      expect(JSON.stringify(result)).assertEqual('["t11"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(17));
      expect(records.length).assertEqual(17);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020004 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume020005
     * @tc.number SUB_CCE_LAUNCHTRIM_02_0005
     * @tc.desc   记录数=18 时裁剪得到第 11 条 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume020005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020005 begin');
      const records: Array<string> = arr('t01|t02|t03|t04|t05|t06|t07|t08|t09|t10|t11|t12|t13|t14|t15|t16|t17|t18');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["t11"]'));
      expect(JSON.stringify(result)).assertEqual('["t11"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(18));
      expect(records.length).assertEqual(18);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020005 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume020006
     * @tc.number SUB_CCE_LAUNCHTRIM_02_0006
     * @tc.desc   记录数=19 时裁剪得到第 11 条 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume020006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020006 begin');
      const records: Array<string> = arr('t01|t02|t03|t04|t05|t06|t07|t08|t09|t10|t11|t12|t13|t14|t15|t16|t17|t18|t19');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["t11"]'));
      expect(JSON.stringify(result)).assertEqual('["t11"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(19));
      expect(records.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020006 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume020007
     * @tc.number SUB_CCE_LAUNCHTRIM_02_0007
     * @tc.desc   记录数=21 时裁剪得到第 11 条 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume020007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020007 begin');
      const records: Array<string> = arr('t01|t02|t03|t04|t05|t06|t07|t08|t09|t10|t11|t12|t13|t14|t15|t16|t17|t18|t19|t20|t21');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["t11"]'));
      expect(JSON.stringify(result)).assertEqual('["t11"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(21));
      expect(records.length).assertEqual(21);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020007 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume020008
     * @tc.number SUB_CCE_LAUNCHTRIM_02_0008
     * @tc.desc   记录数=22 时裁剪得到第 11 条 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume020008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020008 begin');
      const records: Array<string> = arr('t01|t02|t03|t04|t05|t06|t07|t08|t09|t10|t11|t12|t13|t14|t15|t16|t17|t18|t19|t20|t21|t22');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["t11"]'));
      expect(JSON.stringify(result)).assertEqual('["t11"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(22));
      expect(records.length).assertEqual(22);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020008 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume020009
     * @tc.number SUB_CCE_LAUNCHTRIM_02_0009
     * @tc.desc   记录数=23 时裁剪得到第 11 条 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume020009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020009 begin');
      const records: Array<string> = arr('t01|t02|t03|t04|t05|t06|t07|t08|t09|t10|t11|t12|t13|t14|t15|t16|t17|t18|t19|t20|t21|t22|t23');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["t11"]'));
      expect(JSON.stringify(result)).assertEqual('["t11"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(23));
      expect(records.length).assertEqual(23);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020009 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume020010
     * @tc.number SUB_CCE_LAUNCHTRIM_02_0010
     * @tc.desc   记录数=24 时裁剪得到第 11 条 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume020010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020010 begin');
      const records: Array<string> = arr('t01|t02|t03|t04|t05|t06|t07|t08|t09|t10|t11|t12|t13|t14|t15|t16|t17|t18|t19|t20|t21|t22|t23|t24');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["t11"]'));
      expect(JSON.stringify(result)).assertEqual('["t11"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(24));
      expect(records.length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020010 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume020011
     * @tc.number SUB_CCE_LAUNCHTRIM_02_0011
     * @tc.desc   记录数=25 时裁剪得到第 11 条 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume020011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020011 begin');
      const records: Array<string> = arr('t01|t02|t03|t04|t05|t06|t07|t08|t09|t10|t11|t12|t13|t14|t15|t16|t17|t18|t19|t20|t21|t22|t23|t24|t25');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["t11"]'));
      expect(JSON.stringify(result)).assertEqual('["t11"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(25));
      expect(records.length).assertEqual(25);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020011 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume020012
     * @tc.number SUB_CCE_LAUNCHTRIM_02_0012
     * @tc.desc   记录数=26 时裁剪得到第 11 条 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume020012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020012 begin');
      const records: Array<string> = arr('t01|t02|t03|t04|t05|t06|t07|t08|t09|t10|t11|t12|t13|t14|t15|t16|t17|t18|t19|t20|t21|t22|t23|t24|t25|t26');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["t11"]'));
      expect(JSON.stringify(result)).assertEqual('["t11"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(26));
      expect(records.length).assertEqual(26);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020012 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume020013
     * @tc.number SUB_CCE_LAUNCHTRIM_02_0013
     * @tc.desc   记录数=27 时裁剪得到第 11 条 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume020013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020013 begin');
      const records: Array<string> = arr('t01|t02|t03|t04|t05|t06|t07|t08|t09|t10|t11|t12|t13|t14|t15|t16|t17|t18|t19|t20|t21|t22|t23|t24|t25|t26|t27');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["t11"]'));
      expect(JSON.stringify(result)).assertEqual('["t11"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(27));
      expect(records.length).assertEqual(27);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020013 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume020014
     * @tc.number SUB_CCE_LAUNCHTRIM_02_0014
     * @tc.desc   记录数=28 时裁剪得到第 11 条 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume020014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020014 begin');
      const records: Array<string> = arr('t01|t02|t03|t04|t05|t06|t07|t08|t09|t10|t11|t12|t13|t14|t15|t16|t17|t18|t19|t20|t21|t22|t23|t24|t25|t26|t27|t28');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["t11"]'));
      expect(JSON.stringify(result)).assertEqual('["t11"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(28));
      expect(records.length).assertEqual(28);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020014 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume020015
     * @tc.number SUB_CCE_LAUNCHTRIM_02_0015
     * @tc.desc   记录数=29 时裁剪得到第 11 条 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume020015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020015 begin');
      const records: Array<string> = arr('t01|t02|t03|t04|t05|t06|t07|t08|t09|t10|t11|t12|t13|t14|t15|t16|t17|t18|t19|t20|t21|t22|t23|t24|t25|t26|t27|t28|t29');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["t11"]'));
      expect(JSON.stringify(result)).assertEqual('["t11"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(29));
      expect(records.length).assertEqual(29);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020015 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume020016
     * @tc.number SUB_CCE_LAUNCHTRIM_02_0016
     * @tc.desc   记录数=30 时裁剪得到第 11 条 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume020016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020016 begin');
      const records: Array<string> = arr('t01|t02|t03|t04|t05|t06|t07|t08|t09|t10|t11|t12|t13|t14|t15|t16|t17|t18|t19|t20|t21|t22|t23|t24|t25|t26|t27|t28|t29|t30');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["t11"]'));
      expect(JSON.stringify(result)).assertEqual('["t11"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(30));
      expect(records.length).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020016 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume020017
     * @tc.number SUB_CCE_LAUNCHTRIM_02_0017
     * @tc.desc   记录数=31 时裁剪得到第 11 条 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume020017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020017 begin');
      const records: Array<string> = arr('t01|t02|t03|t04|t05|t06|t07|t08|t09|t10|t11|t12|t13|t14|t15|t16|t17|t18|t19|t20|t21|t22|t23|t24|t25|t26|t27|t28|t29|t30|t31');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["t11"]'));
      expect(JSON.stringify(result)).assertEqual('["t11"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(31));
      expect(records.length).assertEqual(31);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020017 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume020018
     * @tc.number SUB_CCE_LAUNCHTRIM_02_0018
     * @tc.desc   记录数=32 时裁剪得到第 11 条 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume020018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020018 begin');
      const records: Array<string> = arr('t01|t02|t03|t04|t05|t06|t07|t08|t09|t10|t11|t12|t13|t14|t15|t16|t17|t18|t19|t20|t21|t22|t23|t24|t25|t26|t27|t28|t29|t30|t31|t32');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["t11"]'));
      expect(JSON.stringify(result)).assertEqual('["t11"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(32));
      expect(records.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020018 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume020019
     * @tc.number SUB_CCE_LAUNCHTRIM_02_0019
     * @tc.desc   记录数=33 时裁剪得到第 11 条 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume020019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020019 begin');
      const records: Array<string> = arr('t01|t02|t03|t04|t05|t06|t07|t08|t09|t10|t11|t12|t13|t14|t15|t16|t17|t18|t19|t20|t21|t22|t23|t24|t25|t26|t27|t28|t29|t30|t31|t32|t33');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["t11"]'));
      expect(JSON.stringify(result)).assertEqual('["t11"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(33));
      expect(records.length).assertEqual(33);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020019 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume020020
     * @tc.number SUB_CCE_LAUNCHTRIM_02_0020
     * @tc.desc   记录数=34 时裁剪得到第 11 条 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume020020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020020 begin');
      const records: Array<string> = arr('t01|t02|t03|t04|t05|t06|t07|t08|t09|t10|t11|t12|t13|t14|t15|t16|t17|t18|t19|t20|t21|t22|t23|t24|t25|t26|t27|t28|t29|t30|t31|t32|t33|t34');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["t11"]'));
      expect(JSON.stringify(result)).assertEqual('["t11"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(34));
      expect(records.length).assertEqual(34);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020020 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume020021
     * @tc.number SUB_CCE_LAUNCHTRIM_02_0021
     * @tc.desc   记录数=35 时裁剪得到第 11 条 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume020021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020021 begin');
      const records: Array<string> = arr('t01|t02|t03|t04|t05|t06|t07|t08|t09|t10|t11|t12|t13|t14|t15|t16|t17|t18|t19|t20|t21|t22|t23|t24|t25|t26|t27|t28|t29|t30|t31|t32|t33|t34|t35');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["t11"]'));
      expect(JSON.stringify(result)).assertEqual('["t11"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(35));
      expect(records.length).assertEqual(35);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020021 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume020022
     * @tc.number SUB_CCE_LAUNCHTRIM_02_0022
     * @tc.desc   记录数=36 时裁剪得到第 11 条 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume020022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020022 begin');
      const records: Array<string> = arr('t01|t02|t03|t04|t05|t06|t07|t08|t09|t10|t11|t12|t13|t14|t15|t16|t17|t18|t19|t20|t21|t22|t23|t24|t25|t26|t27|t28|t29|t30|t31|t32|t33|t34|t35|t36');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["t11"]'));
      expect(JSON.stringify(result)).assertEqual('["t11"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(36));
      expect(records.length).assertEqual(36);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020022 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume020023
     * @tc.number SUB_CCE_LAUNCHTRIM_02_0023
     * @tc.desc   记录数=37 时裁剪得到第 11 条 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume020023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020023 begin');
      const records: Array<string> = arr('t01|t02|t03|t04|t05|t06|t07|t08|t09|t10|t11|t12|t13|t14|t15|t16|t17|t18|t19|t20|t21|t22|t23|t24|t25|t26|t27|t28|t29|t30|t31|t32|t33|t34|t35|t36|t37');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["t11"]'));
      expect(JSON.stringify(result)).assertEqual('["t11"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(37));
      expect(records.length).assertEqual(37);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020023 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume020024
     * @tc.number SUB_CCE_LAUNCHTRIM_02_0024
     * @tc.desc   记录数=38 时裁剪得到第 11 条 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume020024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020024 begin');
      const records: Array<string> = arr('t01|t02|t03|t04|t05|t06|t07|t08|t09|t10|t11|t12|t13|t14|t15|t16|t17|t18|t19|t20|t21|t22|t23|t24|t25|t26|t27|t28|t29|t30|t31|t32|t33|t34|t35|t36|t37|t38');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["t11"]'));
      expect(JSON.stringify(result)).assertEqual('["t11"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(38));
      expect(records.length).assertEqual(38);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020024 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume020025
     * @tc.number SUB_CCE_LAUNCHTRIM_02_0025
     * @tc.desc   记录数=39 时裁剪得到第 11 条 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume020025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020025 begin');
      const records: Array<string> = arr('t01|t02|t03|t04|t05|t06|t07|t08|t09|t10|t11|t12|t13|t14|t15|t16|t17|t18|t19|t20|t21|t22|t23|t24|t25|t26|t27|t28|t29|t30|t31|t32|t33|t34|t35|t36|t37|t38|t39');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["t11"]'));
      expect(JSON.stringify(result)).assertEqual('["t11"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(39));
      expect(records.length).assertEqual(39);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020025 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume020026
     * @tc.number SUB_CCE_LAUNCHTRIM_02_0026
     * @tc.desc   记录数=40 时裁剪得到第 11 条 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume020026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020026 begin');
      const records: Array<string> = arr('t01|t02|t03|t04|t05|t06|t07|t08|t09|t10|t11|t12|t13|t14|t15|t16|t17|t18|t19|t20|t21|t22|t23|t24|t25|t26|t27|t28|t29|t30|t31|t32|t33|t34|t35|t36|t37|t38|t39|t40');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["t11"]'));
      expect(JSON.stringify(result)).assertEqual('["t11"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(40));
      expect(records.length).assertEqual(40);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020026 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume020027
     * @tc.number SUB_CCE_LAUNCHTRIM_02_0027
     * @tc.desc   记录数=11 且第 11 条为『空串』时裁剪原样返回该值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume020027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020027 begin');
      const records: Array<string> = arr('e01|e02|e03|e04|e05|e06|e07|e08|e09|e10|');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[""]'));
      expect(JSON.stringify(result)).assertEqual('[""]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(11));
      expect(records.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020027 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume020028
     * @tc.number SUB_CCE_LAUNCHTRIM_02_0028
     * @tc.desc   记录数=11 且第 11 条为『 』时裁剪原样返回该值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume020028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020028 begin');
      const records: Array<string> = arr('e01|e02|e03|e04|e05|e06|e07|e08|e09|e10| ');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[" "]'));
      expect(JSON.stringify(result)).assertEqual('[" "]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(11));
      expect(records.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020028 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume020029
     * @tc.number SUB_CCE_LAUNCHTRIM_02_0029
     * @tc.desc   记录数=11 且第 11 条为『0』时裁剪原样返回该值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume020029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020029 begin');
      const records: Array<string> = arr('e01|e02|e03|e04|e05|e06|e07|e08|e09|e10|0');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["0"]'));
      expect(JSON.stringify(result)).assertEqual('["0"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(11));
      expect(records.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020029 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume020030
     * @tc.number SUB_CCE_LAUNCHTRIM_02_0030
     * @tc.desc   记录数=11 且第 11 条为『null』时裁剪原样返回该值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume020030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020030 begin');
      const records: Array<string> = arr('e01|e02|e03|e04|e05|e06|e07|e08|e09|e10|null');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["null"]'));
      expect(JSON.stringify(result)).assertEqual('["null"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(11));
      expect(records.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020030 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume020031
     * @tc.number SUB_CCE_LAUNCHTRIM_02_0031
     * @tc.desc   记录数=11 且第 11 条为『undefined』时裁剪原样返回该值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume020031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020031 begin');
      const records: Array<string> = arr('e01|e02|e03|e04|e05|e06|e07|e08|e09|e10|undefined');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["undefined"]'));
      expect(JSON.stringify(result)).assertEqual('["undefined"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(11));
      expect(records.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020031 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume020032
     * @tc.number SUB_CCE_LAUNCHTRIM_02_0032
     * @tc.desc   记录数=11 且第 11 条为『true』时裁剪原样返回该值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume020032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020032 begin');
      const records: Array<string> = arr('e01|e02|e03|e04|e05|e06|e07|e08|e09|e10|true');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["true"]'));
      expect(JSON.stringify(result)).assertEqual('["true"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(11));
      expect(records.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020032 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume020033
     * @tc.number SUB_CCE_LAUNCHTRIM_02_0033
     * @tc.desc   记录数=11 且第 11 条为『-1』时裁剪原样返回该值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume020033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020033 begin');
      const records: Array<string> = arr('e01|e02|e03|e04|e05|e06|e07|e08|e09|e10|-1');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["-1"]'));
      expect(JSON.stringify(result)).assertEqual('["-1"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(11));
      expect(records.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020033 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume020034
     * @tc.number SUB_CCE_LAUNCHTRIM_02_0034
     * @tc.desc   记录数=11 且第 11 条为『中文』时裁剪原样返回该值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume020034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020034 begin');
      const records: Array<string> = arr('e01|e02|e03|e04|e05|e06|e07|e08|e09|e10|中文');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["中文"]'));
      expect(JSON.stringify(result)).assertEqual('["中文"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(11));
      expect(records.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020034 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume020035
     * @tc.number SUB_CCE_LAUNCHTRIM_02_0035
     * @tc.desc   记录数=11 且第 11 条为『a b』时裁剪原样返回该值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume020035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020035 begin');
      const records: Array<string> = arr('e01|e02|e03|e04|e05|e06|e07|e08|e09|e10|a b');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["a b"]'));
      expect(JSON.stringify(result)).assertEqual('["a b"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(11));
      expect(records.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020035 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume020036
     * @tc.number SUB_CCE_LAUNCHTRIM_02_0036
     * @tc.desc   记录数=11 且第 11 条为『LLLLLLLLLLLLLLLLLLLL』时裁剪原样返回该值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume020036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020036 begin');
      const records: Array<string> = arr('e01|e02|e03|e04|e05|e06|e07|e08|e09|e10|LLLLLLLLLLLLLLLLLLLL');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["LLLLLLLLLLLLLLLLLLLL"]'));
      expect(JSON.stringify(result)).assertEqual('["LLLLLLLLLLLLLLLLLLLL"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(11));
      expect(records.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020036 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume020037
     * @tc.number SUB_CCE_LAUNCHTRIM_02_0037
     * @tc.desc   记录数=11 且第 11 条为『k=v』时裁剪原样返回该值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume020037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020037 begin');
      const records: Array<string> = arr('e01|e02|e03|e04|e05|e06|e07|e08|e09|e10|k=v');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["k=v"]'));
      expect(JSON.stringify(result)).assertEqual('["k=v"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(11));
      expect(records.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020037 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume020038
     * @tc.number SUB_CCE_LAUNCHTRIM_02_0038
     * @tc.desc   记录数=11 且第 11 条为『[]』时裁剪原样返回该值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume020038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020038 begin');
      const records: Array<string> = arr('e01|e02|e03|e04|e05|e06|e07|e08|e09|e10|[]');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["[]"]'));
      expect(JSON.stringify(result)).assertEqual('["[]"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(11));
      expect(records.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020038 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume020039
     * @tc.number SUB_CCE_LAUNCHTRIM_02_0039
     * @tc.desc   记录数=11 且第 11 条为『第十一条记录』时裁剪原样返回该值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume020039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020039 begin');
      const records: Array<string> = arr('e01|e02|e03|e04|e05|e06|e07|e08|e09|e10|第十一条记录');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["第十一条记录"]'));
      expect(JSON.stringify(result)).assertEqual('["第十一条记录"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(11));
      expect(records.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020039 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume020040
     * @tc.number SUB_CCE_LAUNCHTRIM_02_0040
     * @tc.desc   记录数=11 且第 11 条为『0123456789abcdef』时裁剪原样返回该值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume020040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020040 begin');
      const records: Array<string> = arr('e01|e02|e03|e04|e05|e06|e07|e08|e09|e10|0123456789abcdef');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["0123456789abcdef"]'));
      expect(JSON.stringify(result)).assertEqual('["0123456789abcdef"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(11));
      expect(records.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020040 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume020041
     * @tc.number SUB_CCE_LAUNCHTRIM_02_0041
     * @tc.desc   记录数=11 且全为重复值时裁剪返回重复值本身
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume020041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020041 begin');
      const records: Array<string> = arr('dup|dup|dup|dup|dup|dup|dup|dup|dup|dup|dup');
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["dup"]'));
      expect(JSON.stringify(result)).assertEqual('["dup"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(11));
      expect(records.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020041 end');
    })

    /**
     * @tc.name   testLaunchTrimVolume020042
     * @tc.number SUB_CCE_LAUNCHTRIM_02_0042
     * @tc.desc   记录数恰为 11 且第 11 条为空串时裁剪结果为单元素空串数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchTrimVolume020042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020042 begin');
      const records: Array<string> = ['e01', 'e02', 'e03', 'e04', 'e05', 'e06', 'e07', 'e08', 'e09', 'e10', ''];
      const result: Array<string> = launchFeature.trimRecords(records);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', JSON.stringify(result), '[""]');
      expect(JSON.stringify(result)).assertEqual('[""]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(records.length), String(11));
      expect(records.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchTrimVolume020042 end');
    })
  })
}
