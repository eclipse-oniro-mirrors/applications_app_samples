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

export default function wlanVolume2Resolve02Test() {
  describe('WlanVolume2Resolve02Test', () => {

    /**
     * @tc.name   testWlanVol2020001
     * @tc.number SUB_WLAN_VOL2_02_0001
     * @tc.desc   Resolve second volume value 2-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2020001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600016000)).assertEqual('16:00:016:000');
      expect(model.resolveIP(1600016000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600016000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2020002
     * @tc.number SUB_WLAN_VOL2_02_0002
     * @tc.desc   Resolve second volume value 2-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2020002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600017000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('017');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2020003
     * @tc.number SUB_WLAN_VOL2_02_0003
     * @tc.desc   Resolve second volume value 2-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2020003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600018000)).assertEqual('16:00:018:000');
      expect(model.resolveIP(1600018000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600018000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2020004
     * @tc.number SUB_WLAN_VOL2_02_0004
     * @tc.desc   Resolve second volume value 2-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2020004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600019000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('019');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2020005
     * @tc.number SUB_WLAN_VOL2_02_0005
     * @tc.desc   Resolve second volume value 2-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2020005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600020000)).assertEqual('16:00:020:000');
      expect(model.resolveIP(1600020000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600020000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2020006
     * @tc.number SUB_WLAN_VOL2_02_0006
     * @tc.desc   Resolve second volume value 2-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2020006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600021000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('021');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2020007
     * @tc.number SUB_WLAN_VOL2_02_0007
     * @tc.desc   Resolve second volume value 2-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2020007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600022000)).assertEqual('16:00:022:000');
      expect(model.resolveIP(1600022000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600022000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2020008
     * @tc.number SUB_WLAN_VOL2_02_0008
     * @tc.desc   Resolve second volume value 2-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2020008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600023000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('023');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2020009
     * @tc.number SUB_WLAN_VOL2_02_0009
     * @tc.desc   Resolve second volume value 2-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2020009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600024000)).assertEqual('16:00:024:000');
      expect(model.resolveIP(1600024000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600024000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2020010
     * @tc.number SUB_WLAN_VOL2_02_0010
     * @tc.desc   Resolve second volume value 2-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2020010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600025000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('025');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2020011
     * @tc.number SUB_WLAN_VOL2_02_0011
     * @tc.desc   Resolve second volume value 2-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2020011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600026000)).assertEqual('16:00:026:000');
      expect(model.resolveIP(1600026000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600026000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2020012
     * @tc.number SUB_WLAN_VOL2_02_0012
     * @tc.desc   Resolve second volume value 2-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2020012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600027000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('027');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2020013
     * @tc.number SUB_WLAN_VOL2_02_0013
     * @tc.desc   Resolve second volume value 2-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2020013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600028000)).assertEqual('16:00:028:000');
      expect(model.resolveIP(1600028000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600028000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2020014
     * @tc.number SUB_WLAN_VOL2_02_0014
     * @tc.desc   Resolve second volume value 2-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2020014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600029000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('029');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2020015
     * @tc.number SUB_WLAN_VOL2_02_0015
     * @tc.desc   Resolve second volume value 2-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2020015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600030000)).assertEqual('16:00:030:000');
      expect(model.resolveIP(1600030000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600030000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2020016
     * @tc.number SUB_WLAN_VOL2_02_0016
     * @tc.desc   Resolve second volume value 2-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2020016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600031000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('031');
      await Promise.resolve();
    })
  })
}
