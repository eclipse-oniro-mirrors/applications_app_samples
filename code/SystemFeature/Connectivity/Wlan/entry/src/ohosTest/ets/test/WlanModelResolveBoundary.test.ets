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

export default function wlanModelResolveBoundaryTest() {
  describe('WlanModelResolveBoundaryTest', () => {

    /**
     * @tc.name   testWlanResolveBoundary0001
     * @tc.number SUB_WLAN_RESOLVE_BOUNDARY_0001
     * @tc.desc   Resolve boundary IPv4 value 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResolveBoundary0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1000000001)).assertEqual('10:00:000:001');
      expect(model.resolveIP(1000000001).split(':').length).assertEqual(4);
      expect(model.resolveIP(1000000001).length).assertEqual(13);
    })

    /**
     * @tc.name   testWlanResolveBoundary0002
     * @tc.number SUB_WLAN_RESOLVE_BOUNDARY_0002
     * @tc.desc   Resolve boundary IPv4 value 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResolveBoundary0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1111111112);
      expect(result.startsWith('11')).assertTrue();
      expect(result.endsWith('112')).assertTrue();
      expect(result.split(':')[2]).assertEqual('111');
    })

    /**
     * @tc.name   testWlanResolveBoundary0003
     * @tc.number SUB_WLAN_RESOLVE_BOUNDARY_0003
     * @tc.desc   Resolve boundary IPv4 value 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResolveBoundary0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1222222223)).assertEqual('12:22:222:223');
      expect(model.resolveIP(1222222223).split(':').length).assertEqual(4);
      expect(model.resolveIP(1222222223).length).assertEqual(13);
    })

    /**
     * @tc.name   testWlanResolveBoundary0004
     * @tc.number SUB_WLAN_RESOLVE_BOUNDARY_0004
     * @tc.desc   Resolve boundary IPv4 value 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResolveBoundary0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1333333334);
      expect(result.startsWith('13')).assertTrue();
      expect(result.endsWith('334')).assertTrue();
      expect(result.split(':')[2]).assertEqual('333');
    })

    /**
     * @tc.name   testWlanResolveBoundary0005
     * @tc.number SUB_WLAN_RESOLVE_BOUNDARY_0005
     * @tc.desc   Resolve boundary IPv4 value 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResolveBoundary0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1444444445)).assertEqual('14:44:444:445');
      expect(model.resolveIP(1444444445).split(':').length).assertEqual(4);
      expect(model.resolveIP(1444444445).length).assertEqual(13);
    })

    /**
     * @tc.name   testWlanResolveBoundary0006
     * @tc.number SUB_WLAN_RESOLVE_BOUNDARY_0006
     * @tc.desc   Resolve boundary IPv4 value 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResolveBoundary0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1555555556);
      expect(result.startsWith('15')).assertTrue();
      expect(result.endsWith('556')).assertTrue();
      expect(result.split(':')[2]).assertEqual('555');
    })

    /**
     * @tc.name   testWlanResolveBoundary0007
     * @tc.number SUB_WLAN_RESOLVE_BOUNDARY_0007
     * @tc.desc   Resolve boundary IPv4 value 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResolveBoundary0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1666666667)).assertEqual('16:66:666:667');
      expect(model.resolveIP(1666666667).split(':').length).assertEqual(4);
      expect(model.resolveIP(1666666667).length).assertEqual(13);
    })

    /**
     * @tc.name   testWlanResolveBoundary0008
     * @tc.number SUB_WLAN_RESOLVE_BOUNDARY_0008
     * @tc.desc   Resolve boundary IPv4 value 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResolveBoundary0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1777777778);
      expect(result.startsWith('17')).assertTrue();
      expect(result.endsWith('778')).assertTrue();
      expect(result.split(':')[2]).assertEqual('777');
    })

    /**
     * @tc.name   testWlanResolveBoundary0009
     * @tc.number SUB_WLAN_RESOLVE_BOUNDARY_0009
     * @tc.desc   Resolve boundary IPv4 value 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResolveBoundary0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(1888888889)).assertEqual('18:88:888:889');
      expect(model.resolveIP(1888888889).split(':').length).assertEqual(4);
      expect(model.resolveIP(1888888889).length).assertEqual(13);
    })

    /**
     * @tc.name   testWlanResolveBoundary0010
     * @tc.number SUB_WLAN_RESOLVE_BOUNDARY_0010
     * @tc.desc   Resolve boundary IPv4 value 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResolveBoundary0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1999999990);
      expect(result.startsWith('19')).assertTrue();
      expect(result.endsWith('990')).assertTrue();
      expect(result.split(':')[2]).assertEqual('999');
    })

    /**
     * @tc.name   testWlanResolveBoundary0011
     * @tc.number SUB_WLAN_RESOLVE_BOUNDARY_0011
     * @tc.desc   Resolve boundary IPv4 value 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResolveBoundary0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(2000000001)).assertEqual('20:00:000:001');
      expect(model.resolveIP(2000000001).split(':').length).assertEqual(4);
      expect(model.resolveIP(2000000001).length).assertEqual(13);
    })

    /**
     * @tc.name   testWlanResolveBoundary0012
     * @tc.number SUB_WLAN_RESOLVE_BOUNDARY_0012
     * @tc.desc   Resolve boundary IPv4 value 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResolveBoundary0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(2111111112);
      expect(result.startsWith('21')).assertTrue();
      expect(result.endsWith('112')).assertTrue();
      expect(result.split(':')[2]).assertEqual('111');
    })

    /**
     * @tc.name   testWlanResolveBoundary0013
     * @tc.number SUB_WLAN_RESOLVE_BOUNDARY_0013
     * @tc.desc   Resolve boundary IPv4 value 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResolveBoundary0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(2222222223)).assertEqual('22:22:222:223');
      expect(model.resolveIP(2222222223).split(':').length).assertEqual(4);
      expect(model.resolveIP(2222222223).length).assertEqual(13);
    })

    /**
     * @tc.name   testWlanResolveBoundary0014
     * @tc.number SUB_WLAN_RESOLVE_BOUNDARY_0014
     * @tc.desc   Resolve boundary IPv4 value 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResolveBoundary0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(2333333334);
      expect(result.startsWith('23')).assertTrue();
      expect(result.endsWith('334')).assertTrue();
      expect(result.split(':')[2]).assertEqual('333');
    })

    /**
     * @tc.name   testWlanResolveBoundary0015
     * @tc.number SUB_WLAN_RESOLVE_BOUNDARY_0015
     * @tc.desc   Resolve boundary IPv4 value 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResolveBoundary0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(2444444445)).assertEqual('24:44:444:445');
      expect(model.resolveIP(2444444445).split(':').length).assertEqual(4);
      expect(model.resolveIP(2444444445).length).assertEqual(13);
    })

    /**
     * @tc.name   testWlanResolveBoundary0016
     * @tc.number SUB_WLAN_RESOLVE_BOUNDARY_0016
     * @tc.desc   Resolve boundary IPv4 value 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResolveBoundary0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(2555555556);
      expect(result.startsWith('25')).assertTrue();
      expect(result.endsWith('556')).assertTrue();
      expect(result.split(':')[2]).assertEqual('555');
    })

    /**
     * @tc.name   testWlanResolveBoundary0017
     * @tc.number SUB_WLAN_RESOLVE_BOUNDARY_0017
     * @tc.desc   Resolve boundary IPv4 value 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResolveBoundary0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(2666666667)).assertEqual('26:66:666:667');
      expect(model.resolveIP(2666666667).split(':').length).assertEqual(4);
      expect(model.resolveIP(2666666667).length).assertEqual(13);
    })

    /**
     * @tc.name   testWlanResolveBoundary0018
     * @tc.number SUB_WLAN_RESOLVE_BOUNDARY_0018
     * @tc.desc   Resolve boundary IPv4 value 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResolveBoundary0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(2777777778);
      expect(result.startsWith('27')).assertTrue();
      expect(result.endsWith('778')).assertTrue();
      expect(result.split(':')[2]).assertEqual('777');
    })

    /**
     * @tc.name   testWlanResolveBoundary0019
     * @tc.number SUB_WLAN_RESOLVE_BOUNDARY_0019
     * @tc.desc   Resolve boundary IPv4 value 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResolveBoundary0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(2888888889)).assertEqual('28:88:888:889');
      expect(model.resolveIP(2888888889).split(':').length).assertEqual(4);
      expect(model.resolveIP(2888888889).length).assertEqual(13);
    })

    /**
     * @tc.name   testWlanResolveBoundary0020
     * @tc.number SUB_WLAN_RESOLVE_BOUNDARY_0020
     * @tc.desc   Resolve boundary IPv4 value 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResolveBoundary0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(2999999990);
      expect(result.startsWith('29')).assertTrue();
      expect(result.endsWith('990')).assertTrue();
      expect(result.split(':')[2]).assertEqual('999');
    })
  })
}
