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
      return 'createRecord failed: invalid record name';
    }
    if (fields.length === 0) {
      return 'createRecord failed: no fields defined';
    }
    if (fields.length > DataStoreConstants.MAX_RECORD_FIELDS) {
      return `createRecord failed: ${fields.length} fields exceeds max ${DataStoreConstants.MAX_RECORD_FIELDS}`;
    }
    this.recordName = name;
    this.fieldNames = [];
    this.fieldTypes = [];
    this.fieldValues = [];
    this.fieldRequired = [];
    this.fieldDefaults = [];
    this.fieldCount = 0;
    for (let i = 0; i < fields.length; i++) {
      const field = fields[i];
      if (!DataValidator.isValidKey(field.name)) {
        return `createRecord failed: invalid field name '${field.name}'`;
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
    return `createRecord '${name}' completed: ${this.fieldCount} fields defined`;
  }

  createFromDefinition(definition: RecordDefinition): string {
    return this.createRecord(definition.name, definition.fields);
  }

  setStringField(fieldName: string, value: string): string {
    const idx = this.findFieldIndex(fieldName);
    if (idx < 0) {
      return `setStringField failed: field '${fieldName}' not found`;
    }
    if (this.fieldTypes[idx] !== DataType.STRING) {
      return `setStringField failed: field '${fieldName}' is not string type`;
    }
    if (value.length > DataStoreConstants.MAX_VALUE_LENGTH) {
      return `setStringField failed: value exceeds max length`;
    }
    this.fieldValues[idx] = value;
    this.writeCount++;
    this.updatedAt = Date.now();
    return `setStringField completed: ${fieldName}=${value}`;
  }

  setNumberField(fieldName: string, value: number): string {
    const idx = this.findFieldIndex(fieldName);
    if (idx < 0) {
      return `setNumberField failed: field '${fieldName}' not found`;
    }
    if (this.fieldTypes[idx] !== DataType.NUMBER) {
      return `setNumberField failed: field '${fieldName}' is not number type`;
    }
    this.fieldValues[idx] = value.toString();
    this.writeCount++;
    this.updatedAt = Date.now();
    return `setNumberField completed: ${fieldName}=${value}`;
  }

  setBooleanField(fieldName: string, value: boolean): string {
    const idx = this.findFieldIndex(fieldName);
    if (idx < 0) {
      return `setBooleanField failed: field '${fieldName}' not found`;
    }
    if (this.fieldTypes[idx] !== DataType.BOOLEAN) {
      return `setBooleanField failed: field '${fieldName}' is not boolean type`;
    }
    this.fieldValues[idx] = value ? 'true' : 'false';
    this.writeCount++;
    this.updatedAt = Date.now();
    return `setBooleanField completed: ${fieldName}=${value}`;
  }

  getStringField(fieldName: string): string {
    const idx = this.findFieldIndex(fieldName);
    if (idx < 0) {
      return `getStringField failed: field '${fieldName}' not found`;
    }
    if (this.fieldTypes[idx] !== DataType.STRING) {
      return `getStringField failed: field '${fieldName}' is not string type`;
    }
    this.readCount++;
    const value = this.fieldValues[idx].length > 0 ? this.fieldValues[idx] : this.fieldDefaults[idx];
    return `getStringField('${fieldName}'): ${value}`;
  }

  getNumberField(fieldName: string): string {
    const idx = this.findFieldIndex(fieldName);
    if (idx < 0) {
      return `getNumberField failed: field '${fieldName}' not found`;
    }
    if (this.fieldTypes[idx] !== DataType.NUMBER) {
      return `getNumberField failed: field '${fieldName}' is not number type`;
    }
    this.readCount++;
    const value = this.fieldValues[idx].length > 0 ? this.fieldValues[idx] : this.fieldDefaults[idx];
    return `getNumberField('${fieldName}'): ${value}`;
  }

  getBooleanField(fieldName: string): string {
    const idx = this.findFieldIndex(fieldName);
    if (idx < 0) {
      return `getBooleanField failed: field '${fieldName}' not found`;
    }
    if (this.fieldTypes[idx] !== DataType.BOOLEAN) {
      return `getBooleanField failed: field '${fieldName}' is not boolean type`;
    }
    this.readCount++;
    const value = this.fieldValues[idx].length > 0 ? this.fieldValues[idx] : this.fieldDefaults[idx];
    return `getBooleanField('${fieldName}'): ${value}`;
  }

  getField(fieldName: string): string {
    const idx = this.findFieldIndex(fieldName);
    if (idx < 0) {
      return `getField failed: field '${fieldName}' not found`;
    }
    this.readCount++;
    const value = this.fieldValues[idx].length > 0 ? this.fieldValues[idx] : this.fieldDefaults[idx];
    return `getField('${fieldName}'): value=${value}, type=${this.fieldTypes[idx]}`;
  }

  hasField(fieldName: string): boolean {
    return this.findFieldIndex(fieldName) >= 0;
  }

  getAllFields(): string {
    if (this.fieldCount === 0) {
      return 'getAllFields: no fields defined';
    }
    const result: string[] = [];
    for (let i = 0; i < this.fieldCount; i++) {
      const value = this.fieldValues[i].length > 0 ? this.fieldValues[i] : this.fieldDefaults[i];
      result.push(`${this.fieldNames[i]}:${value}:${this.fieldTypes[i]}`);
    }
    this.readCount += this.fieldCount;
    return `Record '${this.recordName}': [${result.join(', ')}]`;
  }

  getFieldNames(): string[] {
    const result: string[] = [];
    for (let i = 0; i < this.fieldCount; i++) {
      result.push(this.fieldNames[i]);
    }
    return result;
  }

  getFieldCount(): number {
    return this.fieldCount;
  }

  validateRequired(): string {
    const missing: string[] = [];
    for (let i = 0; i < this.fieldCount; i++) {
      if (this.fieldRequired[i] && this.fieldValues[i].length === 0 && this.fieldDefaults[i].length === 0) {
        missing.push(this.fieldNames[i]);
      }
    }
    if (missing.length > 0) {
      return `validateRequired: MISSING [${missing.join(', ')}]`;
    }
    return 'validateRequired: all required fields are present';
  }

  resetField(fieldName: string): string {
    const idx = this.findFieldIndex(fieldName);
    if (idx < 0) {
      return `resetField failed: field '${fieldName}' not found`;
    }
    this.fieldValues[idx] = '';
    this.writeCount++;
    this.updatedAt = Date.now();
    return `resetField completed: '${fieldName}' reset to default`;
  }

  resetAllFields(): string {
    for (let i = 0; i < this.fieldCount; i++) {
      this.fieldValues[i] = '';
    }
    this.writeCount += this.fieldCount;
    this.updatedAt = Date.now();
    return 'resetAllFields completed';
  }

  setDefaults(): string {
    for (let i = 0; i < this.fieldCount; i++) {
      if (this.fieldDefaults[i].length > 0) {
        this.fieldValues[i] = this.fieldDefaults[i];
      }
    }
    this.writeCount += this.fieldCount;
    this.updatedAt = Date.now();
    return 'setDefaults completed';
  }

  addNestedRecord(name: string, value: string): string {
    if (!DataValidator.isValidKey(name)) {
      return 'addNestedRecord failed: invalid name';
    }
    if (this.nestedCount >= DataStoreConstants.MAX_RECORD_FIELDS) {
      return `addNestedRecord failed: max nested records reached`;
    }
    const existIdx = this.findNestedIndex(name);
    if (existIdx >= 0) {
      this.nestedValues[existIdx] = value;
      this.writeCount++;
      this.updatedAt = Date.now();
      return `addNestedRecord updated: '${name}'`;
    }
    this.nestedRecords.push(name);
    this.nestedValues.push(value);
    this.nestedCount++;
    this.writeCount++;
    this.updatedAt = Date.now();
    return `addNestedRecord completed: '${name}'`;
  }

  getNestedRecord(name: string): string {
    const idx = this.findNestedIndex(name);
    if (idx < 0) {
      return `getNestedRecord failed: '${name}' not found`;
    }
    this.readCount++;
    return `getNestedRecord('${name}'): ${this.nestedValues[idx]}`;
  }

  removeNestedRecord(name: string): string {
    const idx = this.findNestedIndex(name);
    if (idx < 0) {
      return `removeNestedRecord failed: '${name}' not found`;
    }
    const newNames: string[] = [];
    const newValues: string[] = [];
    for (let i = 0; i < this.nestedCount; i++) {
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
    return `removeNestedRecord completed: '${name}'`;
  }

  listNestedRecords(): string {
    if (this.nestedCount === 0) {
      return 'listNestedRecords: no nested records';
    }
    const result: string[] = [];
    for (let i = 0; i < this.nestedCount; i++) {
      result.push(this.nestedRecords[i]);
    }
    return `Nested records: [${result.join(', ')}] (${this.nestedCount} records)`;
  }

  toJSONObject(): string {
    const parts: string[] = [];
    for (let i = 0; i < this.fieldCount; i++) {
      const value = this.fieldValues[i].length > 0 ? this.fieldValues[i] : this.fieldDefaults[i];
      parts.push(`"${this.fieldNames[i]}":"${value}"`);
    }
    for (let i = 0; i < this.nestedCount; i++) {
      parts.push(`"${this.nestedRecords[i]}":${this.nestedValues[i]}`);
    }
    return `{${parts.join(',')}}`;
  }

  toJSON(): string {
    return this.toJSONObject();
  }

  toSchemaJSON(): string {
    const fields: string[] = [];
    for (let i = 0; i < this.fieldCount; i++) {
      const req = this.fieldRequired[i] ? 'true' : 'false';
      fields.push(`{"name":"${this.fieldNames[i]}","type":"${this.fieldTypes[i]}","required":${req},"default":"${this.fieldDefaults[i]}"}`);
    }
    return `{"record":"${this.recordName}","fields":[${fields.join(',')}],"createdAt":${this.createdAt}}`;
  }

  getDefinition(): string {
    return `Record '${this.recordName}': ${this.fieldCount} fields, ` +
      `${this.nestedCount} nested records, created=${this.createdAt}`;
  }

  getStatistics(): string {
    return `Record Statistics: name=${this.recordName}, fields=${this.fieldCount}, ` +
      `nested=${this.nestedCount}, reads=${this.readCount}, writes=${this.writeCount}, ` +
      `createdAt=${this.createdAt}, updatedAt=${this.updatedAt}`;
  }

  resetStatistics(): string {
    this.readCount = 0;
    this.writeCount = 0;
    return 'Record statistics reset';
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
    for (let i = 0; i < this.fieldCount; i++) {
      if (this.fieldNames[i] === name) {
        return i;
      }
    }
    return -1;
  }

  private findNestedIndex(name: string): number {
    for (let i = 0; i < this.nestedCount; i++) {
      if (this.nestedRecords[i] === name) {
        return i;
      }
    }
    return -1;
  }
}
