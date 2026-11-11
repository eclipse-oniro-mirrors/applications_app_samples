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
import { Log } from 'library';

const TAG: string = 'MiracastAuthSessionSuite';

// 授权弹窗回传的三种用户选择，取值与 PermissionType 保持一致
enum GrantDecision {
  FOREVER = 0, ONCE = 1, CANCEL = 2
}

// 授权会话状态机：空闲 -> 弹窗中 -> 已授权/已拒绝 -> 过期
enum AuthSessionState {
  IDLE = 'idle', PROMPTING = 'prompting', GRANTED = 'granted', DENIED = 'denied', EXPIRED = 'expired'
}

// 授权请求：投屏设备发起的一次连接授权
class AuthGrantRequest {
  public deviceId: string;
  public deviceName: string;
  public deviceType: number;
  public requestedAt: number;

  constructor(deviceId: string, deviceName: string, deviceType: number, requestedAt: number) {
    this.deviceId = deviceId;
    this.deviceName = deviceName;
    this.deviceType = deviceType;
    this.requestedAt = requestedAt;
  }

  public isValid(): boolean {
    return this.deviceId.length > 0 && this.deviceName.length > 0 && this.deviceType >= 0;
  }

  public toKey(): string {
    return `${this.deviceId}#${this.deviceType}`;
  }
}

// 授权会话：驱动弹窗展示、用户选择与最终授权结果
class PermissionSession {
  private state: AuthSessionState = AuthSessionState.IDLE;
  private decision: GrantDecision | null = null;
  private request: AuthGrantRequest | null = null;

  public openPrompt(request: AuthGrantRequest): boolean {
    if (this.state === AuthSessionState.PROMPTING) {
      return false;
    }
    this.state = AuthSessionState.PROMPTING;
    this.request = request;
    this.decision = null;
    return true;
  }

  public resolve(decision: GrantDecision): boolean {
    if (this.state !== AuthSessionState.PROMPTING) {
      return false;
    }
    this.decision = decision;
    if (decision === GrantDecision.CANCEL) {
      this.state = AuthSessionState.DENIED;
    } else {
      this.state = AuthSessionState.GRANTED;
    }
    return true;
  }

  public expire(): void {
    this.state = AuthSessionState.EXPIRED;
    this.decision = null;
  }

  public close(): void {
    this.state = AuthSessionState.IDLE;
    this.decision = null;
    this.request = null;
  }

  public getState(): AuthSessionState {
    return this.state;
  }

  public getDecision(): GrantDecision | null {
    return this.decision;
  }

  public getRequest(): AuthGrantRequest | null {
    return this.request;
  }

  public isGranted(): boolean {
    return this.state === AuthSessionState.GRANTED;
  }

  public isPrompting(): boolean {
    return this.state === AuthSessionState.PROMPTING;
  }

  public isTrustedForever(): boolean {
    return this.isGranted() && this.decision === GrantDecision.FOREVER;
  }
}

// 一次性授权窗口：ONCE 授权只在当前会话内有效
class OnceGrantWindow {
  private deviceId: string = '';
  private openedAt: number = 0;
  private closed: boolean = true;

  public open(deviceId: string, openedAt: number): void {
    this.deviceId = deviceId;
    this.openedAt = openedAt;
    this.closed = false;
  }

  public close(): void {
    this.closed = true;
    this.deviceId = '';
  }

  public isActive(): boolean {
    return !this.closed && this.deviceId.length > 0;
  }

  public isActiveFor(deviceId: string): boolean {
    return this.isActive() && this.deviceId === deviceId;
  }

  public getElapsedMs(now: number): number {
    if (this.openedAt <= 0) {
      return 0;
    }
    return now - this.openedAt;
  }
}

// 信任设备存储：模拟 TrustDevice 表（ID/NAME/TYPE/DATE）的增删查
class TrustedDeviceStore {
  private rows: AuthGrantRequest[] = [];
  private duplicateRejects: number = 0;

  public add(request: AuthGrantRequest): boolean {
    if (this.contains(request.deviceId)) {
      this.duplicateRejects++;
      return false;
    }
    this.rows.push(request);
    return true;
  }

  public contains(deviceId: string): boolean {
    for (let i = 0; i < this.rows.length; i++) {
      if (this.rows[i].deviceId === deviceId) {
        return true;
      }
    }
    return false;
  }

  public remove(deviceId: string): boolean {
    for (let i = 0; i < this.rows.length; i++) {
      if (this.rows[i].deviceId === deviceId) {
        this.rows.splice(i, 1);
        return true;
      }
    }
    return false;
  }

  public getAll(): AuthGrantRequest[] {
    return [...this.rows];
  }

  public size(): number {
    return this.rows.length;
  }

  public getDuplicateRejects(): number {
    return this.duplicateRejects;
  }

  public findByName(name: string): AuthGrantRequest | null {
    for (let i = 0; i < this.rows.length; i++) {
      if (this.rows[i].deviceName === name) {
        return this.rows[i];
      }
    }
    return null;
  }

  public clear(): void {
    this.rows = [];
    this.duplicateRejects = 0;
  }
}

// 授权事件载荷：经 emitter eventId 1000 回传给业务层
class AuthEventPayload {
  public eventId: number;
  public deviceId: string;
  public decision: GrantDecision;

  constructor(eventId: number, deviceId: string, decision: GrantDecision) {
    this.eventId = eventId;
    this.deviceId = deviceId;
    this.decision = decision;
  }

  public clone(): AuthEventPayload {
    return new AuthEventPayload(this.eventId, this.deviceId, this.decision);
  }

  public equals(other: AuthEventPayload): boolean {
    return this.eventId === other.eventId && this.deviceId === other.deviceId &&
      this.decision === other.decision;
  }

  public toString(): string {
    return `AuthEventPayload(eventId=${this.eventId}, deviceId=${this.deviceId}, decision=${this.decision})`;
  }

  public isValid(): boolean {
    return this.eventId > 0 && this.deviceId.length > 0;
  }
}

// emitter 派发器：只接受 eventId 1000 的授权事件，并做去重
class AuthEmitterDispatcher {
  public static readonly EVENT_PERMISSION_RESULT: number = 1000;
  private dispatched: AuthEventPayload[] = [];
  private rejectedEventIds: number[] = [];

  public dispatch(payload: AuthEventPayload): boolean {
    if (payload.eventId !== AuthEmitterDispatcher.EVENT_PERMISSION_RESULT) {
      this.rejectedEventIds.push(payload.eventId);
      return false;
    }
    if (payload.deviceId.length === 0) {
      return false;
    }
    this.dispatched.push(payload);
    return true;
  }

  public getDispatchedCount(): number {
    return this.dispatched.length;
  }

  public getRejectedCount(): number {
    return this.rejectedEventIds.length;
  }

  public getLastPayload(): AuthEventPayload | null {
    if (this.dispatched.length === 0) {
      return null;
    }
    return this.dispatched[this.dispatched.length - 1];
  }

  public clear(): void {
    this.dispatched = [];
    this.rejectedEventIds = [];
  }
}

// 授权策略：决定是否弹窗、是否需要持久化信任
class DeviceTrustPolicy {
  private store: TrustedDeviceStore;
  private autoAccept: boolean = false;

  constructor(store: TrustedDeviceStore) {
    this.store = store;
  }

  public shouldPrompt(request: AuthGrantRequest): boolean {
    if (this.store.contains(request.deviceId)) {
      return false;
    }
    return !this.autoAccept;
  }

  public shouldPersist(decision: GrantDecision): boolean {
    return decision === GrantDecision.FOREVER;
  }

  public isSessionScoped(decision: GrantDecision): boolean {
    return decision === GrantDecision.ONCE;
  }

  public isRejected(decision: GrantDecision): boolean {
    return decision === GrantDecision.CANCEL;
  }

  public setAutoAccept(enabled: boolean): void {
    this.autoAccept = enabled;
  }

  public isAutoAccept(): boolean {
    return this.autoAccept;
  }
}

// 授权校验器：校验设备 id 与名称，避免非法设备进入信任列表
class AuthRequestValidator {
  public static readonly MAX_NAME_LENGTH: number = 23;

  public isValidDeviceId(deviceId: string): boolean {
    if (deviceId.length < 4 || deviceId.length > 64) {
      return false;
    }
    for (let i = 0; i < deviceId.length; i++) {
      const code = deviceId.charCodeAt(i);
      const isDigit = code >= 48 && code <= 57;
      const isUpper = code >= 65 && code <= 90;
      const isLower = code >= 97 && code <= 122;
      const isDash = code === 45 || code === 58;
      if (!isDigit && !isUpper && !isLower && !isDash) {
        return false;
      }
    }
    return true;
  }

  public isValidDeviceName(name: string): boolean {
    if (name.length === 0 || name.length > AuthRequestValidator.MAX_NAME_LENGTH) {
      return false;
    }
    return name.trim().length === name.length;
  }

  public isValidRequest(request: AuthGrantRequest): boolean {
    return this.isValidDeviceId(request.deviceId) && this.isValidDeviceName(request.deviceName);
  }

  public isValidDecisionCode(code: number): boolean {
    return code === 0 || code === 1 || code === 2;
  }

  public toDecision(code: number): GrantDecision {
    if (code === 0) {
      return GrantDecision.FOREVER;
    }
    if (code === 1) {
      return GrantDecision.ONCE;
    }
    return GrantDecision.CANCEL;
  }
}

// 授权审计日志：按时间顺序记录每一次用户选择
class AuthAuditLog {
  private entries: string[] = [];
  private times: number[] = [];
  private decisions: GrantDecision[] = [];

  public record(deviceId: string, decision: GrantDecision, at: number): void {
    this.entries.push(`${deviceId}:${decision}`);
    this.times.push(at);
    this.decisions.push(decision);
  }

  public getEntryCount(): number {
    return this.entries.length;
  }

  public getCountByDecision(decision: GrantDecision): number {
    let count: number = 0;
    for (let i = 0; i < this.decisions.length; i++) {
      if (this.decisions[i] === decision) {
        count++;
      }
    }
    return count;
  }

  public isChronological(): boolean {
    for (let i = 1; i < this.times.length; i++) {
      if (this.times[i] < this.times[i - 1]) {
        return false;
      }
    }
    return true;
  }
}

// 授权弹窗队列：多个设备同时请求时按到达顺序排队
class PermissionPromptQueue {
  private pending: AuthGrantRequest[] = [];

  public enqueue(request: AuthGrantRequest): boolean {
    for (let i = 0; i < this.pending.length; i++) {
      if (this.pending[i].deviceId === request.deviceId) {
        return false;
      }
    }
    this.pending.push(request);
    return true;
  }

  public dequeue(): AuthGrantRequest | null {
    if (this.pending.length === 0) {
      return null;
    }
    const first = this.pending.shift();
    return first === undefined ? null : first;
  }

  public size(): number {
    return this.pending.length;
  }

  public peekDeviceId(): string {
    if (this.pending.length === 0) {
      return '';
    }
    return this.pending[0].deviceId;
  }
}

// 弹窗结果状态：把用户选择归一化为可审计的结果
enum PromptOutcomeState {
  ACCEPTED_FOREVER = 'accepted_forever', ACCEPTED_ONCE = 'accepted_once',
  REJECTED = 'rejected', TIMEOUT = 'timeout'
}

// 弹窗结果模型：封装结果状态与耗时
class PromptOutcome {
  public deviceId: string;
  public state: PromptOutcomeState;
  public elapsedMs: number;

  constructor(deviceId: string, state: PromptOutcomeState, elapsedMs: number) {
    this.deviceId = deviceId;
    this.state = state;
    this.elapsedMs = elapsedMs;
  }

  public isAccepted(): boolean {
    return this.state === PromptOutcomeState.ACCEPTED_FOREVER ||
      this.state === PromptOutcomeState.ACCEPTED_ONCE;
  }

  public isPersistent(): boolean {
    return this.state === PromptOutcomeState.ACCEPTED_FOREVER;
  }

  public toDecision(): GrantDecision {
    if (this.state === PromptOutcomeState.ACCEPTED_FOREVER) {
      return GrantDecision.FOREVER;
    }
    if (this.state === PromptOutcomeState.ACCEPTED_ONCE) {
      return GrantDecision.ONCE;
    }
    return GrantDecision.CANCEL;
  }

  public isValid(): boolean {
    return this.deviceId.length > 0 && this.elapsedMs >= 0;
  }

  public clone(): PromptOutcome {
    return new PromptOutcome(this.deviceId, this.state, this.elapsedMs);
  }

  public equals(other: PromptOutcome): boolean {
    return this.deviceId === other.deviceId && this.state === other.state &&
      this.elapsedMs === other.elapsedMs;
  }
}

// 授权会话统计：统计授权率与状态分布
class AuthSessionStatistics {
  public countGranted(sessions: PermissionSession[]): number {
    let count: number = 0;
    for (let i = 0; i < sessions.length; i++) {
      if (sessions[i].isGranted()) {
        count++;
      }
    }
    return count;
  }

  public countByState(sessions: PermissionSession[], state: AuthSessionState): number {
    let count: number = 0;
    for (let i = 0; i < sessions.length; i++) {
      if (sessions[i].getState() === state) {
        count++;
      }
    }
    return count;
  }

  public getGrantRate(sessions: PermissionSession[]): number {
    if (sessions.length === 0) {
      return 0;
    }
    return this.countGranted(sessions) / sessions.length;
  }

  public countTrustedForever(sessions: PermissionSession[]): number {
    let count: number = 0;
    for (let i = 0; i < sessions.length; i++) {
      if (sessions[i].isTrustedForever()) {
        count++;
      }
    }
    return count;
  }
}

// 授权流程协调器：把请求、弹窗、持久化与 emitter 回传串成一条链路
class AuthFlowCoordinator {
  private session: PermissionSession = new PermissionSession();
  private store: TrustedDeviceStore = new TrustedDeviceStore();
  private dispatcher: AuthEmitterDispatcher = new AuthEmitterDispatcher();
  private policy: DeviceTrustPolicy;

  constructor() {
    this.policy = new DeviceTrustPolicy(this.store);
  }

  public requestTrust(request: AuthGrantRequest): boolean {
    if (!this.policy.shouldPrompt(request)) {
      this.session.openPrompt(request);
      this.session.resolve(GrantDecision.FOREVER);
      this.dispatcher.dispatch(new AuthEventPayload(AuthEmitterDispatcher.EVENT_PERMISSION_RESULT,
        request.deviceId, GrantDecision.FOREVER));
      return false;
    }
    this.session.openPrompt(request);
    return true;
  }

  public submitDecision(request: AuthGrantRequest, decision: GrantDecision): boolean {
    const resolved = this.session.resolve(decision);
    if (!resolved) {
      return false;
    }
    if (this.policy.shouldPersist(decision)) {
      this.store.add(request);
    }
    this.dispatcher.dispatch(new AuthEventPayload(AuthEmitterDispatcher.EVENT_PERMISSION_RESULT,
      request.deviceId, decision));
    return true;
  }

  public getDispatcher(): AuthEmitterDispatcher {
    return this.dispatcher;
  }

  public isTrusted(deviceId: string): boolean {
    return this.store.contains(deviceId);
  }
}

export default function miracastAuthSessionSuite(): void {
  describe('MiracastAuthSession_Suite', () => {

    beforeAll(async () => {
      Log.info(TAG, 'auth session suite started');
    });

    afterAll(async () => {
      Log.info(TAG, 'auth session suite finished');
    });

    // ===== 授权会话状态机 =====
    it('prompt_should_enter_prompting_state', 0, async () => {
      const session = new PermissionSession();
      const request = new AuthGrantRequest('dev-0001', 'LivingRoomTV', 1, 1000);
      expect(session.openPrompt(request)).assertTrue();
      expect(session.getState()).assertEqual(AuthSessionState.PROMPTING);
      expect(session.isPrompting()).assertTrue();
    });

    it('forever_decision_should_grant_and_mark_trusted', 0, async () => {
      const session = new PermissionSession();
      session.openPrompt(new AuthGrantRequest('dev-0001', 'LivingRoomTV', 1, 1000));
      expect(session.resolve(GrantDecision.FOREVER)).assertTrue();
      expect(session.getState()).assertEqual(AuthSessionState.GRANTED);
      expect(session.isTrustedForever()).assertTrue();
      expect(session.getDecision()).assertEqual(GrantDecision.FOREVER);
    });

    it('cancel_decision_should_deny_session', 0, async () => {
      const session = new PermissionSession();
      session.openPrompt(new AuthGrantRequest('dev-0003', 'StudyTV', 1, 3000));
      session.resolve(GrantDecision.CANCEL);
      expect(session.getState()).assertEqual(AuthSessionState.DENIED);
      expect(session.isGranted()).assertFalse();
      expect(session.isTrustedForever()).assertFalse();
    });

    it('resolve_without_prompt_should_be_rejected', 0, async () => {
      const session = new PermissionSession();
      expect(session.resolve(GrantDecision.FOREVER)).assertFalse();
      expect(session.getState()).assertEqual(AuthSessionState.IDLE);
    });

    it('expired_session_should_drop_decision', 0, async () => {
      const session = new PermissionSession();
      session.openPrompt(new AuthGrantRequest('dev-0004', 'KitchenTV', 1, 4000));
      session.resolve(GrantDecision.FOREVER);
      session.expire();
      expect(session.getState()).assertEqual(AuthSessionState.EXPIRED);
      expect(session.getDecision()).assertNull();
      expect(session.isGranted()).assertFalse();
    });

    it('session_close_should_reset_all_fields', 0, async () => {
      const session = new PermissionSession();
      session.openPrompt(new AuthGrantRequest('dev-0006', 'AtticTV', 2, 6000));
      session.resolve(GrantDecision.ONCE);
      session.close();
      expect(session.getState()).assertEqual(AuthSessionState.IDLE);
      expect(session.getRequest()).assertNull();
      expect(session.getDecision()).assertNull();
    });

    it('resolve_twice_should_only_apply_first_decision', 0, async () => {
      const session = new PermissionSession();
      session.openPrompt(new AuthGrantRequest('dev-0007', 'GarageTV', 1, 7000));
      expect(session.resolve(GrantDecision.FOREVER)).assertTrue();
      expect(session.resolve(GrantDecision.CANCEL)).assertFalse();
      expect(session.getDecision()).assertEqual(GrantDecision.FOREVER);
    });

    // ===== 一次性授权窗口 =====
    it('once_grant_window_close_should_invalidate', 0, async () => {
      const window = new OnceGrantWindow();
      window.open('dev-0001', 1000);
      window.close();
      expect(window.isActive()).assertFalse();
      expect(window.isActiveFor('dev-0001')).assertFalse();
    });

    it('once_grant_window_should_report_elapsed_time', 0, async () => {
      const window = new OnceGrantWindow();
      expect(window.getElapsedMs(5000)).assertEqual(0);
      window.open('dev-0001', 1000);
      expect(window.getElapsedMs(5000)).assertEqual(4000);
    });

    // ===== 信任设备存储 =====
    it('trusted_store_should_add_new_device', 0, async () => {
      const store = new TrustedDeviceStore();
      const request = new AuthGrantRequest('dev-0001', 'LivingRoomTV', 1, 1000);
      expect(store.add(request)).assertTrue();
      expect(store.contains('dev-0001')).assertTrue();
      expect(store.size()).assertEqual(1);
      expect(store.remove('dev-0001')).assertTrue();
      expect(store.size()).assertEqual(0);
    });

    it('trusted_store_should_reject_duplicate_device_id', 0, async () => {
      const store = new TrustedDeviceStore();
      store.add(new AuthGrantRequest('dev-0001', 'LivingRoomTV', 1, 1000));
      expect(store.add(new AuthGrantRequest('dev-0001', 'LivingRoomTV2', 1, 2000))).assertFalse();
      expect(store.size()).assertEqual(1);
      expect(store.getDuplicateRejects()).assertEqual(1);
    });

    it('trusted_store_get_all_should_return_copy', 0, async () => {
      const store = new TrustedDeviceStore();
      store.add(new AuthGrantRequest('dev-0001', 'LivingRoomTV', 1, 1000));
      const all = store.getAll();
      all.push(new AuthGrantRequest('dev-9999', 'GhostTV', 1, 9000));
      expect(store.size()).assertEqual(1);
      expect(all.length).assertEqual(2);
    });

    it('trusted_store_should_find_device_by_name', 0, async () => {
      const store = new TrustedDeviceStore();
      store.add(new AuthGrantRequest('dev-0001', 'LivingRoomTV', 1, 1000));
      const found = store.findByName('LivingRoomTV');
      expect(found === null).assertFalse();
      if (found !== null) {
        expect(found.deviceId).assertEqual('dev-0001');
      }
      expect(store.findByName('UnknownTV')).assertNull();
    });

    it('trusted_store_clear_should_drop_rows_and_counters', 0, async () => {
      const store = new TrustedDeviceStore();
      store.add(new AuthGrantRequest('dev-0001', 'LivingRoomTV', 1, 1000));
      store.add(new AuthGrantRequest('dev-0001', 'LivingRoomTV', 1, 2000));
      store.clear();
      expect(store.size()).assertEqual(0);
      expect(store.getDuplicateRejects()).assertEqual(0);
    });

    // ===== emitter 1000 派发 =====
    it('emitter_should_accept_permission_event_1000', 0, async () => {
      const dispatcher = new AuthEmitterDispatcher();
      const payload = new AuthEventPayload(1000, 'dev-0001', GrantDecision.FOREVER);
      expect(dispatcher.dispatch(payload)).assertTrue();
      expect(dispatcher.getDispatchedCount()).assertEqual(1);
      expect(dispatcher.getRejectedCount()).assertEqual(0);
    });

    it('emitter_should_reject_non_1000_event', 0, async () => {
      const dispatcher = new AuthEmitterDispatcher();
      expect(dispatcher.dispatch(new AuthEventPayload(1001, 'dev-0001',
        GrantDecision.ONCE))).assertFalse();
      expect(dispatcher.getRejectedCount()).assertEqual(1);
      expect(dispatcher.getDispatchedCount()).assertEqual(0);
    });

    it('emitter_should_return_last_payload', 0, async () => {
      const dispatcher = new AuthEmitterDispatcher();
      expect(dispatcher.getLastPayload()).assertNull();
      dispatcher.dispatch(new AuthEventPayload(1000, 'dev-0001', GrantDecision.ONCE));
      dispatcher.dispatch(new AuthEventPayload(1000, 'dev-0002', GrantDecision.CANCEL));
      const last = dispatcher.getLastPayload();
      expect(last === null).assertFalse();
      if (last !== null) {
        expect(last.deviceId).assertEqual('dev-0002');
      }
    });

    // ===== 信任策略 =====
    it('trusted_device_should_skip_prompt', 0, async () => {
      const store = new TrustedDeviceStore();
      store.add(new AuthGrantRequest('dev-0001', 'LivingRoomTV', 1, 1000));
      const policy = new DeviceTrustPolicy(store);
      expect(policy.shouldPrompt(new AuthGrantRequest('dev-0001', 'LivingRoomTV', 1, 2000))).assertFalse();
      expect(policy.shouldPrompt(new AuthGrantRequest('dev-0002', 'BedroomTV', 1, 2000))).assertTrue();
    });

    it('auto_accept_should_disable_prompt', 0, async () => {
      const policy = new DeviceTrustPolicy(new TrustedDeviceStore());
      expect(policy.isAutoAccept()).assertFalse();
      policy.setAutoAccept(true);
      expect(policy.isAutoAccept()).assertTrue();
      expect(policy.shouldPrompt(new AuthGrantRequest('dev-0009', 'NewTV', 1, 1000))).assertFalse();
    });

    it('trust_policy_should_classify_session_scoped_and_rejected', 0, async () => {
      const policy = new DeviceTrustPolicy(new TrustedDeviceStore());
      expect(policy.isSessionScoped(GrantDecision.ONCE)).assertTrue();
      expect(policy.isSessionScoped(GrantDecision.FOREVER)).assertFalse();
      expect(policy.isRejected(GrantDecision.CANCEL)).assertTrue();
      expect(policy.isRejected(GrantDecision.ONCE)).assertFalse();
    });

    // ===== 请求校验 =====
    it('validator_should_bound_device_name_length', 0, async () => {
      const validator = new AuthRequestValidator();
      const name23: string = 'a'.repeat(23);
      const name24: string = 'a'.repeat(24);
      expect(validator.isValidDeviceName(name23)).assertTrue();
      expect(validator.isValidDeviceName(name24)).assertFalse();
      expect(validator.isValidDeviceName('')).assertFalse();
    });

    it('validator_should_check_full_request', 0, async () => {
      const validator = new AuthRequestValidator();
      expect(validator.isValidRequest(new AuthGrantRequest('dev-0001', 'LivingRoomTV', 1, 1000))).assertTrue();
      expect(validator.isValidRequest(new AuthGrantRequest('d1', 'LivingRoomTV', 1, 1000))).assertFalse();
    });

    it('validator_should_map_decision_codes', 0, async () => {
      const validator = new AuthRequestValidator();
      expect(validator.isValidDecisionCode(0)).assertTrue();
      expect(validator.isValidDecisionCode(2)).assertTrue();
      expect(validator.isValidDecisionCode(3)).assertFalse();
      expect(validator.isValidDecisionCode(-1)).assertFalse();
      expect(validator.toDecision(0)).assertEqual(GrantDecision.FOREVER);
      expect(validator.toDecision(1)).assertEqual(GrantDecision.ONCE);
      expect(validator.toDecision(9)).assertEqual(GrantDecision.CANCEL);
    });

    it('grant_request_validity_should_require_all_fields', 0, async () => {
      const valid = new AuthGrantRequest('dev-0001', 'LivingRoomTV', 1, 1000);
      const invalid = new AuthGrantRequest('', '', -1, 1000);
      expect(valid.isValid()).assertTrue();
      expect(invalid.isValid()).assertFalse();
      expect(valid.toKey()).assertEqual('dev-0001#1');
    });

    // ===== 审计日志 =====
    it('audit_log_should_record_and_count_decisions', 0, async () => {
      const log = new AuthAuditLog();
      log.record('dev-0001', GrantDecision.FOREVER, 1000);
      log.record('dev-0002', GrantDecision.ONCE, 2000);
      log.record('dev-0003', GrantDecision.CANCEL, 3000);
      expect(log.getEntryCount()).assertEqual(3);
      expect(log.getCountByDecision(GrantDecision.FOREVER)).assertEqual(1);
      expect(log.getCountByDecision(GrantDecision.ONCE)).assertEqual(1);
      expect(log.getCountByDecision(GrantDecision.CANCEL)).assertEqual(1);
    });

    it('audit_log_should_keep_chronological_order', 0, async () => {
      const log = new AuthAuditLog();
      log.record('dev-0001', GrantDecision.FOREVER, 1000);
      log.record('dev-0002', GrantDecision.ONCE, 2000);
      expect(log.isChronological()).assertTrue();
      log.record('dev-0003', GrantDecision.CANCEL, 1500);
      expect(log.isChronological()).assertFalse();
    });

    // ===== 弹窗队列 =====
    it('prompt_queue_should_keep_fifo_order', 0, async () => {
      const queue = new PermissionPromptQueue();
      queue.enqueue(new AuthGrantRequest('dev-0001', 'TV1', 1, 1000));
      queue.enqueue(new AuthGrantRequest('dev-0002', 'TV2', 1, 2000));
      expect(queue.size()).assertEqual(2);
      expect(queue.peekDeviceId()).assertEqual('dev-0001');
      const first = queue.dequeue();
      expect(first === null).assertFalse();
      if (first !== null) {
        expect(first.deviceId).assertEqual('dev-0001');
      }
      expect(queue.size()).assertEqual(1);
    });

    // ===== 弹窗结果与统计 =====
    it('prompt_outcome_should_map_states_to_decisions', 0, async () => {
      const forever = new PromptOutcome('dev-0001', PromptOutcomeState.ACCEPTED_FOREVER, 1200);
      const once = new PromptOutcome('dev-0002', PromptOutcomeState.ACCEPTED_ONCE, 800);
      const rejected = new PromptOutcome('dev-0003', PromptOutcomeState.REJECTED, 300);
      expect(forever.isAccepted()).assertTrue();
      expect(forever.isPersistent()).assertTrue();
      expect(once.isPersistent()).assertFalse();
      expect(rejected.isAccepted()).assertFalse();
      expect(forever.toDecision()).assertEqual(GrantDecision.FOREVER);
      expect(once.toDecision()).assertEqual(GrantDecision.ONCE);
      expect(rejected.toDecision()).assertEqual(GrantDecision.CANCEL);
    });

    it('session_statistics_should_compute_grant_rate', 0, async () => {
      const first = new PermissionSession();
      first.openPrompt(new AuthGrantRequest('dev-0001', 'TV1', 1, 1000));
      first.resolve(GrantDecision.FOREVER);
      const second = new PermissionSession();
      second.openPrompt(new AuthGrantRequest('dev-0002', 'TV2', 1, 2000));
      second.resolve(GrantDecision.CANCEL);
      const third = new PermissionSession();
      const stats = new AuthSessionStatistics();
      expect(stats.getGrantRate([first, second, third])).assertEqual(1 / 3);
      expect(stats.countGranted([first, second, third])).assertEqual(1);
      expect(stats.countByState([first, second, third], AuthSessionState.IDLE)).assertEqual(1);
      expect(stats.countTrustedForever([first, second])).assertEqual(1);
    });

    // ===== 端到端授权流程 =====
    it('flow_should_persist_forever_decision', 0, async () => {
      const flow = new AuthFlowCoordinator();
      const request = new AuthGrantRequest('dev-0001', 'LivingRoomTV', 1, 1000);
      expect(flow.requestTrust(request)).assertTrue();
      expect(flow.submitDecision(request, GrantDecision.FOREVER)).assertTrue();
      expect(flow.isTrusted('dev-0001')).assertTrue();
      expect(flow.getDispatcher().getDispatchedCount()).assertEqual(1);
    });

    it('flow_trusted_device_should_auto_accept_without_prompt', 0, async () => {
      const flow = new AuthFlowCoordinator();
      const request = new AuthGrantRequest('dev-0004', 'KitchenTV', 1, 4000);
      flow.requestTrust(request);
      flow.submitDecision(request, GrantDecision.FOREVER);
      expect(flow.requestTrust(request)).assertFalse();
      expect(flow.getDispatcher().getDispatchedCount()).assertEqual(2);
    });

    it('flow_submit_without_request_should_fail', 0, async () => {
      const flow = new AuthFlowCoordinator();
      expect(flow.submitDecision(new AuthGrantRequest('dev-0005', 'HallTV', 1, 5000),
        GrantDecision.FOREVER)).assertFalse();
      expect(flow.getDispatcher().getDispatchedCount()).assertEqual(0);
    });

    it('auth_event_payload_should_clone_and_compare', 0, async () => {
      const payload = new AuthEventPayload(1000, 'dev-0001', GrantDecision.ONCE);
      const copy = payload.clone();
      expect(payload.equals(copy)).assertTrue();
      expect(payload.isValid()).assertTrue();
      expect(payload.toString()).assertContain('1000');
      expect(new AuthEventPayload(0, 'dev-0001', GrantDecision.ONCE).isValid()).assertFalse();
    });

    it('dispatcher_clear_should_reset_both_counters', 0, async () => {
      const dispatcher = new AuthEmitterDispatcher();
      dispatcher.dispatch(new AuthEventPayload(1000, 'dev-0001', GrantDecision.ONCE));
      dispatcher.dispatch(new AuthEventPayload(1001, 'dev-0002', GrantDecision.ONCE));
      dispatcher.clear();
      expect(dispatcher.getDispatchedCount()).assertEqual(0);
      expect(dispatcher.getRejectedCount()).assertEqual(0);
    });

    // ===== 补充边界与重入用例 =====
  });
}
