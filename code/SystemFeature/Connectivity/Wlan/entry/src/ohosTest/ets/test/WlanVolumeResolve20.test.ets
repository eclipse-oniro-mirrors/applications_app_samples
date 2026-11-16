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

export default function wlanVolumeResolve20Test() {
  describe('WlanVolumeResolve20Test', () => {

    /**
     * @tc.name   testWlanVolume200001
     * @tc.number SUB_WLAN_VOLUME_20_0001
     * @tc.desc   Resolve volume value 20-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume200001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000380000)).assertEqual('10:00:380:000');
      expect(model.resolveIP(1000380000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000380000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume200002
     * @tc.number SUB_WLAN_VOLUME_20_0002
     * @tc.desc   Resolve volume value 20-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume200002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000381000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('381');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume200003
     * @tc.number SUB_WLAN_VOLUME_20_0003
     * @tc.desc   Resolve volume value 20-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume200003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000382000)).assertEqual('10:00:382:000');
      expect(model.resolveIP(1000382000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000382000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume200004
     * @tc.number SUB_WLAN_VOLUME_20_0004
     * @tc.desc   Resolve volume value 20-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume200004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000383000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('383');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume200005
     * @tc.number SUB_WLAN_VOLUME_20_0005
     * @tc.desc   Resolve volume value 20-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume200005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000384000)).assertEqual('10:00:384:000');
      expect(model.resolveIP(1000384000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000384000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume200006
     * @tc.number SUB_WLAN_VOLUME_20_0006
     * @tc.desc   Resolve volume value 20-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume200006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000385000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('385');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume200007
     * @tc.number SUB_WLAN_VOLUME_20_0007
     * @tc.desc   Resolve volume value 20-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume200007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000386000)).assertEqual('10:00:386:000');
      expect(model.resolveIP(1000386000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000386000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume200008
     * @tc.number SUB_WLAN_VOLUME_20_0008
     * @tc.desc   Resolve volume value 20-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume200008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000387000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('387');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume200009
     * @tc.number SUB_WLAN_VOLUME_20_0009
     * @tc.desc   Resolve volume value 20-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume200009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000388000)).assertEqual('10:00:388:000');
      expect(model.resolveIP(1000388000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000388000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume200010
     * @tc.number SUB_WLAN_VOLUME_20_0010
     * @tc.desc   Resolve volume value 20-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume200010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000389000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('389');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume200011
     * @tc.number SUB_WLAN_VOLUME_20_0011
     * @tc.desc   Resolve volume value 20-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume200011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000390000)).assertEqual('10:00:390:000');
      expect(model.resolveIP(1000390000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000390000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume200012
     * @tc.number SUB_WLAN_VOLUME_20_0012
     * @tc.desc   Resolve volume value 20-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume200012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000391000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('391');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume200013
     * @tc.number SUB_WLAN_VOLUME_20_0013
     * @tc.desc   Resolve volume value 20-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume200013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000392000)).assertEqual('10:00:392:000');
      expect(model.resolveIP(1000392000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000392000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume200014
     * @tc.number SUB_WLAN_VOLUME_20_0014
     * @tc.desc   Resolve volume value 20-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume200014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000393000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('393');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume200015
     * @tc.number SUB_WLAN_VOLUME_20_0015
     * @tc.desc   Resolve volume value 20-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume200015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000394000)).assertEqual('10:00:394:000');
      expect(model.resolveIP(1000394000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000394000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume200016
     * @tc.number SUB_WLAN_VOLUME_20_0016
     * @tc.desc   Resolve volume value 20-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume200016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000395000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('395');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume200017
     * @tc.number SUB_WLAN_VOLUME_20_0017
     * @tc.desc   Resolve volume value 20-17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume200017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000396000)).assertEqual('10:00:396:000');
      expect(model.resolveIP(1000396000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000396000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume200018
     * @tc.number SUB_WLAN_VOLUME_20_0018
     * @tc.desc   Resolve volume value 20-18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume200018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000397000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('397');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume200019
     * @tc.number SUB_WLAN_VOLUME_20_0019
     * @tc.desc   Resolve volume value 20-19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume200019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000398000)).assertEqual('10:00:398:000');
      expect(model.resolveIP(1000398000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000398000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume200020
     * @tc.number SUB_WLAN_VOLUME_20_0020
     * @tc.desc   Resolve volume value 20-20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume200020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000399000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('399');
      await Promise.resolve();
    })
  })
}
