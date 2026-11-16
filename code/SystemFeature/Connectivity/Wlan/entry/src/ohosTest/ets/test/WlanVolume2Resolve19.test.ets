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

export default function wlanVolume2Resolve19Test() {
  describe('WlanVolume2Resolve19Test', () => {

    /**
     * @tc.name   testWlanVol2190001
     * @tc.number SUB_WLAN_VOL2_19_0001
     * @tc.desc   Resolve second volume value 19-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2190001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600288000)).assertEqual('16:00:288:000');
      expect(model.resolveIP(1600288000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600288000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2190002
     * @tc.number SUB_WLAN_VOL2_19_0002
     * @tc.desc   Resolve second volume value 19-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2190002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600289000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('289');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2190003
     * @tc.number SUB_WLAN_VOL2_19_0003
     * @tc.desc   Resolve second volume value 19-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2190003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600290000)).assertEqual('16:00:290:000');
      expect(model.resolveIP(1600290000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600290000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2190004
     * @tc.number SUB_WLAN_VOL2_19_0004
     * @tc.desc   Resolve second volume value 19-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2190004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600291000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('291');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2190005
     * @tc.number SUB_WLAN_VOL2_19_0005
     * @tc.desc   Resolve second volume value 19-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2190005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600292000)).assertEqual('16:00:292:000');
      expect(model.resolveIP(1600292000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600292000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2190006
     * @tc.number SUB_WLAN_VOL2_19_0006
     * @tc.desc   Resolve second volume value 19-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2190006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600293000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('293');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2190007
     * @tc.number SUB_WLAN_VOL2_19_0007
     * @tc.desc   Resolve second volume value 19-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2190007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600294000)).assertEqual('16:00:294:000');
      expect(model.resolveIP(1600294000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600294000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2190008
     * @tc.number SUB_WLAN_VOL2_19_0008
     * @tc.desc   Resolve second volume value 19-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2190008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600295000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('295');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2190009
     * @tc.number SUB_WLAN_VOL2_19_0009
     * @tc.desc   Resolve second volume value 19-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2190009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600296000)).assertEqual('16:00:296:000');
      expect(model.resolveIP(1600296000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600296000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2190010
     * @tc.number SUB_WLAN_VOL2_19_0010
     * @tc.desc   Resolve second volume value 19-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2190010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600297000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('297');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2190011
     * @tc.number SUB_WLAN_VOL2_19_0011
     * @tc.desc   Resolve second volume value 19-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2190011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600298000)).assertEqual('16:00:298:000');
      expect(model.resolveIP(1600298000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600298000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2190012
     * @tc.number SUB_WLAN_VOL2_19_0012
     * @tc.desc   Resolve second volume value 19-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2190012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600299000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('299');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2190013
     * @tc.number SUB_WLAN_VOL2_19_0013
     * @tc.desc   Resolve second volume value 19-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2190013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600300000)).assertEqual('16:00:300:000');
      expect(model.resolveIP(1600300000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600300000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2190014
     * @tc.number SUB_WLAN_VOL2_19_0014
     * @tc.desc   Resolve second volume value 19-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2190014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600301000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('301');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2190015
     * @tc.number SUB_WLAN_VOL2_19_0015
     * @tc.desc   Resolve second volume value 19-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2190015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600302000)).assertEqual('16:00:302:000');
      expect(model.resolveIP(1600302000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600302000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2190016
     * @tc.number SUB_WLAN_VOL2_19_0016
     * @tc.desc   Resolve second volume value 19-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2190016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600303000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('303');
      await Promise.resolve();
    })
  })
}
