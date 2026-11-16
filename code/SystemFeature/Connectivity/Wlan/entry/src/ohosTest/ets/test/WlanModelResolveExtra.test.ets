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

export default function wlanModelResolveExtraTest() {
  describe('WlanModelResolveExtraTest', () => {

    /**
     * @tc.name   testWlanResolveExtra0001
     * @tc.number SUB_WLAN_RESOLVE_EXTRA_0001
     * @tc.desc   Resolve IPv4 integer variant 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResolveExtra0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000000000);
      expect(result).assertEqual('10:00:000:000');
      expect(result.split(':').length).assertEqual(4);
      expect(result.length).assertEqual(13);
    })

    /**
     * @tc.name   testWlanResolveExtra0002
     * @tc.number SUB_WLAN_RESOLVE_EXTRA_0002
     * @tc.desc   Resolve IPv4 integer variant 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResolveExtra0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: WifiModel = new WifiModel();
      const parts: string[] = model.resolveIP(1234567890).split(':');
      expect(parts[0]).assertEqual('12');
      expect(parts[1]).assertEqual('34');
      expect(parts[2]).assertEqual('567');
      expect(parts[3]).assertEqual('890');
    })

    /**
     * @tc.name   testWlanResolveExtra0003
     * @tc.number SUB_WLAN_RESOLVE_EXTRA_0003
     * @tc.desc   Resolve IPv4 integer variant 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResolveExtra0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1677721610);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('610')).assertTrue();
      expect(result.includes(':')).assertTrue();
    })

    /**
     * @tc.name   testWlanResolveExtra0004
     * @tc.number SUB_WLAN_RESOLVE_EXTRA_0004
     * @tc.desc   Resolve IPv4 integer variant 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResolveExtra0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(2000000001);
      expect(result).assertEqual('20:00:000:001');
      expect(result.split(':').length).assertEqual(4);
      expect(result.length).assertEqual(13);
    })

    /**
     * @tc.name   testWlanResolveExtra0005
     * @tc.number SUB_WLAN_RESOLVE_EXTRA_0005
     * @tc.desc   Resolve IPv4 integer variant 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResolveExtra0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: WifiModel = new WifiModel();
      const parts: string[] = model.resolveIP(2147483647).split(':');
      expect(parts[0]).assertEqual('21');
      expect(parts[1]).assertEqual('47');
      expect(parts[2]).assertEqual('483');
      expect(parts[3]).assertEqual('647');
    })

    /**
     * @tc.name   testWlanResolveExtra0006
     * @tc.number SUB_WLAN_RESOLVE_EXTRA_0006
     * @tc.desc   Resolve IPv4 integer variant 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResolveExtra0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(2222222222);
      expect(result.startsWith('22')).assertTrue();
      expect(result.endsWith('222')).assertTrue();
      expect(result.includes(':')).assertTrue();
    })

    /**
     * @tc.name   testWlanResolveExtra0007
     * @tc.number SUB_WLAN_RESOLVE_EXTRA_0007
     * @tc.desc   Resolve IPv4 integer variant 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResolveExtra0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(2345678901);
      expect(result).assertEqual('23:45:678:901');
      expect(result.split(':').length).assertEqual(4);
      expect(result.length).assertEqual(13);
    })

    /**
     * @tc.name   testWlanResolveExtra0008
     * @tc.number SUB_WLAN_RESOLVE_EXTRA_0008
     * @tc.desc   Resolve IPv4 integer variant 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResolveExtra0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: WifiModel = new WifiModel();
      const parts: string[] = model.resolveIP(2500000000).split(':');
      expect(parts[0]).assertEqual('25');
      expect(parts[1]).assertEqual('00');
      expect(parts[2]).assertEqual('000');
      expect(parts[3]).assertEqual('000');
    })

    /**
     * @tc.name   testWlanResolveExtra0009
     * @tc.number SUB_WLAN_RESOLVE_EXTRA_0009
     * @tc.desc   Resolve IPv4 integer variant 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResolveExtra0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(2684354559);
      expect(result.startsWith('26')).assertTrue();
      expect(result.endsWith('559')).assertTrue();
      expect(result.includes(':')).assertTrue();
    })

    /**
     * @tc.name   testWlanResolveExtra0010
     * @tc.number SUB_WLAN_RESOLVE_EXTRA_0010
     * @tc.desc   Resolve IPv4 integer variant 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResolveExtra0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(2852126720);
      expect(result).assertEqual('28:52:126:720');
      expect(result.split(':').length).assertEqual(4);
      expect(result.length).assertEqual(13);
    })

    /**
     * @tc.name   testWlanResolveExtra0011
     * @tc.number SUB_WLAN_RESOLVE_EXTRA_0011
     * @tc.desc   Resolve IPv4 integer variant 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResolveExtra0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: WifiModel = new WifiModel();
      const parts: string[] = model.resolveIP(3000000003).split(':');
      expect(parts[0]).assertEqual('30');
      expect(parts[1]).assertEqual('00');
      expect(parts[2]).assertEqual('000');
      expect(parts[3]).assertEqual('003');
    })

    /**
     * @tc.name   testWlanResolveExtra0012
     * @tc.number SUB_WLAN_RESOLVE_EXTRA_0012
     * @tc.desc   Resolve IPv4 integer variant 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResolveExtra0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(3141592653);
      expect(result.startsWith('31')).assertTrue();
      expect(result.endsWith('653')).assertTrue();
      expect(result.includes(':')).assertTrue();
    })

    /**
     * @tc.name   testWlanResolveExtra0013
     * @tc.number SUB_WLAN_RESOLVE_EXTRA_0013
     * @tc.desc   Resolve IPv4 integer variant 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResolveExtra0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(3232235777);
      expect(result).assertEqual('32:32:235:777');
      expect(result.split(':').length).assertEqual(4);
      expect(result.length).assertEqual(13);
    })

    /**
     * @tc.name   testWlanResolveExtra0014
     * @tc.number SUB_WLAN_RESOLVE_EXTRA_0014
     * @tc.desc   Resolve IPv4 integer variant 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResolveExtra0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: WifiModel = new WifiModel();
      const parts: string[] = model.resolveIP(3333333333).split(':');
      expect(parts[0]).assertEqual('33');
      expect(parts[1]).assertEqual('33');
      expect(parts[2]).assertEqual('333');
      expect(parts[3]).assertEqual('333');
    })

    /**
     * @tc.name   testWlanResolveExtra0015
     * @tc.number SUB_WLAN_RESOLVE_EXTRA_0015
     * @tc.desc   Resolve IPv4 integer variant 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResolveExtra0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(3456789012);
      expect(result.startsWith('34')).assertTrue();
      expect(result.endsWith('012')).assertTrue();
      expect(result.includes(':')).assertTrue();
    })

    /**
     * @tc.name   testWlanResolveExtra0016
     * @tc.number SUB_WLAN_RESOLVE_EXTRA_0016
     * @tc.desc   Resolve IPv4 integer variant 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResolveExtra0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(3500000000);
      expect(result).assertEqual('35:00:000:000');
      expect(result.split(':').length).assertEqual(4);
      expect(result.length).assertEqual(13);
    })

    /**
     * @tc.name   testWlanResolveExtra0017
     * @tc.number SUB_WLAN_RESOLVE_EXTRA_0017
     * @tc.desc   Resolve IPv4 integer variant 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResolveExtra0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: WifiModel = new WifiModel();
      const parts: string[] = model.resolveIP(3600000001).split(':');
      expect(parts[0]).assertEqual('36');
      expect(parts[1]).assertEqual('00');
      expect(parts[2]).assertEqual('000');
      expect(parts[3]).assertEqual('001');
    })

    /**
     * @tc.name   testWlanResolveExtra0018
     * @tc.number SUB_WLAN_RESOLVE_EXTRA_0018
     * @tc.desc   Resolve IPv4 integer variant 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResolveExtra0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(3700000002);
      expect(result.startsWith('37')).assertTrue();
      expect(result.endsWith('002')).assertTrue();
      expect(result.includes(':')).assertTrue();
    })

    /**
     * @tc.name   testWlanResolveExtra0019
     * @tc.number SUB_WLAN_RESOLVE_EXTRA_0019
     * @tc.desc   Resolve IPv4 integer variant 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResolveExtra0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(3800000003);
      expect(result).assertEqual('38:00:000:003');
      expect(result.split(':').length).assertEqual(4);
      expect(result.length).assertEqual(13);
    })

    /**
     * @tc.name   testWlanResolveExtra0020
     * @tc.number SUB_WLAN_RESOLVE_EXTRA_0020
     * @tc.desc   Resolve IPv4 integer variant 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResolveExtra0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: WifiModel = new WifiModel();
      const parts: string[] = model.resolveIP(3900000004).split(':');
      expect(parts[0]).assertEqual('39');
      expect(parts[1]).assertEqual('00');
      expect(parts[2]).assertEqual('000');
      expect(parts[3]).assertEqual('004');
    })

    /**
     * @tc.name   testWlanResolveExtra0021
     * @tc.number SUB_WLAN_RESOLVE_EXTRA_0021
     * @tc.desc   Resolve IPv4 integer variant 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResolveExtra0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(4000000005);
      expect(result.startsWith('40')).assertTrue();
      expect(result.endsWith('005')).assertTrue();
      expect(result.includes(':')).assertTrue();
    })

    /**
     * @tc.name   testWlanResolveExtra0022
     * @tc.number SUB_WLAN_RESOLVE_EXTRA_0022
     * @tc.desc   Resolve IPv4 integer variant 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResolveExtra0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(4100000006);
      expect(result).assertEqual('41:00:000:006');
      expect(result.split(':').length).assertEqual(4);
      expect(result.length).assertEqual(13);
    })

    /**
     * @tc.name   testWlanResolveExtra0023
     * @tc.number SUB_WLAN_RESOLVE_EXTRA_0023
     * @tc.desc   Resolve IPv4 integer variant 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResolveExtra0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: WifiModel = new WifiModel();
      const parts: string[] = model.resolveIP(4200000007).split(':');
      expect(parts[0]).assertEqual('42');
      expect(parts[1]).assertEqual('00');
      expect(parts[2]).assertEqual('000');
      expect(parts[3]).assertEqual('007');
    })

    /**
     * @tc.name   testWlanResolveExtra0024
     * @tc.number SUB_WLAN_RESOLVE_EXTRA_0024
     * @tc.desc   Resolve IPv4 integer variant 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResolveExtra0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(4294967295);
      expect(result.startsWith('42')).assertTrue();
      expect(result.endsWith('295')).assertTrue();
      expect(result.includes(':')).assertTrue();
    })

    /**
     * @tc.name   testWlanResolveExtra0025
     * @tc.number SUB_WLAN_RESOLVE_EXTRA_0025
     * @tc.desc   Resolve IPv4 integer variant 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResolveExtra0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1111111111);
      expect(result).assertEqual('11:11:111:111');
      expect(result.split(':').length).assertEqual(4);
      expect(result.length).assertEqual(13);
    })

    /**
     * @tc.name   testWlanResolveExtra0026
     * @tc.number SUB_WLAN_RESOLVE_EXTRA_0026
     * @tc.desc   Resolve IPv4 integer variant 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResolveExtra0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: WifiModel = new WifiModel();
      const parts: string[] = model.resolveIP(1222222222).split(':');
      expect(parts[0]).assertEqual('12');
      expect(parts[1]).assertEqual('22');
      expect(parts[2]).assertEqual('222');
      expect(parts[3]).assertEqual('222');
    })

    /**
     * @tc.name   testWlanResolveExtra0027
     * @tc.number SUB_WLAN_RESOLVE_EXTRA_0027
     * @tc.desc   Resolve IPv4 integer variant 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResolveExtra0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1333333333);
      expect(result.startsWith('13')).assertTrue();
      expect(result.endsWith('333')).assertTrue();
      expect(result.includes(':')).assertTrue();
    })

    /**
     * @tc.name   testWlanResolveExtra0028
     * @tc.number SUB_WLAN_RESOLVE_EXTRA_0028
     * @tc.desc   Resolve IPv4 integer variant 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResolveExtra0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1444444444);
      expect(result).assertEqual('14:44:444:444');
      expect(result.split(':').length).assertEqual(4);
      expect(result.length).assertEqual(13);
    })

    /**
     * @tc.name   testWlanResolveExtra0029
     * @tc.number SUB_WLAN_RESOLVE_EXTRA_0029
     * @tc.desc   Resolve IPv4 integer variant 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResolveExtra0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: WifiModel = new WifiModel();
      const parts: string[] = model.resolveIP(1555555555).split(':');
      expect(parts[0]).assertEqual('15');
      expect(parts[1]).assertEqual('55');
      expect(parts[2]).assertEqual('555');
      expect(parts[3]).assertEqual('555');
    })

    /**
     * @tc.name   testWlanResolveExtra0030
     * @tc.number SUB_WLAN_RESOLVE_EXTRA_0030
     * @tc.desc   Resolve IPv4 integer variant 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResolveExtra0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1666666666);
      expect(result.startsWith('16')).assertTrue();
      expect(result.endsWith('666')).assertTrue();
      expect(result.includes(':')).assertTrue();
    })
  })
}
