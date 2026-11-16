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

export default function shakeLiveFormMoreConst05Test() {
  describe('ShakeLiveFormMoreConst05Test', () => {

    /**
     * @tc.name   testShakeMoreConst050001
     * @tc.number SUB_SHAKE_MORE_CONST_05_0001
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 1300 equals 195.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst050001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst050001 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_TOP_RATIO * 1300).assertEqual(195.0);');
      expect(Constants.OVERFLOW_TOP_RATIO * 1300).assertEqual(195.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_HEIGHT_RATIO * 1300).assertEqual(1690.0);');
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 1300).assertEqual(1690.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_DURATION).assertEqual(3500);');
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst050001 end');
    })

    /**
     * @tc.name   testShakeMoreConst050002
     * @tc.number SUB_SHAKE_MORE_CONST_05_0002
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 1320 equals 198.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst050002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst050002 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_TOP_RATIO * 1320).assertEqual(198.0);');
      expect(Constants.OVERFLOW_TOP_RATIO * 1320).assertEqual(198.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_HEIGHT_RATIO * 1320).assertEqual(1716.0);');
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 1320).assertEqual(1716.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_DURATION).assertEqual(3500);');
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst050002 end');
    })

    /**
     * @tc.name   testShakeMoreConst050003
     * @tc.number SUB_SHAKE_MORE_CONST_05_0003
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 1340 equals 201.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst050003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst050003 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_TOP_RATIO * 1340).assertEqual(201.0);');
      expect(Constants.OVERFLOW_TOP_RATIO * 1340).assertEqual(201.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_HEIGHT_RATIO * 1340).assertEqual(1742.0);');
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 1340).assertEqual(1742.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_DURATION).assertEqual(3500);');
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst050003 end');
    })

    /**
     * @tc.name   testShakeMoreConst050004
     * @tc.number SUB_SHAKE_MORE_CONST_05_0004
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 1360 equals 204.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst050004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst050004 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_TOP_RATIO * 1360).assertEqual(204.0);');
      expect(Constants.OVERFLOW_TOP_RATIO * 1360).assertEqual(204.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_HEIGHT_RATIO * 1360).assertEqual(1768.0);');
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 1360).assertEqual(1768.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_DURATION).assertEqual(3500);');
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst050004 end');
    })

    /**
     * @tc.name   testShakeMoreConst050005
     * @tc.number SUB_SHAKE_MORE_CONST_05_0005
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 1380 equals 207.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst050005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst050005 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_TOP_RATIO * 1380).assertEqual(207.0);');
      expect(Constants.OVERFLOW_TOP_RATIO * 1380).assertEqual(207.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_HEIGHT_RATIO * 1380).assertEqual(1794.0);');
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 1380).assertEqual(1794.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_DURATION).assertEqual(3500);');
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst050005 end');
    })

    /**
     * @tc.name   testShakeMoreConst050006
     * @tc.number SUB_SHAKE_MORE_CONST_05_0006
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 1400 equals 210.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst050006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst050006 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_TOP_RATIO * 1400).assertEqual(210.0);');
      expect(Constants.OVERFLOW_TOP_RATIO * 1400).assertEqual(210.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_HEIGHT_RATIO * 1400).assertEqual(1820.0);');
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 1400).assertEqual(1820.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_DURATION).assertEqual(3500);');
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst050006 end');
    })

    /**
     * @tc.name   testShakeMoreConst050007
     * @tc.number SUB_SHAKE_MORE_CONST_05_0007
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 1420 equals 213.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst050007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst050007 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_TOP_RATIO * 1420).assertEqual(213.0);');
      expect(Constants.OVERFLOW_TOP_RATIO * 1420).assertEqual(213.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_HEIGHT_RATIO * 1420).assertEqual(1846.0);');
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 1420).assertEqual(1846.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_DURATION).assertEqual(3500);');
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst050007 end');
    })

    /**
     * @tc.name   testShakeMoreConst050008
     * @tc.number SUB_SHAKE_MORE_CONST_05_0008
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 1440 equals 216.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst050008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst050008 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_TOP_RATIO * 1440).assertEqual(216.0);');
      expect(Constants.OVERFLOW_TOP_RATIO * 1440).assertEqual(216.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_HEIGHT_RATIO * 1440).assertEqual(1872.0);');
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 1440).assertEqual(1872.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_DURATION).assertEqual(3500);');
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst050008 end');
    })

    /**
     * @tc.name   testShakeMoreConst050009
     * @tc.number SUB_SHAKE_MORE_CONST_05_0009
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 1460 equals 219.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst050009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst050009 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_TOP_RATIO * 1460).assertEqual(219.0);');
      expect(Constants.OVERFLOW_TOP_RATIO * 1460).assertEqual(219.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_HEIGHT_RATIO * 1460).assertEqual(1898.0);');
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 1460).assertEqual(1898.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_DURATION).assertEqual(3500);');
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst050009 end');
    })

    /**
     * @tc.name   testShakeMoreConst050010
     * @tc.number SUB_SHAKE_MORE_CONST_05_0010
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 1480 equals 222.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst050010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst050010 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_TOP_RATIO * 1480).assertEqual(222.0);');
      expect(Constants.OVERFLOW_TOP_RATIO * 1480).assertEqual(222.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_HEIGHT_RATIO * 1480).assertEqual(1924.0);');
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 1480).assertEqual(1924.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_DURATION).assertEqual(3500);');
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst050010 end');
    })

    /**
     * @tc.name   testShakeMoreConst050011
     * @tc.number SUB_SHAKE_MORE_CONST_05_0011
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 1500 equals 225.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst050011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst050011 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_TOP_RATIO * 1500).assertEqual(225.0);');
      expect(Constants.OVERFLOW_TOP_RATIO * 1500).assertEqual(225.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_HEIGHT_RATIO * 1500).assertEqual(1950.0);');
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 1500).assertEqual(1950.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_DURATION).assertEqual(3500);');
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst050011 end');
    })

    /**
     * @tc.name   testShakeMoreConst050012
     * @tc.number SUB_SHAKE_MORE_CONST_05_0012
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 1520 equals 228.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst050012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst050012 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_TOP_RATIO * 1520).assertEqual(228.0);');
      expect(Constants.OVERFLOW_TOP_RATIO * 1520).assertEqual(228.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_HEIGHT_RATIO * 1520).assertEqual(1976.0);');
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 1520).assertEqual(1976.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_DURATION).assertEqual(3500);');
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst050012 end');
    })

    /**
     * @tc.name   testShakeMoreConst050013
     * @tc.number SUB_SHAKE_MORE_CONST_05_0013
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 1540 equals 231.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst050013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst050013 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_TOP_RATIO * 1540).assertEqual(231.0);');
      expect(Constants.OVERFLOW_TOP_RATIO * 1540).assertEqual(231.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_HEIGHT_RATIO * 1540).assertEqual(2002.0);');
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 1540).assertEqual(2002.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_DURATION).assertEqual(3500);');
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst050013 end');
    })

    /**
     * @tc.name   testShakeMoreConst050014
     * @tc.number SUB_SHAKE_MORE_CONST_05_0014
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 1560 equals 234.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst050014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst050014 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_TOP_RATIO * 1560).assertEqual(234.0);');
      expect(Constants.OVERFLOW_TOP_RATIO * 1560).assertEqual(234.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_HEIGHT_RATIO * 1560).assertEqual(2028.0);');
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 1560).assertEqual(2028.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_DURATION).assertEqual(3500);');
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst050014 end');
    })

    /**
     * @tc.name   testShakeMoreConst050015
     * @tc.number SUB_SHAKE_MORE_CONST_05_0015
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 1580 equals 237.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst050015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst050015 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_TOP_RATIO * 1580).assertEqual(237.0);');
      expect(Constants.OVERFLOW_TOP_RATIO * 1580).assertEqual(237.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_HEIGHT_RATIO * 1580).assertEqual(2054.0);');
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 1580).assertEqual(2054.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_DURATION).assertEqual(3500);');
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst050015 end');
    })

    /**
     * @tc.name   testShakeMoreConst050016
     * @tc.number SUB_SHAKE_MORE_CONST_05_0016
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 1600 equals 240.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst050016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst050016 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_TOP_RATIO * 1600).assertEqual(240.0);');
      expect(Constants.OVERFLOW_TOP_RATIO * 1600).assertEqual(240.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_HEIGHT_RATIO * 1600).assertEqual(2080.0);');
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 1600).assertEqual(2080.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_DURATION).assertEqual(3500);');
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst050016 end');
    })
  })
}
