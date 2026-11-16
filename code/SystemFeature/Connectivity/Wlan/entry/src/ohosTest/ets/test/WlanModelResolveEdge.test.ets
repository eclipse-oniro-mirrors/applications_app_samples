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

export default function wlanModelResolveEdgeTest() {
  describe('WlanModelResolveEdgeTest', () => {

    /**
     * @tc.name   testWlanResolveEdge0001
     * @tc.number SUB_WLAN_RESOLVE_EDGE_0001
     * @tc.desc   Resolve nine-digit IPv4 variant 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResolveEdge0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(100000001);
      expect(result).assertEqual('10:00:000:01');
      expect(result.length).assertEqual(12);
      expect(result.split(':').length).assertEqual(4);
      expect(result.split(':')[3]).assertEqual('01');
    })

    /**
     * @tc.name   testWlanResolveEdge0002
     * @tc.number SUB_WLAN_RESOLVE_EDGE_0002
     * @tc.desc   Resolve nine-digit IPv4 variant 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResolveEdge0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(123456789);
      expect(result).assertEqual('12:34:567:89');
      expect(result.length).assertEqual(12);
      expect(result.split(':').length).assertEqual(4);
      expect(result.split(':')[3]).assertEqual('89');
    })

    /**
     * @tc.name   testWlanResolveEdge0003
     * @tc.number SUB_WLAN_RESOLVE_EDGE_0003
     * @tc.desc   Resolve nine-digit IPv4 variant 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResolveEdge0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(200000003);
      expect(result).assertEqual('20:00:000:03');
      expect(result.length).assertEqual(12);
      expect(result.split(':').length).assertEqual(4);
      expect(result.split(':')[3]).assertEqual('03');
    })

    /**
     * @tc.name   testWlanResolveEdge0004
     * @tc.number SUB_WLAN_RESOLVE_EDGE_0004
     * @tc.desc   Resolve nine-digit IPv4 variant 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResolveEdge0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(214748365);
      expect(result).assertEqual('21:47:483:65');
      expect(result.length).assertEqual(12);
      expect(result.split(':').length).assertEqual(4);
      expect(result.split(':')[3]).assertEqual('65');
    })

    /**
     * @tc.name   testWlanResolveEdge0005
     * @tc.number SUB_WLAN_RESOLVE_EDGE_0005
     * @tc.desc   Resolve nine-digit IPv4 variant 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResolveEdge0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(234567891);
      expect(result).assertEqual('23:45:678:91');
      expect(result.length).assertEqual(12);
      expect(result.split(':').length).assertEqual(4);
      expect(result.split(':')[3]).assertEqual('91');
    })

    /**
     * @tc.name   testWlanResolveEdge0006
     * @tc.number SUB_WLAN_RESOLVE_EDGE_0006
     * @tc.desc   Resolve nine-digit IPv4 variant 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResolveEdge0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(250000007);
      expect(result).assertEqual('25:00:000:07');
      expect(result.length).assertEqual(12);
      expect(result.split(':').length).assertEqual(4);
      expect(result.split(':')[3]).assertEqual('07');
    })

    /**
     * @tc.name   testWlanResolveEdge0007
     * @tc.number SUB_WLAN_RESOLVE_EDGE_0007
     * @tc.desc   Resolve nine-digit IPv4 variant 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResolveEdge0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(268435461);
      expect(result).assertEqual('26:84:354:61');
      expect(result.length).assertEqual(12);
      expect(result.split(':').length).assertEqual(4);
      expect(result.split(':')[3]).assertEqual('61');
    })

    /**
     * @tc.name   testWlanResolveEdge0008
     * @tc.number SUB_WLAN_RESOLVE_EDGE_0008
     * @tc.desc   Resolve nine-digit IPv4 variant 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResolveEdge0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(285212679);
      expect(result).assertEqual('28:52:126:79');
      expect(result.length).assertEqual(12);
      expect(result.split(':').length).assertEqual(4);
      expect(result.split(':')[3]).assertEqual('79');
    })

    /**
     * @tc.name   testWlanResolveEdge0009
     * @tc.number SUB_WLAN_RESOLVE_EDGE_0009
     * @tc.desc   Resolve nine-digit IPv4 variant 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResolveEdge0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(300000013);
      expect(result).assertEqual('30:00:000:13');
      expect(result.length).assertEqual(12);
      expect(result.split(':').length).assertEqual(4);
      expect(result.split(':')[3]).assertEqual('13');
    })

    /**
     * @tc.name   testWlanResolveEdge0010
     * @tc.number SUB_WLAN_RESOLVE_EDGE_0010
     * @tc.desc   Resolve nine-digit IPv4 variant 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResolveEdge0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(314159271);
      expect(result).assertEqual('31:41:592:71');
      expect(result.length).assertEqual(12);
      expect(result.split(':').length).assertEqual(4);
      expect(result.split(':')[3]).assertEqual('71');
    })

    /**
     * @tc.name   testWlanResolveEdge0011
     * @tc.number SUB_WLAN_RESOLVE_EDGE_0011
     * @tc.desc   Resolve nine-digit IPv4 variant 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResolveEdge0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(323223579);
      expect(result).assertEqual('32:32:235:79');
      expect(result.length).assertEqual(12);
      expect(result.split(':').length).assertEqual(4);
      expect(result.split(':')[3]).assertEqual('79');
    })

    /**
     * @tc.name   testWlanResolveEdge0012
     * @tc.number SUB_WLAN_RESOLVE_EDGE_0012
     * @tc.desc   Resolve nine-digit IPv4 variant 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResolveEdge0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(333333337);
      expect(result).assertEqual('33:33:333:37');
      expect(result.length).assertEqual(12);
      expect(result.split(':').length).assertEqual(4);
      expect(result.split(':')[3]).assertEqual('37');
    })
  })
}
