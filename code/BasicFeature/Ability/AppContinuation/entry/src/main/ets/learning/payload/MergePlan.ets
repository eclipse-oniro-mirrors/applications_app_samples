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

import { localize, legacyLabel } from '../../common/LocaleStrings';
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

/** 三方取值来源。取值是稳定标识，显示经 legacyLabel 映射。 */
export enum FieldChoice {
  LOCAL = 'local',
  REMOTE = 'remote',
  BASE = 'base',
  MANUAL = 'manual'
}

/** 单个字段的三方取值。 */
export class FieldTriple {
  public key: string = '';
  public label: string = '';
  public base: string = '';
  public local: string = '';
  public remote: string = '';

  constructor(key: string = '', label: string = '') {
    this.key = key;
    this.label = label;
  }

  /** 本地是否改过。 */
  public localChanged(): boolean {
    return this.local !== this.base;
  }

  /** 对端是否改过。 */
  public remoteChanged(): boolean {
    return this.remote !== this.base;
  }

  /** 双方是否都改过且改得不一致。 */
  public conflict(): boolean {
    return this.localChanged() && this.remoteChanged() && this.local !== this.remote;
  }

  /** 双方是否改成了同一个值。 */
  public converged(): boolean {
    return this.localChanged() && this.remoteChanged() && this.local === this.remote;
  }

  /** 无冲突时的自动取值；有冲突时返回 NEEDS_MANUAL。 */
  public automaticChoice(): FieldChoice {
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

  public describe(): string {
    return localize('ac_mergeplan_005', [this.label, this.base.length === 0 ? localize('ac_mergeplan_006') : this.base]) +
      localize('ac_mergeplan_007', [this.local.length === 0 ? localize('ac_mergeplan_006') : this.local]) +
      localize('ac_mergeplan_009', [this.remote.length === 0 ? localize('ac_mergeplan_006') : this.remote]);
  }
}

/** 一个字段的最终决定。 */
export class FieldDecision {
  public key: string = '';
  public choice: FieldChoice = FieldChoice.BASE;
  /** 决定采用的取值。 */
  public value: string = '';
  /** 是否有冲突。 */
  public conflicted: boolean = false;
  /** 冲突说明；无冲突时为空串。 */
  public reason: string = '';

  constructor(key: string = '', choice: FieldChoice = FieldChoice.BASE, value: string = '') {
    this.key = key;
    this.choice = choice;
    this.value = value;
  }

  public describe(): string {
    return `${this.key}｜${legacyLabel(this.choice as string)}｜${this.value.length === 0 ? localize('ac_mergeplan_006') : this.value}` +
      `${this.conflicted ? localize('ac_mergeplan_012') + this.reason : ''}`;
  }
}

/** 合并计划。 */
export class MergePlan {
  public decisions: FieldDecision[] = [];
  /** 是否存在需要人工确认的字段。 */
  public hasManual(): boolean {
    return this.decisions.some((item: FieldDecision): boolean => item.choice === FieldChoice.MANUAL);
  }

  /** 冲突字段数。 */
  public conflictCount(): number {
    return this.decisions.filter((item: FieldDecision): boolean => item.conflicted).length;
  }

  /** 已定字段数。 */
  public settledCount(): number {
    return this.decisions.filter((item: FieldDecision): boolean => item.choice !== FieldChoice.MANUAL).length;
  }

  public decisionOf(key: string): FieldDecision | undefined {
    return this.decisions.find((item: FieldDecision): boolean => item.key === key);
  }

  /** 人工指定某个字段的取值。 */
  public choose(key: string, choice: FieldChoice, value: string): boolean {
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
  public keys: string[] = [];
  public values: string[] = [];
  /** 未决定的字段。 */
  public pending: string[] = [];

  public valueOf(key: string): string {
    const index: number = this.keys.indexOf(key);
    return index < 0 ? '' : this.values[index];
  }

  public complete(): boolean {
    return this.pending.length === 0;
  }

  public describe(): string {
    if (!this.complete()) {
      return localize('ac_mergeplan_013', [this.pending.length, this.pending.join('/')]);
    }
    return localize('ac_mergeplan_014', [this.keys.length]);
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
      manual.reason = localize('ac_mergeplan_015');
      plan.decisions.push(manual);
      return;
    }
    const choice: FieldChoice = triple.automaticChoice();
    if (choice === FieldChoice.MANUAL) {
      const manual: FieldDecision = new FieldDecision(triple.key, FieldChoice.MANUAL, '');
      manual.conflicted = true;
      manual.reason = localize('ac_mergeplan_016');
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
    lines.push(localize('ac_mergeplan_017'));
    return lines;
  }
  lines.push(localize('ac_mergeplan_018', [plan.decisions.length, plan.settledCount(), conflicts]));
  plan.decisions.forEach((decision: FieldDecision): void => {
    lines.push(decision.describe());
  });
  if (plan.hasManual()) {
    lines.push(localize('ac_mergeplan_019'));
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
  return localize('ac_mergeplan_020', [triples.length, localOnly, remoteOnly]) +
    localize('ac_mergeplan_021', [converged, conflicts]);
}
