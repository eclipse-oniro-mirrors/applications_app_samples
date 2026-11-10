/** Conservative manual guidance. No API-level rule invents a settings jump, permission or switch. */
import { CapabilityQuery, DeviceForm, SystemFlavor } from '../rules/CapabilityMatrix';
export enum GuidanceKind {
  SYSTEM_SETTINGS = 'systemSettings', IN_APP = 'inApp', MANUAL_ONLY = 'manualOnly'
}
export class GuidanceStep {
  order: number = 0;
  label: string = '';
  detail: string = '';
  required: boolean = true;

  constructor(order: number = 0, label: string = '', detail: string = '', required: boolean = true) {
    this.order = order;
    this.label = label;
    this.detail = detail;
    this.required = required;
  }
}
export class GuidanceEntry {
  entryId: string = '';
  kind: GuidanceKind = GuidanceKind.MANUAL_ONLY;
  minApi: number = 0;
  maxApi: number = 999;
  forms: DeviceForm[] = [];
  flavors: SystemFlavor[] = [];
  title: string = '';
  summary: string = '';
  public steps: GuidanceStep[] = [];

  constructor(entryId: string = '', kind: GuidanceKind = GuidanceKind.MANUAL_ONLY,
    minApi: number = 0, maxApi: number = 999, forms: DeviceForm[] = [],
    flavors: SystemFlavor[] = [], title: string = '', summary: string = '',
    steps: GuidanceStep[] = []) {
    this.entryId = entryId;
    this.kind = kind;
    this.minApi = minApi;
    this.maxApi = maxApi;
    this.forms = forms;
    this.flavors = flavors;
    this.title = title;
    this.summary = summary;
    this.steps = steps;
  }
  matches(query: CapabilityQuery): boolean {
    return query.apiLevel >= this.minApi && query.apiLevel <= this.maxApi &&
      (this.forms.length === 0 || this.forms.indexOf(query.deviceForm) >= 0) &&
      (this.flavors.length === 0 || this.flavors.indexOf(query.flavor) >= 0);
  }
  stepCount(): number { return this.steps.length; }
  requiredCount(): number { return this.steps.filter((step: GuidanceStep): boolean => step.required).length; }
}
export const FALLBACK_GUIDANCE: GuidanceEntry = new GuidanceEntry('GD-9999', GuidanceKind.MANUAL_ONLY,
  0, 999, [], [], '手动检查系统设置',
  '本示例仅查询，不申请额外权限、不直接开启/关闭自启、不跳转系统设置。设备可能不提供相关选项。', [
    new GuidanceStep(1, '成功刷新后点击“开始手动设置回访”', '保存离开前的查询ID与时间'),
    new GuidanceStep(2, '手动离开应用并打开系统设置', '查找本应用的启动管理；名称和可用性以实际设备为准'),
    new GuidanceStep(3, '返回本应用查看重新查询和前后对比', '只检测前后台，无法证明实际进入设置或修改开关')
  ]);
export const GUIDANCE_ENTRIES: GuidanceEntry[] = [FALLBACK_GUIDANCE];
export function selectGuidance(query: CapabilityQuery): GuidanceEntry { return FALLBACK_GUIDANCE; }
export function needsJump(entry: GuidanceEntry): boolean { return false; }
export function stepTexts(entry: GuidanceEntry): string[] {
  return entry.steps.slice().sort((a: GuidanceStep, b: GuidanceStep): number => a.order - b.order)
    .map((step: GuidanceStep): string => `${step.order}. ${step.label}` +
      (step.detail.length === 0 ? '' : `（${step.detail}）`) + (step.required ? '' : '［可选］'));
}
export function guidanceCaption(entry: GuidanceEntry): string {
  return `${entry.title}｜共 ${entry.stepCount()} 步，其中必做 ${entry.requiredCount()} 步`;
}
export function manualOnly(query: CapabilityQuery): boolean { return true; }
export function guidanceIdsUnique(): boolean {
  return new Set<string>(GUIDANCE_ENTRIES.map((entry: GuidanceEntry): string => entry.entryId)).size ===
    GUIDANCE_ENTRIES.length;
}
export function guidanceCoverage(): string[] {
  return GUIDANCE_ENTRIES.map((entry: GuidanceEntry): string => `${entry.entryId} 手动指引（不推断设备能力）`);
}
