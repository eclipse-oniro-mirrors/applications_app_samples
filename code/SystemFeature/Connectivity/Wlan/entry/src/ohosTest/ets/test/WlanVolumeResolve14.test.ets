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

export default function wlanVolumeResolve14Test() {
  describe('WlanVolumeResolve14Test', () => {

    /**
     * @tc.name   testWlanVolume140001
     * @tc.number SUB_WLAN_VOLUME_14_0001
     * @tc.desc   Resolve volume value 14-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume140001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000260000)).assertEqual('10:00:260:000');
      expect(model.resolveIP(1000260000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000260000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume140002
     * @tc.number SUB_WLAN_VOLUME_14_0002
     * @tc.desc   Resolve volume value 14-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume140002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000261000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('261');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume140003
     * @tc.number SUB_WLAN_VOLUME_14_0003
     * @tc.desc   Resolve volume value 14-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume140003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000262000)).assertEqual('10:00:262:000');
      expect(model.resolveIP(1000262000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000262000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume140004
     * @tc.number SUB_WLAN_VOLUME_14_0004
     * @tc.desc   Resolve volume value 14-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume140004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000263000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('263');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume140005
     * @tc.number SUB_WLAN_VOLUME_14_0005
     * @tc.desc   Resolve volume value 14-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume140005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000264000)).assertEqual('10:00:264:000');
      expect(model.resolveIP(1000264000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000264000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume140006
     * @tc.number SUB_WLAN_VOLUME_14_0006
     * @tc.desc   Resolve volume value 14-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume140006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000265000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('265');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume140007
     * @tc.number SUB_WLAN_VOLUME_14_0007
     * @tc.desc   Resolve volume value 14-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume140007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000266000)).assertEqual('10:00:266:000');
      expect(model.resolveIP(1000266000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000266000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume140008
     * @tc.number SUB_WLAN_VOLUME_14_0008
     * @tc.desc   Resolve volume value 14-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume140008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000267000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('267');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume140009
     * @tc.number SUB_WLAN_VOLUME_14_0009
     * @tc.desc   Resolve volume value 14-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume140009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000268000)).assertEqual('10:00:268:000');
      expect(model.resolveIP(1000268000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000268000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume140010
     * @tc.number SUB_WLAN_VOLUME_14_0010
     * @tc.desc   Resolve volume value 14-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume140010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000269000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('269');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume140011
     * @tc.number SUB_WLAN_VOLUME_14_0011
     * @tc.desc   Resolve volume value 14-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume140011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000270000)).assertEqual('10:00:270:000');
      expect(model.resolveIP(1000270000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000270000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume140012
     * @tc.number SUB_WLAN_VOLUME_14_0012
     * @tc.desc   Resolve volume value 14-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume140012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000271000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('271');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume140013
     * @tc.number SUB_WLAN_VOLUME_14_0013
     * @tc.desc   Resolve volume value 14-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume140013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000272000)).assertEqual('10:00:272:000');
      expect(model.resolveIP(1000272000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000272000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume140014
     * @tc.number SUB_WLAN_VOLUME_14_0014
     * @tc.desc   Resolve volume value 14-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume140014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000273000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('273');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume140015
     * @tc.number SUB_WLAN_VOLUME_14_0015
     * @tc.desc   Resolve volume value 14-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume140015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000274000)).assertEqual('10:00:274:000');
      expect(model.resolveIP(1000274000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000274000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume140016
     * @tc.number SUB_WLAN_VOLUME_14_0016
     * @tc.desc   Resolve volume value 14-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume140016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000275000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('275');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume140017
     * @tc.number SUB_WLAN_VOLUME_14_0017
     * @tc.desc   Resolve volume value 14-17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume140017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000276000)).assertEqual('10:00:276:000');
      expect(model.resolveIP(1000276000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000276000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume140018
     * @tc.number SUB_WLAN_VOLUME_14_0018
     * @tc.desc   Resolve volume value 14-18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume140018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000277000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('277');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume140019
     * @tc.number SUB_WLAN_VOLUME_14_0019
     * @tc.desc   Resolve volume value 14-19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume140019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000278000)).assertEqual('10:00:278:000');
      expect(model.resolveIP(1000278000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000278000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume140020
     * @tc.number SUB_WLAN_VOLUME_14_0020
     * @tc.desc   Resolve volume value 14-20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume140020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000279000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('279');
      await Promise.resolve();
    })
  })
}
