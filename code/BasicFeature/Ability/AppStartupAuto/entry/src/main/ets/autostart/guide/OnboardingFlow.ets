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

import { formatResource, localText, registerTextRefresh } from '../text/LocalizedText';

/**
 * 首次使用引导的步骤编排。
 *
 * 引导页最容易出现两个问题：步骤与系统版本不匹配、跳过之后再也回不去。
 * 这里把步骤、前置依赖、是否可跳过、预计耗时写成表，由流程对象记录状态，
 * 页面只负责渲染"当前该做哪一步"。
 */

/** 步骤分组。 */
export enum OnboardingGroup {
  INTRO = 'intro',
  PERMISSION = 'permission',
  CAPABILITY = 'capability',
  PRACTICE = 'practice',
  CLOSING = 'closing'
}

/** 分组标签。 */
export function groupLabel(group: OnboardingGroup): string {
  switch (group) {
    case OnboardingGroup.INTRO:
      return localText('startup_text_0408');
    case OnboardingGroup.PERMISSION:
      return localText('startup_text_0409');
    case OnboardingGroup.CAPABILITY:
      return localText('startup_text_0410');
    case OnboardingGroup.PRACTICE:
      return localText('startup_text_0411');
    default:
      return localText('startup_text_0412');
  }
}

/** 步骤状态。 */
export enum StepStatus {
  PENDING = 'pending',
  DONE = 'done',
  SKIPPED = 'skipped',
  BLOCKED = 'blocked'
}

/** 状态标签。 */
export function statusLabel(status: StepStatus): string {
  switch (status) {
    case StepStatus.DONE:
      return localText('startup_text_0413');
    case StepStatus.SKIPPED:
      return localText('startup_text_0414');
    case StepStatus.BLOCKED:
      return localText('startup_text_0415');
    default:
      return localText('startup_text_0416');
  }
}

/** 是否算作已处理。 */
export function settled(status: StepStatus): boolean {
  return status === StepStatus.DONE || status === StepStatus.SKIPPED;
}

/** 一步定义。 */
export class OnboardingStep {
  public stepId: string = '';
  public title: string = '';
  public detail: string = '';
  public group: OnboardingGroup = OnboardingGroup.INTRO;
  /** 依赖的前置步骤编号。 */
  public dependsOn: string[] = [];
  /** 是否允许跳过。 */
  public skippable: boolean = false;
  /** 预计耗时（秒）。 */
  public seconds: number = 0;

  constructor(stepId: string = '', title: string = '', detail: string = '',
    group: OnboardingGroup = OnboardingGroup.INTRO, dependsOn: string[] = [],
    skippable: boolean = false, seconds: number = 30) {
    this.stepId = stepId;
    this.title = title;
    this.detail = detail;
    this.group = group;
    this.dependsOn = dependsOn;
    this.skippable = skippable;
    this.seconds = seconds;
  }

  text(): string {
    return `${this.stepId} ${this.title}｜${groupLabel(this.group)}｜${this.seconds} s｜` +
      `${this.skippable ? localText('startup_text_0417') : localText('startup_text_0418')}`;
  }
}

/** 步骤表。 */
function createONBOARDING_STEPS(): OnboardingStep[] {
  return [
  new OnboardingStep('OB-01', localText('startup_text_0419'), localText('startup_text_0420'),
    OnboardingGroup.INTRO, [], false, 20),
  new OnboardingStep('OB-02', localText('startup_text_0421'), localText('startup_text_0422'),
    OnboardingGroup.INTRO, ['OB-01'], false, 30),
  new OnboardingStep('OB-03', localText('startup_text_0423'), localText('startup_text_0424'),
    OnboardingGroup.INTRO, ['OB-01'], false, 15),
  new OnboardingStep('OB-04', localText('startup_text_0425'), localText('startup_text_0426'),
    OnboardingGroup.INTRO, ['OB-01'], false, 15),
  new OnboardingStep('OB-05', localText('startup_text_0427'), localText('startup_text_0428'),
    OnboardingGroup.PERMISSION, ['OB-04'], false, 25),
  new OnboardingStep('OB-06', localText('startup_text_0429'), localText('startup_text_0430'),
    OnboardingGroup.PERMISSION, ['OB-05'], false, 40),
  new OnboardingStep('OB-07', localText('startup_text_0431'), localText('startup_text_0432'),
    OnboardingGroup.PERMISSION, ['OB-06'], false, 20),
  new OnboardingStep('OB-08', localText('startup_text_0433'), localText('startup_text_0434'),
    OnboardingGroup.CAPABILITY, ['OB-07'], false, 20),
  new OnboardingStep('OB-09', localText('startup_text_0435'), localText('startup_text_0436'),
    OnboardingGroup.CAPABILITY, ['OB-08'], false, 20),
  new OnboardingStep('OB-10', localText('startup_text_0437'), localText('startup_text_0438'),
    OnboardingGroup.CAPABILITY, ['OB-09'], true, 20),
  new OnboardingStep('OB-11', localText('startup_text_0439'), localText('startup_text_0440'),
    OnboardingGroup.CAPABILITY, ['OB-09'], true, 30),
  new OnboardingStep('OB-12', localText('startup_text_0441'), localText('startup_text_0442'),
    OnboardingGroup.PRACTICE, ['OB-09'], true, 30),
  new OnboardingStep('OB-13', localText('startup_text_0443'), localText('startup_text_0444'),
    OnboardingGroup.PRACTICE, ['OB-12'], true, 60),
  new OnboardingStep('OB-14', localText('startup_text_0445'), localText('startup_text_0446'),
    OnboardingGroup.PRACTICE, ['OB-13'], true, 25),
  new OnboardingStep('OB-15', localText('startup_text_0447'), localText('startup_text_0448'),
    OnboardingGroup.PRACTICE, ['OB-10'], true, 25),
  new OnboardingStep('OB-16', localText('startup_text_0449'), localText('startup_text_0450'),
    OnboardingGroup.CLOSING, ['OB-11'], true, 30),
  new OnboardingStep('OB-17', localText('startup_text_0451'), localText('startup_text_0452'),
    OnboardingGroup.CLOSING, ['OB-16'], true, 20),
  new OnboardingStep('OB-18', localText('startup_text_0453'), localText('startup_text_0454'),
    OnboardingGroup.CLOSING, ['OB-17'], false, 10),
  new OnboardingStep('OB-19', localText('startup_text_0455'), localText('startup_text_0456'),
    OnboardingGroup.INTRO, ['OB-03'], true, 25),
  new OnboardingStep('OB-20', localText('startup_text_0457'), localText('startup_text_0458'),
    OnboardingGroup.INTRO, ['OB-02'], true, 20)
];
}
export const ONBOARDING_STEPS: OnboardingStep[] = createONBOARDING_STEPS();
registerTextRefresh((): void => {
  ONBOARDING_STEPS.splice(0, ONBOARDING_STEPS.length);
  createONBOARDING_STEPS().forEach((item: OnboardingStep): void => { ONBOARDING_STEPS.push(item); });
});

/** 编号列表。 */
export function stepIds(): string[] {
  return ONBOARDING_STEPS.map((step: OnboardingStep): string => step.stepId);
}

/** 按编号取步骤。 */
export function stepOf(stepId: string): OnboardingStep | undefined {
  return ONBOARDING_STEPS.find((step: OnboardingStep): boolean => step.stepId === stepId);
}

/** 按分组取步骤。 */
export function stepsOfGroup(group: OnboardingGroup): OnboardingStep[] {
  return ONBOARDING_STEPS.filter((step: OnboardingStep): boolean => step.group === group);
}

/** 必做步骤。 */
export function mandatorySteps(): OnboardingStep[] {
  return ONBOARDING_STEPS.filter((step: OnboardingStep): boolean => !step.skippable);
}

/** 可跳过步骤。 */
export function skippableSteps(): OnboardingStep[] {
  return ONBOARDING_STEPS.filter((step: OnboardingStep): boolean => step.skippable);
}

/** 总预计耗时。 */
export function totalSeconds(): number {
  return ONBOARDING_STEPS.reduce((sum: number, step: OnboardingStep): number =>
    sum + Math.max(0, step.seconds), 0);
}

/** 单步状态记录。 */
export class StepRecord {
  public stepId: string = '';
  public status: StepStatus = StepStatus.PENDING;

  constructor(stepId: string = '', status: StepStatus = StepStatus.PENDING) {
    this.stepId = stepId;
    this.status = status;
  }
}

/** 流程。 */
export class OnboardingFlow {
  public records: StepRecord[] = [];

  constructor() {
    ONBOARDING_STEPS.forEach((step: OnboardingStep): void => {
      this.records.push(new StepRecord(step.stepId, StepStatus.PENDING));
    });
  }

  /** 取状态。 */
  statusOf(stepId: string): StepStatus {
    const hit: StepRecord | undefined =
      this.records.find((record: StepRecord): boolean => record.stepId === stepId);
    return hit === undefined ? StepStatus.PENDING : hit.status;
  }

  /** 标记完成。前置未完成时拒绝。 */
  complete(stepId: string): boolean {
    const step: OnboardingStep | undefined = stepOf(stepId);
    if (step === undefined) {
      return false;
    }
    if (!this.dependenciesMet(step)) {
      return false;
    }
    this.setStatus(stepId, StepStatus.DONE);
    return true;
  }

  /** 跳过。不可跳过的步骤拒绝。 */
  skip(stepId: string): boolean {
    const step: OnboardingStep | undefined = stepOf(stepId);
    if (step === undefined || !step.skippable) {
      return false;
    }
    if (!this.dependenciesMet(step)) {
      return false;
    }
    this.setStatus(stepId, StepStatus.SKIPPED);
    return true;
  }

  private setStatus(stepId: string, status: StepStatus): void {
    this.records.forEach((record: StepRecord): void => {
      if (record.stepId === stepId) {
        record.status = status;
      }
    });
  }

  /** 前置是否都已处理。 */
  dependenciesMet(step: OnboardingStep): boolean {
    return step.dependsOn.every((dep: string): boolean => settled(this.statusOf(dep)));
  }

  /** 当前应做的步骤：第一个未处理且前置满足的步骤。 */
  current(): OnboardingStep | undefined {
    for (const step of ONBOARDING_STEPS) {
      if (!settled(this.statusOf(step.stepId)) && this.dependenciesMet(step)) {
        return step;
      }
    }
    return undefined;
  }

  /** 被阻塞步骤。 */
  blocked(): string[] {
    return ONBOARDING_STEPS.filter((step: OnboardingStep): boolean =>
      !settled(this.statusOf(step.stepId)) && !this.dependenciesMet(step))
      .map((step: OnboardingStep): string => step.stepId);
  }

  /** 完成数。 */
  doneCount(): number {
    return this.records.filter((record: StepRecord): boolean =>
      record.status === StepStatus.DONE).length;
  }

  /** 跳过数。 */
  skippedCount(): number {
    return this.records.filter((record: StepRecord): boolean =>
      record.status === StepStatus.SKIPPED).length;
  }

  /** 进度百分比。 */
  progress(): number {
    const handled: number = this.doneCount() + this.skippedCount();
    if (this.records.length === 0) {
      return 0;
    }
    return Math.round((handled / this.records.length) * 1000) / 10;
  }

  /** 必做项是否全部完成。 */
  mandatoryDone(): boolean {
    return mandatorySteps().every((step: OnboardingStep): boolean =>
      this.statusOf(step.stepId) === StepStatus.DONE);
  }

  /** 摘要文本。 */
  text(): string {
    const current: OnboardingStep | undefined = this.current();
    const next: string = current === undefined ? localText('startup_text_0459') : formatResource('startup_format_78b78fe493cb', [String(current.stepId)]);
    return formatResource('startup_format_c91c3f2c5b3d', [String(this.progress()), String(this.doneCount()), String(this.skippedCount()), String(next)]);
  }
}

/** 分组进度行。 */
export function groupProgressLines(flow: OnboardingFlow): string[] {
  const groups: OnboardingGroup[] = [OnboardingGroup.INTRO, OnboardingGroup.PERMISSION,
    OnboardingGroup.CAPABILITY, OnboardingGroup.PRACTICE, OnboardingGroup.CLOSING];
  return groups.map((group: OnboardingGroup): string => {
    const steps: OnboardingStep[] = stepsOfGroup(group);
    const handled: number = steps.filter((step: OnboardingStep): boolean =>
      settled(flow.statusOf(step.stepId))).length;
    return `${groupLabel(group)}：${handled}/${steps.length}`;
  });
}

/** 流程自检。 */
export class OnboardingAudit {
  public ok: boolean = false;
  public findings: string[] = [];

  summary(): string {
    return this.ok ? localText('startup_text_0464') : this.findings.join('；');
  }
}

/** 校验：编号连续、依赖存在且不成环、第一步无依赖。 */
export function auditOnboarding(): OnboardingAudit {
  const audit: OnboardingAudit = new OnboardingAudit();
  const ids: string[] = stepIds();
  ONBOARDING_STEPS.forEach((step: OnboardingStep, index: number): void => {
    const expected: string = `OB-${(index + 1).toString().padStart(2, '0')}`;
    if (step.stepId !== expected) {
      audit.findings.push(formatResource('startup_format_6d97c27e58d7', [String(expected), String(step.stepId)]));
    }
    if (step.title.length === 0) {
      audit.findings.push(formatResource('startup_format_ef4d5ad604f9', [String(step.stepId)]));
    }
    if (step.seconds < 0) {
      audit.findings.push(formatResource('startup_format_b42894e8985d', [String(step.stepId)]));
    }
    step.dependsOn.forEach((dep: string): void => {
      if (ids.indexOf(dep) < 0) {
        audit.findings.push(formatResource('startup_format_951b582f14c1', [String(step.stepId), String(dep)]));
      }
      if (dep === step.stepId) {
        audit.findings.push(formatResource('startup_format_03ab37bee2e6', [String(step.stepId)]));
      }
      const depIndex: number = ids.indexOf(dep);
      if (depIndex >= 0 && depIndex >= index) {
        audit.findings.push(formatResource('startup_format_d6efb65bc501', [String(step.stepId), String(dep)]));
      }
    });
  });
  if (ONBOARDING_STEPS.length > 0 && ONBOARDING_STEPS[0].dependsOn.length > 0) {
    audit.findings.push(localText('startup_text_0470'));
  }
  if (mandatorySteps().length === 0) {
    audit.findings.push(localText('startup_text_0471'));
  }
  audit.ok = audit.findings.length === 0;
  return audit;
}

/** 步骤摘要行。 */
export function stepLines(): string[] {
  return ONBOARDING_STEPS.map((step: OnboardingStep): string => step.text());
}
