import { ExperimentRecord, digestLedger } from './ExperimentLedger';
import { ExperimentSeriesState, SeriesPhase, SERIES_DEFAULT_REPETITIONS,
  SERIES_MIN_REPETITIONS, SERIES_MAX_REPETITIONS, seriesActive, validSeriesCount } from './ExperimentSeries';

export class SeriesPanelView {
  public repetitions: number = SERIES_DEFAULT_REPETITIONS;
  public canDecrease: boolean = true;
  public canIncrease: boolean = true;
  public canStart: boolean = true;
  public canStopAfterCurrent: boolean = false;
  public canCancelNow: boolean = false;
  public canCopyReport: boolean = false;
  public scopeText: string = '负载与模式由上方选择；默认重复3次';
  public progressText: string = '尚未开始系列';
  public phaseText: string = '未开始';
  public saveText: string = '尚无系列存档';
  public referenceText: string = '可用 0 / 0 条，缺失 0 条';
  public isolationText: string = '';
  public message: string = '';
  public statistics: string[] = [];
}

export function seriesPhaseLabel(phase: SeriesPhase): string {
  switch (phase) {
    case SeriesPhase.PREPARING: return '准备中';
    case SeriesPhase.RUNNING: return '运行中';
    case SeriesPhase.STOPPING: return '等待本次完成后停止';
    case SeriesPhase.CANCELLING: return '正在取消本地等待';
    case SeriesPhase.COMPLETED: return '已完成';
    case SeriesPhase.STOPPED: return '已停止';
    case SeriesPhase.CANCELLED: return '已取消';
    case SeriesPhase.CONDITION_CHANGED: return '条件变化，已停止';
    case SeriesPhase.SAVE_FAILED: return '保存失败，已停止';
    case SeriesPhase.INTERRUPTED: return '进程结束，系列中断';
    default: return '实验失败，已停止';
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
  view.message = notice;
  if (series === undefined) {
    view.isolationText = quarantined ? 'SDK尚未settle，继续隔离；不会自动重发' : '';
    return view;
  }
  const actual = records.filter((record: ExperimentRecord): boolean => series.recordIds.indexOf(record.id) >= 0 &&
    record.workloadId === series.workloadId && record.mode === series.mode);
  const valid: number = actual.filter((record: ExperimentRecord): boolean => record.complete()).length;
  const missing: number = series.recordIds.filter((id: string): boolean =>
    !actual.some((record: ExperimentRecord): boolean => record.id === id)).length;
  const remaining: number = Math.max(0, series.repetitions - series.startedCount);
  const current: string = series.activeIteration > 0 ? `第 ${series.activeIteration} / ${series.repetitions} 次；` : '';
  view.progressText = `${current}已开始 ${series.startedCount}；已结束 ${series.recordIds.length}；` +
    `有效 ${valid}；失败/缺失 ${actual.length - valid + missing}；未执行 ${remaining}`;
  view.scopeText = `结果来源：${series.workloadId} / ${series.mode}；计划 ${series.repetitions} 次`;
  view.phaseText = seriesPhaseLabel(series.phase);
  view.saveText = series.saveState === 'saved' ? '已保存' :
    series.saveState === 'failed' ? '保存失败，当前结果仅在内存保留' : '保存中，尚未确认落盘';
  view.referenceText = `可用 ${actual.length} / ${series.recordIds.length} 条，缺失 ${missing} 条`;
  view.isolationText = quarantined || series.waitingForSdk ? 'SDK尚未settle，继续隔离；不会自动重发' : '';
  view.message = series.message || notice;
  const active: boolean = held && seriesActive(series.phase);
  view.canStopAfterCurrent = active && !series.stopRequested && !series.cancelRequested;
  view.canCancelNow = active && !series.cancelRequested && !quarantined;
  view.canCopyReport = actual.length > 0;
  view.statistics = digestLedger(actual).map((digest): string => digest.text());
  return view;
}
