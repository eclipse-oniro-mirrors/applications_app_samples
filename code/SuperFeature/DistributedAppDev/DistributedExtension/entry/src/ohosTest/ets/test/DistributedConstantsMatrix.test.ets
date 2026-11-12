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

import { beforeEachIt, describe, expect, it } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import {
  APP_COLLABORATION_SYSCAP, BLUETOOTH_PERMISSION, BT_PEER_LIMIT, CHANNEL_API_PAYLOAD_LIMIT, CHANNEL_PAYLOAD_LIMIT,
  DATASYNC_PERMISSION, DEFAULT_CONNECTION_NAME, DEFAULT_PEER_ADDRESS, DEFAULT_PEER_UUID, DEFAULT_SERVER_NAME,
  EXTENSION_TYPE_DISTRIBUTED, FEATURE_COUNT, HILOG_DOMAIN, HILOG_TAG, HOME_LOG_LIMIT, LINK_PAYLOAD_LIMIT,
  LOG_STORE_CAPACITY, PAGE_LOG_LIMIT, RouteKey, StorageKeys, appSubtitle, defaultNavTitle, isRouteKey
} from '../../../main/ets/common/AppConstants';
import { isMacAddress, isServiceUuid } from '../../../main/ets/model/ChannelSession';
import { utf8Length } from '../../../main/ets/model/TextCodec';

/**
 * 工程级常量：页面、纯逻辑与测试同时引用这批字面量。
 * 这里不仅锁定取值，还验证常量之间的约束关系（上限递增、路由守卫、默认对端参数能通过校验器），
 * 因为单个常量改错往往表现为"两个模块对不上"而不是编译错误。
 */
export default function distributedConstantsMatrixTest() {
  describe('DistributedConstantsMatrixTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CONST_0100
     * @tc.name testConst0001
     * @tc.desc Verify the AppStorage key used by the log panel is stable.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConst0001', 0, () => {
      expect(StorageKeys.APP_LOGS).assertEqual('appLogs');
      expect(StorageKeys.APP_LOGS.length).assertEqual(7);
      expect(StorageKeys.APP_LOGS === 'appLog').assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CONST_0200
     * @tc.name testConst0002
     * @tc.desc Verify the three route keys and the guard that validates them.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConst0002', 0, () => {
      expect(RouteKey.EXTENSION).assertEqual('extension');
      expect(RouteKey.LINK).assertEqual('link');
      expect(RouteKey.CHANNEL).assertEqual('channel');
      expect(isRouteKey('extension')).assertTrue();
      expect(isRouteKey('link')).assertTrue();
      expect(isRouteKey('channel')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CONST_0300
     * @tc.name testConst0003
     * @tc.desc Verify the guard rejects anything that is not one of the three route keys.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConst0003', 0, () => {
      expect(isRouteKey('')).assertFalse();
      expect(isRouteKey('Extension')).assertFalse();
      expect(isRouteKey('link ')).assertFalse();
      expect(isRouteKey('extension,link')).assertFalse();
      expect(isRouteKey('demo')).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CONST_0400
     * @tc.name testConst0004
     * @tc.desc Verify the navigation title and subtitle describe all three features.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConst0004', 0, () => {
      expect(defaultNavTitle()).assertEqual('分布式扩展与链路示例');
      expect(FEATURE_COUNT).assertEqual(3);
      expect(appSubtitle().includes('Extension')).assertTrue();
      expect(appSubtitle().includes('链路增强')).assertTrue();
      expect(appSubtitle().includes('代理通道')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CONST_0500
     * @tc.name testConst0005
     * @tc.desc Verify the log limits stay ordered so a page never shows more than the store keeps.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConst0005', 0, () => {
      expect(LOG_STORE_CAPACITY).assertEqual(200);
      expect(PAGE_LOG_LIMIT).assertEqual(20);
      expect(HOME_LOG_LIMIT).assertEqual(30);
      expect(PAGE_LOG_LIMIT < HOME_LOG_LIMIT).assertTrue();
      expect(HOME_LOG_LIMIT <= LOG_STORE_CAPACITY).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CONST_0600
     * @tc.name testConst0006
     * @tc.desc Verify the hilog domain and tag allow grepping a single application line.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConst0006', 0, () => {
      expect(HILOG_DOMAIN).assertEqual(0xF811);
      expect(HILOG_DOMAIN).assertEqual(63505);
      expect(HILOG_TAG).assertEqual('DistributedExtension');
      expect(HILOG_TAG.length > 8).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CONST_0700
     * @tc.name testConst0007
     * @tc.desc Verify the two permission names match the ones declared in module.json5.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConst0007', 0, () => {
      expect(DATASYNC_PERMISSION).assertEqual('ohos.permission.DISTRIBUTED_DATASYNC');
      expect(BLUETOOTH_PERMISSION).assertEqual('ohos.permission.ACCESS_BLUETOOTH');
      expect(DATASYNC_PERMISSION.startsWith('ohos.permission.')).assertTrue();
      expect(BLUETOOTH_PERMISSION.startsWith('ohos.permission.')).assertTrue();
      expect(DATASYNC_PERMISSION === BLUETOOTH_PERMISSION).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CONST_0800
     * @tc.name testConst0008
     * @tc.desc Verify the default server and connection names let the two ends interoperate.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConst0008', 0, () => {
      expect(DEFAULT_SERVER_NAME).assertEqual(DEFAULT_CONNECTION_NAME);
      expect(DEFAULT_SERVER_NAME).assertEqual('sample_link_server');
      expect(DEFAULT_SERVER_NAME.trim().length > 0).assertTrue();
      expect(utf8Length(DEFAULT_SERVER_NAME) <= 255).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CONST_0900
     * @tc.name testConst0009
     * @tc.desc Verify the default peer address and uuid pass the channel parameter validators.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConst0009', 0, () => {
      expect(isMacAddress(DEFAULT_PEER_ADDRESS)).assertTrue();
      expect(isServiceUuid(DEFAULT_PEER_UUID)).assertTrue();
      expect(DEFAULT_PEER_ADDRESS).assertEqual('12:34:56:78:9A:BC');
      expect(DEFAULT_PEER_UUID).assertEqual('0000A002-0000-1000-8000-00805F9B34FB');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CONST_1000
     * @tc.name testConst0010
     * @tc.desc Verify the payload limits keep the demo limit below the interface limit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConst0010', 0, () => {
      expect(LINK_PAYLOAD_LIMIT).assertEqual(1024);
      expect(CHANNEL_API_PAYLOAD_LIMIT).assertEqual(4096);
      expect(CHANNEL_PAYLOAD_LIMIT).assertEqual(256);
      expect(CHANNEL_PAYLOAD_LIMIT < CHANNEL_API_PAYLOAD_LIMIT).assertTrue();
      expect(CHANNEL_PAYLOAD_LIMIT < LINK_PAYLOAD_LIMIT).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CONST_1100
     * @tc.name testConst0011
     * @tc.desc Verify the two interface limits match the values stated by the SDK documentation.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testConst0011', 0, () => {
      // d.ts：linkEnhance 单次 1024 字节，proxyChannelManager 单次 4096 字节
      expect(LINK_PAYLOAD_LIMIT).assertEqual(1024);
      expect(CHANNEL_API_PAYLOAD_LIMIT).assertEqual(4096);
      expect(CHANNEL_API_PAYLOAD_LIMIT === LINK_PAYLOAD_LIMIT * 4).assertTrue();
      expect(CHANNEL_API_PAYLOAD_LIMIT / LINK_PAYLOAD_LIMIT).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CONST_1200
     * @tc.name testConst0012
     * @tc.desc Verify the peer candidate cap stays small enough for one screen.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testConst0012', 0, () => {
      expect(BT_PEER_LIMIT).assertEqual(8);
      expect(BT_PEER_LIMIT > 0).assertTrue();
      expect(BT_PEER_LIMIT < PAGE_LOG_LIMIT).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CONST_1300
     * @tc.name testConst0013
     * @tc.desc Verify the distributed extension type value matches bundleManager.ExtensionAbilityType.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConst0013', 0, () => {
      expect(EXTENSION_TYPE_DISTRIBUTED).assertEqual(28);
      expect(EXTENSION_TYPE_DISTRIBUTED > 0).assertTrue();
      expect(EXTENSION_TYPE_DISTRIBUTED === 27).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CONST_1400
     * @tc.name testConst0014
     * @tc.desc Verify the shared syscap string is the documented AppCollaboration capability.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConst0014', 0, () => {
      expect(APP_COLLABORATION_SYSCAP).assertEqual('SystemCapability.DistributedSched.AppCollaboration');
      expect(APP_COLLABORATION_SYSCAP.startsWith('SystemCapability.')).assertTrue();
      expect(APP_COLLABORATION_SYSCAP.endsWith('AppCollaboration')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CONST_1500
     * @tc.name testConst0015
     * @tc.desc Verify the permission names survive the prefix stripping used by the panel text.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testConst0015', 0, () => {
      const short = DATASYNC_PERMISSION.replace('ohos.permission.', '');
      expect(short).assertEqual('DISTRIBUTED_DATASYNC');
      expect(short.includes('.')).assertFalse();
      expect(BLUETOOTH_PERMISSION.replace('ohos.permission.', '')).assertEqual('ACCESS_BLUETOOTH');
      expect(short.length < DATASYNC_PERMISSION.length).assertTrue();
    });
  });
}
