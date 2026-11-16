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

export default function wlanVolumeResolve04Test() {
  describe('WlanVolumeResolve04Test', () => {

    /**
     * @tc.name   testWlanVolume040001
     * @tc.number SUB_WLAN_VOLUME_04_0001
     * @tc.desc   Resolve volume value 4-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume040001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000060000)).assertEqual('10:00:060:000');
      expect(model.resolveIP(1000060000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000060000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume040002
     * @tc.number SUB_WLAN_VOLUME_04_0002
     * @tc.desc   Resolve volume value 4-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume040002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000061000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('061');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume040003
     * @tc.number SUB_WLAN_VOLUME_04_0003
     * @tc.desc   Resolve volume value 4-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume040003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000062000)).assertEqual('10:00:062:000');
      expect(model.resolveIP(1000062000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000062000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume040004
     * @tc.number SUB_WLAN_VOLUME_04_0004
     * @tc.desc   Resolve volume value 4-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume040004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000063000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('063');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume040005
     * @tc.number SUB_WLAN_VOLUME_04_0005
     * @tc.desc   Resolve volume value 4-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume040005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000064000)).assertEqual('10:00:064:000');
      expect(model.resolveIP(1000064000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000064000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume040006
     * @tc.number SUB_WLAN_VOLUME_04_0006
     * @tc.desc   Resolve volume value 4-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume040006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000065000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('065');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume040007
     * @tc.number SUB_WLAN_VOLUME_04_0007
     * @tc.desc   Resolve volume value 4-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume040007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000066000)).assertEqual('10:00:066:000');
      expect(model.resolveIP(1000066000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000066000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume040008
     * @tc.number SUB_WLAN_VOLUME_04_0008
     * @tc.desc   Resolve volume value 4-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume040008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000067000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('067');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume040009
     * @tc.number SUB_WLAN_VOLUME_04_0009
     * @tc.desc   Resolve volume value 4-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume040009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000068000)).assertEqual('10:00:068:000');
      expect(model.resolveIP(1000068000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000068000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume040010
     * @tc.number SUB_WLAN_VOLUME_04_0010
     * @tc.desc   Resolve volume value 4-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume040010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000069000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('069');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume040011
     * @tc.number SUB_WLAN_VOLUME_04_0011
     * @tc.desc   Resolve volume value 4-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume040011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000070000)).assertEqual('10:00:070:000');
      expect(model.resolveIP(1000070000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000070000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume040012
     * @tc.number SUB_WLAN_VOLUME_04_0012
     * @tc.desc   Resolve volume value 4-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume040012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000071000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('071');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume040013
     * @tc.number SUB_WLAN_VOLUME_04_0013
     * @tc.desc   Resolve volume value 4-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume040013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000072000)).assertEqual('10:00:072:000');
      expect(model.resolveIP(1000072000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000072000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume040014
     * @tc.number SUB_WLAN_VOLUME_04_0014
     * @tc.desc   Resolve volume value 4-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume040014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000073000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('073');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume040015
     * @tc.number SUB_WLAN_VOLUME_04_0015
     * @tc.desc   Resolve volume value 4-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume040015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000074000)).assertEqual('10:00:074:000');
      expect(model.resolveIP(1000074000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000074000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume040016
     * @tc.number SUB_WLAN_VOLUME_04_0016
     * @tc.desc   Resolve volume value 4-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume040016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000075000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('075');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume040017
     * @tc.number SUB_WLAN_VOLUME_04_0017
     * @tc.desc   Resolve volume value 4-17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume040017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000076000)).assertEqual('10:00:076:000');
      expect(model.resolveIP(1000076000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000076000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume040018
     * @tc.number SUB_WLAN_VOLUME_04_0018
     * @tc.desc   Resolve volume value 4-18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume040018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000077000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('077');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume040019
     * @tc.number SUB_WLAN_VOLUME_04_0019
     * @tc.desc   Resolve volume value 4-19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume040019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000078000)).assertEqual('10:00:078:000');
      expect(model.resolveIP(1000078000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000078000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume040020
     * @tc.number SUB_WLAN_VOLUME_04_0020
     * @tc.desc   Resolve volume value 4-20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume040020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000079000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('079');
      await Promise.resolve();
    })
  })
}
