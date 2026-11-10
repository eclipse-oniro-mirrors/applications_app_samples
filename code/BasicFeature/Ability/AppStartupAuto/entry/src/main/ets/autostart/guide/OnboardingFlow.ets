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
      return '认识功能';
    case OnboardingGroup.PERMISSION:
      return '授权准备';
    case OnboardingGroup.CAPABILITY:
      return '能力确认';
    case OnboardingGroup.PRACTICE:
      return '实际操作';
    default:
      return '收尾';
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
      return '已完成';
    case StepStatus.SKIPPED:
      return '已跳过';
    case StepStatus.BLOCKED:
      return '被阻塞';
    default:
      return '待完成';
  }
}

/** 是否算作已处理。 */
export function settled(status: StepStatus): boolean {
  return status === StepStatus.DONE || status === StepStatus.SKIPPED;
}

/** 一步定义。 */
export class OnboardingStep {
  stepId: string = '';
  title: string = '';
  detail: string = '';
  group: OnboardingGroup = OnboardingGroup.INTRO;
  /** 依赖的前置步骤编号。 */
  dependsOn: string[] = [];
  /** 是否允许跳过。 */
  skippable: boolean = false;
  /** 预计耗时（秒）。 */
  seconds: number = 0;

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
      `${this.skippable ? '可跳过' : '必做'}`;
  }
}

/** 步骤表。 */
export const ONBOARDING_STEPS: OnboardingStep[] = [
  new OnboardingStep('OB-01', '了解开机自启的作用', '说明本示例只做查询与设置引导',
    OnboardingGroup.INTRO, [], false, 20),
  new OnboardingStep('OB-02', '了解能力检测与开关查询的区别', '两种结果语义不同',
    OnboardingGroup.INTRO, ['OB-01'], false, 30),
  new OnboardingStep('OB-03', '确认设备形态', '不同形态支持情况不同',
    OnboardingGroup.INTRO, ['OB-01'], false, 15),
  new OnboardingStep('OB-04', '确认系统版本', '低于 API 9 无对应接口',
    OnboardingGroup.INTRO, ['OB-01'], false, 15),
  new OnboardingStep('OB-05', '打开应用信息页', '从系统设置进入',
    OnboardingGroup.PERMISSION, ['OB-04'], false, 25),
  new OnboardingStep('OB-06', '授予必要的权限', '按提示授权后返回',
    OnboardingGroup.PERMISSION, ['OB-05'], false, 40),
  new OnboardingStep('OB-07', '确认权限已生效', '返回后自动复查',
    OnboardingGroup.PERMISSION, ['OB-06'], false, 20),
  new OnboardingStep('OB-08', '执行一次能力检测', '点击能力检测按钮',
    OnboardingGroup.CAPABILITY, ['OB-07'], false, 20),
  new OnboardingStep('OB-09', '执行一次状态查询', '点击查询按钮',
    OnboardingGroup.CAPABILITY, ['OB-08'], false, 20),
  new OnboardingStep('OB-10', '查看查询历史', '确认历史记录已生成',
    OnboardingGroup.CAPABILITY, ['OB-09'], true, 20),
  new OnboardingStep('OB-11', '查看诊断报告', '确认自检全部通过或了解原因',
    OnboardingGroup.CAPABILITY, ['OB-09'], true, 30),
  new OnboardingStep('OB-12', '按指引进入系统设置', '从引导页跳转',
    OnboardingGroup.PRACTICE, ['OB-09'], true, 30),
  new OnboardingStep('OB-13', '在系统设置中打开开关', '按设备实际界面操作',
    OnboardingGroup.PRACTICE, ['OB-12'], true, 60),
  new OnboardingStep('OB-14', '返回应用复查结果', '确认开关状态已变化',
    OnboardingGroup.PRACTICE, ['OB-13'], true, 25),
  new OnboardingStep('OB-15', '导出一份查询历史', '确认导出内容可读',
    OnboardingGroup.PRACTICE, ['OB-10'], true, 25),
  new OnboardingStep('OB-16', '查看故障与归档说明', '了解常见现象与清理策略',
    OnboardingGroup.CLOSING, ['OB-11'], true, 30),
  new OnboardingStep('OB-17', '确认历史保留策略', '了解自动清理规则',
    OnboardingGroup.CLOSING, ['OB-16'], true, 20),
  new OnboardingStep('OB-18', '设置完成', '后续可在设置中重新进入引导',
    OnboardingGroup.CLOSING, ['OB-17'], false, 10),
  new OnboardingStep('OB-19', '了解跨设备差异', '同功能在不同设备结论不同',
    OnboardingGroup.INTRO, ['OB-03'], true, 25),
  new OnboardingStep('OB-20', '了解不支持不等于失败', '确定性不支持不会重试',
    OnboardingGroup.INTRO, ['OB-02'], true, 20)
];

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
  stepId: string = '';
  status: StepStatus = StepStatus.PENDING;

  constructor(stepId: string = '', status: StepStatus = StepStatus.PENDING) {
    this.stepId = stepId;
    this.status = status;
  }
}

/** 流程。 */
export class OnboardingFlow {
  records: StepRecord[] = [];

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
    const next: string = current === undefined ? '全部完成' : `下一步 ${current.stepId}`;
    return `进度 ${this.progress()}%｜完成 ${this.doneCount()}、跳过 ${this.skippedCount()}｜${next}`;
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
  ok: boolean = false;
  findings: string[] = [];

  summary(): string {
    return this.ok ? '引导步骤表自洽' : this.findings.join('；');
  }
}

/** 校验：编号连续、依赖存在且不成环、第一步无依赖。 */
export function auditOnboarding(): OnboardingAudit {
  const audit: OnboardingAudit = new OnboardingAudit();
  const ids: string[] = stepIds();
  ONBOARDING_STEPS.forEach((step: OnboardingStep, index: number): void => {
    const expected: string = `OB-${(index + 1).toString().padStart(2, '0')}`;
    if (step.stepId !== expected) {
      audit.findings.push(`编号不连续：期望 ${expected}，实际 ${step.stepId}`);
    }
    if (step.title.length === 0) {
      audit.findings.push(`缺少标题：${step.stepId}`);
    }
    if (step.seconds < 0) {
      audit.findings.push(`耗时为负：${step.stepId}`);
    }
    step.dependsOn.forEach((dep: string): void => {
      if (ids.indexOf(dep) < 0) {
        audit.findings.push(`依赖不存在：${step.stepId} -> ${dep}`);
      }
      if (dep === step.stepId) {
        audit.findings.push(`依赖自身：${step.stepId}`);
      }
      const depIndex: number = ids.indexOf(dep);
      if (depIndex >= 0 && depIndex >= index) {
        audit.findings.push(`依赖顺序错误：${step.stepId} -> ${dep}`);
      }
    });
  });
  if (ONBOARDING_STEPS.length > 0 && ONBOARDING_STEPS[0].dependsOn.length > 0) {
    audit.findings.push('首步不应有依赖');
  }
  if (mandatorySteps().length === 0) {
    audit.findings.push('缺少必做步骤');
  }
  audit.ok = audit.findings.length === 0;
  return audit;
}

/** 步骤摘要行。 */
export function stepLines(): string[] {
  return ONBOARDING_STEPS.map((step: OnboardingStep): string => step.text());
}
