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

/** Conservative manual guidance. No API-level rule invents a settings jump, permission or switch. */
import { CapabilityQuery, DeviceForm, SystemFlavor } from '../rules/CapabilityMatrix';
export enum GuidanceKind {
  SYSTEM_SETTINGS = 'systemSettings', IN_APP = 'inApp', MANUAL_ONLY = 'manualOnly'
}
export class GuidanceStep {
  public order: number = 0;
  public label: string = '';
  public detail: string = '';
  public required: boolean = true;

  constructor(order: number = 0, label: string = '', detail: string = '', required: boolean = true) {
    this.order = order;
    this.label = label;
    this.detail = detail;
    this.required = required;
  }
}
export class GuidanceEntry {
  public entryId: string = '';
  public kind: GuidanceKind = GuidanceKind.MANUAL_ONLY;
  public minApi: number = 0;
  public maxApi: number = 999;
  public forms: DeviceForm[] = [];
  public flavors: SystemFlavor[] = [];
  public title: string = '';
  public summary: string = '';
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
function createFallbackGuidance(): GuidanceEntry {
  return new GuidanceEntry('GD-9999', GuidanceKind.MANUAL_ONLY,
  0, 999, [], [], localText('startup_text_0606'),
  localText('startup_text_0607'), [
    new GuidanceStep(1, localText('startup_text_0608'), localText('startup_text_0609')),
    new GuidanceStep(2, localText('startup_text_0610'), localText('startup_text_0611')),
    new GuidanceStep(3, localText('startup_text_0612'), localText('startup_text_0613'))
  ]);
}
export const FALLBACK_GUIDANCE: GuidanceEntry = createFallbackGuidance();
registerTextRefresh((): void => {
  const fresh = createFallbackGuidance();
  FALLBACK_GUIDANCE.title = fresh.title;
  FALLBACK_GUIDANCE.summary = fresh.summary;
  FALLBACK_GUIDANCE.steps = fresh.steps;
});

export const GUIDANCE_ENTRIES: GuidanceEntry[] = [FALLBACK_GUIDANCE];
export function selectGuidance(query: CapabilityQuery): GuidanceEntry { return FALLBACK_GUIDANCE; }
export function needsJump(entry: GuidanceEntry): boolean { return false; }
export function stepTexts(entry: GuidanceEntry): string[] {
  return entry.steps.slice().sort((a: GuidanceStep, b: GuidanceStep): number => a.order - b.order)
    .map((step: GuidanceStep): string => `${step.order}. ${step.label}` +
      (step.detail.length === 0 ? '' : `（${step.detail}）`) + (step.required ? '' : localText('startup_text_0614')));
}
export function guidanceCaption(entry: GuidanceEntry): string {
  return formatResource('startup_format_96ba822bb5e5', [String(entry.title), String(entry.stepCount()), String(entry.requiredCount())]);
}
export function manualOnly(query: CapabilityQuery): boolean { return true; }
export function guidanceIdsUnique(): boolean {
  return new Set<string>(GUIDANCE_ENTRIES.map((entry: GuidanceEntry): string => entry.entryId)).size ===
    GUIDANCE_ENTRIES.length;
}
export function guidanceCoverage(): string[] {
  return GUIDANCE_ENTRIES.map((entry: GuidanceEntry): string => formatResource('startup_format_6982eb6fc0cd', [String(entry.entryId)]));
}
