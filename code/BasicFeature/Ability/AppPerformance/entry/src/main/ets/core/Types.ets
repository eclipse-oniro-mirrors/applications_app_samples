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

import { message } from './TextMessages';

export enum SnapFlag {
  UNSET = 'unset',
  ENABLED = 'enabled',
  DISABLED = 'disabled'
}

export enum ContentLoadGroup {
  INITIAL = 'initial',
  ENABLED = 'enabled',
  DISABLED = 'disabled'
}

export enum StepStatus {
  PENDING = 'pending',
  RUNNING = 'running',
  SUCCESS = 'success',
  FAILED = 'failed',
  TIMEOUT = 'timeout',
  CANCELLED = 'cancelled',
  SKIPPED = 'skipped'
}

export const FAILED_STEP_STATUSES: string[] = [StepStatus.FAILED, StepStatus.TIMEOUT, StepStatus.CANCELLED];
export const OBSERVED_STEP_STATUSES: string[] = [
  StepStatus.SUCCESS, StepStatus.FAILED, StepStatus.TIMEOUT, StepStatus.CANCELLED
];
export const RECORDED_STEP_STATUSES: string[] = OBSERVED_STEP_STATUSES.concat([StepStatus.SKIPPED]);

export enum FlowStatus {
  NOT_RUN = 'not_run',
  RUNNING = 'running',
  COMPLETED = 'completed',
  COMPLETED_WITH_FAILURES = 'completed_with_failures',
  STOPPED = 'stopped',
  EXECUTION_ERROR = 'execution_error',
  UNFINISHED = 'unfinished',
  NO_TARGETS = 'no_targets',
  INVALID_CONFIG = 'invalid_config',
  WORKLOAD_FAILED = 'workload_failed',
  EVICTION_FAILED = 'eviction_failed',
  TIMEOUT = 'flow_timeout',
  CANCELLED = 'flow_cancelled'
}

export enum ConfigStatus {
  VALID = 'valid',
  INVALID = 'invalid',
  READ_FAILED = 'config_read_failed'
}

export enum IntegrityStatus {
  UNCHECKED = 'unchecked',
  CONSISTENT = 'consistent',
  INCONSISTENT = 'inconsistent',
  RESOURCE_MATCH = 'resource_match',
  RESOURCE_MISMATCH = 'resource_mismatch',
  RESOURCE_READ_FAILED = 'resource_read_failed'
}

export enum ObservationStatus {
  UNOBSERVED = 'unobserved',
  UNOBSERVABLE = 'unobservable'
}

export enum CallStatus {
  CALLING = 'calling',
  SUCCEEDED = 'call_succeeded',
  FAILED = 'call_failed',
  BLOCKED = 'blocked',
  TIMEOUT = 'wait_timeout',
  PROCESS_ENDED = 'process_ended'
}

/** Resolve semantic codes only at display boundaries; stored values never depend on locale. */
export function statusText(value: string): string {
  switch (value) {
    case SnapFlag.UNSET: return message('ap_ui_not_set_yet');
    case SnapFlag.ENABLED: return message('ap_ui_enabled');
    case SnapFlag.DISABLED: return message('ap_ui_disabled');
    case ContentLoadGroup.INITIAL: return message('ap_ui_initial');
    case StepStatus.PENDING: return message('ap_ui_pending');
    case StepStatus.RUNNING: return message('ap_ui_running');
    case StepStatus.SUCCESS: return message('ap_ui_succeeded');
    case StepStatus.FAILED: return message('ap_ui_failed');
    case StepStatus.TIMEOUT: return message('ap_ui_timed_out');
    case StepStatus.CANCELLED: return message('ap_ui_cancelled');
    case StepStatus.SKIPPED: return message('ap_ui_skipped');
    case FlowStatus.NOT_RUN: return message('ap_ui_not_run');
    case FlowStatus.COMPLETED: return message('ap_ui_completed');
    case FlowStatus.COMPLETED_WITH_FAILURES: return message('ap_dynamic_completed_with_failures');
    case FlowStatus.STOPPED: return message('ap_ui_stopped');
    case FlowStatus.EXECUTION_ERROR: return message('ap_dynamic_stopped_execution_error');
    case FlowStatus.UNFINISHED: return message('ap_dynamic_stopped_execution_did_not_finish');
    case FlowStatus.NO_TARGETS: return message('ap_dynamic_stopped_no_available_targets_discovered');
    case FlowStatus.INVALID_CONFIG: return message('ap_dynamic_stopped_invalid_configuration_no_eviction_request_sent');
    case FlowStatus.WORKLOAD_FAILED: return message('ap_dynamic_stopped_workload_read_failed_no_eviction_request_sent');
    case FlowStatus.EVICTION_FAILED: return message('ap_dynamic_stopped_eviction_request_failed_or_was_blocked');
    case FlowStatus.TIMEOUT: return message('ap_dynamic_timed_out_system_request_not_cancelled');
    case FlowStatus.CANCELLED: return message('ap_dynamic_cancelled_local_waiting_only');
    case ConfigStatus.VALID: return message('ap_dynamic_valid_configuration');
    case ConfigStatus.INVALID: return message('ap_dynamic_invalid_configuration');
    case ConfigStatus.READ_FAILED: return message('ap_dynamic_configuration_read_failed');
    case IntegrityStatus.UNCHECKED: return message('ap_ui_not_verified');
    case IntegrityStatus.CONSISTENT: return message('ap_ui_consistent');
    case IntegrityStatus.INCONSISTENT: return message('ap_ui_inconsistent');
    case IntegrityStatus.RESOURCE_MATCH: return message('ap_dynamic_business_resource_integrity_matches');
    case IntegrityStatus.RESOURCE_MISMATCH: return message('ap_dynamic_business_resource_integrity_does_not_match');
    case IntegrityStatus.RESOURCE_READ_FAILED: return message('ap_dynamic_business_resource_re_read_failed');
    case ObservationStatus.UNOBSERVED: return message('ap_ui_not_observed');
    case ObservationStatus.UNOBSERVABLE: return message('ap_ui_not_observable');
    case CallStatus.CALLING: return message('ap_ui_calling');
    case CallStatus.SUCCEEDED: return message('ap_ui_call_succeeded');
    case CallStatus.FAILED: return message('ap_ui_call_failed');
    case CallStatus.BLOCKED: return message('ap_dynamic_blocked');
    case CallStatus.TIMEOUT: return message('ap_dynamic_wait_timed_out');
    case CallStatus.PROCESS_ENDED: return message('ap_dynamic_process_ended');
    default: return value;
  }
}

export class EvictionResult {
  public status: string = 'not-dispatched';
  public dispatched: boolean = false;
  public inFlight: boolean = false;
  public code: number = -1;
  public recordId: number = 0;
}

export interface CallRecord {
  id: number;
  api: string;
  target: string;
  status: string;
  kind: string;
  at: number;
  elapsed: number;
  code: number;
  message: string;
  late: boolean;
}

export function emptyCallRecord(): CallRecord {
  return {
    id: 0,
    api: '',
    target: '',
    status: '',
    kind: 'pending',
    at: 0,
    elapsed: 0,
    code: 0,
    message: '',
    late: false
  };
}

export interface LaunchSample {
  id: string;
  group: string;
  at: number;
  contentMs: number;
  device: string;
  appVersion: string;
}

export class MaintenanceStep {
  public key: string = '';
  public label: string = '';
  public status: string = StepStatus.PENDING;
  public detail: string = '';
  public elapsed: number = 0;

  clone(): MaintenanceStep {
    const copy: MaintenanceStep = new MaintenanceStep();
    copy.key = this.key;
    copy.label = this.label;
    copy.status = this.status;
    copy.detail = this.detail;
    copy.elapsed = this.elapsed;
    return copy;
  }
}

export class MaintenanceFlow {
  public id: number = 0;
  public mode: string = 'files';
  public status: string = FlowStatus.NOT_RUN;
  public startedAt: number = 0;
  public endedAt: number = 0;
  public steps: MaintenanceStep[] = [];
  public notice: string = '';
  public integrity: string = IntegrityStatus.UNCHECKED;
  public beforeBytes: number = 0;
  public afterBytes: number = 0;
  public digestBefore: string = '';
  public digestAfter: string = '';
  public condition: string = '';

  clone(): MaintenanceFlow {
    const copy: MaintenanceFlow = new MaintenanceFlow();
    copy.id = this.id;
    copy.mode = this.mode;
    copy.status = this.status;
    copy.startedAt = this.startedAt;
    copy.endedAt = this.endedAt;
    copy.steps = this.steps.map((step: MaintenanceStep): MaintenanceStep => step.clone());
    copy.notice = this.notice;
    copy.integrity = this.integrity;
    copy.beforeBytes = this.beforeBytes;
    copy.afterBytes = this.afterBytes;
    copy.digestBefore = this.digestBefore;
    copy.digestAfter = this.digestAfter;
    copy.condition = this.condition;
    return copy;
  }
}

export interface AppState {
  deviceText: string;
  foreground: boolean;
  files: string[];
  modules: string[];
  targetMessage: string;
  configText: string;
  configStatus: string;
  configTargets: string[];
  maintenance: MaintenanceFlow | undefined;
  maintenanceBusy: boolean;
  memoryBusy: boolean;
  resourceBusy: boolean;
  resourceText: string;
  latestMemory: CallRecord | undefined;
  snapFlag: string;
  snapAt: number;
  rebuildAt: number;
  rebuildWaitSeconds: number;
  logs: CallRecord[];
  launches: LaunchSample[];
  storageMessage: string;
  notice: string;
}

export function emptyAppState(): AppState {
  return {
    deviceText: '',
    foreground: true,
    files: [],
    modules: [],
    targetMessage: '',
    configText: '',
    configStatus: '',
    configTargets: [],
    maintenance: undefined,
    maintenanceBusy: false,
    memoryBusy: false,
    resourceBusy: false,
    resourceText: message('ap_ui_not_read_yet'),
    latestMemory: undefined,
    snapFlag: SnapFlag.UNSET,
    snapAt: 0,
    rebuildAt: 0,
    rebuildWaitSeconds: 0,
    logs: [],
    launches: [],
    storageMessage: '',
    notice: ''
  };
}

export function formatTime(value: number): string {
  if (value <= 0) {
    return '—';
  }
  const time = new Date(value);
  const pad = (part: number): string => part.toString().padStart(2, '0');
  return `${time.getFullYear()}-${pad(time.getMonth() + 1)}-${pad(time.getDate())} ` +
    `${pad(time.getHours())}:${pad(time.getMinutes())}:${pad(time.getSeconds())}`;
}
