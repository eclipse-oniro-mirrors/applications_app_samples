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

export default function routeTablePageB03Test() {
  describe('RouteTablePageB03Test', () => {

    /**
     * @tc.name   testRouteTablePageB030001
     * @tc.number SUB_RESMGR_ROUTE_03_0001
     * @tc.desc   resolvePage(PAGES/BASICRESOURCES) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030001 begin');
      const result: string = RouteTable.resolvePage('PAGES/BASICRESOURCES');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('PAGES/BASICRESOURCES')), String(false));
      expect(RouteTable.isKnownPage('PAGES/BASICRESOURCES')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030001 end');
    })

    /**
     * @tc.name   testRouteTablePageB030002
     * @tc.number SUB_RESMGR_ROUTE_03_0002
     * @tc.desc   resolvePage(pages/Overlay?x=1) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030002 begin');
      const result: string = RouteTable.resolvePage('pages/Overlay?x=1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Overlay?x=1')), String(false));
      expect(RouteTable.isKnownPage('pages/Overlay?x=1')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030002 end');
    })

    /**
     * @tc.name   testRouteTablePageB030003
     * @tc.number SUB_RESMGR_ROUTE_03_0003
     * @tc.desc   resolvePage(pages/Index?density=640) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030003 begin');
      const result: string = RouteTable.resolvePage('pages/Index?density=640');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Index?density=640')), String(false));
      expect(RouteTable.isKnownPage('pages/Index?density=640')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030003 end');
    })

    /**
     * @tc.name   testRouteTablePageB030004
     * @tc.number SUB_RESMGR_ROUTE_03_0004
     * @tc.desc   resolvePage(pages/BasicResources#top) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030004 begin');
      const result: string = RouteTable.resolvePage('pages/BasicResources#top');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/BasicResources#top')), String(false));
      expect(RouteTable.isKnownPage('pages/BasicResources#top')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030004 end');
    })

    /**
     * @tc.name   testRouteTablePageB030005
     * @tc.number SUB_RESMGR_ROUTE_03_0005
     * @tc.desc   resolvePage(pages/Overlay ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030005 begin');
      const result: string = RouteTable.resolvePage('pages/Overlay ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Overlay ')), String(false));
      expect(RouteTable.isKnownPage('pages/Overlay ')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030005 end');
    })

    /**
     * @tc.name   testRouteTablePageB030006
     * @tc.number SUB_RESMGR_ROUTE_03_0006
     * @tc.desc   resolvePage(pages/IndexX) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030006 begin');
      const result: string = RouteTable.resolvePage('pages/IndexX');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/IndexX')), String(false));
      expect(RouteTable.isKnownPage('pages/IndexX')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030006 end');
    })

    /**
     * @tc.name   testRouteTablePageB030007
     * @tc.number SUB_RESMGR_ROUTE_03_0007
     * @tc.desc   resolvePage(pages/BasicResources?) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030007 begin');
      const result: string = RouteTable.resolvePage('pages/BasicResources?');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/BasicResources?')), String(false));
      expect(RouteTable.isKnownPage('pages/BasicResources?')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030007 end');
    })

    /**
     * @tc.name   testRouteTablePageB030008
     * @tc.number SUB_RESMGR_ROUTE_03_0008
     * @tc.desc   resolvePage(PAGES/OVERLAY) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030008 begin');
      const result: string = RouteTable.resolvePage('PAGES/OVERLAY');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('PAGES/OVERLAY')), String(false));
      expect(RouteTable.isKnownPage('PAGES/OVERLAY')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030008 end');
    })

    /**
     * @tc.name   testRouteTablePageB030009
     * @tc.number SUB_RESMGR_ROUTE_03_0009
     * @tc.desc   resolvePage(pages/Index) known=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030009 begin');
      const result: string = RouteTable.resolvePage('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Index')), String(true));
      expect(RouteTable.isKnownPage('pages/Index')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030009 end');
    })

    /**
     * @tc.name   testRouteTablePageB030010
     * @tc.number SUB_RESMGR_ROUTE_03_0010
     * @tc.desc   resolvePage(pages/BasicResources/) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030010 begin');
      const result: string = RouteTable.resolvePage('pages/BasicResources/');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/BasicResources/')), String(false));
      expect(RouteTable.isKnownPage('pages/BasicResources/')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030010 end');
    })

    /**
     * @tc.name   testRouteTablePageB030011
     * @tc.number SUB_RESMGR_ROUTE_03_0011
     * @tc.desc   resolvePage(pages/Overlay?x=1) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030011 begin');
      const result: string = RouteTable.resolvePage('pages/Overlay?x=1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Overlay?x=1')), String(false));
      expect(RouteTable.isKnownPage('pages/Overlay?x=1')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030011 end');
    })

    /**
     * @tc.name   testRouteTablePageB030012
     * @tc.number SUB_RESMGR_ROUTE_03_0012
     * @tc.desc   resolvePage(pages/Index?density=640) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030012 begin');
      const result: string = RouteTable.resolvePage('pages/Index?density=640');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Index?density=640')), String(false));
      expect(RouteTable.isKnownPage('pages/Index?density=640')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030012 end');
    })

    /**
     * @tc.name   testRouteTablePageB030013
     * @tc.number SUB_RESMGR_ROUTE_03_0013
     * @tc.desc   resolvePage(pages/BasicResources#top) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030013 begin');
      const result: string = RouteTable.resolvePage('pages/BasicResources#top');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/BasicResources#top')), String(false));
      expect(RouteTable.isKnownPage('pages/BasicResources#top')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030013 end');
    })

    /**
     * @tc.name   testRouteTablePageB030014
     * @tc.number SUB_RESMGR_ROUTE_03_0014
     * @tc.desc   resolvePage(pages/Overlay ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030014 begin');
      const result: string = RouteTable.resolvePage('pages/Overlay ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Overlay ')), String(false));
      expect(RouteTable.isKnownPage('pages/Overlay ')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030014 end');
    })

    /**
     * @tc.name   testRouteTablePageB030015
     * @tc.number SUB_RESMGR_ROUTE_03_0015
     * @tc.desc   resolvePage(PAGES/INDEX) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030015 begin');
      const result: string = RouteTable.resolvePage('PAGES/INDEX');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('PAGES/INDEX')), String(false));
      expect(RouteTable.isKnownPage('PAGES/INDEX')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030015 end');
    })

    /**
     * @tc.name   testRouteTablePageB030016
     * @tc.number SUB_RESMGR_ROUTE_03_0016
     * @tc.desc   resolvePage(pages/BasicResources?) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030016 begin');
      const result: string = RouteTable.resolvePage('pages/BasicResources?');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/BasicResources?')), String(false));
      expect(RouteTable.isKnownPage('pages/BasicResources?')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030016 end');
    })

    /**
     * @tc.name   testRouteTablePageB030017
     * @tc.number SUB_RESMGR_ROUTE_03_0017
     * @tc.desc   resolvePage(pages/Overlay/index) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030017 begin');
      const result: string = RouteTable.resolvePage('pages/Overlay/index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Overlay/index')), String(false));
      expect(RouteTable.isKnownPage('pages/Overlay/index')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030017 end');
    })

    /**
     * @tc.name   testRouteTablePageB030018
     * @tc.number SUB_RESMGR_ROUTE_03_0018
     * @tc.desc   resolvePage(pages/Index) known=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030018 begin');
      const result: string = RouteTable.resolvePage('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Index')), String(true));
      expect(RouteTable.isKnownPage('pages/Index')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030018 end');
    })

    /**
     * @tc.name   testRouteTablePageB030019
     * @tc.number SUB_RESMGR_ROUTE_03_0019
     * @tc.desc   resolvePage(pages/BasicResources/) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030019 begin');
      const result: string = RouteTable.resolvePage('pages/BasicResources/');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/BasicResources/')), String(false));
      expect(RouteTable.isKnownPage('pages/BasicResources/')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030019 end');
    })

    /**
     * @tc.name   testRouteTablePageB030020
     * @tc.number SUB_RESMGR_ROUTE_03_0020
     * @tc.desc   resolvePage(pages/Overlay?x=1) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030020 begin');
      const result: string = RouteTable.resolvePage('pages/Overlay?x=1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Overlay?x=1')), String(false));
      expect(RouteTable.isKnownPage('pages/Overlay?x=1')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030020 end');
    })

    /**
     * @tc.name   testRouteTablePageB030021
     * @tc.number SUB_RESMGR_ROUTE_03_0021
     * @tc.desc   resolvePage(pages/Index?density=640) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030021 begin');
      const result: string = RouteTable.resolvePage('pages/Index?density=640');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Index?density=640')), String(false));
      expect(RouteTable.isKnownPage('pages/Index?density=640')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030021 end');
    })

    /**
     * @tc.name   testRouteTablePageB030022
     * @tc.number SUB_RESMGR_ROUTE_03_0022
     * @tc.desc   resolvePage(PAGES/BASICRESOURCES) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030022 begin');
      const result: string = RouteTable.resolvePage('PAGES/BASICRESOURCES');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('PAGES/BASICRESOURCES')), String(false));
      expect(RouteTable.isKnownPage('PAGES/BASICRESOURCES')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030022 end');
    })

    /**
     * @tc.name   testRouteTablePageB030023
     * @tc.number SUB_RESMGR_ROUTE_03_0023
     * @tc.desc   resolvePage(pages/Overlay ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030023 begin');
      const result: string = RouteTable.resolvePage('pages/Overlay ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Overlay ')), String(false));
      expect(RouteTable.isKnownPage('pages/Overlay ')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030023 end');
    })

    /**
     * @tc.name   testRouteTablePageB030024
     * @tc.number SUB_RESMGR_ROUTE_03_0024
     * @tc.desc   resolvePage(pages/IndexX) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030024 begin');
      const result: string = RouteTable.resolvePage('pages/IndexX');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/IndexX')), String(false));
      expect(RouteTable.isKnownPage('pages/IndexX')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030024 end');
    })

    /**
     * @tc.name   testRouteTablePageB030025
     * @tc.number SUB_RESMGR_ROUTE_03_0025
     * @tc.desc   resolvePage(pages/BasicResources?) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030025 begin');
      const result: string = RouteTable.resolvePage('pages/BasicResources?');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/BasicResources?')), String(false));
      expect(RouteTable.isKnownPage('pages/BasicResources?')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030025 end');
    })

    /**
     * @tc.name   testRouteTablePageB030026
     * @tc.number SUB_RESMGR_ROUTE_03_0026
     * @tc.desc   resolvePage(pages/Overlay/index) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030026 begin');
      const result: string = RouteTable.resolvePage('pages/Overlay/index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Overlay/index')), String(false));
      expect(RouteTable.isKnownPage('pages/Overlay/index')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030026 end');
    })

    /**
     * @tc.name   testRouteTablePageB030027
     * @tc.number SUB_RESMGR_ROUTE_03_0027
     * @tc.desc   resolvePage(pages/Index) known=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030027 begin');
      const result: string = RouteTable.resolvePage('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Index')), String(true));
      expect(RouteTable.isKnownPage('pages/Index')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030027 end');
    })

    /**
     * @tc.name   testRouteTablePageB030028
     * @tc.number SUB_RESMGR_ROUTE_03_0028
     * @tc.desc   resolvePage(pages/BasicResources/) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030028 begin');
      const result: string = RouteTable.resolvePage('pages/BasicResources/');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/BasicResources/')), String(false));
      expect(RouteTable.isKnownPage('pages/BasicResources/')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030028 end');
    })

    /**
     * @tc.name   testRouteTablePageB030029
     * @tc.number SUB_RESMGR_ROUTE_03_0029
     * @tc.desc   resolvePage(PAGES/OVERLAY) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030029 begin');
      const result: string = RouteTable.resolvePage('PAGES/OVERLAY');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('PAGES/OVERLAY')), String(false));
      expect(RouteTable.isKnownPage('PAGES/OVERLAY')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030029 end');
    })

    /**
     * @tc.name   testRouteTablePageB030030
     * @tc.number SUB_RESMGR_ROUTE_03_0030
     * @tc.desc   resolvePage(pages/Index?density=640) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030030 begin');
      const result: string = RouteTable.resolvePage('pages/Index?density=640');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Index?density=640')), String(false));
      expect(RouteTable.isKnownPage('pages/Index?density=640')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030030 end');
    })

    /**
     * @tc.name   testRouteTablePageB030031
     * @tc.number SUB_RESMGR_ROUTE_03_0031
     * @tc.desc   resolvePage(pages/BasicResources#top) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030031 begin');
      const result: string = RouteTable.resolvePage('pages/BasicResources#top');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/BasicResources#top')), String(false));
      expect(RouteTable.isKnownPage('pages/BasicResources#top')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030031 end');
    })

    /**
     * @tc.name   testRouteTablePageB030032
     * @tc.number SUB_RESMGR_ROUTE_03_0032
     * @tc.desc   resolvePage(pages/Overlay ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030032 begin');
      const result: string = RouteTable.resolvePage('pages/Overlay ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Overlay ')), String(false));
      expect(RouteTable.isKnownPage('pages/Overlay ')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030032 end');
    })

    /**
     * @tc.name   testRouteTablePageB030033
     * @tc.number SUB_RESMGR_ROUTE_03_0033
     * @tc.desc   resolvePage(pages/IndexX) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030033 begin');
      const result: string = RouteTable.resolvePage('pages/IndexX');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/IndexX')), String(false));
      expect(RouteTable.isKnownPage('pages/IndexX')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030033 end');
    })

    /**
     * @tc.name   testRouteTablePageB030034
     * @tc.number SUB_RESMGR_ROUTE_03_0034
     * @tc.desc   resolvePage(pages/BasicResources?) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030034 begin');
      const result: string = RouteTable.resolvePage('pages/BasicResources?');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/BasicResources?')), String(false));
      expect(RouteTable.isKnownPage('pages/BasicResources?')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030034 end');
    })

    /**
     * @tc.name   testRouteTablePageB030035
     * @tc.number SUB_RESMGR_ROUTE_03_0035
     * @tc.desc   resolvePage(pages/Overlay/index) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030035 begin');
      const result: string = RouteTable.resolvePage('pages/Overlay/index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Overlay/index')), String(false));
      expect(RouteTable.isKnownPage('pages/Overlay/index')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030035 end');
    })

    /**
     * @tc.name   testRouteTablePageB030036
     * @tc.number SUB_RESMGR_ROUTE_03_0036
     * @tc.desc   resolvePage(PAGES/INDEX) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030036 begin');
      const result: string = RouteTable.resolvePage('PAGES/INDEX');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('PAGES/INDEX')), String(false));
      expect(RouteTable.isKnownPage('PAGES/INDEX')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030036 end');
    })

    /**
     * @tc.name   testRouteTablePageB030037
     * @tc.number SUB_RESMGR_ROUTE_03_0037
     * @tc.desc   resolvePage(pages/BasicResources/) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030037 begin');
      const result: string = RouteTable.resolvePage('pages/BasicResources/');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/BasicResources/')), String(false));
      expect(RouteTable.isKnownPage('pages/BasicResources/')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030037 end');
    })

    /**
     * @tc.name   testRouteTablePageB030038
     * @tc.number SUB_RESMGR_ROUTE_03_0038
     * @tc.desc   resolvePage(pages/Overlay?x=1) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030038 begin');
      const result: string = RouteTable.resolvePage('pages/Overlay?x=1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Overlay?x=1')), String(false));
      expect(RouteTable.isKnownPage('pages/Overlay?x=1')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030038 end');
    })

    /**
     * @tc.name   testRouteTablePageB030039
     * @tc.number SUB_RESMGR_ROUTE_03_0039
     * @tc.desc   resolvePage(pages/Index?density=640) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030039 begin');
      const result: string = RouteTable.resolvePage('pages/Index?density=640');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Index?density=640')), String(false));
      expect(RouteTable.isKnownPage('pages/Index?density=640')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030039 end');
    })

    /**
     * @tc.name   testRouteTablePageB030040
     * @tc.number SUB_RESMGR_ROUTE_03_0040
     * @tc.desc   resolvePage(pages/BasicResources#top) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030040 begin');
      const result: string = RouteTable.resolvePage('pages/BasicResources#top');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/BasicResources#top')), String(false));
      expect(RouteTable.isKnownPage('pages/BasicResources#top')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030040 end');
    })

    /**
     * @tc.name   testRouteTablePageB030041
     * @tc.number SUB_RESMGR_ROUTE_03_0041
     * @tc.desc   resolvePage(pages/Overlay ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030041 begin');
      const result: string = RouteTable.resolvePage('pages/Overlay ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Overlay ')), String(false));
      expect(RouteTable.isKnownPage('pages/Overlay ')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030041 end');
    })

    /**
     * @tc.name   testRouteTablePageB030042
     * @tc.number SUB_RESMGR_ROUTE_03_0042
     * @tc.desc   resolvePage(pages/IndexX) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030042 begin');
      const result: string = RouteTable.resolvePage('pages/IndexX');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/IndexX')), String(false));
      expect(RouteTable.isKnownPage('pages/IndexX')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030042 end');
    })

    /**
     * @tc.name   testRouteTablePageB030043
     * @tc.number SUB_RESMGR_ROUTE_03_0043
     * @tc.desc   resolvePage(PAGES/BASICRESOURCES) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030043 begin');
      const result: string = RouteTable.resolvePage('PAGES/BASICRESOURCES');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('PAGES/BASICRESOURCES')), String(false));
      expect(RouteTable.isKnownPage('PAGES/BASICRESOURCES')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030043 end');
    })

    /**
     * @tc.name   testRouteTablePageB030044
     * @tc.number SUB_RESMGR_ROUTE_03_0044
     * @tc.desc   resolvePage(pages/Overlay/index) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030044 begin');
      const result: string = RouteTable.resolvePage('pages/Overlay/index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Overlay/index')), String(false));
      expect(RouteTable.isKnownPage('pages/Overlay/index')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030044 end');
    })

    /**
     * @tc.name   testRouteTablePageB030045
     * @tc.number SUB_RESMGR_ROUTE_03_0045
     * @tc.desc   resolvePage(pages/Index) known=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030045 begin');
      const result: string = RouteTable.resolvePage('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Index')), String(true));
      expect(RouteTable.isKnownPage('pages/Index')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030045 end');
    })

    /**
     * @tc.name   testRouteTablePageB030046
     * @tc.number SUB_RESMGR_ROUTE_03_0046
     * @tc.desc   resolvePage(pages/BasicResources/) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030046 begin');
      const result: string = RouteTable.resolvePage('pages/BasicResources/');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/BasicResources/')), String(false));
      expect(RouteTable.isKnownPage('pages/BasicResources/')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030046 end');
    })

    /**
     * @tc.name   testRouteTablePageB030047
     * @tc.number SUB_RESMGR_ROUTE_03_0047
     * @tc.desc   resolvePage(pages/Overlay?x=1) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030047 begin');
      const result: string = RouteTable.resolvePage('pages/Overlay?x=1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Overlay?x=1')), String(false));
      expect(RouteTable.isKnownPage('pages/Overlay?x=1')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030047 end');
    })

    /**
     * @tc.name   testRouteTablePageB030048
     * @tc.number SUB_RESMGR_ROUTE_03_0048
     * @tc.desc   resolvePage(pages/Index?density=640) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030048 begin');
      const result: string = RouteTable.resolvePage('pages/Index?density=640');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Index?density=640')), String(false));
      expect(RouteTable.isKnownPage('pages/Index?density=640')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030048 end');
    })

    /**
     * @tc.name   testRouteTablePageB030049
     * @tc.number SUB_RESMGR_ROUTE_03_0049
     * @tc.desc   resolvePage(pages/BasicResources#top) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030049 begin');
      const result: string = RouteTable.resolvePage('pages/BasicResources#top');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/BasicResources#top')), String(false));
      expect(RouteTable.isKnownPage('pages/BasicResources#top')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030049 end');
    })

    /**
     * @tc.name   testRouteTablePageB030050
     * @tc.number SUB_RESMGR_ROUTE_03_0050
     * @tc.desc   resolvePage(PAGES/OVERLAY) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030050 begin');
      const result: string = RouteTable.resolvePage('PAGES/OVERLAY');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('PAGES/OVERLAY')), String(false));
      expect(RouteTable.isKnownPage('PAGES/OVERLAY')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030050 end');
    })

    /**
     * @tc.name   testRouteTablePageB030051
     * @tc.number SUB_RESMGR_ROUTE_03_0051
     * @tc.desc   resolvePage(pages/IndexX) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030051 begin');
      const result: string = RouteTable.resolvePage('pages/IndexX');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/IndexX')), String(false));
      expect(RouteTable.isKnownPage('pages/IndexX')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030051 end');
    })

    /**
     * @tc.name   testRouteTablePageB030052
     * @tc.number SUB_RESMGR_ROUTE_03_0052
     * @tc.desc   resolvePage(pages/BasicResources?) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030052 begin');
      const result: string = RouteTable.resolvePage('pages/BasicResources?');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/BasicResources?')), String(false));
      expect(RouteTable.isKnownPage('pages/BasicResources?')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030052 end');
    })

    /**
     * @tc.name   testRouteTablePageB030053
     * @tc.number SUB_RESMGR_ROUTE_03_0053
     * @tc.desc   resolvePage(pages/Overlay/index) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030053 begin');
      const result: string = RouteTable.resolvePage('pages/Overlay/index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Overlay/index')), String(false));
      expect(RouteTable.isKnownPage('pages/Overlay/index')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030053 end');
    })

    /**
     * @tc.name   testRouteTablePageB030054
     * @tc.number SUB_RESMGR_ROUTE_03_0054
     * @tc.desc   resolvePage(pages/Index) known=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030054 begin');
      const result: string = RouteTable.resolvePage('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Index')), String(true));
      expect(RouteTable.isKnownPage('pages/Index')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030054 end');
    })

    /**
     * @tc.name   testRouteTablePageB030055
     * @tc.number SUB_RESMGR_ROUTE_03_0055
     * @tc.desc   resolvePage(pages/BasicResources/) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030055 begin');
      const result: string = RouteTable.resolvePage('pages/BasicResources/');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/BasicResources/')), String(false));
      expect(RouteTable.isKnownPage('pages/BasicResources/')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030055 end');
    })

    /**
     * @tc.name   testRouteTablePageB030056
     * @tc.number SUB_RESMGR_ROUTE_03_0056
     * @tc.desc   resolvePage(pages/Overlay?x=1) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030056 begin');
      const result: string = RouteTable.resolvePage('pages/Overlay?x=1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Overlay?x=1')), String(false));
      expect(RouteTable.isKnownPage('pages/Overlay?x=1')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030056 end');
    })

    /**
     * @tc.name   testRouteTablePageB030057
     * @tc.number SUB_RESMGR_ROUTE_03_0057
     * @tc.desc   resolvePage(PAGES/INDEX) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030057 begin');
      const result: string = RouteTable.resolvePage('PAGES/INDEX');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('PAGES/INDEX')), String(false));
      expect(RouteTable.isKnownPage('PAGES/INDEX')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030057 end');
    })

    /**
     * @tc.name   testRouteTablePageB030058
     * @tc.number SUB_RESMGR_ROUTE_03_0058
     * @tc.desc   resolvePage(pages/BasicResources#top) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030058 begin');
      const result: string = RouteTable.resolvePage('pages/BasicResources#top');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/BasicResources#top')), String(false));
      expect(RouteTable.isKnownPage('pages/BasicResources#top')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030058 end');
    })

    /**
     * @tc.name   testRouteTablePageB030059
     * @tc.number SUB_RESMGR_ROUTE_03_0059
     * @tc.desc   resolvePage(pages/Overlay ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030059 begin');
      const result: string = RouteTable.resolvePage('pages/Overlay ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Overlay ')), String(false));
      expect(RouteTable.isKnownPage('pages/Overlay ')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030059 end');
    })

    /**
     * @tc.name   testRouteTablePageB030060
     * @tc.number SUB_RESMGR_ROUTE_03_0060
     * @tc.desc   resolvePage(pages/IndexX) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030060 begin');
      const result: string = RouteTable.resolvePage('pages/IndexX');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/IndexX')), String(false));
      expect(RouteTable.isKnownPage('pages/IndexX')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030060 end');
    })

    /**
     * @tc.name   testRouteTablePageB030061
     * @tc.number SUB_RESMGR_ROUTE_03_0061
     * @tc.desc   resolvePage(pages/BasicResources?) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030061 begin');
      const result: string = RouteTable.resolvePage('pages/BasicResources?');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/BasicResources?')), String(false));
      expect(RouteTable.isKnownPage('pages/BasicResources?')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030061 end');
    })

    /**
     * @tc.name   testRouteTablePageB030062
     * @tc.number SUB_RESMGR_ROUTE_03_0062
     * @tc.desc   resolvePage(pages/Overlay/index) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030062 begin');
      const result: string = RouteTable.resolvePage('pages/Overlay/index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Overlay/index')), String(false));
      expect(RouteTable.isKnownPage('pages/Overlay/index')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030062 end');
    })

    /**
     * @tc.name   testRouteTablePageB030063
     * @tc.number SUB_RESMGR_ROUTE_03_0063
     * @tc.desc   resolvePage(pages/Index) known=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030063 begin');
      const result: string = RouteTable.resolvePage('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Index')), String(true));
      expect(RouteTable.isKnownPage('pages/Index')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030063 end');
    })

    /**
     * @tc.name   testRouteTablePageB030064
     * @tc.number SUB_RESMGR_ROUTE_03_0064
     * @tc.desc   resolvePage(PAGES/BASICRESOURCES) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030064 begin');
      const result: string = RouteTable.resolvePage('PAGES/BASICRESOURCES');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('PAGES/BASICRESOURCES')), String(false));
      expect(RouteTable.isKnownPage('PAGES/BASICRESOURCES')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030064 end');
    })

    /**
     * @tc.name   testRouteTablePageB030065
     * @tc.number SUB_RESMGR_ROUTE_03_0065
     * @tc.desc   resolvePage(pages/Overlay?x=1) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030065 begin');
      const result: string = RouteTable.resolvePage('pages/Overlay?x=1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Overlay?x=1')), String(false));
      expect(RouteTable.isKnownPage('pages/Overlay?x=1')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030065 end');
    })

    /**
     * @tc.name   testRouteTablePageB030066
     * @tc.number SUB_RESMGR_ROUTE_03_0066
     * @tc.desc   resolvePage(pages/Index?density=640) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030066 begin');
      const result: string = RouteTable.resolvePage('pages/Index?density=640');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Index?density=640')), String(false));
      expect(RouteTable.isKnownPage('pages/Index?density=640')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030066 end');
    })

    /**
     * @tc.name   testRouteTablePageB030067
     * @tc.number SUB_RESMGR_ROUTE_03_0067
     * @tc.desc   resolvePage(pages/BasicResources#top) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030067 begin');
      const result: string = RouteTable.resolvePage('pages/BasicResources#top');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/BasicResources#top')), String(false));
      expect(RouteTable.isKnownPage('pages/BasicResources#top')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030067 end');
    })

    /**
     * @tc.name   testRouteTablePageB030068
     * @tc.number SUB_RESMGR_ROUTE_03_0068
     * @tc.desc   resolvePage(pages/Overlay ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030068 begin');
      const result: string = RouteTable.resolvePage('pages/Overlay ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Overlay ')), String(false));
      expect(RouteTable.isKnownPage('pages/Overlay ')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030068 end');
    })

    /**
     * @tc.name   testRouteTablePageB030069
     * @tc.number SUB_RESMGR_ROUTE_03_0069
     * @tc.desc   resolvePage(pages/IndexX) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030069 begin');
      const result: string = RouteTable.resolvePage('pages/IndexX');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/IndexX')), String(false));
      expect(RouteTable.isKnownPage('pages/IndexX')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030069 end');
    })

    /**
     * @tc.name   testRouteTablePageB030070
     * @tc.number SUB_RESMGR_ROUTE_03_0070
     * @tc.desc   resolvePage(pages/BasicResources?) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030070 begin');
      const result: string = RouteTable.resolvePage('pages/BasicResources?');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/BasicResources?')), String(false));
      expect(RouteTable.isKnownPage('pages/BasicResources?')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030070 end');
    })

    /**
     * @tc.name   testRouteTablePageB030071
     * @tc.number SUB_RESMGR_ROUTE_03_0071
     * @tc.desc   resolvePage(PAGES/OVERLAY) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030071 begin');
      const result: string = RouteTable.resolvePage('PAGES/OVERLAY');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('PAGES/OVERLAY')), String(false));
      expect(RouteTable.isKnownPage('PAGES/OVERLAY')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030071 end');
    })

    /**
     * @tc.name   testRouteTablePageB030072
     * @tc.number SUB_RESMGR_ROUTE_03_0072
     * @tc.desc   resolvePage(pages/Index) known=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030072 begin');
      const result: string = RouteTable.resolvePage('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Index')), String(true));
      expect(RouteTable.isKnownPage('pages/Index')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030072 end');
    })

    /**
     * @tc.name   testRouteTablePageB030073
     * @tc.number SUB_RESMGR_ROUTE_03_0073
     * @tc.desc   resolvePage(pages/BasicResources/) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030073 begin');
      const result: string = RouteTable.resolvePage('pages/BasicResources/');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/BasicResources/')), String(false));
      expect(RouteTable.isKnownPage('pages/BasicResources/')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030073 end');
    })

    /**
     * @tc.name   testRouteTablePageB030074
     * @tc.number SUB_RESMGR_ROUTE_03_0074
     * @tc.desc   resolvePage(pages/Overlay?x=1) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030074 begin');
      const result: string = RouteTable.resolvePage('pages/Overlay?x=1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Overlay?x=1')), String(false));
      expect(RouteTable.isKnownPage('pages/Overlay?x=1')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030074 end');
    })

    /**
     * @tc.name   testRouteTablePageB030075
     * @tc.number SUB_RESMGR_ROUTE_03_0075
     * @tc.desc   resolvePage(pages/Index?density=640) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030075 begin');
      const result: string = RouteTable.resolvePage('pages/Index?density=640');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Index?density=640')), String(false));
      expect(RouteTable.isKnownPage('pages/Index?density=640')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030075 end');
    })

    /**
     * @tc.name   testRouteTablePageB030076
     * @tc.number SUB_RESMGR_ROUTE_03_0076
     * @tc.desc   resolvePage(pages/BasicResources#top) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030076 begin');
      const result: string = RouteTable.resolvePage('pages/BasicResources#top');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/BasicResources#top')), String(false));
      expect(RouteTable.isKnownPage('pages/BasicResources#top')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030076 end');
    })

    /**
     * @tc.name   testRouteTablePageB030077
     * @tc.number SUB_RESMGR_ROUTE_03_0077
     * @tc.desc   resolvePage(pages/Overlay ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030077 begin');
      const result: string = RouteTable.resolvePage('pages/Overlay ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Overlay ')), String(false));
      expect(RouteTable.isKnownPage('pages/Overlay ')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030077 end');
    })

    /**
     * @tc.name   testRouteTablePageB030078
     * @tc.number SUB_RESMGR_ROUTE_03_0078
     * @tc.desc   resolvePage(PAGES/INDEX) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030078 begin');
      const result: string = RouteTable.resolvePage('PAGES/INDEX');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('PAGES/INDEX')), String(false));
      expect(RouteTable.isKnownPage('PAGES/INDEX')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030078 end');
    })

    /**
     * @tc.name   testRouteTablePageB030079
     * @tc.number SUB_RESMGR_ROUTE_03_0079
     * @tc.desc   resolvePage(pages/BasicResources?) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030079 begin');
      const result: string = RouteTable.resolvePage('pages/BasicResources?');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/BasicResources?')), String(false));
      expect(RouteTable.isKnownPage('pages/BasicResources?')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030079 end');
    })

    /**
     * @tc.name   testRouteTablePageB030080
     * @tc.number SUB_RESMGR_ROUTE_03_0080
     * @tc.desc   resolvePage(pages/Overlay/index) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030080 begin');
      const result: string = RouteTable.resolvePage('pages/Overlay/index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Overlay/index')), String(false));
      expect(RouteTable.isKnownPage('pages/Overlay/index')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030080 end');
    })

    /**
     * @tc.name   testRouteTablePageB030081
     * @tc.number SUB_RESMGR_ROUTE_03_0081
     * @tc.desc   resolvePage(pages/Index) known=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030081 begin');
      const result: string = RouteTable.resolvePage('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Index')), String(true));
      expect(RouteTable.isKnownPage('pages/Index')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030081 end');
    })

    /**
     * @tc.name   testRouteTablePageB030082
     * @tc.number SUB_RESMGR_ROUTE_03_0082
     * @tc.desc   resolvePage(pages/BasicResources/) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030082 begin');
      const result: string = RouteTable.resolvePage('pages/BasicResources/');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/BasicResources/')), String(false));
      expect(RouteTable.isKnownPage('pages/BasicResources/')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030082 end');
    })

    /**
     * @tc.name   testRouteTablePageB030083
     * @tc.number SUB_RESMGR_ROUTE_03_0083
     * @tc.desc   resolvePage(pages/Overlay?x=1) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030083 begin');
      const result: string = RouteTable.resolvePage('pages/Overlay?x=1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Overlay?x=1')), String(false));
      expect(RouteTable.isKnownPage('pages/Overlay?x=1')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030083 end');
    })

    /**
     * @tc.name   testRouteTablePageB030084
     * @tc.number SUB_RESMGR_ROUTE_03_0084
     * @tc.desc   resolvePage(pages/Index?density=640) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030084 begin');
      const result: string = RouteTable.resolvePage('pages/Index?density=640');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Index?density=640')), String(false));
      expect(RouteTable.isKnownPage('pages/Index?density=640')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030084 end');
    })

    /**
     * @tc.name   testRouteTablePageB030085
     * @tc.number SUB_RESMGR_ROUTE_03_0085
     * @tc.desc   resolvePage(PAGES/BASICRESOURCES) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030085 begin');
      const result: string = RouteTable.resolvePage('PAGES/BASICRESOURCES');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('PAGES/BASICRESOURCES')), String(false));
      expect(RouteTable.isKnownPage('PAGES/BASICRESOURCES')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030085 end');
    })

    /**
     * @tc.name   testRouteTablePageB030086
     * @tc.number SUB_RESMGR_ROUTE_03_0086
     * @tc.desc   resolvePage(pages/Overlay ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030086 begin');
      const result: string = RouteTable.resolvePage('pages/Overlay ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Overlay ')), String(false));
      expect(RouteTable.isKnownPage('pages/Overlay ')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030086 end');
    })

    /**
     * @tc.name   testRouteTablePageB030087
     * @tc.number SUB_RESMGR_ROUTE_03_0087
     * @tc.desc   resolvePage(pages/IndexX) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030087 begin');
      const result: string = RouteTable.resolvePage('pages/IndexX');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/IndexX')), String(false));
      expect(RouteTable.isKnownPage('pages/IndexX')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030087 end');
    })

    /**
     * @tc.name   testRouteTablePageB030088
     * @tc.number SUB_RESMGR_ROUTE_03_0088
     * @tc.desc   resolvePage(pages/BasicResources?) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030088 begin');
      const result: string = RouteTable.resolvePage('pages/BasicResources?');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/BasicResources?')), String(false));
      expect(RouteTable.isKnownPage('pages/BasicResources?')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030088 end');
    })

    /**
     * @tc.name   testRouteTablePageB030089
     * @tc.number SUB_RESMGR_ROUTE_03_0089
     * @tc.desc   resolvePage(pages/Overlay/index) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030089 begin');
      const result: string = RouteTable.resolvePage('pages/Overlay/index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Overlay/index')), String(false));
      expect(RouteTable.isKnownPage('pages/Overlay/index')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030089 end');
    })

    /**
     * @tc.name   testRouteTablePageB030090
     * @tc.number SUB_RESMGR_ROUTE_03_0090
     * @tc.desc   resolvePage(pages/Index) known=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030090 begin');
      const result: string = RouteTable.resolvePage('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Index')), String(true));
      expect(RouteTable.isKnownPage('pages/Index')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030090 end');
    })

    /**
     * @tc.name   testRouteTablePageB030091
     * @tc.number SUB_RESMGR_ROUTE_03_0091
     * @tc.desc   resolvePage(pages/BasicResources/) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030091 begin');
      const result: string = RouteTable.resolvePage('pages/BasicResources/');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/BasicResources/')), String(false));
      expect(RouteTable.isKnownPage('pages/BasicResources/')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030091 end');
    })

    /**
     * @tc.name   testRouteTablePageB030092
     * @tc.number SUB_RESMGR_ROUTE_03_0092
     * @tc.desc   resolvePage(PAGES/OVERLAY) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030092 begin');
      const result: string = RouteTable.resolvePage('PAGES/OVERLAY');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('PAGES/OVERLAY')), String(false));
      expect(RouteTable.isKnownPage('PAGES/OVERLAY')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030092 end');
    })

    /**
     * @tc.name   testRouteTablePageB030093
     * @tc.number SUB_RESMGR_ROUTE_03_0093
     * @tc.desc   resolvePage(pages/Index?density=640) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030093 begin');
      const result: string = RouteTable.resolvePage('pages/Index?density=640');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Index?density=640')), String(false));
      expect(RouteTable.isKnownPage('pages/Index?density=640')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030093 end');
    })

    /**
     * @tc.name   testRouteTablePageB030094
     * @tc.number SUB_RESMGR_ROUTE_03_0094
     * @tc.desc   resolvePage(pages/BasicResources#top) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030094 begin');
      const result: string = RouteTable.resolvePage('pages/BasicResources#top');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/BasicResources#top')), String(false));
      expect(RouteTable.isKnownPage('pages/BasicResources#top')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030094 end');
    })

    /**
     * @tc.name   testRouteTablePageB030095
     * @tc.number SUB_RESMGR_ROUTE_03_0095
     * @tc.desc   resolvePage(pages/Overlay ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB030095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030095 begin');
      const result: string = RouteTable.resolvePage('pages/Overlay ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Overlay ')), String(false));
      expect(RouteTable.isKnownPage('pages/Overlay ')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB030095 end');
    })

    /**
     * @tc.name   testRouteTablePageB0396
     * @tc.number SUB_RESMGR_ROUTE_03_0096
     * @tc.desc   前缀相同但不是页面时必须回退
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePageB0396', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB0396 begin');
      expect(RouteTable.resolvePage('pages/IndexPage')).assertEqual('pages/Index');
      expect(RouteTable.resolvePage('pages/Overlay')).assertEqual('pages/Overlay');
      expect(RouteTable.isPageUrl('pages/anything')).assertTrue();
      expect(RouteTable.isPageUrl('anything')).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePageB0396 end');
    })
  })
}
