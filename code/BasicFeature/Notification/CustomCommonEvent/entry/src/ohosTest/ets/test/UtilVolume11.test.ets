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
import utils from '../../../main/ets/module/Utils';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_CustomCommonEvent]';

export default function utilVolume11Test(): void {
  describe('UtilVolume11Test', () => {

    /**
     * @tc.name   testUtilVolume110001
     * @tc.number SUB_CCE_UTILV_11_0001
     * @tc.desc   n=90000000（25 整小时）格式化为 25:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume110001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110001 begin');
      const n: number = 90000000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('25:00:00'));
      expect(result).assertEqual('25:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110001 end');
    })

    /**
     * @tc.name   testUtilVolume110002
     * @tc.number SUB_CCE_UTILV_11_0002
     * @tc.desc   n=93600000（26 整小时）格式化为 26:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume110002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110002 begin');
      const n: number = 93600000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('26:00:00'));
      expect(result).assertEqual('26:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110002 end');
    })

    /**
     * @tc.name   testUtilVolume110003
     * @tc.number SUB_CCE_UTILV_11_0003
     * @tc.desc   n=97200000（27 整小时）格式化为 27:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume110003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110003 begin');
      const n: number = 97200000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('27:00:00'));
      expect(result).assertEqual('27:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110003 end');
    })

    /**
     * @tc.name   testUtilVolume110004
     * @tc.number SUB_CCE_UTILV_11_0004
     * @tc.desc   n=100800000（28 整小时）格式化为 28:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume110004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110004 begin');
      const n: number = 100800000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('28:00:00'));
      expect(result).assertEqual('28:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110004 end');
    })

    /**
     * @tc.name   testUtilVolume110005
     * @tc.number SUB_CCE_UTILV_11_0005
     * @tc.desc   n=104400000（29 整小时）格式化为 29:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume110005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110005 begin');
      const n: number = 104400000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('29:00:00'));
      expect(result).assertEqual('29:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110005 end');
    })

    /**
     * @tc.name   testUtilVolume110006
     * @tc.number SUB_CCE_UTILV_11_0006
     * @tc.desc   n=108000000（30 整小时）格式化为 30:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume110006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110006 begin');
      const n: number = 108000000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('30:00:00'));
      expect(result).assertEqual('30:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110006 end');
    })

    /**
     * @tc.name   testUtilVolume110007
     * @tc.number SUB_CCE_UTILV_11_0007
     * @tc.desc   n=111600000（31 整小时）格式化为 31:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume110007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110007 begin');
      const n: number = 111600000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('31:00:00'));
      expect(result).assertEqual('31:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110007 end');
    })

    /**
     * @tc.name   testUtilVolume110008
     * @tc.number SUB_CCE_UTILV_11_0008
     * @tc.desc   n=115200000（32 整小时）格式化为 32:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume110008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110008 begin');
      const n: number = 115200000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('32:00:00'));
      expect(result).assertEqual('32:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110008 end');
    })

    /**
     * @tc.name   testUtilVolume110009
     * @tc.number SUB_CCE_UTILV_11_0009
     * @tc.desc   n=118800000（33 整小时）格式化为 33:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume110009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110009 begin');
      const n: number = 118800000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('33:00:00'));
      expect(result).assertEqual('33:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110009 end');
    })

    /**
     * @tc.name   testUtilVolume110010
     * @tc.number SUB_CCE_UTILV_11_0010
     * @tc.desc   n=122400000（34 整小时）格式化为 34:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume110010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110010 begin');
      const n: number = 122400000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('34:00:00'));
      expect(result).assertEqual('34:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110010 end');
    })

    /**
     * @tc.name   testUtilVolume110011
     * @tc.number SUB_CCE_UTILV_11_0011
     * @tc.desc   n=126000000（35 整小时）格式化为 35:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume110011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110011 begin');
      const n: number = 126000000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('35:00:00'));
      expect(result).assertEqual('35:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110011 end');
    })

    /**
     * @tc.name   testUtilVolume110012
     * @tc.number SUB_CCE_UTILV_11_0012
     * @tc.desc   n=129600000（36 整小时）格式化为 36:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume110012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110012 begin');
      const n: number = 129600000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('36:00:00'));
      expect(result).assertEqual('36:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110012 end');
    })

    /**
     * @tc.name   testUtilVolume110013
     * @tc.number SUB_CCE_UTILV_11_0013
     * @tc.desc   n=133200000（37 整小时）格式化为 37:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume110013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110013 begin');
      const n: number = 133200000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('37:00:00'));
      expect(result).assertEqual('37:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110013 end');
    })

    /**
     * @tc.name   testUtilVolume110014
     * @tc.number SUB_CCE_UTILV_11_0014
     * @tc.desc   n=136800000（38 整小时）格式化为 38:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume110014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110014 begin');
      const n: number = 136800000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('38:00:00'));
      expect(result).assertEqual('38:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110014 end');
    })

    /**
     * @tc.name   testUtilVolume110015
     * @tc.number SUB_CCE_UTILV_11_0015
     * @tc.desc   n=140400000（39 整小时）格式化为 39:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume110015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110015 begin');
      const n: number = 140400000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('39:00:00'));
      expect(result).assertEqual('39:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110015 end');
    })

    /**
     * @tc.name   testUtilVolume110016
     * @tc.number SUB_CCE_UTILV_11_0016
     * @tc.desc   n=144000000（40 整小时）格式化为 40:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume110016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110016 begin');
      const n: number = 144000000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('40:00:00'));
      expect(result).assertEqual('40:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110016 end');
    })

    /**
     * @tc.name   testUtilVolume110017
     * @tc.number SUB_CCE_UTILV_11_0017
     * @tc.desc   n=147600000（41 整小时）格式化为 41:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume110017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110017 begin');
      const n: number = 147600000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('41:00:00'));
      expect(result).assertEqual('41:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110017 end');
    })

    /**
     * @tc.name   testUtilVolume110018
     * @tc.number SUB_CCE_UTILV_11_0018
     * @tc.desc   n=151200000（42 整小时）格式化为 42:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume110018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110018 begin');
      const n: number = 151200000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('42:00:00'));
      expect(result).assertEqual('42:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110018 end');
    })

    /**
     * @tc.name   testUtilVolume110019
     * @tc.number SUB_CCE_UTILV_11_0019
     * @tc.desc   n=154800000（43 整小时）格式化为 43:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume110019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110019 begin');
      const n: number = 154800000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('43:00:00'));
      expect(result).assertEqual('43:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110019 end');
    })

    /**
     * @tc.name   testUtilVolume110020
     * @tc.number SUB_CCE_UTILV_11_0020
     * @tc.desc   n=158400000（44 整小时）格式化为 44:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume110020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110020 begin');
      const n: number = 158400000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('44:00:00'));
      expect(result).assertEqual('44:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110020 end');
    })

    /**
     * @tc.name   testUtilVolume110021
     * @tc.number SUB_CCE_UTILV_11_0021
     * @tc.desc   n=162000000（45 整小时）格式化为 45:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume110021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110021 begin');
      const n: number = 162000000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('45:00:00'));
      expect(result).assertEqual('45:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110021 end');
    })

    /**
     * @tc.name   testUtilVolume110022
     * @tc.number SUB_CCE_UTILV_11_0022
     * @tc.desc   n=165600000（46 整小时）格式化为 46:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume110022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110022 begin');
      const n: number = 165600000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('46:00:00'));
      expect(result).assertEqual('46:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110022 end');
    })

    /**
     * @tc.name   testUtilVolume110023
     * @tc.number SUB_CCE_UTILV_11_0023
     * @tc.desc   n=169200000（47 整小时）格式化为 47:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume110023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110023 begin');
      const n: number = 169200000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('47:00:00'));
      expect(result).assertEqual('47:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110023 end');
    })

    /**
     * @tc.name   testUtilVolume110024
     * @tc.number SUB_CCE_UTILV_11_0024
     * @tc.desc   n=176400000（49 整小时）格式化为 49:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume110024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110024 begin');
      const n: number = 176400000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('49:00:00'));
      expect(result).assertEqual('49:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110024 end');
    })

    /**
     * @tc.name   testUtilVolume110025
     * @tc.number SUB_CCE_UTILV_11_0025
     * @tc.desc   n=180000000（50 整小时）格式化为 50:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume110025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110025 begin');
      const n: number = 180000000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('50:00:00'));
      expect(result).assertEqual('50:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110025 end');
    })

    /**
     * @tc.name   testUtilVolume110026
     * @tc.number SUB_CCE_UTILV_11_0026
     * @tc.desc   n=183600000（51 整小时）格式化为 51:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume110026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110026 begin');
      const n: number = 183600000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('51:00:00'));
      expect(result).assertEqual('51:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110026 end');
    })

    /**
     * @tc.name   testUtilVolume110027
     * @tc.number SUB_CCE_UTILV_11_0027
     * @tc.desc   n=187200000（52 整小时）格式化为 52:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume110027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110027 begin');
      const n: number = 187200000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('52:00:00'));
      expect(result).assertEqual('52:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110027 end');
    })

    /**
     * @tc.name   testUtilVolume110028
     * @tc.number SUB_CCE_UTILV_11_0028
     * @tc.desc   n=190800000（53 整小时）格式化为 53:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume110028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110028 begin');
      const n: number = 190800000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('53:00:00'));
      expect(result).assertEqual('53:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110028 end');
    })

    /**
     * @tc.name   testUtilVolume110029
     * @tc.number SUB_CCE_UTILV_11_0029
     * @tc.desc   n=194400000（54 整小时）格式化为 54:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume110029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110029 begin');
      const n: number = 194400000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('54:00:00'));
      expect(result).assertEqual('54:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110029 end');
    })

    /**
     * @tc.name   testUtilVolume110030
     * @tc.number SUB_CCE_UTILV_11_0030
     * @tc.desc   n=198000000（55 整小时）格式化为 55:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume110030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110030 begin');
      const n: number = 198000000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('55:00:00'));
      expect(result).assertEqual('55:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110030 end');
    })

    /**
     * @tc.name   testUtilVolume110031
     * @tc.number SUB_CCE_UTILV_11_0031
     * @tc.desc   n=201600000（56 整小时）格式化为 56:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume110031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110031 begin');
      const n: number = 201600000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('56:00:00'));
      expect(result).assertEqual('56:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110031 end');
    })

    /**
     * @tc.name   testUtilVolume110032
     * @tc.number SUB_CCE_UTILV_11_0032
     * @tc.desc   n=205200000（57 整小时）格式化为 57:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume110032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110032 begin');
      const n: number = 205200000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('57:00:00'));
      expect(result).assertEqual('57:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110032 end');
    })

    /**
     * @tc.name   testUtilVolume110033
     * @tc.number SUB_CCE_UTILV_11_0033
     * @tc.desc   n=208800000（58 整小时）格式化为 58:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume110033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110033 begin');
      const n: number = 208800000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('58:00:00'));
      expect(result).assertEqual('58:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110033 end');
    })

    /**
     * @tc.name   testUtilVolume110034
     * @tc.number SUB_CCE_UTILV_11_0034
     * @tc.desc   n=212400000（59 整小时）格式化为 59:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume110034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110034 begin');
      const n: number = 212400000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('59:00:00'));
      expect(result).assertEqual('59:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110034 end');
    })

    /**
     * @tc.name   testUtilVolume110035
     * @tc.number SUB_CCE_UTILV_11_0035
     * @tc.desc   n=216000000（60 整小时）格式化为 60:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume110035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110035 begin');
      const n: number = 216000000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('60:00:00'));
      expect(result).assertEqual('60:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110035 end');
    })

    /**
     * @tc.name   testUtilVolume110036
     * @tc.number SUB_CCE_UTILV_11_0036
     * @tc.desc   n=219600000（61 整小时）格式化为 61:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume110036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110036 begin');
      const n: number = 219600000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('61:00:00'));
      expect(result).assertEqual('61:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110036 end');
    })

    /**
     * @tc.name   testUtilVolume110037
     * @tc.number SUB_CCE_UTILV_11_0037
     * @tc.desc   n=223200000（62 整小时）格式化为 62:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume110037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110037 begin');
      const n: number = 223200000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('62:00:00'));
      expect(result).assertEqual('62:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110037 end');
    })

    /**
     * @tc.name   testUtilVolume110038
     * @tc.number SUB_CCE_UTILV_11_0038
     * @tc.desc   n=226800000（63 整小时）格式化为 63:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume110038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110038 begin');
      const n: number = 226800000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('63:00:00'));
      expect(result).assertEqual('63:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110038 end');
    })

    /**
     * @tc.name   testUtilVolume110039
     * @tc.number SUB_CCE_UTILV_11_0039
     * @tc.desc   n=230400000（64 整小时）格式化为 64:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume110039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110039 begin');
      const n: number = 230400000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('64:00:00'));
      expect(result).assertEqual('64:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110039 end');
    })

    /**
     * @tc.name   testUtilVolume110040
     * @tc.number SUB_CCE_UTILV_11_0040
     * @tc.desc   n=234000000（65 整小时）格式化为 65:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume110040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110040 begin');
      const n: number = 234000000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('65:00:00'));
      expect(result).assertEqual('65:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110040 end');
    })

    /**
     * @tc.name   testUtilVolume110041
     * @tc.number SUB_CCE_UTILV_11_0041
     * @tc.desc   n=237600000（66 整小时）格式化为 66:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume110041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110041 begin');
      const n: number = 237600000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('66:00:00'));
      expect(result).assertEqual('66:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110041 end');
    })

    /**
     * @tc.name   testUtilVolume110042
     * @tc.number SUB_CCE_UTILV_11_0042
     * @tc.desc   n=241200000（67 整小时）格式化为 67:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume110042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110042 begin');
      const n: number = 241200000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('67:00:00'));
      expect(result).assertEqual('67:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110042 end');
    })

    /**
     * @tc.name   testUtilVolume110043
     * @tc.number SUB_CCE_UTILV_11_0043
     * @tc.desc   n=244800000（68 整小时）格式化为 68:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume110043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110043 begin');
      const n: number = 244800000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('68:00:00'));
      expect(result).assertEqual('68:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110043 end');
    })

    /**
     * @tc.name   testUtilVolume110044
     * @tc.number SUB_CCE_UTILV_11_0044
     * @tc.desc   n=248400000（69 整小时）格式化为 69:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume110044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110044 begin');
      const n: number = 248400000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('69:00:00'));
      expect(result).assertEqual('69:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110044 end');
    })

    /**
     * @tc.name   testUtilVolume110045
     * @tc.number SUB_CCE_UTILV_11_0045
     * @tc.desc   n=252000000（70 整小时）格式化为 70:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume110045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110045 begin');
      const n: number = 252000000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('70:00:00'));
      expect(result).assertEqual('70:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110045 end');
    })

    /**
     * @tc.name   testUtilVolume110046
     * @tc.number SUB_CCE_UTILV_11_0046
     * @tc.desc   n=255600000（71 整小时）格式化为 71:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume110046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110046 begin');
      const n: number = 255600000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('71:00:00'));
      expect(result).assertEqual('71:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110046 end');
    })

    /**
     * @tc.name   testUtilVolume110047
     * @tc.number SUB_CCE_UTILV_11_0047
     * @tc.desc   n=259200000（72 整小时）格式化为 72:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume110047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110047 begin');
      const n: number = 259200000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('72:00:00'));
      expect(result).assertEqual('72:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110047 end');
    })

    /**
     * @tc.name   testUtilVolume110048
     * @tc.number SUB_CCE_UTILV_11_0048
     * @tc.desc   n=262800000（73 整小时）格式化为 73:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume110048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110048 begin');
      const n: number = 262800000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('73:00:00'));
      expect(result).assertEqual('73:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110048 end');
    })

    /**
     * @tc.name   testUtilVolume110049
     * @tc.number SUB_CCE_UTILV_11_0049
     * @tc.desc   n=266400000（74 整小时）格式化为 74:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume110049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110049 begin');
      const n: number = 266400000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('74:00:00'));
      expect(result).assertEqual('74:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110049 end');
    })

    /**
     * @tc.name   testUtilVolume110050
     * @tc.number SUB_CCE_UTILV_11_0050
     * @tc.desc   n=270000000（75 整小时）格式化为 75:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume110050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110050 begin');
      const n: number = 270000000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('75:00:00'));
      expect(result).assertEqual('75:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110050 end');
    })

    /**
     * @tc.name   testUtilVolume110051
     * @tc.number SUB_CCE_UTILV_11_0051
     * @tc.desc   n=273600000（76 整小时）格式化为 76:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume110051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110051 begin');
      const n: number = 273600000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('76:00:00'));
      expect(result).assertEqual('76:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110051 end');
    })

    /**
     * @tc.name   testUtilVolume110052
     * @tc.number SUB_CCE_UTILV_11_0052
     * @tc.desc   n=277200000（77 整小时）格式化为 77:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume110052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110052 begin');
      const n: number = 277200000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('77:00:00'));
      expect(result).assertEqual('77:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110052 end');
    })

    /**
     * @tc.name   testUtilVolume110053
     * @tc.number SUB_CCE_UTILV_11_0053
     * @tc.desc   n=280800000（78 整小时）格式化为 78:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume110053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110053 begin');
      const n: number = 280800000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('78:00:00'));
      expect(result).assertEqual('78:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110053 end');
    })

    /**
     * @tc.name   testUtilVolume110054
     * @tc.number SUB_CCE_UTILV_11_0054
     * @tc.desc   n=284400000（79 整小时）格式化为 79:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume110054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110054 begin');
      const n: number = 284400000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('79:00:00'));
      expect(result).assertEqual('79:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110054 end');
    })

    /**
     * @tc.name   testUtilVolume110055
     * @tc.number SUB_CCE_UTILV_11_0055
     * @tc.desc   79/80 整小时分钟秒段恒 00，小时段两位递增
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume110055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110055 begin');
      const h79: string = utils.convertTimeToFormatString(79 * 3600000);
      const h80: string = utils.convertTimeToFormatString(80 * 3600000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', h79, '79:00:00');
      expect(h79).assertEqual('79:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', h80, '80:00:00');
      expect(h80).assertEqual('80:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(h79.substring(3) === '00:00' && h80.substring(3) === '00:00'));
      expect(h79.substring(3) === '00:00' && h80.substring(3) === '00:00').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume110055 end');
    })
  })
}
