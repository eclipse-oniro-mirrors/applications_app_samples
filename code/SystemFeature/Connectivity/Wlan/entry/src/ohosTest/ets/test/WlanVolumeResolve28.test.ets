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

export default function wlanVolumeResolve28Test() {
  describe('WlanVolumeResolve28Test', () => {

    /**
     * @tc.name   testWlanVolume280001
     * @tc.number SUB_WLAN_VOLUME_28_0001
     * @tc.desc   Resolve volume value 28-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume280001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000540000)).assertEqual('10:00:540:000');
      expect(model.resolveIP(1000540000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000540000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume280002
     * @tc.number SUB_WLAN_VOLUME_28_0002
     * @tc.desc   Resolve volume value 28-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume280002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000541000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('541');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume280003
     * @tc.number SUB_WLAN_VOLUME_28_0003
     * @tc.desc   Resolve volume value 28-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume280003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000542000)).assertEqual('10:00:542:000');
      expect(model.resolveIP(1000542000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000542000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume280004
     * @tc.number SUB_WLAN_VOLUME_28_0004
     * @tc.desc   Resolve volume value 28-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume280004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000543000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('543');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume280005
     * @tc.number SUB_WLAN_VOLUME_28_0005
     * @tc.desc   Resolve volume value 28-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume280005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000544000)).assertEqual('10:00:544:000');
      expect(model.resolveIP(1000544000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000544000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume280006
     * @tc.number SUB_WLAN_VOLUME_28_0006
     * @tc.desc   Resolve volume value 28-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume280006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000545000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('545');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume280007
     * @tc.number SUB_WLAN_VOLUME_28_0007
     * @tc.desc   Resolve volume value 28-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume280007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000546000)).assertEqual('10:00:546:000');
      expect(model.resolveIP(1000546000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000546000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume280008
     * @tc.number SUB_WLAN_VOLUME_28_0008
     * @tc.desc   Resolve volume value 28-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume280008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000547000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('547');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume280009
     * @tc.number SUB_WLAN_VOLUME_28_0009
     * @tc.desc   Resolve volume value 28-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume280009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000548000)).assertEqual('10:00:548:000');
      expect(model.resolveIP(1000548000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000548000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume280010
     * @tc.number SUB_WLAN_VOLUME_28_0010
     * @tc.desc   Resolve volume value 28-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume280010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000549000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('549');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume280011
     * @tc.number SUB_WLAN_VOLUME_28_0011
     * @tc.desc   Resolve volume value 28-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume280011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000550000)).assertEqual('10:00:550:000');
      expect(model.resolveIP(1000550000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000550000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume280012
     * @tc.number SUB_WLAN_VOLUME_28_0012
     * @tc.desc   Resolve volume value 28-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume280012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000551000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('551');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume280013
     * @tc.number SUB_WLAN_VOLUME_28_0013
     * @tc.desc   Resolve volume value 28-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume280013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000552000)).assertEqual('10:00:552:000');
      expect(model.resolveIP(1000552000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000552000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume280014
     * @tc.number SUB_WLAN_VOLUME_28_0014
     * @tc.desc   Resolve volume value 28-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume280014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000553000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('553');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume280015
     * @tc.number SUB_WLAN_VOLUME_28_0015
     * @tc.desc   Resolve volume value 28-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume280015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000554000)).assertEqual('10:00:554:000');
      expect(model.resolveIP(1000554000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000554000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume280016
     * @tc.number SUB_WLAN_VOLUME_28_0016
     * @tc.desc   Resolve volume value 28-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume280016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000555000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('555');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume280017
     * @tc.number SUB_WLAN_VOLUME_28_0017
     * @tc.desc   Resolve volume value 28-17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume280017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000556000)).assertEqual('10:00:556:000');
      expect(model.resolveIP(1000556000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000556000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume280018
     * @tc.number SUB_WLAN_VOLUME_28_0018
     * @tc.desc   Resolve volume value 28-18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume280018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000557000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('557');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume280019
     * @tc.number SUB_WLAN_VOLUME_28_0019
     * @tc.desc   Resolve volume value 28-19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume280019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000558000)).assertEqual('10:00:558:000');
      expect(model.resolveIP(1000558000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000558000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume280020
     * @tc.number SUB_WLAN_VOLUME_28_0020
     * @tc.desc   Resolve volume value 28-20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume280020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000559000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('559');
      await Promise.resolve();
    })
  })
}
