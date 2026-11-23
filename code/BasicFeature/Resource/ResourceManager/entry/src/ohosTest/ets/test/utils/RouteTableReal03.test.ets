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

import { describe, it, expect, beforeAll, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { RouteTable } from '../../../../main/ets/utils/RouteTable';

const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_ResourceManager]';
/** Page names without the router prefix. */
const PAGE_NAMES: string[] = ['Index', 'BasicResources', 'Overlay'];
/** Inputs that are not registered pages. */
const UNKNOWN_URLS: string[] = [
  '',
  'pages/',
  'pages/Unknown',
  'BasicResources',
  'PAGES/INDEX',
  'pages//Index',
  'pages/Index/',
  'pages/Index?from=test'
];

/** True when the value is one of the declared pages. */
function inRegistry(url: string): boolean {
  const pages: string[] = RouteTable.allPages();
  return pages.indexOf(url) !== -1;
}

/**
 * Cross checks the page table predicates against each other: a url is only a
 * page when the registry says so, and every fallback has to land on a declared
 * page.
 */
export default function routeTableReal03Test() {
  describe('RouteTableReal03Test', () => {
    beforeAll(async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'RouteTableReal03Test begin');
    });

    /**
     * @tc.name   testRouteReal3001
     * @tc.number SUB_RESMGR_ROUTE_REAL3_0001
     * @tc.desc   注册表里的每个页面在同一位置被序号查询找回，长度与页面名数量一致
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testRouteReal3001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteReal3001 begin');
      const pages: string[] = RouteTable.allPages();
      let matched: number = 0;
      for (let index: number = 0; index < pages.length; index++) {
        if (RouteTable.pageIndexOf(pages[index]) === index) {
          matched++;
        }
      }
      expect(matched).assertEqual(pages.length);
      expect(pages.length).assertEqual(PAGE_NAMES.length);
      expect(matched).assertEqual(3);
    });

    /**
     * @tc.name   testRouteReal3002
     * @tc.number SUB_RESMGR_ROUTE_REAL3_0002
     * @tc.desc   对每个注册页面，三个判定函数同时成立：已知、解析到自身、带页面前缀
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testRouteReal3002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteReal3002 begin');
      const pages: string[] = RouteTable.allPages();
      let consistent: number = 0;
      for (let index: number = 0; index < pages.length; index++) {
        if (RouteTable.isKnownPage(pages[index]) && RouteTable.resolvePage(pages[index]) === pages[index] &&
          RouteTable.isPageUrl(pages[index])) {
          consistent++;
        }
      }
      expect(consistent).assertEqual(pages.length);
      expect(consistent > 0).assertTrue();
      expect(RouteTable.isPageUrl(RouteTable.PAGE_INDEX)).assertTrue();
    });

    /**
     * @tc.name   testRouteReal3003
     * @tc.number SUB_RESMGR_ROUTE_REAL3_0003
     * @tc.desc   带前缀但未注册的地址满足前缀判定，却不算已知页面并回退到入口页
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testRouteReal3003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteReal3003 begin');
      const candidate: string = 'pages/Unknown';
      expect(RouteTable.isPageUrl(candidate)).assertTrue();
      expect(RouteTable.isKnownPage(candidate)).assertFalse();
      expect(RouteTable.resolvePage(candidate)).assertEqual(RouteTable.PAGE_INDEX);
      expect(RouteTable.pageIndexOf(candidate)).assertEqual(-1);
    });

    /**
     * @tc.name   testRouteReal3004
     * @tc.number SUB_RESMGR_ROUTE_REAL3_0004
     * @tc.desc   八种未注册输入统一回退到入口页，回退结果不随输入变化
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testRouteReal3004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteReal3004 begin');
      let fellBack: number = 0;
      for (let index: number = 0; index < UNKNOWN_URLS.length; index++) {
        if (RouteTable.resolvePage(UNKNOWN_URLS[index]) === RouteTable.PAGE_INDEX) {
          fellBack++;
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'fallbacks=%{public}d/%{public}d',
        fellBack, UNKNOWN_URLS.length);
      expect(fellBack).assertEqual(UNKNOWN_URLS.length);
      expect(UNKNOWN_URLS.length).assertEqual(8);
      expect(RouteTable.resolvePage(UNKNOWN_URLS[0])).assertEqual(RouteTable.resolvePage(UNKNOWN_URLS[7]));
    });

    /**
     * @tc.name   testRouteReal3005
     * @tc.number SUB_RESMGR_ROUTE_REAL3_0005
     * @tc.desc   解析结果永远是注册表内的页面，未知输入不会产生新地址
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testRouteReal3005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteReal3005 begin');
      let inside: number = 0;
      for (let index: number = 0; index < UNKNOWN_URLS.length; index++) {
        const resolved: string = RouteTable.resolvePage(UNKNOWN_URLS[index]);
        if (inRegistry(resolved)) {
          inside++;
        }
      }
      expect(inside).assertEqual(UNKNOWN_URLS.length);
      expect(RouteTable.isKnownPage(RouteTable.resolvePage('pages/Unknown'))).assertTrue();
      expect(RouteTable.allPages().indexOf(RouteTable.resolvePage('pages/Unknown')) >= 0).assertTrue();
    });

    /**
     * @tc.name   testRouteReal3006
     * @tc.number SUB_RESMGR_ROUTE_REAL3_0006
     * @tc.desc   注册页面的前缀部分是唯一分隔符，去掉前缀后得到非空页面名
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testRouteReal3006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteReal3006 begin');
      const pages: string[] = RouteTable.allPages();
      let shaped: number = 0;
      for (let index: number = 0; index < pages.length; index++) {
        const name: string = pages[index].substring(RouteTable.PAGE_PREFIX.length);
        if (pages[index].startsWith(RouteTable.PAGE_PREFIX) && name.length > 0 &&
          name.indexOf('/') === -1) {
          shaped++;
        }
      }
      expect(shaped).assertEqual(pages.length);
      expect(RouteTable.PAGE_PREFIX).assertEqual('pages/');
      expect(pages[0].substring(RouteTable.PAGE_PREFIX.length)).assertEqual(PAGE_NAMES[0]);
    });

    /**
     * @tc.name   testRouteReal3007
     * @tc.number SUB_RESMGR_ROUTE_REAL3_0007
     * @tc.desc   三个页面常量与公共事件名四个字符串两两不同
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testRouteReal3007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteReal3007 begin');
      const values: string[] = [
        RouteTable.PAGE_INDEX,
        RouteTable.PAGE_BASIC_RESOURCES,
        RouteTable.PAGE_OVERLAY,
        RouteTable.RESOURCES_EVENT
      ];
      let distinct: number = 0;
      for (let left: number = 0; left < values.length; left++) {
        let unique: boolean = true;
        for (let right: number = 0; right < values.length; right++) {
          if (left !== right && values[left] === values[right]) {
            unique = false;
          }
        }
        if (unique) {
          distinct++;
        }
      }
      expect(distinct).assertEqual(values.length);
      expect(values.length).assertEqual(4);
      expect(distinct).assertEqual(4);
    });

    /**
     * @tc.name   testRouteReal3008
     * @tc.number SUB_RESMGR_ROUTE_REAL3_0008
     * @tc.desc   事件判定只对事件名成立，对三个页面地址全部不成立
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testRouteReal3008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteReal3008 begin');
      const pages: string[] = RouteTable.allPages();
      let rejected: number = 0;
      for (let index: number = 0; index < pages.length; index++) {
        if (!RouteTable.isResourcesEvent(pages[index])) {
          rejected++;
        }
      }
      expect(RouteTable.isResourcesEvent(RouteTable.RESOURCES_EVENT)).assertTrue();
      expect(rejected).assertEqual(pages.length);
      expect(RouteTable.isPageUrl(RouteTable.RESOURCES_EVENT)).assertFalse();
    });

    /**
     * @tc.name   testRouteReal3009
     * @tc.number SUB_RESMGR_ROUTE_REAL3_0009
     * @tc.desc   页面地址不会被当成事件名，事件名也不会被当成页面地址
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testRouteReal3009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteReal3009 begin');
      expect(RouteTable.isResourcesEvent(RouteTable.PAGE_INDEX)).assertFalse();
      expect(RouteTable.isPageUrl(RouteTable.RESOURCES_EVENT)).assertFalse();
      expect(RouteTable.isKnownPage(RouteTable.RESOURCES_EVENT)).assertFalse();
    });

    /**
     * @tc.name   testRouteReal3010
     * @tc.number SUB_RESMGR_ROUTE_REAL3_0010
     * @tc.desc   注册页面的序号互不相同且覆盖从零开始的连续区间
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testRouteReal3010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteReal3010 begin');
      const pages: string[] = RouteTable.allPages();
      let sum: number = 0;
      let seen: number[] = [];
      for (let index: number = 0; index < pages.length; index++) {
        const position: number = RouteTable.pageIndexOf(pages[index]);
        sum += position;
        if (seen.indexOf(position) === -1) {
          seen.push(position);
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'positions sum=%{public}d distinct=%{public}d', sum, seen.length);
      expect(sum).assertEqual(3);
      expect(seen.length).assertEqual(pages.length);
      expect(RouteTable.pageIndexOf(RouteTable.PAGE_INDEX)).assertEqual(0);
    });

    /**
     * @tc.name   testRouteReal3011
     * @tc.number SUB_RESMGR_ROUTE_REAL3_0011
     * @tc.desc   对全部候选输入连续解析两次结果一致，回退只发生一次
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testRouteReal3011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteReal3011 begin');
      const pages: string[] = RouteTable.allPages();
      let stable: number = 0;
      for (let index: number = 0; index < UNKNOWN_URLS.length; index++) {
        const once: string = RouteTable.resolvePage(UNKNOWN_URLS[index]);
        if (RouteTable.resolvePage(once) === once) {
          stable++;
        }
      }
      for (let index: number = 0; index < pages.length; index++) {
        if (RouteTable.resolvePage(RouteTable.resolvePage(pages[index])) === pages[index]) {
          stable++;
        }
      }
      expect(stable).assertEqual(UNKNOWN_URLS.length + pages.length);
      expect(stable).assertEqual(11);
      expect(RouteTable.resolvePage(RouteTable.PAGE_INDEX)).assertEqual(RouteTable.PAGE_INDEX);
    });

    /**
     * @tc.name   testRouteReal3012
     * @tc.number SUB_RESMGR_ROUTE_REAL3_0012
     * @tc.desc   大小写变形的页面名与前缀都不被接受，统一回退到入口页
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testRouteReal3012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteReal3012 begin');
      const upperCase: string = 'PAGES/INDEX';
      const mixedCase: string = 'pages/index';
      expect(RouteTable.isKnownPage(upperCase)).assertFalse();
      expect(RouteTable.isKnownPage(mixedCase)).assertFalse();
      expect(RouteTable.resolvePage(upperCase)).assertEqual(RouteTable.PAGE_INDEX);
      expect(RouteTable.resolvePage(mixedCase)).assertEqual(RouteTable.PAGE_INDEX);
    });

    /**
     * @tc.name   testRouteReal3013
     * @tc.number SUB_RESMGR_ROUTE_REAL3_0013
     * @tc.desc   带查询串的地址保留页面前缀但不在注册表内，解析回退到入口页
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testRouteReal3013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteReal3013 begin');
      const withQuery: string = 'pages/BasicResources?tab=1';
      expect(RouteTable.isPageUrl(withQuery)).assertTrue();
      expect(RouteTable.isKnownPage(withQuery)).assertFalse();
      expect(RouteTable.resolvePage(withQuery)).assertEqual(RouteTable.PAGE_INDEX);
    });

    /**
     * @tc.name   testRouteReal3014
     * @tc.number SUB_RESMGR_ROUTE_REAL3_0014
     * @tc.desc   尾随斜杠与重复前缀的地址都不算注册页面，解析统一回退
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testRouteReal3014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteReal3014 begin');
      const trailing: string = 'pages/Index/';
      const doubled: string = 'pages//Index';
      expect(RouteTable.isKnownPage(trailing)).assertFalse();
      expect(RouteTable.isKnownPage(doubled)).assertFalse();
      expect(RouteTable.resolvePage(trailing)).assertEqual(RouteTable.PAGE_INDEX);
      expect(RouteTable.resolvePage(doubled)).assertEqual(RouteTable.PAGE_INDEX);
    });

    /**
     * @tc.name   testRouteReal3015
     * @tc.number SUB_RESMGR_ROUTE_REAL3_0015
     * @tc.desc   前缀加页面名能还原三个页面常量，且还原结果都在注册表内
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testRouteReal3015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteReal3015 begin');
      let rebuilt: number = 0;
      for (let index: number = 0; index < PAGE_NAMES.length; index++) {
        const url: string = RouteTable.PAGE_PREFIX + PAGE_NAMES[index];
        if (RouteTable.isKnownPage(url)) {
          rebuilt++;
        }
      }
      expect(rebuilt).assertEqual(PAGE_NAMES.length);
      expect(RouteTable.PAGE_PREFIX + PAGE_NAMES[0]).assertEqual(RouteTable.PAGE_INDEX);
      expect(RouteTable.PAGE_PREFIX + PAGE_NAMES[2]).assertEqual(RouteTable.PAGE_OVERLAY);
    });

    /**
     * @tc.name   testRouteReal3016
     * @tc.number SUB_RESMGR_ROUTE_REAL3_0016
     * @tc.desc   三个注册页面加一个未知地址的交叉结果：三个已知、一个回退，解析值互不相同
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testRouteReal3016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteReal3016 begin');
      const candidates: string[] = RouteTable.allPages();
      candidates.push('pages/Unknown');
      let known: number = 0;
      let resolved: string[] = [];
      for (let index: number = 0; index < candidates.length; index++) {
        if (RouteTable.isKnownPage(candidates[index])) {
          known++;
        }
        const target: string = RouteTable.resolvePage(candidates[index]);
        if (resolved.indexOf(target) === -1) {
          resolved.push(target);
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'known=%{public}d distinct targets=%{public}d',
        known, resolved.length);
      expect(known).assertEqual(3);
      expect(resolved.length).assertEqual(3);
      expect(resolved.indexOf(RouteTable.PAGE_INDEX) >= 0).assertTrue();
    });
  });
}
