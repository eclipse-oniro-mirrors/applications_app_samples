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
import {
  ChannelAction, ChannelStage, isMacAddress, isServiceUuid, nextChannelStage
} from '../../../main/ets/model/ChannelSession';
import { COLLABORATE_ACCEPT, COLLABORATE_REJECT } from '../../../main/ets/model/ProbeState';
import {
  FEATURE_METAS, FeatureKind, entryText, isFeatureKind, metaOf, noteText, permissionText, summaryText, titleText
} from '../../../main/ets/model/DistributedCatalog';
import { contextSnapshot } from '../../../main/ets/model/ExtensionContextInfo';
import { LinkAction, LinkStage } from '../../../main/ets/model/LinkSession';
import { LogLevel, logLevelName } from '../../../main/ets/model/LogStore';
import {
  CHANNEL_STATE_BR_NO_PAIRED, CHANNEL_STATE_RESUME, CHANNEL_STATE_SOFTWARE_FAILED, CHANNEL_STATE_WAIT_RESUME,
  LINK_TYPE_BR, ProbeStatus, channelStateName, collaborateResultName, isChannelUsable
} from '../../../main/ets/model/ProbeState';
import { encodeUtf8, utf8Length } from '../../../main/ets/model/TextCodec';
import { distributedErrorHint } from '../../../main/ets/utils/ErrorUtil';
import { formatDateTime, formatDuration, formatTime } from '../../../main/ets/utils/FormatUtil';

const MULTILINGUAL: string[] = ['日本語', '한국어', 'Привет', 'مرحبا', 'e\u0301'];
const MULTILINGUAL_BYTES: number[] = [9, 9, 12, 10, 3];

const PROBE_VALUES: number[] = [
  ProbeStatus.IDLE, ProbeStatus.READY, ProbeStatus.PERMISSION_DENIED, ProbeStatus.CAPABILITY_UNSUPPORTED,
  ProbeStatus.UNPAIRED, ProbeStatus.BR_DISABLED, ProbeStatus.DUPLICATE_NAME, ProbeStatus.LIMIT_EXCEEDED,
  ProbeStatus.NOT_READY, ProbeStatus.INVALID_PARAM, ProbeStatus.CHANNEL_INVALID, ProbeStatus.RESTRICTED,
  ProbeStatus.DATA_TOO_LONG, ProbeStatus.SEND_FAILED, ProbeStatus.INTERNAL, ProbeStatus.FAILED
];

function isAscendingFromZero(values: number[]): boolean {
  for (let i = 0; i < values.length; i++) {
    if (values[i] !== i) {
      return false;
    }
  }
  return true;
}

function countOccurrences(text: string, part: string): number {
  return text.split(part).length - 1;
}

/**
 * 常量与兼容（质量轴）：枚举数值、路由 key、权限名、接口上限、多语言字节数。
 * 这些值一旦被改动，页面、权限申请与两个系统接口的入参就会静默错位，所以逐项钉死。
 */
export default function distributedCompatMatrixTest() {
  describe('DistributedCompatMatrixTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COMPAT_0100
     * @tc.name testCompat0001
     * @tc.desc Verify the route keys and the catalogue kinds carry identical string values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompat0001', 0, () => {
      expect(RouteKey.EXTENSION).assertEqual(FeatureKind.EXTENSION);
      expect(RouteKey.LINK).assertEqual(FeatureKind.LINK);
      expect(RouteKey.CHANNEL).assertEqual(FeatureKind.CHANNEL);
      expect(RouteKey.EXTENSION).assertEqual('extension');
      expect(FEATURE_METAS.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COMPAT_0200
     * @tc.name testCompat0002
     * @tc.desc Verify the route key guard accepts exactly the three documented values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompat0002', 0, () => {
      expect(isRouteKey('extension')).assertTrue();
      expect(isRouteKey('link')).assertTrue();
      expect(isRouteKey('channel')).assertTrue();
      expect(isRouteKey('Extension')).assertFalse();
      expect(isRouteKey('link2')).assertFalse();
      expect(isRouteKey('')).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COMPAT_0300
     * @tc.name testCompat0003
     * @tc.desc Verify the feature kind guard accepts exactly the three documented values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompat0003', 0, () => {
      expect(isFeatureKind('extension')).assertTrue();
      expect(isFeatureKind('link')).assertTrue();
      expect(isFeatureKind('channel')).assertTrue();
      expect(isFeatureKind('ext')).assertFalse();
      expect(isFeatureKind('')).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COMPAT_0400
     * @tc.name testCompat0004
     * @tc.desc Verify each catalogue entry reports its own kind and a distinct three or four letter code.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompat0004', 0, () => {
      expect(FEATURE_METAS[0].kind).assertEqual(FeatureKind.EXTENSION);
      expect(FEATURE_METAS[1].kind).assertEqual(FeatureKind.LINK);
      expect(FEATURE_METAS[2].kind).assertEqual(FeatureKind.CHANNEL);
      expect(FEATURE_METAS[0].code).assertEqual('EXT');
      expect(FEATURE_METAS[1].code).assertEqual('LINK');
      expect(FEATURE_METAS[2].code).assertEqual('CHAN');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COMPAT_0500
     * @tc.name testCompat0005
     * @tc.desc Verify the three catalogue titles are four or five characters long and all different.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompat0005', 0, () => {
      expect(titleText(metaOf(FeatureKind.EXTENSION))).assertEqual('分布式扩展');
      expect(titleText(metaOf(FeatureKind.LINK))).assertEqual('链路增强');
      expect(titleText(metaOf(FeatureKind.CHANNEL))).assertEqual('代理通道');
      expect(titleText(metaOf(FeatureKind.EXTENSION)).length).assertEqual(5);
      expect(titleText(metaOf(FeatureKind.LINK)).length).assertEqual(4);
      expect(titleText(metaOf(FeatureKind.LINK)) === titleText(metaOf(FeatureKind.CHANNEL))).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COMPAT_0600
     * @tc.name testCompat0006
     * @tc.desc Verify every catalogue entry points at a markdown page under the js-apis prefix.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompat0006', 0, () => {
      let matched = 0;
      for (const meta of FEATURE_METAS) {
        matched += meta.docPage.startsWith('js-apis-') && meta.docPage.endsWith('.md') ? 1 : 0;
      }
      expect(matched).assertEqual(3);
      expect(FEATURE_METAS[0].docPage).assertEqual('js-apis-distributedExtensionAbility.md');
      expect(FEATURE_METAS[1].docPage).assertEqual('js-apis-link-enhance.md');
      expect(FEATURE_METAS[2].docPage).assertEqual('js-apis-proxyChannelManager.md');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COMPAT_0700
     * @tc.name testCompat0007
     * @tc.desc Verify the entry functions match the three sample pages.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompat0007', 0, () => {
      expect(entryText(metaOf(FeatureKind.EXTENSION))).assertEqual('module.json5 中声明 type 为 distributed 的扩展');
      expect(metaOf(FeatureKind.LINK).entryFunction).assertEqual('linkEnhance.createServer() / createConnection()');
      expect(metaOf(FeatureKind.CHANNEL).entryFunction).assertEqual('proxyChannelManager.openProxyChannel()');
      expect(entryText(metaOf(FeatureKind.EXTENSION)).includes('distributed')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COMPAT_0800
     * @tc.name testCompat0008
     * @tc.desc Verify the api names are the three documented module paths.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompat0008', 0, () => {
      expect(metaOf(FeatureKind.EXTENSION).apiName)
        .assertEqual('@ohos.application.DistributedExtensionAbility / DistributedExtensionContext');
      expect(metaOf(FeatureKind.LINK).apiName).assertEqual('@ohos.distributedsched.linkEnhance');
      expect(metaOf(FeatureKind.CHANNEL).apiName).assertEqual('@ohos.distributedsched.proxyChannelManager');
      expect(metaOf(FeatureKind.LINK).apiName.includes('distributedsched')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COMPAT_0900
     * @tc.name testCompat0009
     * @tc.desc Verify the interface names match the objects each page drives.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompat0009', 0, () => {
      expect(metaOf(FeatureKind.EXTENSION).interfaceName).assertEqual('DistributedExtensionAbility');
      expect(metaOf(FeatureKind.LINK).interfaceName).assertEqual('linkEnhance.Server / linkEnhance.Connection');
      expect(metaOf(FeatureKind.CHANNEL).interfaceName).assertEqual('proxyChannelManager');
      expect(metaOf(FeatureKind.CHANNEL).interfaceName.length).assertEqual(19);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COMPAT_1000
     * @tc.name testCompat0010
     * @tc.desc Verify the permissions named in the catalogue equal the two request constants.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompat0010', 0, () => {
      expect(metaOf(FeatureKind.LINK).permission).assertEqual(DATASYNC_PERMISSION);
      expect(metaOf(FeatureKind.CHANNEL).permission).assertEqual(BLUETOOTH_PERMISSION);
      expect(DATASYNC_PERMISSION).assertEqual('ohos.permission.DISTRIBUTED_DATASYNC');
      expect(BLUETOOTH_PERMISSION).assertEqual('ohos.permission.ACCESS_BLUETOOTH');
      expect(permissionText(metaOf(FeatureKind.EXTENSION)).startsWith('无')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COMPAT_1100
     * @tc.name testCompat0011
     * @tc.desc Verify every summary and note is a finished sentence long enough to be shown.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompat0011', 0, () => {
      let finished = 0;
      for (const meta of FEATURE_METAS) {
        finished += summaryText(meta).endsWith('。') && noteText(meta).endsWith('。') ? 1 : 0;
      }
      expect(finished).assertEqual(3);
      expect(summaryText(FEATURE_METAS[1]).length > 30).assertTrue();
      expect(noteText(FEATURE_METAS[2]).length > 30).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COMPAT_1200
     * @tc.name testCompat0012
     * @tc.desc Verify only the distributed extension type maps to the distributed label.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompat0012', 0, () => {
      expect(contextSnapshot('DistributedExtAbility', EXTENSION_TYPE_DISTRIBUTED, 'entry', 'zh').typeName())
        .assertEqual('28（distributed）');
      expect(contextSnapshot('DistributedExtAbility', 27, 'entry', 'zh').typeName()).assertEqual('27（非 distributed）');
      expect(contextSnapshot('DistributedExtAbility', 29, 'entry', 'zh').typeName()).assertEqual('29（非 distributed）');
      expect(EXTENSION_TYPE_DISTRIBUTED).assertEqual(28);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COMPAT_1300
     * @tc.name testCompat0013
     * @tc.desc Verify the documented syscap string appears in the unsupported capability hint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompat0013', 0, () => {
      expect(APP_COLLABORATION_SYSCAP).assertEqual('SystemCapability.DistributedSched.AppCollaboration');
      expect(distributedErrorHint(801).includes(APP_COLLABORATION_SYSCAP)).assertTrue();
      expect(distributedErrorHint(201).includes('DISTRIBUTED_DATASYNC')).assertTrue();
      expect(distributedErrorHint(201).includes('ACCESS_BLUETOOTH')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COMPAT_1400
     * @tc.name testCompat0014
     * @tc.desc Verify the hilog domain, tag and storage key keep their documented literals.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompat0014', 0, () => {
      expect(HILOG_DOMAIN).assertEqual(0xF811);
      expect(HILOG_DOMAIN).assertEqual(63505);
      expect(HILOG_TAG).assertEqual('DistributedExtension');
      expect(StorageKeys.APP_LOGS).assertEqual('appLogs');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COMPAT_1500
     * @tc.name testCompat0015
     * @tc.desc Verify the two link ends share one server name constant.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompat0015', 0, () => {
      expect(DEFAULT_SERVER_NAME).assertEqual(DEFAULT_CONNECTION_NAME);
      expect(DEFAULT_SERVER_NAME).assertEqual('sample_link_server');
      expect(DEFAULT_SERVER_NAME.length).assertEqual(18);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COMPAT_1600
     * @tc.name testCompat0016
     * @tc.desc Verify the default peer parameters pass the local MAC and UUID guards.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompat0016', 0, () => {
      expect(isMacAddress(DEFAULT_PEER_ADDRESS)).assertTrue();
      expect(isServiceUuid(DEFAULT_PEER_UUID)).assertTrue();
      expect(DEFAULT_PEER_ADDRESS.length).assertEqual(17);
      expect(DEFAULT_PEER_UUID.length).assertEqual(36);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COMPAT_1700
     * @tc.name testCompat0017
     * @tc.desc Verify the three payload limits keep the documented values and order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompat0017', 0, () => {
      expect(CHANNEL_PAYLOAD_LIMIT).assertEqual(256);
      expect(LINK_PAYLOAD_LIMIT).assertEqual(1024);
      expect(CHANNEL_API_PAYLOAD_LIMIT).assertEqual(4096);
      expect(CHANNEL_PAYLOAD_LIMIT < LINK_PAYLOAD_LIMIT).assertTrue();
      expect(LINK_PAYLOAD_LIMIT < CHANNEL_API_PAYLOAD_LIMIT).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COMPAT_1800
     * @tc.name testCompat0018
     * @tc.desc Verify the log limits keep the page, home and store order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompat0018', 0, () => {
      expect(PAGE_LOG_LIMIT).assertEqual(20);
      expect(HOME_LOG_LIMIT).assertEqual(30);
      expect(LOG_STORE_CAPACITY).assertEqual(200);
      expect(PAGE_LOG_LIMIT < HOME_LOG_LIMIT).assertTrue();
      expect(HOME_LOG_LIMIT < LOG_STORE_CAPACITY).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COMPAT_1900
     * @tc.name testCompat0019
     * @tc.desc Verify the peer limit and the feature count match the catalogue size.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompat0019', 0, () => {
      expect(BT_PEER_LIMIT).assertEqual(8);
      expect(FEATURE_COUNT).assertEqual(3);
      expect(FEATURE_METAS.length).assertEqual(FEATURE_COUNT);
      expect(BT_PEER_LIMIT > FEATURE_COUNT).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COMPAT_2000
     * @tc.name testCompat0020
     * @tc.desc Verify the encoder agrees with the documented byte count of five scripts.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompat0020', 0, () => {
      const actual: number[] = [];
      for (const text of MULTILINGUAL) {
        actual.push(utf8Length(text));
        actual.push(encodeUtf8(text).byteLength);
      }
      expect(actual[0]).assertEqual(MULTILINGUAL_BYTES[0]);
      expect(actual[2]).assertEqual(MULTILINGUAL_BYTES[1]);
      expect(actual[4]).assertEqual(MULTILINGUAL_BYTES[2]);
      expect(actual[6]).assertEqual(MULTILINGUAL_BYTES[3]);
      expect(actual[8]).assertEqual(MULTILINGUAL_BYTES[4]);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COMPAT_2100
     * @tc.name testCompat0021
     * @tc.desc Verify the unknown placeholder is five characters and fifteen bytes wide.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompat0021', 0, () => {
      const described = contextSnapshot('', 28, '', '').describe();
      expect(countOccurrences(described, '（未提供）')).assertEqual(3);
      expect('（未提供）'.length).assertEqual(5);
      expect(utf8Length('（未提供）')).assertEqual(15);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COMPAT_2200
     * @tc.name testCompat0022
     * @tc.desc Verify date time formatting on the year, leap day and single digit boundaries.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompat0022', 0, () => {
      expect(formatDateTime(new Date(2026, 11, 31, 23, 59, 59))).assertEqual('2026-12-31 23:59:59');
      expect(formatDateTime(new Date(2028, 1, 29, 0, 0, 0))).assertEqual('2028-02-29 00:00:00');
      expect(formatDateTime(new Date(2027, 0, 5, 9, 5, 4))).assertEqual('2027-01-05 09:05:04');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COMPAT_2300
     * @tc.name testCompat0023
     * @tc.desc Verify the time formatter pads every field to two digits.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompat0023', 0, () => {
      expect(formatTime(new Date(2027, 0, 5, 0, 0, 0))).assertEqual('00:00:00');
      expect(formatTime(new Date(2027, 0, 5, 9, 5, 4))).assertEqual('09:05:04');
      expect(formatTime(new Date(2027, 0, 5, 23, 59, 59))).assertEqual('23:59:59');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COMPAT_2400
     * @tc.name testCompat0024
     * @tc.desc Verify the duration formatter keeps its four branches at the documented boundaries.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompat0024', 0, () => {
      expect(formatDuration(0)).assertEqual('0 ms');
      expect(formatDuration(1000)).assertEqual('1.0 s');
      expect(formatDuration(60000)).assertEqual('1 min 0 s');
      expect(formatDuration(3599999)).assertEqual('59 min 59 s');
      expect(formatDuration(-1)).assertEqual('0 ms');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COMPAT_2500
     * @tc.name testCompat0025
     * @tc.desc Verify the sixteen probe statuses keep the values zero to fifteen in order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompat0025', 0, () => {
      expect(PROBE_VALUES.length).assertEqual(16);
      expect(isAscendingFromZero(PROBE_VALUES)).assertTrue();
      expect(PROBE_VALUES[0]).assertEqual(0);
      expect(PROBE_VALUES[15]).assertEqual(15);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COMPAT_2600
     * @tc.name testCompat0026
     * @tc.desc Verify the link and channel stage and action values stay consecutive from zero.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompat0026', 0, () => {
      const stages: number[] = [
        LinkStage.EMPTY, LinkStage.SERVER_CREATED, LinkStage.SERVER_STARTED, LinkStage.SERVER_STOPPED,
        LinkStage.CONNECTION_CREATED, LinkStage.CONNECTING, LinkStage.CONNECTED, LinkStage.CLOSED
      ];
      const linkActions: number[] = [
        LinkAction.CREATE_SERVER, LinkAction.START, LinkAction.STOP, LinkAction.CREATE_CONNECTION,
        LinkAction.CONNECT, LinkAction.PEER_CONNECTED, LinkAction.DISCONNECT, LinkAction.CLOSE
      ];
      const channelStages: number[] = [
        ChannelStage.CLOSED, ChannelStage.OPENING, ChannelStage.OPEN, ChannelStage.FAILED
      ];
      const channelActions: number[] = [
        ChannelAction.OPEN, ChannelAction.OPEN_OK, ChannelAction.OPEN_FAIL, ChannelAction.SEND, ChannelAction.CLOSE
      ];
      expect(isAscendingFromZero(stages)).assertTrue();
      expect(isAscendingFromZero(linkActions)).assertTrue();
      expect(isAscendingFromZero(channelStages)).assertTrue();
      expect(isAscendingFromZero(channelActions)).assertTrue();
      expect(nextChannelStage(ChannelStage.CLOSED, ChannelAction.OPEN)).assertEqual(ChannelStage.OPENING);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COMPAT_2700
     * @tc.name testCompat0027
     * @tc.desc Verify the four log levels keep their values and short names.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompat0027', 0, () => {
      expect(LogLevel.DEBUG).assertEqual(0);
      expect(LogLevel.INFO).assertEqual(1);
      expect(LogLevel.WARN).assertEqual(2);
      expect(LogLevel.ERROR).assertEqual(3);
      expect(logLevelName(LogLevel.DEBUG)).assertEqual('DEBUG');
      expect(logLevelName(LogLevel.INFO)).assertEqual('INFO');
      expect(logLevelName(LogLevel.WARN)).assertEqual('WARN');
      expect(logLevelName(LogLevel.ERROR)).assertEqual('ERROR');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COMPAT_2800
     * @tc.name testCompat0028
     * @tc.desc Verify the channel state constants agree with the usability check and names.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompat0028', 0, () => {
      expect(CHANNEL_STATE_WAIT_RESUME).assertEqual(0);
      expect(CHANNEL_STATE_RESUME).assertEqual(1);
      expect(CHANNEL_STATE_SOFTWARE_FAILED).assertEqual(2);
      expect(CHANNEL_STATE_BR_NO_PAIRED).assertEqual(3);
      expect(isChannelUsable(CHANNEL_STATE_RESUME)).assertTrue();
      expect(isChannelUsable(CHANNEL_STATE_WAIT_RESUME)).assertFalse();
      expect(channelStateName(CHANNEL_STATE_RESUME)).assertEqual('通道已恢复');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COMPAT_2900
     * @tc.name testCompat0029
     * @tc.desc Verify the link type and collaborate results match their name formatters.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompat0029', 0, () => {
      expect(LINK_TYPE_BR).assertEqual(0);
      expect(COLLABORATE_ACCEPT).assertEqual(0);
      expect(COLLABORATE_REJECT).assertEqual(1);
      expect(collaborateResultName(COLLABORATE_ACCEPT)).assertEqual('ACCEPT（0）：接受协同');
      expect(collaborateResultName(COLLABORATE_REJECT)).assertEqual('REJECT（1）：拒绝协同');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COMPAT_3000
     * @tc.name testCompat0030
     * @tc.desc Verify the navigation title and subtitle name the three capabilities.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompat0030', 0, () => {
      expect(defaultNavTitle()).assertEqual('分布式扩展与链路示例');
      expect(defaultNavTitle().length).assertEqual(10);
      expect(appSubtitle().includes('分布式 Extension')).assertTrue();
      expect(appSubtitle().includes('链路增强')).assertTrue();
      expect(appSubtitle().includes('代理通道')).assertTrue();
    });
  });
}
