import { MaintenanceFlow, MaintenanceStep } from './Types';
import { MetricSample, ThresholdEntry, ThresholdKind, ThresholdUnit, ThresholdLevel,
  Limit, ThresholdReport, evaluateThresholds } from './ThresholdCatalog';
import { GateRule, GateCompare, GateLevel, GateReport, evaluateGate } from './RegressionGate';

export const FLOW_KEYS: string[] = ['discover', 'config', 'warm', 'evict', 'reread', 'configAgain'];
const FLOW_BUDGETS_MS: number[] = [400, 150, 2000, 2000, 2000, 150];

/** Actual six-stage observations only. Missing/running/skipped stages never become zero latency. */
export function flowMetricSamples(flow: MaintenanceFlow | undefined): MetricSample[] {
  const samples: MetricSample[] = [];
  if (flow === undefined || flow.steps.length === 0) { return samples; }
  flow.steps.forEach((step: MaintenanceStep): void => {
    if (FLOW_KEYS.indexOf(step.key) >= 0 && ['成功', '失败', '超时', '已取消'].indexOf(step.status) >= 0 &&
      Number.isFinite(step.elapsed) && step.elapsed >= 0) {
      samples.push(new MetricSample(`stage.${step.key}.ms`, step.elapsed));
    }
  });
  if (flow.endedAt > 0 && flow.steps.length === FLOW_KEYS.length) {
    const failed: number = flow.steps.filter((step: MaintenanceStep): boolean =>
      ['失败', '超时', '已取消'].indexOf(step.status) >= 0).length;
    const skipped: number = flow.steps.filter((step: MaintenanceStep): boolean => step.status === '跳过').length;
    const succeeded: number = flow.steps.filter((step: MaintenanceStep): boolean => step.status === '成功').length;
    const total: number = flow.steps.reduce((sum: number, step: MaintenanceStep): number => sum + step.elapsed, 0);
    samples.push(new MetricSample('run.total.ms', total));
    samples.push(new MetricSample('run.failed.count', failed));
    samples.push(new MetricSample('run.skipped.count', skipped));
    samples.push(new MetricSample('success.ratio', Math.round(succeeded / FLOW_KEYS.length * 1000) / 10));
    if (flow.digestBefore.length > 0) { samples.push(new MetricSample('load.bytes', flow.beforeBytes)); }
  }
  return samples;
}

export function flowThresholds(): ThresholdEntry[] {
  const entries: ThresholdEntry[] = FLOW_KEYS.map((key: string, index: number): ThresholdEntry =>
    new ThresholdEntry(`FLOW-${key}`, `stage.${key}.ms`, ThresholdKind.LATENCY, ThresholdUnit.MILLIS,
      Limit.AT_MOST, FLOW_BUDGETS_MS[index], ThresholdLevel.MUST, '本示例真实阶段预算，不代表系统承诺'));
  entries.push(new ThresholdEntry('FLOW-success', 'success.ratio', ThresholdKind.RATIO, ThresholdUnit.PERCENT,
    Limit.AT_LEAST, 100, ThresholdLevel.MUST, '所有真实阶段须成功，早停或缺失不可通过'));
  return entries;
}

export function evaluateFlowThresholds(flow: MaintenanceFlow | undefined): ThresholdReport {
  return evaluateThresholds(flowMetricSamples(flow), flowThresholds());
}

export function flowGateRules(): GateRule[] {
  const rules: GateRule[] = flowThresholds().map((entry: ThresholdEntry): GateRule =>
    new GateRule(entry.entryId, entry.key, entry.limit === Limit.AT_LEAST ? GateCompare.AT_LEAST : GateCompare.AT_MOST,
      entry.value, GateLevel.BLOCKING, entry.rationale));
  rules.push(new GateRule('FLOW-failed', 'run.failed.count', GateCompare.AT_MOST, 0, GateLevel.BLOCKING, '失败不能放行'));
  return rules;
}

export function evaluateFlowGate(flow: MaintenanceFlow | undefined): GateReport {
  return evaluateGate(flowMetricSamples(flow), flowGateRules());
}
