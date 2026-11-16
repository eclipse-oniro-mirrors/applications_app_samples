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

export default function wlanVolume2Resolve08Test() {
  describe('WlanVolume2Resolve08Test', () => {

    /**
     * @tc.name   testWlanVol2080001
     * @tc.number SUB_WLAN_VOL2_08_0001
     * @tc.desc   Resolve second volume value 8-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2080001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600112000)).assertEqual('16:00:112:000');
      expect(model.resolveIP(1600112000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600112000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2080002
     * @tc.number SUB_WLAN_VOL2_08_0002
     * @tc.desc   Resolve second volume value 8-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2080002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600113000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('113');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2080003
     * @tc.number SUB_WLAN_VOL2_08_0003
     * @tc.desc   Resolve second volume value 8-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2080003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600114000)).assertEqual('16:00:114:000');
      expect(model.resolveIP(1600114000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600114000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2080004
     * @tc.number SUB_WLAN_VOL2_08_0004
     * @tc.desc   Resolve second volume value 8-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2080004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600115000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('115');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2080005
     * @tc.number SUB_WLAN_VOL2_08_0005
     * @tc.desc   Resolve second volume value 8-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2080005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600116000)).assertEqual('16:00:116:000');
      expect(model.resolveIP(1600116000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600116000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2080006
     * @tc.number SUB_WLAN_VOL2_08_0006
     * @tc.desc   Resolve second volume value 8-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2080006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600117000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('117');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2080007
     * @tc.number SUB_WLAN_VOL2_08_0007
     * @tc.desc   Resolve second volume value 8-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2080007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600118000)).assertEqual('16:00:118:000');
      expect(model.resolveIP(1600118000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600118000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2080008
     * @tc.number SUB_WLAN_VOL2_08_0008
     * @tc.desc   Resolve second volume value 8-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2080008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600119000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('119');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2080009
     * @tc.number SUB_WLAN_VOL2_08_0009
     * @tc.desc   Resolve second volume value 8-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2080009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600120000)).assertEqual('16:00:120:000');
      expect(model.resolveIP(1600120000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600120000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2080010
     * @tc.number SUB_WLAN_VOL2_08_0010
     * @tc.desc   Resolve second volume value 8-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2080010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600121000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('121');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2080011
     * @tc.number SUB_WLAN_VOL2_08_0011
     * @tc.desc   Resolve second volume value 8-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2080011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600122000)).assertEqual('16:00:122:000');
      expect(model.resolveIP(1600122000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600122000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2080012
     * @tc.number SUB_WLAN_VOL2_08_0012
     * @tc.desc   Resolve second volume value 8-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2080012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600123000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('123');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2080013
     * @tc.number SUB_WLAN_VOL2_08_0013
     * @tc.desc   Resolve second volume value 8-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2080013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600124000)).assertEqual('16:00:124:000');
      expect(model.resolveIP(1600124000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600124000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2080014
     * @tc.number SUB_WLAN_VOL2_08_0014
     * @tc.desc   Resolve second volume value 8-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2080014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600125000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('125');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2080015
     * @tc.number SUB_WLAN_VOL2_08_0015
     * @tc.desc   Resolve second volume value 8-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2080015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600126000)).assertEqual('16:00:126:000');
      expect(model.resolveIP(1600126000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600126000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2080016
     * @tc.number SUB_WLAN_VOL2_08_0016
     * @tc.desc   Resolve second volume value 8-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2080016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600127000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('127');
      await Promise.resolve();
    })
  })
}
