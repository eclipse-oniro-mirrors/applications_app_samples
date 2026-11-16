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

export default function wlanVolume2Resolve21Test() {
  describe('WlanVolume2Resolve21Test', () => {

    /**
     * @tc.name   testWlanVol2210001
     * @tc.number SUB_WLAN_VOL2_21_0001
     * @tc.desc   Resolve second volume value 21-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2210001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600320000)).assertEqual('16:00:320:000');
      expect(model.resolveIP(1600320000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600320000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2210002
     * @tc.number SUB_WLAN_VOL2_21_0002
     * @tc.desc   Resolve second volume value 21-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2210002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600321000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('321');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2210003
     * @tc.number SUB_WLAN_VOL2_21_0003
     * @tc.desc   Resolve second volume value 21-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2210003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600322000)).assertEqual('16:00:322:000');
      expect(model.resolveIP(1600322000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600322000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2210004
     * @tc.number SUB_WLAN_VOL2_21_0004
     * @tc.desc   Resolve second volume value 21-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2210004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600323000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('323');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2210005
     * @tc.number SUB_WLAN_VOL2_21_0005
     * @tc.desc   Resolve second volume value 21-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2210005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600324000)).assertEqual('16:00:324:000');
      expect(model.resolveIP(1600324000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600324000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2210006
     * @tc.number SUB_WLAN_VOL2_21_0006
     * @tc.desc   Resolve second volume value 21-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2210006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600325000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('325');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2210007
     * @tc.number SUB_WLAN_VOL2_21_0007
     * @tc.desc   Resolve second volume value 21-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2210007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600326000)).assertEqual('16:00:326:000');
      expect(model.resolveIP(1600326000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600326000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2210008
     * @tc.number SUB_WLAN_VOL2_21_0008
     * @tc.desc   Resolve second volume value 21-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2210008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600327000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('327');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2210009
     * @tc.number SUB_WLAN_VOL2_21_0009
     * @tc.desc   Resolve second volume value 21-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2210009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600328000)).assertEqual('16:00:328:000');
      expect(model.resolveIP(1600328000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600328000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2210010
     * @tc.number SUB_WLAN_VOL2_21_0010
     * @tc.desc   Resolve second volume value 21-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2210010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600329000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('329');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2210011
     * @tc.number SUB_WLAN_VOL2_21_0011
     * @tc.desc   Resolve second volume value 21-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2210011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600330000)).assertEqual('16:00:330:000');
      expect(model.resolveIP(1600330000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600330000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2210012
     * @tc.number SUB_WLAN_VOL2_21_0012
     * @tc.desc   Resolve second volume value 21-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2210012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600331000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('331');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2210013
     * @tc.number SUB_WLAN_VOL2_21_0013
     * @tc.desc   Resolve second volume value 21-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2210013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600332000)).assertEqual('16:00:332:000');
      expect(model.resolveIP(1600332000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600332000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2210014
     * @tc.number SUB_WLAN_VOL2_21_0014
     * @tc.desc   Resolve second volume value 21-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2210014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600333000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('333');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2210015
     * @tc.number SUB_WLAN_VOL2_21_0015
     * @tc.desc   Resolve second volume value 21-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2210015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600334000)).assertEqual('16:00:334:000');
      expect(model.resolveIP(1600334000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600334000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2210016
     * @tc.number SUB_WLAN_VOL2_21_0016
     * @tc.desc   Resolve second volume value 21-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2210016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600335000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('335');
      await Promise.resolve();
    })
  })
}
