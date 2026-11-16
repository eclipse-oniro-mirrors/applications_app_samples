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

export default function wlanVolume2Resolve22Test() {
  describe('WlanVolume2Resolve22Test', () => {

    /**
     * @tc.name   testWlanVol2220001
     * @tc.number SUB_WLAN_VOL2_22_0001
     * @tc.desc   Resolve second volume value 22-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2220001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600336000)).assertEqual('16:00:336:000');
      expect(model.resolveIP(1600336000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600336000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2220002
     * @tc.number SUB_WLAN_VOL2_22_0002
     * @tc.desc   Resolve second volume value 22-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2220002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600337000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('337');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2220003
     * @tc.number SUB_WLAN_VOL2_22_0003
     * @tc.desc   Resolve second volume value 22-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2220003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600338000)).assertEqual('16:00:338:000');
      expect(model.resolveIP(1600338000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600338000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2220004
     * @tc.number SUB_WLAN_VOL2_22_0004
     * @tc.desc   Resolve second volume value 22-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2220004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600339000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('339');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2220005
     * @tc.number SUB_WLAN_VOL2_22_0005
     * @tc.desc   Resolve second volume value 22-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2220005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600340000)).assertEqual('16:00:340:000');
      expect(model.resolveIP(1600340000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600340000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2220006
     * @tc.number SUB_WLAN_VOL2_22_0006
     * @tc.desc   Resolve second volume value 22-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2220006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600341000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('341');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2220007
     * @tc.number SUB_WLAN_VOL2_22_0007
     * @tc.desc   Resolve second volume value 22-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2220007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600342000)).assertEqual('16:00:342:000');
      expect(model.resolveIP(1600342000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600342000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2220008
     * @tc.number SUB_WLAN_VOL2_22_0008
     * @tc.desc   Resolve second volume value 22-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2220008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600343000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('343');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2220009
     * @tc.number SUB_WLAN_VOL2_22_0009
     * @tc.desc   Resolve second volume value 22-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2220009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600344000)).assertEqual('16:00:344:000');
      expect(model.resolveIP(1600344000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600344000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2220010
     * @tc.number SUB_WLAN_VOL2_22_0010
     * @tc.desc   Resolve second volume value 22-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2220010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600345000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('345');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2220011
     * @tc.number SUB_WLAN_VOL2_22_0011
     * @tc.desc   Resolve second volume value 22-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2220011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600346000)).assertEqual('16:00:346:000');
      expect(model.resolveIP(1600346000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600346000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2220012
     * @tc.number SUB_WLAN_VOL2_22_0012
     * @tc.desc   Resolve second volume value 22-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2220012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600347000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('347');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2220013
     * @tc.number SUB_WLAN_VOL2_22_0013
     * @tc.desc   Resolve second volume value 22-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2220013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600348000)).assertEqual('16:00:348:000');
      expect(model.resolveIP(1600348000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600348000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2220014
     * @tc.number SUB_WLAN_VOL2_22_0014
     * @tc.desc   Resolve second volume value 22-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2220014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600349000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('349');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2220015
     * @tc.number SUB_WLAN_VOL2_22_0015
     * @tc.desc   Resolve second volume value 22-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2220015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600350000)).assertEqual('16:00:350:000');
      expect(model.resolveIP(1600350000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600350000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2220016
     * @tc.number SUB_WLAN_VOL2_22_0016
     * @tc.desc   Resolve second volume value 22-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2220016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600351000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('351');
      await Promise.resolve();
    })
  })
}
