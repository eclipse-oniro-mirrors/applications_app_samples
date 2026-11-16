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

export default function shakeLiveFormMoreConst04Test() {
  describe('ShakeLiveFormMoreConst04Test', () => {

    /**
     * @tc.name   com.example.shakeliveformdemo_MoreConst04_0001
     * @tc.number SUB_SHAKE_MORE_CONST_04_0001
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 980 equals 147.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.example.shakeliveformdemo_MoreConst04_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst04_0001 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_TOP_RATIO * 980), String(147.0));
      expect(Constants.OVERFLOW_TOP_RATIO * 980).assertEqual(147.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_HEIGHT_RATIO * 980), String(1274.0));
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 980).assertEqual(1274.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_DURATION), String(3500));
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst04_0001 end');
    })

    /**
     * @tc.name   com.example.shakeliveformdemo_MoreConst04_0002
     * @tc.number SUB_SHAKE_MORE_CONST_04_0002
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 1000 equals 150.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.example.shakeliveformdemo_MoreConst04_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst04_0002 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_TOP_RATIO * 1000), String(150.0));
      expect(Constants.OVERFLOW_TOP_RATIO * 1000).assertEqual(150.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_HEIGHT_RATIO * 1000), String(1300.0));
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 1000).assertEqual(1300.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_DURATION), String(3500));
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst04_0002 end');
    })

    /**
     * @tc.name   com.example.shakeliveformdemo_MoreConst04_0003
     * @tc.number SUB_SHAKE_MORE_CONST_04_0003
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 1020 equals 153.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.example.shakeliveformdemo_MoreConst04_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst04_0003 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_TOP_RATIO * 1020), String(153.0));
      expect(Constants.OVERFLOW_TOP_RATIO * 1020).assertEqual(153.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_HEIGHT_RATIO * 1020), String(1326.0));
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 1020).assertEqual(1326.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_DURATION), String(3500));
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst04_0003 end');
    })

    /**
     * @tc.name   com.example.shakeliveformdemo_MoreConst04_0004
     * @tc.number SUB_SHAKE_MORE_CONST_04_0004
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 1040 equals 156.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.example.shakeliveformdemo_MoreConst04_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst04_0004 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_TOP_RATIO * 1040), String(156.0));
      expect(Constants.OVERFLOW_TOP_RATIO * 1040).assertEqual(156.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_HEIGHT_RATIO * 1040), String(1352.0));
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 1040).assertEqual(1352.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_DURATION), String(3500));
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst04_0004 end');
    })

    /**
     * @tc.name   com.example.shakeliveformdemo_MoreConst04_0005
     * @tc.number SUB_SHAKE_MORE_CONST_04_0005
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 1060 equals 159.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.example.shakeliveformdemo_MoreConst04_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst04_0005 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_TOP_RATIO * 1060), String(159.0));
      expect(Constants.OVERFLOW_TOP_RATIO * 1060).assertEqual(159.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_HEIGHT_RATIO * 1060), String(1378.0));
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 1060).assertEqual(1378.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_DURATION), String(3500));
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst04_0005 end');
    })

    /**
     * @tc.name   com.example.shakeliveformdemo_MoreConst04_0006
     * @tc.number SUB_SHAKE_MORE_CONST_04_0006
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 1080 equals 162.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.example.shakeliveformdemo_MoreConst04_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst04_0006 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_TOP_RATIO * 1080), String(162.0));
      expect(Constants.OVERFLOW_TOP_RATIO * 1080).assertEqual(162.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_HEIGHT_RATIO * 1080), String(1404.0));
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 1080).assertEqual(1404.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_DURATION), String(3500));
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst04_0006 end');
    })

    /**
     * @tc.name   com.example.shakeliveformdemo_MoreConst04_0007
     * @tc.number SUB_SHAKE_MORE_CONST_04_0007
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 1100 equals 165.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.example.shakeliveformdemo_MoreConst04_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst04_0007 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_TOP_RATIO * 1100), String(165.0));
      expect(Constants.OVERFLOW_TOP_RATIO * 1100).assertEqual(165.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_HEIGHT_RATIO * 1100), String(1430.0));
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 1100).assertEqual(1430.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_DURATION), String(3500));
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst04_0007 end');
    })

    /**
     * @tc.name   com.example.shakeliveformdemo_MoreConst04_0008
     * @tc.number SUB_SHAKE_MORE_CONST_04_0008
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 1120 equals 168.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.example.shakeliveformdemo_MoreConst04_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst04_0008 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_TOP_RATIO * 1120), String(168.0));
      expect(Constants.OVERFLOW_TOP_RATIO * 1120).assertEqual(168.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_HEIGHT_RATIO * 1120), String(1456.0));
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 1120).assertEqual(1456.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_DURATION), String(3500));
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst04_0008 end');
    })

    /**
     * @tc.name   com.example.shakeliveformdemo_MoreConst04_0009
     * @tc.number SUB_SHAKE_MORE_CONST_04_0009
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 1140 equals 171.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.example.shakeliveformdemo_MoreConst04_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst04_0009 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_TOP_RATIO * 1140), String(171.0));
      expect(Constants.OVERFLOW_TOP_RATIO * 1140).assertEqual(171.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_HEIGHT_RATIO * 1140), String(1482.0));
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 1140).assertEqual(1482.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_DURATION), String(3500));
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst04_0009 end');
    })

    /**
     * @tc.name   com.example.shakeliveformdemo_MoreConst04_0010
     * @tc.number SUB_SHAKE_MORE_CONST_04_0010
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 1160 equals 174.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.example.shakeliveformdemo_MoreConst04_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst04_0010 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_TOP_RATIO * 1160), String(174.0));
      expect(Constants.OVERFLOW_TOP_RATIO * 1160).assertEqual(174.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_HEIGHT_RATIO * 1160), String(1508.0));
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 1160).assertEqual(1508.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_DURATION), String(3500));
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst04_0010 end');
    })

    /**
     * @tc.name   com.example.shakeliveformdemo_MoreConst04_0011
     * @tc.number SUB_SHAKE_MORE_CONST_04_0011
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 1180 equals 177.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.example.shakeliveformdemo_MoreConst04_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst04_0011 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_TOP_RATIO * 1180), String(177.0));
      expect(Constants.OVERFLOW_TOP_RATIO * 1180).assertEqual(177.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_HEIGHT_RATIO * 1180), String(1534.0));
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 1180).assertEqual(1534.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_DURATION), String(3500));
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst04_0011 end');
    })

    /**
     * @tc.name   com.example.shakeliveformdemo_MoreConst04_0012
     * @tc.number SUB_SHAKE_MORE_CONST_04_0012
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 1200 equals 180.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.example.shakeliveformdemo_MoreConst04_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst04_0012 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_TOP_RATIO * 1200), String(180.0));
      expect(Constants.OVERFLOW_TOP_RATIO * 1200).assertEqual(180.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_HEIGHT_RATIO * 1200), String(1560.0));
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 1200).assertEqual(1560.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_DURATION), String(3500));
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst04_0012 end');
    })

    /**
     * @tc.name   com.example.shakeliveformdemo_MoreConst04_0013
     * @tc.number SUB_SHAKE_MORE_CONST_04_0013
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 1220 equals 183.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.example.shakeliveformdemo_MoreConst04_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst04_0013 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_TOP_RATIO * 1220), String(183.0));
      expect(Constants.OVERFLOW_TOP_RATIO * 1220).assertEqual(183.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_HEIGHT_RATIO * 1220), String(1586.0));
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 1220).assertEqual(1586.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_DURATION), String(3500));
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst04_0013 end');
    })

    /**
     * @tc.name   com.example.shakeliveformdemo_MoreConst04_0014
     * @tc.number SUB_SHAKE_MORE_CONST_04_0014
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 1240 equals 186.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.example.shakeliveformdemo_MoreConst04_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst04_0014 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_TOP_RATIO * 1240), String(186.0));
      expect(Constants.OVERFLOW_TOP_RATIO * 1240).assertEqual(186.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_HEIGHT_RATIO * 1240), String(1612.0));
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 1240).assertEqual(1612.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_DURATION), String(3500));
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst04_0014 end');
    })

    /**
     * @tc.name   com.example.shakeliveformdemo_MoreConst04_0015
     * @tc.number SUB_SHAKE_MORE_CONST_04_0015
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 1260 equals 189.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.example.shakeliveformdemo_MoreConst04_0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst04_0015 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_TOP_RATIO * 1260), String(189.0));
      expect(Constants.OVERFLOW_TOP_RATIO * 1260).assertEqual(189.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_HEIGHT_RATIO * 1260), String(1638.0));
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 1260).assertEqual(1638.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_DURATION), String(3500));
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst04_0015 end');
    })

    /**
     * @tc.name   com.example.shakeliveformdemo_MoreConst04_0016
     * @tc.number SUB_SHAKE_MORE_CONST_04_0016
     * @tc.desc   Verify Constants.OVERFLOW_TOP_RATIO * 1280 equals 192.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.example.shakeliveformdemo_MoreConst04_0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst04_0016 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_TOP_RATIO * 1280), String(192.0));
      expect(Constants.OVERFLOW_TOP_RATIO * 1280).assertEqual(192.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_HEIGHT_RATIO * 1280), String(1664.0));
        expect(Constants.OVERFLOW_HEIGHT_RATIO * 1280).assertEqual(1664.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_DURATION), String(3500));
        expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_MoreConst04_0016 end');
    })
  })
}
