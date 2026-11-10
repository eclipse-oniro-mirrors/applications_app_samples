/**
 * 字段级合并预览。
 *
 * 冲突处理的常见做法是"二选一"：整份本地或整份对端。用户实际想要的是按字段决定：
 * 标题用本地、正文用对端、标签合并。要做到这点需要三样东西同时在场：
 * 本次本地值、对端值、以及双方共同认可的基线值。
 *
 * 有基线才能区分"我改了"和"他没改"；没有基线时任何自动合并都是猜测，
 * 本模块在这种情况下明确降级为"逐字段人工确认"，不猜。
 */

/** 三方取值来源。 */
export enum FieldChoice {
  LOCAL = '采用本地',
  REMOTE = '采用对端',
  BASE = '回退基线',
  MANUAL = '需人工确认'
}

/** 单个字段的三方取值。 */
export class FieldTriple {
  key: string = '';
  label: string = '';
  base: string = '';
  local: string = '';
  remote: string = '';

  constructor(key: string = '', label: string = '') {
    this.key = key;
    this.label = label;
  }

  /** 本地是否改过。 */
  localChanged(): boolean {
    return this.local !== this.base;
  }

  /** 对端是否改过。 */
  remoteChanged(): boolean {
    return this.remote !== this.base;
  }

  /** 双方是否都改过且改得不一致。 */
  conflict(): boolean {
    return this.localChanged() && this.remoteChanged() && this.local !== this.remote;
  }

  /** 双方是否改成了同一个值。 */
  converged(): boolean {
    return this.localChanged() && this.remoteChanged() && this.local === this.remote;
  }

  /** 无冲突时的自动取值；有冲突时返回 NEEDS_MANUAL。 */
  automaticChoice(): FieldChoice {
    if (this.converged()) {
      return FieldChoice.LOCAL;
    }
    if (this.conflict()) {
      return FieldChoice.MANUAL;
    }
    if (this.localChanged()) {
      return FieldChoice.LOCAL;
    }
    if (this.remoteChanged()) {
      return FieldChoice.REMOTE;
    }
    return FieldChoice.BASE;
  }

  describe(): string {
    return `${this.label}｜基线 ${this.base.length === 0 ? '(空)' : this.base}｜本地 ${this.local.length === 0 ? '(空)' : this.local}｜对端 ${this.remote.length === 0 ? '(空)' : this.remote}`;
  }
}

/** 一个字段的最终决定。 */
export class FieldDecision {
  key: string = '';
  choice: FieldChoice = FieldChoice.BASE;
  /** 决定采用的取值。 */
  value: string = '';
  /** 是否有冲突。 */
  conflicted: boolean = false;
  /** 冲突说明；无冲突时为空串。 */
  reason: string = '';

  constructor(key: string = '', choice: FieldChoice = FieldChoice.BASE, value: string = '') {
    this.key = key;
    this.choice = choice;
    this.value = value;
  }

  describe(): string {
    return `${this.key}｜${this.choice as string}｜${this.value.length === 0 ? '(空)' : this.value}${this.conflicted ? '｜冲突：' + this.reason : ''}`;
  }
}

/** 合并计划。 */
export class MergePlan {
  decisions: FieldDecision[] = [];
  /** 是否存在需要人工确认的字段。 */
  hasManual(): boolean {
    return this.decisions.some((item: FieldDecision): boolean => item.choice === FieldChoice.MANUAL);
  }

  /** 冲突字段数。 */
  conflictCount(): number {
    return this.decisions.filter((item: FieldDecision): boolean => item.conflicted).length;
  }

  /** 已定字段数。 */
  settledCount(): number {
    return this.decisions.filter((item: FieldDecision): boolean => item.choice !== FieldChoice.MANUAL).length;
  }

  decisionOf(key: string): FieldDecision | undefined {
    return this.decisions.find((item: FieldDecision): boolean => item.key === key);
  }

  /** 人工指定某个字段的取值。 */
  choose(key: string, choice: FieldChoice, value: string): boolean {
    const found = this.decisionOf(key);
    if (found === undefined || choice === FieldChoice.MANUAL) {
      return false;
    }
    found.choice = choice;
    found.value = value;
    return true;
  }
}

/** 合并结果。 */
export class MergeResult {
  keys: string[] = [];
  values: string[] = [];
  /** 未决定的字段。 */
  public pending: string[] = [];

  valueOf(key: string): string {
    const index: number = this.keys.indexOf(key);
    return index < 0 ? '' : this.values[index];
  }

  complete(): boolean {
    return this.pending.length === 0;
  }

  describe(): string {
    if (!this.complete()) {
      return `还有 ${this.pending.length} 个字段待确认：${this.pending.join('/')}`;
    }
    return `已合并 ${this.keys.length} 个字段`;
  }
}

/**
 * 生成合并计划。
 *
 * 三条判定依次进行：双方改成同一值 → 采用该值；只有一方改过 → 采用改动方；
 * 双方改成不同值 → 标记冲突并等待人工确认。没有基线时全部转人工，
 * 因为无法区分"对端没改"和"对端删了"。
 */
export function planMerge(triples: FieldTriple[], hasBaseline: boolean): MergePlan {
  const plan: MergePlan = new MergePlan();
  triples.forEach((triple: FieldTriple): void => {
    if (!hasBaseline) {
      const manual: FieldDecision = new FieldDecision(triple.key, FieldChoice.MANUAL, triple.local);
      manual.conflicted = triple.local !== triple.remote;
      manual.reason = '缺少共同基线，无法判断谁改过';
      plan.decisions.push(manual);
      return;
    }
    const choice: FieldChoice = triple.automaticChoice();
    if (choice === FieldChoice.MANUAL) {
      const manual: FieldDecision = new FieldDecision(triple.key, FieldChoice.MANUAL, '');
      manual.conflicted = true;
      manual.reason = '双方都改过且取值不同';
      plan.decisions.push(manual);
      return;
    }
    const value: string = choice === FieldChoice.LOCAL ? triple.local :
      (choice === FieldChoice.REMOTE ? triple.remote : triple.base);
    const decision: FieldDecision = new FieldDecision(triple.key, choice, value);
    decision.conflicted = false;
    decision.reason = '';
    plan.decisions.push(decision);
  });
  return plan;
}

/** 按计划生成合并结果；未决定的字段进入 pending。 */
export function applyMerge(plan: MergePlan): MergeResult {
  const result: MergeResult = new MergeResult();
  plan.decisions.forEach((decision: FieldDecision): void => {
    if (decision.choice === FieldChoice.MANUAL) {
      result.pending.push(decision.key);
      return;
    }
    result.keys.push(decision.key);
    result.values.push(decision.value);
  });
  return result;
}

/** 预览展示行。 */
export function previewLines(plan: MergePlan): string[] {
  const lines: string[] = [];
  const conflicts: number = plan.conflictCount();
  if (plan.decisions.length === 0) {
    lines.push('没有可合并的字段');
    return lines;
  }
  lines.push(`共 ${plan.decisions.length} 个字段｜已定 ${plan.settledCount()}｜冲突 ${conflicts}`);
  plan.decisions.forEach((decision: FieldDecision): void => {
    lines.push(decision.describe());
  });
  if (plan.hasManual()) {
    lines.push('存在待确认字段：确认前不写回任何一侧');
  }
  return lines;
}

/** 冲突字段 key 列表。 */
export function conflictKeys(plan: MergePlan): string[] {
  return plan.decisions.filter((decision: FieldDecision): boolean => decision.conflicted)
    .map((decision: FieldDecision): string => decision.key);
}

/** 一键把全部冲突字段指向某一侧，用于"整份采用"的快捷操作。 */
export function resolveAll(plan: MergePlan, triples: FieldTriple[], side: FieldChoice): number {
  let resolved: number = 0;
  plan.decisions.forEach((decision: FieldDecision): void => {
    if (decision.choice !== FieldChoice.MANUAL) {
      return;
    }
    const triple = triples.find((item: FieldTriple): boolean => item.key === decision.key);
    if (triple === undefined) {
      return;
    }
    decision.choice = side;
    decision.value = side === FieldChoice.REMOTE ? triple.remote : triple.local;
    resolved++;
  });
  return resolved;
}

/** 三方一致性统计，用于说明"这次冲突到底有多严重"。 */
export function tripleStats(triples: FieldTriple[]): string {
  const conflicts: number = triples.filter((triple: FieldTriple): boolean => triple.conflict()).length;
  const converged: number = triples.filter((triple: FieldTriple): boolean => triple.converged()).length;
  const localOnly: number = triples.filter((triple: FieldTriple): boolean =>
    triple.localChanged() && !triple.remoteChanged()).length;
  const remoteOnly: number = triples.filter((triple: FieldTriple): boolean =>
    !triple.localChanged() && triple.remoteChanged()).length;
  return `字段 ${triples.length}｜仅本地改 ${localOnly}｜仅对端改 ${remoteOnly}｜双方一致 ${converged}｜真冲突 ${conflicts}`;
}
