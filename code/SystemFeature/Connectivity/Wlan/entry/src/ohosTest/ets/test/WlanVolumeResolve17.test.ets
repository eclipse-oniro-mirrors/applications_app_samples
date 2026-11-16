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

export default function wlanVolumeResolve17Test() {
  describe('WlanVolumeResolve17Test', () => {

    /**
     * @tc.name   testWlanVolume170001
     * @tc.number SUB_WLAN_VOLUME_17_0001
     * @tc.desc   Resolve volume value 17-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume170001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000320000)).assertEqual('10:00:320:000');
      expect(model.resolveIP(1000320000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000320000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume170002
     * @tc.number SUB_WLAN_VOLUME_17_0002
     * @tc.desc   Resolve volume value 17-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume170002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000321000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('321');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume170003
     * @tc.number SUB_WLAN_VOLUME_17_0003
     * @tc.desc   Resolve volume value 17-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume170003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000322000)).assertEqual('10:00:322:000');
      expect(model.resolveIP(1000322000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000322000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume170004
     * @tc.number SUB_WLAN_VOLUME_17_0004
     * @tc.desc   Resolve volume value 17-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume170004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000323000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('323');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume170005
     * @tc.number SUB_WLAN_VOLUME_17_0005
     * @tc.desc   Resolve volume value 17-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume170005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000324000)).assertEqual('10:00:324:000');
      expect(model.resolveIP(1000324000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000324000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume170006
     * @tc.number SUB_WLAN_VOLUME_17_0006
     * @tc.desc   Resolve volume value 17-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume170006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000325000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('325');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume170007
     * @tc.number SUB_WLAN_VOLUME_17_0007
     * @tc.desc   Resolve volume value 17-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume170007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000326000)).assertEqual('10:00:326:000');
      expect(model.resolveIP(1000326000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000326000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume170008
     * @tc.number SUB_WLAN_VOLUME_17_0008
     * @tc.desc   Resolve volume value 17-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume170008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000327000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('327');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume170009
     * @tc.number SUB_WLAN_VOLUME_17_0009
     * @tc.desc   Resolve volume value 17-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume170009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000328000)).assertEqual('10:00:328:000');
      expect(model.resolveIP(1000328000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000328000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume170010
     * @tc.number SUB_WLAN_VOLUME_17_0010
     * @tc.desc   Resolve volume value 17-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume170010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000329000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('329');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume170011
     * @tc.number SUB_WLAN_VOLUME_17_0011
     * @tc.desc   Resolve volume value 17-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume170011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000330000)).assertEqual('10:00:330:000');
      expect(model.resolveIP(1000330000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000330000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume170012
     * @tc.number SUB_WLAN_VOLUME_17_0012
     * @tc.desc   Resolve volume value 17-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume170012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000331000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('331');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume170013
     * @tc.number SUB_WLAN_VOLUME_17_0013
     * @tc.desc   Resolve volume value 17-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume170013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000332000)).assertEqual('10:00:332:000');
      expect(model.resolveIP(1000332000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000332000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume170014
     * @tc.number SUB_WLAN_VOLUME_17_0014
     * @tc.desc   Resolve volume value 17-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume170014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000333000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('333');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume170015
     * @tc.number SUB_WLAN_VOLUME_17_0015
     * @tc.desc   Resolve volume value 17-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume170015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000334000)).assertEqual('10:00:334:000');
      expect(model.resolveIP(1000334000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000334000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume170016
     * @tc.number SUB_WLAN_VOLUME_17_0016
     * @tc.desc   Resolve volume value 17-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume170016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000335000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('335');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume170017
     * @tc.number SUB_WLAN_VOLUME_17_0017
     * @tc.desc   Resolve volume value 17-17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume170017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000336000)).assertEqual('10:00:336:000');
      expect(model.resolveIP(1000336000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000336000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume170018
     * @tc.number SUB_WLAN_VOLUME_17_0018
     * @tc.desc   Resolve volume value 17-18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume170018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000337000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('337');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume170019
     * @tc.number SUB_WLAN_VOLUME_17_0019
     * @tc.desc   Resolve volume value 17-19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume170019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000338000)).assertEqual('10:00:338:000');
      expect(model.resolveIP(1000338000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000338000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume170020
     * @tc.number SUB_WLAN_VOLUME_17_0020
     * @tc.desc   Resolve volume value 17-20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume170020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000339000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('339');
      await Promise.resolve();
    })
  })
}
