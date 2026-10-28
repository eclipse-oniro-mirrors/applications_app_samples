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

const MAX_DESCRIPTION: number = 1024;

const MIN_DESCRIPTION: number = 1;

const MAX_REMARK: number = 200;

const MAX_PHONE: number = 15;

const MIN_PHONE: number = 6;

const MAX_FILE_NAME: number = 128;

const MAX_URL_PARAM: number = 256;

const ALLOWED_EXTENSIONS: string[] = ['png', 'jpg', 'jpeg', 'mp4', 'mp3', 'log', 'tar', 'zip'];

interface FieldError {
  field: string;
  code: string;
}

// Validates issue description text
class DescriptionValidator {
  public static isRequired(value: string): boolean {
    return value.trim().length >= MIN_DESCRIPTION;
  }

  public static isWithinLimit(value: string): boolean {
    return value.length <= MAX_DESCRIPTION;
  }

  public static hasControlCharacters(value: string): boolean {
    for (let i = 0; i < value.length; i++) {
      const code = value.charCodeAt(i);
      if ((code < 32 && code !== 9 && code !== 10) || code === 127) {
        return true;
      }
    }
    return false;
  }

  public static validate(value: string): FieldError | undefined {
    if (!DescriptionValidator.isRequired(value)) {
      return { field: 'description', code: 'required' };
    }
    if (!DescriptionValidator.isWithinLimit(value)) {
      return { field: 'description', code: 'tooLong' };
    }
    if (DescriptionValidator.hasControlCharacters(value)) {
      return { field: 'description', code: 'controlCharacter' };
    }
    return undefined;
  }

  public static remaining(value: string): number {
    const remaining = MAX_DESCRIPTION - value.length;
    return remaining < 0 ? 0 : remaining;
  }
}

// Validates optional phone numbers
class PhoneValidator {
  public static isDigitsOnly(value: string): boolean {
    const pattern: RegExp = new RegExp('^[0-9]+$');
    return pattern.test(value);
  }

  public static isLengthValid(value: string): boolean {
    return value.length >= MIN_PHONE && value.length <= MAX_PHONE;
  }

  public static hasValidPrefix(value: string): boolean {
    return value.length === 0 || value.startsWith('1') || value.startsWith('0');
  }

  public static isValid(value: string): boolean {
    if (value.length === 0) {
      return true;
    }
    return PhoneValidator.isDigitsOnly(value) && PhoneValidator.isLengthValid(value) &&
      PhoneValidator.hasValidPrefix(value);
  }

  public static mask(value: string): string {
    if (value.length < 7) {
      return '***';
    }
    return value.substring(0, 3) + '****' + value.substring(value.length - 4);
  }

  public static normalize(value: string): string {
    return value.split('-').join('').split(' ').join('').trim();
  }
}

// Validates attachment file names and extensions
class FileNameValidator {
  public static extensionOf(fileName: string): string {
    const index = fileName.lastIndexOf('.');
    if (index < 0 || index === fileName.length - 1) {
      return '';
    }
    return fileName.substring(index + 1).toLowerCase();
  }

  public static isExtensionAllowed(fileName: string): boolean {
    return ALLOWED_EXTENSIONS.includes(FileNameValidator.extensionOf(fileName));
  }

  public static isLengthValid(fileName: string): boolean {
    return fileName.length > 0 && fileName.length <= MAX_FILE_NAME;
  }

  public static isPathSafe(fileName: string): boolean {
    return fileName.indexOf('..') < 0 && fileName.indexOf('/') < 0 &&
      fileName.indexOf('\\') < 0 && !fileName.startsWith('.');
  }

  public static validate(fileName: string): FieldError | undefined {
    if (!FileNameValidator.isLengthValid(fileName)) {
      return { field: 'fileName', code: 'length' };
    }
    if (!FileNameValidator.isPathSafe(fileName)) {
      return { field: 'fileName', code: 'unsafePath' };
    }
    if (!FileNameValidator.isExtensionAllowed(fileName)) {
      return { field: 'fileName', code: 'extension' };
    }
    return undefined;
  }

  public static sanitize(fileName: string): string {
    let result: string = fileName.split('..').join('');
    result = result.split('/').join('_').split('\\').join('_');
    if (result.startsWith('.')) {
      result = result.substring(1);
    }
    return result.length === 0 ? 'unnamed' : result;
  }
}

// Validates URL query parameters used by the list page
class UrlParamValidator {
  public static isKeyValid(key: string): boolean {
    const pattern: RegExp = new RegExp('^[A-Za-z0-9_]+$');
    return pattern.test(key);
  }

  public static isValueValid(value: string): boolean {
    return value.length <= MAX_URL_PARAM && value.indexOf('\n') < 0 && value.indexOf('\r') < 0;
  }

  public static isPageIndexValid(value: number): boolean {
    return value >= 0 && value <= 10000;
  }

  public static isPageSizeValid(value: number): boolean {
    return value >= 1 && value <= 50;
  }

  public static validate(key: string, value: string): FieldError | undefined {
    if (!UrlParamValidator.isKeyValid(key)) {
      return { field: key, code: 'key' };
    }
    if (!UrlParamValidator.isValueValid(value)) {
      return { field: key, code: 'value' };
    }
    return undefined;
  }
}

// Collects validation errors for the whole form
class InputFormValidator {
  private errors: FieldError[] = [];

  public validateAll(description: string, phone: string, fileName: string): FieldError[] {
    this.errors = [];
    const descriptionError = DescriptionValidator.validate(description);
    if (descriptionError !== undefined) {
      this.errors.push(descriptionError);
    }
    if (!PhoneValidator.isValid(phone)) {
      this.errors.push({ field: 'phone', code: 'format' });
    }
    if (fileName.length > 0) {
      const fileError = FileNameValidator.validate(fileName);
      if (fileError !== undefined) {
        this.errors.push(fileError);
      }
    }
    return [...this.errors];
  }

  public hasErrors(): boolean {
    return this.errors.length > 0;
  }

  public count(): number {
    return this.errors.length;
  }

  public fields(): string[] {
    return this.errors.map((error: FieldError) => error.field);
  }

  public clear(): void {
    this.errors = [];
  }
}

export default function inputValidationTest() {
  describe('InputValidation_Test', () => {

    it('description_should_be_required', 0, () => {
      expect(DescriptionValidator.isRequired('')).assertFalse();
      expect(DescriptionValidator.isRequired('   ')).assertFalse();
      expect(DescriptionValidator.isRequired('a')).assertTrue();
      const error = DescriptionValidator.validate('');
      expect(error !== undefined).assertTrue();
      expect((error as FieldError).code).assertEqual('required');
    });

    it('description_should_respect_max_length', 0, () => {
      const exact = 'a'.repeat(MAX_DESCRIPTION);
      const overflow = 'a'.repeat(MAX_DESCRIPTION + 1);
      expect(DescriptionValidator.isWithinLimit(exact)).assertTrue();
      expect(DescriptionValidator.isWithinLimit(overflow)).assertFalse();
      expect(DescriptionValidator.validate(exact) === undefined).assertTrue();
      expect((DescriptionValidator.validate(overflow) as FieldError).code).assertEqual('tooLong');
      expect(DescriptionValidator.remaining(exact)).assertEqual(0);
      expect(DescriptionValidator.remaining(overflow)).assertEqual(0);
    });

    it('description_should_allow_tabs_and_newlines', 0, () => {
      expect(DescriptionValidator.hasControlCharacters('line1\nline2')).assertFalse();
      expect(DescriptionValidator.hasControlCharacters('col1\tcol2')).assertFalse();
      expect(DescriptionValidator.validate('line1\nline2') === undefined).assertTrue();
      expect(DescriptionValidator.hasControlCharacters('bell' + String.fromCharCode(7))).assertTrue();
      expect(DescriptionValidator.hasControlCharacters('del' + String.fromCharCode(127))).assertTrue();
    });

    it('description_should_report_control_characters', 0, () => {
      const error = DescriptionValidator.validate('bad' + String.fromCharCode(1) + 'text');
      expect(error !== undefined).assertTrue();
      expect((error as FieldError).code).assertEqual('controlCharacter');
      expect(DescriptionValidator.validate('good text') === undefined).assertTrue();
    });

    it('phone_should_accept_empty_optional_value', 0, () => {
      expect(PhoneValidator.isValid('')).assertTrue();
      expect(PhoneValidator.isLengthValid('')).assertFalse();
      expect(PhoneValidator.hasValidPrefix('')).assertTrue();
    });

    it('phone_should_validate_digits_and_length', 0, () => {
      expect(PhoneValidator.isValid('13812345678')).assertTrue();
      expect(PhoneValidator.isValid('123456')).assertTrue();
      expect(PhoneValidator.isValid('12345')).assertFalse();
      expect(PhoneValidator.isValid('1234567890123456')).assertFalse();
      expect(PhoneValidator.isDigitsOnly('138abc')).assertFalse();
      expect(PhoneValidator.isValid('138abc')).assertFalse();
    });

    it('phone_should_validate_prefix', 0, () => {
      expect(PhoneValidator.hasValidPrefix('13800000000')).assertTrue();
      expect(PhoneValidator.hasValidPrefix('07551234')).assertTrue();
      expect(PhoneValidator.isValid('23800000000')).assertFalse();
      expect(PhoneValidator.normalize('138-0000-0000')).assertEqual('13800000000');
      expect(PhoneValidator.normalize(' 138 0000 0000 ')).assertEqual('13800000000');
    });

    it('phone_should_mask_middle_digits', 0, () => {
      expect(PhoneValidator.mask('13812345678')).assertEqual('138****5678');
      expect(PhoneValidator.mask('1234567')).assertEqual('123****4567');
      expect(PhoneValidator.mask('123')).assertEqual('***');
      expect(PhoneValidator.mask('')).assertEqual('***');
    });

    it('file_name_should_extract_extension', 0, () => {
      expect(FileNameValidator.extensionOf('a.png')).assertEqual('png');
      expect(FileNameValidator.extensionOf('a.JPG')).assertEqual('jpg');
      expect(FileNameValidator.extensionOf('noext')).assertEqual('');
      expect(FileNameValidator.extensionOf('trailing.')).assertEqual('');
      expect(FileNameValidator.extensionOf('a.tar.gz')).assertEqual('gz');
    });

    it('file_name_should_allow_known_extensions', 0, () => {
      for (let i = 0; i < ALLOWED_EXTENSIONS.length; i++) {
        expect(FileNameValidator.isExtensionAllowed(`file.${ALLOWED_EXTENSIONS[i]}`)).assertTrue();
      }
      expect(FileNameValidator.isExtensionAllowed('file.dmg')).assertFalse();
      expect(FileNameValidator.isExtensionAllowed('file.exe')).assertFalse();
      expect(ALLOWED_EXTENSIONS.length).assertEqual(8);
    });

    it('file_name_should_reject_unsafe_paths', 0, () => {
      expect(FileNameValidator.isPathSafe('ok.png')).assertTrue();
      expect(FileNameValidator.isPathSafe('../ok.png')).assertFalse();
      expect(FileNameValidator.isPathSafe('dir/ok.png')).assertFalse();
      expect(FileNameValidator.isPathSafe('dir\\ok.png')).assertFalse();
      expect(FileNameValidator.isPathSafe('.hidden.png')).assertFalse();
    });

    it('file_name_should_validate_and_sanitize', 0, () => {
      expect(FileNameValidator.validate('ok.png') === undefined).assertTrue();
      expect((FileNameValidator.validate('bad.exe') as FieldError).code).assertEqual('extension');
      expect((FileNameValidator.validate('../ok.png') as FieldError).code).assertEqual('unsafePath');
      expect(FileNameValidator.sanitize('../a.png')).assertEqual('_a.png');
      expect(FileNameValidator.sanitize('a/b.png')).assertEqual('a_b.png');
      expect(FileNameValidator.sanitize('')).assertEqual('unnamed');
    });

    it('url_param_should_validate_key', 0, () => {
      expect(UrlParamValidator.isKeyValid('issueId')).assertTrue();
      expect(UrlParamValidator.isKeyValid('page_index')).assertTrue();
      expect(UrlParamValidator.isKeyValid('page-index')).assertFalse();
      expect(UrlParamValidator.isKeyValid('page index')).assertFalse();
      expect(UrlParamValidator.isKeyValid('')).assertFalse();
    });

    it('url_param_should_validate_value', 0, () => {
      expect(UrlParamValidator.isValueValid('ISSUE-1001')).assertTrue();
      expect(UrlParamValidator.isValueValid('a'.repeat(MAX_URL_PARAM))).assertTrue();
      expect(UrlParamValidator.isValueValid('a'.repeat(MAX_URL_PARAM + 1))).assertFalse();
      expect(UrlParamValidator.isValueValid('line\nbreak')).assertFalse();
      expect(UrlParamValidator.isValueValid('carriage\rreturn')).assertFalse();
    });

    it('url_param_should_validate_paging', 0, () => {
      expect(UrlParamValidator.isPageIndexValid(0)).assertTrue();
      expect(UrlParamValidator.isPageIndexValid(1)).assertTrue();
      expect(UrlParamValidator.isPageIndexValid(-1)).assertFalse();
      expect(UrlParamValidator.isPageIndexValid(10001)).assertFalse();
      expect(UrlParamValidator.isPageSizeValid(1)).assertTrue();
      expect(UrlParamValidator.isPageSizeValid(50)).assertTrue();
      expect(UrlParamValidator.isPageSizeValid(0)).assertFalse();
      expect(UrlParamValidator.isPageSizeValid(51)).assertFalse();
    });

    it('url_param_should_return_field_errors', 0, () => {
      expect(UrlParamValidator.validate('issueId', 'ISSUE-1001') === undefined).assertTrue();
      const keyError = UrlParamValidator.validate('bad key', 'value');
      expect((keyError as FieldError).code).assertEqual('key');
      const valueError = UrlParamValidator.validate('issueId', 'bad\nvalue');
      expect((valueError as FieldError).code).assertEqual('value');
    });

    it('form_should_validate_all_fields', 0, () => {
      const validator = new InputFormValidator();
      const errors = validator.validateAll('valid description', '13812345678', 'a.png');
      expect(errors.length).assertEqual(0);
      expect(validator.hasErrors()).assertFalse();
      expect(validator.count()).assertEqual(0);
    });

    it('form_should_collect_multiple_errors', 0, () => {
      const validator = new InputFormValidator();
      const errors = validator.validateAll('', 'abc', 'bad.exe');
      expect(errors.length).assertEqual(3);
      expect(validator.hasErrors()).assertTrue();
      expect(validator.fields().includes('description')).assertTrue();
      expect(validator.fields().includes('phone')).assertTrue();
      expect(validator.fields().includes('fileName')).assertTrue();
      validator.clear();
      expect(validator.count()).assertEqual(0);
      expect(validator.hasErrors()).assertFalse();
    });

    it('form_should_skip_file_validation_when_empty', 0, () => {
      const validator = new InputFormValidator();
      const errors = validator.validateAll('good', '', '');
      expect(errors.length).assertEqual(0);
      expect(validator.hasErrors()).assertFalse();
      const phoneOnly = validator.validateAll('good', '123', '');
      expect(phoneOnly.length).assertEqual(1);
      expect(phoneOnly[0].field).assertEqual('phone');
    });

    it('form_should_revalidate_after_fix', 0, () => {
      const validator = new InputFormValidator();
      expect(validator.validateAll('', '', 'a.png').length).assertEqual(1);
      expect(validator.validateAll('fixed', '', 'a.png').length).assertEqual(0);
      expect(validator.hasErrors()).assertFalse();
      expect(validator.fields().length).assertEqual(0);
    });

    it('validation_constants_should_be_consistent', 0, () => {
      expect(MAX_DESCRIPTION).assertEqual(1024);
      expect(MIN_DESCRIPTION).assertEqual(1);
      expect(MAX_REMARK).assertEqual(200);
      expect(MAX_PHONE).assertEqual(15);
      expect(MIN_PHONE).assertEqual(6);
      expect(MAX_FILE_NAME).assertEqual(128);
      expect(MAX_URL_PARAM).assertEqual(256);
      expect(MIN_PHONE).assertLess(MAX_PHONE);
    });

    it('description_boundary_should_accept_tab_only_text', 0, () => {
      expect(DescriptionValidator.isRequired('\t')).assertFalse();
      expect(DescriptionValidator.isRequired(' \n ')).assertFalse();
      expect(DescriptionValidator.isRequired('x')).assertTrue();
      expect(DescriptionValidator.remaining('abcd')).assertEqual(MAX_DESCRIPTION - 4);
    });

    it('phone_boundary_should_accept_min_and_max', 0, () => {
      const minPhone = '1' + '0'.repeat(MIN_PHONE - 1);
      const maxPhone = '1' + '0'.repeat(MAX_PHONE - 1);
      expect(PhoneValidator.isValid(minPhone)).assertTrue();
      expect(PhoneValidator.isValid(maxPhone)).assertTrue();
      expect(PhoneValidator.isValid('1' + '0'.repeat(MAX_PHONE))).assertFalse();
      expect(PhoneValidator.mask(maxPhone)).assertContain('****');
    });

    it('file_name_boundary_should_accept_max_length', 0, () => {
      const name = 'a'.repeat(MAX_FILE_NAME - 4) + '.png';
      expect(name.length).assertEqual(MAX_FILE_NAME);
      expect(FileNameValidator.isLengthValid(name)).assertTrue();
      expect(FileNameValidator.validate(name) === undefined).assertTrue();
      expect(FileNameValidator.validate(name + 'x') !== undefined).assertTrue();
    });

    it('sanitizer_should_preserve_safe_names', 0, () => {
      expect(FileNameValidator.sanitize('issue.log')).assertEqual('issue.log');
      expect(FileNameValidator.sanitize('photo.png')).assertEqual('photo.png');
      expect(FileNameValidator.sanitize('a..b.png')).assertEqual('ab.png');
      expect(FileNameValidator.validate(FileNameValidator.sanitize('../a.png')) === undefined)
        .assertTrue();
    });
  });
}

