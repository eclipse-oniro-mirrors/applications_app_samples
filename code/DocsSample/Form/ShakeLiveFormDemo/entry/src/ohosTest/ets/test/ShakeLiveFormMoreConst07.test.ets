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
import { Constants } from '../../../main/ets/common/Constants';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function shakeLiveFormMoreConst07Test() {
  describe('ShakeLiveFormMoreConst07Test', () => {

    /**
     * @tc.name   testShakeMoreConst070001
     * @tc.number SUB_SHAKE_MORE_CONST_07_0001
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 1940 equals 291.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst070001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst070001 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_TOP_RATIO * 1940).assertEqual(291.0);');
      expect(Constants.OVERFLOW_TOP_RATIO * 1940).assertEqual(291.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_HEIGHT_RATIO * 1940).assertEqual(2522.0);');
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 1940).assertEqual(2522.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_DURATION).assertEqual(3500);');
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst070001 end');
    })

    /**
     * @tc.name   testShakeMoreConst070002
     * @tc.number SUB_SHAKE_MORE_CONST_07_0002
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 1960 equals 294.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst070002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst070002 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_TOP_RATIO * 1960).assertEqual(294.0);');
      expect(Constants.OVERFLOW_TOP_RATIO * 1960).assertEqual(294.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_HEIGHT_RATIO * 1960).assertEqual(2548.0);');
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 1960).assertEqual(2548.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_DURATION).assertEqual(3500);');
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst070002 end');
    })

    /**
     * @tc.name   testShakeMoreConst070003
     * @tc.number SUB_SHAKE_MORE_CONST_07_0003
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 1980 equals 297.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst070003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst070003 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_TOP_RATIO * 1980).assertEqual(297.0);');
      expect(Constants.OVERFLOW_TOP_RATIO * 1980).assertEqual(297.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_HEIGHT_RATIO * 1980).assertEqual(2574.0);');
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 1980).assertEqual(2574.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_DURATION).assertEqual(3500);');
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst070003 end');
    })

    /**
     * @tc.name   testShakeMoreConst070004
     * @tc.number SUB_SHAKE_MORE_CONST_07_0004
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 2000 equals 300.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst070004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst070004 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_TOP_RATIO * 2000).assertEqual(300.0);');
      expect(Constants.OVERFLOW_TOP_RATIO * 2000).assertEqual(300.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_HEIGHT_RATIO * 2000).assertEqual(2600.0);');
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 2000).assertEqual(2600.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_DURATION).assertEqual(3500);');
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst070004 end');
    })

    /**
     * @tc.name   testShakeMoreConst070005
     * @tc.number SUB_SHAKE_MORE_CONST_07_0005
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 2020 equals 303.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst070005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst070005 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_TOP_RATIO * 2020).assertEqual(303.0);');
      expect(Constants.OVERFLOW_TOP_RATIO * 2020).assertEqual(303.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_HEIGHT_RATIO * 2020).assertEqual(2626.0);');
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 2020).assertEqual(2626.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_DURATION).assertEqual(3500);');
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst070005 end');
    })

    /**
     * @tc.name   testShakeMoreConst070006
     * @tc.number SUB_SHAKE_MORE_CONST_07_0006
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 2040 equals 306.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst070006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst070006 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_TOP_RATIO * 2040).assertEqual(306.0);');
      expect(Constants.OVERFLOW_TOP_RATIO * 2040).assertEqual(306.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_HEIGHT_RATIO * 2040).assertEqual(2652.0);');
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 2040).assertEqual(2652.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_DURATION).assertEqual(3500);');
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst070006 end');
    })

    /**
     * @tc.name   testShakeMoreConst070007
     * @tc.number SUB_SHAKE_MORE_CONST_07_0007
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 2060 equals 309.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst070007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst070007 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_TOP_RATIO * 2060).assertEqual(309.0);');
      expect(Constants.OVERFLOW_TOP_RATIO * 2060).assertEqual(309.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_HEIGHT_RATIO * 2060).assertEqual(2678.0);');
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 2060).assertEqual(2678.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_DURATION).assertEqual(3500);');
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst070007 end');
    })

    /**
     * @tc.name   testShakeMoreConst070008
     * @tc.number SUB_SHAKE_MORE_CONST_07_0008
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 2080 equals 312.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst070008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst070008 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_TOP_RATIO * 2080).assertEqual(312.0);');
      expect(Constants.OVERFLOW_TOP_RATIO * 2080).assertEqual(312.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_HEIGHT_RATIO * 2080).assertEqual(2704.0);');
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 2080).assertEqual(2704.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_DURATION).assertEqual(3500);');
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst070008 end');
    })

    /**
     * @tc.name   testShakeMoreConst070009
     * @tc.number SUB_SHAKE_MORE_CONST_07_0009
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 2100 equals 315.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst070009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst070009 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_TOP_RATIO * 2100).assertEqual(315.0);');
      expect(Constants.OVERFLOW_TOP_RATIO * 2100).assertEqual(315.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_HEIGHT_RATIO * 2100).assertEqual(2730.0);');
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 2100).assertEqual(2730.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_DURATION).assertEqual(3500);');
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst070009 end');
    })

    /**
     * @tc.name   testShakeMoreConst070010
     * @tc.number SUB_SHAKE_MORE_CONST_07_0010
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 2120 equals 318.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst070010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst070010 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_TOP_RATIO * 2120).assertEqual(318.0);');
      expect(Constants.OVERFLOW_TOP_RATIO * 2120).assertEqual(318.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_HEIGHT_RATIO * 2120).assertEqual(2756.0);');
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 2120).assertEqual(2756.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_DURATION).assertEqual(3500);');
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst070010 end');
    })

    /**
     * @tc.name   testShakeMoreConst070011
     * @tc.number SUB_SHAKE_MORE_CONST_07_0011
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 2140 equals 321.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst070011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst070011 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_TOP_RATIO * 2140).assertEqual(321.0);');
      expect(Constants.OVERFLOW_TOP_RATIO * 2140).assertEqual(321.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_HEIGHT_RATIO * 2140).assertEqual(2782.0);');
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 2140).assertEqual(2782.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_DURATION).assertEqual(3500);');
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst070011 end');
    })

    /**
     * @tc.name   testShakeMoreConst070012
     * @tc.number SUB_SHAKE_MORE_CONST_07_0012
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 2160 equals 324.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst070012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst070012 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_TOP_RATIO * 2160).assertEqual(324.0);');
      expect(Constants.OVERFLOW_TOP_RATIO * 2160).assertEqual(324.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_HEIGHT_RATIO * 2160).assertEqual(2808.0);');
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 2160).assertEqual(2808.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_DURATION).assertEqual(3500);');
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst070012 end');
    })

    /**
     * @tc.name   testShakeMoreConst070013
     * @tc.number SUB_SHAKE_MORE_CONST_07_0013
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 2180 equals 327.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst070013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst070013 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_TOP_RATIO * 2180).assertEqual(327.0);');
      expect(Constants.OVERFLOW_TOP_RATIO * 2180).assertEqual(327.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_HEIGHT_RATIO * 2180).assertEqual(2834.0);');
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 2180).assertEqual(2834.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_DURATION).assertEqual(3500);');
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst070013 end');
    })

    /**
     * @tc.name   testShakeMoreConst070014
     * @tc.number SUB_SHAKE_MORE_CONST_07_0014
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 2200 equals 330.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst070014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst070014 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_TOP_RATIO * 2200).assertEqual(330.0);');
      expect(Constants.OVERFLOW_TOP_RATIO * 2200).assertEqual(330.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_HEIGHT_RATIO * 2200).assertEqual(2860.0);');
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 2200).assertEqual(2860.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_DURATION).assertEqual(3500);');
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst070014 end');
    })

    /**
     * @tc.name   testShakeMoreConst070015
     * @tc.number SUB_SHAKE_MORE_CONST_07_0015
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 2220 equals 333.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst070015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst070015 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_TOP_RATIO * 2220).assertEqual(333.0);');
      expect(Constants.OVERFLOW_TOP_RATIO * 2220).assertEqual(333.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_HEIGHT_RATIO * 2220).assertEqual(2886.0);');
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 2220).assertEqual(2886.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_DURATION).assertEqual(3500);');
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst070015 end');
    })

    /**
     * @tc.name   testShakeMoreConst070016
     * @tc.number SUB_SHAKE_MORE_CONST_07_0016
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 2240 equals 336.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst070016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst070016 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_TOP_RATIO * 2240).assertEqual(336.0);');
      expect(Constants.OVERFLOW_TOP_RATIO * 2240).assertEqual(336.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_HEIGHT_RATIO * 2240).assertEqual(2912.0);');
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 2240).assertEqual(2912.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_DURATION).assertEqual(3500);');
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst070016 end');
    })
  })
}
