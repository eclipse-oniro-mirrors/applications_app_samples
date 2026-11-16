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

export default function wlanVolumeResolve02Test() {
  describe('WlanVolumeResolve02Test', () => {

    /**
     * @tc.name   testWlanVolume020001
     * @tc.number SUB_WLAN_VOLUME_02_0001
     * @tc.desc   Resolve volume value 2-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume020001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000020000)).assertEqual('10:00:020:000');
      expect(model.resolveIP(1000020000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000020000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume020002
     * @tc.number SUB_WLAN_VOLUME_02_0002
     * @tc.desc   Resolve volume value 2-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume020002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000021000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('021');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume020003
     * @tc.number SUB_WLAN_VOLUME_02_0003
     * @tc.desc   Resolve volume value 2-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume020003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000022000)).assertEqual('10:00:022:000');
      expect(model.resolveIP(1000022000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000022000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume020004
     * @tc.number SUB_WLAN_VOLUME_02_0004
     * @tc.desc   Resolve volume value 2-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume020004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000023000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('023');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume020005
     * @tc.number SUB_WLAN_VOLUME_02_0005
     * @tc.desc   Resolve volume value 2-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume020005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000024000)).assertEqual('10:00:024:000');
      expect(model.resolveIP(1000024000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000024000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume020006
     * @tc.number SUB_WLAN_VOLUME_02_0006
     * @tc.desc   Resolve volume value 2-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume020006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000025000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('025');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume020007
     * @tc.number SUB_WLAN_VOLUME_02_0007
     * @tc.desc   Resolve volume value 2-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume020007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000026000)).assertEqual('10:00:026:000');
      expect(model.resolveIP(1000026000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000026000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume020008
     * @tc.number SUB_WLAN_VOLUME_02_0008
     * @tc.desc   Resolve volume value 2-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume020008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000027000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('027');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume020009
     * @tc.number SUB_WLAN_VOLUME_02_0009
     * @tc.desc   Resolve volume value 2-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume020009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000028000)).assertEqual('10:00:028:000');
      expect(model.resolveIP(1000028000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000028000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume020010
     * @tc.number SUB_WLAN_VOLUME_02_0010
     * @tc.desc   Resolve volume value 2-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume020010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000029000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('029');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume020011
     * @tc.number SUB_WLAN_VOLUME_02_0011
     * @tc.desc   Resolve volume value 2-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume020011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000030000)).assertEqual('10:00:030:000');
      expect(model.resolveIP(1000030000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000030000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume020012
     * @tc.number SUB_WLAN_VOLUME_02_0012
     * @tc.desc   Resolve volume value 2-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume020012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000031000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('031');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume020013
     * @tc.number SUB_WLAN_VOLUME_02_0013
     * @tc.desc   Resolve volume value 2-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume020013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000032000)).assertEqual('10:00:032:000');
      expect(model.resolveIP(1000032000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000032000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume020014
     * @tc.number SUB_WLAN_VOLUME_02_0014
     * @tc.desc   Resolve volume value 2-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume020014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000033000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('033');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume020015
     * @tc.number SUB_WLAN_VOLUME_02_0015
     * @tc.desc   Resolve volume value 2-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume020015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000034000)).assertEqual('10:00:034:000');
      expect(model.resolveIP(1000034000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000034000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume020016
     * @tc.number SUB_WLAN_VOLUME_02_0016
     * @tc.desc   Resolve volume value 2-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume020016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000035000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('035');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume020017
     * @tc.number SUB_WLAN_VOLUME_02_0017
     * @tc.desc   Resolve volume value 2-17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume020017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000036000)).assertEqual('10:00:036:000');
      expect(model.resolveIP(1000036000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000036000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume020018
     * @tc.number SUB_WLAN_VOLUME_02_0018
     * @tc.desc   Resolve volume value 2-18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume020018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000037000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('037');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume020019
     * @tc.number SUB_WLAN_VOLUME_02_0019
     * @tc.desc   Resolve volume value 2-19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume020019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000038000)).assertEqual('10:00:038:000');
      expect(model.resolveIP(1000038000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000038000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume020020
     * @tc.number SUB_WLAN_VOLUME_02_0020
     * @tc.desc   Resolve volume value 2-20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume020020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000039000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('039');
      await Promise.resolve();
    })
  })
}
