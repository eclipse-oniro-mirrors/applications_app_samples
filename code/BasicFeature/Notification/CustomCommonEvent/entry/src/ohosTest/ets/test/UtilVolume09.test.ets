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

export default function utilVolume09Test(): void {
  describe('UtilVolume09Test', () => {

    /**
     * @tc.name   testUtilVolume090001
     * @tc.number SUB_CCE_UTILV_09_0001
     * @tc.desc   n=-40 负数经 floor 向下取整后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090001 begin');
      const n: number = -40;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090001 end');
    })

    /**
     * @tc.name   testUtilVolume090002
     * @tc.number SUB_CCE_UTILV_09_0002
     * @tc.desc   n=-41 负数经 floor 向下取整后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090002 begin');
      const n: number = -41;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090002 end');
    })

    /**
     * @tc.name   testUtilVolume090003
     * @tc.number SUB_CCE_UTILV_09_0003
     * @tc.desc   n=-42 负数经 floor 向下取整后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090003 begin');
      const n: number = -42;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090003 end');
    })

    /**
     * @tc.name   testUtilVolume090004
     * @tc.number SUB_CCE_UTILV_09_0004
     * @tc.desc   n=-43 负数经 floor 向下取整后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090004 begin');
      const n: number = -43;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090004 end');
    })

    /**
     * @tc.name   testUtilVolume090005
     * @tc.number SUB_CCE_UTILV_09_0005
     * @tc.desc   n=-44 负数经 floor 向下取整后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090005 begin');
      const n: number = -44;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090005 end');
    })

    /**
     * @tc.name   testUtilVolume090006
     * @tc.number SUB_CCE_UTILV_09_0006
     * @tc.desc   n=-45 负数经 floor 向下取整后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090006 begin');
      const n: number = -45;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090006 end');
    })

    /**
     * @tc.name   testUtilVolume090007
     * @tc.number SUB_CCE_UTILV_09_0007
     * @tc.desc   n=-46 负数经 floor 向下取整后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090007 begin');
      const n: number = -46;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090007 end');
    })

    /**
     * @tc.name   testUtilVolume090008
     * @tc.number SUB_CCE_UTILV_09_0008
     * @tc.desc   n=-47 负数经 floor 向下取整后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090008 begin');
      const n: number = -47;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090008 end');
    })

    /**
     * @tc.name   testUtilVolume090009
     * @tc.number SUB_CCE_UTILV_09_0009
     * @tc.desc   n=-48 负数经 floor 向下取整后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090009 begin');
      const n: number = -48;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090009 end');
    })

    /**
     * @tc.name   testUtilVolume090010
     * @tc.number SUB_CCE_UTILV_09_0010
     * @tc.desc   n=-49 负数经 floor 向下取整后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090010 begin');
      const n: number = -49;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090010 end');
    })

    /**
     * @tc.name   testUtilVolume090011
     * @tc.number SUB_CCE_UTILV_09_0011
     * @tc.desc   n=-50 负数经 floor 向下取整后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090011 begin');
      const n: number = -50;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090011 end');
    })

    /**
     * @tc.name   testUtilVolume090012
     * @tc.number SUB_CCE_UTILV_09_0012
     * @tc.desc   n=-51 负数经 floor 向下取整后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090012 begin');
      const n: number = -51;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090012 end');
    })

    /**
     * @tc.name   testUtilVolume090013
     * @tc.number SUB_CCE_UTILV_09_0013
     * @tc.desc   n=-52 负数经 floor 向下取整后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090013 begin');
      const n: number = -52;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090013 end');
    })

    /**
     * @tc.name   testUtilVolume090014
     * @tc.number SUB_CCE_UTILV_09_0014
     * @tc.desc   n=-53 负数经 floor 向下取整后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090014 begin');
      const n: number = -53;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090014 end');
    })

    /**
     * @tc.name   testUtilVolume090015
     * @tc.number SUB_CCE_UTILV_09_0015
     * @tc.desc   n=-54 负数经 floor 向下取整后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090015 begin');
      const n: number = -54;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090015 end');
    })

    /**
     * @tc.name   testUtilVolume090016
     * @tc.number SUB_CCE_UTILV_09_0016
     * @tc.desc   n=-55 负数经 floor 向下取整后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090016 begin');
      const n: number = -55;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090016 end');
    })

    /**
     * @tc.name   testUtilVolume090017
     * @tc.number SUB_CCE_UTILV_09_0017
     * @tc.desc   n=-56 负数经 floor 向下取整后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090017 begin');
      const n: number = -56;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090017 end');
    })

    /**
     * @tc.name   testUtilVolume090018
     * @tc.number SUB_CCE_UTILV_09_0018
     * @tc.desc   n=-57 负数经 floor 向下取整后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090018 begin');
      const n: number = -57;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090018 end');
    })

    /**
     * @tc.name   testUtilVolume090019
     * @tc.number SUB_CCE_UTILV_09_0019
     * @tc.desc   n=-58 负数经 floor 向下取整后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090019 begin');
      const n: number = -58;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090019 end');
    })

    /**
     * @tc.name   testUtilVolume090020
     * @tc.number SUB_CCE_UTILV_09_0020
     * @tc.desc   n=-59 负数经 floor 向下取整后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090020 begin');
      const n: number = -59;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090020 end');
    })

    /**
     * @tc.name   testUtilVolume090021
     * @tc.number SUB_CCE_UTILV_09_0021
     * @tc.desc   n=-60 负数经 floor 向下取整后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090021 begin');
      const n: number = -60;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090021 end');
    })

    /**
     * @tc.name   testUtilVolume090022
     * @tc.number SUB_CCE_UTILV_09_0022
     * @tc.desc   n=-61 负数经 floor 向下取整后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090022 begin');
      const n: number = -61;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090022 end');
    })

    /**
     * @tc.name   testUtilVolume090023
     * @tc.number SUB_CCE_UTILV_09_0023
     * @tc.desc   n=-62 负数经 floor 向下取整后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090023 begin');
      const n: number = -62;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090023 end');
    })

    /**
     * @tc.name   testUtilVolume090024
     * @tc.number SUB_CCE_UTILV_09_0024
     * @tc.desc   n=-63 负数经 floor 向下取整后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090024 begin');
      const n: number = -63;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090024 end');
    })

    /**
     * @tc.name   testUtilVolume090025
     * @tc.number SUB_CCE_UTILV_09_0025
     * @tc.desc   n=-64 负数经 floor 向下取整后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090025 begin');
      const n: number = -64;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090025 end');
    })

    /**
     * @tc.name   testUtilVolume090026
     * @tc.number SUB_CCE_UTILV_09_0026
     * @tc.desc   n=-65 负数经 floor 向下取整后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090026 begin');
      const n: number = -65;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090026 end');
    })

    /**
     * @tc.name   testUtilVolume090027
     * @tc.number SUB_CCE_UTILV_09_0027
     * @tc.desc   n=-66 负数经 floor 向下取整后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090027 begin');
      const n: number = -66;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090027 end');
    })

    /**
     * @tc.name   testUtilVolume090028
     * @tc.number SUB_CCE_UTILV_09_0028
     * @tc.desc   n=-67 负数经 floor 向下取整后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090028 begin');
      const n: number = -67;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090028 end');
    })

    /**
     * @tc.name   testUtilVolume090029
     * @tc.number SUB_CCE_UTILV_09_0029
     * @tc.desc   n=-68 负数经 floor 向下取整后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090029 begin');
      const n: number = -68;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090029 end');
    })

    /**
     * @tc.name   testUtilVolume090030
     * @tc.number SUB_CCE_UTILV_09_0030
     * @tc.desc   n=-69 负数经 floor 向下取整后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090030 begin');
      const n: number = -69;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090030 end');
    })

    /**
     * @tc.name   testUtilVolume090031
     * @tc.number SUB_CCE_UTILV_09_0031
     * @tc.desc   n=-70 负数经 floor 向下取整后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090031 begin');
      const n: number = -70;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090031 end');
    })

    /**
     * @tc.name   testUtilVolume090032
     * @tc.number SUB_CCE_UTILV_09_0032
     * @tc.desc   n=-71 负数经 floor 向下取整后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090032 begin');
      const n: number = -71;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090032 end');
    })

    /**
     * @tc.name   testUtilVolume090033
     * @tc.number SUB_CCE_UTILV_09_0033
     * @tc.desc   n=-72 负数经 floor 向下取整后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090033 begin');
      const n: number = -72;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090033 end');
    })

    /**
     * @tc.name   testUtilVolume090034
     * @tc.number SUB_CCE_UTILV_09_0034
     * @tc.desc   n=-73 负数经 floor 向下取整后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090034 begin');
      const n: number = -73;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090034 end');
    })

    /**
     * @tc.name   testUtilVolume090035
     * @tc.number SUB_CCE_UTILV_09_0035
     * @tc.desc   n=-74 负数经 floor 向下取整后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090035 begin');
      const n: number = -74;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090035 end');
    })

    /**
     * @tc.name   testUtilVolume090036
     * @tc.number SUB_CCE_UTILV_09_0036
     * @tc.desc   n=-75 负数经 floor 向下取整后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090036 begin');
      const n: number = -75;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090036 end');
    })

    /**
     * @tc.name   testUtilVolume090037
     * @tc.number SUB_CCE_UTILV_09_0037
     * @tc.desc   n=-76 负数经 floor 向下取整后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090037 begin');
      const n: number = -76;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090037 end');
    })

    /**
     * @tc.name   testUtilVolume090038
     * @tc.number SUB_CCE_UTILV_09_0038
     * @tc.desc   n=-77 负数经 floor 向下取整后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090038 begin');
      const n: number = -77;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090038 end');
    })

    /**
     * @tc.name   testUtilVolume090039
     * @tc.number SUB_CCE_UTILV_09_0039
     * @tc.desc   n=-2002 负数经 floor 向下取整后格式化为 0-1:0-1:0-3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090039 begin');
      const n: number = -2002;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-3'));
      expect(result).assertEqual('0-1:0-1:0-3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-3'));
      expect(result.substring(result.length - 2)).assertEqual('-3');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090039 end');
    })

    /**
     * @tc.name   testUtilVolume090040
     * @tc.number SUB_CCE_UTILV_09_0040
     * @tc.desc   n=-1998 负数经 floor 向下取整后格式化为 0-1:0-1:0-2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090040 begin');
      const n: number = -1998;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-2'));
      expect(result).assertEqual('0-1:0-1:0-2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-2'));
      expect(result.substring(result.length - 2)).assertEqual('-2');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090040 end');
    })

    /**
     * @tc.name   testUtilVolume090041
     * @tc.number SUB_CCE_UTILV_09_0041
     * @tc.desc   n=-3002 负数经 floor 向下取整后格式化为 0-1:0-1:0-4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090041 begin');
      const n: number = -3002;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-4'));
      expect(result).assertEqual('0-1:0-1:0-4');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-4'));
      expect(result.substring(result.length - 2)).assertEqual('-4');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090041 end');
    })

    /**
     * @tc.name   testUtilVolume090042
     * @tc.number SUB_CCE_UTILV_09_0042
     * @tc.desc   n=-2998 负数经 floor 向下取整后格式化为 0-1:0-1:0-3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090042 begin');
      const n: number = -2998;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-3'));
      expect(result).assertEqual('0-1:0-1:0-3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-3'));
      expect(result.substring(result.length - 2)).assertEqual('-3');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090042 end');
    })

    /**
     * @tc.name   testUtilVolume090043
     * @tc.number SUB_CCE_UTILV_09_0043
     * @tc.desc   n=-4002 负数经 floor 向下取整后格式化为 0-1:0-1:0-5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090043 begin');
      const n: number = -4002;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-5'));
      expect(result).assertEqual('0-1:0-1:0-5');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-5'));
      expect(result.substring(result.length - 2)).assertEqual('-5');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090043 end');
    })

    /**
     * @tc.name   testUtilVolume090044
     * @tc.number SUB_CCE_UTILV_09_0044
     * @tc.desc   n=-3998 负数经 floor 向下取整后格式化为 0-1:0-1:0-4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090044 begin');
      const n: number = -3998;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-4'));
      expect(result).assertEqual('0-1:0-1:0-4');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-4'));
      expect(result.substring(result.length - 2)).assertEqual('-4');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090044 end');
    })

    /**
     * @tc.name   testUtilVolume090045
     * @tc.number SUB_CCE_UTILV_09_0045
     * @tc.desc   n=-5002 负数经 floor 向下取整后格式化为 0-1:0-1:0-6
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090045 begin');
      const n: number = -5002;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-6'));
      expect(result).assertEqual('0-1:0-1:0-6');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-6'));
      expect(result.substring(result.length - 2)).assertEqual('-6');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090045 end');
    })

    /**
     * @tc.name   testUtilVolume090046
     * @tc.number SUB_CCE_UTILV_09_0046
     * @tc.desc   n=-4998 负数经 floor 向下取整后格式化为 0-1:0-1:0-5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090046 begin');
      const n: number = -4998;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-5'));
      expect(result).assertEqual('0-1:0-1:0-5');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-5'));
      expect(result.substring(result.length - 2)).assertEqual('-5');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090046 end');
    })

    /**
     * @tc.name   testUtilVolume090047
     * @tc.number SUB_CCE_UTILV_09_0047
     * @tc.desc   n=-6002 负数经 floor 向下取整后格式化为 0-1:0-1:0-7
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090047 begin');
      const n: number = -6002;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-7'));
      expect(result).assertEqual('0-1:0-1:0-7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-7'));
      expect(result.substring(result.length - 2)).assertEqual('-7');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090047 end');
    })

    /**
     * @tc.name   testUtilVolume090048
     * @tc.number SUB_CCE_UTILV_09_0048
     * @tc.desc   n=-5998 负数经 floor 向下取整后格式化为 0-1:0-1:0-6
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090048 begin');
      const n: number = -5998;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-6'));
      expect(result).assertEqual('0-1:0-1:0-6');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-6'));
      expect(result.substring(result.length - 2)).assertEqual('-6');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090048 end');
    })

    /**
     * @tc.name   testUtilVolume090049
     * @tc.number SUB_CCE_UTILV_09_0049
     * @tc.desc   n=-7002 负数经 floor 向下取整后格式化为 0-1:0-1:0-8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090049 begin');
      const n: number = -7002;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-8'));
      expect(result).assertEqual('0-1:0-1:0-8');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-8'));
      expect(result.substring(result.length - 2)).assertEqual('-8');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090049 end');
    })

    /**
     * @tc.name   testUtilVolume090050
     * @tc.number SUB_CCE_UTILV_09_0050
     * @tc.desc   n=-6998 负数经 floor 向下取整后格式化为 0-1:0-1:0-7
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090050 begin');
      const n: number = -6998;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-7'));
      expect(result).assertEqual('0-1:0-1:0-7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-7'));
      expect(result.substring(result.length - 2)).assertEqual('-7');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090050 end');
    })

    /**
     * @tc.name   testUtilVolume090051
     * @tc.number SUB_CCE_UTILV_09_0051
     * @tc.desc   n=-8002 负数经 floor 向下取整后格式化为 0-1:0-1:0-9
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090051 begin');
      const n: number = -8002;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-9'));
      expect(result).assertEqual('0-1:0-1:0-9');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-9'));
      expect(result.substring(result.length - 2)).assertEqual('-9');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090051 end');
    })

    /**
     * @tc.name   testUtilVolume090052
     * @tc.number SUB_CCE_UTILV_09_0052
     * @tc.desc   n=-7998 负数经 floor 向下取整后格式化为 0-1:0-1:0-8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090052 begin');
      const n: number = -7998;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-8'));
      expect(result).assertEqual('0-1:0-1:0-8');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-8'));
      expect(result.substring(result.length - 2)).assertEqual('-8');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090052 end');
    })

    /**
     * @tc.name   testUtilVolume090053
     * @tc.number SUB_CCE_UTILV_09_0053
     * @tc.desc   n=-9002 负数经 floor 向下取整后格式化为 0-1:0-1:0-10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090053 begin');
      const n: number = -9002;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-10'));
      expect(result).assertEqual('0-1:0-1:0-10');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('10'));
      expect(result.substring(result.length - 2)).assertEqual('10');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090053 end');
    })

    /**
     * @tc.name   testUtilVolume090054
     * @tc.number SUB_CCE_UTILV_09_0054
     * @tc.desc   n=-8998 负数经 floor 向下取整后格式化为 0-1:0-1:0-9
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090054 begin');
      const n: number = -8998;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-9'));
      expect(result).assertEqual('0-1:0-1:0-9');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-9'));
      expect(result.substring(result.length - 2)).assertEqual('-9');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090054 end');
    })

    /**
     * @tc.name   testUtilVolume090055
     * @tc.number SUB_CCE_UTILV_09_0055
     * @tc.desc   n=-10002 负数经 floor 向下取整后格式化为 0-1:0-1:0-11
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090055 begin');
      const n: number = -10002;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-11'));
      expect(result).assertEqual('0-1:0-1:0-11');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('11'));
      expect(result.substring(result.length - 2)).assertEqual('11');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090055 end');
    })

    /**
     * @tc.name   testUtilVolume090056
     * @tc.number SUB_CCE_UTILV_09_0056
     * @tc.desc   n=-9998 负数经 floor 向下取整后格式化为 0-1:0-1:0-10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090056 begin');
      const n: number = -9998;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-10'));
      expect(result).assertEqual('0-1:0-1:0-10');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('10'));
      expect(result.substring(result.length - 2)).assertEqual('10');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090056 end');
    })

    /**
     * @tc.name   testUtilVolume090057
     * @tc.number SUB_CCE_UTILV_09_0057
     * @tc.desc   n=-11002 负数经 floor 向下取整后格式化为 0-1:0-1:0-12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090057 begin');
      const n: number = -11002;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-12'));
      expect(result).assertEqual('0-1:0-1:0-12');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('12'));
      expect(result.substring(result.length - 2)).assertEqual('12');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090057 end');
    })

    /**
     * @tc.name   testUtilVolume090058
     * @tc.number SUB_CCE_UTILV_09_0058
     * @tc.desc   n=-10998 负数经 floor 向下取整后格式化为 0-1:0-1:0-11
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090058 begin');
      const n: number = -10998;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-11'));
      expect(result).assertEqual('0-1:0-1:0-11');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('11'));
      expect(result.substring(result.length - 2)).assertEqual('11');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090058 end');
    })

    /**
     * @tc.name   testUtilVolume090059
     * @tc.number SUB_CCE_UTILV_09_0059
     * @tc.desc   n=-12002 负数经 floor 向下取整后格式化为 0-1:0-1:0-13
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090059 begin');
      const n: number = -12002;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-13'));
      expect(result).assertEqual('0-1:0-1:0-13');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('13'));
      expect(result.substring(result.length - 2)).assertEqual('13');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090059 end');
    })

    /**
     * @tc.name   testUtilVolume090060
     * @tc.number SUB_CCE_UTILV_09_0060
     * @tc.desc   n=-11998 负数经 floor 向下取整后格式化为 0-1:0-1:0-12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090060 begin');
      const n: number = -11998;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-12'));
      expect(result).assertEqual('0-1:0-1:0-12');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('12'));
      expect(result.substring(result.length - 2)).assertEqual('12');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090060 end');
    })

    /**
     * @tc.name   testUtilVolume090061
     * @tc.number SUB_CCE_UTILV_09_0061
     * @tc.desc   n=-13002 负数经 floor 向下取整后格式化为 0-1:0-1:0-14
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090061 begin');
      const n: number = -13002;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-14'));
      expect(result).assertEqual('0-1:0-1:0-14');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('14'));
      expect(result.substring(result.length - 2)).assertEqual('14');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090061 end');
    })

    /**
     * @tc.name   testUtilVolume090062
     * @tc.number SUB_CCE_UTILV_09_0062
     * @tc.desc   n=-12998 负数经 floor 向下取整后格式化为 0-1:0-1:0-13
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090062 begin');
      const n: number = -12998;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-13'));
      expect(result).assertEqual('0-1:0-1:0-13');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('13'));
      expect(result.substring(result.length - 2)).assertEqual('13');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090062 end');
    })

    /**
     * @tc.name   testUtilVolume090063
     * @tc.number SUB_CCE_UTILV_09_0063
     * @tc.desc   n=-14002 负数经 floor 向下取整后格式化为 0-1:0-1:0-15
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090063 begin');
      const n: number = -14002;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-15'));
      expect(result).assertEqual('0-1:0-1:0-15');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('15'));
      expect(result.substring(result.length - 2)).assertEqual('15');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090063 end');
    })

    /**
     * @tc.name   testUtilVolume090064
     * @tc.number SUB_CCE_UTILV_09_0064
     * @tc.desc   n=-13998 负数经 floor 向下取整后格式化为 0-1:0-1:0-14
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090064 begin');
      const n: number = -13998;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-14'));
      expect(result).assertEqual('0-1:0-1:0-14');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('14'));
      expect(result.substring(result.length - 2)).assertEqual('14');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090064 end');
    })

    /**
     * @tc.name   testUtilVolume090065
     * @tc.number SUB_CCE_UTILV_09_0065
     * @tc.desc   n=-15002 负数经 floor 向下取整后格式化为 0-1:0-1:0-16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090065 begin');
      const n: number = -15002;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-16'));
      expect(result).assertEqual('0-1:0-1:0-16');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('16'));
      expect(result.substring(result.length - 2)).assertEqual('16');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090065 end');
    })

    /**
     * @tc.name   testUtilVolume090066
     * @tc.number SUB_CCE_UTILV_09_0066
     * @tc.desc   n=-14998 负数经 floor 向下取整后格式化为 0-1:0-1:0-15
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090066 begin');
      const n: number = -14998;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-15'));
      expect(result).assertEqual('0-1:0-1:0-15');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('15'));
      expect(result.substring(result.length - 2)).assertEqual('15');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090066 end');
    })

    /**
     * @tc.name   testUtilVolume090067
     * @tc.number SUB_CCE_UTILV_09_0067
     * @tc.desc   n=-16002 负数经 floor 向下取整后格式化为 0-1:0-1:0-17
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090067 begin');
      const n: number = -16002;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-17'));
      expect(result).assertEqual('0-1:0-1:0-17');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('17'));
      expect(result.substring(result.length - 2)).assertEqual('17');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090067 end');
    })

    /**
     * @tc.name   testUtilVolume090068
     * @tc.number SUB_CCE_UTILV_09_0068
     * @tc.desc   n=-15998 负数经 floor 向下取整后格式化为 0-1:0-1:0-16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090068 begin');
      const n: number = -15998;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-16'));
      expect(result).assertEqual('0-1:0-1:0-16');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('16'));
      expect(result.substring(result.length - 2)).assertEqual('16');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090068 end');
    })

    /**
     * @tc.name   testUtilVolume090069
     * @tc.number SUB_CCE_UTILV_09_0069
     * @tc.desc   n=-17002 负数经 floor 向下取整后格式化为 0-1:0-1:0-18
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090069 begin');
      const n: number = -17002;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-18'));
      expect(result).assertEqual('0-1:0-1:0-18');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('18'));
      expect(result.substring(result.length - 2)).assertEqual('18');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090069 end');
    })

    /**
     * @tc.name   testUtilVolume090070
     * @tc.number SUB_CCE_UTILV_09_0070
     * @tc.desc   n=-16998 负数经 floor 向下取整后格式化为 0-1:0-1:0-17
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090070 begin');
      const n: number = -16998;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-17'));
      expect(result).assertEqual('0-1:0-1:0-17');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('17'));
      expect(result.substring(result.length - 2)).assertEqual('17');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090070 end');
    })

    /**
     * @tc.name   testUtilVolume090071
     * @tc.number SUB_CCE_UTILV_09_0071
     * @tc.desc   n=-18002 负数经 floor 向下取整后格式化为 0-1:0-1:0-19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090071 begin');
      const n: number = -18002;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-19'));
      expect(result).assertEqual('0-1:0-1:0-19');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('19'));
      expect(result.substring(result.length - 2)).assertEqual('19');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090071 end');
    })

    /**
     * @tc.name   testUtilVolume090072
     * @tc.number SUB_CCE_UTILV_09_0072
     * @tc.desc   n=-17998 负数经 floor 向下取整后格式化为 0-1:0-1:0-18
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090072 begin');
      const n: number = -17998;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-18'));
      expect(result).assertEqual('0-1:0-1:0-18');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('18'));
      expect(result.substring(result.length - 2)).assertEqual('18');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090072 end');
    })

    /**
     * @tc.name   testUtilVolume090073
     * @tc.number SUB_CCE_UTILV_09_0073
     * @tc.desc   n=-19002 负数经 floor 向下取整后格式化为 0-1:0-1:0-20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090073 begin');
      const n: number = -19002;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-20'));
      expect(result).assertEqual('0-1:0-1:0-20');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('20'));
      expect(result.substring(result.length - 2)).assertEqual('20');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090073 end');
    })

    /**
     * @tc.name   testUtilVolume090074
     * @tc.number SUB_CCE_UTILV_09_0074
     * @tc.desc   n=-18998 负数经 floor 向下取整后格式化为 0-1:0-1:0-19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090074 begin');
      const n: number = -18998;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-19'));
      expect(result).assertEqual('0-1:0-1:0-19');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('19'));
      expect(result.substring(result.length - 2)).assertEqual('19');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090074 end');
    })

    /**
     * @tc.name   testUtilVolume090075
     * @tc.number SUB_CCE_UTILV_09_0075
     * @tc.desc   n=-20002 负数经 floor 向下取整后格式化为 0-1:0-1:0-21
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090075 begin');
      const n: number = -20002;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-21'));
      expect(result).assertEqual('0-1:0-1:0-21');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('21'));
      expect(result.substring(result.length - 2)).assertEqual('21');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090075 end');
    })

    /**
     * @tc.name   testUtilVolume090076
     * @tc.number SUB_CCE_UTILV_09_0076
     * @tc.desc   n=-19998 负数经 floor 向下取整后格式化为 0-1:0-1:0-20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090076 begin');
      const n: number = -19998;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-20'));
      expect(result).assertEqual('0-1:0-1:0-20');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('20'));
      expect(result.substring(result.length - 2)).assertEqual('20');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090076 end');
    })

    /**
     * @tc.name   testUtilVolume090077
     * @tc.number SUB_CCE_UTILV_09_0077
     * @tc.desc   n=-60000 负数经 floor 向下取整后格式化为 0-1:0-1:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090077 begin');
      const n: number = -60000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:00'));
      expect(result).assertEqual('0-1:0-1:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090077 end');
    })

    /**
     * @tc.name   testUtilVolume090078
     * @tc.number SUB_CCE_UTILV_09_0078
     * @tc.desc   n=-120000 负数经 floor 向下取整后格式化为 0-1:0-2:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090078 begin');
      const n: number = -120000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-2:00'));
      expect(result).assertEqual('0-1:0-2:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090078 end');
    })

    /**
     * @tc.name   testUtilVolume090079
     * @tc.number SUB_CCE_UTILV_09_0079
     * @tc.desc   负百万级 -1000000/-1000001 产生 0-1:0-17:0-40/0-1:0-17:0-41 型混合符号输出（main 现状，仅记录）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume090079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090079 begin');
      const a: string = utils.convertTimeToFormatString(-1000000);
      const b: string = utils.convertTimeToFormatString(-1000001);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', a, '0-1:0-17:0-40');
      expect(a).assertEqual('0-1:0-17:0-40');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', b, '0-1:0-17:0-41');
      expect(b).assertEqual('0-1:0-17:0-41');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a !== b && a.split(':').length === 3));
      expect(a !== b && a.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume090079 end');
    })
  })
}
