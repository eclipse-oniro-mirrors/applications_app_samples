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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { WifiModel } from '../../../../src/main/ets/model/WifiModel';
import Logger from '../../../../src/main/ets/model/Logger';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function wlanModelLogicTest() {
  describe('WlanModelLogicTest', () => {

    /**
     * @tc.name   ohos.samples.wlan_ModelLogic_0001
     * @tc.number SUB_WLAN_MODEL_0001
     * @tc.desc   Convert the zero IPv4 integer to the documented placeholder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ModelLogic_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelLogic_0001 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(0)), String('00:00:000:000'));
      expect(model.resolveIP(0)).assertEqual('00:00:000:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(0).split(':').length), String(4));
      expect(model.resolveIP(0).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(model.resolveIP(0).startsWith('00')));
      expect(model.resolveIP(0).startsWith('00')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelLogic_0001 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ModelLogic_0002
     * @tc.number SUB_WLAN_MODEL_0002
     * @tc.desc   Resolve IPv4 integer 3232235777 into colon-separated parts.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ModelLogic_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelLogic_0002 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(3232235777);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('32:32:235:777'));
      expect(result).assertEqual('32:32:235:777');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(4));
      expect(result.split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelLogic_0002 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ModelLogic_0003
     * @tc.number SUB_WLAN_MODEL_0003
     * @tc.desc   Resolve IPv4 integer 167772161 into colon-separated parts.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ModelLogic_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelLogic_0003 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(167772161);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('16:77:721:61'));
      expect(result).assertEqual('16:77:721:61');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(4));
      expect(result.split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelLogic_0003 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ModelLogic_0004
     * @tc.number SUB_WLAN_MODEL_0004
     * @tc.desc   Resolve IPv4 integer 2886729729 into colon-separated parts.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ModelLogic_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelLogic_0004 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(2886729729);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('28:86:729:729'));
      expect(result).assertEqual('28:86:729:729');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(4));
      expect(result.split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelLogic_0004 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ModelLogic_0005
     * @tc.number SUB_WLAN_MODEL_0005
     * @tc.desc   Resolve IPv4 integer 4294967295 into colon-separated parts.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ModelLogic_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelLogic_0005 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(4294967295);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('42:94:967:295'));
      expect(result).assertEqual('42:94:967:295');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(4));
      expect(result.split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelLogic_0005 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ModelLogic_0006
     * @tc.number SUB_WLAN_MODEL_0006
     * @tc.desc   Resolve IPv4 integer 134744072 into colon-separated parts.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ModelLogic_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelLogic_0006 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(134744072);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('13:47:440:72'));
      expect(result).assertEqual('13:47:440:72');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(4));
      expect(result.split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelLogic_0006 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ModelLogic_0007
     * @tc.number SUB_WLAN_MODEL_0007
     * @tc.desc   Resolve IPv4 integer 16843009 into colon-separated parts.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ModelLogic_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelLogic_0007 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(16843009);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('16:84:300:9'));
      expect(result).assertEqual('16:84:300:9');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(4));
      expect(result.split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelLogic_0007 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ModelLogic_0008
     * @tc.number SUB_WLAN_MODEL_0008
     * @tc.desc   Resolve IPv4 integer 285212672 into colon-separated parts.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ModelLogic_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelLogic_0008 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(285212672);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('28:52:126:72'));
      expect(result).assertEqual('28:52:126:72');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(4));
      expect(result.split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelLogic_0008 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ModelLogic_0009
     * @tc.number SUB_WLAN_MODEL_0009
     * @tc.desc   Resolve IPv4 integer 2130706433 into colon-separated parts.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ModelLogic_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelLogic_0009 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(2130706433);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('21:30:706:433'));
      expect(result).assertEqual('21:30:706:433');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(4));
      expect(result.split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelLogic_0009 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ModelLogic_0010
     * @tc.number SUB_WLAN_MODEL_0010
     * @tc.desc   Resolve IPv4 integer 16909060 into colon-separated parts.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ModelLogic_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelLogic_0010 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(16909060);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('16:90:906:0'));
      expect(result).assertEqual('16:90:906:0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(4));
      expect(result.split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelLogic_0010 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ModelLogic_0011
     * @tc.number SUB_WLAN_MODEL_0011
     * @tc.desc   Resolve IPv4 integer 3221225473 into colon-separated parts.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ModelLogic_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelLogic_0011 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(3221225473);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('32:21:225:473'));
      expect(result).assertEqual('32:21:225:473');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(4));
      expect(result.split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelLogic_0011 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ModelLogic_0012
     * @tc.number SUB_WLAN_MODEL_0012
     * @tc.desc   Resolve IPv4 integer 2851995648 into colon-separated parts.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ModelLogic_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelLogic_0012 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(2851995648);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('28:51:995:648'));
      expect(result).assertEqual('28:51:995:648');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(4));
      expect(result.split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelLogic_0012 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ModelLogic_0013
     * @tc.number SUB_WLAN_MODEL_0013
     * @tc.desc   Resolve IPv4 integer 3405803777 into colon-separated parts.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ModelLogic_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelLogic_0013 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(3405803777);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('34:05:803:777'));
      expect(result).assertEqual('34:05:803:777');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(4));
      expect(result.split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelLogic_0013 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ModelLogic_0014
     * @tc.number SUB_WLAN_MODEL_0014
     * @tc.desc   Verify the public WifiModel method set.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ModelLogic_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelLogic_0014 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof model.getScanInfos === 'function'));
      expect(typeof model.getScanInfos === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof model.connectNetwork === 'function'));
      expect(typeof model.connectNetwork === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof model.resolveIP === 'function'));
      expect(typeof model.resolveIP === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof model.getIpInfo === 'function'));
      expect(typeof model.getIpInfo === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof model.getCountryCode === 'function'));
      expect(typeof model.getCountryCode === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof model.getFeatureSupport === 'function'));
      expect(typeof model.getFeatureSupport === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelLogic_0014 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ModelLogic_0015
     * @tc.number SUB_WLAN_MODEL_0015
     * @tc.desc   Verify the Logger helper exposes four logging levels.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ModelLogic_0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelLogic_0015 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof Logger.log === 'function'));
      expect(typeof Logger.log === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof Logger.info === 'function'));
      expect(typeof Logger.info === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof Logger.debug === 'function'));
      expect(typeof Logger.debug === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof Logger.error === 'function'));
      expect(typeof Logger.error === 'function').assertTrue();
      Logger.debug('wlan logger check');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof Logger.log === 'function'));
      expect(typeof Logger.log === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelLogic_0015 end');
    })
  })
}
