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

export default function routeTableReal01Test() {
  describe('RouteTableReal01Test', () => {

    /**
     * @tc.name   testRouteTableReal0001
     * @tc.number SUB_RESMGR_ROUTE_REAL_0001
     * @tc.desc   三张页面必须按注册顺序声明
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableReal0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableReal0001 begin');
      const pages: string[] = RouteTable.allPages();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', JSON.stringify(pages));
      expect(pages.length).assertEqual(3);
      expect(pages[0]).assertEqual(RouteTable.PAGE_INDEX);
      expect(pages[2]).assertEqual(RouteTable.PAGE_OVERLAY);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableReal0001 end');
    })

    /**
     * @tc.name   testRouteTableReal0002
     * @tc.number SUB_RESMGR_ROUTE_REAL_0002
     * @tc.desc   allPages 返回副本，调用方修改不能污染注册表
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableReal0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableReal0002 begin');
      const first: string[] = RouteTable.allPages();
      first[0] = 'pages/Injected';
      const second: string[] = RouteTable.allPages();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', second[0], RouteTable.PAGE_INDEX);
      expect(second[0]).assertEqual(RouteTable.PAGE_INDEX);
      expect(second[0] === first[0]).assertFalse();
      expect(RouteTable.isKnownPage('pages/Injected')).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableReal0002 end');
    })

    /**
     * @tc.name   testRouteTableReal0003
     * @tc.number SUB_RESMGR_ROUTE_REAL_0003
     * @tc.desc   页面序号固定，未知页面返回 -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableReal0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableReal0003 begin');
      expect(RouteTable.pageIndexOf(RouteTable.PAGE_INDEX)).assertEqual(0);
      expect(RouteTable.pageIndexOf(RouteTable.PAGE_BASIC_RESOURCES)).assertEqual(1);
      expect(RouteTable.pageIndexOf('pages/Nope')).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableReal0003 end');
    })

    /**
     * @tc.name   testRouteTableReal0004
     * @tc.number SUB_RESMGR_ROUTE_REAL_0004
     * @tc.desc   已知页面直达，未知页面回退到入口页
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableReal0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableReal0004 begin');
      const overlay: string = RouteTable.resolvePage('pages/Overlay');
      const missing: string = RouteTable.resolvePage('pages/Missing');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s/%{public}s expected=%{public}s', overlay, missing,
        RouteTable.PAGE_INDEX);
      expect(overlay).assertEqual(RouteTable.PAGE_OVERLAY);
      expect(missing).assertEqual(RouteTable.PAGE_INDEX);
      expect(RouteTable.isKnownPage(missing)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableReal0004 end');
    })

    /**
     * @tc.name   testRouteTableReal0005
     * @tc.number SUB_RESMGR_ROUTE_REAL_0005
     * @tc.desc   回退结果对空串与纯前缀同样生效
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableReal0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableReal0005 begin');
      expect(RouteTable.resolvePage('')).assertEqual(RouteTable.PAGE_INDEX);
      expect(RouteTable.resolvePage(RouteTable.PAGE_PREFIX)).assertEqual(RouteTable.PAGE_INDEX);
      expect(RouteTable.isKnownPage('')).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableReal0005 end');
    })

    /**
     * @tc.name   testRouteTableReal0006
     * @tc.number SUB_RESMGR_ROUTE_REAL_0006
     * @tc.desc   isPageUrl 只看前缀，不看页面是否已注册
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableReal0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableReal0006 begin');
      const registered: boolean = RouteTable.isPageUrl(RouteTable.PAGE_INDEX);
      const unregistered: boolean = RouteTable.isPageUrl('pages/Whatever');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s/%{public}s', String(registered), String(unregistered));
      expect(registered).assertTrue();
      expect(unregistered).assertTrue();
      expect(RouteTable.isPageUrl('Index')).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableReal0006 end');
    })

    /**
     * @tc.name   testRouteTableReal0007
     * @tc.number SUB_RESMGR_ROUTE_REAL_0007
     * @tc.desc   isPageUrl 对空串返回 false，不会抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableReal0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableReal0007 begin');
      expect(RouteTable.isPageUrl('')).assertFalse();
      expect(RouteTable.isPageUrl(' ')).assertFalse();
      expect(RouteTable.isPageUrl('/pages/Index')).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableReal0007 end');
    })

    /**
     * @tc.name   testRouteTableReal0008
     * @tc.number SUB_RESMGR_ROUTE_REAL_0008
     * @tc.desc   公共事件名必须与页面订阅的事件逐字一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableReal0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableReal0008 begin');
      const hit: boolean = RouteTable.isResourcesEvent(RouteTable.RESOURCES_EVENT);
      const miss: boolean = RouteTable.isResourcesEvent('TestResourcesEvent ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s/%{public}s', String(hit), String(miss));
      expect(hit).assertTrue();
      expect(miss).assertFalse();
      expect(RouteTable.RESOURCES_EVENT).assertEqual('TestResourcesEvent');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableReal0008 end');
    })

    /**
     * @tc.name   testRouteTableReal0009
     * @tc.number SUB_RESMGR_ROUTE_REAL_0009
     * @tc.desc   页面常量必须带 pages/ 前缀，事件名不带
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableReal0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableReal0009 begin');
      expect(RouteTable.PAGE_PREFIX).assertEqual('pages/');
      expect(RouteTable.PAGE_INDEX.startsWith(RouteTable.PAGE_PREFIX)).assertTrue();
      expect(RouteTable.PAGE_BASIC_RESOURCES.startsWith('pages/')).assertTrue();
      expect(RouteTable.RESOURCES_EVENT.startsWith('pages/')).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableReal0009 end');
    })

    /**
     * @tc.name   testRouteTableReal0010
     * @tc.number SUB_RESMGR_ROUTE_REAL_0010
     * @tc.desc   每个声明页面都必须能被解析回自身
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableReal0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableReal0010 begin');
      const pages: string[] = RouteTable.allPages();
      let resolved: number = 0;
      for (let index: number = 0; index < pages.length; index++) {
        if (RouteTable.resolvePage(pages[index]) === pages[index]) {
          resolved++;
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', resolved, pages.length);
      expect(resolved).assertEqual(3);
      expect(resolved).assertEqual(pages.length);
      expect(RouteTable.resolvePage(pages[1])).assertEqual(RouteTable.PAGE_BASIC_RESOURCES);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableReal0010 end');
    })
  })
}
