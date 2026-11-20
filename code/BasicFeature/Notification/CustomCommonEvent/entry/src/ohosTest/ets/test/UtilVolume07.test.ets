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

export default function utilVolume07Test(): void {
  describe('UtilVolume07Test', () => {

    /**
     * @tc.name   testUtilVolume070001
     * @tc.number SUB_CCE_UTILV_07_0001
     * @tc.desc   时长 1h1m1s（n=3661000）按格点组合格式化为 01:01:01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume070001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070001 begin');
      const n: number = 3661000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('01:01:01'));
      expect(result).assertEqual('01:01:01');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('01'));
      expect(result.substring(result.length - 2)).assertEqual('01');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070001 end');
    })

    /**
     * @tc.name   testUtilVolume070002
     * @tc.number SUB_CCE_UTILV_07_0002
     * @tc.desc   时长 1h1m17s（n=3677000）按格点组合格式化为 01:01:17
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume070002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070002 begin');
      const n: number = 3677000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('01:01:17'));
      expect(result).assertEqual('01:01:17');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('17'));
      expect(result.substring(result.length - 2)).assertEqual('17');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070002 end');
    })

    /**
     * @tc.name   testUtilVolume070003
     * @tc.number SUB_CCE_UTILV_07_0003
     * @tc.desc   时长 1h1m58s（n=3718000）按格点组合格式化为 01:01:58
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume070003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070003 begin');
      const n: number = 3718000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('01:01:58'));
      expect(result).assertEqual('01:01:58');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('58'));
      expect(result.substring(result.length - 2)).assertEqual('58');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070003 end');
    })

    /**
     * @tc.name   testUtilVolume070004
     * @tc.number SUB_CCE_UTILV_07_0004
     * @tc.desc   时长 1h29m1s（n=5341000）按格点组合格式化为 01:29:01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume070004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070004 begin');
      const n: number = 5341000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('01:29:01'));
      expect(result).assertEqual('01:29:01');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('01'));
      expect(result.substring(result.length - 2)).assertEqual('01');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070004 end');
    })

    /**
     * @tc.name   testUtilVolume070005
     * @tc.number SUB_CCE_UTILV_07_0005
     * @tc.desc   时长 1h29m17s（n=5357000）按格点组合格式化为 01:29:17
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume070005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070005 begin');
      const n: number = 5357000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('01:29:17'));
      expect(result).assertEqual('01:29:17');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('17'));
      expect(result.substring(result.length - 2)).assertEqual('17');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070005 end');
    })

    /**
     * @tc.name   testUtilVolume070006
     * @tc.number SUB_CCE_UTILV_07_0006
     * @tc.desc   时长 1h29m58s（n=5398000）按格点组合格式化为 01:29:58
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume070006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070006 begin');
      const n: number = 5398000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('01:29:58'));
      expect(result).assertEqual('01:29:58');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('58'));
      expect(result.substring(result.length - 2)).assertEqual('58');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070006 end');
    })

    /**
     * @tc.name   testUtilVolume070007
     * @tc.number SUB_CCE_UTILV_07_0007
     * @tc.desc   时长 1h53m1s（n=6781000）按格点组合格式化为 01:53:01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume070007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070007 begin');
      const n: number = 6781000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('01:53:01'));
      expect(result).assertEqual('01:53:01');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('01'));
      expect(result.substring(result.length - 2)).assertEqual('01');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070007 end');
    })

    /**
     * @tc.name   testUtilVolume070008
     * @tc.number SUB_CCE_UTILV_07_0008
     * @tc.desc   时长 1h53m17s（n=6797000）按格点组合格式化为 01:53:17
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume070008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070008 begin');
      const n: number = 6797000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('01:53:17'));
      expect(result).assertEqual('01:53:17');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('17'));
      expect(result.substring(result.length - 2)).assertEqual('17');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070008 end');
    })

    /**
     * @tc.name   testUtilVolume070009
     * @tc.number SUB_CCE_UTILV_07_0009
     * @tc.desc   时长 1h53m58s（n=6838000）按格点组合格式化为 01:53:58
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume070009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070009 begin');
      const n: number = 6838000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('01:53:58'));
      expect(result).assertEqual('01:53:58');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('58'));
      expect(result.substring(result.length - 2)).assertEqual('58');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070009 end');
    })

    /**
     * @tc.name   testUtilVolume070010
     * @tc.number SUB_CCE_UTILV_07_0010
     * @tc.desc   时长 3h1m1s（n=10861000）按格点组合格式化为 03:01:01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume070010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070010 begin');
      const n: number = 10861000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('03:01:01'));
      expect(result).assertEqual('03:01:01');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('01'));
      expect(result.substring(result.length - 2)).assertEqual('01');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070010 end');
    })

    /**
     * @tc.name   testUtilVolume070011
     * @tc.number SUB_CCE_UTILV_07_0011
     * @tc.desc   时长 3h1m17s（n=10877000）按格点组合格式化为 03:01:17
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume070011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070011 begin');
      const n: number = 10877000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('03:01:17'));
      expect(result).assertEqual('03:01:17');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('17'));
      expect(result.substring(result.length - 2)).assertEqual('17');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070011 end');
    })

    /**
     * @tc.name   testUtilVolume070012
     * @tc.number SUB_CCE_UTILV_07_0012
     * @tc.desc   时长 3h1m58s（n=10918000）按格点组合格式化为 03:01:58
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume070012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070012 begin');
      const n: number = 10918000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('03:01:58'));
      expect(result).assertEqual('03:01:58');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('58'));
      expect(result.substring(result.length - 2)).assertEqual('58');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070012 end');
    })

    /**
     * @tc.name   testUtilVolume070013
     * @tc.number SUB_CCE_UTILV_07_0013
     * @tc.desc   时长 3h29m1s（n=12541000）按格点组合格式化为 03:29:01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume070013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070013 begin');
      const n: number = 12541000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('03:29:01'));
      expect(result).assertEqual('03:29:01');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('01'));
      expect(result.substring(result.length - 2)).assertEqual('01');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070013 end');
    })

    /**
     * @tc.name   testUtilVolume070014
     * @tc.number SUB_CCE_UTILV_07_0014
     * @tc.desc   时长 3h29m17s（n=12557000）按格点组合格式化为 03:29:17
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume070014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070014 begin');
      const n: number = 12557000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('03:29:17'));
      expect(result).assertEqual('03:29:17');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('17'));
      expect(result.substring(result.length - 2)).assertEqual('17');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070014 end');
    })

    /**
     * @tc.name   testUtilVolume070015
     * @tc.number SUB_CCE_UTILV_07_0015
     * @tc.desc   时长 3h29m58s（n=12598000）按格点组合格式化为 03:29:58
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume070015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070015 begin');
      const n: number = 12598000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('03:29:58'));
      expect(result).assertEqual('03:29:58');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('58'));
      expect(result.substring(result.length - 2)).assertEqual('58');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070015 end');
    })

    /**
     * @tc.name   testUtilVolume070016
     * @tc.number SUB_CCE_UTILV_07_0016
     * @tc.desc   时长 3h53m1s（n=13981000）按格点组合格式化为 03:53:01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume070016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070016 begin');
      const n: number = 13981000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('03:53:01'));
      expect(result).assertEqual('03:53:01');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('01'));
      expect(result.substring(result.length - 2)).assertEqual('01');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070016 end');
    })

    /**
     * @tc.name   testUtilVolume070017
     * @tc.number SUB_CCE_UTILV_07_0017
     * @tc.desc   时长 3h53m17s（n=13997000）按格点组合格式化为 03:53:17
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume070017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070017 begin');
      const n: number = 13997000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('03:53:17'));
      expect(result).assertEqual('03:53:17');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('17'));
      expect(result.substring(result.length - 2)).assertEqual('17');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070017 end');
    })

    /**
     * @tc.name   testUtilVolume070018
     * @tc.number SUB_CCE_UTILV_07_0018
     * @tc.desc   时长 3h53m58s（n=14038000）按格点组合格式化为 03:53:58
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume070018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070018 begin');
      const n: number = 14038000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('03:53:58'));
      expect(result).assertEqual('03:53:58');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('58'));
      expect(result.substring(result.length - 2)).assertEqual('58');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070018 end');
    })

    /**
     * @tc.name   testUtilVolume070019
     * @tc.number SUB_CCE_UTILV_07_0019
     * @tc.desc   时长 7h1m1s（n=25261000）按格点组合格式化为 07:01:01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume070019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070019 begin');
      const n: number = 25261000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('07:01:01'));
      expect(result).assertEqual('07:01:01');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('01'));
      expect(result.substring(result.length - 2)).assertEqual('01');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070019 end');
    })

    /**
     * @tc.name   testUtilVolume070020
     * @tc.number SUB_CCE_UTILV_07_0020
     * @tc.desc   时长 7h1m17s（n=25277000）按格点组合格式化为 07:01:17
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume070020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070020 begin');
      const n: number = 25277000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('07:01:17'));
      expect(result).assertEqual('07:01:17');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('17'));
      expect(result.substring(result.length - 2)).assertEqual('17');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070020 end');
    })

    /**
     * @tc.name   testUtilVolume070021
     * @tc.number SUB_CCE_UTILV_07_0021
     * @tc.desc   时长 7h1m58s（n=25318000）按格点组合格式化为 07:01:58
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume070021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070021 begin');
      const n: number = 25318000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('07:01:58'));
      expect(result).assertEqual('07:01:58');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('58'));
      expect(result.substring(result.length - 2)).assertEqual('58');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070021 end');
    })

    /**
     * @tc.name   testUtilVolume070022
     * @tc.number SUB_CCE_UTILV_07_0022
     * @tc.desc   时长 7h29m1s（n=26941000）按格点组合格式化为 07:29:01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume070022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070022 begin');
      const n: number = 26941000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('07:29:01'));
      expect(result).assertEqual('07:29:01');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('01'));
      expect(result.substring(result.length - 2)).assertEqual('01');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070022 end');
    })

    /**
     * @tc.name   testUtilVolume070023
     * @tc.number SUB_CCE_UTILV_07_0023
     * @tc.desc   时长 7h29m17s（n=26957000）按格点组合格式化为 07:29:17
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume070023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070023 begin');
      const n: number = 26957000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('07:29:17'));
      expect(result).assertEqual('07:29:17');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('17'));
      expect(result.substring(result.length - 2)).assertEqual('17');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070023 end');
    })

    /**
     * @tc.name   testUtilVolume070024
     * @tc.number SUB_CCE_UTILV_07_0024
     * @tc.desc   时长 7h29m58s（n=26998000）按格点组合格式化为 07:29:58
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume070024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070024 begin');
      const n: number = 26998000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('07:29:58'));
      expect(result).assertEqual('07:29:58');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('58'));
      expect(result.substring(result.length - 2)).assertEqual('58');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070024 end');
    })

    /**
     * @tc.name   testUtilVolume070025
     * @tc.number SUB_CCE_UTILV_07_0025
     * @tc.desc   时长 7h53m1s（n=28381000）按格点组合格式化为 07:53:01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume070025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070025 begin');
      const n: number = 28381000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('07:53:01'));
      expect(result).assertEqual('07:53:01');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('01'));
      expect(result.substring(result.length - 2)).assertEqual('01');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070025 end');
    })

    /**
     * @tc.name   testUtilVolume070026
     * @tc.number SUB_CCE_UTILV_07_0026
     * @tc.desc   时长 7h53m17s（n=28397000）按格点组合格式化为 07:53:17
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume070026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070026 begin');
      const n: number = 28397000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('07:53:17'));
      expect(result).assertEqual('07:53:17');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('17'));
      expect(result.substring(result.length - 2)).assertEqual('17');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070026 end');
    })

    /**
     * @tc.name   testUtilVolume070027
     * @tc.number SUB_CCE_UTILV_07_0027
     * @tc.desc   时长 7h53m58s（n=28438000）按格点组合格式化为 07:53:58
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume070027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070027 begin');
      const n: number = 28438000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('07:53:58'));
      expect(result).assertEqual('07:53:58');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('58'));
      expect(result.substring(result.length - 2)).assertEqual('58');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070027 end');
    })

    /**
     * @tc.name   testUtilVolume070028
     * @tc.number SUB_CCE_UTILV_07_0028
     * @tc.desc   时长 11h1m1s（n=39661000）按格点组合格式化为 11:01:01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume070028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070028 begin');
      const n: number = 39661000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('11:01:01'));
      expect(result).assertEqual('11:01:01');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('01'));
      expect(result.substring(result.length - 2)).assertEqual('01');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070028 end');
    })

    /**
     * @tc.name   testUtilVolume070029
     * @tc.number SUB_CCE_UTILV_07_0029
     * @tc.desc   时长 11h1m17s（n=39677000）按格点组合格式化为 11:01:17
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume070029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070029 begin');
      const n: number = 39677000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('11:01:17'));
      expect(result).assertEqual('11:01:17');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('17'));
      expect(result.substring(result.length - 2)).assertEqual('17');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070029 end');
    })

    /**
     * @tc.name   testUtilVolume070030
     * @tc.number SUB_CCE_UTILV_07_0030
     * @tc.desc   时长 11h1m58s（n=39718000）按格点组合格式化为 11:01:58
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume070030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070030 begin');
      const n: number = 39718000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('11:01:58'));
      expect(result).assertEqual('11:01:58');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('58'));
      expect(result.substring(result.length - 2)).assertEqual('58');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070030 end');
    })

    /**
     * @tc.name   testUtilVolume070031
     * @tc.number SUB_CCE_UTILV_07_0031
     * @tc.desc   时长 11h29m1s（n=41341000）按格点组合格式化为 11:29:01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume070031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070031 begin');
      const n: number = 41341000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('11:29:01'));
      expect(result).assertEqual('11:29:01');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('01'));
      expect(result.substring(result.length - 2)).assertEqual('01');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070031 end');
    })

    /**
     * @tc.name   testUtilVolume070032
     * @tc.number SUB_CCE_UTILV_07_0032
     * @tc.desc   时长 11h29m17s（n=41357000）按格点组合格式化为 11:29:17
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume070032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070032 begin');
      const n: number = 41357000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('11:29:17'));
      expect(result).assertEqual('11:29:17');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('17'));
      expect(result.substring(result.length - 2)).assertEqual('17');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070032 end');
    })

    /**
     * @tc.name   testUtilVolume070033
     * @tc.number SUB_CCE_UTILV_07_0033
     * @tc.desc   时长 11h29m58s（n=41398000）按格点组合格式化为 11:29:58
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume070033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070033 begin');
      const n: number = 41398000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('11:29:58'));
      expect(result).assertEqual('11:29:58');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('58'));
      expect(result.substring(result.length - 2)).assertEqual('58');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070033 end');
    })

    /**
     * @tc.name   testUtilVolume070034
     * @tc.number SUB_CCE_UTILV_07_0034
     * @tc.desc   时长 11h53m1s（n=42781000）按格点组合格式化为 11:53:01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume070034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070034 begin');
      const n: number = 42781000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('11:53:01'));
      expect(result).assertEqual('11:53:01');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('01'));
      expect(result.substring(result.length - 2)).assertEqual('01');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070034 end');
    })

    /**
     * @tc.name   testUtilVolume070035
     * @tc.number SUB_CCE_UTILV_07_0035
     * @tc.desc   时长 11h53m17s（n=42797000）按格点组合格式化为 11:53:17
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume070035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070035 begin');
      const n: number = 42797000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('11:53:17'));
      expect(result).assertEqual('11:53:17');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('17'));
      expect(result.substring(result.length - 2)).assertEqual('17');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070035 end');
    })

    /**
     * @tc.name   testUtilVolume070036
     * @tc.number SUB_CCE_UTILV_07_0036
     * @tc.desc   时长 11h53m58s（n=42838000）按格点组合格式化为 11:53:58
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume070036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070036 begin');
      const n: number = 42838000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('11:53:58'));
      expect(result).assertEqual('11:53:58');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('58'));
      expect(result.substring(result.length - 2)).assertEqual('58');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070036 end');
    })

    /**
     * @tc.name   testUtilVolume070037
     * @tc.number SUB_CCE_UTILV_07_0037
     * @tc.desc   时长 15h1m1s（n=54061000）按格点组合格式化为 15:01:01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume070037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070037 begin');
      const n: number = 54061000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('15:01:01'));
      expect(result).assertEqual('15:01:01');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('01'));
      expect(result.substring(result.length - 2)).assertEqual('01');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070037 end');
    })

    /**
     * @tc.name   testUtilVolume070038
     * @tc.number SUB_CCE_UTILV_07_0038
     * @tc.desc   时长 15h1m17s（n=54077000）按格点组合格式化为 15:01:17
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume070038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070038 begin');
      const n: number = 54077000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('15:01:17'));
      expect(result).assertEqual('15:01:17');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('17'));
      expect(result.substring(result.length - 2)).assertEqual('17');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070038 end');
    })

    /**
     * @tc.name   testUtilVolume070039
     * @tc.number SUB_CCE_UTILV_07_0039
     * @tc.desc   时长 15h1m58s（n=54118000）按格点组合格式化为 15:01:58
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume070039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070039 begin');
      const n: number = 54118000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('15:01:58'));
      expect(result).assertEqual('15:01:58');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('58'));
      expect(result.substring(result.length - 2)).assertEqual('58');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070039 end');
    })

    /**
     * @tc.name   testUtilVolume070040
     * @tc.number SUB_CCE_UTILV_07_0040
     * @tc.desc   时长 15h29m1s（n=55741000）按格点组合格式化为 15:29:01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume070040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070040 begin');
      const n: number = 55741000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('15:29:01'));
      expect(result).assertEqual('15:29:01');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('01'));
      expect(result.substring(result.length - 2)).assertEqual('01');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070040 end');
    })

    /**
     * @tc.name   testUtilVolume070041
     * @tc.number SUB_CCE_UTILV_07_0041
     * @tc.desc   时长 15h29m17s（n=55757000）按格点组合格式化为 15:29:17
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume070041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070041 begin');
      const n: number = 55757000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('15:29:17'));
      expect(result).assertEqual('15:29:17');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('17'));
      expect(result.substring(result.length - 2)).assertEqual('17');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070041 end');
    })

    /**
     * @tc.name   testUtilVolume070042
     * @tc.number SUB_CCE_UTILV_07_0042
     * @tc.desc   时长 15h29m58s（n=55798000）按格点组合格式化为 15:29:58
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume070042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070042 begin');
      const n: number = 55798000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('15:29:58'));
      expect(result).assertEqual('15:29:58');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('58'));
      expect(result.substring(result.length - 2)).assertEqual('58');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070042 end');
    })

    /**
     * @tc.name   testUtilVolume070043
     * @tc.number SUB_CCE_UTILV_07_0043
     * @tc.desc   时长 15h53m1s（n=57181000）按格点组合格式化为 15:53:01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume070043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070043 begin');
      const n: number = 57181000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('15:53:01'));
      expect(result).assertEqual('15:53:01');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('01'));
      expect(result.substring(result.length - 2)).assertEqual('01');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070043 end');
    })

    /**
     * @tc.name   testUtilVolume070044
     * @tc.number SUB_CCE_UTILV_07_0044
     * @tc.desc   时长 15h53m17s（n=57197000）按格点组合格式化为 15:53:17
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume070044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070044 begin');
      const n: number = 57197000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('15:53:17'));
      expect(result).assertEqual('15:53:17');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('17'));
      expect(result.substring(result.length - 2)).assertEqual('17');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070044 end');
    })

    /**
     * @tc.name   testUtilVolume070045
     * @tc.number SUB_CCE_UTILV_07_0045
     * @tc.desc   时长 15h53m58s（n=57238000）按格点组合格式化为 15:53:58
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume070045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070045 begin');
      const n: number = 57238000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('15:53:58'));
      expect(result).assertEqual('15:53:58');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('58'));
      expect(result.substring(result.length - 2)).assertEqual('58');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070045 end');
    })

    /**
     * @tc.name   testUtilVolume070046
     * @tc.number SUB_CCE_UTILV_07_0046
     * @tc.desc   时长 19h1m1s（n=68461000）按格点组合格式化为 19:01:01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume070046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070046 begin');
      const n: number = 68461000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('19:01:01'));
      expect(result).assertEqual('19:01:01');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('01'));
      expect(result.substring(result.length - 2)).assertEqual('01');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070046 end');
    })

    /**
     * @tc.name   testUtilVolume070047
     * @tc.number SUB_CCE_UTILV_07_0047
     * @tc.desc   时长 19h1m17s（n=68477000）按格点组合格式化为 19:01:17
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume070047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070047 begin');
      const n: number = 68477000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('19:01:17'));
      expect(result).assertEqual('19:01:17');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('17'));
      expect(result.substring(result.length - 2)).assertEqual('17');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070047 end');
    })

    /**
     * @tc.name   testUtilVolume070048
     * @tc.number SUB_CCE_UTILV_07_0048
     * @tc.desc   时长 19h1m58s（n=68518000）按格点组合格式化为 19:01:58
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume070048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070048 begin');
      const n: number = 68518000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('19:01:58'));
      expect(result).assertEqual('19:01:58');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('58'));
      expect(result.substring(result.length - 2)).assertEqual('58');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070048 end');
    })

    /**
     * @tc.name   testUtilVolume070049
     * @tc.number SUB_CCE_UTILV_07_0049
     * @tc.desc   时长 19h29m1s（n=70141000）按格点组合格式化为 19:29:01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume070049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070049 begin');
      const n: number = 70141000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('19:29:01'));
      expect(result).assertEqual('19:29:01');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('01'));
      expect(result.substring(result.length - 2)).assertEqual('01');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070049 end');
    })

    /**
     * @tc.name   testUtilVolume070050
     * @tc.number SUB_CCE_UTILV_07_0050
     * @tc.desc   时长 19h29m17s（n=70157000）按格点组合格式化为 19:29:17
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume070050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070050 begin');
      const n: number = 70157000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('19:29:17'));
      expect(result).assertEqual('19:29:17');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('17'));
      expect(result.substring(result.length - 2)).assertEqual('17');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070050 end');
    })

    /**
     * @tc.name   testUtilVolume070051
     * @tc.number SUB_CCE_UTILV_07_0051
     * @tc.desc   时长 19h29m58s（n=70198000）按格点组合格式化为 19:29:58
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume070051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070051 begin');
      const n: number = 70198000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('19:29:58'));
      expect(result).assertEqual('19:29:58');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('58'));
      expect(result.substring(result.length - 2)).assertEqual('58');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070051 end');
    })

    /**
     * @tc.name   testUtilVolume070052
     * @tc.number SUB_CCE_UTILV_07_0052
     * @tc.desc   时长 19h53m1s（n=71581000）按格点组合格式化为 19:53:01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume070052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070052 begin');
      const n: number = 71581000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('19:53:01'));
      expect(result).assertEqual('19:53:01');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('01'));
      expect(result.substring(result.length - 2)).assertEqual('01');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070052 end');
    })

    /**
     * @tc.name   testUtilVolume070053
     * @tc.number SUB_CCE_UTILV_07_0053
     * @tc.desc   时长 19h53m17s（n=71597000）按格点组合格式化为 19:53:17
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume070053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070053 begin');
      const n: number = 71597000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('19:53:17'));
      expect(result).assertEqual('19:53:17');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('17'));
      expect(result.substring(result.length - 2)).assertEqual('17');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070053 end');
    })

    /**
     * @tc.name   testUtilVolume070054
     * @tc.number SUB_CCE_UTILV_07_0054
     * @tc.desc   时长 19h53m58s（n=71638000）按格点组合格式化为 19:53:58
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume070054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070054 begin');
      const n: number = 71638000;
      const result: string = utils.convertTimeToFormatString(n);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('19:53:58'));
      expect(result).assertEqual('19:53:58');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.substring(result.length - 2)), String('58'));
      expect(result.substring(result.length - 2)).assertEqual('58');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070054 end');
    })

    /**
     * @tc.name   testUtilVolume070055
     * @tc.number SUB_CCE_UTILV_07_0055
     * @tc.desc   23h58m58s 组合格点格式化为 23:58:58，三段两两互异
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUtilVolume070055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070055 begin');
      const combo: string = utils.convertTimeToFormatString(86338000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', combo, '23:58:58');
      expect(combo).assertEqual('23:58:58');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', combo.split(':')[0], '23');
      expect(combo.split(':')[0]).assertEqual('23');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(combo.length === 8));
      expect(combo.length === 8).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilVolume070055 end');
    })
  })
}
