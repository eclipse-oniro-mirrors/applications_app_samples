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

export default function wlanVolume2Resolve27Test() {
  describe('WlanVolume2Resolve27Test', () => {

    /**
     * @tc.name   testWlanVol2270001
     * @tc.number SUB_WLAN_VOL2_27_0001
     * @tc.desc   Resolve second volume value 27-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2270001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600416000)).assertEqual('16:00:416:000');
      expect(model.resolveIP(1600416000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600416000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2270002
     * @tc.number SUB_WLAN_VOL2_27_0002
     * @tc.desc   Resolve second volume value 27-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2270002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600417000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('417');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2270003
     * @tc.number SUB_WLAN_VOL2_27_0003
     * @tc.desc   Resolve second volume value 27-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2270003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600418000)).assertEqual('16:00:418:000');
      expect(model.resolveIP(1600418000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600418000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2270004
     * @tc.number SUB_WLAN_VOL2_27_0004
     * @tc.desc   Resolve second volume value 27-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2270004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600419000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('419');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2270005
     * @tc.number SUB_WLAN_VOL2_27_0005
     * @tc.desc   Resolve second volume value 27-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2270005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600420000)).assertEqual('16:00:420:000');
      expect(model.resolveIP(1600420000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600420000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2270006
     * @tc.number SUB_WLAN_VOL2_27_0006
     * @tc.desc   Resolve second volume value 27-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2270006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600421000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('421');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2270007
     * @tc.number SUB_WLAN_VOL2_27_0007
     * @tc.desc   Resolve second volume value 27-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2270007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600422000)).assertEqual('16:00:422:000');
      expect(model.resolveIP(1600422000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600422000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2270008
     * @tc.number SUB_WLAN_VOL2_27_0008
     * @tc.desc   Resolve second volume value 27-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2270008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600423000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('423');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2270009
     * @tc.number SUB_WLAN_VOL2_27_0009
     * @tc.desc   Resolve second volume value 27-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2270009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600424000)).assertEqual('16:00:424:000');
      expect(model.resolveIP(1600424000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600424000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2270010
     * @tc.number SUB_WLAN_VOL2_27_0010
     * @tc.desc   Resolve second volume value 27-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2270010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600425000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('425');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2270011
     * @tc.number SUB_WLAN_VOL2_27_0011
     * @tc.desc   Resolve second volume value 27-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2270011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600426000)).assertEqual('16:00:426:000');
      expect(model.resolveIP(1600426000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600426000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2270012
     * @tc.number SUB_WLAN_VOL2_27_0012
     * @tc.desc   Resolve second volume value 27-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2270012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600427000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('427');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2270013
     * @tc.number SUB_WLAN_VOL2_27_0013
     * @tc.desc   Resolve second volume value 27-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2270013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600428000)).assertEqual('16:00:428:000');
      expect(model.resolveIP(1600428000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600428000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2270014
     * @tc.number SUB_WLAN_VOL2_27_0014
     * @tc.desc   Resolve second volume value 27-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2270014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600429000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('429');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2270015
     * @tc.number SUB_WLAN_VOL2_27_0015
     * @tc.desc   Resolve second volume value 27-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2270015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600430000)).assertEqual('16:00:430:000');
      expect(model.resolveIP(1600430000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600430000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2270016
     * @tc.number SUB_WLAN_VOL2_27_0016
     * @tc.desc   Resolve second volume value 27-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2270016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600431000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('431');
      await Promise.resolve();
    })
  })
}
