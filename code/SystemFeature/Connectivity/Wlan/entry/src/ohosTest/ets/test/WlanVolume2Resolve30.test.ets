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

export default function wlanVolume2Resolve30Test() {
  describe('WlanVolume2Resolve30Test', () => {

    /**
     * @tc.name   testWlanVol2300001
     * @tc.number SUB_WLAN_VOL2_30_0001
     * @tc.desc   Resolve second volume value 30-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2300001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600464000)).assertEqual('16:00:464:000');
      expect(model.resolveIP(1600464000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600464000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2300002
     * @tc.number SUB_WLAN_VOL2_30_0002
     * @tc.desc   Resolve second volume value 30-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2300002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600465000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('465');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2300003
     * @tc.number SUB_WLAN_VOL2_30_0003
     * @tc.desc   Resolve second volume value 30-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2300003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600466000)).assertEqual('16:00:466:000');
      expect(model.resolveIP(1600466000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600466000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2300004
     * @tc.number SUB_WLAN_VOL2_30_0004
     * @tc.desc   Resolve second volume value 30-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2300004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600467000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('467');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2300005
     * @tc.number SUB_WLAN_VOL2_30_0005
     * @tc.desc   Resolve second volume value 30-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2300005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600468000)).assertEqual('16:00:468:000');
      expect(model.resolveIP(1600468000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600468000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2300006
     * @tc.number SUB_WLAN_VOL2_30_0006
     * @tc.desc   Resolve second volume value 30-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2300006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600469000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('469');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2300007
     * @tc.number SUB_WLAN_VOL2_30_0007
     * @tc.desc   Resolve second volume value 30-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2300007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600470000)).assertEqual('16:00:470:000');
      expect(model.resolveIP(1600470000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600470000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2300008
     * @tc.number SUB_WLAN_VOL2_30_0008
     * @tc.desc   Resolve second volume value 30-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2300008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600471000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('471');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2300009
     * @tc.number SUB_WLAN_VOL2_30_0009
     * @tc.desc   Resolve second volume value 30-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2300009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600472000)).assertEqual('16:00:472:000');
      expect(model.resolveIP(1600472000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600472000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2300010
     * @tc.number SUB_WLAN_VOL2_30_0010
     * @tc.desc   Resolve second volume value 30-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2300010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600473000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('473');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2300011
     * @tc.number SUB_WLAN_VOL2_30_0011
     * @tc.desc   Resolve second volume value 30-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2300011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600474000)).assertEqual('16:00:474:000');
      expect(model.resolveIP(1600474000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600474000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2300012
     * @tc.number SUB_WLAN_VOL2_30_0012
     * @tc.desc   Resolve second volume value 30-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2300012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600475000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('475');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2300013
     * @tc.number SUB_WLAN_VOL2_30_0013
     * @tc.desc   Resolve second volume value 30-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2300013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600476000)).assertEqual('16:00:476:000');
      expect(model.resolveIP(1600476000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600476000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2300014
     * @tc.number SUB_WLAN_VOL2_30_0014
     * @tc.desc   Resolve second volume value 30-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2300014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600477000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('477');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2300015
     * @tc.number SUB_WLAN_VOL2_30_0015
     * @tc.desc   Resolve second volume value 30-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2300015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600478000)).assertEqual('16:00:478:000');
      expect(model.resolveIP(1600478000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600478000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2300016
     * @tc.number SUB_WLAN_VOL2_30_0016
     * @tc.desc   Resolve second volume value 30-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2300016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600479000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('479');
      await Promise.resolve();
    })
  })
}
