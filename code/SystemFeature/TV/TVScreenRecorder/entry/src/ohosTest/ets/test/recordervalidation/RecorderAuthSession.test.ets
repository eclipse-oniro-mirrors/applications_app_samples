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
import { Driver } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import {
  getDriver,
  pressAndWait,
  KEY_BACK,
  DELAY_KEY_NAVIGATION,
  serializedDelay
} from '../shared/RecordingDriver';

const DOMAIN: number = 0x0001;
const TAG: string = 'RecorderAuthSession';

// Authorization state of one recording permission session.
enum PermissionGrantState {
  UNINITIALIZED = 'uninitialized',
  GRANTED = 'granted',
  DENIED = 'denied',
  REVOKED = 'revoked'
}

// Permissions requested before a recording can start.
enum RecorderPermission {
  CAPTURE_SCREEN = 'ohos.permission.CAPTURE_SCREEN',
  SYSTEM_FLOAT_WINDOW = 'ohos.permission.SYSTEM_FLOAT_WINDOW',
  READ_IMAGEVIDEO = 'ohos.permission.READ_IMAGEVIDEO',
  WRITE_IMAGEVIDEO = 'ohos.permission.WRITE_IMAGEVIDEO'
}

// Authorization level reached by a recording session.
enum RecordingAuthLevel {
  NONE = 'none',
  PARTIAL = 'partial',
  FULL = 'full'
}

// Result states of one permission request round.
enum GrantResultState {
  SUCCESS = 'success',
  FAILED = 'failed',
  LOCKED = 'locked',
  PENDING = 'pending'
}

// Ticket issued when the recording permissions are granted.
interface PermissionGrantTicketData {
  sessionId: string;
  token: string;
  issuedAt: number;
  expiresAt: number;
}

// One recorded permission request.
interface GrantRequest {
  sessionId: string;
  permission: RecorderPermission;
  requestedAt: number;
  result: GrantResultState;
}

// Result of a permission request round.
interface GrantOutcomeData {
  sessionId: string;
  state: GrantResultState;
  message: string;
}

// Recording authorization session with a fixed grant window.
class RecordingAuthSession {
  public static readonly GRANT_WINDOW_MS: number = 30 * 60 * 1000;
  private state: PermissionGrantState = PermissionGrantState.UNINITIALIZED;
  private granted: string[] = [];
  private timeoutMs: number = 0;

  public grant(permission: RecorderPermission): boolean {
    if (this.state === PermissionGrantState.REVOKED) {
      return false;
    }
    if (!this.granted.includes(permission)) {
      this.granted.push(permission);
    }
    this.state = PermissionGrantState.GRANTED;
    return true;
  }

  public deny(permission: RecorderPermission): void {
    const index: number = this.granted.indexOf(permission);
    if (index >= 0) {
      this.granted.splice(index, 1);
    }
    this.state = PermissionGrantState.DENIED;
  }

  public revoke(): void {
    this.state = PermissionGrantState.REVOKED;
    this.granted = [];
  }

  public expire(): void {
    this.state = PermissionGrantState.DENIED;
    this.granted = [];
    this.timeoutMs = RecordingAuthSession.GRANT_WINDOW_MS;
  }

  public isGranted(permission: RecorderPermission): boolean {
    return this.granted.includes(permission);
  }

  public getGrantedCount(): number {
    return this.granted.length;
  }

  public isReady(): boolean {
    return this.state === PermissionGrantState.GRANTED;
  }

  public getState(): PermissionGrantState {
    return this.state;
  }

  public getTimeoutMs(): number {
    return this.timeoutMs;
  }

  public canStartRecording(): boolean {
    return this.isGranted(RecorderPermission.CAPTURE_SCREEN) &&
      this.isGranted(RecorderPermission.SYSTEM_FLOAT_WINDOW) &&
      this.isGranted(RecorderPermission.WRITE_IMAGEVIDEO);
  }
}

// Permission bundle bound to one recorder session identity.
class RecorderPermissionBundle {
  public sessionId: string;
  private operations: string[] = [];

  constructor(sessionId: string) {
    this.sessionId = sessionId;
  }

  public recordOperation(name: string): void {
    this.operations.push(name);
  }

  public getOperations(): string[] {
    const result: string[] = [];
    for (let i = 0; i < this.operations.length; i++) {
      result.push(this.operations[i]);
    }
    return result;
  }

  public getOperationCount(): number {
    return this.operations.length;
  }
}

// Requests permissions and tracks the active recorder session.
class PermissionRequestController {
  private bundles: Map<string, RecorderPermissionBundle> = new Map<string, RecorderPermissionBundle>();
  private currentSessionId: string = '';
  private singleSessionMode: boolean = false;

  public request(sessionId: string): boolean {
    if (!this.bundles.has(sessionId)) {
      this.bundles.set(sessionId, new RecorderPermissionBundle(sessionId));
    }
    this.currentSessionId = sessionId;
    return true;
  }

  public release(): void {
    this.currentSessionId = '';
  }

  public getCurrentSessionId(): string {
    return this.currentSessionId;
  }

  public isActive(): boolean {
    return this.currentSessionId.length > 0;
  }

  public setSingleSessionMode(enabled: boolean): void {
    this.singleSessionMode = enabled;
  }

  public isSingleSessionMode(): boolean {
    return this.singleSessionMode;
  }

  public getBundle(sessionId: string): RecorderPermissionBundle | null {
    const bundle: RecorderPermissionBundle | undefined = this.bundles.get(sessionId);
    if (bundle === undefined) {
      return null;
    }
    return bundle;
  }
}

// Limits how often a permission dialog may be requested again.
class PermissionRequestCooldown {
  public static readonly COOLDOWN_MS: number = 60 * 1000;
  private lastRequestedAt: number = 0;
  private requestCount: number = 0;
  private blocked: boolean = false;
  private hasRequested: boolean = false;

  public canRequest(now: number): boolean {
    if (!this.hasRequested) {
      return true;
    }
    return now - this.lastRequestedAt >= PermissionRequestCooldown.COOLDOWN_MS;
  }

  public request(now: number): boolean {
    if (!this.canRequest(now)) {
      return false;
    }
    this.lastRequestedAt = now;
    this.requestCount++;
    this.blocked = false;
    this.hasRequested = true;
    return true;
  }

  public markBlocked(): void {
    this.blocked = true;
  }

  public isBlocked(): boolean {
    return this.blocked;
  }

  public getRequestCount(): number {
    return this.requestCount;
  }

  public reset(): void {
    this.lastRequestedAt = 0;
    this.requestCount = 0;
    this.blocked = false;
    this.hasRequested = false;
  }
}

// Permission ticket with an explicit validity window.
class PermissionGrantTicket {
  public sessionId: string;
  public token: string;
  public issuedAt: number;
  public expiresAt: number;

  constructor(sessionId: string, token: string, issuedAt: number, expiresAt: number) {
    this.sessionId = sessionId;
    this.token = token;
    this.issuedAt = issuedAt;
    this.expiresAt = expiresAt;
  }

  public clone(): PermissionGrantTicket {
    return new PermissionGrantTicket(this.sessionId, this.token, this.issuedAt, this.expiresAt);
  }

  public equals(other: PermissionGrantTicket): boolean {
    return this.sessionId === other.sessionId && this.token === other.token;
  }

  public toString(): string {
    return `PermissionGrantTicket(sessionId=${this.sessionId}, issuedAt=${this.issuedAt}, ` +
      `expiresAt=${this.expiresAt})`;
  }

  public isExpired(now: number): boolean {
    return now >= this.expiresAt;
  }

  public isValid(): boolean {
    return this.sessionId.length > 0 && this.token.length > 0 && this.expiresAt > this.issuedAt;
  }

  public getRemainingMs(now: number): number {
    return this.expiresAt - now;
  }

  public toData(): PermissionGrantTicketData {
    const data: PermissionGrantTicketData = {
      sessionId: this.sessionId,
      token: this.token,
      issuedAt: this.issuedAt,
      expiresAt: this.expiresAt
    };
    return data;
  }
}

// Records the permission dialogs requested during a session.
class GrantRequestRecorder {
  private requests: GrantRequest[] = [];

  public record(sessionId: string, permission: RecorderPermission, requestedAt: number,
    result: GrantResultState): void {
    const request: GrantRequest = {
      sessionId: sessionId,
      permission: permission,
      requestedAt: requestedAt,
      result: result
    };
    this.requests.push(request);
  }

  public getRequestCount(): number {
    return this.requests.length;
  }

  public getCountByPermission(permission: RecorderPermission): number {
    let count: number = 0;
    for (let i = 0; i < this.requests.length; i++) {
      if (this.requests[i].permission === permission) {
        count++;
      }
    }
    return count;
  }

  public getCountBySession(sessionId: string): number {
    let count: number = 0;
    for (let i = 0; i < this.requests.length; i++) {
      if (this.requests[i].sessionId === sessionId) {
        count++;
      }
    }
    return count;
  }

  public getRequests(): GrantRequest[] {
    const result: GrantRequest[] = [];
    for (let i = 0; i < this.requests.length; i++) {
      const request: GrantRequest = this.requests[i];
      const copy: GrantRequest = {
        sessionId: request.sessionId,
        permission: request.permission,
        requestedAt: request.requestedAt,
        result: request.result
      };
      result.push(copy);
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

// Result of one permission request round.
class GrantOutcome {
  public sessionId: string;
  public state: GrantResultState;
  public message: string;

  constructor(sessionId: string, state: GrantResultState, message: string) {
    this.sessionId = sessionId;
    this.state = state;
    this.message = message;
  }

  public clone(): GrantOutcome {
    return new GrantOutcome(this.sessionId, this.state, this.message);
  }

  public equals(other: GrantOutcome): boolean {
    return this.sessionId === other.sessionId && this.state === other.state &&
      this.message === other.message;
  }

  public toString(): string {
    return `GrantOutcome(sessionId=${this.sessionId}, state=${this.state}, message=${this.message})`;
  }

  public isSuccess(): boolean {
    return this.state === GrantResultState.SUCCESS;
  }

  public isValid(): boolean {
    return this.sessionId.length > 0;
  }

  public toData(): GrantOutcomeData {
    const data: GrantOutcomeData = {
      sessionId: this.sessionId,
      state: this.state,
      message: this.message
    };
    return data;
  }
}

// Validates permission names and requirement sets.
class PermissionSpecValidator {
  public static readonly PERMISSION_PREFIX: string = 'ohos.permission.';

  public isValidPermissionName(name: string): boolean {
    return name.startsWith(PermissionSpecValidator.PERMISSION_PREFIX) && name.length > 19;
  }

  public isSystemPermission(name: string): boolean {
    return name === RecorderPermission.CAPTURE_SCREEN || name === RecorderPermission.SYSTEM_FLOAT_WINDOW;
  }

  public isMediaPermission(name: string): boolean {
    return name === RecorderPermission.READ_IMAGEVIDEO || name === RecorderPermission.WRITE_IMAGEVIDEO;
  }

  public countGranted(granted: string[], required: string[]): number {
    let count: number = 0;
    for (let i = 0; i < required.length; i++) {
      if (granted.includes(required[i])) {
        count++;
      }
    }
    return count;
  }

  public hasAllRequired(granted: string[], required: string[]): boolean {
    return this.countGranted(granted, required) === required.length;
  }

  public getMissing(granted: string[], required: string[]): string[] {
    const missing: string[] = [];
    for (let i = 0; i < required.length; i++) {
      if (!granted.includes(required[i])) {
        missing.push(required[i]);
      }
    }
    return missing;
  }
}

// Aggregates authorization metrics over several sessions.
class AuthorizationStatistics {
  public countGranted(sessions: RecordingAuthSession[]): number {
    let count: number = 0;
    for (let i = 0; i < sessions.length; i++) {
      if (sessions[i].isReady()) {
        count++;
      }
    }
    return count;
  }

  public countByState(sessions: RecordingAuthSession[], state: PermissionGrantState): number {
    let count: number = 0;
    for (let i = 0; i < sessions.length; i++) {
      if (sessions[i].getState() === state) {
        count++;
      }
    }
    return count;
  }

  public getAuthorizationRate(sessions: RecordingAuthSession[]): number {
    if (sessions.length === 0) {
      return 0;
    }
    return this.countGranted(sessions) / sessions.length;
  }

  public isAllReady(sessions: RecordingAuthSession[]): boolean {
    for (let i = 0; i < sessions.length; i++) {
      if (!sessions[i].isReady()) {
        return false;
      }
    }
    return true;
  }

  public resolveLevel(session: RecordingAuthSession): RecordingAuthLevel {
    if (session.canStartRecording()) {
      return RecordingAuthLevel.FULL;
    }
    if (session.getGrantedCount() > 0) {
      return RecordingAuthLevel.PARTIAL;
    }
    return RecordingAuthLevel.NONE;
  }
}

// Grants the complete permission set required by the recorder.
class RecorderPermissionProvisioner {
  public static readonly REQUIRED: string[] = [
    RecorderPermission.CAPTURE_SCREEN,
    RecorderPermission.SYSTEM_FLOAT_WINDOW,
    RecorderPermission.WRITE_IMAGEVIDEO
  ];

  public provision(session: RecordingAuthSession): number {
    let grantedCount: number = 0;
    for (let i = 0; i < RecorderPermissionProvisioner.REQUIRED.length; i++) {
      const permission: string = RecorderPermissionProvisioner.REQUIRED[i];
      if (permission === RecorderPermission.CAPTURE_SCREEN) {
        if (session.grant(RecorderPermission.CAPTURE_SCREEN)) {
          grantedCount++;
        }
      }
      if (permission === RecorderPermission.SYSTEM_FLOAT_WINDOW) {
        if (session.grant(RecorderPermission.SYSTEM_FLOAT_WINDOW)) {
          grantedCount++;
        }
      }
      if (permission === RecorderPermission.WRITE_IMAGEVIDEO) {
        if (session.grant(RecorderPermission.WRITE_IMAGEVIDEO)) {
          grantedCount++;
        }
      }
    }
    return grantedCount;
  }

  public getRequired(): string[] {
    const copy: string[] = [];
    for (let i = 0; i < RecorderPermissionProvisioner.REQUIRED.length; i++) {
      copy.push(RecorderPermissionProvisioner.REQUIRED[i]);
    }
    return copy;
  }
}

export default function recorderAuthSessionTest(): void {
  describe('RecorderAuthSession_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      hilog.info(DOMAIN, TAG, 'prepare recorder authorization session validation');
      await serializedDelay(driver, 500);
    });

    afterAll(async () => {
      hilog.info(DOMAIN, TAG, 'recorder authorization session validation finished');
      await serializedDelay(driver, 300);
    });

    // Session state machine: granting a permission marks the session ready.
    it('session_should_enter_granted_state', 0, async () => {
      const session = new RecordingAuthSession();
      expect(session.grant(RecorderPermission.CAPTURE_SCREEN)).assertTrue();
      expect(session.isReady()).assertTrue();
      expect(session.isGranted(RecorderPermission.CAPTURE_SCREEN)).assertTrue();
    });

    // Session state machine: revoking clears every granted permission.
    it('session_should_revoke_all_permissions', 0, async () => {
      const session = new RecordingAuthSession();
      session.grant(RecorderPermission.CAPTURE_SCREEN);
      session.revoke();
      expect(session.getState()).assertEqual(PermissionGrantState.REVOKED);
      expect(session.getGrantedCount()).assertEqual(0);
      expect(session.isGranted(RecorderPermission.CAPTURE_SCREEN)).assertFalse();
    });

    // Session state machine: a revoked session cannot be granted again.
    it('revoked_session_should_not_be_regranted', 0, async () => {
      const session = new RecordingAuthSession();
      session.grant(RecorderPermission.CAPTURE_SCREEN);
      session.revoke();
      expect(session.grant(RecorderPermission.CAPTURE_SCREEN)).assertFalse();
      expect(session.isReady()).assertFalse();
    });

    // Session state machine: the grant window expires after thirty minutes.
    it('session_timeout_should_expire_permissions', 0, async () => {
      const session = new RecordingAuthSession();
      session.grant(RecorderPermission.CAPTURE_SCREEN);
      session.expire();
      expect(session.getState()).assertEqual(PermissionGrantState.DENIED);
      expect(session.getGrantedCount()).assertEqual(0);
      expect(session.getTimeoutMs()).assertEqual(30 * 60 * 1000);
    });

    // Session state machine: an uninitialized session holds no permission.
    it('uninitialized_session_should_not_be_ready', 0, async () => {
      const session = new RecordingAuthSession();
      expect(session.isReady()).assertFalse();
      expect(session.getGrantedCount()).assertEqual(0);
      expect(session.getState()).assertEqual(PermissionGrantState.UNINITIALIZED);
    });

    // Session state machine: a denied permission keeps the session denied.
    it('denied_permission_should_mark_session_denied', 0, async () => {
      const session = new RecordingAuthSession();
      session.grant(RecorderPermission.CAPTURE_SCREEN);
      session.grant(RecorderPermission.SYSTEM_FLOAT_WINDOW);
      session.deny(RecorderPermission.SYSTEM_FLOAT_WINDOW);
      expect(session.getState()).assertEqual(PermissionGrantState.DENIED);
      expect(session.isGranted(RecorderPermission.SYSTEM_FLOAT_WINDOW)).assertFalse();
      expect(session.getGrantedCount()).assertEqual(1);
    });

    // Session state machine: duplicate grants are counted once.
    it('duplicate_grant_should_not_increment_count', 0, async () => {
      const session = new RecordingAuthSession();
      session.grant(RecorderPermission.CAPTURE_SCREEN);
      session.grant(RecorderPermission.CAPTURE_SCREEN);
      expect(session.getGrantedCount()).assertEqual(1);
    });

    // Recording gate: all three recording permissions are required.
    it('complete_permission_set_should_allow_recording', 0, async () => {
      const session = new RecordingAuthSession();
      expect(session.canStartRecording()).assertFalse();
      new RecorderPermissionProvisioner().provision(session);
      expect(session.canStartRecording()).assertTrue();
      expect(session.getGrantedCount()).assertEqual(3);
    });

    // Recording gate: READ_IMAGEVIDEO alone does not allow recording.
    it('partial_permission_set_should_block_recording', 0, async () => {
      const session = new RecordingAuthSession();
      session.grant(RecorderPermission.READ_IMAGEVIDEO);
      expect(session.canStartRecording()).assertFalse();
      expect(new AuthorizationStatistics().resolveLevel(session)).assertEqual(RecordingAuthLevel.PARTIAL);
    });

    // Bundle bookkeeping: the current recorder session is tracked.
    it('request_should_set_current_session', 0, async () => {
      const controller = new PermissionRequestController();
      controller.request('REC_SESSION_1');
      expect(controller.isActive()).assertTrue();
      expect(controller.getCurrentSessionId()).assertEqual('REC_SESSION_1');
      controller.release();
      expect(controller.isActive()).assertFalse();
      expect(controller.getCurrentSessionId()).assertEqual('');
    });

    // Bundle bookkeeping: multiple sessions stay isolated.
    it('multiple_sessions_should_be_isolated', 0, async () => {
      const controller = new PermissionRequestController();
      controller.request('REC_SESSION_1');
      const first: RecorderPermissionBundle | null = controller.getBundle('REC_SESSION_1');
      if (first !== null) {
        first.recordOperation('startRecording');
      }
      controller.request('REC_SESSION_2');
      const second: RecorderPermissionBundle | null = controller.getBundle('REC_SESSION_2');
      if (second !== null) {
        second.recordOperation('stopRecording');
      }
      expect(controller.getCurrentSessionId()).assertEqual('REC_SESSION_2');
      expect(first === null).assertFalse();
      if (first !== null && second !== null) {
        expect(first.getOperationCount()).assertEqual(1);
        expect(second.getOperationCount()).assertEqual(1);
        expect(first.getOperations()[0]).assertEqual('startRecording');
        expect(second.getOperations()[0]).assertEqual('stopRecording');
      }
    });

    // Bundle bookkeeping: an unknown session has no bundle.
    it('nonexistent_session_should_return_null', 0, async () => {
      const controller = new PermissionRequestController();
      expect(controller.getBundle('ghost')).assertNull();
      expect(controller.getBundle('')).assertNull();
    });

    // Bundle bookkeeping: single session mode is configurable.
    it('single_session_mode_should_be_configurable', 0, async () => {
      const controller = new PermissionRequestController();
      expect(controller.isSingleSessionMode()).assertFalse();
      controller.setSingleSessionMode(true);
      expect(controller.isSingleSessionMode()).assertTrue();
      controller.setSingleSessionMode(false);
      expect(controller.isSingleSessionMode()).assertFalse();
    });

    // Bundle bookkeeping: repeated request for the same session is idempotent.
    it('repeated_request_should_be_idempotent', 0, async () => {
      const controller = new PermissionRequestController();
      controller.request('REC_SESSION_1');
      controller.request('REC_SESSION_1');
      expect(controller.getCurrentSessionId()).assertEqual('REC_SESSION_1');
      expect(controller.getBundle('REC_SESSION_1') === null).assertFalse();
    });

    // Cooldown: the first permission request is always allowed.
    it('cooldown_should_allow_first_request', 0, async () => {
      const cooldown = new PermissionRequestCooldown();
      expect(cooldown.canRequest(1000)).assertTrue();
      expect(cooldown.request(1000)).assertTrue();
      expect(cooldown.getRequestCount()).assertEqual(1);
    });

    // Cooldown: repeated dialogs are limited to one per minute.
    it('cooldown_should_limit_repeated_requests', 0, async () => {
      const cooldown = new PermissionRequestCooldown();
      cooldown.request(1000);
      expect(cooldown.request(1000 + 30 * 1000)).assertFalse();
      expect(cooldown.request(1000 + 61 * 1000)).assertTrue();
      expect(cooldown.getRequestCount()).assertEqual(2);
    });

    // Cooldown: a denied dialog is reported as blocked.
    it('cooldown_should_track_blocked_state', 0, async () => {
      const cooldown = new PermissionRequestCooldown();
      expect(cooldown.isBlocked()).assertFalse();
      cooldown.markBlocked();
      expect(cooldown.isBlocked()).assertTrue();
      cooldown.request(1000);
      expect(cooldown.isBlocked()).assertFalse();
    });

    // Cooldown: reset restores the initial request budget.
    it('cooldown_should_reset', 0, async () => {
      const cooldown = new PermissionRequestCooldown();
      cooldown.request(1000);
      cooldown.request(1000 + 61 * 1000);
      expect(cooldown.getRequestCount()).assertEqual(2);
      cooldown.reset();
      expect(cooldown.getRequestCount()).assertEqual(0);
      expect(cooldown.canRequest(1000)).assertTrue();
      expect(cooldown.isBlocked()).assertFalse();
    });

    // PermissionGrantTicket: validity and remaining window.
    it('grant_ticket_should_be_valid', 0, async () => {
      const ticket = new PermissionGrantTicket('REC_SESSION_1', 'token-1', 1000, 5000);
      expect(ticket.isValid()).assertTrue();
      expect(ticket.isExpired(4999)).assertFalse();
      expect(ticket.isExpired(5000)).assertTrue();
      expect(ticket.getRemainingMs(2000)).assertEqual(3000);
    });

    // PermissionGrantTicket: equality and cloning.
    it('grant_ticket_should_compare_and_clone', 0, async () => {
      const left = new PermissionGrantTicket('REC_SESSION_1', 'token-1', 1000, 5000);
      const right = new PermissionGrantTicket('REC_SESSION_1', 'token-1', 2000, 6000);
      const other = new PermissionGrantTicket('REC_SESSION_2', 'token-2', 1000, 5000);
      expect(left.equals(right)).assertTrue();
      expect(left.equals(other)).assertFalse();
      expect(left.equals(left.clone())).assertTrue();
      expect(left.toString().length).assertLarger(0);
      const data: PermissionGrantTicketData = left.toData();
      expect(data.sessionId).assertEqual('REC_SESSION_1');
      expect(data.token).assertEqual('token-1');
    });

    // PermissionGrantTicket: empty identifiers invalidate the ticket.
    it('grant_ticket_should_require_identifiers', 0, async () => {
      const ticket = new PermissionGrantTicket('', '', 1000, 5000);
      expect(ticket.isValid()).assertFalse();
      expect(new PermissionGrantTicket('REC_SESSION_1', 'token-1', 5000, 5000).isValid()).assertFalse();
    });

    // GrantRequestRecorder: counts by permission and by session.
    it('grant_recorder_should_count_by_permission', 0, async () => {
      const recorder = new GrantRequestRecorder();
      recorder.record('REC_SESSION_1', RecorderPermission.CAPTURE_SCREEN, 1000, GrantResultState.SUCCESS);
      recorder.record('REC_SESSION_1', RecorderPermission.SYSTEM_FLOAT_WINDOW, 2000, GrantResultState.SUCCESS);
      recorder.record('REC_SESSION_2', RecorderPermission.CAPTURE_SCREEN, 3000, GrantResultState.FAILED);
      expect(recorder.getRequestCount()).assertEqual(3);
      expect(recorder.getCountByPermission(RecorderPermission.CAPTURE_SCREEN)).assertEqual(2);
      expect(recorder.getCountByPermission(RecorderPermission.READ_IMAGEVIDEO)).assertEqual(0);
      expect(recorder.getCountBySession('REC_SESSION_1')).assertEqual(2);
      expect(recorder.getCountBySession('REC_SESSION_3')).assertEqual(0);
    });

    // GrantRequestRecorder: requests stay chronological and copyable.
    it('grant_recorder_should_stay_chronological', 0, async () => {
      const recorder = new GrantRequestRecorder();
      recorder.record('REC_SESSION_1', RecorderPermission.CAPTURE_SCREEN, 1000, GrantResultState.SUCCESS);
      recorder.record('REC_SESSION_1', RecorderPermission.WRITE_IMAGEVIDEO, 2000, GrantResultState.SUCCESS);
      expect(recorder.isChronological()).assertTrue();
      const requests: GrantRequest[] = recorder.getRequests();
      expect(requests.length).assertEqual(2);
      expect(requests[1].permission).assertEqual(RecorderPermission.WRITE_IMAGEVIDEO);
      recorder.clear();
      expect(recorder.getRequestCount()).assertEqual(0);
      expect(recorder.isChronological()).assertTrue();
    });

    // GrantOutcome: success detection and payload conversion.
    it('grant_outcome_should_detect_success', 0, async () => {
      const success = new GrantOutcome('REC_SESSION_1', GrantResultState.SUCCESS, 'granted');
      const failed = new GrantOutcome('REC_SESSION_1', GrantResultState.FAILED, 'denied by user');
      expect(success.isSuccess()).assertTrue();
      expect(failed.isSuccess()).assertFalse();
      expect(success.isValid()).assertTrue();
      expect(new GrantOutcome('', GrantResultState.FAILED, 'x').isValid()).assertFalse();
      const data: GrantOutcomeData = success.toData();
      expect(data.state).assertEqual(GrantResultState.SUCCESS);
    });

    // GrantOutcome: equality and cloning.
    it('grant_outcome_should_compare_and_clone', 0, async () => {
      const outcome = new GrantOutcome('REC_SESSION_1', GrantResultState.PENDING, 'waiting');
      expect(outcome.equals(outcome.clone())).assertTrue();
      expect(outcome.equals(new GrantOutcome('REC_SESSION_1', GrantResultState.LOCKED, 'waiting'))).assertFalse();
      expect(outcome.toString().length).assertLarger(0);
    });

    // PermissionSpecValidator: permission name rules.
    it('permission_validator_should_check_names', 0, async () => {
      const validator = new PermissionSpecValidator();
      expect(validator.isValidPermissionName(RecorderPermission.CAPTURE_SCREEN)).assertTrue();
      expect(validator.isValidPermissionName('capture_screen')).assertFalse();
      expect(validator.isValidPermissionName('ohos.permission.')).assertFalse();
      expect(validator.isSystemPermission(RecorderPermission.SYSTEM_FLOAT_WINDOW)).assertTrue();
      expect(validator.isMediaPermission(RecorderPermission.WRITE_IMAGEVIDEO)).assertTrue();
      expect(validator.isMediaPermission(RecorderPermission.CAPTURE_SCREEN)).assertFalse();
    });

    // PermissionSpecValidator: required set accounting.
    it('permission_validator_should_account_required_set', 0, async () => {
      const validator = new PermissionSpecValidator();
      const provisioner = new RecorderPermissionProvisioner();
      const required: string[] = provisioner.getRequired();
      const granted: string[] = [RecorderPermission.CAPTURE_SCREEN, RecorderPermission.SYSTEM_FLOAT_WINDOW];
      expect(validator.countGranted(granted, required)).assertEqual(2);
      expect(validator.hasAllRequired(granted, required)).assertFalse();
      const missing: string[] = validator.getMissing(granted, required);
      expect(missing.length).assertEqual(1);
      expect(missing[0]).assertEqual(RecorderPermission.WRITE_IMAGEVIDEO);
      expect(validator.hasAllRequired(required, required)).assertTrue();
      expect(validator.getMissing(required, required).length).assertEqual(0);
    });

    // AuthorizationStatistics: authorization rate over sessions.
    it('statistics_should_compute_authorization_rate', 0, async () => {
      const provisioner = new RecorderPermissionProvisioner();
      const first = new RecordingAuthSession();
      provisioner.provision(first);
      const second = new RecordingAuthSession();
      provisioner.provision(second);
      const third = new RecordingAuthSession();
      const stats = new AuthorizationStatistics();
      expect(stats.getAuthorizationRate([first, second, third])).assertEqual(2 / 3);
      expect(stats.countGranted([first, second, third])).assertEqual(2);
      expect(stats.getAuthorizationRate([])).assertEqual(0);
    });

    // AuthorizationStatistics: all ready detection and level resolution.
    it('statistics_should_detect_all_ready', 0, async () => {
      const provisioner = new RecorderPermissionProvisioner();
      const first = new RecordingAuthSession();
      provisioner.provision(first);
      const second = new RecordingAuthSession();
      provisioner.provision(second);
      const stats = new AuthorizationStatistics();
      expect(stats.isAllReady([first, second])).assertTrue();
      second.expire();
      expect(stats.isAllReady([first, second])).assertFalse();
      expect(stats.countByState([first, second], PermissionGrantState.DENIED)).assertEqual(1);
      expect(stats.resolveLevel(new RecordingAuthSession())).assertEqual(RecordingAuthLevel.NONE);
    });

    // RecorderPermissionProvisioner: required set is stable and complete.
    it('provisioner_should_expose_required_set', 0, async () => {
      const provisioner = new RecorderPermissionProvisioner();
      const required: string[] = provisioner.getRequired();
      expect(required.length).assertEqual(3);
      expect(required.includes(RecorderPermission.CAPTURE_SCREEN)).assertTrue();
      expect(required.includes(RecorderPermission.SYSTEM_FLOAT_WINDOW)).assertTrue();
      expect(required.includes(RecorderPermission.WRITE_IMAGEVIDEO)).assertTrue();
      const session = new RecordingAuthSession();
      expect(provisioner.provision(session)).assertEqual(3);
      expect(session.canStartRecording()).assertTrue();
    });

    // UI smoke check: the system float window permission gate stays observable.
    it('float_window_gate_should_stay_observable', 0, async () => {
      const session = new RecordingAuthSession();
      session.grant(RecorderPermission.SYSTEM_FLOAT_WINDOW);
      hilog.info(DOMAIN, TAG, 'float window permission granted for observation');
      expect(session.isGranted(RecorderPermission.SYSTEM_FLOAT_WINDOW)).assertTrue();
      expect(session.canStartRecording()).assertFalse();
    });
  });
}