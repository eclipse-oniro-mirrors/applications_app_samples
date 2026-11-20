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

export default function utilVolume04Test(): void {
  describe('UtilVolume04Test', () => {

    /**
     * @tc.name   testUtilVolume040001
     * @tc.number SUB_CCE_UTILV_04_0001
     * @tc.desc   n=119999（第 2 分进位界前1ms）按 floor 截断到秒后格式化为 00:01:59
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040001 begin');
      const n: number = 119999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:01:59'));
      expect(result).assertEqual('00:01:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040001 end');
    })

    /**
     * @tc.name   testUtilVolume040002
     * @tc.number SUB_CCE_UTILV_04_0002
     * @tc.desc   n=120001（第 2 分进位界后1ms）按 floor 截断到秒后格式化为 00:02:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040002 begin');
      const n: number = 120001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:02:00'));
      expect(result).assertEqual('00:02:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040002 end');
    })

    /**
     * @tc.name   testUtilVolume040003
     * @tc.number SUB_CCE_UTILV_04_0003
     * @tc.desc   n=120002（第 2 分进位界后2ms）按 floor 截断到秒后格式化为 00:02:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040003 begin');
      const n: number = 120002;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:02:00'));
      expect(result).assertEqual('00:02:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040003 end');
    })

    /**
     * @tc.name   testUtilVolume040004
     * @tc.number SUB_CCE_UTILV_04_0004
     * @tc.desc   n=179999（第 3 分进位界前1ms）按 floor 截断到秒后格式化为 00:02:59
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040004 begin');
      const n: number = 179999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:02:59'));
      expect(result).assertEqual('00:02:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040004 end');
    })

    /**
     * @tc.name   testUtilVolume040005
     * @tc.number SUB_CCE_UTILV_04_0005
     * @tc.desc   n=180001（第 3 分进位界后1ms）按 floor 截断到秒后格式化为 00:03:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040005 begin');
      const n: number = 180001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:03:00'));
      expect(result).assertEqual('00:03:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040005 end');
    })

    /**
     * @tc.name   testUtilVolume040006
     * @tc.number SUB_CCE_UTILV_04_0006
     * @tc.desc   n=180002（第 3 分进位界后2ms）按 floor 截断到秒后格式化为 00:03:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040006 begin');
      const n: number = 180002;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:03:00'));
      expect(result).assertEqual('00:03:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040006 end');
    })

    /**
     * @tc.name   testUtilVolume040007
     * @tc.number SUB_CCE_UTILV_04_0007
     * @tc.desc   n=239999（第 4 分进位界前1ms）按 floor 截断到秒后格式化为 00:03:59
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040007 begin');
      const n: number = 239999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:03:59'));
      expect(result).assertEqual('00:03:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040007 end');
    })

    /**
     * @tc.name   testUtilVolume040008
     * @tc.number SUB_CCE_UTILV_04_0008
     * @tc.desc   n=240001（第 4 分进位界后1ms）按 floor 截断到秒后格式化为 00:04:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040008 begin');
      const n: number = 240001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:04:00'));
      expect(result).assertEqual('00:04:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040008 end');
    })

    /**
     * @tc.name   testUtilVolume040009
     * @tc.number SUB_CCE_UTILV_04_0009
     * @tc.desc   n=240002（第 4 分进位界后2ms）按 floor 截断到秒后格式化为 00:04:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040009 begin');
      const n: number = 240002;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:04:00'));
      expect(result).assertEqual('00:04:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040009 end');
    })

    /**
     * @tc.name   testUtilVolume040010
     * @tc.number SUB_CCE_UTILV_04_0010
     * @tc.desc   n=299999（第 5 分进位界前1ms）按 floor 截断到秒后格式化为 00:04:59
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040010 begin');
      const n: number = 299999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:04:59'));
      expect(result).assertEqual('00:04:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040010 end');
    })

    /**
     * @tc.name   testUtilVolume040011
     * @tc.number SUB_CCE_UTILV_04_0011
     * @tc.desc   n=300001（第 5 分进位界后1ms）按 floor 截断到秒后格式化为 00:05:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040011 begin');
      const n: number = 300001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:05:00'));
      expect(result).assertEqual('00:05:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040011 end');
    })

    /**
     * @tc.name   testUtilVolume040012
     * @tc.number SUB_CCE_UTILV_04_0012
     * @tc.desc   n=300002（第 5 分进位界后2ms）按 floor 截断到秒后格式化为 00:05:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040012 begin');
      const n: number = 300002;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:05:00'));
      expect(result).assertEqual('00:05:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040012 end');
    })

    /**
     * @tc.name   testUtilVolume040013
     * @tc.number SUB_CCE_UTILV_04_0013
     * @tc.desc   n=359999（第 6 分进位界前1ms）按 floor 截断到秒后格式化为 00:05:59
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040013 begin');
      const n: number = 359999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:05:59'));
      expect(result).assertEqual('00:05:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040013 end');
    })

    /**
     * @tc.name   testUtilVolume040014
     * @tc.number SUB_CCE_UTILV_04_0014
     * @tc.desc   n=360001（第 6 分进位界后1ms）按 floor 截断到秒后格式化为 00:06:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040014 begin');
      const n: number = 360001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:06:00'));
      expect(result).assertEqual('00:06:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040014 end');
    })

    /**
     * @tc.name   testUtilVolume040015
     * @tc.number SUB_CCE_UTILV_04_0015
     * @tc.desc   n=360002（第 6 分进位界后2ms）按 floor 截断到秒后格式化为 00:06:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040015 begin');
      const n: number = 360002;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:06:00'));
      expect(result).assertEqual('00:06:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040015 end');
    })

    /**
     * @tc.name   testUtilVolume040016
     * @tc.number SUB_CCE_UTILV_04_0016
     * @tc.desc   n=419999（第 7 分进位界前1ms）按 floor 截断到秒后格式化为 00:06:59
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040016 begin');
      const n: number = 419999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:06:59'));
      expect(result).assertEqual('00:06:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040016 end');
    })

    /**
     * @tc.name   testUtilVolume040017
     * @tc.number SUB_CCE_UTILV_04_0017
     * @tc.desc   n=420001（第 7 分进位界后1ms）按 floor 截断到秒后格式化为 00:07:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040017 begin');
      const n: number = 420001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:07:00'));
      expect(result).assertEqual('00:07:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040017 end');
    })

    /**
     * @tc.name   testUtilVolume040018
     * @tc.number SUB_CCE_UTILV_04_0018
     * @tc.desc   n=420002（第 7 分进位界后2ms）按 floor 截断到秒后格式化为 00:07:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040018 begin');
      const n: number = 420002;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:07:00'));
      expect(result).assertEqual('00:07:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040018 end');
    })

    /**
     * @tc.name   testUtilVolume040019
     * @tc.number SUB_CCE_UTILV_04_0019
     * @tc.desc   n=479999（第 8 分进位界前1ms）按 floor 截断到秒后格式化为 00:07:59
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040019 begin');
      const n: number = 479999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:07:59'));
      expect(result).assertEqual('00:07:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040019 end');
    })

    /**
     * @tc.name   testUtilVolume040020
     * @tc.number SUB_CCE_UTILV_04_0020
     * @tc.desc   n=480001（第 8 分进位界后1ms）按 floor 截断到秒后格式化为 00:08:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040020 begin');
      const n: number = 480001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:08:00'));
      expect(result).assertEqual('00:08:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040020 end');
    })

    /**
     * @tc.name   testUtilVolume040021
     * @tc.number SUB_CCE_UTILV_04_0021
     * @tc.desc   n=480002（第 8 分进位界后2ms）按 floor 截断到秒后格式化为 00:08:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040021 begin');
      const n: number = 480002;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:08:00'));
      expect(result).assertEqual('00:08:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040021 end');
    })

    /**
     * @tc.name   testUtilVolume040022
     * @tc.number SUB_CCE_UTILV_04_0022
     * @tc.desc   n=539999（第 9 分进位界前1ms）按 floor 截断到秒后格式化为 00:08:59
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040022 begin');
      const n: number = 539999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:08:59'));
      expect(result).assertEqual('00:08:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040022 end');
    })

    /**
     * @tc.name   testUtilVolume040023
     * @tc.number SUB_CCE_UTILV_04_0023
     * @tc.desc   n=540001（第 9 分进位界后1ms）按 floor 截断到秒后格式化为 00:09:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040023 begin');
      const n: number = 540001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:09:00'));
      expect(result).assertEqual('00:09:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040023 end');
    })

    /**
     * @tc.name   testUtilVolume040024
     * @tc.number SUB_CCE_UTILV_04_0024
     * @tc.desc   n=540002（第 9 分进位界后2ms）按 floor 截断到秒后格式化为 00:09:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040024 begin');
      const n: number = 540002;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:09:00'));
      expect(result).assertEqual('00:09:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040024 end');
    })

    /**
     * @tc.name   testUtilVolume040025
     * @tc.number SUB_CCE_UTILV_04_0025
     * @tc.desc   n=599999（第 10 分进位界前1ms）按 floor 截断到秒后格式化为 00:09:59
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040025 begin');
      const n: number = 599999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:09:59'));
      expect(result).assertEqual('00:09:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040025 end');
    })

    /**
     * @tc.name   testUtilVolume040026
     * @tc.number SUB_CCE_UTILV_04_0026
     * @tc.desc   n=600001（第 10 分进位界后1ms）按 floor 截断到秒后格式化为 00:10:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040026 begin');
      const n: number = 600001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:10:00'));
      expect(result).assertEqual('00:10:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040026 end');
    })

    /**
     * @tc.name   testUtilVolume040027
     * @tc.number SUB_CCE_UTILV_04_0027
     * @tc.desc   n=600002（第 10 分进位界后2ms）按 floor 截断到秒后格式化为 00:10:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040027 begin');
      const n: number = 600002;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:10:00'));
      expect(result).assertEqual('00:10:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040027 end');
    })

    /**
     * @tc.name   testUtilVolume040028
     * @tc.number SUB_CCE_UTILV_04_0028
     * @tc.desc   n=659999（第 11 分进位界前1ms）按 floor 截断到秒后格式化为 00:10:59
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040028 begin');
      const n: number = 659999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:10:59'));
      expect(result).assertEqual('00:10:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040028 end');
    })

    /**
     * @tc.name   testUtilVolume040029
     * @tc.number SUB_CCE_UTILV_04_0029
     * @tc.desc   n=660001（第 11 分进位界后1ms）按 floor 截断到秒后格式化为 00:11:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040029 begin');
      const n: number = 660001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:11:00'));
      expect(result).assertEqual('00:11:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040029 end');
    })

    /**
     * @tc.name   testUtilVolume040030
     * @tc.number SUB_CCE_UTILV_04_0030
     * @tc.desc   n=660002（第 11 分进位界后2ms）按 floor 截断到秒后格式化为 00:11:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040030 begin');
      const n: number = 660002;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:11:00'));
      expect(result).assertEqual('00:11:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040030 end');
    })

    /**
     * @tc.name   testUtilVolume040031
     * @tc.number SUB_CCE_UTILV_04_0031
     * @tc.desc   n=719999（第 12 分进位界前1ms）按 floor 截断到秒后格式化为 00:11:59
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040031 begin');
      const n: number = 719999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:11:59'));
      expect(result).assertEqual('00:11:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040031 end');
    })

    /**
     * @tc.name   testUtilVolume040032
     * @tc.number SUB_CCE_UTILV_04_0032
     * @tc.desc   n=720001（第 12 分进位界后1ms）按 floor 截断到秒后格式化为 00:12:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040032 begin');
      const n: number = 720001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:12:00'));
      expect(result).assertEqual('00:12:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040032 end');
    })

    /**
     * @tc.name   testUtilVolume040033
     * @tc.number SUB_CCE_UTILV_04_0033
     * @tc.desc   n=720002（第 12 分进位界后2ms）按 floor 截断到秒后格式化为 00:12:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040033 begin');
      const n: number = 720002;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:12:00'));
      expect(result).assertEqual('00:12:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040033 end');
    })

    /**
     * @tc.name   testUtilVolume040034
     * @tc.number SUB_CCE_UTILV_04_0034
     * @tc.desc   n=779999（第 13 分进位界前1ms）按 floor 截断到秒后格式化为 00:12:59
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040034 begin');
      const n: number = 779999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:12:59'));
      expect(result).assertEqual('00:12:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040034 end');
    })

    /**
     * @tc.name   testUtilVolume040035
     * @tc.number SUB_CCE_UTILV_04_0035
     * @tc.desc   n=780001（第 13 分进位界后1ms）按 floor 截断到秒后格式化为 00:13:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040035 begin');
      const n: number = 780001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:13:00'));
      expect(result).assertEqual('00:13:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040035 end');
    })

    /**
     * @tc.name   testUtilVolume040036
     * @tc.number SUB_CCE_UTILV_04_0036
     * @tc.desc   n=780002（第 13 分进位界后2ms）按 floor 截断到秒后格式化为 00:13:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040036 begin');
      const n: number = 780002;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:13:00'));
      expect(result).assertEqual('00:13:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040036 end');
    })

    /**
     * @tc.name   testUtilVolume040037
     * @tc.number SUB_CCE_UTILV_04_0037
     * @tc.desc   n=839999（第 14 分进位界前1ms）按 floor 截断到秒后格式化为 00:13:59
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040037 begin');
      const n: number = 839999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:13:59'));
      expect(result).assertEqual('00:13:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040037 end');
    })

    /**
     * @tc.name   testUtilVolume040038
     * @tc.number SUB_CCE_UTILV_04_0038
     * @tc.desc   n=840001（第 14 分进位界后1ms）按 floor 截断到秒后格式化为 00:14:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040038 begin');
      const n: number = 840001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:14:00'));
      expect(result).assertEqual('00:14:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040038 end');
    })

    /**
     * @tc.name   testUtilVolume040039
     * @tc.number SUB_CCE_UTILV_04_0039
     * @tc.desc   n=840002（第 14 分进位界后2ms）按 floor 截断到秒后格式化为 00:14:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040039 begin');
      const n: number = 840002;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:14:00'));
      expect(result).assertEqual('00:14:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040039 end');
    })

    /**
     * @tc.name   testUtilVolume040040
     * @tc.number SUB_CCE_UTILV_04_0040
     * @tc.desc   n=899999（第 15 分进位界前1ms）按 floor 截断到秒后格式化为 00:14:59
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040040 begin');
      const n: number = 899999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:14:59'));
      expect(result).assertEqual('00:14:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040040 end');
    })

    /**
     * @tc.name   testUtilVolume040041
     * @tc.number SUB_CCE_UTILV_04_0041
     * @tc.desc   n=900001（第 15 分进位界后1ms）按 floor 截断到秒后格式化为 00:15:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040041 begin');
      const n: number = 900001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:15:00'));
      expect(result).assertEqual('00:15:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040041 end');
    })

    /**
     * @tc.name   testUtilVolume040042
     * @tc.number SUB_CCE_UTILV_04_0042
     * @tc.desc   n=900002（第 15 分进位界后2ms）按 floor 截断到秒后格式化为 00:15:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040042 begin');
      const n: number = 900002;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:15:00'));
      expect(result).assertEqual('00:15:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040042 end');
    })

    /**
     * @tc.name   testUtilVolume040043
     * @tc.number SUB_CCE_UTILV_04_0043
     * @tc.desc   n=959999（第 16 分进位界前1ms）按 floor 截断到秒后格式化为 00:15:59
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040043 begin');
      const n: number = 959999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:15:59'));
      expect(result).assertEqual('00:15:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040043 end');
    })

    /**
     * @tc.name   testUtilVolume040044
     * @tc.number SUB_CCE_UTILV_04_0044
     * @tc.desc   n=960001（第 16 分进位界后1ms）按 floor 截断到秒后格式化为 00:16:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040044 begin');
      const n: number = 960001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:16:00'));
      expect(result).assertEqual('00:16:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040044 end');
    })

    /**
     * @tc.name   testUtilVolume040045
     * @tc.number SUB_CCE_UTILV_04_0045
     * @tc.desc   n=960002（第 16 分进位界后2ms）按 floor 截断到秒后格式化为 00:16:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040045 begin');
      const n: number = 960002;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:16:00'));
      expect(result).assertEqual('00:16:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040045 end');
    })

    /**
     * @tc.name   testUtilVolume040046
     * @tc.number SUB_CCE_UTILV_04_0046
     * @tc.desc   n=1019999（第 17 分进位界前1ms）按 floor 截断到秒后格式化为 00:16:59
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040046 begin');
      const n: number = 1019999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:16:59'));
      expect(result).assertEqual('00:16:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040046 end');
    })

    /**
     * @tc.name   testUtilVolume040047
     * @tc.number SUB_CCE_UTILV_04_0047
     * @tc.desc   n=1020001（第 17 分进位界后1ms）按 floor 截断到秒后格式化为 00:17:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040047 begin');
      const n: number = 1020001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:17:00'));
      expect(result).assertEqual('00:17:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040047 end');
    })

    /**
     * @tc.name   testUtilVolume040048
     * @tc.number SUB_CCE_UTILV_04_0048
     * @tc.desc   n=1020002（第 17 分进位界后2ms）按 floor 截断到秒后格式化为 00:17:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040048 begin');
      const n: number = 1020002;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:17:00'));
      expect(result).assertEqual('00:17:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040048 end');
    })

    /**
     * @tc.name   testUtilVolume040049
     * @tc.number SUB_CCE_UTILV_04_0049
     * @tc.desc   n=1079999（第 18 分进位界前1ms）按 floor 截断到秒后格式化为 00:17:59
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040049 begin');
      const n: number = 1079999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:17:59'));
      expect(result).assertEqual('00:17:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040049 end');
    })

    /**
     * @tc.name   testUtilVolume040050
     * @tc.number SUB_CCE_UTILV_04_0050
     * @tc.desc   n=1080001（第 18 分进位界后1ms）按 floor 截断到秒后格式化为 00:18:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040050 begin');
      const n: number = 1080001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:18:00'));
      expect(result).assertEqual('00:18:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040050 end');
    })

    /**
     * @tc.name   testUtilVolume040051
     * @tc.number SUB_CCE_UTILV_04_0051
     * @tc.desc   n=1080002（第 18 分进位界后2ms）按 floor 截断到秒后格式化为 00:18:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040051 begin');
      const n: number = 1080002;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:18:00'));
      expect(result).assertEqual('00:18:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040051 end');
    })

    /**
     * @tc.name   testUtilVolume040052
     * @tc.number SUB_CCE_UTILV_04_0052
     * @tc.desc   n=1139999（第 19 分进位界前1ms）按 floor 截断到秒后格式化为 00:18:59
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040052 begin');
      const n: number = 1139999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:18:59'));
      expect(result).assertEqual('00:18:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040052 end');
    })

    /**
     * @tc.name   testUtilVolume040053
     * @tc.number SUB_CCE_UTILV_04_0053
     * @tc.desc   n=1140001（第 19 分进位界后1ms）按 floor 截断到秒后格式化为 00:19:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040053 begin');
      const n: number = 1140001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:19:00'));
      expect(result).assertEqual('00:19:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040053 end');
    })

    /**
     * @tc.name   testUtilVolume040054
     * @tc.number SUB_CCE_UTILV_04_0054
     * @tc.desc   n=1140002（第 19 分进位界后2ms）按 floor 截断到秒后格式化为 00:19:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040054 begin');
      const n: number = 1140002;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:19:00'));
      expect(result).assertEqual('00:19:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040054 end');
    })

    /**
     * @tc.name   testUtilVolume040055
     * @tc.number SUB_CCE_UTILV_04_0055
     * @tc.desc   n=1199999（第 20 分进位界前1ms）按 floor 截断到秒后格式化为 00:19:59
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040055 begin');
      const n: number = 1199999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:19:59'));
      expect(result).assertEqual('00:19:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040055 end');
    })

    /**
     * @tc.name   testUtilVolume040056
     * @tc.number SUB_CCE_UTILV_04_0056
     * @tc.desc   n=1200001（第 20 分进位界后1ms）按 floor 截断到秒后格式化为 00:20:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040056 begin');
      const n: number = 1200001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:20:00'));
      expect(result).assertEqual('00:20:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040056 end');
    })

    /**
     * @tc.name   testUtilVolume040057
     * @tc.number SUB_CCE_UTILV_04_0057
     * @tc.desc   n=1200002（第 20 分进位界后2ms）按 floor 截断到秒后格式化为 00:20:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040057 begin');
      const n: number = 1200002;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:20:00'));
      expect(result).assertEqual('00:20:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040057 end');
    })

    /**
     * @tc.name   testUtilVolume040058
     * @tc.number SUB_CCE_UTILV_04_0058
     * @tc.desc   n=1259999（第 21 分进位界前1ms）按 floor 截断到秒后格式化为 00:20:59
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040058 begin');
      const n: number = 1259999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:20:59'));
      expect(result).assertEqual('00:20:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040058 end');
    })

    /**
     * @tc.name   testUtilVolume040059
     * @tc.number SUB_CCE_UTILV_04_0059
     * @tc.desc   n=1260001（第 21 分进位界后1ms）按 floor 截断到秒后格式化为 00:21:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040059 begin');
      const n: number = 1260001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:21:00'));
      expect(result).assertEqual('00:21:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040059 end');
    })

    /**
     * @tc.name   testUtilVolume040060
     * @tc.number SUB_CCE_UTILV_04_0060
     * @tc.desc   n=1260002（第 21 分进位界后2ms）按 floor 截断到秒后格式化为 00:21:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040060 begin');
      const n: number = 1260002;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:21:00'));
      expect(result).assertEqual('00:21:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040060 end');
    })

    /**
     * @tc.name   testUtilVolume040061
     * @tc.number SUB_CCE_UTILV_04_0061
     * @tc.desc   n=7199999（第 2 时进位界前1ms）按 floor 截断到秒后格式化为 01:59:59
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040061 begin');
      const n: number = 7199999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('01:59:59'));
      expect(result).assertEqual('01:59:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040061 end');
    })

    /**
     * @tc.name   testUtilVolume040062
     * @tc.number SUB_CCE_UTILV_04_0062
     * @tc.desc   n=7200001（第 2 时进位界后1ms）按 floor 截断到秒后格式化为 02:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040062 begin');
      const n: number = 7200001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('02:00:00'));
      expect(result).assertEqual('02:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040062 end');
    })

    /**
     * @tc.name   testUtilVolume040063
     * @tc.number SUB_CCE_UTILV_04_0063
     * @tc.desc   n=7200002（第 2 时进位界后2ms）按 floor 截断到秒后格式化为 02:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040063 begin');
      const n: number = 7200002;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('02:00:00'));
      expect(result).assertEqual('02:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040063 end');
    })

    /**
     * @tc.name   testUtilVolume040064
     * @tc.number SUB_CCE_UTILV_04_0064
     * @tc.desc   n=10799999（第 3 时进位界前1ms）按 floor 截断到秒后格式化为 02:59:59
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040064 begin');
      const n: number = 10799999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('02:59:59'));
      expect(result).assertEqual('02:59:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040064 end');
    })

    /**
     * @tc.name   testUtilVolume040065
     * @tc.number SUB_CCE_UTILV_04_0065
     * @tc.desc   n=10800001（第 3 时进位界后1ms）按 floor 截断到秒后格式化为 03:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040065 begin');
      const n: number = 10800001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('03:00:00'));
      expect(result).assertEqual('03:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040065 end');
    })

    /**
     * @tc.name   testUtilVolume040066
     * @tc.number SUB_CCE_UTILV_04_0066
     * @tc.desc   n=10800002（第 3 时进位界后2ms）按 floor 截断到秒后格式化为 03:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040066 begin');
      const n: number = 10800002;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('03:00:00'));
      expect(result).assertEqual('03:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040066 end');
    })

    /**
     * @tc.name   testUtilVolume040067
     * @tc.number SUB_CCE_UTILV_04_0067
     * @tc.desc   n=14399999（第 4 时进位界前1ms）按 floor 截断到秒后格式化为 03:59:59
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040067 begin');
      const n: number = 14399999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('03:59:59'));
      expect(result).assertEqual('03:59:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040067 end');
    })

    /**
     * @tc.name   testUtilVolume040068
     * @tc.number SUB_CCE_UTILV_04_0068
     * @tc.desc   n=14400001（第 4 时进位界后1ms）按 floor 截断到秒后格式化为 04:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040068 begin');
      const n: number = 14400001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('04:00:00'));
      expect(result).assertEqual('04:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040068 end');
    })

    /**
     * @tc.name   testUtilVolume040069
     * @tc.number SUB_CCE_UTILV_04_0069
     * @tc.desc   n=14400002（第 4 时进位界后2ms）按 floor 截断到秒后格式化为 04:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040069 begin');
      const n: number = 14400002;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('04:00:00'));
      expect(result).assertEqual('04:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040069 end');
    })

    /**
     * @tc.name   testUtilVolume040070
     * @tc.number SUB_CCE_UTILV_04_0070
     * @tc.desc   n=17999999（第 5 时进位界前1ms）按 floor 截断到秒后格式化为 04:59:59
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040070 begin');
      const n: number = 17999999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('04:59:59'));
      expect(result).assertEqual('04:59:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040070 end');
    })

    /**
     * @tc.name   testUtilVolume040071
     * @tc.number SUB_CCE_UTILV_04_0071
     * @tc.desc   n=18000001（第 5 时进位界后1ms）按 floor 截断到秒后格式化为 05:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040071 begin');
      const n: number = 18000001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('05:00:00'));
      expect(result).assertEqual('05:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040071 end');
    })

    /**
     * @tc.name   testUtilVolume040072
     * @tc.number SUB_CCE_UTILV_04_0072
     * @tc.desc   n=18000002（第 5 时进位界后2ms）按 floor 截断到秒后格式化为 05:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040072 begin');
      const n: number = 18000002;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('05:00:00'));
      expect(result).assertEqual('05:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040072 end');
    })

    /**
     * @tc.name   testUtilVolume040073
     * @tc.number SUB_CCE_UTILV_04_0073
     * @tc.desc   n=21599999（第 6 时进位界前1ms）按 floor 截断到秒后格式化为 05:59:59
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040073 begin');
      const n: number = 21599999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('05:59:59'));
      expect(result).assertEqual('05:59:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040073 end');
    })

    /**
     * @tc.name   testUtilVolume040074
     * @tc.number SUB_CCE_UTILV_04_0074
     * @tc.desc   n=21600001（第 6 时进位界后1ms）按 floor 截断到秒后格式化为 06:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040074 begin');
      const n: number = 21600001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('06:00:00'));
      expect(result).assertEqual('06:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040074 end');
    })

    /**
     * @tc.name   testUtilVolume040075
     * @tc.number SUB_CCE_UTILV_04_0075
     * @tc.desc   n=21600002（第 6 时进位界后2ms）按 floor 截断到秒后格式化为 06:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040075 begin');
      const n: number = 21600002;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('06:00:00'));
      expect(result).assertEqual('06:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040075 end');
    })

    /**
     * @tc.name   testUtilVolume040076
     * @tc.number SUB_CCE_UTILV_04_0076
     * @tc.desc   n=25199999（第 7 时进位界前1ms）按 floor 截断到秒后格式化为 06:59:59
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040076 begin');
      const n: number = 25199999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('06:59:59'));
      expect(result).assertEqual('06:59:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040076 end');
    })

    /**
     * @tc.name   testUtilVolume040077
     * @tc.number SUB_CCE_UTILV_04_0077
     * @tc.desc   n=25200001（第 7 时进位界后1ms）按 floor 截断到秒后格式化为 07:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040077 begin');
      const n: number = 25200001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('07:00:00'));
      expect(result).assertEqual('07:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040077 end');
    })

    /**
     * @tc.name   testUtilVolume040078
     * @tc.number SUB_CCE_UTILV_04_0078
     * @tc.desc   n=25200002（第 7 时进位界后2ms）按 floor 截断到秒后格式化为 07:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040078 begin');
      const n: number = 25200002;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('07:00:00'));
      expect(result).assertEqual('07:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040078 end');
    })

    /**
     * @tc.name   testUtilVolume040079
     * @tc.number SUB_CCE_UTILV_04_0079
     * @tc.desc   第 30 分进位界前 1ms 为 00:29:59，后 2ms 已进位为 00:30:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume040079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040079 begin');
      const before: string = utils.convertTimeToFormatString(1799999);
      const after: string = utils.convertTimeToFormatString(1800002);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', before, '00:29:59');
      expect(before).assertEqual('00:29:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', after, '00:30:00');
      expect(after).assertEqual('00:30:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(before !== after));
      expect(before !== after).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume040079 end');
    })
  })
}
