import { hiAppEvent, hilog, hiTraceMeter } from '@kit.PerformanceAnalysisKit';

/** Only fixed operation/outcome codes and local correlation IDs cross this boundary. */
export interface StartupTelemetry {
  begin(operation: string, id: number): void;
  end(operation: string, id: number, outcome: string): void;
  event(operation: string, id: number, outcome: string): void;
}

export class SystemStartupTelemetry implements StartupTelemetry {
  private active: Set<string> = new Set<string>();
  begin(operation: string, id: number): void {
    try {
      hiTraceMeter.startAsyncTrace(hiTraceMeter.HiTraceOutputLevel.COMMERCIAL,
        operation, id, 'autostart');
      this.active.add(`${operation}:${id}`);
    } catch (_) { /* Observability never changes the query. */ }
  }
  end(operation: string, id: number, outcome: string): void {
    const key = `${operation}:${id}`;
    if (this.active.delete(key)) {
      try {
        hiTraceMeter.finishAsyncTrace(hiTraceMeter.HiTraceOutputLevel.COMMERCIAL, operation, id);
      } catch (_) { /* A failed collector cannot fail the business flow. */ }
    }
    this.event(operation, id, outcome);
  }
  event(operation: string, id: number, outcome: string): void {
    try {
      hilog.info(0x1A00, 'AppStartupAuto', '%{public}s id=%{public}d outcome=%{public}s',
        operation, id, outcome);
      hiAppEvent.write({ domain: 'autostart', name: operation, eventType: hiAppEvent.EventType.BEHAVIOR,
        params: { request_id: id, outcome: outcome } }).catch((): void => {});
    } catch (_) { /* Includes synchronous write failures. */ }
  }
}

/** Even an injected/faulty collector is isolated at the business boundary. */
export function safeBegin(sink: StartupTelemetry, operation: string, id: number): void {
  try { sink.begin(operation, id); } catch (_) {}
}
export function safeEnd(sink: StartupTelemetry, operation: string, id: number, outcome: string): void {
  try { sink.end(operation, id, outcome); } catch (_) {}
}
export function safeEvent(sink: StartupTelemetry, operation: string, id: number, outcome: string): void {
  try { sink.event(operation, id, outcome); } catch (_) {}
}
