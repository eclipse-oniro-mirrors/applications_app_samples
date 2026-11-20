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

import { ExperimentSeriesState } from './ExperimentSeries';
import { SeriesComparison } from './SeriesHistory';
import { ReportFormat } from './report/ReportExport';
import { seriesPhaseLabel } from './SeriesPresentation';
import { message, localize } from './TextMessages';

export class SeriesHistorySelection {
  public selectedOwnerId: string = '';
  public comparisonOwnerId: string = '';
  public format: ReportFormat = ReportFormat.MARKDOWN;
  public status: string = '';
  public copying: boolean = false;
}

export class SeriesHistoryRow {
  public ownerId: string = '';
  public title: string = '';
  public detail: string = '';
  public selected: boolean = false;
  public comparisonBase: boolean = false;
}

export class SeriesHistoryView {
  public rows: SeriesHistoryRow[] = [];
  public selectedOwnerId: string = '';
  public comparisonOwnerId: string = '';
  public selectedText: string = message('ap_series_history_none_selected');
  public comparisonText: string = message('ap_series_history_no_baseline');
  public availabilityText: string = message('ap_series_history_no_references');
  public format: ReportFormat = ReportFormat.MARKDOWN;
  public formatText: string = message('ap_series_history_format_markdown');
  public status: string = '';
  public canCopy: boolean = false;
  public copying: boolean = false;
  public comparisonLines: string[] = [message('ap_series_history_choose_comparison')];
}

export function buildSeriesHistoryView(history: ExperimentSeriesState[], selection: SeriesHistorySelection,
  comparison: SeriesComparison | undefined = undefined): SeriesHistoryView {
  const view = new SeriesHistoryView();
  view.selectedOwnerId = selection.selectedOwnerId; view.comparisonOwnerId = selection.comparisonOwnerId;
  view.format = selection.format;
  view.formatText = selection.format === ReportFormat.CSV ? message('ap_series_history_format_csv') :
    message('ap_series_history_format_markdown');
  view.status = localize(selection.status); view.copying = selection.copying;
  history.forEach((state: ExperimentSeriesState, index: number): void => {
    const row = new SeriesHistoryRow(); row.ownerId = state.ownerId;
    row.title = message('ap_series_history_row_title',
      [index + 1, state.workloadId, localize(state.mode), seriesPhaseLabel(state.phase)]);
    row.detail = message('ap_series_history_row_detail', [state.repetitions, state.startedCount,
      state.recordIds.length, state.recordIds.length - state.missingRecordIds.length, state.missingRecordIds.length]);
    row.selected = state.ownerId === selection.selectedOwnerId;
    row.comparisonBase = state.ownerId === selection.comparisonOwnerId;
    if (row.selected) {
      view.selectedText = message('ap_series_history_selected', [row.title]);
      view.availabilityText = row.detail;
      view.canCopy = state.recordIds.length > state.missingRecordIds.length && !selection.copying;
    }
    if (row.comparisonBase) { view.comparisonText = message('ap_series_history_baseline', [row.title]); }
    view.rows.push(row);
  });
  if (selection.selectedOwnerId.length > 0 && !history.some((state: ExperimentSeriesState): boolean =>
    state.ownerId === selection.selectedOwnerId)) {
    view.selectedText = message('ap_series_history_selection_evicted');
    view.availabilityText = message('ap_series_history_records_unavailable');
  }
  if (selection.comparisonOwnerId.length > 0 && !history.some((state: ExperimentSeriesState): boolean =>
    state.ownerId === selection.comparisonOwnerId)) {
    view.comparisonText = message('ap_series_history_baseline_evicted');
  }
  if (comparison !== undefined) { view.comparisonLines = comparison.lines(); }
  return view;
}
