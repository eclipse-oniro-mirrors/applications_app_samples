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
import { WifiModel } from '../../../../src/main/ets/model/WifiModel';

export default function wlanVolume2Resolve20Test() {
  describe('WlanVolume2Resolve20Test', () => {

    /**
     * @tc.name   testWlanVol2200001
     * @tc.number SUB_WLAN_VOL2_20_0001
     * @tc.desc   Resolve second volume value 20-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2200001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600304000)).assertEqual('16:00:304:000');
      expect(model.resolveIP(1600304000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600304000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2200002
     * @tc.number SUB_WLAN_VOL2_20_0002
     * @tc.desc   Resolve second volume value 20-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2200002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600305000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('305');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2200003
     * @tc.number SUB_WLAN_VOL2_20_0003
     * @tc.desc   Resolve second volume value 20-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2200003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600306000)).assertEqual('16:00:306:000');
      expect(model.resolveIP(1600306000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600306000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2200004
     * @tc.number SUB_WLAN_VOL2_20_0004
     * @tc.desc   Resolve second volume value 20-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2200004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600307000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('307');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2200005
     * @tc.number SUB_WLAN_VOL2_20_0005
     * @tc.desc   Resolve second volume value 20-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2200005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600308000)).assertEqual('16:00:308:000');
      expect(model.resolveIP(1600308000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600308000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2200006
     * @tc.number SUB_WLAN_VOL2_20_0006
     * @tc.desc   Resolve second volume value 20-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2200006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600309000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('309');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2200007
     * @tc.number SUB_WLAN_VOL2_20_0007
     * @tc.desc   Resolve second volume value 20-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2200007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600310000)).assertEqual('16:00:310:000');
      expect(model.resolveIP(1600310000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600310000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2200008
     * @tc.number SUB_WLAN_VOL2_20_0008
     * @tc.desc   Resolve second volume value 20-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2200008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600311000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('311');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2200009
     * @tc.number SUB_WLAN_VOL2_20_0009
     * @tc.desc   Resolve second volume value 20-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2200009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600312000)).assertEqual('16:00:312:000');
      expect(model.resolveIP(1600312000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600312000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2200010
     * @tc.number SUB_WLAN_VOL2_20_0010
     * @tc.desc   Resolve second volume value 20-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2200010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600313000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('313');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2200011
     * @tc.number SUB_WLAN_VOL2_20_0011
     * @tc.desc   Resolve second volume value 20-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2200011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600314000)).assertEqual('16:00:314:000');
      expect(model.resolveIP(1600314000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600314000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2200012
     * @tc.number SUB_WLAN_VOL2_20_0012
     * @tc.desc   Resolve second volume value 20-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2200012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600315000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('315');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2200013
     * @tc.number SUB_WLAN_VOL2_20_0013
     * @tc.desc   Resolve second volume value 20-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2200013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600316000)).assertEqual('16:00:316:000');
      expect(model.resolveIP(1600316000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600316000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2200014
     * @tc.number SUB_WLAN_VOL2_20_0014
     * @tc.desc   Resolve second volume value 20-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2200014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600317000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('317');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2200015
     * @tc.number SUB_WLAN_VOL2_20_0015
     * @tc.desc   Resolve second volume value 20-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2200015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600318000)).assertEqual('16:00:318:000');
      expect(model.resolveIP(1600318000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600318000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2200016
     * @tc.number SUB_WLAN_VOL2_20_0016
     * @tc.desc   Resolve second volume value 20-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2200016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600319000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('319');
      await Promise.resolve();
    })
  })
}
