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

export default function wlanVolume2Resolve09Test() {
  describe('WlanVolume2Resolve09Test', () => {

    /**
     * @tc.name   testWlanVol2090001
     * @tc.number SUB_WLAN_VOL2_09_0001
     * @tc.desc   Resolve second volume value 9-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2090001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600128000)).assertEqual('16:00:128:000');
      expect(model.resolveIP(1600128000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600128000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2090002
     * @tc.number SUB_WLAN_VOL2_09_0002
     * @tc.desc   Resolve second volume value 9-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2090002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600129000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('129');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2090003
     * @tc.number SUB_WLAN_VOL2_09_0003
     * @tc.desc   Resolve second volume value 9-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2090003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600130000)).assertEqual('16:00:130:000');
      expect(model.resolveIP(1600130000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600130000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2090004
     * @tc.number SUB_WLAN_VOL2_09_0004
     * @tc.desc   Resolve second volume value 9-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2090004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600131000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('131');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2090005
     * @tc.number SUB_WLAN_VOL2_09_0005
     * @tc.desc   Resolve second volume value 9-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2090005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600132000)).assertEqual('16:00:132:000');
      expect(model.resolveIP(1600132000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600132000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2090006
     * @tc.number SUB_WLAN_VOL2_09_0006
     * @tc.desc   Resolve second volume value 9-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2090006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600133000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('133');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2090007
     * @tc.number SUB_WLAN_VOL2_09_0007
     * @tc.desc   Resolve second volume value 9-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2090007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600134000)).assertEqual('16:00:134:000');
      expect(model.resolveIP(1600134000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600134000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2090008
     * @tc.number SUB_WLAN_VOL2_09_0008
     * @tc.desc   Resolve second volume value 9-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2090008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600135000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('135');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2090009
     * @tc.number SUB_WLAN_VOL2_09_0009
     * @tc.desc   Resolve second volume value 9-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2090009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600136000)).assertEqual('16:00:136:000');
      expect(model.resolveIP(1600136000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600136000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2090010
     * @tc.number SUB_WLAN_VOL2_09_0010
     * @tc.desc   Resolve second volume value 9-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2090010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600137000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('137');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2090011
     * @tc.number SUB_WLAN_VOL2_09_0011
     * @tc.desc   Resolve second volume value 9-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2090011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600138000)).assertEqual('16:00:138:000');
      expect(model.resolveIP(1600138000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600138000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2090012
     * @tc.number SUB_WLAN_VOL2_09_0012
     * @tc.desc   Resolve second volume value 9-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2090012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600139000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('139');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2090013
     * @tc.number SUB_WLAN_VOL2_09_0013
     * @tc.desc   Resolve second volume value 9-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2090013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600140000)).assertEqual('16:00:140:000');
      expect(model.resolveIP(1600140000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600140000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2090014
     * @tc.number SUB_WLAN_VOL2_09_0014
     * @tc.desc   Resolve second volume value 9-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2090014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600141000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('141');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2090015
     * @tc.number SUB_WLAN_VOL2_09_0015
     * @tc.desc   Resolve second volume value 9-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2090015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600142000)).assertEqual('16:00:142:000');
      expect(model.resolveIP(1600142000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600142000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2090016
     * @tc.number SUB_WLAN_VOL2_09_0016
     * @tc.desc   Resolve second volume value 9-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2090016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600143000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('143');
      await Promise.resolve();
    })
  })
}
