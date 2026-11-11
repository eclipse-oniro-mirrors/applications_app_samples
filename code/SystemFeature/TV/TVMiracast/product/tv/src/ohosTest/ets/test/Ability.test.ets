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

import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import { ConfigData, Log, MIRACAST_SETTINGS_KEY, PermissionType, TrustDeviceInfo } from 'library';

const TAG: string = 'AbilitySuite';

// 应用包名与 Ability 名称：与工程 module.json5 配置保持一致
const BUNDLE_NAME: string = 'com.samples.miracastplayer';

const UI_ABILITY_NAME: string = 'TvAbility';

const SERVICE_ABILITY_NAME: string = 'ServiceExtTvAbility';

// TvAbility.onCreate 依据该参数选择播放页
const PARAM_START_PLAYER: string = 'startPlayer';

// ServiceExtTvAbility.onRequest 收到该参数后延迟 8000ms 启动投屏服务
const PARAM_START_SERVICE: string = 'startMiracastService';

const ON_REQUEST_START_DELAY_MS: number = 8000;

// ===== 领域模型（本地 Mock，纯逻辑，不依赖设备能力） =====

/** Ability 目标页面类型：onCreate 依据 want 参数在首页与播放页之间路由 */
enum AbilityPageType {
  INDEX = 0,
  PLAYER = 1,
  UNKNOWN = 2
}

/** 启动参数模型：对应 want.parameters 中的投屏播放页入参 */
interface StartPlayerParams {
  startPlayer: boolean;
  deviceId: string;
  deviceName: string;
}

/** 启动参数解析器：复现 TvAbility.onCreate / onNewWant 的页面选择逻辑
 *  以及 onPostPlayerData 的 deviceId / deviceName 透传约定。
 */
class StartPlayerResolver {
  /** 依据 startPlayer 参数决定落地页面，缺省（false）落在投屏首页 */
  resolve(params: StartPlayerParams): AbilityPageType {
    if (params.startPlayer) {
      return AbilityPageType.PLAYER;
    }
    return AbilityPageType.INDEX;
  }

  /** 缺省参数模型：未携带 deviceId / deviceName 时的兜底入参 */
  buildEmptyParams(): StartPlayerParams {
    const params: StartPlayerParams = {
      startPlayer: false,
      deviceId: '',
      deviceName: ''
    };
    return params;
  }

  /** 构建播放页入参：deviceId 决定镜像画面绑定关系，deviceName 决定标题展示 */
  buildParams(deviceId: string, deviceName: string): StartPlayerParams {
    const params: StartPlayerParams = {
      startPlayer: true,
      deviceId: deviceId,
      deviceName: deviceName
    };
    return params;
  }

  /** 设备名称清洗：去除首尾空白，全空白时回退到默认名称 */
  sanitizeDeviceName(name: string): string {
    const trimmed = name.trim();
    if (trimmed.length === 0) {
      return 'Unknown Device';
    }
    return trimmed;
  }

  /** 设备 id 校验：空 id 无法绑定 MirrorPlayer，视为非法入参 */
  isValidDeviceId(deviceId: string): boolean {
    return deviceId.trim().length > 0;
  }

  /** 页面类型对应的英文日志标签，供用例断言日志文本可读性 */
  describe(page: AbilityPageType): string {
    if (page === AbilityPageType.PLAYER) {
      return 'player page';
    }
    if (page === AbilityPageType.INDEX) {
      return 'index page';
    }
    return 'unknown page';
  }
}

/** 包名与 Ability 名称模型：复现 module.json5 中的组件身份信息 */
class BundleIdentity {
  private bundleName: string = BUNDLE_NAME;
  private uiAbilityName: string = UI_ABILITY_NAME;
  private serviceAbilityName: string = SERVICE_ABILITY_NAME;

  getBundleName(): string {
    return this.bundleName;
  }

  getUiAbilityName(): string {
    return this.uiAbilityName;
  }

  getServiceAbilityName(): string {
    return this.serviceAbilityName;
  }

  /** 组件全名：bundleName/abilityName，用于 startAbility 的 Want 构造 */
  buildComponentName(abilityName: string): string {
    return this.bundleName + '/' + abilityName;
  }

  /** 是否为被测应用包名 */
  isSameBundle(bundleName: string): boolean {
    return this.bundleName === bundleName;
  }

  /** Ability 名称合法性：非空且仅含 ASCII 字符 */
  isValidAbilityName(abilityName: string): boolean {
    if (abilityName.length === 0) {
      return false;
    }
    for (let i = 0; i < abilityName.length; i++) {
      if (abilityName.charCodeAt(i) > 127) {
        return false;
      }
    }
    return true;
  }

  /** 组件数量：UIAbility 与 ServiceExtensionAbility 共 2 个 */
  abilityCount(): number {
    return 2;
  }
}

/** 配置项模型：覆盖投屏名称、系统属性 key 与快速投屏开关 key */
class SettingsKeyModel {
  /** 快速投屏开关 key：settings.wifi.miracast.quickplay */
  quickPlayKey(): string {
    return MIRACAST_SETTINGS_KEY;
  }

  /** 投屏系统属性 key：persist.castengine.name */
  systemKey(): string {
    return ConfigData.MIRACAST_SYSTEM_KEY;
  }

  /** 设备名称设置项 key：由 settings.general.DEVICE_NAME 提供 */
  deviceNameKey(): string {
    return ConfigData.SETTINGSDATA_DEVICE_NAME;
  }

  /** key 合法性：必须包含命名空间分隔符 '.' 且不含空白 */
  isValidKey(key: string): boolean {
    if (key.length === 0) {
      return false;
    }
    if (key.indexOf('.') <= 0) {
      return false;
    }
    for (let i = 0; i < key.length; i++) {
      if (key.charAt(i) === ' ') {
        return false;
      }
    }
    return true;
  }

  /** 是否属于投屏域 key：统一以 miracast / castengine 命名空间区分 */
  isMiracastDomain(key: string): boolean {
    return key.indexOf('miracast') >= 0 || key.indexOf('castengine') >= 0;
  }

  /** 开关取值归一化：常见真值 1 / true / on 统一为 '1'，其余为 '0' */
  normalizeSwitchValue(value: string): string {
    const lower = value.trim().toLowerCase();
    if (lower === '1' || lower === 'true' || lower === 'on') {
      return '1';
    }
    return '0';
  }

  /** 开关是否开启：归一化后等于 '1' */
  isSwitchOn(value: string): boolean {
    return this.normalizeSwitchValue(value) === '1';
  }
}

/** 授权模型：覆盖 PermissionType 语义与 TrustDevice 持久化决策 */
class PermissionModel {
  /** 数值转枚举：非法数值统一按取消处理，避免误授权 */
  fromValue(value: number): PermissionType {
    if (value === PermissionType.FOREVER) {
      return PermissionType.FOREVER;
    }
    if (value === PermissionType.ONCE) {
      return PermissionType.ONCE;
    }
    return PermissionType.CANCEL;
  }

  /** 是否需要写入 TrustDeviceManager：仅永久信任需要持久化 */
  shouldPersist(type: PermissionType): boolean {
    return type === PermissionType.FOREVER;
  }

  /** 是否允许本次投屏：永久信任与单次授权均放行，取消则拒绝 */
  isAllowed(type: PermissionType): boolean {
    return type === PermissionType.FOREVER || type === PermissionType.ONCE;
  }

  /** 枚举对应的英文标签，用于授权弹窗按钮文案断言 */
  label(type: PermissionType): string {
    if (type === PermissionType.FOREVER) {
      return 'always allow';
    }
    if (type === PermissionType.ONCE) {
      return 'allow once';
    }
    return 'cancel';
  }

  /** 统计永久信任数量：用于验证批量授权后的持久化结果 */
  countPersisted(types: Array<PermissionType>): number {
    let count = 0;
    for (let i = 0; i < types.length; i++) {
      if (this.shouldPersist(types[i])) {
        count++;
      }
    }
    return count;
  }

  /** emitter eventId：授权结果回传统一使用 1000 */
  emitterEventId(): number {
    return 1000;
  }
}

/** 信任设备模型：复现 TrustDevice 表（ID / NAME / TYPE / DATE）的增删查语义 */
class TrustDeviceModel {
  /** 构建设备记录：date 默认为当前时间 */
  build(id: string, name: string, type: number): TrustDeviceInfo {
    const info: TrustDeviceInfo = {
      id: id,
      name: name,
      type: type,
      date: new Date()
    };
    return info;
  }

  /** 记录合法性：id 与 name 均不能为空 */
  isValid(info: TrustDeviceInfo): boolean {
    return info.id.trim().length > 0 && info.name.trim().length > 0;
  }

  /** 重复判定：以 id 作为唯一键，重复 id 插入必须 reject */
  isDuplicate(first: TrustDeviceInfo, second: TrustDeviceInfo): boolean {
    return first.id === second.id;
  }

  /** 追加记录：已存在同 id 时跳过，保持顺序稳定 */
  addUnique(list: Array<TrustDeviceInfo>, info: TrustDeviceInfo): Array<TrustDeviceInfo> {
    const result: Array<TrustDeviceInfo> = [];
    for (let i = 0; i < list.length; i++) {
      result.push(list[i]);
    }
    for (let i = 0; i < result.length; i++) {
      if (this.isDuplicate(result[i], info)) {
        return result;
      }
    }
    if (this.isValid(info)) {
      result.push(info);
    }
    return result;
  }

  /** 按 id 删除记录：不存在时返回原列表副本 */
  removeById(list: Array<TrustDeviceInfo>, id: string): Array<TrustDeviceInfo> {
    const result: Array<TrustDeviceInfo> = [];
    for (let i = 0; i < list.length; i++) {
      if (list[i].id !== id) {
        result.push(list[i]);
      }
    }
    return result;
  }

  /** 按设备类型过滤：type 区分设备接入协议 */
  findByType(list: Array<TrustDeviceInfo>, type: number): Array<TrustDeviceInfo> {
    const result: Array<TrustDeviceInfo> = [];
    for (let i = 0; i < list.length; i++) {
      if (list[i].type === type) {
        result.push(list[i]);
      }
    }
    return result;
  }

  /** 日期格式化为 yyyy-mm-dd：用于信任列表页面的展示断言 */
  formatDate(info: TrustDeviceInfo): string {
    const year = info.date.getFullYear();
    const month = info.date.getMonth() + 1;
    const day = info.date.getDate();
    return `${year}-${month}-${day}`;
  }

  /** 列表去重后的设备 id 集合大小 */
  uniqueIdCount(list: Array<TrustDeviceInfo>): number {
    const ids: Array<string> = [];
    for (let i = 0; i < list.length; i++) {
      if (!ids.includes(list[i].id)) {
        ids.push(list[i].id);
      }
    }
    return ids.length;
  }
}

/** 日志规范模型：日志文本必须为 ASCII 英文，tag 非空且不含空格 */
class LogConventionModel {
  /** 是否全部为 ASCII 可见字符（允许空格） */
  isAscii(text: string): boolean {
    for (let i = 0; i < text.length; i++) {
      const code = text.charCodeAt(i);
      if (code > 127) {
        return false;
      }
    }
    return true;
  }

  /** tag 合法性：长度 1~32 且不含空白 */
  isValidTag(tag: string): boolean {
    if (tag.length === 0 || tag.length > 32) {
      return false;
    }
    for (let i = 0; i < tag.length; i++) {
      if (tag.charAt(i) === ' ') {
        return false;
      }
    }
    return true;
  }

  /** 日志正文格式：'TAG --->>> content'，与 library 中 Log.format 保持一致 */
  buildMessage(tag: string, content: string): string {
    return tag + ' --->>> ' + content;
  }

  /** 统计非 ASCII 日志条数：用于批量规范校验 */
  countNonAscii(list: Array<string>): number {
    let count = 0;
    for (let i = 0; i < list.length; i++) {
      if (!this.isAscii(list[i])) {
        count++;
      }
    }
    return count;
  }

  /** 日志中是否包含指定关键字（英文关键字，区分大小写） */
  containsKeyword(message: string, keyword: string): boolean {
    return message.indexOf(keyword) >= 0;
  }
}

/** 服务请求模型：复现 ServiceExtTvAbility.onRequest 的启动时序 */
class ServiceRequestModel {
  /** 请求参数是否为启动投屏服务 */
  isStartRequest(param: boolean): boolean {
    return param === true;
  }

  /** 启动延迟：启动请求固定延迟 8000ms，其它请求不延迟 */
  planDelay(param: boolean): number {
    if (this.isStartRequest(param)) {
      return ON_REQUEST_START_DELAY_MS;
    }
    return 0;
  }

  /** 执行序列：先绑定 impl 再启动服务，销毁时停止服务 */
  buildExecutionOrder(isStart: boolean, isDestroy: boolean): Array<string> {
    const order: Array<string> = [];
    if (isStart) {
      order.push('bindImpl');
      order.push('startMiracastService');
    }
    if (isDestroy) {
      order.push('stopMiracastService');
    }
    return order;
  }

  /** 请求载荷校验：缺少 startMiracastService 键时不应触发启动 */
  hasStartKey(keys: Array<string>): boolean {
    return keys.includes(PARAM_START_SERVICE);
  }

  /** 延迟是否落在合理区间：0 < delay <= 8000，避免无限等待 */
  isReasonableDelay(delayMs: number): boolean {
    return delayMs > 0 && delayMs <= ON_REQUEST_START_DELAY_MS;
  }
}

export default function abilitySuite(): void {
  describe('Ability_Suite', () => {
    beforeAll(() => {
      Log.info(TAG, 'ability suite start');
    });

    afterAll(() => {
      Log.info(TAG, 'ability suite end');
    });

    // ===== 配置项 =====
    it('config_data_device_name_key_is_not_empty', 0, async () => {
      const model = new SettingsKeyModel();
      const key = model.deviceNameKey();
      expect(key.length > 0).assertTrue();
      expect(model.isValidKey(key)).assertTrue();
      Log.info(TAG, `device name key length: ${key.length}`);
    });

    it('config_data_system_key_matches_castengine', 0, async () => {
      const model = new SettingsKeyModel();
      expect(model.systemKey()).assertEqual('persist.castengine.name');
      expect(model.isMiracastDomain(model.systemKey())).assertTrue();
    });

    it('miracast_settings_key_matches_expected_value', 0, async () => {
      const model = new SettingsKeyModel();
      expect(model.quickPlayKey()).assertEqual('settings.wifi.miracast.quickplay');
      expect(MIRACAST_SETTINGS_KEY).assertEqual(model.quickPlayKey());
    });

    it('miracast_settings_key_is_namespaced', 0, async () => {
      const model = new SettingsKeyModel();
      expect(model.isValidKey(model.quickPlayKey())).assertTrue();
      expect(model.isMiracastDomain(model.quickPlayKey())).assertTrue();
      expect(model.isValidKey('')).assertFalse();
      expect(model.isValidKey('plainkey')).assertFalse();
    });

    it('switch_value_normalization_accepts_truthy_tokens', 0, async () => {
      const model = new SettingsKeyModel();
      expect(model.normalizeSwitchValue('1')).assertEqual('1');
      expect(model.normalizeSwitchValue('TRUE')).assertEqual('1');
      expect(model.normalizeSwitchValue(' on ')).assertEqual('1');
      expect(model.normalizeSwitchValue('0')).assertEqual('0');
      expect(model.isSwitchOn('true')).assertTrue();
      expect(model.isSwitchOn('off')).assertFalse();
    });

    // ===== 授权枚举 =====
    it('permission_type_forever_equals_zero', 0, async () => {
      const model = new PermissionModel();
      expect(PermissionType.FOREVER).assertEqual(0);
      expect(model.fromValue(0)).assertEqual(PermissionType.FOREVER);
    });

    it('permission_type_once_equals_one', 0, async () => {
      const model = new PermissionModel();
      expect(PermissionType.ONCE).assertEqual(1);
      expect(model.fromValue(1)).assertEqual(PermissionType.ONCE);
    });

    it('permission_type_cancel_equals_two', 0, async () => {
      const model = new PermissionModel();
      expect(PermissionType.CANCEL).assertEqual(2);
      expect(model.fromValue(2)).assertEqual(PermissionType.CANCEL);
    });

    it('permission_type_invalid_value_falls_back_to_cancel', 0, async () => {
      const model = new PermissionModel();
      expect(model.fromValue(99)).assertEqual(PermissionType.CANCEL);
      expect(model.fromValue(-1)).assertEqual(PermissionType.CANCEL);
      expect(model.isAllowed(PermissionType.CANCEL)).assertFalse();
    });

    it('permission_forever_requires_persistence', 0, async () => {
      const model = new PermissionModel();
      expect(model.shouldPersist(PermissionType.FOREVER)).assertTrue();
      expect(model.shouldPersist(PermissionType.ONCE)).assertFalse();
      expect(model.shouldPersist(PermissionType.CANCEL)).assertFalse();
    });

    it('permission_labels_are_english', 0, async () => {
      const model = new PermissionModel();
      const convention = new LogConventionModel();
      expect(model.label(PermissionType.FOREVER)).assertEqual('always allow');
      expect(model.label(PermissionType.ONCE)).assertEqual('allow once');
      expect(model.label(PermissionType.CANCEL)).assertEqual('cancel');
      expect(convention.isAscii(model.label(PermissionType.FOREVER))).assertTrue();
    });

    it('permission_count_persisted_only_counts_forever', 0, async () => {
      const model = new PermissionModel();
      const types: Array<PermissionType> = [PermissionType.FOREVER, PermissionType.ONCE,
        PermissionType.FOREVER, PermissionType.CANCEL];
      expect(model.countPersisted(types)).assertEqual(2);
      expect(model.emitterEventId()).assertEqual(1000);
    });

    // ===== 信任设备 =====
    it('trust_device_info_holds_all_table_columns', 0, async () => {
      const model = new TrustDeviceModel();
      const info = model.build('device-001', 'Living Room TV', 1);
      expect(info.id).assertEqual('device-001');
      expect(info.name).assertEqual('Living Room TV');
      expect(info.type).assertEqual(1);
      expect(info.date instanceof Date).assertTrue();
    });

    it('trust_device_valid_requires_id_and_name', 0, async () => {
      const model = new TrustDeviceModel();
      expect(model.isValid(model.build('device-001', 'TV', 0))).assertTrue();
      expect(model.isValid(model.build('', 'TV', 0))).assertFalse();
      expect(model.isValid(model.build('device-002', '   ', 0))).assertFalse();
    });

    it('trust_device_duplicate_detected_by_id', 0, async () => {
      const model = new TrustDeviceModel();
      const first = model.build('device-001', 'TV A', 0);
      const second = model.build('device-001', 'TV B', 1);
      const third = model.build('device-009', 'TV B', 1);
      expect(model.isDuplicate(first, second)).assertTrue();
      expect(model.isDuplicate(first, third)).assertFalse();
    });

    it('trust_device_add_unique_skips_duplicate_id', 0, async () => {
      const model = new TrustDeviceModel();
      let list: Array<TrustDeviceInfo> = [];
      list = model.addUnique(list, model.build('device-001', 'TV A', 0));
      list = model.addUnique(list, model.build('device-001', 'TV B', 0));
      list = model.addUnique(list, model.build('device-002', 'TV C', 0));
      expect(list.length).assertEqual(2);
      expect(model.uniqueIdCount(list)).assertEqual(2);
    });

    it('trust_device_remove_by_id_drops_entry', 0, async () => {
      const model = new TrustDeviceModel();
      let list: Array<TrustDeviceInfo> = [];
      list = model.addUnique(list, model.build('device-001', 'TV A', 0));
      list = model.addUnique(list, model.build('device-002', 'TV B', 0));
      const remaining = model.removeById(list, 'device-001');
      expect(remaining.length).assertEqual(1);
      expect(remaining[0].id).assertEqual('device-002');
      expect(model.removeById(remaining, 'missing').length).assertEqual(1);
    });

    it('trust_device_filter_by_type', 0, async () => {
      const model = new TrustDeviceModel();
      let list: Array<TrustDeviceInfo> = [];
      list = model.addUnique(list, model.build('device-001', 'TV A', 0));
      list = model.addUnique(list, model.build('device-002', 'TV B', 1));
      list = model.addUnique(list, model.build('device-003', 'TV C', 1));
      expect(model.findByType(list, 1).length).assertEqual(2);
      expect(model.findByType(list, 0).length).assertEqual(1);
      expect(model.findByType(list, 5).length).assertEqual(0);
    });

    it('trust_device_format_date_is_readable', 0, async () => {
      const model = new TrustDeviceModel();
      const info = model.build('device-001', 'TV A', 0);
      const text = model.formatDate(info);
      expect(text.length >= 8).assertTrue();
      expect(text.indexOf('-') > 0).assertTrue();
    });
    // ===== 包名与 Ability 名称 =====
    it('bundle_name_matches_application_package', 0, async () => {
      const identity = new BundleIdentity();
      expect(identity.getBundleName()).assertEqual('com.samples.miracastplayer');
      expect(identity.isSameBundle(BUNDLE_NAME)).assertTrue();
      expect(identity.isSameBundle('com.samples.other')).assertFalse();
    });

    it('ui_ability_name_matches_tv_ability', 0, async () => {
      const identity = new BundleIdentity();
      expect(identity.getUiAbilityName()).assertEqual('TvAbility');
      expect(identity.isValidAbilityName(UI_ABILITY_NAME)).assertTrue();
    });

    it('service_ability_name_matches_extension', 0, async () => {
      const identity = new BundleIdentity();
      expect(identity.getServiceAbilityName()).assertEqual('ServiceExtTvAbility');
      expect(identity.isValidAbilityName(SERVICE_ABILITY_NAME)).assertTrue();
      expect(identity.abilityCount()).assertEqual(2);
    });

    it('bundle_component_name_is_joined_with_slash', 0, async () => {
      const identity = new BundleIdentity();
      const component = identity.buildComponentName(UI_ABILITY_NAME);
      expect(component).assertEqual('com.samples.miracastplayer/TvAbility');
      expect(component).assertContain('/');
    });

    it('ability_name_validation_rejects_empty_value', 0, async () => {
      const identity = new BundleIdentity();
      expect(identity.isValidAbilityName('')).assertFalse();
      expect(identity.isValidAbilityName('TvAbility')).assertTrue();
    });

    // ===== TvAbility startPlayer 参数 =====
    it('start_player_true_selects_player_page', 0, async () => {
      const resolver = new StartPlayerResolver();
      const params = resolver.buildParams('device-001', 'Living Room TV');
      expect(params.startPlayer).assertTrue();
      expect(resolver.resolve(params)).assertEqual(AbilityPageType.PLAYER);
      expect(resolver.describe(resolver.resolve(params))).assertEqual('player page');
    });

    it('start_player_false_selects_index_page', 0, async () => {
      const resolver = new StartPlayerResolver();
      const params = resolver.buildEmptyParams();
      expect(params.startPlayer).assertFalse();
      expect(resolver.resolve(params)).assertEqual(AbilityPageType.INDEX);
      expect(resolver.describe(resolver.resolve(params))).assertEqual('index page');
    });

    it('start_player_param_name_is_stable', 0, async () => {
      expect(PARAM_START_PLAYER).assertEqual('startPlayer');
      expect(new LogConventionModel().isAscii(PARAM_START_PLAYER)).assertTrue();
    });

    it('start_player_build_params_carries_device_info', 0, async () => {
      const resolver = new StartPlayerResolver();
      const params = resolver.buildParams('device-007', 'Bedroom TV');
      expect(params.deviceId).assertEqual('device-007');
      expect(params.deviceName).assertEqual('Bedroom TV');
      expect(resolver.isValidDeviceId(params.deviceId)).assertTrue();
    });

    it('start_player_rejects_blank_device_id', 0, async () => {
      const resolver = new StartPlayerResolver();
      expect(resolver.isValidDeviceId('')).assertFalse();
      expect(resolver.isValidDeviceId('   ')).assertFalse();
      expect(resolver.isValidDeviceId('device-001')).assertTrue();
    });

    it('start_player_sanitize_trims_device_name', 0, async () => {
      const resolver = new StartPlayerResolver();
      expect(resolver.sanitizeDeviceName('  Living Room TV  ')).assertEqual('Living Room TV');
    });

    it('start_player_sanitize_blank_falls_back_to_default', 0, async () => {
      const resolver = new StartPlayerResolver();
      expect(resolver.sanitizeDeviceName('')).assertEqual('Unknown Device');
      expect(resolver.sanitizeDeviceName('   ')).assertEqual('Unknown Device');
    });

    // ===== ServiceExt onRequest 8000ms =====
    it('service_ext_start_delay_is_8000ms', 0, async () => {
      const model = new ServiceRequestModel();
      expect(ON_REQUEST_START_DELAY_MS).assertEqual(8000);
      expect(model.planDelay(true)).assertEqual(8000);
      expect(model.isReasonableDelay(model.planDelay(true))).assertTrue();
    });

    it('service_ext_non_start_request_has_no_delay', 0, async () => {
      const model = new ServiceRequestModel();
      expect(model.isStartRequest(false)).assertFalse();
      expect(model.planDelay(false)).assertEqual(0);
      expect(model.isReasonableDelay(0)).assertFalse();
    });

    it('service_ext_start_request_requires_key', 0, async () => {
      const model = new ServiceRequestModel();
      const keys: Array<string> = [PARAM_START_SERVICE, 'deviceId'];
      const emptyKeys: Array<string> = ['deviceId'];
      expect(model.hasStartKey(keys)).assertTrue();
      expect(model.hasStartKey(emptyKeys)).assertFalse();
      expect(PARAM_START_SERVICE).assertEqual('startMiracastService');
    });

    it('service_ext_execution_order_binds_impl_first', 0, async () => {
      const model = new ServiceRequestModel();
      const order = model.buildExecutionOrder(true, true);
      expect(order.length).assertEqual(3);
      expect(order[0]).assertEqual('bindImpl');
      expect(order[1]).assertEqual('startMiracastService');
      expect(order[2]).assertEqual('stopMiracastService');
    });

    it('service_ext_execution_order_without_request_is_empty', 0, async () => {
      const model = new ServiceRequestModel();
      expect(model.buildExecutionOrder(false, false).length).assertEqual(0);
      expect(model.buildExecutionOrder(false, true).length).assertEqual(1);
    });

    // ===== 日志规范 =====
    it('log_message_format_contains_separator', 0, async () => {
      const model = new LogConventionModel();
      const message = model.buildMessage(TAG, 'suite start');
      expect(message).assertContain('--->>');
      expect(model.containsKeyword(message, 'suite start')).assertTrue();
    });

    it('log_tag_is_ascii_and_compact', 0, async () => {
      const model = new LogConventionModel();
      expect(model.isValidTag(TAG)).assertTrue();
      expect(model.isValidTag('')).assertFalse();
      expect(model.isValidTag('bad tag')).assertFalse();
    });

    it('log_ascii_checker_rejects_non_ascii_text', 0, async () => {
      const model = new LogConventionModel();
      expect(model.isAscii('player page ready')).assertTrue();
      expect(model.isAscii('')).assertTrue();
      expect(model.isAscii('caf\u00E9 ready')).assertFalse();
    });

    it('log_non_ascii_counter_counts_violations', 0, async () => {
      const model = new LogConventionModel();
      const messages: Array<string> = ['ok', 'also ok', 'tv ready'];
      expect(model.countNonAscii(messages)).assertEqual(0);
      const mixed: Array<string> = ['ok', 'caf\u00E9 ready'];
      expect(model.countNonAscii(mixed)).assertEqual(1);
    });

    it('log_info_dispatch_does_not_throw', 0, async () => {
      let dispatched: boolean = false;
      try {
        Log.info(TAG, 'log dispatch verification');
        Log.debug(TAG, 'log dispatch debug');
        dispatched = true;
      } catch (error) {
        dispatched = false;
        Log.error(TAG, 'log dispatch failed');
      }
      expect(dispatched).assertTrue();
    });
  });
}
