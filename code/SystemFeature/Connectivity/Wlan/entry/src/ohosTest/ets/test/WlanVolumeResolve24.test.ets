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

export default function wlanVolumeResolve24Test() {
  describe('WlanVolumeResolve24Test', () => {

    /**
     * @tc.name   testWlanVolume240001
     * @tc.number SUB_WLAN_VOLUME_24_0001
     * @tc.desc   Resolve volume value 24-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume240001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000460000)).assertEqual('10:00:460:000');
      expect(model.resolveIP(1000460000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000460000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume240002
     * @tc.number SUB_WLAN_VOLUME_24_0002
     * @tc.desc   Resolve volume value 24-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume240002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000461000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('461');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume240003
     * @tc.number SUB_WLAN_VOLUME_24_0003
     * @tc.desc   Resolve volume value 24-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume240003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000462000)).assertEqual('10:00:462:000');
      expect(model.resolveIP(1000462000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000462000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume240004
     * @tc.number SUB_WLAN_VOLUME_24_0004
     * @tc.desc   Resolve volume value 24-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume240004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000463000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('463');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume240005
     * @tc.number SUB_WLAN_VOLUME_24_0005
     * @tc.desc   Resolve volume value 24-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume240005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000464000)).assertEqual('10:00:464:000');
      expect(model.resolveIP(1000464000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000464000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume240006
     * @tc.number SUB_WLAN_VOLUME_24_0006
     * @tc.desc   Resolve volume value 24-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume240006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000465000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('465');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume240007
     * @tc.number SUB_WLAN_VOLUME_24_0007
     * @tc.desc   Resolve volume value 24-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume240007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000466000)).assertEqual('10:00:466:000');
      expect(model.resolveIP(1000466000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000466000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume240008
     * @tc.number SUB_WLAN_VOLUME_24_0008
     * @tc.desc   Resolve volume value 24-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume240008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000467000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('467');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume240009
     * @tc.number SUB_WLAN_VOLUME_24_0009
     * @tc.desc   Resolve volume value 24-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume240009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000468000)).assertEqual('10:00:468:000');
      expect(model.resolveIP(1000468000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000468000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume240010
     * @tc.number SUB_WLAN_VOLUME_24_0010
     * @tc.desc   Resolve volume value 24-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume240010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000469000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('469');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume240011
     * @tc.number SUB_WLAN_VOLUME_24_0011
     * @tc.desc   Resolve volume value 24-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume240011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000470000)).assertEqual('10:00:470:000');
      expect(model.resolveIP(1000470000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000470000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume240012
     * @tc.number SUB_WLAN_VOLUME_24_0012
     * @tc.desc   Resolve volume value 24-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume240012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000471000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('471');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume240013
     * @tc.number SUB_WLAN_VOLUME_24_0013
     * @tc.desc   Resolve volume value 24-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume240013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000472000)).assertEqual('10:00:472:000');
      expect(model.resolveIP(1000472000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000472000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume240014
     * @tc.number SUB_WLAN_VOLUME_24_0014
     * @tc.desc   Resolve volume value 24-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume240014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000473000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('473');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume240015
     * @tc.number SUB_WLAN_VOLUME_24_0015
     * @tc.desc   Resolve volume value 24-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume240015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000474000)).assertEqual('10:00:474:000');
      expect(model.resolveIP(1000474000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000474000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume240016
     * @tc.number SUB_WLAN_VOLUME_24_0016
     * @tc.desc   Resolve volume value 24-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume240016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000475000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('475');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume240017
     * @tc.number SUB_WLAN_VOLUME_24_0017
     * @tc.desc   Resolve volume value 24-17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume240017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000476000)).assertEqual('10:00:476:000');
      expect(model.resolveIP(1000476000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000476000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume240018
     * @tc.number SUB_WLAN_VOLUME_24_0018
     * @tc.desc   Resolve volume value 24-18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume240018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000477000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('477');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume240019
     * @tc.number SUB_WLAN_VOLUME_24_0019
     * @tc.desc   Resolve volume value 24-19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume240019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000478000)).assertEqual('10:00:478:000');
      expect(model.resolveIP(1000478000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000478000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume240020
     * @tc.number SUB_WLAN_VOLUME_24_0020
     * @tc.desc   Resolve volume value 24-20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume240020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000479000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('479');
      await Promise.resolve();
    })
  })
}
