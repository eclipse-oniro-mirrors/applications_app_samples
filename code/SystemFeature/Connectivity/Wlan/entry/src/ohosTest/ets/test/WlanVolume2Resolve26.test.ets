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

export default function wlanVolume2Resolve26Test() {
  describe('WlanVolume2Resolve26Test', () => {

    /**
     * @tc.name   testWlanVol2260001
     * @tc.number SUB_WLAN_VOL2_26_0001
     * @tc.desc   Resolve second volume value 26-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2260001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600400000)).assertEqual('16:00:400:000');
      expect(model.resolveIP(1600400000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600400000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2260002
     * @tc.number SUB_WLAN_VOL2_26_0002
     * @tc.desc   Resolve second volume value 26-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2260002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600401000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('401');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2260003
     * @tc.number SUB_WLAN_VOL2_26_0003
     * @tc.desc   Resolve second volume value 26-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2260003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600402000)).assertEqual('16:00:402:000');
      expect(model.resolveIP(1600402000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600402000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2260004
     * @tc.number SUB_WLAN_VOL2_26_0004
     * @tc.desc   Resolve second volume value 26-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2260004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600403000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('403');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2260005
     * @tc.number SUB_WLAN_VOL2_26_0005
     * @tc.desc   Resolve second volume value 26-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2260005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600404000)).assertEqual('16:00:404:000');
      expect(model.resolveIP(1600404000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600404000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2260006
     * @tc.number SUB_WLAN_VOL2_26_0006
     * @tc.desc   Resolve second volume value 26-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2260006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600405000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('405');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2260007
     * @tc.number SUB_WLAN_VOL2_26_0007
     * @tc.desc   Resolve second volume value 26-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2260007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600406000)).assertEqual('16:00:406:000');
      expect(model.resolveIP(1600406000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600406000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2260008
     * @tc.number SUB_WLAN_VOL2_26_0008
     * @tc.desc   Resolve second volume value 26-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2260008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600407000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('407');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2260009
     * @tc.number SUB_WLAN_VOL2_26_0009
     * @tc.desc   Resolve second volume value 26-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2260009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600408000)).assertEqual('16:00:408:000');
      expect(model.resolveIP(1600408000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600408000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2260010
     * @tc.number SUB_WLAN_VOL2_26_0010
     * @tc.desc   Resolve second volume value 26-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2260010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600409000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('409');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2260011
     * @tc.number SUB_WLAN_VOL2_26_0011
     * @tc.desc   Resolve second volume value 26-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2260011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600410000)).assertEqual('16:00:410:000');
      expect(model.resolveIP(1600410000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600410000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2260012
     * @tc.number SUB_WLAN_VOL2_26_0012
     * @tc.desc   Resolve second volume value 26-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2260012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600411000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('411');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2260013
     * @tc.number SUB_WLAN_VOL2_26_0013
     * @tc.desc   Resolve second volume value 26-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2260013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600412000)).assertEqual('16:00:412:000');
      expect(model.resolveIP(1600412000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600412000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2260014
     * @tc.number SUB_WLAN_VOL2_26_0014
     * @tc.desc   Resolve second volume value 26-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2260014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600413000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('413');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2260015
     * @tc.number SUB_WLAN_VOL2_26_0015
     * @tc.desc   Resolve second volume value 26-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2260015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600414000)).assertEqual('16:00:414:000');
      expect(model.resolveIP(1600414000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600414000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2260016
     * @tc.number SUB_WLAN_VOL2_26_0016
     * @tc.desc   Resolve second volume value 26-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2260016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600415000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('415');
      await Promise.resolve();
    })
  })
}
