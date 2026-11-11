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

import { localize, registerLocaleCatalog } from '../../common/LocaleStrings';
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
      return localize('ac_scenariocatalog_001');
    case PayloadShape.READING:
      return localize('ac_readingscenepage_002');
    case PayloadShape.FORM:
      return localize('ac_formscenepage_002');
    case PayloadShape.CHECKLIST:
      return localize('ac_scenariocatalog_004');
    default:
      return localize('ac_scenariocatalog_005');
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
      return localize('ac_scenariocatalog_006');
    case ScenarioRisk.MEDIUM:
      return localize('ac_scenariocatalog_007');
    default:
      return localize('ac_scenariocatalog_008');
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
      localize('ac_scenariocatalog_009', [shapeLabel(this.shape), riskLabel(this.risk)]);
  }

  /** 步骤文本。 */
  public stepTexts(): string[] {
    return this.steps.map((step: string, index: number): string =>
      `${this.scenarioId}-${index + 1} ${step}`);
  }
}

/** 场景目录。 */
function createSCENARIO_CATALOG(): ScenarioEntry[] {
  return [
  new ScenarioEntry('SN-01', localize('ac_scenariocatalog_010'), PayloadShape.NOTE,
    DeviceClass.PHONE, DeviceClass.TABLET, [localize('ac_scenariocatalog_011'), localize('ac_scenariocatalog_012')],
    [localize('ac_scenariocatalog_013'), localize('ac_scenariocatalog_014'), localize('ac_scenariocatalog_015')], localize('ac_scenariocatalog_016'), ScenarioRisk.LOW),
  new ScenarioEntry('SN-02', localize('ac_scenariocatalog_017'), PayloadShape.NOTE,
    DeviceClass.TABLET, DeviceClass.PHONE, [localize('ac_scenariocatalog_011')],
    [localize('ac_scenariocatalog_019'), localize('ac_scenariocatalog_014'), localize('ac_scenariocatalog_021')], localize('ac_scenariocatalog_022'), ScenarioRisk.LOW),
  new ScenarioEntry('SN-03', localize('ac_scenariocatalog_023'), PayloadShape.READING,
    DeviceClass.PHONE, DeviceClass.TABLET, [localize('ac_scenariocatalog_011'), localize('ac_scenariocatalog_025')],
    [localize('ac_scenariocatalog_026'), localize('ac_scenariocatalog_027'), localize('ac_scenariocatalog_014')], localize('ac_scenariocatalog_029'), ScenarioRisk.MEDIUM),
  new ScenarioEntry('SN-04', localize('ac_scenariocatalog_030'), PayloadShape.READING,
    DeviceClass.TABLET, DeviceClass.PHONE, [localize('ac_scenariocatalog_011')],
    [localize('ac_scenariocatalog_026'), localize('ac_scenariocatalog_014')], localize('ac_scenariocatalog_034'), ScenarioRisk.MEDIUM),
  new ScenarioEntry('SN-05', localize('ac_scenariocatalog_035'), PayloadShape.FORM,
    DeviceClass.PHONE, DeviceClass.TABLET, [localize('ac_scenariocatalog_011'), localize('ac_scenariocatalog_037')],
    [localize('ac_scenariocatalog_038'), localize('ac_scenariocatalog_014'), localize('ac_scenariocatalog_040')], localize('ac_scenariocatalog_041'), ScenarioRisk.MEDIUM),
  new ScenarioEntry('SN-06', localize('ac_scenariocatalog_042'), PayloadShape.FORM,
    DeviceClass.TABLET, DeviceClass.PHONE, [localize('ac_scenariocatalog_011')],
    [localize('ac_scenariocatalog_038'), localize('ac_scenariocatalog_014')], localize('ac_scenariocatalog_046'), ScenarioRisk.MEDIUM),
  new ScenarioEntry('SN-07', localize('ac_scenariocatalog_047'), PayloadShape.CHECKLIST,
    DeviceClass.PHONE, DeviceClass.TABLET, [localize('ac_scenariocatalog_011')],
    [localize('ac_scenariocatalog_049'), localize('ac_scenariocatalog_014')], localize('ac_scenariocatalog_051'), ScenarioRisk.LOW),
  new ScenarioEntry('SN-08', localize('ac_scenariocatalog_052'), PayloadShape.CHECKLIST,
    DeviceClass.TABLET, DeviceClass.PHONE, [localize('ac_scenariocatalog_011')],
    [localize('ac_scenariocatalog_049'), localize('ac_scenariocatalog_014')], localize('ac_scenariocatalog_056'), ScenarioRisk.LOW),
  new ScenarioEntry('SN-09', localize('ac_scenariocatalog_057'), PayloadShape.MEDIA,
    DeviceClass.PHONE, DeviceClass.TABLET, [localize('ac_scenariocatalog_011'), localize('ac_scenariocatalog_059')],
    [localize('ac_scenariocatalog_060'), localize('ac_scenariocatalog_014')], localize('ac_scenariocatalog_062'), ScenarioRisk.HIGH),
  new ScenarioEntry('SN-10', localize('ac_scenariocatalog_063'), PayloadShape.MEDIA,
    DeviceClass.TABLET, DeviceClass.PHONE, [localize('ac_scenariocatalog_011')],
    [localize('ac_scenariocatalog_060'), localize('ac_scenariocatalog_014')], localize('ac_scenariocatalog_067'), ScenarioRisk.HIGH),
  new ScenarioEntry('SN-11', localize('ac_scenariocatalog_068'), PayloadShape.NOTE,
    DeviceClass.PHONE, DeviceClass.PC, [localize('ac_scenariocatalog_011'), localize('ac_scenariocatalog_070')],
    [localize('ac_scenariocatalog_071'), localize('ac_scenariocatalog_014'), localize('ac_scenariocatalog_073')], localize('ac_scenariocatalog_074'), ScenarioRisk.MEDIUM),
  new ScenarioEntry('SN-12', localize('ac_scenariocatalog_075'), PayloadShape.NOTE,
    DeviceClass.PC, DeviceClass.PHONE, [localize('ac_scenariocatalog_011')],
    [localize('ac_scenariocatalog_077'), localize('ac_scenariocatalog_014')], localize('ac_scenariocatalog_079'), ScenarioRisk.MEDIUM),
  new ScenarioEntry('SN-13', localize('ac_scenariocatalog_080'), PayloadShape.MEDIA,
    DeviceClass.PHONE, DeviceClass.TV, [localize('ac_scenariocatalog_011'), localize('ac_scenariocatalog_082')],
    [localize('ac_scenariocatalog_083'), localize('ac_scenariocatalog_014')], localize('ac_scenariocatalog_085'), ScenarioRisk.HIGH),
  new ScenarioEntry('SN-14', localize('ac_scenariocatalog_086'), PayloadShape.MEDIA,
    DeviceClass.TV, DeviceClass.PHONE, [localize('ac_scenariocatalog_011')],
    [localize('ac_scenariocatalog_088'), localize('ac_scenariocatalog_014')], localize('ac_scenariocatalog_090'), ScenarioRisk.HIGH),
  new ScenarioEntry('SN-15', localize('ac_scenariocatalog_091'), PayloadShape.NOTE,
    DeviceClass.PHONE, DeviceClass.WEARABLE, [localize('ac_scenariocatalog_011'), localize('ac_scenariocatalog_093')],
    [localize('ac_scenariocatalog_013'), localize('ac_scenariocatalog_014')], localize('ac_scenariocatalog_096'), ScenarioRisk.MEDIUM),
  new ScenarioEntry('SN-16', localize('ac_scenariocatalog_097'), PayloadShape.NOTE,
    DeviceClass.WEARABLE, DeviceClass.PHONE, [localize('ac_scenariocatalog_011')],
    [localize('ac_scenariocatalog_099')], localize('ac_scenariocatalog_100'), ScenarioRisk.LOW),
  new ScenarioEntry('SN-17', localize('ac_scenariocatalog_101'), PayloadShape.NOTE,
    DeviceClass.PHONE, DeviceClass.PHONE, [localize('ac_scenariocatalog_011'), localize('ac_scenariocatalog_103')],
    [localize('ac_scenariocatalog_104'), localize('ac_scenariocatalog_014'), localize('ac_scenariocatalog_106')], localize('ac_scenariocatalog_107'), ScenarioRisk.LOW),
  new ScenarioEntry('SN-18', localize('ac_scenariocatalog_108'), PayloadShape.NOTE,
    DeviceClass.PHONE, DeviceClass.TABLET, [localize('ac_scenariocatalog_011'), localize('ac_scenariocatalog_110')],
    [localize('ac_scenariocatalog_111'), localize('ac_scenariocatalog_014')], localize('ac_scenariocatalog_113'), ScenarioRisk.HIGH),
  new ScenarioEntry('SN-19', localize('ac_scenariocatalog_114'), PayloadShape.NOTE,
    DeviceClass.PHONE, DeviceClass.TABLET, [localize('ac_scenariocatalog_011')],
    [localize('ac_scenariocatalog_014'), localize('ac_scenariocatalog_117')], localize('ac_scenariocatalog_118'), ScenarioRisk.HIGH),
  new ScenarioEntry('SN-20', localize('ac_scenariocatalog_119'), PayloadShape.NOTE,
    DeviceClass.PHONE, DeviceClass.TABLET, [localize('ac_scenariocatalog_011'), localize('ac_scenariocatalog_121')],
    [localize('ac_scenariocatalog_122'), localize('ac_scenariocatalog_014')], localize('ac_scenariocatalog_124'), ScenarioRisk.MEDIUM),
  new ScenarioEntry('SN-21', localize('ac_scenariocatalog_125'), PayloadShape.NOTE,
    DeviceClass.PHONE, DeviceClass.PHONE, [localize('ac_scenariocatalog_126')],
    [localize('ac_scenariocatalog_127')], localize('ac_scenariocatalog_128'), ScenarioRisk.MEDIUM),
  new ScenarioEntry('SN-22', localize('ac_scenariocatalog_129'), PayloadShape.NOTE,
    DeviceClass.PHONE, DeviceClass.TABLET, [localize('ac_scenariocatalog_011')],
    [localize('ac_scenariocatalog_014'), localize('ac_scenariocatalog_132')], localize('ac_scenariocatalog_133'), ScenarioRisk.LOW),
  new ScenarioEntry('SN-23', localize('ac_scenariocatalog_134'), PayloadShape.NOTE,
    DeviceClass.PHONE, DeviceClass.TABLET, [localize('ac_scenariocatalog_011')],
    [localize('ac_scenariocatalog_136')], localize('ac_scenariocatalog_137'), ScenarioRisk.MEDIUM),
  new ScenarioEntry('SN-24', localize('ac_scenariocatalog_138'), PayloadShape.NOTE,
    DeviceClass.PHONE, DeviceClass.TABLET, [localize('ac_scenariocatalog_011')],
    [localize('ac_scenariocatalog_140'), localize('ac_scenariocatalog_141')], localize('ac_scenariocatalog_142'), ScenarioRisk.LOW)
];
}

export const SCENARIO_CATALOG: ScenarioEntry[] = createSCENARIO_CATALOG();
registerLocaleCatalog((): void => {
  SCENARIO_CATALOG.splice(0, SCENARIO_CATALOG.length);
  createSCENARIO_CATALOG().forEach((item: ScenarioEntry): void => { SCENARIO_CATALOG.push(item); });
});

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
    return localize('ac_scenariocatalog_143', [this.total, this.steps, this.high, this.medium]) +
      localize('ac_scenariocatalog_144', [this.low]);
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
    return this.ok ? localize('ac_scenariocatalog_145') : this.findings.join('；');
  }
}

/** 校验目录：编号连续、步骤非空、成功判据非空。 */
export function auditScenarios(): ScenarioAudit {
  const audit: ScenarioAudit = new ScenarioAudit();
  const seen: string[] = [];
  SCENARIO_CATALOG.forEach((item: ScenarioEntry, index: number): void => {
    if (seen.indexOf(item.scenarioId) >= 0) {
      audit.findings.push(localize('ac_scenariocatalog_146', [item.scenarioId]));
    }
    seen.push(item.scenarioId);
    const expected: string = `SN-${(index + 1).toString().padStart(2, '0')}`;
    if (item.scenarioId !== expected) {
      audit.findings.push(localize('ac_scenariocatalog_147', [expected, item.scenarioId]));
    }
    if (item.steps.length === 0) {
      audit.findings.push(localize('ac_scenariocatalog_148', [item.scenarioId]));
    }
    if (item.success.length === 0) {
      audit.findings.push(localize('ac_scenariocatalog_149', [item.scenarioId]));
    }
    if (item.requires.length === 0) {
      audit.findings.push(localize('ac_scenariocatalog_150', [item.scenarioId]));
    }
    if (item.from === DeviceClass.UNKNOWN || item.to === DeviceClass.UNKNOWN) {
      audit.findings.push(localize('ac_scenariocatalog_151', [item.scenarioId]));
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
    localize('ac_scenariocatalog_152', [shapeLabel(shape), scenariosOfShape(shape).length]));
}

/** 设备覆盖行。 */
export function deviceCoverageLines(): string[] {
  const devices: DeviceClass[] = [DeviceClass.PHONE, DeviceClass.TABLET, DeviceClass.PC,
    DeviceClass.TV, DeviceClass.WEARABLE];
  return devices.map((device: DeviceClass): string =>
    localize('ac_scenariocatalog_153', [device as string, scenariosFrom(device).length, scenariosTo(device).length]));
}
