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

import { localText, registerTextRefresh } from '../text/LocalizedText';

/**
 * 开机自启能力矩阵。
 *
 * 系统能力、API 版本、设备形态和权限状态共同决定"能否查询/能否开启"。
 * 本文件把这份判断从页面里抽出来，作为诊断、引导和测试共用的唯一数据源：
 * 页面只呈现结论，测试只遍历同一张表，避免"页面写一套、用例抄一套"。
 */

/** 设备形态，取值与 module.json5 的 deviceTypes 保持一致。 */
export enum DeviceForm {
  PHONE = 'phone',
  TABLET = 'tablet',
  TV = 'tv',
  WEARABLE = 'wearable',
  UNKNOWN = 'unknown'
}

/** 系统发行版。OpenHarmony 与商用发行版的自启能力开放节奏不同，规则分别匹配。 */
export enum SystemFlavor {
  OPEN_HARMONY = 'OpenHarmony',
  COMMERCIAL = 'Commercial',
  UNKNOWN = 'Unknown'
}

/** 单项能力的结论。UNSUPPORTED 与 FAILED 语义不同，不能互相替代。 */
export enum CapabilityVerdict {
  SUPPORTED = 'supported',
  UNSUPPORTED = 'unsupported',
  NEED_PERMISSION = 'needPermission',
  NEED_SYSTEM_UPDATE = 'needSystemUpdate',
  DEVICE_EXCLUDED = 'deviceExcluded',
  UNKNOWN = 'unknown'
}

/** 查询条件。调用方必须显式给出，避免隐式读取全局状态。 */
export class CapabilityQuery {
  public apiLevel: number = 0;
  public deviceForm: DeviceForm = DeviceForm.UNKNOWN;
  public flavor: SystemFlavor = SystemFlavor.UNKNOWN;
  public permissionGranted: boolean = false;
  /** 系统设置中是否暴露"应用启动管理"入口。 */
  public settingsEntryAvailable: boolean = false;

  constructor(apiLevel: number = 0, deviceForm: DeviceForm = DeviceForm.UNKNOWN,
    flavor: SystemFlavor = SystemFlavor.UNKNOWN, permissionGranted: boolean = false,
    settingsEntryAvailable: boolean = false) {
    this.apiLevel = apiLevel;
    this.deviceForm = deviceForm;
    this.flavor = flavor;
    this.permissionGranted = permissionGranted;
    this.settingsEntryAvailable = settingsEntryAvailable;
  }

  key(): string {
    return `${this.apiLevel}|${this.deviceForm}|${this.flavor}|${this.permissionGranted ? 1 : 0}|` +
      `${this.settingsEntryAvailable ? 1 : 0}`;
  }

  clone(): CapabilityQuery {
    return new CapabilityQuery(this.apiLevel, this.deviceForm, this.flavor,
      this.permissionGranted, this.settingsEntryAvailable);
  }
}

/** 一条能力判定规则。规则按 minApi 升序匹配，命中即返回。 */
export class CapabilityRule {
  public ruleId: string = '';
  public minApi: number = 0;
  public maxApi: number = 999;
  public forms: DeviceForm[] = [];
  public flavors: SystemFlavor[] = [];
  public verdict: CapabilityVerdict = CapabilityVerdict.UNKNOWN;
  /** 稳定的排查建议，面向开发者。 */
  public developerHint: string = '';
  /** 面向用户的解释，不含内部错误码。 */
  public userHint: string = '';
  /** 是否要求权限；false 表示判定与权限无关。 */
  public requiresPermission: boolean = false;

  constructor(ruleId: string = '', minApi: number = 0, maxApi: number = 999,
    forms: DeviceForm[] = [], flavors: SystemFlavor[] = [],
    verdict: CapabilityVerdict = CapabilityVerdict.UNKNOWN,
    developerHint: string = '', userHint: string = '', requiresPermission: boolean = false) {
    this.ruleId = ruleId;
    this.minApi = minApi;
    this.maxApi = maxApi;
    this.forms = forms;
    this.flavors = flavors;
    this.verdict = verdict;
    this.developerHint = developerHint;
    this.userHint = userHint;
    this.requiresPermission = requiresPermission;
  }

  matches(query: CapabilityQuery): boolean {
    if (query.apiLevel < this.minApi || query.apiLevel > this.maxApi) {
      return false;
    }
    if (this.forms.length > 0 && this.forms.indexOf(query.deviceForm) < 0) {
      return false;
    }
    if (this.flavors.length > 0 && this.flavors.indexOf(query.flavor) < 0) {
      return false;
    }
    return true;
  }

  describe(): string {
    const formText: string = this.forms.length === 0 ? localText('startup_text_0652') :
      this.forms.map((form: DeviceForm): string => form as string).join('/');
    const flavorText: string = this.flavors.length === 0 ? localText('startup_text_0653') :
      this.flavors.map((flavor: SystemFlavor): string => flavor as string).join('/');
    return `${this.ruleId}：API ${this.minApi}~${this.maxApi}，${formText}，${flavorText}`;
  }
}

const ALL_FORMS: DeviceForm[] = [DeviceForm.PHONE, DeviceForm.TABLET, DeviceForm.TV,
  DeviceForm.WEARABLE, DeviceForm.UNKNOWN];
const ALL_FLAVORS: SystemFlavor[] = [SystemFlavor.OPEN_HARMONY, SystemFlavor.COMMERCIAL,
  SystemFlavor.UNKNOWN];
const PHONE_TABLET: DeviceForm[] = [DeviceForm.PHONE, DeviceForm.TABLET];

/**
 * 能力矩阵。
 *
 * 规则顺序即优先级：先命中先返回。低版本、排除形态和未知系统的规则必须排在
 * 通用规则之前，否则会被通用规则吞掉。
 */
function createCAPABILITY_RULES(): CapabilityRule[] {
  return [
  new CapabilityRule('CM-0001', 0, 8, ALL_FORMS, ALL_FLAVORS,
    CapabilityVerdict.NEED_SYSTEM_UPDATE,
    localText('startup_text_0654'),
    localText('startup_text_0655'), false),
  new CapabilityRule('CM-0002', 9, 11, [DeviceForm.WEARABLE], ALL_FLAVORS,
    CapabilityVerdict.DEVICE_EXCLUDED,
    localText('startup_text_0656'),
    localText('startup_text_0657'), false),
  new CapabilityRule('CM-0003', 9, 11, [DeviceForm.TV], ALL_FLAVORS,
    CapabilityVerdict.DEVICE_EXCLUDED,
    localText('startup_text_0658'),
    localText('startup_text_0657'), false),
  new CapabilityRule('CM-0004', 9, 11, PHONE_TABLET, [SystemFlavor.OPEN_HARMONY],
    CapabilityVerdict.SUPPORTED,
    localText('startup_text_0659'),
    localText('startup_text_0660'), false),
  new CapabilityRule('CM-0005', 9, 11, PHONE_TABLET, [SystemFlavor.COMMERCIAL],
    CapabilityVerdict.NEED_PERMISSION,
    localText('startup_text_0661'),
    localText('startup_text_0662'), true),
  new CapabilityRule('CM-0006', 12, 13, [DeviceForm.WEARABLE], ALL_FLAVORS,
    CapabilityVerdict.DEVICE_EXCLUDED,
    localText('startup_text_0663'),
    localText('startup_text_0664'), false),
  new CapabilityRule('CM-0007', 12, 13, [DeviceForm.TV], [SystemFlavor.OPEN_HARMONY],
    CapabilityVerdict.SUPPORTED,
    localText('startup_text_0665'),
    localText('startup_text_0666'), false),
  new CapabilityRule('CM-0008', 12, 13, [DeviceForm.TV], [SystemFlavor.COMMERCIAL],
    CapabilityVerdict.NEED_PERMISSION,
    localText('startup_text_0667'),
    localText('startup_text_0668'), true),
  new CapabilityRule('CM-0009', 12, 13, PHONE_TABLET, [SystemFlavor.OPEN_HARMONY],
    CapabilityVerdict.SUPPORTED,
    localText('startup_text_0669'),
    localText('startup_text_0666'), false),
  new CapabilityRule('CM-0010', 12, 13, PHONE_TABLET, [SystemFlavor.COMMERCIAL],
    CapabilityVerdict.NEED_PERMISSION,
    localText('startup_text_0670'),
    localText('startup_text_0671'), true),
  new CapabilityRule('CM-0011', 14, 17, [DeviceForm.WEARABLE], ALL_FLAVORS,
    CapabilityVerdict.DEVICE_EXCLUDED,
    localText('startup_text_0672'),
    localText('startup_text_0664'), false),
  new CapabilityRule('CM-0012', 14, 17, [DeviceForm.TV], ALL_FLAVORS,
    CapabilityVerdict.SUPPORTED,
    localText('startup_text_0673'),
    localText('startup_text_0666'), false),
  new CapabilityRule('CM-0013', 14, 17, PHONE_TABLET, ALL_FLAVORS,
    CapabilityVerdict.SUPPORTED,
    localText('startup_text_0674'),
    localText('startup_text_0666'), false),
  new CapabilityRule('CM-0014', 18, 26, ALL_FORMS, ALL_FLAVORS,
    CapabilityVerdict.SUPPORTED,
    localText('startup_text_0675'),
    localText('startup_text_0666'), false),
  new CapabilityRule('CM-0015', 27, 999, ALL_FORMS, ALL_FLAVORS,
    CapabilityVerdict.UNKNOWN,
    localText('startup_text_0676'),
    localText('startup_text_0677'), false),
  new CapabilityRule('CM-0016', 9, 11, ALL_FORMS, [SystemFlavor.UNKNOWN],
    CapabilityVerdict.UNKNOWN,
    localText('startup_text_0678'),
    localText('startup_text_0679'), false),
  new CapabilityRule('CM-0017', 12, 17, ALL_FORMS, [SystemFlavor.UNKNOWN],
    CapabilityVerdict.UNKNOWN,
    localText('startup_text_0680'),
    localText('startup_text_0679'), false),
  new CapabilityRule('CM-0018', 9, 999, [DeviceForm.UNKNOWN], ALL_FLAVORS,
    CapabilityVerdict.UNKNOWN,
    localText('startup_text_0681'),
    localText('startup_text_0682'), false)
];
}
export const CAPABILITY_RULES: CapabilityRule[] = createCAPABILITY_RULES();
registerTextRefresh((): void => {
  CAPABILITY_RULES.splice(0, CAPABILITY_RULES.length);
  createCAPABILITY_RULES().forEach((item: CapabilityRule): void => { CAPABILITY_RULES.push(item); });
});

/** 判定结果。带命中的规则，便于诊断页展示依据。 */
export class CapabilityEvaluation {
  public query: CapabilityQuery = new CapabilityQuery();
  public verdict: CapabilityVerdict = CapabilityVerdict.UNKNOWN;
  public rule: CapabilityRule | undefined = undefined;
  /** 结论是否因权限不足而降级。 */
  public downgradedByPermission: boolean = false;
  /** 结论是否因系统入口缺失而降级。 */
  public downgradedByEntry: boolean = false;

  summary(): string {
    const ruleId: string = this.rule === undefined ? localText('startup_text_0683') : this.rule.ruleId;
    return `${this.verdict as string}（${ruleId}）`;
  }

  developerHint(): string {
    return this.rule === undefined ? localText('startup_text_0684') : this.rule.developerHint;
  }

  userHint(): string {
    return this.rule === undefined ? localText('startup_text_0682') : this.rule.userHint;
  }
}

/** 按规则表判定能力；命中后按权限与入口做降级。 */
export function evaluateCapability(query: CapabilityQuery): CapabilityEvaluation {
  const evaluation: CapabilityEvaluation = new CapabilityEvaluation();
  evaluation.query = query.clone();
  for (const rule of CAPABILITY_RULES) {
    if (!rule.matches(query)) {
      continue;
    }
    evaluation.rule = rule;
    evaluation.verdict = rule.verdict;
    if (rule.requiresPermission && !query.permissionGranted &&
      evaluation.verdict === CapabilityVerdict.NEED_PERMISSION) {
      evaluation.downgradedByPermission = true;
    }
    if (evaluation.verdict === CapabilityVerdict.SUPPORTED && !query.settingsEntryAvailable &&
      query.flavor === SystemFlavor.OPEN_HARMONY && query.apiLevel <= 11) {
      evaluation.downgradedByEntry = true;
    }
    return evaluation;
  }
  evaluation.verdict = CapabilityVerdict.UNKNOWN;
  return evaluation;
}

/** 是否允许在应用内直接设置（而不是只能跳系统设置）。 */
export function canSetInApp(evaluation: CapabilityEvaluation): boolean {
  if (evaluation.verdict !== CapabilityVerdict.SUPPORTED) {
    return false;
  }
  if (evaluation.query.apiLevel <= 11) {
    return false;
  }
  return true;
}

/** 是否需要引导用户去系统设置页。 */
export function needsSettingsGuidance(evaluation: CapabilityEvaluation): boolean {
  return evaluation.verdict === CapabilityVerdict.NEED_PERMISSION ||
    evaluation.downgradedByEntry || evaluation.query.apiLevel <= 11;
}

/** 是否属于"系统确实不支持"，而不是"调用失败"。 */
export function isDefinitelyUnsupported(verdict: CapabilityVerdict): boolean {
  return verdict === CapabilityVerdict.DEVICE_EXCLUDED ||
    verdict === CapabilityVerdict.NEED_SYSTEM_UPDATE;
}

/** 供诊断页展示的规则摘要列表。 */
export function ruleSummaries(): string[] {
  return CAPABILITY_RULES.map((rule: CapabilityRule): string => rule.describe());
}

/** 某形态在各 API 段上的结论序列，用于矩阵展示。 */
export function verdictSeries(form: DeviceForm, flavor: SystemFlavor, permissionGranted: boolean,
  settingsEntryAvailable: boolean): CapabilityVerdict[] {
  const series: CapabilityVerdict[] = [];
  for (let api = 8; api <= 28; api++) {
    series.push(evaluateCapability(new CapabilityQuery(api, form, flavor, permissionGranted,
      settingsEntryAvailable)).verdict);
  }
  return series;
}
