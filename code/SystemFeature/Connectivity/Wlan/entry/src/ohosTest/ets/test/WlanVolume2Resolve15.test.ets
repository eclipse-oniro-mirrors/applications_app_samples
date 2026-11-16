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

export default function wlanVolume2Resolve15Test() {
  describe('WlanVolume2Resolve15Test', () => {

    /**
     * @tc.name   testWlanVol2150001
     * @tc.number SUB_WLAN_VOL2_15_0001
     * @tc.desc   Resolve second volume value 15-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2150001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600224000)).assertEqual('16:00:224:000');
      expect(model.resolveIP(1600224000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600224000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2150002
     * @tc.number SUB_WLAN_VOL2_15_0002
     * @tc.desc   Resolve second volume value 15-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2150002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600225000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('225');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2150003
     * @tc.number SUB_WLAN_VOL2_15_0003
     * @tc.desc   Resolve second volume value 15-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2150003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600226000)).assertEqual('16:00:226:000');
      expect(model.resolveIP(1600226000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600226000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2150004
     * @tc.number SUB_WLAN_VOL2_15_0004
     * @tc.desc   Resolve second volume value 15-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2150004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600227000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('227');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2150005
     * @tc.number SUB_WLAN_VOL2_15_0005
     * @tc.desc   Resolve second volume value 15-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2150005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600228000)).assertEqual('16:00:228:000');
      expect(model.resolveIP(1600228000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600228000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2150006
     * @tc.number SUB_WLAN_VOL2_15_0006
     * @tc.desc   Resolve second volume value 15-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2150006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600229000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('229');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2150007
     * @tc.number SUB_WLAN_VOL2_15_0007
     * @tc.desc   Resolve second volume value 15-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2150007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600230000)).assertEqual('16:00:230:000');
      expect(model.resolveIP(1600230000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600230000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2150008
     * @tc.number SUB_WLAN_VOL2_15_0008
     * @tc.desc   Resolve second volume value 15-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2150008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600231000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('231');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2150009
     * @tc.number SUB_WLAN_VOL2_15_0009
     * @tc.desc   Resolve second volume value 15-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2150009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600232000)).assertEqual('16:00:232:000');
      expect(model.resolveIP(1600232000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600232000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2150010
     * @tc.number SUB_WLAN_VOL2_15_0010
     * @tc.desc   Resolve second volume value 15-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2150010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600233000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('233');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2150011
     * @tc.number SUB_WLAN_VOL2_15_0011
     * @tc.desc   Resolve second volume value 15-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2150011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600234000)).assertEqual('16:00:234:000');
      expect(model.resolveIP(1600234000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600234000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2150012
     * @tc.number SUB_WLAN_VOL2_15_0012
     * @tc.desc   Resolve second volume value 15-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2150012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600235000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('235');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2150013
     * @tc.number SUB_WLAN_VOL2_15_0013
     * @tc.desc   Resolve second volume value 15-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2150013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600236000)).assertEqual('16:00:236:000');
      expect(model.resolveIP(1600236000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600236000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2150014
     * @tc.number SUB_WLAN_VOL2_15_0014
     * @tc.desc   Resolve second volume value 15-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2150014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600237000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('237');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2150015
     * @tc.number SUB_WLAN_VOL2_15_0015
     * @tc.desc   Resolve second volume value 15-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2150015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600238000)).assertEqual('16:00:238:000');
      expect(model.resolveIP(1600238000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600238000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2150016
     * @tc.number SUB_WLAN_VOL2_15_0016
     * @tc.desc   Resolve second volume value 15-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2150016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600239000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('239');
      await Promise.resolve();
    })
  })
}
