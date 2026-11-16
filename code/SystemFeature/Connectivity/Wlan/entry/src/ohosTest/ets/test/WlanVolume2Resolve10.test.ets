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

export default function wlanVolume2Resolve10Test() {
  describe('WlanVolume2Resolve10Test', () => {

    /**
     * @tc.name   testWlanVol2100001
     * @tc.number SUB_WLAN_VOL2_10_0001
     * @tc.desc   Resolve second volume value 10-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2100001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600144000)).assertEqual('16:00:144:000');
      expect(model.resolveIP(1600144000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600144000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2100002
     * @tc.number SUB_WLAN_VOL2_10_0002
     * @tc.desc   Resolve second volume value 10-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2100002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600145000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('145');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2100003
     * @tc.number SUB_WLAN_VOL2_10_0003
     * @tc.desc   Resolve second volume value 10-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2100003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600146000)).assertEqual('16:00:146:000');
      expect(model.resolveIP(1600146000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600146000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2100004
     * @tc.number SUB_WLAN_VOL2_10_0004
     * @tc.desc   Resolve second volume value 10-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2100004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600147000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('147');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2100005
     * @tc.number SUB_WLAN_VOL2_10_0005
     * @tc.desc   Resolve second volume value 10-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2100005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600148000)).assertEqual('16:00:148:000');
      expect(model.resolveIP(1600148000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600148000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2100006
     * @tc.number SUB_WLAN_VOL2_10_0006
     * @tc.desc   Resolve second volume value 10-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2100006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600149000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('149');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2100007
     * @tc.number SUB_WLAN_VOL2_10_0007
     * @tc.desc   Resolve second volume value 10-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2100007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600150000)).assertEqual('16:00:150:000');
      expect(model.resolveIP(1600150000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600150000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2100008
     * @tc.number SUB_WLAN_VOL2_10_0008
     * @tc.desc   Resolve second volume value 10-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2100008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600151000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('151');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2100009
     * @tc.number SUB_WLAN_VOL2_10_0009
     * @tc.desc   Resolve second volume value 10-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2100009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600152000)).assertEqual('16:00:152:000');
      expect(model.resolveIP(1600152000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600152000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2100010
     * @tc.number SUB_WLAN_VOL2_10_0010
     * @tc.desc   Resolve second volume value 10-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2100010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600153000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('153');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2100011
     * @tc.number SUB_WLAN_VOL2_10_0011
     * @tc.desc   Resolve second volume value 10-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2100011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600154000)).assertEqual('16:00:154:000');
      expect(model.resolveIP(1600154000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600154000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2100012
     * @tc.number SUB_WLAN_VOL2_10_0012
     * @tc.desc   Resolve second volume value 10-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2100012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600155000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('155');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2100013
     * @tc.number SUB_WLAN_VOL2_10_0013
     * @tc.desc   Resolve second volume value 10-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2100013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600156000)).assertEqual('16:00:156:000');
      expect(model.resolveIP(1600156000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600156000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2100014
     * @tc.number SUB_WLAN_VOL2_10_0014
     * @tc.desc   Resolve second volume value 10-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2100014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600157000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('157');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2100015
     * @tc.number SUB_WLAN_VOL2_10_0015
     * @tc.desc   Resolve second volume value 10-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2100015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600158000)).assertEqual('16:00:158:000');
      expect(model.resolveIP(1600158000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600158000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2100016
     * @tc.number SUB_WLAN_VOL2_10_0016
     * @tc.desc   Resolve second volume value 10-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2100016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600159000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('159');
      await Promise.resolve();
    })
  })
}
