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

export default function wlanVolumeResolve16Test() {
  describe('WlanVolumeResolve16Test', () => {

    /**
     * @tc.name   testWlanVolume160001
     * @tc.number SUB_WLAN_VOLUME_16_0001
     * @tc.desc   Resolve volume value 16-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume160001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000300000)).assertEqual('10:00:300:000');
      expect(model.resolveIP(1000300000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000300000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume160002
     * @tc.number SUB_WLAN_VOLUME_16_0002
     * @tc.desc   Resolve volume value 16-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume160002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000301000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('301');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume160003
     * @tc.number SUB_WLAN_VOLUME_16_0003
     * @tc.desc   Resolve volume value 16-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume160003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000302000)).assertEqual('10:00:302:000');
      expect(model.resolveIP(1000302000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000302000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume160004
     * @tc.number SUB_WLAN_VOLUME_16_0004
     * @tc.desc   Resolve volume value 16-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume160004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000303000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('303');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume160005
     * @tc.number SUB_WLAN_VOLUME_16_0005
     * @tc.desc   Resolve volume value 16-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume160005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000304000)).assertEqual('10:00:304:000');
      expect(model.resolveIP(1000304000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000304000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume160006
     * @tc.number SUB_WLAN_VOLUME_16_0006
     * @tc.desc   Resolve volume value 16-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume160006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000305000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('305');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume160007
     * @tc.number SUB_WLAN_VOLUME_16_0007
     * @tc.desc   Resolve volume value 16-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume160007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000306000)).assertEqual('10:00:306:000');
      expect(model.resolveIP(1000306000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000306000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume160008
     * @tc.number SUB_WLAN_VOLUME_16_0008
     * @tc.desc   Resolve volume value 16-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume160008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000307000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('307');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume160009
     * @tc.number SUB_WLAN_VOLUME_16_0009
     * @tc.desc   Resolve volume value 16-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume160009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000308000)).assertEqual('10:00:308:000');
      expect(model.resolveIP(1000308000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000308000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume160010
     * @tc.number SUB_WLAN_VOLUME_16_0010
     * @tc.desc   Resolve volume value 16-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume160010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000309000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('309');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume160011
     * @tc.number SUB_WLAN_VOLUME_16_0011
     * @tc.desc   Resolve volume value 16-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume160011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000310000)).assertEqual('10:00:310:000');
      expect(model.resolveIP(1000310000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000310000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume160012
     * @tc.number SUB_WLAN_VOLUME_16_0012
     * @tc.desc   Resolve volume value 16-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume160012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000311000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('311');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume160013
     * @tc.number SUB_WLAN_VOLUME_16_0013
     * @tc.desc   Resolve volume value 16-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume160013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000312000)).assertEqual('10:00:312:000');
      expect(model.resolveIP(1000312000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000312000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume160014
     * @tc.number SUB_WLAN_VOLUME_16_0014
     * @tc.desc   Resolve volume value 16-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume160014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000313000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('313');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume160015
     * @tc.number SUB_WLAN_VOLUME_16_0015
     * @tc.desc   Resolve volume value 16-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume160015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000314000)).assertEqual('10:00:314:000');
      expect(model.resolveIP(1000314000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000314000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume160016
     * @tc.number SUB_WLAN_VOLUME_16_0016
     * @tc.desc   Resolve volume value 16-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume160016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000315000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('315');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume160017
     * @tc.number SUB_WLAN_VOLUME_16_0017
     * @tc.desc   Resolve volume value 16-17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume160017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000316000)).assertEqual('10:00:316:000');
      expect(model.resolveIP(1000316000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000316000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume160018
     * @tc.number SUB_WLAN_VOLUME_16_0018
     * @tc.desc   Resolve volume value 16-18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume160018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000317000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('317');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume160019
     * @tc.number SUB_WLAN_VOLUME_16_0019
     * @tc.desc   Resolve volume value 16-19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume160019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000318000)).assertEqual('10:00:318:000');
      expect(model.resolveIP(1000318000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000318000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume160020
     * @tc.number SUB_WLAN_VOLUME_16_0020
     * @tc.desc   Resolve volume value 16-20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume160020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000319000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('319');
      await Promise.resolve();
    })
  })
}
