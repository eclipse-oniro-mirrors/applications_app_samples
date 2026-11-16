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

export default function wlanVolume2Resolve01Test() {
  describe('WlanVolume2Resolve01Test', () => {

    /**
     * @tc.name   testWlanVol2010001
     * @tc.number SUB_WLAN_VOL2_01_0001
     * @tc.desc   Resolve second volume value 1-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2010001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600000000)).assertEqual('16:00:000:000');
      expect(model.resolveIP(1600000000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600000000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2010002
     * @tc.number SUB_WLAN_VOL2_01_0002
     * @tc.desc   Resolve second volume value 1-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2010002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600001000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('001');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2010003
     * @tc.number SUB_WLAN_VOL2_01_0003
     * @tc.desc   Resolve second volume value 1-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2010003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600002000)).assertEqual('16:00:002:000');
      expect(model.resolveIP(1600002000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600002000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2010004
     * @tc.number SUB_WLAN_VOL2_01_0004
     * @tc.desc   Resolve second volume value 1-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2010004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600003000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('003');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2010005
     * @tc.number SUB_WLAN_VOL2_01_0005
     * @tc.desc   Resolve second volume value 1-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2010005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600004000)).assertEqual('16:00:004:000');
      expect(model.resolveIP(1600004000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600004000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2010006
     * @tc.number SUB_WLAN_VOL2_01_0006
     * @tc.desc   Resolve second volume value 1-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2010006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600005000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('005');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2010007
     * @tc.number SUB_WLAN_VOL2_01_0007
     * @tc.desc   Resolve second volume value 1-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2010007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600006000)).assertEqual('16:00:006:000');
      expect(model.resolveIP(1600006000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600006000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2010008
     * @tc.number SUB_WLAN_VOL2_01_0008
     * @tc.desc   Resolve second volume value 1-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2010008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600007000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('007');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2010009
     * @tc.number SUB_WLAN_VOL2_01_0009
     * @tc.desc   Resolve second volume value 1-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2010009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600008000)).assertEqual('16:00:008:000');
      expect(model.resolveIP(1600008000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600008000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2010010
     * @tc.number SUB_WLAN_VOL2_01_0010
     * @tc.desc   Resolve second volume value 1-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2010010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600009000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('009');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2010011
     * @tc.number SUB_WLAN_VOL2_01_0011
     * @tc.desc   Resolve second volume value 1-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2010011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600010000)).assertEqual('16:00:010:000');
      expect(model.resolveIP(1600010000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600010000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2010012
     * @tc.number SUB_WLAN_VOL2_01_0012
     * @tc.desc   Resolve second volume value 1-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2010012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600011000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('011');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2010013
     * @tc.number SUB_WLAN_VOL2_01_0013
     * @tc.desc   Resolve second volume value 1-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2010013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600012000)).assertEqual('16:00:012:000');
      expect(model.resolveIP(1600012000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600012000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2010014
     * @tc.number SUB_WLAN_VOL2_01_0014
     * @tc.desc   Resolve second volume value 1-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2010014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600013000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('013');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2010015
     * @tc.number SUB_WLAN_VOL2_01_0015
     * @tc.desc   Resolve second volume value 1-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2010015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600014000)).assertEqual('16:00:014:000');
      expect(model.resolveIP(1600014000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600014000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2010016
     * @tc.number SUB_WLAN_VOL2_01_0016
     * @tc.desc   Resolve second volume value 1-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2010016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600015000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('015');
      await Promise.resolve();
    })
  })
}
