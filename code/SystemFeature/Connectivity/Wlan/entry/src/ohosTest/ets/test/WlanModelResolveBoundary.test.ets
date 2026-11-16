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

export default function wlanModelResolveBoundaryTest() {
  describe('WlanModelResolveBoundaryTest', () => {

    /**
     * @tc.name   ohos.samples.wlan_ModelResolveBoundary_0001
     * @tc.number SUB_WLAN_RESOLVE_BOUNDARY_0001
     * @tc.desc   Verify model.resolveIP(1000000001) equals \'10:00:000:001\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ModelResolveBoundary_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveBoundary_0001 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000000001)), String('10:00:000:001'));
      expect(model.resolveIP(1000000001)).assertEqual('10:00:000:001');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000000001).split(':').length), String(4));
      expect(model.resolveIP(1000000001).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000000001).length), String(13));
      expect(model.resolveIP(1000000001).length).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveBoundary_0001 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ModelResolveBoundary_0002
     * @tc.number SUB_WLAN_RESOLVE_BOUNDARY_0002
     * @tc.desc   Verify result.startsWith(\'11\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ModelResolveBoundary_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveBoundary_0002 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1111111112);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('11')));
      expect(result.startsWith('11')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('112')));
      expect(result.endsWith('112')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':')[2]), String('111'));
      expect(result.split(':')[2]).assertEqual('111');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveBoundary_0002 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ModelResolveBoundary_0003
     * @tc.number SUB_WLAN_RESOLVE_BOUNDARY_0003
     * @tc.desc   Verify model.resolveIP(1222222223) equals \'12:22:222:223\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ModelResolveBoundary_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveBoundary_0003 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1222222223)), String('12:22:222:223'));
      expect(model.resolveIP(1222222223)).assertEqual('12:22:222:223');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1222222223).split(':').length), String(4));
      expect(model.resolveIP(1222222223).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1222222223).length), String(13));
      expect(model.resolveIP(1222222223).length).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveBoundary_0003 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ModelResolveBoundary_0004
     * @tc.number SUB_WLAN_RESOLVE_BOUNDARY_0004
     * @tc.desc   Verify result.startsWith(\'13\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ModelResolveBoundary_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveBoundary_0004 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1333333334);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('13')));
      expect(result.startsWith('13')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('334')));
      expect(result.endsWith('334')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':')[2]), String('333'));
      expect(result.split(':')[2]).assertEqual('333');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveBoundary_0004 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ModelResolveBoundary_0005
     * @tc.number SUB_WLAN_RESOLVE_BOUNDARY_0005
     * @tc.desc   Verify model.resolveIP(1444444445) equals \'14:44:444:445\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ModelResolveBoundary_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveBoundary_0005 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1444444445)), String('14:44:444:445'));
      expect(model.resolveIP(1444444445)).assertEqual('14:44:444:445');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1444444445).split(':').length), String(4));
      expect(model.resolveIP(1444444445).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1444444445).length), String(13));
      expect(model.resolveIP(1444444445).length).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveBoundary_0005 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ModelResolveBoundary_0006
     * @tc.number SUB_WLAN_RESOLVE_BOUNDARY_0006
     * @tc.desc   Verify result.startsWith(\'15\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ModelResolveBoundary_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveBoundary_0006 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1555555556);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('15')));
      expect(result.startsWith('15')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('556')));
      expect(result.endsWith('556')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':')[2]), String('555'));
      expect(result.split(':')[2]).assertEqual('555');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveBoundary_0006 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ModelResolveBoundary_0007
     * @tc.number SUB_WLAN_RESOLVE_BOUNDARY_0007
     * @tc.desc   Verify model.resolveIP(1666666667) equals \'16:66:666:667\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ModelResolveBoundary_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveBoundary_0007 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1666666667)), String('16:66:666:667'));
      expect(model.resolveIP(1666666667)).assertEqual('16:66:666:667');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1666666667).split(':').length), String(4));
      expect(model.resolveIP(1666666667).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1666666667).length), String(13));
      expect(model.resolveIP(1666666667).length).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveBoundary_0007 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ModelResolveBoundary_0008
     * @tc.number SUB_WLAN_RESOLVE_BOUNDARY_0008
     * @tc.desc   Verify result.startsWith(\'17\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ModelResolveBoundary_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveBoundary_0008 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1777777778);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('17')));
      expect(result.startsWith('17')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('778')));
      expect(result.endsWith('778')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':')[2]), String('777'));
      expect(result.split(':')[2]).assertEqual('777');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveBoundary_0008 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ModelResolveBoundary_0009
     * @tc.number SUB_WLAN_RESOLVE_BOUNDARY_0009
     * @tc.desc   Verify model.resolveIP(1888888889) equals \'18:88:888:889\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ModelResolveBoundary_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveBoundary_0009 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1888888889)), String('18:88:888:889'));
      expect(model.resolveIP(1888888889)).assertEqual('18:88:888:889');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1888888889).split(':').length), String(4));
      expect(model.resolveIP(1888888889).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1888888889).length), String(13));
      expect(model.resolveIP(1888888889).length).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveBoundary_0009 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ModelResolveBoundary_0010
     * @tc.number SUB_WLAN_RESOLVE_BOUNDARY_0010
     * @tc.desc   Verify result.startsWith(\'19\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ModelResolveBoundary_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveBoundary_0010 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1999999990);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('19')));
      expect(result.startsWith('19')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('990')));
      expect(result.endsWith('990')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':')[2]), String('999'));
      expect(result.split(':')[2]).assertEqual('999');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveBoundary_0010 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ModelResolveBoundary_0011
     * @tc.number SUB_WLAN_RESOLVE_BOUNDARY_0011
     * @tc.desc   Verify model.resolveIP(2000000001) equals \'20:00:000:001\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ModelResolveBoundary_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveBoundary_0011 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(2000000001)), String('20:00:000:001'));
      expect(model.resolveIP(2000000001)).assertEqual('20:00:000:001');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(2000000001).split(':').length), String(4));
      expect(model.resolveIP(2000000001).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(2000000001).length), String(13));
      expect(model.resolveIP(2000000001).length).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveBoundary_0011 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ModelResolveBoundary_0012
     * @tc.number SUB_WLAN_RESOLVE_BOUNDARY_0012
     * @tc.desc   Verify result.startsWith(\'21\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ModelResolveBoundary_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveBoundary_0012 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(2111111112);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('21')));
      expect(result.startsWith('21')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('112')));
      expect(result.endsWith('112')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':')[2]), String('111'));
      expect(result.split(':')[2]).assertEqual('111');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveBoundary_0012 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ModelResolveBoundary_0013
     * @tc.number SUB_WLAN_RESOLVE_BOUNDARY_0013
     * @tc.desc   Verify model.resolveIP(2222222223) equals \'22:22:222:223\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ModelResolveBoundary_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveBoundary_0013 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(2222222223)), String('22:22:222:223'));
      expect(model.resolveIP(2222222223)).assertEqual('22:22:222:223');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(2222222223).split(':').length), String(4));
      expect(model.resolveIP(2222222223).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(2222222223).length), String(13));
      expect(model.resolveIP(2222222223).length).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveBoundary_0013 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ModelResolveBoundary_0014
     * @tc.number SUB_WLAN_RESOLVE_BOUNDARY_0014
     * @tc.desc   Verify result.startsWith(\'23\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ModelResolveBoundary_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveBoundary_0014 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(2333333334);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('23')));
      expect(result.startsWith('23')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('334')));
      expect(result.endsWith('334')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':')[2]), String('333'));
      expect(result.split(':')[2]).assertEqual('333');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveBoundary_0014 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ModelResolveBoundary_0015
     * @tc.number SUB_WLAN_RESOLVE_BOUNDARY_0015
     * @tc.desc   Verify model.resolveIP(2444444445) equals \'24:44:444:445\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ModelResolveBoundary_0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveBoundary_0015 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(2444444445)), String('24:44:444:445'));
      expect(model.resolveIP(2444444445)).assertEqual('24:44:444:445');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(2444444445).split(':').length), String(4));
      expect(model.resolveIP(2444444445).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(2444444445).length), String(13));
      expect(model.resolveIP(2444444445).length).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveBoundary_0015 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ModelResolveBoundary_0016
     * @tc.number SUB_WLAN_RESOLVE_BOUNDARY_0016
     * @tc.desc   Verify result.startsWith(\'25\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ModelResolveBoundary_0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveBoundary_0016 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(2555555556);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('25')));
      expect(result.startsWith('25')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('556')));
      expect(result.endsWith('556')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':')[2]), String('555'));
      expect(result.split(':')[2]).assertEqual('555');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveBoundary_0016 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ModelResolveBoundary_0017
     * @tc.number SUB_WLAN_RESOLVE_BOUNDARY_0017
     * @tc.desc   Verify model.resolveIP(2666666667) equals \'26:66:666:667\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ModelResolveBoundary_0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveBoundary_0017 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(2666666667)), String('26:66:666:667'));
      expect(model.resolveIP(2666666667)).assertEqual('26:66:666:667');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(2666666667).split(':').length), String(4));
      expect(model.resolveIP(2666666667).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(2666666667).length), String(13));
      expect(model.resolveIP(2666666667).length).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveBoundary_0017 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ModelResolveBoundary_0018
     * @tc.number SUB_WLAN_RESOLVE_BOUNDARY_0018
     * @tc.desc   Verify result.startsWith(\'27\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ModelResolveBoundary_0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveBoundary_0018 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(2777777778);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('27')));
      expect(result.startsWith('27')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('778')));
      expect(result.endsWith('778')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':')[2]), String('777'));
      expect(result.split(':')[2]).assertEqual('777');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveBoundary_0018 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ModelResolveBoundary_0019
     * @tc.number SUB_WLAN_RESOLVE_BOUNDARY_0019
     * @tc.desc   Verify model.resolveIP(2888888889) equals \'28:88:888:889\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ModelResolveBoundary_0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveBoundary_0019 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(2888888889)), String('28:88:888:889'));
      expect(model.resolveIP(2888888889)).assertEqual('28:88:888:889');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(2888888889).split(':').length), String(4));
      expect(model.resolveIP(2888888889).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(2888888889).length), String(13));
      expect(model.resolveIP(2888888889).length).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveBoundary_0019 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ModelResolveBoundary_0020
     * @tc.number SUB_WLAN_RESOLVE_BOUNDARY_0020
     * @tc.desc   Verify result.startsWith(\'29\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ModelResolveBoundary_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveBoundary_0020 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(2999999990);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('29')));
      expect(result.startsWith('29')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('990')));
      expect(result.endsWith('990')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':')[2]), String('999'));
      expect(result.split(':')[2]).assertEqual('999');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ModelResolveBoundary_0020 end');
    })
  })
}
