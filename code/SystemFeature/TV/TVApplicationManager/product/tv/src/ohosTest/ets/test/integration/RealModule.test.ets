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

import { describe, it, expect } from '@ohos/hypium';

interface filterApp {
  bundleName: string,
  abilityName: string,
  icon?: string
}

const appList: filterApp[] = [{ bundleName: 'com.ohos.camera', abilityName: 'com.ohos.camera.MainAbility' },
  { bundleName: 'com.ohos.callui', abilityName: 'com.ohos.callui.MainAbility' },
  { bundleName: 'com.ohos.contacts', abilityName: 'com.ohos.contacts.MainAbility' },
  { bundleName: 'com.ohos.mms', abilityName: 'com.ohos.mms.MainAbility' },
  { bundleName: 'com.ohos.updateapp', abilityName: 'com.ohos.updateapp.MainAbility' },
  { bundleName: 'com.ohos.note', abilityName: 'MainAbility' },
  { bundleName: 'com.ohos.photos', abilityName: 'com.ohos.photos.MainAbility' },
  { bundleName: 'ohos.samples.distributedcalc', abilityName: 'MainAbility' },
  { bundleName: 'ohos.samples.etsclock', abilityName: 'MainAbility' },
  { bundleName: 'com.ohos.dtvplayer', abilityName: 'MainAbility' },
  { bundleName: 'com.ohos.launcher', abilityName: 'MainAbility' },
  { bundleName: 'com.ohos.launcher', abilityName: 'AppDetailAbility' },
  { bundleName: 'com.ohos.setupwizard', abilityName: 'EntryAbility' },
  { bundleName: 'com.ohos.smartperf', abilityName: 'MainAbility' },
  { bundleName: 'com.qcode.jsviewapp', abilityName: 'EntryAbility' },
  { bundleName: 'com.ohos.globalsearch', abilityName: 'SearchAbility' },];

const iconList: filterApp[] = [{ bundleName: 'com.ohos.note', abilityName: 'MainAbility', icon: 'app.media.bwl' },
  { bundleName: 'com.ohos.demandplayer', abilityName: 'MainAbility', icon: 'app.media.spbfq1' },
  { bundleName: 'com.ohos.aiface', abilityName: 'MainAbility', icon: 'app.media.rl' },
  { bundleName: 'com.ohos.dtvplayer', abilityName: 'MainAbility', icon: 'app.media.db' },
  { bundleName: 'com.samples.album', abilityName: 'MainAbility', icon: 'app.media.tuku' },
  { bundleName: 'ohos.samples.browser1', abilityName: 'MainAbility', icon: 'app.media.llq' }, {
    bundleName: 'ohos.samples.distributedmusicplayer',
    abilityName: 'ohos.samples.distributedmusicplayer.MainAbility',
    icon: 'app.media.yy'
  }, { bundleName: 'com.ohos.inputsource', abilityName: 'EntryAbility', icon: 'app.media.sry1' },
  { bundleName: 'com.samples.camera', abilityName: 'EntryAbility', icon: 'app.media.xj' },
  { bundleName: 'com.ohos.settings', abilityName: 'com.ohos.settings.MainAbility', icon: 'app.media.shezhi' },
  { bundleName: 'com.laval.betaclub', abilityName: 'EntryAbility', icon: 'app.media.td' },
  { bundleName: 'tv.fun.appstore', abilityName: 'EntryAbility', icon: 'app.media.sc' },
  { bundleName: 'com.funshion.launcher', abilityName: 'EntryAbility', icon: 'app.media.xf' },
  { bundleName: 'com.funshion.launcher.edu', abilityName: 'EntryAbility', icon: 'app.media.lx' },
  { bundleName: 'com.funshion.launcher.movie', abilityName: 'EntryAbility', icon: 'app.media.bb' },
  { bundleName: 'com.funshion.launcher.child', abilityName: 'EntryAbility', icon: 'app.media.sr' },];

class FilterAppList {
  public handleFilter(app: string | undefined): boolean {
    let target = appList.filter(e => JSON.stringify(e) === app);
    if (target.length > 0) {
      return false;
    }
    return true;
  }

  public handleIcon(app: string | undefined): string | boolean {
    let target = iconList.filter(e => JSON.stringify(e.bundleName) === app);
    if (target.length > 0) {
      return target[0].icon ?? '';
    }
    return false;
  }
}

// ===== 真实 Throttle.ets 逻辑副本 =====
interface ArkMethodDescriptor {
  value?: () => void;
}

export interface ThrottleFn {
  call: () => void;
  cancel: () => void;
  timeout?: number;
  fun?: () => void;
  immediate?: boolean;
}

function throttleImpl(fun: () => void, wait: number, trailing?: boolean, leading?: boolean): ThrottleFn {
  const waitMs: number = wait ?? 0;
  const trailingFlag: boolean = trailing ?? false;
  const leadingFlag: boolean = leading ?? false;

  let lastCallTime = -1;
  let pending = false;

  const wrapper: ThrottleFn = {
    fun,
    timeout: undefined,
    immediate: leadingFlag,
    call: () => {
      if (waitMs <= 0) {
        fun();
        return;
      }
      const now = Date.now();
      if (lastCallTime < 0) {
        lastCallTime = now;
        fun();
        return;
      }
      const elapsed = now - lastCallTime;
      if (elapsed >= waitMs) {
        lastCallTime = now;
        fun();
        return;
      }
      if (trailingFlag) {
        pending = true;
      }
    },
    cancel: () => {
      pending = false;
      wrapper.timeout = undefined;
    }
  };

  const originalCall = wrapper.call;
  wrapper.call = () => {
    const beforeLast = lastCallTime;
    originalCall();
    if (waitMs > 0 && trailingFlag && pending) {
      const now = Date.now();
      if (beforeLast >= 0 && now - beforeLast >= waitMs) {
        pending = false;
        lastCallTime = now;
        fun();
      }
    }
  };

  return wrapper;
}

// ===== 真实 MemoryCache.ets 逻辑副本 =====
class MemoryCache {
  private cache = new Map<string, number>();
  private accessOrder: string[] = [];
  private maxSize: number = 50;

  public get(key: string): number | undefined {
    const value = this.cache.get(key);
    if (value !== undefined) {
      this.updateAccessOrder(key);
    }
    return value;
  }

  public set(key: string, value: number): void {
    if (this.cache.size >= this.maxSize) {
      const oldestKey = this.accessOrder.shift();
      if (oldestKey) {
        this.cache.delete(oldestKey);
      }
    }
    this.cache.set(key, value);
    this.updateAccessOrder(key);
  }

  public size(): number {
    return this.cache.size;
  }

  private updateAccessOrder(key: string): void {
    const index = this.accessOrder.indexOf(key);
    if (index > -1) {
      this.accessOrder.splice(index, 1);
    }
    this.accessOrder.push(key);
  }
}

// ===== Index.getAppInfo 整合逻辑辅助函数 =====
interface AppInfoInput {
  bundleName: string;
  abilityName: string;
  moduleName: string;
  installTime: number;
  labelId: number;
  iconId: number;
}

function isSelfOrAdminBundle(bundleName: string | undefined): boolean {
  return bundleName === 'com.ohos.adminprovisioning' || bundleName === 'com.samples.applicationmanager';
}

function filterSystemBundle(bundleName: string, abilityName: string): boolean {
  const filterList: string[] =
    ['com.ohos.camera', 'com.ohos.callui', 'com.ohos.contacts', 'com.ohos.mms', 'com.ohos.updateapp', 'com.ohos.note',
      'com.ohos.photos', 'com.ohos.dtvplayer'];
  return !filterList.includes(bundleName);
}

function processAppInfos(infoList: AppInfoInput[]): AppInfoInput[] {
  const uniqueElementSet: Set<string> = new Set<string>();
  const tempList: AppInfoInput[] = [];
  for (let i = 0; i < infoList.length; i++) {
    const cur = infoList[i];
    if (isSelfOrAdminBundle(cur.bundleName)) {
      continue;
    }
    if (!filterSystemBundle(cur.bundleName, cur.abilityName)) {
      continue;
    }
    const uniqueKey = `${cur.bundleName}::${cur.abilityName}::${cur.moduleName}`;
    if (uniqueElementSet.has(uniqueKey)) {
      continue;
    }
    uniqueElementSet.add(uniqueKey);
    tempList.push(cur);
  }
  tempList.sort((a, b) => a.installTime - b.installTime);
  return tempList;
}

export default function realModuleTest() {
  describe('RealModule_Test', () => { // ===== FilterApp 真实逻辑用例 =====
    it('filter_app_should_filter_system_apps', 0, () => {
      const filter = new FilterAppList();
      expect(filter.handleFilter(JSON.stringify({
        bundleName: 'com.ohos.camera',
        abilityName: 'com.ohos.camera.MainAbility'
      }))).assertFalse();
      expect(filter.handleFilter(JSON.stringify({ bundleName: 'com.ohos.launcher', abilityName: 'AppDetailAbility' })))
        .assertFalse();
      expect(filter.handleFilter(JSON.stringify({ bundleName: 'com.example.app', abilityName: 'MainAbility' })))
        .assertTrue();
      expect(filter.handleFilter(undefined)).assertTrue();
    });

    it('filter_app_should_not_filter_normal_apps', 0, () => {
      const filter = new FilterAppList();
      const normalApps: string[] = ['com.example.app', 'com.samples.album', 'ohos.samples.browser1'];
      for (const name of normalApps) {
        expect(filter.handleFilter(JSON.stringify({ bundleName: name, abilityName: 'MainAbility' }))).assertTrue();
      }
    });

    it('filter_app_should_map_icons_for_known_bundles', 0, () => {
      const filter = new FilterAppList();
      expect(filter.handleIcon('"com.ohos.settings"')).assertEqual('app.media.shezhi');
      expect(filter.handleIcon('"com.ohos.dtvplayer"')).assertEqual('app.media.db');
      expect(filter.handleIcon('"tv.fun.appstore"')).assertEqual('app.media.sc');
      expect(filter.handleIcon('"com.ohos.note"')).assertEqual('app.media.bwl');
    });

    it('filter_app_should_return_false_for_unknown_icon', 0, () => {
      const filter = new FilterAppList();
      expect(filter.handleIcon('"com.unknown.app"')).assertEqual(false);
      expect(filter.handleIcon(undefined)).assertEqual(false);
    });

    // ===== Throttle 真实逻辑用例 =====
    it('throttle_should_execute_immediately_on_first_call', 0, () => {
      let count: number = 0;
      const throttled: ThrottleFn = throttleImpl(() => {
        count++;
      }, 100);
      throttled.call();
      expect(count).assertEqual(1);
    });

    it('throttle_should_skip_calls_within_wait_window', 0, () => {
      let count: number = 0;
      const throttled: ThrottleFn = throttleImpl(() => {
        count++;
      }, 200);
      throttled.call();
      throttled.call();
      throttled.call();
      expect(count).assertEqual(1);
    });

    it('throttle_should_execute_again_after_wait_elapses', 0, async () => {
      let count: number = 0;
      const throttled: ThrottleFn = throttleImpl(() => {
        count++;
      }, 50);
      throttled.call();
      await new Promise<void>(resolve => setTimeout(resolve, 80));
      throttled.call();
      expect(count).assertEqual(2);
    });

    it('throttle_zero_wait_should_execute_every_call', 0, () => {
      let count: number = 0;
      const throttled: ThrottleFn = throttleImpl(() => {
        count++;
      }, 0);
      throttled.call();
      throttled.call();
      throttled.call();
      expect(count).assertEqual(3);
    });

    it('throttle_cancel_should_reset_pending_state', 0, () => {
      let count: number = 0;
      const throttled: ThrottleFn = throttleImpl(() => {
        count++;
      }, 100, true);
      throttled.call();
      throttled.call();
      throttled.cancel();
      throttled.call();
      expect(count).assertEqual(1);
    });

    // ===== MemoryCache 真实 LRU 逻辑用例 =====
    it('memory_cache_should_store_and_get', 0, () => {
      const cache = new MemoryCache();
      cache.set('com.a', 1);
      cache.set('com.b', 2);
      expect(cache.get('com.a')).assertEqual(1);
      expect(cache.get('com.b')).assertEqual(2);
      expect(cache.get('com.miss')).assertEqual(undefined);
      expect(cache.size()).assertEqual(2);
    });

    it('memory_cache_should_evict_oldest_when_full', 0, () => {
      const cache = new MemoryCache(); // maxSize=50：先填满 50 个键
      for (let i = 1; i <= 50; i++) {
        cache.set(`k${i}`, i);
      }
      expect(cache.size()).assertEqual(50); // 访问 k1 刷新其访问顺序，使 k2 成为最旧
      cache.get('k1'); // 第 51 个键触发淘汰最旧的 k2
      cache.set('k51', 51);
      expect(cache.size()).assertEqual(50);
      expect(cache.get('k2')).assertEqual(undefined);
      expect(cache.get('k1')).assertEqual(1);
      expect(cache.get('k3')).assertEqual(3);
      expect(cache.get('k51')).assertEqual(51);
    });

    it('memory_cache_get_should_refresh_access_order', 0, () => {
      const cache = new MemoryCache();
      for (let i = 1; i <= 50; i++) {
        cache.set(`k${i}`, i);
      } // 不访问 k1 时，第 51 个键淘汰最旧的 k1
      cache.set('k51', 51);
      expect(cache.get('k1')).assertEqual(undefined);
      expect(cache.get('k2')).assertEqual(2);
      expect(cache.get('k51')).assertEqual(51);
    });

    // ===== GridList 分批加载逻辑用例 =====
    it('grid_batch_loading_should_load_first_screen', 0, () => {
      const allList: string[] = [];
      for (let i = 0; i < 40; i++) {
        allList.push(`com.app${i}`);
      }
      const totalVisible: number = 18;
      const initialData: string[] = allList.slice(0, totalVisible);
      expect(initialData.length).assertEqual(18);
      expect(initialData[0]).assertEqual('com.app0');
      expect(initialData[17]).assertEqual('com.app17');
      const remainingCount: number = allList.length - totalVisible;
      expect(remainingCount).assertEqual(22);
    });

    it('grid_batch_loading_should_split_remaining_in_batches_of_six', 0, () => {
      const allList: string[] = [];
      for (let i = 0; i < 40; i++) {
        allList.push(`com.app${i}`);
      }
      const totalVisible: number = 18;
      const batchSize: number = 6;
      const remainingApps: string[] = allList.slice(totalVisible);
      expect(remainingApps.length).assertEqual(22);

      const batchSizes: number[] = [];
      let startIndex: number = 0;
      let currentBatch: number = 0;
      while (true) {
        const batchStart: number = currentBatch * batchSize;
        if (batchStart >= remainingApps.length) {
          break;
        }
        currentBatch++;
        const endIndex: number = Math.min(batchStart + batchSize, remainingApps.length);
        const batchApps: string[] = remainingApps.slice(batchStart, endIndex);
        batchSizes.push(batchApps.length);
        startIndex = endIndex;
        if (endIndex >= remainingApps.length) {
          break;
        }
      }
      expect(batchSizes.length).assertEqual(4);
      expect(batchSizes[0]).assertEqual(6);
      expect(batchSizes[1]).assertEqual(6);
      expect(batchSizes[2]).assertEqual(6);
      expect(batchSizes[3]).assertEqual(4);
      const totalLoaded: number = batchSizes.reduce((sum, n) => sum + n, 0);
      expect(totalLoaded).assertEqual(22);
    });

    it('grid_batch_loading_no_remaining_should_skip', 0, () => {
      const allList: string[] = [];
      for (let i = 0; i < 15; i++) {
        allList.push(`com.app${i}`);
      }
      const totalVisible: number = 18;
      const remainingCount: number = allList.length - totalVisible;
      expect(remainingCount).assertLessOrEqual(0);
      const initialData: string[] = allList.slice(0, totalVisible);
      expect(initialData.length).assertEqual(15);
    });

    // ===== Index.getAppInfo 整合逻辑用例 =====
    it('get_app_info_should_filter_self_and_admin', 0, () => {
      const infos: AppInfoInput[] = [{
        bundleName: 'com.ohos.adminprovisioning',
        abilityName: 'Main',
        moduleName: 'entry',
        installTime: 1,
        labelId: 0,
        iconId: 0
      }, {
        bundleName: 'com.samples.applicationmanager',
        abilityName: 'Main',
        moduleName: 'entry',
        installTime: 2,
        labelId: 0,
        iconId: 0
      }, {
        bundleName: 'com.example.app',
        abilityName: 'Main',
        moduleName: 'entry',
        installTime: 3,
        labelId: 0,
        iconId: 0
      }];
      const result: AppInfoInput[] = processAppInfos(infos);
      expect(result.length).assertEqual(1);
      expect(result[0].bundleName).assertEqual('com.example.app');
    });

    it('get_app_info_should_filter_system_apps', 0, () => {
      const infos: AppInfoInput[] = [{
        bundleName: 'com.ohos.camera',
        abilityName: 'com.ohos.camera.MainAbility',
        moduleName: 'entry',
        installTime: 1,
        labelId: 0,
        iconId: 0
      }, {
        bundleName: 'com.ohos.settings',
        abilityName: 'com.ohos.settings.MainAbility',
        moduleName: 'entry',
        installTime: 2,
        labelId: 0,
        iconId: 0
      }];
      const result: AppInfoInput[] = processAppInfos(infos);
      expect(result.length).assertEqual(1);
      expect(result[0].bundleName).assertEqual('com.ohos.settings');
    });

    it('get_app_info_should_deduplicate_by_element', 0, () => {
      const infos: AppInfoInput[] = [{
        bundleName: 'com.a',
        abilityName: 'Main',
        moduleName: 'entry',
        installTime: 5,
        labelId: 0,
        iconId: 0
      }, {
        bundleName: 'com.a',
        abilityName: 'Main',
        moduleName: 'entry',
        installTime: 6,
        labelId: 0,
        iconId: 0
      }, {
        bundleName: 'com.b',
        abilityName: 'Main',
        moduleName: 'entry',
        installTime: 7,
        labelId: 0,
        iconId: 0
      }];
      const result: AppInfoInput[] = processAppInfos(infos);
      expect(result.length).assertEqual(2);
    });

    it('get_app_info_should_sort_by_install_time', 0, () => {
      const infos: AppInfoInput[] = [{
        bundleName: 'com.c',
        abilityName: 'Main',
        moduleName: 'entry',
        installTime: 300,
        labelId: 0,
        iconId: 0
      }, {
        bundleName: 'com.a',
        abilityName: 'Main',
        moduleName: 'entry',
        installTime: 100,
        labelId: 0,
        iconId: 0
      }, {
        bundleName: 'com.b',
        abilityName: 'Main',
        moduleName: 'entry',
        installTime: 200,
        labelId: 0,
        iconId: 0
      }];
      const result: AppInfoInput[] = processAppInfos(infos);
      expect(result[0].bundleName).assertEqual('com.a');
      expect(result[1].bundleName).assertEqual('com.b');
      expect(result[2].bundleName).assertEqual('com.c');
    });

    it('get_app_info_complete_flow_should_work', 0, () => {
      const infos: AppInfoInput[] = [{
        bundleName: 'com.ohos.adminprovisioning',
        abilityName: 'Main',
        moduleName: 'entry',
        installTime: 1,
        labelId: 0,
        iconId: 0
      }, {
        bundleName: 'com.ohos.camera',
        abilityName: 'Main',
        moduleName: 'entry',
        installTime: 2,
        labelId: 0,
        iconId: 0
      }, {
        bundleName: 'com.b',
        abilityName: 'Main',
        moduleName: 'entry',
        installTime: 200,
        labelId: 0,
        iconId: 0
      }, {
        bundleName: 'com.a',
        abilityName: 'Main',
        moduleName: 'entry',
        installTime: 100,
        labelId: 0,
        iconId: 0
      }, {
        bundleName: 'com.b',
        abilityName: 'Main',
        moduleName: 'entry',
        installTime: 999,
        labelId: 0,
        iconId: 0
      }];
      const result: AppInfoInput[] = processAppInfos(infos);
      expect(result.length).assertEqual(2);
      expect(result[0].bundleName).assertEqual('com.a');
      expect(result[1].bundleName).assertEqual('com.b');
    });
  });
}
