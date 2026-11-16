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

export default function shakeLiveFormMoreConst02Test() {
  describe('ShakeLiveFormMoreConst02Test', () => {

    /**
     * @tc.name   testShakeMoreConst020001
     * @tc.number SUB_SHAKE_MORE_CONST_02_0001
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 340 equals 51.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst020001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst020001 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_TOP_RATIO * 340).assertEqual(51.0);');
      expect(Constants.OVERFLOW_TOP_RATIO * 340).assertEqual(51.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_HEIGHT_RATIO * 340).assertEqual(442.0);');
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 340).assertEqual(442.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_DURATION).assertEqual(3500);');
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst020001 end');
    })

    /**
     * @tc.name   testShakeMoreConst020002
     * @tc.number SUB_SHAKE_MORE_CONST_02_0002
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 360 equals 54.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst020002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst020002 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_TOP_RATIO * 360).assertEqual(54.0);');
      expect(Constants.OVERFLOW_TOP_RATIO * 360).assertEqual(54.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_HEIGHT_RATIO * 360).assertEqual(468.0);');
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 360).assertEqual(468.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_DURATION).assertEqual(3500);');
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst020002 end');
    })

    /**
     * @tc.name   testShakeMoreConst020003
     * @tc.number SUB_SHAKE_MORE_CONST_02_0003
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 380 equals 57.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst020003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst020003 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_TOP_RATIO * 380).assertEqual(57.0);');
      expect(Constants.OVERFLOW_TOP_RATIO * 380).assertEqual(57.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_HEIGHT_RATIO * 380).assertEqual(494.0);');
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 380).assertEqual(494.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_DURATION).assertEqual(3500);');
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst020003 end');
    })

    /**
     * @tc.name   testShakeMoreConst020004
     * @tc.number SUB_SHAKE_MORE_CONST_02_0004
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 400 equals 60.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst020004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst020004 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_TOP_RATIO * 400).assertEqual(60.0);');
      expect(Constants.OVERFLOW_TOP_RATIO * 400).assertEqual(60.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_HEIGHT_RATIO * 400).assertEqual(520.0);');
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 400).assertEqual(520.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_DURATION).assertEqual(3500);');
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst020004 end');
    })

    /**
     * @tc.name   testShakeMoreConst020005
     * @tc.number SUB_SHAKE_MORE_CONST_02_0005
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 420 equals 63.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst020005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst020005 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_TOP_RATIO * 420).assertEqual(63.0);');
      expect(Constants.OVERFLOW_TOP_RATIO * 420).assertEqual(63.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_HEIGHT_RATIO * 420).assertEqual(546.0);');
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 420).assertEqual(546.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_DURATION).assertEqual(3500);');
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst020005 end');
    })

    /**
     * @tc.name   testShakeMoreConst020006
     * @tc.number SUB_SHAKE_MORE_CONST_02_0006
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 440 equals 66.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst020006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst020006 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_TOP_RATIO * 440).assertEqual(66.0);');
      expect(Constants.OVERFLOW_TOP_RATIO * 440).assertEqual(66.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_HEIGHT_RATIO * 440).assertEqual(572.0);');
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 440).assertEqual(572.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_DURATION).assertEqual(3500);');
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst020006 end');
    })

    /**
     * @tc.name   testShakeMoreConst020007
     * @tc.number SUB_SHAKE_MORE_CONST_02_0007
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 460 equals 69.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst020007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst020007 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_TOP_RATIO * 460).assertEqual(69.0);');
      expect(Constants.OVERFLOW_TOP_RATIO * 460).assertEqual(69.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_HEIGHT_RATIO * 460).assertEqual(598.0);');
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 460).assertEqual(598.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_DURATION).assertEqual(3500);');
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst020007 end');
    })

    /**
     * @tc.name   testShakeMoreConst020008
     * @tc.number SUB_SHAKE_MORE_CONST_02_0008
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 480 equals 72.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst020008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst020008 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_TOP_RATIO * 480).assertEqual(72.0);');
      expect(Constants.OVERFLOW_TOP_RATIO * 480).assertEqual(72.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_HEIGHT_RATIO * 480).assertEqual(624.0);');
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 480).assertEqual(624.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_DURATION).assertEqual(3500);');
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst020008 end');
    })

    /**
     * @tc.name   testShakeMoreConst020009
     * @tc.number SUB_SHAKE_MORE_CONST_02_0009
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 500 equals 75.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst020009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst020009 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_TOP_RATIO * 500).assertEqual(75.0);');
      expect(Constants.OVERFLOW_TOP_RATIO * 500).assertEqual(75.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_HEIGHT_RATIO * 500).assertEqual(650.0);');
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 500).assertEqual(650.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_DURATION).assertEqual(3500);');
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst020009 end');
    })

    /**
     * @tc.name   testShakeMoreConst020010
     * @tc.number SUB_SHAKE_MORE_CONST_02_0010
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 520 equals 78.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst020010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst020010 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_TOP_RATIO * 520).assertEqual(78.0);');
      expect(Constants.OVERFLOW_TOP_RATIO * 520).assertEqual(78.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_HEIGHT_RATIO * 520).assertEqual(676.0);');
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 520).assertEqual(676.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_DURATION).assertEqual(3500);');
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst020010 end');
    })

    /**
     * @tc.name   testShakeMoreConst020011
     * @tc.number SUB_SHAKE_MORE_CONST_02_0011
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 540 equals 81.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst020011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst020011 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_TOP_RATIO * 540).assertEqual(81.0);');
      expect(Constants.OVERFLOW_TOP_RATIO * 540).assertEqual(81.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_HEIGHT_RATIO * 540).assertEqual(702.0);');
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 540).assertEqual(702.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_DURATION).assertEqual(3500);');
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst020011 end');
    })

    /**
     * @tc.name   testShakeMoreConst020012
     * @tc.number SUB_SHAKE_MORE_CONST_02_0012
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 560 equals 84.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst020012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst020012 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_TOP_RATIO * 560).assertEqual(84.0);');
      expect(Constants.OVERFLOW_TOP_RATIO * 560).assertEqual(84.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_HEIGHT_RATIO * 560).assertEqual(728.0);');
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 560).assertEqual(728.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_DURATION).assertEqual(3500);');
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst020012 end');
    })

    /**
     * @tc.name   testShakeMoreConst020013
     * @tc.number SUB_SHAKE_MORE_CONST_02_0013
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 580 equals 87.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst020013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst020013 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_TOP_RATIO * 580).assertEqual(87.0);');
      expect(Constants.OVERFLOW_TOP_RATIO * 580).assertEqual(87.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_HEIGHT_RATIO * 580).assertEqual(754.0);');
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 580).assertEqual(754.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_DURATION).assertEqual(3500);');
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst020013 end');
    })

    /**
     * @tc.name   testShakeMoreConst020014
     * @tc.number SUB_SHAKE_MORE_CONST_02_0014
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 600 equals 90.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst020014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst020014 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_TOP_RATIO * 600).assertEqual(90.0);');
      expect(Constants.OVERFLOW_TOP_RATIO * 600).assertEqual(90.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_HEIGHT_RATIO * 600).assertEqual(780.0);');
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 600).assertEqual(780.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_DURATION).assertEqual(3500);');
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst020014 end');
    })

    /**
     * @tc.name   testShakeMoreConst020015
     * @tc.number SUB_SHAKE_MORE_CONST_02_0015
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 620 equals 93.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst020015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst020015 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_TOP_RATIO * 620).assertEqual(93.0);');
      expect(Constants.OVERFLOW_TOP_RATIO * 620).assertEqual(93.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_HEIGHT_RATIO * 620).assertEqual(806.0);');
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 620).assertEqual(806.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_DURATION).assertEqual(3500);');
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst020015 end');
    })

    /**
     * @tc.name   testShakeMoreConst020016
     * @tc.number SUB_SHAKE_MORE_CONST_02_0016
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 640 equals 96.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst020016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst020016 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_TOP_RATIO * 640).assertEqual(96.0);');
      expect(Constants.OVERFLOW_TOP_RATIO * 640).assertEqual(96.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_HEIGHT_RATIO * 640).assertEqual(832.0);');
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 640).assertEqual(832.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_DURATION).assertEqual(3500);');
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreConst020016 end');
    })
  })
}
