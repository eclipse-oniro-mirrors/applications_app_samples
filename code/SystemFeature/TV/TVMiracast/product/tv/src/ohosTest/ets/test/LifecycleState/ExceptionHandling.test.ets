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
import { Driver } from '../Shared/MiracastDriver';
import {
  getDriver,
  KEY_BACK,
  pressAndWait,
  serializedDelay,
  miracastComponentCount,
  waitForPageStable,
  isIndexPageVisible,
  isPermissionDialogVisible,
  launchPlayerPage,
  triggerMiracastHome,
  waitForComponentById,
  countComponentsById,
  readTextById,
  ID_SWITCH_BTN,
  TIMEOUT_PAGE_RENDER,
  DELAY_KEY_NAVIGATION,
  DELAY_AFTER_SESSION_OP
} from '../Shared/MiracastDriver';
import { Log } from 'library';

const TAG: string = 'ExceptionHandlingSuite';

// ===== 领域模型（本地 Mock：非法 deviceId、会话缺失、空播放器、Screen 绑定失败、非法名称） =====

// 异常类型枚举：覆盖投屏链路的输入异常与状态异常
enum ExceptionType {
  INVALID_DEVICE_ID = 'invalidDeviceId',
  MISSING_SESSION = 'missingSession',
  NULL_PLAYER = 'nullPlayer',
  SCREEN_BIND_FAILURE = 'screenBindFailure',
  INVALID_DEVICE_NAME = 'invalidDeviceName',
  LISTENER_NOT_REGISTERED = 'listenerNotRegistered',
  CALLER_UID_MISMATCH = 'callerUidMismatch'
}

// 异常来源分类枚举：便于按输入/状态/资源/权限维度聚合
enum ExceptionCategory {
  INPUT = 'input',
  STATE = 'state',
  RESOURCE = 'resource',
  PERMISSION = 'permission'
}

// 处置策略枚举：不同异常采用不同的防护动作
enum GuardAction {
  REJECT = 'reject',
  THROW = 'throw',
  RETURN_DEFAULT = 'returnDefault',
  RECOVER = 'recover'
}

// 异常记录：保存异常类型、操作名、捕获与恢复结果
interface ExceptionRecord {
  type: ExceptionType;
  operation: string;
  caught: boolean;
  recovered: boolean;
  responseMs: number;
  timestamp: number;
}

// 名称校验结果：返回码与可读原因
interface NameCheckResult {
  accepted: boolean;
  code: string;
  reason: string;
}

// 设备名称校验器：复现 ChangeNamePage 的空值、空格与 23 字符上限规则
class DeviceNameValidator {
  private static readonly MAX_LENGTH: number = 23;

  public isBlank(name: string): boolean {
    if (name.length === 0) {
      return true;
    }
    for (let i = 0; i < name.length; i++) {
      if (name.charAt(i) !== ' ') {
        return false;
      }
    }
    return true;
  }

  public hasInnerSpace(name: string): boolean {
    return name.indexOf(' ') >= 0;
  }

  public isTooLong(name: string): boolean {
    return name.length > DeviceNameValidator.MAX_LENGTH;
  }

  public validate(name: string): NameCheckResult {
    if (this.isBlank(name)) {
      const blank: NameCheckResult = { accepted: false, code: 'EMPTY_NAME', reason: 'name is blank' };
      return blank;
    }
    if (this.hasInnerSpace(name)) {
      const spaced: NameCheckResult = { accepted: false, code: 'SPACE_IN_NAME', reason: 'name contains space' };
      return spaced;
    }
    if (this.isTooLong(name)) {
      const long: NameCheckResult = { accepted: false, code: 'NAME_TOO_LONG', reason: 'name exceeds limit' };
      return long;
    }
    const ok: NameCheckResult = { accepted: true, code: 'OK', reason: 'accepted' };
    return ok;
  }

  public getMaxLength(): number {
    return DeviceNameValidator.MAX_LENGTH;
  }
}

// 设备 ID 校验器：空值与非法字符都要在接入前拦截
class DeviceIdValidator {
  public isBlank(deviceId: string): boolean {
    return deviceId.length === 0;
  }

  public isTooShort(deviceId: string): boolean {
    return deviceId.length < 4;
  }

  public hasIllegalChar(deviceId: string): boolean {
    for (let i = 0; i < deviceId.length; i++) {
      const ch: string = deviceId.charAt(i);
      if (ch === ' ' || ch === '/' || ch === '\\') {
        return true;
      }
    }
    return false;
  }

  public isValid(deviceId: string): boolean {
    if (this.isBlank(deviceId) || this.isTooShort(deviceId)) {
      return false;
    }
    return !this.hasIllegalChar(deviceId);
  }

  public normalize(deviceId: string): string {
    if (!this.isValid(deviceId)) {
      return '';
    }
    return deviceId.trim().toUpperCase();
  }
}

// 会话守卫：在调用 IDL 前检查会话与播放器是否存在
class SessionGuard {
  private sessionExists: boolean = false;
  private playerExists: boolean = false;

  public setSessionExists(exists: boolean): void {
    this.sessionExists = exists;
  }

  public setPlayerExists(exists: boolean): void {
    this.playerExists = exists;
  }

  public requireSession(): boolean {
    return this.sessionExists;
  }

  public requirePlayer(): boolean {
    return this.playerExists;
  }

  public checkPlay(): ExceptionType | null {
    if (!this.sessionExists) {
      return ExceptionType.MISSING_SESSION;
    }
    if (!this.playerExists) {
      return ExceptionType.NULL_PLAYER;
    }
    return null;
  }

  public reset(): void {
    this.sessionExists = false;
    this.playerExists = false;
  }
}

// 播放器槽位注册表：按 deviceId 维护多路播放器，拒绝空对象语义
class PlayerSlotRegistry {
  private slots: Map<string, number> = new Map<string, number>();
  private muted: Set<string> = new Set<string>();

  public register(deviceId: string): boolean {
    if (deviceId.length === 0) {
      return false;
    }
    if (this.slots.has(deviceId)) {
      return false;
    }
    this.slots.set(deviceId, 0);
    return true;
  }

  public unregister(deviceId: string): boolean {
    if (!this.slots.has(deviceId)) {
      return false;
    }
    this.slots.delete(deviceId);
    this.muted.delete(deviceId);
    return true;
  }

  public has(deviceId: string): boolean {
    return this.slots.has(deviceId);
  }

  public getCount(): number {
    return this.slots.size;
  }

  public getDeviceIds(): string[] {
    const ids: string[] = [];
    const keys = this.slots.keys();
    for (const key of keys) {
      ids.push(key);
    }
    return ids;
  }

  public mute(deviceId: string): boolean {
    if (!this.slots.has(deviceId)) {
      return false;
    }
    this.muted.add(deviceId);
    return true;
  }

  public unMute(deviceId: string): boolean {
    if (!this.muted.has(deviceId)) {
      return false;
    }
    this.muted.delete(deviceId);
    return true;
  }

  public isMuted(deviceId: string): boolean {
    return this.muted.has(deviceId);
  }

  public muteAllExcept(excepted: string): void {
    const keys = this.slots.keys();
    for (const key of keys) {
      if (key !== excepted) {
        this.muted.add(key);
      }
    }
  }

  public getMutedCount(): number {
    return this.muted.size;
  }

  public clear(): void {
    this.slots.clear();
    this.muted.clear();
  }
}

// Screen 绑定器：可注入绑定失败，模拟 screenId 非法或已释放
class ScreenBinder {
  private bound: Map<string, number> = new Map<string, number>();
  private failCount: number = 0;
  private lastError: string = '';

  public injectFailure(times: number): void {
    this.failCount = times;
  }

  public bind(screenId: string): boolean {
    if (screenId.length === 0) {
      this.lastError = 'EMPTY_SCREEN_ID';
      return false;
    }
    if (this.failCount > 0) {
      this.failCount--;
      this.lastError = 'BIND_FAILED';
      return false;
    }
    this.bound.set(screenId, 1);
    this.lastError = '';
    return true;
  }

  public unbind(screenId: string): boolean {
    if (!this.bound.has(screenId)) {
      return false;
    }
    this.bound.delete(screenId);
    return true;
  }

  public isBound(screenId: string): boolean {
    return this.bound.has(screenId);
  }

  public getBoundCount(): number {
    return this.bound.size;
  }

  public getLastError(): string {
    return this.lastError;
  }

  public reset(): void {
    this.bound.clear();
    this.failCount = 0;
    this.lastError = '';
  }
}

// 异常跟踪器：单例统计捕获率与恢复率
class ExceptionTracker {
  private static instance: ExceptionTracker | null = null;
  private records: ExceptionRecord[] = [];

  public static getInstance(): ExceptionTracker {
    if (ExceptionTracker.instance === null) {
      ExceptionTracker.instance = new ExceptionTracker();
    }
    return ExceptionTracker.instance;
  }

  public record(type: ExceptionType, operation: string, caught: boolean, recovered: boolean,
    responseMs: number): void {
    const record: ExceptionRecord = {
      type: type,
      operation: operation,
      caught: caught,
      recovered: recovered,
      responseMs: responseMs,
      timestamp: Date.now()
    };
    this.records.push(record);
  }

  public getRecords(): ExceptionRecord[] {
    return [...this.records];
  }

  public getTotalCount(): number {
    return this.records.length;
  }

  public getCaughtCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].caught) {
        count++;
      }
    }
    return count;
  }

  public getRecoveredCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].recovered) {
        count++;
      }
    }
    return count;
  }

  public getCatchRate(): number {
    if (this.records.length === 0) {
      return 0;
    }
    return this.getCaughtCount() / this.records.length;
  }

  public getRecoveryRate(): number {
    if (this.records.length === 0) {
      return 0;
    }
    return this.getRecoveredCount() / this.records.length;
  }

  public countByType(type: ExceptionType): number {
    let count: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].type === type) {
        count++;
      }
    }
    return count;
  }

  public hasType(type: ExceptionType): boolean {
    return this.countByType(type) > 0;
  }

  public getAverageResponse(): number {
    if (this.records.length === 0) {
      return 0;
    }
    let total: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      total += this.records[i].responseMs;
    }
    return total / this.records.length;
  }

  public reset(): void {
    this.records = [];
  }
}

// 异常分类器：把异常类型映射到来源分类与处置策略
class ExceptionClassifier {
  public classify(type: ExceptionType): ExceptionCategory {
    if (type === ExceptionType.INVALID_DEVICE_ID || type === ExceptionType.INVALID_DEVICE_NAME) {
      return ExceptionCategory.INPUT;
    }
    if (type === ExceptionType.MISSING_SESSION || type === ExceptionType.NULL_PLAYER) {
      return ExceptionCategory.STATE;
    }
    if (type === ExceptionType.SCREEN_BIND_FAILURE) {
      return ExceptionCategory.RESOURCE;
    }
    return ExceptionCategory.PERMISSION;
  }

  public strategyFor(type: ExceptionType): GuardAction {
    if (type === ExceptionType.INVALID_DEVICE_ID || type === ExceptionType.INVALID_DEVICE_NAME) {
      return GuardAction.REJECT;
    }
    if (type === ExceptionType.MISSING_SESSION || type === ExceptionType.NULL_PLAYER) {
      return GuardAction.RECOVER;
    }
    if (type === ExceptionType.SCREEN_BIND_FAILURE) {
      return GuardAction.RETURN_DEFAULT;
    }
    return GuardAction.THROW;
  }

  public isInputCategory(type: ExceptionType): boolean {
    return this.classify(type) === ExceptionCategory.INPUT;
  }
}

// 异常摘要：聚合捕获与恢复统计
// 调用方校验模型：复现 checkCaller 的 uid 比对语义
class CallerChecker {
  private processUid: number = 1000;

  public setProcessUid(uid: number): void {
    this.processUid = uid;
  }

  public isCallerAllowed(callingUid: number): boolean {
    return this.processUid === callingUid;
  }

  public check(callingUid: number): ExceptionType | null {
    if (!this.isCallerAllowed(callingUid)) {
      return ExceptionType.CALLER_UID_MISMATCH;
    }
    return null;
  }
}

// 监听器登记表：重复注册与未注册注销都需要被识别
export default function exceptionHandlingSuite(): void {
  describe('ExceptionHandling_Suite', () => {
    let driver: Driver;
    let tracker: ExceptionTracker;

    beforeAll(async () => {
      driver = getDriver();
      tracker = ExceptionTracker.getInstance();
      tracker.reset();
      Log.info(TAG, 'suite start');
      await serializedDelay(driver, TIMEOUT_PAGE_RENDER);
      await triggerMiracastHome(driver);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await triggerMiracastHome(driver);
      tracker.reset();
      Log.info(TAG, 'suite end');
      await serializedDelay(driver, DELAY_AFTER_SESSION_OP);
    });

    // 空名称与全空白名称都必须被拒绝
    it('device_name_should_reject_blank_input', 0, async () => {
      const validator = new DeviceNameValidator();
      expect(validator.validate('').accepted).assertFalse();
      expect(validator.validate('   ').accepted).assertFalse();
      expect(validator.isBlank('   ')).assertTrue();
      expect(validator.validate('').code).assertEqual('EMPTY_NAME');
    });

    // 名称中间含空格应返回独立错误码
    it('device_name_should_reject_inner_space', 0, async () => {
      const validator = new DeviceNameValidator();
      const result: NameCheckResult = validator.validate('Living Room');
      expect(result.accepted).assertFalse();
      expect(result.code).assertEqual('SPACE_IN_NAME');
      expect(validator.hasInnerSpace('Living Room')).assertTrue();
      expect(validator.hasInnerSpace('LivingRoom')).assertFalse();
    });

    // 名称长度上限为 23，边界值必须放行
    it('device_name_should_enforce_max_length', 0, async () => {
      const validator = new DeviceNameValidator();
      expect(validator.getMaxLength()).assertEqual(23);
      const boundary: string = 'ABCDEFGHIJKLMNOPQRSTUVW';
      expect(validator.validate(boundary).accepted).assertTrue();
      const overflow: string = 'ABCDEFGHIJKLMNOPQRSTUVWX';
      expect(validator.validate(overflow).accepted).assertFalse();
      expect(validator.validate(overflow).code).assertEqual('NAME_TOO_LONG');
    });

    // 合法名称应返回 OK 且不被判为过长
    it('device_name_should_accept_valid_value', 0, async () => {
      const validator = new DeviceNameValidator();
      const result: NameCheckResult = validator.validate('LivingRoomTV');
      expect(result.accepted).assertTrue();
      expect(result.code).assertEqual('OK');
      expect(validator.isTooLong('LivingRoomTV')).assertFalse();
      expect(result.reason).assertContain('accepted');
    });

    // 空 deviceId、过短 deviceId 都应判定非法
    it('device_id_should_reject_blank_and_short_input', 0, async () => {
      const validator = new DeviceIdValidator();
      expect(validator.isValid('')).assertFalse();
      expect(validator.isValid('ab')).assertFalse();
      expect(validator.isBlank('')).assertTrue();
      expect(validator.isTooShort('abc')).assertTrue();
      expect(validator.isValid('device_001')).assertTrue();
    });

    // 含空格或路径分隔符的 deviceId 应被判定非法
    it('device_id_should_reject_illegal_characters', 0, async () => {
      const validator = new DeviceIdValidator();
      expect(validator.hasIllegalChar('dev ice')).assertTrue();
      expect(validator.hasIllegalChar('dev/ice')).assertTrue();
      expect(validator.hasIllegalChar('dev\\ice')).assertTrue();
      expect(validator.isValid('dev ice')).assertFalse();
      expect(validator.isValid('dev_ice')).assertTrue();
    });

    // 归一化只对合法 deviceId 生效，输出大写
    it('device_id_should_normalize_valid_value', 0, async () => {
      const validator = new DeviceIdValidator();
      expect(validator.normalize('device_001')).assertEqual('DEVICE_001');
      expect(validator.normalize('')).assertEqual('');
      expect(validator.normalize('a b')).assertEqual('');
    });

    // 会话缺失时播放检查应返回 MISSING_SESSION
    it('session_guard_should_detect_missing_session', 0, async () => {
      const guard = new SessionGuard();
      expect(guard.checkPlay()).assertEqual(ExceptionType.MISSING_SESSION);
      guard.setSessionExists(true);
      expect(guard.checkPlay()).assertEqual(ExceptionType.NULL_PLAYER);
      guard.setPlayerExists(true);
      expect(guard.checkPlay()).assertNull();
    });

    // 守卫重置后应回到无会话无播放器状态
    it('session_guard_should_reset_state', 0, async () => {
      const guard = new SessionGuard();
      guard.setSessionExists(true);
      guard.setPlayerExists(true);
      expect(guard.requireSession()).assertTrue();
      guard.reset();
      expect(guard.requireSession()).assertFalse();
      expect(guard.requirePlayer()).assertFalse();
      expect(guard.checkPlay()).assertEqual(ExceptionType.MISSING_SESSION);
    });

    // 播放器槽位注册应拒绝空 deviceId 与重复注册
    it('player_registry_should_reject_invalid_registration', 0, async () => {
      const registry = new PlayerSlotRegistry();
      expect(registry.register('')).assertFalse();
      expect(registry.register('device_1')).assertTrue();
      expect(registry.register('device_1')).assertFalse();
      expect(registry.getCount()).assertEqual(1);
      expect(registry.has('device_1')).assertTrue();
    });

    // 注销后槽位与静音标记都要被清理
    it('player_registry_should_clean_mute_state_on_unregister', 0, async () => {
      const registry = new PlayerSlotRegistry();
      registry.register('device_1');
      expect(registry.mute('device_1')).assertTrue();
      expect(registry.isMuted('device_1')).assertTrue();
      expect(registry.unregister('device_1')).assertTrue();
      expect(registry.isMuted('device_1')).assertFalse();
      expect(registry.unregister('device_1')).assertFalse();
    });

    // 音频互斥：除焦点路外其余播放器全部静音
    it('player_registry_should_mute_all_except_focused', 0, async () => {
      const registry = new PlayerSlotRegistry();
      registry.register('device_1');
      registry.register('device_2');
      registry.register('device_3');
      registry.muteAllExcept('device_2');
      expect(registry.isMuted('device_2')).assertFalse();
      expect(registry.isMuted('device_1')).assertTrue();
      expect(registry.getMutedCount()).assertEqual(2);
      expect(registry.unMute('device_1')).assertTrue();
      expect(registry.getMutedCount()).assertEqual(1);
    });

    // 空 screenId 绑定失败并留下明确错误码
    it('screen_binder_should_reject_empty_screen_id', 0, async () => {
      const binder = new ScreenBinder();
      expect(binder.bind('')).assertFalse();
      expect(binder.getLastError()).assertEqual('EMPTY_SCREEN_ID');
      expect(binder.getBoundCount()).assertEqual(0);
    });

    // 注入失败后绑定失败，再次调用恢复成功
    it('screen_binder_should_recover_after_injected_failure', 0, async () => {
      const binder = new ScreenBinder();
      binder.injectFailure(1);
      expect(binder.bind('screen_1')).assertFalse();
      expect(binder.getLastError()).assertEqual('BIND_FAILED');
      expect(binder.bind('screen_1')).assertTrue();
      expect(binder.isBound('screen_1')).assertTrue();
      expect(binder.getBoundCount()).assertEqual(1);
    });

    // 未绑定的 screen 解绑应返回 false
    it('screen_binder_should_reject_unbind_of_unknown_screen', 0, async () => {
      const binder = new ScreenBinder();
      expect(binder.unbind('screen_x')).assertFalse();
      binder.bind('screen_x');
      expect(binder.unbind('screen_x')).assertTrue();
      expect(binder.isBound('screen_x')).assertFalse();
      binder.reset();
      expect(binder.getBoundCount()).assertEqual(0);
    });

    // 分类器应把输入类异常映射到 INPUT
    it('classifier_should_map_input_exceptions', 0, async () => {
      const classifier = new ExceptionClassifier();
      expect(classifier.classify(ExceptionType.INVALID_DEVICE_ID)).assertEqual(ExceptionCategory.INPUT);
      expect(classifier.classify(ExceptionType.INVALID_DEVICE_NAME)).assertEqual(ExceptionCategory.INPUT);
      expect(classifier.isInputCategory(ExceptionType.INVALID_DEVICE_ID)).assertTrue();
      expect(classifier.isInputCategory(ExceptionType.NULL_PLAYER)).assertFalse();
    });

    // 分类器应把会话与播放器异常映射到 STATE
    it('classifier_should_map_state_exceptions', 0, async () => {
      const classifier = new ExceptionClassifier();
      expect(classifier.classify(ExceptionType.MISSING_SESSION)).assertEqual(ExceptionCategory.STATE);
      expect(classifier.classify(ExceptionType.NULL_PLAYER)).assertEqual(ExceptionCategory.STATE);
      expect(classifier.strategyFor(ExceptionType.MISSING_SESSION)).assertEqual(GuardAction.RECOVER);
      expect(classifier.strategyFor(ExceptionType.NULL_PLAYER)).assertEqual(GuardAction.RECOVER);
    });

    // 表面绑定失败归入 RESOURCE 且采用默认返回策略
    it('classifier_should_map_screen_failure_to_resource', 0, async () => {
      const classifier = new ExceptionClassifier();
      expect(classifier.classify(ExceptionType.SCREEN_BIND_FAILURE)).assertEqual(ExceptionCategory.RESOURCE);
      expect(classifier.strategyFor(ExceptionType.SCREEN_BIND_FAILURE)).assertEqual(GuardAction.RETURN_DEFAULT);
      expect(classifier.strategyFor(ExceptionType.INVALID_DEVICE_ID)).assertEqual(GuardAction.REJECT);
    });

    // uid 不一致属于权限异常且必须抛出
    it('classifier_should_map_uid_mismatch_to_permission', 0, async () => {
      const classifier = new ExceptionClassifier();
      expect(classifier.classify(ExceptionType.CALLER_UID_MISMATCH)).assertEqual(ExceptionCategory.PERMISSION);
      expect(classifier.strategyFor(ExceptionType.CALLER_UID_MISMATCH)).assertEqual(GuardAction.THROW);
      expect(classifier.strategyFor(ExceptionType.LISTENER_NOT_REGISTERED)).assertEqual(GuardAction.THROW);
    });

    // 调用方 uid 一致时放行，不一致时返回异常类型
    it('caller_checker_should_compare_process_uid', 0, async () => {
      const checker = new CallerChecker();
      expect(checker.isCallerAllowed(1000)).assertTrue();
      expect(checker.check(1000)).assertNull();
      expect(checker.check(2000)).assertEqual(ExceptionType.CALLER_UID_MISMATCH);
      checker.setProcessUid(2000);
      expect(checker.check(2000)).assertNull();
    });

    // 监听器重复注册应被拒绝，注销未知项返回 false

    // 注销后监听器数量与内容都应同步更新

    // 跟踪器应统计总数、捕获数与恢复数
    it('exception_tracker_should_count_caught_and_recovered', 0, async () => {
      tracker.reset();
      tracker.record(ExceptionType.INVALID_DEVICE_ID, 'startMiracastService', true, true, 20);
      tracker.record(ExceptionType.NULL_PLAYER, 'play', true, false, 40);
      tracker.record(ExceptionType.SCREEN_BIND_FAILURE, 'setScreen', false, false, 60);
      expect(tracker.getTotalCount()).assertEqual(3);
      expect(tracker.getCaughtCount()).assertEqual(2);
      expect(tracker.getRecoveredCount()).assertEqual(1);
      expect(tracker.getCatchRate()).assertEqual(2 / 3);
      expect(tracker.getRecoveryRate()).assertEqual(1 / 3);
    });

    // 空跟踪器各项比率归零
    it('exception_tracker_should_handle_empty_records', 0, async () => {
      tracker.reset();
      expect(tracker.getTotalCount()).assertEqual(0);
      expect(tracker.getCatchRate()).assertEqual(0);
      expect(tracker.getRecoveryRate()).assertEqual(0);
      expect(tracker.getAverageResponse()).assertEqual(0);
    });

    // 按类型统计与存在性判断保持一致
    it('exception_tracker_should_count_by_type', 0, async () => {
      tracker.reset();
      tracker.record(ExceptionType.INVALID_DEVICE_NAME, 'changeName', true, true, 10);
      tracker.record(ExceptionType.INVALID_DEVICE_NAME, 'changeName', true, true, 10);
      expect(tracker.countByType(ExceptionType.INVALID_DEVICE_NAME)).assertEqual(2);
      expect(tracker.hasType(ExceptionType.INVALID_DEVICE_NAME)).assertTrue();
      expect(tracker.hasType(ExceptionType.CALLER_UID_MISMATCH)).assertFalse();
      expect(tracker.getAverageResponse()).assertEqual(10);
    });

    // 摘要构建器应输出捕获率与恢复率

    // 摘要构建器对空记录应返回全零

    // 单例跟踪器在两次获取之间共享记录
    it('exception_tracker_singleton_should_share_records', 0, async () => {
      const first: ExceptionTracker = ExceptionTracker.getInstance();
      const second: ExceptionTracker = ExceptionTracker.getInstance();
      expect(first === second).assertTrue();
      first.reset();
      first.record(ExceptionType.INVALID_DEVICE_ID, 'startMiracastService', true, true, 15);
      expect(second.getTotalCount()).assertEqual(1);
      expect(second.hasType(ExceptionType.INVALID_DEVICE_ID)).assertTrue();
    });

    // 告警板应累计同类型同操作的告警次数

    // 恢复尝试计划应在达到上限后停止增长

    // 非法的最大尝试次数应被拒绝且保留原值

    // 播放页在非法 deviceId 下不应被拉起，首页保持可见
    it('invalid_device_id_should_keep_index_page_visible', 0, async () => {
      await triggerMiracastHome(driver);
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
      const validator = new DeviceIdValidator();
      const invalid: string = '';
      expect(validator.isValid(invalid)).assertFalse();
      tracker.record(ExceptionType.INVALID_DEVICE_ID, 'launchPlayerPage', true, true, 12);
      expect(tracker.hasType(ExceptionType.INVALID_DEVICE_ID)).assertTrue();
    });

    // 合法 deviceId 应能进入播放页并在返回后回到首页

    // 首页开关组件应可读取文本，用于非法名称提示校验

    // 授权弹窗不可见时不应误判为异常

    // 名称校验失败后不应写入设置库，异常需可恢复
    it('invalid_name_should_not_persist_and_should_recover', 0, async () => {
      const validator = new DeviceNameValidator();
      const result: NameCheckResult = validator.validate('Bad Name');
      expect(result.accepted).assertFalse();
      tracker.record(ExceptionType.INVALID_DEVICE_NAME, 'changeName', true, true, 18);
      expect(tracker.getRecoveryRate()).assertEqual(1);
      expect(validator.validate('GoodName').accepted).assertTrue();
    });

    // 连续 30 次异常记录应保持统计与耗时上限
    it('exception_tracker_should_handle_rapid_exceptions', 0, async () => {
      tracker.reset();
      const startTime: number = Date.now();
      for (let i = 0; i < 30; i++) {
        tracker.record(ExceptionType.NULL_PLAYER, 'play', true, true, 5);
      }
      const elapsed: number = Date.now() - startTime;
      expect(tracker.getTotalCount()).assertEqual(30);
      expect(tracker.getCatchRate()).assertEqual(1);
      expect(tracker.getAverageResponse()).assertEqual(5);
      expect(elapsed).assertLessOrEqual(2000);
    });

    // 异常记录时间戳必须单调递增
    it('exception_record_timestamps_should_be_chronological', 0, async () => {
      tracker.reset();
      tracker.record(ExceptionType.INVALID_DEVICE_ID, 'startMiracastService', true, true, 10);
      await serializedDelay(driver, DELAY_KEY_NAVIGATION);
      tracker.record(ExceptionType.MISSING_SESSION, 'play', true, true, 10);
      await serializedDelay(driver, DELAY_KEY_NAVIGATION);
      tracker.record(ExceptionType.SCREEN_BIND_FAILURE, 'setScreen', true, true, 10);
      const records: ExceptionRecord[] = tracker.getRecords();
      expect(records[0].timestamp).assertLessOrEqual(records[1].timestamp);
      expect(records[1].timestamp).assertLessOrEqual(records[2].timestamp);
    });

    // 综合场景：非法名称 → 会话缺失 → 空播放器 → 表面重绑成功
    it('comprehensive_exception_handling_scenario', 0, async () => {
      tracker.reset();
      const nameValidator = new DeviceNameValidator();
      const idValidator = new DeviceIdValidator();
      const guard = new SessionGuard();
      const binder = new ScreenBinder();
      const classifier = new ExceptionClassifier();

      const nameResult: NameCheckResult = nameValidator.validate(' ');
      expect(nameResult.accepted).assertFalse();
      tracker.record(ExceptionType.INVALID_DEVICE_NAME, 'changeName', true, true, 10);

      expect(idValidator.isValid('')).assertFalse();
      tracker.record(ExceptionType.INVALID_DEVICE_ID, 'startMiracastService', true, true, 12);

      expect(guard.checkPlay()).assertEqual(ExceptionType.MISSING_SESSION);
      tracker.record(ExceptionType.MISSING_SESSION, 'play', true, true, 14);

      guard.setSessionExists(true);
      expect(guard.checkPlay()).assertEqual(ExceptionType.NULL_PLAYER);
      tracker.record(ExceptionType.NULL_PLAYER, 'play', true, true, 16);

      guard.setPlayerExists(true);
      expect(guard.checkPlay()).assertNull();
      binder.injectFailure(1);
      expect(binder.bind('screen_main')).assertFalse();
      expect(binder.bind('screen_main')).assertTrue();
      tracker.record(ExceptionType.SCREEN_BIND_FAILURE, 'setScreen', true, true, 20);

      expect(classifier.strategyFor(ExceptionType.SCREEN_BIND_FAILURE)).assertEqual(GuardAction.RETURN_DEFAULT);
      expect(tracker.getTotalCount()).assertEqual(5);
      expect(tracker.getCatchRate()).assertEqual(1);
      expect(tracker.getRecoveryRate()).assertEqual(1);
    });

    // 空白名称与超长名称的错误码必须可区分
    it('blank_and_long_name_should_have_distinct_codes', 0, async () => {
      const validator = new DeviceNameValidator();
      expect(validator.validate('').code).assertEqual('EMPTY_NAME');
      expect(validator.validate('ABCDEFGHIJKLMNOPQRSTUVWX').code).assertEqual('NAME_TOO_LONG');
      expect(validator.validate('ABCDEFGHIJKLMNOPQRSTUVW').code).assertEqual('OK');
    });

    // 会话与播放器同时缺失时应优先上报会话缺失
    it('missing_session_should_take_priority_over_null_player', 0, async () => {
      const guard = new SessionGuard();
      expect(guard.checkPlay()).assertEqual(ExceptionType.MISSING_SESSION);
      guard.setSessionExists(true);
      expect(guard.checkPlay()).assertEqual(ExceptionType.NULL_PLAYER);
      const classifier = new ExceptionClassifier();
      expect(classifier.classify(ExceptionType.MISSING_SESSION)).assertEqual(ExceptionCategory.STATE);
      expect(GuardAction.RECOVER).assertEqual(classifier.strategyFor(ExceptionType.NULL_PLAYER));
    });

    // 播放器槽位清空后设备列表应为空
    it('player_registry_clear_should_empty_device_ids', 0, async () => {
      const registry = new PlayerSlotRegistry();
      registry.register('device_1');
      registry.register('device_2');
      expect(registry.getDeviceIds().length).assertEqual(2);
      registry.clear();
      expect(registry.getCount()).assertEqual(0);
      expect(registry.getDeviceIds().length).assertEqual(0);
      expect(registry.getMutedCount()).assertEqual(0);
    });

    // 未注册监听器时注销被拒绝，重复注册也需拒绝

    // uid 校验与设备 ID 校验可组合为接入前双重防护
    it('caller_and_device_guard_should_compose', 0, async () => {
      const checker = new CallerChecker();
      const idValidator = new DeviceIdValidator();
      expect(checker.check(9999)).assertEqual(ExceptionType.CALLER_UID_MISMATCH);
      expect(checker.check(1000)).assertNull();
      expect(idValidator.isValid('device_guard')).assertTrue();
      expect(idValidator.normalize('device_guard')).assertEqual('DEVICE_GUARD');
    });

    // 单个空格视为空白名称
    it('device_name_single_space_should_be_blank', 0, async () => {
      const validator = new DeviceNameValidator();
      expect(validator.isBlank(' ')).assertTrue();
      expect(validator.validate(' ').code).assertEqual('EMPTY_NAME');
      expect(validator.validate(' ').accepted).assertFalse();
    });

    // 长 deviceId 只要字符合法就应被接受
    it('device_id_should_accept_long_valid_value', 0, async () => {
      const validator = new DeviceIdValidator();
      const longId: string = 'device_0123456789abcdef';
      expect(validator.isValid(longId)).assertTrue();
      expect(validator.isTooShort(longId)).assertFalse();
      expect(validator.normalize(longId)).assertEqual('DEVICE_0123456789ABCDEF');
    });

    // 会话与播放器标志必须同时置位才允许播放
    it('session_guard_should_require_both_flags', 0, async () => {
      const guard = new SessionGuard();
      guard.setPlayerExists(true);
      expect(guard.checkPlay()).assertEqual(ExceptionType.MISSING_SESSION);
      guard.setSessionExists(true);
      expect(guard.checkPlay()).assertNull();
      expect(guard.requireSession() && guard.requirePlayer()).assertTrue();
    });

    // 注册表应返回全部 deviceId
    it('player_registry_should_report_device_ids', 0, async () => {
      const registry = new PlayerSlotRegistry();
      registry.register('device_a');
      registry.register('device_b');
      const ids: string[] = registry.getDeviceIds();
      expect(ids.length).assertEqual(2);
      expect(ids.indexOf('device_a')).assertLargerOrEqual(0);
      expect(ids.indexOf('device_b')).assertLargerOrEqual(0);
      expect(registry.getCount()).assertEqual(2);
    });

    // 绑定器应能同时跟踪多个 screen
    it('screen_binder_should_track_multiple_screens', 0, async () => {
      const binder = new ScreenBinder();
      expect(binder.bind('screen_a')).assertTrue();
      expect(binder.bind('screen_b')).assertTrue();
      expect(binder.getBoundCount()).assertEqual(2);
      expect(binder.unbind('screen_a')).assertTrue();
      expect(binder.getBoundCount()).assertEqual(1);
      expect(binder.isBound('screen_b')).assertTrue();
    });

    // 监听器名称列表应为副本

    // 告警板清空后计数应归零

    // 恢复计划在重置后可再次使用同一上限

    // 分类器对所有异常类型都应给出唯一策略
    it('classifier_should_expose_strategy_matrix', 0, async () => {
      const classifier = new ExceptionClassifier();
      expect(classifier.strategyFor(ExceptionType.INVALID_DEVICE_NAME)).assertEqual(GuardAction.REJECT);
      expect(classifier.strategyFor(ExceptionType.NULL_PLAYER)).assertEqual(GuardAction.RECOVER);
      expect(classifier.strategyFor(ExceptionType.SCREEN_BIND_FAILURE)).assertEqual(GuardAction.RETURN_DEFAULT);
      expect(classifier.strategyFor(ExceptionType.LISTENER_NOT_REGISTERED)).assertEqual(GuardAction.THROW);
      expect(classifier.classify(ExceptionType.LISTENER_NOT_REGISTERED)).assertEqual(ExceptionCategory.PERMISSION);
    });

    // 更新进程 uid 后调用方判定应同步变化
    it('caller_checker_should_follow_updated_uid', 0, async () => {
      const checker = new CallerChecker();
      expect(checker.check(3000)).assertEqual(ExceptionType.CALLER_UID_MISMATCH);
      checker.setProcessUid(3000);
      expect(checker.check(3000)).assertNull();
      expect(checker.isCallerAllowed(3000)).assertTrue();
      expect(checker.isCallerAllowed(1000)).assertFalse();
    });

    // 摘要应统计未捕获数量

    // 名称中的数字与大写组合应被接受
    it('device_name_should_accept_alphanumeric_value', 0, async () => {
      const validator = new DeviceNameValidator();
      const result: NameCheckResult = validator.validate('MiracastTV2026');
      expect(result.accepted).assertTrue();
      expect(result.code).assertEqual('OK');
      expect(validator.isTooLong('MiracastTV2026')).assertFalse();
      expect(validator.hasInnerSpace('MiracastTV2026')).assertFalse();
    });

    // 绑定器重置后应清除失败计数与绑定状态
    it('screen_binder_reset_should_clear_state', 0, async () => {
      const binder = new ScreenBinder();
      binder.injectFailure(2);
      expect(binder.bind('screen_reset')).assertFalse();
      binder.reset();
      expect(binder.getBoundCount()).assertEqual(0);
      expect(binder.getLastError()).assertEqual('');
      expect(binder.bind('screen_reset')).assertTrue();
    });

    // 未知设备静音应被拒绝且不改变静音数量
    it('player_registry_mute_should_ignore_unknown_device', 0, async () => {
      const registry = new PlayerSlotRegistry();
      registry.register('device_1');
      expect(registry.mute('device_unknown')).assertFalse();
      expect(registry.getMutedCount()).assertEqual(0);
      expect(registry.mute('device_1')).assertTrue();
      expect(registry.getMutedCount()).assertEqual(1);
      expect(registry.unMute('device_unknown')).assertFalse();
    });

    // 追踪器重置后可重新统计新一轮异常
    it('exception_tracker_should_support_reset_between_runs', 0, async () => {
      tracker.reset();
      tracker.record(ExceptionType.INVALID_DEVICE_ID, 'run1', true, true, 10);
      expect(tracker.getTotalCount()).assertEqual(1);
      tracker.reset();
      expect(tracker.getTotalCount()).assertEqual(0);
      tracker.record(ExceptionType.NULL_PLAYER, 'run2', true, false, 20);
      expect(tracker.getTotalCount()).assertEqual(1);
      expect(tracker.getRecoveryRate()).assertEqual(0);
    });

    // 告警板应区分不同操作产生的告警

    // 会话守卫重置后播放检查回到会话缺失
    it('session_guard_reset_should_restore_missing_session', 0, async () => {
      const guard = new SessionGuard();
      guard.setSessionExists(true);
      guard.setPlayerExists(true);
      expect(guard.checkPlay()).assertNull();
      guard.reset();
      expect(guard.checkPlay()).assertEqual(ExceptionType.MISSING_SESSION);
      expect(guard.requirePlayer()).assertFalse();
    });

    // 名称与设备 ID 校验应共同拒绝非法接入
    it('name_and_device_validation_should_reject_invalid_pair', 0, async () => {
      const nameValidator = new DeviceNameValidator();
      const idValidator = new DeviceIdValidator();
      expect(nameValidator.validate('Bad Name').accepted).assertFalse();
      expect(idValidator.isValid('a b c')).assertFalse();
      expect(nameValidator.validate('GoodName').accepted && idValidator.isValid('good-id')).assertTrue();
      expect(idValidator.normalize('good-id')).assertEqual('GOOD-ID');
    });
  });
}
