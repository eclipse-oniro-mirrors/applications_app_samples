import { process, util } from '@kit.ArkTS';
import { systemDateTime } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

interface LaunchEvidence {
  id: string;
  source: string;
  hyperSnapConfirmed: boolean;
  startedUptimeMs: number;
}

interface LaunchPhaseRow {
  event: string;
  id: string;
  pid: number;
  phase: string;
  source: string;
  hyperSnapConfirmed: boolean;
  wallTimeMs: number;
  elapsedFromObservedCallbackMs: number;
  scope: string;
}

let current: LaunchEvidence | undefined = undefined;

/** Only the real AbilityStage callback may set hyperSnapConfirmed. */
export function beginLaunchEvidence(source: string): void {
  current = {
    id: util.generateRandomUUID(),
    source: source,
    hyperSnapConfirmed: source === 'AbilityStage.onLaunchFromHyperSnap',
    startedUptimeMs: systemDateTime.getUptime(systemDateTime.TimeType.STARTUP, false)
  };
  logLaunchPhase(source);
}

export function logLaunchPhase(phase: string): void {
  if (current === undefined) {
    beginLaunchEvidence('unobserved-stage');
  }
  const evidence = current;
  if (evidence === undefined) {
    return;
  }
  const row: LaunchPhaseRow = {
    event: 'launch',
    id: evidence.id,
    pid: process.pid,
    phase: phase,
    source: evidence.source,
    hyperSnapConfirmed: evidence.hyperSnapConfirmed,
    wallTimeMs: Date.now(),
    elapsedFromObservedCallbackMs:
      systemDateTime.getUptime(systemDateTime.TimeType.STARTUP, false) - evidence.startedUptimeMs,
    scope: 'AbilityStage callback to phase; not tap-to-first-frame'
  };
  hilog.info(0x1A00, 'AppPerformanceMeasure', '%{public}s', JSON.stringify(row));
}
