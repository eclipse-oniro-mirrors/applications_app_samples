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

import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import TestLogger from '../Shared/TestLogger';
import { startBrowserApp, normalizeUrl, isValidAddress, URL_SCHEME } from '../Shared/BrowserTestKit';
import { MockBrowser } from '../Shared/BrowserMock';

const TAG: string = 'SecurityValidationTest';

enum ValidationCode {
  OK = 0,
  EMPTY = 1,
  TOO_LONG = 2,
  CONTROL_CHAR = 3,
  XSS_PATTERN = 4,
  PATH_TRAVERSAL = 5,
  HOST_MISMATCH = 6,
  PROTOCOL_RELATIVE = 7,
  SCHEME_BLOCKED = 8,
  USER_INFO = 9
}

interface CodeMessage {
  code: number;
  text: string;
}

interface ValidationReport {
  code: number;
  url: string;
  host: string;
  message: string;
}

const CODE_MESSAGES: CodeMessage[] = [
  { code: ValidationCode.OK, text: 'accepted' },
  { code: ValidationCode.EMPTY, text: 'empty input' },
  { code: ValidationCode.TOO_LONG, text: 'input exceeds limit' },
  { code: ValidationCode.CONTROL_CHAR, text: 'control character' },
  { code: ValidationCode.XSS_PATTERN, text: 'script fragment' },
  { code: ValidationCode.PATH_TRAVERSAL, text: 'path traversal' },
  { code: ValidationCode.HOST_MISMATCH, text: 'host mismatch' },
  { code: ValidationCode.PROTOCOL_RELATIVE, text: 'protocol relative' },
  { code: ValidationCode.SCHEME_BLOCKED, text: 'scheme blocked' },
  { code: ValidationCode.USER_INFO, text: 'user info in authority' }
];

const XSS_FRAGMENTS: string[] = [
  '<script>alert(1)</script>',
  '</script><img src=x>',
  'javascript:alert(document.cookie)',
  '<img src=x onerror=alert(1)>',
  '<svg onload=alert(1)>',
  '<a onclick="steal()">x</a>',
  '"><iframe src=javascript:alert(1)>',
  '&#x3c;script&#x3e;',
  'data:text/html;base64,PHNjcmlwdD4='
];

const TRAVERSAL_PATHS: string[] = [
  '../../etc/passwd',
  '..\\..\\windows\\system32',
  'rawfile/../../secret.txt',
  '%2e%2e%2fetc%2fpasswd',
  '%2E%2E%5Csecret',
  '..%2fconfig.json'
];

/**
 * Validates address bar text before it reaches the web controller. The browser
 * prepends https:// on submit, therefore script fragments, control characters
 * and over long payloads are rejected here instead of being forwarded.
 */
class InputValidator {
  static MAX_LENGTH: number = 2048;

  static hasControlChar(value: string): boolean {
    let i: number = 0;
    for (i = 0; i < value.length; i++) {
      let code: number = value.charCodeAt(i);
      if (code < 32 || code === 127) {
        return true;
      }
    }
    return false;
  }

  static hasXssFragment(value: string): boolean {
    let lower: string = value.toLowerCase();
    let i: number = 0;
    for (i = 0; i < XSS_FRAGMENTS.length; i++) {
      let fragment: string = XSS_FRAGMENTS[i].toLowerCase();
      if (lower.indexOf(fragment) >= 0) {
        return true;
      }
    }
    let markers: string[] = ['<script', '</script', 'javascript:', 'onerror=', 'onload=', 'onclick=',
      'onmouseover=', '"><', '&#x3c;', 'vbscript:', 'srcdoc=', 'data:text/html'];
    for (i = 0; i < markers.length; i++) {
      if (lower.indexOf(markers[i]) >= 0) {
        return true;
      }
    }
    return false;
  }

  static validate(value: string): number {
    if (!value) {
      return ValidationCode.EMPTY;
    }
    let trimmed: string = value.trim();
    if (trimmed.length === 0) {
      return ValidationCode.EMPTY;
    }
    if (trimmed.length > InputValidator.MAX_LENGTH) {
      return ValidationCode.TOO_LONG;
    }
    if (InputValidator.hasControlChar(trimmed)) {
      return ValidationCode.CONTROL_CHAR;
    }
    if (InputValidator.hasXssFragment(trimmed)) {
      return ValidationCode.XSS_PATTERN;
    }
    return ValidationCode.OK;
  }

  static repeat(ch: string, count: number): string {
    let result: string = '';
    let i: number = 0;
    for (i = 0; i < count; i++) {
      result += ch;
    }
    return result;
  }

  static xssRejectedCount(): number {
    let rejected: number = 0;
    let i: number = 0;
    for (i = 0; i < XSS_FRAGMENTS.length; i++) {
      if (InputValidator.validate(XSS_FRAGMENTS[i]) === ValidationCode.XSS_PATTERN) {
        rejected += 1;
      }
    }
    return rejected;
  }
}

class PathTraversalGuard {
  static MARKERS: string[] = ['../', '..\\', '%2e%2e%2f', '%2e%2e%5c', '..%2f', '..%5c', '%2e%2e/'];

  static isTraversal(path: string): boolean {
    let lower: string = path.toLowerCase();
    let i: number = 0;
    for (i = 0; i < PathTraversalGuard.MARKERS.length; i++) {
      if (lower.indexOf(PathTraversalGuard.MARKERS[i]) >= 0) {
        return true;
      }
    }
    if (lower.indexOf(':') > 0 && lower.indexOf(':\\') > 0) {
      return true;
    }
    return lower.charAt(0) === '/';
  }

  static normalize(path: string): string {
    const absolute: boolean = path.charAt(0) === '/';
    let parts: string[] = path.split('/');
    let stack: string[] = [];
    let i: number = 0;
    for (i = 0; i < parts.length; i++) {
      let part: string = parts[i];
      if (part.length === 0 || part === '.') {
        continue;
      }
      if (part === '..') {
        if (stack.length > 0 && stack[stack.length - 1] !== '..') {
          stack.pop();
        } else {
          stack.push('..');
        }
        continue;
      }
      stack.push(part);
    }
    let result: string = stack.join('/');
    if (absolute) {
      result = '/' + result;
    }
    return result;
  }

  static trimTrailingSlashes(root: string): string {
    let end: number = root.length;
    while (end > 1 && root.charAt(end - 1) === '/') {
      end -= 1;
    }
    return root.substring(0, end);
  }

  static resolve(root: string, path: string): string {
    let normalizedRoot: string = PathTraversalGuard.trimTrailingSlashes(root);
    let normalizedPath: string = PathTraversalGuard.normalize(path);
    if (normalizedPath.length === 0) {
      return normalizedRoot;
    }
    return normalizedRoot + '/' + normalizedPath;
  }

  static isInside(root: string, path: string): boolean {
    let normalizedPath: string = PathTraversalGuard.normalize(path);
    if (normalizedPath === '..' || normalizedPath.indexOf('../') === 0) {
      return false;
    }
    if (normalizedPath.charAt(0) === '/') {
      return false;
    }
    let resolved: string = PathTraversalGuard.resolve(root, normalizedPath);
    let normalizedRoot: string = PathTraversalGuard.trimTrailingSlashes(root);
    return resolved === normalizedRoot || resolved.indexOf(normalizedRoot + '/') === 0;
  }

  static rejectedCount(paths: string[]): number {
    let total: number = 0;
    let i: number = 0;
    for (i = 0; i < paths.length; i++) {
      if (PathTraversalGuard.isTraversal(paths[i])) {
        total += 1;
      }
    }
    return total;
  }
}

class HostValidator {
  static normalize(host: string): string {
    let value: string = host.trim().toLowerCase();
    let colon: number = value.indexOf(':');
    if (colon > 0) {
      value = value.substring(0, colon);
    }
    while (value.length > 1 && value.charAt(value.length - 1) === '.') {
      value = value.substring(0, value.length - 1);
    }
    return value;
  }

  static hasUserInfo(host: string): boolean {
    return host.indexOf('@') >= 0;
  }

  static isOfficial(host: string, official: string): boolean {
    let target: string = HostValidator.normalize(host);
    let base: string = HostValidator.normalize(official);
    if (target === base) {
      return true;
    }
    if (target.length <= base.length + 1) {
      return false;
    }
    return target.substring(target.length - base.length - 1) === '.' + base;
  }

  static isSpoof(host: string, official: string): boolean {
    let target: string = HostValidator.normalize(host);
    let base: string = HostValidator.normalize(official);
    if (target === base || HostValidator.isOfficial(target, base)) {
      return false;
    }
    return target.indexOf(base) >= 0;
  }

  static registeredDomain(host: string): string {
    let parts: string[] = HostValidator.normalize(host).split('.');
    if (parts.length < 2) {
      return HostValidator.normalize(host);
    }
    return parts[parts.length - 2] + '.' + parts[parts.length - 1];
  }

  static isIpLike(host: string): boolean {
    let value: string = HostValidator.normalize(host);
    let dots: number = 0;
    let i: number = 0;
    for (i = 0; i < value.length; i++) {
      let code: number = value.charCodeAt(i);
      if (code === 46) {
        dots += 1;
        continue;
      }
      if (code < 48 || code > 57) {
        return false;
      }
    }
    return dots === 3;
  }

  static isWellFormed(host: string): boolean {
    let value: string = HostValidator.normalize(host);
    if (value.length === 0 || value.length > 253) {
      return false;
    }
    if (value.indexOf(' ') >= 0 || value.indexOf('\\') >= 0 || value.indexOf('/') >= 0) {
      return false;
    }
    if (value.indexOf('%') >= 0 || value.indexOf('@') >= 0) {
      return false;
    }
    let labels: string[] = value.split('.');
    if (labels.length < 2) {
      return false;
    }
    let i: number = 0;
    for (i = 0; i < labels.length; i++) {
      if (labels[i].length === 0) {
        return false;
      }
    }
    return true;
  }

  static officialCount(hosts: string[], official: string): number {
    let total: number = 0;
    let i: number = 0;
    for (i = 0; i < hosts.length; i++) {
      if (HostValidator.isOfficial(hosts[i], official)) {
        total += 1;
      }
    }
    return total;
  }
}

class UrlValidator {
  static DENIED_SCHEMES: string[] = ['javascript', 'data', 'file', 'vbscript', 'blob', 'intent', 'chrome', 'content'];

  static messageOf(code: number): string {
    let i: number = 0;
    for (i = 0; i < CODE_MESSAGES.length; i++) {
      if (CODE_MESSAGES[i].code === code) {
        return CODE_MESSAGES[i].text;
      }
    }
    return 'unknown code';
  }

  static reportOf(code: number, url: string, host: string): ValidationReport {
    return {
      code: code,
      url: url,
      host: host,
      message: UrlValidator.messageOf(code)
    };
  }

  static hostOf(url: string): string {
    let marker: string = '://';
    let start: number = url.indexOf(marker);
    if (start < 0) {
      return '';
    }
    let rest: string = url.substring(start + marker.length);
    let end: number = rest.length;
    let cut: number = rest.indexOf('/');
    if (cut >= 0 && cut < end) {
      end = cut;
    }
    cut = rest.indexOf('?');
    if (cut >= 0 && cut < end) {
      end = cut;
    }
    return rest.substring(0, end).toLowerCase();
  }

  static schemeOf(url: string): string {
    let index: number = url.indexOf(':');
    if (index <= 0) {
      return '';
    }
    let head: string = url.substring(0, index).toLowerCase();
    if (head.indexOf('/') >= 0) {
      return '';
    }
    return head;
  }

  static validate(raw: string): ValidationReport {
    let value: string = raw.trim();
    let inputCode: number = InputValidator.validate(value);
    if (inputCode !== ValidationCode.OK) {
      return UrlValidator.reportOf(inputCode, '', '');
    }
    let url: string = value;
    let relative: boolean = false;
    if (value.length > 1 && value.charAt(0) === '/' && value.charAt(1) === '/') {
      url = URL_SCHEME + value.substring(2);
      relative = true;
    }
    let scheme: string = UrlValidator.schemeOf(url);
    if (UrlValidator.DENIED_SCHEMES.indexOf(scheme) >= 0) {
      return UrlValidator.reportOf(ValidationCode.SCHEME_BLOCKED, '', '');
    }
    if (scheme.length === 0) {
      url = normalizeUrl(url);
    } else if (scheme === 'http') {
      url = URL_SCHEME + url.substring(7);
    }
    let host: string = UrlValidator.hostOf(url);
    if (HostValidator.hasUserInfo(host)) {
      return UrlValidator.reportOf(ValidationCode.USER_INFO, url, host);
    }
    if (!HostValidator.isWellFormed(host)) {
      return UrlValidator.reportOf(ValidationCode.HOST_MISMATCH, url, host);
    }
    if (relative) {
      return UrlValidator.reportOf(ValidationCode.PROTOCOL_RELATIVE, url, host);
    }
    return UrlValidator.reportOf(ValidationCode.OK, url, host);
  }

  static isAccepted(report: ValidationReport): boolean {
    return report.code === ValidationCode.OK || report.code === ValidationCode.PROTOCOL_RELATIVE;
  }
}

export default function securityValidationTest() {
  describe('securityValidationTest', () => {
    beforeAll(async () => {
      TestLogger.info(TAG, 'suite begin, security validation');
      await startBrowserApp();
    });

    afterAll(() => {
      TestLogger.info(TAG, TestLogger.summary(TAG));
    });

    it('Security_Validation_Inject_001', 0, async () => {
      TestLogger.caseBegin(TAG, 'Security_Validation_Inject_001');
      expect(XSS_FRAGMENTS.length).assertEqual(9);
      expect(InputValidator.xssRejectedCount()).assertEqual(9);
      let i: number = 0;
      for (i = 0; i < XSS_FRAGMENTS.length; i++) {
        expect(InputValidator.validate(XSS_FRAGMENTS[i])).assertEqual(ValidationCode.XSS_PATTERN);
        TestLogger.info(TAG, 'rejected fragment index=' + i);
      }
      expect(InputValidator.validate('www.baidu.com')).assertEqual(ValidationCode.OK);
      expect(InputValidator.validate('https://www.bing.com/search?q=ohos')).assertEqual(ValidationCode.OK);
      TestLogger.info(TAG, 'xss fragment table rejected, count=9');
      TestLogger.caseEnd(TAG, 'Security_Validation_Inject_001', 1);
      TestLogger.pass(TAG, 'Security_Validation_Inject_001');
    });

    it('Security_Validation_Inject_002', 0, async () => {
      TestLogger.caseBegin(TAG, 'Security_Validation_Inject_002');
      let controls: string[] = ['\u0000', '\u0007', '\u001f', '\u007f', 'a\u0000b', 'line\nbreak', 'tab\there'];
      let i: number = 0;
      for (i = 0; i < controls.length; i++) {
        expect(InputValidator.hasControlChar(controls[i])).assertTrue();
        expect(InputValidator.validate(controls[i])).assertEqual(ValidationCode.CONTROL_CHAR);
      }
      expect(InputValidator.hasControlChar('www.baidu.com')).assertFalse();
      expect(InputValidator.hasControlChar('安全搜索')).assertFalse();
      TestLogger.info(TAG, 'control characters rejected, count=' + controls.length);
      TestLogger.caseEnd(TAG, 'Security_Validation_Inject_002', 1);
      TestLogger.pass(TAG, 'Security_Validation_Inject_002');
    });

    it('Security_Validation_Inject_003', 0, async () => {
      TestLogger.caseBegin(TAG, 'Security_Validation_Inject_003');
      let exact: string = InputValidator.repeat('a', InputValidator.MAX_LENGTH);
      expect(exact.length).assertEqual(2048);
      expect(InputValidator.validate(exact)).assertEqual(ValidationCode.OK);
      let over: string = InputValidator.repeat('a', InputValidator.MAX_LENGTH + 1);
      expect(over.length).assertEqual(2049);
      expect(InputValidator.validate(over)).assertEqual(ValidationCode.TOO_LONG);
      let huge: string = InputValidator.repeat('x', 10000);
      expect(InputValidator.validate(huge)).assertEqual(ValidationCode.TOO_LONG);
      TestLogger.info(TAG, 'length boundary at 2048 verified');
      TestLogger.caseEnd(TAG, 'Security_Validation_Inject_003', 1);
      TestLogger.pass(TAG, 'Security_Validation_Inject_003');
    });

    it('Security_Validation_Inject_004', 0, async () => {
      TestLogger.caseBegin(TAG, 'Security_Validation_Inject_004');
      expect(InputValidator.validate('')).assertEqual(ValidationCode.EMPTY);
      expect(InputValidator.validate('   ')).assertEqual(ValidationCode.EMPTY);
      expect(InputValidator.validate('\t\n')).assertEqual(ValidationCode.EMPTY);
      expect(InputValidator.validate('  www.baidu.com  ')).assertEqual(ValidationCode.OK);
      expect(InputValidator.MAX_LENGTH).assertEqual(2048);
      TestLogger.info(TAG, 'empty and whitespace input rejected');
      TestLogger.caseEnd(TAG, 'Security_Validation_Inject_004', 1);
      TestLogger.pass(TAG, 'Security_Validation_Inject_004');
    });

    it('Security_Validation_Path_001', 0, async () => {
      TestLogger.caseBegin(TAG, 'Security_Validation_Path_001');
      expect(TRAVERSAL_PATHS.length).assertEqual(6);
      expect(PathTraversalGuard.rejectedCount(TRAVERSAL_PATHS)).assertEqual(6);
      let i: number = 0;
      for (i = 0; i < TRAVERSAL_PATHS.length; i++) {
        expect(PathTraversalGuard.isTraversal(TRAVERSAL_PATHS[i])).assertTrue();
      }
      expect(PathTraversalGuard.isTraversal('rawfile/pad.html')).assertFalse();
      expect(PathTraversalGuard.isTraversal('resources/base/media/icon.png')).assertFalse();
      TestLogger.info(TAG, 'path traversal markers rejected, count=6');
      TestLogger.caseEnd(TAG, 'Security_Validation_Path_001', 1);
      TestLogger.pass(TAG, 'Security_Validation_Path_001');
    });

    it('Security_Validation_Path_002', 0, async () => {
      TestLogger.caseBegin(TAG, 'Security_Validation_Path_002');
      expect(PathTraversalGuard.isTraversal('%2e%2e%2fetc%2fpasswd')).assertTrue();
      expect(PathTraversalGuard.isTraversal('%2E%2E%5Csecret')).assertTrue();
      expect(PathTraversalGuard.isTraversal('..%2fconfig.json')).assertTrue();
      expect(PathTraversalGuard.isTraversal('%2e%2e%2Fetc')).assertTrue();
      expect(PathTraversalGuard.isTraversal('..%5cwindows')).assertTrue();
      expect(PathTraversalGuard.isTraversal('file%2ename')).assertFalse();
      TestLogger.info(TAG, 'encoded traversal variants rejected');
      TestLogger.caseEnd(TAG, 'Security_Validation_Path_002', 1);
      TestLogger.pass(TAG, 'Security_Validation_Path_002');
    });

    it('Security_Validation_Path_003', 0, async () => {
      TestLogger.caseBegin(TAG, 'Security_Validation_Path_003');
      expect(PathTraversalGuard.normalize('a/./b/../c')).assertEqual('a/c');
      expect(PathTraversalGuard.normalize('a/b/c')).assertEqual('a/b/c');
      expect(PathTraversalGuard.normalize('../../etc')).assertEqual('../../etc');
      expect(PathTraversalGuard.normalize('')).assertEqual('');
      expect(PathTraversalGuard.resolve('/root', 'a/../b')).assertEqual('/root/b');
      expect(PathTraversalGuard.isInside('/root', 'sub/a.txt')).assertTrue();
      expect(PathTraversalGuard.isInside('/root', 'a/../b.txt')).assertTrue();
      expect(PathTraversalGuard.isInside('/root', '../etc/passwd')).assertFalse();
      expect(PathTraversalGuard.isInside('/root', '/etc/passwd')).assertFalse();
      TestLogger.info(TAG, 'root confinement verified');
      TestLogger.caseEnd(TAG, 'Security_Validation_Path_003', 1);
      TestLogger.pass(TAG, 'Security_Validation_Path_003');
    });

    it('Security_Validation_Host_001', 0, async () => {
      TestLogger.caseBegin(TAG, 'Security_Validation_Host_001');
      expect(HostValidator.isOfficial('baidu.com', 'baidu.com')).assertTrue();
      expect(HostValidator.isOfficial('www.baidu.com', 'baidu.com')).assertTrue();
      expect(HostValidator.isOfficial('m.baidu.com', 'baidu.com')).assertTrue();
      expect(HostValidator.isOfficial('a.b.baidu.com', 'baidu.com')).assertTrue();
      expect(HostValidator.officialCount(['www.baidu.com', 'baidu.com', 'm.baidu.com'], 'baidu.com')).assertEqual(3);
      expect(HostValidator.registeredDomain('a.b.baidu.com')).assertEqual('baidu.com');
      expect(HostValidator.registeredDomain('baidu.com')).assertEqual('baidu.com');
      TestLogger.info(TAG, 'official host and subdomain accepted');
      TestLogger.caseEnd(TAG, 'Security_Validation_Host_001', 1);
      TestLogger.pass(TAG, 'Security_Validation_Host_001');
    });

    it('Security_Validation_Host_002', 0, async () => {
      TestLogger.caseBegin(TAG, 'Security_Validation_Host_002');
      expect(HostValidator.isOfficial('evil-baidu.com', 'baidu.com')).assertFalse();
      expect(HostValidator.isSpoof('evil-baidu.com', 'baidu.com')).assertTrue();
      expect(HostValidator.isSpoof('fakebaidu.com', 'baidu.com')).assertTrue();
      expect(HostValidator.isSpoof('www.baidu.com', 'baidu.com')).assertFalse();
      expect(HostValidator.isSpoof('baidu.com', 'baidu.com')).assertFalse();
      expect(HostValidator.officialCount(['evil-baidu.com', 'fakebaidu.com'], 'baidu.com')).assertEqual(0);
      TestLogger.info(TAG, 'lookalike host evil-baidu.com rejected');
      TestLogger.caseEnd(TAG, 'Security_Validation_Host_002', 1);
      TestLogger.pass(TAG, 'Security_Validation_Host_002');
    });

    it('Security_Validation_Host_003', 0, async () => {
      TestLogger.caseBegin(TAG, 'Security_Validation_Host_003');
      expect(HostValidator.isOfficial('baidu.com.evil.example', 'baidu.com')).assertFalse();
      expect(HostValidator.isSpoof('baidu.com.evil.example', 'baidu.com')).assertTrue();
      expect(HostValidator.isOfficial('www.baidu.com.evil.example', 'baidu.com')).assertFalse();
      expect(HostValidator.isSpoof('www.baidu.com.evil.example', 'baidu.com')).assertTrue();
      expect(HostValidator.registeredDomain('baidu.com.evil.example')).assertEqual('evil.example');
      TestLogger.info(TAG, 'suffix spoof domain rejected');
      TestLogger.caseEnd(TAG, 'Security_Validation_Host_003', 1);
      TestLogger.pass(TAG, 'Security_Validation_Host_003');
    });

    it('Security_Validation_Host_004', 0, async () => {
      TestLogger.caseBegin(TAG, 'Security_Validation_Host_004');
      expect(HostValidator.normalize('WWW.BAIDU.COM.')).assertEqual('www.baidu.com');
      expect(HostValidator.normalize('a.b:8443')).assertEqual('a.b');
      expect(HostValidator.isOfficial('WWW.BAIDU.COM.', 'baidu.com')).assertTrue();
      expect(HostValidator.isWellFormed('www.baidu.com')).assertTrue();
      expect(HostValidator.isWellFormed('localhost')).assertFalse();
      expect(HostValidator.isWellFormed('bad host')).assertFalse();
      expect(HostValidator.isWellFormed('evil%2ebaidu.com')).assertFalse();
      expect(HostValidator.isWellFormed('a@b.com')).assertFalse();
      expect(HostValidator.isIpLike('192.168.1.1')).assertTrue();
      expect(HostValidator.isIpLike('192.168.1')).assertFalse();
      TestLogger.info(TAG, 'case folding trailing dot and port normalization verified');
      TestLogger.caseEnd(TAG, 'Security_Validation_Host_004', 1);
      TestLogger.pass(TAG, 'Security_Validation_Host_004');
    });


    it('Security_Validation_Host_005', 0, async () => {
      TestLogger.caseBegin(TAG, 'Security_Validation_Host_005');
      let hosts: string[] = ['baidu.com', 'www.baidu.com', 'evil-baidu.com', 'baidu.com.evil.example', 'a.b.baidu.com'];
      let official: number = 0;
      let spoof: number = 0;
      let i: number = 0;
      for (i = 0; i < hosts.length; i++) {
        if (HostValidator.isOfficial(hosts[i], 'baidu.com')) {
          official += 1;
        }
        if (HostValidator.isSpoof(hosts[i], 'baidu.com')) {
          spoof += 1;
        }
      }
      expect(official).assertEqual(3);
      expect(spoof).assertEqual(2);
      expect(official + spoof).assertEqual(hosts.length);
      TestLogger.info(TAG, 'host matrix official=' + official + ' spoof=' + spoof);
      TestLogger.caseEnd(TAG, 'Security_Validation_Host_005', 1);
      TestLogger.pass(TAG, 'Security_Validation_Host_005');
    });

    it('Security_Validation_Url_001', 0, async () => {
      TestLogger.caseBegin(TAG, 'Security_Validation_Url_001');
      let report: ValidationReport = UrlValidator.validate('https://www.baidu.com/login');
      expect(report.code).assertEqual(ValidationCode.OK);
      expect(report.host).assertEqual('www.baidu.com');
      expect(report.url).assertEqual('https://www.baidu.com/login');
      expect(report.message).assertEqual('accepted');
      expect(UrlValidator.isAccepted(report)).assertTrue();
      let bare: ValidationReport = UrlValidator.validate('www.baidu.com');
      expect(bare.code).assertEqual(ValidationCode.OK);
      expect(bare.url.indexOf(URL_SCHEME)).assertEqual(0);
      expect(bare.url).assertEqual('https://www.baidu.com');
      let upgraded: ValidationReport = UrlValidator.validate('http://www.baidu.com/a');
      expect(upgraded.code).assertEqual(ValidationCode.OK);
      expect(upgraded.url).assertEqual('https://www.baidu.com/a');
      TestLogger.info(TAG, 'valid url accepted with https upgrade');
      TestLogger.caseEnd(TAG, 'Security_Validation_Url_001', 1);
      TestLogger.pass(TAG, 'Security_Validation_Url_001');
    });

    it('Security_Validation_Url_002', 0, async () => {
      TestLogger.caseBegin(TAG, 'Security_Validation_Url_002');
      let empty: ValidationReport = UrlValidator.validate('');
      expect(empty.code).assertEqual(ValidationCode.EMPTY);
      expect(empty.host).assertEqual('');
      let blank: ValidationReport = UrlValidator.validate('   ');
      expect(blank.code).assertEqual(ValidationCode.EMPTY);
      let control: ValidationReport = UrlValidator.validate('www.bai\u0000du.com');
      expect(control.code).assertEqual(ValidationCode.CONTROL_CHAR);
      let over: ValidationReport = UrlValidator.validate(InputValidator.repeat('a', 2049));
      expect(over.code).assertEqual(ValidationCode.TOO_LONG);
      expect(UrlValidator.isAccepted(empty)).assertFalse();
      TestLogger.info(TAG, 'invalid url short circuit codes verified');
      TestLogger.caseEnd(TAG, 'Security_Validation_Url_002', 1);
      TestLogger.pass(TAG, 'Security_Validation_Url_002');
    });

    it('Security_Validation_Scheme_001', 0, async () => {
      TestLogger.caseBegin(TAG, 'Security_Validation_Scheme_001');
      let fileReport: ValidationReport = UrlValidator.validate('file:///etc/passwd');
      expect(fileReport.code).assertEqual(ValidationCode.SCHEME_BLOCKED);
      expect(fileReport.url).assertEqual('');
      let chromeReport: ValidationReport = UrlValidator.validate('chrome://settings');
      expect(chromeReport.code).assertEqual(ValidationCode.SCHEME_BLOCKED);
      let intentReport: ValidationReport = UrlValidator.validate('intent://scan/#Intent;scheme=zxing;end');
      expect(intentReport.code).assertEqual(ValidationCode.SCHEME_BLOCKED);
      let scriptReport: ValidationReport = UrlValidator.validate('javascript:alert(1)');
      expect(scriptReport.code).assertEqual(ValidationCode.XSS_PATTERN);
      let dataReport: ValidationReport = UrlValidator.validate('data:text/html,<script>alert(1)</script>');
      expect(dataReport.code).assertEqual(ValidationCode.XSS_PATTERN);
      expect(UrlValidator.isAccepted(fileReport)).assertFalse();
      expect(UrlValidator.isAccepted(scriptReport)).assertFalse();
      TestLogger.info(TAG, 'blocked schemes and script urls rejected');
      TestLogger.caseEnd(TAG, 'Security_Validation_Scheme_001', 1);
      TestLogger.pass(TAG, 'Security_Validation_Scheme_001');
    });

    it('Security_Validation_Proto_001', 0, async () => {
      TestLogger.caseBegin(TAG, 'Security_Validation_Proto_001');
      let report: ValidationReport = UrlValidator.validate('//evil.example/path');
      expect(report.code).assertEqual(ValidationCode.PROTOCOL_RELATIVE);
      expect(report.url).assertEqual('https://evil.example/path');
      expect(report.host).assertEqual('evil.example');
      expect(UrlValidator.isAccepted(report)).assertTrue();
      let official: ValidationReport = UrlValidator.validate('//www.baidu.com/a');
      expect(official.host).assertEqual('www.baidu.com');
      expect(HostValidator.isOfficial(official.host, 'baidu.com')).assertTrue();
      let script: ValidationReport = UrlValidator.validate('//javascript:alert(1)');
      expect(script.code).assertEqual(ValidationCode.XSS_PATTERN);
      TestLogger.info(TAG, 'protocol relative url resolved and host checked');
      TestLogger.caseEnd(TAG, 'Security_Validation_Proto_001', 1);
      TestLogger.pass(TAG, 'Security_Validation_Proto_001');
    });

    it('Security_Validation_UserInfo_001', 0, async () => {
      TestLogger.caseBegin(TAG, 'Security_Validation_UserInfo_001');
      let report: ValidationReport = UrlValidator.validate('https://www.bing.com@evil.example/login');
      expect(report.code).assertEqual(ValidationCode.USER_INFO);
      expect(report.host).assertEqual('www.bing.com@evil.example');
      expect(report.message).assertEqual('user info in authority');
      expect(UrlValidator.isAccepted(report)).assertFalse();
      let plain: ValidationReport = UrlValidator.validate('https://www.bing.com/login');
      expect(plain.code).assertEqual(ValidationCode.OK);
      expect(plain.host.indexOf('@')).assertEqual(-1);
      TestLogger.info(TAG, 'userinfo authority rejected in validation pipeline');
      TestLogger.caseEnd(TAG, 'Security_Validation_UserInfo_001', 1);
      TestLogger.pass(TAG, 'Security_Validation_UserInfo_001');
    });

    it('Security_Validation_Code_001', 0, async () => {
      TestLogger.caseBegin(TAG, 'Security_Validation_Code_001');
      expect(CODE_MESSAGES.length).assertEqual(10);
      let seen: number[] = [];
      let i: number = 0;
      for (i = 0; i < CODE_MESSAGES.length; i++) {
        expect(seen.indexOf(CODE_MESSAGES[i].code)).assertEqual(-1);
        seen.push(CODE_MESSAGES[i].code);
      }
      expect(seen.indexOf(ValidationCode.OK)).assertLarger(-1);
      expect(seen.indexOf(ValidationCode.SCHEME_BLOCKED)).assertLarger(-1);
      expect(ValidationCode.OK).assertEqual(0);
      expect(ValidationCode.USER_INFO).assertEqual(9);
      TestLogger.info(TAG, 'validation codes are unique and contiguous');
      TestLogger.caseEnd(TAG, 'Security_Validation_Code_001', 1);
      TestLogger.pass(TAG, 'Security_Validation_Code_001');
    });

    it('Security_Validation_Code_002', 0, async () => {
      TestLogger.caseBegin(TAG, 'Security_Validation_Code_002');
      let i: number = 0;
      for (i = 0; i < CODE_MESSAGES.length; i++) {
        expect(CODE_MESSAGES[i].text.length).assertLarger(0);
        expect(UrlValidator.messageOf(CODE_MESSAGES[i].code)).assertEqual(CODE_MESSAGES[i].text);
      }
      expect(UrlValidator.messageOf(99)).assertEqual('unknown code');
      let report: ValidationReport = UrlValidator.validate('file:///x');
      expect(report.message).assertEqual('scheme blocked');
      TestLogger.info(TAG, 'code messages resolved for every error code');
      TestLogger.caseEnd(TAG, 'Security_Validation_Code_002', 1);
      TestLogger.pass(TAG, 'Security_Validation_Code_002');
    });

    it('Security_Validation_Combo_001', 0, async () => {
      TestLogger.caseBegin(TAG, 'Security_Validation_Combo_001');
      let raw: string = '  <script>alert(1)</script>  ';
      expect(InputValidator.validate(raw.trim())).assertEqual(ValidationCode.XSS_PATTERN);
      let report: ValidationReport = UrlValidator.validate(raw);
      expect(report.code).assertEqual(ValidationCode.XSS_PATTERN);
      expect(UrlValidator.isAccepted(report)).assertFalse();
      let good: string = '  www.baidu.com  ';
      let goodReport: ValidationReport = UrlValidator.validate(good);
      expect(goodReport.code).assertEqual(ValidationCode.OK);
      let browser: MockBrowser = new MockBrowser(1);
      expect(browser.loadUrl(goodReport.host)).assertTrue();
      expect(browser.normalize(goodReport.host).indexOf(URL_SCHEME)).assertEqual(0);
      TestLogger.info(TAG, 'validation pipeline accepts only clean addresses');
      TestLogger.caseEnd(TAG, 'Security_Validation_Combo_001', 1);
      TestLogger.pass(TAG, 'Security_Validation_Combo_001');
    });

    it('Security_Validation_Combo_002', 0, async () => {
      TestLogger.caseBegin(TAG, 'Security_Validation_Combo_002');
      let samples: string[] = ['www.baidu.com', 'https://www.baidu.com', 'http://www.baidu.com',
        'evil-baidu.com', 'file:///etc/passwd', '//evil.example/a', ''];
      let first: number[] = [];
      let second: number[] = [];
      let i: number = 0;
      for (i = 0; i < samples.length; i++) {
        let report: ValidationReport = UrlValidator.validate(samples[i]);
        first.push(report.code);
        let again: ValidationReport = UrlValidator.validate(samples[i]);
        second.push(again.code);
      }
      expect(first.length).assertEqual(samples.length);
      for (i = 0; i < samples.length; i++) {
        expect(first[i]).assertEqual(second[i]);
      }
      expect(first[0]).assertEqual(ValidationCode.OK);
      expect(first[4]).assertEqual(ValidationCode.SCHEME_BLOCKED);
      expect(first[5]).assertEqual(ValidationCode.PROTOCOL_RELATIVE);
      expect(first[6]).assertEqual(ValidationCode.EMPTY);
      expect(isValidAddress('www.baidu.com')).assertTrue();
      TestLogger.info(TAG, 'validation result deterministic across repeated runs');
      TestLogger.caseEnd(TAG, 'Security_Validation_Combo_002', 1);
      TestLogger.pass(TAG, 'Security_Validation_Combo_002');
    });
  });
}
