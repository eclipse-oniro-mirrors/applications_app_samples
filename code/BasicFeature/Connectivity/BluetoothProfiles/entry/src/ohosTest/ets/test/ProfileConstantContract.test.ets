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

/**
 * 工程常量契约。
 *
 * 这些字面量同时被页面、组件、纯逻辑和测试引用，改动会影响多处，
 * 因此逐个锁定取值，并对「容量上限递减」「路由只认 hfp」这类关系再断言一次。
 */

import { beforeEachIt, describe, expect, it } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import {
  BLUETOOTH_PERMISSION,
  HILOG_DOMAIN,
  HILOG_TAG,
  HOME_LOG_LIMIT,
  LOG_STORE_CAPACITY,
  PAGE_LOG_LIMIT,
  PROFILE_COUNT,
  RouteKey,
  StorageKeys,
  appSubtitle,
  defaultNavTitle,
  isRouteKey
} from '../../../main/ets/common/AppConstants';

export default function bluetoothProfileConstantContractTest() {
  describe('BluetoothProfileConstantContractTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number SUB_BLUETOOTH_CONSTANT_0001
     * @tc.name constantContract0001
     * @tc.desc Verify the three AppStorage keys stay stable because pages read them by name.
     */
    it('constantContract0001', 0, () => {
      expect(StorageKeys.APP_LOGS).assertEqual('appLogs');
      expect(StorageKeys.LAYOUT_PROFILE).assertEqual('layoutProfile');
      expect(StorageKeys.BLUETOOTH_STATE).assertEqual('bluetoothState');
      expect(StorageKeys.APP_LOGS === StorageKeys.LAYOUT_PROFILE).assertFalse();
      expect(StorageKeys.LAYOUT_PROFILE === StorageKeys.BLUETOOTH_STATE).assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_CONSTANT_0002
     * @tc.name constantContract0002
     * @tc.desc Verify the route key only accepts the single remaining hfp value.
     */
    it('constantContract0002', 0, () => {
      expect(RouteKey.HFP).assertEqual('hfp');
      expect(isRouteKey('hfp')).assertTrue();
      expect(isRouteKey('pan')).assertFalse();
      expect(isRouteKey('map')).assertFalse();
      expect(isRouteKey('HFP')).assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_CONSTANT_0003
     * @tc.name constantContract0003
     * @tc.desc Verify the demo surface advertises exactly one profile in the subtitle and the counter.
     */
    it('constantContract0003', 0, () => {
      expect(PROFILE_COUNT).assertEqual(1);
      expect(appSubtitle().indexOf('AG') >= 0).assertTrue();
      expect(appSubtitle().indexOf('HFP') >= 0).assertTrue();
      expect(defaultNavTitle()).assertEqual('蓝牙 Profile 示例');
    });

    /**
     * @tc.number SUB_BLUETOOTH_CONSTANT_0004
     * @tc.name constantContract0004
     * @tc.desc Verify the log capacity limits are ordered page before home.
     */
    it('constantContract0004', 0, () => {
      expect(LOG_STORE_CAPACITY).assertEqual(200);
      expect(PAGE_LOG_LIMIT).assertEqual(20);
      expect(HOME_LOG_LIMIT).assertEqual(30);
      expect(HOME_LOG_LIMIT > PAGE_LOG_LIMIT).assertTrue();
      expect(LOG_STORE_CAPACITY > HOME_LOG_LIMIT).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_CONSTANT_0005
     * @tc.name constantContract0005
     * @tc.desc Verify the hilog parameters are stable for filtering by tag.
     */
    it('constantContract0005', 0, () => {
      expect(HILOG_DOMAIN).assertEqual(0xF811);
      expect(HILOG_TAG).assertEqual('BluetoothProfiles');
      expect(HILOG_DOMAIN > 0).assertTrue();
      expect(HILOG_TAG.length).assertEqual(17);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CONSTANT_0006
     * @tc.name constantContract0006
     * @tc.desc Verify the permission name matches the one declared in module.json5.
     */
    it('constantContract0006', 0, () => {
      expect(BLUETOOTH_PERMISSION).assertEqual('ohos.permission.ACCESS_BLUETOOTH');
      expect(BLUETOOTH_PERMISSION.indexOf('ohos.permission.') === 0).assertTrue();
      expect(BLUETOOTH_PERMISSION.indexOf('BLUETOOTH') >= 0).assertTrue();
    });
  });
}
