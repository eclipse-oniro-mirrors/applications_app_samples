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

export default function routeTablePageTest() {
  describe('RouteTablePageTest', () => {

    /**
     * @tc.name   testRouteTablePage0001
     * @tc.number SUB_RESMGR_ROUTE_01_0001
     * @tc.desc   resolvePage(pages/Index) known=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePage0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0001 begin');
      const result: string = RouteTable.resolvePage('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Index')), String(true));
      expect(RouteTable.isKnownPage('pages/Index')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0001 end');
    })

    /**
     * @tc.name   testRouteTablePage0002
     * @tc.number SUB_RESMGR_ROUTE_01_0002
     * @tc.desc   resolvePage(pages/BasicResources) known=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePage0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0002 begin');
      const result: string = RouteTable.resolvePage('pages/BasicResources');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('pages/BasicResources'));
      expect(result).assertEqual('pages/BasicResources');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/BasicResources')), String(true));
      expect(RouteTable.isKnownPage('pages/BasicResources')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0002 end');
    })

    /**
     * @tc.name   testRouteTablePage0003
     * @tc.number SUB_RESMGR_ROUTE_01_0003
     * @tc.desc   resolvePage(pages/Overlay) known=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePage0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0003 begin');
      const result: string = RouteTable.resolvePage('pages/Overlay');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Overlay'));
      expect(result).assertEqual('pages/Overlay');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Overlay')), String(true));
      expect(RouteTable.isKnownPage('pages/Overlay')).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0003 end');
    })

    /**
     * @tc.name   testRouteTablePage0004
     * @tc.number SUB_RESMGR_ROUTE_01_0004
     * @tc.desc   resolvePage(pages/index) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePage0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0004 begin');
      const result: string = RouteTable.resolvePage('pages/index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/index')), String(false));
      expect(RouteTable.isKnownPage('pages/index')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0004 end');
    })

    /**
     * @tc.name   testRouteTablePage0005
     * @tc.number SUB_RESMGR_ROUTE_01_0005
     * @tc.desc   resolvePage(pages/basicresources) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePage0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0005 begin');
      const result: string = RouteTable.resolvePage('pages/basicresources');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/basicresources')), String(false));
      expect(RouteTable.isKnownPage('pages/basicresources')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0005 end');
    })

    /**
     * @tc.name   testRouteTablePage0006
     * @tc.number SUB_RESMGR_ROUTE_01_0006
     * @tc.desc   resolvePage(Pages/Index) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePage0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0006 begin');
      const result: string = RouteTable.resolvePage('Pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('Pages/Index')), String(false));
      expect(RouteTable.isKnownPage('Pages/Index')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0006 end');
    })

    /**
     * @tc.name   testRouteTablePage0007
     * @tc.number SUB_RESMGR_ROUTE_01_0007
     * @tc.desc   resolvePage(pages/) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePage0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0007 begin');
      const result: string = RouteTable.resolvePage('pages/');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/')), String(false));
      expect(RouteTable.isKnownPage('pages/')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0007 end');
    })

    /**
     * @tc.name   testRouteTablePage0008
     * @tc.number SUB_RESMGR_ROUTE_01_0008
     * @tc.desc   resolvePage(pages) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePage0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0008 begin');
      const result: string = RouteTable.resolvePage('pages');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages')), String(false));
      expect(RouteTable.isKnownPage('pages')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0008 end');
    })

    /**
     * @tc.name   testRouteTablePage0009
     * @tc.number SUB_RESMGR_ROUTE_01_0009
     * @tc.desc   resolvePage(pages//Index) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePage0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0009 begin');
      const result: string = RouteTable.resolvePage('pages//Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages//Index')), String(false));
      expect(RouteTable.isKnownPage('pages//Index')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0009 end');
    })

    /**
     * @tc.name   testRouteTablePage0010
     * @tc.number SUB_RESMGR_ROUTE_01_0010
     * @tc.desc   resolvePage(/pages/Index) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePage0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0010 begin');
      const result: string = RouteTable.resolvePage('/pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('/pages/Index')), String(false));
      expect(RouteTable.isKnownPage('/pages/Index')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0010 end');
    })

    /**
     * @tc.name   testRouteTablePage0011
     * @tc.number SUB_RESMGR_ROUTE_01_0011
     * @tc.desc   resolvePage(pages/Index/) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePage0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0011 begin');
      const result: string = RouteTable.resolvePage('pages/Index/');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Index/')), String(false));
      expect(RouteTable.isKnownPage('pages/Index/')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0011 end');
    })

    /**
     * @tc.name   testRouteTablePage0012
     * @tc.number SUB_RESMGR_ROUTE_01_0012
     * @tc.desc   resolvePage(pages/Index?x=1) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePage0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0012 begin');
      const result: string = RouteTable.resolvePage('pages/Index?x=1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Index?x=1')), String(false));
      expect(RouteTable.isKnownPage('pages/Index?x=1')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0012 end');
    })

    /**
     * @tc.name   testRouteTablePage0013
     * @tc.number SUB_RESMGR_ROUTE_01_0013
     * @tc.desc   resolvePage(pages/Index#top) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePage0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0013 begin');
      const result: string = RouteTable.resolvePage('pages/Index#top');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Index#top')), String(false));
      expect(RouteTable.isKnownPage('pages/Index#top')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0013 end');
    })

    /**
     * @tc.name   testRouteTablePage0014
     * @tc.number SUB_RESMGR_ROUTE_01_0014
     * @tc.desc   resolvePage(pages/BasicResources?density=640) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePage0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0014 begin');
      const result: string = RouteTable.resolvePage('pages/BasicResources?density=640');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/BasicResources?density=640')), String(false));
      expect(RouteTable.isKnownPage('pages/BasicResources?density=640')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0014 end');
    })

    /**
     * @tc.name   testRouteTablePage0015
     * @tc.number SUB_RESMGR_ROUTE_01_0015
     * @tc.desc   resolvePage(pages/Overlay?action=enable) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePage0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0015 begin');
      const result: string = RouteTable.resolvePage('pages/Overlay?action=enable');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Overlay?action=enable')), String(false));
      expect(RouteTable.isKnownPage('pages/Overlay?action=enable')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0015 end');
    })

    /**
     * @tc.name   testRouteTablePage0016
     * @tc.number SUB_RESMGR_ROUTE_01_0016
     * @tc.desc   resolvePage(Index) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePage0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0016 begin');
      const result: string = RouteTable.resolvePage('Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('Index')), String(false));
      expect(RouteTable.isKnownPage('Index')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0016 end');
    })

    /**
     * @tc.name   testRouteTablePage0017
     * @tc.number SUB_RESMGR_ROUTE_01_0017
     * @tc.desc   resolvePage(BasicResources) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePage0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0017 begin');
      const result: string = RouteTable.resolvePage('BasicResources');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('BasicResources')), String(false));
      expect(RouteTable.isKnownPage('BasicResources')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0017 end');
    })

    /**
     * @tc.name   testRouteTablePage0018
     * @tc.number SUB_RESMGR_ROUTE_01_0018
     * @tc.desc   resolvePage(Overlay) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePage0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0018 begin');
      const result: string = RouteTable.resolvePage('Overlay');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('Overlay')), String(false));
      expect(RouteTable.isKnownPage('Overlay')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0018 end');
    })

    /**
     * @tc.name   testRouteTablePage0019
     * @tc.number SUB_RESMGR_ROUTE_01_0019
     * @tc.desc   resolvePage() known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePage0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0019 begin');
      const result: string = RouteTable.resolvePage('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('')), String(false));
      expect(RouteTable.isKnownPage('')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0019 end');
    })

    /**
     * @tc.name   testRouteTablePage0020
     * @tc.number SUB_RESMGR_ROUTE_01_0020
     * @tc.desc   resolvePage( ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePage0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0020 begin');
      const result: string = RouteTable.resolvePage(' ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage(' ')), String(false));
      expect(RouteTable.isKnownPage(' ')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0020 end');
    })

    /**
     * @tc.name   testRouteTablePage0021
     * @tc.number SUB_RESMGR_ROUTE_01_0021
     * @tc.desc   resolvePage(index) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePage0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0021 begin');
      const result: string = RouteTable.resolvePage('index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('index')), String(false));
      expect(RouteTable.isKnownPage('index')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0021 end');
    })

    /**
     * @tc.name   testRouteTablePage0022
     * @tc.number SUB_RESMGR_ROUTE_01_0022
     * @tc.desc   resolvePage(main) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePage0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0022 begin');
      const result: string = RouteTable.resolvePage('main');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('main')), String(false));
      expect(RouteTable.isKnownPage('main')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0022 end');
    })

    /**
     * @tc.name   testRouteTablePage0023
     * @tc.number SUB_RESMGR_ROUTE_01_0023
     * @tc.desc   resolvePage(pages/Unknown) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePage0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0023 begin');
      const result: string = RouteTable.resolvePage('pages/Unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Unknown')), String(false));
      expect(RouteTable.isKnownPage('pages/Unknown')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0023 end');
    })

    /**
     * @tc.name   testRouteTablePage0024
     * @tc.number SUB_RESMGR_ROUTE_01_0024
     * @tc.desc   resolvePage(pages/Index1) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePage0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0024 begin');
      const result: string = RouteTable.resolvePage('pages/Index1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Index1')), String(false));
      expect(RouteTable.isKnownPage('pages/Index1')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0024 end');
    })

    /**
     * @tc.name   testRouteTablePage0025
     * @tc.number SUB_RESMGR_ROUTE_01_0025
     * @tc.desc   resolvePage(pages/IndexPage) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePage0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0025 begin');
      const result: string = RouteTable.resolvePage('pages/IndexPage');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/IndexPage')), String(false));
      expect(RouteTable.isKnownPage('pages/IndexPage')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0025 end');
    })

    /**
     * @tc.name   testRouteTablePage0026
     * @tc.number SUB_RESMGR_ROUTE_01_0026
     * @tc.desc   resolvePage(entry/pages/Index) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePage0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0026 begin');
      const result: string = RouteTable.resolvePage('entry/pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('entry/pages/Index')), String(false));
      expect(RouteTable.isKnownPage('entry/pages/Index')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0026 end');
    })

    /**
     * @tc.name   testRouteTablePage0027
     * @tc.number SUB_RESMGR_ROUTE_01_0027
     * @tc.desc   resolvePage(ohos.samples.resourcemanager/pages/Index) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePage0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0027 begin');
      const result: string = RouteTable.resolvePage('ohos.samples.resourcemanager/pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('ohos.samples.resourcemanager/pages/Index')), String(false));
      expect(RouteTable.isKnownPage('ohos.samples.resourcemanager/pages/Index')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0027 end');
    })

    /**
     * @tc.name   testRouteTablePage0028
     * @tc.number SUB_RESMGR_ROUTE_01_0028
     * @tc.desc   resolvePage(pages\Index) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePage0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0028 begin');
      const result: string = RouteTable.resolvePage('pages\Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages\Index')), String(false));
      expect(RouteTable.isKnownPage('pages\Index')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0028 end');
    })

    /**
     * @tc.name   testRouteTablePage0029
     * @tc.number SUB_RESMGR_ROUTE_01_0029
     * @tc.desc   resolvePage(pages/Index ) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePage0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0029 begin');
      const result: string = RouteTable.resolvePage('pages/Index ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Index ')), String(false));
      expect(RouteTable.isKnownPage('pages/Index ')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0029 end');
    })

    /**
     * @tc.name   testRouteTablePage0030
     * @tc.number SUB_RESMGR_ROUTE_01_0030
     * @tc.desc   resolvePage( pages/Index) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePage0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0030 begin');
      const result: string = RouteTable.resolvePage(' pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage(' pages/Index')), String(false));
      expect(RouteTable.isKnownPage(' pages/Index')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0030 end');
    })

    /**
     * @tc.name   testRouteTablePage0031
     * @tc.number SUB_RESMGR_ROUTE_01_0031
     * @tc.desc   resolvePage(pages/ Index) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePage0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0031 begin');
      const result: string = RouteTable.resolvePage('pages/ Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/ Index')), String(false));
      expect(RouteTable.isKnownPage('pages/ Index')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0031 end');
    })

    /**
     * @tc.name   testRouteTablePage0032
     * @tc.number SUB_RESMGR_ROUTE_01_0032
     * @tc.desc   resolvePage(pages/IndexX) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePage0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0032 begin');
      const result: string = RouteTable.resolvePage('pages/IndexX');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/IndexX')), String(false));
      expect(RouteTable.isKnownPage('pages/IndexX')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0032 end');
    })

    /**
     * @tc.name   testRouteTablePage0033
     * @tc.number SUB_RESMGR_ROUTE_01_0033
     * @tc.desc   resolvePage(pages/Basic) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePage0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0033 begin');
      const result: string = RouteTable.resolvePage('pages/Basic');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Basic')), String(false));
      expect(RouteTable.isKnownPage('pages/Basic')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0033 end');
    })

    /**
     * @tc.name   testRouteTablePage0034
     * @tc.number SUB_RESMGR_ROUTE_01_0034
     * @tc.desc   resolvePage(pages/Resources) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePage0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0034 begin');
      const result: string = RouteTable.resolvePage('pages/Resources');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Resources')), String(false));
      expect(RouteTable.isKnownPage('pages/Resources')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0034 end');
    })

    /**
     * @tc.name   testRouteTablePage0035
     * @tc.number SUB_RESMGR_ROUTE_01_0035
     * @tc.desc   resolvePage(pages/OverlayX) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePage0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0035 begin');
      const result: string = RouteTable.resolvePage('pages/OverlayX');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/OverlayX')), String(false));
      expect(RouteTable.isKnownPage('pages/OverlayX')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0035 end');
    })

    /**
     * @tc.name   testRouteTablePage0036
     * @tc.number SUB_RESMGR_ROUTE_01_0036
     * @tc.desc   resolvePage(pages/overlay) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePage0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0036 begin');
      const result: string = RouteTable.resolvePage('pages/overlay');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/overlay')), String(false));
      expect(RouteTable.isKnownPage('pages/overlay')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0036 end');
    })

    /**
     * @tc.name   testRouteTablePage0037
     * @tc.number SUB_RESMGR_ROUTE_01_0037
     * @tc.desc   resolvePage(pages/BASICRESOURCES) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePage0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0037 begin');
      const result: string = RouteTable.resolvePage('pages/BASICRESOURCES');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/BASICRESOURCES')), String(false));
      expect(RouteTable.isKnownPage('pages/BASICRESOURCES')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0037 end');
    })

    /**
     * @tc.name   testRouteTablePage0038
     * @tc.number SUB_RESMGR_ROUTE_01_0038
     * @tc.desc   resolvePage(pages/index/) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePage0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0038 begin');
      const result: string = RouteTable.resolvePage('pages/index/');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/index/')), String(false));
      expect(RouteTable.isKnownPage('pages/index/')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0038 end');
    })

    /**
     * @tc.name   testRouteTablePage0039
     * @tc.number SUB_RESMGR_ROUTE_01_0039
     * @tc.desc   resolvePage(pages/pages/Index) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePage0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0039 begin');
      const result: string = RouteTable.resolvePage('pages/pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/pages/Index')), String(false));
      expect(RouteTable.isKnownPage('pages/pages/Index')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0039 end');
    })

    /**
     * @tc.name   testRouteTablePage0040
     * @tc.number SUB_RESMGR_ROUTE_01_0040
     * @tc.desc   resolvePage(pages) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePage0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0040 begin');
      const result: string = RouteTable.resolvePage('pages');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages')), String(false));
      expect(RouteTable.isKnownPage('pages')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0040 end');
    })

    /**
     * @tc.name   testRouteTablePage0041
     * @tc.number SUB_RESMGR_ROUTE_01_0041
     * @tc.desc   resolvePage(page/Index) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePage0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0041 begin');
      const result: string = RouteTable.resolvePage('page/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('page/Index')), String(false));
      expect(RouteTable.isKnownPage('page/Index')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0041 end');
    })

    /**
     * @tc.name   testRouteTablePage0042
     * @tc.number SUB_RESMGR_ROUTE_01_0042
     * @tc.desc   resolvePage(pagess/Index) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePage0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0042 begin');
      const result: string = RouteTable.resolvePage('pagess/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pagess/Index')), String(false));
      expect(RouteTable.isKnownPage('pagess/Index')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0042 end');
    })

    /**
     * @tc.name   testRouteTablePage0043
     * @tc.number SUB_RESMGR_ROUTE_01_0043
     * @tc.desc   resolvePage(pages/Index/pages/Overlay) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePage0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0043 begin');
      const result: string = RouteTable.resolvePage('pages/Index/pages/Overlay');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Index/pages/Overlay')), String(false));
      expect(RouteTable.isKnownPage('pages/Index/pages/Overlay')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0043 end');
    })

    /**
     * @tc.name   testRouteTablePage0044
     * @tc.number SUB_RESMGR_ROUTE_01_0044
     * @tc.desc   resolvePage(pages/Overlay/pages/Index) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePage0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0044 begin');
      const result: string = RouteTable.resolvePage('pages/Overlay/pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Overlay/pages/Index')), String(false));
      expect(RouteTable.isKnownPage('pages/Overlay/pages/Index')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0044 end');
    })

    /**
     * @tc.name   testRouteTablePage0045
     * @tc.number SUB_RESMGR_ROUTE_01_0045
     * @tc.desc   resolvePage(pages/Index?) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePage0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0045 begin');
      const result: string = RouteTable.resolvePage('pages/Index?');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Index?')), String(false));
      expect(RouteTable.isKnownPage('pages/Index?')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0045 end');
    })

    /**
     * @tc.name   testRouteTablePage0046
     * @tc.number SUB_RESMGR_ROUTE_01_0046
     * @tc.desc   resolvePage(pages/???) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePage0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0046 begin');
      const result: string = RouteTable.resolvePage('pages/???');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/???')), String(false));
      expect(RouteTable.isKnownPage('pages/???')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0046 end');
    })

    /**
     * @tc.name   testRouteTablePage0047
     * @tc.number SUB_RESMGR_ROUTE_01_0047
     * @tc.desc   resolvePage(pages/入口) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePage0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0047 begin');
      const result: string = RouteTable.resolvePage('pages/入口');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/入口')), String(false));
      expect(RouteTable.isKnownPage('pages/入口')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0047 end');
    })

    /**
     * @tc.name   testRouteTablePage0048
     * @tc.number SUB_RESMGR_ROUTE_01_0048
     * @tc.desc   resolvePage(pages/Index 页) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePage0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0048 begin');
      const result: string = RouteTable.resolvePage('pages/Index 页');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Index 页')), String(false));
      expect(RouteTable.isKnownPage('pages/Index 页')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0048 end');
    })

    /**
     * @tc.name   testRouteTablePage0049
     * @tc.number SUB_RESMGR_ROUTE_01_0049
     * @tc.desc   resolvePage(pages/Overlay页面) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePage0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0049 begin');
      const result: string = RouteTable.resolvePage('pages/Overlay页面');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/Overlay页面')), String(false));
      expect(RouteTable.isKnownPage('pages/Overlay页面')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0049 end');
    })

    /**
     * @tc.name   testRouteTablePage0050
     * @tc.number SUB_RESMGR_ROUTE_01_0050
     * @tc.desc   resolvePage(pages/0) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePage0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0050 begin');
      const result: string = RouteTable.resolvePage('pages/0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/0')), String(false));
      expect(RouteTable.isKnownPage('pages/0')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0050 end');
    })

    /**
     * @tc.name   testRouteTablePage0051
     * @tc.number SUB_RESMGR_ROUTE_01_0051
     * @tc.desc   resolvePage(pages/-) known=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePage0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0051 begin');
      const result: string = RouteTable.resolvePage('pages/-');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('pages/Index'));
      expect(result).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(RouteTable.isKnownPage('pages/-')), String(false));
      expect(RouteTable.isKnownPage('pages/-')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(result)));
      expect(RouteTable.isPageUrl(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0051 end');
    })

    /**
     * @tc.name   testRouteTablePage0052
     * @tc.number SUB_RESMGR_ROUTE_01_0052
     * @tc.desc   大小写、末尾斜杠与只写前缀都不能命中页面
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTablePage0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0052 begin');
      // 三个真实页面必须原样返回，不能被归一化掉
      const entry: string = RouteTable.resolvePage('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', entry, 'pages/Index');
      expect(entry).assertEqual('pages/Index');
      expect(RouteTable.resolvePage('pages/BasicResources')).assertEqual('pages/BasicResources');
      expect(RouteTable.resolvePage('pages/Overlay')).assertEqual('pages/Overlay');
      // 大小写不同、末尾多斜杠、只给前缀都不能命中，必须回退到入口页
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        RouteTable.resolvePage('Pages/Index'), 'pages/Index');
      expect(RouteTable.resolvePage('Pages/Index')).assertEqual('pages/Index');
      expect(RouteTable.resolvePage('pages/Index/')).assertEqual('pages/Index');
      expect(RouteTable.resolvePage('pages/')).assertEqual('pages/Index');
      // 回退结果本身必须是已声明的页面，且三张页面的序号固定
      expect(RouteTable.isKnownPage(RouteTable.resolvePage(''))).assertTrue();
      expect(RouteTable.pageIndexOf('pages/Index')).assertEqual(0);
      expect(RouteTable.pageIndexOf('pages/BasicResources')).assertEqual(1);
      expect(RouteTable.pageIndexOf('pages/Overlay')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTablePage0052 end');
    })

  })
}
