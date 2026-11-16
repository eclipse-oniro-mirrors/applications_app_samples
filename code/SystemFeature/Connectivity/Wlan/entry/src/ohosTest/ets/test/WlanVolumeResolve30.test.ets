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

export default function wlanVolumeResolve30Test() {
  describe('WlanVolumeResolve30Test', () => {

    /**
     * @tc.name   testWlanVolume300001
     * @tc.number SUB_WLAN_VOLUME_30_0001
     * @tc.desc   Resolve volume value 30-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume300001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000580000)).assertEqual('10:00:580:000');
      expect(model.resolveIP(1000580000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000580000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume300002
     * @tc.number SUB_WLAN_VOLUME_30_0002
     * @tc.desc   Resolve volume value 30-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume300002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000581000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('581');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume300003
     * @tc.number SUB_WLAN_VOLUME_30_0003
     * @tc.desc   Resolve volume value 30-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume300003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000582000)).assertEqual('10:00:582:000');
      expect(model.resolveIP(1000582000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000582000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume300004
     * @tc.number SUB_WLAN_VOLUME_30_0004
     * @tc.desc   Resolve volume value 30-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume300004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000583000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('583');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume300005
     * @tc.number SUB_WLAN_VOLUME_30_0005
     * @tc.desc   Resolve volume value 30-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume300005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000584000)).assertEqual('10:00:584:000');
      expect(model.resolveIP(1000584000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000584000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume300006
     * @tc.number SUB_WLAN_VOLUME_30_0006
     * @tc.desc   Resolve volume value 30-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume300006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000585000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('585');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume300007
     * @tc.number SUB_WLAN_VOLUME_30_0007
     * @tc.desc   Resolve volume value 30-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume300007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000586000)).assertEqual('10:00:586:000');
      expect(model.resolveIP(1000586000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000586000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume300008
     * @tc.number SUB_WLAN_VOLUME_30_0008
     * @tc.desc   Resolve volume value 30-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume300008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000587000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('587');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume300009
     * @tc.number SUB_WLAN_VOLUME_30_0009
     * @tc.desc   Resolve volume value 30-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume300009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000588000)).assertEqual('10:00:588:000');
      expect(model.resolveIP(1000588000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000588000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume300010
     * @tc.number SUB_WLAN_VOLUME_30_0010
     * @tc.desc   Resolve volume value 30-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume300010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000589000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('589');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume300011
     * @tc.number SUB_WLAN_VOLUME_30_0011
     * @tc.desc   Resolve volume value 30-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume300011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000590000)).assertEqual('10:00:590:000');
      expect(model.resolveIP(1000590000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000590000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume300012
     * @tc.number SUB_WLAN_VOLUME_30_0012
     * @tc.desc   Resolve volume value 30-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume300012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000591000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('591');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume300013
     * @tc.number SUB_WLAN_VOLUME_30_0013
     * @tc.desc   Resolve volume value 30-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume300013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000592000)).assertEqual('10:00:592:000');
      expect(model.resolveIP(1000592000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000592000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume300014
     * @tc.number SUB_WLAN_VOLUME_30_0014
     * @tc.desc   Resolve volume value 30-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume300014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000593000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('593');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume300015
     * @tc.number SUB_WLAN_VOLUME_30_0015
     * @tc.desc   Resolve volume value 30-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume300015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000594000)).assertEqual('10:00:594:000');
      expect(model.resolveIP(1000594000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000594000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume300016
     * @tc.number SUB_WLAN_VOLUME_30_0016
     * @tc.desc   Resolve volume value 30-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume300016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000595000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('595');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume300017
     * @tc.number SUB_WLAN_VOLUME_30_0017
     * @tc.desc   Resolve volume value 30-17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume300017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000596000)).assertEqual('10:00:596:000');
      expect(model.resolveIP(1000596000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000596000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume300018
     * @tc.number SUB_WLAN_VOLUME_30_0018
     * @tc.desc   Resolve volume value 30-18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume300018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000597000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('597');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume300019
     * @tc.number SUB_WLAN_VOLUME_30_0019
     * @tc.desc   Resolve volume value 30-19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume300019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000598000)).assertEqual('10:00:598:000');
      expect(model.resolveIP(1000598000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000598000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume300020
     * @tc.number SUB_WLAN_VOLUME_30_0020
     * @tc.desc   Resolve volume value 30-20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume300020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000599000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('599');
      await Promise.resolve();
    })
  })
}
