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

export default function wlanVolume2Resolve04Test() {
  describe('WlanVolume2Resolve04Test', () => {

    /**
     * @tc.name   testWlanVol2040001
     * @tc.number SUB_WLAN_VOL2_04_0001
     * @tc.desc   Resolve second volume value 4-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2040001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600048000)).assertEqual('16:00:048:000');
      expect(model.resolveIP(1600048000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600048000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2040002
     * @tc.number SUB_WLAN_VOL2_04_0002
     * @tc.desc   Resolve second volume value 4-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2040002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600049000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('049');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2040003
     * @tc.number SUB_WLAN_VOL2_04_0003
     * @tc.desc   Resolve second volume value 4-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2040003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600050000)).assertEqual('16:00:050:000');
      expect(model.resolveIP(1600050000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600050000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2040004
     * @tc.number SUB_WLAN_VOL2_04_0004
     * @tc.desc   Resolve second volume value 4-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2040004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600051000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('051');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2040005
     * @tc.number SUB_WLAN_VOL2_04_0005
     * @tc.desc   Resolve second volume value 4-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2040005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600052000)).assertEqual('16:00:052:000');
      expect(model.resolveIP(1600052000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600052000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2040006
     * @tc.number SUB_WLAN_VOL2_04_0006
     * @tc.desc   Resolve second volume value 4-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2040006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600053000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('053');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2040007
     * @tc.number SUB_WLAN_VOL2_04_0007
     * @tc.desc   Resolve second volume value 4-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2040007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600054000)).assertEqual('16:00:054:000');
      expect(model.resolveIP(1600054000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600054000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2040008
     * @tc.number SUB_WLAN_VOL2_04_0008
     * @tc.desc   Resolve second volume value 4-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2040008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600055000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('055');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2040009
     * @tc.number SUB_WLAN_VOL2_04_0009
     * @tc.desc   Resolve second volume value 4-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2040009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600056000)).assertEqual('16:00:056:000');
      expect(model.resolveIP(1600056000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600056000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2040010
     * @tc.number SUB_WLAN_VOL2_04_0010
     * @tc.desc   Resolve second volume value 4-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2040010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600057000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('057');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2040011
     * @tc.number SUB_WLAN_VOL2_04_0011
     * @tc.desc   Resolve second volume value 4-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2040011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600058000)).assertEqual('16:00:058:000');
      expect(model.resolveIP(1600058000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600058000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2040012
     * @tc.number SUB_WLAN_VOL2_04_0012
     * @tc.desc   Resolve second volume value 4-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2040012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600059000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('059');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2040013
     * @tc.number SUB_WLAN_VOL2_04_0013
     * @tc.desc   Resolve second volume value 4-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2040013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600060000)).assertEqual('16:00:060:000');
      expect(model.resolveIP(1600060000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600060000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2040014
     * @tc.number SUB_WLAN_VOL2_04_0014
     * @tc.desc   Resolve second volume value 4-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2040014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600061000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('061');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2040015
     * @tc.number SUB_WLAN_VOL2_04_0015
     * @tc.desc   Resolve second volume value 4-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2040015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600062000)).assertEqual('16:00:062:000');
      expect(model.resolveIP(1600062000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600062000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2040016
     * @tc.number SUB_WLAN_VOL2_04_0016
     * @tc.desc   Resolve second volume value 4-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2040016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600063000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('063');
      await Promise.resolve();
    })
  })
}
