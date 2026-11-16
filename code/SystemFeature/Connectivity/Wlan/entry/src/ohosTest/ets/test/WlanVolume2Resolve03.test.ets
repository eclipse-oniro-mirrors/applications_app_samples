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

export default function wlanVolume2Resolve03Test() {
  describe('WlanVolume2Resolve03Test', () => {

    /**
     * @tc.name   testWlanVol2030001
     * @tc.number SUB_WLAN_VOL2_03_0001
     * @tc.desc   Resolve second volume value 3-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2030001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600032000)).assertEqual('16:00:032:000');
      expect(model.resolveIP(1600032000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600032000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2030002
     * @tc.number SUB_WLAN_VOL2_03_0002
     * @tc.desc   Resolve second volume value 3-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2030002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600033000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('033');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2030003
     * @tc.number SUB_WLAN_VOL2_03_0003
     * @tc.desc   Resolve second volume value 3-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2030003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600034000)).assertEqual('16:00:034:000');
      expect(model.resolveIP(1600034000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600034000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2030004
     * @tc.number SUB_WLAN_VOL2_03_0004
     * @tc.desc   Resolve second volume value 3-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2030004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600035000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('035');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2030005
     * @tc.number SUB_WLAN_VOL2_03_0005
     * @tc.desc   Resolve second volume value 3-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2030005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600036000)).assertEqual('16:00:036:000');
      expect(model.resolveIP(1600036000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600036000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2030006
     * @tc.number SUB_WLAN_VOL2_03_0006
     * @tc.desc   Resolve second volume value 3-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2030006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600037000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('037');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2030007
     * @tc.number SUB_WLAN_VOL2_03_0007
     * @tc.desc   Resolve second volume value 3-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2030007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600038000)).assertEqual('16:00:038:000');
      expect(model.resolveIP(1600038000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600038000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2030008
     * @tc.number SUB_WLAN_VOL2_03_0008
     * @tc.desc   Resolve second volume value 3-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2030008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600039000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('039');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2030009
     * @tc.number SUB_WLAN_VOL2_03_0009
     * @tc.desc   Resolve second volume value 3-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2030009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600040000)).assertEqual('16:00:040:000');
      expect(model.resolveIP(1600040000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600040000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2030010
     * @tc.number SUB_WLAN_VOL2_03_0010
     * @tc.desc   Resolve second volume value 3-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2030010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600041000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('041');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2030011
     * @tc.number SUB_WLAN_VOL2_03_0011
     * @tc.desc   Resolve second volume value 3-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2030011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600042000)).assertEqual('16:00:042:000');
      expect(model.resolveIP(1600042000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600042000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2030012
     * @tc.number SUB_WLAN_VOL2_03_0012
     * @tc.desc   Resolve second volume value 3-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2030012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600043000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('043');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2030013
     * @tc.number SUB_WLAN_VOL2_03_0013
     * @tc.desc   Resolve second volume value 3-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2030013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600044000)).assertEqual('16:00:044:000');
      expect(model.resolveIP(1600044000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600044000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2030014
     * @tc.number SUB_WLAN_VOL2_03_0014
     * @tc.desc   Resolve second volume value 3-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2030014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600045000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('045');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2030015
     * @tc.number SUB_WLAN_VOL2_03_0015
     * @tc.desc   Resolve second volume value 3-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2030015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600046000)).assertEqual('16:00:046:000');
      expect(model.resolveIP(1600046000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600046000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2030016
     * @tc.number SUB_WLAN_VOL2_03_0016
     * @tc.desc   Resolve second volume value 3-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2030016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600047000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('047');
      await Promise.resolve();
    })
  })
}
