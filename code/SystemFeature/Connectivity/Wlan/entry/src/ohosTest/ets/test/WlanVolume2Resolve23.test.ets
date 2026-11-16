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

export default function wlanVolume2Resolve23Test() {
  describe('WlanVolume2Resolve23Test', () => {

    /**
     * @tc.name   testWlanVol2230001
     * @tc.number SUB_WLAN_VOL2_23_0001
     * @tc.desc   Resolve second volume value 23-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2230001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600352000)).assertEqual('16:00:352:000');
      expect(model.resolveIP(1600352000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600352000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2230002
     * @tc.number SUB_WLAN_VOL2_23_0002
     * @tc.desc   Resolve second volume value 23-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2230002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600353000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('353');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2230003
     * @tc.number SUB_WLAN_VOL2_23_0003
     * @tc.desc   Resolve second volume value 23-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2230003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600354000)).assertEqual('16:00:354:000');
      expect(model.resolveIP(1600354000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600354000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2230004
     * @tc.number SUB_WLAN_VOL2_23_0004
     * @tc.desc   Resolve second volume value 23-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2230004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600355000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('355');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2230005
     * @tc.number SUB_WLAN_VOL2_23_0005
     * @tc.desc   Resolve second volume value 23-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2230005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600356000)).assertEqual('16:00:356:000');
      expect(model.resolveIP(1600356000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600356000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2230006
     * @tc.number SUB_WLAN_VOL2_23_0006
     * @tc.desc   Resolve second volume value 23-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2230006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600357000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('357');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2230007
     * @tc.number SUB_WLAN_VOL2_23_0007
     * @tc.desc   Resolve second volume value 23-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2230007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600358000)).assertEqual('16:00:358:000');
      expect(model.resolveIP(1600358000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600358000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2230008
     * @tc.number SUB_WLAN_VOL2_23_0008
     * @tc.desc   Resolve second volume value 23-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2230008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600359000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('359');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2230009
     * @tc.number SUB_WLAN_VOL2_23_0009
     * @tc.desc   Resolve second volume value 23-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2230009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600360000)).assertEqual('16:00:360:000');
      expect(model.resolveIP(1600360000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600360000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2230010
     * @tc.number SUB_WLAN_VOL2_23_0010
     * @tc.desc   Resolve second volume value 23-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2230010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600361000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('361');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2230011
     * @tc.number SUB_WLAN_VOL2_23_0011
     * @tc.desc   Resolve second volume value 23-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2230011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600362000)).assertEqual('16:00:362:000');
      expect(model.resolveIP(1600362000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600362000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2230012
     * @tc.number SUB_WLAN_VOL2_23_0012
     * @tc.desc   Resolve second volume value 23-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2230012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600363000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('363');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2230013
     * @tc.number SUB_WLAN_VOL2_23_0013
     * @tc.desc   Resolve second volume value 23-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2230013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600364000)).assertEqual('16:00:364:000');
      expect(model.resolveIP(1600364000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600364000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2230014
     * @tc.number SUB_WLAN_VOL2_23_0014
     * @tc.desc   Resolve second volume value 23-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2230014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600365000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('365');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2230015
     * @tc.number SUB_WLAN_VOL2_23_0015
     * @tc.desc   Resolve second volume value 23-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2230015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600366000)).assertEqual('16:00:366:000');
      expect(model.resolveIP(1600366000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600366000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2230016
     * @tc.number SUB_WLAN_VOL2_23_0016
     * @tc.desc   Resolve second volume value 23-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2230016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600367000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('367');
      await Promise.resolve();
    })
  })
}
