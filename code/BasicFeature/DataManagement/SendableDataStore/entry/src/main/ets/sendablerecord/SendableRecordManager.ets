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

import { DataValidator } from '../utils/DataValidator';
import { DataStoreConstants } from '../constants/DataStoreConstants';
import { RecordDefinition, SchemaField, DataType } from '../models/DataModels';
import { Logger } from '../utils/Logger';
import { ResultText } from '../utils/ResultText';

/**
 * SendableRecordManager provides record creation, field management,
 * data operations, nested record support, and conversion utilities.
 */
export class SendableRecordManager {
  private recordName: string = '';
  private fieldNames: string[] = [];
  private fieldTypes: DataType[] = [];
  private fieldValues: string[] = [];
  private fieldRequired: boolean[] = [];
  private fieldDefaults: string[] = [];
  private fieldCount: number = 0;
  private createdAt: number = 0;
  private updatedAt: number = 0;
  private readCount: number = 0;
  private writeCount: number = 0;
  private nestedRecords: string[] = [];
  private nestedValues: string[] = [];
  private nestedCount: number = 0;

  constructor() {
  }

  createRecord(name: string, fields: SchemaField[]): string {
    if (!DataValidator.isValidKey(name)) {
      return ResultText.of($r('app.string.result_record_create_invalid_name'),
        'createRecord failed: invalid record name');
    }
    if (fields.length === 0) {
      return ResultText.of($r('app.string.result_record_create_no_fields'), 'createRecord failed: no fields defined');
    }
    if (fields.length > DataStoreConstants.MAX_RECORD_FIELDS) {
      return ResultText.ofArgs($r('app.string.result_record_create_exceeds_max'),
        [fields.length, DataStoreConstants.MAX_RECORD_FIELDS],
        `createRecord failed: ${fields.length} fields exceeds max ${DataStoreConstants.MAX_RECORD_FIELDS}`);
    }
    this.recordName = name;
    this.fieldNames = [];
    this.fieldTypes = [];
    this.fieldValues = [];
    this.fieldRequired = [];
    this.fieldDefaults = [];
    this.fieldCount = 0;
    for (let i: number = 0; i < fields.length; i++) {
      const field: SchemaField = fields[i];
      if (!DataValidator.isValidKey(field.name)) {
        return ResultText.ofArgs($r('app.string.result_record_create_invalid_field_name'), [field.name],
          `createRecord failed: invalid field name '${field.name}'`);
      }
      this.fieldNames.push(field.name);
      this.fieldTypes.push(field.dataType);
      this.fieldValues.push('');
      this.fieldRequired.push(field.required);
      this.fieldDefaults.push(field.defaultValue !== null ? field.defaultValue.toString() : '');
      this.fieldCount++;
    }
    this.nestedRecords = [];
    this.nestedValues = [];
    this.nestedCount = 0;
    this.createdAt = Date.now();
    this.updatedAt = this.createdAt;
    return ResultText.ofArgs($r('app.string.result_record_create_completed'), [name, this.fieldCount],
      `createRecord '${name}' completed: ${this.fieldCount} fields defined`);
  }

  createFromDefinition(definition: RecordDefinition): string {
    return this.createRecord(definition.name, definition.fields);
  }

  setStringField(fieldName: string, value: string): string {
    const idx: number = this.findFieldIndex(fieldName);
    if (idx < 0) {
      return ResultText.ofArgs($r('app.string.result_record_set_string_not_found'), [fieldName],
        `setStringField failed: field '${fieldName}' not found`);
    }
    if (this.fieldTypes[idx] !== DataType.STRING) {
      return ResultText.ofArgs($r('app.string.result_record_set_string_not_type'), [fieldName],
        `setStringField failed: field '${fieldName}' is not string type`);
    }
    if (value.length > DataStoreConstants.MAX_VALUE_LENGTH) {
      return ResultText.of($r('app.string.result_record_set_string_exceeds_length'),
        `setStringField failed: value exceeds max length`);
    }
    this.fieldValues[idx] = value;
    this.writeCount++;
    this.updatedAt = Date.now();
    return ResultText.ofArgs($r('app.string.result_record_set_string_completed'), [fieldName, value],
      `setStringField completed: ${fieldName}=${value}`);
  }

  setNumberField(fieldName: string, value: number): string {
    const idx: number = this.findFieldIndex(fieldName);
    if (idx < 0) {
      return ResultText.ofArgs($r('app.string.result_record_set_number_not_found'), [fieldName],
        `setNumberField failed: field '${fieldName}' not found`);
    }
    if (this.fieldTypes[idx] !== DataType.NUMBER) {
      return ResultText.ofArgs($r('app.string.result_record_set_number_not_type'), [fieldName],
        `setNumberField failed: field '${fieldName}' is not number type`);
    }
    this.fieldValues[idx] = value.toString();
    this.writeCount++;
    this.updatedAt = Date.now();
    return ResultText.ofArgs($r('app.string.result_record_set_number_completed'), [fieldName, String(value)],
      `setNumberField completed: ${fieldName}=${value}`);
  }

  setBooleanField(fieldName: string, value: boolean): string {
    const idx: number = this.findFieldIndex(fieldName);
    if (idx < 0) {
      return ResultText.ofArgs($r('app.string.result_record_set_boolean_not_found'), [fieldName],
        `setBooleanField failed: field '${fieldName}' not found`);
    }
    if (this.fieldTypes[idx] !== DataType.BOOLEAN) {
      return ResultText.ofArgs($r('app.string.result_record_set_boolean_not_type'), [fieldName],
        `setBooleanField failed: field '${fieldName}' is not boolean type`);
    }
    this.fieldValues[idx] = value ? 'true' : 'false';
    this.writeCount++;
    this.updatedAt = Date.now();
    return ResultText.ofArgs($r('app.string.result_record_set_boolean_completed'), [fieldName, String(value)],
      `setBooleanField completed: ${fieldName}=${value}`);
  }

  getStringField(fieldName: string): string {
    const idx: number = this.findFieldIndex(fieldName);
    if (idx < 0) {
      return ResultText.ofArgs($r('app.string.result_record_get_string_not_found'), [fieldName],
        `getStringField failed: field '${fieldName}' not found`);
    }
    if (this.fieldTypes[idx] !== DataType.STRING) {
      return ResultText.ofArgs($r('app.string.result_record_get_string_not_type'), [fieldName],
        `getStringField failed: field '${fieldName}' is not string type`);
    }
    this.readCount++;
    const value: string = this.fieldValues[idx].length > 0 ? this.fieldValues[idx] : this.fieldDefaults[idx];
    return ResultText.ofArgs($r('app.string.result_record_get_string_value'), [fieldName, value],
      `getStringField('${fieldName}'): ${value}`);
  }

  getNumberField(fieldName: string): string {
    const idx: number = this.findFieldIndex(fieldName);
    if (idx < 0) {
      return ResultText.ofArgs($r('app.string.result_record_get_number_not_found'), [fieldName],
        `getNumberField failed: field '${fieldName}' not found`);
    }
    if (this.fieldTypes[idx] !== DataType.NUMBER) {
      return ResultText.ofArgs($r('app.string.result_record_get_number_not_type'), [fieldName],
        `getNumberField failed: field '${fieldName}' is not number type`);
    }
    this.readCount++;
    const value: string = this.fieldValues[idx].length > 0 ? this.fieldValues[idx] : this.fieldDefaults[idx];
    return ResultText.ofArgs($r('app.string.result_record_get_number_value'), [fieldName, value],
      `getNumberField('${fieldName}'): ${value}`);
  }

  getBooleanField(fieldName: string): string {
    const idx: number = this.findFieldIndex(fieldName);
    if (idx < 0) {
      return ResultText.ofArgs($r('app.string.result_record_get_boolean_not_found'), [fieldName],
        `getBooleanField failed: field '${fieldName}' not found`);
    }
    if (this.fieldTypes[idx] !== DataType.BOOLEAN) {
      return ResultText.ofArgs($r('app.string.result_record_get_boolean_not_type'), [fieldName],
        `getBooleanField failed: field '${fieldName}' is not boolean type`);
    }
    this.readCount++;
    const value: string = this.fieldValues[idx].length > 0 ? this.fieldValues[idx] : this.fieldDefaults[idx];
    return ResultText.ofArgs($r('app.string.result_record_get_boolean_value'), [fieldName, value],
      `getBooleanField('${fieldName}'): ${value}`);
  }

  getField(fieldName: string): string {
    const idx: number = this.findFieldIndex(fieldName);
    if (idx < 0) {
      return ResultText.ofArgs($r('app.string.result_record_get_field_not_found'), [fieldName],
        `getField failed: field '${fieldName}' not found`);
    }
    this.readCount++;
    const value: string = this.fieldValues[idx].length > 0 ? this.fieldValues[idx] : this.fieldDefaults[idx];
    return ResultText.ofArgs($r('app.string.result_record_get_field_value'),
      [fieldName, value, String(this.fieldTypes[idx])],
      `getField('${fieldName}'): value=${value}, type=${this.fieldTypes[idx]}`);
  }

  hasField(fieldName: string): boolean {
    return this.findFieldIndex(fieldName) >= 0;
  }

  getAllFields(): string {
    if (this.fieldCount === 0) {
      return ResultText.of($r('app.string.result_record_all_fields_empty'), 'getAllFields: no fields defined');
    }
    const result: string[] = [];
    for (let i: number = 0; i < this.fieldCount; i++) {
      const value: string = this.fieldValues[i].length > 0 ? this.fieldValues[i] : this.fieldDefaults[i];
      result.push(`${this.fieldNames[i]}:${value}:${this.fieldTypes[i]}`);
    }
    this.readCount += this.fieldCount;
    return ResultText.ofArgs($r('app.string.result_record_all_fields'), [this.recordName, result.join(', ')],
      `Record '${this.recordName}': [${result.join(', ')}]`);
  }

  getFieldNames(): string[] {
    const result: string[] = [];
    for (let i: number = 0; i < this.fieldCount; i++) {
      result.push(this.fieldNames[i]);
    }
    return result;
  }

  getFieldCount(): number {
    return this.fieldCount;
  }

  validateRequired(): string {
    const missing: string[] = [];
    for (let i: number = 0; i < this.fieldCount; i++) {
      if (this.fieldRequired[i] && this.fieldValues[i].length === 0 && this.fieldDefaults[i].length === 0) {
        missing.push(this.fieldNames[i]);
      }
    }
    if (missing.length > 0) {
      return ResultText.ofArgs($r('app.string.result_record_validate_missing'), [missing.join(', ')],
        `validateRequired: MISSING [${missing.join(', ')}]`);
    }
    return ResultText.of($r('app.string.result_record_validate_ok'), 'validateRequired: all required fields are present');
  }

  resetField(fieldName: string): string {
    const idx: number = this.findFieldIndex(fieldName);
    if (idx < 0) {
      return ResultText.ofArgs($r('app.string.result_record_reset_field_not_found'), [fieldName],
        `resetField failed: field '${fieldName}' not found`);
    }
    this.fieldValues[idx] = '';
    this.writeCount++;
    this.updatedAt = Date.now();
    return ResultText.ofArgs($r('app.string.result_record_reset_field_completed'), [fieldName],
      `resetField completed: '${fieldName}' reset to default`);
  }

  resetAllFields(): string {
    for (let i: number = 0; i < this.fieldCount; i++) {
      this.fieldValues[i] = '';
    }
    this.writeCount += this.fieldCount;
    this.updatedAt = Date.now();
    return ResultText.of($r('app.string.result_record_reset_all_completed'), 'resetAllFields completed');
  }

  setDefaults(): string {
    for (let i: number = 0; i < this.fieldCount; i++) {
      if (this.fieldDefaults[i].length > 0) {
        this.fieldValues[i] = this.fieldDefaults[i];
      }
    }
    this.writeCount += this.fieldCount;
    this.updatedAt = Date.now();
    return ResultText.of($r('app.string.result_record_set_defaults_completed'), 'setDefaults completed');
  }

  addNestedRecord(name: string, value: string): string {
    if (!DataValidator.isValidKey(name)) {
      return ResultText.of($r('app.string.result_record_add_nested_invalid_name'), 'addNestedRecord failed: invalid name');
    }
    if (this.nestedCount >= DataStoreConstants.MAX_RECORD_FIELDS) {
      return ResultText.of($r('app.string.result_record_add_nested_max'), `addNestedRecord failed: max nested records reached`);
    }
    const existIdx: number = this.findNestedIndex(name);
    if (existIdx >= 0) {
      this.nestedValues[existIdx] = value;
      this.writeCount++;
      this.updatedAt = Date.now();
      return ResultText.ofArgs($r('app.string.result_record_add_nested_updated'), [name],
        `addNestedRecord updated: '${name}'`);
    }
    this.nestedRecords.push(name);
    this.nestedValues.push(value);
    this.nestedCount++;
    this.writeCount++;
    this.updatedAt = Date.now();
    return ResultText.ofArgs($r('app.string.result_record_add_nested_completed'), [name],
      `addNestedRecord completed: '${name}'`);
  }

  getNestedRecord(name: string): string {
    const idx: number = this.findNestedIndex(name);
    if (idx < 0) {
      return ResultText.ofArgs($r('app.string.result_record_get_nested_not_found'), [name],
        `getNestedRecord failed: '${name}' not found`);
    }
    this.readCount++;
    return ResultText.ofArgs($r('app.string.result_record_get_nested_value'), [name, this.nestedValues[idx]],
      `getNestedRecord('${name}'): ${this.nestedValues[idx]}`);
  }

  removeNestedRecord(name: string): string {
    const idx: number = this.findNestedIndex(name);
    if (idx < 0) {
      return ResultText.ofArgs($r('app.string.result_record_remove_nested_not_found'), [name],
        `removeNestedRecord failed: '${name}' not found`);
    }
    const newNames: string[] = [];
    const newValues: string[] = [];
    for (let i: number = 0; i < this.nestedCount; i++) {
      if (i !== idx) {
        newNames.push(this.nestedRecords[i]);
        newValues.push(this.nestedValues[i]);
      }
    }
    this.nestedRecords = newNames;
    this.nestedValues = newValues;
    this.nestedCount--;
    this.writeCount++;
    this.updatedAt = Date.now();
    return ResultText.ofArgs($r('app.string.result_record_remove_nested_completed'), [name],
      `removeNestedRecord completed: '${name}'`);
  }

  listNestedRecords(): string {
    if (this.nestedCount === 0) {
      return ResultText.of($r('app.string.result_record_list_nested_empty'), 'listNestedRecords: no nested records');
    }
    const result: string[] = [];
    for (let i: number = 0; i < this.nestedCount; i++) {
      result.push(this.nestedRecords[i]);
    }
    return ResultText.ofArgs($r('app.string.result_record_list_nested'), [result.join(', '), this.nestedCount],
      `Nested records: [${result.join(', ')}] (${this.nestedCount} records)`);
  }

  toJSONObject(): string {
    const parts: string[] = [];
    for (let i: number = 0; i < this.fieldCount; i++) {
      const value: string = this.fieldValues[i].length > 0 ? this.fieldValues[i] : this.fieldDefaults[i];
      parts.push(`"${this.fieldNames[i]}":"${value}"`);
    }
    for (let i: number = 0; i < this.nestedCount; i++) {
      parts.push(`"${this.nestedRecords[i]}":${this.nestedValues[i]}`);
    }
    return `{${parts.join(',')}}`;
  }

  toJSON(): string {
    return this.toJSONObject();
  }

  toSchemaJSON(): string {
    const fields: string[] = [];
    for (let i: number = 0; i < this.fieldCount; i++) {
      const req: string = this.fieldRequired[i] ? 'true' : 'false';
      fields.push(`{"name":"${this.fieldNames[i]}","type":"${this.fieldTypes[i]}","required":${req},"default":"${this.fieldDefaults[i]}"}`);
    }
    return `{"record":"${this.recordName}","fields":[${fields.join(',')}],"createdAt":${this.createdAt}}`;
  }

  getDefinition(): string {
    return ResultText.ofArgs($r('app.string.result_record_definition'),
      [this.recordName, this.fieldCount, this.nestedCount, this.createdAt],
      `Record '${this.recordName}': ${this.fieldCount} fields, ` +
        `${this.nestedCount} nested records, created=${this.createdAt}`);
  }

  getStatistics(): string {
    return ResultText.ofArgs($r('app.string.result_record_statistics'),
      [this.recordName, this.fieldCount, this.nestedCount, this.readCount, this.writeCount,
        this.createdAt, this.updatedAt],
      `Record Statistics: name=${this.recordName}, fields=${this.fieldCount}, ` +
        `nested=${this.nestedCount}, reads=${this.readCount}, writes=${this.writeCount}, ` +
        `createdAt=${this.createdAt}, updatedAt=${this.updatedAt}`);
  }

  resetStatistics(): string {
    this.readCount = 0;
    this.writeCount = 0;
    return ResultText.of($r('app.string.result_record_statistics_reset'), 'Record statistics reset');
  }

  isInitialized(): boolean {
    return this.fieldCount > 0;
  }

  getRecordName(): string {
    return this.recordName;
  }

  release(): void {
    this.recordName = '';
    this.fieldNames = [];
    this.fieldTypes = [];
    this.fieldValues = [];
    this.fieldRequired = [];
    this.fieldDefaults = [];
    this.fieldCount = 0;
    this.nestedRecords = [];
    this.nestedValues = [];
    this.nestedCount = 0;
    this.createdAt = 0;
    this.updatedAt = 0;
    this.readCount = 0;
    this.writeCount = 0;
    Logger.info('SendableRecordManager released');
  }

  private findFieldIndex(name: string): number {
    for (let i: number = 0; i < this.fieldCount; i++) {
      if (this.fieldNames[i] === name) {
        return i;
      }
    }
    return -1;
  }

  private findNestedIndex(name: string): number {
    for (let i: number = 0; i < this.nestedCount; i++) {
      if (this.nestedRecords[i] === name) {
        return i;
      }
    }
    return -1;
  }
}
