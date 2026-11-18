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
import KeyConstant from '../../../../main/ets/common/Constants/KeyConstant';
import UrlConstant from '../../../../main/ets/common/Constants/UrlConstant';

const ALLOWED_SCHEMES: string[] = ['http://', 'https://'];

const ALLOWED_UPLOAD_EXTENSIONS: string[] = ['png', 'jpg', 'jpeg', 'mp4', 'mp3', 'tar', 'log', 'zip'];

const MAX_FILE_NAME_LENGTH: number = 128;

const PRODUCTION_BASE_URL: string = 'http://10.20.72.111:3470/';

const DEVICE_ID_MIN_LENGTH: number = 8;

const REDACTED: string = '***';

interface SanitizeResult {
  value: string;
  changed: boolean;
  reason: string;
}

// Prevents path traversal through attachment names and log folders
class PathSanitizer {
  public static hasTraversal(value: string): boolean {
    return value.indexOf('..') >= 0 || value.indexOf('%2e%2e') >= 0;
  }

  public static hasAbsolutePrefix(value: string): boolean {
    return value.startsWith('/') || value.startsWith('\\') ||
      (value.length > 1 && value.charAt(1) === ':');
  }

  public static isSafeRelativePath(value: string): boolean {
    return value.length > 0 && !PathSanitizer.hasTraversal(value) && !PathSanitizer.hasAbsolutePrefix(value);
  }

  public static sanitizeFileName(name: string): SanitizeResult {
    if (name.length === 0) {
      return { value: 'unnamed', changed: true, reason: 'empty' };
    }
    if (PathSanitizer.hasTraversal(name)) {
      return { value: name.split('..').join(''), changed: true, reason: 'traversal' };
    }
    if (PathSanitizer.hasAbsolutePrefix(name)) {
      const parts = name.split('\\').join('/').split('/');
      return { value: parts[parts.length - 1], changed: true, reason: 'absolute' };
    }
    return { value: name, changed: false, reason: 'none' };
  }

  public static isSafeFolder(folder: string): boolean {
    return PathSanitizer.isSafeRelativePath(folder);
  }
}

// Restricts remote endpoints to expected schemes and hosts
class UrlSecurityValidator {
  public static hasAllowedScheme(url: string): boolean {
    for (let i = 0; i < ALLOWED_SCHEMES.length; i++) {
      if (url.startsWith(ALLOWED_SCHEMES[i])) {
        return true;
      }
    }
    return false;
  }

  public static hasCredentials(url: string): boolean {
    const schemeIndex = url.indexOf('://');
    if (schemeIndex < 0) {
      return false;
    }
    const remainder = url.substring(schemeIndex + 3);
    const pathIndex = remainder.indexOf('/');
    const authority = pathIndex < 0 ? remainder : remainder.substring(0, pathIndex);
    return authority.indexOf('@') >= 0;
  }

  public static isSafe(url: string): boolean {
    return UrlSecurityValidator.hasAllowedScheme(url) && !UrlSecurityValidator.hasCredentials(url) &&
      url.indexOf(' ') < 0;
  }

  public static isKnownEndpoint(path: string): boolean {
    const catalog: string[] = [
      UrlConstant.ISSUE_REPORT,
      UrlConstant.UPLOAD_FILE,
      UrlConstant.ISSUE_LIST,
      UrlConstant.ISSUE_DETAIL,
      UrlConstant.ISSUE_CONFIG,
      UrlConstant.ISSUE_OPERATION_RECORD
    ];
    return catalog.includes(path);
  }
}

// Validates uploaded attachment names before they reach the cache folder
class AttachmentSecurityValidator {
  public static extensionOf(fileName: string): string {
    const index = fileName.lastIndexOf('.');
    if (index < 0 || index === fileName.length - 1) {
      return '';
    }
    return fileName.substring(index + 1).toLowerCase();
  }

  public static isExtensionAllowed(fileName: string): boolean {
    return ALLOWED_UPLOAD_EXTENSIONS.includes(AttachmentSecurityValidator.extensionOf(fileName));
  }

  public static isFileNameValid(fileName: string): boolean {
    return fileName.length > 0 && fileName.length <= MAX_FILE_NAME_LENGTH &&
      !PathSanitizer.hasTraversal(fileName) && !PathSanitizer.hasAbsolutePrefix(fileName);
  }

  public static isAttachmentSafe(fileName: string): boolean {
    return AttachmentSecurityValidator.isFileNameValid(fileName) &&
      AttachmentSecurityValidator.isExtensionAllowed(fileName);
  }
}

// Redacts sensitive values before logging
class SensitiveDataRedactor {
  public static redactPhone(phone: string): string {
    if (phone.length < 7) {
      return REDACTED;
    }
    return phone.substring(0, 3) + REDACTED + phone.substring(phone.length - 4);
  }

  public static redactUdid(udid: string): string {
    if (udid.length <= DEVICE_ID_MIN_LENGTH) {
      return REDACTED;
    }
    return udid.substring(0, 4) + REDACTED + udid.substring(udid.length - 4);
  }

  public static containsSecret(message: string): boolean {
    return message.toLowerCase().indexOf('password') >= 0 ||
      message.toLowerCase().indexOf('token') >= 0;
  }

  public static redactSecret(message: string): string {
    return SensitiveDataRedactor.containsSecret(message) ? REDACTED : message;
  }
}

// Inspects file names beyond the basic sanitizer
class FileNameInspector {
  public static hasNullByte(name: string): boolean {
    return name.indexOf(String.fromCharCode(0)) >= 0;
  }

  public static isHidden(name: string): boolean {
    return name.startsWith('.') && name.length > 1;
  }

  public static countSegments(name: string): number {
    if (name.length === 0) {
      return 0;
    }
    return name.split('/').length;
  }

  public static isSingleSegment(name: string): boolean {
    return name.length > 0 && name.indexOf('/') < 0 && name.indexOf('\\') < 0;
  }

  public static hasControlCharacter(name: string): boolean {
    for (let i = 0; i < name.length; i++) {
      const code = name.charCodeAt(i);
      if (code < 32 || code === 127) {
        return true;
      }
    }
    return false;
  }

  public static isSafe(name: string): boolean {
    return name.length > 0 && FileNameInspector.isSingleSegment(name) &&
      !FileNameInspector.hasNullByte(name) && !FileNameInspector.hasControlCharacter(name) &&
      !PathSanitizer.hasTraversal(name);
  }
}

// Normalizes URLs before they are handed to the HTTP stack
class UrlNormalizer {
  public static stripQuery(url: string): string {
    const queryIndex = url.indexOf('?');
    return queryIndex < 0 ? url : url.substring(0, queryIndex);
  }

  public static stripFragment(url: string): string {
    const fragmentIndex = url.indexOf('#');
    return fragmentIndex < 0 ? url : url.substring(0, fragmentIndex);
  }

  public static normalize(url: string): string {
    return UrlNormalizer.stripFragment(UrlNormalizer.stripQuery(url));
  }

  public static hostOf(url: string): string {
    const schemeIndex = url.indexOf('://');
    if (schemeIndex < 0) {
      return '';
    }
    const remainder = url.substring(schemeIndex + 3);
    const pathIndex = remainder.indexOf('/');
    const authority = pathIndex < 0 ? remainder : remainder.substring(0, pathIndex);
    const atIndex = authority.indexOf('@');
    return atIndex < 0 ? authority : authority.substring(atIndex + 1);
  }

  public static hasPort(url: string): boolean {
    const host = UrlNormalizer.hostOf(url);
    return host.lastIndexOf(':') > 0;
  }

  public static isSameHost(first: string, second: string): boolean {
    return UrlNormalizer.hostOf(first).toLowerCase() === UrlNormalizer.hostOf(second).toLowerCase();
  }
}

// Detects unsafe attachment combinations used in bulk selection
class BulkAttachmentValidator {
  public static unsafeNameCount(names: string[]): number {
    let count: number = 0;
    for (let i = 0; i < names.length; i++) {
      if (!AttachmentSecurityValidator.isAttachmentSafe(names[i])) {
        count++;
      }
    }
    return count;
  }

  public static firstUnsafeIndex(names: string[]): number {
    for (let i = 0; i < names.length; i++) {
      if (!AttachmentSecurityValidator.isAttachmentSafe(names[i])) {
        return i;
      }
    }
    return -1;
  }

  public static allSafe(names: string[]): boolean {
    if (names.length === 0) {
      return false;
    }
    for (let i = 0; i < names.length; i++) {
      if (!AttachmentSecurityValidator.isAttachmentSafe(names[i])) {
        return false;
      }
    }
    return true;
  }

  public static countAllowed(names: string[]): number {
    let count: number = 0;
    for (let i = 0; i < names.length; i++) {
      if (AttachmentSecurityValidator.isAttachmentSafe(names[i])) {
        count++;
      }
    }
    return count;
  }
}

export default function betaClubSecurityTest() {
  describe('BetaClubSecurity_Test', () => {

    it('attachment_folder_should_be_relative', 0, () => {
      expect(PathSanitizer.isSafeFolder(KeyConstant.UPLOAD_ATTACHMENT_PATH_FOLDER)).assertTrue();
      expect(PathSanitizer.isSafeFolder(KeyConstant.UPLOAD_LOG_PATH_FOLDER)).assertTrue();
      expect(PathSanitizer.isSafeFolder('/absolute')).assertFalse();
      expect(PathSanitizer.isSafeFolder('../escape')).assertFalse();
      expect(PathSanitizer.isSafeFolder('')).assertFalse();
    });

    it('path_traversal_should_be_detected', 0, () => {
      expect(PathSanitizer.hasTraversal('../../etc/passwd')).assertTrue();
      expect(PathSanitizer.hasTraversal('logs/../secret')).assertTrue();
      expect(PathSanitizer.hasTraversal('%2e%2e/secret')).assertTrue();
      expect(PathSanitizer.hasTraversal('logs/2026')).assertFalse();
    });

    it('absolute_paths_should_be_rejected', 0, () => {
      expect(PathSanitizer.hasAbsolutePrefix('/data/log')).assertTrue();
      expect(PathSanitizer.hasAbsolutePrefix('\\windows\\system32')).assertTrue();
      expect(PathSanitizer.hasAbsolutePrefix('C:/windows')).assertTrue();
      expect(PathSanitizer.hasAbsolutePrefix('logs/2026')).assertFalse();
    });

    it('file_name_sanitizer_should_strip_traversal', 0, () => {
      const result = PathSanitizer.sanitizeFileName('../../secret.png');
      expect(result.changed).assertTrue();
      expect(result.reason).assertEqual('traversal');
      expect(result.value.indexOf('..')).assertEqual(-1);
    });

    it('file_name_sanitizer_should_keep_base_name', 0, () => {
      const unixResult = PathSanitizer.sanitizeFileName('/data/cache/a.png');
      expect(unixResult.changed).assertTrue();
      expect(unixResult.value).assertEqual('a.png');
      const windowsResult = PathSanitizer.sanitizeFileName('C:\\cache\\b.mp4');
      expect(windowsResult.value).assertEqual('b.mp4');
    });

    it('file_name_sanitizer_should_default_empty_name', 0, () => {
      const result = PathSanitizer.sanitizeFileName('');
      expect(result.changed).assertTrue();
      expect(result.reason).assertEqual('empty');
      expect(result.value).assertEqual('unnamed');
      const normal = PathSanitizer.sanitizeFileName('issue.log');
      expect(normal.changed).assertFalse();
      expect(normal.reason).assertEqual('none');
      expect(normal.value).assertEqual('issue.log');
    });

    it('url_scheme_should_be_restricted', 0, () => {
      expect(UrlSecurityValidator.hasAllowedScheme('http://host/path')).assertTrue();
      expect(UrlSecurityValidator.hasAllowedScheme('https://host/path')).assertTrue();
      expect(UrlSecurityValidator.hasAllowedScheme('ftp://host/path')).assertFalse();
      expect(UrlSecurityValidator.hasAllowedScheme('file:///data/log')).assertFalse();
      expect(UrlSecurityValidator.hasAllowedScheme('javascript:alert(1)')).assertFalse();
    });

    it('url_with_credentials_should_be_rejected', 0, () => {
      expect(UrlSecurityValidator.hasCredentials('https://user:pass@host/path')).assertTrue();
      expect(UrlSecurityValidator.hasCredentials('https://host/path')).assertFalse();
      expect(UrlSecurityValidator.isSafe('https://user:pass@host/path')).assertFalse();
      expect(UrlSecurityValidator.isSafe('https://host/path')).assertTrue();
    });

    it('url_with_whitespace_should_be_rejected', 0, () => {
      expect(UrlSecurityValidator.isSafe('https://host/a b')).assertFalse();
      expect(UrlSecurityValidator.isSafe('https://host/ab')).assertTrue();
      expect(UrlSecurityValidator.isSafe('')).assertFalse();
    });

    it('endpoint_catalog_should_be_allowlisted', 0, () => {
      expect(UrlSecurityValidator.isKnownEndpoint(UrlConstant.ISSUE_REPORT)).assertTrue();
      expect(UrlSecurityValidator.isKnownEndpoint(UrlConstant.UPLOAD_FILE)).assertTrue();
      expect(UrlSecurityValidator.isKnownEndpoint(UrlConstant.ISSUE_DETAIL)).assertTrue();
      expect(UrlSecurityValidator.isKnownEndpoint('client/log/issue/delete')).assertFalse();
      expect(UrlSecurityValidator.isKnownEndpoint('')).assertFalse();
    });

    it('attachment_extension_should_be_allowlisted', 0, () => {
      expect(AttachmentSecurityValidator.isExtensionAllowed('a.png')).assertTrue();
      expect(AttachmentSecurityValidator.isExtensionAllowed('a.JPG')).assertTrue();
      expect(AttachmentSecurityValidator.isExtensionAllowed('a.mp4')).assertTrue();
      expect(AttachmentSecurityValidator.isExtensionAllowed('a.dmg')).assertFalse();
      expect(AttachmentSecurityValidator.isExtensionAllowed('a.exe')).assertFalse();
      expect(AttachmentSecurityValidator.isExtensionAllowed('a')).assertFalse();
    });

    it('attachment_file_name_should_be_safe', 0, () => {
      expect(AttachmentSecurityValidator.isFileNameValid('issue.log')).assertTrue();
      expect(AttachmentSecurityValidator.isFileNameValid('../issue.log')).assertFalse();
      expect(AttachmentSecurityValidator.isFileNameValid('/issue.log')).assertFalse();
      expect(AttachmentSecurityValidator.isFileNameValid('')).assertFalse();
      expect(AttachmentSecurityValidator.isFileNameValid('a'.repeat(MAX_FILE_NAME_LENGTH + 1))).assertFalse();
      expect(AttachmentSecurityValidator.isAttachmentSafe('issue.log')).assertTrue();
      expect(AttachmentSecurityValidator.isAttachmentSafe('../issue.log')).assertFalse();
      expect(AttachmentSecurityValidator.isAttachmentSafe('issue.exe')).assertFalse();
    });

    it('sensitive_phone_should_be_redacted', 0, () => {
      const phone = '13812345678';
      const redacted = SensitiveDataRedactor.redactPhone(phone);
      expect(redacted).assertContain(REDACTED);
      expect(redacted).assertContain('138');
      expect(redacted).assertContain('5678');
      expect(redacted.includes('1234')).assertFalse();
      expect(SensitiveDataRedactor.redactPhone('123')).assertEqual(REDACTED);
    });

    it('sensitive_udid_should_be_redacted', 0, () => {
      const udid = 'UDID-2026-ABCDEFGH';
      const redacted = SensitiveDataRedactor.redactUdid(udid);
      expect(redacted).assertContain(REDACTED);
      expect(redacted.startsWith('UDID')).assertTrue();
      expect(redacted.endsWith('EFGH')).assertTrue();
      expect(redacted.includes('2026')).assertFalse();
      expect(SensitiveDataRedactor.redactUdid('short')).assertEqual(REDACTED);
    });

    it('secret_messages_should_be_detected', 0, () => {
      expect(SensitiveDataRedactor.containsSecret('password=123')).assertTrue();
      expect(SensitiveDataRedactor.containsSecret('Token: abc')).assertTrue();
      expect(SensitiveDataRedactor.containsSecret('normal log')).assertFalse();
      expect(SensitiveDataRedactor.redactSecret('token=abc')).assertEqual(REDACTED);
      expect(SensitiveDataRedactor.redactSecret('normal log')).assertEqual('normal log');
    });

    it('security_constants_should_be_stable', 0, () => {
      expect(ALLOWED_SCHEMES.length).assertEqual(2);
      expect(ALLOWED_UPLOAD_EXTENSIONS.length).assertEqual(8);
      expect(MAX_FILE_NAME_LENGTH).assertEqual(128);
      expect(DEVICE_ID_MIN_LENGTH).assertEqual(8);
      expect(REDACTED).assertEqual('***');
    });

    it('file_name_inspector_should_reject_null_bytes', 0, () => {
      const nullName = 'issue' + String.fromCharCode(0) + '.log';
      expect(FileNameInspector.hasNullByte(nullName)).assertTrue();
      expect(FileNameInspector.isSafe(nullName)).assertFalse();
      expect(FileNameInspector.hasNullByte('issue.log')).assertFalse();
      expect(FileNameInspector.isSafe('issue.log')).assertTrue();
    });

    it('file_name_inspector_should_reject_control_characters', 0, () => {
      const controlName = 'issue' + String.fromCharCode(9) + '.log';
      expect(FileNameInspector.hasControlCharacter(controlName)).assertTrue();
      expect(FileNameInspector.isSafe(controlName)).assertFalse();
      expect(FileNameInspector.hasControlCharacter('issue.log')).assertFalse();
    });

    it('file_name_inspector_should_reject_multi_segment_names', 0, () => {
      expect(FileNameInspector.isSingleSegment('issue.log')).assertTrue();
      expect(FileNameInspector.isSingleSegment('logs/issue.log')).assertFalse();
      expect(FileNameInspector.isSingleSegment('logs\\issue.log')).assertFalse();
      expect(FileNameInspector.countSegments('logs/2026/issue.log')).assertEqual(3);
      expect(FileNameInspector.countSegments('')).assertEqual(0);
      expect(FileNameInspector.isSafe('logs/issue.log')).assertFalse();
    });

    it('file_name_inspector_should_identify_hidden_files', 0, () => {
      expect(FileNameInspector.isHidden('.config')).assertTrue();
      expect(FileNameInspector.isHidden('.')).assertFalse();
      expect(FileNameInspector.isHidden('issue.log')).assertFalse();
      expect(FileNameInspector.countSegments('issue.log')).assertEqual(1);
    });

    it('url_normalizer_should_strip_query_and_fragment', 0, () => {
      const raw = 'https://host/path/report?token=abc#section';
      expect(UrlNormalizer.stripQuery(raw)).assertEqual('https://host/path/report');
      expect(UrlNormalizer.stripFragment(raw)).assertEqual('https://host/path/report?token=abc');
      expect(UrlNormalizer.normalize(raw)).assertEqual('https://host/path/report');
      expect(UrlNormalizer.normalize('https://host/path')).assertEqual('https://host/path');
    });

    it('url_normalizer_should_extract_host', 0, () => {
      expect(UrlNormalizer.hostOf('http://10.20.72.111:3470/client/log')).assertEqual('10.20.72.111:3470');
      expect(UrlNormalizer.hostOf('https://host')).assertEqual('host');
      expect(UrlNormalizer.hostOf('not-a-url')).assertEqual('');
      expect(UrlNormalizer.hasPort('http://10.20.72.111:3470/path')).assertTrue();
      expect(UrlNormalizer.hasPort('https://host/path')).assertFalse();
    });

    it('url_normalizer_should_compare_hosts_case_insensitively', 0, () => {
      expect(UrlNormalizer.isSameHost('https://Host/a', 'https://host/b')).assertTrue();
      expect(UrlNormalizer.isSameHost('https://host/a', 'https://other/b')).assertFalse();
      expect(UrlNormalizer.isSameHost('invalid', 'https://host/b')).assertFalse();
    });

    it('url_normalizer_should_drop_credentials_from_host', 0, () => {
      const url = 'https://user:pass@host/path';
      expect(UrlNormalizer.hostOf(url)).assertEqual('host');
      expect(UrlSecurityValidator.hasCredentials(url)).assertTrue();
      expect(UrlNormalizer.isSameHost(url, 'https://host/other')).assertTrue();
    });

    it('bulk_attachment_validator_should_find_first_unsafe', 0, () => {
      const names: string[] = ['a.png', '../b.png', 'c.mp4'];
      expect(BulkAttachmentValidator.firstUnsafeIndex(names)).assertEqual(1);
      expect(BulkAttachmentValidator.unsafeNameCount(names)).assertEqual(1);
      expect(BulkAttachmentValidator.allSafe(names)).assertFalse();
      expect(BulkAttachmentValidator.countAllowed(names)).assertEqual(2);
    });

    it('bulk_attachment_validator_should_accept_safe_batch', 0, () => {
      const names: string[] = ['a.png', 'b.jpg', 'c.mp4', 'd.log'];
      expect(BulkAttachmentValidator.firstUnsafeIndex(names)).assertEqual(-1);
      expect(BulkAttachmentValidator.unsafeNameCount(names)).assertEqual(0);
      expect(BulkAttachmentValidator.allSafe(names)).assertTrue();
      expect(BulkAttachmentValidator.countAllowed(names)).assertEqual(4);
      expect(BulkAttachmentValidator.allSafe([])).assertFalse();
    });

    it('bulk_attachment_validator_should_reject_disallowed_extensions', 0, () => {
      const names: string[] = ['a.png', 'b.dmg', 'c.exe'];
      expect(BulkAttachmentValidator.firstUnsafeIndex(names)).assertEqual(1);
      expect(BulkAttachmentValidator.unsafeNameCount(names)).assertEqual(2);
      expect(BulkAttachmentValidator.countAllowed(names)).assertEqual(1);
    });

    it('extension_check_should_ignore_case', 0, () => {
      expect(AttachmentSecurityValidator.isExtensionAllowed('A.PNG')).assertTrue();
      expect(AttachmentSecurityValidator.isExtensionAllowed('B.Mp4')).assertTrue();
      expect(AttachmentSecurityValidator.isExtensionAllowed('C.LOG')).assertTrue();
      expect(AttachmentSecurityValidator.extensionOf('A.PNG')).assertEqual('png');
      expect(AttachmentSecurityValidator.extensionOf('noext')).assertEqual('');
      expect(AttachmentSecurityValidator.extensionOf('trailing.')).assertEqual('');
    });

    it('file_name_length_boundary_should_be_enforced', 0, () => {
      const exact = 'a'.repeat(MAX_FILE_NAME_LENGTH - 4) + '.log';
      const over = 'a'.repeat(MAX_FILE_NAME_LENGTH - 3) + '.log';
      expect(exact.length).assertEqual(MAX_FILE_NAME_LENGTH);
      expect(AttachmentSecurityValidator.isFileNameValid(exact)).assertTrue();
      expect(AttachmentSecurityValidator.isFileNameValid(over)).assertFalse();
      expect(AttachmentSecurityValidator.isAttachmentSafe(exact)).assertTrue();
      expect(AttachmentSecurityValidator.isAttachmentSafe(over)).assertFalse();
    });

    it('path_sanitizer_should_handle_repeated_traversal', 0, () => {
      expect(PathSanitizer.hasTraversal('../../..')).assertTrue();
      expect(PathSanitizer.hasTraversal('a/../../b')).assertTrue();
      expect(PathSanitizer.hasTraversal('a/b/c')).assertFalse();
      const result = PathSanitizer.sanitizeFileName('../../a/../b.png');
      expect(result.changed).assertTrue();
      expect(result.value.indexOf('..')).assertEqual(-1);
    });

    it('path_sanitizer_should_keep_safe_folder_between_repeats', 0, () => {
      const folder = KeyConstant.CACHE_LOG_PATH_FOLDER;
      for (let i = 0; i < 3; i++) {
        expect(PathSanitizer.isSafeFolder(folder)).assertTrue();
        expect(PathSanitizer.hasTraversal(folder)).assertFalse();
        expect(PathSanitizer.hasAbsolutePrefix(folder)).assertFalse();
      }
    });

    it('redaction_should_be_idempotent_for_short_values', 0, () => {
      expect(SensitiveDataRedactor.redactPhone('1')).assertEqual(REDACTED);
      expect(SensitiveDataRedactor.redactPhone('')).assertEqual(REDACTED);
      expect(SensitiveDataRedactor.redactUdid('')).assertEqual(REDACTED);
      expect(SensitiveDataRedactor.redactUdid('12345678')).assertEqual(REDACTED);
      expect(SensitiveDataRedactor.redactSecret('nothing')).assertEqual('nothing');
    });

    it('redaction_should_not_expose_middle_digits', 0, () => {
      const phone = '13900001111';
      const redacted = SensitiveDataRedactor.redactPhone(phone);
      expect(redacted.length).assertLessOrEqual(phone.length);
      expect(redacted.includes('0000')).assertFalse();
      expect(redacted.startsWith('139')).assertTrue();
      expect(redacted.endsWith('1111')).assertTrue();
    });

    it('secret_detection_should_be_case_insensitive', 0, () => {
      expect(SensitiveDataRedactor.containsSecret('PASSWORD=1')).assertTrue();
      expect(SensitiveDataRedactor.containsSecret('AccessToken')).assertTrue();
      expect(SensitiveDataRedactor.containsSecret('TOKEN')).assertTrue();
      expect(SensitiveDataRedactor.containsSecret('issue submitted')).assertFalse();
      expect(SensitiveDataRedactor.redactSecret('AccessToken=abc')).assertEqual(REDACTED);
    });

    it('endpoint_allowlist_should_reject_prefix_attacks', 0, () => {
      expect(UrlSecurityValidator.isKnownEndpoint(UrlConstant.ISSUE_REPORT + '/extra')).assertFalse();
      expect(UrlSecurityValidator.isKnownEndpoint(UrlConstant.UPLOAD_FILE + '?x=1')).assertFalse();
      expect(UrlSecurityValidator.isKnownEndpoint(' ' + UrlConstant.ISSUE_LIST)).assertFalse();
      expect(UrlSecurityValidator.isKnownEndpoint(UrlConstant.ISSUE_LIST.toUpperCase())).assertFalse();
    });

    it('scheme_allowlist_should_reject_uppercase_variants', 0, () => {
      expect(UrlSecurityValidator.hasAllowedScheme('HTTP://host/path')).assertFalse();
      expect(UrlSecurityValidator.hasAllowedScheme('Https://host/path')).assertFalse();
      expect(UrlSecurityValidator.isSafe('HTTP://host/path')).assertFalse();
      expect(UrlSecurityValidator.isSafe('https://host/path')).assertTrue();
    });

    it('sanitizer_should_preserve_hidden_file_extension', 0, () => {
      const result = PathSanitizer.sanitizeFileName('.issue.log');
      expect(result.changed).assertFalse();
      expect(result.value).assertEqual('.issue.log');
      expect(FileNameInspector.isHidden(result.value)).assertTrue();
      expect(AttachmentSecurityValidator.isExtensionAllowed(result.value)).assertTrue();
    });

    it('sanitizer_should_strip_windows_prefix_before_extension', 0, () => {
      const result = PathSanitizer.sanitizeFileName('C:\\logs\\2026\\issue.tar');
      expect(result.changed).assertTrue();
      expect(result.value).assertEqual('issue.tar');
      expect(FileNameInspector.isSafe(result.value)).assertTrue();
      expect(AttachmentSecurityValidator.isAttachmentSafe(result.value)).assertTrue();
    });

    it('url_safety_should_accept_local_server_with_port', 0, () => {
      expect(UrlSecurityValidator.isSafe(PRODUCTION_BASE_URL + UrlConstant.ISSUE_REPORT)).assertTrue();
      expect(UrlNormalizer.hasPort(PRODUCTION_BASE_URL + UrlConstant.ISSUE_REPORT)).assertTrue();
      expect(UrlNormalizer.isSameHost(PRODUCTION_BASE_URL, PRODUCTION_BASE_URL)).assertTrue();
      expect(UrlNormalizer.isSameHost(PRODUCTION_BASE_URL, 'https://host/')).assertFalse();
    });

    it('redaction_should_handle_exact_boundary_lengths', 0, () => {
      expect(SensitiveDataRedactor.redactPhone('123456')).assertEqual(REDACTED);
      expect(SensitiveDataRedactor.redactPhone('1234567')).assertContain(REDACTED);
      expect(SensitiveDataRedactor.redactUdid('123456789')).assertContain(REDACTED);
      expect(SensitiveDataRedactor.redactUdid('12345678')).assertEqual(REDACTED);
      expect(SensitiveDataRedactor.containsSecret('my-password-field')).assertTrue();
    });

    it('folder_validation_should_allow_nested_cache_paths', 0, () => {
      expect(PathSanitizer.isSafeFolder(KeyConstant.CACHE_LOG_PATH_FOLDER)).assertTrue();
      expect(PathSanitizer.isSafeFolder('cache_logs/allLogs/2026')).assertTrue();
      expect(PathSanitizer.isSafeFolder('cache_logs/../allLogs')).assertFalse();
      expect(PathSanitizer.isSafeFolder('./cache_logs')).assertTrue();
      expect(PathSanitizer.hasAbsolutePrefix('./cache_logs')).assertFalse();
    });

    it('attachment_allowlist_should_cover_all_supported_media', 0, () => {
      const names: string[] = ['a.png', 'b.jpg', 'c.jpeg', 'd.mp4', 'e.mp3', 'f.tar', 'g.log', 'h.zip'];
      for (let i = 0; i < names.length; i++) {
        expect(AttachmentSecurityValidator.isAttachmentSafe(names[i])).assertTrue();
        expect(ALLOWED_UPLOAD_EXTENSIONS.includes(AttachmentSecurityValidator.extensionOf(names[i])))
          .assertTrue();
      }
      expect(names.length).assertEqual(ALLOWED_UPLOAD_EXTENSIONS.length);
    });

    it('security_allowlists_should_have_no_empty_entries', 0, () => {
      for (let i = 0; i < ALLOWED_SCHEMES.length; i++) {
        expect(ALLOWED_SCHEMES[i].length).assertLarger(3);
      }
      for (let i = 0; i < ALLOWED_UPLOAD_EXTENSIONS.length; i++) {
        expect(ALLOWED_UPLOAD_EXTENSIONS[i].length).assertLargerOrEqual(2);
      }
      expect(new Set<string>(ALLOWED_UPLOAD_EXTENSIONS).size).assertEqual(ALLOWED_UPLOAD_EXTENSIONS.length);
    });
  });
}
