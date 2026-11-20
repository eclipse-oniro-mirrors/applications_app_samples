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

export default function utilVolume05Test(): void {
  describe('UtilVolume05Test', () => {

    /**
     * @tc.name   testUtilVolume050001
     * @tc.number SUB_CCE_UTILV_05_0001
     * @tc.desc   n=-2 负数经 floor 向下取整后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050001 begin');
      const n: number = -2;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050001 end');
    })

    /**
     * @tc.name   testUtilVolume050002
     * @tc.number SUB_CCE_UTILV_05_0002
     * @tc.desc   n=-3 负数经 floor 向下取整后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050002 begin');
      const n: number = -3;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050002 end');
    })

    /**
     * @tc.name   testUtilVolume050003
     * @tc.number SUB_CCE_UTILV_05_0003
     * @tc.desc   n=-4 负数经 floor 向下取整后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050003 begin');
      const n: number = -4;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050003 end');
    })

    /**
     * @tc.name   testUtilVolume050004
     * @tc.number SUB_CCE_UTILV_05_0004
     * @tc.desc   n=-5 负数经 floor 向下取整后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050004 begin');
      const n: number = -5;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050004 end');
    })

    /**
     * @tc.name   testUtilVolume050005
     * @tc.number SUB_CCE_UTILV_05_0005
     * @tc.desc   n=-6 负数经 floor 向下取整后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050005 begin');
      const n: number = -6;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050005 end');
    })

    /**
     * @tc.name   testUtilVolume050006
     * @tc.number SUB_CCE_UTILV_05_0006
     * @tc.desc   n=-7 负数经 floor 向下取整后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050006 begin');
      const n: number = -7;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050006 end');
    })

    /**
     * @tc.name   testUtilVolume050007
     * @tc.number SUB_CCE_UTILV_05_0007
     * @tc.desc   n=-8 负数经 floor 向下取整后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050007 begin');
      const n: number = -8;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050007 end');
    })

    /**
     * @tc.name   testUtilVolume050008
     * @tc.number SUB_CCE_UTILV_05_0008
     * @tc.desc   n=-9 负数经 floor 向下取整后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050008 begin');
      const n: number = -9;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050008 end');
    })

    /**
     * @tc.name   testUtilVolume050009
     * @tc.number SUB_CCE_UTILV_05_0009
     * @tc.desc   n=-10 负数经 floor 向下取整后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050009 begin');
      const n: number = -10;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050009 end');
    })

    /**
     * @tc.name   testUtilVolume050010
     * @tc.number SUB_CCE_UTILV_05_0010
     * @tc.desc   n=-11 负数经 floor 向下取整后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050010 begin');
      const n: number = -11;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050010 end');
    })

    /**
     * @tc.name   testUtilVolume050011
     * @tc.number SUB_CCE_UTILV_05_0011
     * @tc.desc   n=-12 负数经 floor 向下取整后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050011 begin');
      const n: number = -12;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050011 end');
    })

    /**
     * @tc.name   testUtilVolume050012
     * @tc.number SUB_CCE_UTILV_05_0012
     * @tc.desc   n=-13 负数经 floor 向下取整后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050012 begin');
      const n: number = -13;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050012 end');
    })

    /**
     * @tc.name   testUtilVolume050013
     * @tc.number SUB_CCE_UTILV_05_0013
     * @tc.desc   n=-14 负数经 floor 向下取整后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050013 begin');
      const n: number = -14;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050013 end');
    })

    /**
     * @tc.name   testUtilVolume050014
     * @tc.number SUB_CCE_UTILV_05_0014
     * @tc.desc   n=-15 负数经 floor 向下取整后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050014 begin');
      const n: number = -15;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050014 end');
    })

    /**
     * @tc.name   testUtilVolume050015
     * @tc.number SUB_CCE_UTILV_05_0015
     * @tc.desc   n=-16 负数经 floor 向下取整后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050015 begin');
      const n: number = -16;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050015 end');
    })

    /**
     * @tc.name   testUtilVolume050016
     * @tc.number SUB_CCE_UTILV_05_0016
     * @tc.desc   n=-17 负数经 floor 向下取整后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050016 begin');
      const n: number = -17;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050016 end');
    })

    /**
     * @tc.name   testUtilVolume050017
     * @tc.number SUB_CCE_UTILV_05_0017
     * @tc.desc   n=-18 负数经 floor 向下取整后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050017 begin');
      const n: number = -18;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050017 end');
    })

    /**
     * @tc.name   testUtilVolume050018
     * @tc.number SUB_CCE_UTILV_05_0018
     * @tc.desc   n=-19 负数经 floor 向下取整后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050018 begin');
      const n: number = -19;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050018 end');
    })

    /**
     * @tc.name   testUtilVolume050019
     * @tc.number SUB_CCE_UTILV_05_0019
     * @tc.desc   n=-20 负数经 floor 向下取整后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050019 begin');
      const n: number = -20;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050019 end');
    })

    /**
     * @tc.name   testUtilVolume050020
     * @tc.number SUB_CCE_UTILV_05_0020
     * @tc.desc   n=-21 负数经 floor 向下取整后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050020 begin');
      const n: number = -21;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050020 end');
    })

    /**
     * @tc.name   testUtilVolume050021
     * @tc.number SUB_CCE_UTILV_05_0021
     * @tc.desc   n=-22 负数经 floor 向下取整后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050021 begin');
      const n: number = -22;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050021 end');
    })

    /**
     * @tc.name   testUtilVolume050022
     * @tc.number SUB_CCE_UTILV_05_0022
     * @tc.desc   n=-23 负数经 floor 向下取整后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050022 begin');
      const n: number = -23;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050022 end');
    })

    /**
     * @tc.name   testUtilVolume050023
     * @tc.number SUB_CCE_UTILV_05_0023
     * @tc.desc   n=-24 负数经 floor 向下取整后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050023 begin');
      const n: number = -24;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050023 end');
    })

    /**
     * @tc.name   testUtilVolume050024
     * @tc.number SUB_CCE_UTILV_05_0024
     * @tc.desc   n=-25 负数经 floor 向下取整后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050024 begin');
      const n: number = -25;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050024 end');
    })

    /**
     * @tc.name   testUtilVolume050025
     * @tc.number SUB_CCE_UTILV_05_0025
     * @tc.desc   n=-26 负数经 floor 向下取整后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050025 begin');
      const n: number = -26;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050025 end');
    })

    /**
     * @tc.name   testUtilVolume050026
     * @tc.number SUB_CCE_UTILV_05_0026
     * @tc.desc   n=-27 负数经 floor 向下取整后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050026 begin');
      const n: number = -27;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050026 end');
    })

    /**
     * @tc.name   testUtilVolume050027
     * @tc.number SUB_CCE_UTILV_05_0027
     * @tc.desc   n=-28 负数经 floor 向下取整后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050027 begin');
      const n: number = -28;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050027 end');
    })

    /**
     * @tc.name   testUtilVolume050028
     * @tc.number SUB_CCE_UTILV_05_0028
     * @tc.desc   n=-29 负数经 floor 向下取整后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050028 begin');
      const n: number = -29;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050028 end');
    })

    /**
     * @tc.name   testUtilVolume050029
     * @tc.number SUB_CCE_UTILV_05_0029
     * @tc.desc   n=-30 负数经 floor 向下取整后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050029 begin');
      const n: number = -30;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050029 end');
    })

    /**
     * @tc.name   testUtilVolume050030
     * @tc.number SUB_CCE_UTILV_05_0030
     * @tc.desc   n=-31 负数经 floor 向下取整后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050030 begin');
      const n: number = -31;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050030 end');
    })

    /**
     * @tc.name   testUtilVolume050031
     * @tc.number SUB_CCE_UTILV_05_0031
     * @tc.desc   n=-32 负数经 floor 向下取整后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050031 begin');
      const n: number = -32;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050031 end');
    })

    /**
     * @tc.name   testUtilVolume050032
     * @tc.number SUB_CCE_UTILV_05_0032
     * @tc.desc   n=-33 负数经 floor 向下取整后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050032 begin');
      const n: number = -33;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050032 end');
    })

    /**
     * @tc.name   testUtilVolume050033
     * @tc.number SUB_CCE_UTILV_05_0033
     * @tc.desc   n=-34 负数经 floor 向下取整后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050033 begin');
      const n: number = -34;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050033 end');
    })

    /**
     * @tc.name   testUtilVolume050034
     * @tc.number SUB_CCE_UTILV_05_0034
     * @tc.desc   n=-35 负数经 floor 向下取整后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050034 begin');
      const n: number = -35;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050034 end');
    })

    /**
     * @tc.name   testUtilVolume050035
     * @tc.number SUB_CCE_UTILV_05_0035
     * @tc.desc   n=-36 负数经 floor 向下取整后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050035 begin');
      const n: number = -36;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050035 end');
    })

    /**
     * @tc.name   testUtilVolume050036
     * @tc.number SUB_CCE_UTILV_05_0036
     * @tc.desc   n=-37 负数经 floor 向下取整后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050036 begin');
      const n: number = -37;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050036 end');
    })

    /**
     * @tc.name   testUtilVolume050037
     * @tc.number SUB_CCE_UTILV_05_0037
     * @tc.desc   n=-38 负数经 floor 向下取整后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050037 begin');
      const n: number = -38;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050037 end');
    })

    /**
     * @tc.name   testUtilVolume050038
     * @tc.number SUB_CCE_UTILV_05_0038
     * @tc.desc   n=-39 负数经 floor 向下取整后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050038 begin');
      const n: number = -39;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050038 end');
    })

    /**
     * @tc.name   testUtilVolume050039
     * @tc.number SUB_CCE_UTILV_05_0039
     * @tc.desc   n=-2001 负数经 floor 向下取整后格式化为 0-1:0-1:0-3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050039 begin');
      const n: number = -2001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-3'));
      expect(result).assertEqual('0-1:0-1:0-3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-3'));
      expect(result.substring(result.length - 2)).assertEqual('-3');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050039 end');
    })

    /**
     * @tc.name   testUtilVolume050040
     * @tc.number SUB_CCE_UTILV_05_0040
     * @tc.desc   n=-1999 负数经 floor 向下取整后格式化为 0-1:0-1:0-2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050040 begin');
      const n: number = -1999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-2'));
      expect(result).assertEqual('0-1:0-1:0-2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-2'));
      expect(result.substring(result.length - 2)).assertEqual('-2');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050040 end');
    })

    /**
     * @tc.name   testUtilVolume050041
     * @tc.number SUB_CCE_UTILV_05_0041
     * @tc.desc   n=-3001 负数经 floor 向下取整后格式化为 0-1:0-1:0-4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050041 begin');
      const n: number = -3001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-4'));
      expect(result).assertEqual('0-1:0-1:0-4');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-4'));
      expect(result.substring(result.length - 2)).assertEqual('-4');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050041 end');
    })

    /**
     * @tc.name   testUtilVolume050042
     * @tc.number SUB_CCE_UTILV_05_0042
     * @tc.desc   n=-2999 负数经 floor 向下取整后格式化为 0-1:0-1:0-3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050042 begin');
      const n: number = -2999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-3'));
      expect(result).assertEqual('0-1:0-1:0-3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-3'));
      expect(result.substring(result.length - 2)).assertEqual('-3');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050042 end');
    })

    /**
     * @tc.name   testUtilVolume050043
     * @tc.number SUB_CCE_UTILV_05_0043
     * @tc.desc   n=-4001 负数经 floor 向下取整后格式化为 0-1:0-1:0-5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050043 begin');
      const n: number = -4001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-5'));
      expect(result).assertEqual('0-1:0-1:0-5');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-5'));
      expect(result.substring(result.length - 2)).assertEqual('-5');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050043 end');
    })

    /**
     * @tc.name   testUtilVolume050044
     * @tc.number SUB_CCE_UTILV_05_0044
     * @tc.desc   n=-3999 负数经 floor 向下取整后格式化为 0-1:0-1:0-4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050044 begin');
      const n: number = -3999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-4'));
      expect(result).assertEqual('0-1:0-1:0-4');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-4'));
      expect(result.substring(result.length - 2)).assertEqual('-4');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050044 end');
    })

    /**
     * @tc.name   testUtilVolume050045
     * @tc.number SUB_CCE_UTILV_05_0045
     * @tc.desc   n=-5001 负数经 floor 向下取整后格式化为 0-1:0-1:0-6
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050045 begin');
      const n: number = -5001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-6'));
      expect(result).assertEqual('0-1:0-1:0-6');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-6'));
      expect(result.substring(result.length - 2)).assertEqual('-6');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050045 end');
    })

    /**
     * @tc.name   testUtilVolume050046
     * @tc.number SUB_CCE_UTILV_05_0046
     * @tc.desc   n=-4999 负数经 floor 向下取整后格式化为 0-1:0-1:0-5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050046 begin');
      const n: number = -4999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-5'));
      expect(result).assertEqual('0-1:0-1:0-5');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-5'));
      expect(result.substring(result.length - 2)).assertEqual('-5');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050046 end');
    })

    /**
     * @tc.name   testUtilVolume050047
     * @tc.number SUB_CCE_UTILV_05_0047
     * @tc.desc   n=-6001 负数经 floor 向下取整后格式化为 0-1:0-1:0-7
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050047 begin');
      const n: number = -6001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-7'));
      expect(result).assertEqual('0-1:0-1:0-7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-7'));
      expect(result.substring(result.length - 2)).assertEqual('-7');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050047 end');
    })

    /**
     * @tc.name   testUtilVolume050048
     * @tc.number SUB_CCE_UTILV_05_0048
     * @tc.desc   n=-5999 负数经 floor 向下取整后格式化为 0-1:0-1:0-6
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050048 begin');
      const n: number = -5999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-6'));
      expect(result).assertEqual('0-1:0-1:0-6');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-6'));
      expect(result.substring(result.length - 2)).assertEqual('-6');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050048 end');
    })

    /**
     * @tc.name   testUtilVolume050049
     * @tc.number SUB_CCE_UTILV_05_0049
     * @tc.desc   n=-7001 负数经 floor 向下取整后格式化为 0-1:0-1:0-8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050049 begin');
      const n: number = -7001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-8'));
      expect(result).assertEqual('0-1:0-1:0-8');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-8'));
      expect(result.substring(result.length - 2)).assertEqual('-8');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050049 end');
    })

    /**
     * @tc.name   testUtilVolume050050
     * @tc.number SUB_CCE_UTILV_05_0050
     * @tc.desc   n=-6999 负数经 floor 向下取整后格式化为 0-1:0-1:0-7
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050050 begin');
      const n: number = -6999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-7'));
      expect(result).assertEqual('0-1:0-1:0-7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-7'));
      expect(result.substring(result.length - 2)).assertEqual('-7');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050050 end');
    })

    /**
     * @tc.name   testUtilVolume050051
     * @tc.number SUB_CCE_UTILV_05_0051
     * @tc.desc   n=-8001 负数经 floor 向下取整后格式化为 0-1:0-1:0-9
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050051 begin');
      const n: number = -8001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-9'));
      expect(result).assertEqual('0-1:0-1:0-9');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-9'));
      expect(result.substring(result.length - 2)).assertEqual('-9');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050051 end');
    })

    /**
     * @tc.name   testUtilVolume050052
     * @tc.number SUB_CCE_UTILV_05_0052
     * @tc.desc   n=-7999 负数经 floor 向下取整后格式化为 0-1:0-1:0-8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050052 begin');
      const n: number = -7999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-8'));
      expect(result).assertEqual('0-1:0-1:0-8');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-8'));
      expect(result.substring(result.length - 2)).assertEqual('-8');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050052 end');
    })

    /**
     * @tc.name   testUtilVolume050053
     * @tc.number SUB_CCE_UTILV_05_0053
     * @tc.desc   n=-9001 负数经 floor 向下取整后格式化为 0-1:0-1:0-10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050053 begin');
      const n: number = -9001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-10'));
      expect(result).assertEqual('0-1:0-1:0-10');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('10'));
      expect(result.substring(result.length - 2)).assertEqual('10');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050053 end');
    })

    /**
     * @tc.name   testUtilVolume050054
     * @tc.number SUB_CCE_UTILV_05_0054
     * @tc.desc   n=-8999 负数经 floor 向下取整后格式化为 0-1:0-1:0-9
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050054 begin');
      const n: number = -8999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-9'));
      expect(result).assertEqual('0-1:0-1:0-9');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-9'));
      expect(result.substring(result.length - 2)).assertEqual('-9');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050054 end');
    })

    /**
     * @tc.name   testUtilVolume050055
     * @tc.number SUB_CCE_UTILV_05_0055
     * @tc.desc   n=-10001 负数经 floor 向下取整后格式化为 0-1:0-1:0-11
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050055 begin');
      const n: number = -10001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-11'));
      expect(result).assertEqual('0-1:0-1:0-11');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('11'));
      expect(result.substring(result.length - 2)).assertEqual('11');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050055 end');
    })

    /**
     * @tc.name   testUtilVolume050056
     * @tc.number SUB_CCE_UTILV_05_0056
     * @tc.desc   n=-9999 负数经 floor 向下取整后格式化为 0-1:0-1:0-10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050056 begin');
      const n: number = -9999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-10'));
      expect(result).assertEqual('0-1:0-1:0-10');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('10'));
      expect(result.substring(result.length - 2)).assertEqual('10');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050056 end');
    })

    /**
     * @tc.name   testUtilVolume050057
     * @tc.number SUB_CCE_UTILV_05_0057
     * @tc.desc   n=-11001 负数经 floor 向下取整后格式化为 0-1:0-1:0-12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050057 begin');
      const n: number = -11001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-12'));
      expect(result).assertEqual('0-1:0-1:0-12');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('12'));
      expect(result.substring(result.length - 2)).assertEqual('12');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050057 end');
    })

    /**
     * @tc.name   testUtilVolume050058
     * @tc.number SUB_CCE_UTILV_05_0058
     * @tc.desc   n=-10999 负数经 floor 向下取整后格式化为 0-1:0-1:0-11
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050058 begin');
      const n: number = -10999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-11'));
      expect(result).assertEqual('0-1:0-1:0-11');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('11'));
      expect(result.substring(result.length - 2)).assertEqual('11');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050058 end');
    })

    /**
     * @tc.name   testUtilVolume050059
     * @tc.number SUB_CCE_UTILV_05_0059
     * @tc.desc   n=-12001 负数经 floor 向下取整后格式化为 0-1:0-1:0-13
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050059 begin');
      const n: number = -12001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-13'));
      expect(result).assertEqual('0-1:0-1:0-13');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('13'));
      expect(result.substring(result.length - 2)).assertEqual('13');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050059 end');
    })

    /**
     * @tc.name   testUtilVolume050060
     * @tc.number SUB_CCE_UTILV_05_0060
     * @tc.desc   n=-11999 负数经 floor 向下取整后格式化为 0-1:0-1:0-12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050060 begin');
      const n: number = -11999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-12'));
      expect(result).assertEqual('0-1:0-1:0-12');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('12'));
      expect(result.substring(result.length - 2)).assertEqual('12');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050060 end');
    })

    /**
     * @tc.name   testUtilVolume050061
     * @tc.number SUB_CCE_UTILV_05_0061
     * @tc.desc   n=-13001 负数经 floor 向下取整后格式化为 0-1:0-1:0-14
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050061 begin');
      const n: number = -13001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-14'));
      expect(result).assertEqual('0-1:0-1:0-14');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('14'));
      expect(result.substring(result.length - 2)).assertEqual('14');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050061 end');
    })

    /**
     * @tc.name   testUtilVolume050062
     * @tc.number SUB_CCE_UTILV_05_0062
     * @tc.desc   n=-12999 负数经 floor 向下取整后格式化为 0-1:0-1:0-13
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050062 begin');
      const n: number = -12999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-13'));
      expect(result).assertEqual('0-1:0-1:0-13');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('13'));
      expect(result.substring(result.length - 2)).assertEqual('13');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050062 end');
    })

    /**
     * @tc.name   testUtilVolume050063
     * @tc.number SUB_CCE_UTILV_05_0063
     * @tc.desc   n=-14001 负数经 floor 向下取整后格式化为 0-1:0-1:0-15
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050063 begin');
      const n: number = -14001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-15'));
      expect(result).assertEqual('0-1:0-1:0-15');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('15'));
      expect(result.substring(result.length - 2)).assertEqual('15');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050063 end');
    })

    /**
     * @tc.name   testUtilVolume050064
     * @tc.number SUB_CCE_UTILV_05_0064
     * @tc.desc   n=-13999 负数经 floor 向下取整后格式化为 0-1:0-1:0-14
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050064 begin');
      const n: number = -13999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-14'));
      expect(result).assertEqual('0-1:0-1:0-14');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('14'));
      expect(result.substring(result.length - 2)).assertEqual('14');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050064 end');
    })

    /**
     * @tc.name   testUtilVolume050065
     * @tc.number SUB_CCE_UTILV_05_0065
     * @tc.desc   n=-15001 负数经 floor 向下取整后格式化为 0-1:0-1:0-16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050065 begin');
      const n: number = -15001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-16'));
      expect(result).assertEqual('0-1:0-1:0-16');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('16'));
      expect(result.substring(result.length - 2)).assertEqual('16');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050065 end');
    })

    /**
     * @tc.name   testUtilVolume050066
     * @tc.number SUB_CCE_UTILV_05_0066
     * @tc.desc   n=-14999 负数经 floor 向下取整后格式化为 0-1:0-1:0-15
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050066 begin');
      const n: number = -14999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-15'));
      expect(result).assertEqual('0-1:0-1:0-15');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('15'));
      expect(result.substring(result.length - 2)).assertEqual('15');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050066 end');
    })

    /**
     * @tc.name   testUtilVolume050067
     * @tc.number SUB_CCE_UTILV_05_0067
     * @tc.desc   n=-16001 负数经 floor 向下取整后格式化为 0-1:0-1:0-17
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050067 begin');
      const n: number = -16001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-17'));
      expect(result).assertEqual('0-1:0-1:0-17');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('17'));
      expect(result.substring(result.length - 2)).assertEqual('17');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050067 end');
    })

    /**
     * @tc.name   testUtilVolume050068
     * @tc.number SUB_CCE_UTILV_05_0068
     * @tc.desc   n=-15999 负数经 floor 向下取整后格式化为 0-1:0-1:0-16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050068 begin');
      const n: number = -15999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-16'));
      expect(result).assertEqual('0-1:0-1:0-16');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('16'));
      expect(result.substring(result.length - 2)).assertEqual('16');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050068 end');
    })

    /**
     * @tc.name   testUtilVolume050069
     * @tc.number SUB_CCE_UTILV_05_0069
     * @tc.desc   n=-17001 负数经 floor 向下取整后格式化为 0-1:0-1:0-18
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050069 begin');
      const n: number = -17001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-18'));
      expect(result).assertEqual('0-1:0-1:0-18');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('18'));
      expect(result.substring(result.length - 2)).assertEqual('18');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050069 end');
    })

    /**
     * @tc.name   testUtilVolume050070
     * @tc.number SUB_CCE_UTILV_05_0070
     * @tc.desc   n=-16999 负数经 floor 向下取整后格式化为 0-1:0-1:0-17
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050070 begin');
      const n: number = -16999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-17'));
      expect(result).assertEqual('0-1:0-1:0-17');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('17'));
      expect(result.substring(result.length - 2)).assertEqual('17');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050070 end');
    })

    /**
     * @tc.name   testUtilVolume050071
     * @tc.number SUB_CCE_UTILV_05_0071
     * @tc.desc   n=-18001 负数经 floor 向下取整后格式化为 0-1:0-1:0-19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050071 begin');
      const n: number = -18001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-19'));
      expect(result).assertEqual('0-1:0-1:0-19');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('19'));
      expect(result.substring(result.length - 2)).assertEqual('19');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050071 end');
    })

    /**
     * @tc.name   testUtilVolume050072
     * @tc.number SUB_CCE_UTILV_05_0072
     * @tc.desc   n=-17999 负数经 floor 向下取整后格式化为 0-1:0-1:0-18
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050072 begin');
      const n: number = -17999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-18'));
      expect(result).assertEqual('0-1:0-1:0-18');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('18'));
      expect(result.substring(result.length - 2)).assertEqual('18');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050072 end');
    })

    /**
     * @tc.name   testUtilVolume050073
     * @tc.number SUB_CCE_UTILV_05_0073
     * @tc.desc   n=-19001 负数经 floor 向下取整后格式化为 0-1:0-1:0-20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050073 begin');
      const n: number = -19001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-20'));
      expect(result).assertEqual('0-1:0-1:0-20');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('20'));
      expect(result.substring(result.length - 2)).assertEqual('20');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050073 end');
    })

    /**
     * @tc.name   testUtilVolume050074
     * @tc.number SUB_CCE_UTILV_05_0074
     * @tc.desc   n=-18999 负数经 floor 向下取整后格式化为 0-1:0-1:0-19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050074 begin');
      const n: number = -18999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-19'));
      expect(result).assertEqual('0-1:0-1:0-19');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('19'));
      expect(result.substring(result.length - 2)).assertEqual('19');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050074 end');
    })

    /**
     * @tc.name   testUtilVolume050075
     * @tc.number SUB_CCE_UTILV_05_0075
     * @tc.desc   n=-20001 负数经 floor 向下取整后格式化为 0-1:0-1:0-21
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050075 begin');
      const n: number = -20001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-21'));
      expect(result).assertEqual('0-1:0-1:0-21');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('21'));
      expect(result.substring(result.length - 2)).assertEqual('21');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050075 end');
    })

    /**
     * @tc.name   testUtilVolume050076
     * @tc.number SUB_CCE_UTILV_05_0076
     * @tc.desc   n=-19999 负数经 floor 向下取整后格式化为 0-1:0-1:0-20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050076 begin');
      const n: number = -19999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-20'));
      expect(result).assertEqual('0-1:0-1:0-20');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('20'));
      expect(result.substring(result.length - 2)).assertEqual('20');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050076 end');
    })

    /**
     * @tc.name   testUtilVolume050077
     * @tc.number SUB_CCE_UTILV_05_0077
     * @tc.desc   n=-99999 负数经 floor 向下取整后格式化为 0-1:0-2:0-40
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050077 begin');
      const n: number = -99999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-2:0-40'));
      expect(result).assertEqual('0-1:0-2:0-40');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('40'));
      expect(result.substring(result.length - 2)).assertEqual('40');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050077 end');
    })

    /**
     * @tc.name   testUtilVolume050078
     * @tc.number SUB_CCE_UTILV_05_0078
     * @tc.desc   n=-89999 负数经 floor 向下取整后格式化为 0-1:0-2:0-30
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050078 begin');
      const n: number = -89999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-2:0-30'));
      expect(result).assertEqual('0-1:0-2:0-30');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('30'));
      expect(result.substring(result.length - 2)).assertEqual('30');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050078 end');
    })

    /**
     * @tc.name   testUtilVolume050079
     * @tc.number SUB_CCE_UTILV_05_0079
     * @tc.desc   负数 -1000001 产生混合符号输出 0-1:0-17:0-41（main 现状，仅记录）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume050079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050079 begin');
      const negResult: string = utils.convertTimeToFormatString(-1000001);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', negResult, '0-1:0-17:0-41');
      expect(negResult).assertEqual('0-1:0-17:0-41');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(negResult.split(':').length === 3));
      expect(negResult.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(negResult.indexOf(':') > 0));
      expect(negResult.indexOf(':') > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume050079 end');
    })
  })
}
