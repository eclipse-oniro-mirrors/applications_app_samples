import { ExperimentSeriesState } from './ExperimentSeries';
import { SeriesComparison } from './SeriesHistory';
import { ReportFormat } from './report/ReportExport';
import { seriesPhaseLabel } from './SeriesPresentation';

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
  public selectedText: string = '尚未选择系列历史';
  public comparisonText: string = '尚未选择另一个对照系列';
  public availabilityText: string = '没有所选系列引用';
  public format: ReportFormat = ReportFormat.MARKDOWN;
  public formatText: string = 'Markdown';
  public status: string = '';
  public canCopy: boolean = false;
  public copying: boolean = false;
  public comparisonLines: string[] = ['选择两个不同系列查看同条件比较'];
}

export function buildSeriesHistoryView(history: ExperimentSeriesState[], selection: SeriesHistorySelection,
  comparison: SeriesComparison | undefined = undefined): SeriesHistoryView {
  const view = new SeriesHistoryView();
  view.selectedOwnerId = selection.selectedOwnerId; view.comparisonOwnerId = selection.comparisonOwnerId;
  view.format = selection.format;
  view.formatText = selection.format === ReportFormat.CSV ? 'CSV' : 'Markdown';
  view.status = selection.status; view.copying = selection.copying;
  history.forEach((state: ExperimentSeriesState, index: number): void => {
    const row = new SeriesHistoryRow(); row.ownerId = state.ownerId;
    row.title = `系列${index + 1}｜${state.workloadId} / ${state.mode}｜${seriesPhaseLabel(state.phase)}`;
    row.detail = `计划 ${state.repetitions}；开始 ${state.startedCount}；记录 ${state.recordIds.length}；` +
      `可用 ${state.recordIds.length - state.missingRecordIds.length}；缺失 ${state.missingRecordIds.length}`;
    row.selected = state.ownerId === selection.selectedOwnerId;
    row.comparisonBase = state.ownerId === selection.comparisonOwnerId;
    if (row.selected) {
      view.selectedText = `已选：${row.title}`;
      view.availabilityText = row.detail;
      view.canCopy = state.recordIds.length > state.missingRecordIds.length && !selection.copying;
    }
    if (row.comparisonBase) { view.comparisonText = `对照：${row.title}`; }
    view.rows.push(row);
  });
  if (selection.selectedOwnerId.length > 0 && !history.some((state: ExperimentSeriesState): boolean =>
    state.ownerId === selection.selectedOwnerId)) {
    view.selectedText = '所选系列元信息已淘汰；请显式重新选择';
    view.availabilityText = '不可用：不从其他系列借用记录';
  }
  if (selection.comparisonOwnerId.length > 0 && !history.some((state: ExperimentSeriesState): boolean =>
    state.ownerId === selection.comparisonOwnerId)) { view.comparisonText = '对照系列元信息已淘汰；请重新选择'; }
  if (comparison !== undefined) { view.comparisonLines = comparison.lines(); }
  return view;
}
