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

export default function wlanVolumeResolve08Test() {
  describe('WlanVolumeResolve08Test', () => {

    /**
     * @tc.name   testWlanVolume080001
     * @tc.number SUB_WLAN_VOLUME_08_0001
     * @tc.desc   Resolve volume value 8-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume080001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000140000)).assertEqual('10:00:140:000');
      expect(model.resolveIP(1000140000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000140000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume080002
     * @tc.number SUB_WLAN_VOLUME_08_0002
     * @tc.desc   Resolve volume value 8-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume080002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000141000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('141');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume080003
     * @tc.number SUB_WLAN_VOLUME_08_0003
     * @tc.desc   Resolve volume value 8-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume080003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000142000)).assertEqual('10:00:142:000');
      expect(model.resolveIP(1000142000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000142000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume080004
     * @tc.number SUB_WLAN_VOLUME_08_0004
     * @tc.desc   Resolve volume value 8-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume080004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000143000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('143');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume080005
     * @tc.number SUB_WLAN_VOLUME_08_0005
     * @tc.desc   Resolve volume value 8-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume080005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000144000)).assertEqual('10:00:144:000');
      expect(model.resolveIP(1000144000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000144000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume080006
     * @tc.number SUB_WLAN_VOLUME_08_0006
     * @tc.desc   Resolve volume value 8-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume080006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000145000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('145');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume080007
     * @tc.number SUB_WLAN_VOLUME_08_0007
     * @tc.desc   Resolve volume value 8-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume080007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000146000)).assertEqual('10:00:146:000');
      expect(model.resolveIP(1000146000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000146000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume080008
     * @tc.number SUB_WLAN_VOLUME_08_0008
     * @tc.desc   Resolve volume value 8-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume080008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000147000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('147');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume080009
     * @tc.number SUB_WLAN_VOLUME_08_0009
     * @tc.desc   Resolve volume value 8-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume080009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000148000)).assertEqual('10:00:148:000');
      expect(model.resolveIP(1000148000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000148000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume080010
     * @tc.number SUB_WLAN_VOLUME_08_0010
     * @tc.desc   Resolve volume value 8-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume080010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000149000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('149');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume080011
     * @tc.number SUB_WLAN_VOLUME_08_0011
     * @tc.desc   Resolve volume value 8-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume080011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000150000)).assertEqual('10:00:150:000');
      expect(model.resolveIP(1000150000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000150000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume080012
     * @tc.number SUB_WLAN_VOLUME_08_0012
     * @tc.desc   Resolve volume value 8-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume080012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000151000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('151');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume080013
     * @tc.number SUB_WLAN_VOLUME_08_0013
     * @tc.desc   Resolve volume value 8-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume080013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000152000)).assertEqual('10:00:152:000');
      expect(model.resolveIP(1000152000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000152000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume080014
     * @tc.number SUB_WLAN_VOLUME_08_0014
     * @tc.desc   Resolve volume value 8-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume080014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000153000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('153');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume080015
     * @tc.number SUB_WLAN_VOLUME_08_0015
     * @tc.desc   Resolve volume value 8-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume080015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000154000)).assertEqual('10:00:154:000');
      expect(model.resolveIP(1000154000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000154000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume080016
     * @tc.number SUB_WLAN_VOLUME_08_0016
     * @tc.desc   Resolve volume value 8-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume080016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000155000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('155');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume080017
     * @tc.number SUB_WLAN_VOLUME_08_0017
     * @tc.desc   Resolve volume value 8-17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume080017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000156000)).assertEqual('10:00:156:000');
      expect(model.resolveIP(1000156000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000156000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume080018
     * @tc.number SUB_WLAN_VOLUME_08_0018
     * @tc.desc   Resolve volume value 8-18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume080018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000157000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('157');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume080019
     * @tc.number SUB_WLAN_VOLUME_08_0019
     * @tc.desc   Resolve volume value 8-19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume080019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000158000)).assertEqual('10:00:158:000');
      expect(model.resolveIP(1000158000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000158000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume080020
     * @tc.number SUB_WLAN_VOLUME_08_0020
     * @tc.desc   Resolve volume value 8-20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume080020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000159000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('159');
      await Promise.resolve();
    })
  })
}
