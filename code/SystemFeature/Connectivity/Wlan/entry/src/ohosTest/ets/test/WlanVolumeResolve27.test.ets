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

export default function wlanVolumeResolve27Test() {
  describe('WlanVolumeResolve27Test', () => {

    /**
     * @tc.name   testWlanVolume270001
     * @tc.number SUB_WLAN_VOLUME_27_0001
     * @tc.desc   Resolve volume value 27-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume270001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000520000)).assertEqual('10:00:520:000');
      expect(model.resolveIP(1000520000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000520000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume270002
     * @tc.number SUB_WLAN_VOLUME_27_0002
     * @tc.desc   Resolve volume value 27-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume270002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000521000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('521');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume270003
     * @tc.number SUB_WLAN_VOLUME_27_0003
     * @tc.desc   Resolve volume value 27-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume270003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000522000)).assertEqual('10:00:522:000');
      expect(model.resolveIP(1000522000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000522000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume270004
     * @tc.number SUB_WLAN_VOLUME_27_0004
     * @tc.desc   Resolve volume value 27-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume270004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000523000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('523');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume270005
     * @tc.number SUB_WLAN_VOLUME_27_0005
     * @tc.desc   Resolve volume value 27-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume270005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000524000)).assertEqual('10:00:524:000');
      expect(model.resolveIP(1000524000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000524000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume270006
     * @tc.number SUB_WLAN_VOLUME_27_0006
     * @tc.desc   Resolve volume value 27-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume270006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000525000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('525');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume270007
     * @tc.number SUB_WLAN_VOLUME_27_0007
     * @tc.desc   Resolve volume value 27-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume270007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000526000)).assertEqual('10:00:526:000');
      expect(model.resolveIP(1000526000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000526000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume270008
     * @tc.number SUB_WLAN_VOLUME_27_0008
     * @tc.desc   Resolve volume value 27-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume270008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000527000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('527');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume270009
     * @tc.number SUB_WLAN_VOLUME_27_0009
     * @tc.desc   Resolve volume value 27-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume270009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000528000)).assertEqual('10:00:528:000');
      expect(model.resolveIP(1000528000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000528000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume270010
     * @tc.number SUB_WLAN_VOLUME_27_0010
     * @tc.desc   Resolve volume value 27-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume270010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000529000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('529');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume270011
     * @tc.number SUB_WLAN_VOLUME_27_0011
     * @tc.desc   Resolve volume value 27-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume270011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000530000)).assertEqual('10:00:530:000');
      expect(model.resolveIP(1000530000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000530000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume270012
     * @tc.number SUB_WLAN_VOLUME_27_0012
     * @tc.desc   Resolve volume value 27-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume270012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000531000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('531');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume270013
     * @tc.number SUB_WLAN_VOLUME_27_0013
     * @tc.desc   Resolve volume value 27-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume270013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000532000)).assertEqual('10:00:532:000');
      expect(model.resolveIP(1000532000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000532000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume270014
     * @tc.number SUB_WLAN_VOLUME_27_0014
     * @tc.desc   Resolve volume value 27-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume270014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000533000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('533');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume270015
     * @tc.number SUB_WLAN_VOLUME_27_0015
     * @tc.desc   Resolve volume value 27-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume270015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000534000)).assertEqual('10:00:534:000');
      expect(model.resolveIP(1000534000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000534000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume270016
     * @tc.number SUB_WLAN_VOLUME_27_0016
     * @tc.desc   Resolve volume value 27-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume270016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000535000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('535');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume270017
     * @tc.number SUB_WLAN_VOLUME_27_0017
     * @tc.desc   Resolve volume value 27-17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume270017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000536000)).assertEqual('10:00:536:000');
      expect(model.resolveIP(1000536000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000536000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume270018
     * @tc.number SUB_WLAN_VOLUME_27_0018
     * @tc.desc   Resolve volume value 27-18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume270018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000537000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('537');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume270019
     * @tc.number SUB_WLAN_VOLUME_27_0019
     * @tc.desc   Resolve volume value 27-19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume270019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000538000)).assertEqual('10:00:538:000');
      expect(model.resolveIP(1000538000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000538000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume270020
     * @tc.number SUB_WLAN_VOLUME_27_0020
     * @tc.desc   Resolve volume value 27-20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume270020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000539000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('539');
      await Promise.resolve();
    })
  })
}
