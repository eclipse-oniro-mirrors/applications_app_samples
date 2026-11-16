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

export default function wlanVolume2Resolve24Test() {
  describe('WlanVolume2Resolve24Test', () => {

    /**
     * @tc.name   testWlanVol2240001
     * @tc.number SUB_WLAN_VOL2_24_0001
     * @tc.desc   Resolve second volume value 24-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2240001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600368000)).assertEqual('16:00:368:000');
      expect(model.resolveIP(1600368000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600368000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2240002
     * @tc.number SUB_WLAN_VOL2_24_0002
     * @tc.desc   Resolve second volume value 24-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2240002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600369000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('369');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2240003
     * @tc.number SUB_WLAN_VOL2_24_0003
     * @tc.desc   Resolve second volume value 24-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2240003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600370000)).assertEqual('16:00:370:000');
      expect(model.resolveIP(1600370000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600370000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2240004
     * @tc.number SUB_WLAN_VOL2_24_0004
     * @tc.desc   Resolve second volume value 24-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2240004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600371000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('371');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2240005
     * @tc.number SUB_WLAN_VOL2_24_0005
     * @tc.desc   Resolve second volume value 24-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2240005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600372000)).assertEqual('16:00:372:000');
      expect(model.resolveIP(1600372000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600372000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2240006
     * @tc.number SUB_WLAN_VOL2_24_0006
     * @tc.desc   Resolve second volume value 24-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2240006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600373000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('373');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2240007
     * @tc.number SUB_WLAN_VOL2_24_0007
     * @tc.desc   Resolve second volume value 24-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2240007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600374000)).assertEqual('16:00:374:000');
      expect(model.resolveIP(1600374000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600374000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2240008
     * @tc.number SUB_WLAN_VOL2_24_0008
     * @tc.desc   Resolve second volume value 24-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2240008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600375000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('375');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2240009
     * @tc.number SUB_WLAN_VOL2_24_0009
     * @tc.desc   Resolve second volume value 24-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2240009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600376000)).assertEqual('16:00:376:000');
      expect(model.resolveIP(1600376000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600376000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2240010
     * @tc.number SUB_WLAN_VOL2_24_0010
     * @tc.desc   Resolve second volume value 24-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2240010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600377000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('377');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2240011
     * @tc.number SUB_WLAN_VOL2_24_0011
     * @tc.desc   Resolve second volume value 24-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2240011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600378000)).assertEqual('16:00:378:000');
      expect(model.resolveIP(1600378000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600378000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2240012
     * @tc.number SUB_WLAN_VOL2_24_0012
     * @tc.desc   Resolve second volume value 24-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2240012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600379000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('379');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2240013
     * @tc.number SUB_WLAN_VOL2_24_0013
     * @tc.desc   Resolve second volume value 24-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2240013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600380000)).assertEqual('16:00:380:000');
      expect(model.resolveIP(1600380000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600380000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2240014
     * @tc.number SUB_WLAN_VOL2_24_0014
     * @tc.desc   Resolve second volume value 24-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2240014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600381000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('381');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2240015
     * @tc.number SUB_WLAN_VOL2_24_0015
     * @tc.desc   Resolve second volume value 24-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2240015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600382000)).assertEqual('16:00:382:000');
      expect(model.resolveIP(1600382000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600382000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2240016
     * @tc.number SUB_WLAN_VOL2_24_0016
     * @tc.desc   Resolve second volume value 24-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2240016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600383000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('383');
      await Promise.resolve();
    })
  })
}
