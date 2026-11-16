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

export default function wlanVolume2Resolve06Test() {
  describe('WlanVolume2Resolve06Test', () => {

    /**
     * @tc.name   testWlanVol2060001
     * @tc.number SUB_WLAN_VOL2_06_0001
     * @tc.desc   Resolve second volume value 6-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2060001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600080000)).assertEqual('16:00:080:000');
      expect(model.resolveIP(1600080000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600080000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2060002
     * @tc.number SUB_WLAN_VOL2_06_0002
     * @tc.desc   Resolve second volume value 6-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2060002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600081000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('081');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2060003
     * @tc.number SUB_WLAN_VOL2_06_0003
     * @tc.desc   Resolve second volume value 6-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2060003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600082000)).assertEqual('16:00:082:000');
      expect(model.resolveIP(1600082000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600082000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2060004
     * @tc.number SUB_WLAN_VOL2_06_0004
     * @tc.desc   Resolve second volume value 6-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2060004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600083000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('083');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2060005
     * @tc.number SUB_WLAN_VOL2_06_0005
     * @tc.desc   Resolve second volume value 6-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2060005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600084000)).assertEqual('16:00:084:000');
      expect(model.resolveIP(1600084000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600084000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2060006
     * @tc.number SUB_WLAN_VOL2_06_0006
     * @tc.desc   Resolve second volume value 6-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2060006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600085000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('085');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2060007
     * @tc.number SUB_WLAN_VOL2_06_0007
     * @tc.desc   Resolve second volume value 6-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2060007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600086000)).assertEqual('16:00:086:000');
      expect(model.resolveIP(1600086000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600086000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2060008
     * @tc.number SUB_WLAN_VOL2_06_0008
     * @tc.desc   Resolve second volume value 6-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2060008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600087000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('087');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2060009
     * @tc.number SUB_WLAN_VOL2_06_0009
     * @tc.desc   Resolve second volume value 6-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2060009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600088000)).assertEqual('16:00:088:000');
      expect(model.resolveIP(1600088000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600088000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2060010
     * @tc.number SUB_WLAN_VOL2_06_0010
     * @tc.desc   Resolve second volume value 6-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2060010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600089000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('089');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2060011
     * @tc.number SUB_WLAN_VOL2_06_0011
     * @tc.desc   Resolve second volume value 6-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2060011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600090000)).assertEqual('16:00:090:000');
      expect(model.resolveIP(1600090000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600090000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2060012
     * @tc.number SUB_WLAN_VOL2_06_0012
     * @tc.desc   Resolve second volume value 6-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2060012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600091000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('091');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2060013
     * @tc.number SUB_WLAN_VOL2_06_0013
     * @tc.desc   Resolve second volume value 6-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2060013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600092000)).assertEqual('16:00:092:000');
      expect(model.resolveIP(1600092000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600092000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2060014
     * @tc.number SUB_WLAN_VOL2_06_0014
     * @tc.desc   Resolve second volume value 6-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2060014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600093000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('093');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2060015
     * @tc.number SUB_WLAN_VOL2_06_0015
     * @tc.desc   Resolve second volume value 6-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2060015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600094000)).assertEqual('16:00:094:000');
      expect(model.resolveIP(1600094000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600094000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2060016
     * @tc.number SUB_WLAN_VOL2_06_0016
     * @tc.desc   Resolve second volume value 6-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2060016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600095000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('095');
      await Promise.resolve();
    })
  })
}
