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

export default function wlanVolume2Resolve14Test() {
  describe('WlanVolume2Resolve14Test', () => {

    /**
     * @tc.name   testWlanVol2140001
     * @tc.number SUB_WLAN_VOL2_14_0001
     * @tc.desc   Resolve second volume value 14-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2140001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600208000)).assertEqual('16:00:208:000');
      expect(model.resolveIP(1600208000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600208000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2140002
     * @tc.number SUB_WLAN_VOL2_14_0002
     * @tc.desc   Resolve second volume value 14-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2140002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600209000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('209');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2140003
     * @tc.number SUB_WLAN_VOL2_14_0003
     * @tc.desc   Resolve second volume value 14-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2140003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600210000)).assertEqual('16:00:210:000');
      expect(model.resolveIP(1600210000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600210000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2140004
     * @tc.number SUB_WLAN_VOL2_14_0004
     * @tc.desc   Resolve second volume value 14-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2140004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600211000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('211');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2140005
     * @tc.number SUB_WLAN_VOL2_14_0005
     * @tc.desc   Resolve second volume value 14-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2140005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600212000)).assertEqual('16:00:212:000');
      expect(model.resolveIP(1600212000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600212000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2140006
     * @tc.number SUB_WLAN_VOL2_14_0006
     * @tc.desc   Resolve second volume value 14-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2140006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600213000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('213');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2140007
     * @tc.number SUB_WLAN_VOL2_14_0007
     * @tc.desc   Resolve second volume value 14-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2140007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600214000)).assertEqual('16:00:214:000');
      expect(model.resolveIP(1600214000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600214000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2140008
     * @tc.number SUB_WLAN_VOL2_14_0008
     * @tc.desc   Resolve second volume value 14-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2140008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600215000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('215');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2140009
     * @tc.number SUB_WLAN_VOL2_14_0009
     * @tc.desc   Resolve second volume value 14-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2140009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600216000)).assertEqual('16:00:216:000');
      expect(model.resolveIP(1600216000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600216000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2140010
     * @tc.number SUB_WLAN_VOL2_14_0010
     * @tc.desc   Resolve second volume value 14-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2140010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600217000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('217');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2140011
     * @tc.number SUB_WLAN_VOL2_14_0011
     * @tc.desc   Resolve second volume value 14-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2140011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600218000)).assertEqual('16:00:218:000');
      expect(model.resolveIP(1600218000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600218000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2140012
     * @tc.number SUB_WLAN_VOL2_14_0012
     * @tc.desc   Resolve second volume value 14-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2140012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600219000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('219');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2140013
     * @tc.number SUB_WLAN_VOL2_14_0013
     * @tc.desc   Resolve second volume value 14-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2140013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600220000)).assertEqual('16:00:220:000');
      expect(model.resolveIP(1600220000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600220000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2140014
     * @tc.number SUB_WLAN_VOL2_14_0014
     * @tc.desc   Resolve second volume value 14-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2140014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600221000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('221');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2140015
     * @tc.number SUB_WLAN_VOL2_14_0015
     * @tc.desc   Resolve second volume value 14-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2140015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600222000)).assertEqual('16:00:222:000');
      expect(model.resolveIP(1600222000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600222000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2140016
     * @tc.number SUB_WLAN_VOL2_14_0016
     * @tc.desc   Resolve second volume value 14-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2140016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600223000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('223');
      await Promise.resolve();
    })
  })
}
