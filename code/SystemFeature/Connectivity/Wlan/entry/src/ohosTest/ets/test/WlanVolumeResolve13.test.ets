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

export default function wlanVolumeResolve13Test() {
  describe('WlanVolumeResolve13Test', () => {

    /**
     * @tc.name   testWlanVolume130001
     * @tc.number SUB_WLAN_VOLUME_13_0001
     * @tc.desc   Resolve volume value 13-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume130001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000240000)).assertEqual('10:00:240:000');
      expect(model.resolveIP(1000240000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000240000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume130002
     * @tc.number SUB_WLAN_VOLUME_13_0002
     * @tc.desc   Resolve volume value 13-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume130002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000241000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('241');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume130003
     * @tc.number SUB_WLAN_VOLUME_13_0003
     * @tc.desc   Resolve volume value 13-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume130003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000242000)).assertEqual('10:00:242:000');
      expect(model.resolveIP(1000242000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000242000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume130004
     * @tc.number SUB_WLAN_VOLUME_13_0004
     * @tc.desc   Resolve volume value 13-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume130004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000243000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('243');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume130005
     * @tc.number SUB_WLAN_VOLUME_13_0005
     * @tc.desc   Resolve volume value 13-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume130005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000244000)).assertEqual('10:00:244:000');
      expect(model.resolveIP(1000244000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000244000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume130006
     * @tc.number SUB_WLAN_VOLUME_13_0006
     * @tc.desc   Resolve volume value 13-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume130006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000245000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('245');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume130007
     * @tc.number SUB_WLAN_VOLUME_13_0007
     * @tc.desc   Resolve volume value 13-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume130007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000246000)).assertEqual('10:00:246:000');
      expect(model.resolveIP(1000246000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000246000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume130008
     * @tc.number SUB_WLAN_VOLUME_13_0008
     * @tc.desc   Resolve volume value 13-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume130008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000247000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('247');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume130009
     * @tc.number SUB_WLAN_VOLUME_13_0009
     * @tc.desc   Resolve volume value 13-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume130009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000248000)).assertEqual('10:00:248:000');
      expect(model.resolveIP(1000248000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000248000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume130010
     * @tc.number SUB_WLAN_VOLUME_13_0010
     * @tc.desc   Resolve volume value 13-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume130010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000249000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('249');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume130011
     * @tc.number SUB_WLAN_VOLUME_13_0011
     * @tc.desc   Resolve volume value 13-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume130011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000250000)).assertEqual('10:00:250:000');
      expect(model.resolveIP(1000250000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000250000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume130012
     * @tc.number SUB_WLAN_VOLUME_13_0012
     * @tc.desc   Resolve volume value 13-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume130012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000251000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('251');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume130013
     * @tc.number SUB_WLAN_VOLUME_13_0013
     * @tc.desc   Resolve volume value 13-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume130013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000252000)).assertEqual('10:00:252:000');
      expect(model.resolveIP(1000252000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000252000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume130014
     * @tc.number SUB_WLAN_VOLUME_13_0014
     * @tc.desc   Resolve volume value 13-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume130014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000253000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('253');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume130015
     * @tc.number SUB_WLAN_VOLUME_13_0015
     * @tc.desc   Resolve volume value 13-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume130015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000254000)).assertEqual('10:00:254:000');
      expect(model.resolveIP(1000254000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000254000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume130016
     * @tc.number SUB_WLAN_VOLUME_13_0016
     * @tc.desc   Resolve volume value 13-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume130016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000255000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('255');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume130017
     * @tc.number SUB_WLAN_VOLUME_13_0017
     * @tc.desc   Resolve volume value 13-17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume130017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000256000)).assertEqual('10:00:256:000');
      expect(model.resolveIP(1000256000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000256000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume130018
     * @tc.number SUB_WLAN_VOLUME_13_0018
     * @tc.desc   Resolve volume value 13-18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume130018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000257000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('257');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume130019
     * @tc.number SUB_WLAN_VOLUME_13_0019
     * @tc.desc   Resolve volume value 13-19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume130019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000258000)).assertEqual('10:00:258:000');
      expect(model.resolveIP(1000258000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000258000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume130020
     * @tc.number SUB_WLAN_VOLUME_13_0020
     * @tc.desc   Resolve volume value 13-20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume130020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000259000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('259');
      await Promise.resolve();
    })
  })
}
