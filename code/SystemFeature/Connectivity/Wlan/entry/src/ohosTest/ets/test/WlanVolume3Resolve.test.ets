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

export default function wlanVolume3ResolveTest() {
  describe('WlanVolume3ResolveTest', () => {

    /**
     * @tc.name   testWlanVol30001
     * @tc.number SUB_WLAN_VOL3_0001
     * @tc.desc   Resolve third volume value 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol30001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(2100001000)).assertEqual('21:00:001:000');
      expect(model.resolveIP(2100001000).split(':').length).assertEqual(4);
      expect(model.resolveIP(2100001000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol30002
     * @tc.number SUB_WLAN_VOL3_0002
     * @tc.desc   Resolve third volume value 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol30002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(2100002000)).assertEqual('21:00:002:000');
      expect(model.resolveIP(2100002000).split(':').length).assertEqual(4);
      expect(model.resolveIP(2100002000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol30003
     * @tc.number SUB_WLAN_VOL3_0003
     * @tc.desc   Resolve third volume value 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol30003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(2100003000)).assertEqual('21:00:003:000');
      expect(model.resolveIP(2100003000).split(':').length).assertEqual(4);
      expect(model.resolveIP(2100003000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol30004
     * @tc.number SUB_WLAN_VOL3_0004
     * @tc.desc   Resolve third volume value 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol30004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(2100004000)).assertEqual('21:00:004:000');
      expect(model.resolveIP(2100004000).split(':').length).assertEqual(4);
      expect(model.resolveIP(2100004000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol30005
     * @tc.number SUB_WLAN_VOL3_0005
     * @tc.desc   Resolve third volume value 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol30005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(2100005000)).assertEqual('21:00:005:000');
      expect(model.resolveIP(2100005000).split(':').length).assertEqual(4);
      expect(model.resolveIP(2100005000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol30006
     * @tc.number SUB_WLAN_VOL3_0006
     * @tc.desc   Resolve third volume value 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol30006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(2100006000)).assertEqual('21:00:006:000');
      expect(model.resolveIP(2100006000).split(':').length).assertEqual(4);
      expect(model.resolveIP(2100006000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol30007
     * @tc.number SUB_WLAN_VOL3_0007
     * @tc.desc   Resolve third volume value 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol30007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(2100007000)).assertEqual('21:00:007:000');
      expect(model.resolveIP(2100007000).split(':').length).assertEqual(4);
      expect(model.resolveIP(2100007000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol30008
     * @tc.number SUB_WLAN_VOL3_0008
     * @tc.desc   Resolve third volume value 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol30008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(2100008000)).assertEqual('21:00:008:000');
      expect(model.resolveIP(2100008000).split(':').length).assertEqual(4);
      expect(model.resolveIP(2100008000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol30009
     * @tc.number SUB_WLAN_VOL3_0009
     * @tc.desc   Resolve third volume value 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol30009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(2100009000)).assertEqual('21:00:009:000');
      expect(model.resolveIP(2100009000).split(':').length).assertEqual(4);
      expect(model.resolveIP(2100009000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol30010
     * @tc.number SUB_WLAN_VOL3_0010
     * @tc.desc   Resolve third volume value 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol30010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(2100010000)).assertEqual('21:00:010:000');
      expect(model.resolveIP(2100010000).split(':').length).assertEqual(4);
      expect(model.resolveIP(2100010000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol30011
     * @tc.number SUB_WLAN_VOL3_0011
     * @tc.desc   Resolve third volume value 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol30011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(2100011000)).assertEqual('21:00:011:000');
      expect(model.resolveIP(2100011000).split(':').length).assertEqual(4);
      expect(model.resolveIP(2100011000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol30012
     * @tc.number SUB_WLAN_VOL3_0012
     * @tc.desc   Resolve third volume value 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol30012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(2100012000)).assertEqual('21:00:012:000');
      expect(model.resolveIP(2100012000).split(':').length).assertEqual(4);
      expect(model.resolveIP(2100012000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol30013
     * @tc.number SUB_WLAN_VOL3_0013
     * @tc.desc   Resolve third volume value 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol30013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(2100013000)).assertEqual('21:00:013:000');
      expect(model.resolveIP(2100013000).split(':').length).assertEqual(4);
      expect(model.resolveIP(2100013000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol30014
     * @tc.number SUB_WLAN_VOL3_0014
     * @tc.desc   Resolve third volume value 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol30014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(2100014000)).assertEqual('21:00:014:000');
      expect(model.resolveIP(2100014000).split(':').length).assertEqual(4);
      expect(model.resolveIP(2100014000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol30015
     * @tc.number SUB_WLAN_VOL3_0015
     * @tc.desc   Resolve third volume value 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol30015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(2100015000)).assertEqual('21:00:015:000');
      expect(model.resolveIP(2100015000).split(':').length).assertEqual(4);
      expect(model.resolveIP(2100015000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol30016
     * @tc.number SUB_WLAN_VOL3_0016
     * @tc.desc   Resolve third volume value 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol30016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(2100016000)).assertEqual('21:00:016:000');
      expect(model.resolveIP(2100016000).split(':').length).assertEqual(4);
      expect(model.resolveIP(2100016000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol30017
     * @tc.number SUB_WLAN_VOL3_0017
     * @tc.desc   Resolve third volume value 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol30017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(2100017000)).assertEqual('21:00:017:000');
      expect(model.resolveIP(2100017000).split(':').length).assertEqual(4);
      expect(model.resolveIP(2100017000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol30018
     * @tc.number SUB_WLAN_VOL3_0018
     * @tc.desc   Resolve third volume value 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol30018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(2100018000)).assertEqual('21:00:018:000');
      expect(model.resolveIP(2100018000).split(':').length).assertEqual(4);
      expect(model.resolveIP(2100018000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol30019
     * @tc.number SUB_WLAN_VOL3_0019
     * @tc.desc   Resolve third volume value 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol30019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(2100019000)).assertEqual('21:00:019:000');
      expect(model.resolveIP(2100019000).split(':').length).assertEqual(4);
      expect(model.resolveIP(2100019000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol30020
     * @tc.number SUB_WLAN_VOL3_0020
     * @tc.desc   Resolve third volume value 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol30020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(2100020000)).assertEqual('21:00:020:000');
      expect(model.resolveIP(2100020000).split(':').length).assertEqual(4);
      expect(model.resolveIP(2100020000).length).assertEqual(13);
      await Promise.resolve();
    })
  })
}
