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

export default function shakeLiveFormMoreConst01Test() {
  describe('ShakeLiveFormMoreConst01Test', () => {

    /**
     * @tc.name   com.example.shakeliveformdemo_MoreConst01_0001
     * @tc.number SUB_SHAKE_MORE_CONST_01_0001
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 20 equals 3.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.example.shakeliveformdemo_MoreConst01_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst01_0001 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_TOP_RATIO * 20), String(3.0));
      expect(Constants.OVERFLOW_TOP_RATIO * 20).assertEqual(3.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_HEIGHT_RATIO * 20), String(26.0));
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 20).assertEqual(26.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_DURATION), String(3500));
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst01_0001 end');
    })

    /**
     * @tc.name   com.example.shakeliveformdemo_MoreConst01_0002
     * @tc.number SUB_SHAKE_MORE_CONST_01_0002
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 40 equals 6.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.example.shakeliveformdemo_MoreConst01_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst01_0002 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_TOP_RATIO * 40), String(6.0));
      expect(Constants.OVERFLOW_TOP_RATIO * 40).assertEqual(6.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_HEIGHT_RATIO * 40), String(52.0));
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 40).assertEqual(52.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_DURATION), String(3500));
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst01_0002 end');
    })

    /**
     * @tc.name   com.example.shakeliveformdemo_MoreConst01_0003
     * @tc.number SUB_SHAKE_MORE_CONST_01_0003
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 60 equals 9.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.example.shakeliveformdemo_MoreConst01_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst01_0003 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_TOP_RATIO * 60), String(9.0));
      expect(Constants.OVERFLOW_TOP_RATIO * 60).assertEqual(9.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_HEIGHT_RATIO * 60), String(78.0));
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 60).assertEqual(78.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_DURATION), String(3500));
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst01_0003 end');
    })

    /**
     * @tc.name   com.example.shakeliveformdemo_MoreConst01_0004
     * @tc.number SUB_SHAKE_MORE_CONST_01_0004
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 80 equals 12.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.example.shakeliveformdemo_MoreConst01_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst01_0004 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_TOP_RATIO * 80), String(12.0));
      expect(Constants.OVERFLOW_TOP_RATIO * 80).assertEqual(12.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_HEIGHT_RATIO * 80), String(104.0));
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 80).assertEqual(104.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_DURATION), String(3500));
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst01_0004 end');
    })

    /**
     * @tc.name   com.example.shakeliveformdemo_MoreConst01_0005
     * @tc.number SUB_SHAKE_MORE_CONST_01_0005
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 100 equals 15.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.example.shakeliveformdemo_MoreConst01_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst01_0005 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_TOP_RATIO * 100), String(15.0));
      expect(Constants.OVERFLOW_TOP_RATIO * 100).assertEqual(15.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_HEIGHT_RATIO * 100), String(130.0));
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 100).assertEqual(130.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_DURATION), String(3500));
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst01_0005 end');
    })

    /**
     * @tc.name   com.example.shakeliveformdemo_MoreConst01_0006
     * @tc.number SUB_SHAKE_MORE_CONST_01_0006
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 120 equals 18.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.example.shakeliveformdemo_MoreConst01_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst01_0006 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_TOP_RATIO * 120), String(18.0));
      expect(Constants.OVERFLOW_TOP_RATIO * 120).assertEqual(18.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_HEIGHT_RATIO * 120), String(156.0));
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 120).assertEqual(156.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_DURATION), String(3500));
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst01_0006 end');
    })

    /**
     * @tc.name   com.example.shakeliveformdemo_MoreConst01_0007
     * @tc.number SUB_SHAKE_MORE_CONST_01_0007
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 140 equals 21.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.example.shakeliveformdemo_MoreConst01_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst01_0007 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_TOP_RATIO * 140), String(21.0));
      expect(Constants.OVERFLOW_TOP_RATIO * 140).assertEqual(21.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_HEIGHT_RATIO * 140), String(182.0));
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 140).assertEqual(182.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_DURATION), String(3500));
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst01_0007 end');
    })

    /**
     * @tc.name   com.example.shakeliveformdemo_MoreConst01_0008
     * @tc.number SUB_SHAKE_MORE_CONST_01_0008
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 160 equals 24.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.example.shakeliveformdemo_MoreConst01_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst01_0008 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_TOP_RATIO * 160), String(24.0));
      expect(Constants.OVERFLOW_TOP_RATIO * 160).assertEqual(24.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_HEIGHT_RATIO * 160), String(208.0));
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 160).assertEqual(208.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_DURATION), String(3500));
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst01_0008 end');
    })

    /**
     * @tc.name   com.example.shakeliveformdemo_MoreConst01_0009
     * @tc.number SUB_SHAKE_MORE_CONST_01_0009
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 180 equals 27.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.example.shakeliveformdemo_MoreConst01_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst01_0009 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_TOP_RATIO * 180), String(27.0));
      expect(Constants.OVERFLOW_TOP_RATIO * 180).assertEqual(27.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_HEIGHT_RATIO * 180), String(234.0));
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 180).assertEqual(234.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_DURATION), String(3500));
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst01_0009 end');
    })

    /**
     * @tc.name   com.example.shakeliveformdemo_MoreConst01_0010
     * @tc.number SUB_SHAKE_MORE_CONST_01_0010
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 200 equals 30.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.example.shakeliveformdemo_MoreConst01_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst01_0010 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_TOP_RATIO * 200), String(30.0));
      expect(Constants.OVERFLOW_TOP_RATIO * 200).assertEqual(30.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_HEIGHT_RATIO * 200), String(260.0));
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 200).assertEqual(260.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_DURATION), String(3500));
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst01_0010 end');
    })

    /**
     * @tc.name   com.example.shakeliveformdemo_MoreConst01_0011
     * @tc.number SUB_SHAKE_MORE_CONST_01_0011
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 220 equals 33.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.example.shakeliveformdemo_MoreConst01_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst01_0011 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_TOP_RATIO * 220), String(33.0));
      expect(Constants.OVERFLOW_TOP_RATIO * 220).assertEqual(33.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_HEIGHT_RATIO * 220), String(286.0));
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 220).assertEqual(286.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_DURATION), String(3500));
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst01_0011 end');
    })

    /**
     * @tc.name   com.example.shakeliveformdemo_MoreConst01_0012
     * @tc.number SUB_SHAKE_MORE_CONST_01_0012
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 240 equals 36.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.example.shakeliveformdemo_MoreConst01_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst01_0012 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_TOP_RATIO * 240), String(36.0));
      expect(Constants.OVERFLOW_TOP_RATIO * 240).assertEqual(36.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_HEIGHT_RATIO * 240), String(312.0));
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 240).assertEqual(312.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_DURATION), String(3500));
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst01_0012 end');
    })

    /**
     * @tc.name   com.example.shakeliveformdemo_MoreConst01_0013
     * @tc.number SUB_SHAKE_MORE_CONST_01_0013
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 260 equals 39.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.example.shakeliveformdemo_MoreConst01_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst01_0013 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_TOP_RATIO * 260), String(39.0));
      expect(Constants.OVERFLOW_TOP_RATIO * 260).assertEqual(39.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_HEIGHT_RATIO * 260), String(338.0));
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 260).assertEqual(338.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_DURATION), String(3500));
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst01_0013 end');
    })

    /**
     * @tc.name   com.example.shakeliveformdemo_MoreConst01_0014
     * @tc.number SUB_SHAKE_MORE_CONST_01_0014
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 280 equals 42.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.example.shakeliveformdemo_MoreConst01_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst01_0014 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_TOP_RATIO * 280), String(42.0));
      expect(Constants.OVERFLOW_TOP_RATIO * 280).assertEqual(42.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_HEIGHT_RATIO * 280), String(364.0));
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 280).assertEqual(364.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_DURATION), String(3500));
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst01_0014 end');
    })

    /**
     * @tc.name   com.example.shakeliveformdemo_MoreConst01_0015
     * @tc.number SUB_SHAKE_MORE_CONST_01_0015
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 300 equals 45.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.example.shakeliveformdemo_MoreConst01_0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst01_0015 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_TOP_RATIO * 300), String(45.0));
      expect(Constants.OVERFLOW_TOP_RATIO * 300).assertEqual(45.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_HEIGHT_RATIO * 300), String(390.0));
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 300).assertEqual(390.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_DURATION), String(3500));
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst01_0015 end');
    })

    /**
     * @tc.name   com.example.shakeliveformdemo_MoreConst01_0016
     * @tc.number SUB_SHAKE_MORE_CONST_01_0016
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 320 equals 48.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.example.shakeliveformdemo_MoreConst01_0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst01_0016 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_TOP_RATIO * 320), String(48.0));
      expect(Constants.OVERFLOW_TOP_RATIO * 320).assertEqual(48.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_HEIGHT_RATIO * 320), String(416.0));
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 320).assertEqual(416.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_DURATION), String(3500));
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst01_0016 end');
    })
  })
}
