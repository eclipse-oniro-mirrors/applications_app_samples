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

export default function wlanVolume2Resolve16Test() {
  describe('WlanVolume2Resolve16Test', () => {

    /**
     * @tc.name   testWlanVol2160001
     * @tc.number SUB_WLAN_VOL2_16_0001
     * @tc.desc   Resolve second volume value 16-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2160001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600240000)).assertEqual('16:00:240:000');
      expect(model.resolveIP(1600240000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600240000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2160002
     * @tc.number SUB_WLAN_VOL2_16_0002
     * @tc.desc   Resolve second volume value 16-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2160002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600241000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('241');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2160003
     * @tc.number SUB_WLAN_VOL2_16_0003
     * @tc.desc   Resolve second volume value 16-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2160003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600242000)).assertEqual('16:00:242:000');
      expect(model.resolveIP(1600242000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600242000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2160004
     * @tc.number SUB_WLAN_VOL2_16_0004
     * @tc.desc   Resolve second volume value 16-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2160004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600243000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('243');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2160005
     * @tc.number SUB_WLAN_VOL2_16_0005
     * @tc.desc   Resolve second volume value 16-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2160005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600244000)).assertEqual('16:00:244:000');
      expect(model.resolveIP(1600244000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600244000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2160006
     * @tc.number SUB_WLAN_VOL2_16_0006
     * @tc.desc   Resolve second volume value 16-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2160006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600245000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('245');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2160007
     * @tc.number SUB_WLAN_VOL2_16_0007
     * @tc.desc   Resolve second volume value 16-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2160007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600246000)).assertEqual('16:00:246:000');
      expect(model.resolveIP(1600246000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600246000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2160008
     * @tc.number SUB_WLAN_VOL2_16_0008
     * @tc.desc   Resolve second volume value 16-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2160008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600247000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('247');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2160009
     * @tc.number SUB_WLAN_VOL2_16_0009
     * @tc.desc   Resolve second volume value 16-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2160009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600248000)).assertEqual('16:00:248:000');
      expect(model.resolveIP(1600248000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600248000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2160010
     * @tc.number SUB_WLAN_VOL2_16_0010
     * @tc.desc   Resolve second volume value 16-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2160010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600249000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('249');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2160011
     * @tc.number SUB_WLAN_VOL2_16_0011
     * @tc.desc   Resolve second volume value 16-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2160011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600250000)).assertEqual('16:00:250:000');
      expect(model.resolveIP(1600250000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600250000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2160012
     * @tc.number SUB_WLAN_VOL2_16_0012
     * @tc.desc   Resolve second volume value 16-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2160012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600251000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('251');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2160013
     * @tc.number SUB_WLAN_VOL2_16_0013
     * @tc.desc   Resolve second volume value 16-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2160013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600252000)).assertEqual('16:00:252:000');
      expect(model.resolveIP(1600252000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600252000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2160014
     * @tc.number SUB_WLAN_VOL2_16_0014
     * @tc.desc   Resolve second volume value 16-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2160014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600253000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('253');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2160015
     * @tc.number SUB_WLAN_VOL2_16_0015
     * @tc.desc   Resolve second volume value 16-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2160015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600254000)).assertEqual('16:00:254:000');
      expect(model.resolveIP(1600254000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600254000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2160016
     * @tc.number SUB_WLAN_VOL2_16_0016
     * @tc.desc   Resolve second volume value 16-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2160016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600255000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('255');
      await Promise.resolve();
    })
  })
}
