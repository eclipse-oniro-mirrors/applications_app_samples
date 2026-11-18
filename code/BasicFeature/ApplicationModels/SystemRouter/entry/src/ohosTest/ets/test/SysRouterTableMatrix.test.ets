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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { bundleManager } from '@kit.AbilityKit';

const ROUTER_FLAGS: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
  bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ROUTER_MAP;

function selfInfo(): bundleManager.BundleInfo {
  return bundleManager.getBundleInfoForSelfSync(ROUTER_FLAGS);
}

function selfModules(): Array<bundleManager.HapModuleInfo> {
  return selfInfo().hapModulesInfo;
}

function moduleNames(): Array<string> {
  const names: Array<string> = [];
  selfModules().forEach((item: bundleManager.HapModuleInfo) => {
    names.push(item.name);
  });
  return names;
}

function moduleRoutes(moduleName: string): Array<bundleManager.RouterItem> {
  const routes: Array<bundleManager.RouterItem> = [];
  selfModules().forEach((item: bundleManager.HapModuleInfo) => {
    if (item.name === moduleName) {
      item.routerMap.forEach((route: bundleManager.RouterItem) => {
        routes.push(route);
      });
    }
  });
  return routes;
}

function routeNames(moduleName: string): Array<string> {
  const names: Array<string> = [];
  moduleRoutes(moduleName).forEach((route: bundleManager.RouterItem) => {
    names.push(route.name);
  });
  return names;
}

function bundleRoutes(): Array<bundleManager.RouterItem> {
  return selfInfo().routerMap;
}

function countByPrefix(names: Array<string>, prefix: string): number {
  let count = 0;
  names.forEach((name: string) => {
    if (name.startsWith(prefix)) {
      count += 1;
    }
  });
  return count;
}

function uppercaseFirst(name: string): string {
  return name.charAt(0).toUpperCase() + name.substring(1);
}

function expectedBuildFunction(name: string): string {
  return uppercaseFirst(name) + 'Builder';
}

function pageFileName(pageSourceFile: string): string {
  const parts: Array<string> = pageSourceFile.split('/');
  return parts[parts.length - 1];
}

function uniqueCount(values: Array<string>): number {
  const seen: Set<string> = new Set<string>();
  values.forEach((value: string) => {
    seen.add(value);
  });
  return seen.size;
}

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SystemRouter]';

export default function sysRouterTableMatrixTest(): void {
  describe('SysRouterTableMatrixTest', () => {
    /**
     * @tc.number    SUB_SYSTEM_ROUTER_TABLE_0001
     * @tc.name      sysRouterTableMatrix0001
     * @tc.desc      自身 HAP 模块包含 entry 与两个 HSP 模块
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sysRouterTableMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterTableMatrix0001 begin');
      const names: Array<string> = moduleNames();
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 names.length=${names.length}`);
      expect(names.length).assertEqual(4);
      const actual2: boolean = names.indexOf('entry') >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = names.indexOf('hspA') >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = names.indexOf('hspB') >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterTableMatrix0001 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_TABLE_0002
     * @tc.name      sysRouterTableMatrix0002
     * @tc.desc      entry 模块合并了 HAR 与本地页面共 6 条系统路由
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sysRouterTableMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterTableMatrix0002 begin');
      const routes: Array<bundleManager.RouterItem> = moduleRoutes('entry');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 routes.length=${routes.length}`);
      expect(routes.length).assertEqual(6);
      const actual2: boolean = Array.isArray(routes);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = routes.length === 6;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterTableMatrix0002 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_TABLE_0003
     * @tc.name      sysRouterTableMatrix0003
     * @tc.desc      entry 路由表包含本地 pageOne 与 pageTwo
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sysRouterTableMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterTableMatrix0003 begin');
      const names: Array<string> = routeNames('entry');
      const actual1: boolean = names.indexOf('pageOne') >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = names.indexOf('pageTwo') >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: number = names.indexOf('pageOne');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(0);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterTableMatrix0003 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_TABLE_0004
     * @tc.name      sysRouterTableMatrix0004
     * @tc.desc      entry 路由表合并了 harA 与 harB 各两个页面
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sysRouterTableMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterTableMatrix0004 begin');
      const names: Array<string> = routeNames('entry');
      const actual1: number = countByPrefix(names, 'HarA');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(2);
      const actual2: number = countByPrefix(names, 'HarB');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(2);
      const actual3: number = names.length - 2;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(4);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterTableMatrix0004 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_TABLE_0005
     * @tc.name      sysRouterTableMatrix0005
     * @tc.desc      hspA 模块注册两个系统路由页面
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sysRouterTableMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterTableMatrix0005 begin');
      const names: Array<string> = routeNames('hspA');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 names.length=${names.length}`);
      expect(names.length).assertEqual(2);
      const actual2: string = names[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('HspAPageOne');
      const actual3: string = names[1];
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('HspAPageTwo');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterTableMatrix0005 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_TABLE_0006
     * @tc.name      sysRouterTableMatrix0006
     * @tc.desc      hspB 模块注册两个系统路由页面
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sysRouterTableMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterTableMatrix0006 begin');
      const names: Array<string> = routeNames('hspB');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 names.length=${names.length}`);
      expect(names.length).assertEqual(2);
      const actual2: string = names[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('HspBPageOne');
      const actual3: string = names[1];
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('HspBPageTwo');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterTableMatrix0006 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_TABLE_0007
     * @tc.name      sysRouterTableMatrix0007
     * @tc.desc      BundleInfo 汇总去重后共 10 条系统路由
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sysRouterTableMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterTableMatrix0007 begin');
      const routes: Array<bundleManager.RouterItem> = bundleRoutes();
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 routes.length=${routes.length}`);
      expect(routes.length).assertEqual(10);
      const actual2: boolean = Array.isArray(routes);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = routes.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterTableMatrix0007 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_TABLE_0008
     * @tc.name      sysRouterTableMatrix0008
     * @tc.desc      BundleInfo 路由表包含全部约定的 10 个页面名
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sysRouterTableMatrix0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterTableMatrix0008 begin');
      const routes: Array<bundleManager.RouterItem> = bundleRoutes();
      const names: Array<string> = [];
      routes.forEach((route: bundleManager.RouterItem) => {
        names.push(route.name);
      });
      let matched = 0;
      const expected: Array<string> = [];
      expected.push('pageOne', 'pageTwo', 'HarAPageOne', 'HarAPageTwo');
      expected.push('HarBPageOne', 'HarBPageTwo', 'HspAPageOne', 'HspAPageTwo');
      expected.push('HspBPageOne', 'HspBPageTwo');
      expected.forEach((name: string) => {
        if (names.indexOf(name) >= 0) {
          matched += 1;
        }
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 matched=${matched}`);
      expect(matched).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 names.length=${names.length}`);
      expect(names.length).assertEqual(10);
      const actual3: number = uniqueCount(names);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(10);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterTableMatrix0008 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_TABLE_0009
     * @tc.name      sysRouterTableMatrix0009
     * @tc.desc      entry 第一条路由 pageOne 指向 EntryPageOne.ets
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sysRouterTableMatrix0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterTableMatrix0009 begin');
      const routes: Array<bundleManager.RouterItem> = moduleRoutes('entry');
      const first: bundleManager.RouterItem = routes[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 first.name=${first.name}`);
      expect(first.name).assertEqual('pageOne');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 first.pageSourceFile=${first.pageSourceFile}`);
      expect(first.pageSourceFile).assertEqual('src/main/ets/pages/EntryPageOne.ets');
      const actual3: string = pageFileName(first.pageSourceFile);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('EntryPageOne.ets');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterTableMatrix0009 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_TABLE_0010
     * @tc.name      sysRouterTableMatrix0010
     * @tc.desc      entry 第一条路由的 buildFunction 是 PageOneBuilder
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sysRouterTableMatrix0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterTableMatrix0010 begin');
      const routes: Array<bundleManager.RouterItem> = moduleRoutes('entry');
      const first: bundleManager.RouterItem = routes[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 first.buildFunction=${first.buildFunction}`);
      expect(first.buildFunction).assertEqual('PageOneBuilder');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 first.buildFunction=${first.buildFunction}`);
      expect(first.buildFunction).assertEqual(expectedBuildFunction('pageOne'));
      const actual3: boolean = first.buildFunction.endsWith('Builder');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterTableMatrix0010 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_TABLE_0011
     * @tc.name      sysRouterTableMatrix0011
     * @tc.desc      hspA 第一条路由指向 HspAPageOne.ets
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sysRouterTableMatrix0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterTableMatrix0011 begin');
      const routes: Array<bundleManager.RouterItem> = moduleRoutes('hspA');
      const first: bundleManager.RouterItem = routes[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 first.name=${first.name}`);
      expect(first.name).assertEqual('HspAPageOne');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 first.pageSourceFile=${first.pageSourceFile}`);
      expect(first.pageSourceFile).assertEqual('src/main/ets/pages/HspAPageOne.ets');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 first.buildFunction=${first.buildFunction}`);
      expect(first.buildFunction).assertEqual('HspAPageOneBuilder');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterTableMatrix0011 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_TABLE_0012
     * @tc.name      sysRouterTableMatrix0012
     * @tc.desc      全部系统路由的 buildFunction 都以 Builder 结尾
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sysRouterTableMatrix0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterTableMatrix0012 begin');
      const routes: Array<bundleManager.RouterItem> = bundleRoutes();
      let builderEnded = 0;
      routes.forEach((route: bundleManager.RouterItem) => {
        if (route.buildFunction.endsWith('Builder')) {
          builderEnded += 1;
        }
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 builderEnded=${builderEnded}`);
      expect(builderEnded).assertEqual(routes.length);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 routes.length=${routes.length}`);
      expect(routes.length).assertEqual(10);
      const actual3: boolean = builderEnded > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterTableMatrix0012 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_TABLE_0013
     * @tc.name      sysRouterTableMatrix0013
     * @tc.desc      全部系统路由的 pageSourceFile 都是 ets 源码路径
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sysRouterTableMatrix0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterTableMatrix0013 begin');
      const routes: Array<bundleManager.RouterItem> = bundleRoutes();
      let etsFiles = 0;
      routes.forEach((route: bundleManager.RouterItem) => {
        if (route.pageSourceFile.endsWith('.ets')) {
          etsFiles += 1;
        }
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 etsFiles=${etsFiles}`);
      expect(etsFiles).assertEqual(routes.length);
      const actual2: boolean = routes[0].pageSourceFile.indexOf('/') > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = etsFiles > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterTableMatrix0013 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_TABLE_0014
     * @tc.name      sysRouterTableMatrix0014
     * @tc.desc      全部系统路由的页面源码都位于 pages 目录
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sysRouterTableMatrix0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterTableMatrix0014 begin');
      const routes: Array<bundleManager.RouterItem> = bundleRoutes();
      let inPages = 0;
      routes.forEach((route: bundleManager.RouterItem) => {
        if (route.pageSourceFile.startsWith('src/main/ets/pages/')) {
          inPages += 1;
        }
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 inPages=${inPages}`);
      expect(inPages).assertEqual(routes.length);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 routes.length=${routes.length}`);
      expect(routes.length).assertEqual(10);
      const actual3: boolean = inPages > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterTableMatrix0014 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_TABLE_0015
     * @tc.name      sysRouterTableMatrix0015
     * @tc.desc      entry 与 entry_test 模块都带有 HAR 页面路由
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sysRouterTableMatrix0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterTableMatrix0015 begin');
      const entryNames: Array<string> = routeNames('entry');
      const testNames: Array<string> = routeNames('entry_test');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 testNames.length=${testNames.length}`);
      expect(testNames.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 testNames.length=${testNames.length}`);
      expect(testNames.length).assertEqual(entryNames.length - 2);
      const actual3: number = countByPrefix(testNames, 'HarA');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(2);
      const actual4: number = countByPrefix(testNames, 'HarB');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual(2);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterTableMatrix0015 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_TABLE_0016
     * @tc.name      sysRouterTableMatrix0016
     * @tc.desc      hspA 与 hspB 的路由名互不重复
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sysRouterTableMatrix0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterTableMatrix0016 begin');
      const a: Array<string> = routeNames('hspA');
      const b: Array<string> = routeNames('hspB');
      const merged: Array<string> = a.concat(b);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 merged.length=${merged.length}`);
      expect(merged.length).assertEqual(4);
      const actual2: number = uniqueCount(merged);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(4);
      const actual3: boolean = a[0] !== b[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterTableMatrix0016 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_TABLE_0017
     * @tc.name      sysRouterTableMatrix0017
     * @tc.desc      BundleInfo 路由表里没有重复的页面名
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sysRouterTableMatrix0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterTableMatrix0017 begin');
      const routes: Array<bundleManager.RouterItem> = bundleRoutes();
      const names: Array<string> = [];
      routes.forEach((route: bundleManager.RouterItem) => {
        names.push(route.name);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 names.length=${names.length}`);
      expect(names.length).assertEqual(10);
      const actual2: string | number | boolean = uniqueCount(names);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(names.length);
      const actual3: number = uniqueCount(names);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(10);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterTableMatrix0017 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_TABLE_0018
     * @tc.name      sysRouterTableMatrix0018
     * @tc.desc      entry 路由的 name 与 buildFunction 按首字母大写对应
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sysRouterTableMatrix0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterTableMatrix0018 begin');
      const routes: Array<bundleManager.RouterItem> = moduleRoutes('entry');
      let matched = 0;
      routes.forEach((route: bundleManager.RouterItem) => {
        if (route.buildFunction === expectedBuildFunction(route.name)) {
          matched += 1;
        }
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 matched=${matched}`);
      expect(matched).assertEqual(routes.length);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 routes.length=${routes.length}`);
      expect(routes.length).assertEqual(6);
      const actual3: boolean = matched > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterTableMatrix0018 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_TABLE_0019
     * @tc.name      sysRouterTableMatrix0019
     * @tc.desc      entry 路由表首尾页面分别是 pageOne 与 HarBPageTwo
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sysRouterTableMatrix0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterTableMatrix0019 begin');
      const names: Array<string> = routeNames('entry');
      const actual1: string = names[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('pageOne');
      const actual2: string = names[names.length - 1];
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('HarBPageTwo');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 names.length=${names.length}`);
      expect(names.length).assertEqual(6);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterTableMatrix0019 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_TABLE_0020
     * @tc.name      sysRouterTableMatrix0020
     * @tc.desc      各模块路由条数之和等于汇总路由条数
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sysRouterTableMatrix0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterTableMatrix0020 begin');
      const names: Array<string> = moduleNames();
      let total = 0;
      names.forEach((name: string) => {
        total += moduleRoutes(name).length;
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 total=${total}`);
      expect(total).assertEqual(14);
      const actual2: number = bundleRoutes().length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(10);
      const actual3: boolean = total > bundleRoutes().length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterTableMatrix0020 end');
    })
  })
}
