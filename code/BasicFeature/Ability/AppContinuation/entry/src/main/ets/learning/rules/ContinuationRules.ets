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
 * 接续前的准入判定。
 *
 * 一次接续能否进行，取决于 API 等级、设备形态、权限、载荷体积和启动原因。
 * 这些条件相互独立，用规则表表达比一串 if 更容易核对与覆盖。
 */

/** 设备类别。 */
export enum DeviceClass {
  PHONE = 'phone',
  TABLET = 'tablet',
  PC = '2in1',
  TV = 'tv',
  WEARABLE = 'wearable',
  UNKNOWN = 'unknown'
}

/** 准入结论。 */
export enum Readiness {
  READY = 'ready',
  NEED_PERMISSION = 'needPermission',
  NEED_UPGRADE = 'needUpgrade',
  UNSUPPORTED_DEVICE = 'unsupportedDevice',
  PAYLOAD_TOO_LARGE = 'payloadTooLarge',
  NO_SESSION = 'noSession',
  UNKNOWN = 'unknown'
}

/** 结论标签。 */
export function readinessLabel(readiness: Readiness): string {
  switch (readiness) {
    case Readiness.READY:
      return localize('ac_continuationrules_001');
    case Readiness.NEED_PERMISSION:
      return localize('ac_continuationrules_002');
    case Readiness.NEED_UPGRADE:
      return localize('ac_continuationrules_003');
    case Readiness.UNSUPPORTED_DEVICE:
      return localize('ac_continuationrules_004');
    case Readiness.PAYLOAD_TOO_LARGE:
      return localize('ac_continuationrules_005');
    case Readiness.NO_SESSION:
      return localize('ac_continuationrules_006');
    default:
      return localize('ac_conflictpolicy_007');
  }
}

/** 是否属于确定性不支持（不是调用失败）。 */
export function isUnsupportedReadiness(readiness: Readiness): boolean {
  return readiness === Readiness.UNSUPPORTED_DEVICE || readiness === Readiness.NEED_UPGRADE;
}

/** 是否需要用户动作。 */
export function needsUserAction(readiness: Readiness): boolean {
  return readiness === Readiness.NEED_PERMISSION || readiness === Readiness.PAYLOAD_TOO_LARGE;
}

/** 判定输入。 */
export class RuleContext {
  public apiLevel: number = 0;
  public device: DeviceClass = DeviceClass.UNKNOWN;
  public permissionGranted: boolean = false;
  public payloadChars: number = 0;
  public sessionActive: boolean = false;
  public supportsMission: boolean = false;
  public launchReason: string = '';

  constructor(apiLevel: number = 0, device: DeviceClass = DeviceClass.UNKNOWN,
    permissionGranted: boolean = false) {
    this.apiLevel = apiLevel;
    this.device = device;
    this.permissionGranted = permissionGranted;
  }

  public key(): string {
    return `${this.apiLevel}|${this.device as string}|${this.permissionGranted ? 1 : 0}|` +
      `${this.payloadChars}|${this.sessionActive ? 1 : 0}|${this.supportsMission ? 1 : 0}`;
  }
}

/** 单条准入规则。 */
export class ReadinessRule {
  public ruleId: string = '';
  public minApi: number = 0;
  public maxApi: number = 999;
  public devices: DeviceClass[] = [];
  public requiresPermission: boolean = false;
  /** 允许的最大载荷字符数；0 表示不限制。 */
  public maxPayload: number = 0;
  public readiness: Readiness = Readiness.UNKNOWN;
  public hint: string = '';

  constructor(ruleId: string = '', minApi: number = 0, maxApi: number = 999,
    devices: DeviceClass[] = [], requiresPermission: boolean = false, maxPayload: number = 0,
    readiness: Readiness = Readiness.UNKNOWN, hint: string = '') {
    this.ruleId = ruleId;
    this.minApi = minApi;
    this.maxApi = maxApi;
    this.devices = devices;
    this.requiresPermission = requiresPermission;
    this.maxPayload = maxPayload;
    this.readiness = readiness;
    this.hint = hint;
  }

  /** 除权限与体积之外的条件是否满足。 */
  public matches(context: RuleContext): boolean {
    if (context.apiLevel < this.minApi || context.apiLevel > this.maxApi) {
      return false;
    }
    if (this.devices.length > 0 && this.devices.indexOf(context.device) < 0) {
      return false;
    }
    return true;
  }

  public text(): string {
    const deviceText: string = this.devices.length === 0 ? localize('ac_continuationrules_008') :
      this.devices.map((device: DeviceClass): string => device as string).join('/');
    return `${this.ruleId}：API ${this.minApi}~${this.maxApi}，${deviceText} -> ` +
      `${readinessLabel(this.readiness)}`;
  }
}

const ALL_DEVICES: DeviceClass[] = [DeviceClass.PHONE, DeviceClass.TABLET, DeviceClass.PC,
  DeviceClass.TV, DeviceClass.WEARABLE, DeviceClass.UNKNOWN];
const KNOWN_DEVICES: DeviceClass[] = [DeviceClass.PHONE, DeviceClass.TABLET, DeviceClass.PC,
  DeviceClass.TV, DeviceClass.WEARABLE];
const SCREEN_DEVICES: DeviceClass[] = [DeviceClass.PHONE, DeviceClass.TABLET, DeviceClass.PC];

/**
 * 准入规则表。
 *
 * 顺序即优先级：低版本与排除形态必须排在通用规则之前。
 */
function createREADINESS_RULES(): ReadinessRule[] {
  return [
  new ReadinessRule('CR-01', 0, 8, ALL_DEVICES, false, 0, Readiness.NEED_UPGRADE,
    localize('ac_continuationrules_009')),
  new ReadinessRule('CR-02', 9, 11, [DeviceClass.WEARABLE], false, 0,
    Readiness.UNSUPPORTED_DEVICE, localize('ac_continuationrules_010')),
  new ReadinessRule('CR-03', 9, 11, [DeviceClass.TV], false, 0, Readiness.UNSUPPORTED_DEVICE,
    localize('ac_continuationrules_011')),
  new ReadinessRule('CR-04', 9, 11, SCREEN_DEVICES, true, 2048, Readiness.NEED_PERMISSION,
    localize('ac_continuationrules_012')),
  new ReadinessRule('CR-05', 12, 13, [DeviceClass.WEARABLE], false, 1024,
    Readiness.UNSUPPORTED_DEVICE, localize('ac_continuationrules_013')),
  new ReadinessRule('CR-06', 12, 13, [DeviceClass.TV, DeviceClass.PC], true, 4096,
    Readiness.NEED_PERMISSION, localize('ac_continuationrules_014')),
  new ReadinessRule('CR-07', 12, 13, SCREEN_DEVICES, true, 4096, Readiness.NEED_PERMISSION,
    localize('ac_continuationrules_015')),
  new ReadinessRule('CR-08', 14, 17, [DeviceClass.WEARABLE], false, 2048,
    Readiness.UNSUPPORTED_DEVICE, localize('ac_continuationrules_016')),
  new ReadinessRule('CR-09', 14, 17, KNOWN_DEVICES, true, 6144, Readiness.NEED_PERMISSION,
    localize('ac_continuationrules_017')),
  new ReadinessRule('CR-10', 18, 26, KNOWN_DEVICES, true, 8192, Readiness.NEED_PERMISSION,
    localize('ac_continuationrules_018')),
  new ReadinessRule('CR-11', 27, 999, KNOWN_DEVICES, true, 8192, Readiness.UNKNOWN,
    localize('ac_continuationrules_019')),
  new ReadinessRule('CR-12', 9, 999, [DeviceClass.UNKNOWN], false, 0, Readiness.UNKNOWN,
    localize('ac_continuationrules_020'))
];
}

export const READINESS_RULES: ReadinessRule[] = createREADINESS_RULES();
registerLocaleCatalog((): void => {
  READINESS_RULES.splice(0, READINESS_RULES.length);
  createREADINESS_RULES().forEach((item: ReadinessRule): void => { READINESS_RULES.push(item); });
});

/** 判定结果。 */
export class ReadinessResult {
  public readiness: Readiness = Readiness.UNKNOWN;
  public rule: ReadinessRule | undefined = undefined;
  /** 是否因权限不足导致降级。 */
  public downgradedByPermission: boolean = false;
  /** 是否因载荷过大导致降级。 */
  public downgradedByPayload: boolean = false;

  /** 结论文本。 */
  public text(): string {
    const ruleId: string = this.rule === undefined ? localize('ac_conflictpolicy_049') : this.rule.ruleId;
    return `${readinessLabel(this.readiness)}（${ruleId}）`;
  }

  /** 提示文本。 */
  public hint(): string {
    if (this.rule === undefined) {
      return localize('ac_continuationrules_022');
    }
    if (this.downgradedByPayload) {
      return localize('ac_continuationrules_023', [this.rule.maxPayload]);
    }
    if (this.downgradedByPermission) {
      return localize('ac_continuationrules_024');
    }
    return this.rule.hint;
  }
}

/** 按规则表判定。 */
export function evaluateReadiness(context: RuleContext): ReadinessResult {
  const result: ReadinessResult = new ReadinessResult();
  for (const rule of READINESS_RULES) {
    if (!rule.matches(context)) {
      continue;
    }
    result.rule = rule;
    result.readiness = rule.readiness;
    if (rule.readiness !== Readiness.NEED_PERMISSION) {
      return result;
    }
    if (rule.requiresPermission && !context.permissionGranted) {
      result.downgradedByPermission = true;
      return result;
    }
    if (rule.maxPayload > 0 && context.payloadChars > rule.maxPayload) {
      result.readiness = Readiness.PAYLOAD_TOO_LARGE;
      result.downgradedByPayload = true;
      return result;
    }
    result.readiness = Readiness.READY;
    return result;
  }
  result.readiness = Readiness.UNKNOWN;
  return result;
}

/** 是否可以直接发起接续。 */
export function canStart(result: ReadinessResult): boolean {
  return result.readiness === Readiness.READY;
}

/** 规则摘要行。 */
export function readinessRuleLines(): string[] {
  return READINESS_RULES.map((rule: ReadinessRule): string =>
    `${rule.text()}｜${rule.hint}`);
}

/** 规则表自检。 */
export class ReadinessAudit {
  public ok: boolean = false;
  public findings: string[] = [];

  public summary(): string {
    return this.ok ? localize('ac_continuationrules_025') : this.findings.join('；');
  }
}

/** 校验规则：编号唯一、区间合法、说明非空、覆盖无空洞。 */
export function auditReadinessRules(): ReadinessAudit {
  const audit: ReadinessAudit = new ReadinessAudit();
  const seen: string[] = [];
  READINESS_RULES.forEach((rule: ReadinessRule): void => {
    if (seen.indexOf(rule.ruleId) >= 0) {
      audit.findings.push(localize('ac_conflictpolicy_060', [rule.ruleId]));
    }
    seen.push(rule.ruleId);
    if (rule.maxApi < rule.minApi) {
      audit.findings.push(localize('ac_continuationrules_027', [rule.ruleId]));
    }
    if (rule.hint.length === 0) {
      audit.findings.push(localize('ac_conflictpolicy_061', [rule.ruleId]));
    }
  });
  for (let api = 1; api <= 30; api++) {
    const hit: ReadinessRule | undefined = READINESS_RULES.find((rule: ReadinessRule): boolean =>
      rule.matches(new RuleContext(api, DeviceClass.PHONE, true)));
    if (hit === undefined) {
      audit.findings.push(localize('ac_continuationrules_029', [api]));
    }
  }
  audit.ok = audit.findings.length === 0;
  return audit;
}

/** 某形态在各 API 上的结论序列。 */
export function readinessSeries(device: DeviceClass, permissionGranted: boolean,
  payloadChars: number): Readiness[] {
  const series: Readiness[] = [];
  for (let api = 8; api <= 30; api++) {
    const context: RuleContext = new RuleContext(api, device, permissionGranted);
    context.payloadChars = payloadChars;
    series.push(evaluateReadiness(context).readiness);
  }
  return series;
}

/** 设备类别映射：把系统返回的 deviceType 字符串转成枚举。 */
export function deviceClassOf(deviceType: string): DeviceClass {
  if (deviceType === 'phone') {
    return DeviceClass.PHONE;
  }
  if (deviceType === 'tablet') {
    return DeviceClass.TABLET;
  }
  if (deviceType === '2in1') {
    return DeviceClass.PC;
  }
  if (deviceType === 'tv') {
    return DeviceClass.TV;
  }
  if (deviceType === 'wearable') {
    return DeviceClass.WEARABLE;
  }
  return DeviceClass.UNKNOWN;
}
