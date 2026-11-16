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

export default function wlanVolumeResolve15Test() {
  describe('WlanVolumeResolve15Test', () => {

    /**
     * @tc.name   testWlanVolume150001
     * @tc.number SUB_WLAN_VOLUME_15_0001
     * @tc.desc   Resolve volume value 15-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume150001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000280000)).assertEqual('10:00:280:000');
      expect(model.resolveIP(1000280000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000280000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume150002
     * @tc.number SUB_WLAN_VOLUME_15_0002
     * @tc.desc   Resolve volume value 15-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume150002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000281000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('281');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume150003
     * @tc.number SUB_WLAN_VOLUME_15_0003
     * @tc.desc   Resolve volume value 15-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume150003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000282000)).assertEqual('10:00:282:000');
      expect(model.resolveIP(1000282000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000282000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume150004
     * @tc.number SUB_WLAN_VOLUME_15_0004
     * @tc.desc   Resolve volume value 15-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume150004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000283000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('283');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume150005
     * @tc.number SUB_WLAN_VOLUME_15_0005
     * @tc.desc   Resolve volume value 15-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume150005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000284000)).assertEqual('10:00:284:000');
      expect(model.resolveIP(1000284000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000284000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume150006
     * @tc.number SUB_WLAN_VOLUME_15_0006
     * @tc.desc   Resolve volume value 15-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume150006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000285000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('285');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume150007
     * @tc.number SUB_WLAN_VOLUME_15_0007
     * @tc.desc   Resolve volume value 15-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume150007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000286000)).assertEqual('10:00:286:000');
      expect(model.resolveIP(1000286000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000286000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume150008
     * @tc.number SUB_WLAN_VOLUME_15_0008
     * @tc.desc   Resolve volume value 15-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume150008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000287000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('287');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume150009
     * @tc.number SUB_WLAN_VOLUME_15_0009
     * @tc.desc   Resolve volume value 15-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume150009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000288000)).assertEqual('10:00:288:000');
      expect(model.resolveIP(1000288000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000288000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume150010
     * @tc.number SUB_WLAN_VOLUME_15_0010
     * @tc.desc   Resolve volume value 15-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume150010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000289000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('289');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume150011
     * @tc.number SUB_WLAN_VOLUME_15_0011
     * @tc.desc   Resolve volume value 15-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume150011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000290000)).assertEqual('10:00:290:000');
      expect(model.resolveIP(1000290000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000290000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume150012
     * @tc.number SUB_WLAN_VOLUME_15_0012
     * @tc.desc   Resolve volume value 15-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume150012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000291000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('291');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume150013
     * @tc.number SUB_WLAN_VOLUME_15_0013
     * @tc.desc   Resolve volume value 15-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume150013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000292000)).assertEqual('10:00:292:000');
      expect(model.resolveIP(1000292000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000292000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume150014
     * @tc.number SUB_WLAN_VOLUME_15_0014
     * @tc.desc   Resolve volume value 15-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume150014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000293000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('293');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume150015
     * @tc.number SUB_WLAN_VOLUME_15_0015
     * @tc.desc   Resolve volume value 15-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume150015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000294000)).assertEqual('10:00:294:000');
      expect(model.resolveIP(1000294000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000294000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume150016
     * @tc.number SUB_WLAN_VOLUME_15_0016
     * @tc.desc   Resolve volume value 15-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume150016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000295000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('295');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume150017
     * @tc.number SUB_WLAN_VOLUME_15_0017
     * @tc.desc   Resolve volume value 15-17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume150017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000296000)).assertEqual('10:00:296:000');
      expect(model.resolveIP(1000296000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000296000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume150018
     * @tc.number SUB_WLAN_VOLUME_15_0018
     * @tc.desc   Resolve volume value 15-18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume150018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000297000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('297');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume150019
     * @tc.number SUB_WLAN_VOLUME_15_0019
     * @tc.desc   Resolve volume value 15-19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume150019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000298000)).assertEqual('10:00:298:000');
      expect(model.resolveIP(1000298000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000298000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume150020
     * @tc.number SUB_WLAN_VOLUME_15_0020
     * @tc.desc   Resolve volume value 15-20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume150020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000299000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('299');
      await Promise.resolve();
    })
  })
}
