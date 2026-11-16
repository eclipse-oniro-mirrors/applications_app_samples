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

export default function wlanVolume2Resolve28Test() {
  describe('WlanVolume2Resolve28Test', () => {

    /**
     * @tc.name   testWlanVol2280001
     * @tc.number SUB_WLAN_VOL2_28_0001
     * @tc.desc   Resolve second volume value 28-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2280001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600432000)).assertEqual('16:00:432:000');
      expect(model.resolveIP(1600432000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600432000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2280002
     * @tc.number SUB_WLAN_VOL2_28_0002
     * @tc.desc   Resolve second volume value 28-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2280002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600433000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('433');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2280003
     * @tc.number SUB_WLAN_VOL2_28_0003
     * @tc.desc   Resolve second volume value 28-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2280003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600434000)).assertEqual('16:00:434:000');
      expect(model.resolveIP(1600434000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600434000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2280004
     * @tc.number SUB_WLAN_VOL2_28_0004
     * @tc.desc   Resolve second volume value 28-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2280004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600435000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('435');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2280005
     * @tc.number SUB_WLAN_VOL2_28_0005
     * @tc.desc   Resolve second volume value 28-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2280005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600436000)).assertEqual('16:00:436:000');
      expect(model.resolveIP(1600436000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600436000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2280006
     * @tc.number SUB_WLAN_VOL2_28_0006
     * @tc.desc   Resolve second volume value 28-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2280006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600437000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('437');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2280007
     * @tc.number SUB_WLAN_VOL2_28_0007
     * @tc.desc   Resolve second volume value 28-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2280007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600438000)).assertEqual('16:00:438:000');
      expect(model.resolveIP(1600438000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600438000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2280008
     * @tc.number SUB_WLAN_VOL2_28_0008
     * @tc.desc   Resolve second volume value 28-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2280008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600439000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('439');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2280009
     * @tc.number SUB_WLAN_VOL2_28_0009
     * @tc.desc   Resolve second volume value 28-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2280009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600440000)).assertEqual('16:00:440:000');
      expect(model.resolveIP(1600440000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600440000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2280010
     * @tc.number SUB_WLAN_VOL2_28_0010
     * @tc.desc   Resolve second volume value 28-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2280010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600441000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('441');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2280011
     * @tc.number SUB_WLAN_VOL2_28_0011
     * @tc.desc   Resolve second volume value 28-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2280011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600442000)).assertEqual('16:00:442:000');
      expect(model.resolveIP(1600442000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600442000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2280012
     * @tc.number SUB_WLAN_VOL2_28_0012
     * @tc.desc   Resolve second volume value 28-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2280012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600443000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('443');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2280013
     * @tc.number SUB_WLAN_VOL2_28_0013
     * @tc.desc   Resolve second volume value 28-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2280013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600444000)).assertEqual('16:00:444:000');
      expect(model.resolveIP(1600444000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600444000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2280014
     * @tc.number SUB_WLAN_VOL2_28_0014
     * @tc.desc   Resolve second volume value 28-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2280014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600445000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('445');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2280015
     * @tc.number SUB_WLAN_VOL2_28_0015
     * @tc.desc   Resolve second volume value 28-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2280015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1600446000)).assertEqual('16:00:446:000');
      expect(model.resolveIP(1600446000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1600446000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVol2280016
     * @tc.number SUB_WLAN_VOL2_28_0016
     * @tc.desc   Resolve second volume value 28-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol2280016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1600447000);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('447');
      await Promise.resolve();
    })
  })
}
