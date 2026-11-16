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

export default function wlanVolume2Resolve17Test() {
  describe('WlanVolume2Resolve17Test', () => {

    /**
     * @tc.name   testWlanVol2170001
     * @tc.number SUB_WLAN_VOL2_17_0001
     * @tc.desc   Resolve second volume value 17-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2170001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600256000)).assertEqual('16:00:256:000');
      expect(model.resolveIP(1600256000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600256000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2170002
     * @tc.number SUB_WLAN_VOL2_17_0002
     * @tc.desc   Resolve second volume value 17-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2170002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600257000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('257');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2170003
     * @tc.number SUB_WLAN_VOL2_17_0003
     * @tc.desc   Resolve second volume value 17-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2170003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600258000)).assertEqual('16:00:258:000');
      expect(model.resolveIP(1600258000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600258000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2170004
     * @tc.number SUB_WLAN_VOL2_17_0004
     * @tc.desc   Resolve second volume value 17-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2170004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600259000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('259');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2170005
     * @tc.number SUB_WLAN_VOL2_17_0005
     * @tc.desc   Resolve second volume value 17-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2170005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600260000)).assertEqual('16:00:260:000');
      expect(model.resolveIP(1600260000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600260000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2170006
     * @tc.number SUB_WLAN_VOL2_17_0006
     * @tc.desc   Resolve second volume value 17-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2170006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600261000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('261');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2170007
     * @tc.number SUB_WLAN_VOL2_17_0007
     * @tc.desc   Resolve second volume value 17-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2170007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600262000)).assertEqual('16:00:262:000');
      expect(model.resolveIP(1600262000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600262000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2170008
     * @tc.number SUB_WLAN_VOL2_17_0008
     * @tc.desc   Resolve second volume value 17-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2170008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600263000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('263');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2170009
     * @tc.number SUB_WLAN_VOL2_17_0009
     * @tc.desc   Resolve second volume value 17-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2170009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600264000)).assertEqual('16:00:264:000');
      expect(model.resolveIP(1600264000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600264000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2170010
     * @tc.number SUB_WLAN_VOL2_17_0010
     * @tc.desc   Resolve second volume value 17-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2170010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600265000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('265');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2170011
     * @tc.number SUB_WLAN_VOL2_17_0011
     * @tc.desc   Resolve second volume value 17-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2170011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600266000)).assertEqual('16:00:266:000');
      expect(model.resolveIP(1600266000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600266000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2170012
     * @tc.number SUB_WLAN_VOL2_17_0012
     * @tc.desc   Resolve second volume value 17-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2170012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600267000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('267');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2170013
     * @tc.number SUB_WLAN_VOL2_17_0013
     * @tc.desc   Resolve second volume value 17-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2170013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600268000)).assertEqual('16:00:268:000');
      expect(model.resolveIP(1600268000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600268000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2170014
     * @tc.number SUB_WLAN_VOL2_17_0014
     * @tc.desc   Resolve second volume value 17-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2170014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600269000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('269');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2170015
     * @tc.number SUB_WLAN_VOL2_17_0015
     * @tc.desc   Resolve second volume value 17-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2170015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600270000)).assertEqual('16:00:270:000');
      expect(model.resolveIP(1600270000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600270000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2170016
     * @tc.number SUB_WLAN_VOL2_17_0016
     * @tc.desc   Resolve second volume value 17-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2170016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600271000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('271');
      await Promise.resolve();
    })
  })
}
