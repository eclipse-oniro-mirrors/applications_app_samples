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

export default function shakeLiveFormMoreConst03Test() {
  describe('ShakeLiveFormMoreConst03Test', () => {

    /**
     * @tc.name   testShakeMoreConst030001
     * @tc.number SUB_SHAKE_MORE_CONST_03_0001
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 660 equals 99.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst030001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst030001 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_TOP_RATIO * 660), String(99.0));
      expect(Constants.OVERFLOW_TOP_RATIO * 660).assertEqual(99.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_HEIGHT_RATIO * 660), String(858.0));
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 660).assertEqual(858.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_DURATION), String(3500));
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst030001 end');
    })

    /**
     * @tc.name   testShakeMoreConst030002
     * @tc.number SUB_SHAKE_MORE_CONST_03_0002
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 680 equals 102.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst030002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst030002 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_TOP_RATIO * 680), String(102.0));
      expect(Constants.OVERFLOW_TOP_RATIO * 680).assertEqual(102.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_HEIGHT_RATIO * 680), String(884.0));
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 680).assertEqual(884.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_DURATION), String(3500));
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst030002 end');
    })

    /**
     * @tc.name   testShakeMoreConst030003
     * @tc.number SUB_SHAKE_MORE_CONST_03_0003
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 700 equals 105.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst030003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst030003 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_TOP_RATIO * 700), String(105.0));
      expect(Constants.OVERFLOW_TOP_RATIO * 700).assertEqual(105.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_HEIGHT_RATIO * 700), String(910.0));
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 700).assertEqual(910.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_DURATION), String(3500));
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst030003 end');
    })

    /**
     * @tc.name   testShakeMoreConst030004
     * @tc.number SUB_SHAKE_MORE_CONST_03_0004
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 720 equals 108.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst030004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst030004 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_TOP_RATIO * 720), String(108.0));
      expect(Constants.OVERFLOW_TOP_RATIO * 720).assertEqual(108.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_HEIGHT_RATIO * 720), String(936.0));
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 720).assertEqual(936.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_DURATION), String(3500));
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst030004 end');
    })

    /**
     * @tc.name   testShakeMoreConst030005
     * @tc.number SUB_SHAKE_MORE_CONST_03_0005
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 740 equals 111.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst030005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst030005 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_TOP_RATIO * 740), String(111.0));
      expect(Constants.OVERFLOW_TOP_RATIO * 740).assertEqual(111.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_HEIGHT_RATIO * 740), String(962.0));
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 740).assertEqual(962.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_DURATION), String(3500));
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst030005 end');
    })

    /**
     * @tc.name   testShakeMoreConst030006
     * @tc.number SUB_SHAKE_MORE_CONST_03_0006
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 760 equals 114.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst030006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst030006 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_TOP_RATIO * 760), String(114.0));
      expect(Constants.OVERFLOW_TOP_RATIO * 760).assertEqual(114.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_HEIGHT_RATIO * 760), String(988.0));
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 760).assertEqual(988.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_DURATION), String(3500));
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst030006 end');
    })

    /**
     * @tc.name   testShakeMoreConst030007
     * @tc.number SUB_SHAKE_MORE_CONST_03_0007
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 780 equals 117.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst030007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst030007 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_TOP_RATIO * 780), String(117.0));
      expect(Constants.OVERFLOW_TOP_RATIO * 780).assertEqual(117.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_HEIGHT_RATIO * 780), String(1014.0));
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 780).assertEqual(1014.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_DURATION), String(3500));
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst030007 end');
    })

    /**
     * @tc.name   testShakeMoreConst030008
     * @tc.number SUB_SHAKE_MORE_CONST_03_0008
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 800 equals 120.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst030008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst030008 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_TOP_RATIO * 800), String(120.0));
      expect(Constants.OVERFLOW_TOP_RATIO * 800).assertEqual(120.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_HEIGHT_RATIO * 800), String(1040.0));
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 800).assertEqual(1040.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_DURATION), String(3500));
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst030008 end');
    })

    /**
     * @tc.name   testShakeMoreConst030009
     * @tc.number SUB_SHAKE_MORE_CONST_03_0009
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 820 equals 123.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst030009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst030009 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_TOP_RATIO * 820), String(123.0));
      expect(Constants.OVERFLOW_TOP_RATIO * 820).assertEqual(123.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_HEIGHT_RATIO * 820), String(1066.0));
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 820).assertEqual(1066.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_DURATION), String(3500));
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst030009 end');
    })

    /**
     * @tc.name   testShakeMoreConst030010
     * @tc.number SUB_SHAKE_MORE_CONST_03_0010
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 840 equals 126.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst030010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst030010 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_TOP_RATIO * 840), String(126.0));
      expect(Constants.OVERFLOW_TOP_RATIO * 840).assertEqual(126.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_HEIGHT_RATIO * 840), String(1092.0));
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 840).assertEqual(1092.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_DURATION), String(3500));
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst030010 end');
    })

    /**
     * @tc.name   testShakeMoreConst030011
     * @tc.number SUB_SHAKE_MORE_CONST_03_0011
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 860 equals 129.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst030011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst030011 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_TOP_RATIO * 860), String(129.0));
      expect(Constants.OVERFLOW_TOP_RATIO * 860).assertEqual(129.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_HEIGHT_RATIO * 860), String(1118.0));
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 860).assertEqual(1118.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_DURATION), String(3500));
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst030011 end');
    })

    /**
     * @tc.name   testShakeMoreConst030012
     * @tc.number SUB_SHAKE_MORE_CONST_03_0012
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 880 equals 132.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst030012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst030012 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_TOP_RATIO * 880), String(132.0));
      expect(Constants.OVERFLOW_TOP_RATIO * 880).assertEqual(132.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_HEIGHT_RATIO * 880), String(1144.0));
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 880).assertEqual(1144.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_DURATION), String(3500));
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst030012 end');
    })

    /**
     * @tc.name   testShakeMoreConst030013
     * @tc.number SUB_SHAKE_MORE_CONST_03_0013
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 900 equals 135.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst030013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst030013 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_TOP_RATIO * 900), String(135.0));
      expect(Constants.OVERFLOW_TOP_RATIO * 900).assertEqual(135.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_HEIGHT_RATIO * 900), String(1170.0));
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 900).assertEqual(1170.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_DURATION), String(3500));
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst030013 end');
    })

    /**
     * @tc.name   testShakeMoreConst030014
     * @tc.number SUB_SHAKE_MORE_CONST_03_0014
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 920 equals 138.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst030014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst030014 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_TOP_RATIO * 920), String(138.0));
      expect(Constants.OVERFLOW_TOP_RATIO * 920).assertEqual(138.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_HEIGHT_RATIO * 920), String(1196.0));
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 920).assertEqual(1196.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_DURATION), String(3500));
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst030014 end');
    })

    /**
     * @tc.name   testShakeMoreConst030015
     * @tc.number SUB_SHAKE_MORE_CONST_03_0015
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 940 equals 141.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst030015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst030015 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_TOP_RATIO * 940), String(141.0));
      expect(Constants.OVERFLOW_TOP_RATIO * 940).assertEqual(141.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_HEIGHT_RATIO * 940), String(1222.0));
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 940).assertEqual(1222.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_DURATION), String(3500));
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst030015 end');
    })

    /**
     * @tc.name   testShakeMoreConst030016
     * @tc.number SUB_SHAKE_MORE_CONST_03_0016
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 960 equals 144.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst030016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst030016 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_TOP_RATIO * 960), String(144.0));
      expect(Constants.OVERFLOW_TOP_RATIO * 960).assertEqual(144.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_HEIGHT_RATIO * 960), String(1248.0));
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 960).assertEqual(1248.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_DURATION), String(3500));
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst030016 end');
    })
  })
}
