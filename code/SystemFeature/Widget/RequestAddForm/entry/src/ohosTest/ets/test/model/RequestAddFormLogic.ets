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

// Deterministic logic of pages/Index.ets (requestPublishForm buttons) and resources/base/profile/form_config.json.

// Mirrors the module constants and the Want fields of pages/Index.ets.
export const CONDITION_ID: string = '110000';
export const ABILITY_NAME: string = 'EntryFormAbility';
export const MODULE_NAME: string = 'entry';
export const ARKTS_FORM_NAME: string = 'widget';
export const JS_FORM_NAME: string = 'JsWidget';
export const PROXY_KEY: string = 'weather';
export const DIMENSION_KEY: string = 'ohos.extra.param.key.form_dimension';
export const FORM_NAME_KEY: string = 'ohos.extra.param.key.form_name';
export const MODULE_NAME_KEY: string = 'ohos.extra.param.key.module_name';
// Mirrors form_config.json.
export const DEFAULT_DIMENSION: string = '2*2';
export const SUPPORT_DIMENSIONS: string[] = ['2*2'];
export const SCHEDULED_UPDATE_TIME: string = '10:30';
export const UPDATE_DURATION: number = 1;
export const DESIGN_WIDTH: number = 720;

// Mirrors formInfo.FormDimension values used by the sample (Dimension_2_2 is requested).
export enum FormDimensionValue {
  DIMENSION_1_2 = 1,
  DIMENSION_2_2 = 2,
  DIMENSION_2_4 = 3,
  DIMENSION_4_4 = 4
}

// Mirrors the Want handed to formProvider.requestPublishForm(), flattened.
export interface PublishWant {
  abilityName: string;
  dimension: number;
  formName: string;
  moduleName: string;
}

// Mirrors the two add-card buttons: the ArkTS card ('widget') and the JS card ('JsWidget').
export function publishWantOf(isArkTsCard: boolean): PublishWant {
  const want: PublishWant = {
    abilityName: ABILITY_NAME,
    dimension: FormDimensionValue.DIMENSION_2_2,
    formName: isArkTsCard ? ARKTS_FORM_NAME : JS_FORM_NAME,
    moduleName: MODULE_NAME
  };
  return want;
}

// Mirrors JSON.stringify(want) written by Logger.debug(`RequestPublishForm want: ...`).
export function wantJsonOf(formName: string, dimension: number): string {
  return `{"abilityName":"${ABILITY_NAME}","parameters":{"${DIMENSION_KEY}":${dimension},` +
    `"${FORM_NAME_KEY}":"${formName}","${MODULE_NAME_KEY}":"${MODULE_NAME}"}}`;
}

// Mirrors the proxies attached to the binding data: only the ArkTS card subscribes to 'weather'.
export function proxyCountOf(isArkTsCard: boolean): number {
  return isArkTsCard ? 1 : 0;
}

// Mirrors { key: 'weather', subscriberid: conditionID } as a JSON string.
export function proxyJsonOf(subscriberId: string): string {
  return `[{"key":"${PROXY_KEY}","subscriberid":"${subscriberId}"}]`;
}

// Mirrors the then() / catch() logs of requestPublishForm().
export function publishLogOf(succeeded: boolean, detail: string): string {
  return succeeded ? `RequestPublishForm success : ${detail}` : `RequestPublishForm failed : ${detail}`;
}

// Mirrors the formDimension -> 'rows*columns' text used by form_config.json.
export function dimensionTextOf(dimension: number): string {
  switch (dimension) {
    case FormDimensionValue.DIMENSION_1_2:
      return '1*2';
    case FormDimensionValue.DIMENSION_2_2:
      return '2*2';
    case FormDimensionValue.DIMENSION_2_4:
      return '2*4';
    case FormDimensionValue.DIMENSION_4_4:
      return '4*4';
    default:
      return '';
  }
}

// Mirrors the inverse mapping of the dimension text.
export function dimensionOfText(text: string): number {
  const all: string[] = ['1*2', '2*2', '2*4', '4*4'];
  const index: number = all.indexOf(text);
  return index < 0 ? -1 : index + 1;
}

// Mirrors supportDimensions of form_config.json.
export function isSupportedDimension(dimension: number): boolean {
  return SUPPORT_DIMENSIONS.indexOf(dimensionTextOf(dimension)) >= 0;
}

// Mirrors the cell count of a dimension (rows x columns).
export function cellCountOf(dimension: number): number {
  const text: string = dimensionTextOf(dimension);
  if (text.length === 0) {
    return 0;
  }
  const parts: string[] = text.split('*');
  return parseInt(parts[0], 10) * parseInt(parts[1], 10);
}

// Mirrors updateDuration (unit: 30 minutes) of form_config.json.
export function updateIntervalMinutesOf(updateDuration: number): number {
  return updateDuration > 0 ? updateDuration * 30 : 0;
}

// Mirrors scheduledUpdateTime '10:30': minutes from a time of day until the next scheduled update.
export function minutesUntilScheduled(hour: number, minute: number): number {
  const target: number = 10 * 60 + 30;
  const now: number = hour * 60 + minute;
  const diff: number = target - now;
  return diff >= 0 ? diff : diff + 24 * 60;
}

// Mirrors autoDesignWidth with designWidth 720: the scale applied to a card of the given width.
export function designScaleOf(cardWidth: number): number {
  return cardWidth / DESIGN_WIDTH;
}

// Mirrors the Index page: each button builds its Want and records the publish result.
export class FormRequestState {
  requests: number = 0;
  lastFormName: string = '';
  lastLog: string = '';
  published: number = 0;
  failed: number = 0;

  // Mirrors the add-card Button.onClick().
  request(isArkTsCard: boolean): string {
    const want: PublishWant = publishWantOf(isArkTsCard);
    this.requests++;
    this.lastFormName = want.formName;
    return wantJsonOf(want.formName, want.dimension);
  }

  // Mirrors the then() branch with the form id string returned by the system.
  succeed(formId: string): string {
    this.published++;
    this.lastLog = publishLogOf(true, formId);
    return this.lastLog;
  }

  // Mirrors the catch() branch.
  fail(message: string): string {
    this.failed++;
    this.lastLog = publishLogOf(false, message);
    return this.lastLog;
  }
}
