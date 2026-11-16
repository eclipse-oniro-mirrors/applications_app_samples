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

export default function wlanVolume2Resolve29Test() {
  describe('WlanVolume2Resolve29Test', () => {

    /**
     * @tc.name   testWlanVol2290001
     * @tc.number SUB_WLAN_VOL2_29_0001
     * @tc.desc   Resolve second volume value 29-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2290001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600448000)).assertEqual('16:00:448:000');
      expect(model.resolveIP(1600448000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600448000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2290002
     * @tc.number SUB_WLAN_VOL2_29_0002
     * @tc.desc   Resolve second volume value 29-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2290002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600449000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('449');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2290003
     * @tc.number SUB_WLAN_VOL2_29_0003
     * @tc.desc   Resolve second volume value 29-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2290003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600450000)).assertEqual('16:00:450:000');
      expect(model.resolveIP(1600450000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600450000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2290004
     * @tc.number SUB_WLAN_VOL2_29_0004
     * @tc.desc   Resolve second volume value 29-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2290004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600451000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('451');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2290005
     * @tc.number SUB_WLAN_VOL2_29_0005
     * @tc.desc   Resolve second volume value 29-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2290005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600452000)).assertEqual('16:00:452:000');
      expect(model.resolveIP(1600452000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600452000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2290006
     * @tc.number SUB_WLAN_VOL2_29_0006
     * @tc.desc   Resolve second volume value 29-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2290006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600453000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('453');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2290007
     * @tc.number SUB_WLAN_VOL2_29_0007
     * @tc.desc   Resolve second volume value 29-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2290007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600454000)).assertEqual('16:00:454:000');
      expect(model.resolveIP(1600454000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600454000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2290008
     * @tc.number SUB_WLAN_VOL2_29_0008
     * @tc.desc   Resolve second volume value 29-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2290008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600455000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('455');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2290009
     * @tc.number SUB_WLAN_VOL2_29_0009
     * @tc.desc   Resolve second volume value 29-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2290009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600456000)).assertEqual('16:00:456:000');
      expect(model.resolveIP(1600456000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600456000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2290010
     * @tc.number SUB_WLAN_VOL2_29_0010
     * @tc.desc   Resolve second volume value 29-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2290010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600457000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('457');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2290011
     * @tc.number SUB_WLAN_VOL2_29_0011
     * @tc.desc   Resolve second volume value 29-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2290011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600458000)).assertEqual('16:00:458:000');
      expect(model.resolveIP(1600458000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600458000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2290012
     * @tc.number SUB_WLAN_VOL2_29_0012
     * @tc.desc   Resolve second volume value 29-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2290012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600459000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('459');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2290013
     * @tc.number SUB_WLAN_VOL2_29_0013
     * @tc.desc   Resolve second volume value 29-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2290013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600460000)).assertEqual('16:00:460:000');
      expect(model.resolveIP(1600460000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600460000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2290014
     * @tc.number SUB_WLAN_VOL2_29_0014
     * @tc.desc   Resolve second volume value 29-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2290014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600461000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('461');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2290015
     * @tc.number SUB_WLAN_VOL2_29_0015
     * @tc.desc   Resolve second volume value 29-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2290015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600462000)).assertEqual('16:00:462:000');
      expect(model.resolveIP(1600462000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600462000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2290016
     * @tc.number SUB_WLAN_VOL2_29_0016
     * @tc.desc   Resolve second volume value 29-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2290016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600463000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('463');
      await Promise.resolve();
    })
  })
}
