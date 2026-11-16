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

export default function wlanVolume2Resolve18Test() {
  describe('WlanVolume2Resolve18Test', () => {

    /**
     * @tc.name   testWlanVol2180001
     * @tc.number SUB_WLAN_VOL2_18_0001
     * @tc.desc   Resolve second volume value 18-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2180001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600272000)).assertEqual('16:00:272:000');
      expect(model.resolveIP(1600272000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600272000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2180002
     * @tc.number SUB_WLAN_VOL2_18_0002
     * @tc.desc   Resolve second volume value 18-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2180002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600273000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('273');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2180003
     * @tc.number SUB_WLAN_VOL2_18_0003
     * @tc.desc   Resolve second volume value 18-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2180003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600274000)).assertEqual('16:00:274:000');
      expect(model.resolveIP(1600274000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600274000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2180004
     * @tc.number SUB_WLAN_VOL2_18_0004
     * @tc.desc   Resolve second volume value 18-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2180004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600275000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('275');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2180005
     * @tc.number SUB_WLAN_VOL2_18_0005
     * @tc.desc   Resolve second volume value 18-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2180005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600276000)).assertEqual('16:00:276:000');
      expect(model.resolveIP(1600276000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600276000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2180006
     * @tc.number SUB_WLAN_VOL2_18_0006
     * @tc.desc   Resolve second volume value 18-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2180006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600277000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('277');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2180007
     * @tc.number SUB_WLAN_VOL2_18_0007
     * @tc.desc   Resolve second volume value 18-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2180007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600278000)).assertEqual('16:00:278:000');
      expect(model.resolveIP(1600278000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600278000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2180008
     * @tc.number SUB_WLAN_VOL2_18_0008
     * @tc.desc   Resolve second volume value 18-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2180008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600279000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('279');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2180009
     * @tc.number SUB_WLAN_VOL2_18_0009
     * @tc.desc   Resolve second volume value 18-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2180009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600280000)).assertEqual('16:00:280:000');
      expect(model.resolveIP(1600280000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600280000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2180010
     * @tc.number SUB_WLAN_VOL2_18_0010
     * @tc.desc   Resolve second volume value 18-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2180010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600281000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('281');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2180011
     * @tc.number SUB_WLAN_VOL2_18_0011
     * @tc.desc   Resolve second volume value 18-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2180011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600282000)).assertEqual('16:00:282:000');
      expect(model.resolveIP(1600282000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600282000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2180012
     * @tc.number SUB_WLAN_VOL2_18_0012
     * @tc.desc   Resolve second volume value 18-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2180012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600283000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('283');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2180013
     * @tc.number SUB_WLAN_VOL2_18_0013
     * @tc.desc   Resolve second volume value 18-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2180013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600284000)).assertEqual('16:00:284:000');
      expect(model.resolveIP(1600284000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600284000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2180014
     * @tc.number SUB_WLAN_VOL2_18_0014
     * @tc.desc   Resolve second volume value 18-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2180014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600285000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('285');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2180015
     * @tc.number SUB_WLAN_VOL2_18_0015
     * @tc.desc   Resolve second volume value 18-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2180015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600286000)).assertEqual('16:00:286:000');
      expect(model.resolveIP(1600286000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600286000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2180016
     * @tc.number SUB_WLAN_VOL2_18_0016
     * @tc.desc   Resolve second volume value 18-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2180016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600287000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('287');
      await Promise.resolve();
    })
  })
}
