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

export default function wlanVolumeResolve10Test() {
  describe('WlanVolumeResolve10Test', () => {

    /**
     * @tc.name   testWlanVolume100001
     * @tc.number SUB_WLAN_VOLUME_10_0001
     * @tc.desc   Resolve volume value 10-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume100001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000180000)).assertEqual('10:00:180:000');
      expect(model.resolveIP(1000180000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000180000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume100002
     * @tc.number SUB_WLAN_VOLUME_10_0002
     * @tc.desc   Resolve volume value 10-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume100002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000181000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('181');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume100003
     * @tc.number SUB_WLAN_VOLUME_10_0003
     * @tc.desc   Resolve volume value 10-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume100003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000182000)).assertEqual('10:00:182:000');
      expect(model.resolveIP(1000182000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000182000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume100004
     * @tc.number SUB_WLAN_VOLUME_10_0004
     * @tc.desc   Resolve volume value 10-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume100004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000183000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('183');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume100005
     * @tc.number SUB_WLAN_VOLUME_10_0005
     * @tc.desc   Resolve volume value 10-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume100005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000184000)).assertEqual('10:00:184:000');
      expect(model.resolveIP(1000184000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000184000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume100006
     * @tc.number SUB_WLAN_VOLUME_10_0006
     * @tc.desc   Resolve volume value 10-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume100006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000185000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('185');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume100007
     * @tc.number SUB_WLAN_VOLUME_10_0007
     * @tc.desc   Resolve volume value 10-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume100007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000186000)).assertEqual('10:00:186:000');
      expect(model.resolveIP(1000186000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000186000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume100008
     * @tc.number SUB_WLAN_VOLUME_10_0008
     * @tc.desc   Resolve volume value 10-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume100008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000187000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('187');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume100009
     * @tc.number SUB_WLAN_VOLUME_10_0009
     * @tc.desc   Resolve volume value 10-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume100009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000188000)).assertEqual('10:00:188:000');
      expect(model.resolveIP(1000188000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000188000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume100010
     * @tc.number SUB_WLAN_VOLUME_10_0010
     * @tc.desc   Resolve volume value 10-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume100010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000189000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('189');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume100011
     * @tc.number SUB_WLAN_VOLUME_10_0011
     * @tc.desc   Resolve volume value 10-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume100011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000190000)).assertEqual('10:00:190:000');
      expect(model.resolveIP(1000190000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000190000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume100012
     * @tc.number SUB_WLAN_VOLUME_10_0012
     * @tc.desc   Resolve volume value 10-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume100012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000191000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('191');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume100013
     * @tc.number SUB_WLAN_VOLUME_10_0013
     * @tc.desc   Resolve volume value 10-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume100013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000192000)).assertEqual('10:00:192:000');
      expect(model.resolveIP(1000192000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000192000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume100014
     * @tc.number SUB_WLAN_VOLUME_10_0014
     * @tc.desc   Resolve volume value 10-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume100014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000193000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('193');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume100015
     * @tc.number SUB_WLAN_VOLUME_10_0015
     * @tc.desc   Resolve volume value 10-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume100015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000194000)).assertEqual('10:00:194:000');
      expect(model.resolveIP(1000194000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000194000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume100016
     * @tc.number SUB_WLAN_VOLUME_10_0016
     * @tc.desc   Resolve volume value 10-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume100016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000195000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('195');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume100017
     * @tc.number SUB_WLAN_VOLUME_10_0017
     * @tc.desc   Resolve volume value 10-17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume100017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000196000)).assertEqual('10:00:196:000');
      expect(model.resolveIP(1000196000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000196000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume100018
     * @tc.number SUB_WLAN_VOLUME_10_0018
     * @tc.desc   Resolve volume value 10-18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume100018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000197000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('197');
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume100019
     * @tc.number SUB_WLAN_VOLUME_10_0019
     * @tc.desc   Resolve volume value 10-19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume100019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000198000)).assertEqual('10:00:198:000');
      expect(model.resolveIP(1000198000).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000198000).length).assertEqual(13);
      await Promise.resolve();
    })

    /**
     * @tc.name   testWlanVolume100020
     * @tc.number SUB_WLAN_VOLUME_10_0020
     * @tc.desc   Resolve volume value 10-20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume100020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000199000);
      expect(result.startsWith('10')).assertTrue();
      expect(result.endsWith('000')).assertTrue();
      expect(result.split(':')[2]).assertEqual('199');
      await Promise.resolve();
    })
  })
}
