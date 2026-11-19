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

export default function utilVolume06Test(): void {
  describe('UtilVolume06Test', () => {

    /**
     * @tc.name   testUtilVolume060001
     * @tc.number SUB_CCE_UTILV_06_0001
     * @tc.desc   n=9007199254740990 大数经 floor 截断到秒后格式化为 2501999792:59:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume060001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060001 begin');
      const n: number = 9007199254740990;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2501999792:59:00'));
      expect(result).assertEqual('2501999792:59:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060001 end');
    })

    /**
     * @tc.name   testUtilVolume060002
     * @tc.number SUB_CCE_UTILV_06_0002
     * @tc.desc   n=9007199254740989 大数经 floor 截断到秒后格式化为 2501999792:59:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume060002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060002 begin');
      const n: number = 9007199254740989;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2501999792:59:00'));
      expect(result).assertEqual('2501999792:59:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060002 end');
    })

    /**
     * @tc.name   testUtilVolume060003
     * @tc.number SUB_CCE_UTILV_06_0003
     * @tc.desc   n=9007199254740985 大数经 floor 截断到秒后格式化为 2501999792:59:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume060003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060003 begin');
      const n: number = 9007199254740985;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2501999792:59:00'));
      expect(result).assertEqual('2501999792:59:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060003 end');
    })

    /**
     * @tc.name   testUtilVolume060004
     * @tc.number SUB_CCE_UTILV_06_0004
     * @tc.desc   n=9007199254740980 大数经 floor 截断到秒后格式化为 2501999792:59:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume060004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060004 begin');
      const n: number = 9007199254740980;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2501999792:59:00'));
      expect(result).assertEqual('2501999792:59:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060004 end');
    })

    /**
     * @tc.name   testUtilVolume060005
     * @tc.number SUB_CCE_UTILV_06_0005
     * @tc.desc   n=9007199254740950 大数经 floor 截断到秒后格式化为 2501999792:59:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume060005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060005 begin');
      const n: number = 9007199254740950;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2501999792:59:00'));
      expect(result).assertEqual('2501999792:59:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060005 end');
    })

    /**
     * @tc.name   testUtilVolume060006
     * @tc.number SUB_CCE_UTILV_06_0006
     * @tc.desc   n=9007199254740900 大数经 floor 截断到秒后格式化为 2501999792:59:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume060006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060006 begin');
      const n: number = 9007199254740900;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2501999792:59:00'));
      expect(result).assertEqual('2501999792:59:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060006 end');
    })

    /**
     * @tc.name   testUtilVolume060007
     * @tc.number SUB_CCE_UTILV_06_0007
     * @tc.desc   n=9007199254740000 大数经 floor 截断到秒后格式化为 2501999792:59:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume060007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060007 begin');
      const n: number = 9007199254740000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2501999792:59:00'));
      expect(result).assertEqual('2501999792:59:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060007 end');
    })

    /**
     * @tc.name   testUtilVolume060008
     * @tc.number SUB_CCE_UTILV_06_0008
     * @tc.desc   n=9007199254700000 大数经 floor 截断到秒后格式化为 2501999792:58:20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume060008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060008 begin');
      const n: number = 9007199254700000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2501999792:58:20'));
      expect(result).assertEqual('2501999792:58:20');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('20'));
      expect(result.substring(result.length - 2)).assertEqual('20');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060008 end');
    })

    /**
     * @tc.name   testUtilVolume060009
     * @tc.number SUB_CCE_UTILV_06_0009
     * @tc.desc   n=9007199250000000 大数经 floor 截断到秒后格式化为 2501999791:40:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume060009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060009 begin');
      const n: number = 9007199250000000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2501999791:40:00'));
      expect(result).assertEqual('2501999791:40:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060009 end');
    })

    /**
     * @tc.name   testUtilVolume060010
     * @tc.number SUB_CCE_UTILV_06_0010
     * @tc.desc   n=9007199200000000 大数经 floor 截断到秒后格式化为 2501999777:46:40
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume060010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060010 begin');
      const n: number = 9007199200000000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2501999777:46:40'));
      expect(result).assertEqual('2501999777:46:40');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('40'));
      expect(result.substring(result.length - 2)).assertEqual('40');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060010 end');
    })

    /**
     * @tc.name   testUtilVolume060011
     * @tc.number SUB_CCE_UTILV_06_0011
     * @tc.desc   n=9007199000000000 大数经 floor 截断到秒后格式化为 2501999722:13:20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume060011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060011 begin');
      const n: number = 9007199000000000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2501999722:13:20'));
      expect(result).assertEqual('2501999722:13:20');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('20'));
      expect(result.substring(result.length - 2)).assertEqual('20');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060011 end');
    })

    /**
     * @tc.name   testUtilVolume060012
     * @tc.number SUB_CCE_UTILV_06_0012
     * @tc.desc   n=9007190000000000 大数经 floor 截断到秒后格式化为 2501997222:13:20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume060012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060012 begin');
      const n: number = 9007190000000000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2501997222:13:20'));
      expect(result).assertEqual('2501997222:13:20');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('20'));
      expect(result.substring(result.length - 2)).assertEqual('20');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060012 end');
    })

    /**
     * @tc.name   testUtilVolume060013
     * @tc.number SUB_CCE_UTILV_06_0013
     * @tc.desc   n=1000000000000000 大数经 floor 截断到秒后格式化为 277777777:46:40
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume060013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060013 begin');
      const n: number = 1000000000000000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('277777777:46:40'));
      expect(result).assertEqual('277777777:46:40');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('40'));
      expect(result.substring(result.length - 2)).assertEqual('40');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060013 end');
    })

    /**
     * @tc.name   testUtilVolume060014
     * @tc.number SUB_CCE_UTILV_06_0014
     * @tc.desc   n=2000000000000000 大数经 floor 截断到秒后格式化为 555555555:33:20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume060014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060014 begin');
      const n: number = 2000000000000000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('555555555:33:20'));
      expect(result).assertEqual('555555555:33:20');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('20'));
      expect(result.substring(result.length - 2)).assertEqual('20');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060014 end');
    })

    /**
     * @tc.name   testUtilVolume060015
     * @tc.number SUB_CCE_UTILV_06_0015
     * @tc.desc   n=3000000000000000 大数经 floor 截断到秒后格式化为 833333333:20:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume060015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060015 begin');
      const n: number = 3000000000000000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('833333333:20:00'));
      expect(result).assertEqual('833333333:20:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060015 end');
    })

    /**
     * @tc.name   testUtilVolume060016
     * @tc.number SUB_CCE_UTILV_06_0016
     * @tc.desc   n=4000000000000000 大数经 floor 截断到秒后格式化为 1111111111:06:40
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume060016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060016 begin');
      const n: number = 4000000000000000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1111111111:06:40'));
      expect(result).assertEqual('1111111111:06:40');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('40'));
      expect(result.substring(result.length - 2)).assertEqual('40');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060016 end');
    })

    /**
     * @tc.name   testUtilVolume060017
     * @tc.number SUB_CCE_UTILV_06_0017
     * @tc.desc   n=5000000000000000 大数经 floor 截断到秒后格式化为 1388888888:53:20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume060017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060017 begin');
      const n: number = 5000000000000000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1388888888:53:20'));
      expect(result).assertEqual('1388888888:53:20');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('20'));
      expect(result.substring(result.length - 2)).assertEqual('20');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060017 end');
    })

    /**
     * @tc.name   testUtilVolume060018
     * @tc.number SUB_CCE_UTILV_06_0018
     * @tc.desc   n=6000000000000000 大数经 floor 截断到秒后格式化为 1666666666:40:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume060018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060018 begin');
      const n: number = 6000000000000000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1666666666:40:00'));
      expect(result).assertEqual('1666666666:40:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060018 end');
    })

    /**
     * @tc.name   testUtilVolume060019
     * @tc.number SUB_CCE_UTILV_06_0019
     * @tc.desc   n=7000000000000000 大数经 floor 截断到秒后格式化为 1944444444:26:40
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume060019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060019 begin');
      const n: number = 7000000000000000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1944444444:26:40'));
      expect(result).assertEqual('1944444444:26:40');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('40'));
      expect(result.substring(result.length - 2)).assertEqual('40');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060019 end');
    })

    /**
     * @tc.name   testUtilVolume060020
     * @tc.number SUB_CCE_UTILV_06_0020
     * @tc.desc   n=8000000000000000 大数经 floor 截断到秒后格式化为 2222222222:13:20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume060020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060020 begin');
      const n: number = 8000000000000000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2222222222:13:20'));
      expect(result).assertEqual('2222222222:13:20');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('20'));
      expect(result.substring(result.length - 2)).assertEqual('20');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060020 end');
    })

    /**
     * @tc.name   testUtilVolume060021
     * @tc.number SUB_CCE_UTILV_06_0021
     * @tc.desc   n=10000000000000 大数经 floor 截断到秒后格式化为 2777777:46:40
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume060021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060021 begin');
      const n: number = 10000000000000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2777777:46:40'));
      expect(result).assertEqual('2777777:46:40');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('40'));
      expect(result.substring(result.length - 2)).assertEqual('40');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060021 end');
    })

    /**
     * @tc.name   testUtilVolume060022
     * @tc.number SUB_CCE_UTILV_06_0022
     * @tc.desc   n=20000000000000 大数经 floor 截断到秒后格式化为 5555555:33:20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume060022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060022 begin');
      const n: number = 20000000000000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('5555555:33:20'));
      expect(result).assertEqual('5555555:33:20');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('20'));
      expect(result.substring(result.length - 2)).assertEqual('20');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060022 end');
    })

    /**
     * @tc.name   testUtilVolume060023
     * @tc.number SUB_CCE_UTILV_06_0023
     * @tc.desc   n=50000000000000 大数经 floor 截断到秒后格式化为 13888888:53:20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume060023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060023 begin');
      const n: number = 50000000000000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('13888888:53:20'));
      expect(result).assertEqual('13888888:53:20');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('20'));
      expect(result.substring(result.length - 2)).assertEqual('20');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060023 end');
    })

    /**
     * @tc.name   testUtilVolume060024
     * @tc.number SUB_CCE_UTILV_06_0024
     * @tc.desc   n=100000000000000 大数经 floor 截断到秒后格式化为 27777777:46:40
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume060024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060024 begin');
      const n: number = 100000000000000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('27777777:46:40'));
      expect(result).assertEqual('27777777:46:40');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('40'));
      expect(result.substring(result.length - 2)).assertEqual('40');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060024 end');
    })

    /**
     * @tc.name   testUtilVolume060025
     * @tc.number SUB_CCE_UTILV_06_0025
     * @tc.desc   n=200000000000000 大数经 floor 截断到秒后格式化为 55555555:33:20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume060025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060025 begin');
      const n: number = 200000000000000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('55555555:33:20'));
      expect(result).assertEqual('55555555:33:20');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('20'));
      expect(result.substring(result.length - 2)).assertEqual('20');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060025 end');
    })

    /**
     * @tc.name   testUtilVolume060026
     * @tc.number SUB_CCE_UTILV_06_0026
     * @tc.desc   n=500000000000000 大数经 floor 截断到秒后格式化为 138888888:53:20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume060026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060026 begin');
      const n: number = 500000000000000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('138888888:53:20'));
      expect(result).assertEqual('138888888:53:20');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('20'));
      expect(result.substring(result.length - 2)).assertEqual('20');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060026 end');
    })

    /**
     * @tc.name   testUtilVolume060027
     * @tc.number SUB_CCE_UTILV_06_0027
     * @tc.desc   n=100000000000 大数经 floor 截断到秒后格式化为 27777:46:40
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume060027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060027 begin');
      const n: number = 100000000000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('27777:46:40'));
      expect(result).assertEqual('27777:46:40');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('40'));
      expect(result.substring(result.length - 2)).assertEqual('40');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060027 end');
    })

    /**
     * @tc.name   testUtilVolume060028
     * @tc.number SUB_CCE_UTILV_06_0028
     * @tc.desc   n=200000000000 大数经 floor 截断到秒后格式化为 55555:33:20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume060028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060028 begin');
      const n: number = 200000000000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('55555:33:20'));
      expect(result).assertEqual('55555:33:20');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('20'));
      expect(result.substring(result.length - 2)).assertEqual('20');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060028 end');
    })

    /**
     * @tc.name   testUtilVolume060029
     * @tc.number SUB_CCE_UTILV_06_0029
     * @tc.desc   n=300000000000 大数经 floor 截断到秒后格式化为 83333:20:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume060029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060029 begin');
      const n: number = 300000000000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('83333:20:00'));
      expect(result).assertEqual('83333:20:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060029 end');
    })

    /**
     * @tc.name   testUtilVolume060030
     * @tc.number SUB_CCE_UTILV_06_0030
     * @tc.desc   n=400000000000 大数经 floor 截断到秒后格式化为 111111:06:40
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume060030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060030 begin');
      const n: number = 400000000000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('111111:06:40'));
      expect(result).assertEqual('111111:06:40');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('40'));
      expect(result.substring(result.length - 2)).assertEqual('40');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060030 end');
    })

    /**
     * @tc.name   testUtilVolume060031
     * @tc.number SUB_CCE_UTILV_06_0031
     * @tc.desc   n=500000000000 大数经 floor 截断到秒后格式化为 138888:53:20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume060031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060031 begin');
      const n: number = 500000000000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('138888:53:20'));
      expect(result).assertEqual('138888:53:20');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('20'));
      expect(result.substring(result.length - 2)).assertEqual('20');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060031 end');
    })

    /**
     * @tc.name   testUtilVolume060032
     * @tc.number SUB_CCE_UTILV_06_0032
     * @tc.desc   n=600000000000 大数经 floor 截断到秒后格式化为 166666:40:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume060032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060032 begin');
      const n: number = 600000000000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('166666:40:00'));
      expect(result).assertEqual('166666:40:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060032 end');
    })

    /**
     * @tc.name   testUtilVolume060033
     * @tc.number SUB_CCE_UTILV_06_0033
     * @tc.desc   n=700000000000 大数经 floor 截断到秒后格式化为 194444:26:40
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume060033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060033 begin');
      const n: number = 700000000000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('194444:26:40'));
      expect(result).assertEqual('194444:26:40');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('40'));
      expect(result.substring(result.length - 2)).assertEqual('40');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060033 end');
    })

    /**
     * @tc.name   testUtilVolume060034
     * @tc.number SUB_CCE_UTILV_06_0034
     * @tc.desc   n=800000000000 大数经 floor 截断到秒后格式化为 222222:13:20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume060034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060034 begin');
      const n: number = 800000000000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('222222:13:20'));
      expect(result).assertEqual('222222:13:20');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('20'));
      expect(result.substring(result.length - 2)).assertEqual('20');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060034 end');
    })

    /**
     * @tc.name   testUtilVolume060035
     * @tc.number SUB_CCE_UTILV_06_0035
     * @tc.desc   n=900000000000 大数经 floor 截断到秒后格式化为 250000:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume060035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060035 begin');
      const n: number = 900000000000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('250000:00:00'));
      expect(result).assertEqual('250000:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060035 end');
    })

    /**
     * @tc.name   testUtilVolume060036
     * @tc.number SUB_CCE_UTILV_06_0036
     * @tc.desc   n=10000000000 大数经 floor 截断到秒后格式化为 2777:46:40
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume060036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060036 begin');
      const n: number = 10000000000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2777:46:40'));
      expect(result).assertEqual('2777:46:40');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('40'));
      expect(result.substring(result.length - 2)).assertEqual('40');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060036 end');
    })

    /**
     * @tc.name   testUtilVolume060037
     * @tc.number SUB_CCE_UTILV_06_0037
     * @tc.desc   n=20000000000 大数经 floor 截断到秒后格式化为 5555:33:20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume060037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060037 begin');
      const n: number = 20000000000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('5555:33:20'));
      expect(result).assertEqual('5555:33:20');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('20'));
      expect(result.substring(result.length - 2)).assertEqual('20');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060037 end');
    })

    /**
     * @tc.name   testUtilVolume060038
     * @tc.number SUB_CCE_UTILV_06_0038
     * @tc.desc   n=30000000000 大数经 floor 截断到秒后格式化为 8333:20:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume060038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060038 begin');
      const n: number = 30000000000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('8333:20:00'));
      expect(result).assertEqual('8333:20:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060038 end');
    })

    /**
     * @tc.name   testUtilVolume060039
     * @tc.number SUB_CCE_UTILV_06_0039
     * @tc.desc   n=40000000000 大数经 floor 截断到秒后格式化为 11111:06:40
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume060039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060039 begin');
      const n: number = 40000000000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('11111:06:40'));
      expect(result).assertEqual('11111:06:40');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('40'));
      expect(result.substring(result.length - 2)).assertEqual('40');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060039 end');
    })

    /**
     * @tc.name   testUtilVolume060040
     * @tc.number SUB_CCE_UTILV_06_0040
     * @tc.desc   n=50000000000 大数经 floor 截断到秒后格式化为 13888:53:20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume060040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060040 begin');
      const n: number = 50000000000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('13888:53:20'));
      expect(result).assertEqual('13888:53:20');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('20'));
      expect(result.substring(result.length - 2)).assertEqual('20');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060040 end');
    })

    /**
     * @tc.name   testUtilVolume060041
     * @tc.number SUB_CCE_UTILV_06_0041
     * @tc.desc   n=60000000000 大数经 floor 截断到秒后格式化为 16666:40:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume060041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060041 begin');
      const n: number = 60000000000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('16666:40:00'));
      expect(result).assertEqual('16666:40:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060041 end');
    })

    /**
     * @tc.name   testUtilVolume060042
     * @tc.number SUB_CCE_UTILV_06_0042
     * @tc.desc   n=70000000000 大数经 floor 截断到秒后格式化为 19444:26:40
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume060042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060042 begin');
      const n: number = 70000000000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('19444:26:40'));
      expect(result).assertEqual('19444:26:40');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('40'));
      expect(result.substring(result.length - 2)).assertEqual('40');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060042 end');
    })

    /**
     * @tc.name   testUtilVolume060043
     * @tc.number SUB_CCE_UTILV_06_0043
     * @tc.desc   n=80000000000 大数经 floor 截断到秒后格式化为 22222:13:20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume060043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060043 begin');
      const n: number = 80000000000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('22222:13:20'));
      expect(result).assertEqual('22222:13:20');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('20'));
      expect(result.substring(result.length - 2)).assertEqual('20');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060043 end');
    })

    /**
     * @tc.name   testUtilVolume060044
     * @tc.number SUB_CCE_UTILV_06_0044
     * @tc.desc   n=90000000000 大数经 floor 截断到秒后格式化为 25000:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume060044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060044 begin');
      const n: number = 90000000000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('25000:00:00'));
      expect(result).assertEqual('25000:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060044 end');
    })

    /**
     * @tc.name   testUtilVolume060045
     * @tc.number SUB_CCE_UTILV_06_0045
     * @tc.desc   n=123456789012345 大数经 floor 截断到秒后格式化为 34293552:30:12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume060045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060045 begin');
      const n: number = 123456789012345;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('34293552:30:12'));
      expect(result).assertEqual('34293552:30:12');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('12'));
      expect(result.substring(result.length - 2)).assertEqual('12');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060045 end');
    })

    /**
     * @tc.name   testUtilVolume060046
     * @tc.number SUB_CCE_UTILV_06_0046
     * @tc.desc   n=987654321098765 大数经 floor 截断到秒后格式化为 274348422:31:38
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume060046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060046 begin');
      const n: number = 987654321098765;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('274348422:31:38'));
      expect(result).assertEqual('274348422:31:38');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('38'));
      expect(result.substring(result.length - 2)).assertEqual('38');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060046 end');
    })

    /**
     * @tc.name   testUtilVolume060047
     * @tc.number SUB_CCE_UTILV_06_0047
     * @tc.desc   n=555555555555555 大数经 floor 截断到秒后格式化为 154320987:39:15
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume060047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060047 begin');
      const n: number = 555555555555555;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('154320987:39:15'));
      expect(result).assertEqual('154320987:39:15');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('15'));
      expect(result.substring(result.length - 2)).assertEqual('15');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060047 end');
    })

    /**
     * @tc.name   testUtilVolume060048
     * @tc.number SUB_CCE_UTILV_06_0048
     * @tc.desc   n=111111111111111 大数经 floor 截断到秒后格式化为 30864197:31:51
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume060048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060048 begin');
      const n: number = 111111111111111;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('30864197:31:51'));
      expect(result).assertEqual('30864197:31:51');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('51'));
      expect(result.substring(result.length - 2)).assertEqual('51');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060048 end');
    })

    /**
     * @tc.name   testUtilVolume060049
     * @tc.number SUB_CCE_UTILV_06_0049
     * @tc.desc   n=999999999999999 大数经 floor 截断到秒后格式化为 277777777:46:39
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume060049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060049 begin');
      const n: number = 999999999999999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('277777777:46:39'));
      expect(result).assertEqual('277777777:46:39');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('39'));
      expect(result.substring(result.length - 2)).assertEqual('39');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060049 end');
    })

    /**
     * @tc.name   testUtilVolume060050
     * @tc.number SUB_CCE_UTILV_06_0050
     * @tc.desc   n=999999999999998 大数经 floor 截断到秒后格式化为 277777777:46:39
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume060050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060050 begin');
      const n: number = 999999999999998;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('277777777:46:39'));
      expect(result).assertEqual('277777777:46:39');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('39'));
      expect(result.substring(result.length - 2)).assertEqual('39');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060050 end');
    })

    /**
     * @tc.name   testUtilVolume060051
     * @tc.number SUB_CCE_UTILV_06_0051
     * @tc.desc   n=123450000000000 大数经 floor 截断到秒后格式化为 34291666:40:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume060051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060051 begin');
      const n: number = 123450000000000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('34291666:40:00'));
      expect(result).assertEqual('34291666:40:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060051 end');
    })

    /**
     * @tc.name   testUtilVolume060052
     * @tc.number SUB_CCE_UTILV_06_0052
     * @tc.desc   n=999999999999990 大数经 floor 截断到秒后格式化为 277777777:46:39
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume060052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060052 begin');
      const n: number = 999999999999990;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('277777777:46:39'));
      expect(result).assertEqual('277777777:46:39');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('39'));
      expect(result.substring(result.length - 2)).assertEqual('39');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060052 end');
    })

    /**
     * @tc.name   testUtilVolume060053
     * @tc.number SUB_CCE_UTILV_06_0053
     * @tc.desc   n=864000000001 大数经 floor 截断到秒后格式化为 240000:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume060053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060053 begin');
      const n: number = 864000000001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('240000:00:00'));
      expect(result).assertEqual('240000:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060053 end');
    })

    /**
     * @tc.name   testUtilVolume060054
     * @tc.number SUB_CCE_UTILV_06_0054
     * @tc.desc   n=863999999999 大数经 floor 截断到秒后格式化为 239999:59:59
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume060054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060054 begin');
      const n: number = 863999999999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('239999:59:59'));
      expect(result).assertEqual('239999:59:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060054 end');
    })

    /**
     * @tc.name   testUtilVolume060055
     * @tc.number SUB_CCE_UTILV_06_0055
     * @tc.desc   864000000000±1 跨秒进位：小时段超两位不再定宽补零
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume060055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060055 begin');
      const over: string = utils.convertTimeToFormatString(864000000001);
      const under: string = utils.convertTimeToFormatString(863999999999);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', over, '240000:00:00');
      expect(over).assertEqual('240000:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', under, '239999:59:59');
      expect(under).assertEqual('239999:59:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(over.length > 8 && under.length > 8));
      expect(over.length > 8 && under.length > 8).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume060055 end');
    })
  })
}
