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

export default function utilVolume03Test(): void {
  describe('UtilVolume03Test', () => {

    /**
     * @tc.name   testUtilVolume030001
     * @tc.number SUB_CCE_UTILV_03_0001
     * @tc.desc   n=172799999（第 2 天日界前1ms）按 floor 截断到秒后格式化为 47:59:59
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030001 begin');
      const n: number = 172799999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('47:59:59'));
      expect(result).assertEqual('47:59:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030001 end');
    })

    /**
     * @tc.name   testUtilVolume030002
     * @tc.number SUB_CCE_UTILV_03_0002
     * @tc.desc   n=172800001（第 2 天日界后1ms）按 floor 截断到秒后格式化为 48:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030002 begin');
      const n: number = 172800001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48:00:00'));
      expect(result).assertEqual('48:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030002 end');
    })

    /**
     * @tc.name   testUtilVolume030003
     * @tc.number SUB_CCE_UTILV_03_0003
     * @tc.desc   n=259199999（第 3 天日界前1ms）按 floor 截断到秒后格式化为 71:59:59
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030003 begin');
      const n: number = 259199999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('71:59:59'));
      expect(result).assertEqual('71:59:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030003 end');
    })

    /**
     * @tc.name   testUtilVolume030004
     * @tc.number SUB_CCE_UTILV_03_0004
     * @tc.desc   n=259200001（第 3 天日界后1ms）按 floor 截断到秒后格式化为 72:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030004 begin');
      const n: number = 259200001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('72:00:00'));
      expect(result).assertEqual('72:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030004 end');
    })

    /**
     * @tc.name   testUtilVolume030005
     * @tc.number SUB_CCE_UTILV_03_0005
     * @tc.desc   n=345599999（第 4 天日界前1ms）按 floor 截断到秒后格式化为 95:59:59
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030005 begin');
      const n: number = 345599999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('95:59:59'));
      expect(result).assertEqual('95:59:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030005 end');
    })

    /**
     * @tc.name   testUtilVolume030006
     * @tc.number SUB_CCE_UTILV_03_0006
     * @tc.desc   n=345600001（第 4 天日界后1ms）按 floor 截断到秒后格式化为 96:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030006 begin');
      const n: number = 345600001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('96:00:00'));
      expect(result).assertEqual('96:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030006 end');
    })

    /**
     * @tc.name   testUtilVolume030007
     * @tc.number SUB_CCE_UTILV_03_0007
     * @tc.desc   n=431999999（第 5 天日界前1ms）按 floor 截断到秒后格式化为 119:59:59
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030007 begin');
      const n: number = 431999999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('119:59:59'));
      expect(result).assertEqual('119:59:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030007 end');
    })

    /**
     * @tc.name   testUtilVolume030008
     * @tc.number SUB_CCE_UTILV_03_0008
     * @tc.desc   n=432000001（第 5 天日界后1ms）按 floor 截断到秒后格式化为 120:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030008 begin');
      const n: number = 432000001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('120:00:00'));
      expect(result).assertEqual('120:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030008 end');
    })

    /**
     * @tc.name   testUtilVolume030009
     * @tc.number SUB_CCE_UTILV_03_0009
     * @tc.desc   n=518399999（第 6 天日界前1ms）按 floor 截断到秒后格式化为 143:59:59
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030009 begin');
      const n: number = 518399999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('143:59:59'));
      expect(result).assertEqual('143:59:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030009 end');
    })

    /**
     * @tc.name   testUtilVolume030010
     * @tc.number SUB_CCE_UTILV_03_0010
     * @tc.desc   n=518400001（第 6 天日界后1ms）按 floor 截断到秒后格式化为 144:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030010 begin');
      const n: number = 518400001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('144:00:00'));
      expect(result).assertEqual('144:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030010 end');
    })

    /**
     * @tc.name   testUtilVolume030011
     * @tc.number SUB_CCE_UTILV_03_0011
     * @tc.desc   n=604799999（第 7 天日界前1ms）按 floor 截断到秒后格式化为 167:59:59
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030011 begin');
      const n: number = 604799999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('167:59:59'));
      expect(result).assertEqual('167:59:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030011 end');
    })

    /**
     * @tc.name   testUtilVolume030012
     * @tc.number SUB_CCE_UTILV_03_0012
     * @tc.desc   n=604800001（第 7 天日界后1ms）按 floor 截断到秒后格式化为 168:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030012 begin');
      const n: number = 604800001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('168:00:00'));
      expect(result).assertEqual('168:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030012 end');
    })

    /**
     * @tc.name   testUtilVolume030013
     * @tc.number SUB_CCE_UTILV_03_0013
     * @tc.desc   n=691199999（第 8 天日界前1ms）按 floor 截断到秒后格式化为 191:59:59
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030013 begin');
      const n: number = 691199999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('191:59:59'));
      expect(result).assertEqual('191:59:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030013 end');
    })

    /**
     * @tc.name   testUtilVolume030014
     * @tc.number SUB_CCE_UTILV_03_0014
     * @tc.desc   n=691200001（第 8 天日界后1ms）按 floor 截断到秒后格式化为 192:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030014 begin');
      const n: number = 691200001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('192:00:00'));
      expect(result).assertEqual('192:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030014 end');
    })

    /**
     * @tc.name   testUtilVolume030015
     * @tc.number SUB_CCE_UTILV_03_0015
     * @tc.desc   n=777599999（第 9 天日界前1ms）按 floor 截断到秒后格式化为 215:59:59
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030015 begin');
      const n: number = 777599999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('215:59:59'));
      expect(result).assertEqual('215:59:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030015 end');
    })

    /**
     * @tc.name   testUtilVolume030016
     * @tc.number SUB_CCE_UTILV_03_0016
     * @tc.desc   n=777600001（第 9 天日界后1ms）按 floor 截断到秒后格式化为 216:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030016 begin');
      const n: number = 777600001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('216:00:00'));
      expect(result).assertEqual('216:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030016 end');
    })

    /**
     * @tc.name   testUtilVolume030017
     * @tc.number SUB_CCE_UTILV_03_0017
     * @tc.desc   n=863999999（第 10 天日界前1ms）按 floor 截断到秒后格式化为 239:59:59
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030017 begin');
      const n: number = 863999999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('239:59:59'));
      expect(result).assertEqual('239:59:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030017 end');
    })

    /**
     * @tc.name   testUtilVolume030018
     * @tc.number SUB_CCE_UTILV_03_0018
     * @tc.desc   n=864000001（第 10 天日界后1ms）按 floor 截断到秒后格式化为 240:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030018 begin');
      const n: number = 864000001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('240:00:00'));
      expect(result).assertEqual('240:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030018 end');
    })

    /**
     * @tc.name   testUtilVolume030019
     * @tc.number SUB_CCE_UTILV_03_0019
     * @tc.desc   n=950399999（第 11 天日界前1ms）按 floor 截断到秒后格式化为 263:59:59
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030019 begin');
      const n: number = 950399999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('263:59:59'));
      expect(result).assertEqual('263:59:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030019 end');
    })

    /**
     * @tc.name   testUtilVolume030020
     * @tc.number SUB_CCE_UTILV_03_0020
     * @tc.desc   n=950400001（第 11 天日界后1ms）按 floor 截断到秒后格式化为 264:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030020 begin');
      const n: number = 950400001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('264:00:00'));
      expect(result).assertEqual('264:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030020 end');
    })

    /**
     * @tc.name   testUtilVolume030021
     * @tc.number SUB_CCE_UTILV_03_0021
     * @tc.desc   n=1036799999（第 12 天日界前1ms）按 floor 截断到秒后格式化为 287:59:59
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030021 begin');
      const n: number = 1036799999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('287:59:59'));
      expect(result).assertEqual('287:59:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030021 end');
    })

    /**
     * @tc.name   testUtilVolume030022
     * @tc.number SUB_CCE_UTILV_03_0022
     * @tc.desc   n=1036800001（第 12 天日界后1ms）按 floor 截断到秒后格式化为 288:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030022 begin');
      const n: number = 1036800001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('288:00:00'));
      expect(result).assertEqual('288:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030022 end');
    })

    /**
     * @tc.name   testUtilVolume030023
     * @tc.number SUB_CCE_UTILV_03_0023
     * @tc.desc   n=1123199999（第 13 天日界前1ms）按 floor 截断到秒后格式化为 311:59:59
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030023 begin');
      const n: number = 1123199999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('311:59:59'));
      expect(result).assertEqual('311:59:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030023 end');
    })

    /**
     * @tc.name   testUtilVolume030024
     * @tc.number SUB_CCE_UTILV_03_0024
     * @tc.desc   n=1123200001（第 13 天日界后1ms）按 floor 截断到秒后格式化为 312:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030024 begin');
      const n: number = 1123200001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('312:00:00'));
      expect(result).assertEqual('312:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030024 end');
    })

    /**
     * @tc.name   testUtilVolume030025
     * @tc.number SUB_CCE_UTILV_03_0025
     * @tc.desc   n=1209599999（第 14 天日界前1ms）按 floor 截断到秒后格式化为 335:59:59
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030025 begin');
      const n: number = 1209599999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('335:59:59'));
      expect(result).assertEqual('335:59:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030025 end');
    })

    /**
     * @tc.name   testUtilVolume030026
     * @tc.number SUB_CCE_UTILV_03_0026
     * @tc.desc   n=1209600001（第 14 天日界后1ms）按 floor 截断到秒后格式化为 336:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030026 begin');
      const n: number = 1209600001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('336:00:00'));
      expect(result).assertEqual('336:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030026 end');
    })

    /**
     * @tc.name   testUtilVolume030027
     * @tc.number SUB_CCE_UTILV_03_0027
     * @tc.desc   n=1295999999（第 15 天日界前1ms）按 floor 截断到秒后格式化为 359:59:59
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030027 begin');
      const n: number = 1295999999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('359:59:59'));
      expect(result).assertEqual('359:59:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030027 end');
    })

    /**
     * @tc.name   testUtilVolume030028
     * @tc.number SUB_CCE_UTILV_03_0028
     * @tc.desc   n=1296000001（第 15 天日界后1ms）按 floor 截断到秒后格式化为 360:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030028 begin');
      const n: number = 1296000001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('360:00:00'));
      expect(result).assertEqual('360:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030028 end');
    })

    /**
     * @tc.name   testUtilVolume030029
     * @tc.number SUB_CCE_UTILV_03_0029
     * @tc.desc   n=1382399999（第 16 天日界前1ms）按 floor 截断到秒后格式化为 383:59:59
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030029 begin');
      const n: number = 1382399999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('383:59:59'));
      expect(result).assertEqual('383:59:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030029 end');
    })

    /**
     * @tc.name   testUtilVolume030030
     * @tc.number SUB_CCE_UTILV_03_0030
     * @tc.desc   n=1382400001（第 16 天日界后1ms）按 floor 截断到秒后格式化为 384:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030030 begin');
      const n: number = 1382400001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('384:00:00'));
      expect(result).assertEqual('384:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030030 end');
    })

    /**
     * @tc.name   testUtilVolume030031
     * @tc.number SUB_CCE_UTILV_03_0031
     * @tc.desc   n=1468799999（第 17 天日界前1ms）按 floor 截断到秒后格式化为 407:59:59
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030031 begin');
      const n: number = 1468799999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('407:59:59'));
      expect(result).assertEqual('407:59:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030031 end');
    })

    /**
     * @tc.name   testUtilVolume030032
     * @tc.number SUB_CCE_UTILV_03_0032
     * @tc.desc   n=1468800001（第 17 天日界后1ms）按 floor 截断到秒后格式化为 408:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030032 begin');
      const n: number = 1468800001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('408:00:00'));
      expect(result).assertEqual('408:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030032 end');
    })

    /**
     * @tc.name   testUtilVolume030033
     * @tc.number SUB_CCE_UTILV_03_0033
     * @tc.desc   n=1555199999（第 18 天日界前1ms）按 floor 截断到秒后格式化为 431:59:59
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030033 begin');
      const n: number = 1555199999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('431:59:59'));
      expect(result).assertEqual('431:59:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030033 end');
    })

    /**
     * @tc.name   testUtilVolume030034
     * @tc.number SUB_CCE_UTILV_03_0034
     * @tc.desc   n=1555200001（第 18 天日界后1ms）按 floor 截断到秒后格式化为 432:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030034 begin');
      const n: number = 1555200001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('432:00:00'));
      expect(result).assertEqual('432:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030034 end');
    })

    /**
     * @tc.name   testUtilVolume030035
     * @tc.number SUB_CCE_UTILV_03_0035
     * @tc.desc   n=1641599999（第 19 天日界前1ms）按 floor 截断到秒后格式化为 455:59:59
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030035 begin');
      const n: number = 1641599999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('455:59:59'));
      expect(result).assertEqual('455:59:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030035 end');
    })

    /**
     * @tc.name   testUtilVolume030036
     * @tc.number SUB_CCE_UTILV_03_0036
     * @tc.desc   n=1641600001（第 19 天日界后1ms）按 floor 截断到秒后格式化为 456:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030036 begin');
      const n: number = 1641600001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('456:00:00'));
      expect(result).assertEqual('456:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030036 end');
    })

    /**
     * @tc.name   testUtilVolume030037
     * @tc.number SUB_CCE_UTILV_03_0037
     * @tc.desc   n=1727999999（第 20 天日界前1ms）按 floor 截断到秒后格式化为 479:59:59
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030037 begin');
      const n: number = 1727999999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('479:59:59'));
      expect(result).assertEqual('479:59:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030037 end');
    })

    /**
     * @tc.name   testUtilVolume030038
     * @tc.number SUB_CCE_UTILV_03_0038
     * @tc.desc   n=1728000001（第 20 天日界后1ms）按 floor 截断到秒后格式化为 480:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030038 begin');
      const n: number = 1728000001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('480:00:00'));
      expect(result).assertEqual('480:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030038 end');
    })

    /**
     * @tc.name   testUtilVolume030039
     * @tc.number SUB_CCE_UTILV_03_0039
     * @tc.desc   n=1814399999（第 21 天日界前1ms）按 floor 截断到秒后格式化为 503:59:59
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030039 begin');
      const n: number = 1814399999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('503:59:59'));
      expect(result).assertEqual('503:59:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030039 end');
    })

    /**
     * @tc.name   testUtilVolume030040
     * @tc.number SUB_CCE_UTILV_03_0040
     * @tc.desc   n=1814400001（第 21 天日界后1ms）按 floor 截断到秒后格式化为 504:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030040 begin');
      const n: number = 1814400001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('504:00:00'));
      expect(result).assertEqual('504:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030040 end');
    })

    /**
     * @tc.name   testUtilVolume030041
     * @tc.number SUB_CCE_UTILV_03_0041
     * @tc.desc   n=1900799999（第 22 天日界前1ms）按 floor 截断到秒后格式化为 527:59:59
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030041 begin');
      const n: number = 1900799999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('527:59:59'));
      expect(result).assertEqual('527:59:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030041 end');
    })

    /**
     * @tc.name   testUtilVolume030042
     * @tc.number SUB_CCE_UTILV_03_0042
     * @tc.desc   n=1900800001（第 22 天日界后1ms）按 floor 截断到秒后格式化为 528:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030042 begin');
      const n: number = 1900800001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('528:00:00'));
      expect(result).assertEqual('528:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030042 end');
    })

    /**
     * @tc.name   testUtilVolume030043
     * @tc.number SUB_CCE_UTILV_03_0043
     * @tc.desc   n=1987199999（第 23 天日界前1ms）按 floor 截断到秒后格式化为 551:59:59
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030043 begin');
      const n: number = 1987199999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('551:59:59'));
      expect(result).assertEqual('551:59:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030043 end');
    })

    /**
     * @tc.name   testUtilVolume030044
     * @tc.number SUB_CCE_UTILV_03_0044
     * @tc.desc   n=1987200001（第 23 天日界后1ms）按 floor 截断到秒后格式化为 552:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030044 begin');
      const n: number = 1987200001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('552:00:00'));
      expect(result).assertEqual('552:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030044 end');
    })

    /**
     * @tc.name   testUtilVolume030045
     * @tc.number SUB_CCE_UTILV_03_0045
     * @tc.desc   n=2073599999（第 24 天日界前1ms）按 floor 截断到秒后格式化为 575:59:59
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030045 begin');
      const n: number = 2073599999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('575:59:59'));
      expect(result).assertEqual('575:59:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030045 end');
    })

    /**
     * @tc.name   testUtilVolume030046
     * @tc.number SUB_CCE_UTILV_03_0046
     * @tc.desc   n=2073600001（第 24 天日界后1ms）按 floor 截断到秒后格式化为 576:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030046 begin');
      const n: number = 2073600001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('576:00:00'));
      expect(result).assertEqual('576:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030046 end');
    })

    /**
     * @tc.name   testUtilVolume030047
     * @tc.number SUB_CCE_UTILV_03_0047
     * @tc.desc   n=2159999999（第 25 天日界前1ms）按 floor 截断到秒后格式化为 599:59:59
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030047 begin');
      const n: number = 2159999999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('599:59:59'));
      expect(result).assertEqual('599:59:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030047 end');
    })

    /**
     * @tc.name   testUtilVolume030048
     * @tc.number SUB_CCE_UTILV_03_0048
     * @tc.desc   n=2160000001（第 25 天日界后1ms）按 floor 截断到秒后格式化为 600:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030048 begin');
      const n: number = 2160000001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('600:00:00'));
      expect(result).assertEqual('600:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030048 end');
    })

    /**
     * @tc.name   testUtilVolume030049
     * @tc.number SUB_CCE_UTILV_03_0049
     * @tc.desc   n=2246399999（第 26 天日界前1ms）按 floor 截断到秒后格式化为 623:59:59
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030049 begin');
      const n: number = 2246399999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('623:59:59'));
      expect(result).assertEqual('623:59:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030049 end');
    })

    /**
     * @tc.name   testUtilVolume030050
     * @tc.number SUB_CCE_UTILV_03_0050
     * @tc.desc   n=2246400001（第 26 天日界后1ms）按 floor 截断到秒后格式化为 624:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030050 begin');
      const n: number = 2246400001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('624:00:00'));
      expect(result).assertEqual('624:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030050 end');
    })

    /**
     * @tc.name   testUtilVolume030051
     * @tc.number SUB_CCE_UTILV_03_0051
     * @tc.desc   n=2332799999（第 27 天日界前1ms）按 floor 截断到秒后格式化为 647:59:59
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030051 begin');
      const n: number = 2332799999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('647:59:59'));
      expect(result).assertEqual('647:59:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030051 end');
    })

    /**
     * @tc.name   testUtilVolume030052
     * @tc.number SUB_CCE_UTILV_03_0052
     * @tc.desc   n=2332800001（第 27 天日界后1ms）按 floor 截断到秒后格式化为 648:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030052 begin');
      const n: number = 2332800001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('648:00:00'));
      expect(result).assertEqual('648:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030052 end');
    })

    /**
     * @tc.name   testUtilVolume030053
     * @tc.number SUB_CCE_UTILV_03_0053
     * @tc.desc   n=2419199999（第 28 天日界前1ms）按 floor 截断到秒后格式化为 671:59:59
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030053 begin');
      const n: number = 2419199999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('671:59:59'));
      expect(result).assertEqual('671:59:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030053 end');
    })

    /**
     * @tc.name   testUtilVolume030054
     * @tc.number SUB_CCE_UTILV_03_0054
     * @tc.desc   n=2419200001（第 28 天日界后1ms）按 floor 截断到秒后格式化为 672:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030054 begin');
      const n: number = 2419200001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('672:00:00'));
      expect(result).assertEqual('672:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030054 end');
    })

    /**
     * @tc.name   testUtilVolume030055
     * @tc.number SUB_CCE_UTILV_03_0055
     * @tc.desc   n=2505599999（第 29 天日界前1ms）按 floor 截断到秒后格式化为 695:59:59
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030055 begin');
      const n: number = 2505599999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('695:59:59'));
      expect(result).assertEqual('695:59:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030055 end');
    })

    /**
     * @tc.name   testUtilVolume030056
     * @tc.number SUB_CCE_UTILV_03_0056
     * @tc.desc   n=2505600001（第 29 天日界后1ms）按 floor 截断到秒后格式化为 696:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030056 begin');
      const n: number = 2505600001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('696:00:00'));
      expect(result).assertEqual('696:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030056 end');
    })

    /**
     * @tc.name   testUtilVolume030057
     * @tc.number SUB_CCE_UTILV_03_0057
     * @tc.desc   n=2591999999（第 30 天日界前1ms）按 floor 截断到秒后格式化为 719:59:59
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030057 begin');
      const n: number = 2591999999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('719:59:59'));
      expect(result).assertEqual('719:59:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030057 end');
    })

    /**
     * @tc.name   testUtilVolume030058
     * @tc.number SUB_CCE_UTILV_03_0058
     * @tc.desc   n=2592000001（第 30 天日界后1ms）按 floor 截断到秒后格式化为 720:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030058 begin');
      const n: number = 2592000001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('720:00:00'));
      expect(result).assertEqual('720:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030058 end');
    })

    /**
     * @tc.name   testUtilVolume030059
     * @tc.number SUB_CCE_UTILV_03_0059
     * @tc.desc   n=2678399999（第 31 天日界前1ms）按 floor 截断到秒后格式化为 743:59:59
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030059 begin');
      const n: number = 2678399999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('743:59:59'));
      expect(result).assertEqual('743:59:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030059 end');
    })

    /**
     * @tc.name   testUtilVolume030060
     * @tc.number SUB_CCE_UTILV_03_0060
     * @tc.desc   n=2678400001（第 31 天日界后1ms）按 floor 截断到秒后格式化为 744:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030060 begin');
      const n: number = 2678400001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('744:00:00'));
      expect(result).assertEqual('744:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030060 end');
    })

    /**
     * @tc.name   testUtilVolume030061
     * @tc.number SUB_CCE_UTILV_03_0061
     * @tc.desc   n=2764799999（第 32 天日界前1ms）按 floor 截断到秒后格式化为 767:59:59
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030061 begin');
      const n: number = 2764799999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('767:59:59'));
      expect(result).assertEqual('767:59:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030061 end');
    })

    /**
     * @tc.name   testUtilVolume030062
     * @tc.number SUB_CCE_UTILV_03_0062
     * @tc.desc   n=2764800001（第 32 天日界后1ms）按 floor 截断到秒后格式化为 768:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030062 begin');
      const n: number = 2764800001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('768:00:00'));
      expect(result).assertEqual('768:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030062 end');
    })

    /**
     * @tc.name   testUtilVolume030063
     * @tc.number SUB_CCE_UTILV_03_0063
     * @tc.desc   n=2851199999（第 33 天日界前1ms）按 floor 截断到秒后格式化为 791:59:59
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030063 begin');
      const n: number = 2851199999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('791:59:59'));
      expect(result).assertEqual('791:59:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030063 end');
    })

    /**
     * @tc.name   testUtilVolume030064
     * @tc.number SUB_CCE_UTILV_03_0064
     * @tc.desc   n=2851200001（第 33 天日界后1ms）按 floor 截断到秒后格式化为 792:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030064 begin');
      const n: number = 2851200001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('792:00:00'));
      expect(result).assertEqual('792:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030064 end');
    })

    /**
     * @tc.name   testUtilVolume030065
     * @tc.number SUB_CCE_UTILV_03_0065
     * @tc.desc   n=2937599999（第 34 天日界前1ms）按 floor 截断到秒后格式化为 815:59:59
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030065 begin');
      const n: number = 2937599999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('815:59:59'));
      expect(result).assertEqual('815:59:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030065 end');
    })

    /**
     * @tc.name   testUtilVolume030066
     * @tc.number SUB_CCE_UTILV_03_0066
     * @tc.desc   n=2937600001（第 34 天日界后1ms）按 floor 截断到秒后格式化为 816:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030066 begin');
      const n: number = 2937600001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('816:00:00'));
      expect(result).assertEqual('816:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030066 end');
    })

    /**
     * @tc.name   testUtilVolume030067
     * @tc.number SUB_CCE_UTILV_03_0067
     * @tc.desc   n=3023999999（第 35 天日界前1ms）按 floor 截断到秒后格式化为 839:59:59
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030067 begin');
      const n: number = 3023999999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('839:59:59'));
      expect(result).assertEqual('839:59:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030067 end');
    })

    /**
     * @tc.name   testUtilVolume030068
     * @tc.number SUB_CCE_UTILV_03_0068
     * @tc.desc   n=3024000001（第 35 天日界后1ms）按 floor 截断到秒后格式化为 840:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030068 begin');
      const n: number = 3024000001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('840:00:00'));
      expect(result).assertEqual('840:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030068 end');
    })

    /**
     * @tc.name   testUtilVolume030069
     * @tc.number SUB_CCE_UTILV_03_0069
     * @tc.desc   n=3110399999（第 36 天日界前1ms）按 floor 截断到秒后格式化为 863:59:59
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030069 begin');
      const n: number = 3110399999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('863:59:59'));
      expect(result).assertEqual('863:59:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030069 end');
    })

    /**
     * @tc.name   testUtilVolume030070
     * @tc.number SUB_CCE_UTILV_03_0070
     * @tc.desc   n=3110400001（第 36 天日界后1ms）按 floor 截断到秒后格式化为 864:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030070 begin');
      const n: number = 3110400001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('864:00:00'));
      expect(result).assertEqual('864:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030070 end');
    })

    /**
     * @tc.name   testUtilVolume030071
     * @tc.number SUB_CCE_UTILV_03_0071
     * @tc.desc   n=3196799999（第 37 天日界前1ms）按 floor 截断到秒后格式化为 887:59:59
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030071 begin');
      const n: number = 3196799999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('887:59:59'));
      expect(result).assertEqual('887:59:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030071 end');
    })

    /**
     * @tc.name   testUtilVolume030072
     * @tc.number SUB_CCE_UTILV_03_0072
     * @tc.desc   n=3196800001（第 37 天日界后1ms）按 floor 截断到秒后格式化为 888:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030072 begin');
      const n: number = 3196800001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('888:00:00'));
      expect(result).assertEqual('888:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030072 end');
    })

    /**
     * @tc.name   testUtilVolume030073
     * @tc.number SUB_CCE_UTILV_03_0073
     * @tc.desc   n=3283199999（第 38 天日界前1ms）按 floor 截断到秒后格式化为 911:59:59
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030073 begin');
      const n: number = 3283199999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('911:59:59'));
      expect(result).assertEqual('911:59:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030073 end');
    })

    /**
     * @tc.name   testUtilVolume030074
     * @tc.number SUB_CCE_UTILV_03_0074
     * @tc.desc   n=3283200001（第 38 天日界后1ms）按 floor 截断到秒后格式化为 912:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030074 begin');
      const n: number = 3283200001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('912:00:00'));
      expect(result).assertEqual('912:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030074 end');
    })

    /**
     * @tc.name   testUtilVolume030075
     * @tc.number SUB_CCE_UTILV_03_0075
     * @tc.desc   n=3369599999（第 39 天日界前1ms）按 floor 截断到秒后格式化为 935:59:59
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030075 begin');
      const n: number = 3369599999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('935:59:59'));
      expect(result).assertEqual('935:59:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030075 end');
    })

    /**
     * @tc.name   testUtilVolume030076
     * @tc.number SUB_CCE_UTILV_03_0076
     * @tc.desc   n=3369600001（第 39 天日界后1ms）按 floor 截断到秒后格式化为 936:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030076 begin');
      const n: number = 3369600001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('936:00:00'));
      expect(result).assertEqual('936:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030076 end');
    })

    /**
     * @tc.name   testUtilVolume030077
     * @tc.number SUB_CCE_UTILV_03_0077
     * @tc.desc   n=3455999999（第 40 天日界前1ms）按 floor 截断到秒后格式化为 959:59:59
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030077 begin');
      const n: number = 3455999999;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('959:59:59'));
      expect(result).assertEqual('959:59:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('59'));
      expect(result.substring(result.length - 2)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030077 end');
    })

    /**
     * @tc.name   testUtilVolume030078
     * @tc.number SUB_CCE_UTILV_03_0078
     * @tc.desc   n=3456000001（第 40 天日界后1ms）按 floor 截断到秒后格式化为 960:00:00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030078 begin');
      const n: number = 3456000001;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('960:00:00'));
      expect(result).assertEqual('960:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('00'));
      expect(result.substring(result.length - 2)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030078 end');
    })

    /**
     * @tc.name   testUtilVolume030079
     * @tc.number SUB_CCE_UTILV_03_0079
     * @tc.desc   第 41 天日界前后 1ms 落在相邻两秒，跨日不产生中间态
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume030079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030079 begin');
      const before: string = utils.convertTimeToFormatString(3542399999);
      const after: string = utils.convertTimeToFormatString(3542400001);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', before, '983:59:59');
      expect(before).assertEqual('983:59:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', after, '984:00:00');
      expect(after).assertEqual('984:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(after.split(':').length === 3 && before.split(':').length === 3));
      expect(after.split(':').length === 3 && before.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume030079 end');
    })
  })
}
