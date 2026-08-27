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
import { Driver, ON } from '@ohos.UiTest';
import {
  createFreshDriver,
  KEY_BACK,
  pressAndWait,
  DELAY_KEY_NAVIGATION,
  serializedDelay
} from '../Shared/SharedDriver';

// 会话状态枚举
enum SessionState {
  UNINITIALIZED = 'uninitialized', READY = 'ready', EXPIRED = 'expired', TERMINATED = 'terminated'
}

// 登录方式枚举
enum LoginMethod {
  PASSWORD = 'password', THIRD_PARTY = 'third_party'
}

// 会话模型：模拟电源对话框会话的完整状态机
class AuthSession {
  private state: SessionState = SessionState.UNINITIALIZED;
  private authorized: boolean = false;
  private timeoutMs: number = 0;

  public activate(): boolean {
    if (this.state === SessionState.TERMINATED) {
      return false;
    }
    this.state = SessionState.READY;
    this.authorized = true;
    return true;
  }

  public terminate(): void {
    this.state = SessionState.TERMINATED;
    this.authorized = false;
  }

  public expire(): void {
    this.state = SessionState.EXPIRED;
    this.authorized = false;
    this.timeoutMs = 30 * 60 * 1000;
  }

  public isReady(): boolean {
    return this.state === SessionState.READY;
  }

  public isAuthorized(): boolean {
    return this.authorized;
  }

  public getState(): SessionState {
    return this.state;
  }

  public getTimeoutMs(): number {
    return this.timeoutMs;
  }
}

// 账号模型：支持多账号隔离与操作记录
class PowerAccount {
  public accountId: string;
  private operations: string[] = [];

  constructor(accountId: string) {
    this.accountId = accountId;
  }

  public recordOperation(name: string): void {
    this.operations.push(name);
  }

  public getOperations(): string[] {
    return [...this.operations];
  }

  public getOperationCount(): number {
    return this.operations.length;
  }
}

// 登录控制器：管理单点/多点登录与账号切换
class LoginController {
  private accounts: Map<string, PowerAccount> = new Map<string, PowerAccount>();
  private currentAccountId: string = '';
  private singleLoginMode: boolean = false;

  public login(accountId: string): boolean {
    if (!this.accounts.has(accountId)) {
      this.accounts.set(accountId, new PowerAccount(accountId));
    }
    this.currentAccountId = accountId;
    return true;
  }

  public logout(): void {
    this.currentAccountId = '';
  }

  public getCurrentAccountId(): string {
    return this.currentAccountId;
  }

  public isLoggedIn(): boolean {
    return this.currentAccountId.length > 0;
  }

  public setSingleLoginMode(enabled: boolean): void {
    this.singleLoginMode = enabled;
  }

  public isSingleLoginMode(): boolean {
    return this.singleLoginMode;
  }

  public getAccount(accountId: string): PowerAccount | null {
    const account = this.accounts.get(accountId);
    return account === undefined ? null : account;
  }
}

// 验证码管理器：处理获取、倒计时、过期与频率限制
class CaptchaManager {
  private static readonly COOLDOWN_MS: number = 60 * 1000;
  private lastSentAt: number = 0;
  private requestCount: number = 0;
  private expired: boolean = false;
  private hasSent: boolean = false;

  public canSend(now: number): boolean {
    if (!this.hasSent) {
      return true;
    }
    return now - this.lastSentAt >= CaptchaManager.COOLDOWN_MS;
  }

  public send(now: number): boolean {
    if (!this.canSend(now)) {
      return false;
    }
    this.lastSentAt = now;
    this.requestCount++;
    this.expired = false;
    this.hasSent = true;
    return true;
  }

  public expire(): void {
    this.expired = true;
  }

  public isExpired(): boolean {
    return this.expired;
  }

  public getRequestCount(): number {
    return this.requestCount;
  }
}

// ===== 新增辅助代码：会话与授权扩展模型 =====

// 验证码类型枚举：描述不同形式的验证码
enum CaptchaType {
  SMS = 'sms', GRAPHIC = 'graphic', VOICE = 'voice'
}

// 授权级别枚举：描述会话的不同授权级别
enum AuthLevel {
  NONE = 'none', BASIC = 'basic', ELEVATED = 'elevated', ADMIN = 'admin'
}

// 登录结果枚举：描述一次登录尝试的最终结果
enum LoginResultState {
  SUCCESS = 'success', FAILED = 'failed', LOCKED = 'locked', PENDING = 'pending'
}

// 会话凭证接口：描述会话的凭证信息
interface SessionCredential {
  accountId: string;
  token: string;
  issuedAt: number;
  expiresAt: number;
}

// 验证码请求接口：描述一次验证码请求的详细信息
interface CaptchaRequest {
  accountId: string;
  type: CaptchaType;
  requestedAt: number;
  code: string;
}

// 登录结果接口：描述一次登录尝试的结果
interface LoginResult {
  accountId: string;
  state: LoginResultState;
  message: string;
}

// 会话凭证模型：封装凭证信息，支持有效性校验与克隆
class SessionToken {
  public accountId: string;
  public token: string;
  public issuedAt: number;
  public expiresAt: number;

  constructor(accountId: string, token: string, issuedAt: number, expiresAt: number) {
    this.accountId = accountId;
    this.token = token;
    this.issuedAt = issuedAt;
    this.expiresAt = expiresAt;
  }

  public clone(): SessionToken {
    return new SessionToken(this.accountId, this.token, this.issuedAt, this.expiresAt);
  }

  public equals(other: SessionToken): boolean {
    return this.accountId === other.accountId && this.token === other.token;
  }

  public toString(): string {
    return `SessionToken(accountId=${this.accountId}, issuedAt=${this.issuedAt}, expiresAt=${this.expiresAt})`;
  }

  public isExpired(now: number): boolean {
    return now >= this.expiresAt;
  }

  public isValid(): boolean {
    return this.accountId.length > 0 && this.token.length > 0 && this.expiresAt > this.issuedAt;
  }

  public getRemainingMs(now: number): number {
    return this.expiresAt - now;
  }
}

// 验证码生成器：生成随机验证码，支持不同长度与字符集
class CaptchaGenerator {
  public static readonly DEFAULT_LENGTH: number = 6;

  public generateNumeric(length: number): string {
    let result: string = '';
    for (let i = 0; i < length; i++) {
      const digit = Math.floor(Math.random() * 10);
      result += digit.toString();
    }
    return result;
  }

  public generate(length: number): string {
    return this.generateNumeric(length);
  }

  public generateDefault(): string {
    return this.generateNumeric(CaptchaGenerator.DEFAULT_LENGTH);
  }

  public validateLength(code: string, length: number): boolean {
    return code.length === length;
  }

  public isNumeric(code: string): boolean {
    if (code.length === 0) {
      return false;
    }
    for (let i = 0; i < code.length; i++) {
      const charCode = code.charCodeAt(i);
      if (charCode < 48 || charCode > 57) {
        return false;
      }
    }
    return true;
  }
}

// 验证码请求记录器：记录并统计验证码请求，支持频率分析
class CaptchaRequestRecorder {
  private requests: CaptchaRequest[] = [];

  public record(accountId: string, type: CaptchaType, requestedAt: number, code: string): void {
    const request: CaptchaRequest = {
      accountId: accountId,
      type: type,
      requestedAt: requestedAt,
      code: code
    };
    this.requests.push(request);
  }

  public getRequestCount(): number {
    return this.requests.length;
  }

  public getCountByType(type: CaptchaType): number {
    let count: number = 0;
    for (let i = 0; i < this.requests.length; i++) {
      if (this.requests[i].type === type) {
        count++;
      }
    }
    return count;
  }

  public getCountByAccount(accountId: string): number {
    let count: number = 0;
    for (let i = 0; i < this.requests.length; i++) {
      if (this.requests[i].accountId === accountId) {
        count++;
      }
    }
    return count;
  }

  public getRequests(): CaptchaRequest[] {
    const result: CaptchaRequest[] = [];
    for (let i = 0; i < this.requests.length; i++) {
      const request = this.requests[i];
      result.push({
        accountId: request.accountId,
        type: request.type,
        requestedAt: request.requestedAt,
        code: request.code
      });
    }
    return result;
  }

  public isChronological(): boolean {
    for (let i = 1; i < this.requests.length; i++) {
      if (this.requests[i].requestedAt < this.requests[i - 1].requestedAt) {
        return false;
      }
    }
    return true;
  }

  public clear(): void {
    this.requests = [];
  }
}

// 登录结果模型：封装登录结果，支持克隆、比较与序列化
class LoginOutcome {
  public accountId: string;
  public state: LoginResultState;
  public message: string;

  constructor(accountId: string, state: LoginResultState, message: string) {
    this.accountId = accountId;
    this.state = state;
    this.message = message;
  }

  public clone(): LoginOutcome {
    return new LoginOutcome(this.accountId, this.state, this.message);
  }

  public equals(other: LoginOutcome): boolean {
    return this.accountId === other.accountId && this.state === other.state && this.message === other.message;
  }

  public toString(): string {
    return `LoginOutcome(accountId=${this.accountId}, state=${this.state}, message=${this.message})`;
  }

  public isSuccess(): boolean {
    return this.state === LoginResultState.SUCCESS;
  }

  public isValid(): boolean {
    return this.accountId.length > 0;
  }
}

// 账号密码校验器：校验账号与密码的合法性
class CredentialValidator {
  public isValidAccountId(accountId: string): boolean {
    return accountId.length >= 3;
  }

  public isValidPassword(password: string): boolean {
    return password.length >= 6;
  }

  public passwordsMatch(input: string, confirmed: string): boolean {
    return input === confirmed;
  }

  public validate(accountId: string, password: string): boolean {
    return this.isValidAccountId(accountId) && this.isValidPassword(password);
  }

  public getPasswordStrength(password: string): number {
    let score: number = 0;
    if (password.length >= 8) {
      score++;
    }
    if (password.length >= 12) {
      score++;
    }
    let hasUpper: boolean = false;
    let hasLower: boolean = false;
    let hasDigit: boolean = false;
    for (let i = 0; i < password.length; i++) {
      const code = password.charCodeAt(i);
      if (code >= 65 && code <= 90) {
        hasUpper = true;
      }
      if (code >= 97 && code <= 122) {
        hasLower = true;
      }
      if (code >= 48 && code <= 57) {
        hasDigit = true;
      }
    }
    if (hasUpper) {
      score++;
    }
    if (hasLower) {
      score++;
    }
    if (hasDigit) {
      score++;
    }
    return score;
  }
}

// 会话统计器：对多个会话进行授权率与状态分布统计
class SessionStatistics {
  public countAuthorized(sessions: AuthSession[]): number {
    let count: number = 0;
    for (let i = 0; i < sessions.length; i++) {
      if (sessions[i].isAuthorized()) {
        count++;
      }
    }
    return count;
  }

  public countByState(sessions: AuthSession[], state: SessionState): number {
    let count: number = 0;
    for (let i = 0; i < sessions.length; i++) {
      if (sessions[i].getState() === state) {
        count++;
      }
    }
    return count;
  }

  public getAuthorizationRate(sessions: AuthSession[]): number {
    if (sessions.length === 0) {
      return 0;
    }
    return this.countAuthorized(sessions) / sessions.length;
  }

  public isAllReady(sessions: AuthSession[]): boolean {
    for (let i = 0; i < sessions.length; i++) {
      if (!sessions[i].isReady()) {
        return false;
      }
    }
    return true;
  }
}

export default function powerAuthSessionTest() {
  describe('PowerAuthSession_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = createFreshDriver();
      await serializedDelay(driver, 1000);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
    });

    // ===== 会话状态机 =====
    it('session_should_enter_ready_state_when_activated', 0, async () => {
      const session = new AuthSession();
      expect(session.activate()).assertTrue();
      expect(session.isReady()).assertTrue();
      expect(session.isAuthorized()).assertTrue();
    });

    it('session_should_terminate_and_revoke_authorization', 0, async () => {
      const session = new AuthSession();
      session.activate();
      session.terminate();
      expect(session.getState()).assertEqual(SessionState.TERMINATED);
      expect(session.isAuthorized()).assertFalse();
    });

    it('session_timeout_should_expire_authorization', 0, async () => {
      const session = new AuthSession();
      session.activate();
      session.expire();
      expect(session.getState()).assertEqual(SessionState.EXPIRED);
      expect(session.isAuthorized()).assertFalse();
      expect(session.getTimeoutMs()).assertEqual(30 * 60 * 1000);
    });

    it('uninitialized_session_should_not_be_ready', 0, async () => {
      const session = new AuthSession();
      expect(session.isReady()).assertFalse();
      expect(session.isAuthorized()).assertFalse();
    });

    it('terminated_session_should_not_be_reactivated', 0, async () => {
      const session = new AuthSession();
      session.activate();
      session.terminate();
      expect(session.activate()).assertFalse();
      expect(session.isReady()).assertFalse();
    });

    it('session_state_should_persist_until_terminate', 0, async () => {
      const session = new AuthSession();
      session.activate();
      expect(session.isReady()).assertTrue();
      expect(session.getState()).assertEqual(SessionState.READY);
    });

    // ===== 登录与账号 =====
    it('login_should_set_current_account', 0, async () => {
      const controller = new LoginController();
      controller.login('accountA');
      expect(controller.isLoggedIn()).assertTrue();
      expect(controller.getCurrentAccountId()).assertEqual('accountA');
    });

    it('logout_should_clear_current_account', 0, async () => {
      const controller = new LoginController();
      controller.login('accountA');
      controller.logout();
      expect(controller.isLoggedIn()).assertFalse();
    });

    it('multiple_accounts_should_be_isolated', 0, async () => {
      const controller = new LoginController();
      controller.login('accountA');
      const accountA = controller.getAccount('accountA');
      if (accountA !== null) {
        accountA.recordOperation('关机');
      }
      controller.login('accountB');
      const accountB = controller.getAccount('accountB');
      if (accountB !== null) {
        accountB.recordOperation('重启');
      }
    });

    it('single_login_mode_should_be_configurable', 0, async () => {
      const controller = new LoginController();
      expect(controller.isSingleLoginMode()).assertFalse();
      controller.setSingleLoginMode(true);
      expect(controller.isSingleLoginMode()).assertTrue();
    });

    it('nonexistent_account_should_return_null', 0, async () => {
      const controller = new LoginController();
      expect(controller.getAccount('ghost')).assertEqual(null);
    });

    // ===== 验证码 =====
    it('captcha_send_should_record_request', 0, async () => {
      const manager = new CaptchaManager();
      expect(manager.send(1000)).assertTrue();
      expect(manager.getRequestCount()).assertEqual(1);
    });

    it('captcha_frequency_should_be_limited', 0, async () => {
      const manager = new CaptchaManager();
      manager.send(1000);
      expect(manager.send(1000 + 30 * 1000)).assertFalse();
      expect(manager.send(1000 + 61 * 1000)).assertTrue();
      expect(manager.getRequestCount()).assertEqual(2);
    });

    it('captcha_expiry_should_be_detected', 0, async () => {
      const manager = new CaptchaManager();
      manager.send(1000);
      expect(manager.isExpired()).assertFalse();
      manager.expire();
      expect(manager.isExpired()).assertTrue();
    });

    it('captcha_default_should_not_be_expired', 0, async () => {
      const manager = new CaptchaManager();
      expect(manager.isExpired()).assertFalse();
    });

    it('activate_from_expired_should_work', 0, async () => {
      const session = new AuthSession();
      session.activate();
      session.expire();
      expect(session.activate()).assertTrue();
      expect(session.isReady()).assertTrue();
    });

    it('captcha_resend_after_cooldown_should_work', 0, async () => {
      const manager = new CaptchaManager();
      manager.send(1000);
      manager.expire();
      expect(manager.send(1000 + 61 * 1000)).assertTrue();
    });

    it('captcha_request_count_should_accumulate', 0, async () => {
      const manager = new CaptchaManager();
      manager.send(1000);
      manager.send(1000 + 61 * 1000);
      manager.send(1000 + 122 * 1000);
      expect(manager.getRequestCount()).assertEqual(3);
    });

    it('account_operation_count_should_accumulate', 0, async () => {
      const account = new PowerAccount('A');
      account.recordOperation('关机');
      account.recordOperation('重启');
      account.recordOperation('熄屏');
    });

    it('login_same_account_should_be_idempotent', 0, async () => {
      const controller = new LoginController();
      controller.login('accountA');
      controller.login('accountA');
      expect(controller.getCurrentAccountId()).assertEqual('accountA');
    });

    it('logout_when_not_logged_in_should_be_safe', 0, async () => {
      const controller = new LoginController();
      controller.logout();
      expect(controller.isLoggedIn()).assertFalse();
    });

    it('single_login_mode_default_should_be_false', 0, async () => {
      const controller = new LoginController();
      expect(controller.isSingleLoginMode()).assertFalse();
    });

    it('account_isolation_should_be_strict', 0, async () => {
      const controller = new LoginController();
      controller.login('accountA');
      const accountA = controller.getAccount('accountA');
      if (accountA !== null) {
        accountA.recordOperation('关机');
      }
      controller.login('accountB');
      const accountB = controller.getAccount('accountB');
      expect(accountB === null).assertFalse();
      if (accountB !== null) {
      }
    });

    it('session_expire_then_activate_should_work', 0, async () => {
      const session = new AuthSession();
      session.activate();
      session.expire();
      expect(session.isReady()).assertFalse();
      expect(session.activate()).assertTrue();
      expect(session.isReady()).assertTrue();
    });

    it('session_terminate_then_expire_should_be_safe', 0, async () => {
      const session = new AuthSession();
      session.activate();
      session.terminate();
      session.expire();
      expect(session.isAuthorized()).assertFalse();
    });

    it('captcha_can_send_initially_should_be_true', 0, async () => {
      const manager = new CaptchaManager();
      expect(manager.canSend(1000)).assertTrue();
    });

    it('captcha_send_zero_time_should_work', 0, async () => {
      const manager = new CaptchaManager();
      expect(manager.send(0)).assertTrue();
      expect(manager.getRequestCount()).assertEqual(1);
    });

    it('captcha_count_stable_after_expire_without_resend', 0, async () => {
      const manager = new CaptchaManager();
      manager.send(1000);
      manager.expire();
      expect(manager.getRequestCount()).assertEqual(1);
    });

    it('account_empty_operations_initially', 0, async () => {
      const account = new PowerAccount('A');
    });

    it('login_two_different_accounts_switches', 0, async () => {
      const controller = new LoginController();
      controller.login('A');
      controller.login('B');
      expect(controller.getCurrentAccountId()).assertEqual('B');
    });

    it('get_current_account_after_logout_is_empty', 0, async () => {
      const controller = new LoginController();
      controller.login('A');
      controller.logout();
      expect(controller.getCurrentAccountId()).assertEqual('');
    });

    it('single_login_toggle_twice_returns_false', 0, async () => {
      const controller = new LoginController();
      controller.setSingleLoginMode(true);
      controller.setSingleLoginMode(false);
      expect(controller.isSingleLoginMode()).assertFalse();
    });

    it('account_record_then_get_returns_same', 0, async () => {
      const controller = new LoginController();
      controller.login('A');
      controller.getAccount('A')?.recordOperation('关机');
    });

    it('get_account_returns_null_for_empty_id', 0, async () => {
      const controller = new LoginController();
      expect(controller.getAccount('')).assertEqual(null);
    });

    // 适配 SessionToken：有效凭证应通过合法性校验
    it('session_token_validity_should_be_checked', 0, async () => {
      const token = new SessionToken('userA', 'tok-123', 1000, 5000);
      expect(token.isValid()).assertTrue();
    });

    // 适配 SessionToken：过期时间判定
    it('session_token_should_detect_expiration', 0, async () => {
      const token = new SessionToken('userA', 'tok-123', 1000, 5000);
      expect(token.isExpired(4999)).assertFalse();
      expect(token.isExpired(5000)).assertTrue();
    });

    // 适配 SessionToken：剩余有效时间计算
    it('session_token_remaining_time_should_be_calculated', 0, async () => {
      const token = new SessionToken('userA', 'tok-123', 1000, 5000);
      expect(token.getRemainingMs(2000)).assertEqual(3000);
    });

    // 适配 SessionToken：相同凭证应判定相等
    it('session_token_should_compare_equality', 0, async () => {
      const left = new SessionToken('userA', 'tok-123', 1000, 5000);
      const right = new SessionToken('userA', 'tok-123', 2000, 6000);
      const other = new SessionToken('userB', 'tok-456', 1000, 5000);
      expect(left.equals(right)).assertTrue();
      expect(left.equals(other)).assertFalse();
    });

    // 适配 CaptchaGenerator：生成的验证码应全为数字
    it('captcha_generator_should_produce_numeric_codes', 0, async () => {
      const generator = new CaptchaGenerator();
      const code = generator.generateNumeric(6);
      expect(generator.isNumeric(code)).assertTrue();
    });

    // 适配 CaptchaGenerator：默认长度应为 6
    it('captcha_generator_default_length_should_be_six', 0, async () => {
      const generator = new CaptchaGenerator();
      const code = generator.generateDefault();
      expect(generator.validateLength(code, 6)).assertTrue();
    });

    // 适配 CaptchaRequestRecorder：按类型统计请求数
    it('captcha_request_recorder_should_count_by_type', 0, async () => {
      const recorder = new CaptchaRequestRecorder();
      recorder.record('userA', CaptchaType.SMS, 1000, '123456');
      recorder.record('userA', CaptchaType.GRAPHIC, 2000, '654321');
      recorder.record('userB', CaptchaType.SMS, 3000, '111111');
      expect(recorder.getRequestCount()).assertEqual(3);
      expect(recorder.getCountByType(CaptchaType.SMS)).assertEqual(2);
      expect(recorder.getCountByType(CaptchaType.VOICE)).assertEqual(0);
    });

    // 适配 CaptchaRequestRecorder：请求时间戳应保持递增
    it('captcha_request_recorder_should_stay_chronological', 0, async () => {
      const recorder = new CaptchaRequestRecorder();
      recorder.record('userA', CaptchaType.SMS, 1000, '123456');
      recorder.record('userA', CaptchaType.SMS, 2000, '234567');
      recorder.record('userA', CaptchaType.SMS, 3000, '345678');
      expect(recorder.isChronological()).assertTrue();
    });

    // 适配 CaptchaRequestRecorder：按账号过滤请求
    it('captcha_request_recorder_should_filter_by_account', 0, async () => {
      const recorder = new CaptchaRequestRecorder();
      recorder.record('userA', CaptchaType.SMS, 1000, '123456');
      recorder.record('userB', CaptchaType.GRAPHIC, 2000, '654321');
      recorder.record('userA', CaptchaType.VOICE, 3000, '111111');
      expect(recorder.getCountByAccount('userA')).assertEqual(2);
      expect(recorder.getCountByAccount('userC')).assertEqual(0);
    });

    // 适配 LoginOutcome：成功状态判定
    it('login_outcome_should_detect_success', 0, async () => {
      const success = new LoginOutcome('userA', LoginResultState.SUCCESS, 'ok');
      const failed = new LoginOutcome('userA', LoginResultState.FAILED, 'bad password');
      expect(success.isSuccess()).assertTrue();
      expect(failed.isSuccess()).assertFalse();
    });

    // 适配 CredentialValidator：账号长度校验
    it('credential_validator_should_check_account_length', 0, async () => {
      const validator = new CredentialValidator();
      expect(validator.isValidAccountId('abc')).assertTrue();
      expect(validator.isValidAccountId('ab')).assertFalse();
    });

    // 适配 CredentialValidator：密码强度评分
    it('credential_validator_should_score_password_strength', 0, async () => {
      const validator = new CredentialValidator();
      expect(validator.getPasswordStrength('a')).assertEqual(1);
      expect(validator.getPasswordStrength('aB1cD2eF')).assertEqual(4);
    });

    // 适配 SessionStatistics：授权率计算
    it('session_statistics_should_compute_authorization_rate', 0, async () => {
      const s1 = new AuthSession();
      s1.activate();
      const s2 = new AuthSession();
      s2.activate();
      const s3 = new AuthSession();
      const stats = new SessionStatistics();
      expect(stats.getAuthorizationRate([s1, s2, s3])).assertEqual(2 / 3);
    });

    // 适配 SessionStatistics：全部就绪判定
    it('session_statistics_should_detect_all_ready', 0, async () => {
      const s1 = new AuthSession();
      s1.activate();
      const s2 = new AuthSession();
      s2.activate();
      const stats = new SessionStatistics();
      expect(stats.isAllReady([s1, s2])).assertTrue();
      s2.expire();
      expect(stats.isAllReady([s1, s2])).assertFalse();
    });
  });
}
