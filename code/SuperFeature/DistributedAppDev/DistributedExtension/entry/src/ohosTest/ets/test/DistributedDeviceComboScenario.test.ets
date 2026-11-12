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
import { linkEnhance, proxyChannelManager } from '@kit.DistributedServiceKit';
import { BusinessError } from '@kit.BasicServicesKit';
import {
  APP_COLLABORATION_SYSCAP, BLUETOOTH_PERMISSION, BT_PEER_LIMIT, DATASYNC_PERMISSION, DEFAULT_CONNECTION_NAME,
  DEFAULT_PEER_ADDRESS, DEFAULT_PEER_UUID, DEFAULT_SERVER_NAME, EXTENSION_TYPE_DISTRIBUTED, StorageKeys
} from '../../../main/ets/common/AppConstants';
import {
  ChannelAction, ChannelStage, describeChannel, isMacAddress, isServiceUuid, nextChannelStage
} from '../../../main/ets/model/ChannelSession';
import { contextSnapshot } from '../../../main/ets/model/ExtensionContextInfo';
import { LogItem, LogLevel, queryLogs } from '../../../main/ets/model/LogStore';
import { ProbeStatus, probeStatusName } from '../../../main/ets/model/ProbeState';
import { BtPeer, BtPeerScanner } from '../../../main/ets/utils/BtPeerScanner';
import {
  ChannelRunner, LOCAL_GUARD_CODE, LOCAL_THROWN_CODE, LinkRunner, ProbeOutcome, probeEnums, probeSyscap,
  readExtensionInfo
} from '../../../main/ets/utils/DistributedProbe';
import { codeOfThrown, distributedErrorHint, messageOfThrown } from '../../../main/ets/utils/ErrorUtil';
import { Logger } from '../../../main/ets/utils/Logger';
import { PermissionOutcome, checkPermission, describePermissions } from '../../../main/ets/utils/PermissionUtil';

/**
 * 真机未授权时 linkEnhance 抛出的原文随系统版本变化：7.1.0.22 给长文案，
 * 7.0.0.38 给安全组件的短文案，两版都实测过，断言取这个封闭集合，不绑定具体版本。
 */
const LINK_DENIED_TEXTS: string[] = [
  'Permission verification failed. The application does not have the permission required to call the API.',
  'Permission denied.'
];
const PERMISSION_THROWN_HINT: string =
  '系统以权限校验为由拒绝调用，先在首页授予 DISTRIBUTED_DATASYNC / ACCESS_BLUETOOTH 再重试';
const CHANNEL_INVALID_MESSAGE: string = 'BusinessError 32390004: ChannelId is invalid or unavailable';
const CHANNEL_PARAM_MESSAGE: string = 'BusinessError 32390006: Parameter error.';
const EXTENSION_NAME: string = 'DistributedExtAbility';

/** 无效 channelId：0 与正数从未被系统分配过，-1 是 Runner 的空值，2147483647 是 int32 上界 */
const INVALID_CHANNEL_IDS: number[] = [0, -1, 1, 12345, 2147483647];

/** 格式不合法的对端参数：实测 openProxyChannel 在 1~33 ms 内以 32390006 拒绝，不会挂起 */
const BAD_MACS: string[] = ['12:34:56:78:9A', 'GG:34:56:78:9A:BC', '12:34:56:78:9A:BCD', 'xyz'];
const BAD_UUIDS: string[] = [
  '0000A002', 'zzzzzzzz-0000-1000-8000-00805F9B34FB', '0000A002-0000-1000-8000-00805F9B34F', 'bad-uuid'
];

/** 竞速兜底：实测 reject 在 20 ms 内返回，1000 ms 足够且远低于单例超时 */
const RACE_MS: number = 1000;
const RACE_TIMEOUT_CODE: number = -9001;

function storedLogs(): LogItem[] {
  return AppStorage.get<LogItem[]>(StorageKeys.APP_LOGS) ?? [];
}

/** 平台给的拒绝文案是否属于两版实测集合；集合只有两个元素，命中数必然是 0 或 1 */
function matchesDenied(text: string): boolean {
  return LINK_DENIED_TEXTS.filter((item: string) => item === text).length === 1;
}

function tagsOf(logs: LogItem[]): string {
  const parts: string[] = [];
  for (const item of logs) {
    parts.push(item.tag);
  }
  return parts.join(',');
}

async function race(pending: Promise<ProbeOutcome>, ms: number): Promise<ProbeOutcome> {
  const guard = new Promise<ProbeOutcome>((resolve: (value: ProbeOutcome) => void) => {
    setTimeout(() => {
      resolve(new ProbeOutcome('race', RACE_TIMEOUT_CODE, `${ms} ms 内未返回结果`));
    }, ms);
  });
  return Promise.race<ProbeOutcome>([pending, guard]);
}

/** 同步接口的结果折算：不抛记为 0，抛出时按 ErrorUtil 的规则取码与原文 */
function syncOutcome(action: string, call: () => void): ProbeOutcome {
  try {
    call();
    return new ProbeOutcome(action, 0, '未抛异常');
  } catch (err) {
    return new ProbeOutcome(action, codeOfThrown(err), messageOfThrown(err));
  }
}

/** sendData 既可能同步抛（参数不合法），也可能异步 reject（channelId 无效），两条路分开记 action */
async function sendOutcome(channelId: number, size: number): Promise<ProbeOutcome> {
  try {
    const buffer = new ArrayBuffer(size);
    const pending: Promise<ProbeOutcome> = proxyChannelManager.sendData(channelId, buffer).then(() => {
      return new ProbeOutcome('sendData', 0, '已发送');
    }).catch((err: BusinessError) => {
      return new ProbeOutcome('sendData', codeOfThrown(err), messageOfThrown(err));
    });
    return await race(pending, RACE_MS);
  } catch (err) {
    return new ProbeOutcome('sendData.sync', codeOfThrown(err), messageOfThrown(err));
  }
}

/** 直接调 linkEnhance：返回「原始 code 字段|codeOfThrown|message」，创建成功则立即关闭 */
function directServer(name: string): string {
  try {
    const server = linkEnhance.createServer(name);
    server.close();
    return 'created';
  } catch (err) {
    return `${(err as BusinessError).code}|${codeOfThrown(err)}|${messageOfThrown(err)}`;
  }
}

function directConnection(name: string): string {
  try {
    const connection = linkEnhance.createConnection(DEFAULT_PEER_ADDRESS, name);
    connection.close();
    return 'created';
  } catch (err) {
    return `${(err as BusinessError).code}|${codeOfThrown(err)}|${messageOfThrown(err)}`;
  }
}

function statusHistogram(outcomes: ProbeOutcome[]): string {
  const names: string[] = [];
  const counts: number[] = [];
  for (const outcome of outcomes) {
    const name = probeStatusName(outcome.status);
    const index = names.indexOf(name);
    if (index < 0) {
      names.push(name);
      counts.push(1);
    } else {
      counts[index] = counts[index] + 1;
    }
  }
  const parts: string[] = [];
  for (let i = 0; i < names.length; i++) {
    parts.push(`${names[i]}=${counts[i]}`);
  }
  return parts.join(',');
}

/**
 * 设备真调用组合（总）：权限、能力位、扩展注册、linkEnhance、proxyChannelManager 与经典蓝牙扫描
 * 在同一台设备上串起来跑。结果取决于授权状态：未授权分支断言实测原文，已授权分支只断言结构。
 */
export default function distributedDeviceComboScenarioTest() {
  describe('DistributedDeviceComboScenarioTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DEVCOMBO_0100
     * @tc.name testDevCombo0001
     * @tc.desc Verify the health report built from permissions, syscap, enums and the extension registry.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDevCombo0001', 0, () => {
      const datasync = checkPermission(DATASYNC_PERMISSION);
      const bluetooth = checkPermission(BLUETOOTH_PERMISSION);
      const syscap = probeSyscap();
      const enums = probeEnums();
      const ext = readExtensionInfo();
      expect(describePermissions()).assertEqual(`${datasync.describe()}；${bluetooth.describe()}`);
      expect(ext.declared && ext.code === 0).assertTrue();
      expect(ext.name).assertEqual(EXTENSION_NAME);
      expect(ext.describe()).assertEqual(
        `已注册 ${EXTENSION_NAME}（type=${ext.typeName}）；本模块共注册 ${ext.total} 个扩展`);
      expect(enums.consistent()).assertTrue();
      expect(enums.describe()).assertEqual(
        'LinkType.LINK_BR=0（一致）；ChannelState.CHANNEL_RESUME=1（一致）；CollaborateResult.ACCEPT=0');
      expect(syscap.code === 0 || syscap.code === 801).assertTrue();
      if (syscap.code === 0) {
        expect(syscap.describe()).assertEqual(`canIUse成功：${APP_COLLABORATION_SYSCAP} 已声明`);
      } else {
        expect(syscap.status).assertEqual(ProbeStatus.CAPABILITY_UNSUPPORTED);
      }
      if (!datasync.granted) {
        expect(datasync.describe()).assertEqual('DISTRIBUTED_DATASYNC 未授权（0）：尚未授权');
      } else {
        expect(datasync.describe()).assertEqual('DISTRIBUTED_DATASYNC 已授权');
      }
      if (!bluetooth.granted) {
        expect(bluetooth.describe()).assertEqual('ACCESS_BLUETOOTH 未授权（0）：尚未授权');
      } else {
        expect(bluetooth.describe()).assertEqual('ACCESS_BLUETOOTH 已授权');
      }
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DEVCOMBO_0200
     * @tc.name testDevCombo0002
     * @tc.desc Verify canIUse agrees with probeSyscap and rejects unknown or empty capability names.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDevCombo0002', 0, () => {
      const supported = canIUse(APP_COLLABORATION_SYSCAP);
      const syscap = probeSyscap();
      expect(supported).assertEqual(syscap.code === 0);
      expect(canIUse('SystemCapability.Not.Exist')).assertFalse();
      expect(canIUse('')).assertFalse();
      expect(syscap.action).assertEqual('canIUse');
      expect(syscap.message.includes(APP_COLLABORATION_SYSCAP)).assertTrue();
      expect(syscap.hint()).assertEqual(distributedErrorHint(syscap.code));
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DEVCOMBO_0300
     * @tc.name testDevCombo0003
     * @tc.desc Verify a link runner walks two real creates and seven guarded calls with matching logs.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDevCombo0003', 0, () => {
      Logger.clear();
      const granted = checkPermission(DATASYNC_PERMISSION).granted;
      const runner = new LinkRunner('ComboLink');
      const server = runner.createServer(DEFAULT_SERVER_NAME);
      const connection = runner.createConnection(DEFAULT_PEER_ADDRESS, DEFAULT_CONNECTION_NAME);
      expect(server.code === LOCAL_GUARD_CODE).assertFalse();
      expect(connection.code === LOCAL_GUARD_CODE).assertFalse();
      if (!granted) {
        const guards: ProbeOutcome[] = [
          runner.startServer(), runner.stopServer(), runner.connect(), runner.sendData('x'), runner.disconnect(),
          runner.closeConnection(), runner.closeServer()
        ];
        const own = queryLogs(storedLogs(), 'ComboLink', LogLevel.DEBUG, '', 0);
        expect(server.code).assertEqual(LOCAL_THROWN_CODE);
        expect(matchesDenied(server.message)).assertTrue();
        expect(matchesDenied(connection.message)).assertTrue();
        expect(server.hint()).assertEqual(PERMISSION_THROWN_HINT);
        expect(LINK_DENIED_TEXTS.filter((item: string) =>
          connection.describe() === `createConnection失败（-2）：${item}`).length).assertEqual(1);
        expect(guards.filter((item: ProbeOutcome) => item.code === LOCAL_GUARD_CODE).length).assertEqual(7);
        expect(own.length).assertEqual(7);
        expect(tagsOf(own)).assertEqual('close,close,disconnect,sendData,connect,stop,start');
        expect(runner.hasServer() || runner.hasConnection()).assertFalse();
      } else {
        expect(server.succeeded()).assertEqual(runner.hasServer());
        expect(connection.succeeded()).assertEqual(runner.hasConnection());
      }
      runner.releaseAll();
      expect(runner.hasServer()).assertFalse();
      expect(runner.hasConnection()).assertFalse();
      Logger.clear();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DEVCOMBO_0400
     * @tc.name testDevCombo0004
     * @tc.desc Verify direct linkEnhance calls throw a string code that codeOfThrown cannot read as a number.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDevCombo0004', 0, () => {
      const granted = checkPermission(DATASYNC_PERMISSION).granted;
      const names: string[] = ['', 'x', DEFAULT_SERVER_NAME];
      const results: string[] = [];
      for (const name of names) {
        results.push(directServer(name));
        results.push(directConnection(name));
      }
      const denied: string[] = LINK_DENIED_TEXTS.map((text: string) => `201|0|${text}`);
      expect(results.length).assertEqual(6);
      if (!granted) {
        expect(results.filter((text: string) => denied.indexOf(text) >= 0).length).assertEqual(6);
        expect(results.filter((text: string) => text.startsWith('201|0|')).length).assertEqual(6);
        expect(denied.filter((text: string) => results.indexOf(text) >= 0).length).assertEqual(1);
      } else {
        expect(results.filter((text: string) => denied.indexOf(text) >= 0).length).assertEqual(0);
        expect(results.every((text: string) => text.length > 0)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DEVCOMBO_0500
     * @tc.name testDevCombo0005
     * @tc.desc Verify five invalid channel ids are refused with 32390004 by close, on and off for two events.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDevCombo0005', 0, () => {
      const outcomes: ProbeOutcome[] = [];
      for (const id of INVALID_CHANNEL_IDS) {
        outcomes.push(syncOutcome('closeProxyChannel', () => {
          proxyChannelManager.closeProxyChannel(id);
        }));
        outcomes.push(syncOutcome('onChannelStateChange', () => {
          proxyChannelManager.on('channelStateChange', id, (info: proxyChannelManager.ChannelStateInfo) => {
            console.info(`[DevCombo] unexpected state ${info.state}`);
          });
        }));
        outcomes.push(syncOutcome('offChannelStateChange', () => {
          proxyChannelManager.off('channelStateChange', id);
        }));
        outcomes.push(syncOutcome('onReceiveData', () => {
          proxyChannelManager.on('receiveData', id, (info: proxyChannelManager.DataInfo) => {
            console.info(`[DevCombo] unexpected data ${info.data.byteLength}`);
          });
        }));
        outcomes.push(syncOutcome('offReceiveData', () => {
          proxyChannelManager.off('receiveData', id);
        }));
      }
      expect(outcomes.length).assertEqual(25);
      expect(outcomes.filter((item: ProbeOutcome) => item.code === 32390004).length).assertEqual(25);
      const invalidMessages = outcomes.filter((item: ProbeOutcome) => item.message === CHANNEL_INVALID_MESSAGE);
      expect(invalidMessages.length).assertEqual(25);
      expect(statusHistogram(outcomes)).assertEqual('通道不可用=25');
      expect(outcomes[0].hint()).assertEqual('channelId 已失效或不存在，重新 openProxyChannel');
      expect(outcomes[24].describe()).assertEqual(`offReceiveData失败（32390004）：${CHANNEL_INVALID_MESSAGE}`);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DEVCOMBO_0600
     * @tc.name testDevCombo0006
     * @tc.desc Verify sendData rejects invalid ids asynchronously and an empty buffer synchronously.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDevCombo0006', 0, async (done: Function) => {
      const outcomes: ProbeOutcome[] = [];
      for (const id of INVALID_CHANNEL_IDS) {
        outcomes.push(await sendOutcome(id, 4));
      }
      const sizes: number[] = [1, 4096, 5000];
      for (const size of sizes) {
        outcomes.push(await sendOutcome(12345, size));
      }
      const empty = await sendOutcome(12345, 0);
      expect(outcomes.filter((item: ProbeOutcome) => item.action === 'sendData').length).assertEqual(8);
      expect(outcomes.filter((item: ProbeOutcome) => item.code === 32390004).length).assertEqual(8);
      expect(statusHistogram(outcomes)).assertEqual('通道不可用=8');
      expect(empty.action).assertEqual('sendData.sync');
      expect(empty.code).assertEqual(32390006);
      expect(empty.message).assertEqual(CHANNEL_PARAM_MESSAGE);
      expect(empty.status).assertEqual(ProbeStatus.INVALID_PARAM);
      done();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DEVCOMBO_0700
     * @tc.name testDevCombo0007
     * @tc.desc Verify four malformed MAC addresses fail the local check and are refused by openProxyChannel.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDevCombo0007', 0, async (done: Function) => {
      Logger.clear();
      const outcomes: ProbeOutcome[] = [];
      let untouched = 0;
      for (const mac of BAD_MACS) {
        const runner = new ChannelRunner('ComboMac');
        outcomes.push(await race(runner.open(mac, DEFAULT_PEER_UUID), RACE_MS));
        untouched += !runner.hasChannel() && runner.stateTextValue() === '暂无状态回调' &&
          runner.lastEvent() === '暂无回调' ? 1 : 0;
        runner.release();
      }
      expect(BAD_MACS.filter((mac: string) => isMacAddress(mac)).length).assertEqual(0);
      expect(isServiceUuid(DEFAULT_PEER_UUID)).assertTrue();
      expect(outcomes.filter((item: ProbeOutcome) => item.code === 32390006).length).assertEqual(4);
      const paramMessages = outcomes.filter((item: ProbeOutcome) => item.message === CHANNEL_PARAM_MESSAGE);
      expect(paramMessages.length).assertEqual(4);
      expect(statusHistogram(outcomes)).assertEqual('参数无效=4');
      expect(untouched).assertEqual(4);
      expect(queryLogs(storedLogs(), 'ComboMac', LogLevel.DEBUG, '', 0).length).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DEVCOMBO_0800
     * @tc.name testDevCombo0008
     * @tc.desc Verify four malformed service UUIDs fail the local check and are refused by openProxyChannel.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDevCombo0008', 0, async (done: Function) => {
      const outcomes: ProbeOutcome[] = [];
      let untouched = 0;
      for (const uuid of BAD_UUIDS) {
        const runner = new ChannelRunner('ComboUuid');
        outcomes.push(await race(runner.open(DEFAULT_PEER_ADDRESS, uuid), RACE_MS));
        untouched += runner.channelIdValue() === -1 && runner.lastReceived() === '尚未收到数据' ? 1 : 0;
        runner.release();
      }
      expect(BAD_UUIDS.filter((uuid: string) => isServiceUuid(uuid)).length).assertEqual(0);
      expect(isMacAddress(DEFAULT_PEER_ADDRESS)).assertTrue();
      expect(outcomes.filter((item: ProbeOutcome) => item.code === 32390006).length).assertEqual(4);
      expect(outcomes.filter((item: ProbeOutcome) => item.action === 'openProxyChannel').length).assertEqual(4);
      expect(outcomes[3].describe()).assertEqual(`openProxyChannel失败（32390006）：${CHANNEL_PARAM_MESSAGE}`);
      expect(untouched).assertEqual(4);
      done();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DEVCOMBO_0900
     * @tc.name testDevCombo0009
     * @tc.desc Verify a refused open leaves the runner guarded and the page stage machine on FAILED.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDevCombo0009', 0, async (done: Function) => {
      Logger.clear();
      const runner = new ChannelRunner('ComboFail');
      let stage = nextChannelStage(ChannelStage.CLOSED, ChannelAction.OPEN);
      const opened = await race(runner.open(BAD_MACS[0], DEFAULT_PEER_UUID), RACE_MS);
      stage = nextChannelStage(stage, opened.succeeded() ? ChannelAction.OPEN_OK : ChannelAction.OPEN_FAIL);
      const sent = await runner.send('after failure');
      const closed = runner.close();
      const own = queryLogs(storedLogs(), 'ComboFail', LogLevel.WARN, '', 0);
      expect(opened.code).assertEqual(32390006);
      expect(stage).assertEqual(ChannelStage.FAILED);
      expect(describeChannel(runner.channelIdValue(), stage)).assertEqual('打开失败；尚无 channelId');
      expect(sent.code).assertEqual(LOCAL_GUARD_CODE);
      expect(closed.message).assertEqual('当前没有打开的通道');
      expect(tagsOf(own)).assertEqual('closeProxyChannel,sendData');
      expect(nextChannelStage(stage, ChannelAction.OPEN)).assertEqual(ChannelStage.OPENING);
      runner.release();
      Logger.clear();
      done();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DEVCOMBO_1000
     * @tc.name testDevCombo0010
     * @tc.desc Verify the classic bluetooth scanner reports both failures through the callback and the log.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDevCombo0010', 0, () => {
      Logger.clear();
      const granted = checkPermission(BLUETOOTH_PERMISSION).granted;
      const scanner = new BtPeerScanner('ComboBt');
      const errors: string[] = [];
      scanner.onError = (code: number, message: string) => {
        errors.push(`${code}|${message}`);
      };
      scanner.loadPaired();
      scanner.startDiscovery(BT_PEER_LIMIT);
      const own = queryLogs(storedLogs(), 'ComboBt', LogLevel.ERROR, '', 0);
      if (!granted) {
        expect(errors.join('#')).assertEqual('201|BussinessError 201: Permission denied.#0|Permission denied.');
        expect(own.length).assertEqual(2);
        expect(tagsOf(own)).assertEqual('startBluetoothDiscovery,getPairedDevices');
        // 日志 detail 已在英文化整改中改为 fail code 形式，断言随之对齐
        expect(own[0].detail).assertEqual('fail code=0: Permission denied.');
        expect(own[1].detail).assertEqual('fail code=201: BussinessError 201: Permission denied.');
        expect(scanner.isFinding()).assertFalse();
        expect(scanner.list().length).assertEqual(0);
      } else {
        expect(errors.length).assertEqual(own.length);
        const peers: BtPeer[] = scanner.list();
        expect(peers.length <= BT_PEER_LIMIT || peers.every((peer: BtPeer) => peer.paired)).assertTrue();
      }
      scanner.release();
      expect(scanner.isFinding()).assertFalse();
      Logger.clear();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DEVCOMBO_1100
     * @tc.name testDevCombo0011
     * @tc.desc Verify a grid of six permission queries logs one line each and fails only for the empty name.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDevCombo0011', 0, () => {
      Logger.clear();
      const names: string[] = [
        DATASYNC_PERMISSION, BLUETOOTH_PERMISSION, 'ohos.permission.CAMERA',
        'ohos.permission.GET_BLUETOOTH_PEERS_MAC', 'ohos.permission.PIPE_NOT_EXIST'
      ];
      const results = names.map((name: string) => checkPermission(name));
      const empty = checkPermission('');
      const own = queryLogs(storedLogs(), 'PermissionUtil', LogLevel.DEBUG, '', 0);
      expect(results.filter((item: PermissionOutcome) => item.code === 0).length).assertEqual(5);
      expect(results[2].describe()).assertEqual('CAMERA 未授权（0）：尚未授权');
      expect(results[3].granted || results[4].granted).assertFalse();
      expect(results[4].describe()).assertEqual('PIPE_NOT_EXIST 未授权（0）：尚未授权');
      expect(empty.code).assertEqual(12100001);
      expect(empty.message).assertEqual('checkAccessTokenSync 失败（12100001）：' +
        'Invalid parameter. The permissionName is empty or exceeds 256 characters.');
      expect(own.length).assertEqual(6);
      expect(Logger.count('PermissionUtil', 'checkAccessTokenSync')).assertEqual(6);
      expect(queryLogs(own, 'PermissionUtil', LogLevel.ERROR, '', 0).length).assertEqual(1);
      expect(queryLogs(own, 'PermissionUtil', LogLevel.INFO, 'camera', 0).length).assertEqual(1);
      Logger.clear();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DEVCOMBO_1200
     * @tc.name testDevCombo0012
     * @tc.desc Verify the registry read back feeds a context snapshot that names the same distributed extension.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDevCombo0012', 0, () => {
      Logger.clear();
      const info = readExtensionInfo();
      const enums = probeEnums();
      const snapshot = contextSnapshot(info.name, EXTENSION_TYPE_DISTRIBUTED, 'entry', '');
      const own = queryLogs(storedLogs(), 'DistributedProbe', LogLevel.INFO, '', 0);
      expect(snapshot.describe()).assertEqual(
        `context 可用：${EXTENSION_NAME}，type=28（distributed），模块 entry，语言 （未提供）`);
      expect(info.message).assertEqual(`${info.name} / ${info.typeName}`);
      expect(info.typeName).assertEqual('distributed');
      expect(tagsOf(own)).assertEqual('probeEnums,readExtensionInfo');
      expect(own[1].detail).assertEqual(`declared=${info.declared}, total=${info.total}`);
      expect(own[0].detail).assertEqual(enums.describe());
      Logger.clear();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DEVCOMBO_1300
     * @tc.name testDevCombo0013
     * @tc.desc Verify five service names sent to createServer all fold into the same permission outcome.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDevCombo0013', 0, () => {
      Logger.clear();
      const granted = checkPermission(DATASYNC_PERMISSION).granted;
      const names: string[] = ['n1', 'n2', DEFAULT_SERVER_NAME, 'x'.repeat(255), 'x'.repeat(256)];
      const outcomes: ProbeOutcome[] = [];
      for (const name of names) {
        const runner = new LinkRunner('ComboCycle');
        outcomes.push(runner.createServer(name));
        runner.releaseAll();
      }
      const own = queryLogs(storedLogs(), 'ComboCycle', LogLevel.DEBUG, '', 0);
      expect(outcomes.length).assertEqual(5);
      expect(outcomes.filter((item: ProbeOutcome) => item.code === LOCAL_GUARD_CODE).length).assertEqual(0);
      if (!granted) {
        expect(outcomes.filter((item: ProbeOutcome) => item.code === LOCAL_THROWN_CODE).length).assertEqual(5);
        const hinted = outcomes.filter((item: ProbeOutcome) => item.hint() === PERMISSION_THROWN_HINT);
        expect(hinted.length).assertEqual(5);
        expect(statusHistogram(outcomes)).assertEqual('未探测=5');
        expect(own.length).assertEqual(0);
      } else {
        expect(outcomes.filter((item: ProbeOutcome) => item.action === 'createServer').length).assertEqual(5);
        expect(own.filter((item: LogItem) => item.level === LogLevel.ERROR).length).assertEqual(0);
      }
      Logger.clear();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DEVCOMBO_1400
     * @tc.name testDevCombo0014
     * @tc.desc Verify one end to end health run over every carrier yields the expected status histogram.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDevCombo0014', 0, async (done: Function) => {
      Logger.clear();
      const datasync = checkPermission(DATASYNC_PERMISSION).granted;
      const bluetooth = checkPermission(BLUETOOTH_PERMISSION).granted;
      const outcomes: ProbeOutcome[] = [probeSyscap()];
      const link = new LinkRunner('ComboAll');
      outcomes.push(link.createServer(DEFAULT_SERVER_NAME));
      outcomes.push(link.createConnection(DEFAULT_PEER_ADDRESS, DEFAULT_CONNECTION_NAME));
      link.releaseAll();
      outcomes.push(link.startServer());
      const channel = new ChannelRunner('ComboAll');
      outcomes.push(await race(channel.open(BAD_MACS[1], DEFAULT_PEER_UUID), RACE_MS));
      outcomes.push(await channel.send('x'));
      outcomes.push(channel.close());
      outcomes.push(syncOutcome('closeProxyChannel', () => {
        proxyChannelManager.closeProxyChannel(12345);
      }));
      outcomes.push(await sendOutcome(12345, 4));
      outcomes.push(await sendOutcome(12345, 0));
      const scanner = new BtPeerScanner('ComboAll');
      scanner.onError = (code: number, message: string) => {
        if (code > 0) {
          outcomes.push(new ProbeOutcome('getPairedDevices', code, message));
        }
      };
      scanner.loadPaired();
      scanner.release();
      for (const outcome of outcomes) {
        Logger.info('ComboReport', outcome.action, outcome.describe());
      }
      const report = queryLogs(storedLogs(), 'ComboReport', LogLevel.DEBUG, '', 0);
      expect(report.length).assertEqual(outcomes.length);
      const invalidChannel = outcomes.filter((item: ProbeOutcome) => item.status === ProbeStatus.CHANNEL_INVALID);
      const invalidParam = outcomes.filter((item: ProbeOutcome) => item.status === ProbeStatus.INVALID_PARAM);
      expect(invalidChannel.length).assertEqual(2);
      expect(invalidParam.length).assertEqual(2);
      if (!datasync && !bluetooth) {
        expect(outcomes.length).assertEqual(11);
        expect(statusHistogram(outcomes)).assertEqual('未探测=6,参数无效=2,通道不可用=2,缺少权限=1');
        expect(queryLogs(report, 'ComboReport', LogLevel.DEBUG, 'permission', 0).length).assertEqual(3);
      } else {
        expect(outcomes.length >= 10).assertTrue();
      }
      done();
    });
  });
}
