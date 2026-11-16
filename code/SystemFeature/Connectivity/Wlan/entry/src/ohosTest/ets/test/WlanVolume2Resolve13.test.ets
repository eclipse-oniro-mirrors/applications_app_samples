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

export default function wlanVolume2Resolve13Test() {
  describe('WlanVolume2Resolve13Test', () => {

    /**
     * @tc.name   testWlanVol2130001
     * @tc.number SUB_WLAN_VOL2_13_0001
     * @tc.desc   Resolve second volume value 13-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2130001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600192000)).assertEqual('16:00:192:000');
      expect(model.resolveIP(1600192000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600192000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2130002
     * @tc.number SUB_WLAN_VOL2_13_0002
     * @tc.desc   Resolve second volume value 13-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2130002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600193000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('193');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2130003
     * @tc.number SUB_WLAN_VOL2_13_0003
     * @tc.desc   Resolve second volume value 13-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2130003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600194000)).assertEqual('16:00:194:000');
      expect(model.resolveIP(1600194000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600194000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2130004
     * @tc.number SUB_WLAN_VOL2_13_0004
     * @tc.desc   Resolve second volume value 13-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2130004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600195000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('195');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2130005
     * @tc.number SUB_WLAN_VOL2_13_0005
     * @tc.desc   Resolve second volume value 13-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2130005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600196000)).assertEqual('16:00:196:000');
      expect(model.resolveIP(1600196000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600196000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2130006
     * @tc.number SUB_WLAN_VOL2_13_0006
     * @tc.desc   Resolve second volume value 13-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2130006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600197000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('197');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2130007
     * @tc.number SUB_WLAN_VOL2_13_0007
     * @tc.desc   Resolve second volume value 13-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2130007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600198000)).assertEqual('16:00:198:000');
      expect(model.resolveIP(1600198000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600198000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2130008
     * @tc.number SUB_WLAN_VOL2_13_0008
     * @tc.desc   Resolve second volume value 13-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2130008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600199000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('199');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2130009
     * @tc.number SUB_WLAN_VOL2_13_0009
     * @tc.desc   Resolve second volume value 13-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2130009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600200000)).assertEqual('16:00:200:000');
      expect(model.resolveIP(1600200000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600200000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2130010
     * @tc.number SUB_WLAN_VOL2_13_0010
     * @tc.desc   Resolve second volume value 13-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2130010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600201000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('201');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2130011
     * @tc.number SUB_WLAN_VOL2_13_0011
     * @tc.desc   Resolve second volume value 13-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2130011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600202000)).assertEqual('16:00:202:000');
      expect(model.resolveIP(1600202000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600202000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2130012
     * @tc.number SUB_WLAN_VOL2_13_0012
     * @tc.desc   Resolve second volume value 13-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2130012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600203000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('203');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2130013
     * @tc.number SUB_WLAN_VOL2_13_0013
     * @tc.desc   Resolve second volume value 13-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2130013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600204000)).assertEqual('16:00:204:000');
      expect(model.resolveIP(1600204000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600204000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2130014
     * @tc.number SUB_WLAN_VOL2_13_0014
     * @tc.desc   Resolve second volume value 13-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2130014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600205000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('205');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2130015
     * @tc.number SUB_WLAN_VOL2_13_0015
     * @tc.desc   Resolve second volume value 13-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2130015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600206000)).assertEqual('16:00:206:000');
      expect(model.resolveIP(1600206000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600206000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2130016
     * @tc.number SUB_WLAN_VOL2_13_0016
     * @tc.desc   Resolve second volume value 13-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2130016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600207000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('207');
      await Promise.resolve();
    })
  })
}
