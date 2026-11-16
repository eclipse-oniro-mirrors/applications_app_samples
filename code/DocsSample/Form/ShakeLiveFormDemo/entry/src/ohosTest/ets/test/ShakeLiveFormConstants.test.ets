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

export default function shakeLiveFormConstantsTest() {
  describe('ShakeLiveFormConstantsTest', () => {

    /**
     * @tc.name   testShakeConstants0001
     * @tc.number SUB_SHAKE_CONSTANTS_0001
     * @tc.desc   Verify Constants.OVERFLOW_LEFT_RATIO equals 0.1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeConstants0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeConstants0001 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_LEFT_RATIO).assertEqual(0.1);');
      expect(Constants.OVERFLOW_LEFT_RATIO).assertEqual(0.1);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_LEFT_RATIO > 0).assertTrue();');
        expect(Constants.OVERFLOW_LEFT_RATIO > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof Constants.OVERFLOW_LEFT_RATIO === \'number\').assertTrue();');
        expect(typeof Constants.OVERFLOW_LEFT_RATIO === 'number').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeConstants0001 end');
    })

    /**
     * @tc.name   testShakeConstants0002
     * @tc.number SUB_SHAKE_CONSTANTS_0002
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO equals 0.15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeConstants0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeConstants0002 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_TOP_RATIO).assertEqual(0.15);');
      expect(Constants.OVERFLOW_TOP_RATIO).assertEqual(0.15);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_TOP_RATIO > 0).assertTrue();');
        expect(Constants.OVERFLOW_TOP_RATIO > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof Constants.OVERFLOW_TOP_RATIO === \'number\').assertTrue();');
        expect(typeof Constants.OVERFLOW_TOP_RATIO === 'number').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeConstants0002 end');
    })

    /**
     * @tc.name   testShakeConstants0003
     * @tc.number SUB_SHAKE_CONSTANTS_0003
     * @tc.desc   Verify Constants.OVERFLOW_WIDTH_RATIO equals 1.2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeConstants0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeConstants0003 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_WIDTH_RATIO).assertEqual(1.2);');
      expect(Constants.OVERFLOW_WIDTH_RATIO).assertEqual(1.2);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_WIDTH_RATIO > 0).assertTrue();');
        expect(Constants.OVERFLOW_WIDTH_RATIO > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof Constants.OVERFLOW_WIDTH_RATIO === \'number\').assertTrue();');
        expect(typeof Constants.OVERFLOW_WIDTH_RATIO === 'number').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeConstants0003 end');
    })

    /**
     * @tc.name   testShakeConstants0004
     * @tc.number SUB_SHAKE_CONSTANTS_0004
     * @tc.desc   Verify Constants.OVERFLOW_HEIGHT_RATIO equals 1.3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeConstants0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeConstants0004 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_HEIGHT_RATIO).assertEqual(1.3);');
      expect(Constants.OVERFLOW_HEIGHT_RATIO).assertEqual(1.3);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_HEIGHT_RATIO > 0).assertTrue();');
        expect(Constants.OVERFLOW_HEIGHT_RATIO > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof Constants.OVERFLOW_HEIGHT_RATIO === \'number\').assertTrue();');
        expect(typeof Constants.OVERFLOW_HEIGHT_RATIO === 'number').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeConstants0004 end');
    })

    /**
     * @tc.name   testShakeConstants0005
     * @tc.number SUB_SHAKE_CONSTANTS_0005
     * @tc.desc   Verify Constants.OVERFLOW_DURATION equals 3500.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeConstants0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeConstants0005 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_DURATION).assertEqual(3500);');
      expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_DURATION > 0).assertTrue();');
        expect(Constants.OVERFLOW_DURATION > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof Constants.OVERFLOW_DURATION === \'number\').assertTrue();');
        expect(typeof Constants.OVERFLOW_DURATION === 'number').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeConstants0005 end');
    })

    /**
     * @tc.name   testShakeConstants0006
     * @tc.number SUB_SHAKE_CONSTANTS_0006
     * @tc.desc   Verify -Constants.OVERFLOW_LEFT_RATIO * 100 equals -10.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeConstants0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeConstants0006 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(-Constants.OVERFLOW_LEFT_RATIO * 100).assertEqual(-10.0);');
      expect(-Constants.OVERFLOW_LEFT_RATIO * 100).assertEqual(-10.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_WIDTH_RATIO * 100).assertEqual(120.0);');
        expect(Constants.OVERFLOW_WIDTH_RATIO * 100).assertEqual(120.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_HEIGHT_RATIO * 100).assertEqual(130.0);');
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 100).assertEqual(130.0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeConstants0006 end');
    })

    /**
     * @tc.name   testShakeConstants0007
     * @tc.number SUB_SHAKE_CONSTANTS_0007
     * @tc.desc   Verify -Constants.OVERFLOW_LEFT_RATIO * 150 equals -15.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeConstants0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeConstants0007 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(-Constants.OVERFLOW_LEFT_RATIO * 150).assertEqual(-15.0);');
      expect(-Constants.OVERFLOW_LEFT_RATIO * 150).assertEqual(-15.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_WIDTH_RATIO * 150).assertEqual(180.0);');
        expect(Constants.OVERFLOW_WIDTH_RATIO * 150).assertEqual(180.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_HEIGHT_RATIO * 150).assertEqual(195.0);');
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 150).assertEqual(195.0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeConstants0007 end');
    })

    /**
     * @tc.name   testShakeConstants0008
     * @tc.number SUB_SHAKE_CONSTANTS_0008
     * @tc.desc   Verify -Constants.OVERFLOW_LEFT_RATIO * 200 equals -20.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeConstants0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeConstants0008 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(-Constants.OVERFLOW_LEFT_RATIO * 200).assertEqual(-20.0);');
      expect(-Constants.OVERFLOW_LEFT_RATIO * 200).assertEqual(-20.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_WIDTH_RATIO * 200).assertEqual(240.0);');
        expect(Constants.OVERFLOW_WIDTH_RATIO * 200).assertEqual(240.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_HEIGHT_RATIO * 200).assertEqual(260.0);');
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 200).assertEqual(260.0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeConstants0008 end');
    })

    /**
     * @tc.name   testShakeConstants0009
     * @tc.number SUB_SHAKE_CONSTANTS_0009
     * @tc.desc   Verify -Constants.OVERFLOW_LEFT_RATIO * 250 equals -25.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeConstants0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeConstants0009 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(-Constants.OVERFLOW_LEFT_RATIO * 250).assertEqual(-25.0);');
      expect(-Constants.OVERFLOW_LEFT_RATIO * 250).assertEqual(-25.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_WIDTH_RATIO * 250).assertEqual(300.0);');
        expect(Constants.OVERFLOW_WIDTH_RATIO * 250).assertEqual(300.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_HEIGHT_RATIO * 250).assertEqual(325.0);');
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 250).assertEqual(325.0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeConstants0009 end');
    })

    /**
     * @tc.name   testShakeConstants0010
     * @tc.number SUB_SHAKE_CONSTANTS_0010
     * @tc.desc   Verify -Constants.OVERFLOW_LEFT_RATIO * 300 equals -30.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeConstants0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeConstants0010 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(-Constants.OVERFLOW_LEFT_RATIO * 300).assertEqual(-30.0);');
      expect(-Constants.OVERFLOW_LEFT_RATIO * 300).assertEqual(-30.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_WIDTH_RATIO * 300).assertEqual(360.0);');
        expect(Constants.OVERFLOW_WIDTH_RATIO * 300).assertEqual(360.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(Constants.OVERFLOW_HEIGHT_RATIO * 300).assertEqual(390.0);');
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 300).assertEqual(390.0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeConstants0010 end');
    })
  })
}
