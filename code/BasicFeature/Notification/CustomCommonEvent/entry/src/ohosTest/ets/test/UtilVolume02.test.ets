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

export default function utilVolume02Test(): void {
  describe('UtilVolume02Test', () => {

    /**
     * @tc.name   testUtilVolume020001
     * @tc.number SUB_CCE_UTILV_02_0001
     * @tc.desc   n=4079000 按 floor 截断到秒后格式化为 01:07:59
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume020001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020001 begin');
      const result: string = utils.convertTimeToFormatString(4079000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('01:07:59'));
      expect(result).assertEqual('01:07:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020001 end');
    })

    /**
     * @tc.name   testUtilVolume020002
     * @tc.number SUB_CCE_UTILV_02_0002
     * @tc.desc   n=7140000 按 floor 截断到秒后格式化为 01:59:00
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume020002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020002 begin');
      const result: string = utils.convertTimeToFormatString(7140000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('01:59:00'));
      expect(result).assertEqual('01:59:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020002 end');
    })

    /**
     * @tc.name   testUtilVolume020003
     * @tc.number SUB_CCE_UTILV_02_0003
     * @tc.desc   n=7199000 按 floor 截断到秒后格式化为 01:59:59
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume020003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020003 begin');
      const result: string = utils.convertTimeToFormatString(7199000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('01:59:59'));
      expect(result).assertEqual('01:59:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020003 end');
    })

    /**
     * @tc.name   testUtilVolume020004
     * @tc.number SUB_CCE_UTILV_02_0004
     * @tc.desc   n=7200000 按 floor 截断到秒后格式化为 02:00:00
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume020004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020004 begin');
      const result: string = utils.convertTimeToFormatString(7200000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('02:00:00'));
      expect(result).assertEqual('02:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020004 end');
    })

    /**
     * @tc.name   testUtilVolume020005
     * @tc.number SUB_CCE_UTILV_02_0005
     * @tc.desc   n=7259000 按 floor 截断到秒后格式化为 02:00:59
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume020005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020005 begin');
      const result: string = utils.convertTimeToFormatString(7259000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('02:00:59'));
      expect(result).assertEqual('02:00:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020005 end');
    })

    /**
     * @tc.name   testUtilVolume020006
     * @tc.number SUB_CCE_UTILV_02_0006
     * @tc.desc   n=7620000 按 floor 截断到秒后格式化为 02:07:00
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume020006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020006 begin');
      const result: string = utils.convertTimeToFormatString(7620000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('02:07:00'));
      expect(result).assertEqual('02:07:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020006 end');
    })

    /**
     * @tc.name   testUtilVolume020007
     * @tc.number SUB_CCE_UTILV_02_0007
     * @tc.desc   n=7679000 按 floor 截断到秒后格式化为 02:07:59
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume020007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020007 begin');
      const result: string = utils.convertTimeToFormatString(7679000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('02:07:59'));
      expect(result).assertEqual('02:07:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020007 end');
    })

    /**
     * @tc.name   testUtilVolume020008
     * @tc.number SUB_CCE_UTILV_02_0008
     * @tc.desc   n=10740000 按 floor 截断到秒后格式化为 02:59:00
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume020008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020008 begin');
      const result: string = utils.convertTimeToFormatString(10740000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('02:59:00'));
      expect(result).assertEqual('02:59:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020008 end');
    })

    /**
     * @tc.name   testUtilVolume020009
     * @tc.number SUB_CCE_UTILV_02_0009
     * @tc.desc   n=10799000 按 floor 截断到秒后格式化为 02:59:59
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume020009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020009 begin');
      const result: string = utils.convertTimeToFormatString(10799000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('02:59:59'));
      expect(result).assertEqual('02:59:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020009 end');
    })

    /**
     * @tc.name   testUtilVolume020010
     * @tc.number SUB_CCE_UTILV_02_0010
     * @tc.desc   n=32400000 按 floor 截断到秒后格式化为 09:00:00
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume020010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020010 begin');
      const result: string = utils.convertTimeToFormatString(32400000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('09:00:00'));
      expect(result).assertEqual('09:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020010 end');
    })

    /**
     * @tc.name   testUtilVolume020011
     * @tc.number SUB_CCE_UTILV_02_0011
     * @tc.desc   n=32459000 按 floor 截断到秒后格式化为 09:00:59
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume020011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020011 begin');
      const result: string = utils.convertTimeToFormatString(32459000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('09:00:59'));
      expect(result).assertEqual('09:00:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020011 end');
    })

    /**
     * @tc.name   testUtilVolume020012
     * @tc.number SUB_CCE_UTILV_02_0012
     * @tc.desc   n=32820000 按 floor 截断到秒后格式化为 09:07:00
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume020012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020012 begin');
      const result: string = utils.convertTimeToFormatString(32820000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('09:07:00'));
      expect(result).assertEqual('09:07:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020012 end');
    })

    /**
     * @tc.name   testUtilVolume020013
     * @tc.number SUB_CCE_UTILV_02_0013
     * @tc.desc   n=32879000 按 floor 截断到秒后格式化为 09:07:59
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume020013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020013 begin');
      const result: string = utils.convertTimeToFormatString(32879000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('09:07:59'));
      expect(result).assertEqual('09:07:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020013 end');
    })

    /**
     * @tc.name   testUtilVolume020014
     * @tc.number SUB_CCE_UTILV_02_0014
     * @tc.desc   n=35940000 按 floor 截断到秒后格式化为 09:59:00
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume020014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020014 begin');
      const result: string = utils.convertTimeToFormatString(35940000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('09:59:00'));
      expect(result).assertEqual('09:59:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020014 end');
    })

    /**
     * @tc.name   testUtilVolume020015
     * @tc.number SUB_CCE_UTILV_02_0015
     * @tc.desc   n=35999000 按 floor 截断到秒后格式化为 09:59:59
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume020015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020015 begin');
      const result: string = utils.convertTimeToFormatString(35999000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('09:59:59'));
      expect(result).assertEqual('09:59:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020015 end');
    })

    /**
     * @tc.name   testUtilVolume020016
     * @tc.number SUB_CCE_UTILV_02_0016
     * @tc.desc   n=36000000 按 floor 截断到秒后格式化为 10:00:00
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume020016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020016 begin');
      const result: string = utils.convertTimeToFormatString(36000000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('10:00:00'));
      expect(result).assertEqual('10:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020016 end');
    })

    /**
     * @tc.name   testUtilVolume020017
     * @tc.number SUB_CCE_UTILV_02_0017
     * @tc.desc   n=36059000 按 floor 截断到秒后格式化为 10:00:59
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume020017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020017 begin');
      const result: string = utils.convertTimeToFormatString(36059000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('10:00:59'));
      expect(result).assertEqual('10:00:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020017 end');
    })

    /**
     * @tc.name   testUtilVolume020018
     * @tc.number SUB_CCE_UTILV_02_0018
     * @tc.desc   n=36420000 按 floor 截断到秒后格式化为 10:07:00
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume020018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020018 begin');
      const result: string = utils.convertTimeToFormatString(36420000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('10:07:00'));
      expect(result).assertEqual('10:07:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020018 end');
    })

    /**
     * @tc.name   testUtilVolume020019
     * @tc.number SUB_CCE_UTILV_02_0019
     * @tc.desc   n=36479000 按 floor 截断到秒后格式化为 10:07:59
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume020019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020019 begin');
      const result: string = utils.convertTimeToFormatString(36479000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('10:07:59'));
      expect(result).assertEqual('10:07:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020019 end');
    })

    /**
     * @tc.name   testUtilVolume020020
     * @tc.number SUB_CCE_UTILV_02_0020
     * @tc.desc   n=39540000 按 floor 截断到秒后格式化为 10:59:00
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume020020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020020 begin');
      const result: string = utils.convertTimeToFormatString(39540000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('10:59:00'));
      expect(result).assertEqual('10:59:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020020 end');
    })

    /**
     * @tc.name   testUtilVolume020021
     * @tc.number SUB_CCE_UTILV_02_0021
     * @tc.desc   n=39599000 按 floor 截断到秒后格式化为 10:59:59
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume020021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020021 begin');
      const result: string = utils.convertTimeToFormatString(39599000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('10:59:59'));
      expect(result).assertEqual('10:59:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020021 end');
    })

    /**
     * @tc.name   testUtilVolume020022
     * @tc.number SUB_CCE_UTILV_02_0022
     * @tc.desc   n=39600000 按 floor 截断到秒后格式化为 11:00:00
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume020022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020022 begin');
      const result: string = utils.convertTimeToFormatString(39600000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('11:00:00'));
      expect(result).assertEqual('11:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020022 end');
    })

    /**
     * @tc.name   testUtilVolume020023
     * @tc.number SUB_CCE_UTILV_02_0023
     * @tc.desc   n=39659000 按 floor 截断到秒后格式化为 11:00:59
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume020023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020023 begin');
      const result: string = utils.convertTimeToFormatString(39659000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('11:00:59'));
      expect(result).assertEqual('11:00:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020023 end');
    })

    /**
     * @tc.name   testUtilVolume020024
     * @tc.number SUB_CCE_UTILV_02_0024
     * @tc.desc   n=40020000 按 floor 截断到秒后格式化为 11:07:00
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume020024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020024 begin');
      const result: string = utils.convertTimeToFormatString(40020000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('11:07:00'));
      expect(result).assertEqual('11:07:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020024 end');
    })

    /**
     * @tc.name   testUtilVolume020025
     * @tc.number SUB_CCE_UTILV_02_0025
     * @tc.desc   n=40079000 按 floor 截断到秒后格式化为 11:07:59
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume020025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020025 begin');
      const result: string = utils.convertTimeToFormatString(40079000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('11:07:59'));
      expect(result).assertEqual('11:07:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020025 end');
    })

    /**
     * @tc.name   testUtilVolume020026
     * @tc.number SUB_CCE_UTILV_02_0026
     * @tc.desc   n=43140000 按 floor 截断到秒后格式化为 11:59:00
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume020026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020026 begin');
      const result: string = utils.convertTimeToFormatString(43140000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('11:59:00'));
      expect(result).assertEqual('11:59:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020026 end');
    })

    /**
     * @tc.name   testUtilVolume020027
     * @tc.number SUB_CCE_UTILV_02_0027
     * @tc.desc   n=43199000 按 floor 截断到秒后格式化为 11:59:59
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume020027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020027 begin');
      const result: string = utils.convertTimeToFormatString(43199000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('11:59:59'));
      expect(result).assertEqual('11:59:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020027 end');
    })

    /**
     * @tc.name   testUtilVolume020028
     * @tc.number SUB_CCE_UTILV_02_0028
     * @tc.desc   n=356400000 按 floor 截断到秒后格式化为 99:00:00
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume020028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020028 begin');
      const result: string = utils.convertTimeToFormatString(356400000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('99:00:00'));
      expect(result).assertEqual('99:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020028 end');
    })

    /**
     * @tc.name   testUtilVolume020029
     * @tc.number SUB_CCE_UTILV_02_0029
     * @tc.desc   n=356459000 按 floor 截断到秒后格式化为 99:00:59
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume020029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020029 begin');
      const result: string = utils.convertTimeToFormatString(356459000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('99:00:59'));
      expect(result).assertEqual('99:00:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020029 end');
    })

    /**
     * @tc.name   testUtilVolume020030
     * @tc.number SUB_CCE_UTILV_02_0030
     * @tc.desc   n=356820000 按 floor 截断到秒后格式化为 99:07:00
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume020030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020030 begin');
      const result: string = utils.convertTimeToFormatString(356820000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('99:07:00'));
      expect(result).assertEqual('99:07:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020030 end');
    })

    /**
     * @tc.name   testUtilVolume020031
     * @tc.number SUB_CCE_UTILV_02_0031
     * @tc.desc   n=356879000 按 floor 截断到秒后格式化为 99:07:59
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume020031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020031 begin');
      const result: string = utils.convertTimeToFormatString(356879000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('99:07:59'));
      expect(result).assertEqual('99:07:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020031 end');
    })

    /**
     * @tc.name   testUtilVolume020032
     * @tc.number SUB_CCE_UTILV_02_0032
     * @tc.desc   n=359940000 按 floor 截断到秒后格式化为 99:59:00
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume020032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020032 begin');
      const result: string = utils.convertTimeToFormatString(359940000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('99:59:00'));
      expect(result).assertEqual('99:59:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020032 end');
    })

    /**
     * @tc.name   testUtilVolume020033
     * @tc.number SUB_CCE_UTILV_02_0033
     * @tc.desc   n=359999000 按 floor 截断到秒后格式化为 99:59:59
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume020033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020033 begin');
      const result: string = utils.convertTimeToFormatString(359999000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('99:59:59'));
      expect(result).assertEqual('99:59:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020033 end');
    })

    /**
     * @tc.name   testUtilVolume020034
     * @tc.number SUB_CCE_UTILV_02_0034
     * @tc.desc   n=3599999 按 floor 截断到秒后格式化为 00:59:59
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume020034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020034 begin');
      const result: string = utils.convertTimeToFormatString(3599999);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:59:59'));
      expect(result).assertEqual('00:59:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020034 end');
    })

    /**
     * @tc.name   testUtilVolume020035
     * @tc.number SUB_CCE_UTILV_02_0035
     * @tc.desc   n=3601000 按 floor 截断到秒后格式化为 01:00:01
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume020035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020035 begin');
      const result: string = utils.convertTimeToFormatString(3601000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('01:00:01'));
      expect(result).assertEqual('01:00:01');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('01'));
      expect(result.substring(result.length - 2)).assertEqual('01');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020035 end');
    })

    /**
     * @tc.name   testUtilVolume020036
     * @tc.number SUB_CCE_UTILV_02_0036
     * @tc.desc   n=86399000 按 floor 截断到秒后格式化为 23:59:59
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume020036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020036 begin');
      const result: string = utils.convertTimeToFormatString(86399000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('23:59:59'));
      expect(result).assertEqual('23:59:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020036 end');
    })

    /**
     * @tc.name   testUtilVolume020037
     * @tc.number SUB_CCE_UTILV_02_0037
     * @tc.desc   n=86399999 按 floor 截断到秒后格式化为 23:59:59
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume020037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020037 begin');
      const result: string = utils.convertTimeToFormatString(86399999);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('23:59:59'));
      expect(result).assertEqual('23:59:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020037 end');
    })

    /**
     * @tc.name   testUtilVolume020038
     * @tc.number SUB_CCE_UTILV_02_0038
     * @tc.desc   n=86400000 按 floor 截断到秒后格式化为 24:00:00
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume020038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020038 begin');
      const result: string = utils.convertTimeToFormatString(86400000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('24:00:00'));
      expect(result).assertEqual('24:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020038 end');
    })

    /**
     * @tc.name   testUtilVolume020039
     * @tc.number SUB_CCE_UTILV_02_0039
     * @tc.desc   n=3600000000 按 floor 截断到秒后格式化为 1000:00:00
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume020039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020039 begin');
      const result: string = utils.convertTimeToFormatString(3600000000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1000:00:00'));
      expect(result).assertEqual('1000:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020039 end');
    })

    /**
     * @tc.name   testUtilVolume020040
     * @tc.number SUB_CCE_UTILV_02_0040
     * @tc.desc   n=36000000000 按 floor 截断到秒后格式化为 10000:00:00
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume020040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020040 begin');
      const result: string = utils.convertTimeToFormatString(36000000000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('10000:00:00'));
      expect(result).assertEqual('10000:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020040 end');
    })

    /**
     * @tc.name   testUtilVolume020041
     * @tc.number SUB_CCE_UTILV_02_0041
     * @tc.desc   n=864000000000 按 floor 截断到秒后格式化为 240000:00:00
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume020041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020041 begin');
      const result: string = utils.convertTimeToFormatString(864000000000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('240000:00:00'));
      expect(result).assertEqual('240000:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020041 end');
    })

    /**
     * @tc.name   testUtilVolume020042
     * @tc.number SUB_CCE_UTILV_02_0042
     * @tc.desc   n=1000000000000 按 floor 截断到秒后格式化为 277777:46:40
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume020042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020042 begin');
      const result: string = utils.convertTimeToFormatString(1000000000000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('277777:46:40'));
      expect(result).assertEqual('277777:46:40');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('40'));
      expect(result.substring(result.length - 2)).assertEqual('40');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020042 end');
    })

    /**
     * @tc.name   testUtilVolume020043
     * @tc.number SUB_CCE_UTILV_02_0043
     * @tc.desc   n=9007199254740991 按 floor 截断到秒后格式化为 2501999792:59:00
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume020043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020043 begin');
      const result: string = utils.convertTimeToFormatString(9007199254740991);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2501999792:59:00'));
      expect(result).assertEqual('2501999792:59:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020043 end');
    })

    /**
     * @tc.name   testUtilVolume020044
     * @tc.number SUB_CCE_UTILV_02_0044
     * @tc.desc   n=-1 按 floor 截断到秒后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume020044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020044 begin');
      const result: string = utils.convertTimeToFormatString(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020044 end');
    })

    /**
     * @tc.name   testUtilVolume020045
     * @tc.number SUB_CCE_UTILV_02_0045
     * @tc.desc   n=-999 按 floor 截断到秒后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume020045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020045 begin');
      const result: string = utils.convertTimeToFormatString(-999);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020045 end');
    })

    /**
     * @tc.name   testUtilVolume020046
     * @tc.number SUB_CCE_UTILV_02_0046
     * @tc.desc   n=-1000 按 floor 截断到秒后格式化为 0-1:0-1:0-1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume020046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020046 begin');
      const result: string = utils.convertTimeToFormatString(-1000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:0-1'));
      expect(result).assertEqual('0-1:0-1:0-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('-1'));
      expect(result.substring(result.length - 2)).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020046 end');
    })

    /**
     * @tc.name   testUtilVolume020047
     * @tc.number SUB_CCE_UTILV_02_0047
     * @tc.desc   n=-59999 按 floor 截断到秒后格式化为 0-1:0-1:00
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume020047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020047 begin');
      const result: string = utils.convertTimeToFormatString(-59999);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:0-1:00'));
      expect(result).assertEqual('0-1:0-1:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020047 end');
    })

    /**
     * @tc.name   testUtilVolume020048
     * @tc.number SUB_CCE_UTILV_02_0048
     * @tc.desc   n=-3600000 按 floor 截断到秒后格式化为 0-1:00:00
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume020048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020048 begin');
      const result: string = utils.convertTimeToFormatString(-3600000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-1:00:00'));
      expect(result).assertEqual('0-1:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020048 end');
    })

    /**
     * @tc.name   testUtilVolume020049
     * @tc.number SUB_CCE_UTILV_02_0049
     * @tc.desc   n=-86400000 按 floor 截断到秒后格式化为 0-24:00:00
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume020049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020049 begin');
      const result: string = utils.convertTimeToFormatString(-86400000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-24:00:00'));
      expect(result).assertEqual('0-24:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020049 end');
    })

    /**
     * @tc.name   testUtilVolume020050
     * @tc.number SUB_CCE_UTILV_02_0050
     * @tc.desc   n=-90000000 按 floor 截断到秒后格式化为 0-25:00:00
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume020050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020050 begin');
      const result: string = utils.convertTimeToFormatString(-90000000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0-25:00:00'));
      expect(result).assertEqual('0-25:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020050 end');
    })

    /**
     * @tc.name   testUtilVolume020051
     * @tc.number SUB_CCE_UTILV_02_0051
     * @tc.desc   n=780000 按 floor 截断到秒后格式化为 00:13:00
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume020051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020051 begin');
      const result: string = utils.convertTimeToFormatString(780000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:13:00'));
      expect(result).assertEqual('00:13:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020051 end');
    })

    /**
     * @tc.name   testUtilVolume020052
     * @tc.number SUB_CCE_UTILV_02_0052
     * @tc.desc   n=781000 按 floor 截断到秒后格式化为 00:13:01
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume020052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020052 begin');
      const result: string = utils.convertTimeToFormatString(781000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:13:01'));
      expect(result).assertEqual('00:13:01');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('01'));
      expect(result.substring(result.length - 2)).assertEqual('01');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020052 end');
    })

    /**
     * @tc.name   testUtilVolume020053
     * @tc.number SUB_CCE_UTILV_02_0053
     * @tc.desc   n=782000 按 floor 截断到秒后格式化为 00:13:02
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume020053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020053 begin');
      const result: string = utils.convertTimeToFormatString(782000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:13:02'));
      expect(result).assertEqual('00:13:02');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('02'));
      expect(result.substring(result.length - 2)).assertEqual('02');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020053 end');
    })

    /**
     * @tc.name   testUtilVolume020054
     * @tc.number SUB_CCE_UTILV_02_0054
     * @tc.desc   负数输入未做保护，记录 0-1 这类非定宽输出（main 缺陷，仅记录）
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume020054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020054 begin');
      const minusOne: string = utils.convertTimeToFormatString(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', minusOne, '0-1:0-1:0-1');
      expect(minusOne).assertEqual('0-1:0-1:0-1');
      const minusHour: string = utils.convertTimeToFormatString(-3600000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', minusHour, '0-1:00:00');
      expect(minusHour).assertEqual('0-1:00:00');
      expect(minusOne.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume020054 end');
    })
  })
}
