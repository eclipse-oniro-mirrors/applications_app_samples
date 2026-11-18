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

export default function sysRouterConventionMatrixTest(): void {
  describe('SysRouterConventionMatrixTest', () => {
    /**
     * @tc.number    SUB_SYSTEM_ROUTER_CONVENTION_0001
     * @tc.name      sysRouterConventionMatrix0001
     * @tc.desc      所有路由名都以 One 或 Two 结尾
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sysRouterConventionMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterConventionMatrix0001 begin');
      const routes: Array<bundleManager.RouterItem> = bundleRoutes();
      let pageEnded = 0;
      routes.forEach((route: bundleManager.RouterItem) => {
        if (route.name.endsWith('One') || route.name.endsWith('Two')) {
          pageEnded += 1;
        }
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 pageEnded=${pageEnded}`);
      expect(pageEnded).assertEqual(routes.length);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 routes.length=${routes.length}`);
      expect(routes.length).assertEqual(10);
      const actual3: boolean = pageEnded > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterConventionMatrix0001 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_CONVENTION_0002
     * @tc.name      sysRouterConventionMatrix0002
     * @tc.desc      buildFunction 等于页面名首字母大写后拼接 Builder
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sysRouterConventionMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterConventionMatrix0002 begin');
      const routes: Array<bundleManager.RouterItem> = bundleRoutes();
      let matched = 0;
      routes.forEach((route: bundleManager.RouterItem) => {
        if (route.buildFunction === expectedBuildFunction(route.name)) {
          matched += 1;
        }
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 matched=${matched}`);
      expect(matched).assertEqual(10);
      const actual2: string = expectedBuildFunction('HarAPageOne');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('HarAPageOneBuilder');
      const actual3: string = expectedBuildFunction('pageTwo');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('PageTwoBuilder');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterConventionMatrix0002 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_CONVENTION_0003
     * @tc.name      sysRouterConventionMatrix0003
     * @tc.desc      HAR 与 HSP 页面的源码文件名与页面名一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sysRouterConventionMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterConventionMatrix0003 begin');
      const routes: Array<bundleManager.RouterItem> = bundleRoutes();
      let consistent = 0;
      routes.forEach((route: bundleManager.RouterItem) => {
        if (route.name.startsWith('page')) {
          return;
        }
        if (pageFileName(route.pageSourceFile) === route.name + '.ets') {
          consistent += 1;
        }
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 consistent=${consistent}`);
      expect(consistent).assertEqual(8);
      const actual2: number = routes.length - consistent;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(2);
      const actual3: boolean = consistent > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterConventionMatrix0003 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_CONVENTION_0004
     * @tc.name      sysRouterConventionMatrix0004
     * @tc.desc      HAR 页面路由名带有模块前缀 HarA 或 HarB
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sysRouterConventionMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterConventionMatrix0004 begin');
      const names: Array<string> = routeNames('entry');
      const harNames: Array<string> = names.filter((name: string) => name.startsWith('Har'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 harNames.length=${harNames.length}`);
      expect(harNames.length).assertEqual(4);
      const actual2: number = countByPrefix(harNames, 'HarA');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(2);
      const actual3: number = countByPrefix(harNames, 'HarB');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(2);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterConventionMatrix0004 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_CONVENTION_0005
     * @tc.name      sysRouterConventionMatrix0005
     * @tc.desc      HSP 页面路由名带有模块前缀 HspA 或 HspB
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sysRouterConventionMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterConventionMatrix0005 begin');
      const a: Array<string> = routeNames('hspA');
      const b: Array<string> = routeNames('hspB');
      const actual1: number = countByPrefix(a, 'HspA');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(2);
      const actual2: number = countByPrefix(b, 'HspB');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(2);
      const actual3: number = a.length + b.length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(4);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterConventionMatrix0005 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_CONVENTION_0006
     * @tc.name      sysRouterConventionMatrix0006
     * @tc.desc      路由名不含空格与路径分隔符
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sysRouterConventionMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterConventionMatrix0006 begin');
      const routes: Array<bundleManager.RouterItem> = bundleRoutes();
      let clean = 0;
      routes.forEach((route: bundleManager.RouterItem) => {
        if (route.name.indexOf(' ') < 0 && route.name.indexOf('/') < 0) {
          clean += 1;
        }
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 clean=${clean}`);
      expect(clean).assertEqual(routes.length);
      const actual2: number = routes[0].name.indexOf('/');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(-1);
      const actual3: boolean = clean > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterConventionMatrix0006 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_CONVENTION_0007
     * @tc.name      sysRouterConventionMatrix0007
     * @tc.desc      所有路由名去重后数量不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sysRouterConventionMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterConventionMatrix0007 begin');
      const routes: Array<bundleManager.RouterItem> = bundleRoutes();
      const names: Array<string> = [];
      routes.forEach((route: bundleManager.RouterItem) => {
        names.push(route.name);
      });
      const actual1: string | number | boolean = uniqueCount(names);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(names.length);
      const actual2: number = uniqueCount(names);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 names.length=${names.length}`);
      expect(names.length).assertEqual(10);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterConventionMatrix0007 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_CONVENTION_0008
     * @tc.name      sysRouterConventionMatrix0008
     * @tc.desc      所有 buildFunction 去重后数量不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sysRouterConventionMatrix0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterConventionMatrix0008 begin');
      const routes: Array<bundleManager.RouterItem> = bundleRoutes();
      const functions: Array<string> = [];
      routes.forEach((route: bundleManager.RouterItem) => {
        functions.push(route.buildFunction);
      });
      const actual1: string | number | boolean = uniqueCount(functions);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(functions.length);
      const actual2: number = uniqueCount(functions);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 functions.length=${functions.length}`);
      expect(functions.length).assertEqual(10);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterConventionMatrix0008 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_CONVENTION_0009
     * @tc.name      sysRouterConventionMatrix0009
     * @tc.desc      本地页面名是小写开头的 pageOne 与 pageTwo
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sysRouterConventionMatrix0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterConventionMatrix0009 begin');
      const names: Array<string> = routeNames('entry');
      const local: Array<string> = names.filter((name: string) => name.startsWith('page'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 local.length=${local.length}`);
      expect(local.length).assertEqual(2);
      const actual2: string = local[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('pageOne');
      const actual3: string = local[1];
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('pageTwo');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterConventionMatrix0009 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_CONVENTION_0010
     * @tc.name      sysRouterConventionMatrix0010
     * @tc.desc      同一页面的路由名在 entry 与 entry_test 中保持一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sysRouterConventionMatrix0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterConventionMatrix0010 begin');
      const entryNames: Array<string> = routeNames('entry');
      const testNames: Array<string> = routeNames('entry_test');
      let same = 0;
      testNames.forEach((name: string) => {
        if (entryNames.indexOf(name) >= 0) {
          same += 1;
        }
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 same=${same}`);
      expect(same).assertEqual(testNames.length);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 testNames.length=${testNames.length}`);
      expect(testNames.length).assertEqual(4);
      const actual3: boolean = same < entryNames.length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterConventionMatrix0010 end');
    })
  })
}
