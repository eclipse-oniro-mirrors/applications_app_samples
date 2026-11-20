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

// Deterministic logic of entry/src/main/ets/FormAbility/FormAbility.ts and of the proxy form abilities in
// persistentProxyForm / processProxyForm (subscriber id selection, template SQL, proxies, persisted condition id).

// Mirrors the constants of FormAbility.ts.
export const DATA_STORAGE_PATH: string = '/data/storage/el2/base/haps/form_store';
export const FORM_PARAM_IDENTITY_KEY: string = 'ohos.extra.param.key.form_identity';
export const FORM_PARAM_NAME_KEY: string = 'ohos.extra.param.key.form_name';
export const FORM_PARAM_TEMPORARY_KEY: string = 'ohos.extra.param.key.form_temporary';
export const BASE_TEMP_MOD: number = 20;
export const RANGE_TEMP_MOD: number = 20;
// Mirrors the defaults of the proxy form abilities.
export const DEFAULT_SUBSCRIBER_ID: string = '110000';
export const PROXY_URI: string = 'datashareproxy://ohos.samples.formextability/test';
export const PERSISTENT_FILE_NAME: string = '/Persistent.txt';
export const CONDITION_DATA_SIZE: number = 6;

// Mirrors the record stored by storeFormInfo() / read by updateForm().
export class FormRecord {
  formName: string = '';
  tempFlag: boolean = false;
  updateCount: number = 0;

  constructor(formName: string, tempFlag: boolean, updateCount: number) {
    this.formName = formName;
    this.tempFlag = tempFlag;
    this.updateCount = updateCount;
  }
}

// Mirrors getTemperature(formId, count): parseInt(formId) % 20 + |count % 20 - 10|.
export function getTemperature(formId: string, count: number): number {
  const parsedFormId: number = parseInt(formId, 10);
  const baseTemperature: number = parsedFormId % BASE_TEMP_MOD;
  return baseTemperature + Math.abs(count % RANGE_TEMP_MOD - RANGE_TEMP_MOD / 2);
}

// Mirrors the temperature string bound to the card: getTemperature(...).toString().
export function temperatureTextOf(formId: string, count: number): string {
  return getTemperature(formId, count).toString();
}

// Mirrors padZero(num).
export function padZero(num: number): string {
  if (num < 10) {
    return `0${num}`;
  }
  return num.toString();
}

// Mirrors getTime() for explicit hour, minute and second values.
export function formatTime(hours: number, minutes: number, seconds: number): string {
  return `${padZero(hours)}:${padZero(minutes)}:${padZero(seconds)}`;
}

// Mirrors JSON.stringify(formInfo) written by storeFormInfo().
export function storedRecordJsonOf(formName: string, tempFlag: boolean): string {
  return JSON.stringify(new FormRecord(formName, tempFlag, 0));
}

// Mirrors Boolean(want.parameters[FORM_PARAM_TEMPORARY_KEY]) for the parameter text received.
export function temporaryFlagOf(value: string): boolean {
  return Boolean(value);
}

// Mirrors updateTempFormInfo(): only temporary forms are converted (tempFlag becomes false).
export function castToNormal(record: FormRecord): FormRecord {
  if (!record.tempFlag) {
    return record;
  }
  return new FormRecord(record.formName, false, record.updateCount);
}

// Mirrors updateForm(): updateCount + 1 before the temperature is recomputed.
export function nextUpdateCountOf(updateCount: number): number {
  return updateCount + 1;
}

// Mirrors the subscriber id choice of the proxy forms: a non-empty persisted id wins over '110000'.
export function subscriberIdOf(persistedId: string): string {
  if (persistedId !== '') {
    return persistedId;
  }
  return DEFAULT_SUBSCRIBER_ID;
}

// Mirrors the template SQL of persistentProxyForm EntryFormAbility.onAddForm().
export function templateSqlOf(subscriberId: string): string {
  return `select cityTemperature as cityTemperature, cityName as cityName from TBL00 where cityId = ${subscriberId}`;
}

// Mirrors the proxies keys of the process proxy form: 'cityName' and 'cityTemperature'.
export function processProxyKeysOf(): string[] {
  return ['cityName', 'cityTemperature'];
}

// Mirrors JSON.stringify(formBinding) logged by the persistent proxy form.
export function persistentBindingJsonOf(subscriberId: string): string {
  return `{"data":"{}","proxies":[{"key":"${PROXY_URI}","subscriberId":"${subscriberId}"}]}`;
}

// Mirrors getConditionIDtoFile(): invalid inputs return '' before any file access.
export function isValidConditionRequest(hasContext: boolean, fileName: string): boolean {
  return hasContext && fileName !== '';
}

// Mirrors the persisted condition id: the file is read into a 6 byte buffer.
export function persistedConditionOf(fileContent: string): string {
  let text: string = fileContent.substring(0, CONDITION_DATA_SIZE);
  while (text.length < CONDITION_DATA_SIZE) {
    text += '\u0000';
  }
  return text;
}

// Mirrors context.filesDir + fileName of StatePersistence.ts.
export function conditionFilePathOf(filesDir: string, fileName: string): string {
  return filesDir + fileName;
}

// Mirrors the form lifecycle of FormAbility: add stores a record, update counts, cast converts, remove deletes.
export class FormStoreModel {
  formIds: string[] = [];
  names: string[] = [];
  temps: boolean[] = [];
  counts: number[] = [];

  // Mirrors onAddForm(): storeFormInfo(formId, formName, tempFlag); returns the initial temperature text.
  add(formId: string, formName: string, tempFlag: boolean): string {
    const index: number = this.formIds.indexOf(formId);
    if (index >= 0) {
      this.names[index] = formName;
      this.temps[index] = tempFlag;
      this.counts[index] = 0;
    } else {
      this.formIds.push(formId);
      this.names.push(formName);
      this.temps.push(tempFlag);
      this.counts.push(0);
    }
    return temperatureTextOf(formId, 0);
  }

  // Mirrors onUpdateForm() -> updateForm(): unknown ids start from the default record.
  update(formId: string): string {
    let index: number = this.formIds.indexOf(formId);
    if (index < 0) {
      this.formIds.push(formId);
      this.names.push('');
      this.temps.push(false);
      this.counts.push(0);
      index = this.formIds.length - 1;
    }
    this.counts[index] = nextUpdateCountOf(this.counts[index]);
    return temperatureTextOf(formId, this.counts[index]);
  }

  // Mirrors onCastToNormalForm() -> updateTempFormInfo(); returns whether the record changed.
  castToNormal(formId: string): boolean {
    const index: number = this.formIds.indexOf(formId);
    if (index < 0 || !this.temps[index]) {
      return false;
    }
    this.temps[index] = false;
    return true;
  }

  // Mirrors onRemoveForm() -> deleteFormInfo().
  remove(formId: string): number {
    const index: number = this.formIds.indexOf(formId);
    if (index >= 0) {
      this.formIds.splice(index, 1);
      this.names.splice(index, 1);
      this.temps.splice(index, 1);
      this.counts.splice(index, 1);
    }
    return this.formIds.length;
  }

  // Mirrors the stored updateCount of a form (-1 when it is not stored).
  countOf(formId: string): number {
    const index: number = this.formIds.indexOf(formId);
    return index < 0 ? -1 : this.counts[index];
  }
}
