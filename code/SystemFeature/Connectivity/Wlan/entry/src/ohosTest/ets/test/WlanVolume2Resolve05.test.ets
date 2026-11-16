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

export default function wlanVolume2Resolve05Test() {
  describe('WlanVolume2Resolve05Test', () => {

    /**
     * @tc.name   testWlanVol2050001
     * @tc.number SUB_WLAN_VOL2_05_0001
     * @tc.desc   Resolve second volume value 5-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2050001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600064000)).assertEqual('16:00:064:000');
      expect(model.resolveIP(1600064000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600064000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2050002
     * @tc.number SUB_WLAN_VOL2_05_0002
     * @tc.desc   Resolve second volume value 5-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2050002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600065000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('065');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2050003
     * @tc.number SUB_WLAN_VOL2_05_0003
     * @tc.desc   Resolve second volume value 5-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2050003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600066000)).assertEqual('16:00:066:000');
      expect(model.resolveIP(1600066000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600066000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2050004
     * @tc.number SUB_WLAN_VOL2_05_0004
     * @tc.desc   Resolve second volume value 5-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2050004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600067000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('067');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2050005
     * @tc.number SUB_WLAN_VOL2_05_0005
     * @tc.desc   Resolve second volume value 5-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2050005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600068000)).assertEqual('16:00:068:000');
      expect(model.resolveIP(1600068000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600068000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2050006
     * @tc.number SUB_WLAN_VOL2_05_0006
     * @tc.desc   Resolve second volume value 5-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2050006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600069000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('069');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2050007
     * @tc.number SUB_WLAN_VOL2_05_0007
     * @tc.desc   Resolve second volume value 5-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2050007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600070000)).assertEqual('16:00:070:000');
      expect(model.resolveIP(1600070000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600070000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2050008
     * @tc.number SUB_WLAN_VOL2_05_0008
     * @tc.desc   Resolve second volume value 5-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2050008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600071000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('071');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2050009
     * @tc.number SUB_WLAN_VOL2_05_0009
     * @tc.desc   Resolve second volume value 5-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2050009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600072000)).assertEqual('16:00:072:000');
      expect(model.resolveIP(1600072000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600072000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2050010
     * @tc.number SUB_WLAN_VOL2_05_0010
     * @tc.desc   Resolve second volume value 5-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2050010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600073000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('073');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2050011
     * @tc.number SUB_WLAN_VOL2_05_0011
     * @tc.desc   Resolve second volume value 5-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2050011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600074000)).assertEqual('16:00:074:000');
      expect(model.resolveIP(1600074000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600074000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2050012
     * @tc.number SUB_WLAN_VOL2_05_0012
     * @tc.desc   Resolve second volume value 5-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2050012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600075000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('075');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2050013
     * @tc.number SUB_WLAN_VOL2_05_0013
     * @tc.desc   Resolve second volume value 5-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2050013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600076000)).assertEqual('16:00:076:000');
      expect(model.resolveIP(1600076000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600076000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2050014
     * @tc.number SUB_WLAN_VOL2_05_0014
     * @tc.desc   Resolve second volume value 5-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2050014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600077000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('077');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2050015
     * @tc.number SUB_WLAN_VOL2_05_0015
     * @tc.desc   Resolve second volume value 5-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2050015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600078000)).assertEqual('16:00:078:000');
      expect(model.resolveIP(1600078000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600078000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2050016
     * @tc.number SUB_WLAN_VOL2_05_0016
     * @tc.desc   Resolve second volume value 5-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2050016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600079000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('079');
      await Promise.resolve();
    })
  })
}
