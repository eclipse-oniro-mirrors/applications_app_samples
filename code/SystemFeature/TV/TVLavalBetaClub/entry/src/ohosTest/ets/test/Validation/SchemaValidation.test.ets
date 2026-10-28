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

import { describe, it, expect } from '@ohos/hypium';

const TYPE_STRING: string = 'string';

const TYPE_NUMBER: string = 'number';

const TYPE_BOOLEAN: string = 'boolean';

const TYPE_ARRAY: string = 'array';

const MAX_FIELDS: number = 24;

interface SchemaField {
  name: string;
  type: string;
  required: boolean;
  maxLength: number;
}

interface SchemaIssue {
  field: string;
  code: string;
}

// Declares the expected shape of a network payload
class Schema {
  private fields: Map<string, SchemaField> = new Map<string, SchemaField>();

  public define(name: string, type: string, required: boolean,
    maxLength: number = 256): boolean {
    if (name.length === 0 || this.fields.has(name) || this.fields.size >= MAX_FIELDS) {
      return false;
    }
    if (!Schema.isTypeValid(type) || maxLength < 0) {
      return false;
    }
    this.fields.set(name, {
      name: name,
      type: type,
      required: required,
      maxLength: maxLength
    });
    return true;
  }

  public static isTypeValid(type: string): boolean {
    return type === TYPE_STRING || type === TYPE_NUMBER ||
      type === TYPE_BOOLEAN || type === TYPE_ARRAY;
  }

  public has(name: string): boolean {
    return this.fields.has(name);
  }

  public fieldOf(name: string): SchemaField | undefined {
    return this.fields.get(name);
  }

  public size(): number {
    return this.fields.size;
  }

  public requiredFields(): string[] {
    const result: string[] = [];
    this.fields.forEach((field: SchemaField) => {
      if (field.required) {
        result.push(field.name);
      }
    });
    return result;
  }

  public names(): string[] {
    const result: string[] = [];
    this.fields.forEach((field: SchemaField, name: string) => {
      result.push(name);
    });
    return result;
  }

  public clear(): void {
    this.fields = new Map<string, SchemaField>();
  }
}

// Validates a string payload map against a schema
class SchemaValidator {
  public static isNumeric(value: string): boolean {
    if (value.length === 0) {
      return false;
    }
    const pattern: RegExp = new RegExp('^-?[0-9]+(\\.[0-9]+)?$');
    return pattern.test(value);
  }

  public static isBoolean(value: string): boolean {
    return value === 'true' || value === 'false';
  }

  public static isArray(value: string): boolean {
    return value.startsWith('[') && value.endsWith(']');
  }

  public static validate(schema: Schema, payload: Map<string, string>): SchemaIssue[] {
    const issues: SchemaIssue[] = [];
    const names = schema.names();
    for (let i = 0; i < names.length; i++) {
      const field = schema.fieldOf(names[i]) as SchemaField;
      const value = payload.get(field.name);
      if (value === undefined) {
        if (field.required) {
          issues.push({ field: field.name, code: 'required' });
        }
        continue;
      }
      if (value.length > field.maxLength) {
        issues.push({ field: field.name, code: 'length' });
        continue;
      }
      if (field.type === TYPE_NUMBER && !SchemaValidator.isNumeric(value)) {
        issues.push({ field: field.name, code: 'type' });
      } else if (field.type === TYPE_BOOLEAN && !SchemaValidator.isBoolean(value)) {
        issues.push({ field: field.name, code: 'type' });
      } else if (field.type === TYPE_ARRAY && !SchemaValidator.isArray(value)) {
        issues.push({ field: field.name, code: 'type' });
      }
    }
    return issues;
  }

  public static unknownFields(schema: Schema, payload: Map<string, string>): string[] {
    const unknown: string[] = [];
    payload.forEach((value: string, key: string) => {
      if (!schema.has(key)) {
        unknown.push(key);
      }
    });
    return unknown;
  }

  public static isValid(schema: Schema, payload: Map<string, string>): boolean {
    return SchemaValidator.validate(schema, payload).length === 0 &&
      SchemaValidator.unknownFields(schema, payload).length === 0;
  }
}

// Builds the standard issue and list schemas
class SchemaFactory {
  public static issueSchema(): Schema {
    const schema = new Schema();
    schema.define('issueId', TYPE_STRING, true, 64);
    schema.define('description', TYPE_STRING, true, 1024);
    schema.define('status', TYPE_STRING, true, 32);
    schema.define('attachmentCount', TYPE_NUMBER, false, 8);
    schema.define('logEnabled', TYPE_BOOLEAN, false, 8);
    schema.define('attachments', TYPE_ARRAY, false, 2048);
    return schema;
  }

  public static listSchema(): Schema {
    const schema = new Schema();
    schema.define('pageIndex', TYPE_NUMBER, true, 8);
    schema.define('pageSize', TYPE_NUMBER, true, 8);
    schema.define('total', TYPE_NUMBER, true, 8);
    return schema;
  }

  public static validIssuePayload(): Map<string, string> {
    const payload: Map<string, string> = new Map<string, string>();
    payload.set('issueId', 'ISSUE-1001');
    payload.set('description', 'screen flickers');
    payload.set('status', 'processing');
    payload.set('attachmentCount', '2');
    payload.set('logEnabled', 'true');
    payload.set('attachments', '[{"type":"image"}]');
    return payload;
  }
}

// Summarizes schema validation results
class SchemaReport {
  private checks: string[] = [];
  private failureItems: string[] = [];

  public check(name: string, passed: boolean): void {
    this.checks.push(name);
    if (!passed) {
      this.failureItems.push(name);
    }
  }

  public count(): number {
    return this.checks.length;
  }

  public failures(): string[] {
    return [...this.failureItems];
  }

  public isPassed(): boolean {
    return this.checks.length > 0 && this.failureItems.length === 0;
  }

  public reset(): void {
    this.checks = [];
    this.failureItems = [];
  }
}

export default function schemaValidationTest() {
  describe('SchemaValidation_Test', () => {

    it('schema_should_define_fields', 0, () => {
      const schema = new Schema();
      expect(schema.define('issueId', TYPE_STRING, true)).assertTrue();
      expect(schema.define('issueId', TYPE_STRING, true)).assertFalse();
      expect(schema.define('', TYPE_STRING, true)).assertFalse();
      expect(schema.size()).assertEqual(1);
      expect(schema.has('issueId')).assertTrue();
    });

    it('schema_should_validate_types', 0, () => {
      expect(Schema.isTypeValid(TYPE_STRING)).assertTrue();
      expect(Schema.isTypeValid(TYPE_NUMBER)).assertTrue();
      expect(Schema.isTypeValid(TYPE_BOOLEAN)).assertTrue();
      expect(Schema.isTypeValid(TYPE_ARRAY)).assertTrue();
      expect(Schema.isTypeValid('object')).assertFalse();
      const schema = new Schema();
      expect(schema.define('bad', 'object', true)).assertFalse();
      expect(schema.define('bad', TYPE_STRING, true, -1)).assertFalse();
    });

    it('schema_should_track_required_fields', 0, () => {
      const schema = SchemaFactory.issueSchema();
      expect(schema.size()).assertEqual(6);
      expect(schema.requiredFields().length).assertEqual(3);
      expect(schema.requiredFields().includes('issueId')).assertTrue();
      expect(schema.requiredFields().includes('attachmentCount')).assertFalse();
      expect(schema.names().length).assertEqual(6);
    });

    it('schema_should_return_field_metadata', 0, () => {
      const schema = SchemaFactory.issueSchema();
      const field = schema.fieldOf('description') as SchemaField;
      expect(field.name).assertEqual('description');
      expect(field.type).assertEqual(TYPE_STRING);
      expect(field.required).assertTrue();
      expect(field.maxLength).assertEqual(1024);
      expect(schema.fieldOf('missing') === undefined).assertTrue();
    });

    it('validator_should_check_scalar_types', 0, () => {
      expect(SchemaValidator.isNumeric('123')).assertTrue();
      expect(SchemaValidator.isNumeric('-12.5')).assertTrue();
      expect(SchemaValidator.isNumeric('')).assertFalse();
      expect(SchemaValidator.isNumeric('12a')).assertFalse();
      expect(SchemaValidator.isBoolean('true')).assertTrue();
      expect(SchemaValidator.isBoolean('false')).assertTrue();
      expect(SchemaValidator.isBoolean('yes')).assertFalse();
    });

    it('validator_should_check_arrays', 0, () => {
      expect(SchemaValidator.isArray('[]')).assertTrue();
      expect(SchemaValidator.isArray('[1,2]')).assertTrue();
      expect(SchemaValidator.isArray('[1,2')).assertFalse();
      expect(SchemaValidator.isArray('1,2')).assertFalse();
      expect(SchemaValidator.isArray('')).assertFalse();
    });

    it('validator_should_accept_valid_payload', 0, () => {
      const schema = SchemaFactory.issueSchema();
      const payload = SchemaFactory.validIssuePayload();
      expect(SchemaValidator.validate(schema, payload).length).assertEqual(0);
      expect(SchemaValidator.unknownFields(schema, payload).length).assertEqual(0);
      expect(SchemaValidator.isValid(schema, payload)).assertTrue();
    });

    it('validator_should_report_required_issues', 0, () => {
      const schema = SchemaFactory.issueSchema();
      const payload: Map<string, string> = new Map<string, string>();
      payload.set('attachmentCount', '1');
      const issues = SchemaValidator.validate(schema, payload);
      expect(issues.length).assertEqual(3);
      expect(issues[0].code).assertEqual('required');
      expect(issues.map((issue: SchemaIssue) => issue.field).includes('issueId')).assertTrue();
      expect(SchemaValidator.isValid(schema, payload)).assertFalse();
    });

    it('validator_should_report_length_issues', 0, () => {
      const schema = SchemaFactory.issueSchema();
      const payload = SchemaFactory.validIssuePayload();
      payload.set('issueId', 'a'.repeat(65));
      const issues = SchemaValidator.validate(schema, payload);
      expect(issues.length).assertEqual(1);
      expect(issues[0].field).assertEqual('issueId');
      expect(issues[0].code).assertEqual('length');
    });

    it('validator_should_report_type_issues', 0, () => {
      const schema = SchemaFactory.issueSchema();
      const payload = SchemaFactory.validIssuePayload();
      payload.set('attachmentCount', 'two');
      payload.set('logEnabled', 'yes');
      payload.set('attachments', 'not-array');
      const issues = SchemaValidator.validate(schema, payload);
      expect(issues.length).assertEqual(3);
      for (let i = 0; i < issues.length; i++) {
        expect(issues[i].code).assertEqual('type');
      }
    });

    it('validator_should_detect_unknown_fields', 0, () => {
      const schema = SchemaFactory.issueSchema();
      const payload = SchemaFactory.validIssuePayload();
      payload.set('unexpected', 'x');
      expect(SchemaValidator.unknownFields(schema, payload)).assertDeepEquals(['unexpected']);
      expect(SchemaValidator.validate(schema, payload).length).assertEqual(0);
      expect(SchemaValidator.isValid(schema, payload)).assertFalse();
    });

    it('validator_should_validate_list_schema', 0, () => {
      const schema = SchemaFactory.listSchema();
      const payload: Map<string, string> = new Map<string, string>();
      payload.set('pageIndex', '0');
      payload.set('pageSize', '10');
      payload.set('total', '25');
      expect(SchemaValidator.isValid(schema, payload)).assertTrue();
      payload.set('pageSize', 'abc');
      expect(SchemaValidator.validate(schema, payload).length).assertEqual(1);
    });

    it('report_should_aggregate_schema_checks', 0, () => {
      const report = new SchemaReport();
      report.check('required', true);
      report.check('types', true);
      expect(report.count()).assertEqual(2);
      expect(report.isPassed()).assertTrue();
      report.check('unknown', false);
      expect(report.isPassed()).assertFalse();
      expect(report.failures()).assertDeepEquals(['unknown']);
      report.reset();
      expect(report.count()).assertEqual(0);
    });

    it('schema_flow_should_validate_request_payload', 0, () => {
      const schema = SchemaFactory.issueSchema();
      const report = new SchemaReport();
      const payload = SchemaFactory.validIssuePayload();
      report.check('issues', SchemaValidator.validate(schema, payload).length === 0);
      report.check('unknown', SchemaValidator.unknownFields(schema, payload).length === 0);
      report.check('valid', SchemaValidator.isValid(schema, payload));
      expect(report.isPassed()).assertTrue();
      expect(payload.get('issueId')).assertEqual('ISSUE-1001');
      expect(schema.requiredFields().length).assertEqual(3);
    });

    it('schema_flow_should_block_invalid_payload', 0, () => {
      const schema = SchemaFactory.issueSchema();
      const report = new SchemaReport();
      const payload: Map<string, string> = new Map<string, string>();
      payload.set('description', '');
      payload.set('status', 'x'.repeat(40));
      payload.set('unexpected', 'y');
      const issues = SchemaValidator.validate(schema, payload);
      report.check('required', issues.length > 0);
      report.check('unknown', SchemaValidator.unknownFields(schema, payload).length === 0);
      expect(report.isPassed()).assertFalse();
      expect(issues.length).assertEqual(2);
      expect(issues[0].field).assertEqual('issueId');
    });

    it('schema_constants_should_be_stable', 0, () => {
      expect(TYPE_STRING).assertEqual('string');
      expect(TYPE_NUMBER).assertEqual('number');
      expect(TYPE_BOOLEAN).assertEqual('boolean');
      expect(TYPE_ARRAY).assertEqual('array');
      expect(MAX_FIELDS).assertEqual(24);
    });
  });
}


