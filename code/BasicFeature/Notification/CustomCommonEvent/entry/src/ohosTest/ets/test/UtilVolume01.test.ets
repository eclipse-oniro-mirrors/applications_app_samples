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

export default function utilVolume01Test(): void {
  describe('UtilVolume01Test', () => {

    /**
     * @tc.name   testUtilVolume010001
     * @tc.number SUB_CCE_UTILV_01_0001
     * @tc.desc   n=0 按 floor 截断到秒后格式化为 00:00:00
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010001 begin');
      const result: string = utils.convertTimeToFormatString(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:00'));
      expect(result).assertEqual('00:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010001 end');
    })

    /**
     * @tc.name   testUtilVolume010002
     * @tc.number SUB_CCE_UTILV_01_0002
     * @tc.desc   n=1000 按 floor 截断到秒后格式化为 00:00:01
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010002 begin');
      const result: string = utils.convertTimeToFormatString(1000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:01'));
      expect(result).assertEqual('00:00:01');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('01'));
      expect(result.substring(result.length - 2)).assertEqual('01');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010002 end');
    })

    /**
     * @tc.name   testUtilVolume010003
     * @tc.number SUB_CCE_UTILV_01_0003
     * @tc.desc   n=2000 按 floor 截断到秒后格式化为 00:00:02
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010003 begin');
      const result: string = utils.convertTimeToFormatString(2000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:02'));
      expect(result).assertEqual('00:00:02');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('02'));
      expect(result.substring(result.length - 2)).assertEqual('02');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010003 end');
    })

    /**
     * @tc.name   testUtilVolume010004
     * @tc.number SUB_CCE_UTILV_01_0004
     * @tc.desc   n=3000 按 floor 截断到秒后格式化为 00:00:03
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010004 begin');
      const result: string = utils.convertTimeToFormatString(3000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:03'));
      expect(result).assertEqual('00:00:03');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('03'));
      expect(result.substring(result.length - 2)).assertEqual('03');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010004 end');
    })

    /**
     * @tc.name   testUtilVolume010005
     * @tc.number SUB_CCE_UTILV_01_0005
     * @tc.desc   n=4000 按 floor 截断到秒后格式化为 00:00:04
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010005 begin');
      const result: string = utils.convertTimeToFormatString(4000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:04'));
      expect(result).assertEqual('00:00:04');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('04'));
      expect(result.substring(result.length - 2)).assertEqual('04');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010005 end');
    })

    /**
     * @tc.name   testUtilVolume010006
     * @tc.number SUB_CCE_UTILV_01_0006
     * @tc.desc   n=5000 按 floor 截断到秒后格式化为 00:00:05
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010006 begin');
      const result: string = utils.convertTimeToFormatString(5000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:05'));
      expect(result).assertEqual('00:00:05');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('05'));
      expect(result.substring(result.length - 2)).assertEqual('05');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010006 end');
    })

    /**
     * @tc.name   testUtilVolume010007
     * @tc.number SUB_CCE_UTILV_01_0007
     * @tc.desc   n=6000 按 floor 截断到秒后格式化为 00:00:06
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010007 begin');
      const result: string = utils.convertTimeToFormatString(6000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:06'));
      expect(result).assertEqual('00:00:06');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('06'));
      expect(result.substring(result.length - 2)).assertEqual('06');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010007 end');
    })

    /**
     * @tc.name   testUtilVolume010008
     * @tc.number SUB_CCE_UTILV_01_0008
     * @tc.desc   n=7000 按 floor 截断到秒后格式化为 00:00:07
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010008 begin');
      const result: string = utils.convertTimeToFormatString(7000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:07'));
      expect(result).assertEqual('00:00:07');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('07'));
      expect(result.substring(result.length - 2)).assertEqual('07');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010008 end');
    })

    /**
     * @tc.name   testUtilVolume010009
     * @tc.number SUB_CCE_UTILV_01_0009
     * @tc.desc   n=8000 按 floor 截断到秒后格式化为 00:00:08
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010009 begin');
      const result: string = utils.convertTimeToFormatString(8000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:08'));
      expect(result).assertEqual('00:00:08');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('08'));
      expect(result.substring(result.length - 2)).assertEqual('08');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010009 end');
    })

    /**
     * @tc.name   testUtilVolume010010
     * @tc.number SUB_CCE_UTILV_01_0010
     * @tc.desc   n=9000 按 floor 截断到秒后格式化为 00:00:09
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010010 begin');
      const result: string = utils.convertTimeToFormatString(9000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:09'));
      expect(result).assertEqual('00:00:09');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('09'));
      expect(result.substring(result.length - 2)).assertEqual('09');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010010 end');
    })

    /**
     * @tc.name   testUtilVolume010011
     * @tc.number SUB_CCE_UTILV_01_0011
     * @tc.desc   n=10000 按 floor 截断到秒后格式化为 00:00:10
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010011 begin');
      const result: string = utils.convertTimeToFormatString(10000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:10'));
      expect(result).assertEqual('00:00:10');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('10'));
      expect(result.substring(result.length - 2)).assertEqual('10');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010011 end');
    })

    /**
     * @tc.name   testUtilVolume010012
     * @tc.number SUB_CCE_UTILV_01_0012
     * @tc.desc   n=11000 按 floor 截断到秒后格式化为 00:00:11
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010012 begin');
      const result: string = utils.convertTimeToFormatString(11000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:11'));
      expect(result).assertEqual('00:00:11');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('11'));
      expect(result.substring(result.length - 2)).assertEqual('11');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010012 end');
    })

    /**
     * @tc.name   testUtilVolume010013
     * @tc.number SUB_CCE_UTILV_01_0013
     * @tc.desc   n=12000 按 floor 截断到秒后格式化为 00:00:12
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010013 begin');
      const result: string = utils.convertTimeToFormatString(12000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:12'));
      expect(result).assertEqual('00:00:12');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('12'));
      expect(result.substring(result.length - 2)).assertEqual('12');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010013 end');
    })

    /**
     * @tc.name   testUtilVolume010014
     * @tc.number SUB_CCE_UTILV_01_0014
     * @tc.desc   n=13000 按 floor 截断到秒后格式化为 00:00:13
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010014 begin');
      const result: string = utils.convertTimeToFormatString(13000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:13'));
      expect(result).assertEqual('00:00:13');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('13'));
      expect(result.substring(result.length - 2)).assertEqual('13');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010014 end');
    })

    /**
     * @tc.name   testUtilVolume010015
     * @tc.number SUB_CCE_UTILV_01_0015
     * @tc.desc   n=14000 按 floor 截断到秒后格式化为 00:00:14
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010015 begin');
      const result: string = utils.convertTimeToFormatString(14000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:14'));
      expect(result).assertEqual('00:00:14');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('14'));
      expect(result.substring(result.length - 2)).assertEqual('14');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010015 end');
    })

    /**
     * @tc.name   testUtilVolume010016
     * @tc.number SUB_CCE_UTILV_01_0016
     * @tc.desc   n=15000 按 floor 截断到秒后格式化为 00:00:15
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010016 begin');
      const result: string = utils.convertTimeToFormatString(15000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:15'));
      expect(result).assertEqual('00:00:15');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('15'));
      expect(result.substring(result.length - 2)).assertEqual('15');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010016 end');
    })

    /**
     * @tc.name   testUtilVolume010017
     * @tc.number SUB_CCE_UTILV_01_0017
     * @tc.desc   n=16000 按 floor 截断到秒后格式化为 00:00:16
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010017 begin');
      const result: string = utils.convertTimeToFormatString(16000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:16'));
      expect(result).assertEqual('00:00:16');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('16'));
      expect(result.substring(result.length - 2)).assertEqual('16');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010017 end');
    })

    /**
     * @tc.name   testUtilVolume010018
     * @tc.number SUB_CCE_UTILV_01_0018
     * @tc.desc   n=17000 按 floor 截断到秒后格式化为 00:00:17
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010018 begin');
      const result: string = utils.convertTimeToFormatString(17000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:17'));
      expect(result).assertEqual('00:00:17');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('17'));
      expect(result.substring(result.length - 2)).assertEqual('17');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010018 end');
    })

    /**
     * @tc.name   testUtilVolume010019
     * @tc.number SUB_CCE_UTILV_01_0019
     * @tc.desc   n=18000 按 floor 截断到秒后格式化为 00:00:18
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010019 begin');
      const result: string = utils.convertTimeToFormatString(18000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:18'));
      expect(result).assertEqual('00:00:18');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('18'));
      expect(result.substring(result.length - 2)).assertEqual('18');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010019 end');
    })

    /**
     * @tc.name   testUtilVolume010020
     * @tc.number SUB_CCE_UTILV_01_0020
     * @tc.desc   n=19000 按 floor 截断到秒后格式化为 00:00:19
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010020 begin');
      const result: string = utils.convertTimeToFormatString(19000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:19'));
      expect(result).assertEqual('00:00:19');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('19'));
      expect(result.substring(result.length - 2)).assertEqual('19');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010020 end');
    })

    /**
     * @tc.name   testUtilVolume010021
     * @tc.number SUB_CCE_UTILV_01_0021
     * @tc.desc   n=20000 按 floor 截断到秒后格式化为 00:00:20
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010021 begin');
      const result: string = utils.convertTimeToFormatString(20000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:20'));
      expect(result).assertEqual('00:00:20');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('20'));
      expect(result.substring(result.length - 2)).assertEqual('20');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010021 end');
    })

    /**
     * @tc.name   testUtilVolume010022
     * @tc.number SUB_CCE_UTILV_01_0022
     * @tc.desc   n=21000 按 floor 截断到秒后格式化为 00:00:21
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010022 begin');
      const result: string = utils.convertTimeToFormatString(21000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:21'));
      expect(result).assertEqual('00:00:21');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('21'));
      expect(result.substring(result.length - 2)).assertEqual('21');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010022 end');
    })

    /**
     * @tc.name   testUtilVolume010023
     * @tc.number SUB_CCE_UTILV_01_0023
     * @tc.desc   n=22000 按 floor 截断到秒后格式化为 00:00:22
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010023 begin');
      const result: string = utils.convertTimeToFormatString(22000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:22'));
      expect(result).assertEqual('00:00:22');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('22'));
      expect(result.substring(result.length - 2)).assertEqual('22');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010023 end');
    })

    /**
     * @tc.name   testUtilVolume010024
     * @tc.number SUB_CCE_UTILV_01_0024
     * @tc.desc   n=23000 按 floor 截断到秒后格式化为 00:00:23
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010024 begin');
      const result: string = utils.convertTimeToFormatString(23000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:23'));
      expect(result).assertEqual('00:00:23');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('23'));
      expect(result.substring(result.length - 2)).assertEqual('23');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010024 end');
    })

    /**
     * @tc.name   testUtilVolume010025
     * @tc.number SUB_CCE_UTILV_01_0025
     * @tc.desc   n=24000 按 floor 截断到秒后格式化为 00:00:24
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010025 begin');
      const result: string = utils.convertTimeToFormatString(24000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:24'));
      expect(result).assertEqual('00:00:24');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('24'));
      expect(result.substring(result.length - 2)).assertEqual('24');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010025 end');
    })

    /**
     * @tc.name   testUtilVolume010026
     * @tc.number SUB_CCE_UTILV_01_0026
     * @tc.desc   n=25000 按 floor 截断到秒后格式化为 00:00:25
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010026 begin');
      const result: string = utils.convertTimeToFormatString(25000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:25'));
      expect(result).assertEqual('00:00:25');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('25'));
      expect(result.substring(result.length - 2)).assertEqual('25');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010026 end');
    })

    /**
     * @tc.name   testUtilVolume010027
     * @tc.number SUB_CCE_UTILV_01_0027
     * @tc.desc   n=26000 按 floor 截断到秒后格式化为 00:00:26
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010027 begin');
      const result: string = utils.convertTimeToFormatString(26000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:26'));
      expect(result).assertEqual('00:00:26');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('26'));
      expect(result.substring(result.length - 2)).assertEqual('26');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010027 end');
    })

    /**
     * @tc.name   testUtilVolume010028
     * @tc.number SUB_CCE_UTILV_01_0028
     * @tc.desc   n=27000 按 floor 截断到秒后格式化为 00:00:27
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010028 begin');
      const result: string = utils.convertTimeToFormatString(27000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:27'));
      expect(result).assertEqual('00:00:27');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('27'));
      expect(result.substring(result.length - 2)).assertEqual('27');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010028 end');
    })

    /**
     * @tc.name   testUtilVolume010029
     * @tc.number SUB_CCE_UTILV_01_0029
     * @tc.desc   n=28000 按 floor 截断到秒后格式化为 00:00:28
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010029 begin');
      const result: string = utils.convertTimeToFormatString(28000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:28'));
      expect(result).assertEqual('00:00:28');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('28'));
      expect(result.substring(result.length - 2)).assertEqual('28');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010029 end');
    })

    /**
     * @tc.name   testUtilVolume010030
     * @tc.number SUB_CCE_UTILV_01_0030
     * @tc.desc   n=29000 按 floor 截断到秒后格式化为 00:00:29
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010030 begin');
      const result: string = utils.convertTimeToFormatString(29000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:29'));
      expect(result).assertEqual('00:00:29');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('29'));
      expect(result.substring(result.length - 2)).assertEqual('29');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010030 end');
    })

    /**
     * @tc.name   testUtilVolume010031
     * @tc.number SUB_CCE_UTILV_01_0031
     * @tc.desc   n=30000 按 floor 截断到秒后格式化为 00:00:30
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010031 begin');
      const result: string = utils.convertTimeToFormatString(30000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:30'));
      expect(result).assertEqual('00:00:30');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('30'));
      expect(result.substring(result.length - 2)).assertEqual('30');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010031 end');
    })

    /**
     * @tc.name   testUtilVolume010032
     * @tc.number SUB_CCE_UTILV_01_0032
     * @tc.desc   n=31000 按 floor 截断到秒后格式化为 00:00:31
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010032 begin');
      const result: string = utils.convertTimeToFormatString(31000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:31'));
      expect(result).assertEqual('00:00:31');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('31'));
      expect(result.substring(result.length - 2)).assertEqual('31');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010032 end');
    })

    /**
     * @tc.name   testUtilVolume010033
     * @tc.number SUB_CCE_UTILV_01_0033
     * @tc.desc   n=32000 按 floor 截断到秒后格式化为 00:00:32
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010033 begin');
      const result: string = utils.convertTimeToFormatString(32000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:32'));
      expect(result).assertEqual('00:00:32');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('32'));
      expect(result.substring(result.length - 2)).assertEqual('32');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010033 end');
    })

    /**
     * @tc.name   testUtilVolume010034
     * @tc.number SUB_CCE_UTILV_01_0034
     * @tc.desc   n=33000 按 floor 截断到秒后格式化为 00:00:33
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010034 begin');
      const result: string = utils.convertTimeToFormatString(33000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:33'));
      expect(result).assertEqual('00:00:33');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('33'));
      expect(result.substring(result.length - 2)).assertEqual('33');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010034 end');
    })

    /**
     * @tc.name   testUtilVolume010035
     * @tc.number SUB_CCE_UTILV_01_0035
     * @tc.desc   n=34000 按 floor 截断到秒后格式化为 00:00:34
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010035 begin');
      const result: string = utils.convertTimeToFormatString(34000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:34'));
      expect(result).assertEqual('00:00:34');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('34'));
      expect(result.substring(result.length - 2)).assertEqual('34');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010035 end');
    })

    /**
     * @tc.name   testUtilVolume010036
     * @tc.number SUB_CCE_UTILV_01_0036
     * @tc.desc   n=35000 按 floor 截断到秒后格式化为 00:00:35
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010036 begin');
      const result: string = utils.convertTimeToFormatString(35000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:35'));
      expect(result).assertEqual('00:00:35');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('35'));
      expect(result.substring(result.length - 2)).assertEqual('35');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010036 end');
    })

    /**
     * @tc.name   testUtilVolume010037
     * @tc.number SUB_CCE_UTILV_01_0037
     * @tc.desc   n=36000 按 floor 截断到秒后格式化为 00:00:36
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010037 begin');
      const result: string = utils.convertTimeToFormatString(36000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:36'));
      expect(result).assertEqual('00:00:36');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('36'));
      expect(result.substring(result.length - 2)).assertEqual('36');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010037 end');
    })

    /**
     * @tc.name   testUtilVolume010038
     * @tc.number SUB_CCE_UTILV_01_0038
     * @tc.desc   n=37000 按 floor 截断到秒后格式化为 00:00:37
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010038 begin');
      const result: string = utils.convertTimeToFormatString(37000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:37'));
      expect(result).assertEqual('00:00:37');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('37'));
      expect(result.substring(result.length - 2)).assertEqual('37');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010038 end');
    })

    /**
     * @tc.name   testUtilVolume010039
     * @tc.number SUB_CCE_UTILV_01_0039
     * @tc.desc   n=38000 按 floor 截断到秒后格式化为 00:00:38
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010039 begin');
      const result: string = utils.convertTimeToFormatString(38000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:38'));
      expect(result).assertEqual('00:00:38');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('38'));
      expect(result.substring(result.length - 2)).assertEqual('38');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010039 end');
    })

    /**
     * @tc.name   testUtilVolume010040
     * @tc.number SUB_CCE_UTILV_01_0040
     * @tc.desc   n=39000 按 floor 截断到秒后格式化为 00:00:39
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010040 begin');
      const result: string = utils.convertTimeToFormatString(39000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:39'));
      expect(result).assertEqual('00:00:39');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('39'));
      expect(result.substring(result.length - 2)).assertEqual('39');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010040 end');
    })

    /**
     * @tc.name   testUtilVolume010041
     * @tc.number SUB_CCE_UTILV_01_0041
     * @tc.desc   n=40000 按 floor 截断到秒后格式化为 00:00:40
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010041 begin');
      const result: string = utils.convertTimeToFormatString(40000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:40'));
      expect(result).assertEqual('00:00:40');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('40'));
      expect(result.substring(result.length - 2)).assertEqual('40');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010041 end');
    })

    /**
     * @tc.name   testUtilVolume010042
     * @tc.number SUB_CCE_UTILV_01_0042
     * @tc.desc   n=41000 按 floor 截断到秒后格式化为 00:00:41
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010042 begin');
      const result: string = utils.convertTimeToFormatString(41000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:41'));
      expect(result).assertEqual('00:00:41');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('41'));
      expect(result.substring(result.length - 2)).assertEqual('41');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010042 end');
    })

    /**
     * @tc.name   testUtilVolume010043
     * @tc.number SUB_CCE_UTILV_01_0043
     * @tc.desc   n=42000 按 floor 截断到秒后格式化为 00:00:42
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010043 begin');
      const result: string = utils.convertTimeToFormatString(42000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:42'));
      expect(result).assertEqual('00:00:42');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('42'));
      expect(result.substring(result.length - 2)).assertEqual('42');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010043 end');
    })

    /**
     * @tc.name   testUtilVolume010044
     * @tc.number SUB_CCE_UTILV_01_0044
     * @tc.desc   n=43000 按 floor 截断到秒后格式化为 00:00:43
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010044 begin');
      const result: string = utils.convertTimeToFormatString(43000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:43'));
      expect(result).assertEqual('00:00:43');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('43'));
      expect(result.substring(result.length - 2)).assertEqual('43');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010044 end');
    })

    /**
     * @tc.name   testUtilVolume010045
     * @tc.number SUB_CCE_UTILV_01_0045
     * @tc.desc   n=44000 按 floor 截断到秒后格式化为 00:00:44
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010045 begin');
      const result: string = utils.convertTimeToFormatString(44000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:44'));
      expect(result).assertEqual('00:00:44');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('44'));
      expect(result.substring(result.length - 2)).assertEqual('44');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010045 end');
    })

    /**
     * @tc.name   testUtilVolume010046
     * @tc.number SUB_CCE_UTILV_01_0046
     * @tc.desc   n=45000 按 floor 截断到秒后格式化为 00:00:45
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010046 begin');
      const result: string = utils.convertTimeToFormatString(45000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:45'));
      expect(result).assertEqual('00:00:45');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('45'));
      expect(result.substring(result.length - 2)).assertEqual('45');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010046 end');
    })

    /**
     * @tc.name   testUtilVolume010047
     * @tc.number SUB_CCE_UTILV_01_0047
     * @tc.desc   n=46000 按 floor 截断到秒后格式化为 00:00:46
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010047 begin');
      const result: string = utils.convertTimeToFormatString(46000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:46'));
      expect(result).assertEqual('00:00:46');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('46'));
      expect(result.substring(result.length - 2)).assertEqual('46');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010047 end');
    })

    /**
     * @tc.name   testUtilVolume010048
     * @tc.number SUB_CCE_UTILV_01_0048
     * @tc.desc   n=47000 按 floor 截断到秒后格式化为 00:00:47
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010048 begin');
      const result: string = utils.convertTimeToFormatString(47000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:47'));
      expect(result).assertEqual('00:00:47');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('47'));
      expect(result.substring(result.length - 2)).assertEqual('47');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010048 end');
    })

    /**
     * @tc.name   testUtilVolume010049
     * @tc.number SUB_CCE_UTILV_01_0049
     * @tc.desc   n=48000 按 floor 截断到秒后格式化为 00:00:48
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010049 begin');
      const result: string = utils.convertTimeToFormatString(48000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:48'));
      expect(result).assertEqual('00:00:48');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('48'));
      expect(result.substring(result.length - 2)).assertEqual('48');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010049 end');
    })

    /**
     * @tc.name   testUtilVolume010050
     * @tc.number SUB_CCE_UTILV_01_0050
     * @tc.desc   n=49000 按 floor 截断到秒后格式化为 00:00:49
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010050 begin');
      const result: string = utils.convertTimeToFormatString(49000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:49'));
      expect(result).assertEqual('00:00:49');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('49'));
      expect(result.substring(result.length - 2)).assertEqual('49');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010050 end');
    })

    /**
     * @tc.name   testUtilVolume010051
     * @tc.number SUB_CCE_UTILV_01_0051
     * @tc.desc   n=50000 按 floor 截断到秒后格式化为 00:00:50
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010051 begin');
      const result: string = utils.convertTimeToFormatString(50000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:50'));
      expect(result).assertEqual('00:00:50');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('50'));
      expect(result.substring(result.length - 2)).assertEqual('50');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010051 end');
    })

    /**
     * @tc.name   testUtilVolume010052
     * @tc.number SUB_CCE_UTILV_01_0052
     * @tc.desc   n=51000 按 floor 截断到秒后格式化为 00:00:51
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010052 begin');
      const result: string = utils.convertTimeToFormatString(51000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:51'));
      expect(result).assertEqual('00:00:51');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('51'));
      expect(result.substring(result.length - 2)).assertEqual('51');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010052 end');
    })

    /**
     * @tc.name   testUtilVolume010053
     * @tc.number SUB_CCE_UTILV_01_0053
     * @tc.desc   n=52000 按 floor 截断到秒后格式化为 00:00:52
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010053 begin');
      const result: string = utils.convertTimeToFormatString(52000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:52'));
      expect(result).assertEqual('00:00:52');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('52'));
      expect(result.substring(result.length - 2)).assertEqual('52');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010053 end');
    })

    /**
     * @tc.name   testUtilVolume010054
     * @tc.number SUB_CCE_UTILV_01_0054
     * @tc.desc   n=53000 按 floor 截断到秒后格式化为 00:00:53
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010054 begin');
      const result: string = utils.convertTimeToFormatString(53000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:53'));
      expect(result).assertEqual('00:00:53');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('53'));
      expect(result.substring(result.length - 2)).assertEqual('53');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010054 end');
    })

    /**
     * @tc.name   testUtilVolume010055
     * @tc.number SUB_CCE_UTILV_01_0055
     * @tc.desc   n=54000 按 floor 截断到秒后格式化为 00:00:54
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010055 begin');
      const result: string = utils.convertTimeToFormatString(54000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:54'));
      expect(result).assertEqual('00:00:54');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('54'));
      expect(result.substring(result.length - 2)).assertEqual('54');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010055 end');
    })

    /**
     * @tc.name   testUtilVolume010056
     * @tc.number SUB_CCE_UTILV_01_0056
     * @tc.desc   n=55000 按 floor 截断到秒后格式化为 00:00:55
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010056 begin');
      const result: string = utils.convertTimeToFormatString(55000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:55'));
      expect(result).assertEqual('00:00:55');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('55'));
      expect(result.substring(result.length - 2)).assertEqual('55');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010056 end');
    })

    /**
     * @tc.name   testUtilVolume010057
     * @tc.number SUB_CCE_UTILV_01_0057
     * @tc.desc   n=56000 按 floor 截断到秒后格式化为 00:00:56
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010057 begin');
      const result: string = utils.convertTimeToFormatString(56000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:56'));
      expect(result).assertEqual('00:00:56');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('56'));
      expect(result.substring(result.length - 2)).assertEqual('56');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010057 end');
    })

    /**
     * @tc.name   testUtilVolume010058
     * @tc.number SUB_CCE_UTILV_01_0058
     * @tc.desc   n=57000 按 floor 截断到秒后格式化为 00:00:57
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010058 begin');
      const result: string = utils.convertTimeToFormatString(57000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:57'));
      expect(result).assertEqual('00:00:57');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('57'));
      expect(result.substring(result.length - 2)).assertEqual('57');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010058 end');
    })

    /**
     * @tc.name   testUtilVolume010059
     * @tc.number SUB_CCE_UTILV_01_0059
     * @tc.desc   n=58000 按 floor 截断到秒后格式化为 00:00:58
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010059 begin');
      const result: string = utils.convertTimeToFormatString(58000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:58'));
      expect(result).assertEqual('00:00:58');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('58'));
      expect(result.substring(result.length - 2)).assertEqual('58');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010059 end');
    })

    /**
     * @tc.name   testUtilVolume010060
     * @tc.number SUB_CCE_UTILV_01_0060
     * @tc.desc   n=59000 按 floor 截断到秒后格式化为 00:00:59
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010060 begin');
      const result: string = utils.convertTimeToFormatString(59000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:59'));
      expect(result).assertEqual('00:00:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010060 end');
    })

    /**
     * @tc.name   testUtilVolume010061
     * @tc.number SUB_CCE_UTILV_01_0061
     * @tc.desc   n=999 按 floor 截断到秒后格式化为 00:00:00
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010061 begin');
      const result: string = utils.convertTimeToFormatString(999);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:00'));
      expect(result).assertEqual('00:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010061 end');
    })

    /**
     * @tc.name   testUtilVolume010062
     * @tc.number SUB_CCE_UTILV_01_0062
     * @tc.desc   n=1500 按 floor 截断到秒后格式化为 00:00:01
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010062 begin');
      const result: string = utils.convertTimeToFormatString(1500);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:01'));
      expect(result).assertEqual('00:00:01');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('01'));
      expect(result.substring(result.length - 2)).assertEqual('01');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010062 end');
    })

    /**
     * @tc.name   testUtilVolume010063
     * @tc.number SUB_CCE_UTILV_01_0063
     * @tc.desc   n=2500 按 floor 截断到秒后格式化为 00:00:02
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010063 begin');
      const result: string = utils.convertTimeToFormatString(2500);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:02'));
      expect(result).assertEqual('00:00:02');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('02'));
      expect(result.substring(result.length - 2)).assertEqual('02');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010063 end');
    })

    /**
     * @tc.name   testUtilVolume010064
     * @tc.number SUB_CCE_UTILV_01_0064
     * @tc.desc   n=59999 按 floor 截断到秒后格式化为 00:00:59
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010064 begin');
      const result: string = utils.convertTimeToFormatString(59999);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:59'));
      expect(result).assertEqual('00:00:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010064 end');
    })

    /**
     * @tc.name   testUtilVolume010065
     * @tc.number SUB_CCE_UTILV_01_0065
     * @tc.desc   n=60001 按 floor 截断到秒后格式化为 00:01:00
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010065 begin');
      const result: string = utils.convertTimeToFormatString(60001);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:01:00'));
      expect(result).assertEqual('00:01:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010065 end');
    })

    /**
     * @tc.name   testUtilVolume010066
     * @tc.number SUB_CCE_UTILV_01_0066
     * @tc.desc   n=60000 按 floor 截断到秒后格式化为 00:01:00
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010066 begin');
      const result: string = utils.convertTimeToFormatString(60000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:01:00'));
      expect(result).assertEqual('00:01:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010066 end');
    })

    /**
     * @tc.name   testUtilVolume010067
     * @tc.number SUB_CCE_UTILV_01_0067
     * @tc.desc   n=67000 按 floor 截断到秒后格式化为 00:01:07
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010067 begin');
      const result: string = utils.convertTimeToFormatString(67000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:01:07'));
      expect(result).assertEqual('00:01:07');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('07'));
      expect(result.substring(result.length - 2)).assertEqual('07');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010067 end');
    })

    /**
     * @tc.name   testUtilVolume010068
     * @tc.number SUB_CCE_UTILV_01_0068
     * @tc.desc   n=119000 按 floor 截断到秒后格式化为 00:01:59
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010068 begin');
      const result: string = utils.convertTimeToFormatString(119000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:01:59'));
      expect(result).assertEqual('00:01:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010068 end');
    })

    /**
     * @tc.name   testUtilVolume010069
     * @tc.number SUB_CCE_UTILV_01_0069
     * @tc.desc   n=420000 按 floor 截断到秒后格式化为 00:07:00
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010069 begin');
      const result: string = utils.convertTimeToFormatString(420000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:07:00'));
      expect(result).assertEqual('00:07:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010069 end');
    })

    /**
     * @tc.name   testUtilVolume010070
     * @tc.number SUB_CCE_UTILV_01_0070
     * @tc.desc   n=427000 按 floor 截断到秒后格式化为 00:07:07
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010070 begin');
      const result: string = utils.convertTimeToFormatString(427000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:07:07'));
      expect(result).assertEqual('00:07:07');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('07'));
      expect(result.substring(result.length - 2)).assertEqual('07');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010070 end');
    })

    /**
     * @tc.name   testUtilVolume010071
     * @tc.number SUB_CCE_UTILV_01_0071
     * @tc.desc   n=479000 按 floor 截断到秒后格式化为 00:07:59
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010071 begin');
      const result: string = utils.convertTimeToFormatString(479000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:07:59'));
      expect(result).assertEqual('00:07:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010071 end');
    })

    /**
     * @tc.name   testUtilVolume010072
     * @tc.number SUB_CCE_UTILV_01_0072
     * @tc.desc   n=3540000 按 floor 截断到秒后格式化为 00:59:00
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010072 begin');
      const result: string = utils.convertTimeToFormatString(3540000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:59:00'));
      expect(result).assertEqual('00:59:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010072 end');
    })

    /**
     * @tc.name   testUtilVolume010073
     * @tc.number SUB_CCE_UTILV_01_0073
     * @tc.desc   n=3547000 按 floor 截断到秒后格式化为 00:59:07
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010073 begin');
      const result: string = utils.convertTimeToFormatString(3547000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:59:07'));
      expect(result).assertEqual('00:59:07');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('07'));
      expect(result.substring(result.length - 2)).assertEqual('07');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010073 end');
    })

    /**
     * @tc.name   testUtilVolume010074
     * @tc.number SUB_CCE_UTILV_01_0074
     * @tc.desc   n=3599000 按 floor 截断到秒后格式化为 00:59:59
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010074 begin');
      const result: string = utils.convertTimeToFormatString(3599000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:59:59'));
      expect(result).assertEqual('00:59:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010074 end');
    })

    /**
     * @tc.name   testUtilVolume010075
     * @tc.number SUB_CCE_UTILV_01_0075
     * @tc.desc   n=3600000 按 floor 截断到秒后格式化为 01:00:00
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010075 begin');
      const result: string = utils.convertTimeToFormatString(3600000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('01:00:00'));
      expect(result).assertEqual('01:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010075 end');
    })

    /**
     * @tc.name   testUtilVolume010076
     * @tc.number SUB_CCE_UTILV_01_0076
     * @tc.desc   n=3659000 按 floor 截断到秒后格式化为 01:00:59
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010076 begin');
      const result: string = utils.convertTimeToFormatString(3659000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('01:00:59'));
      expect(result).assertEqual('01:00:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010076 end');
    })

    /**
     * @tc.name   testUtilVolume010077
     * @tc.number SUB_CCE_UTILV_01_0077
     * @tc.desc   n=4020000 按 floor 截断到秒后格式化为 01:07:00
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010077 begin');
      const result: string = utils.convertTimeToFormatString(4020000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('01:07:00'));
      expect(result).assertEqual('01:07:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010077 end');
    })

    /**
     * @tc.name   testUtilVolume010078
     * @tc.number SUB_CCE_UTILV_01_0078
     * @tc.desc   亚秒截断与整点跳变，验证实现取 floor 而非四舍五入
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume010078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010078 begin');
      const subSecond: string = utils.convertTimeToFormatString(999);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', subSecond, '00:00:00');
      expect(subSecond).assertEqual('00:00:00');
      const almostSecond: string = utils.convertTimeToFormatString(1999);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', almostSecond, '00:00:01');
      expect(almostSecond).assertEqual('00:00:01');
      const oneHour: string = utils.convertTimeToFormatString(3600000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', oneHour, '01:00:00');
      expect(oneHour).assertEqual('01:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume010078 end');
    })
  })
}
