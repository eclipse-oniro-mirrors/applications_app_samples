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
import { WifiModel } from '../../../../src/main/ets/model/WifiModel';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function wlanVolume2Resolve06Test() {
  describe('WlanVolume2Resolve06Test', () => {

    /**
     * @tc.name   testWlanVol2060001
     * @tc.number SUB_WLAN_VOL2_06_0001
     * @tc.desc   Verify model.resolveIP(1600080000) equals \'16:00:080:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2060001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol2060001 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600080000)), String('16:00:080:000'));
      expect(model.resolveIP(1600080000)).assertEqual('16:00:080:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600080000).split(':').length), String(4));
      expect(model.resolveIP(1600080000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600080000).length), String(13));
      expect(model.resolveIP(1600080000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol2060001 end');
    })

    /**
     * @tc.name   testWlanVol2060002
     * @tc.number SUB_WLAN_VOL2_06_0002
     * @tc.desc   Verify result.startsWith(\'16\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2060002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol2060002 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600081000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('16')));
      expect(result.startsWith('16')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('000')));
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':')[2]), String('081'));
      expect(result.split(':')[2]).assertEqual('081');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol2060002 end');
    })

    /**
     * @tc.name   testWlanVol2060003
     * @tc.number SUB_WLAN_VOL2_06_0003
     * @tc.desc   Verify model.resolveIP(1600082000) equals \'16:00:082:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2060003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol2060003 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600082000)), String('16:00:082:000'));
      expect(model.resolveIP(1600082000)).assertEqual('16:00:082:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600082000).split(':').length), String(4));
      expect(model.resolveIP(1600082000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600082000).length), String(13));
      expect(model.resolveIP(1600082000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol2060003 end');
    })

    /**
     * @tc.name   testWlanVol2060004
     * @tc.number SUB_WLAN_VOL2_06_0004
     * @tc.desc   Verify result.startsWith(\'16\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2060004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol2060004 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600083000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('16')));
      expect(result.startsWith('16')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('000')));
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':')[2]), String('083'));
      expect(result.split(':')[2]).assertEqual('083');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol2060004 end');
    })

    /**
     * @tc.name   testWlanVol2060005
     * @tc.number SUB_WLAN_VOL2_06_0005
     * @tc.desc   Verify model.resolveIP(1600084000) equals \'16:00:084:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2060005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol2060005 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600084000)), String('16:00:084:000'));
      expect(model.resolveIP(1600084000)).assertEqual('16:00:084:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600084000).split(':').length), String(4));
      expect(model.resolveIP(1600084000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600084000).length), String(13));
      expect(model.resolveIP(1600084000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol2060005 end');
    })

    /**
     * @tc.name   testWlanVol2060006
     * @tc.number SUB_WLAN_VOL2_06_0006
     * @tc.desc   Verify result.startsWith(\'16\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2060006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol2060006 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600085000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('16')));
      expect(result.startsWith('16')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('000')));
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':')[2]), String('085'));
      expect(result.split(':')[2]).assertEqual('085');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol2060006 end');
    })

    /**
     * @tc.name   testWlanVol2060007
     * @tc.number SUB_WLAN_VOL2_06_0007
     * @tc.desc   Verify model.resolveIP(1600086000) equals \'16:00:086:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2060007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol2060007 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600086000)), String('16:00:086:000'));
      expect(model.resolveIP(1600086000)).assertEqual('16:00:086:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600086000).split(':').length), String(4));
      expect(model.resolveIP(1600086000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600086000).length), String(13));
      expect(model.resolveIP(1600086000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol2060007 end');
    })

    /**
     * @tc.name   testWlanVol2060008
     * @tc.number SUB_WLAN_VOL2_06_0008
     * @tc.desc   Verify result.startsWith(\'16\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2060008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol2060008 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600087000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('16')));
      expect(result.startsWith('16')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('000')));
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':')[2]), String('087'));
      expect(result.split(':')[2]).assertEqual('087');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol2060008 end');
    })

    /**
     * @tc.name   testWlanVol2060009
     * @tc.number SUB_WLAN_VOL2_06_0009
     * @tc.desc   Verify model.resolveIP(1600088000) equals \'16:00:088:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2060009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol2060009 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600088000)), String('16:00:088:000'));
      expect(model.resolveIP(1600088000)).assertEqual('16:00:088:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600088000).split(':').length), String(4));
      expect(model.resolveIP(1600088000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600088000).length), String(13));
      expect(model.resolveIP(1600088000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol2060009 end');
    })

    /**
     * @tc.name   testWlanVol2060010
     * @tc.number SUB_WLAN_VOL2_06_0010
     * @tc.desc   Verify result.startsWith(\'16\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2060010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol2060010 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600089000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('16')));
      expect(result.startsWith('16')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('000')));
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':')[2]), String('089'));
      expect(result.split(':')[2]).assertEqual('089');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol2060010 end');
    })

    /**
     * @tc.name   testWlanVol2060011
     * @tc.number SUB_WLAN_VOL2_06_0011
     * @tc.desc   Verify model.resolveIP(1600090000) equals \'16:00:090:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2060011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol2060011 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600090000)), String('16:00:090:000'));
      expect(model.resolveIP(1600090000)).assertEqual('16:00:090:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600090000).split(':').length), String(4));
      expect(model.resolveIP(1600090000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600090000).length), String(13));
      expect(model.resolveIP(1600090000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol2060011 end');
    })

    /**
     * @tc.name   testWlanVol2060012
     * @tc.number SUB_WLAN_VOL2_06_0012
     * @tc.desc   Verify result.startsWith(\'16\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2060012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol2060012 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600091000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('16')));
      expect(result.startsWith('16')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('000')));
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':')[2]), String('091'));
      expect(result.split(':')[2]).assertEqual('091');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol2060012 end');
    })

    /**
     * @tc.name   testWlanVol2060013
     * @tc.number SUB_WLAN_VOL2_06_0013
     * @tc.desc   Verify model.resolveIP(1600092000) equals \'16:00:092:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2060013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol2060013 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600092000)), String('16:00:092:000'));
      expect(model.resolveIP(1600092000)).assertEqual('16:00:092:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600092000).split(':').length), String(4));
      expect(model.resolveIP(1600092000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600092000).length), String(13));
      expect(model.resolveIP(1600092000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol2060013 end');
    })

    /**
     * @tc.name   testWlanVol2060014
     * @tc.number SUB_WLAN_VOL2_06_0014
     * @tc.desc   Verify result.startsWith(\'16\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2060014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol2060014 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600093000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('16')));
      expect(result.startsWith('16')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('000')));
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':')[2]), String('093'));
      expect(result.split(':')[2]).assertEqual('093');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol2060014 end');
    })

    /**
     * @tc.name   testWlanVol2060015
     * @tc.number SUB_WLAN_VOL2_06_0015
     * @tc.desc   Verify model.resolveIP(1600094000) equals \'16:00:094:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2060015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol2060015 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600094000)), String('16:00:094:000'));
      expect(model.resolveIP(1600094000)).assertEqual('16:00:094:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600094000).split(':').length), String(4));
      expect(model.resolveIP(1600094000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1600094000).length), String(13));
      expect(model.resolveIP(1600094000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol2060015 end');
    })

    /**
     * @tc.name   testWlanVol2060016
     * @tc.number SUB_WLAN_VOL2_06_0016
     * @tc.desc   Verify result.startsWith(\'16\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2060016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol2060016 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600095000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('16')));
      expect(result.startsWith('16')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('000')));
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':')[2]), String('095'));
      expect(result.split(':')[2]).assertEqual('095');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol2060016 end');
    })
  })
}
