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

import { ExperimentRecord, digestLedger } from './ExperimentLedger';
import { ExperimentSeriesState, SeriesPhase, SERIES_DEFAULT_REPETITIONS,
  SERIES_MIN_REPETITIONS, SERIES_MAX_REPETITIONS, seriesActive, validSeriesCount } from './ExperimentSeries';
import { message, localize } from './TextMessages';

export class SeriesPanelView {
  public repetitions: number = SERIES_DEFAULT_REPETITIONS;
  public canDecrease: boolean = true;
  public canIncrease: boolean = true;
  public canStart: boolean = true;
  public canStopAfterCurrent: boolean = false;
  public canCancelNow: boolean = false;
  public canCopyReport: boolean = false;
  public scopeText: string = message('ap_series_default_scope', [SERIES_DEFAULT_REPETITIONS]);
  public progressText: string = message('ap_series_not_started');
  public phaseText: string = message('ap_series_phase_not_started');
  public phaseFailed: boolean = false;
  public saveText: string = message('ap_series_no_archive');
  public saveFailed: boolean = false;
  public referenceText: string = message('ap_series_references', [0, 0, 0]);
  public isolationText: string = '';
  public message: string = '';
  public statistics: string[] = [];
}

export function seriesPhaseLabel(phase: SeriesPhase): string {
  switch (phase) {
    case SeriesPhase.PREPARING: return message('ap_series_phase_preparing');
    case SeriesPhase.RUNNING: return message('ap_series_phase_running');
    case SeriesPhase.STOPPING: return message('ap_series_phase_stopping');
    case SeriesPhase.CANCELLING: return message('ap_series_phase_cancelling');
    case SeriesPhase.COMPLETED: return message('ap_series_phase_completed');
    case SeriesPhase.STOPPED: return message('ap_series_phase_stopped');
    case SeriesPhase.CANCELLED: return message('ap_series_phase_cancelled');
    case SeriesPhase.CONDITION_CHANGED: return message('ap_series_phase_condition_changed');
    case SeriesPhase.SAVE_FAILED: return message('ap_series_phase_save_failed');
    case SeriesPhase.INTERRUPTED: return message('ap_series_phase_interrupted');
    default: return message('ap_series_phase_failed');
  }
}

export function buildSeriesPanelView(series: ExperimentSeriesState | undefined,
  records: ExperimentRecord[], requestedCount: number = SERIES_DEFAULT_REPETITIONS,
  busy: boolean = false, quarantined: boolean = false, notice: string = ''): SeriesPanelView {
  const view = new SeriesPanelView();
  const held: boolean = series !== undefined && series.leaseHeld;
  view.repetitions = held && series !== undefined ? series.repetitions : requestedCount;
  const configurable: boolean = !busy && !quarantined;
  view.canStart = configurable && validSeriesCount(view.repetitions);
  view.canDecrease = configurable && view.repetitions > SERIES_MIN_REPETITIONS;
  view.canIncrease = configurable && view.repetitions < SERIES_MAX_REPETITIONS;
  view.message = localize(notice);
  if (series === undefined) {
    view.isolationText = quarantined ? message('ap_series_sdk_isolated') : '';
    return view;
  }
  const actual = records.filter((record: ExperimentRecord): boolean => series.recordIds.indexOf(record.id) >= 0 &&
    record.workloadId === series.workloadId && record.mode === series.mode);
  const valid: number = actual.filter((record: ExperimentRecord): boolean => record.complete()).length;
  const missing: number = series.recordIds.filter((id: string): boolean =>
    !actual.some((record: ExperimentRecord): boolean => record.id === id)).length;
  const remaining: number = Math.max(0, series.repetitions - series.startedCount);
  const current: string = series.activeIteration > 0 ?
    message('ap_series_current_iteration', [series.activeIteration, series.repetitions]) : '';
  view.progressText = message('ap_series_progress', [current, series.startedCount, series.recordIds.length,
    valid, actual.length - valid + missing, remaining]);
  view.scopeText = message('ap_series_scope', [series.workloadId, localize(series.mode), series.repetitions]);
  view.phaseText = seriesPhaseLabel(series.phase);
  view.phaseFailed = series.phase === SeriesPhase.FAILED || series.phase === SeriesPhase.SAVE_FAILED;
  view.saveFailed = series.saveState === 'failed';
  view.saveText = series.saveState === 'saved' ? message('ap_series_saved') :
    view.saveFailed ? message('ap_series_save_failed') : message('ap_series_saving');
  view.referenceText = message('ap_series_references', [actual.length, series.recordIds.length, missing]);
  view.isolationText = quarantined || series.waitingForSdk ? message('ap_series_sdk_isolated') : '';
  view.message = localize(series.message || notice);
  const active: boolean = held && seriesActive(series.phase);
  view.canStopAfterCurrent = active && !series.stopRequested && !series.cancelRequested;
  view.canCancelNow = active && !series.cancelRequested && !quarantined;
  view.canCopyReport = actual.length > 0;
  view.statistics = digestLedger(actual).map((digest): string => localize(digest.text()));
  return view;
}
