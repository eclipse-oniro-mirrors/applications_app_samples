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

export default function wlanVolumeResolve07Test() {
  describe('WlanVolumeResolve07Test', () => {

    /**
     * @tc.name   testWlanVolume070001
     * @tc.number SUB_WLAN_VOLUME_07_0001
     * @tc.desc   Resolve volume value 7-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume070001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000120000)).assertEqual('10:00:120:000');
      expect(model.resolveIP(1000120000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000120000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume070002
     * @tc.number SUB_WLAN_VOLUME_07_0002
     * @tc.desc   Resolve volume value 7-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume070002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000121000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('121');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume070003
     * @tc.number SUB_WLAN_VOLUME_07_0003
     * @tc.desc   Resolve volume value 7-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume070003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000122000)).assertEqual('10:00:122:000');
      expect(model.resolveIP(1000122000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000122000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume070004
     * @tc.number SUB_WLAN_VOLUME_07_0004
     * @tc.desc   Resolve volume value 7-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume070004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000123000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('123');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume070005
     * @tc.number SUB_WLAN_VOLUME_07_0005
     * @tc.desc   Resolve volume value 7-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume070005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000124000)).assertEqual('10:00:124:000');
      expect(model.resolveIP(1000124000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000124000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume070006
     * @tc.number SUB_WLAN_VOLUME_07_0006
     * @tc.desc   Resolve volume value 7-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume070006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000125000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('125');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume070007
     * @tc.number SUB_WLAN_VOLUME_07_0007
     * @tc.desc   Resolve volume value 7-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume070007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000126000)).assertEqual('10:00:126:000');
      expect(model.resolveIP(1000126000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000126000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume070008
     * @tc.number SUB_WLAN_VOLUME_07_0008
     * @tc.desc   Resolve volume value 7-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume070008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000127000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('127');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume070009
     * @tc.number SUB_WLAN_VOLUME_07_0009
     * @tc.desc   Resolve volume value 7-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume070009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000128000)).assertEqual('10:00:128:000');
      expect(model.resolveIP(1000128000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000128000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume070010
     * @tc.number SUB_WLAN_VOLUME_07_0010
     * @tc.desc   Resolve volume value 7-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume070010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000129000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('129');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume070011
     * @tc.number SUB_WLAN_VOLUME_07_0011
     * @tc.desc   Resolve volume value 7-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume070011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000130000)).assertEqual('10:00:130:000');
      expect(model.resolveIP(1000130000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000130000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume070012
     * @tc.number SUB_WLAN_VOLUME_07_0012
     * @tc.desc   Resolve volume value 7-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume070012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000131000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('131');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume070013
     * @tc.number SUB_WLAN_VOLUME_07_0013
     * @tc.desc   Resolve volume value 7-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume070013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000132000)).assertEqual('10:00:132:000');
      expect(model.resolveIP(1000132000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000132000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume070014
     * @tc.number SUB_WLAN_VOLUME_07_0014
     * @tc.desc   Resolve volume value 7-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume070014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000133000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('133');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume070015
     * @tc.number SUB_WLAN_VOLUME_07_0015
     * @tc.desc   Resolve volume value 7-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume070015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000134000)).assertEqual('10:00:134:000');
      expect(model.resolveIP(1000134000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000134000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume070016
     * @tc.number SUB_WLAN_VOLUME_07_0016
     * @tc.desc   Resolve volume value 7-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume070016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000135000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('135');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume070017
     * @tc.number SUB_WLAN_VOLUME_07_0017
     * @tc.desc   Resolve volume value 7-17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume070017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000136000)).assertEqual('10:00:136:000');
      expect(model.resolveIP(1000136000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000136000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume070018
     * @tc.number SUB_WLAN_VOLUME_07_0018
     * @tc.desc   Resolve volume value 7-18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume070018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000137000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('137');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume070019
     * @tc.number SUB_WLAN_VOLUME_07_0019
     * @tc.desc   Resolve volume value 7-19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume070019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000138000)).assertEqual('10:00:138:000');
      expect(model.resolveIP(1000138000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000138000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume070020
     * @tc.number SUB_WLAN_VOLUME_07_0020
     * @tc.desc   Resolve volume value 7-20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume070020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000139000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('139');
      await Promise.resolve();
    })
  })
}
