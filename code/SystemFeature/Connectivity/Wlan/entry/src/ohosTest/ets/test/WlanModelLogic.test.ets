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
import Logger from '../../../../src/main/ets/model/Logger';

export default function wlanModelLogicTest() {
  describe('WlanModelLogicTest', () => {

    /**
     * @tc.name   testWlanResolveIpZero0001
     * @tc.number SUB_WLAN_MODEL_0001
     * @tc.desc   Convert the zero IPv4 integer to the documented placeholder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResolveIpZero0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: WifiModel = new WifiModel();
      expect(model.resolveIP(0)).assertEqual('00:00:000:000');
      expect(model.resolveIP(0).split(':').length).assertEqual(4);
      expect(model.resolveIP(0).startsWith('00')).assertTrue();
    })

    /**
     * @tc.name   testWlanResolveIp0002
     * @tc.number SUB_WLAN_MODEL_0002
     * @tc.desc   Resolve IPv4 integer 3232235777 into colon-separated parts.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResolveIp0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(3232235777);
      expect(result).assertEqual('32:32:235:777');
      expect(result.split(':').length).assertEqual(4);
      expect(result.length > 0).assertTrue();
    })

    /**
     * @tc.name   testWlanResolveIp0003
     * @tc.number SUB_WLAN_MODEL_0003
     * @tc.desc   Resolve IPv4 integer 167772161 into colon-separated parts.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResolveIp0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(167772161);
      expect(result).assertEqual('16:77:721:61');
      expect(result.split(':').length).assertEqual(4);
      expect(result.length > 0).assertTrue();
    })

    /**
     * @tc.name   testWlanResolveIp0004
     * @tc.number SUB_WLAN_MODEL_0004
     * @tc.desc   Resolve IPv4 integer 2886729729 into colon-separated parts.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResolveIp0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(2886729729);
      expect(result).assertEqual('28:86:729:729');
      expect(result.split(':').length).assertEqual(4);
      expect(result.length > 0).assertTrue();
    })

    /**
     * @tc.name   testWlanResolveIp0005
     * @tc.number SUB_WLAN_MODEL_0005
     * @tc.desc   Resolve IPv4 integer 4294967295 into colon-separated parts.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResolveIp0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(4294967295);
      expect(result).assertEqual('42:94:967:295');
      expect(result.split(':').length).assertEqual(4);
      expect(result.length > 0).assertTrue();
    })

    /**
     * @tc.name   testWlanResolveIp0006
     * @tc.number SUB_WLAN_MODEL_0006
     * @tc.desc   Resolve IPv4 integer 134744072 into colon-separated parts.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResolveIp0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(134744072);
      expect(result).assertEqual('13:47:440:72');
      expect(result.split(':').length).assertEqual(4);
      expect(result.length > 0).assertTrue();
    })

    /**
     * @tc.name   testWlanResolveIp0007
     * @tc.number SUB_WLAN_MODEL_0007
     * @tc.desc   Resolve IPv4 integer 16843009 into colon-separated parts.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResolveIp0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(16843009);
      expect(result).assertEqual('16:84:300:9');
      expect(result.split(':').length).assertEqual(4);
      expect(result.length > 0).assertTrue();
    })

    /**
     * @tc.name   testWlanResolveIp0008
     * @tc.number SUB_WLAN_MODEL_0008
     * @tc.desc   Resolve IPv4 integer 285212672 into colon-separated parts.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResolveIp0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(285212672);
      expect(result).assertEqual('28:52:126:72');
      expect(result.split(':').length).assertEqual(4);
      expect(result.length > 0).assertTrue();
    })

    /**
     * @tc.name   testWlanResolveIp0009
     * @tc.number SUB_WLAN_MODEL_0009
     * @tc.desc   Resolve IPv4 integer 2130706433 into colon-separated parts.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResolveIp0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(2130706433);
      expect(result).assertEqual('21:30:706:433');
      expect(result.split(':').length).assertEqual(4);
      expect(result.length > 0).assertTrue();
    })

    /**
     * @tc.name   testWlanResolveIp0010
     * @tc.number SUB_WLAN_MODEL_0010
     * @tc.desc   Resolve IPv4 integer 16909060 into colon-separated parts.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResolveIp0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(16909060);
      expect(result).assertEqual('16:90:906:0');
      expect(result.split(':').length).assertEqual(4);
      expect(result.length > 0).assertTrue();
    })

    /**
     * @tc.name   testWlanResolveIp0011
     * @tc.number SUB_WLAN_MODEL_0011
     * @tc.desc   Resolve IPv4 integer 3221225473 into colon-separated parts.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResolveIp0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(3221225473);
      expect(result).assertEqual('32:21:225:473');
      expect(result.split(':').length).assertEqual(4);
      expect(result.length > 0).assertTrue();
    })

    /**
     * @tc.name   testWlanResolveIp0012
     * @tc.number SUB_WLAN_MODEL_0012
     * @tc.desc   Resolve IPv4 integer 2851995648 into colon-separated parts.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResolveIp0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(2851995648);
      expect(result).assertEqual('28:51:995:648');
      expect(result.split(':').length).assertEqual(4);
      expect(result.length > 0).assertTrue();
    })

    /**
     * @tc.name   testWlanResolveIp0013
     * @tc.number SUB_WLAN_MODEL_0013
     * @tc.desc   Resolve IPv4 integer 3405803777 into colon-separated parts.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResolveIp0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(3405803777);
      expect(result).assertEqual('34:05:803:777');
      expect(result.split(':').length).assertEqual(4);
      expect(result.length > 0).assertTrue();
    })

    /**
     * @tc.name   testWlanModelMethods0014
     * @tc.number SUB_WLAN_MODEL_0014
     * @tc.desc   Verify the public WifiModel method set.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanModelMethods0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: WifiModel = new WifiModel();
      expect(typeof model.getScanInfos === 'function').assertTrue();
      expect(typeof model.connectNetwork === 'function').assertTrue();
      expect(typeof model.resolveIP === 'function').assertTrue();
      expect(typeof model.getIpInfo === 'function').assertTrue();
      expect(typeof model.getCountryCode === 'function').assertTrue();
      expect(typeof model.getFeatureSupport === 'function').assertTrue();
    })

    /**
     * @tc.name   testWlanLoggerMethods0015
     * @tc.number SUB_WLAN_MODEL_0015
     * @tc.desc   Verify the Logger helper exposes four logging levels.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanLoggerMethods0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof Logger.log === 'function').assertTrue();
      expect(typeof Logger.info === 'function').assertTrue();
      expect(typeof Logger.debug === 'function').assertTrue();
      expect(typeof Logger.error === 'function').assertTrue();
      Logger.debug('wlan logger check');
      expect(typeof Logger.log === 'function').assertTrue();
    })
  })
}
