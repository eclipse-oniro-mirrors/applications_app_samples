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

export default function wlanVolumeResolve12Test() {
  describe('WlanVolumeResolve12Test', () => {

    /**
     * @tc.name   testWlanVolume120001
     * @tc.number SUB_WLAN_VOLUME_12_0001
     * @tc.desc   Resolve volume value 12-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume120001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000220000)).assertEqual('10:00:220:000');
      expect(model.resolveIP(1000220000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000220000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume120002
     * @tc.number SUB_WLAN_VOLUME_12_0002
     * @tc.desc   Resolve volume value 12-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume120002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000221000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('221');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume120003
     * @tc.number SUB_WLAN_VOLUME_12_0003
     * @tc.desc   Resolve volume value 12-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume120003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000222000)).assertEqual('10:00:222:000');
      expect(model.resolveIP(1000222000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000222000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume120004
     * @tc.number SUB_WLAN_VOLUME_12_0004
     * @tc.desc   Resolve volume value 12-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume120004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000223000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('223');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume120005
     * @tc.number SUB_WLAN_VOLUME_12_0005
     * @tc.desc   Resolve volume value 12-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume120005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000224000)).assertEqual('10:00:224:000');
      expect(model.resolveIP(1000224000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000224000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume120006
     * @tc.number SUB_WLAN_VOLUME_12_0006
     * @tc.desc   Resolve volume value 12-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume120006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000225000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('225');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume120007
     * @tc.number SUB_WLAN_VOLUME_12_0007
     * @tc.desc   Resolve volume value 12-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume120007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000226000)).assertEqual('10:00:226:000');
      expect(model.resolveIP(1000226000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000226000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume120008
     * @tc.number SUB_WLAN_VOLUME_12_0008
     * @tc.desc   Resolve volume value 12-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume120008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000227000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('227');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume120009
     * @tc.number SUB_WLAN_VOLUME_12_0009
     * @tc.desc   Resolve volume value 12-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume120009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000228000)).assertEqual('10:00:228:000');
      expect(model.resolveIP(1000228000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000228000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume120010
     * @tc.number SUB_WLAN_VOLUME_12_0010
     * @tc.desc   Resolve volume value 12-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume120010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000229000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('229');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume120011
     * @tc.number SUB_WLAN_VOLUME_12_0011
     * @tc.desc   Resolve volume value 12-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume120011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000230000)).assertEqual('10:00:230:000');
      expect(model.resolveIP(1000230000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000230000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume120012
     * @tc.number SUB_WLAN_VOLUME_12_0012
     * @tc.desc   Resolve volume value 12-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume120012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000231000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('231');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume120013
     * @tc.number SUB_WLAN_VOLUME_12_0013
     * @tc.desc   Resolve volume value 12-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume120013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000232000)).assertEqual('10:00:232:000');
      expect(model.resolveIP(1000232000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000232000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume120014
     * @tc.number SUB_WLAN_VOLUME_12_0014
     * @tc.desc   Resolve volume value 12-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume120014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000233000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('233');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume120015
     * @tc.number SUB_WLAN_VOLUME_12_0015
     * @tc.desc   Resolve volume value 12-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume120015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000234000)).assertEqual('10:00:234:000');
      expect(model.resolveIP(1000234000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000234000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume120016
     * @tc.number SUB_WLAN_VOLUME_12_0016
     * @tc.desc   Resolve volume value 12-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume120016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000235000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('235');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume120017
     * @tc.number SUB_WLAN_VOLUME_12_0017
     * @tc.desc   Resolve volume value 12-17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume120017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000236000)).assertEqual('10:00:236:000');
      expect(model.resolveIP(1000236000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000236000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume120018
     * @tc.number SUB_WLAN_VOLUME_12_0018
     * @tc.desc   Resolve volume value 12-18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume120018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000237000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('237');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume120019
     * @tc.number SUB_WLAN_VOLUME_12_0019
     * @tc.desc   Resolve volume value 12-19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume120019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000238000)).assertEqual('10:00:238:000');
      expect(model.resolveIP(1000238000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000238000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume120020
     * @tc.number SUB_WLAN_VOLUME_12_0020
     * @tc.desc   Resolve volume value 12-20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume120020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000239000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('239');
      await Promise.resolve();
    })
  })
}
