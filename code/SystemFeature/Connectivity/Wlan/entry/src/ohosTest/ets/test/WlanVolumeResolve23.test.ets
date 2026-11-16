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

export default function wlanVolumeResolve23Test() {
  describe('WlanVolumeResolve23Test', () => {

    /**
     * @tc.name   testWlanVolume230001
     * @tc.number SUB_WLAN_VOLUME_23_0001
     * @tc.desc   Resolve volume value 23-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume230001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000440000)).assertEqual('10:00:440:000');
      expect(model.resolveIP(1000440000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000440000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume230002
     * @tc.number SUB_WLAN_VOLUME_23_0002
     * @tc.desc   Resolve volume value 23-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume230002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000441000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('441');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume230003
     * @tc.number SUB_WLAN_VOLUME_23_0003
     * @tc.desc   Resolve volume value 23-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume230003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000442000)).assertEqual('10:00:442:000');
      expect(model.resolveIP(1000442000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000442000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume230004
     * @tc.number SUB_WLAN_VOLUME_23_0004
     * @tc.desc   Resolve volume value 23-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume230004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000443000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('443');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume230005
     * @tc.number SUB_WLAN_VOLUME_23_0005
     * @tc.desc   Resolve volume value 23-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume230005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000444000)).assertEqual('10:00:444:000');
      expect(model.resolveIP(1000444000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000444000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume230006
     * @tc.number SUB_WLAN_VOLUME_23_0006
     * @tc.desc   Resolve volume value 23-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume230006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000445000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('445');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume230007
     * @tc.number SUB_WLAN_VOLUME_23_0007
     * @tc.desc   Resolve volume value 23-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume230007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000446000)).assertEqual('10:00:446:000');
      expect(model.resolveIP(1000446000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000446000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume230008
     * @tc.number SUB_WLAN_VOLUME_23_0008
     * @tc.desc   Resolve volume value 23-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume230008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000447000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('447');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume230009
     * @tc.number SUB_WLAN_VOLUME_23_0009
     * @tc.desc   Resolve volume value 23-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume230009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000448000)).assertEqual('10:00:448:000');
      expect(model.resolveIP(1000448000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000448000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume230010
     * @tc.number SUB_WLAN_VOLUME_23_0010
     * @tc.desc   Resolve volume value 23-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume230010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000449000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('449');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume230011
     * @tc.number SUB_WLAN_VOLUME_23_0011
     * @tc.desc   Resolve volume value 23-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume230011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000450000)).assertEqual('10:00:450:000');
      expect(model.resolveIP(1000450000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000450000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume230012
     * @tc.number SUB_WLAN_VOLUME_23_0012
     * @tc.desc   Resolve volume value 23-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume230012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000451000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('451');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume230013
     * @tc.number SUB_WLAN_VOLUME_23_0013
     * @tc.desc   Resolve volume value 23-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume230013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000452000)).assertEqual('10:00:452:000');
      expect(model.resolveIP(1000452000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000452000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume230014
     * @tc.number SUB_WLAN_VOLUME_23_0014
     * @tc.desc   Resolve volume value 23-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume230014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000453000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('453');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume230015
     * @tc.number SUB_WLAN_VOLUME_23_0015
     * @tc.desc   Resolve volume value 23-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume230015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000454000)).assertEqual('10:00:454:000');
      expect(model.resolveIP(1000454000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000454000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume230016
     * @tc.number SUB_WLAN_VOLUME_23_0016
     * @tc.desc   Resolve volume value 23-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume230016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000455000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('455');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume230017
     * @tc.number SUB_WLAN_VOLUME_23_0017
     * @tc.desc   Resolve volume value 23-17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume230017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000456000)).assertEqual('10:00:456:000');
      expect(model.resolveIP(1000456000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000456000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume230018
     * @tc.number SUB_WLAN_VOLUME_23_0018
     * @tc.desc   Resolve volume value 23-18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume230018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000457000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('457');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume230019
     * @tc.number SUB_WLAN_VOLUME_23_0019
     * @tc.desc   Resolve volume value 23-19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume230019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000458000)).assertEqual('10:00:458:000');
      expect(model.resolveIP(1000458000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000458000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume230020
     * @tc.number SUB_WLAN_VOLUME_23_0020
     * @tc.desc   Resolve volume value 23-20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume230020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000459000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('459');
      await Promise.resolve();
    })
  })
}
