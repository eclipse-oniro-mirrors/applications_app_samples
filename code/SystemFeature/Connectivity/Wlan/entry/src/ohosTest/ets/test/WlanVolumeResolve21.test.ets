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

export default function wlanVolumeResolve21Test() {
  describe('WlanVolumeResolve21Test', () => {

    /**
     * @tc.name   testWlanVolume210001
     * @tc.number SUB_WLAN_VOLUME_21_0001
     * @tc.desc   Resolve volume value 21-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume210001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000400000)).assertEqual('10:00:400:000');
      expect(model.resolveIP(1000400000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000400000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume210002
     * @tc.number SUB_WLAN_VOLUME_21_0002
     * @tc.desc   Resolve volume value 21-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume210002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000401000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('401');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume210003
     * @tc.number SUB_WLAN_VOLUME_21_0003
     * @tc.desc   Resolve volume value 21-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume210003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000402000)).assertEqual('10:00:402:000');
      expect(model.resolveIP(1000402000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000402000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume210004
     * @tc.number SUB_WLAN_VOLUME_21_0004
     * @tc.desc   Resolve volume value 21-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume210004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000403000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('403');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume210005
     * @tc.number SUB_WLAN_VOLUME_21_0005
     * @tc.desc   Resolve volume value 21-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume210005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000404000)).assertEqual('10:00:404:000');
      expect(model.resolveIP(1000404000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000404000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume210006
     * @tc.number SUB_WLAN_VOLUME_21_0006
     * @tc.desc   Resolve volume value 21-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume210006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000405000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('405');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume210007
     * @tc.number SUB_WLAN_VOLUME_21_0007
     * @tc.desc   Resolve volume value 21-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume210007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000406000)).assertEqual('10:00:406:000');
      expect(model.resolveIP(1000406000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000406000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume210008
     * @tc.number SUB_WLAN_VOLUME_21_0008
     * @tc.desc   Resolve volume value 21-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume210008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000407000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('407');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume210009
     * @tc.number SUB_WLAN_VOLUME_21_0009
     * @tc.desc   Resolve volume value 21-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume210009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000408000)).assertEqual('10:00:408:000');
      expect(model.resolveIP(1000408000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000408000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume210010
     * @tc.number SUB_WLAN_VOLUME_21_0010
     * @tc.desc   Resolve volume value 21-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume210010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000409000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('409');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume210011
     * @tc.number SUB_WLAN_VOLUME_21_0011
     * @tc.desc   Resolve volume value 21-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume210011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000410000)).assertEqual('10:00:410:000');
      expect(model.resolveIP(1000410000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000410000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume210012
     * @tc.number SUB_WLAN_VOLUME_21_0012
     * @tc.desc   Resolve volume value 21-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume210012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000411000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('411');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume210013
     * @tc.number SUB_WLAN_VOLUME_21_0013
     * @tc.desc   Resolve volume value 21-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume210013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000412000)).assertEqual('10:00:412:000');
      expect(model.resolveIP(1000412000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000412000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume210014
     * @tc.number SUB_WLAN_VOLUME_21_0014
     * @tc.desc   Resolve volume value 21-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume210014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000413000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('413');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume210015
     * @tc.number SUB_WLAN_VOLUME_21_0015
     * @tc.desc   Resolve volume value 21-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume210015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000414000)).assertEqual('10:00:414:000');
      expect(model.resolveIP(1000414000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000414000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume210016
     * @tc.number SUB_WLAN_VOLUME_21_0016
     * @tc.desc   Resolve volume value 21-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume210016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000415000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('415');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume210017
     * @tc.number SUB_WLAN_VOLUME_21_0017
     * @tc.desc   Resolve volume value 21-17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume210017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000416000)).assertEqual('10:00:416:000');
      expect(model.resolveIP(1000416000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000416000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume210018
     * @tc.number SUB_WLAN_VOLUME_21_0018
     * @tc.desc   Resolve volume value 21-18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume210018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000417000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('417');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume210019
     * @tc.number SUB_WLAN_VOLUME_21_0019
     * @tc.desc   Resolve volume value 21-19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume210019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000418000)).assertEqual('10:00:418:000');
      expect(model.resolveIP(1000418000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000418000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume210020
     * @tc.number SUB_WLAN_VOLUME_21_0020
     * @tc.desc   Resolve volume value 21-20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume210020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000419000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('419');
      await Promise.resolve();
    })
  })
}
