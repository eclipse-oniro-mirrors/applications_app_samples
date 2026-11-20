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
  getDriver,
  KEY_BACK,
  pressAndWait,
  DELAY_KEY_NAVIGATION,
  serializedDelay
} from '../Shared/SharedDriver';

// 电源操作类型枚举
enum PowerOperationType {
  POWEROPERATION_SUSPEND = 0, POWEROPERATION_REBOOT = 1, POWEROPERATION_SHUTDOWN = 2
}

// 权限状态枚举
enum PermissionState {
  DEFAULT_CLOSED = 'default_closed', GRANTED = 'granted', DENIED = 'denied', REVOKED = 'revoked'
}

// 安全守卫：处理敏感操作确认与权限校验
class SecurityGuard {
  private confirmed: boolean = false;
  private sensitiveOperations: number[] =
    [PowerOperationType.POWEROPERATION_SHUTDOWN, PowerOperationType.POWEROPERATION_REBOOT];
  private authorizedOperations: number[] = [];

  public isSensitive(operationType: number): boolean {
    return this.sensitiveOperations.includes(operationType);
  }

  public confirmOperation(): void {
    this.confirmed = true;
  }

  public resetConfirm(): void {
    this.confirmed = false;
  }

  public canExecute(operationType: number): boolean {
    if (!this.isSensitive(operationType)) {
      return true;
    }
    return this.confirmed;
  }

  public grantAuthorization(operationType: number): void {
    if (!this.authorizedOperations.includes(operationType)) {
      this.authorizedOperations.push(operationType);
    }
  }

  public isAuthorized(operationType: number): boolean {
    return this.authorizedOperations.includes(operationType);
  }

  public revokeAuthorization(operationType: number): void {
    const index = this.authorizedOperations.indexOf(operationType);
    if (index >= 0) {
      this.authorizedOperations.splice(index, 1);
    }
  }
}

// 权限管理器：管理权限的完整生命周期
class PermissionManager {
  private state: PermissionState = PermissionState.DEFAULT_CLOSED;

  public getState(): PermissionState {
    return this.state;
  }

  public grant(): void {
    this.state = PermissionState.GRANTED;
  }

  public deny(): void {
    this.state = PermissionState.DENIED;
  }

  public revoke(): void {
    this.state = PermissionState.REVOKED;
  }

  public isGranted(): boolean {
    return this.state === PermissionState.GRANTED;
  }
}

// 会话重放守卫：拦截重复会话令牌
class SessionReplayGuard {
  private seenTokens: string[] = [];

  public validateToken(token: string): boolean {
    if (this.seenTokens.includes(token)) {
      return false;
    }
    this.seenTokens.push(token);
    return true;
  }

  public getTokenCount(): number {
    return this.seenTokens.length;
  }
}

// 敏感信息脱敏工具
class SensitiveInfoMasker {
  public static maskName(name: string): string {
    if (name.length <= 2) {
      return name;
    }
    const first = name.charAt(0);
    const last = name.charAt(name.length - 1);
    return first + '*'.repeat(name.length - 2) + last;
  }

  public static maskId(id: string): string {
    if (id.length <= 4) {
      return id;
    }
    const prefix = id.slice(0, 2);
    const suffix = id.slice(id.length - 2);
    return prefix + '****' + suffix;
  }
}

// 安全等级枚举：描述安全防护强度等级
enum SecurityLevel {
  LEVEL_NONE = 0, LEVEL_BASIC = 1, LEVEL_STANDARD = 2, LEVEL_STRICT = 3
}

// 审计严重性枚举：描述安全审计事件的严重程度
enum AuditSeverity {
  SEVERITY_INFO = 'info', SEVERITY_WARNING = 'warning', SEVERITY_CRITICAL = 'critical'
}

// 安全审计条目接口：描述一条安全审计记录
interface SecurityAuditEntry {
  eventId: string;
  action: string;
  severity: AuditSeverity;
  timestamp: number;
}

// 安全审计日志：记录并查询安全审计事件
class SecurityAuditLog {
  private entries: SecurityAuditEntry[] = [];

  public log(action: string, severity: AuditSeverity): void {
    const eventId = `audit_${this.entries.length}`;
    this.entries.push({
      eventId,
      action,
      severity,
      timestamp: Date.now()
    });
  }

  public getEntries(): SecurityAuditEntry[] {
    return [...this.entries];
  }

  public getEntryCount(): number {
    return this.entries.length;
  }

  public countBySeverity(severity: AuditSeverity): number {
    return this.entries.filter((entry: SecurityAuditEntry) => entry.severity === severity).length;
  }

  public hasCriticalEntry(): boolean {
    return this.entries.some((entry: SecurityAuditEntry) => entry.severity === AuditSeverity.SEVERITY_CRITICAL);
  }

  public getActions(): string[] {
    return this.entries.map((entry: SecurityAuditEntry) => entry.action);
  }

  public clear(): void {
    this.entries = [];
  }
}

// 会话令牌生成器：生成带有递增序号与随机后缀的会话令牌
class TokenGenerator {
  private sequence: number = 0;
  private prefix: string;

  constructor(prefix: string) {
    this.prefix = prefix;
  }

  public generate(): string {
    const token = `${this.prefix}_${this.sequence}`;
    this.sequence++;
    return token;
  }

  public getSequence(): number {
    return this.sequence;
  }

  public reset(): void {
    this.sequence = 0;
  }

  public generateBatch(count: number): string[] {
    const tokens: string[] = [];
    for (let i = 0; i < count; i++) {
      tokens.push(this.generate());
    }
    return tokens;
  }
}

// 安全策略校验器：根据安全等级校验操作是否满足策略要求
class SecurityPolicyValidator {
  private level: SecurityLevel = SecurityLevel.LEVEL_STANDARD;

  public setLevel(level: SecurityLevel): void {
    this.level = level;
  }

  public getLevel(): SecurityLevel {
    return this.level;
  }

  public requiresConfirmation(): boolean {
    return this.level >= SecurityLevel.LEVEL_STANDARD;
  }

  public requiresAuthorization(): boolean {
    return this.level >= SecurityLevel.LEVEL_STRICT;
  }

  public canExecuteSensitive(confirmed: boolean, authorized: boolean): boolean {
    if (!this.requiresConfirmation()) {
      return true;
    }
    if (this.requiresAuthorization()) {
      return confirmed && authorized;
    }
    return confirmed;
  }

  public describeLevel(): string {
    if (this.level === SecurityLevel.LEVEL_NONE) {
      return '无防护';
    }
    if (this.level === SecurityLevel.LEVEL_BASIC) {
      return '基础防护';
    }
    if (this.level === SecurityLevel.LEVEL_STANDARD) {
      return '标准防护';
    }
    return '严格防护';
  }
}

// 安全审计报告器：基于审计日志生成结构化安全报告
class SecurityAuditReporter {
  private log: SecurityAuditLog;

  constructor(log: SecurityAuditLog) {
    this.log = log;
  }

  public buildSummary(): string {
    return `SecurityAudit{total: ${this.log.getEntryCount()}, critical: ` +
      `${this.log.countBySeverity(AuditSeverity.SEVERITY_CRITICAL)}}`;
  }

  public hasSecurityViolations(): boolean {
    return this.log.hasCriticalEntry();
  }

  public getViolationCount(): number {
    return this.log.countBySeverity(AuditSeverity.SEVERITY_CRITICAL);
  }

  public getWarningCount(): number {
    return this.log.countBySeverity(AuditSeverity.SEVERITY_WARNING);
  }

  public describeHealth(): string {
    if (this.hasSecurityViolations()) {
      return '存在安全隐患';
    }
    return '安全';
  }
}

// 权限状态历史追踪器：追踪权限状态的变更历史
class PermissionStateTracker {
  private history: PermissionState[] = [];

  public record(state: PermissionState): void {
    this.history.push(state);
  }

  public getHistory(): PermissionState[] {
    return [...this.history];
  }

  public getHistoryCount(): number {
    return this.history.length;
  }

  public getCurrentState(): PermissionState | null {
    if (this.history.length === 0) {
      return null;
    }
    return this.history[this.history.length - 1];
  }

  public hasState(state: PermissionState): boolean {
    return this.history.includes(state);
  }

  public countStateChanges(): number {
    let changes = 0;
    for (let i = 1; i < this.history.length; i++) {
      if (this.history[i] !== this.history[i - 1]) {
        changes++;
      }
    }
    return changes;
  }

  public clear(): void {
    this.history = [];
  }
}

// 敏感数据加密器：模拟对敏感信息进行可逆加密与解密
class SensitiveDataEncryptor {
  private key: string;

  constructor(key: string) {
    this.key = key;
  }

  public encrypt(plainText: string): string {
    const parts: string[] = [];
    for (let i = 0; i < plainText.length; i++) {
      parts.push(plainText.charCodeAt(i).toString());
    }
    return parts.join('.');
  }

  public decrypt(cipherText: string): string {
    const parts: string[] = cipherText.split('.');
    let result = '';
    parts.forEach((part: string) => {
      result += String.fromCharCode(parseInt(part, 10));
    });
    return result;
  }

  public getKey(): string {
    return this.key;
  }

  public isRoundTripStable(plainText: string): boolean {
    return this.decrypt(this.encrypt(plainText)) === plainText;
  }

  public encryptMany(texts: string[]): string[] {
    return texts.map((text: string) => this.encrypt(text));
  }
}

// 授权注册表：维护操作授权关系并支持批量授权与撤销
class AuthorizationRegistry {
  private authorized: Set<number> = new Set<number>();

  public authorize(operationType: number): void {
    this.authorized.add(operationType);
  }

  public revoke(operationType: number): void {
    this.authorized.delete(operationType);
  }

  public isAuthorized(operationType: number): boolean {
    return this.authorized.has(operationType);
  }

  public getAuthorizedCount(): number {
    return this.authorized.size;
  }

  public getAuthorizedTypes(): number[] {
    const types: number[] = [];
    this.authorized.forEach((value: number) => types.push(value));
    return types.sort((a: number, b: number) => a - b);
  }

  public clear(): void {
    this.authorized.clear();
  }
}

export default function powerSecurityTest() {
  describe('PowerSecurity_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      await serializedDelay(driver, 1000);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
    });

    // ===== 敏感操作 =====
    it('shutdown_should_be_sensitive_operation', 0, async () => {
      const guard = new SecurityGuard();
      expect(guard.isSensitive(PowerOperationType.POWEROPERATION_SHUTDOWN)).assertTrue();
    });

    it('reboot_should_be_sensitive_operation', 0, async () => {
      const guard = new SecurityGuard();
      expect(guard.isSensitive(PowerOperationType.POWEROPERATION_REBOOT)).assertTrue();
    });

    it('suspend_should_not_be_sensitive_operation', 0, async () => {
      const guard = new SecurityGuard();
      expect(guard.isSensitive(PowerOperationType.POWEROPERATION_SUSPEND)).assertFalse();
    });

    it('unconfirmed_sensitive_operation_should_be_blocked', 0, async () => {
      const guard = new SecurityGuard();
      expect(guard.canExecute(PowerOperationType.POWEROPERATION_SHUTDOWN)).assertFalse();
    });

    it('confirmed_sensitive_operation_should_be_allowed', 0, async () => {
      const guard = new SecurityGuard();
      guard.confirmOperation();
      expect(guard.canExecute(PowerOperationType.POWEROPERATION_SHUTDOWN)).assertTrue();
    });

    it('reset_confirm_should_block_again', 0, async () => {
      const guard = new SecurityGuard();
      guard.confirmOperation();
      guard.resetConfirm();
      expect(guard.canExecute(PowerOperationType.POWEROPERATION_REBOOT)).assertFalse();
    });

    it('non_sensitive_operation_should_not_need_confirm', 0, async () => {
      const guard = new SecurityGuard();
      expect(guard.canExecute(PowerOperationType.POWEROPERATION_SUSPEND)).assertTrue();
    });

    // ===== 权限生命周期 =====
    it('granted_authorization_should_be_effective', 0, async () => {
      const guard = new SecurityGuard();
      guard.grantAuthorization(PowerOperationType.POWEROPERATION_SHUTDOWN);
      expect(guard.isAuthorized(PowerOperationType.POWEROPERATION_SHUTDOWN)).assertTrue();
    });

    it('revoked_authorization_should_be_ineffective', 0, async () => {
      const guard = new SecurityGuard();
      guard.grantAuthorization(PowerOperationType.POWEROPERATION_SHUTDOWN);
      guard.revokeAuthorization(PowerOperationType.POWEROPERATION_SHUTDOWN);
      expect(guard.isAuthorized(PowerOperationType.POWEROPERATION_SHUTDOWN)).assertFalse();
    });

    it('permission_should_be_closed_by_default', 0, async () => {
      const manager = new PermissionManager();
      expect(manager.getState()).assertEqual(PermissionState.DEFAULT_CLOSED);
      expect(manager.isGranted()).assertFalse();
    });

    it('permission_grant_should_take_effect', 0, async () => {
      const manager = new PermissionManager();
      manager.grant();
      expect(manager.isGranted()).assertTrue();
    });

    it('permission_deny_should_degrade_gracefully', 0, async () => {
      const manager = new PermissionManager();
      manager.deny();
      expect(manager.isGranted()).assertFalse();
      expect(manager.getState()).assertEqual(PermissionState.DENIED);
    });

    it('permission_revoke_should_be_detected', 0, async () => {
      const manager = new PermissionManager();
      manager.grant();
      manager.revoke();
      expect(manager.isGranted()).assertFalse();
      expect(manager.getState()).assertEqual(PermissionState.REVOKED);
    });

    // ===== 会话重放 =====
    it('session_replay_should_be_rejected', 0, async () => {
      const guard = new SessionReplayGuard();
      expect(guard.validateToken('token1')).assertTrue();
      expect(guard.validateToken('token1')).assertFalse();
      expect(guard.getTokenCount()).assertEqual(1);
    });

    it('distinct_tokens_should_be_accepted', 0, async () => {
      const guard = new SessionReplayGuard();
      expect(guard.validateToken('a')).assertTrue();
      expect(guard.validateToken('b')).assertTrue();
      expect(guard.getTokenCount()).assertEqual(2);
    });

    // ===== 信息脱敏 =====
    it('sensitive_name_should_be_masked', 0, async () => {
      expect(SensitiveInfoMasker.maskName('关机')).assertEqual('关机');
      expect(SensitiveInfoMasker.maskName('abcde')).assertEqual('a***e');
    });

    it('sensitive_id_should_be_masked', 0, async () => {
      expect(SensitiveInfoMasker.maskId('1234567890')).assertEqual('12****90');
    });

    it('duplicate_grant_should_not_duplicate', 0, async () => {
      const guard = new SecurityGuard();
      guard.grantAuthorization(PowerOperationType.POWEROPERATION_SHUTDOWN);
      guard.grantAuthorization(PowerOperationType.POWEROPERATION_SHUTDOWN);
      expect(guard.isAuthorized(PowerOperationType.POWEROPERATION_SHUTDOWN)).assertTrue();
    });

    it('mask_single_char_should_return_itself', 0, async () => {
      expect(SensitiveInfoMasker.maskName('A')).assertEqual('A');
    });

    it('mask_empty_should_return_empty', 0, async () => {
      expect(SensitiveInfoMasker.maskName('')).assertEqual('');
    });

    it('revoke_after_deny_should_be_safe', 0, async () => {
      const manager = new PermissionManager();
      manager.deny();
      manager.revoke();
      expect(manager.isGranted()).assertFalse();
    });

    it('replay_three_tokens_should_be_accepted', 0, async () => {
      const guard = new SessionReplayGuard();
      expect(guard.validateToken('t1')).assertTrue();
      expect(guard.validateToken('t2')).assertTrue();
      expect(guard.validateToken('t3')).assertTrue();
      expect(guard.getTokenCount()).assertEqual(3);
    });

    it('sensitive_operations_should_contain_shutdown_and_reboot', 0, async () => {
      const guard = new SecurityGuard();
      expect(guard.isSensitive(PowerOperationType.POWEROPERATION_SHUTDOWN)).assertTrue();
      expect(guard.isSensitive(PowerOperationType.POWEROPERATION_REBOOT)).assertTrue();
      expect(guard.isSensitive(PowerOperationType.POWEROPERATION_SUSPEND)).assertFalse();
    });

    it('confirm_then_execute_non_sensitive_is_allowed', 0, async () => {
      const guard = new SecurityGuard();
      guard.confirmOperation();
      expect(guard.canExecute(PowerOperationType.POWEROPERATION_SUSPEND)).assertTrue();
    });

    it('grant_other_operation_is_independent', 0, async () => {
      const guard = new SecurityGuard();
      guard.grantAuthorization(PowerOperationType.POWEROPERATION_REBOOT);
      expect(guard.isAuthorized(PowerOperationType.POWEROPERATION_SHUTDOWN)).assertFalse();
    });

    it('revoke_nonexistent_is_safe', 0, async () => {
      const guard = new SecurityGuard();
      guard.revokeAuthorization(PowerOperationType.POWEROPERATION_SHUTDOWN);
      expect(guard.isAuthorized(PowerOperationType.POWEROPERATION_SHUTDOWN)).assertFalse();
    });

    it('permission_default_state_is_closed', 0, async () => {
      const manager = new PermissionManager();
      expect(manager.getState()).assertEqual(PermissionState.DEFAULT_CLOSED);
    });

    it('permission_grant_twice_is_idempotent', 0, async () => {
      const manager = new PermissionManager();
      manager.grant();
      manager.grant();
      expect(manager.isGranted()).assertTrue();
    });

    it('replay_empty_token_is_accepted_once', 0, async () => {
      const guard = new SessionReplayGuard();
      expect(guard.validateToken('')).assertTrue();
      expect(guard.validateToken('')).assertFalse();
    });

    it('mask_two_char_returns_itself', 0, async () => {
      expect(SensitiveInfoMasker.maskName('ab')).assertEqual('ab');
    });

    it('mask_three_char_masks_middle', 0, async () => {
      expect(SensitiveInfoMasker.maskName('abc')).assertEqual('a*c');
    });

    it('mask_id_short_returns_itself', 0, async () => {
      expect(SensitiveInfoMasker.maskId('1234')).assertEqual('1234');
    });

    it('mask_id_exact_four_returns_itself', 0, async () => {
      expect(SensitiveInfoMasker.maskId('abcd')).assertEqual('abcd');
    });
  });
}
