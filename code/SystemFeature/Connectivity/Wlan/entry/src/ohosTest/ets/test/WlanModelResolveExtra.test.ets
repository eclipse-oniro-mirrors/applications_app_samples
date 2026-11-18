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
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function wlanModelResolveExtraTest() {
  describe('WlanModelResolveExtraTest', () => {

    /**
     * @tc.name   ohos.samples.wlan_ModelResolveExtra_0001
     * @tc.number SUB_WLAN_RESOLVE_EXTRA_0001
     * @tc.desc   Resolve IPv4 integer variant 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ModelResolveExtra_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveExtra_0001 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000000000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('10:00:000:000'));
      expect(result).assertEqual('10:00:000:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(4));
      expect(result.split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(13));
      expect(result.length).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveExtra_0001 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ModelResolveExtra_0002
     * @tc.number SUB_WLAN_RESOLVE_EXTRA_0002
     * @tc.desc   Resolve IPv4 integer variant 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ModelResolveExtra_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveExtra_0002 begin');
      const model: WifiModel = new WifiModel();
      const parts: string[] = model.resolveIP(1234567890).split(':');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(parts[0]), String('12'));
      expect(parts[0]).assertEqual('12');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(parts[1]), String('34'));
      expect(parts[1]).assertEqual('34');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(parts[2]), String('567'));
      expect(parts[2]).assertEqual('567');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(parts[3]), String('890'));
      expect(parts[3]).assertEqual('890');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveExtra_0002 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ModelResolveExtra_0003
     * @tc.number SUB_WLAN_RESOLVE_EXTRA_0003
     * @tc.desc   Resolve IPv4 integer variant 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ModelResolveExtra_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveExtra_0003 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1677721610);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('16')));
      expect(result.startsWith('16')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('610')));
      expect(result.endsWith('610')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.includes(':')));
      expect(result.includes(':')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveExtra_0003 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ModelResolveExtra_0004
     * @tc.number SUB_WLAN_RESOLVE_EXTRA_0004
     * @tc.desc   Resolve IPv4 integer variant 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ModelResolveExtra_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveExtra_0004 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(2000000001);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('20:00:000:001'));
      expect(result).assertEqual('20:00:000:001');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(4));
      expect(result.split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(13));
      expect(result.length).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveExtra_0004 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ModelResolveExtra_0005
     * @tc.number SUB_WLAN_RESOLVE_EXTRA_0005
     * @tc.desc   Resolve IPv4 integer variant 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ModelResolveExtra_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveExtra_0005 begin');
      const model: WifiModel = new WifiModel();
      const parts: string[] = model.resolveIP(2147483647).split(':');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(parts[0]), String('21'));
      expect(parts[0]).assertEqual('21');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(parts[1]), String('47'));
      expect(parts[1]).assertEqual('47');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(parts[2]), String('483'));
      expect(parts[2]).assertEqual('483');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(parts[3]), String('647'));
      expect(parts[3]).assertEqual('647');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveExtra_0005 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ModelResolveExtra_0006
     * @tc.number SUB_WLAN_RESOLVE_EXTRA_0006
     * @tc.desc   Resolve IPv4 integer variant 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ModelResolveExtra_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveExtra_0006 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(2222222222);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('22')));
      expect(result.startsWith('22')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('222')));
      expect(result.endsWith('222')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.includes(':')));
      expect(result.includes(':')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveExtra_0006 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ModelResolveExtra_0007
     * @tc.number SUB_WLAN_RESOLVE_EXTRA_0007
     * @tc.desc   Resolve IPv4 integer variant 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ModelResolveExtra_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveExtra_0007 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(2345678901);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('23:45:678:901'));
      expect(result).assertEqual('23:45:678:901');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(4));
      expect(result.split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(13));
      expect(result.length).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveExtra_0007 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ModelResolveExtra_0008
     * @tc.number SUB_WLAN_RESOLVE_EXTRA_0008
     * @tc.desc   Resolve IPv4 integer variant 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ModelResolveExtra_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveExtra_0008 begin');
      const model: WifiModel = new WifiModel();
      const parts: string[] = model.resolveIP(2500000000).split(':');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(parts[0]), String('25'));
      expect(parts[0]).assertEqual('25');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(parts[1]), String('00'));
      expect(parts[1]).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(parts[2]), String('000'));
      expect(parts[2]).assertEqual('000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(parts[3]), String('000'));
      expect(parts[3]).assertEqual('000');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveExtra_0008 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ModelResolveExtra_0009
     * @tc.number SUB_WLAN_RESOLVE_EXTRA_0009
     * @tc.desc   Resolve IPv4 integer variant 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ModelResolveExtra_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveExtra_0009 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(2684354559);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('26')));
      expect(result.startsWith('26')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('559')));
      expect(result.endsWith('559')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.includes(':')));
      expect(result.includes(':')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveExtra_0009 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ModelResolveExtra_0010
     * @tc.number SUB_WLAN_RESOLVE_EXTRA_0010
     * @tc.desc   Resolve IPv4 integer variant 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ModelResolveExtra_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveExtra_0010 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(2852126720);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('28:52:126:720'));
      expect(result).assertEqual('28:52:126:720');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(4));
      expect(result.split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(13));
      expect(result.length).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveExtra_0010 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ModelResolveExtra_0011
     * @tc.number SUB_WLAN_RESOLVE_EXTRA_0011
     * @tc.desc   Resolve IPv4 integer variant 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ModelResolveExtra_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveExtra_0011 begin');
      const model: WifiModel = new WifiModel();
      const parts: string[] = model.resolveIP(3000000003).split(':');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(parts[0]), String('30'));
      expect(parts[0]).assertEqual('30');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(parts[1]), String('00'));
      expect(parts[1]).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(parts[2]), String('000'));
      expect(parts[2]).assertEqual('000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(parts[3]), String('003'));
      expect(parts[3]).assertEqual('003');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveExtra_0011 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ModelResolveExtra_0012
     * @tc.number SUB_WLAN_RESOLVE_EXTRA_0012
     * @tc.desc   Resolve IPv4 integer variant 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ModelResolveExtra_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveExtra_0012 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(3141592653);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('31')));
      expect(result.startsWith('31')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('653')));
      expect(result.endsWith('653')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.includes(':')));
      expect(result.includes(':')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveExtra_0012 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ModelResolveExtra_0013
     * @tc.number SUB_WLAN_RESOLVE_EXTRA_0013
     * @tc.desc   Resolve IPv4 integer variant 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ModelResolveExtra_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveExtra_0013 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(3232235777);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('32:32:235:777'));
      expect(result).assertEqual('32:32:235:777');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(4));
      expect(result.split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(13));
      expect(result.length).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveExtra_0013 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ModelResolveExtra_0014
     * @tc.number SUB_WLAN_RESOLVE_EXTRA_0014
     * @tc.desc   Resolve IPv4 integer variant 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ModelResolveExtra_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveExtra_0014 begin');
      const model: WifiModel = new WifiModel();
      const parts: string[] = model.resolveIP(3333333333).split(':');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(parts[0]), String('33'));
      expect(parts[0]).assertEqual('33');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(parts[1]), String('33'));
      expect(parts[1]).assertEqual('33');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(parts[2]), String('333'));
      expect(parts[2]).assertEqual('333');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(parts[3]), String('333'));
      expect(parts[3]).assertEqual('333');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveExtra_0014 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ModelResolveExtra_0015
     * @tc.number SUB_WLAN_RESOLVE_EXTRA_0015
     * @tc.desc   Resolve IPv4 integer variant 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ModelResolveExtra_0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveExtra_0015 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(3456789012);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('34')));
      expect(result.startsWith('34')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('012')));
      expect(result.endsWith('012')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.includes(':')));
      expect(result.includes(':')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveExtra_0015 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ModelResolveExtra_0016
     * @tc.number SUB_WLAN_RESOLVE_EXTRA_0016
     * @tc.desc   Resolve IPv4 integer variant 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ModelResolveExtra_0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveExtra_0016 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(3500000000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('35:00:000:000'));
      expect(result).assertEqual('35:00:000:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(4));
      expect(result.split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(13));
      expect(result.length).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveExtra_0016 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ModelResolveExtra_0017
     * @tc.number SUB_WLAN_RESOLVE_EXTRA_0017
     * @tc.desc   Resolve IPv4 integer variant 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ModelResolveExtra_0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveExtra_0017 begin');
      const model: WifiModel = new WifiModel();
      const parts: string[] = model.resolveIP(3600000001).split(':');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(parts[0]), String('36'));
      expect(parts[0]).assertEqual('36');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(parts[1]), String('00'));
      expect(parts[1]).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(parts[2]), String('000'));
      expect(parts[2]).assertEqual('000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(parts[3]), String('001'));
      expect(parts[3]).assertEqual('001');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveExtra_0017 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ModelResolveExtra_0018
     * @tc.number SUB_WLAN_RESOLVE_EXTRA_0018
     * @tc.desc   Resolve IPv4 integer variant 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ModelResolveExtra_0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveExtra_0018 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(3700000002);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('37')));
      expect(result.startsWith('37')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('002')));
      expect(result.endsWith('002')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.includes(':')));
      expect(result.includes(':')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveExtra_0018 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ModelResolveExtra_0019
     * @tc.number SUB_WLAN_RESOLVE_EXTRA_0019
     * @tc.desc   Resolve IPv4 integer variant 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ModelResolveExtra_0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveExtra_0019 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(3800000003);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('38:00:000:003'));
      expect(result).assertEqual('38:00:000:003');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(4));
      expect(result.split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(13));
      expect(result.length).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveExtra_0019 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ModelResolveExtra_0020
     * @tc.number SUB_WLAN_RESOLVE_EXTRA_0020
     * @tc.desc   Resolve IPv4 integer variant 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ModelResolveExtra_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveExtra_0020 begin');
      const model: WifiModel = new WifiModel();
      const parts: string[] = model.resolveIP(3900000004).split(':');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(parts[0]), String('39'));
      expect(parts[0]).assertEqual('39');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(parts[1]), String('00'));
      expect(parts[1]).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(parts[2]), String('000'));
      expect(parts[2]).assertEqual('000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(parts[3]), String('004'));
      expect(parts[3]).assertEqual('004');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveExtra_0020 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ModelResolveExtra_0021
     * @tc.number SUB_WLAN_RESOLVE_EXTRA_0021
     * @tc.desc   Resolve IPv4 integer variant 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ModelResolveExtra_0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveExtra_0021 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(4000000005);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('40')));
      expect(result.startsWith('40')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('005')));
      expect(result.endsWith('005')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.includes(':')));
      expect(result.includes(':')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveExtra_0021 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ModelResolveExtra_0022
     * @tc.number SUB_WLAN_RESOLVE_EXTRA_0022
     * @tc.desc   Resolve IPv4 integer variant 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ModelResolveExtra_0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveExtra_0022 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(4100000006);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('41:00:000:006'));
      expect(result).assertEqual('41:00:000:006');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(4));
      expect(result.split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(13));
      expect(result.length).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveExtra_0022 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ModelResolveExtra_0023
     * @tc.number SUB_WLAN_RESOLVE_EXTRA_0023
     * @tc.desc   Resolve IPv4 integer variant 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ModelResolveExtra_0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveExtra_0023 begin');
      const model: WifiModel = new WifiModel();
      const parts: string[] = model.resolveIP(4200000007).split(':');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(parts[0]), String('42'));
      expect(parts[0]).assertEqual('42');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(parts[1]), String('00'));
      expect(parts[1]).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(parts[2]), String('000'));
      expect(parts[2]).assertEqual('000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(parts[3]), String('007'));
      expect(parts[3]).assertEqual('007');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveExtra_0023 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ModelResolveExtra_0024
     * @tc.number SUB_WLAN_RESOLVE_EXTRA_0024
     * @tc.desc   Resolve IPv4 integer variant 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ModelResolveExtra_0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveExtra_0024 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(4294967295);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('42')));
      expect(result.startsWith('42')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('295')));
      expect(result.endsWith('295')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.includes(':')));
      expect(result.includes(':')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveExtra_0024 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ModelResolveExtra_0025
     * @tc.number SUB_WLAN_RESOLVE_EXTRA_0025
     * @tc.desc   Resolve IPv4 integer variant 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ModelResolveExtra_0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveExtra_0025 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1111111111);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('11:11:111:111'));
      expect(result).assertEqual('11:11:111:111');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(4));
      expect(result.split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(13));
      expect(result.length).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveExtra_0025 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ModelResolveExtra_0026
     * @tc.number SUB_WLAN_RESOLVE_EXTRA_0026
     * @tc.desc   Resolve IPv4 integer variant 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ModelResolveExtra_0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveExtra_0026 begin');
      const model: WifiModel = new WifiModel();
      const parts: string[] = model.resolveIP(1222222222).split(':');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(parts[0]), String('12'));
      expect(parts[0]).assertEqual('12');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(parts[1]), String('22'));
      expect(parts[1]).assertEqual('22');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(parts[2]), String('222'));
      expect(parts[2]).assertEqual('222');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(parts[3]), String('222'));
      expect(parts[3]).assertEqual('222');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveExtra_0026 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ModelResolveExtra_0027
     * @tc.number SUB_WLAN_RESOLVE_EXTRA_0027
     * @tc.desc   Resolve IPv4 integer variant 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ModelResolveExtra_0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveExtra_0027 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1333333333);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('13')));
      expect(result.startsWith('13')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('333')));
      expect(result.endsWith('333')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.includes(':')));
      expect(result.includes(':')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveExtra_0027 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ModelResolveExtra_0028
     * @tc.number SUB_WLAN_RESOLVE_EXTRA_0028
     * @tc.desc   Resolve IPv4 integer variant 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ModelResolveExtra_0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveExtra_0028 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1444444444);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('14:44:444:444'));
      expect(result).assertEqual('14:44:444:444');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':').length), String(4));
      expect(result.split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(13));
      expect(result.length).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveExtra_0028 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ModelResolveExtra_0029
     * @tc.number SUB_WLAN_RESOLVE_EXTRA_0029
     * @tc.desc   Resolve IPv4 integer variant 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ModelResolveExtra_0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveExtra_0029 begin');
      const model: WifiModel = new WifiModel();
      const parts: string[] = model.resolveIP(1555555555).split(':');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(parts[0]), String('15'));
      expect(parts[0]).assertEqual('15');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(parts[1]), String('55'));
      expect(parts[1]).assertEqual('55');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(parts[2]), String('555'));
      expect(parts[2]).assertEqual('555');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(parts[3]), String('555'));
      expect(parts[3]).assertEqual('555');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveExtra_0029 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ModelResolveExtra_0030
     * @tc.number SUB_WLAN_RESOLVE_EXTRA_0030
     * @tc.desc   Resolve IPv4 integer variant 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ModelResolveExtra_0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveExtra_0030 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1666666666);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('16')));
      expect(result.startsWith('16')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('666')));
      expect(result.endsWith('666')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.includes(':')));
      expect(result.includes(':')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveExtra_0030 end');
    })
  })
}
