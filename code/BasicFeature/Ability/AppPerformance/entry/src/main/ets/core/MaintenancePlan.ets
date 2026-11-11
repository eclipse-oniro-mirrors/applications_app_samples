/**
 * 维护（回收）计划的步骤目录与编排。
 *
 * 清理文件、重建缓存、回收内存这些动作之间有依赖关系：必须先把目标扫描完才能
 * 校验，校验通过才能执行，执行完必须回读确认。把这些依赖写成显式的步骤表，
 * 由拓扑排序决定执行顺序，页面只按顺序重放，避免"某一步被跳过"这类问题。
 */

/** 步骤类别。 */
export enum StepKind {
  SCAN = 'scan',
  VALIDATE = 'validate',
  PREPARE = 'prepare',
  EXECUTE = 'execute',
  VERIFY = 'verify',
  CLEANUP = 'cleanup'
}

/** 类别标签。 */
export function stepKindLabel(kind: StepKind): string {
  switch (kind) {
    case StepKind.SCAN:
      return '扫描';
    case StepKind.VALIDATE:
      return '校验';
    case StepKind.PREPARE:
      return '准备';
    case StepKind.EXECUTE:
      return '执行';
    case StepKind.VERIFY:
      return '回读';
    default:
      return '收尾';
  }
}

/** 步骤定义。 */
export class PlanStep {
  public key: string = '';
  public label: string = '';
  public kind: StepKind = StepKind.SCAN;
  /** 依赖的步骤 key。 */
  public dependsOn: string[] = [];
  /** 预计耗时（毫秒），用于展示与超时预算。 */
  public weightMs: number = 0;
  /** 是否关键步骤：失败即整体判定失败。 */
  public critical: boolean = false;
  /** 失败后是否允许重试。 */
  public retryable: boolean = false;

  constructor(key: string = '', label: string = '', kind: StepKind = StepKind.SCAN,
    dependsOn: string[] = [], weightMs: number = 0, critical: boolean = false,
    retryable: boolean = false) {
    this.key = key;
    this.label = label;
    this.kind = kind;
    this.dependsOn = dependsOn;
    this.weightMs = weightMs;
    this.critical = critical;
    this.retryable = retryable;
  }

  /** 说明文本。 */
  text(): string {
    const dep: string = this.dependsOn.length === 0 ? '无依赖' : `依赖 ${this.dependsOn.join(',')}`;
    return `${this.key} ${this.label}｜${stepKindLabel(this.kind)}｜${dep}｜${this.weightMs} ms`;
  }
}

/** 步骤目录。依赖只能指向目录内已存在的步骤。 */
export const STEP_CATALOG: PlanStep[] = [
  new PlanStep('scan-files', '扫描应用文件', StepKind.SCAN, [], 120, true, true),
  new PlanStep('scan-cache', '扫描缓存目录', StepKind.SCAN, [], 90, true, true),
  new PlanStep('scan-memory', '读取内存快照', StepKind.SCAN, [], 60, false, true),
  new PlanStep('validate-files', '校验文件清单', StepKind.VALIDATE, ['scan-files'], 40, true, false),
  new PlanStep('validate-cache', '校验缓存清单', StepKind.VALIDATE, ['scan-cache'], 40, true, false),
  new PlanStep('prepare-budget', '计算清理预算', StepKind.PREPARE,
    ['validate-files', 'validate-cache'], 50, true, false),
  new PlanStep('execute-files', '清理过期文件', StepKind.EXECUTE, ['prepare-budget'], 400, true, false),
  new PlanStep('execute-cache', '清理缓存文件', StepKind.EXECUTE, ['prepare-budget'], 320, true, false),
  new PlanStep('execute-memory', '回收可释放内存', StepKind.EXECUTE,
    ['scan-memory', 'prepare-budget'], 260, false, false),
  new PlanStep('verify-files', '回读文件剩余量', StepKind.VERIFY, ['execute-files'], 70, true, true),
  new PlanStep('verify-cache', '回读缓存剩余量', StepKind.VERIFY, ['execute-cache'], 70, true, true),
  new PlanStep('cleanup-report', '生成结果摘要', StepKind.CLEANUP,
    ['verify-files', 'verify-cache'], 30, false, false)
];

/** 步骤 key 列表。 */
export function stepKeys(): string[] {
  return STEP_CATALOG.map((step: PlanStep): string => step.key);
}

/** 按 key 取步骤。 */
export function stepOf(key: string): PlanStep | undefined {
  return STEP_CATALOG.find((step: PlanStep): boolean => step.key === key);
}

/** 按类别取步骤。 */
export function stepsOfKind(kind: StepKind): PlanStep[] {
  return STEP_CATALOG.filter((step: PlanStep): boolean => step.kind === kind);
}

/** 计划问题。 */
export class PlanIssue {
  public stepKey: string = '';
  public reason: string = '';

  constructor(stepKey: string = '', reason: string = '') {
    this.stepKey = stepKey;
    this.reason = reason;
  }

  text(): string {
    return `${this.stepKey}：${this.reason}`;
  }
}

/** 编排结果。 */
export class PlanGraph {
  public order: string[] = [];
  /** 无法排序的步骤（成环或依赖缺失）。 */
  public blocked: string[] = [];
  public issues: PlanIssue[] = [];

  ok(): boolean {
    return this.blocked.length === 0 && this.issues.length === 0;
  }

  /** 摘要文本。 */
  summary(): string {
    if (this.ok()) {
      return `可执行，顺序：${this.order.join(' -> ')}`;
    }
    return `存在 ${this.issues.length} 个问题，阻塞 ${this.blocked.length} 步`;
  }
}

/** 校验依赖是否存在、是否成环。 */
function validateDependencies(): PlanIssue[] {
  const issues: PlanIssue[] = [];
  const known: string[] = stepKeys();
  STEP_CATALOG.forEach((step: PlanStep): void => {
    step.dependsOn.forEach((dep: string): void => {
      if (known.indexOf(dep) < 0) {
        issues.push(new PlanIssue(step.key, `依赖不存在：${dep}`));
      }
      if (dep === step.key) {
        issues.push(new PlanIssue(step.key, '依赖自身'));
      }
    });
    if (step.weightMs < 0) {
      issues.push(new PlanIssue(step.key, '预计耗时为负'));
    }
    if (step.label.length === 0) {
      issues.push(new PlanIssue(step.key, '缺少名称'));
    }
  });
  return issues;
}

/** 拓扑排序。同一层按目录顺序输出，保证结果稳定可断言。 */
export function resolveOrder(): PlanGraph {
  const graph: PlanGraph = new PlanGraph();
  graph.issues = validateDependencies();
  if (graph.issues.length > 0) {
    graph.blocked = stepKeys();
    return graph;
  }
  const remaining: string[] = stepKeys();
  const done: string[] = [];
  const guard: number = remaining.length + 1;
  for (let round = 0; round < guard && remaining.length > 0; round++) {
    const ready: string[] = remaining.filter((key: string): boolean => {
      const step: PlanStep | undefined = stepOf(key);
      if (step === undefined) {
        return false;
      }
      return step.dependsOn.every((dep: string): boolean => done.indexOf(dep) >= 0);
    });
    if (ready.length === 0) {
      break;
    }
    ready.forEach((key: string): void => {
      done.push(key);
      const index: number = remaining.indexOf(key);
      if (index >= 0) {
        remaining.splice(index, 1);
      }
    });
  }
  graph.order = done;
  graph.blocked = remaining.slice();
  return graph;
}

/** 按顺序计算预计总耗时。 */
export function estimateDuration(keys: string[]): number {
  let total: number = 0;
  keys.forEach((key: string): void => {
    const step: PlanStep | undefined = stepOf(key);
    if (step !== undefined) {
      total += Math.max(0, step.weightMs);
    }
  });
  return total;
}

/** 关键路径耗时：只统计关键步骤。 */
export function criticalDuration(keys: string[]): number {
  let total: number = 0;
  keys.forEach((key: string): void => {
    const step: PlanStep | undefined = stepOf(key);
    if (step !== undefined && step.critical) {
      total += Math.max(0, step.weightMs);
    }
  });
  return total;
}

/** 单步执行结果。 */
export class StepOutcome {
  public key: string = '';
  public status: string = '待执行';
  public elapsed: number = 0;
  public detail: string = '';

  constructor(key: string = '', status: string = '待执行') {
    this.key = key;
    this.status = status;
  }

  succeeded(): boolean {
    return this.status === '成功';
  }

  failed(): boolean {
    return this.status === '失败';
  }

  skipped(): boolean {
    return this.status === '跳过';
  }

  /** 是否属于未完成。 */
  pending(): boolean {
    return this.status === '待执行';
  }

  text(): string {
    return `${this.key}｜${this.status}｜${this.elapsed} ms｜${this.detail}`;
  }
}

/** 整体判定。 */
export enum PlanVerdict {
  PASS = 'pass',
  PARTIAL = 'partial',
  FAILED = 'failed',
  BLOCKED = 'blocked'
}

/** 判定标签。 */
export function verdictLabel(verdict: PlanVerdict): string {
  switch (verdict) {
    case PlanVerdict.PASS:
      return '全部完成';
    case PlanVerdict.PARTIAL:
      return '部分完成';
    case PlanVerdict.FAILED:
      return '存在关键失败';
    default:
      return '被阻塞';
  }
}

/** 一次运行的汇总。 */
export class PlanRun {
  public order: string[] = [];
  public outcomes: StepOutcome[] = [];

  /** 按 key 取结果。 */
  outcomeOf(key: string): StepOutcome | undefined {
    return this.outcomes.find((item: StepOutcome): boolean => item.key === key);
  }

  /** 成功数。 */
  succeeded(): number {
    return this.outcomes.filter((item: StepOutcome): boolean => item.succeeded()).length;
  }

  /** 失败数。 */
  failed(): number {
    return this.outcomes.filter((item: StepOutcome): boolean => item.failed()).length;
  }

  /** 跳过数。 */
  skipped(): number {
    return this.outcomes.filter((item: StepOutcome): boolean => item.skipped()).length;
  }

  /** 总耗时。 */
  totalElapsed(): number {
    return this.outcomes.reduce((sum: number, item: StepOutcome): number =>
      sum + Math.max(0, item.elapsed), 0);
  }

  /** 判定。 */
  verdict(): PlanVerdict {
    if (this.outcomes.length === 0) {
      return PlanVerdict.BLOCKED;
    }
    let criticalFailure: boolean = false;
    this.outcomes.forEach((item: StepOutcome): void => {
      const step: PlanStep | undefined = stepOf(item.key);
      if (step !== undefined && step.critical && item.failed()) {
        criticalFailure = true;
      }
    });
    if (criticalFailure) {
      return PlanVerdict.FAILED;
    }
    if (this.failed() > 0 || this.skipped() > 0) {
      return PlanVerdict.PARTIAL;
    }
    return PlanVerdict.PASS;
  }

  /** 一句话结论。 */
  headline(): string {
    const verdict: PlanVerdict = this.verdict();
    return `${verdictLabel(verdict)}｜成功 ${this.succeeded()} 步，失败 ${this.failed()} 步，` +
      `跳过 ${this.skipped()} 步`;
  }

  /** 失败但可重试的步骤。 */
  retryables(): string[] {
    return this.outcomes.filter((item: StepOutcome): boolean => {
      if (!item.failed()) {
        return false;
      }
      const step: PlanStep | undefined = stepOf(item.key);
      return step !== undefined && step.retryable;
    }).map((item: StepOutcome): string => item.key);
  }

  /** 逐行文本。 */
  text(): string {
    const lines: string[] = [this.headline()];
    this.outcomes.forEach((item: StepOutcome): void => {
      lines.push(item.text());
    });
    return lines.join('\n');
  }
}

/** 按编排顺序执行。缺少结果的步骤视为跳过，依赖失败的步骤也跳过。 */
export function evaluateRun(order: string[], results: StepOutcome[]): PlanRun {
  const run: PlanRun = new PlanRun();
  run.order = order.slice();
  const failedKeys: string[] = [];
  order.forEach((key: string): void => {
    const provided: StepOutcome | undefined =
      results.find((item: StepOutcome): boolean => item.key === key);
    const step: PlanStep | undefined = stepOf(key);
    if (step !== undefined && step.dependsOn.some((dep: string): boolean =>
      failedKeys.indexOf(dep) >= 0)) {
      run.outcomes.push(new StepOutcome(key, '跳过'));
      return;
    }
    if (provided === undefined) {
      run.outcomes.push(new StepOutcome(key, '跳过'));
      return;
    }
    run.outcomes.push(provided);
    if (provided.failed()) {
      failedKeys.push(key);
    }
  });
  return run;
}

/** 计划自检。 */
export class PlanAudit {
  public ok: boolean = false;
  public findings: string[] = [];

  summary(): string {
    return this.ok ? '维护步骤表自洽' : this.findings.join('；');
  }
}

/** 校验步骤表：编号唯一、可拓扑排序、关键步骤可回读。 */
export function auditPlan(): PlanAudit {
  const audit: PlanAudit = new PlanAudit();
  const seen: string[] = [];
  STEP_CATALOG.forEach((step: PlanStep): void => {
    if (seen.indexOf(step.key) >= 0) {
      audit.findings.push(`步骤重复：${step.key}`);
    }
    seen.push(step.key);
  });
  const graph: PlanGraph = resolveOrder();
  if (!graph.ok()) {
    audit.findings.push(graph.summary());
  }
  if (graph.order.length !== STEP_CATALOG.length) {
    audit.findings.push(`编排未覆盖全部步骤：${graph.order.length}`);
  }
  if (stepsOfKind(StepKind.VERIFY).length === 0) {
    audit.findings.push('缺少回读步骤');
  }
  STEP_CATALOG.forEach((step: PlanStep): void => {
    if (step.critical && step.kind === StepKind.EXECUTE) {
      const hasVerify: boolean = STEP_CATALOG.some((item: PlanStep): boolean =>
        item.kind === StepKind.VERIFY && item.dependsOn.indexOf(step.key) >= 0);
      if (!hasVerify) {
        audit.findings.push(`关键执行步骤缺少回读：${step.key}`);
      }
    }
  });
  audit.ok = audit.findings.length === 0;
  return audit;
}

/** 目录摘要行。 */
export function planLines(): string[] {
  return STEP_CATALOG.map((step: PlanStep): string => step.text());
}
