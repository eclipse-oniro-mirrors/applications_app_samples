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

export default function utilVolume10Test(): void {
  describe('UtilVolume10Test', () => {

    /**
     * @tc.name   testUtilVolume100001
     * @tc.number SUB_CCE_UTILV_10_0001
     * @tc.desc   n=3100（3s+100ms）毫秒残差被 floor 截断后格式化为 00:00:03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100001 begin');
      const n: number = 3100;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:03'));
      expect(result).assertEqual('00:00:03');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('03'));
      expect(result.substring(result.length - 2)).assertEqual('03');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100001 end');
    })

    /**
     * @tc.name   testUtilVolume100002
     * @tc.number SUB_CCE_UTILV_10_0002
     * @tc.desc   n=3250（3s+250ms）毫秒残差被 floor 截断后格式化为 00:00:03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100002 begin');
      const n: number = 3250;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:03'));
      expect(result).assertEqual('00:00:03');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('03'));
      expect(result.substring(result.length - 2)).assertEqual('03');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100002 end');
    })

    /**
     * @tc.name   testUtilVolume100003
     * @tc.number SUB_CCE_UTILV_10_0003
     * @tc.desc   n=3500（3s+500ms）毫秒残差被 floor 截断后格式化为 00:00:03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100003 begin');
      const n: number = 3500;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:03'));
      expect(result).assertEqual('00:00:03');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('03'));
      expect(result.substring(result.length - 2)).assertEqual('03');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100003 end');
    })

    /**
     * @tc.name   testUtilVolume100004
     * @tc.number SUB_CCE_UTILV_10_0004
     * @tc.desc   n=3750（3s+750ms）毫秒残差被 floor 截断后格式化为 00:00:03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100004 begin');
      const n: number = 3750;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:03'));
      expect(result).assertEqual('00:00:03');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('03'));
      expect(result.substring(result.length - 2)).assertEqual('03');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100004 end');
    })

    /**
     * @tc.name   testUtilVolume100005
     * @tc.number SUB_CCE_UTILV_10_0005
     * @tc.desc   n=4100（4s+100ms）毫秒残差被 floor 截断后格式化为 00:00:04
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100005 begin');
      const n: number = 4100;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:04'));
      expect(result).assertEqual('00:00:04');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('04'));
      expect(result.substring(result.length - 2)).assertEqual('04');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100005 end');
    })

    /**
     * @tc.name   testUtilVolume100006
     * @tc.number SUB_CCE_UTILV_10_0006
     * @tc.desc   n=4250（4s+250ms）毫秒残差被 floor 截断后格式化为 00:00:04
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100006 begin');
      const n: number = 4250;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:04'));
      expect(result).assertEqual('00:00:04');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('04'));
      expect(result.substring(result.length - 2)).assertEqual('04');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100006 end');
    })

    /**
     * @tc.name   testUtilVolume100007
     * @tc.number SUB_CCE_UTILV_10_0007
     * @tc.desc   n=4500（4s+500ms）毫秒残差被 floor 截断后格式化为 00:00:04
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100007 begin');
      const n: number = 4500;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:04'));
      expect(result).assertEqual('00:00:04');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('04'));
      expect(result.substring(result.length - 2)).assertEqual('04');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100007 end');
    })

    /**
     * @tc.name   testUtilVolume100008
     * @tc.number SUB_CCE_UTILV_10_0008
     * @tc.desc   n=4750（4s+750ms）毫秒残差被 floor 截断后格式化为 00:00:04
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100008 begin');
      const n: number = 4750;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:04'));
      expect(result).assertEqual('00:00:04');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('04'));
      expect(result.substring(result.length - 2)).assertEqual('04');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100008 end');
    })

    /**
     * @tc.name   testUtilVolume100009
     * @tc.number SUB_CCE_UTILV_10_0009
     * @tc.desc   n=5100（5s+100ms）毫秒残差被 floor 截断后格式化为 00:00:05
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100009 begin');
      const n: number = 5100;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:05'));
      expect(result).assertEqual('00:00:05');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('05'));
      expect(result.substring(result.length - 2)).assertEqual('05');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100009 end');
    })

    /**
     * @tc.name   testUtilVolume100010
     * @tc.number SUB_CCE_UTILV_10_0010
     * @tc.desc   n=5250（5s+250ms）毫秒残差被 floor 截断后格式化为 00:00:05
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100010 begin');
      const n: number = 5250;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:05'));
      expect(result).assertEqual('00:00:05');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('05'));
      expect(result.substring(result.length - 2)).assertEqual('05');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100010 end');
    })

    /**
     * @tc.name   testUtilVolume100011
     * @tc.number SUB_CCE_UTILV_10_0011
     * @tc.desc   n=5500（5s+500ms）毫秒残差被 floor 截断后格式化为 00:00:05
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100011 begin');
      const n: number = 5500;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:05'));
      expect(result).assertEqual('00:00:05');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('05'));
      expect(result.substring(result.length - 2)).assertEqual('05');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100011 end');
    })

    /**
     * @tc.name   testUtilVolume100012
     * @tc.number SUB_CCE_UTILV_10_0012
     * @tc.desc   n=5750（5s+750ms）毫秒残差被 floor 截断后格式化为 00:00:05
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100012 begin');
      const n: number = 5750;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:05'));
      expect(result).assertEqual('00:00:05');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('05'));
      expect(result.substring(result.length - 2)).assertEqual('05');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100012 end');
    })

    /**
     * @tc.name   testUtilVolume100013
     * @tc.number SUB_CCE_UTILV_10_0013
     * @tc.desc   n=6100（6s+100ms）毫秒残差被 floor 截断后格式化为 00:00:06
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100013 begin');
      const n: number = 6100;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:06'));
      expect(result).assertEqual('00:00:06');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('06'));
      expect(result.substring(result.length - 2)).assertEqual('06');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100013 end');
    })

    /**
     * @tc.name   testUtilVolume100014
     * @tc.number SUB_CCE_UTILV_10_0014
     * @tc.desc   n=6250（6s+250ms）毫秒残差被 floor 截断后格式化为 00:00:06
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100014 begin');
      const n: number = 6250;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:06'));
      expect(result).assertEqual('00:00:06');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('06'));
      expect(result.substring(result.length - 2)).assertEqual('06');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100014 end');
    })

    /**
     * @tc.name   testUtilVolume100015
     * @tc.number SUB_CCE_UTILV_10_0015
     * @tc.desc   n=6500（6s+500ms）毫秒残差被 floor 截断后格式化为 00:00:06
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100015 begin');
      const n: number = 6500;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:06'));
      expect(result).assertEqual('00:00:06');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('06'));
      expect(result.substring(result.length - 2)).assertEqual('06');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100015 end');
    })

    /**
     * @tc.name   testUtilVolume100016
     * @tc.number SUB_CCE_UTILV_10_0016
     * @tc.desc   n=6750（6s+750ms）毫秒残差被 floor 截断后格式化为 00:00:06
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100016 begin');
      const n: number = 6750;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:06'));
      expect(result).assertEqual('00:00:06');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('06'));
      expect(result.substring(result.length - 2)).assertEqual('06');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100016 end');
    })

    /**
     * @tc.name   testUtilVolume100017
     * @tc.number SUB_CCE_UTILV_10_0017
     * @tc.desc   n=7100（7s+100ms）毫秒残差被 floor 截断后格式化为 00:00:07
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100017 begin');
      const n: number = 7100;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:07'));
      expect(result).assertEqual('00:00:07');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('07'));
      expect(result.substring(result.length - 2)).assertEqual('07');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100017 end');
    })

    /**
     * @tc.name   testUtilVolume100018
     * @tc.number SUB_CCE_UTILV_10_0018
     * @tc.desc   n=7250（7s+250ms）毫秒残差被 floor 截断后格式化为 00:00:07
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100018 begin');
      const n: number = 7250;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:07'));
      expect(result).assertEqual('00:00:07');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('07'));
      expect(result.substring(result.length - 2)).assertEqual('07');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100018 end');
    })

    /**
     * @tc.name   testUtilVolume100019
     * @tc.number SUB_CCE_UTILV_10_0019
     * @tc.desc   n=7500（7s+500ms）毫秒残差被 floor 截断后格式化为 00:00:07
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100019 begin');
      const n: number = 7500;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:07'));
      expect(result).assertEqual('00:00:07');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('07'));
      expect(result.substring(result.length - 2)).assertEqual('07');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100019 end');
    })

    /**
     * @tc.name   testUtilVolume100020
     * @tc.number SUB_CCE_UTILV_10_0020
     * @tc.desc   n=7750（7s+750ms）毫秒残差被 floor 截断后格式化为 00:00:07
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100020 begin');
      const n: number = 7750;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:07'));
      expect(result).assertEqual('00:00:07');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('07'));
      expect(result.substring(result.length - 2)).assertEqual('07');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100020 end');
    })

    /**
     * @tc.name   testUtilVolume100021
     * @tc.number SUB_CCE_UTILV_10_0021
     * @tc.desc   n=8100（8s+100ms）毫秒残差被 floor 截断后格式化为 00:00:08
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100021 begin');
      const n: number = 8100;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:08'));
      expect(result).assertEqual('00:00:08');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('08'));
      expect(result.substring(result.length - 2)).assertEqual('08');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100021 end');
    })

    /**
     * @tc.name   testUtilVolume100022
     * @tc.number SUB_CCE_UTILV_10_0022
     * @tc.desc   n=8250（8s+250ms）毫秒残差被 floor 截断后格式化为 00:00:08
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100022 begin');
      const n: number = 8250;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:08'));
      expect(result).assertEqual('00:00:08');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('08'));
      expect(result.substring(result.length - 2)).assertEqual('08');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100022 end');
    })

    /**
     * @tc.name   testUtilVolume100023
     * @tc.number SUB_CCE_UTILV_10_0023
     * @tc.desc   n=8500（8s+500ms）毫秒残差被 floor 截断后格式化为 00:00:08
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100023 begin');
      const n: number = 8500;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:08'));
      expect(result).assertEqual('00:00:08');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('08'));
      expect(result.substring(result.length - 2)).assertEqual('08');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100023 end');
    })

    /**
     * @tc.name   testUtilVolume100024
     * @tc.number SUB_CCE_UTILV_10_0024
     * @tc.desc   n=8750（8s+750ms）毫秒残差被 floor 截断后格式化为 00:00:08
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100024 begin');
      const n: number = 8750;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:08'));
      expect(result).assertEqual('00:00:08');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('08'));
      expect(result.substring(result.length - 2)).assertEqual('08');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100024 end');
    })

    /**
     * @tc.name   testUtilVolume100025
     * @tc.number SUB_CCE_UTILV_10_0025
     * @tc.desc   n=9100（9s+100ms）毫秒残差被 floor 截断后格式化为 00:00:09
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100025 begin');
      const n: number = 9100;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:09'));
      expect(result).assertEqual('00:00:09');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('09'));
      expect(result.substring(result.length - 2)).assertEqual('09');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100025 end');
    })

    /**
     * @tc.name   testUtilVolume100026
     * @tc.number SUB_CCE_UTILV_10_0026
     * @tc.desc   n=9250（9s+250ms）毫秒残差被 floor 截断后格式化为 00:00:09
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100026 begin');
      const n: number = 9250;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:09'));
      expect(result).assertEqual('00:00:09');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('09'));
      expect(result.substring(result.length - 2)).assertEqual('09');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100026 end');
    })

    /**
     * @tc.name   testUtilVolume100027
     * @tc.number SUB_CCE_UTILV_10_0027
     * @tc.desc   n=9500（9s+500ms）毫秒残差被 floor 截断后格式化为 00:00:09
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100027 begin');
      const n: number = 9500;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:09'));
      expect(result).assertEqual('00:00:09');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('09'));
      expect(result.substring(result.length - 2)).assertEqual('09');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100027 end');
    })

    /**
     * @tc.name   testUtilVolume100028
     * @tc.number SUB_CCE_UTILV_10_0028
     * @tc.desc   n=9750（9s+750ms）毫秒残差被 floor 截断后格式化为 00:00:09
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100028 begin');
      const n: number = 9750;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:09'));
      expect(result).assertEqual('00:00:09');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('09'));
      expect(result.substring(result.length - 2)).assertEqual('09');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100028 end');
    })

    /**
     * @tc.name   testUtilVolume100029
     * @tc.number SUB_CCE_UTILV_10_0029
     * @tc.desc   n=10100（10s+100ms）毫秒残差被 floor 截断后格式化为 00:00:10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100029 begin');
      const n: number = 10100;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:10'));
      expect(result).assertEqual('00:00:10');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('10'));
      expect(result.substring(result.length - 2)).assertEqual('10');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100029 end');
    })

    /**
     * @tc.name   testUtilVolume100030
     * @tc.number SUB_CCE_UTILV_10_0030
     * @tc.desc   n=10250（10s+250ms）毫秒残差被 floor 截断后格式化为 00:00:10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100030 begin');
      const n: number = 10250;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:10'));
      expect(result).assertEqual('00:00:10');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('10'));
      expect(result.substring(result.length - 2)).assertEqual('10');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100030 end');
    })

    /**
     * @tc.name   testUtilVolume100031
     * @tc.number SUB_CCE_UTILV_10_0031
     * @tc.desc   n=10500（10s+500ms）毫秒残差被 floor 截断后格式化为 00:00:10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100031 begin');
      const n: number = 10500;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:10'));
      expect(result).assertEqual('00:00:10');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('10'));
      expect(result.substring(result.length - 2)).assertEqual('10');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100031 end');
    })

    /**
     * @tc.name   testUtilVolume100032
     * @tc.number SUB_CCE_UTILV_10_0032
     * @tc.desc   n=10750（10s+750ms）毫秒残差被 floor 截断后格式化为 00:00:10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100032 begin');
      const n: number = 10750;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:10'));
      expect(result).assertEqual('00:00:10');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('10'));
      expect(result.substring(result.length - 2)).assertEqual('10');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100032 end');
    })

    /**
     * @tc.name   testUtilVolume100033
     * @tc.number SUB_CCE_UTILV_10_0033
     * @tc.desc   n=11100（11s+100ms）毫秒残差被 floor 截断后格式化为 00:00:11
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100033 begin');
      const n: number = 11100;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:11'));
      expect(result).assertEqual('00:00:11');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('11'));
      expect(result.substring(result.length - 2)).assertEqual('11');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100033 end');
    })

    /**
     * @tc.name   testUtilVolume100034
     * @tc.number SUB_CCE_UTILV_10_0034
     * @tc.desc   n=11250（11s+250ms）毫秒残差被 floor 截断后格式化为 00:00:11
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100034 begin');
      const n: number = 11250;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:11'));
      expect(result).assertEqual('00:00:11');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('11'));
      expect(result.substring(result.length - 2)).assertEqual('11');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100034 end');
    })

    /**
     * @tc.name   testUtilVolume100035
     * @tc.number SUB_CCE_UTILV_10_0035
     * @tc.desc   n=11500（11s+500ms）毫秒残差被 floor 截断后格式化为 00:00:11
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100035 begin');
      const n: number = 11500;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:11'));
      expect(result).assertEqual('00:00:11');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('11'));
      expect(result.substring(result.length - 2)).assertEqual('11');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100035 end');
    })

    /**
     * @tc.name   testUtilVolume100036
     * @tc.number SUB_CCE_UTILV_10_0036
     * @tc.desc   n=11750（11s+750ms）毫秒残差被 floor 截断后格式化为 00:00:11
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100036 begin');
      const n: number = 11750;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:11'));
      expect(result).assertEqual('00:00:11');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('11'));
      expect(result.substring(result.length - 2)).assertEqual('11');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100036 end');
    })

    /**
     * @tc.name   testUtilVolume100037
     * @tc.number SUB_CCE_UTILV_10_0037
     * @tc.desc   n=12100（12s+100ms）毫秒残差被 floor 截断后格式化为 00:00:12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100037 begin');
      const n: number = 12100;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:12'));
      expect(result).assertEqual('00:00:12');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('12'));
      expect(result.substring(result.length - 2)).assertEqual('12');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100037 end');
    })

    /**
     * @tc.name   testUtilVolume100038
     * @tc.number SUB_CCE_UTILV_10_0038
     * @tc.desc   n=12250（12s+250ms）毫秒残差被 floor 截断后格式化为 00:00:12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100038 begin');
      const n: number = 12250;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:12'));
      expect(result).assertEqual('00:00:12');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('12'));
      expect(result.substring(result.length - 2)).assertEqual('12');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100038 end');
    })

    /**
     * @tc.name   testUtilVolume100039
     * @tc.number SUB_CCE_UTILV_10_0039
     * @tc.desc   n=12500（12s+500ms）毫秒残差被 floor 截断后格式化为 00:00:12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100039 begin');
      const n: number = 12500;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:12'));
      expect(result).assertEqual('00:00:12');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('12'));
      expect(result.substring(result.length - 2)).assertEqual('12');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100039 end');
    })

    /**
     * @tc.name   testUtilVolume100040
     * @tc.number SUB_CCE_UTILV_10_0040
     * @tc.desc   n=12750（12s+750ms）毫秒残差被 floor 截断后格式化为 00:00:12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100040 begin');
      const n: number = 12750;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:12'));
      expect(result).assertEqual('00:00:12');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('12'));
      expect(result.substring(result.length - 2)).assertEqual('12');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100040 end');
    })

    /**
     * @tc.name   testUtilVolume100041
     * @tc.number SUB_CCE_UTILV_10_0041
     * @tc.desc   n=13100（13s+100ms）毫秒残差被 floor 截断后格式化为 00:00:13
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100041 begin');
      const n: number = 13100;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:13'));
      expect(result).assertEqual('00:00:13');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('13'));
      expect(result.substring(result.length - 2)).assertEqual('13');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100041 end');
    })

    /**
     * @tc.name   testUtilVolume100042
     * @tc.number SUB_CCE_UTILV_10_0042
     * @tc.desc   n=13250（13s+250ms）毫秒残差被 floor 截断后格式化为 00:00:13
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100042 begin');
      const n: number = 13250;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:13'));
      expect(result).assertEqual('00:00:13');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('13'));
      expect(result.substring(result.length - 2)).assertEqual('13');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100042 end');
    })

    /**
     * @tc.name   testUtilVolume100043
     * @tc.number SUB_CCE_UTILV_10_0043
     * @tc.desc   n=13500（13s+500ms）毫秒残差被 floor 截断后格式化为 00:00:13
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100043 begin');
      const n: number = 13500;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:13'));
      expect(result).assertEqual('00:00:13');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('13'));
      expect(result.substring(result.length - 2)).assertEqual('13');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100043 end');
    })

    /**
     * @tc.name   testUtilVolume100044
     * @tc.number SUB_CCE_UTILV_10_0044
     * @tc.desc   n=13750（13s+750ms）毫秒残差被 floor 截断后格式化为 00:00:13
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100044 begin');
      const n: number = 13750;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:13'));
      expect(result).assertEqual('00:00:13');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('13'));
      expect(result.substring(result.length - 2)).assertEqual('13');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100044 end');
    })

    /**
     * @tc.name   testUtilVolume100045
     * @tc.number SUB_CCE_UTILV_10_0045
     * @tc.desc   n=14100（14s+100ms）毫秒残差被 floor 截断后格式化为 00:00:14
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100045 begin');
      const n: number = 14100;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:14'));
      expect(result).assertEqual('00:00:14');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('14'));
      expect(result.substring(result.length - 2)).assertEqual('14');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100045 end');
    })

    /**
     * @tc.name   testUtilVolume100046
     * @tc.number SUB_CCE_UTILV_10_0046
     * @tc.desc   n=14250（14s+250ms）毫秒残差被 floor 截断后格式化为 00:00:14
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100046 begin');
      const n: number = 14250;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:14'));
      expect(result).assertEqual('00:00:14');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('14'));
      expect(result.substring(result.length - 2)).assertEqual('14');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100046 end');
    })

    /**
     * @tc.name   testUtilVolume100047
     * @tc.number SUB_CCE_UTILV_10_0047
     * @tc.desc   n=14500（14s+500ms）毫秒残差被 floor 截断后格式化为 00:00:14
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100047 begin');
      const n: number = 14500;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:14'));
      expect(result).assertEqual('00:00:14');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('14'));
      expect(result.substring(result.length - 2)).assertEqual('14');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100047 end');
    })

    /**
     * @tc.name   testUtilVolume100048
     * @tc.number SUB_CCE_UTILV_10_0048
     * @tc.desc   n=14750（14s+750ms）毫秒残差被 floor 截断后格式化为 00:00:14
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100048 begin');
      const n: number = 14750;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:14'));
      expect(result).assertEqual('00:00:14');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('14'));
      expect(result.substring(result.length - 2)).assertEqual('14');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100048 end');
    })

    /**
     * @tc.name   testUtilVolume100049
     * @tc.number SUB_CCE_UTILV_10_0049
     * @tc.desc   n=15100（15s+100ms）毫秒残差被 floor 截断后格式化为 00:00:15
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100049 begin');
      const n: number = 15100;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:15'));
      expect(result).assertEqual('00:00:15');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('15'));
      expect(result.substring(result.length - 2)).assertEqual('15');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100049 end');
    })

    /**
     * @tc.name   testUtilVolume100050
     * @tc.number SUB_CCE_UTILV_10_0050
     * @tc.desc   n=15250（15s+250ms）毫秒残差被 floor 截断后格式化为 00:00:15
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100050 begin');
      const n: number = 15250;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:15'));
      expect(result).assertEqual('00:00:15');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('15'));
      expect(result.substring(result.length - 2)).assertEqual('15');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100050 end');
    })

    /**
     * @tc.name   testUtilVolume100051
     * @tc.number SUB_CCE_UTILV_10_0051
     * @tc.desc   n=15500（15s+500ms）毫秒残差被 floor 截断后格式化为 00:00:15
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100051 begin');
      const n: number = 15500;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:15'));
      expect(result).assertEqual('00:00:15');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('15'));
      expect(result.substring(result.length - 2)).assertEqual('15');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100051 end');
    })

    /**
     * @tc.name   testUtilVolume100052
     * @tc.number SUB_CCE_UTILV_10_0052
     * @tc.desc   n=15750（15s+750ms）毫秒残差被 floor 截断后格式化为 00:00:15
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100052 begin');
      const n: number = 15750;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:15'));
      expect(result).assertEqual('00:00:15');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('15'));
      expect(result.substring(result.length - 2)).assertEqual('15');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100052 end');
    })

    /**
     * @tc.name   testUtilVolume100053
     * @tc.number SUB_CCE_UTILV_10_0053
     * @tc.desc   n=16100（16s+100ms）毫秒残差被 floor 截断后格式化为 00:00:16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100053 begin');
      const n: number = 16100;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:16'));
      expect(result).assertEqual('00:00:16');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('16'));
      expect(result.substring(result.length - 2)).assertEqual('16');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100053 end');
    })

    /**
     * @tc.name   testUtilVolume100054
     * @tc.number SUB_CCE_UTILV_10_0054
     * @tc.desc   n=16250（16s+250ms）毫秒残差被 floor 截断后格式化为 00:00:16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100054 begin');
      const n: number = 16250;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:16'));
      expect(result).assertEqual('00:00:16');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('16'));
      expect(result.substring(result.length - 2)).assertEqual('16');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100054 end');
    })

    /**
     * @tc.name   testUtilVolume100055
     * @tc.number SUB_CCE_UTILV_10_0055
     * @tc.desc   n=16500（16s+500ms）毫秒残差被 floor 截断后格式化为 00:00:16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100055 begin');
      const n: number = 16500;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:16'));
      expect(result).assertEqual('00:00:16');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('16'));
      expect(result.substring(result.length - 2)).assertEqual('16');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100055 end');
    })

    /**
     * @tc.name   testUtilVolume100056
     * @tc.number SUB_CCE_UTILV_10_0056
     * @tc.desc   n=16750（16s+750ms）毫秒残差被 floor 截断后格式化为 00:00:16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100056 begin');
      const n: number = 16750;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:16'));
      expect(result).assertEqual('00:00:16');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('16'));
      expect(result.substring(result.length - 2)).assertEqual('16');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100056 end');
    })

    /**
     * @tc.name   testUtilVolume100057
     * @tc.number SUB_CCE_UTILV_10_0057
     * @tc.desc   n=17100（17s+100ms）毫秒残差被 floor 截断后格式化为 00:00:17
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100057 begin');
      const n: number = 17100;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:17'));
      expect(result).assertEqual('00:00:17');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('17'));
      expect(result.substring(result.length - 2)).assertEqual('17');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100057 end');
    })

    /**
     * @tc.name   testUtilVolume100058
     * @tc.number SUB_CCE_UTILV_10_0058
     * @tc.desc   n=17250（17s+250ms）毫秒残差被 floor 截断后格式化为 00:00:17
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100058 begin');
      const n: number = 17250;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:17'));
      expect(result).assertEqual('00:00:17');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('17'));
      expect(result.substring(result.length - 2)).assertEqual('17');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100058 end');
    })

    /**
     * @tc.name   testUtilVolume100059
     * @tc.number SUB_CCE_UTILV_10_0059
     * @tc.desc   n=17500（17s+500ms）毫秒残差被 floor 截断后格式化为 00:00:17
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100059 begin');
      const n: number = 17500;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:17'));
      expect(result).assertEqual('00:00:17');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('17'));
      expect(result.substring(result.length - 2)).assertEqual('17');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100059 end');
    })

    /**
     * @tc.name   testUtilVolume100060
     * @tc.number SUB_CCE_UTILV_10_0060
     * @tc.desc   n=17750（17s+750ms）毫秒残差被 floor 截断后格式化为 00:00:17
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100060 begin');
      const n: number = 17750;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:17'));
      expect(result).assertEqual('00:00:17');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('17'));
      expect(result.substring(result.length - 2)).assertEqual('17');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100060 end');
    })

    /**
     * @tc.name   testUtilVolume100061
     * @tc.number SUB_CCE_UTILV_10_0061
     * @tc.desc   n=18001（18s+1ms）毫秒残差被 floor 截断后格式化为 00:00:18
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100061 begin');
      const n: number = 18001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:18'));
      expect(result).assertEqual('00:00:18');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('18'));
      expect(result.substring(result.length - 2)).assertEqual('18');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100061 end');
    })

    /**
     * @tc.name   testUtilVolume100062
     * @tc.number SUB_CCE_UTILV_10_0062
     * @tc.desc   n=18002（18s+2ms）毫秒残差被 floor 截断后格式化为 00:00:18
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100062 begin');
      const n: number = 18002;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:18'));
      expect(result).assertEqual('00:00:18');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('18'));
      expect(result.substring(result.length - 2)).assertEqual('18');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100062 end');
    })

    /**
     * @tc.name   testUtilVolume100063
     * @tc.number SUB_CCE_UTILV_10_0063
     * @tc.desc   n=18005（18s+5ms）毫秒残差被 floor 截断后格式化为 00:00:18
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100063 begin');
      const n: number = 18005;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:18'));
      expect(result).assertEqual('00:00:18');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('18'));
      expect(result.substring(result.length - 2)).assertEqual('18');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100063 end');
    })

    /**
     * @tc.name   testUtilVolume100064
     * @tc.number SUB_CCE_UTILV_10_0064
     * @tc.desc   n=18009（18s+9ms）毫秒残差被 floor 截断后格式化为 00:00:18
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100064 begin');
      const n: number = 18009;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:18'));
      expect(result).assertEqual('00:00:18');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('18'));
      expect(result.substring(result.length - 2)).assertEqual('18');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100064 end');
    })

    /**
     * @tc.name   testUtilVolume100065
     * @tc.number SUB_CCE_UTILV_10_0065
     * @tc.desc   n=18050（18s+50ms）毫秒残差被 floor 截断后格式化为 00:00:18
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100065 begin');
      const n: number = 18050;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:18'));
      expect(result).assertEqual('00:00:18');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('18'));
      expect(result.substring(result.length - 2)).assertEqual('18');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100065 end');
    })

    /**
     * @tc.name   testUtilVolume100066
     * @tc.number SUB_CCE_UTILV_10_0066
     * @tc.desc   n=18099（18s+99ms）毫秒残差被 floor 截断后格式化为 00:00:18
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100066 begin');
      const n: number = 18099;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:18'));
      expect(result).assertEqual('00:00:18');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('18'));
      expect(result.substring(result.length - 2)).assertEqual('18');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100066 end');
    })

    /**
     * @tc.name   testUtilVolume100067
     * @tc.number SUB_CCE_UTILV_10_0067
     * @tc.desc   n=19001（19s+1ms）毫秒残差被 floor 截断后格式化为 00:00:19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100067 begin');
      const n: number = 19001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:19'));
      expect(result).assertEqual('00:00:19');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('19'));
      expect(result.substring(result.length - 2)).assertEqual('19');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100067 end');
    })

    /**
     * @tc.name   testUtilVolume100068
     * @tc.number SUB_CCE_UTILV_10_0068
     * @tc.desc   n=19002（19s+2ms）毫秒残差被 floor 截断后格式化为 00:00:19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100068 begin');
      const n: number = 19002;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:19'));
      expect(result).assertEqual('00:00:19');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('19'));
      expect(result.substring(result.length - 2)).assertEqual('19');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100068 end');
    })

    /**
     * @tc.name   testUtilVolume100069
     * @tc.number SUB_CCE_UTILV_10_0069
     * @tc.desc   n=19005（19s+5ms）毫秒残差被 floor 截断后格式化为 00:00:19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100069 begin');
      const n: number = 19005;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:19'));
      expect(result).assertEqual('00:00:19');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('19'));
      expect(result.substring(result.length - 2)).assertEqual('19');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100069 end');
    })

    /**
     * @tc.name   testUtilVolume100070
     * @tc.number SUB_CCE_UTILV_10_0070
     * @tc.desc   n=19009（19s+9ms）毫秒残差被 floor 截断后格式化为 00:00:19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100070 begin');
      const n: number = 19009;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:19'));
      expect(result).assertEqual('00:00:19');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('19'));
      expect(result.substring(result.length - 2)).assertEqual('19');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100070 end');
    })

    /**
     * @tc.name   testUtilVolume100071
     * @tc.number SUB_CCE_UTILV_10_0071
     * @tc.desc   n=19050（19s+50ms）毫秒残差被 floor 截断后格式化为 00:00:19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100071 begin');
      const n: number = 19050;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:19'));
      expect(result).assertEqual('00:00:19');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('19'));
      expect(result.substring(result.length - 2)).assertEqual('19');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100071 end');
    })

    /**
     * @tc.name   testUtilVolume100072
     * @tc.number SUB_CCE_UTILV_10_0072
     * @tc.desc   n=19099（19s+99ms）毫秒残差被 floor 截断后格式化为 00:00:19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100072 begin');
      const n: number = 19099;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:19'));
      expect(result).assertEqual('00:00:19');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('19'));
      expect(result.substring(result.length - 2)).assertEqual('19');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100072 end');
    })

    /**
     * @tc.name   testUtilVolume100073
     * @tc.number SUB_CCE_UTILV_10_0073
     * @tc.desc   n=20001（20s+1ms）毫秒残差被 floor 截断后格式化为 00:00:20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100073 begin');
      const n: number = 20001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:20'));
      expect(result).assertEqual('00:00:20');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('20'));
      expect(result.substring(result.length - 2)).assertEqual('20');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100073 end');
    })

    /**
     * @tc.name   testUtilVolume100074
     * @tc.number SUB_CCE_UTILV_10_0074
     * @tc.desc   n=20002（20s+2ms）毫秒残差被 floor 截断后格式化为 00:00:20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100074 begin');
      const n: number = 20002;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:20'));
      expect(result).assertEqual('00:00:20');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('20'));
      expect(result.substring(result.length - 2)).assertEqual('20');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100074 end');
    })

    /**
     * @tc.name   testUtilVolume100075
     * @tc.number SUB_CCE_UTILV_10_0075
     * @tc.desc   n=20005（20s+5ms）毫秒残差被 floor 截断后格式化为 00:00:20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100075 begin');
      const n: number = 20005;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:20'));
      expect(result).assertEqual('00:00:20');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('20'));
      expect(result.substring(result.length - 2)).assertEqual('20');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100075 end');
    })

    /**
     * @tc.name   testUtilVolume100076
     * @tc.number SUB_CCE_UTILV_10_0076
     * @tc.desc   n=20009（20s+9ms）毫秒残差被 floor 截断后格式化为 00:00:20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100076 begin');
      const n: number = 20009;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:20'));
      expect(result).assertEqual('00:00:20');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('20'));
      expect(result.substring(result.length - 2)).assertEqual('20');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100076 end');
    })

    /**
     * @tc.name   testUtilVolume100077
     * @tc.number SUB_CCE_UTILV_10_0077
     * @tc.desc   n=20050（20s+50ms）毫秒残差被 floor 截断后格式化为 00:00:20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100077 begin');
      const n: number = 20050;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:20'));
      expect(result).assertEqual('00:00:20');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('20'));
      expect(result.substring(result.length - 2)).assertEqual('20');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100077 end');
    })

    /**
     * @tc.name   testUtilVolume100078
     * @tc.number SUB_CCE_UTILV_10_0078
     * @tc.desc   n=20099（20s+99ms）毫秒残差被 floor 截断后格式化为 00:00:20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100078 begin');
      const n: number = 20099;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:20'));
      expect(result).assertEqual('00:00:20');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('20'));
      expect(result.substring(result.length - 2)).assertEqual('20');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100078 end');
    })

    /**
     * @tc.name   testUtilVolume100079
     * @tc.number SUB_CCE_UTILV_10_0079
     * @tc.desc   同秒内 50ms 与 99ms 残差（5050/5099）经 floor 截断后同为 00:00:05
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume100079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100079 begin');
      const r50: string = utils.convertTimeToFormatString(5050);
      const r99: string = utils.convertTimeToFormatString(5099);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', r50, '00:00:05');
      expect(r50).assertEqual('00:00:05');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', r99, '00:00:05');
      expect(r99).assertEqual('00:00:05');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(r50 === r99));
      expect(r50 === r99).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume100079 end');
    })
  })
}
