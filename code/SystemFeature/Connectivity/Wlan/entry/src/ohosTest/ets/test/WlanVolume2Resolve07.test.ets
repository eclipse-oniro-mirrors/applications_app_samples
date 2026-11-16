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

export default function wlanVolume2Resolve07Test() {
  describe('WlanVolume2Resolve07Test', () => {

    /**
     * @tc.name   testWlanVol2070001
     * @tc.number SUB_WLAN_VOL2_07_0001
     * @tc.desc   Resolve second volume value 7-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2070001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600096000)).assertEqual('16:00:096:000');
      expect(model.resolveIP(1600096000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600096000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2070002
     * @tc.number SUB_WLAN_VOL2_07_0002
     * @tc.desc   Resolve second volume value 7-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2070002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600097000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('097');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2070003
     * @tc.number SUB_WLAN_VOL2_07_0003
     * @tc.desc   Resolve second volume value 7-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2070003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600098000)).assertEqual('16:00:098:000');
      expect(model.resolveIP(1600098000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600098000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2070004
     * @tc.number SUB_WLAN_VOL2_07_0004
     * @tc.desc   Resolve second volume value 7-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2070004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600099000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('099');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2070005
     * @tc.number SUB_WLAN_VOL2_07_0005
     * @tc.desc   Resolve second volume value 7-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2070005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600100000)).assertEqual('16:00:100:000');
      expect(model.resolveIP(1600100000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600100000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2070006
     * @tc.number SUB_WLAN_VOL2_07_0006
     * @tc.desc   Resolve second volume value 7-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2070006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600101000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('101');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2070007
     * @tc.number SUB_WLAN_VOL2_07_0007
     * @tc.desc   Resolve second volume value 7-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2070007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600102000)).assertEqual('16:00:102:000');
      expect(model.resolveIP(1600102000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600102000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2070008
     * @tc.number SUB_WLAN_VOL2_07_0008
     * @tc.desc   Resolve second volume value 7-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2070008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600103000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('103');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2070009
     * @tc.number SUB_WLAN_VOL2_07_0009
     * @tc.desc   Resolve second volume value 7-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2070009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600104000)).assertEqual('16:00:104:000');
      expect(model.resolveIP(1600104000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600104000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2070010
     * @tc.number SUB_WLAN_VOL2_07_0010
     * @tc.desc   Resolve second volume value 7-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2070010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600105000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('105');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2070011
     * @tc.number SUB_WLAN_VOL2_07_0011
     * @tc.desc   Resolve second volume value 7-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2070011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600106000)).assertEqual('16:00:106:000');
      expect(model.resolveIP(1600106000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600106000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2070012
     * @tc.number SUB_WLAN_VOL2_07_0012
     * @tc.desc   Resolve second volume value 7-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2070012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600107000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('107');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2070013
     * @tc.number SUB_WLAN_VOL2_07_0013
     * @tc.desc   Resolve second volume value 7-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2070013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600108000)).assertEqual('16:00:108:000');
      expect(model.resolveIP(1600108000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600108000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2070014
     * @tc.number SUB_WLAN_VOL2_07_0014
     * @tc.desc   Resolve second volume value 7-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2070014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600109000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('109');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2070015
     * @tc.number SUB_WLAN_VOL2_07_0015
     * @tc.desc   Resolve second volume value 7-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2070015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600110000)).assertEqual('16:00:110:000');
      expect(model.resolveIP(1600110000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600110000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2070016
     * @tc.number SUB_WLAN_VOL2_07_0016
     * @tc.desc   Resolve second volume value 7-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2070016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600111000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('111');
      await Promise.resolve();
    })
  })
}
