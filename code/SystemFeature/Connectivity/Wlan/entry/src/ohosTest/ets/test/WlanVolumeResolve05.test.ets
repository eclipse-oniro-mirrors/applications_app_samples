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

export default function wlanVolumeResolve05Test() {
  describe('WlanVolumeResolve05Test', () => {

    /**
     * @tc.name   testWlanVolume050001
     * @tc.number SUB_WLAN_VOLUME_05_0001
     * @tc.desc   Resolve volume value 5-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume050001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000080000)).assertEqual('10:00:080:000');
      expect(model.resolveIP(1000080000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000080000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume050002
     * @tc.number SUB_WLAN_VOLUME_05_0002
     * @tc.desc   Resolve volume value 5-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume050002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000081000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('081');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume050003
     * @tc.number SUB_WLAN_VOLUME_05_0003
     * @tc.desc   Resolve volume value 5-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume050003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000082000)).assertEqual('10:00:082:000');
      expect(model.resolveIP(1000082000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000082000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume050004
     * @tc.number SUB_WLAN_VOLUME_05_0004
     * @tc.desc   Resolve volume value 5-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume050004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000083000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('083');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume050005
     * @tc.number SUB_WLAN_VOLUME_05_0005
     * @tc.desc   Resolve volume value 5-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume050005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000084000)).assertEqual('10:00:084:000');
      expect(model.resolveIP(1000084000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000084000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume050006
     * @tc.number SUB_WLAN_VOLUME_05_0006
     * @tc.desc   Resolve volume value 5-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume050006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000085000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('085');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume050007
     * @tc.number SUB_WLAN_VOLUME_05_0007
     * @tc.desc   Resolve volume value 5-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume050007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000086000)).assertEqual('10:00:086:000');
      expect(model.resolveIP(1000086000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000086000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume050008
     * @tc.number SUB_WLAN_VOLUME_05_0008
     * @tc.desc   Resolve volume value 5-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume050008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000087000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('087');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume050009
     * @tc.number SUB_WLAN_VOLUME_05_0009
     * @tc.desc   Resolve volume value 5-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume050009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000088000)).assertEqual('10:00:088:000');
      expect(model.resolveIP(1000088000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000088000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume050010
     * @tc.number SUB_WLAN_VOLUME_05_0010
     * @tc.desc   Resolve volume value 5-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume050010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000089000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('089');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume050011
     * @tc.number SUB_WLAN_VOLUME_05_0011
     * @tc.desc   Resolve volume value 5-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume050011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000090000)).assertEqual('10:00:090:000');
      expect(model.resolveIP(1000090000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000090000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume050012
     * @tc.number SUB_WLAN_VOLUME_05_0012
     * @tc.desc   Resolve volume value 5-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume050012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000091000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('091');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume050013
     * @tc.number SUB_WLAN_VOLUME_05_0013
     * @tc.desc   Resolve volume value 5-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume050013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000092000)).assertEqual('10:00:092:000');
      expect(model.resolveIP(1000092000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000092000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume050014
     * @tc.number SUB_WLAN_VOLUME_05_0014
     * @tc.desc   Resolve volume value 5-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume050014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000093000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('093');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume050015
     * @tc.number SUB_WLAN_VOLUME_05_0015
     * @tc.desc   Resolve volume value 5-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume050015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000094000)).assertEqual('10:00:094:000');
      expect(model.resolveIP(1000094000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000094000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume050016
     * @tc.number SUB_WLAN_VOLUME_05_0016
     * @tc.desc   Resolve volume value 5-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume050016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000095000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('095');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume050017
     * @tc.number SUB_WLAN_VOLUME_05_0017
     * @tc.desc   Resolve volume value 5-17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume050017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000096000)).assertEqual('10:00:096:000');
      expect(model.resolveIP(1000096000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000096000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume050018
     * @tc.number SUB_WLAN_VOLUME_05_0018
     * @tc.desc   Resolve volume value 5-18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume050018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000097000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('097');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume050019
     * @tc.number SUB_WLAN_VOLUME_05_0019
     * @tc.desc   Resolve volume value 5-19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume050019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000098000)).assertEqual('10:00:098:000');
      expect(model.resolveIP(1000098000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000098000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume050020
     * @tc.number SUB_WLAN_VOLUME_05_0020
     * @tc.desc   Resolve volume value 5-20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume050020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000099000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('099');
      await Promise.resolve();
    })
  })
}
