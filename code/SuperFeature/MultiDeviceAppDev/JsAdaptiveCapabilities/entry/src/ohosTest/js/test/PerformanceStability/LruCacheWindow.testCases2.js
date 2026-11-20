/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import hilog from '@ohos.hilog';
import { it, expect } from '@ohos/hypium';
import model from '../Shared/AdaptiveModel';

const DOMAIN = 0xF811;
const TAG = '[Sample_jsAdaptiveCapabilities]';
const YIELD_MS = 10;

function yieldThread() {
  return new Promise(function (resolve) {
    setTimeout(function () {
      resolve();
    }, YIELD_MS);
  });
}

function LruCacheWindowPart057() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2316
     * @tc.name    JsCache076
     * @tc.desc    LRU capacity 3 after 8 accesses keeps k4,k1 seed 76
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache076', 0, async function () {
      await yieldThread();
      const order = [];
      expect(model.lruAccess(order, 'k4', 3)).assertEqual(false);
      expect(order.length).assertEqual(1);
      expect(model.lruAccess(order, 'k1', 3)).assertEqual(false);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k4', 3)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k1', 3)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k4', 3)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k1', 3)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k4', 3)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k1', 3)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(order.join(',')).assertEqual('k4,k1');
      expect(order.length <= 3).assertEqual(true);
      expect(order[order.length - 1]).assertEqual('k1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache076 done');
    });
}

function LruCacheWindowPart058() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2317
     * @tc.name    JsCache077
     * @tc.desc    LRU capacity 4 after 9 accesses keeps k2,k5 seed 77
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache077', 0, async function () {
      await yieldThread();
      const order = [];
      expect(model.lruAccess(order, 'k5', 4)).assertEqual(false);
      expect(order.length).assertEqual(1);
      expect(model.lruAccess(order, 'k2', 4)).assertEqual(false);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k5', 4)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k2', 4)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k5', 4)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k2', 4)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k5', 4)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k2', 4)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k5', 4)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(order.join(',')).assertEqual('k2,k5');
      expect(order.length <= 4).assertEqual(true);
      expect(order[order.length - 1]).assertEqual('k5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache077 done');
    });
}

function LruCacheWindowPart059() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2318
     * @tc.name    JsCache078
     * @tc.desc    LRU capacity 5 after 10 accesses keeps k0,k3 seed 78
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache078', 0, async function () {
      await yieldThread();
      const order = [];
      expect(model.lruAccess(order, 'k0', 5)).assertEqual(false);
      expect(order.length).assertEqual(1);
      expect(model.lruAccess(order, 'k3', 5)).assertEqual(false);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k0', 5)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k3', 5)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k0', 5)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k3', 5)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k0', 5)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k3', 5)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k0', 5)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k3', 5)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(order.join(',')).assertEqual('k0,k3');
      expect(order.length <= 5).assertEqual(true);
      expect(order[order.length - 1]).assertEqual('k3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache078 done');
    });
}

function LruCacheWindowPart060() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2319
     * @tc.name    JsCache079
     * @tc.desc    LRU capacity 6 after 11 accesses keeps k4,k1 seed 79
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache079', 0, async function () {
      await yieldThread();
      const order = [];
      expect(model.lruAccess(order, 'k1', 6)).assertEqual(false);
      expect(order.length).assertEqual(1);
      expect(model.lruAccess(order, 'k4', 6)).assertEqual(false);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k1', 6)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k4', 6)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k1', 6)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k4', 6)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k1', 6)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k4', 6)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k1', 6)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k4', 6)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k1', 6)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(order.join(',')).assertEqual('k4,k1');
      expect(order.length <= 6).assertEqual(true);
      expect(order[order.length - 1]).assertEqual('k1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache079 done');
    });
}

function LruCacheWindowPart061() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2320
     * @tc.name    JsCache080
     * @tc.desc    LRU capacity 2 after 4 accesses keeps k2,k5 seed 80
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache080', 0, async function () {
      await yieldThread();
      const order = [];
      expect(model.lruAccess(order, 'k2', 2)).assertEqual(false);
      expect(order.length).assertEqual(1);
      expect(model.lruAccess(order, 'k5', 2)).assertEqual(false);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k2', 2)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k5', 2)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(order.join(',')).assertEqual('k2,k5');
      expect(order.length <= 2).assertEqual(true);
      expect(order[order.length - 1]).assertEqual('k5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache080 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2321
     * @tc.name    JsCache081
     * @tc.desc    LRU capacity 3 after 5 accesses keeps k0,k3 seed 81
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache081', 0, async function () {
      await yieldThread();
      const order = [];
      expect(model.lruAccess(order, 'k3', 3)).assertEqual(false);
      expect(order.length).assertEqual(1);
      expect(model.lruAccess(order, 'k0', 3)).assertEqual(false);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k3', 3)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k0', 3)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k3', 3)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(order.join(',')).assertEqual('k0,k3');
      expect(order.length <= 3).assertEqual(true);
      expect(order[order.length - 1]).assertEqual('k3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache081 done');
    });
}

function LruCacheWindowPart062() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2322
     * @tc.name    JsCache082
     * @tc.desc    LRU capacity 4 after 6 accesses keeps k4,k1 seed 82
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache082', 0, async function () {
      await yieldThread();
      const order = [];
      expect(model.lruAccess(order, 'k4', 4)).assertEqual(false);
      expect(order.length).assertEqual(1);
      expect(model.lruAccess(order, 'k1', 4)).assertEqual(false);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k4', 4)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k1', 4)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k4', 4)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k1', 4)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(order.join(',')).assertEqual('k4,k1');
      expect(order.length <= 4).assertEqual(true);
      expect(order[order.length - 1]).assertEqual('k1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache082 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2323
     * @tc.name    JsCache083
     * @tc.desc    LRU capacity 5 after 7 accesses keeps k2,k5 seed 83
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache083', 0, async function () {
      await yieldThread();
      const order = [];
      expect(model.lruAccess(order, 'k5', 5)).assertEqual(false);
      expect(order.length).assertEqual(1);
      expect(model.lruAccess(order, 'k2', 5)).assertEqual(false);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k5', 5)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k2', 5)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k5', 5)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k2', 5)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k5', 5)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(order.join(',')).assertEqual('k2,k5');
      expect(order.length <= 5).assertEqual(true);
      expect(order[order.length - 1]).assertEqual('k5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache083 done');
    });
}

function LruCacheWindowPart063() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2324
     * @tc.name    JsCache084
     * @tc.desc    LRU capacity 6 after 8 accesses keeps k0,k3 seed 84
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache084', 0, async function () {
      await yieldThread();
      const order = [];
      expect(model.lruAccess(order, 'k0', 6)).assertEqual(false);
      expect(order.length).assertEqual(1);
      expect(model.lruAccess(order, 'k3', 6)).assertEqual(false);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k0', 6)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k3', 6)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k0', 6)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k3', 6)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k0', 6)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k3', 6)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(order.join(',')).assertEqual('k0,k3');
      expect(order.length <= 6).assertEqual(true);
      expect(order[order.length - 1]).assertEqual('k3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache084 done');
    });
}

function LruCacheWindowPart064() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2325
     * @tc.name    JsCache085
     * @tc.desc    LRU capacity 2 after 9 accesses keeps k4,k1 seed 85
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache085', 0, async function () {
      await yieldThread();
      const order = [];
      expect(model.lruAccess(order, 'k1', 2)).assertEqual(false);
      expect(order.length).assertEqual(1);
      expect(model.lruAccess(order, 'k4', 2)).assertEqual(false);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k1', 2)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k4', 2)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k1', 2)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k4', 2)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k1', 2)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k4', 2)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k1', 2)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(order.join(',')).assertEqual('k4,k1');
      expect(order.length <= 2).assertEqual(true);
      expect(order[order.length - 1]).assertEqual('k1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache085 done');
    });
}

function LruCacheWindowPart065() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2326
     * @tc.name    JsCache086
     * @tc.desc    LRU capacity 3 after 10 accesses keeps k2,k5 seed 86
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache086', 0, async function () {
      await yieldThread();
      const order = [];
      expect(model.lruAccess(order, 'k2', 3)).assertEqual(false);
      expect(order.length).assertEqual(1);
      expect(model.lruAccess(order, 'k5', 3)).assertEqual(false);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k2', 3)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k5', 3)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k2', 3)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k5', 3)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k2', 3)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k5', 3)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k2', 3)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k5', 3)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(order.join(',')).assertEqual('k2,k5');
      expect(order.length <= 3).assertEqual(true);
      expect(order[order.length - 1]).assertEqual('k5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache086 done');
    });
}

function LruCacheWindowPart066() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2327
     * @tc.name    JsCache087
     * @tc.desc    LRU capacity 4 after 11 accesses keeps k0,k3 seed 87
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache087', 0, async function () {
      await yieldThread();
      const order = [];
      expect(model.lruAccess(order, 'k3', 4)).assertEqual(false);
      expect(order.length).assertEqual(1);
      expect(model.lruAccess(order, 'k0', 4)).assertEqual(false);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k3', 4)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k0', 4)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k3', 4)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k0', 4)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k3', 4)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k0', 4)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k3', 4)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k0', 4)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k3', 4)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(order.join(',')).assertEqual('k0,k3');
      expect(order.length <= 4).assertEqual(true);
      expect(order[order.length - 1]).assertEqual('k3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache087 done');
    });
}

function LruCacheWindowPart067() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2328
     * @tc.name    JsCache088
     * @tc.desc    LRU capacity 5 after 4 accesses keeps k4,k1 seed 88
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache088', 0, async function () {
      await yieldThread();
      const order = [];
      expect(model.lruAccess(order, 'k4', 5)).assertEqual(false);
      expect(order.length).assertEqual(1);
      expect(model.lruAccess(order, 'k1', 5)).assertEqual(false);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k4', 5)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k1', 5)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(order.join(',')).assertEqual('k4,k1');
      expect(order.length <= 5).assertEqual(true);
      expect(order[order.length - 1]).assertEqual('k1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache088 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2329
     * @tc.name    JsCache089
     * @tc.desc    LRU capacity 6 after 5 accesses keeps k2,k5 seed 89
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache089', 0, async function () {
      await yieldThread();
      const order = [];
      expect(model.lruAccess(order, 'k5', 6)).assertEqual(false);
      expect(order.length).assertEqual(1);
      expect(model.lruAccess(order, 'k2', 6)).assertEqual(false);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k5', 6)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k2', 6)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k5', 6)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(order.join(',')).assertEqual('k2,k5');
      expect(order.length <= 6).assertEqual(true);
      expect(order[order.length - 1]).assertEqual('k5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache089 done');
    });
}

function LruCacheWindowPart068() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2330
     * @tc.name    JsCache090
     * @tc.desc    LRU capacity 2 after 6 accesses keeps k0,k3 seed 90
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache090', 0, async function () {
      await yieldThread();
      const order = [];
      expect(model.lruAccess(order, 'k0', 2)).assertEqual(false);
      expect(order.length).assertEqual(1);
      expect(model.lruAccess(order, 'k3', 2)).assertEqual(false);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k0', 2)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k3', 2)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k0', 2)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k3', 2)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(order.join(',')).assertEqual('k0,k3');
      expect(order.length <= 2).assertEqual(true);
      expect(order[order.length - 1]).assertEqual('k3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache090 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2331
     * @tc.name    JsCache091
     * @tc.desc    LRU capacity 3 after 7 accesses keeps k4,k1 seed 91
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache091', 0, async function () {
      await yieldThread();
      const order = [];
      expect(model.lruAccess(order, 'k1', 3)).assertEqual(false);
      expect(order.length).assertEqual(1);
      expect(model.lruAccess(order, 'k4', 3)).assertEqual(false);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k1', 3)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k4', 3)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k1', 3)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k4', 3)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k1', 3)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(order.join(',')).assertEqual('k4,k1');
      expect(order.length <= 3).assertEqual(true);
      expect(order[order.length - 1]).assertEqual('k1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache091 done');
    });
}

function LruCacheWindowPart069() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2332
     * @tc.name    JsCache092
     * @tc.desc    LRU capacity 4 after 8 accesses keeps k2,k5 seed 92
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache092', 0, async function () {
      await yieldThread();
      const order = [];
      expect(model.lruAccess(order, 'k2', 4)).assertEqual(false);
      expect(order.length).assertEqual(1);
      expect(model.lruAccess(order, 'k5', 4)).assertEqual(false);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k2', 4)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k5', 4)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k2', 4)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k5', 4)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k2', 4)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k5', 4)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(order.join(',')).assertEqual('k2,k5');
      expect(order.length <= 4).assertEqual(true);
      expect(order[order.length - 1]).assertEqual('k5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache092 done');
    });
}

function LruCacheWindowPart070() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2333
     * @tc.name    JsCache093
     * @tc.desc    LRU capacity 5 after 9 accesses keeps k0,k3 seed 93
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache093', 0, async function () {
      await yieldThread();
      const order = [];
      expect(model.lruAccess(order, 'k3', 5)).assertEqual(false);
      expect(order.length).assertEqual(1);
      expect(model.lruAccess(order, 'k0', 5)).assertEqual(false);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k3', 5)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k0', 5)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k3', 5)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k0', 5)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k3', 5)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k0', 5)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k3', 5)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(order.join(',')).assertEqual('k0,k3');
      expect(order.length <= 5).assertEqual(true);
      expect(order[order.length - 1]).assertEqual('k3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache093 done');
    });
}

function LruCacheWindowPart071() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2334
     * @tc.name    JsCache094
     * @tc.desc    LRU capacity 6 after 10 accesses keeps k4,k1 seed 94
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache094', 0, async function () {
      await yieldThread();
      const order = [];
      expect(model.lruAccess(order, 'k4', 6)).assertEqual(false);
      expect(order.length).assertEqual(1);
      expect(model.lruAccess(order, 'k1', 6)).assertEqual(false);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k4', 6)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k1', 6)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k4', 6)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k1', 6)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k4', 6)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k1', 6)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k4', 6)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k1', 6)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(order.join(',')).assertEqual('k4,k1');
      expect(order.length <= 6).assertEqual(true);
      expect(order[order.length - 1]).assertEqual('k1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache094 done');
    });
}

function LruCacheWindowPart072() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2335
     * @tc.name    JsCache095
     * @tc.desc    LRU capacity 2 after 11 accesses keeps k2,k5 seed 95
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache095', 0, async function () {
      await yieldThread();
      const order = [];
      expect(model.lruAccess(order, 'k5', 2)).assertEqual(false);
      expect(order.length).assertEqual(1);
      expect(model.lruAccess(order, 'k2', 2)).assertEqual(false);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k5', 2)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k2', 2)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k5', 2)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k2', 2)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k5', 2)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k2', 2)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k5', 2)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k2', 2)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k5', 2)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(order.join(',')).assertEqual('k2,k5');
      expect(order.length <= 2).assertEqual(true);
      expect(order[order.length - 1]).assertEqual('k5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache095 done');
    });
}

function LruCacheWindowPart073() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2336
     * @tc.name    JsCache096
     * @tc.desc    LRU capacity 3 after 4 accesses keeps k0,k3 seed 96
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache096', 0, async function () {
      await yieldThread();
      const order = [];
      expect(model.lruAccess(order, 'k0', 3)).assertEqual(false);
      expect(order.length).assertEqual(1);
      expect(model.lruAccess(order, 'k3', 3)).assertEqual(false);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k0', 3)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k3', 3)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(order.join(',')).assertEqual('k0,k3');
      expect(order.length <= 3).assertEqual(true);
      expect(order[order.length - 1]).assertEqual('k3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache096 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2337
     * @tc.name    JsCache097
     * @tc.desc    LRU capacity 4 after 5 accesses keeps k4,k1 seed 97
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache097', 0, async function () {
      await yieldThread();
      const order = [];
      expect(model.lruAccess(order, 'k1', 4)).assertEqual(false);
      expect(order.length).assertEqual(1);
      expect(model.lruAccess(order, 'k4', 4)).assertEqual(false);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k1', 4)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k4', 4)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k1', 4)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(order.join(',')).assertEqual('k4,k1');
      expect(order.length <= 4).assertEqual(true);
      expect(order[order.length - 1]).assertEqual('k1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache097 done');
    });
}

function LruCacheWindowPart074() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2338
     * @tc.name    JsCache098
     * @tc.desc    LRU capacity 5 after 6 accesses keeps k2,k5 seed 98
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache098', 0, async function () {
      await yieldThread();
      const order = [];
      expect(model.lruAccess(order, 'k2', 5)).assertEqual(false);
      expect(order.length).assertEqual(1);
      expect(model.lruAccess(order, 'k5', 5)).assertEqual(false);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k2', 5)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k5', 5)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k2', 5)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k5', 5)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(order.join(',')).assertEqual('k2,k5');
      expect(order.length <= 5).assertEqual(true);
      expect(order[order.length - 1]).assertEqual('k5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache098 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2339
     * @tc.name    JsCache099
     * @tc.desc    LRU capacity 6 after 7 accesses keeps k0,k3 seed 99
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache099', 0, async function () {
      await yieldThread();
      const order = [];
      expect(model.lruAccess(order, 'k3', 6)).assertEqual(false);
      expect(order.length).assertEqual(1);
      expect(model.lruAccess(order, 'k0', 6)).assertEqual(false);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k3', 6)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k0', 6)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k3', 6)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k0', 6)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k3', 6)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(order.join(',')).assertEqual('k0,k3');
      expect(order.length <= 6).assertEqual(true);
      expect(order[order.length - 1]).assertEqual('k3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache099 done');
    });
}

function LruCacheWindowPart075() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2340
     * @tc.name    JsCache100
     * @tc.desc    LRU capacity 2 after 8 accesses keeps k4,k1 seed 100
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache100', 0, async function () {
      await yieldThread();
      const order = [];
      expect(model.lruAccess(order, 'k4', 2)).assertEqual(false);
      expect(order.length).assertEqual(1);
      expect(model.lruAccess(order, 'k1', 2)).assertEqual(false);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k4', 2)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k1', 2)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k4', 2)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k1', 2)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k4', 2)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k1', 2)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(order.join(',')).assertEqual('k4,k1');
      expect(order.length <= 2).assertEqual(true);
      expect(order[order.length - 1]).assertEqual('k1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache100 done');
    });
}

function LruCacheWindowPart076() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2341
     * @tc.name    JsCache101
     * @tc.desc    LRU capacity 3 after 9 accesses keeps k2,k5 seed 101
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache101', 0, async function () {
      await yieldThread();
      const order = [];
      expect(model.lruAccess(order, 'k5', 3)).assertEqual(false);
      expect(order.length).assertEqual(1);
      expect(model.lruAccess(order, 'k2', 3)).assertEqual(false);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k5', 3)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k2', 3)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k5', 3)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k2', 3)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k5', 3)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k2', 3)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k5', 3)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(order.join(',')).assertEqual('k2,k5');
      expect(order.length <= 3).assertEqual(true);
      expect(order[order.length - 1]).assertEqual('k5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache101 done');
    });
}

function LruCacheWindowPart077() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2342
     * @tc.name    JsCache102
     * @tc.desc    LRU capacity 4 after 10 accesses keeps k0,k3 seed 102
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache102', 0, async function () {
      await yieldThread();
      const order = [];
      expect(model.lruAccess(order, 'k0', 4)).assertEqual(false);
      expect(order.length).assertEqual(1);
      expect(model.lruAccess(order, 'k3', 4)).assertEqual(false);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k0', 4)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k3', 4)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k0', 4)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k3', 4)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k0', 4)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k3', 4)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k0', 4)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k3', 4)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(order.join(',')).assertEqual('k0,k3');
      expect(order.length <= 4).assertEqual(true);
      expect(order[order.length - 1]).assertEqual('k3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache102 done');
    });
}

function LruCacheWindowPart078() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2343
     * @tc.name    JsCache103
     * @tc.desc    LRU capacity 5 after 11 accesses keeps k4,k1 seed 103
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache103', 0, async function () {
      await yieldThread();
      const order = [];
      expect(model.lruAccess(order, 'k1', 5)).assertEqual(false);
      expect(order.length).assertEqual(1);
      expect(model.lruAccess(order, 'k4', 5)).assertEqual(false);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k1', 5)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k4', 5)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k1', 5)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k4', 5)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k1', 5)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k4', 5)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k1', 5)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k4', 5)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k1', 5)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(order.join(',')).assertEqual('k4,k1');
      expect(order.length <= 5).assertEqual(true);
      expect(order[order.length - 1]).assertEqual('k1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache103 done');
    });
}

function LruCacheWindowPart079() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2344
     * @tc.name    JsCache104
     * @tc.desc    LRU capacity 6 after 4 accesses keeps k2,k5 seed 104
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache104', 0, async function () {
      await yieldThread();
      const order = [];
      expect(model.lruAccess(order, 'k2', 6)).assertEqual(false);
      expect(order.length).assertEqual(1);
      expect(model.lruAccess(order, 'k5', 6)).assertEqual(false);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k2', 6)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k5', 6)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(order.join(',')).assertEqual('k2,k5');
      expect(order.length <= 6).assertEqual(true);
      expect(order[order.length - 1]).assertEqual('k5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache104 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2345
     * @tc.name    JsCache105
     * @tc.desc    LRU capacity 2 after 5 accesses keeps k0,k3 seed 105
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache105', 0, async function () {
      await yieldThread();
      const order = [];
      expect(model.lruAccess(order, 'k3', 2)).assertEqual(false);
      expect(order.length).assertEqual(1);
      expect(model.lruAccess(order, 'k0', 2)).assertEqual(false);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k3', 2)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k0', 2)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k3', 2)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(order.join(',')).assertEqual('k0,k3');
      expect(order.length <= 2).assertEqual(true);
      expect(order[order.length - 1]).assertEqual('k3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache105 done');
    });
}

function LruCacheWindowPart080() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2346
     * @tc.name    JsCache106
     * @tc.desc    LRU capacity 3 after 6 accesses keeps k4,k1 seed 106
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache106', 0, async function () {
      await yieldThread();
      const order = [];
      expect(model.lruAccess(order, 'k4', 3)).assertEqual(false);
      expect(order.length).assertEqual(1);
      expect(model.lruAccess(order, 'k1', 3)).assertEqual(false);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k4', 3)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k1', 3)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k4', 3)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k1', 3)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(order.join(',')).assertEqual('k4,k1');
      expect(order.length <= 3).assertEqual(true);
      expect(order[order.length - 1]).assertEqual('k1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache106 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2347
     * @tc.name    JsCache107
     * @tc.desc    LRU capacity 4 after 7 accesses keeps k2,k5 seed 107
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache107', 0, async function () {
      await yieldThread();
      const order = [];
      expect(model.lruAccess(order, 'k5', 4)).assertEqual(false);
      expect(order.length).assertEqual(1);
      expect(model.lruAccess(order, 'k2', 4)).assertEqual(false);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k5', 4)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k2', 4)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k5', 4)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k2', 4)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k5', 4)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(order.join(',')).assertEqual('k2,k5');
      expect(order.length <= 4).assertEqual(true);
      expect(order[order.length - 1]).assertEqual('k5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache107 done');
    });
}

function LruCacheWindowPart081() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2348
     * @tc.name    JsCache108
     * @tc.desc    LRU capacity 5 after 8 accesses keeps k0,k3 seed 108
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache108', 0, async function () {
      await yieldThread();
      const order = [];
      expect(model.lruAccess(order, 'k0', 5)).assertEqual(false);
      expect(order.length).assertEqual(1);
      expect(model.lruAccess(order, 'k3', 5)).assertEqual(false);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k0', 5)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k3', 5)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k0', 5)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k3', 5)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k0', 5)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k3', 5)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(order.join(',')).assertEqual('k0,k3');
      expect(order.length <= 5).assertEqual(true);
      expect(order[order.length - 1]).assertEqual('k3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache108 done');
    });
}

function LruCacheWindowPart082() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2349
     * @tc.name    JsCache109
     * @tc.desc    LRU capacity 6 after 9 accesses keeps k4,k1 seed 109
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache109', 0, async function () {
      await yieldThread();
      const order = [];
      expect(model.lruAccess(order, 'k1', 6)).assertEqual(false);
      expect(order.length).assertEqual(1);
      expect(model.lruAccess(order, 'k4', 6)).assertEqual(false);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k1', 6)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k4', 6)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k1', 6)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k4', 6)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k1', 6)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k4', 6)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k1', 6)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(order.join(',')).assertEqual('k4,k1');
      expect(order.length <= 6).assertEqual(true);
      expect(order[order.length - 1]).assertEqual('k1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache109 done');
    });
}

function LruCacheWindowPart083() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2350
     * @tc.name    JsCache110
     * @tc.desc    LRU capacity 2 after 10 accesses keeps k2,k5 seed 110
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache110', 0, async function () {
      await yieldThread();
      const order = [];
      expect(model.lruAccess(order, 'k2', 2)).assertEqual(false);
      expect(order.length).assertEqual(1);
      expect(model.lruAccess(order, 'k5', 2)).assertEqual(false);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k2', 2)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k5', 2)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k2', 2)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k5', 2)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k2', 2)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k5', 2)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k2', 2)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k5', 2)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(order.join(',')).assertEqual('k2,k5');
      expect(order.length <= 2).assertEqual(true);
      expect(order[order.length - 1]).assertEqual('k5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache110 done');
    });
}

function LruCacheWindowPart084() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2351
     * @tc.name    JsCache111
     * @tc.desc    LRU capacity 3 after 11 accesses keeps k0,k3 seed 111
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache111', 0, async function () {
      await yieldThread();
      const order = [];
      expect(model.lruAccess(order, 'k3', 3)).assertEqual(false);
      expect(order.length).assertEqual(1);
      expect(model.lruAccess(order, 'k0', 3)).assertEqual(false);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k3', 3)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k0', 3)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k3', 3)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k0', 3)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k3', 3)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k0', 3)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k3', 3)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k0', 3)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k3', 3)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(order.join(',')).assertEqual('k0,k3');
      expect(order.length <= 3).assertEqual(true);
      expect(order[order.length - 1]).assertEqual('k3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache111 done');
    });
}

function LruCacheWindowPart085() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2352
     * @tc.name    JsCache112
     * @tc.desc    LRU capacity 4 after 4 accesses keeps k4,k1 seed 112
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache112', 0, async function () {
      await yieldThread();
      const order = [];
      expect(model.lruAccess(order, 'k4', 4)).assertEqual(false);
      expect(order.length).assertEqual(1);
      expect(model.lruAccess(order, 'k1', 4)).assertEqual(false);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k4', 4)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k1', 4)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(order.join(',')).assertEqual('k4,k1');
      expect(order.length <= 4).assertEqual(true);
      expect(order[order.length - 1]).assertEqual('k1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache112 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2353
     * @tc.name    JsCache113
     * @tc.desc    LRU capacity 5 after 5 accesses keeps k2,k5 seed 113
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache113', 0, async function () {
      await yieldThread();
      const order = [];
      expect(model.lruAccess(order, 'k5', 5)).assertEqual(false);
      expect(order.length).assertEqual(1);
      expect(model.lruAccess(order, 'k2', 5)).assertEqual(false);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k5', 5)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k2', 5)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k5', 5)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(order.join(',')).assertEqual('k2,k5');
      expect(order.length <= 5).assertEqual(true);
      expect(order[order.length - 1]).assertEqual('k5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache113 done');
    });
}

function LruCacheWindowPart086() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2354
     * @tc.name    JsCache114
     * @tc.desc    LRU capacity 6 after 6 accesses keeps k0,k3 seed 114
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache114', 0, async function () {
      await yieldThread();
      const order = [];
      expect(model.lruAccess(order, 'k0', 6)).assertEqual(false);
      expect(order.length).assertEqual(1);
      expect(model.lruAccess(order, 'k3', 6)).assertEqual(false);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k0', 6)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k3', 6)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k0', 6)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k3', 6)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(order.join(',')).assertEqual('k0,k3');
      expect(order.length <= 6).assertEqual(true);
      expect(order[order.length - 1]).assertEqual('k3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache114 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2355
     * @tc.name    JsCache115
     * @tc.desc    LRU capacity 2 after 7 accesses keeps k4,k1 seed 115
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache115', 0, async function () {
      await yieldThread();
      const order = [];
      expect(model.lruAccess(order, 'k1', 2)).assertEqual(false);
      expect(order.length).assertEqual(1);
      expect(model.lruAccess(order, 'k4', 2)).assertEqual(false);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k1', 2)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k4', 2)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k1', 2)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k4', 2)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k1', 2)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(order.join(',')).assertEqual('k4,k1');
      expect(order.length <= 2).assertEqual(true);
      expect(order[order.length - 1]).assertEqual('k1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache115 done');
    });
}

function LruCacheWindowPart087() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2356
     * @tc.name    JsCache116
     * @tc.desc    LRU capacity 3 after 8 accesses keeps k2,k5 seed 116
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache116', 0, async function () {
      await yieldThread();
      const order = [];
      expect(model.lruAccess(order, 'k2', 3)).assertEqual(false);
      expect(order.length).assertEqual(1);
      expect(model.lruAccess(order, 'k5', 3)).assertEqual(false);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k2', 3)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k5', 3)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k2', 3)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k5', 3)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k2', 3)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k5', 3)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(order.join(',')).assertEqual('k2,k5');
      expect(order.length <= 3).assertEqual(true);
      expect(order[order.length - 1]).assertEqual('k5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache116 done');
    });
}

function LruCacheWindowPart088() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2357
     * @tc.name    JsCache117
     * @tc.desc    LRU capacity 4 after 9 accesses keeps k0,k3 seed 117
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache117', 0, async function () {
      await yieldThread();
      const order = [];
      expect(model.lruAccess(order, 'k3', 4)).assertEqual(false);
      expect(order.length).assertEqual(1);
      expect(model.lruAccess(order, 'k0', 4)).assertEqual(false);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k3', 4)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k0', 4)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k3', 4)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k0', 4)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k3', 4)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k0', 4)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k3', 4)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(order.join(',')).assertEqual('k0,k3');
      expect(order.length <= 4).assertEqual(true);
      expect(order[order.length - 1]).assertEqual('k3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache117 done');
    });
}

function LruCacheWindowPart089() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2358
     * @tc.name    JsCache118
     * @tc.desc    LRU capacity 5 after 10 accesses keeps k4,k1 seed 118
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache118', 0, async function () {
      await yieldThread();
      const order = [];
      expect(model.lruAccess(order, 'k4', 5)).assertEqual(false);
      expect(order.length).assertEqual(1);
      expect(model.lruAccess(order, 'k1', 5)).assertEqual(false);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k4', 5)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k1', 5)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k4', 5)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k1', 5)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k4', 5)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k1', 5)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k4', 5)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k1', 5)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(order.join(',')).assertEqual('k4,k1');
      expect(order.length <= 5).assertEqual(true);
      expect(order[order.length - 1]).assertEqual('k1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache118 done');
    });
}

function LruCacheWindowPart090() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2359
     * @tc.name    JsCache119
     * @tc.desc    LRU capacity 6 after 11 accesses keeps k2,k5 seed 119
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache119', 0, async function () {
      await yieldThread();
      const order = [];
      expect(model.lruAccess(order, 'k5', 6)).assertEqual(false);
      expect(order.length).assertEqual(1);
      expect(model.lruAccess(order, 'k2', 6)).assertEqual(false);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k5', 6)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k2', 6)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k5', 6)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k2', 6)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k5', 6)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k2', 6)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k5', 6)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k2', 6)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k5', 6)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(order.join(',')).assertEqual('k2,k5');
      expect(order.length <= 6).assertEqual(true);
      expect(order[order.length - 1]).assertEqual('k5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache119 done');
    });
}

function LruCacheWindowPart091() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2360
     * @tc.name    JsCache120
     * @tc.desc    LRU capacity 2 after 4 accesses keeps k0,k3 seed 120
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache120', 0, async function () {
      await yieldThread();
      const order = [];
      expect(model.lruAccess(order, 'k0', 2)).assertEqual(false);
      expect(order.length).assertEqual(1);
      expect(model.lruAccess(order, 'k3', 2)).assertEqual(false);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k0', 2)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k3', 2)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(order.join(',')).assertEqual('k0,k3');
      expect(order.length <= 2).assertEqual(true);
      expect(order[order.length - 1]).assertEqual('k3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache120 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2361
     * @tc.name    JsCache121
     * @tc.desc    LRU capacity 3 after 5 accesses keeps k4,k1 seed 121
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache121', 0, async function () {
      await yieldThread();
      const order = [];
      expect(model.lruAccess(order, 'k1', 3)).assertEqual(false);
      expect(order.length).assertEqual(1);
      expect(model.lruAccess(order, 'k4', 3)).assertEqual(false);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k1', 3)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k4', 3)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k1', 3)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(order.join(',')).assertEqual('k4,k1');
      expect(order.length <= 3).assertEqual(true);
      expect(order[order.length - 1]).assertEqual('k1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache121 done');
    });
}

export function registerLruCacheWindowExtra2() {
  LruCacheWindowPart057();
  LruCacheWindowPart058();
  LruCacheWindowPart059();
  LruCacheWindowPart060();
  LruCacheWindowPart061();
  LruCacheWindowPart062();
  LruCacheWindowPart063();
  LruCacheWindowPart064();
  LruCacheWindowPart065();
  LruCacheWindowPart066();
  LruCacheWindowPart067();
  LruCacheWindowPart068();
  LruCacheWindowPart069();
  LruCacheWindowPart070();
  LruCacheWindowPart071();
  LruCacheWindowPart072();
  LruCacheWindowPart073();
  LruCacheWindowPart074();
  LruCacheWindowPart075();
  LruCacheWindowPart076();
  LruCacheWindowPart077();
  LruCacheWindowPart078();
  LruCacheWindowPart079();
  LruCacheWindowPart080();
  LruCacheWindowPart081();
  LruCacheWindowPart082();
  LruCacheWindowPart083();
  LruCacheWindowPart084();
  LruCacheWindowPart085();
  LruCacheWindowPart086();
  LruCacheWindowPart087();
  LruCacheWindowPart088();
  LruCacheWindowPart089();
  LruCacheWindowPart090();
  LruCacheWindowPart091();
}
