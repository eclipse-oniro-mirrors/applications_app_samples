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

export default function wlanVolume2Resolve11Test() {
  describe('WlanVolume2Resolve11Test', () => {

    /**
     * @tc.name   testWlanVol2110001
     * @tc.number SUB_WLAN_VOL2_11_0001
     * @tc.desc   Resolve second volume value 11-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2110001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600160000)).assertEqual('16:00:160:000');
      expect(model.resolveIP(1600160000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600160000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2110002
     * @tc.number SUB_WLAN_VOL2_11_0002
     * @tc.desc   Resolve second volume value 11-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2110002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600161000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('161');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2110003
     * @tc.number SUB_WLAN_VOL2_11_0003
     * @tc.desc   Resolve second volume value 11-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2110003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600162000)).assertEqual('16:00:162:000');
      expect(model.resolveIP(1600162000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600162000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2110004
     * @tc.number SUB_WLAN_VOL2_11_0004
     * @tc.desc   Resolve second volume value 11-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2110004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600163000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('163');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2110005
     * @tc.number SUB_WLAN_VOL2_11_0005
     * @tc.desc   Resolve second volume value 11-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2110005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600164000)).assertEqual('16:00:164:000');
      expect(model.resolveIP(1600164000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600164000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2110006
     * @tc.number SUB_WLAN_VOL2_11_0006
     * @tc.desc   Resolve second volume value 11-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2110006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600165000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('165');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2110007
     * @tc.number SUB_WLAN_VOL2_11_0007
     * @tc.desc   Resolve second volume value 11-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2110007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600166000)).assertEqual('16:00:166:000');
      expect(model.resolveIP(1600166000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600166000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2110008
     * @tc.number SUB_WLAN_VOL2_11_0008
     * @tc.desc   Resolve second volume value 11-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2110008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600167000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('167');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2110009
     * @tc.number SUB_WLAN_VOL2_11_0009
     * @tc.desc   Resolve second volume value 11-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2110009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600168000)).assertEqual('16:00:168:000');
      expect(model.resolveIP(1600168000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600168000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2110010
     * @tc.number SUB_WLAN_VOL2_11_0010
     * @tc.desc   Resolve second volume value 11-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2110010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600169000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('169');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2110011
     * @tc.number SUB_WLAN_VOL2_11_0011
     * @tc.desc   Resolve second volume value 11-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2110011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600170000)).assertEqual('16:00:170:000');
      expect(model.resolveIP(1600170000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600170000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2110012
     * @tc.number SUB_WLAN_VOL2_11_0012
     * @tc.desc   Resolve second volume value 11-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2110012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600171000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('171');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2110013
     * @tc.number SUB_WLAN_VOL2_11_0013
     * @tc.desc   Resolve second volume value 11-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2110013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600172000)).assertEqual('16:00:172:000');
      expect(model.resolveIP(1600172000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600172000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2110014
     * @tc.number SUB_WLAN_VOL2_11_0014
     * @tc.desc   Resolve second volume value 11-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2110014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600173000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('173');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2110015
     * @tc.number SUB_WLAN_VOL2_11_0015
     * @tc.desc   Resolve second volume value 11-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2110015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600174000)).assertEqual('16:00:174:000');
      expect(model.resolveIP(1600174000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600174000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2110016
     * @tc.number SUB_WLAN_VOL2_11_0016
     * @tc.desc   Resolve second volume value 11-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2110016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600175000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('175');
      await Promise.resolve();
    })
  })
}
