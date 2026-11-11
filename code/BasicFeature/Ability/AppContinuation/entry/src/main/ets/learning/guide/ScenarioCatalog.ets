/**
 * 接续场景目录。
 *
 * 同一份载荷在不同设备组合下的行为并不一样：手机到平板可以双向接续，穿戴只能接收。
 * 把"哪些组合、需要什么前置条件、步骤是什么、什么算成功"写成目录，页面按编号渲染，
 * 用例按编号遍历，避免场景散落在文档与代码两处。
 */

import { DeviceClass } from '../rules/ContinuationRules';

/** 载荷形态。 */
export enum PayloadShape {
  NOTE = 'note',
  READING = 'reading',
  FORM = 'form',
  CHECKLIST = 'checklist',
  MEDIA = 'media'
}

/** 载荷形态标签。 */
export function shapeLabel(shape: PayloadShape): string {
  switch (shape) {
    case PayloadShape.NOTE:
      return '便签';
    case PayloadShape.READING:
      return '阅读进度';
    case PayloadShape.FORM:
      return '表单草稿';
    case PayloadShape.CHECKLIST:
      return '清单';
    default:
      return '媒体进度';
  }
}

/** 风险等级。 */
export enum ScenarioRisk {
  LOW = 'low',
  MEDIUM = 'medium',
  HIGH = 'high'
}

/** 风险标签。 */
export function riskLabel(risk: ScenarioRisk): string {
  switch (risk) {
    case ScenarioRisk.LOW:
      return '低';
    case ScenarioRisk.MEDIUM:
      return '中';
    default:
      return '高';
  }
}

/** 风险序号。 */
export function riskOrder(risk: ScenarioRisk): number {
  switch (risk) {
    case ScenarioRisk.LOW:
      return 0;
    case ScenarioRisk.MEDIUM:
      return 1;
    default:
      return 2;
  }
}

/** 一个场景。 */
export class ScenarioEntry {
  public scenarioId: string = '';
  public title: string = '';
  public shape: PayloadShape = PayloadShape.NOTE;
  /** 发起端。 */
  public from: DeviceClass = DeviceClass.PHONE;
  /** 接收端。 */
  public to: DeviceClass = DeviceClass.PHONE;
  /** 前置条件。 */
  public requires: string[] = [];
  /** 操作步骤。 */
  public steps: string[] = [];
  /** 成功判据。 */
  public success: string = '';
  public risk: ScenarioRisk = ScenarioRisk.LOW;

  constructor(scenarioId: string = '', title: string = '', shape: PayloadShape = PayloadShape.NOTE,
    from: DeviceClass = DeviceClass.PHONE, to: DeviceClass = DeviceClass.PHONE,
    requires: string[] = [], steps: string[] = [], success: string = '',
    risk: ScenarioRisk = ScenarioRisk.LOW) {
    this.scenarioId = scenarioId;
    this.title = title;
    this.shape = shape;
    this.from = from;
    this.to = to;
    this.requires = requires;
    this.steps = steps;
    this.success = success;
    this.risk = risk;
  }

  /** 是否同设备类型。 */
  public sameDevice(): boolean {
    return this.from === this.to;
  }

  /** 单行文本。 */
  public text(): string {
    return `${this.scenarioId}｜${this.title}｜${this.from as string}->${this.to as string}｜` +
      `${shapeLabel(this.shape)}｜风险${riskLabel(this.risk)}`;
  }

  /** 步骤文本。 */
  public stepTexts(): string[] {
    return this.steps.map((step: string, index: number): string =>
      `${this.scenarioId}-${index + 1} ${step}`);
  }
}

/** 场景目录。 */
export const SCENARIO_CATALOG: ScenarioEntry[] = [
  new ScenarioEntry('SN-01', '手机便签接续到平板继续编辑', PayloadShape.NOTE,
    DeviceClass.PHONE, DeviceClass.TABLET, ['同一账号', '已授予接续权限'],
    ['在手机打开便签', '触发接续', '在平板确认接收'], '光标位置与正文一致', ScenarioRisk.LOW),
  new ScenarioEntry('SN-02', '平板便签回到手机继续编辑', PayloadShape.NOTE,
    DeviceClass.TABLET, DeviceClass.PHONE, ['同一账号'],
    ['在平板打开便签', '触发接续', '在手机确认接收'], '选区范围保持一致', ScenarioRisk.LOW),
  new ScenarioEntry('SN-03', '手机阅读进度接续到平板', PayloadShape.READING,
    DeviceClass.PHONE, DeviceClass.TABLET, ['同一账号', '阅读内容已缓存'],
    ['打开阅读页', '翻到指定页', '触发接续'], '页码与滚动位置一致', ScenarioRisk.MEDIUM),
  new ScenarioEntry('SN-04', '平板阅读进度接续到手机', PayloadShape.READING,
    DeviceClass.TABLET, DeviceClass.PHONE, ['同一账号'],
    ['打开阅读页', '触发接续'], '恢复到同一段落', ScenarioRisk.MEDIUM),
  new ScenarioEntry('SN-05', '手机表单草稿接续到平板填写', PayloadShape.FORM,
    DeviceClass.PHONE, DeviceClass.TABLET, ['同一账号', '表单未提交'],
    ['填写部分字段', '触发接续', '在平板继续填写'], '已填字段不丢失', ScenarioRisk.MEDIUM),
  new ScenarioEntry('SN-06', '平板表单草稿接续到手机填写', PayloadShape.FORM,
    DeviceClass.TABLET, DeviceClass.PHONE, ['同一账号'],
    ['填写部分字段', '触发接续'], '字段顺序与校验状态一致', ScenarioRisk.MEDIUM),
  new ScenarioEntry('SN-07', '手机清单接续到平板勾选', PayloadShape.CHECKLIST,
    DeviceClass.PHONE, DeviceClass.TABLET, ['同一账号'],
    ['勾选部分项', '触发接续'], '勾选状态逐项一致', ScenarioRisk.LOW),
  new ScenarioEntry('SN-08', '平板清单接续到手机勾选', PayloadShape.CHECKLIST,
    DeviceClass.TABLET, DeviceClass.PHONE, ['同一账号'],
    ['勾选部分项', '触发接续'], '新增项不重复', ScenarioRisk.LOW),
  new ScenarioEntry('SN-09', '手机媒体进度接续到平板播放', PayloadShape.MEDIA,
    DeviceClass.PHONE, DeviceClass.TABLET, ['同一账号', '媒体可访问'],
    ['播放到指定位置', '触发接续'], '播放位置误差在 1 秒内', ScenarioRisk.HIGH),
  new ScenarioEntry('SN-10', '平板媒体进度接续到手机播放', PayloadShape.MEDIA,
    DeviceClass.TABLET, DeviceClass.PHONE, ['同一账号'],
    ['播放到指定位置', '触发接续'], '播放位置与音轨一致', ScenarioRisk.HIGH),
  new ScenarioEntry('SN-11', '手机接续到 PC 继续编辑', PayloadShape.NOTE,
    DeviceClass.PHONE, DeviceClass.PC, ['同一账号', 'PC 已安装同款应用'],
    ['在手机编辑', '触发接续', '在 PC 确认'], '正文与选区一致', ScenarioRisk.MEDIUM),
  new ScenarioEntry('SN-12', 'PC 接续到手机继续编辑', PayloadShape.NOTE,
    DeviceClass.PC, DeviceClass.PHONE, ['同一账号'],
    ['在 PC 编辑', '触发接续'], '正文一致且不覆盖本机更新内容', ScenarioRisk.MEDIUM),
  new ScenarioEntry('SN-13', '手机接续到 TV 展示', PayloadShape.MEDIA,
    DeviceClass.PHONE, DeviceClass.TV, ['同一账号', 'TV 已登录'],
    ['打开媒体', '触发接续'], 'TV 上从同一位置开始播放', ScenarioRisk.HIGH),
  new ScenarioEntry('SN-14', 'TV 接续到手机继续播放', PayloadShape.MEDIA,
    DeviceClass.TV, DeviceClass.PHONE, ['同一账号'],
    ['在 TV 播放', '触发接续'], '手机从同一位置继续', ScenarioRisk.HIGH),
  new ScenarioEntry('SN-15', '手机接续到穿戴查看摘要', PayloadShape.NOTE,
    DeviceClass.PHONE, DeviceClass.WEARABLE, ['同一账号', '穿戴已配对'],
    ['在手机打开便签', '触发接续'], '穿戴展示截断后的摘要', ScenarioRisk.MEDIUM),
  new ScenarioEntry('SN-16', '穿戴不支持发起接续', PayloadShape.NOTE,
    DeviceClass.WEARABLE, DeviceClass.PHONE, ['同一账号'],
    ['在穿戴尝试触发接续'], '按不支持处理并提示在手机上操作', ScenarioRisk.LOW),
  new ScenarioEntry('SN-17', '两台手机之间接续', PayloadShape.NOTE,
    DeviceClass.PHONE, DeviceClass.PHONE, ['同一账号', '两台设备均已授权'],
    ['在 A 编辑', '触发接续', '在 B 确认'], 'B 上内容与 A 一致', ScenarioRisk.LOW),
  new ScenarioEntry('SN-18', '两端同时编辑触发冲突', PayloadShape.NOTE,
    DeviceClass.PHONE, DeviceClass.TABLET, ['同一账号', '两端都有未提交改动'],
    ['两端各自编辑', '触发接续'], '出现冲突确认，不静默覆盖', ScenarioRisk.HIGH),
  new ScenarioEntry('SN-19', '接续过程中设备离线', PayloadShape.NOTE,
    DeviceClass.PHONE, DeviceClass.TABLET, ['同一账号'],
    ['触发接续', '断开网络'], '失败可重试，界面不丢失本机内容', ScenarioRisk.HIGH),
  new ScenarioEntry('SN-20', '载荷超过上限时的截断接续', PayloadShape.NOTE,
    DeviceClass.PHONE, DeviceClass.TABLET, ['同一账号', '正文超过载荷上限'],
    ['在手机输入超长正文', '触发接续'], '接收端拿到截断后的正文并给出提示', ScenarioRisk.MEDIUM),
  new ScenarioEntry('SN-21', '接收端应用版本过低', PayloadShape.NOTE,
    DeviceClass.PHONE, DeviceClass.PHONE, ['两端版本不一致'],
    ['从高版本接续到低版本'], '低版本按兼容字段降级处理', ScenarioRisk.MEDIUM),
  new ScenarioEntry('SN-22', '取消接续后状态可恢复', PayloadShape.NOTE,
    DeviceClass.PHONE, DeviceClass.TABLET, ['同一账号'],
    ['触发接续', '在接收端取消'], '发起端回到空闲态且可再次发起', ScenarioRisk.LOW),
  new ScenarioEntry('SN-23', '重复触发接续只保留一次', PayloadShape.NOTE,
    DeviceClass.PHONE, DeviceClass.TABLET, ['同一账号'],
    ['连续触发两次接续'], '只处理一次，第二次被拒绝并提示', ScenarioRisk.MEDIUM),
  new ScenarioEntry('SN-24', '接续完成后回到前台刷新结果', PayloadShape.NOTE,
    DeviceClass.PHONE, DeviceClass.TABLET, ['同一账号'],
    ['完成一次接续', '切后台再回前台'], '结果与时间线一致', ScenarioRisk.LOW)
];

/** 编号列表。 */
export function scenarioIds(): string[] {
  return SCENARIO_CATALOG.map((item: ScenarioEntry): string => item.scenarioId);
}

/** 按编号取场景。 */
export function scenarioOf(scenarioId: string): ScenarioEntry | undefined {
  return SCENARIO_CATALOG.find((item: ScenarioEntry): boolean => item.scenarioId === scenarioId);
}

/** 按发起端筛选。 */
export function scenariosFrom(device: DeviceClass): ScenarioEntry[] {
  return SCENARIO_CATALOG.filter((item: ScenarioEntry): boolean => item.from === device);
}

/** 按接收端筛选。 */
export function scenariosTo(device: DeviceClass): ScenarioEntry[] {
  return SCENARIO_CATALOG.filter((item: ScenarioEntry): boolean => item.to === device);
}

/** 按载荷形态筛选。 */
export function scenariosOfShape(shape: PayloadShape): ScenarioEntry[] {
  return SCENARIO_CATALOG.filter((item: ScenarioEntry): boolean => item.shape === shape);
}

/** 按风险筛选。 */
export function scenariosOfRisk(risk: ScenarioRisk): ScenarioEntry[] {
  return SCENARIO_CATALOG.filter((item: ScenarioEntry): boolean => item.risk === risk);
}

/** 高风险场景，按编号排序。 */
export function highRiskScenarios(): ScenarioEntry[] {
  return SCENARIO_CATALOG.filter((item: ScenarioEntry): boolean =>
    item.risk === ScenarioRisk.HIGH);
}

/** 同设备类型的场景。 */
export function sameDeviceScenarios(): ScenarioEntry[] {
  return SCENARIO_CATALOG.filter((item: ScenarioEntry): boolean => item.sameDevice());
}

/** 步骤总数。 */
export function totalSteps(): number {
  return SCENARIO_CATALOG.reduce((sum: number, item: ScenarioEntry): number =>
    sum + item.steps.length, 0);
}

/** 某场景的步骤数。 */
export function stepCountOf(scenarioId: string): number {
  const entry: ScenarioEntry | undefined = scenarioOf(scenarioId);
  return entry === undefined ? 0 : entry.steps.length;
}

/** 场景统计。 */
export class ScenarioSummary {
  public total: number = 0;
  public high: number = 0;
  public medium: number = 0;
  public low: number = 0;
  public steps: number = 0;

  public text(): string {
    return `共 ${this.total} 个场景、${this.steps} 个步骤：高 ${this.high}、中 ${this.medium}、` +
      `低 ${this.low}`;
  }

  /** 高风险占比。 */
  public highRatio(): number {
    if (this.total === 0) {
      return 0;
    }
    return Math.round((this.high / this.total) * 1000) / 10;
  }
}

/** 统计场景。 */
export function summarizeScenarios(): ScenarioSummary {
  const summary: ScenarioSummary = new ScenarioSummary();
  summary.total = SCENARIO_CATALOG.length;
  summary.high = scenariosOfRisk(ScenarioRisk.HIGH).length;
  summary.medium = scenariosOfRisk(ScenarioRisk.MEDIUM).length;
  summary.low = scenariosOfRisk(ScenarioRisk.LOW).length;
  summary.steps = totalSteps();
  return summary;
}

/** 场景自检。 */
export class ScenarioAudit {
  public ok: boolean = false;
  public findings: string[] = [];

  public summary(): string {
    return this.ok ? '场景目录自洽' : this.findings.join('；');
  }
}

/** 校验目录：编号连续、步骤非空、成功判据非空。 */
export function auditScenarios(): ScenarioAudit {
  const audit: ScenarioAudit = new ScenarioAudit();
  const seen: string[] = [];
  SCENARIO_CATALOG.forEach((item: ScenarioEntry, index: number): void => {
    if (seen.indexOf(item.scenarioId) >= 0) {
      audit.findings.push(`编号重复：${item.scenarioId}`);
    }
    seen.push(item.scenarioId);
    const expected: string = `SN-${(index + 1).toString().padStart(2, '0')}`;
    if (item.scenarioId !== expected) {
      audit.findings.push(`编号不连续：期望 ${expected}，实际 ${item.scenarioId}`);
    }
    if (item.steps.length === 0) {
      audit.findings.push(`缺少步骤：${item.scenarioId}`);
    }
    if (item.success.length === 0) {
      audit.findings.push(`缺少成功判据：${item.scenarioId}`);
    }
    if (item.requires.length === 0) {
      audit.findings.push(`缺少前置条件：${item.scenarioId}`);
    }
    if (item.from === DeviceClass.UNKNOWN || item.to === DeviceClass.UNKNOWN) {
      audit.findings.push(`设备类型未确定：${item.scenarioId}`);
    }
  });
  audit.ok = audit.findings.length === 0;
  return audit;
}

/** 目录摘要行。 */
export function scenarioLines(): string[] {
  return SCENARIO_CATALOG.map((item: ScenarioEntry): string => item.text());
}

/** 全部步骤行，用于展示执行清单。 */
export function scenarioStepLines(): string[] {
  const lines: string[] = [];
  SCENARIO_CATALOG.forEach((item: ScenarioEntry): void => {
    item.stepTexts().forEach((text: string): void => {
      lines.push(text);
    });
  });
  return lines;
}

/** 形态覆盖行。 */
export function shapeCoverageLines(): string[] {
  const shapes: PayloadShape[] = [PayloadShape.NOTE, PayloadShape.READING, PayloadShape.FORM,
    PayloadShape.CHECKLIST, PayloadShape.MEDIA];
  return shapes.map((shape: PayloadShape): string =>
    `${shapeLabel(shape)}：${scenariosOfShape(shape).length} 个场景`);
}

/** 设备覆盖行。 */
export function deviceCoverageLines(): string[] {
  const devices: DeviceClass[] = [DeviceClass.PHONE, DeviceClass.TABLET, DeviceClass.PC,
    DeviceClass.TV, DeviceClass.WEARABLE];
  return devices.map((device: DeviceClass): string =>
    `${device as string}：发起 ${scenariosFrom(device).length}，接收 ${scenariosTo(device).length}`);
}
