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

export default function wlanVolume2Resolve25Test() {
  describe('WlanVolume2Resolve25Test', () => {

    /**
     * @tc.name   testWlanVol2250001
     * @tc.number SUB_WLAN_VOL2_25_0001
     * @tc.desc   Resolve second volume value 25-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2250001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600384000)).assertEqual('16:00:384:000');
      expect(model.resolveIP(1600384000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600384000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2250002
     * @tc.number SUB_WLAN_VOL2_25_0002
     * @tc.desc   Resolve second volume value 25-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2250002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600385000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('385');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2250003
     * @tc.number SUB_WLAN_VOL2_25_0003
     * @tc.desc   Resolve second volume value 25-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2250003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600386000)).assertEqual('16:00:386:000');
      expect(model.resolveIP(1600386000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600386000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2250004
     * @tc.number SUB_WLAN_VOL2_25_0004
     * @tc.desc   Resolve second volume value 25-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2250004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600387000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('387');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2250005
     * @tc.number SUB_WLAN_VOL2_25_0005
     * @tc.desc   Resolve second volume value 25-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2250005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600388000)).assertEqual('16:00:388:000');
      expect(model.resolveIP(1600388000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600388000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2250006
     * @tc.number SUB_WLAN_VOL2_25_0006
     * @tc.desc   Resolve second volume value 25-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2250006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600389000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('389');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2250007
     * @tc.number SUB_WLAN_VOL2_25_0007
     * @tc.desc   Resolve second volume value 25-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2250007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600390000)).assertEqual('16:00:390:000');
      expect(model.resolveIP(1600390000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600390000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2250008
     * @tc.number SUB_WLAN_VOL2_25_0008
     * @tc.desc   Resolve second volume value 25-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2250008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600391000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('391');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2250009
     * @tc.number SUB_WLAN_VOL2_25_0009
     * @tc.desc   Resolve second volume value 25-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2250009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600392000)).assertEqual('16:00:392:000');
      expect(model.resolveIP(1600392000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600392000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2250010
     * @tc.number SUB_WLAN_VOL2_25_0010
     * @tc.desc   Resolve second volume value 25-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2250010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600393000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('393');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2250011
     * @tc.number SUB_WLAN_VOL2_25_0011
     * @tc.desc   Resolve second volume value 25-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2250011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600394000)).assertEqual('16:00:394:000');
      expect(model.resolveIP(1600394000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600394000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2250012
     * @tc.number SUB_WLAN_VOL2_25_0012
     * @tc.desc   Resolve second volume value 25-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2250012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600395000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('395');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2250013
     * @tc.number SUB_WLAN_VOL2_25_0013
     * @tc.desc   Resolve second volume value 25-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2250013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600396000)).assertEqual('16:00:396:000');
      expect(model.resolveIP(1600396000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600396000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2250014
     * @tc.number SUB_WLAN_VOL2_25_0014
     * @tc.desc   Resolve second volume value 25-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2250014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600397000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('397');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2250015
     * @tc.number SUB_WLAN_VOL2_25_0015
     * @tc.desc   Resolve second volume value 25-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2250015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600398000)).assertEqual('16:00:398:000');
      expect(model.resolveIP(1600398000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600398000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2250016
     * @tc.number SUB_WLAN_VOL2_25_0016
     * @tc.desc   Resolve second volume value 25-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2250016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600399000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('399');
      await Promise.resolve();
    })
  })
}
