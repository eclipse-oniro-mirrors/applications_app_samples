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

import { describe, it, expect } from '@ohos/hypium';

/**
 * Permissions consumed by the TV screen recorder sample.
 * The names follow the declarations owned by ScreenRecorderAbility and SRManager.
 */
enum RecorderPermission {
  CAPTURE_SCREEN = 'ohos.permission.CAPTURE_SCREEN',
  EXEMPT_CAPTURE_SCREEN_AUTHORIZE = 'ohos.permission.EXEMPT_CAPTURE_SCREEN_AUTHORIZE',
  SYSTEM_FLOAT_WINDOW = 'ohos.permission.SYSTEM_FLOAT_WINDOW',
  READ_IMAGEVIDEO = 'ohos.permission.READ_IMAGEVIDEO',
  WRITE_IMAGEVIDEO = 'ohos.permission.WRITE_IMAGEVIDEO',
  MEDIA_LOCATION = 'ohos.permission.MEDIA_LOCATION',
  MICROPHONE = 'ohos.permission.MICROPHONE'
}

/** Grant state of a single permission entry. */
enum GrantState {
  DEFAULT_CLOSED = 'default_closed',
  GRANTED = 'granted',
  DENIED = 'denied',
  REVOKED = 'revoked'
}

/** Severity of one audit action. */
enum AuditSeverity {
  INFO = 'info',
  WARNING = 'warning',
  CRITICAL = 'critical'
}

/** Security hardening level applied to a capture request. */
enum SecurityLevel {
  NONE = 0,
  BASIC = 1,
  STANDARD = 2,
  STRICT = 3
}

/** Result of one capture-request evaluation. */
interface CaptureDecision {
  allowed: boolean;
  reason: string;
  missing: string[];
}

/** One audit record of the recorder. */
interface AuditEntry {
  eventId: string;
  action: string;
  severity: AuditSeverity;
  timestamp: number;
}

/** Validation result of the exported service extension entry. */
interface EntryValidation {
  accepted: boolean;
  command: string;
  reason: string;
}

/**
 * Permission ledger of the recorder.
 * Every permission has an explicit state so that deny and revoke can be
 * distinguished, which matters because a revoked permission must not be
 * silently treated as a first-time request.
 */
class PermissionLedger {
  private states: Map<string, GrantState> = new Map<string, GrantState>();

  public stateOf(permission: RecorderPermission): GrantState {
    const state: GrantState | undefined = this.states.get(permission);
    return state === undefined ? GrantState.DEFAULT_CLOSED : state;
  }

  public grant(permission: RecorderPermission): void {
    this.states.set(permission, GrantState.GRANTED);
  }

  public deny(permission: RecorderPermission): void {
    this.states.set(permission, GrantState.DENIED);
  }

  public revoke(permission: RecorderPermission): void {
    this.states.set(permission, GrantState.REVOKED);
  }

  public isGranted(permission: RecorderPermission): boolean {
    return this.stateOf(permission) === GrantState.GRANTED;
  }

  public grantedCount(): number {
    let count = 0;
    this.states.forEach((state: GrantState) => {
      if (state === GrantState.GRANTED) {
        count++;
      }
    });
    return count;
  }

  public grantedPermissions(): RecorderPermission[] {
    const result: RecorderPermission[] = [];
    const all: RecorderPermission[] = [
      RecorderPermission.CAPTURE_SCREEN,
      RecorderPermission.EXEMPT_CAPTURE_SCREEN_AUTHORIZE,
      RecorderPermission.SYSTEM_FLOAT_WINDOW,
      RecorderPermission.READ_IMAGEVIDEO,
      RecorderPermission.WRITE_IMAGEVIDEO,
      RecorderPermission.MEDIA_LOCATION,
      RecorderPermission.MICROPHONE
    ];
    for (let index = 0; index < all.length; index++) {
      if (this.isGranted(all[index])) {
        result.push(all[index]);
      }
    }
    return result;
  }

  public clear(): void {
    this.states.clear();
  }
}

/**
 * Guard that decides whether a recording may be started.
 * The recorder needs the capture permission plus the media write permission;
 * the exempt capture permission is an accepted substitute for the capture
 * permission because system applications may hold it instead.
 */
class CaptureRequestGuard {
  private required: RecorderPermission[] = [
    RecorderPermission.CAPTURE_SCREEN,
    RecorderPermission.WRITE_IMAGEVIDEO
  ];
  private rejectedAttempts: number = 0;

  public requiredPermissions(): RecorderPermission[] {
    const result: RecorderPermission[] = [];
    for (let index = 0; index < this.required.length; index++) {
      result.push(this.required[index]);
    }
    return result;
  }

  private hasCapture(ledger: PermissionLedger): boolean {
    return ledger.isGranted(RecorderPermission.CAPTURE_SCREEN) ||
      ledger.isGranted(RecorderPermission.EXEMPT_CAPTURE_SCREEN_AUTHORIZE);
  }

  public evaluate(ledger: PermissionLedger): CaptureDecision {
    const missing: string[] = [];
    if (!this.hasCapture(ledger)) {
      missing.push(RecorderPermission.CAPTURE_SCREEN);
    }
    if (!ledger.isGranted(RecorderPermission.WRITE_IMAGEVIDEO)) {
      missing.push(RecorderPermission.WRITE_IMAGEVIDEO);
    }
    if (!ledger.isGranted(RecorderPermission.SYSTEM_FLOAT_WINDOW)) {
      missing.push(RecorderPermission.SYSTEM_FLOAT_WINDOW);
    }
    const allowed = missing.length === 0;
    if (!allowed) {
      this.rejectedAttempts++;
    }
    const decision: CaptureDecision = {
      allowed: allowed,
      reason: allowed ? 'authorized' : 'permission_missing',
      missing: missing
    };
    return decision;
  }

  public getRejectedAttempts(): number {
    return this.rejectedAttempts;
  }

  public resetRejectedAttempts(): void {
    this.rejectedAttempts = 0;
  }
}

/**
 * Validator of the exported ScreenRecorderAbility entry.
 * The service is exported so that the remote control shell can reach it, which
 * makes the entry point a security boundary: only system callers may drive it
 * and only startId 1 may start a capture session.
 */
class ServiceEntryValidator {
  private exported: boolean = true;
  private systemCaller: boolean = true;

  public setExported(exported: boolean): void {
    this.exported = exported;
  }

  public setSystemCaller(systemCaller: boolean): void {
    this.systemCaller = systemCaller;
  }

  public validate(askedStartId: number): EntryValidation {
    if (!this.exported) {
      const rejected: EntryValidation = {
        accepted: false, command: 'none', reason: 'not_exported'
      };
      return rejected;
    }
    if (!this.systemCaller) {
      const rejected: EntryValidation = {
        accepted: false, command: 'none', reason: 'not_system_caller'
      };
      return rejected;
    }
    if (askedStartId === 1) {
      const start: EntryValidation = {
        accepted: true, command: 'start', reason: 'start_id_one'
      };
      return start;
    }
    if (askedStartId >= 2) {
      const stop: EntryValidation = {
        accepted: true, command: 'stop', reason: 'stop_request'
      };
      return stop;
    }
    const rejected: EntryValidation = {
      accepted: false, command: 'none', reason: 'invalid_start_id'
    };
    return rejected;
  }
}

/**
 * Privacy helper of the persisted asset URI.
 * SRManager opens the photo asset and hands `fd://<fd>` to SRApi. The file
 * descriptor URI must never be replaced by a real storage path in logs or in
 * the tip window.
 */
class AssetUriPrivacy {
  public static readonly FD_PREFIX: string = 'fd://';

  public static buildFdUri(fd: number): string {
    return `${AssetUriPrivacy.FD_PREFIX}${fd}`;
  }

  public static isFdUri(uri: string): boolean {
    if (!uri.startsWith(AssetUriPrivacy.FD_PREFIX)) {
      return false;
    }
    const body = uri.substring(AssetUriPrivacy.FD_PREFIX.length);
    if (body.length === 0) {
      return false;
    }
    for (let index = 0; index < body.length; index++) {
      const code = body.charCodeAt(index);
      if (code < 48 || code > 57) {
        return false;
      }
    }
    return true;
  }

  public static leaksStoragePath(text: string): boolean {
    const lowered = text.toLowerCase();
    return lowered.includes('/data/') || lowered.includes('storage/') ||
      lowered.includes('file://') || lowered.includes('/mnt/');
  }

  public static maskUri(uri: string): string {
    if (!AssetUriPrivacy.isFdUri(uri)) {
      return 'fd://****';
    }
    const body = uri.substring(AssetUriPrivacy.FD_PREFIX.length);
    if (body.length <= 2) {
      return `${AssetUriPrivacy.FD_PREFIX}**`;
    }
    return `${AssetUriPrivacy.FD_PREFIX}**${body.substring(body.length - 1)}`;
  }

  public static maskFileName(fileName: string): string {
    if (fileName.length <= 8) {
      return fileName;
    }
    const prefix = fileName.substring(0, 4);
    const suffix = fileName.substring(fileName.length - 4);
    return `${prefix}****${suffix}`;
  }
}

/** Audit trail of the capture session. */
class SecurityAuditTrail {
  private entries: AuditEntry[] = [];
  private clock: number = 1700000000000;

  private nextTimestamp(): number {
    this.clock += 1000;
    return this.clock;
  }

  public log(action: string, severity: AuditSeverity): void {
    const entry: AuditEntry = {
      eventId: `audit_${this.entries.length}`,
      action: action,
      severity: severity,
      timestamp: this.nextTimestamp()
    };
    this.entries.push(entry);
  }

  public getEntries(): AuditEntry[] {
    const result: AuditEntry[] = [];
    for (let index = 0; index < this.entries.length; index++) {
      result.push(this.entries[index]);
    }
    return result;
  }

  public count(): number {
    return this.entries.length;
  }

  public countBySeverity(severity: AuditSeverity): number {
    let count = 0;
    for (let index = 0; index < this.entries.length; index++) {
      if (this.entries[index].severity === severity) {
        count++;
      }
    }
    return count;
  }

  public actions(): string[] {
    const result: string[] = [];
    for (let index = 0; index < this.entries.length; index++) {
      result.push(this.entries[index].action);
    }
    return result;
  }

  public hasAction(action: string): boolean {
    return this.actions().includes(action);
  }

  public hasCritical(): boolean {
    return this.countBySeverity(AuditSeverity.CRITICAL) > 0;
  }

  public isChronological(): boolean {
    for (let index = 1; index < this.entries.length; index++) {
      if (this.entries[index].timestamp < this.entries[index - 1].timestamp) {
        return false;
      }
    }
    return true;
  }

  public clear(): void {
    this.entries = [];
  }
}

/** Replay guard of the stop-combination command tokens. */
class CommandReplayGuard {
  private seen: string[] = [];

  public accept(token: string): boolean {
    if (this.seen.includes(token)) {
      return false;
    }
    this.seen.push(token);
    return true;
  }

  public count(): number {
    return this.seen.length;
  }

  public reset(): void {
    this.seen = [];
  }
}

/** Policy checker that maps a security level to the required evidence. */
class RecorderSecurityPolicy {
  private level: SecurityLevel = SecurityLevel.STANDARD;

  public setLevel(level: SecurityLevel): void {
    this.level = level;
  }

  public getLevel(): SecurityLevel {
    return this.level;
  }

  public requiresConfirmation(): boolean {
    return this.level >= SecurityLevel.STANDARD;
  }

  public requiresAuthorization(): boolean {
    return this.level >= SecurityLevel.STRICT;
  }

  public canStart(confirmed: boolean, authorized: boolean): boolean {
    if (!this.requiresConfirmation()) {
      return true;
    }
    if (this.requiresAuthorization()) {
      return confirmed && authorized;
    }
    return confirmed;
  }

  public describe(): string {
    if (this.level === SecurityLevel.NONE) {
      return 'no_guard';
    }
    if (this.level === SecurityLevel.BASIC) {
      return 'basic_guard';
    }
    if (this.level === SecurityLevel.STANDARD) {
      return 'standard_guard';
    }
    return 'strict_guard';
  }
}

/** Audio and location privacy gate of one recording session. */
class MediaPrivacyGate {
  private audioRequested: boolean = false;
  private locationRequested: boolean = false;

  public requestAudio(requested: boolean): void {
    this.audioRequested = requested;
  }

  public requestLocation(requested: boolean): void {
    this.locationRequested = requested;
  }

  public canCaptureAudio(ledger: PermissionLedger): boolean {
    if (!this.audioRequested) {
      return true;
    }
    return ledger.isGranted(RecorderPermission.MICROPHONE);
  }

  public canTagLocation(ledger: PermissionLedger): boolean {
    if (!this.locationRequested) {
      return true;
    }
    return ledger.isGranted(RecorderPermission.MEDIA_LOCATION);
  }

  public isAudioRequested(): boolean {
    return this.audioRequested;
  }

  public isLocationRequested(): boolean {
    return this.locationRequested;
  }
}

export default function recorderSecurityTest(): void {
  describe('RecorderSecurity_Test', () => {
    it('capture_screen_permission_should_be_required', 0, () => {
      const guard = new CaptureRequestGuard();
      const required = guard.requiredPermissions();
      expect(required.includes(RecorderPermission.CAPTURE_SCREEN)).assertTrue();
      expect(required.length).assertEqual(2);
    });

    it('exempt_capture_permission_should_be_recognized', 0, () => {
      const ledger = new PermissionLedger();
      ledger.grant(RecorderPermission.EXEMPT_CAPTURE_SCREEN_AUTHORIZE);
      expect(ledger.isGranted(RecorderPermission.EXEMPT_CAPTURE_SCREEN_AUTHORIZE)).assertTrue();
      expect(ledger.grantedCount()).assertEqual(1);
    });

    it('missing_float_window_permission_should_block_start', 0, () => {
      const ledger = new PermissionLedger();
      ledger.grant(RecorderPermission.CAPTURE_SCREEN);
      ledger.grant(RecorderPermission.WRITE_IMAGEVIDEO);
      const guard = new CaptureRequestGuard();
      const decision = guard.evaluate(ledger);
      expect(decision.allowed).assertFalse();
      expect(decision.missing.includes(RecorderPermission.SYSTEM_FLOAT_WINDOW)).assertTrue();
    });

    it('read_imagevideo_permission_should_be_queryable', 0, () => {
      const ledger = new PermissionLedger();
      ledger.grant(RecorderPermission.READ_IMAGEVIDEO);
      expect(ledger.isGranted(RecorderPermission.READ_IMAGEVIDEO)).assertTrue();
      expect(ledger.isGranted(RecorderPermission.WRITE_IMAGEVIDEO)).assertFalse();
    });

    it('write_imagevideo_permission_should_be_required', 0, () => {
      const ledger = new PermissionLedger();
      ledger.grant(RecorderPermission.CAPTURE_SCREEN);
      ledger.grant(RecorderPermission.SYSTEM_FLOAT_WINDOW);
      const guard = new CaptureRequestGuard();
      const decision = guard.evaluate(ledger);
      expect(decision.allowed).assertFalse();
      expect(decision.missing.includes(RecorderPermission.WRITE_IMAGEVIDEO)).assertTrue();
    });

    it('unauthorized_start_should_be_rejected', 0, () => {
      const ledger = new PermissionLedger();
      const guard = new CaptureRequestGuard();
      const decision = guard.evaluate(ledger);
      expect(decision.allowed).assertFalse();
      expect(decision.reason).assertEqual('permission_missing');
      expect(decision.missing.length).assertEqual(3);
      expect(guard.getRejectedAttempts()).assertEqual(1);
    });

    it('granted_permissions_should_allow_start', 0, () => {
      const ledger = new PermissionLedger();
      ledger.grant(RecorderPermission.CAPTURE_SCREEN);
      ledger.grant(RecorderPermission.WRITE_IMAGEVIDEO);
      ledger.grant(RecorderPermission.SYSTEM_FLOAT_WINDOW);
      const guard = new CaptureRequestGuard();
      const decision = guard.evaluate(ledger);
      expect(decision.allowed).assertTrue();
      expect(decision.reason).assertEqual('authorized');
      expect(decision.missing.length).assertEqual(0);
      expect(guard.getRejectedAttempts()).assertEqual(0);
    });

    it('exempt_permission_should_substitute_capture_permission', 0, () => {
      const ledger = new PermissionLedger();
      ledger.grant(RecorderPermission.EXEMPT_CAPTURE_SCREEN_AUTHORIZE);
      ledger.grant(RecorderPermission.WRITE_IMAGEVIDEO);
      ledger.grant(RecorderPermission.SYSTEM_FLOAT_WINDOW);
      const guard = new CaptureRequestGuard();
      const decision = guard.evaluate(ledger);
      expect(decision.allowed).assertTrue();
      expect(decision.missing.length).assertEqual(0);
    });

    it('denied_capture_permission_should_reject_start', 0, () => {
      const ledger = new PermissionLedger();
      ledger.deny(RecorderPermission.CAPTURE_SCREEN);
      ledger.grant(RecorderPermission.WRITE_IMAGEVIDEO);
      ledger.grant(RecorderPermission.SYSTEM_FLOAT_WINDOW);
      const guard = new CaptureRequestGuard();
      expect(guard.evaluate(ledger).allowed).assertFalse();
      expect(ledger.stateOf(RecorderPermission.CAPTURE_SCREEN)).assertEqual(GrantState.DENIED);
    });

    it('revoked_permission_should_not_allow_restart', 0, () => {
      const ledger = new PermissionLedger();
      ledger.grant(RecorderPermission.CAPTURE_SCREEN);
      ledger.grant(RecorderPermission.WRITE_IMAGEVIDEO);
      ledger.grant(RecorderPermission.SYSTEM_FLOAT_WINDOW);
      ledger.revoke(RecorderPermission.CAPTURE_SCREEN);
      const guard = new CaptureRequestGuard();
      expect(guard.evaluate(ledger).allowed).assertFalse();
      expect(ledger.stateOf(RecorderPermission.CAPTURE_SCREEN)).assertEqual(GrantState.REVOKED);
    });

    it('default_permission_state_should_be_closed', 0, () => {
      const ledger = new PermissionLedger();
      expect(ledger.stateOf(RecorderPermission.CAPTURE_SCREEN)).assertEqual(GrantState.DEFAULT_CLOSED);
      expect(ledger.isGranted(RecorderPermission.CAPTURE_SCREEN)).assertFalse();
      expect(ledger.grantedCount()).assertEqual(0);
    });

    it('duplicate_grant_should_be_idempotent', 0, () => {
      const ledger = new PermissionLedger();
      ledger.grant(RecorderPermission.CAPTURE_SCREEN);
      ledger.grant(RecorderPermission.CAPTURE_SCREEN);
      expect(ledger.grantedCount()).assertEqual(1);
      expect(ledger.grantedPermissions().length).assertEqual(1);
    });

    it('granted_permission_list_should_be_stable_ordered', 0, () => {
      const ledger = new PermissionLedger();
      ledger.grant(RecorderPermission.MICROPHONE);
      ledger.grant(RecorderPermission.CAPTURE_SCREEN);
      const granted = ledger.grantedPermissions();
      expect(granted.length).assertEqual(2);
      expect(granted[0]).assertEqual(RecorderPermission.CAPTURE_SCREEN);
      expect(granted[1]).assertEqual(RecorderPermission.MICROPHONE);
    });

    it('cleared_ledger_should_report_no_permission', 0, () => {
      const ledger = new PermissionLedger();
      ledger.grant(RecorderPermission.CAPTURE_SCREEN);
      ledger.clear();
      expect(ledger.grantedCount()).assertEqual(0);
      expect(ledger.isGranted(RecorderPermission.CAPTURE_SCREEN)).assertFalse();
    });

    it('service_entry_start_id_one_should_start', 0, () => {
      const validator = new ServiceEntryValidator();
      const result = validator.validate(1);
      expect(result.accepted).assertTrue();
      expect(result.command).assertEqual('start');
      expect(result.reason).assertEqual('start_id_one');
    });

    it('service_entry_other_start_id_should_stop', 0, () => {
      const validator = new ServiceEntryValidator();
      const result = validator.validate(7);
      expect(result.accepted).assertTrue();
      expect(result.command).assertEqual('stop');
    });

    it('service_entry_zero_start_id_should_be_rejected', 0, () => {
      const validator = new ServiceEntryValidator();
      const result = validator.validate(0);
      expect(result.accepted).assertFalse();
      expect(result.reason).assertEqual('invalid_start_id');
      expect(result.command).assertEqual('none');
    });

    it('service_entry_negative_start_id_should_be_rejected', 0, () => {
      const validator = new ServiceEntryValidator();
      const result = validator.validate(-3);
      expect(result.accepted).assertFalse();
      expect(result.reason).assertEqual('invalid_start_id');
    });

    it('service_entry_should_reject_non_system_caller', 0, () => {
      const validator = new ServiceEntryValidator();
      validator.setSystemCaller(false);
      const result = validator.validate(1);
      expect(result.accepted).assertFalse();
      expect(result.reason).assertEqual('not_system_caller');
    });

    it('service_entry_should_reject_unexported_ability', 0, () => {
      const validator = new ServiceEntryValidator();
      validator.setExported(false);
      const result = validator.validate(1);
      expect(result.accepted).assertFalse();
      expect(result.reason).assertEqual('not_exported');
    });

    it('service_entry_should_accept_system_caller', 0, () => {
      const validator = new ServiceEntryValidator();
      validator.setExported(true);
      validator.setSystemCaller(true);
      expect(validator.validate(1).accepted).assertTrue();
      expect(validator.validate(2).command).assertEqual('stop');
    });

    it('asset_uri_should_keep_fd_prefix', 0, () => {
      const uri = AssetUriPrivacy.buildFdUri(42);
      expect(uri).assertEqual('fd://42');
      expect(uri.startsWith('fd://')).assertTrue();
      expect(AssetUriPrivacy.isFdUri(uri)).assertTrue();
    });

    it('asset_uri_should_reject_non_numeric_descriptor', 0, () => {
      expect(AssetUriPrivacy.isFdUri('fd://abc')).assertFalse();
      expect(AssetUriPrivacy.isFdUri('fd://')).assertFalse();
      expect(AssetUriPrivacy.isFdUri('file://42')).assertFalse();
    });

    it('asset_uri_should_not_leak_storage_path', 0, () => {
      const uri = AssetUriPrivacy.buildFdUri(9);
      expect(AssetUriPrivacy.leaksStoragePath(uri)).assertFalse();
      expect(AssetUriPrivacy.leaksStoragePath('/data/storage/el2/photo/1.jpg')).assertTrue();
      expect(AssetUriPrivacy.leaksStoragePath('/mnt/media_rw/abc.mp4')).assertTrue();
    });

    it('asset_uri_mask_should_hide_descriptor', 0, () => {
      const masked = AssetUriPrivacy.maskUri('fd://123456');
      expect(masked).assertEqual('fd://**6');
      expect(masked.includes('12345')).assertFalse();
      expect(AssetUriPrivacy.leaksStoragePath(masked)).assertFalse();
    });

    it('asset_uri_mask_should_handle_short_descriptor', 0, () => {
      expect(AssetUriPrivacy.maskUri('fd://7')).assertEqual('fd://**');
      expect(AssetUriPrivacy.maskUri('fd://12')).assertEqual('fd://**');
      expect(AssetUriPrivacy.maskUri('fd://123')).assertEqual('fd://**3');
    });

    it('asset_uri_mask_should_fallback_for_unknown_uri', 0, () => {
      expect(AssetUriPrivacy.maskUri('/data/storage/el2/photo/1.jpg')).assertEqual('fd://****');
      expect(AssetUriPrivacy.maskUri('fd://x8')).assertEqual('fd://****');
    });

    it('recording_file_name_should_be_masked', 0, () => {
      const masked = AssetUriPrivacy.maskFileName('REC_20260101_101010.mp4');
      expect(masked).assertEqual('REC_****.mp4');
      expect(masked.includes('20260101')).assertFalse();
      expect(masked.endsWith('.mp4')).assertTrue();
    });

    it('short_file_name_should_not_be_masked', 0, () => {
      expect(AssetUriPrivacy.maskFileName('REC.mp4')).assertEqual('REC.mp4');
      expect(AssetUriPrivacy.maskFileName('abc')).assertEqual('abc');
    });

    it('audit_trail_should_record_start_action', 0, () => {
      const trail = new SecurityAuditTrail();
      trail.log('start_requested', AuditSeverity.INFO);
      trail.log('unauthorized_start', AuditSeverity.CRITICAL);
      expect(trail.count()).assertEqual(2);
      expect(trail.hasAction('start_requested')).assertTrue();
      expect(trail.hasAction('unauthorized_start')).assertTrue();
    });

    it('audit_trail_should_count_severity', 0, () => {
      const trail = new SecurityAuditTrail();
      trail.log('a', AuditSeverity.INFO);
      trail.log('b', AuditSeverity.WARNING);
      trail.log('c', AuditSeverity.CRITICAL);
      trail.log('d', AuditSeverity.CRITICAL);
      expect(trail.countBySeverity(AuditSeverity.CRITICAL)).assertEqual(2);
      expect(trail.countBySeverity(AuditSeverity.WARNING)).assertEqual(1);
      expect(trail.hasCritical()).assertTrue();
    });

    it('audit_trail_timestamps_should_be_chronological', 0, () => {
      const trail = new SecurityAuditTrail();
      trail.log('first', AuditSeverity.INFO);
      trail.log('second', AuditSeverity.INFO);
      trail.log('third', AuditSeverity.INFO);
      const entries = trail.getEntries();
      expect(entries[0].timestamp).assertLess(entries[1].timestamp);
      expect(entries[1].timestamp).assertLess(entries[2].timestamp);
      expect(trail.isChronological()).assertTrue();
      expect(entries[0].eventId).assertEqual('audit_0');
    });

    it('audit_trail_clear_should_remove_entries', 0, () => {
      const trail = new SecurityAuditTrail();
      trail.log('a', AuditSeverity.INFO);
      trail.clear();
      expect(trail.count()).assertEqual(0);
      expect(trail.hasCritical()).assertFalse();
      expect(trail.actions().length).assertEqual(0);
    });

    it('replayed_command_token_should_be_rejected', 0, () => {
      const guard = new CommandReplayGuard();
      expect(guard.accept('stop_1')).assertTrue();
      expect(guard.accept('stop_1')).assertFalse();
      expect(guard.count()).assertEqual(1);
    });

    it('distinct_command_tokens_should_be_accepted', 0, () => {
      const guard = new CommandReplayGuard();
      expect(guard.accept('stop_1')).assertTrue();
      expect(guard.accept('stop_2')).assertTrue();
      expect(guard.count()).assertEqual(2);
      guard.reset();
      expect(guard.accept('stop_1')).assertTrue();
    });

    it('strict_policy_should_require_confirmation_and_authorization', 0, () => {
      const policy = new RecorderSecurityPolicy();
      policy.setLevel(SecurityLevel.STRICT);
      expect(policy.requiresConfirmation()).assertTrue();
      expect(policy.requiresAuthorization()).assertTrue();
      expect(policy.canStart(false, true)).assertFalse();
      expect(policy.canStart(true, false)).assertFalse();
      expect(policy.canStart(true, true)).assertTrue();
    });

    it('standard_policy_should_require_confirmation_only', 0, () => {
      const policy = new RecorderSecurityPolicy();
      expect(policy.getLevel()).assertEqual(SecurityLevel.STANDARD);
      expect(policy.canStart(true, false)).assertTrue();
      expect(policy.canStart(false, false)).assertFalse();
      expect(policy.describe()).assertEqual('standard_guard');
    });

    it('basic_policy_should_not_require_confirmation', 0, () => {
      const policy = new RecorderSecurityPolicy();
      policy.setLevel(SecurityLevel.BASIC);
      expect(policy.requiresConfirmation()).assertFalse();
      expect(policy.canStart(false, false)).assertTrue();
      expect(policy.describe()).assertEqual('basic_guard');
    });

    it('no_guard_policy_should_allow_everything', 0, () => {
      const policy = new RecorderSecurityPolicy();
      policy.setLevel(SecurityLevel.NONE);
      expect(policy.canStart(false, false)).assertTrue();
      expect(policy.requiresAuthorization()).assertFalse();
      expect(policy.describe()).assertEqual('no_guard');
    });

    it('silent_recording_should_not_need_microphone', 0, () => {
      const gate = new MediaPrivacyGate();
      const ledger = new PermissionLedger();
      gate.requestAudio(false);
      expect(gate.isAudioRequested()).assertFalse();
      expect(gate.canCaptureAudio(ledger)).assertTrue();
    });

    it('audio_recording_should_need_microphone', 0, () => {
      const gate = new MediaPrivacyGate();
      const ledger = new PermissionLedger();
      gate.requestAudio(true);
      expect(gate.canCaptureAudio(ledger)).assertFalse();
      ledger.grant(RecorderPermission.MICROPHONE);
      expect(gate.canCaptureAudio(ledger)).assertTrue();
    });

    it('location_tag_should_need_media_location', 0, () => {
      const gate = new MediaPrivacyGate();
      const ledger = new PermissionLedger();
      gate.requestLocation(true);
      expect(gate.isLocationRequested()).assertTrue();
      expect(gate.canTagLocation(ledger)).assertFalse();
      ledger.grant(RecorderPermission.MEDIA_LOCATION);
      expect(gate.canTagLocation(ledger)).assertTrue();
    });

    it('location_tag_should_be_skipped_when_not_requested', 0, () => {
      const gate = new MediaPrivacyGate();
      const ledger = new PermissionLedger();
      gate.requestLocation(false);
      expect(gate.canTagLocation(ledger)).assertTrue();
      expect(gate.canCaptureAudio(ledger)).assertTrue();
    });

    it('authorized_full_flow_should_pass_all_checks', 0, () => {
      const ledger = new PermissionLedger();
      ledger.grant(RecorderPermission.CAPTURE_SCREEN);
      ledger.grant(RecorderPermission.WRITE_IMAGEVIDEO);
      ledger.grant(RecorderPermission.SYSTEM_FLOAT_WINDOW);
      ledger.grant(RecorderPermission.MICROPHONE);
      const guard = new CaptureRequestGuard();
      const gate = new MediaPrivacyGate();
      gate.requestAudio(true);
      const entry = new ServiceEntryValidator();
      const trail = new SecurityAuditTrail();
      trail.log('start_requested', AuditSeverity.INFO);
      expect(guard.evaluate(ledger).allowed).assertTrue();
      expect(entry.validate(1).command).assertEqual('start');
      expect(gate.canCaptureAudio(ledger)).assertTrue();
      expect(trail.hasCritical()).assertFalse();
    });

    it('blocked_full_flow_should_record_critical_audit', 0, () => {
      const ledger = new PermissionLedger();
      const guard = new CaptureRequestGuard();
      const trail = new SecurityAuditTrail();
      const decision = guard.evaluate(ledger);
      if (!decision.allowed) {
        trail.log('unauthorized_start', AuditSeverity.CRITICAL);
      }
      expect(decision.allowed).assertFalse();
      expect(trail.countBySeverity(AuditSeverity.CRITICAL)).assertEqual(1);
      expect(trail.hasAction('unauthorized_start')).assertTrue();
    });

    it('rejected_attempts_should_accumulate', 0, () => {
      const guard = new CaptureRequestGuard();
      const ledger = new PermissionLedger();
      guard.evaluate(ledger);
      guard.evaluate(ledger);
      guard.evaluate(ledger);
      expect(guard.getRejectedAttempts()).assertEqual(3);
      guard.resetRejectedAttempts();
      expect(guard.getRejectedAttempts()).assertEqual(0);
    });

    it('permission_enum_should_cover_capture_related_permissions', 0, () => {
      const permissions: string[] = [
        RecorderPermission.CAPTURE_SCREEN,
        RecorderPermission.EXEMPT_CAPTURE_SCREEN_AUTHORIZE,
        RecorderPermission.SYSTEM_FLOAT_WINDOW,
        RecorderPermission.READ_IMAGEVIDEO,
        RecorderPermission.WRITE_IMAGEVIDEO,
        RecorderPermission.MEDIA_LOCATION,
        RecorderPermission.MICROPHONE
      ];
      expect(permissions.length).assertEqual(7);
      expect(permissions[0]).assertContain('CAPTURE_SCREEN');
      expect(permissions[5]).assertContain('MEDIA_LOCATION');
    });
  });
}

