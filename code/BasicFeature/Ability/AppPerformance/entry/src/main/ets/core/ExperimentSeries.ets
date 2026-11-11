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

import { ExperimentRecord } from './ExperimentLedger';

export const SERIES_MIN_REPETITIONS: number = 1;
export const SERIES_MAX_REPETITIONS: number = 10;
export const SERIES_DEFAULT_REPETITIONS: number = 3;

export enum SeriesPhase {
  PREPARING = 'preparing',
  RUNNING = 'running',
  STOPPING = 'stopping',
  CANCELLING = 'cancelling',
  COMPLETED = 'completed',
  STOPPED = 'stopped',
  CANCELLED = 'cancelled',
  FAILED = 'failed',
  CONDITION_CHANGED = 'condition-changed',
  SAVE_FAILED = 'save-failed',
  INTERRUPTED = 'interrupted'
}

export function validSeriesCount(value: number): boolean {
  return Number.isSafeInteger(value) && value >= SERIES_MIN_REPETITIONS && value <= SERIES_MAX_REPETITIONS;
}

export function seriesActive(phase: SeriesPhase): boolean {
  return [SeriesPhase.PREPARING, SeriesPhase.RUNNING, SeriesPhase.STOPPING,
    SeriesPhase.CANCELLING].indexOf(phase) >= 0;
}

export class SeriesStartResult {
  public accepted: boolean = false;
  public ownerId: string = '';
  public message: string = '';

  constructor(accepted: boolean = false, ownerId: string = '', message: string = '') {
    this.accepted = accepted;
    this.ownerId = ownerId;
    this.message = message;
  }
}

/** Only ownership/progress and references; actual samples live in ExperimentLedger. */
export class ExperimentSeriesState {
  public version: number = 1;
  public ownerId: string = '';
  public workloadId: string = '';
  public mode: string = 'control';
  public repetitions: number = SERIES_DEFAULT_REPETITIONS;
  public phase: SeriesPhase = SeriesPhase.PREPARING;
  public startedAt: number = 0;
  public endedAt: number = 0;
  public startedCount: number = 0;
  public activeIteration: number = 0;
  public recordIds: string[] = [];
  public baselineRecordId: string = '';
  public stopRequested: boolean = false;
  public cancelRequested: boolean = false;
  public conditionChanged: boolean = false;
  public saveState: string = 'saving';
  public message: string = '';
  // The following observations are recomputed from live service/ledger state.
  public leaseHeld: boolean = false;
  public waitingForSdk: boolean = false;
  public missingRecordIds: string[] = [];

  clone(): ExperimentSeriesState {
    const copy = new ExperimentSeriesState();
    copy.version = this.version;
    copy.ownerId = this.ownerId;
    copy.workloadId = this.workloadId;
    copy.mode = this.mode;
    copy.repetitions = this.repetitions;
    copy.phase = this.phase;
    copy.startedAt = this.startedAt;
    copy.endedAt = this.endedAt;
    copy.startedCount = this.startedCount;
    copy.activeIteration = this.activeIteration;
    copy.recordIds = this.recordIds.slice();
    copy.baselineRecordId = this.baselineRecordId;
    copy.stopRequested = this.stopRequested;
    copy.cancelRequested = this.cancelRequested;
    copy.conditionChanged = this.conditionChanged;
    copy.saveState = this.saveState;
    copy.message = this.message;
    copy.leaseHeld = this.leaseHeld;
    copy.waitingForSdk = this.waitingForSdk;
    copy.missingRecordIds = this.missingRecordIds.slice();
    return copy;
  }
}

function integerIn(value: Object, low: number, high: number): boolean {
  return typeof value === 'number' && Number.isSafeInteger(value as number) &&
    (value as number) >= low && (value as number) <= high;
}

/** Restart never replays a prepared/in-flight iteration or acquires a fresh SDK lease. */
export function restoreExperimentSeries(value: Object | undefined,
  records: ExperimentRecord[], now: number): ExperimentSeriesState | undefined {
  if (value === undefined || value === null || typeof value !== 'object' || Array.isArray(value)) { return undefined; }
  const bag = value as Record<string, Object>;
  const phases: string[] = [SeriesPhase.PREPARING, SeriesPhase.RUNNING, SeriesPhase.STOPPING,
    SeriesPhase.CANCELLING, SeriesPhase.COMPLETED, SeriesPhase.STOPPED, SeriesPhase.CANCELLED,
    SeriesPhase.FAILED, SeriesPhase.CONDITION_CHANGED, SeriesPhase.SAVE_FAILED, SeriesPhase.INTERRUPTED];
  if (bag['version'] !== 1 || typeof bag['ownerId'] !== 'string' ||
    (bag['ownerId'] as string).length === 0 || (bag['ownerId'] as string).length > 160 ||
    typeof bag['workloadId'] !== 'string' || !/^W-(TEXT|NOTES|IMAGES|FORM)$/.test(bag['workloadId'] as string) ||
    typeof bag['mode'] !== 'string' || ['control', 'files', 'modules'].indexOf(bag['mode'] as string) < 0 ||
    !integerIn(bag['repetitions'], SERIES_MIN_REPETITIONS, SERIES_MAX_REPETITIONS) ||
    !integerIn(bag['startedCount'], 0, bag['repetitions'] as number) ||
    !integerIn(bag['activeIteration'], 0, bag['repetitions'] as number) ||
    typeof bag['phase'] !== 'string' || phases.indexOf(bag['phase'] as string) < 0 ||
    typeof bag['startedAt'] !== 'number' || !Number.isFinite(bag['startedAt'] as number) ||
    (bag['startedAt'] as number) <= 0 || (now > 0 && (bag['startedAt'] as number) > now + 60000) ||
    typeof bag['endedAt'] !== 'number' || !Number.isFinite(bag['endedAt'] as number) ||
    (bag['endedAt'] as number) < 0 ||
    ((bag['endedAt'] as number) > 0 && (bag['endedAt'] as number) < (bag['startedAt'] as number)) ||
    !Array.isArray(bag['recordIds'])) { return undefined; }
  const ids: string[] = [];
  let invalid: boolean = false;
  (bag['recordIds'] as Object[]).forEach((id: Object): void => {
    if (typeof id !== 'string' || (id as string).length === 0 || (id as string).length > 160 ||
      ids.indexOf(id as string) >= 0) { invalid = true; return; }
    ids.push(id as string);
  });
  if (invalid || ids.length > (bag['repetitions'] as number) || ids.length > (bag['startedCount'] as number)) {
    return undefined;
  }
  const state = new ExperimentSeriesState();
  state.ownerId = bag['ownerId'] as string;
  state.workloadId = bag['workloadId'] as string;
  state.mode = bag['mode'] as string;
  state.repetitions = bag['repetitions'] as number;
  state.startedAt = bag['startedAt'] as number;
  state.endedAt = bag['endedAt'] as number;
  state.startedCount = bag['startedCount'] as number;
  state.activeIteration = bag['activeIteration'] as number;
  state.recordIds = ids;
  state.phase = bag['phase'] as SeriesPhase;
  state.baselineRecordId = typeof bag['baselineRecordId'] === 'string' ? bag['baselineRecordId'] as string : '';
  if (state.baselineRecordId.length > 0 && ids.indexOf(state.baselineRecordId) < 0) { return undefined; }
  state.stopRequested = bag['stopRequested'] === true;
  state.cancelRequested = bag['cancelRequested'] === true;
  state.conditionChanged = bag['conditionChanged'] === true;
  state.message = typeof bag['message'] === 'string' ? (bag['message'] as string).slice(0, 1024) : '';
  state.saveState = 'saved';
  if (state.startedCount > ids.length + 1 ||
    (!seriesActive(state.phase) && (state.endedAt === 0 || state.activeIteration !== 0)) ||
    (state.phase === SeriesPhase.COMPLETED &&
      (ids.length !== state.repetitions || state.startedCount !== state.repetitions))) { return undefined; }
  if (seriesActive(state.phase)) {
    const unknown: number = state.activeIteration;
    state.phase = SeriesPhase.INTERRUPTED;
    state.endedAt = Math.max(state.startedAt, now);
    state.activeIteration = 0;
    state.message = unknown > 0 ? `进程已结束，第 ${unknown} 次结果未知；系列中断，不会重放` :
      '进程已结束，系列中断；未执行次数不会自动继续';
  }
  if (ids.some((id: string): boolean => records.some((record: ExperimentRecord): boolean =>
    record.id === id && (record.workloadId !== state.workloadId || record.mode !== state.mode)))) { return undefined; }
  state.missingRecordIds = ids.filter((id: string): boolean => !records.some((record: ExperimentRecord): boolean =>
    record.id === id && record.workloadId === state.workloadId && record.mode === state.mode));
  return state;
}
