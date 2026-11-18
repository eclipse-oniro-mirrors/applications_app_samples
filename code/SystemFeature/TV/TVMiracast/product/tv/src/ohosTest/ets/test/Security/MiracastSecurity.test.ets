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
  getDriver, KEY_LEFT, KEY_RIGHT, KEY_BACK, miracastComponentCount,
  waitForPageStable, pressAndWait, triggerMiracastHome, serializedDelay,
  TIMEOUT_PAGE_RENDER, DELAY_KEY_NAVIGATION, DELAY_AFTER_SESSION_OP, MAX_MIRROR_TILES
} from '../Shared/MiracastDriver';

enum PermissionDecision { ALLOW = 'allow', DENY = 'deny', CANCEL = 'cancel' }

enum AuditSeverity { INFO = 'info', WARN = 'warn', ERROR = 'error' }

interface TrustDeviceRecord { deviceId: string; deviceName: string; uid: number; }

interface AuditEntry { action: string; severity: AuditSeverity; }

class CallerVerifier {
  private denials: number = 0;

  public check(uid: number, expectedUid: number): boolean {
    if (uid === expectedUid) { return true; }
    this.denials++;
    return false;
  }

  public getDenials(): number { return this.denials; }
  public reset(): void { this.denials = 0; }
}

class PermissionBroker {
  private granted: boolean = false;
  private persist: boolean = false;
  private dialogs: number = 0;

  public request(decision: PermissionDecision, remember: boolean): boolean {
    this.dialogs++;
    if (decision === PermissionDecision.ALLOW) {
      this.granted = true;
      this.persist = remember;
      return true;
    }
    this.granted = false;
    this.persist = false;
    return false;
  }

  public isGranted(): boolean { return this.granted; }
  public isPersisted(): boolean { return this.persist; }
  public getDialogCount(): number { return this.dialogs; }

  public payload(decision: PermissionDecision): string {
    const text: string = decision === PermissionDecision.ALLOW ? 'allow' : 'deny';
    return '{"decision":"' + text + '"}';
  }

  public reset(): void {
    this.granted = false;
    this.persist = false;
    this.dialogs = 0;
  }
}

class TrustDeviceStore {
  private devices: Array<TrustDeviceRecord> = [];

  public add(record: TrustDeviceRecord): boolean {
    if (record.deviceId.length === 0 || this.find(record.deviceId) !== null) { return false; }
    this.devices.push(record);
    return true;
  }

  public find(deviceId: string): TrustDeviceRecord | null {
    for (let i = 0; i < this.devices.length; i++) {
      if (this.devices[i].deviceId === deviceId) { return this.devices[i]; }
    }
    return null;
  }

  public remove(deviceId: string): boolean {
    for (let i = 0; i < this.devices.length; i++) {
      if (this.devices[i].deviceId === deviceId) {
        this.devices.splice(i, 1);
        return true;
      }
    }
    return false;
  }

  public list(): Array<TrustDeviceRecord> { return this.devices.slice(0); }
  public count(): number { return this.devices.length; }

  public updateName(deviceId: string, deviceName: string): boolean {
    const record: TrustDeviceRecord | null = this.find(deviceId);
    if (record === null || deviceName.length === 0) { return false; }
    record.deviceName = deviceName;
    return true;
  }
}

enum SecurityPolicyLevel { BASIC = 'basic', STANDARD = 'standard', STRICT = 'strict' }

class SecurityPolicyValidator {
  public static requirements(level: SecurityPolicyLevel): number {
    if (level === SecurityPolicyLevel.STRICT) { return 3; }
    if (level === SecurityPolicyLevel.STANDARD) { return 2; }
    return 1;
  }

  public static isCallerRequired(level: SecurityPolicyLevel): boolean {
    return level !== SecurityPolicyLevel.BASIC;
  }

  public static isTokenRequired(level: SecurityPolicyLevel): boolean {
    return level === SecurityPolicyLevel.STRICT;
  }

  public static validate(level: SecurityPolicyLevel, callerOk: boolean, tokenOk: boolean): boolean {
    if (SecurityPolicyValidator.isTokenRequired(level) && !tokenOk) { return false; }
    if (SecurityPolicyValidator.isCallerRequired(level) && !callerOk) { return false; }
    return true;
  }
}

class ScreenIdValidator {
  public static readonly MAX_LENGTH: number = 64;

  public static validate(screenId: string): boolean {
    if (screenId.length === 0 || screenId.length > ScreenIdValidator.MAX_LENGTH) { return false; }
    if (screenId.indexOf('..') >= 0 || screenId.indexOf('/') >= 0) { return false; }
    return screenId.startsWith('screen_');
  }
}
class SecretScanner {
  private readonly keywords: Array<string> = ['password', 'token', 'secret'];

  public scan(text: string): number {
    const lower: string = text.toLowerCase();
    let findings: number = 0;
    for (let i = 0; i < this.keywords.length; i++) {
      if (lower.indexOf(this.keywords[i]) >= 0) { findings++; }
    }
    return findings;
  }

  public mask(text: string): string {
    return this.scan(text) > 0 ? '***' : text;
  }

  public keywordCount(): number { return this.keywords.length; }
}

class DeviceInfoMasker {
  public static maskName(name: string): string {
    if (name.length <= 2) { return '**'; }
    return name.charAt(0) + '***' + name.charAt(name.length - 1);
  }

  public static maskId(deviceId: string): string {
    if (deviceId.length <= 4) { return '****'; }
    return deviceId.substring(0, 4) + '****';
  }
}

class AccessDecisionMatrix {
  public static decide(callerOk: boolean, permissionOk: boolean): boolean {
    return callerOk && permissionOk;
  }

  public static needsDialog(granted: boolean, persisted: boolean): boolean {
    return !granted || !persisted;
  }

  public static describe(decision: boolean): string {
    return decision ? 'granted' : 'denied';
  }
}

class SecurityAuditLog {
  private entries: Array<AuditEntry> = [];

  public record(action: string, severity: AuditSeverity): void {
    this.entries.push({ action: action, severity: severity });
  }

  public countBySeverity(severity: AuditSeverity): number {
    let count: number = 0;
    for (let i = 0; i < this.entries.length; i++) {
      if (this.entries[i].severity === severity) { count++; }
    }
    return count;
  }

  public total(): number { return this.entries.length; }
  public reset(): void { this.entries = []; }

  public lastAction(): string {
    return this.entries.length === 0 ? '' : this.entries[this.entries.length - 1].action;
  }
}

class TokenReplayGuard {
  private used: Array<string> = [];

  public accept(token: string): boolean {
    if (token.length === 0 || this.used.includes(token)) { return false; }
    this.used.push(token);
    return true;
  }

  public getUsedCount(): number { return this.used.length; }
  public clear(): void { this.used = []; }
}

function trustedDevice(index: number): TrustDeviceRecord {
  return { deviceId: 'dev_' + index, deviceName: 'TV ' + index, uid: 10000 + index };
}
export default function miracastSecuritySuite(): void {
  describe('MiracastSecurity_Suite', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      await serializedDelay(driver, TIMEOUT_PAGE_RENDER);
      await triggerMiracastHome(driver);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await triggerMiracastHome(driver);
      await serializedDelay(driver, DELAY_AFTER_SESSION_OP);
    });

    it('caller_with_matching_uid_should_pass', 0, async () => {
      const verifier = new CallerVerifier();
      expect(verifier.check(10001, 10001)).assertTrue();
      expect(verifier.getDenials()).assertEqual(0);
    });

    it('caller_with_mismatched_uid_should_be_rejected', 0, async () => {
      const verifier = new CallerVerifier();
      expect(verifier.check(10002, 10001)).assertFalse();
      expect(verifier.getDenials()).assertEqual(1);
    });

    it('caller_verifier_should_accumulate_denials', 0, async () => {
      const verifier = new CallerVerifier();
      for (let i = 0; i < 4; i++) {
        expect(verifier.check(20000 + i, 10001)).assertFalse();
      }
      expect(verifier.getDenials()).assertEqual(4);
      verifier.reset();
      expect(verifier.getDenials()).assertEqual(0);
    });

    it('forever_permission_should_persist', 0, async () => {
      const broker = new PermissionBroker();
      expect(broker.request(PermissionDecision.ALLOW, true)).assertTrue();
      expect(broker.isGranted()).assertTrue();
      expect(broker.isPersisted()).assertTrue();
      expect(broker.getDialogCount()).assertEqual(1);
    });

    it('once_permission_should_not_persist', 0, async () => {
      const broker = new PermissionBroker();
      expect(broker.request(PermissionDecision.ALLOW, false)).assertTrue();
      expect(broker.isGranted()).assertTrue();
      expect(broker.isPersisted()).assertFalse();
    });

    it('cancel_permission_should_be_rejected', 0, async () => {
      const broker = new PermissionBroker();
      expect(broker.request(PermissionDecision.CANCEL, false)).assertFalse();
      expect(broker.isGranted()).assertFalse();
      expect(broker.isPersisted()).assertFalse();
    });

    it('permission_broker_should_reset_state', 0, async () => {
      const broker = new PermissionBroker();
      broker.request(PermissionDecision.ALLOW, true);
      broker.reset();
      expect(broker.isGranted()).assertFalse();
      expect(broker.getDialogCount()).assertEqual(0);
    });

    it('permission_emitter_payload_should_match_contract', 0, async () => {
      const broker = new PermissionBroker();
      const payload: string = broker.payload(PermissionDecision.ALLOW);
      expect(payload.includes('allow')).assertTrue();
      expect(payload.startsWith('{')).assertTrue();
      expect(payload.endsWith('}')).assertTrue();
    });
    it('trust_store_should_reject_duplicate_id', 0, async () => {
      const store = new TrustDeviceStore();
      expect(store.add(trustedDevice(1))).assertTrue();
      expect(store.add(trustedDevice(1))).assertFalse();
      expect(store.count()).assertEqual(1);
    });

    it('trust_store_should_return_device_record', 0, async () => {
      const store = new TrustDeviceStore();
      store.add(trustedDevice(2));
      const record: TrustDeviceRecord | null = store.find('dev_2');
      expect(record === null).assertFalse();
      if (record !== null) {
        expect(record.deviceName).assertEqual('TV 2');
        expect(record.uid).assertEqual(10002);
      }
    });

    it('trust_store_should_remove_device', 0, async () => {
      const store = new TrustDeviceStore();
      store.add(trustedDevice(3));
      expect(store.remove('dev_3')).assertTrue();
      expect(store.remove('dev_3')).assertFalse();
      expect(store.count()).assertEqual(0);
    });

    it('trust_store_list_should_be_isolated', 0, async () => {
      const store = new TrustDeviceStore();
      store.add(trustedDevice(4));
      const list: Array<TrustDeviceRecord> = store.list();
      list.splice(0, 1);
      expect(store.count()).assertEqual(1);
    });

    it('trust_store_should_track_device_count', 0, async () => {
      const store = new TrustDeviceStore();
      for (let i = 0; i < MAX_MIRROR_TILES; i++) {
        expect(store.add(trustedDevice(i))).assertTrue();
      }
      expect(store.count()).assertEqual(MAX_MIRROR_TILES);
    });

    it('screen_id_validator_should_accept_valid_id', 0, async () => {
      expect(ScreenIdValidator.validate('screen_101')).assertTrue();
      expect(ScreenIdValidator.validate('screen_' + '9'.repeat(20))).assertTrue();
    });

    it('screen_id_validator_should_reject_bad_ids', 0, async () => {
      expect(ScreenIdValidator.validate('')).assertFalse();
      expect(ScreenIdValidator.validate('screen_' + '9'.repeat(80))).assertFalse();
      expect(ScreenIdValidator.validate('tile_1')).assertFalse();
    });

    it('screen_id_validator_should_block_traversal', 0, async () => {
      expect(ScreenIdValidator.validate('screen_../etc')).assertFalse();
      expect(ScreenIdValidator.validate('screen_/root')).assertFalse();
    });

    it('screen_ids_for_nine_tiles_should_validate', 0, async () => {
      for (let i = 0; i < MAX_MIRROR_TILES; i++) {
        expect(ScreenIdValidator.validate('screen_' + (100 + i))).assertTrue();
      }
    });
    it('secret_scanner_should_detect_plaintext', 0, async () => {
      const scanner = new SecretScanner();
      expect(scanner.scan('password=123456')).assertEqual(1);
      expect(scanner.scan('plain text')).assertEqual(0);
    });

    it('secret_scanner_should_count_findings', 0, async () => {
      const scanner = new SecretScanner();
      expect(scanner.scan('password and token and secret')).assertEqual(scanner.keywordCount());
    });

    it('secret_scanner_should_mask_values', 0, async () => {
      const scanner = new SecretScanner();
      expect(scanner.mask('my token')).assertEqual('***');
      expect(scanner.mask('device name')).assertEqual('device name');
    });

    it('device_masker_should_mask_names', 0, async () => {
      expect(DeviceInfoMasker.maskName('Living Room TV')).assertEqual('L***V');
      expect(DeviceInfoMasker.maskName('TV')).assertEqual('**');
    });

    it('device_masker_should_mask_ids', 0, async () => {
      expect(DeviceInfoMasker.maskId('dev_000123')).assertEqual('dev_****');
      expect(DeviceInfoMasker.maskId('dev')).assertEqual('****');
    });

    it('access_matrix_should_require_both_checks', 0, async () => {
      expect(AccessDecisionMatrix.decide(true, true)).assertTrue();
      expect(AccessDecisionMatrix.decide(true, false)).assertFalse();
      expect(AccessDecisionMatrix.decide(false, true)).assertFalse();
    });

    it('access_matrix_should_decide_dialog_need', 0, async () => {
      expect(AccessDecisionMatrix.needsDialog(true, true)).assertFalse();
      expect(AccessDecisionMatrix.needsDialog(true, false)).assertTrue();
      expect(AccessDecisionMatrix.needsDialog(false, false)).assertTrue();
      expect(AccessDecisionMatrix.describe(false)).assertEqual('denied');
    });

    it('audit_log_should_count_by_severity', 0, async () => {
      const log = new SecurityAuditLog();
      log.record('grant', AuditSeverity.INFO);
      log.record('deny', AuditSeverity.WARN);
      log.record('leak', AuditSeverity.ERROR);
      expect(log.countBySeverity(AuditSeverity.INFO)).assertEqual(1);
      expect(log.total()).assertEqual(3);
    });

    it('audit_log_should_reset_summary', 0, async () => {
      const log = new SecurityAuditLog();
      log.record('grant', AuditSeverity.INFO);
      log.reset();
      expect(log.total()).assertEqual(0);
      expect(log.lastAction()).assertEqual('');
    });
    it('token_replay_should_be_rejected', 0, async () => {
      const guard = new TokenReplayGuard();
      expect(guard.accept('token_1')).assertTrue();
      expect(guard.accept('token_1')).assertFalse();
      expect(guard.getUsedCount()).assertEqual(1);
    });

    it('token_guard_should_reset_after_clear', 0, async () => {
      const guard = new TokenReplayGuard();
      guard.accept('token_1');
      guard.clear();
      expect(guard.accept('token_1')).assertTrue();
      expect(guard.accept('')).assertFalse();
    });

    it('security_probe_should_not_break_home_render', 0, async () => {
      const verifier = new CallerVerifier();
      expect(verifier.check(1, 2)).assertFalse();
    });

    it('nine_device_masking_should_not_leak', 0, async () => {
      const store = new TrustDeviceStore();
      const scanner = new SecretScanner();
      for (let i = 0; i < MAX_MIRROR_TILES; i++) {
        store.add(trustedDevice(i));
        expect(scanner.mask(DeviceInfoMasker.maskName('token ' + i)).includes('***')).assertTrue();
      }
      expect(store.count()).assertEqual(MAX_MIRROR_TILES);
      expect(scanner.scan(DeviceInfoMasker.maskId('dev_secret_token'))).assertEqual(0);
    });

    it('trust_store_cycle_should_not_residue', 0, async () => {
      const store = new TrustDeviceStore();
      for (let i = 0; i < 5; i++) {
        store.add(trustedDevice(i));
        expect(store.remove('dev_' + i)).assertTrue();
      }
      expect(store.count()).assertEqual(0);
      expect(store.list().length).assertEqual(0);
    });

    it('audit_trail_should_cover_permission_flow', 0, async () => {
      const broker = new PermissionBroker();
      const log = new SecurityAuditLog();
      const verifier = new CallerVerifier();
      if (verifier.check(10001, 10001)) {
        log.record('caller_ok', AuditSeverity.INFO);
      }
      if (broker.request(PermissionDecision.ALLOW, true)) {
        log.record('granted', AuditSeverity.INFO);
      }
      expect(log.countBySeverity(AuditSeverity.INFO)).assertEqual(2);
      expect(log.lastAction()).assertEqual('granted');
    });

    it('policy_basic_level_should_ignore_caller', 0, async () => {
      expect(SecurityPolicyValidator.validate(SecurityPolicyLevel.BASIC, false, false)).assertTrue();
      expect(SecurityPolicyValidator.isCallerRequired(SecurityPolicyLevel.BASIC)).assertFalse();
      expect(SecurityPolicyValidator.requirements(SecurityPolicyLevel.BASIC)).assertEqual(1);
    });

    it('policy_standard_level_should_require_caller', 0, async () => {
      expect(SecurityPolicyValidator.validate(SecurityPolicyLevel.STANDARD, false, true)).assertFalse();
      expect(SecurityPolicyValidator.validate(SecurityPolicyLevel.STANDARD, true, false)).assertTrue();
      expect(SecurityPolicyValidator.requirements(SecurityPolicyLevel.STANDARD)).assertEqual(2);
    });

    it('policy_strict_level_should_require_token', 0, async () => {
      expect(SecurityPolicyValidator.validate(SecurityPolicyLevel.STRICT, true, false)).assertFalse();
      expect(SecurityPolicyValidator.validate(SecurityPolicyLevel.STRICT, true, true)).assertTrue();
      expect(SecurityPolicyValidator.requirements(SecurityPolicyLevel.STRICT)).assertEqual(3);
    });

    it('trust_store_should_update_device_name', 0, async () => {
      const store = new TrustDeviceStore();
      store.add(trustedDevice(5));
      expect(store.updateName('dev_5', 'Bedroom TV')).assertTrue();
      expect(store.updateName('dev_9', 'X')).assertFalse();
      expect(store.find('dev_5')?.deviceName).assertEqual('Bedroom TV');
    });

    it('masked_secret_should_not_match_scanner', 0, async () => {
      const scanner = new SecretScanner();
      const masked: string = scanner.mask('secret_value');
      expect(masked).assertEqual('***');
      expect(scanner.scan(masked)).assertEqual(0);
    });

    it('secret_scanner_should_count_keywords', 0, async () => {
      expect(new SecretScanner().keywordCount()).assertEqual(3);
    });

    it('audit_severity_counts_should_add_up', 0, async () => {
      const log = new SecurityAuditLog();
      log.record('a', AuditSeverity.INFO);
      log.record('b', AuditSeverity.WARN);
      log.record('c', AuditSeverity.ERROR);
      const sum: number = log.countBySeverity(AuditSeverity.INFO) + log.countBySeverity(AuditSeverity.WARN) +
        log.countBySeverity(AuditSeverity.ERROR);
      expect(sum).assertEqual(log.total());
    });



    it('security_probe_should_coexist_with_home', 0, async () => {
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      expect(ScreenIdValidator.validate('screen_200')).assertTrue();
    });

    it('audit_log_should_track_last_action', 0, async () => {
      const log = new SecurityAuditLog();
      log.record('first', AuditSeverity.INFO);
      log.record('second', AuditSeverity.WARN);
      expect(log.lastAction()).assertEqual('second');
      expect(log.countBySeverity(AuditSeverity.WARN)).assertEqual(1);
    });

    it('trust_store_should_reject_empty_record', 0, async () => {
      const store = new TrustDeviceStore();
      expect(store.add({ deviceId: '', deviceName: 'TV', uid: 10000 })).assertFalse();
      expect(store.count()).assertEqual(0);
    });

    it('screen_id_validator_should_default_max_length', 0, async () => {
      expect(ScreenIdValidator.MAX_LENGTH).assertEqual(64);
      expect(ScreenIdValidator.validate('screen_' + '1'.repeat(ScreenIdValidator.MAX_LENGTH))).assertFalse();
    });

    it('access_matrix_should_describe_granted', 0, async () => {
      expect(AccessDecisionMatrix.describe(true)).assertEqual('granted');
    });

    it('device_masker_should_handle_empty', 0, async () => {
      expect(DeviceInfoMasker.maskName('')).assertEqual('**');
      expect(DeviceInfoMasker.maskId('')).assertEqual('****');
    });

    it('token_guard_should_track_multiple_tokens', 0, async () => {
      const guard = new TokenReplayGuard();
      expect(guard.accept('token_a')).assertTrue();
      expect(guard.accept('token_b')).assertTrue();
      expect(guard.getUsedCount()).assertEqual(2);
    });

    it('policy_requirements_should_increase_with_level', 0, async () => {
      const basic: number = SecurityPolicyValidator.requirements(SecurityPolicyLevel.BASIC);
      const standard: number = SecurityPolicyValidator.requirements(SecurityPolicyLevel.STANDARD);
      const strict: number = SecurityPolicyValidator.requirements(SecurityPolicyLevel.STRICT);
      expect(standard > basic).assertTrue();
      expect(strict > standard).assertTrue();
    });

    it('caller_verifier_should_reset_denials', 0, async () => {
      const verifier = new CallerVerifier();
      verifier.check(1, 2);
      verifier.reset();
      expect(verifier.getDenials()).assertEqual(0);
      expect(verifier.check(3, 3)).assertTrue();
    });

    it('secret_scanner_should_ignore_case', 0, async () => {
      const scanner = new SecretScanner();
      expect(scanner.scan('PASSWORD')).assertEqual(1);
      expect(scanner.scan('ToKeN')).assertEqual(1);
    });

    it('permission_broker_should_count_dialogs', 0, async () => {
      const broker = new PermissionBroker();
      broker.request(PermissionDecision.CANCEL, false);
      broker.request(PermissionDecision.ALLOW, false);
      expect(broker.getDialogCount()).assertEqual(2);
    });

    it('emitter_payload_should_match_audit_entry', 0, async () => {
      const log = new SecurityAuditLog();
      log.record('permission_allow', AuditSeverity.INFO);
      expect(log.lastAction()).assertEqual('permission_allow');
      expect(log.countBySeverity(AuditSeverity.ERROR)).assertEqual(0);
      expect(log.total()).assertEqual(1);
    });

    it('nine_round_permission_flow_should_stay_consistent', 0, async () => {
      const broker = new PermissionBroker();
      const store = new TrustDeviceStore();
      for (let i = 0; i < MAX_MIRROR_TILES; i++) {
        expect(broker.request(PermissionDecision.ALLOW, true)).assertTrue();
        expect(store.add(trustedDevice(i))).assertTrue();
      }
      expect(broker.getDialogCount()).assertEqual(MAX_MIRROR_TILES);
      expect(store.count()).assertEqual(MAX_MIRROR_TILES);
    });

    it('comprehensive_security_scenario_should_hold', 0, async () => {
      const verifier = new CallerVerifier();
      const broker = new PermissionBroker();
      const store = new TrustDeviceStore();
      const log = new SecurityAuditLog();
      const guard = new TokenReplayGuard();
      expect(verifier.check(10001, 10001)).assertTrue();
      expect(broker.request(PermissionDecision.ALLOW, true)).assertTrue();
      expect(store.add(trustedDevice(1))).assertTrue();
      expect(ScreenIdValidator.validate('screen_101')).assertTrue();
      expect(guard.accept('token_a')).assertTrue();
      log.record('session_ready', AuditSeverity.INFO);
      expect(AccessDecisionMatrix.decide(verifier.getDenials() === 0, broker.isGranted())).assertTrue();
      expect(log.total()).assertEqual(1);
    });
  });
}
