import { systemDateTime } from '@kit.BasicServicesKit';
import { hiAppEvent, hiTraceMeter, hilog } from '@kit.PerformanceAnalysisKit';

export class BatchSpan {
  public id: number = 0;
  public stage: string = '';
  public startedAt: number = -1;
  public traceStarted: boolean = false;
}
export interface BatchTelemetry {
  begin(stage: string): BatchSpan;
  finish(span: BatchSpan): void;
}

/** Fixed stages + generated correlation only. No shortcut ID, Want, title, body, or path leaves the process. */
export class PlatformBatchTelemetry implements BatchTelemetry {
  private sequence: number = 0;
  begin(stage: string): BatchSpan {
    const span: BatchSpan = new BatchSpan();
    span.id = ++this.sequence;
    span.stage = stage;
    try { span.startedAt = systemDateTime.getUptime(systemDateTime.TimeType.STARTUP, false); } catch (_) {}
    try {
      hiTraceMeter.startAsyncTrace(hiTraceMeter.HiTraceOutputLevel.INFO, `ShortcutBatch_${stage}`,
        span.id, 'ShortcutBatch');
      span.traceStarted = true;
    } catch (_) {}
    return span;
  }
  finish(span: BatchSpan): void {
    let elapsed: number = 0;
    try {
      if (span.startedAt >= 0) {
        elapsed = Math.max(0, systemDateTime.getUptime(systemDateTime.TimeType.STARTUP, false) - span.startedAt);
      }
    } catch (_) {}
    try {
      if (span.traceStarted) {
        hiTraceMeter.finishAsyncTrace(hiTraceMeter.HiTraceOutputLevel.INFO, `ShortcutBatch_${span.stage}`, span.id);
      }
    } catch (_) {}
    try {
      hilog.info(0x1B60, 'ShortcutBatch', 'id=%{public}d stage=%{public}s elapsedMs=%{public}d',
        span.id, span.stage, elapsed);
    } catch (_) {}
    try {
      void hiAppEvent.write({ domain: 'SHORTCUT_BATCH', name: 'STAGE_END', eventType: hiAppEvent.EventType.BEHAVIOR,
        params: { correlation: span.id, stage: span.stage, elapsed_ms: elapsed } }).catch(() => {});
    } catch (_) {}
  }
}
