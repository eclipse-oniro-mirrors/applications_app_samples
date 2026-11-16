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

export default function shakeLiveFormMoreConst06Test() {
  describe('ShakeLiveFormMoreConst06Test', () => {

    /**
     * @tc.name   com.example.shakeliveformdemo_MoreConst06_0001
     * @tc.number SUB_SHAKE_MORE_CONST_06_0001
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 1620 equals 243.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.example.shakeliveformdemo_MoreConst06_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst06_0001 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_TOP_RATIO * 1620), String(243.0));
      expect(Constants.OVERFLOW_TOP_RATIO * 1620).assertEqual(243.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_HEIGHT_RATIO * 1620), String(2106.0));
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 1620).assertEqual(2106.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_DURATION), String(3500));
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst06_0001 end');
    })

    /**
     * @tc.name   com.example.shakeliveformdemo_MoreConst06_0002
     * @tc.number SUB_SHAKE_MORE_CONST_06_0002
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 1640 equals 246.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.example.shakeliveformdemo_MoreConst06_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst06_0002 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_TOP_RATIO * 1640), String(246.0));
      expect(Constants.OVERFLOW_TOP_RATIO * 1640).assertEqual(246.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_HEIGHT_RATIO * 1640), String(2132.0));
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 1640).assertEqual(2132.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_DURATION), String(3500));
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst06_0002 end');
    })

    /**
     * @tc.name   com.example.shakeliveformdemo_MoreConst06_0003
     * @tc.number SUB_SHAKE_MORE_CONST_06_0003
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 1660 equals 249.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.example.shakeliveformdemo_MoreConst06_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst06_0003 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_TOP_RATIO * 1660), String(249.0));
      expect(Constants.OVERFLOW_TOP_RATIO * 1660).assertEqual(249.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_HEIGHT_RATIO * 1660), String(2158.0));
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 1660).assertEqual(2158.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_DURATION), String(3500));
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst06_0003 end');
    })

    /**
     * @tc.name   com.example.shakeliveformdemo_MoreConst06_0004
     * @tc.number SUB_SHAKE_MORE_CONST_06_0004
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 1680 equals 252.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.example.shakeliveformdemo_MoreConst06_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst06_0004 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_TOP_RATIO * 1680), String(252.0));
      expect(Constants.OVERFLOW_TOP_RATIO * 1680).assertEqual(252.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_HEIGHT_RATIO * 1680), String(2184.0));
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 1680).assertEqual(2184.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_DURATION), String(3500));
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst06_0004 end');
    })

    /**
     * @tc.name   com.example.shakeliveformdemo_MoreConst06_0005
     * @tc.number SUB_SHAKE_MORE_CONST_06_0005
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 1700 equals 255.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.example.shakeliveformdemo_MoreConst06_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst06_0005 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_TOP_RATIO * 1700), String(255.0));
      expect(Constants.OVERFLOW_TOP_RATIO * 1700).assertEqual(255.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_HEIGHT_RATIO * 1700), String(2210.0));
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 1700).assertEqual(2210.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_DURATION), String(3500));
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst06_0005 end');
    })

    /**
     * @tc.name   com.example.shakeliveformdemo_MoreConst06_0006
     * @tc.number SUB_SHAKE_MORE_CONST_06_0006
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 1720 equals 258.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.example.shakeliveformdemo_MoreConst06_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst06_0006 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_TOP_RATIO * 1720), String(258.0));
      expect(Constants.OVERFLOW_TOP_RATIO * 1720).assertEqual(258.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_HEIGHT_RATIO * 1720), String(2236.0));
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 1720).assertEqual(2236.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_DURATION), String(3500));
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst06_0006 end');
    })

    /**
     * @tc.name   com.example.shakeliveformdemo_MoreConst06_0007
     * @tc.number SUB_SHAKE_MORE_CONST_06_0007
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 1740 equals 261.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.example.shakeliveformdemo_MoreConst06_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst06_0007 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_TOP_RATIO * 1740), String(261.0));
      expect(Constants.OVERFLOW_TOP_RATIO * 1740).assertEqual(261.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_HEIGHT_RATIO * 1740), String(2262.0));
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 1740).assertEqual(2262.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_DURATION), String(3500));
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst06_0007 end');
    })

    /**
     * @tc.name   com.example.shakeliveformdemo_MoreConst06_0008
     * @tc.number SUB_SHAKE_MORE_CONST_06_0008
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 1760 equals 264.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.example.shakeliveformdemo_MoreConst06_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst06_0008 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_TOP_RATIO * 1760), String(264.0));
      expect(Constants.OVERFLOW_TOP_RATIO * 1760).assertEqual(264.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_HEIGHT_RATIO * 1760), String(2288.0));
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 1760).assertEqual(2288.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_DURATION), String(3500));
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst06_0008 end');
    })

    /**
     * @tc.name   com.example.shakeliveformdemo_MoreConst06_0009
     * @tc.number SUB_SHAKE_MORE_CONST_06_0009
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 1780 equals 267.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.example.shakeliveformdemo_MoreConst06_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst06_0009 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_TOP_RATIO * 1780), String(267.0));
      expect(Constants.OVERFLOW_TOP_RATIO * 1780).assertEqual(267.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_HEIGHT_RATIO * 1780), String(2314.0));
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 1780).assertEqual(2314.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_DURATION), String(3500));
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst06_0009 end');
    })

    /**
     * @tc.name   com.example.shakeliveformdemo_MoreConst06_0010
     * @tc.number SUB_SHAKE_MORE_CONST_06_0010
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 1800 equals 270.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.example.shakeliveformdemo_MoreConst06_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst06_0010 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_TOP_RATIO * 1800), String(270.0));
      expect(Constants.OVERFLOW_TOP_RATIO * 1800).assertEqual(270.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_HEIGHT_RATIO * 1800), String(2340.0));
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 1800).assertEqual(2340.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_DURATION), String(3500));
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst06_0010 end');
    })

    /**
     * @tc.name   com.example.shakeliveformdemo_MoreConst06_0011
     * @tc.number SUB_SHAKE_MORE_CONST_06_0011
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 1820 equals 273.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.example.shakeliveformdemo_MoreConst06_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst06_0011 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_TOP_RATIO * 1820), String(273.0));
      expect(Constants.OVERFLOW_TOP_RATIO * 1820).assertEqual(273.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_HEIGHT_RATIO * 1820), String(2366.0));
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 1820).assertEqual(2366.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_DURATION), String(3500));
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst06_0011 end');
    })

    /**
     * @tc.name   com.example.shakeliveformdemo_MoreConst06_0012
     * @tc.number SUB_SHAKE_MORE_CONST_06_0012
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 1840 equals 276.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.example.shakeliveformdemo_MoreConst06_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst06_0012 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_TOP_RATIO * 1840), String(276.0));
      expect(Constants.OVERFLOW_TOP_RATIO * 1840).assertEqual(276.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_HEIGHT_RATIO * 1840), String(2392.0));
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 1840).assertEqual(2392.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_DURATION), String(3500));
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst06_0012 end');
    })

    /**
     * @tc.name   com.example.shakeliveformdemo_MoreConst06_0013
     * @tc.number SUB_SHAKE_MORE_CONST_06_0013
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 1860 equals 279.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.example.shakeliveformdemo_MoreConst06_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst06_0013 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_TOP_RATIO * 1860), String(279.0));
      expect(Constants.OVERFLOW_TOP_RATIO * 1860).assertEqual(279.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_HEIGHT_RATIO * 1860), String(2418.0));
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 1860).assertEqual(2418.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_DURATION), String(3500));
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst06_0013 end');
    })

    /**
     * @tc.name   com.example.shakeliveformdemo_MoreConst06_0014
     * @tc.number SUB_SHAKE_MORE_CONST_06_0014
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 1880 equals 282.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.example.shakeliveformdemo_MoreConst06_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst06_0014 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_TOP_RATIO * 1880), String(282.0));
      expect(Constants.OVERFLOW_TOP_RATIO * 1880).assertEqual(282.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_HEIGHT_RATIO * 1880), String(2444.0));
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 1880).assertEqual(2444.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_DURATION), String(3500));
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst06_0014 end');
    })

    /**
     * @tc.name   com.example.shakeliveformdemo_MoreConst06_0015
     * @tc.number SUB_SHAKE_MORE_CONST_06_0015
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 1900 equals 285.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.example.shakeliveformdemo_MoreConst06_0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst06_0015 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_TOP_RATIO * 1900), String(285.0));
      expect(Constants.OVERFLOW_TOP_RATIO * 1900).assertEqual(285.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_HEIGHT_RATIO * 1900), String(2470.0));
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 1900).assertEqual(2470.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_DURATION), String(3500));
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst06_0015 end');
    })

    /**
     * @tc.name   com.example.shakeliveformdemo_MoreConst06_0016
     * @tc.number SUB_SHAKE_MORE_CONST_06_0016
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 1920 equals 288.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.example.shakeliveformdemo_MoreConst06_0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst06_0016 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_TOP_RATIO * 1920), String(288.0));
      expect(Constants.OVERFLOW_TOP_RATIO * 1920).assertEqual(288.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_HEIGHT_RATIO * 1920), String(2496.0));
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 1920).assertEqual(2496.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_DURATION), String(3500));
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst06_0016 end');
    })
  })
}
