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
     * @tc.name   com.example.shakeliveformdemo_Constants_0001
     * @tc.number SUB_SHAKE_CONSTANTS_0001
     * @tc.desc   Verify Constants.OVERFLOW_LEFT_RATIO equals 0.1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.example.shakeliveformdemo_Constants_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_Constants_0001 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_LEFT_RATIO), String(0.1));
      expect(Constants.OVERFLOW_LEFT_RATIO).assertEqual(0.1);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Constants.OVERFLOW_LEFT_RATIO > 0));
        expect(Constants.OVERFLOW_LEFT_RATIO > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof Constants.OVERFLOW_LEFT_RATIO === 'number'));
        expect(typeof Constants.OVERFLOW_LEFT_RATIO === 'number').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_Constants_0001 end');
    })

    /**
     * @tc.name   com.example.shakeliveformdemo_Constants_0002
     * @tc.number SUB_SHAKE_CONSTANTS_0002
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO equals 0.15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.example.shakeliveformdemo_Constants_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_Constants_0002 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_TOP_RATIO), String(0.15));
      expect(Constants.OVERFLOW_TOP_RATIO).assertEqual(0.15);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Constants.OVERFLOW_TOP_RATIO > 0));
        expect(Constants.OVERFLOW_TOP_RATIO > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof Constants.OVERFLOW_TOP_RATIO === 'number'));
        expect(typeof Constants.OVERFLOW_TOP_RATIO === 'number').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_Constants_0002 end');
    })

    /**
     * @tc.name   com.example.shakeliveformdemo_Constants_0003
     * @tc.number SUB_SHAKE_CONSTANTS_0003
     * @tc.desc   Verify Constants.OVERFLOW_WIDTH_RATIO equals 1.2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.example.shakeliveformdemo_Constants_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_Constants_0003 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_WIDTH_RATIO), String(1.2));
      expect(Constants.OVERFLOW_WIDTH_RATIO).assertEqual(1.2);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Constants.OVERFLOW_WIDTH_RATIO > 0));
        expect(Constants.OVERFLOW_WIDTH_RATIO > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof Constants.OVERFLOW_WIDTH_RATIO === 'number'));
        expect(typeof Constants.OVERFLOW_WIDTH_RATIO === 'number').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_Constants_0003 end');
    })

    /**
     * @tc.name   com.example.shakeliveformdemo_Constants_0004
     * @tc.number SUB_SHAKE_CONSTANTS_0004
     * @tc.desc   Verify Constants.OVERFLOW_HEIGHT_RATIO equals 1.3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.example.shakeliveformdemo_Constants_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_Constants_0004 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_HEIGHT_RATIO), String(1.3));
      expect(Constants.OVERFLOW_HEIGHT_RATIO).assertEqual(1.3);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Constants.OVERFLOW_HEIGHT_RATIO > 0));
        expect(Constants.OVERFLOW_HEIGHT_RATIO > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof Constants.OVERFLOW_HEIGHT_RATIO === 'number'));
        expect(typeof Constants.OVERFLOW_HEIGHT_RATIO === 'number').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_Constants_0004 end');
    })

    /**
     * @tc.name   com.example.shakeliveformdemo_Constants_0005
     * @tc.number SUB_SHAKE_CONSTANTS_0005
     * @tc.desc   Verify Constants.OVERFLOW_DURATION equals 3500.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.example.shakeliveformdemo_Constants_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_Constants_0005 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_DURATION), String(3500));
      expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Constants.OVERFLOW_DURATION > 0));
        expect(Constants.OVERFLOW_DURATION > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof Constants.OVERFLOW_DURATION === 'number'));
        expect(typeof Constants.OVERFLOW_DURATION === 'number').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_Constants_0005 end');
    })

    /**
     * @tc.name   com.example.shakeliveformdemo_Constants_0006
     * @tc.number SUB_SHAKE_CONSTANTS_0006
     * @tc.desc   Verify -Constants.OVERFLOW_LEFT_RATIO * 100 equals -10.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.example.shakeliveformdemo_Constants_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_Constants_0006 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(-Constants.OVERFLOW_LEFT_RATIO * 100), String(-10.0));
      expect(-Constants.OVERFLOW_LEFT_RATIO * 100).assertEqual(-10.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_WIDTH_RATIO * 100), String(120.0));
        expect(Constants.OVERFLOW_WIDTH_RATIO * 100).assertEqual(120.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_HEIGHT_RATIO * 100), String(130.0));
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 100).assertEqual(130.0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_Constants_0006 end');
    })

    /**
     * @tc.name   com.example.shakeliveformdemo_Constants_0007
     * @tc.number SUB_SHAKE_CONSTANTS_0007
     * @tc.desc   Verify -Constants.OVERFLOW_LEFT_RATIO * 150 equals -15.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.example.shakeliveformdemo_Constants_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_Constants_0007 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(-Constants.OVERFLOW_LEFT_RATIO * 150), String(-15.0));
      expect(-Constants.OVERFLOW_LEFT_RATIO * 150).assertEqual(-15.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_WIDTH_RATIO * 150), String(180.0));
        expect(Constants.OVERFLOW_WIDTH_RATIO * 150).assertEqual(180.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_HEIGHT_RATIO * 150), String(195.0));
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 150).assertEqual(195.0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_Constants_0007 end');
    })

    /**
     * @tc.name   com.example.shakeliveformdemo_Constants_0008
     * @tc.number SUB_SHAKE_CONSTANTS_0008
     * @tc.desc   Verify -Constants.OVERFLOW_LEFT_RATIO * 200 equals -20.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.example.shakeliveformdemo_Constants_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_Constants_0008 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(-Constants.OVERFLOW_LEFT_RATIO * 200), String(-20.0));
      expect(-Constants.OVERFLOW_LEFT_RATIO * 200).assertEqual(-20.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_WIDTH_RATIO * 200), String(240.0));
        expect(Constants.OVERFLOW_WIDTH_RATIO * 200).assertEqual(240.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_HEIGHT_RATIO * 200), String(260.0));
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 200).assertEqual(260.0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_Constants_0008 end');
    })

    /**
     * @tc.name   com.example.shakeliveformdemo_Constants_0009
     * @tc.number SUB_SHAKE_CONSTANTS_0009
     * @tc.desc   Verify -Constants.OVERFLOW_LEFT_RATIO * 250 equals -25.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.example.shakeliveformdemo_Constants_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_Constants_0009 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(-Constants.OVERFLOW_LEFT_RATIO * 250), String(-25.0));
      expect(-Constants.OVERFLOW_LEFT_RATIO * 250).assertEqual(-25.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_WIDTH_RATIO * 250), String(300.0));
        expect(Constants.OVERFLOW_WIDTH_RATIO * 250).assertEqual(300.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_HEIGHT_RATIO * 250), String(325.0));
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 250).assertEqual(325.0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_Constants_0009 end');
    })

    /**
     * @tc.name   com.example.shakeliveformdemo_Constants_0010
     * @tc.number SUB_SHAKE_CONSTANTS_0010
     * @tc.desc   Verify -Constants.OVERFLOW_LEFT_RATIO * 300 equals -30.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.example.shakeliveformdemo_Constants_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_Constants_0010 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(-Constants.OVERFLOW_LEFT_RATIO * 300), String(-30.0));
      expect(-Constants.OVERFLOW_LEFT_RATIO * 300).assertEqual(-30.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_WIDTH_RATIO * 300), String(360.0));
        expect(Constants.OVERFLOW_WIDTH_RATIO * 300).assertEqual(360.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_HEIGHT_RATIO * 300), String(390.0));
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 300).assertEqual(390.0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_Constants_0010 end');
    })
  })
}
