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
 * 四个接口的真调用封装，页面只拿 ProbeOutcome，不再各自写 try/catch：
 * - readExtensionInfo：从 bundleManager 读回本应用注册的 distributed 扩展，验证 module.json5 真的生效
 * - probeSyscap / probeEnums：读能力位与模块导出的枚举常量，核对 d.ts 契约
 * - LinkRunner：linkEnhance 的 Server / Connection 生命周期与收发
 * - ChannelRunner：proxyChannelManager 的通道生命周期与收发
 * 所有失败都被折算成「错误码 + 原始 message + 状态分类」，错误码来自系统，不在此处臆造。
 */

import { bundleManager } from '@kit.AbilityKit';
import { linkEnhance, proxyChannelManager } from '@kit.DistributedServiceKit';
import {
  APP_COLLABORATION_SYSCAP, CHANNEL_PAYLOAD_LIMIT, EXTENSION_TYPE_DISTRIBUTED, LINK_PAYLOAD_LIMIT
} from '../common/AppConstants';
import {
  CHANNEL_STATE_RESUME, COLLABORATE_ACCEPT, ERROR_CODE_CAPABILITY_UNSUPPORTED, LINK_TYPE_BR, ProbeStatus,
  channelStateName, classifyErrorCode, isChannelUsable
} from '../model/ProbeState';
import { decodeUtf8, encodeUtf8, toHexPreview } from '../model/TextCodec';
import { codeOfThrown, distributedErrorHint, messageOfThrown } from './ErrorUtil';
import { text, text1, text2, text3 } from '../common/StringResource';
import { Logger } from './Logger';

/** 本地参数拦截的伪错误码：不是系统错误码，页面据此显示「未执行」而不是「失败」 */
export const LOCAL_GUARD_CODE: number = -1;

/**
 * 系统接口抛出的异常里既没有数值 code，message 中也找不到错误码时使用。
 * 不把这种异常当 0（成功）处理，否则页面会误报「调用成功」。
 */
export const LOCAL_THROWN_CODE: number = -2;

export class ProbeOutcome {
  public action: string;
  public code: number;
  public message: string;
  public status: ProbeStatus;

  constructor(action: string, code: number, message: string) {
    this.action = action;
    this.code = code;
    this.message = message.length > 0 ? message : text('probe_unknown_result');
    this.status = classifyErrorCode(code);
  }

  succeeded(): boolean {
    return this.code === 0;
  }

  describe(): string {
    if (this.code === 0) {
      return text2('probe_action_success', this.action, this.message);
    }
    if (this.code === LOCAL_GUARD_CODE) {
      return text2('probe_action_not_executed', this.action, this.message);
    }
    return text3('probe_action_failed', this.action, `${this.code}`, this.message);
  }

  hint(): string {
    if (this.code === LOCAL_GUARD_CODE) {
      return text('probe_hint_guard');
    }
    if (this.code === LOCAL_THROWN_CODE) {
      // 实测：未授权时 linkEnhance 抛的是无错误码的 BusinessError，message 为 Permission verification failed
      if (this.message.toLowerCase().includes('permission')) {
        return text('probe_hint_permission_throw');
      }
      return text('probe_hint_thrown');
    }
    return distributedErrorHint(this.code);
  }
}

/** module.json5 里 distributed 扩展的读回结果 */
export class ExtensionInfoResult {
  public declared: boolean;
  public total: number;
  public name: string;
  public typeName: string;
  public code: number;
  public message: string;

  constructor(declared: boolean, total: number, name: string, typeName: string, code: number, message: string) {
    this.declared = declared;
    this.total = total;
    this.name = name;
    this.typeName = typeName;
    this.code = code;
    this.message = message;
  }

  describe(): string {
    if (this.code !== 0) {
      return text2('extinfo_read_failed', `${this.code}`, this.message);
    }
    if (!this.declared) {
      return text1('extinfo_not_declared', `${this.total}`);
    }
    return text3('extinfo_declared', this.name, this.typeName, `${this.total}`);
  }
}

/**
 * bundleManager 是唯一能证明「module.json5 的 type: distributed 被系统接受」的本地接口：
 * hap 装得上、这里读得到 ExtensionAbilityType.DISTRIBUTED(28)，才说明扩展配置有效。
 */
export function readExtensionInfo(): ExtensionInfoResult {
  try {
    const flags = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
      bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
    const info = bundleManager.getBundleInfoForSelfSync(flags);
    const modules: bundleManager.HapModuleInfo[] = info.hapModulesInfo;
    let total = 0;
    let name = '';
    let typeName = '';
    for (let i = 0; i < modules.length; i++) {
      const items: bundleManager.ExtensionAbilityInfo[] = modules[i].extensionAbilitiesInfo;
      for (let j = 0; j < items.length; j++) {
        total++;
        if (items[j].extensionAbilityType === EXTENSION_TYPE_DISTRIBUTED) {
          name = items[j].name;
          typeName = items[j].extensionAbilityTypeName;
        }
      }
    }
    const declared = name.length > 0;
    const message = declared ? `${name} / ${typeName}` : text('extinfo_no_match');
    Logger.info('DistributedProbe', 'readExtensionInfo', `declared=${declared}, total=${total}`);
    return new ExtensionInfoResult(declared, total, name, typeName, 0, message);
  } catch (err) {
    const code = codeOfThrown(err);
    const message = messageOfThrown(err);
    Logger.error('DistributedProbe', 'readExtensionInfo', `fail code=${code}: ${message}`);
    return new ExtensionInfoResult(false, 0, '', '', code, message);
  }
}

/** canIUse 读 syscap：false 时按 801 处理，与 d.ts 里「能力被裁剪返回 801」保持一致 */
export function probeSyscap(): ProbeOutcome {
  try {
    const supported: boolean = canIUse(APP_COLLABORATION_SYSCAP);
    if (!supported) {
      return new ProbeOutcome('canIUse', ERROR_CODE_CAPABILITY_UNSUPPORTED,
        text1('syscap_undeclared', APP_COLLABORATION_SYSCAP));
    }
    return new ProbeOutcome('canIUse', 0, text1('syscap_declared', APP_COLLABORATION_SYSCAP));
  } catch (err) {
    return new ProbeOutcome('canIUse', codeOfThrown(err), messageOfThrown(err));
  }
}

/** 枚举取值快照：静态常量来自 d.ts，运行期取值来自模块本身，两者一致才说明契约没漂移 */
export class EnumSnapshot {
  public staticLinkType: number;
  public runtimeLinkType: number;
  public staticChannelResume: number;
  public runtimeChannelResume: number;
  public staticCollaborateAccept: number;
  public code: number;
  public message: string;

  constructor(runtimeLinkType: number, runtimeChannelResume: number, code: number, message: string) {
    this.staticLinkType = LINK_TYPE_BR;
    this.staticChannelResume = CHANNEL_STATE_RESUME;
    this.runtimeLinkType = runtimeLinkType;
    this.runtimeChannelResume = runtimeChannelResume;
    this.staticCollaborateAccept = COLLABORATE_ACCEPT;
    this.code = code;
    this.message = message;
  }

  consistent(): boolean {
    return this.code === 0 && this.staticLinkType === this.runtimeLinkType &&
      this.staticChannelResume === this.runtimeChannelResume;
  }

  describe(): string {
    if (this.code !== 0) {
      return text2('enum_read_failed', `${this.code}`, this.message);
    }
    const link = this.staticLinkType === this.runtimeLinkType ? text('enum_same') : text('enum_diff');
    const channel = this.staticChannelResume === this.runtimeChannelResume ? text('enum_same') : text('enum_diff');
    const linkPart = text2('enum_link_part', `${this.runtimeLinkType}`, link);
    const channelPart = text2('enum_channel_part', `${this.runtimeChannelResume}`, channel);
    const collabPart = text1('enum_collab_part', `${this.staticCollaborateAccept}`);
    const sep = text('enum_part_sep');
    return `${linkPart}${sep}${channelPart}${sep}${collabPart}`;
  }
}

export function probeEnums(): EnumSnapshot {
  try {
    const runtimeLinkType: number = proxyChannelManager.LinkType.LINK_BR;
    const runtimeChannelResume: number = proxyChannelManager.ChannelState.CHANNEL_RESUME;
    const snapshot = new EnumSnapshot(runtimeLinkType, runtimeChannelResume, 0, '');
    Logger.info('DistributedProbe', 'probeEnums', snapshot.describe());
    return snapshot;
  } catch (err) {
    return new EnumSnapshot(-1, -1, codeOfThrown(err), messageOfThrown(err));
  }
}

/** 异常里的错误码：取不到数字码时统一记为 LOCAL_THROWN_CODE，避免被当成成功 */
function thrownCode(err: Object): number {
  const raw = codeOfThrown(err);
  return raw > 0 ? raw : LOCAL_THROWN_CODE;
}

/** linkEnhance 的 Server / Connection 组合封装，页面只按 stage 决定按钮是否可点 */
export class LinkRunner {
  private source: string;
  private server: linkEnhance.Server | null = null;
  private connection: linkEnhance.Connection | null = null;
  private peerId: string = '';
  private receivedText: string = '';
  private receivedHex: string = '';
  private eventText: string = text('chan_no_callback');
  public onEvent: (text: string) => void = () => {
  };
  /** connectResult 回调：页面据 success 推进「正在连接 → 已连接 / 回到已创建」 */
  public onConnectResult: (success: boolean) => void = () => {
  };
  /** disconnected 回调：页面对把连接端退回「已断开」 */
  public onDisconnected: () => void = () => {
  };
  /** connectionAccepted 回调：服务端拿到对端 Connection，页面据此放开服务端方向的 sendData */
  public onAccepted: (deviceId: string) => void = () => {
  };

  constructor(source: string) {
    this.source = source;
  }

  hasServer(): boolean {
    return this.server !== null;
  }

  hasConnection(): boolean {
    return this.connection !== null;
  }

  peerDeviceId(): string {
    return this.peerId;
  }

  lastReceived(): string {
    return this.receivedText.length > 0 ? text2('lastrecv_hex', this.receivedText, this.receivedHex) :
      text('lastrecv_none');
  }

  lastEvent(): string {
    return this.eventText;
  }

  private emit(tag: string, detail: string): void {
    Logger.info(this.source, tag, detail);
    this.eventText = text2('event_line', tag, detail);
    this.onEvent(this.eventText);
  }

  private guard(action: string, message: string): ProbeOutcome {
    Logger.warn(this.source, action, message);
    return new ProbeOutcome(action, LOCAL_GUARD_CODE, message);
  }

  private fail(action: string, err: Object): ProbeOutcome {
    const raw = codeOfThrown(err);
    const code = raw > 0 ? raw : LOCAL_THROWN_CODE;
    const message = messageOfThrown(err);
    // 失败细节由调用方（页面的 report / 用例）统一记录，这里只返回结果，
    // 否则同一次失败会在 hilog 里出现两条一模一样的记录
    return new ProbeOutcome(action, code, message);
  }

  private readPeerId(connection: linkEnhance.Connection): string {
    try {
      return connection.getPeerDeviceId();
    } catch (err) {
      Logger.warn(this.source, 'getPeerDeviceId', text1('log_fail_code', `${codeOfThrown(err)}`));
      return '';
    }
  }

  private registerConnectionEvents(connection: linkEnhance.Connection): void {
    connection.on('connectResult', (result: linkEnhance.ConnectResult) => {
      this.peerId = result.deviceId;
      const verdict = result.success ? text('cb_connect_ok') : text1('cb_connect_fail', `${result.reason}`);
      const peer = result.deviceId.length > 0 ? result.deviceId : text('cb_device_empty');
      this.emit('connectResult', text2('cb_connect_emit', verdict, peer));
      this.onConnectResult(result.success);
    });
    connection.on('disconnected', (reason: number) => {
      this.peerId = '';
      this.emit('disconnected', text1('cb_disconnected', `${reason}`));
      this.onDisconnected();
    });
    connection.on('dataReceived', (data: ArrayBuffer) => {
      this.receivedText = decodeUtf8(data);
      this.receivedHex = toHexPreview(data);
      this.emit('dataReceived', text2('cb_data_received', `${data.byteLength}`, this.receivedHex));
    });
  }

  createServer(name: string): ProbeOutcome {
    if (name.trim().length === 0) {
      return this.guard('createServer', text('guard_server_name_empty'));
    }
    try {
      const server = linkEnhance.createServer(name);
      this.server = server;
      server.on('connectionAccepted', (connection: linkEnhance.Connection) => {
        this.connection = connection;
        this.registerConnectionEvents(connection);
        const peer = this.readPeerId(connection);
        // 实测：服务端侧这条 Connection 的 getPeerDeviceId() 返回空串（不抛异常），
        // 对端地址只有连接端能从 connectResult 拿到，这里如实透出，不猜一个填进去
        this.emit('connectionAccepted',
          text1('cb_accepted', peer.length > 0 ? peer : text('cb_empty_value')));
        this.onAccepted(peer);
      });
      server.on('serverStopped', (reason: number) => {
        this.emit('serverStopped', text1('cb_server_stopped', `${reason}`));
      });
      return new ProbeOutcome('createServer', 0, text1('server_created', name));
    } catch (err) {
      return this.fail('createServer', err);
    }
  }

  startServer(): ProbeOutcome {
    const server = this.server;
    if (server === null) {
      return this.guard('start', text('guard_no_server'));
    }
    try {
      server.start();
      return new ProbeOutcome('start', 0, text('server_started'));
    } catch (err) {
      return this.fail('start', err);
    }
  }

  stopServer(): ProbeOutcome {
    const server = this.server;
    if (server === null) {
      return this.guard('stop', text('guard_no_server'));
    }
    try {
      server.stop();
      return new ProbeOutcome('stop', 0, text('server_stopped'));
    } catch (err) {
      return this.fail('stop', err);
    }
  }

  createConnection(deviceId: string, name: string): ProbeOutcome {
    if (deviceId.trim().length === 0 || name.trim().length === 0) {
      return this.guard('createConnection', text('guard_conn_param'));
    }
    try {
      const connection = linkEnhance.createConnection(deviceId, name);
      this.connection = connection;
      this.registerConnectionEvents(connection);
      return new ProbeOutcome('createConnection', 0, text2('conn_created', deviceId, name));
    } catch (err) {
      return this.fail('createConnection', err);
    }
  }

  connect(): ProbeOutcome {
    const connection = this.connection;
    if (connection === null) {
      return this.guard('connect', text('guard_no_connection'));
    }
    try {
      connection.connect();
      return new ProbeOutcome('connect', 0, text('conn_connecting'));
    } catch (err) {
      return this.fail('connect', err);
    }
  }

  sendData(content: string): ProbeOutcome {
    const connection = this.connection;
    if (connection === null) {
      return this.guard('sendData', text('guard_no_connection'));
    }
    if (content.length === 0) {
      return this.guard('sendData', text('guard_empty_content'));
    }
    try {
      const payload = encodeUtf8(content);
      if (payload.byteLength > LINK_PAYLOAD_LIMIT) {
        return this.guard('sendData',
          text2('guard_over_limit', `${LINK_PAYLOAD_LIMIT}`, `${payload.byteLength}`));
      }
      connection.sendData(payload);
      return new ProbeOutcome('sendData', 0, text2('cb_data_received', `${payload.byteLength}`, toHexPreview(payload)));
    } catch (err) {
      return this.fail('sendData', err);
    }
  }

  disconnect(): ProbeOutcome {
    const connection = this.connection;
    if (connection === null) {
      return this.guard('disconnect', text('guard_no_connection'));
    }
    try {
      connection.disconnect();
      return new ProbeOutcome('disconnect', 0, text('conn_disconnected'));
    } catch (err) {
      return this.fail('disconnect', err);
    }
  }

  closeConnection(): ProbeOutcome {
    const connection = this.connection;
    if (connection === null) {
      return this.guard('close', text('guard_no_connection'));
    }
    try {
      connection.close();
      this.connection = null;
      this.peerId = '';
      return new ProbeOutcome('close', 0, text('conn_closed'));
    } catch (err) {
      return this.fail('close', err);
    }
  }

  closeServer(): ProbeOutcome {
    const server = this.server;
    if (server === null) {
      return this.guard('close', text('guard_no_server'));
    }
    try {
      server.close();
      this.server = null;
      return new ProbeOutcome('close', 0, text('server_closed'));
    } catch (err) {
      return this.fail('close', err);
    }
  }

  /** 页面退出时兜底释放：逐个 close，失败只记日志，不抛给调用方 */
  releaseAll(): void {
    const connection = this.connection;
    if (connection !== null) {
      try {
        connection.close();
      } catch (err) {
        Logger.warn(this.source, 'release', text1('log_conn_close_fail', `${codeOfThrown(err)}`));
      }
      this.connection = null;
    }
    const server = this.server;
    if (server !== null) {
      try {
        server.close();
      } catch (err) {
        Logger.warn(this.source, 'release', text1('log_server_close_fail', `${codeOfThrown(err)}`));
      }
      this.server = null;
    }
  }
}

/** proxyChannelManager 的单通道封装 */
export class ChannelRunner {
  private source: string;
  private channelId: number = -1;
  private stateText: string = text('chan_no_state');
  private receivedText: string = '';
  private receivedHex: string = '';
  private eventText: string = text('chan_no_callback');
  public onEvent: (text: string) => void = () => {
  };

  constructor(source: string) {
    this.source = source;
  }

  channelIdValue(): number {
    return this.channelId;
  }

  stateTextValue(): string {
    return this.stateText;
  }

  lastReceived(): string {
    return this.receivedText.length > 0 ? text2('lastrecv_hex', this.receivedText, this.receivedHex) :
      text('lastrecv_none');
  }

  lastEvent(): string {
    return this.eventText;
  }

  hasChannel(): boolean {
    return this.channelId >= 0;
  }

  private emit(tag: string, detail: string): void {
    Logger.info(this.source, tag, detail);
    this.eventText = text2('event_line', tag, detail);
    this.onEvent(this.eventText);
  }

  private guard(action: string, message: string): ProbeOutcome {
    Logger.warn(this.source, action, message);
    return new ProbeOutcome(action, LOCAL_GUARD_CODE, message);
  }

  private subscribe(channelId: number): void {
    try {
      proxyChannelManager.on('receiveData', channelId, (info: proxyChannelManager.DataInfo) => {
        this.receivedText = decodeUtf8(info.data);
        this.receivedHex = toHexPreview(info.data);
        this.emit('receiveData',
          text3('cb_chan_receive', `${info.channelId}`, `${info.data.byteLength}`, this.receivedHex));
      });
      proxyChannelManager.on('channelStateChange', channelId, (info: proxyChannelManager.ChannelStateInfo) => {
        this.stateText = text2('chan_state_text', channelStateName(info.state), `${info.state}`);
        this.emit('channelStateChange',
          text3('cb_chan_state', `${info.channelId}`, this.stateText, `${isChannelUsable(info.state)}`));
      });
    } catch (err) {
      Logger.error(this.source, 'on',
        text2('log_subscribe_fail', `${codeOfThrown(err)}`, messageOfThrown(err)));
    }
  }

  private unsubscribe(channelId: number): void {
    try {
      proxyChannelManager.off('receiveData', channelId);
      proxyChannelManager.off('channelStateChange', channelId);
    } catch (err) {
      Logger.warn(this.source, 'off', text1('log_unsubscribe_fail', `${codeOfThrown(err)}`));
    }
  }

  /** openProxyChannel 是 Promise：错误码从 reject 里取，取不到才回到 0 */
  async open(peerDevAddr: string, peerUuid: string): Promise<ProbeOutcome> {
    if (peerDevAddr.trim().length === 0 || peerUuid.trim().length === 0) {
      return this.guard('openProxyChannel', text('guard_peer_param'));
    }
    try {
      const info: proxyChannelManager.ChannelInfo = {
        linkType: proxyChannelManager.LinkType.LINK_BR,
        peerDevAddr: peerDevAddr,
        peerUuid: peerUuid
      };
      const channelId = await proxyChannelManager.openProxyChannel(info);
      this.channelId = channelId;
      this.stateText = text('chan_opened_wait');
      this.subscribe(channelId);
      this.emit('openProxyChannel', text2('cb_chan_open', `${channelId}`, peerDevAddr));
      return new ProbeOutcome('openProxyChannel', 0, text1('chan_id_only', `${channelId}`));
    } catch (err) {
      const code = thrownCode(err);
      const message = messageOfThrown(err);
      return new ProbeOutcome('openProxyChannel', code, message);
    }
  }

  async send(content: string): Promise<ProbeOutcome> {
    if (this.channelId < 0) {
      return this.guard('sendData', text('guard_no_channel'));
    }
    if (content.length === 0) {
      return this.guard('sendData', text('guard_empty_content'));
    }
    try {
      const payload = encodeUtf8(content);
      if (payload.byteLength > CHANNEL_PAYLOAD_LIMIT) {
        return this.guard('sendData',
          text2('guard_chan_over_limit', `${CHANNEL_PAYLOAD_LIMIT}`, `${payload.byteLength}`));
      }
      await proxyChannelManager.sendData(this.channelId, payload);
      return new ProbeOutcome('sendData', 0, text2('cb_data_received', `${payload.byteLength}`, toHexPreview(payload)));
    } catch (err) {
      const code = thrownCode(err);
      const message = messageOfThrown(err);
      return new ProbeOutcome('sendData', code, message);
    }
  }

  close(): ProbeOutcome {
    if (this.channelId < 0) {
      return this.guard('closeProxyChannel', text('guard_no_open_channel'));
    }
    const channelId = this.channelId;
    this.unsubscribe(channelId);
    try {
      proxyChannelManager.closeProxyChannel(channelId);
      this.channelId = -1;
      this.stateText = text('chan_closed_state');
      return new ProbeOutcome('closeProxyChannel', 0, text1('chan_close_ok', `${channelId}`));
    } catch (err) {
      const code = thrownCode(err);
      const message = messageOfThrown(err);
      return new ProbeOutcome('closeProxyChannel', code, message);
    }
  }

  release(): void {
    const channelId = this.channelId;
    if (channelId < 0) {
      return;
    }
    this.unsubscribe(channelId);
    try {
      proxyChannelManager.closeProxyChannel(channelId);
    } catch (err) {
      Logger.warn(this.source, 'release', text1('log_chan_close_fail', `${codeOfThrown(err)}`));
    }
    this.channelId = -1;
  }
}
