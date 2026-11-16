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

export default function wlanVolumeResolve03Test() {
  describe('WlanVolumeResolve03Test', () => {

    /**
     * @tc.name   testWlanVolume030001
     * @tc.number SUB_WLAN_VOLUME_03_0001
     * @tc.desc   Resolve volume value 3-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume030001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000040000)).assertEqual('10:00:040:000');
      expect(model.resolveIP(1000040000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000040000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume030002
     * @tc.number SUB_WLAN_VOLUME_03_0002
     * @tc.desc   Resolve volume value 3-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume030002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000041000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('041');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume030003
     * @tc.number SUB_WLAN_VOLUME_03_0003
     * @tc.desc   Resolve volume value 3-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume030003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000042000)).assertEqual('10:00:042:000');
      expect(model.resolveIP(1000042000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000042000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume030004
     * @tc.number SUB_WLAN_VOLUME_03_0004
     * @tc.desc   Resolve volume value 3-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume030004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000043000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('043');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume030005
     * @tc.number SUB_WLAN_VOLUME_03_0005
     * @tc.desc   Resolve volume value 3-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume030005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000044000)).assertEqual('10:00:044:000');
      expect(model.resolveIP(1000044000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000044000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume030006
     * @tc.number SUB_WLAN_VOLUME_03_0006
     * @tc.desc   Resolve volume value 3-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume030006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000045000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('045');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume030007
     * @tc.number SUB_WLAN_VOLUME_03_0007
     * @tc.desc   Resolve volume value 3-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume030007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000046000)).assertEqual('10:00:046:000');
      expect(model.resolveIP(1000046000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000046000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume030008
     * @tc.number SUB_WLAN_VOLUME_03_0008
     * @tc.desc   Resolve volume value 3-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume030008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000047000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('047');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume030009
     * @tc.number SUB_WLAN_VOLUME_03_0009
     * @tc.desc   Resolve volume value 3-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume030009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000048000)).assertEqual('10:00:048:000');
      expect(model.resolveIP(1000048000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000048000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume030010
     * @tc.number SUB_WLAN_VOLUME_03_0010
     * @tc.desc   Resolve volume value 3-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume030010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000049000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('049');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume030011
     * @tc.number SUB_WLAN_VOLUME_03_0011
     * @tc.desc   Resolve volume value 3-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume030011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000050000)).assertEqual('10:00:050:000');
      expect(model.resolveIP(1000050000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000050000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume030012
     * @tc.number SUB_WLAN_VOLUME_03_0012
     * @tc.desc   Resolve volume value 3-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume030012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000051000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('051');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume030013
     * @tc.number SUB_WLAN_VOLUME_03_0013
     * @tc.desc   Resolve volume value 3-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume030013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000052000)).assertEqual('10:00:052:000');
      expect(model.resolveIP(1000052000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000052000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume030014
     * @tc.number SUB_WLAN_VOLUME_03_0014
     * @tc.desc   Resolve volume value 3-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume030014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000053000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('053');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume030015
     * @tc.number SUB_WLAN_VOLUME_03_0015
     * @tc.desc   Resolve volume value 3-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume030015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000054000)).assertEqual('10:00:054:000');
      expect(model.resolveIP(1000054000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000054000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume030016
     * @tc.number SUB_WLAN_VOLUME_03_0016
     * @tc.desc   Resolve volume value 3-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume030016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000055000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('055');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume030017
     * @tc.number SUB_WLAN_VOLUME_03_0017
     * @tc.desc   Resolve volume value 3-17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume030017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000056000)).assertEqual('10:00:056:000');
      expect(model.resolveIP(1000056000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000056000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume030018
     * @tc.number SUB_WLAN_VOLUME_03_0018
     * @tc.desc   Resolve volume value 3-18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume030018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000057000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('057');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume030019
     * @tc.number SUB_WLAN_VOLUME_03_0019
     * @tc.desc   Resolve volume value 3-19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume030019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000058000)).assertEqual('10:00:058:000');
      expect(model.resolveIP(1000058000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000058000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume030020
     * @tc.number SUB_WLAN_VOLUME_03_0020
     * @tc.desc   Resolve volume value 3-20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume030020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000059000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('059');
      await Promise.resolve();
    })
  })
}
