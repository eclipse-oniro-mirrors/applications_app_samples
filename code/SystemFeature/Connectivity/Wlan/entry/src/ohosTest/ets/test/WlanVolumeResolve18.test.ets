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

export default function wlanVolumeResolve18Test() {
  describe('WlanVolumeResolve18Test', () => {

    /**
     * @tc.name   testWlanVolume180001
     * @tc.number SUB_WLAN_VOLUME_18_0001
     * @tc.desc   Resolve volume value 18-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume180001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000340000)).assertEqual('10:00:340:000');
      expect(model.resolveIP(1000340000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000340000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume180002
     * @tc.number SUB_WLAN_VOLUME_18_0002
     * @tc.desc   Resolve volume value 18-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume180002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000341000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('341');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume180003
     * @tc.number SUB_WLAN_VOLUME_18_0003
     * @tc.desc   Resolve volume value 18-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume180003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000342000)).assertEqual('10:00:342:000');
      expect(model.resolveIP(1000342000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000342000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume180004
     * @tc.number SUB_WLAN_VOLUME_18_0004
     * @tc.desc   Resolve volume value 18-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume180004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000343000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('343');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume180005
     * @tc.number SUB_WLAN_VOLUME_18_0005
     * @tc.desc   Resolve volume value 18-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume180005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000344000)).assertEqual('10:00:344:000');
      expect(model.resolveIP(1000344000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000344000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume180006
     * @tc.number SUB_WLAN_VOLUME_18_0006
     * @tc.desc   Resolve volume value 18-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume180006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000345000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('345');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume180007
     * @tc.number SUB_WLAN_VOLUME_18_0007
     * @tc.desc   Resolve volume value 18-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume180007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000346000)).assertEqual('10:00:346:000');
      expect(model.resolveIP(1000346000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000346000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume180008
     * @tc.number SUB_WLAN_VOLUME_18_0008
     * @tc.desc   Resolve volume value 18-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume180008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000347000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('347');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume180009
     * @tc.number SUB_WLAN_VOLUME_18_0009
     * @tc.desc   Resolve volume value 18-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume180009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000348000)).assertEqual('10:00:348:000');
      expect(model.resolveIP(1000348000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000348000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume180010
     * @tc.number SUB_WLAN_VOLUME_18_0010
     * @tc.desc   Resolve volume value 18-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume180010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000349000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('349');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume180011
     * @tc.number SUB_WLAN_VOLUME_18_0011
     * @tc.desc   Resolve volume value 18-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume180011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000350000)).assertEqual('10:00:350:000');
      expect(model.resolveIP(1000350000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000350000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume180012
     * @tc.number SUB_WLAN_VOLUME_18_0012
     * @tc.desc   Resolve volume value 18-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume180012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000351000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('351');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume180013
     * @tc.number SUB_WLAN_VOLUME_18_0013
     * @tc.desc   Resolve volume value 18-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume180013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000352000)).assertEqual('10:00:352:000');
      expect(model.resolveIP(1000352000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000352000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume180014
     * @tc.number SUB_WLAN_VOLUME_18_0014
     * @tc.desc   Resolve volume value 18-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume180014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000353000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('353');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume180015
     * @tc.number SUB_WLAN_VOLUME_18_0015
     * @tc.desc   Resolve volume value 18-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume180015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000354000)).assertEqual('10:00:354:000');
      expect(model.resolveIP(1000354000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000354000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume180016
     * @tc.number SUB_WLAN_VOLUME_18_0016
     * @tc.desc   Resolve volume value 18-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume180016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000355000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('355');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume180017
     * @tc.number SUB_WLAN_VOLUME_18_0017
     * @tc.desc   Resolve volume value 18-17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume180017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000356000)).assertEqual('10:00:356:000');
      expect(model.resolveIP(1000356000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000356000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume180018
     * @tc.number SUB_WLAN_VOLUME_18_0018
     * @tc.desc   Resolve volume value 18-18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume180018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000357000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('357');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume180019
     * @tc.number SUB_WLAN_VOLUME_18_0019
     * @tc.desc   Resolve volume value 18-19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume180019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000358000)).assertEqual('10:00:358:000');
      expect(model.resolveIP(1000358000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000358000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume180020
     * @tc.number SUB_WLAN_VOLUME_18_0020
     * @tc.desc   Resolve volume value 18-20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume180020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000359000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('359');
      await Promise.resolve();
    })
  })
}
