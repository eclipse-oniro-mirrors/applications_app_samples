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
import { describe, it, expect } from '@ohos/hypium';
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

function LruCacheWindowPart001() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2241
     * @tc.name    JsCache001
     * @tc.desc    LRU capacity 3 after 5 accesses keeps k4,k1 seed 1
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache001', 0, async function () {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache001 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2242
     * @tc.name    JsCache002
     * @tc.desc    LRU capacity 4 after 6 accesses keeps k2,k5 seed 2
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache002', 0, async function () {
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
      expect(order.join(',')).assertEqual('k2,k5');
      expect(order.length <= 4).assertEqual(true);
      expect(order[order.length - 1]).assertEqual('k5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache002 done');
    });
}

function LruCacheWindowPart002() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2243
     * @tc.name    JsCache003
     * @tc.desc    LRU capacity 5 after 7 accesses keeps k0,k3 seed 3
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache003', 0, async function () {
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
      expect(order.join(',')).assertEqual('k0,k3');
      expect(order.length <= 5).assertEqual(true);
      expect(order[order.length - 1]).assertEqual('k3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache003 done');
    });
}

function LruCacheWindowPart003() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2244
     * @tc.name    JsCache004
     * @tc.desc    LRU capacity 6 after 8 accesses keeps k4,k1 seed 4
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache004', 0, async function () {
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
      expect(order.join(',')).assertEqual('k4,k1');
      expect(order.length <= 6).assertEqual(true);
      expect(order[order.length - 1]).assertEqual('k1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache004 done');
    });
}

function LruCacheWindowPart004() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2245
     * @tc.name    JsCache005
     * @tc.desc    LRU capacity 2 after 9 accesses keeps k2,k5 seed 5
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache005', 0, async function () {
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
      expect(order.join(',')).assertEqual('k2,k5');
      expect(order.length <= 2).assertEqual(true);
      expect(order[order.length - 1]).assertEqual('k5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache005 done');
    });
}

function LruCacheWindowPart005() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2246
     * @tc.name    JsCache006
     * @tc.desc    LRU capacity 3 after 10 accesses keeps k0,k3 seed 6
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache006', 0, async function () {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache006 done');
    });
}

function LruCacheWindowPart006() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2247
     * @tc.name    JsCache007
     * @tc.desc    LRU capacity 4 after 11 accesses keeps k4,k1 seed 7
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache007', 0, async function () {
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
      expect(model.lruAccess(order, 'k4', 4)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k1', 4)).assertEqual(true);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache007 done');
    });
}

function LruCacheWindowPart007() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2248
     * @tc.name    JsCache008
     * @tc.desc    LRU capacity 5 after 4 accesses keeps k2,k5 seed 8
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache008', 0, async function () {
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
      expect(order.join(',')).assertEqual('k2,k5');
      expect(order.length <= 5).assertEqual(true);
      expect(order[order.length - 1]).assertEqual('k5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache008 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2249
     * @tc.name    JsCache009
     * @tc.desc    LRU capacity 6 after 5 accesses keeps k0,k3 seed 9
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache009', 0, async function () {
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
      expect(order.join(',')).assertEqual('k0,k3');
      expect(order.length <= 6).assertEqual(true);
      expect(order[order.length - 1]).assertEqual('k3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache009 done');
    });
}

function LruCacheWindowPart008() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2250
     * @tc.name    JsCache010
     * @tc.desc    LRU capacity 2 after 6 accesses keeps k4,k1 seed 10
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache010', 0, async function () {
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
      expect(order.join(',')).assertEqual('k4,k1');
      expect(order.length <= 2).assertEqual(true);
      expect(order[order.length - 1]).assertEqual('k1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache010 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2251
     * @tc.name    JsCache011
     * @tc.desc    LRU capacity 3 after 7 accesses keeps k2,k5 seed 11
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache011', 0, async function () {
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
      expect(order.join(',')).assertEqual('k2,k5');
      expect(order.length <= 3).assertEqual(true);
      expect(order[order.length - 1]).assertEqual('k5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache011 done');
    });
}

function LruCacheWindowPart009() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2252
     * @tc.name    JsCache012
     * @tc.desc    LRU capacity 4 after 8 accesses keeps k0,k3 seed 12
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache012', 0, async function () {
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
      expect(order.join(',')).assertEqual('k0,k3');
      expect(order.length <= 4).assertEqual(true);
      expect(order[order.length - 1]).assertEqual('k3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache012 done');
    });
}

function LruCacheWindowPart010() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2253
     * @tc.name    JsCache013
     * @tc.desc    LRU capacity 5 after 9 accesses keeps k4,k1 seed 13
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache013', 0, async function () {
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
      expect(order.join(',')).assertEqual('k4,k1');
      expect(order.length <= 5).assertEqual(true);
      expect(order[order.length - 1]).assertEqual('k1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache013 done');
    });
}

function LruCacheWindowPart011() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2254
     * @tc.name    JsCache014
     * @tc.desc    LRU capacity 6 after 10 accesses keeps k2,k5 seed 14
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache014', 0, async function () {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache014 done');
    });
}

function LruCacheWindowPart012() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2255
     * @tc.name    JsCache015
     * @tc.desc    LRU capacity 2 after 11 accesses keeps k0,k3 seed 15
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache015', 0, async function () {
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
      expect(model.lruAccess(order, 'k0', 2)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k3', 2)).assertEqual(true);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache015 done');
    });
}

function LruCacheWindowPart013() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2256
     * @tc.name    JsCache016
     * @tc.desc    LRU capacity 3 after 4 accesses keeps k4,k1 seed 16
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache016', 0, async function () {
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
      expect(order.join(',')).assertEqual('k4,k1');
      expect(order.length <= 3).assertEqual(true);
      expect(order[order.length - 1]).assertEqual('k1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache016 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2257
     * @tc.name    JsCache017
     * @tc.desc    LRU capacity 4 after 5 accesses keeps k2,k5 seed 17
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache017', 0, async function () {
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
      expect(order.join(',')).assertEqual('k2,k5');
      expect(order.length <= 4).assertEqual(true);
      expect(order[order.length - 1]).assertEqual('k5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache017 done');
    });
}

function LruCacheWindowPart014() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2258
     * @tc.name    JsCache018
     * @tc.desc    LRU capacity 5 after 6 accesses keeps k0,k3 seed 18
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache018', 0, async function () {
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
      expect(order.join(',')).assertEqual('k0,k3');
      expect(order.length <= 5).assertEqual(true);
      expect(order[order.length - 1]).assertEqual('k3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache018 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2259
     * @tc.name    JsCache019
     * @tc.desc    LRU capacity 6 after 7 accesses keeps k4,k1 seed 19
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache019', 0, async function () {
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
      expect(order.join(',')).assertEqual('k4,k1');
      expect(order.length <= 6).assertEqual(true);
      expect(order[order.length - 1]).assertEqual('k1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache019 done');
    });
}

function LruCacheWindowPart015() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2260
     * @tc.name    JsCache020
     * @tc.desc    LRU capacity 2 after 8 accesses keeps k2,k5 seed 20
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache020', 0, async function () {
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
      expect(order.join(',')).assertEqual('k2,k5');
      expect(order.length <= 2).assertEqual(true);
      expect(order[order.length - 1]).assertEqual('k5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache020 done');
    });
}

function LruCacheWindowPart016() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2261
     * @tc.name    JsCache021
     * @tc.desc    LRU capacity 3 after 9 accesses keeps k0,k3 seed 21
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache021', 0, async function () {
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
      expect(order.join(',')).assertEqual('k0,k3');
      expect(order.length <= 3).assertEqual(true);
      expect(order[order.length - 1]).assertEqual('k3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache021 done');
    });
}

function LruCacheWindowPart017() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2262
     * @tc.name    JsCache022
     * @tc.desc    LRU capacity 4 after 10 accesses keeps k4,k1 seed 22
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache022', 0, async function () {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache022 done');
    });
}

function LruCacheWindowPart018() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2263
     * @tc.name    JsCache023
     * @tc.desc    LRU capacity 5 after 11 accesses keeps k2,k5 seed 23
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache023', 0, async function () {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache023 done');
    });
}

function LruCacheWindowPart019() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2264
     * @tc.name    JsCache024
     * @tc.desc    LRU capacity 6 after 4 accesses keeps k0,k3 seed 24
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache024', 0, async function () {
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
      expect(order.join(',')).assertEqual('k0,k3');
      expect(order.length <= 6).assertEqual(true);
      expect(order[order.length - 1]).assertEqual('k3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache024 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2265
     * @tc.name    JsCache025
     * @tc.desc    LRU capacity 2 after 5 accesses keeps k4,k1 seed 25
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache025', 0, async function () {
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
      expect(order.join(',')).assertEqual('k4,k1');
      expect(order.length <= 2).assertEqual(true);
      expect(order[order.length - 1]).assertEqual('k1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache025 done');
    });
}

function LruCacheWindowPart020() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2266
     * @tc.name    JsCache026
     * @tc.desc    LRU capacity 3 after 6 accesses keeps k2,k5 seed 26
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache026', 0, async function () {
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
      expect(order.join(',')).assertEqual('k2,k5');
      expect(order.length <= 3).assertEqual(true);
      expect(order[order.length - 1]).assertEqual('k5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache026 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2267
     * @tc.name    JsCache027
     * @tc.desc    LRU capacity 4 after 7 accesses keeps k0,k3 seed 27
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache027', 0, async function () {
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
      expect(order.join(',')).assertEqual('k0,k3');
      expect(order.length <= 4).assertEqual(true);
      expect(order[order.length - 1]).assertEqual('k3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache027 done');
    });
}

function LruCacheWindowPart021() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2268
     * @tc.name    JsCache028
     * @tc.desc    LRU capacity 5 after 8 accesses keeps k4,k1 seed 28
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache028', 0, async function () {
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
      expect(order.join(',')).assertEqual('k4,k1');
      expect(order.length <= 5).assertEqual(true);
      expect(order[order.length - 1]).assertEqual('k1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache028 done');
    });
}

function LruCacheWindowPart022() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2269
     * @tc.name    JsCache029
     * @tc.desc    LRU capacity 6 after 9 accesses keeps k2,k5 seed 29
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache029', 0, async function () {
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
      expect(order.join(',')).assertEqual('k2,k5');
      expect(order.length <= 6).assertEqual(true);
      expect(order[order.length - 1]).assertEqual('k5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache029 done');
    });
}

function LruCacheWindowPart023() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2270
     * @tc.name    JsCache030
     * @tc.desc    LRU capacity 2 after 10 accesses keeps k0,k3 seed 30
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache030', 0, async function () {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache030 done');
    });
}

function LruCacheWindowPart024() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2271
     * @tc.name    JsCache031
     * @tc.desc    LRU capacity 3 after 11 accesses keeps k4,k1 seed 31
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache031', 0, async function () {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache031 done');
    });
}

function LruCacheWindowPart025() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2272
     * @tc.name    JsCache032
     * @tc.desc    LRU capacity 4 after 4 accesses keeps k2,k5 seed 32
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache032', 0, async function () {
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
      expect(order.join(',')).assertEqual('k2,k5');
      expect(order.length <= 4).assertEqual(true);
      expect(order[order.length - 1]).assertEqual('k5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache032 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2273
     * @tc.name    JsCache033
     * @tc.desc    LRU capacity 5 after 5 accesses keeps k0,k3 seed 33
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache033', 0, async function () {
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
      expect(order.join(',')).assertEqual('k0,k3');
      expect(order.length <= 5).assertEqual(true);
      expect(order[order.length - 1]).assertEqual('k3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache033 done');
    });
}

function LruCacheWindowPart026() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2274
     * @tc.name    JsCache034
     * @tc.desc    LRU capacity 6 after 6 accesses keeps k4,k1 seed 34
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache034', 0, async function () {
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
      expect(order.join(',')).assertEqual('k4,k1');
      expect(order.length <= 6).assertEqual(true);
      expect(order[order.length - 1]).assertEqual('k1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache034 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2275
     * @tc.name    JsCache035
     * @tc.desc    LRU capacity 2 after 7 accesses keeps k2,k5 seed 35
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache035', 0, async function () {
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
      expect(order.join(',')).assertEqual('k2,k5');
      expect(order.length <= 2).assertEqual(true);
      expect(order[order.length - 1]).assertEqual('k5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache035 done');
    });
}

function LruCacheWindowPart027() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2276
     * @tc.name    JsCache036
     * @tc.desc    LRU capacity 3 after 8 accesses keeps k0,k3 seed 36
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache036', 0, async function () {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache036 done');
    });
}

function LruCacheWindowPart028() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2277
     * @tc.name    JsCache037
     * @tc.desc    LRU capacity 4 after 9 accesses keeps k4,k1 seed 37
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache037', 0, async function () {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache037 done');
    });
}

function LruCacheWindowPart029() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2278
     * @tc.name    JsCache038
     * @tc.desc    LRU capacity 5 after 10 accesses keeps k2,k5 seed 38
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache038', 0, async function () {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache038 done');
    });
}

function LruCacheWindowPart030() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2279
     * @tc.name    JsCache039
     * @tc.desc    LRU capacity 6 after 11 accesses keeps k0,k3 seed 39
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache039', 0, async function () {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache039 done');
    });
}

function LruCacheWindowPart031() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2280
     * @tc.name    JsCache040
     * @tc.desc    LRU capacity 2 after 4 accesses keeps k4,k1 seed 40
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache040', 0, async function () {
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
      expect(order.join(',')).assertEqual('k4,k1');
      expect(order.length <= 2).assertEqual(true);
      expect(order[order.length - 1]).assertEqual('k1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache040 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2281
     * @tc.name    JsCache041
     * @tc.desc    LRU capacity 3 after 5 accesses keeps k2,k5 seed 41
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache041', 0, async function () {
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
      expect(order.join(',')).assertEqual('k2,k5');
      expect(order.length <= 3).assertEqual(true);
      expect(order[order.length - 1]).assertEqual('k5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache041 done');
    });
}

function LruCacheWindowPart032() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2282
     * @tc.name    JsCache042
     * @tc.desc    LRU capacity 4 after 6 accesses keeps k0,k3 seed 42
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache042', 0, async function () {
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
      expect(order.join(',')).assertEqual('k0,k3');
      expect(order.length <= 4).assertEqual(true);
      expect(order[order.length - 1]).assertEqual('k3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache042 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2283
     * @tc.name    JsCache043
     * @tc.desc    LRU capacity 5 after 7 accesses keeps k4,k1 seed 43
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache043', 0, async function () {
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
      expect(order.join(',')).assertEqual('k4,k1');
      expect(order.length <= 5).assertEqual(true);
      expect(order[order.length - 1]).assertEqual('k1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache043 done');
    });
}

function LruCacheWindowPart033() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2284
     * @tc.name    JsCache044
     * @tc.desc    LRU capacity 6 after 8 accesses keeps k2,k5 seed 44
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache044', 0, async function () {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache044 done');
    });
}

function LruCacheWindowPart034() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2285
     * @tc.name    JsCache045
     * @tc.desc    LRU capacity 2 after 9 accesses keeps k0,k3 seed 45
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache045', 0, async function () {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache045 done');
    });
}

function LruCacheWindowPart035() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2286
     * @tc.name    JsCache046
     * @tc.desc    LRU capacity 3 after 10 accesses keeps k4,k1 seed 46
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsCache046', 0, async function () {
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
      expect(model.lruAccess(order, 'k4', 3)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(model.lruAccess(order, 'k1', 3)).assertEqual(true);
      expect(order.length).assertEqual(2);
      expect(order.join(',')).assertEqual('k4,k1');
      expect(order.length <= 3).assertEqual(true);
      expect(order[order.length - 1]).assertEqual('k1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsCache046 done');
    });
}

export default function lruCacheWindowSuite() {
  describe('LruCacheWindowSuite', function () {
    LruCacheWindowPart001();
    LruCacheWindowPart002();
    LruCacheWindowPart003();
    LruCacheWindowPart004();
    LruCacheWindowPart005();
    LruCacheWindowPart006();
    LruCacheWindowPart007();
    LruCacheWindowPart008();
    LruCacheWindowPart009();
    LruCacheWindowPart010();
    LruCacheWindowPart011();
    LruCacheWindowPart012();
    LruCacheWindowPart013();
    LruCacheWindowPart014();
    LruCacheWindowPart015();
    LruCacheWindowPart016();
    LruCacheWindowPart017();
    LruCacheWindowPart018();
    LruCacheWindowPart019();
    LruCacheWindowPart020();
    LruCacheWindowPart021();
    LruCacheWindowPart022();
    LruCacheWindowPart023();
    LruCacheWindowPart024();
    LruCacheWindowPart025();
    LruCacheWindowPart026();
    LruCacheWindowPart027();
    LruCacheWindowPart028();
    LruCacheWindowPart029();
    LruCacheWindowPart030();
    LruCacheWindowPart031();
    LruCacheWindowPart032();
    LruCacheWindowPart033();
    LruCacheWindowPart034();
    LruCacheWindowPart035();
  });
}
