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
import { RouteTable } from '../../../../main/ets/utils/RouteTable';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_ResourceManager]';

export default function routeTablePageB02Test() {
  describe('RouteTablePageB02Test', () => {

    /**
     * @tc.name   testRouteTablePageB020001
     * @tc.number SUB_RESMGR_ROUTE_02_0001
     * @tc.desc   resolvePage(ages/Index) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020001 begin');
      const result: string = RouteTable.resolvePage('ages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('ages/Index')), String(false));
      expect(RouteTable.isKnownPage('ages/Index')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020001 end');
    })

    /**
     * @tc.name   testRouteTablePageB020002
     * @tc.number SUB_RESMGR_ROUTE_02_0002
     * @tc.desc   resolvePage(pages/BasicResources/) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020002 begin');
      const result: string = RouteTable.resolvePage('pages/BasicResources/');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/BasicResources/')), String(false));
      expect(RouteTable.isKnownPage('pages/BasicResources/')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020002 end');
    })

    /**
     * @tc.name   testRouteTablePageB020003
     * @tc.number SUB_RESMGR_ROUTE_02_0003
     * @tc.desc   resolvePage(pages/Overlay?x=1) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020003 begin');
      const result: string = RouteTable.resolvePage('pages/Overlay?x=1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Overlay?x=1')), String(false));
      expect(RouteTable.isKnownPage('pages/Overlay?x=1')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020003 end');
    })

    /**
     * @tc.name   testRouteTablePageB020004
     * @tc.number SUB_RESMGR_ROUTE_02_0004
     * @tc.desc   resolvePage(pages/Index?density=640) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020004 begin');
      const result: string = RouteTable.resolvePage('pages/Index?density=640');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Index?density=640')), String(false));
      expect(RouteTable.isKnownPage('pages/Index?density=640')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020004 end');
    })

    /**
     * @tc.name   testRouteTablePageB020005
     * @tc.number SUB_RESMGR_ROUTE_02_0005
     * @tc.desc   resolvePage(pages/BasicResources#top) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020005 begin');
      const result: string = RouteTable.resolvePage('pages/BasicResources#top');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/BasicResources#top')), String(false));
      expect(RouteTable.isKnownPage('pages/BasicResources#top')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020005 end');
    })

    /**
     * @tc.name   testRouteTablePageB020006
     * @tc.number SUB_RESMGR_ROUTE_02_0006
     * @tc.desc   resolvePage(pages/Overlay ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020006 begin');
      const result: string = RouteTable.resolvePage('pages/Overlay ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Overlay ')), String(false));
      expect(RouteTable.isKnownPage('pages/Overlay ')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020006 end');
    })

    /**
     * @tc.name   testRouteTablePageB020007
     * @tc.number SUB_RESMGR_ROUTE_02_0007
     * @tc.desc   resolvePage(pages/IndexX) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020007 begin');
      const result: string = RouteTable.resolvePage('pages/IndexX');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/IndexX')), String(false));
      expect(RouteTable.isKnownPage('pages/IndexX')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020007 end');
    })

    /**
     * @tc.name   testRouteTablePageB020008
     * @tc.number SUB_RESMGR_ROUTE_02_0008
     * @tc.desc   resolvePage(ages/BasicResources) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020008 begin');
      const result: string = RouteTable.resolvePage('ages/BasicResources');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('ages/BasicResources')), String(false));
      expect(RouteTable.isKnownPage('ages/BasicResources')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020008 end');
    })

    /**
     * @tc.name   testRouteTablePageB020009
     * @tc.number SUB_RESMGR_ROUTE_02_0009
     * @tc.desc   resolvePage(pages/Overlay/index) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020009 begin');
      const result: string = RouteTable.resolvePage('pages/Overlay/index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Overlay/index')), String(false));
      expect(RouteTable.isKnownPage('pages/Overlay/index')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020009 end');
    })

    /**
     * @tc.name   testRouteTablePageB020010
     * @tc.number SUB_RESMGR_ROUTE_02_0010
     * @tc.desc   resolvePage(pages/Index) known=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020010 begin');
      const result: string = RouteTable.resolvePage('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Index')), String(true));
      expect(RouteTable.isKnownPage('pages/Index')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020010 end');
    })

    /**
     * @tc.name   testRouteTablePageB020011
     * @tc.number SUB_RESMGR_ROUTE_02_0011
     * @tc.desc   resolvePage(pages/BasicResources/) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020011 begin');
      const result: string = RouteTable.resolvePage('pages/BasicResources/');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/BasicResources/')), String(false));
      expect(RouteTable.isKnownPage('pages/BasicResources/')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020011 end');
    })

    /**
     * @tc.name   testRouteTablePageB020012
     * @tc.number SUB_RESMGR_ROUTE_02_0012
     * @tc.desc   resolvePage(pages/Overlay?x=1) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020012 begin');
      const result: string = RouteTable.resolvePage('pages/Overlay?x=1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Overlay?x=1')), String(false));
      expect(RouteTable.isKnownPage('pages/Overlay?x=1')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020012 end');
    })

    /**
     * @tc.name   testRouteTablePageB020013
     * @tc.number SUB_RESMGR_ROUTE_02_0013
     * @tc.desc   resolvePage(pages/Index?density=640) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020013 begin');
      const result: string = RouteTable.resolvePage('pages/Index?density=640');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Index?density=640')), String(false));
      expect(RouteTable.isKnownPage('pages/Index?density=640')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020013 end');
    })

    /**
     * @tc.name   testRouteTablePageB020014
     * @tc.number SUB_RESMGR_ROUTE_02_0014
     * @tc.desc   resolvePage(pages/BasicResources#top) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020014 begin');
      const result: string = RouteTable.resolvePage('pages/BasicResources#top');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/BasicResources#top')), String(false));
      expect(RouteTable.isKnownPage('pages/BasicResources#top')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020014 end');
    })

    /**
     * @tc.name   testRouteTablePageB020015
     * @tc.number SUB_RESMGR_ROUTE_02_0015
     * @tc.desc   resolvePage(ages/Overlay) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020015 begin');
      const result: string = RouteTable.resolvePage('ages/Overlay');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('ages/Overlay')), String(false));
      expect(RouteTable.isKnownPage('ages/Overlay')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020015 end');
    })

    /**
     * @tc.name   testRouteTablePageB020016
     * @tc.number SUB_RESMGR_ROUTE_02_0016
     * @tc.desc   resolvePage(pages/IndexX) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020016 begin');
      const result: string = RouteTable.resolvePage('pages/IndexX');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/IndexX')), String(false));
      expect(RouteTable.isKnownPage('pages/IndexX')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020016 end');
    })

    /**
     * @tc.name   testRouteTablePageB020017
     * @tc.number SUB_RESMGR_ROUTE_02_0017
     * @tc.desc   resolvePage(pages/BasicResources?) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020017 begin');
      const result: string = RouteTable.resolvePage('pages/BasicResources?');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/BasicResources?')), String(false));
      expect(RouteTable.isKnownPage('pages/BasicResources?')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020017 end');
    })

    /**
     * @tc.name   testRouteTablePageB020018
     * @tc.number SUB_RESMGR_ROUTE_02_0018
     * @tc.desc   resolvePage(pages/Overlay/index) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020018 begin');
      const result: string = RouteTable.resolvePage('pages/Overlay/index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Overlay/index')), String(false));
      expect(RouteTable.isKnownPage('pages/Overlay/index')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020018 end');
    })

    /**
     * @tc.name   testRouteTablePageB020019
     * @tc.number SUB_RESMGR_ROUTE_02_0019
     * @tc.desc   resolvePage(pages/Index) known=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020019 begin');
      const result: string = RouteTable.resolvePage('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Index')), String(true));
      expect(RouteTable.isKnownPage('pages/Index')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020019 end');
    })

    /**
     * @tc.name   testRouteTablePageB020020
     * @tc.number SUB_RESMGR_ROUTE_02_0020
     * @tc.desc   resolvePage(pages/BasicResources/) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020020 begin');
      const result: string = RouteTable.resolvePage('pages/BasicResources/');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/BasicResources/')), String(false));
      expect(RouteTable.isKnownPage('pages/BasicResources/')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020020 end');
    })

    /**
     * @tc.name   testRouteTablePageB020021
     * @tc.number SUB_RESMGR_ROUTE_02_0021
     * @tc.desc   resolvePage(pages/Overlay?x=1) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020021 begin');
      const result: string = RouteTable.resolvePage('pages/Overlay?x=1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Overlay?x=1')), String(false));
      expect(RouteTable.isKnownPage('pages/Overlay?x=1')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020021 end');
    })

    /**
     * @tc.name   testRouteTablePageB020022
     * @tc.number SUB_RESMGR_ROUTE_02_0022
     * @tc.desc   resolvePage(ages/Index) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020022 begin');
      const result: string = RouteTable.resolvePage('ages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('ages/Index')), String(false));
      expect(RouteTable.isKnownPage('ages/Index')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020022 end');
    })

    /**
     * @tc.name   testRouteTablePageB020023
     * @tc.number SUB_RESMGR_ROUTE_02_0023
     * @tc.desc   resolvePage(pages/BasicResources#top) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020023 begin');
      const result: string = RouteTable.resolvePage('pages/BasicResources#top');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/BasicResources#top')), String(false));
      expect(RouteTable.isKnownPage('pages/BasicResources#top')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020023 end');
    })

    /**
     * @tc.name   testRouteTablePageB020024
     * @tc.number SUB_RESMGR_ROUTE_02_0024
     * @tc.desc   resolvePage(pages/Overlay ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020024 begin');
      const result: string = RouteTable.resolvePage('pages/Overlay ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Overlay ')), String(false));
      expect(RouteTable.isKnownPage('pages/Overlay ')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020024 end');
    })

    /**
     * @tc.name   testRouteTablePageB020025
     * @tc.number SUB_RESMGR_ROUTE_02_0025
     * @tc.desc   resolvePage(pages/IndexX) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020025 begin');
      const result: string = RouteTable.resolvePage('pages/IndexX');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/IndexX')), String(false));
      expect(RouteTable.isKnownPage('pages/IndexX')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020025 end');
    })

    /**
     * @tc.name   testRouteTablePageB020026
     * @tc.number SUB_RESMGR_ROUTE_02_0026
     * @tc.desc   resolvePage(pages/BasicResources?) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020026 begin');
      const result: string = RouteTable.resolvePage('pages/BasicResources?');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/BasicResources?')), String(false));
      expect(RouteTable.isKnownPage('pages/BasicResources?')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020026 end');
    })

    /**
     * @tc.name   testRouteTablePageB020027
     * @tc.number SUB_RESMGR_ROUTE_02_0027
     * @tc.desc   resolvePage(pages/Overlay/index) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020027 begin');
      const result: string = RouteTable.resolvePage('pages/Overlay/index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Overlay/index')), String(false));
      expect(RouteTable.isKnownPage('pages/Overlay/index')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020027 end');
    })

    /**
     * @tc.name   testRouteTablePageB020028
     * @tc.number SUB_RESMGR_ROUTE_02_0028
     * @tc.desc   resolvePage(pages/Index) known=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020028 begin');
      const result: string = RouteTable.resolvePage('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Index')), String(true));
      expect(RouteTable.isKnownPage('pages/Index')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020028 end');
    })

    /**
     * @tc.name   testRouteTablePageB020029
     * @tc.number SUB_RESMGR_ROUTE_02_0029
     * @tc.desc   resolvePage(ages/BasicResources) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020029 begin');
      const result: string = RouteTable.resolvePage('ages/BasicResources');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('ages/BasicResources')), String(false));
      expect(RouteTable.isKnownPage('ages/BasicResources')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020029 end');
    })

    /**
     * @tc.name   testRouteTablePageB020030
     * @tc.number SUB_RESMGR_ROUTE_02_0030
     * @tc.desc   resolvePage(pages/Overlay?x=1) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020030 begin');
      const result: string = RouteTable.resolvePage('pages/Overlay?x=1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Overlay?x=1')), String(false));
      expect(RouteTable.isKnownPage('pages/Overlay?x=1')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020030 end');
    })

    /**
     * @tc.name   testRouteTablePageB020031
     * @tc.number SUB_RESMGR_ROUTE_02_0031
     * @tc.desc   resolvePage(pages/Index?density=640) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020031 begin');
      const result: string = RouteTable.resolvePage('pages/Index?density=640');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Index?density=640')), String(false));
      expect(RouteTable.isKnownPage('pages/Index?density=640')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020031 end');
    })

    /**
     * @tc.name   testRouteTablePageB020032
     * @tc.number SUB_RESMGR_ROUTE_02_0032
     * @tc.desc   resolvePage(pages/BasicResources#top) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020032 begin');
      const result: string = RouteTable.resolvePage('pages/BasicResources#top');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/BasicResources#top')), String(false));
      expect(RouteTable.isKnownPage('pages/BasicResources#top')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020032 end');
    })

    /**
     * @tc.name   testRouteTablePageB020033
     * @tc.number SUB_RESMGR_ROUTE_02_0033
     * @tc.desc   resolvePage(pages/Overlay ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020033 begin');
      const result: string = RouteTable.resolvePage('pages/Overlay ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Overlay ')), String(false));
      expect(RouteTable.isKnownPage('pages/Overlay ')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020033 end');
    })

    /**
     * @tc.name   testRouteTablePageB020034
     * @tc.number SUB_RESMGR_ROUTE_02_0034
     * @tc.desc   resolvePage(pages/IndexX) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020034 begin');
      const result: string = RouteTable.resolvePage('pages/IndexX');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/IndexX')), String(false));
      expect(RouteTable.isKnownPage('pages/IndexX')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020034 end');
    })

    /**
     * @tc.name   testRouteTablePageB020035
     * @tc.number SUB_RESMGR_ROUTE_02_0035
     * @tc.desc   resolvePage(pages/BasicResources?) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020035 begin');
      const result: string = RouteTable.resolvePage('pages/BasicResources?');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/BasicResources?')), String(false));
      expect(RouteTable.isKnownPage('pages/BasicResources?')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020035 end');
    })

    /**
     * @tc.name   testRouteTablePageB020036
     * @tc.number SUB_RESMGR_ROUTE_02_0036
     * @tc.desc   resolvePage(ages/Overlay) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020036 begin');
      const result: string = RouteTable.resolvePage('ages/Overlay');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('ages/Overlay')), String(false));
      expect(RouteTable.isKnownPage('ages/Overlay')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020036 end');
    })

    /**
     * @tc.name   testRouteTablePageB020037
     * @tc.number SUB_RESMGR_ROUTE_02_0037
     * @tc.desc   resolvePage(pages/Index) known=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020037 begin');
      const result: string = RouteTable.resolvePage('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Index')), String(true));
      expect(RouteTable.isKnownPage('pages/Index')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020037 end');
    })

    /**
     * @tc.name   testRouteTablePageB020038
     * @tc.number SUB_RESMGR_ROUTE_02_0038
     * @tc.desc   resolvePage(pages/BasicResources/) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020038 begin');
      const result: string = RouteTable.resolvePage('pages/BasicResources/');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/BasicResources/')), String(false));
      expect(RouteTable.isKnownPage('pages/BasicResources/')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020038 end');
    })

    /**
     * @tc.name   testRouteTablePageB020039
     * @tc.number SUB_RESMGR_ROUTE_02_0039
     * @tc.desc   resolvePage(pages/Overlay?x=1) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020039 begin');
      const result: string = RouteTable.resolvePage('pages/Overlay?x=1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Overlay?x=1')), String(false));
      expect(RouteTable.isKnownPage('pages/Overlay?x=1')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020039 end');
    })

    /**
     * @tc.name   testRouteTablePageB020040
     * @tc.number SUB_RESMGR_ROUTE_02_0040
     * @tc.desc   resolvePage(pages/Index?density=640) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020040 begin');
      const result: string = RouteTable.resolvePage('pages/Index?density=640');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Index?density=640')), String(false));
      expect(RouteTable.isKnownPage('pages/Index?density=640')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020040 end');
    })

    /**
     * @tc.name   testRouteTablePageB020041
     * @tc.number SUB_RESMGR_ROUTE_02_0041
     * @tc.desc   resolvePage(pages/BasicResources#top) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020041 begin');
      const result: string = RouteTable.resolvePage('pages/BasicResources#top');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/BasicResources#top')), String(false));
      expect(RouteTable.isKnownPage('pages/BasicResources#top')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020041 end');
    })

    /**
     * @tc.name   testRouteTablePageB020042
     * @tc.number SUB_RESMGR_ROUTE_02_0042
     * @tc.desc   resolvePage(pages/Overlay ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020042 begin');
      const result: string = RouteTable.resolvePage('pages/Overlay ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Overlay ')), String(false));
      expect(RouteTable.isKnownPage('pages/Overlay ')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020042 end');
    })

    /**
     * @tc.name   testRouteTablePageB020043
     * @tc.number SUB_RESMGR_ROUTE_02_0043
     * @tc.desc   resolvePage(ages/Index) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020043 begin');
      const result: string = RouteTable.resolvePage('ages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('ages/Index')), String(false));
      expect(RouteTable.isKnownPage('ages/Index')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020043 end');
    })

    /**
     * @tc.name   testRouteTablePageB020044
     * @tc.number SUB_RESMGR_ROUTE_02_0044
     * @tc.desc   resolvePage(pages/BasicResources?) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020044 begin');
      const result: string = RouteTable.resolvePage('pages/BasicResources?');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/BasicResources?')), String(false));
      expect(RouteTable.isKnownPage('pages/BasicResources?')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020044 end');
    })

    /**
     * @tc.name   testRouteTablePageB020045
     * @tc.number SUB_RESMGR_ROUTE_02_0045
     * @tc.desc   resolvePage(pages/Overlay/index) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020045 begin');
      const result: string = RouteTable.resolvePage('pages/Overlay/index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Overlay/index')), String(false));
      expect(RouteTable.isKnownPage('pages/Overlay/index')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020045 end');
    })

    /**
     * @tc.name   testRouteTablePageB020046
     * @tc.number SUB_RESMGR_ROUTE_02_0046
     * @tc.desc   resolvePage(pages/Index) known=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020046 begin');
      const result: string = RouteTable.resolvePage('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Index')), String(true));
      expect(RouteTable.isKnownPage('pages/Index')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020046 end');
    })

    /**
     * @tc.name   testRouteTablePageB020047
     * @tc.number SUB_RESMGR_ROUTE_02_0047
     * @tc.desc   resolvePage(pages/BasicResources/) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020047 begin');
      const result: string = RouteTable.resolvePage('pages/BasicResources/');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/BasicResources/')), String(false));
      expect(RouteTable.isKnownPage('pages/BasicResources/')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020047 end');
    })

    /**
     * @tc.name   testRouteTablePageB020048
     * @tc.number SUB_RESMGR_ROUTE_02_0048
     * @tc.desc   resolvePage(pages/Overlay?x=1) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020048 begin');
      const result: string = RouteTable.resolvePage('pages/Overlay?x=1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Overlay?x=1')), String(false));
      expect(RouteTable.isKnownPage('pages/Overlay?x=1')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020048 end');
    })

    /**
     * @tc.name   testRouteTablePageB020049
     * @tc.number SUB_RESMGR_ROUTE_02_0049
     * @tc.desc   resolvePage(pages/Index?density=640) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020049 begin');
      const result: string = RouteTable.resolvePage('pages/Index?density=640');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Index?density=640')), String(false));
      expect(RouteTable.isKnownPage('pages/Index?density=640')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020049 end');
    })

    /**
     * @tc.name   testRouteTablePageB020050
     * @tc.number SUB_RESMGR_ROUTE_02_0050
     * @tc.desc   resolvePage(ages/BasicResources) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020050 begin');
      const result: string = RouteTable.resolvePage('ages/BasicResources');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('ages/BasicResources')), String(false));
      expect(RouteTable.isKnownPage('ages/BasicResources')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020050 end');
    })

    /**
     * @tc.name   testRouteTablePageB020051
     * @tc.number SUB_RESMGR_ROUTE_02_0051
     * @tc.desc   resolvePage(pages/Overlay ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020051 begin');
      const result: string = RouteTable.resolvePage('pages/Overlay ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Overlay ')), String(false));
      expect(RouteTable.isKnownPage('pages/Overlay ')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020051 end');
    })

    /**
     * @tc.name   testRouteTablePageB020052
     * @tc.number SUB_RESMGR_ROUTE_02_0052
     * @tc.desc   resolvePage(pages/IndexX) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020052 begin');
      const result: string = RouteTable.resolvePage('pages/IndexX');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/IndexX')), String(false));
      expect(RouteTable.isKnownPage('pages/IndexX')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020052 end');
    })

    /**
     * @tc.name   testRouteTablePageB020053
     * @tc.number SUB_RESMGR_ROUTE_02_0053
     * @tc.desc   resolvePage(pages/BasicResources?) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020053 begin');
      const result: string = RouteTable.resolvePage('pages/BasicResources?');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/BasicResources?')), String(false));
      expect(RouteTable.isKnownPage('pages/BasicResources?')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020053 end');
    })

    /**
     * @tc.name   testRouteTablePageB020054
     * @tc.number SUB_RESMGR_ROUTE_02_0054
     * @tc.desc   resolvePage(pages/Overlay/index) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020054 begin');
      const result: string = RouteTable.resolvePage('pages/Overlay/index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Overlay/index')), String(false));
      expect(RouteTable.isKnownPage('pages/Overlay/index')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020054 end');
    })

    /**
     * @tc.name   testRouteTablePageB020055
     * @tc.number SUB_RESMGR_ROUTE_02_0055
     * @tc.desc   resolvePage(pages/Index) known=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020055 begin');
      const result: string = RouteTable.resolvePage('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Index')), String(true));
      expect(RouteTable.isKnownPage('pages/Index')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020055 end');
    })

    /**
     * @tc.name   testRouteTablePageB020056
     * @tc.number SUB_RESMGR_ROUTE_02_0056
     * @tc.desc   resolvePage(pages/BasicResources/) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020056 begin');
      const result: string = RouteTable.resolvePage('pages/BasicResources/');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/BasicResources/')), String(false));
      expect(RouteTable.isKnownPage('pages/BasicResources/')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020056 end');
    })

    /**
     * @tc.name   testRouteTablePageB020057
     * @tc.number SUB_RESMGR_ROUTE_02_0057
     * @tc.desc   resolvePage(ages/Overlay) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020057 begin');
      const result: string = RouteTable.resolvePage('ages/Overlay');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('ages/Overlay')), String(false));
      expect(RouteTable.isKnownPage('ages/Overlay')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020057 end');
    })

    /**
     * @tc.name   testRouteTablePageB020058
     * @tc.number SUB_RESMGR_ROUTE_02_0058
     * @tc.desc   resolvePage(pages/Index?density=640) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020058 begin');
      const result: string = RouteTable.resolvePage('pages/Index?density=640');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Index?density=640')), String(false));
      expect(RouteTable.isKnownPage('pages/Index?density=640')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020058 end');
    })

    /**
     * @tc.name   testRouteTablePageB020059
     * @tc.number SUB_RESMGR_ROUTE_02_0059
     * @tc.desc   resolvePage(pages/BasicResources#top) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020059 begin');
      const result: string = RouteTable.resolvePage('pages/BasicResources#top');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/BasicResources#top')), String(false));
      expect(RouteTable.isKnownPage('pages/BasicResources#top')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020059 end');
    })

    /**
     * @tc.name   testRouteTablePageB020060
     * @tc.number SUB_RESMGR_ROUTE_02_0060
     * @tc.desc   resolvePage(pages/Overlay ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020060 begin');
      const result: string = RouteTable.resolvePage('pages/Overlay ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Overlay ')), String(false));
      expect(RouteTable.isKnownPage('pages/Overlay ')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020060 end');
    })

    /**
     * @tc.name   testRouteTablePageB020061
     * @tc.number SUB_RESMGR_ROUTE_02_0061
     * @tc.desc   resolvePage(pages/IndexX) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020061 begin');
      const result: string = RouteTable.resolvePage('pages/IndexX');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/IndexX')), String(false));
      expect(RouteTable.isKnownPage('pages/IndexX')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020061 end');
    })

    /**
     * @tc.name   testRouteTablePageB020062
     * @tc.number SUB_RESMGR_ROUTE_02_0062
     * @tc.desc   resolvePage(pages/BasicResources?) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020062 begin');
      const result: string = RouteTable.resolvePage('pages/BasicResources?');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/BasicResources?')), String(false));
      expect(RouteTable.isKnownPage('pages/BasicResources?')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020062 end');
    })

    /**
     * @tc.name   testRouteTablePageB020063
     * @tc.number SUB_RESMGR_ROUTE_02_0063
     * @tc.desc   resolvePage(pages/Overlay/index) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020063 begin');
      const result: string = RouteTable.resolvePage('pages/Overlay/index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Overlay/index')), String(false));
      expect(RouteTable.isKnownPage('pages/Overlay/index')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020063 end');
    })

    /**
     * @tc.name   testRouteTablePageB020064
     * @tc.number SUB_RESMGR_ROUTE_02_0064
     * @tc.desc   resolvePage(ages/Index) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020064 begin');
      const result: string = RouteTable.resolvePage('ages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('ages/Index')), String(false));
      expect(RouteTable.isKnownPage('ages/Index')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020064 end');
    })

    /**
     * @tc.name   testRouteTablePageB020065
     * @tc.number SUB_RESMGR_ROUTE_02_0065
     * @tc.desc   resolvePage(pages/BasicResources/) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020065 begin');
      const result: string = RouteTable.resolvePage('pages/BasicResources/');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/BasicResources/')), String(false));
      expect(RouteTable.isKnownPage('pages/BasicResources/')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020065 end');
    })

    /**
     * @tc.name   testRouteTablePageB020066
     * @tc.number SUB_RESMGR_ROUTE_02_0066
     * @tc.desc   resolvePage(pages/Overlay?x=1) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020066 begin');
      const result: string = RouteTable.resolvePage('pages/Overlay?x=1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Overlay?x=1')), String(false));
      expect(RouteTable.isKnownPage('pages/Overlay?x=1')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020066 end');
    })

    /**
     * @tc.name   testRouteTablePageB020067
     * @tc.number SUB_RESMGR_ROUTE_02_0067
     * @tc.desc   resolvePage(pages/Index?density=640) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020067 begin');
      const result: string = RouteTable.resolvePage('pages/Index?density=640');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Index?density=640')), String(false));
      expect(RouteTable.isKnownPage('pages/Index?density=640')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020067 end');
    })

    /**
     * @tc.name   testRouteTablePageB020068
     * @tc.number SUB_RESMGR_ROUTE_02_0068
     * @tc.desc   resolvePage(pages/BasicResources#top) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020068 begin');
      const result: string = RouteTable.resolvePage('pages/BasicResources#top');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/BasicResources#top')), String(false));
      expect(RouteTable.isKnownPage('pages/BasicResources#top')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020068 end');
    })

    /**
     * @tc.name   testRouteTablePageB020069
     * @tc.number SUB_RESMGR_ROUTE_02_0069
     * @tc.desc   resolvePage(pages/Overlay ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020069 begin');
      const result: string = RouteTable.resolvePage('pages/Overlay ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Overlay ')), String(false));
      expect(RouteTable.isKnownPage('pages/Overlay ')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020069 end');
    })

    /**
     * @tc.name   testRouteTablePageB020070
     * @tc.number SUB_RESMGR_ROUTE_02_0070
     * @tc.desc   resolvePage(pages/IndexX) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020070 begin');
      const result: string = RouteTable.resolvePage('pages/IndexX');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/IndexX')), String(false));
      expect(RouteTable.isKnownPage('pages/IndexX')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020070 end');
    })

    /**
     * @tc.name   testRouteTablePageB020071
     * @tc.number SUB_RESMGR_ROUTE_02_0071
     * @tc.desc   resolvePage(ages/BasicResources) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020071 begin');
      const result: string = RouteTable.resolvePage('ages/BasicResources');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('ages/BasicResources')), String(false));
      expect(RouteTable.isKnownPage('ages/BasicResources')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020071 end');
    })

    /**
     * @tc.name   testRouteTablePageB020072
     * @tc.number SUB_RESMGR_ROUTE_02_0072
     * @tc.desc   resolvePage(pages/Overlay/index) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020072 begin');
      const result: string = RouteTable.resolvePage('pages/Overlay/index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Overlay/index')), String(false));
      expect(RouteTable.isKnownPage('pages/Overlay/index')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020072 end');
    })

    /**
     * @tc.name   testRouteTablePageB020073
     * @tc.number SUB_RESMGR_ROUTE_02_0073
     * @tc.desc   resolvePage(pages/Index) known=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020073 begin');
      const result: string = RouteTable.resolvePage('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Index')), String(true));
      expect(RouteTable.isKnownPage('pages/Index')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020073 end');
    })

    /**
     * @tc.name   testRouteTablePageB020074
     * @tc.number SUB_RESMGR_ROUTE_02_0074
     * @tc.desc   resolvePage(pages/BasicResources/) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020074 begin');
      const result: string = RouteTable.resolvePage('pages/BasicResources/');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/BasicResources/')), String(false));
      expect(RouteTable.isKnownPage('pages/BasicResources/')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020074 end');
    })

    /**
     * @tc.name   testRouteTablePageB020075
     * @tc.number SUB_RESMGR_ROUTE_02_0075
     * @tc.desc   resolvePage(pages/Overlay?x=1) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020075 begin');
      const result: string = RouteTable.resolvePage('pages/Overlay?x=1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Overlay?x=1')), String(false));
      expect(RouteTable.isKnownPage('pages/Overlay?x=1')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020075 end');
    })

    /**
     * @tc.name   testRouteTablePageB020076
     * @tc.number SUB_RESMGR_ROUTE_02_0076
     * @tc.desc   resolvePage(pages/Index?density=640) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020076 begin');
      const result: string = RouteTable.resolvePage('pages/Index?density=640');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Index?density=640')), String(false));
      expect(RouteTable.isKnownPage('pages/Index?density=640')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020076 end');
    })

    /**
     * @tc.name   testRouteTablePageB020077
     * @tc.number SUB_RESMGR_ROUTE_02_0077
     * @tc.desc   resolvePage(pages/BasicResources#top) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020077 begin');
      const result: string = RouteTable.resolvePage('pages/BasicResources#top');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/BasicResources#top')), String(false));
      expect(RouteTable.isKnownPage('pages/BasicResources#top')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020077 end');
    })

    /**
     * @tc.name   testRouteTablePageB020078
     * @tc.number SUB_RESMGR_ROUTE_02_0078
     * @tc.desc   resolvePage(ages/Overlay) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020078 begin');
      const result: string = RouteTable.resolvePage('ages/Overlay');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('ages/Overlay')), String(false));
      expect(RouteTable.isKnownPage('ages/Overlay')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020078 end');
    })

    /**
     * @tc.name   testRouteTablePageB020079
     * @tc.number SUB_RESMGR_ROUTE_02_0079
     * @tc.desc   resolvePage(pages/IndexX) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020079 begin');
      const result: string = RouteTable.resolvePage('pages/IndexX');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/IndexX')), String(false));
      expect(RouteTable.isKnownPage('pages/IndexX')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020079 end');
    })

    /**
     * @tc.name   testRouteTablePageB020080
     * @tc.number SUB_RESMGR_ROUTE_02_0080
     * @tc.desc   resolvePage(pages/BasicResources?) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020080 begin');
      const result: string = RouteTable.resolvePage('pages/BasicResources?');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/BasicResources?')), String(false));
      expect(RouteTable.isKnownPage('pages/BasicResources?')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020080 end');
    })

    /**
     * @tc.name   testRouteTablePageB020081
     * @tc.number SUB_RESMGR_ROUTE_02_0081
     * @tc.desc   resolvePage(pages/Overlay/index) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020081 begin');
      const result: string = RouteTable.resolvePage('pages/Overlay/index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Overlay/index')), String(false));
      expect(RouteTable.isKnownPage('pages/Overlay/index')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020081 end');
    })

    /**
     * @tc.name   testRouteTablePageB020082
     * @tc.number SUB_RESMGR_ROUTE_02_0082
     * @tc.desc   resolvePage(pages/Index) known=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020082 begin');
      const result: string = RouteTable.resolvePage('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Index')), String(true));
      expect(RouteTable.isKnownPage('pages/Index')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020082 end');
    })

    /**
     * @tc.name   testRouteTablePageB020083
     * @tc.number SUB_RESMGR_ROUTE_02_0083
     * @tc.desc   resolvePage(pages/BasicResources/) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020083 begin');
      const result: string = RouteTable.resolvePage('pages/BasicResources/');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/BasicResources/')), String(false));
      expect(RouteTable.isKnownPage('pages/BasicResources/')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020083 end');
    })

    /**
     * @tc.name   testRouteTablePageB020084
     * @tc.number SUB_RESMGR_ROUTE_02_0084
     * @tc.desc   resolvePage(pages/Overlay?x=1) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020084 begin');
      const result: string = RouteTable.resolvePage('pages/Overlay?x=1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Overlay?x=1')), String(false));
      expect(RouteTable.isKnownPage('pages/Overlay?x=1')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020084 end');
    })

    /**
     * @tc.name   testRouteTablePageB020085
     * @tc.number SUB_RESMGR_ROUTE_02_0085
     * @tc.desc   resolvePage(ages/Index) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020085 begin');
      const result: string = RouteTable.resolvePage('ages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('ages/Index')), String(false));
      expect(RouteTable.isKnownPage('ages/Index')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020085 end');
    })

    /**
     * @tc.name   testRouteTablePageB020086
     * @tc.number SUB_RESMGR_ROUTE_02_0086
     * @tc.desc   resolvePage(pages/BasicResources#top) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020086 begin');
      const result: string = RouteTable.resolvePage('pages/BasicResources#top');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/BasicResources#top')), String(false));
      expect(RouteTable.isKnownPage('pages/BasicResources#top')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020086 end');
    })

    /**
     * @tc.name   testRouteTablePageB020087
     * @tc.number SUB_RESMGR_ROUTE_02_0087
     * @tc.desc   resolvePage(pages/Overlay ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020087 begin');
      const result: string = RouteTable.resolvePage('pages/Overlay ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Overlay ')), String(false));
      expect(RouteTable.isKnownPage('pages/Overlay ')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020087 end');
    })

    /**
     * @tc.name   testRouteTablePageB020088
     * @tc.number SUB_RESMGR_ROUTE_02_0088
     * @tc.desc   resolvePage(pages/IndexX) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020088 begin');
      const result: string = RouteTable.resolvePage('pages/IndexX');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/IndexX')), String(false));
      expect(RouteTable.isKnownPage('pages/IndexX')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020088 end');
    })

    /**
     * @tc.name   testRouteTablePageB020089
     * @tc.number SUB_RESMGR_ROUTE_02_0089
     * @tc.desc   resolvePage(pages/BasicResources?) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020089 begin');
      const result: string = RouteTable.resolvePage('pages/BasicResources?');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/BasicResources?')), String(false));
      expect(RouteTable.isKnownPage('pages/BasicResources?')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020089 end');
    })

    /**
     * @tc.name   testRouteTablePageB020090
     * @tc.number SUB_RESMGR_ROUTE_02_0090
     * @tc.desc   resolvePage(pages/Overlay/index) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020090 begin');
      const result: string = RouteTable.resolvePage('pages/Overlay/index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Overlay/index')), String(false));
      expect(RouteTable.isKnownPage('pages/Overlay/index')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020090 end');
    })

    /**
     * @tc.name   testRouteTablePageB020091
     * @tc.number SUB_RESMGR_ROUTE_02_0091
     * @tc.desc   resolvePage(pages/Index) known=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020091 begin');
      const result: string = RouteTable.resolvePage('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Index')), String(true));
      expect(RouteTable.isKnownPage('pages/Index')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020091 end');
    })

    /**
     * @tc.name   testRouteTablePageB020092
     * @tc.number SUB_RESMGR_ROUTE_02_0092
     * @tc.desc   resolvePage(ages/BasicResources) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020092 begin');
      const result: string = RouteTable.resolvePage('ages/BasicResources');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('ages/BasicResources')), String(false));
      expect(RouteTable.isKnownPage('ages/BasicResources')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020092 end');
    })

    /**
     * @tc.name   testRouteTablePageB020093
     * @tc.number SUB_RESMGR_ROUTE_02_0093
     * @tc.desc   resolvePage(pages/Overlay?x=1) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020093 begin');
      const result: string = RouteTable.resolvePage('pages/Overlay?x=1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Overlay?x=1')), String(false));
      expect(RouteTable.isKnownPage('pages/Overlay?x=1')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020093 end');
    })

    /**
     * @tc.name   testRouteTablePageB020094
     * @tc.number SUB_RESMGR_ROUTE_02_0094
     * @tc.desc   resolvePage(pages/Index?density=640) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020094 begin');
      const result: string = RouteTable.resolvePage('pages/Index?density=640');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Index?density=640')), String(false));
      expect(RouteTable.isKnownPage('pages/Index?density=640')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020094 end');
    })

    /**
     * @tc.name   testRouteTablePageB020095
     * @tc.number SUB_RESMGR_ROUTE_02_0095
     * @tc.desc   resolvePage(pages/BasicResources#top) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB020095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020095 begin');
      const result: string = RouteTable.resolvePage('pages/BasicResources#top');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/BasicResources#top')), String(false));
      expect(RouteTable.isKnownPage('pages/BasicResources#top')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB020095 end');
    })

    /**
     * @tc.name   testRouteTablePageB0296
     * @tc.number SUB_RESMGR_ROUTE_02_0096
     * @tc.desc   只有完整页名才命中
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB0296', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB0296 begin');
      expect(RouteTable.resolvePage('pages/BasicResources')).assertEqual('pages/BasicResources');
      expect(RouteTable.resolvePage('pages/basicresources')).assertEqual('pages/Index');
      expect(RouteTable.isKnownPage('pages/Overlay')).assertTrue();
      expect(RouteTable.isKnownPage('pages/Overlay ')).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB0296 end');
    })
  })
}
