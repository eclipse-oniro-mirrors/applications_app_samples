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

export default function utilVolume08Test(): void {
  describe('UtilVolume08Test', () => {

    /**
     * @tc.name   testUtilVolume080001
     * @tc.number SUB_CCE_UTILV_08_0001
     * @tc.desc   时长 1m3s（n=63000）分秒格点组合格式化为 00:01:03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080001 begin');
      const n: number = 63000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:01:03'));
      expect(result).assertEqual('00:01:03');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('03'));
      expect(result.substring(result.length - 2)).assertEqual('03');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080001 end');
    })

    /**
     * @tc.name   testUtilVolume080002
     * @tc.number SUB_CCE_UTILV_08_0002
     * @tc.desc   时长 1m4s（n=64000）分秒格点组合格式化为 00:01:04
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080002 begin');
      const n: number = 64000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:01:04'));
      expect(result).assertEqual('00:01:04');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('04'));
      expect(result.substring(result.length - 2)).assertEqual('04');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080002 end');
    })

    /**
     * @tc.name   testUtilVolume080003
     * @tc.number SUB_CCE_UTILV_08_0003
     * @tc.desc   时长 1m5s（n=65000）分秒格点组合格式化为 00:01:05
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080003 begin');
      const n: number = 65000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:01:05'));
      expect(result).assertEqual('00:01:05');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('05'));
      expect(result.substring(result.length - 2)).assertEqual('05');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080003 end');
    })

    /**
     * @tc.name   testUtilVolume080004
     * @tc.number SUB_CCE_UTILV_08_0004
     * @tc.desc   时长 1m6s（n=66000）分秒格点组合格式化为 00:01:06
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080004 begin');
      const n: number = 66000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:01:06'));
      expect(result).assertEqual('00:01:06');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('06'));
      expect(result.substring(result.length - 2)).assertEqual('06');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080004 end');
    })

    /**
     * @tc.name   testUtilVolume080005
     * @tc.number SUB_CCE_UTILV_08_0005
     * @tc.desc   时长 1m8s（n=68000）分秒格点组合格式化为 00:01:08
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080005 begin');
      const n: number = 68000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:01:08'));
      expect(result).assertEqual('00:01:08');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('08'));
      expect(result.substring(result.length - 2)).assertEqual('08');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080005 end');
    })

    /**
     * @tc.name   testUtilVolume080006
     * @tc.number SUB_CCE_UTILV_08_0006
     * @tc.desc   时长 2m3s（n=123000）分秒格点组合格式化为 00:02:03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080006 begin');
      const n: number = 123000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:02:03'));
      expect(result).assertEqual('00:02:03');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('03'));
      expect(result.substring(result.length - 2)).assertEqual('03');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080006 end');
    })

    /**
     * @tc.name   testUtilVolume080007
     * @tc.number SUB_CCE_UTILV_08_0007
     * @tc.desc   时长 2m4s（n=124000）分秒格点组合格式化为 00:02:04
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080007 begin');
      const n: number = 124000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:02:04'));
      expect(result).assertEqual('00:02:04');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('04'));
      expect(result.substring(result.length - 2)).assertEqual('04');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080007 end');
    })

    /**
     * @tc.name   testUtilVolume080008
     * @tc.number SUB_CCE_UTILV_08_0008
     * @tc.desc   时长 2m5s（n=125000）分秒格点组合格式化为 00:02:05
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080008 begin');
      const n: number = 125000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:02:05'));
      expect(result).assertEqual('00:02:05');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('05'));
      expect(result.substring(result.length - 2)).assertEqual('05');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080008 end');
    })

    /**
     * @tc.name   testUtilVolume080009
     * @tc.number SUB_CCE_UTILV_08_0009
     * @tc.desc   时长 2m6s（n=126000）分秒格点组合格式化为 00:02:06
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080009 begin');
      const n: number = 126000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:02:06'));
      expect(result).assertEqual('00:02:06');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('06'));
      expect(result.substring(result.length - 2)).assertEqual('06');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080009 end');
    })

    /**
     * @tc.name   testUtilVolume080010
     * @tc.number SUB_CCE_UTILV_08_0010
     * @tc.desc   时长 2m7s（n=127000）分秒格点组合格式化为 00:02:07
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080010 begin');
      const n: number = 127000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:02:07'));
      expect(result).assertEqual('00:02:07');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('07'));
      expect(result.substring(result.length - 2)).assertEqual('07');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080010 end');
    })

    /**
     * @tc.name   testUtilVolume080011
     * @tc.number SUB_CCE_UTILV_08_0011
     * @tc.desc   时长 2m8s（n=128000）分秒格点组合格式化为 00:02:08
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080011 begin');
      const n: number = 128000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:02:08'));
      expect(result).assertEqual('00:02:08');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('08'));
      expect(result.substring(result.length - 2)).assertEqual('08');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080011 end');
    })

    /**
     * @tc.name   testUtilVolume080012
     * @tc.number SUB_CCE_UTILV_08_0012
     * @tc.desc   时长 3m3s（n=183000）分秒格点组合格式化为 00:03:03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080012 begin');
      const n: number = 183000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:03:03'));
      expect(result).assertEqual('00:03:03');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('03'));
      expect(result.substring(result.length - 2)).assertEqual('03');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080012 end');
    })

    /**
     * @tc.name   testUtilVolume080013
     * @tc.number SUB_CCE_UTILV_08_0013
     * @tc.desc   时长 3m4s（n=184000）分秒格点组合格式化为 00:03:04
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080013 begin');
      const n: number = 184000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:03:04'));
      expect(result).assertEqual('00:03:04');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('04'));
      expect(result.substring(result.length - 2)).assertEqual('04');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080013 end');
    })

    /**
     * @tc.name   testUtilVolume080014
     * @tc.number SUB_CCE_UTILV_08_0014
     * @tc.desc   时长 3m5s（n=185000）分秒格点组合格式化为 00:03:05
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080014 begin');
      const n: number = 185000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:03:05'));
      expect(result).assertEqual('00:03:05');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('05'));
      expect(result.substring(result.length - 2)).assertEqual('05');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080014 end');
    })

    /**
     * @tc.name   testUtilVolume080015
     * @tc.number SUB_CCE_UTILV_08_0015
     * @tc.desc   时长 3m6s（n=186000）分秒格点组合格式化为 00:03:06
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080015 begin');
      const n: number = 186000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:03:06'));
      expect(result).assertEqual('00:03:06');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('06'));
      expect(result.substring(result.length - 2)).assertEqual('06');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080015 end');
    })

    /**
     * @tc.name   testUtilVolume080016
     * @tc.number SUB_CCE_UTILV_08_0016
     * @tc.desc   时长 3m7s（n=187000）分秒格点组合格式化为 00:03:07
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080016 begin');
      const n: number = 187000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:03:07'));
      expect(result).assertEqual('00:03:07');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('07'));
      expect(result.substring(result.length - 2)).assertEqual('07');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080016 end');
    })

    /**
     * @tc.name   testUtilVolume080017
     * @tc.number SUB_CCE_UTILV_08_0017
     * @tc.desc   时长 3m8s（n=188000）分秒格点组合格式化为 00:03:08
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080017 begin');
      const n: number = 188000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:03:08'));
      expect(result).assertEqual('00:03:08');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('08'));
      expect(result.substring(result.length - 2)).assertEqual('08');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080017 end');
    })

    /**
     * @tc.name   testUtilVolume080018
     * @tc.number SUB_CCE_UTILV_08_0018
     * @tc.desc   时长 4m3s（n=243000）分秒格点组合格式化为 00:04:03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080018 begin');
      const n: number = 243000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:04:03'));
      expect(result).assertEqual('00:04:03');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('03'));
      expect(result.substring(result.length - 2)).assertEqual('03');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080018 end');
    })

    /**
     * @tc.name   testUtilVolume080019
     * @tc.number SUB_CCE_UTILV_08_0019
     * @tc.desc   时长 4m4s（n=244000）分秒格点组合格式化为 00:04:04
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080019 begin');
      const n: number = 244000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:04:04'));
      expect(result).assertEqual('00:04:04');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('04'));
      expect(result.substring(result.length - 2)).assertEqual('04');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080019 end');
    })

    /**
     * @tc.name   testUtilVolume080020
     * @tc.number SUB_CCE_UTILV_08_0020
     * @tc.desc   时长 4m5s（n=245000）分秒格点组合格式化为 00:04:05
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080020 begin');
      const n: number = 245000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:04:05'));
      expect(result).assertEqual('00:04:05');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('05'));
      expect(result.substring(result.length - 2)).assertEqual('05');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080020 end');
    })

    /**
     * @tc.name   testUtilVolume080021
     * @tc.number SUB_CCE_UTILV_08_0021
     * @tc.desc   时长 4m6s（n=246000）分秒格点组合格式化为 00:04:06
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080021 begin');
      const n: number = 246000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:04:06'));
      expect(result).assertEqual('00:04:06');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('06'));
      expect(result.substring(result.length - 2)).assertEqual('06');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080021 end');
    })

    /**
     * @tc.name   testUtilVolume080022
     * @tc.number SUB_CCE_UTILV_08_0022
     * @tc.desc   时长 4m7s（n=247000）分秒格点组合格式化为 00:04:07
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080022 begin');
      const n: number = 247000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:04:07'));
      expect(result).assertEqual('00:04:07');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('07'));
      expect(result.substring(result.length - 2)).assertEqual('07');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080022 end');
    })

    /**
     * @tc.name   testUtilVolume080023
     * @tc.number SUB_CCE_UTILV_08_0023
     * @tc.desc   时长 4m8s（n=248000）分秒格点组合格式化为 00:04:08
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080023 begin');
      const n: number = 248000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:04:08'));
      expect(result).assertEqual('00:04:08');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('08'));
      expect(result.substring(result.length - 2)).assertEqual('08');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080023 end');
    })

    /**
     * @tc.name   testUtilVolume080024
     * @tc.number SUB_CCE_UTILV_08_0024
     * @tc.desc   时长 5m3s（n=303000）分秒格点组合格式化为 00:05:03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080024 begin');
      const n: number = 303000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:05:03'));
      expect(result).assertEqual('00:05:03');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('03'));
      expect(result.substring(result.length - 2)).assertEqual('03');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080024 end');
    })

    /**
     * @tc.name   testUtilVolume080025
     * @tc.number SUB_CCE_UTILV_08_0025
     * @tc.desc   时长 5m4s（n=304000）分秒格点组合格式化为 00:05:04
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080025 begin');
      const n: number = 304000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:05:04'));
      expect(result).assertEqual('00:05:04');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('04'));
      expect(result.substring(result.length - 2)).assertEqual('04');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080025 end');
    })

    /**
     * @tc.name   testUtilVolume080026
     * @tc.number SUB_CCE_UTILV_08_0026
     * @tc.desc   时长 5m5s（n=305000）分秒格点组合格式化为 00:05:05
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080026 begin');
      const n: number = 305000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:05:05'));
      expect(result).assertEqual('00:05:05');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('05'));
      expect(result.substring(result.length - 2)).assertEqual('05');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080026 end');
    })

    /**
     * @tc.name   testUtilVolume080027
     * @tc.number SUB_CCE_UTILV_08_0027
     * @tc.desc   时长 5m6s（n=306000）分秒格点组合格式化为 00:05:06
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080027 begin');
      const n: number = 306000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:05:06'));
      expect(result).assertEqual('00:05:06');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('06'));
      expect(result.substring(result.length - 2)).assertEqual('06');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080027 end');
    })

    /**
     * @tc.name   testUtilVolume080028
     * @tc.number SUB_CCE_UTILV_08_0028
     * @tc.desc   时长 5m7s（n=307000）分秒格点组合格式化为 00:05:07
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080028 begin');
      const n: number = 307000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:05:07'));
      expect(result).assertEqual('00:05:07');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('07'));
      expect(result.substring(result.length - 2)).assertEqual('07');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080028 end');
    })

    /**
     * @tc.name   testUtilVolume080029
     * @tc.number SUB_CCE_UTILV_08_0029
     * @tc.desc   时长 5m8s（n=308000）分秒格点组合格式化为 00:05:08
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080029 begin');
      const n: number = 308000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:05:08'));
      expect(result).assertEqual('00:05:08');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('08'));
      expect(result.substring(result.length - 2)).assertEqual('08');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080029 end');
    })

    /**
     * @tc.name   testUtilVolume080030
     * @tc.number SUB_CCE_UTILV_08_0030
     * @tc.desc   时长 6m3s（n=363000）分秒格点组合格式化为 00:06:03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080030 begin');
      const n: number = 363000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:06:03'));
      expect(result).assertEqual('00:06:03');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('03'));
      expect(result.substring(result.length - 2)).assertEqual('03');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080030 end');
    })

    /**
     * @tc.name   testUtilVolume080031
     * @tc.number SUB_CCE_UTILV_08_0031
     * @tc.desc   时长 6m4s（n=364000）分秒格点组合格式化为 00:06:04
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080031 begin');
      const n: number = 364000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:06:04'));
      expect(result).assertEqual('00:06:04');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('04'));
      expect(result.substring(result.length - 2)).assertEqual('04');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080031 end');
    })

    /**
     * @tc.name   testUtilVolume080032
     * @tc.number SUB_CCE_UTILV_08_0032
     * @tc.desc   时长 6m5s（n=365000）分秒格点组合格式化为 00:06:05
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080032 begin');
      const n: number = 365000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:06:05'));
      expect(result).assertEqual('00:06:05');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('05'));
      expect(result.substring(result.length - 2)).assertEqual('05');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080032 end');
    })

    /**
     * @tc.name   testUtilVolume080033
     * @tc.number SUB_CCE_UTILV_08_0033
     * @tc.desc   时长 6m6s（n=366000）分秒格点组合格式化为 00:06:06
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080033 begin');
      const n: number = 366000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:06:06'));
      expect(result).assertEqual('00:06:06');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('06'));
      expect(result.substring(result.length - 2)).assertEqual('06');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080033 end');
    })

    /**
     * @tc.name   testUtilVolume080034
     * @tc.number SUB_CCE_UTILV_08_0034
     * @tc.desc   时长 6m7s（n=367000）分秒格点组合格式化为 00:06:07
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080034 begin');
      const n: number = 367000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:06:07'));
      expect(result).assertEqual('00:06:07');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('07'));
      expect(result.substring(result.length - 2)).assertEqual('07');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080034 end');
    })

    /**
     * @tc.name   testUtilVolume080035
     * @tc.number SUB_CCE_UTILV_08_0035
     * @tc.desc   时长 6m8s（n=368000）分秒格点组合格式化为 00:06:08
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080035 begin');
      const n: number = 368000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:06:08'));
      expect(result).assertEqual('00:06:08');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('08'));
      expect(result.substring(result.length - 2)).assertEqual('08');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080035 end');
    })

    /**
     * @tc.name   testUtilVolume080036
     * @tc.number SUB_CCE_UTILV_08_0036
     * @tc.desc   时长 7m3s（n=423000）分秒格点组合格式化为 00:07:03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080036 begin');
      const n: number = 423000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:07:03'));
      expect(result).assertEqual('00:07:03');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('03'));
      expect(result.substring(result.length - 2)).assertEqual('03');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080036 end');
    })

    /**
     * @tc.name   testUtilVolume080037
     * @tc.number SUB_CCE_UTILV_08_0037
     * @tc.desc   时长 7m4s（n=424000）分秒格点组合格式化为 00:07:04
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080037 begin');
      const n: number = 424000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:07:04'));
      expect(result).assertEqual('00:07:04');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('04'));
      expect(result.substring(result.length - 2)).assertEqual('04');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080037 end');
    })

    /**
     * @tc.name   testUtilVolume080038
     * @tc.number SUB_CCE_UTILV_08_0038
     * @tc.desc   时长 7m5s（n=425000）分秒格点组合格式化为 00:07:05
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080038 begin');
      const n: number = 425000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:07:05'));
      expect(result).assertEqual('00:07:05');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('05'));
      expect(result.substring(result.length - 2)).assertEqual('05');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080038 end');
    })

    /**
     * @tc.name   testUtilVolume080039
     * @tc.number SUB_CCE_UTILV_08_0039
     * @tc.desc   时长 7m6s（n=426000）分秒格点组合格式化为 00:07:06
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080039 begin');
      const n: number = 426000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:07:06'));
      expect(result).assertEqual('00:07:06');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('06'));
      expect(result.substring(result.length - 2)).assertEqual('06');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080039 end');
    })

    /**
     * @tc.name   testUtilVolume080040
     * @tc.number SUB_CCE_UTILV_08_0040
     * @tc.desc   时长 7m8s（n=428000）分秒格点组合格式化为 00:07:08
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080040 begin');
      const n: number = 428000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:07:08'));
      expect(result).assertEqual('00:07:08');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('08'));
      expect(result.substring(result.length - 2)).assertEqual('08');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080040 end');
    })

    /**
     * @tc.name   testUtilVolume080041
     * @tc.number SUB_CCE_UTILV_08_0041
     * @tc.desc   时长 8m3s（n=483000）分秒格点组合格式化为 00:08:03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080041 begin');
      const n: number = 483000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:08:03'));
      expect(result).assertEqual('00:08:03');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('03'));
      expect(result.substring(result.length - 2)).assertEqual('03');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080041 end');
    })

    /**
     * @tc.name   testUtilVolume080042
     * @tc.number SUB_CCE_UTILV_08_0042
     * @tc.desc   时长 8m4s（n=484000）分秒格点组合格式化为 00:08:04
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080042 begin');
      const n: number = 484000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:08:04'));
      expect(result).assertEqual('00:08:04');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('04'));
      expect(result.substring(result.length - 2)).assertEqual('04');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080042 end');
    })

    /**
     * @tc.name   testUtilVolume080043
     * @tc.number SUB_CCE_UTILV_08_0043
     * @tc.desc   时长 8m5s（n=485000）分秒格点组合格式化为 00:08:05
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080043 begin');
      const n: number = 485000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:08:05'));
      expect(result).assertEqual('00:08:05');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('05'));
      expect(result.substring(result.length - 2)).assertEqual('05');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080043 end');
    })

    /**
     * @tc.name   testUtilVolume080044
     * @tc.number SUB_CCE_UTILV_08_0044
     * @tc.desc   时长 8m6s（n=486000）分秒格点组合格式化为 00:08:06
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080044 begin');
      const n: number = 486000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:08:06'));
      expect(result).assertEqual('00:08:06');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('06'));
      expect(result.substring(result.length - 2)).assertEqual('06');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080044 end');
    })

    /**
     * @tc.name   testUtilVolume080045
     * @tc.number SUB_CCE_UTILV_08_0045
     * @tc.desc   时长 8m7s（n=487000）分秒格点组合格式化为 00:08:07
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080045 begin');
      const n: number = 487000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:08:07'));
      expect(result).assertEqual('00:08:07');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('07'));
      expect(result.substring(result.length - 2)).assertEqual('07');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080045 end');
    })

    /**
     * @tc.name   testUtilVolume080046
     * @tc.number SUB_CCE_UTILV_08_0046
     * @tc.desc   时长 8m8s（n=488000）分秒格点组合格式化为 00:08:08
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080046 begin');
      const n: number = 488000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:08:08'));
      expect(result).assertEqual('00:08:08');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('08'));
      expect(result.substring(result.length - 2)).assertEqual('08');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080046 end');
    })

    /**
     * @tc.name   testUtilVolume080047
     * @tc.number SUB_CCE_UTILV_08_0047
     * @tc.desc   时长 9m3s（n=543000）分秒格点组合格式化为 00:09:03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080047 begin');
      const n: number = 543000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:09:03'));
      expect(result).assertEqual('00:09:03');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('03'));
      expect(result.substring(result.length - 2)).assertEqual('03');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080047 end');
    })

    /**
     * @tc.name   testUtilVolume080048
     * @tc.number SUB_CCE_UTILV_08_0048
     * @tc.desc   时长 9m4s（n=544000）分秒格点组合格式化为 00:09:04
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080048 begin');
      const n: number = 544000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:09:04'));
      expect(result).assertEqual('00:09:04');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('04'));
      expect(result.substring(result.length - 2)).assertEqual('04');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080048 end');
    })

    /**
     * @tc.name   testUtilVolume080049
     * @tc.number SUB_CCE_UTILV_08_0049
     * @tc.desc   时长 9m5s（n=545000）分秒格点组合格式化为 00:09:05
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080049 begin');
      const n: number = 545000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:09:05'));
      expect(result).assertEqual('00:09:05');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('05'));
      expect(result.substring(result.length - 2)).assertEqual('05');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080049 end');
    })

    /**
     * @tc.name   testUtilVolume080050
     * @tc.number SUB_CCE_UTILV_08_0050
     * @tc.desc   时长 9m6s（n=546000）分秒格点组合格式化为 00:09:06
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080050 begin');
      const n: number = 546000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:09:06'));
      expect(result).assertEqual('00:09:06');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('06'));
      expect(result.substring(result.length - 2)).assertEqual('06');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080050 end');
    })

    /**
     * @tc.name   testUtilVolume080051
     * @tc.number SUB_CCE_UTILV_08_0051
     * @tc.desc   时长 9m7s（n=547000）分秒格点组合格式化为 00:09:07
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080051 begin');
      const n: number = 547000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:09:07'));
      expect(result).assertEqual('00:09:07');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('07'));
      expect(result.substring(result.length - 2)).assertEqual('07');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080051 end');
    })

    /**
     * @tc.name   testUtilVolume080052
     * @tc.number SUB_CCE_UTILV_08_0052
     * @tc.desc   时长 9m8s（n=548000）分秒格点组合格式化为 00:09:08
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080052 begin');
      const n: number = 548000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:09:08'));
      expect(result).assertEqual('00:09:08');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('08'));
      expect(result.substring(result.length - 2)).assertEqual('08');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080052 end');
    })

    /**
     * @tc.name   testUtilVolume080053
     * @tc.number SUB_CCE_UTILV_08_0053
     * @tc.desc   时长 10m3s（n=603000）分秒格点组合格式化为 00:10:03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080053 begin');
      const n: number = 603000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:10:03'));
      expect(result).assertEqual('00:10:03');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('03'));
      expect(result.substring(result.length - 2)).assertEqual('03');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080053 end');
    })

    /**
     * @tc.name   testUtilVolume080054
     * @tc.number SUB_CCE_UTILV_08_0054
     * @tc.desc   时长 10m4s（n=604000）分秒格点组合格式化为 00:10:04
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080054 begin');
      const n: number = 604000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:10:04'));
      expect(result).assertEqual('00:10:04');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('04'));
      expect(result.substring(result.length - 2)).assertEqual('04');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080054 end');
    })

    /**
     * @tc.name   testUtilVolume080055
     * @tc.number SUB_CCE_UTILV_08_0055
     * @tc.desc   时长 10m5s（n=605000）分秒格点组合格式化为 00:10:05
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080055 begin');
      const n: number = 605000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:10:05'));
      expect(result).assertEqual('00:10:05');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('05'));
      expect(result.substring(result.length - 2)).assertEqual('05');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080055 end');
    })

    /**
     * @tc.name   testUtilVolume080056
     * @tc.number SUB_CCE_UTILV_08_0056
     * @tc.desc   时长 10m6s（n=606000）分秒格点组合格式化为 00:10:06
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080056 begin');
      const n: number = 606000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:10:06'));
      expect(result).assertEqual('00:10:06');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('06'));
      expect(result.substring(result.length - 2)).assertEqual('06');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080056 end');
    })

    /**
     * @tc.name   testUtilVolume080057
     * @tc.number SUB_CCE_UTILV_08_0057
     * @tc.desc   时长 10m7s（n=607000）分秒格点组合格式化为 00:10:07
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080057 begin');
      const n: number = 607000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:10:07'));
      expect(result).assertEqual('00:10:07');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('07'));
      expect(result.substring(result.length - 2)).assertEqual('07');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080057 end');
    })

    /**
     * @tc.name   testUtilVolume080058
     * @tc.number SUB_CCE_UTILV_08_0058
     * @tc.desc   时长 10m8s（n=608000）分秒格点组合格式化为 00:10:08
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080058 begin');
      const n: number = 608000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:10:08'));
      expect(result).assertEqual('00:10:08');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('08'));
      expect(result.substring(result.length - 2)).assertEqual('08');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080058 end');
    })

    /**
     * @tc.name   testUtilVolume080059
     * @tc.number SUB_CCE_UTILV_08_0059
     * @tc.desc   时长 11m3s（n=663000）分秒格点组合格式化为 00:11:03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080059 begin');
      const n: number = 663000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:11:03'));
      expect(result).assertEqual('00:11:03');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('03'));
      expect(result.substring(result.length - 2)).assertEqual('03');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080059 end');
    })

    /**
     * @tc.name   testUtilVolume080060
     * @tc.number SUB_CCE_UTILV_08_0060
     * @tc.desc   时长 11m4s（n=664000）分秒格点组合格式化为 00:11:04
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080060 begin');
      const n: number = 664000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:11:04'));
      expect(result).assertEqual('00:11:04');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('04'));
      expect(result.substring(result.length - 2)).assertEqual('04');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080060 end');
    })

    /**
     * @tc.name   testUtilVolume080061
     * @tc.number SUB_CCE_UTILV_08_0061
     * @tc.desc   时长 11m5s（n=665000）分秒格点组合格式化为 00:11:05
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080061 begin');
      const n: number = 665000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:11:05'));
      expect(result).assertEqual('00:11:05');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('05'));
      expect(result.substring(result.length - 2)).assertEqual('05');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080061 end');
    })

    /**
     * @tc.name   testUtilVolume080062
     * @tc.number SUB_CCE_UTILV_08_0062
     * @tc.desc   时长 11m6s（n=666000）分秒格点组合格式化为 00:11:06
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080062 begin');
      const n: number = 666000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:11:06'));
      expect(result).assertEqual('00:11:06');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('06'));
      expect(result.substring(result.length - 2)).assertEqual('06');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080062 end');
    })

    /**
     * @tc.name   testUtilVolume080063
     * @tc.number SUB_CCE_UTILV_08_0063
     * @tc.desc   时长 11m7s（n=667000）分秒格点组合格式化为 00:11:07
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080063 begin');
      const n: number = 667000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:11:07'));
      expect(result).assertEqual('00:11:07');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('07'));
      expect(result.substring(result.length - 2)).assertEqual('07');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080063 end');
    })

    /**
     * @tc.name   testUtilVolume080064
     * @tc.number SUB_CCE_UTILV_08_0064
     * @tc.desc   时长 11m8s（n=668000）分秒格点组合格式化为 00:11:08
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080064 begin');
      const n: number = 668000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:11:08'));
      expect(result).assertEqual('00:11:08');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('08'));
      expect(result.substring(result.length - 2)).assertEqual('08');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080064 end');
    })

    /**
     * @tc.name   testUtilVolume080065
     * @tc.number SUB_CCE_UTILV_08_0065
     * @tc.desc   时长 12m3s（n=723000）分秒格点组合格式化为 00:12:03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080065 begin');
      const n: number = 723000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:12:03'));
      expect(result).assertEqual('00:12:03');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('03'));
      expect(result.substring(result.length - 2)).assertEqual('03');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080065 end');
    })

    /**
     * @tc.name   testUtilVolume080066
     * @tc.number SUB_CCE_UTILV_08_0066
     * @tc.desc   时长 12m4s（n=724000）分秒格点组合格式化为 00:12:04
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080066 begin');
      const n: number = 724000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:12:04'));
      expect(result).assertEqual('00:12:04');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('04'));
      expect(result.substring(result.length - 2)).assertEqual('04');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080066 end');
    })

    /**
     * @tc.name   testUtilVolume080067
     * @tc.number SUB_CCE_UTILV_08_0067
     * @tc.desc   时长 12m5s（n=725000）分秒格点组合格式化为 00:12:05
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080067 begin');
      const n: number = 725000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:12:05'));
      expect(result).assertEqual('00:12:05');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('05'));
      expect(result.substring(result.length - 2)).assertEqual('05');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080067 end');
    })

    /**
     * @tc.name   testUtilVolume080068
     * @tc.number SUB_CCE_UTILV_08_0068
     * @tc.desc   时长 12m6s（n=726000）分秒格点组合格式化为 00:12:06
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080068 begin');
      const n: number = 726000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:12:06'));
      expect(result).assertEqual('00:12:06');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('06'));
      expect(result.substring(result.length - 2)).assertEqual('06');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080068 end');
    })

    /**
     * @tc.name   testUtilVolume080069
     * @tc.number SUB_CCE_UTILV_08_0069
     * @tc.desc   时长 12m7s（n=727000）分秒格点组合格式化为 00:12:07
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080069 begin');
      const n: number = 727000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:12:07'));
      expect(result).assertEqual('00:12:07');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('07'));
      expect(result.substring(result.length - 2)).assertEqual('07');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080069 end');
    })

    /**
     * @tc.name   testUtilVolume080070
     * @tc.number SUB_CCE_UTILV_08_0070
     * @tc.desc   时长 12m8s（n=728000）分秒格点组合格式化为 00:12:08
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080070 begin');
      const n: number = 728000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:12:08'));
      expect(result).assertEqual('00:12:08');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('08'));
      expect(result.substring(result.length - 2)).assertEqual('08');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080070 end');
    })

    /**
     * @tc.name   testUtilVolume080071
     * @tc.number SUB_CCE_UTILV_08_0071
     * @tc.desc   时长 13m3s（n=783000）分秒格点组合格式化为 00:13:03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080071 begin');
      const n: number = 783000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:13:03'));
      expect(result).assertEqual('00:13:03');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('03'));
      expect(result.substring(result.length - 2)).assertEqual('03');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080071 end');
    })

    /**
     * @tc.name   testUtilVolume080072
     * @tc.number SUB_CCE_UTILV_08_0072
     * @tc.desc   时长 13m4s（n=784000）分秒格点组合格式化为 00:13:04
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080072 begin');
      const n: number = 784000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:13:04'));
      expect(result).assertEqual('00:13:04');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('04'));
      expect(result.substring(result.length - 2)).assertEqual('04');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080072 end');
    })

    /**
     * @tc.name   testUtilVolume080073
     * @tc.number SUB_CCE_UTILV_08_0073
     * @tc.desc   时长 13m5s（n=785000）分秒格点组合格式化为 00:13:05
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080073 begin');
      const n: number = 785000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:13:05'));
      expect(result).assertEqual('00:13:05');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('05'));
      expect(result.substring(result.length - 2)).assertEqual('05');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080073 end');
    })

    /**
     * @tc.name   testUtilVolume080074
     * @tc.number SUB_CCE_UTILV_08_0074
     * @tc.desc   时长 13m6s（n=786000）分秒格点组合格式化为 00:13:06
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080074 begin');
      const n: number = 786000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:13:06'));
      expect(result).assertEqual('00:13:06');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('06'));
      expect(result.substring(result.length - 2)).assertEqual('06');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080074 end');
    })

    /**
     * @tc.name   testUtilVolume080075
     * @tc.number SUB_CCE_UTILV_08_0075
     * @tc.desc   时长 13m7s（n=787000）分秒格点组合格式化为 00:13:07
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080075 begin');
      const n: number = 787000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:13:07'));
      expect(result).assertEqual('00:13:07');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('07'));
      expect(result.substring(result.length - 2)).assertEqual('07');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080075 end');
    })

    /**
     * @tc.name   testUtilVolume080076
     * @tc.number SUB_CCE_UTILV_08_0076
     * @tc.desc   时长 13m8s（n=788000）分秒格点组合格式化为 00:13:08
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080076 begin');
      const n: number = 788000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:13:08'));
      expect(result).assertEqual('00:13:08');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('08'));
      expect(result.substring(result.length - 2)).assertEqual('08');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080076 end');
    })

    /**
     * @tc.name   testUtilVolume080077
     * @tc.number SUB_CCE_UTILV_08_0077
     * @tc.desc   时长 14m3s（n=843000）分秒格点组合格式化为 00:14:03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080077 begin');
      const n: number = 843000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:14:03'));
      expect(result).assertEqual('00:14:03');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('03'));
      expect(result.substring(result.length - 2)).assertEqual('03');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080077 end');
    })

    /**
     * @tc.name   testUtilVolume080078
     * @tc.number SUB_CCE_UTILV_08_0078
     * @tc.desc   时长 14m4s（n=844000）分秒格点组合格式化为 00:14:04
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080078 begin');
      const n: number = 844000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:14:04'));
      expect(result).assertEqual('00:14:04');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('04'));
      expect(result.substring(result.length - 2)).assertEqual('04');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080078 end');
    })

    /**
     * @tc.name   testUtilVolume080079
     * @tc.number SUB_CCE_UTILV_08_0079
     * @tc.desc   14 分末秒 899000 与 15 分末秒 959000 秒段均为 59，分钟段依次为 14/15
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume080079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080079 begin');
      const m14: string = utils.convertTimeToFormatString(899000);
      const m15: string = utils.convertTimeToFormatString(959000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', m14, '00:14:59');
      expect(m14).assertEqual('00:14:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', m15, '00:15:59');
      expect(m15).assertEqual('00:15:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(m14 !== m15 && m14.length === 8));
      expect(m14 !== m15 && m14.length === 8).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume080079 end');
    })
  })
}
