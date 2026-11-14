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
import {
  startBrowserApp, normalizeUrl, isValidAddress, buildSearchUrl, encodeSearchWord,
  sanitizeInput, MAX_TAB_COUNT, URL_SCHEME
} from '../Shared/BrowserTestKit';
import { MockBrowser, MockWebController, MockLoadingStatus, MockNetwork } from '../Shared/BrowserMock';

const TAG: string = 'BrowserSecurityTest';

const SCHEME_ALLOWED: string[] = ['https', 'http', 'rawfile', 'about'];
const SCHEME_DENIED: string[] = ['javascript', 'data', 'file', 'vbscript', 'blob', 'intent', 'chrome',
  'content', 'filesystem', 'ws', 'wss', 'ftp'];
const PAD_USER_AGENT: string = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.105 Safari/537.36';
const PHONE_USER_AGENT: string = 'HuaweiBrowser/12.0.4.1';
const SEARCH_ENGINE: string = 'https://www.bing.com/search?q=';
const JS_PROXY_NAME: string = 'etsObj';
const JS_PROXY_METHODS: string[] = ['test', 'searchWord'];

interface SchemeCase {
  input: string;
  scheme: string;
  allowed: boolean;
  reason: string;
}

interface MixedResource {
  url: string;
  kind: string;
  active: boolean;
}

interface PermissionCase {
  name: string;
  declared: boolean;
  sensitive: boolean;
}

interface AttributeRecord {
  name: string;
  enabled: boolean;
  risk: boolean;
  severity: string;
}

/**
 * Local mirror of the address bar security rules. The browser prepends "https://"
 * to every submitted address, therefore a pasted pseudo scheme becomes a plain
 * https address whose host still contains the original scheme separator.
 */
class UrlSchemeGuard {
  static schemeOf(url: string): string {
    if (!url) {
      return '';
    }
    let value: string = url.trim().toLowerCase();
    let index: number = value.indexOf(':');
    if (index <= 0) {
      return '';
    }
    let head: string = value.substring(0, index);
    if (head.indexOf('/') >= 0 || head.indexOf('?') >= 0 || head.indexOf('#') >= 0) {
      return '';
    }
    let i: number = 0;
    for (i = 0; i < head.length; i++) {
      let code: number = head.charCodeAt(i);
      let isAlpha: boolean = code >= 97 && code <= 122;
      let isDigit: boolean = code >= 48 && code <= 57;
      if (!isAlpha && !isDigit && head.charAt(i) !== '+' && head.charAt(i) !== '-' && head.charAt(i) !== '.') {
        return '';
      }
    }
    return head;
  }

  static isDeniedScheme(url: string): boolean {
    let scheme: string = UrlSchemeGuard.schemeOf(url);
    return SCHEME_DENIED.indexOf(scheme) >= 0;
  }

  static isAllowedScheme(url: string): boolean {
    let scheme: string = UrlSchemeGuard.schemeOf(url);
    return SCHEME_ALLOWED.indexOf(scheme) >= 0;
  }

  static stripControl(value: string): string {
    let result: string = '';
    let i: number = 0;
    for (i = 0; i < value.length; i++) {
      let code: number = value.charCodeAt(i);
      if (code >= 32 && code !== 127) {
        result += value.charAt(i);
      }
    }
    return result;
  }

  static ensureHttps(address: string): string {
    let value: string = UrlSchemeGuard.stripControl(address).trim();
    if (value.length === 0) {
      return '';
    }
    if (value.indexOf(URL_SCHEME) === 0) {
      return value;
    }
    if (value.indexOf('http://') === 0) {
      return URL_SCHEME + value.substring(7);
    }
    return URL_SCHEME + value;
  }

  static hostOf(url: string): string {
    let value: string = url.trim();
    let marker: string = '://';
    let start: number = value.indexOf(marker);
    if (start < 0) {
      return '';
    }
    let rest: string = value.substring(start + marker.length);
    let end: number = rest.length;
    let cut: number = rest.indexOf('/');
    if (cut >= 0 && cut < end) {
      end = cut;
    }
    cut = rest.indexOf('?');
    if (cut >= 0 && cut < end) {
      end = cut;
    }
    cut = rest.indexOf('#');
    if (cut >= 0 && cut < end) {
      end = cut;
    }
    return rest.substring(0, end).toLowerCase();
  }

  static hasUserInfo(url: string): boolean {
    let host: string = UrlSchemeGuard.hostOf(url);
    return host.indexOf('@') >= 0;
  }

  static isValidHost(host: string): boolean {
    if (host.length === 0) {
      return false;
    }
    if (host.indexOf('@') >= 0 || host.indexOf(' ') >= 0 || host.indexOf('\\') >= 0) {
      return false;
    }
    let colon: number = host.indexOf(':');
    if (colon >= 0) {
      return false;
    }
    let labels: string[] = host.split('.');
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

  static isSafeNavigation(url: string): boolean {
    if (UrlSchemeGuard.isDeniedScheme(url)) {
      return false;
    }
    if (!UrlSchemeGuard.isAllowedScheme(url)) {
      return false;
    }
    let host: string = UrlSchemeGuard.hostOf(url);
    return UrlSchemeGuard.isValidHost(host) && !UrlSchemeGuard.hasUserInfo(url);
  }

  static classify(cases: SchemeCase[]): number {
    let mismatch: number = 0;
    let i: number = 0;
    for (i = 0; i < cases.length; i++) {
      if (UrlSchemeGuard.isAllowedScheme(cases[i].input) !== cases[i].allowed) {
        mismatch += 1;
      }
    }
    return mismatch;
  }
}

class MixedContentPolicy {
  mode: number;
  evaluated: number = 0;
  blocked: number = 0;
  loaded: number = 0;

  constructor(mode: number) {
    this.mode = mode;
  }

  static isActiveKind(kind: string): boolean {
    return kind === 'script' || kind === 'stylesheet' || kind === 'iframe' || kind === 'xhr';
  }

  decide(pageHttps: boolean, resourceUrl: string, kind: string): boolean {
    this.evaluated += 1;
    let mixed: boolean = pageHttps && resourceUrl.indexOf('http://') === 0;
    if (!mixed) {
      this.loaded += 1;
      return true;
    }
    if (this.mode === 2) {
      this.blocked += 1;
      return false;
    }
    if (this.mode === 1 && MixedContentPolicy.isActiveKind(kind)) {
      this.blocked += 1;
      return false;
    }
    this.loaded += 1;
    return true;
  }

  audit(resources: MixedResource[]): number {
    let i: number = 0;
    for (i = 0; i < resources.length; i++) {
      this.decide(true, resources[i].url, resources[i].kind);
    }
    return this.blocked;
  }

  summary(): string {
    return 'mode=' + this.mode + ' total=' + this.evaluated + ' blocked=' + this.blocked + ' loaded=' + this.loaded;
  }
}

class JsProxyAuditor {
  registeredName: string;
  exposedMethods: string[] = [];
  registerCount: number = 0;

  constructor(name: string, methods: string[]) {
    this.registeredName = name;
    let i: number = 0;
    for (i = 0; i < methods.length; i++) {
      this.exposedMethods.push(methods[i]);
    }
  }

  isExposed(method: string): boolean {
    return this.exposedMethods.indexOf(method) >= 0;
  }

  dangerousExposed(): string[] {
    let dangerous: string[] = ['eval', 'exec', 'loadUrl', 'getCookie', 'setCookie', 'deleteAllData',
      'getUserAgent', 'runJavaScript', 'download', 'openFile'];
    let found: string[] = [];
    let i: number = 0;
    for (i = 0; i < dangerous.length; i++) {
      if (this.isExposed(dangerous[i])) {
        found.push(dangerous[i]);
      }
    }
    return found;
  }

  register(): boolean {
    this.registerCount += 1;
    return this.registerCount === 1;
  }

  exposureRatio(): number {
    if (this.exposedMethods.length === 0) {
      return 0;
    }
    return this.exposedMethods.length / (this.exposedMethods.length + 8);
  }
}

class PopupGuard {
  allowed: number = 0;
  denied: number = 0;
  attachedController: number = 0;
  lastUrl: string = '';

  judge(targetUrl: string): boolean {
    this.lastUrl = targetUrl;
    if (targetUrl.length === 0 || targetUrl === 'about:blank') {
      this.denied += 1;
      return false;
    }
    if (UrlSchemeGuard.isDeniedScheme(targetUrl)) {
      this.denied += 1;
      return false;
    }
    if (targetUrl.indexOf(URL_SCHEME) !== 0) {
      this.denied += 1;
      return false;
    }
    if (!UrlSchemeGuard.isSafeNavigation(targetUrl)) {
      this.denied += 1;
      return false;
    }
    this.allowed += 1;
    return true;
  }

  grantNativeController(): void {
    this.attachedController += 1;
  }

  rejectNativeController(): void {
    this.attachedController = 0;
  }

  total(): number {
    return this.allowed + this.denied;
  }
}

class AddressSpoofDetector {
  static isLookalike(host: string, official: string): boolean {
    let target: string = host.toLowerCase();
    let base: string = official.toLowerCase();
    if (target === base) {
      return false;
    }
    if (AddressSpoofDetector.isSuffixSpoof(target, base)) {
      return false;
    }
    return target.indexOf(base) >= 0;
  }

  static isSuffixSpoof(host: string, official: string): boolean {
    let target: string = host.toLowerCase();
    let base: string = official.toLowerCase();
    if (target === base || target.length <= base.length + 1) {
      return false;
    }
    let tail: string = target.substring(target.length - base.length - 1);
    return tail === '.' + base;
  }

  static hasConfusableChar(value: string): boolean {
    let i: number = 0;
    for (i = 0; i < value.length; i++) {
      if (value.charCodeAt(i) > 127) {
        return true;
      }
    }
    return false;
  }

  static hasBackslash(url: string): boolean {
    return url.indexOf('\\') >= 0;
  }

  static hasEncodedDot(host: string): boolean {
    let value: string = host.toLowerCase();
    return value.indexOf('%2e') >= 0 || value.indexOf('%2f') >= 0;
  }

  static displayHost(url: string): string {
    let host: string = UrlSchemeGuard.hostOf(url);
    if (host.indexOf('@') >= 0) {
      return host.substring(host.lastIndexOf('@') + 1);
    }
    return host;
  }

  static isSuspicious(url: string, official: string): boolean {
    let host: string = AddressSpoofDetector.displayHost(url);
    if (url.indexOf('@') >= 0) {
      return true;
    }
    if (AddressSpoofDetector.hasBackslash(url) || AddressSpoofDetector.hasEncodedDot(host)) {
      return true;
    }
    if (AddressSpoofDetector.hasConfusableChar(host)) {
      return true;
    }
    return AddressSpoofDetector.isLookalike(host, official) ||
      AddressSpoofDetector.isSuffixSpoof(host, official);
  }

  static mismatchCount(cases: string[], official: string): number {
    let count: number = 0;
    let i: number = 0;
    for (i = 0; i < cases.length; i++) {
      if (AddressSpoofDetector.isSuspicious(cases[i], official)) {
        count += 1;
      }
    }
    return count;
  }
}

class HttpsEnforcer {
  upgradeCount: number = 0;
  downgradeBlocked: number = 0;
  secureHosts: string[] = [];

  enforce(address: string): string {
    let value: string = UrlSchemeGuard.ensureHttps(address);
    if (address.trim().indexOf('http://') === 0) {
      this.upgradeCount += 1;
    }
    if (value.length === 0) {
      return '';
    }
    if (this.secureHosts.indexOf(UrlSchemeGuard.hostOf(value)) < 0) {
      this.secureHosts.push(UrlSchemeGuard.hostOf(value));
    }
    return value;
  }

  navigate(address: string): string {
    let value: string = address.trim();
    let host: string = UrlSchemeGuard.hostOf(value);
    if (value.indexOf('http://') === 0 && this.secureHosts.indexOf(host) >= 0) {
      this.downgradeBlocked += 1;
      return URL_SCHEME + value.substring(7);
    }
    return this.enforce(value);
  }

  isSecure(url: string): boolean {
    return url.indexOf(URL_SCHEME) === 0;
  }

  secureRatio(urls: string[]): number {
    if (urls.length === 0) {
      return 0;
    }
    let secure: number = 0;
    let i: number = 0;
    for (i = 0; i < urls.length; i++) {
      if (this.isSecure(urls[i])) {
        secure += 1;
      }
    }
    return Math.round(secure * 100 / urls.length);
  }
}

class PermissionAudit {
  declared: string[] = [];

  constructor(declared: string[]) {
    let i: number = 0;
    for (i = 0; i < declared.length; i++) {
      this.declared.push(declared[i]);
    }
  }

  has(name: string): boolean {
    return this.declared.indexOf(name) >= 0;
  }

  missing(required: string[]): string[] {
    let result: string[] = [];
    let i: number = 0;
    for (i = 0; i < required.length; i++) {
      if (!this.has(required[i])) {
        result.push(required[i]);
      }
    }
    return result;
  }

  sensitiveDeclared(sensitive: string[]): string[] {
    let result: string[] = [];
    let i: number = 0;
    for (i = 0; i < sensitive.length; i++) {
      if (this.has(sensitive[i])) {
        result.push(sensitive[i]);
      }
    }
    return result;
  }

  isMinimal(required: string[], sensitive: string[]): boolean {
    return this.missing(required).length === 0 && this.sensitiveDeclared(sensitive).length === 0;
  }

  count(): number {
    return this.declared.length;
  }
}

class WebAttributeAudit {
  records: AttributeRecord[] = [];

  constructor(records: AttributeRecord[]) {
    let i: number = 0;
    for (i = 0; i < records.length; i++) {
      this.records.push(records[i]);
    }
  }

  valueOf(name: string): boolean {
    let i: number = 0;
    for (i = 0; i < this.records.length; i++) {
      if (this.records[i].name === name) {
        return this.records[i].enabled;
      }
    }
    return false;
  }

  risky(): string[] {
    let result: string[] = [];
    let i: number = 0;
    for (i = 0; i < this.records.length; i++) {
      if (this.records[i].enabled && this.records[i].risk) {
        result.push(this.records[i].name);
      }
    }
    return result;
  }

  highSeverity(): number {
    let total: number = 0;
    let i: number = 0;
    for (i = 0; i < this.records.length; i++) {
      if (this.records[i].enabled && this.records[i].severity === 'high') {
        total += 1;
      }
    }
    return total;
  }

  score(): number {
    let total: number = 100;
    let i: number = 0;
    for (i = 0; i < this.records.length; i++) {
      if (!this.records[i].enabled || !this.records[i].risk) {
        continue;
      }
      if (this.records[i].severity === 'high') {
        total -= 20;
      } else if (this.records[i].severity === 'medium') {
        total -= 10;
      } else {
        total -= 5;
      }
    }
    return total;
  }

  allEnabled(names: string[]): boolean {
    let i: number = 0;
    for (i = 0; i < names.length; i++) {
      if (!this.valueOf(names[i])) {
        return false;
      }
    }
    return true;
  }
}

const SCHEME_CASES: SchemeCase[] = [
  { input: 'javascript:alert(1)', scheme: 'javascript', allowed: false, reason: 'script execution' },
  { input: 'JavaScript:alert(document.cookie)', scheme: 'javascript', allowed: false, reason: 'case variant' },
  { input: 'data:text/html;base64,PHNjcmlwdD4=', scheme: 'data', allowed: false, reason: 'inline document' },
  { input: 'file:///data/local/tmp/secret.txt', scheme: 'file', allowed: false, reason: 'local file read' },
  { input: 'vbscript:msgbox(1)', scheme: 'vbscript', allowed: false, reason: 'legacy script' },
  { input: 'blob:https://evil.example/abc', scheme: 'blob', allowed: false, reason: 'relative blob' },
  { input: 'intent://scan/#Intent;scheme=zxing;end', scheme: 'intent', allowed: false, reason: 'external intent' },
  { input: 'chrome://settings', scheme: 'chrome', allowed: false, reason: 'internal page' },
  { input: 'filesystem:https://evil.example/temporary/x', scheme: 'filesystem', allowed: false, reason: 'fs handle' },
  { input: 'https://www.bing.com/search?q=ohos', scheme: 'https', allowed: true, reason: 'secure page' },
  { input: 'http://www.bing.com/', scheme: 'http', allowed: true, reason: 'upgraded to https' },
  { input: 'about:blank', scheme: 'about', allowed: true, reason: 'internal blank page' },
  { input: 'www.baidu.com', scheme: '', allowed: false, reason: 'no scheme yet' },
  { input: '//evil.example/path', scheme: '', allowed: false, reason: 'protocol relative' }
];

const MIXED_RESOURCES: MixedResource[] = [
  { url: 'https://cdn.example/a.js', kind: 'script', active: true },
  { url: 'http://cdn.example/b.js', kind: 'script', active: true },
  { url: 'http://cdn.example/c.css', kind: 'stylesheet', active: true },
  { url: 'http://img.example/d.png', kind: 'image', active: false },
  { url: 'http://frame.example/e.html', kind: 'iframe', active: true },
  { url: 'http://api.example/f.json', kind: 'xhr', active: true }
];

const PERMISSION_CASES: PermissionCase[] = [
  { name: 'ohos.permission.INTERNET', declared: true, sensitive: false },
  { name: 'ohos.permission.GET_WIFI_INFO', declared: true, sensitive: false },
  { name: 'ohos.permission.LOCATION', declared: false, sensitive: true },
  { name: 'ohos.permission.APPROXIMATELY_LOCATION', declared: false, sensitive: true },
  { name: 'ohos.permission.CAMERA', declared: false, sensitive: true },
  { name: 'ohos.permission.MICROPHONE', declared: false, sensitive: true },
  { name: 'ohos.permission.READ_CONTACTS', declared: false, sensitive: true },
  { name: 'ohos.permission.READ_MEDIA', declared: false, sensitive: true }
];

const ATTRIBUTE_RECORDS: AttributeRecord[] = [
  { name: 'javaScriptAccess', enabled: true, risk: true, severity: 'high' },
  { name: 'fileAccess', enabled: true, risk: true, severity: 'high' },
  { name: 'domStorageAccess', enabled: true, risk: true, severity: 'low' },
  { name: 'multiWindowAccess', enabled: true, risk: true, severity: 'medium' },
  { name: 'onlineImageAccess', enabled: true, risk: false, severity: 'none' },
  { name: 'databaseAccess', enabled: false, risk: true, severity: 'medium' },
  { name: 'geolocationAccess', enabled: false, risk: true, severity: 'high' }
];

export default function browserSecurityTest() {
  describe('browserSecurityTest', () => {
    beforeAll(async () => {
      TestLogger.info(TAG, 'suite begin, browser security audit');
      await startBrowserApp();
    });

    afterAll(() => {
      TestLogger.info(TAG, TestLogger.summary(TAG));
    });

    it('Browser_Security_Scheme_001', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Security_Scheme_001');
      let denied: number = 0;
      let i: number = 0;
      for (i = 0; i < SCHEME_CASES.length; i++) {
        let item: SchemeCase = SCHEME_CASES[i];
        if (!item.allowed && item.scheme.length > 0) {
          expect(UrlSchemeGuard.isDeniedScheme(item.input)).assertTrue();
          denied += 1;
          TestLogger.info(TAG, 'rejected scheme ' + item.scheme + ' for ' + item.reason);
        }
      }
      expect(denied).assertEqual(9);
      expect(UrlSchemeGuard.schemeOf('JAVASCRIPT:alert(1)')).assertEqual('javascript');
      expect(UrlSchemeGuard.schemeOf('https://www.bing.com')).assertEqual('https');
      TestLogger.caseEnd(TAG, 'Browser_Security_Scheme_001', 1);
      TestLogger.pass(TAG, 'Browser_Security_Scheme_001');
    });

    it('Browser_Security_Scheme_002', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Security_Scheme_002');
      expect(UrlSchemeGuard.isAllowedScheme('https://www.bing.com/search?q=ohos')).assertTrue();
      expect(UrlSchemeGuard.isAllowedScheme('http://www.bing.com/')).assertTrue();
      expect(UrlSchemeGuard.isAllowedScheme('about:blank')).assertTrue();
      expect(UrlSchemeGuard.isAllowedScheme('rawfile://pad.html')).assertTrue();
      expect(UrlSchemeGuard.isAllowedScheme('javascript:void(0)')).assertFalse();
      expect(UrlSchemeGuard.isAllowedScheme('www.baidu.com')).assertFalse();
      let allowedCount: number = 0;
      let i: number = 0;
      for (i = 0; i < SCHEME_CASES.length; i++) {
        if (SCHEME_CASES[i].allowed) {
          allowedCount += 1;
          expect(UrlSchemeGuard.isAllowedScheme(SCHEME_CASES[i].input)).assertTrue();
        }
      }
      expect(allowedCount).assertEqual(3);
      TestLogger.info(TAG, 'allowed scheme table verified, count=' + allowedCount);
      TestLogger.caseEnd(TAG, 'Browser_Security_Scheme_002', 1);
      TestLogger.pass(TAG, 'Browser_Security_Scheme_002');
    });

    it('Browser_Security_Scheme_003', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Security_Scheme_003');
      let upgraded: string = UrlSchemeGuard.ensureHttps('www.baidu.com');
      expect(upgraded).assertEqual('https://www.baidu.com');
      let upgradedHttp: string = UrlSchemeGuard.ensureHttps('http://www.baidu.com/a');
      expect(upgradedHttp).assertEqual('https://www.baidu.com/a');
      let kept: string = UrlSchemeGuard.ensureHttps('https://www.baidu.com');
      expect(kept).assertEqual('https://www.baidu.com');
      let neutralized: string = UrlSchemeGuard.ensureHttps('javascript:alert(1)');
      expect(neutralized.indexOf('https://')).assertEqual(0);
      expect(UrlSchemeGuard.isSafeNavigation(neutralized)).assertFalse();
      let dataUrl: string = UrlSchemeGuard.ensureHttps('data:text/html,<script>alert(1)</script>');
      expect(UrlSchemeGuard.isSafeNavigation(dataUrl)).assertFalse();
      TestLogger.info(TAG, 'scheme neutralization verified');
      TestLogger.caseEnd(TAG, 'Browser_Security_Scheme_003', 1);
      TestLogger.pass(TAG, 'Browser_Security_Scheme_003');
    });

    it('Browser_Security_Scheme_004', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Security_Scheme_004');
      let dirty: string = 'www.bai\u0000du.com';
      expect(UrlSchemeGuard.stripControl(dirty)).assertEqual('www.baidu.com');
      expect(UrlSchemeGuard.stripControl('a\u0007b\tc')).assertEqual('abc');
      expect(UrlSchemeGuard.stripControl('https://x.y/\u007fz')).assertEqual('https://x.y/z');
      expect(UrlSchemeGuard.ensureHttps('   ')).assertEqual('');
      expect(UrlSchemeGuard.ensureHttps('')).assertEqual('');
      let tabbed: string = UrlSchemeGuard.ensureHttps('\t www.baidu.com ');
      expect(tabbed).assertEqual('https://www.baidu.com');
      expect(UrlSchemeGuard.schemeOf('')).assertEqual('');
      expect(UrlSchemeGuard.schemeOf('no-scheme')).assertEqual('');
      TestLogger.info(TAG, 'control character stripping verified');
      TestLogger.caseEnd(TAG, 'Browser_Security_Scheme_004', 1);
      TestLogger.pass(TAG, 'Browser_Security_Scheme_004');
    });

    it('Browser_Security_Scheme_005', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Security_Scheme_005');
      let mismatch: number = UrlSchemeGuard.classify(SCHEME_CASES);
      expect(mismatch).assertEqual(0);
      let invalidHost: number = 0;
      let i: number = 0;
      let hosts: string[] = ['javascript:alert(1)', 'baidu.com', 'a.b.c', 'localhost', 'bad host', 'a@b.com'];
      for (i = 0; i < hosts.length; i++) {
        if (!UrlSchemeGuard.isValidHost(hosts[i])) {
          invalidHost += 1;
        }
      }
      expect(invalidHost).assertEqual(4);
      expect(UrlSchemeGuard.isValidHost('www.baidu.com')).assertTrue();
      expect(UrlSchemeGuard.isValidHost('a.b.c')).assertTrue();
      TestLogger.info(TAG, 'scheme classification table mismatch=' + mismatch);
      TestLogger.caseEnd(TAG, 'Browser_Security_Scheme_005', 1);
      TestLogger.pass(TAG, 'Browser_Security_Scheme_005');
    });

    it('Browser_Security_MixedContent_001', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Security_MixedContent_001');
      let policy: MixedContentPolicy = new MixedContentPolicy(0);
      let blocked: number = policy.audit(MIXED_RESOURCES);
      expect(blocked).assertEqual(0);
      expect(policy.evaluated).assertEqual(MIXED_RESOURCES.length);
      expect(policy.loaded).assertEqual(MIXED_RESOURCES.length);
      expect(policy.decide(true, 'http://img.example/x.png', 'image')).assertTrue();
      expect(policy.decide(true, 'https://cdn.example/a.js', 'script')).assertTrue();
      TestLogger.info(TAG, 'mixed mode All: ' + policy.summary());
      TestLogger.caseEnd(TAG, 'Browser_Security_MixedContent_001', 1);
      TestLogger.pass(TAG, 'Browser_Security_MixedContent_001');
    });

    it('Browser_Security_MixedContent_002', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Security_MixedContent_002');
      let policy: MixedContentPolicy = new MixedContentPolicy(1);
      let blocked: number = policy.audit(MIXED_RESOURCES);
      expect(blocked).assertEqual(4);
      expect(policy.decide(true, 'http://img.example/x.png', 'image')).assertTrue();
      expect(policy.decide(true, 'http://cdn.example/b.js', 'script')).assertFalse();
      expect(policy.decide(true, 'http://cdn.example/c.css', 'stylesheet')).assertFalse();
      expect(policy.decide(true, 'http://frame.example/e.html', 'iframe')).assertFalse();
      expect(policy.decide(true, 'http://api.example/f.json', 'xhr')).assertFalse();
      expect(MixedContentPolicy.isActiveKind('image')).assertFalse();
      expect(MixedContentPolicy.isActiveKind('script')).assertTrue();
      TestLogger.info(TAG, 'mixed mode Compatible: ' + policy.summary());
      TestLogger.caseEnd(TAG, 'Browser_Security_MixedContent_002', 1);
      TestLogger.pass(TAG, 'Browser_Security_MixedContent_002');
    });

    it('Browser_Security_MixedContent_003', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Security_MixedContent_003');
      let policy: MixedContentPolicy = new MixedContentPolicy(2);
      let blocked: number = policy.audit(MIXED_RESOURCES);
      expect(blocked).assertEqual(5);
      expect(policy.decide(true, 'http://img.example/x.png', 'image')).assertFalse();
      expect(policy.decide(false, 'http://img.example/x.png', 'image')).assertTrue();
      expect(policy.decide(true, 'https://img.example/x.png', 'image')).assertTrue();
      expect(policy.blocked).assertEqual(6);
      expect(policy.loaded).assertEqual(3);
      TestLogger.info(TAG, 'mixed mode Never: ' + policy.summary());
      TestLogger.caseEnd(TAG, 'Browser_Security_MixedContent_003', 1);
      TestLogger.pass(TAG, 'Browser_Security_MixedContent_003');
    });

    it('Browser_Security_Proxy_001', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Security_Proxy_001');
      let auditor: JsProxyAuditor = new JsProxyAuditor(JS_PROXY_NAME, JS_PROXY_METHODS);
      expect(auditor.registeredName).assertEqual('etsObj');
      expect(auditor.exposedMethods.length).assertEqual(2);
      expect(auditor.isExposed('test')).assertTrue();
      expect(auditor.isExposed('searchWord')).assertTrue();
      expect(auditor.isExposed('Test')).assertFalse();
      expect(auditor.isExposed('searchword')).assertFalse();
      expect(auditor.exposureRatio()).assertLess(1);
      expect(auditor.exposureRatio()).assertLarger(0);
      TestLogger.info(TAG, 'js proxy minimal exposure verified');
      TestLogger.caseEnd(TAG, 'Browser_Security_Proxy_001', 1);
      TestLogger.pass(TAG, 'Browser_Security_Proxy_001');
    });

    it('Browser_Security_Proxy_002', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Security_Proxy_002');
      let auditor: JsProxyAuditor = new JsProxyAuditor(JS_PROXY_NAME, JS_PROXY_METHODS);
      let found: string[] = auditor.dangerousExposed();
      expect(found.length).assertEqual(0);
      let dangerous: string[] = ['eval', 'loadUrl', 'getCookie', 'runJavaScript', 'download'];
      let i: number = 0;
      for (i = 0; i < dangerous.length; i++) {
        expect(auditor.isExposed(dangerous[i])).assertFalse();
      }
      TestLogger.info(TAG, 'dangerous proxy methods not exposed, count=0');
      TestLogger.caseEnd(TAG, 'Browser_Security_Proxy_002', 1);
      TestLogger.pass(TAG, 'Browser_Security_Proxy_002');
    });

    it('Browser_Security_Proxy_003', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Security_Proxy_003');
      let auditor: JsProxyAuditor = new JsProxyAuditor(JS_PROXY_NAME, JS_PROXY_METHODS);
      expect(auditor.register()).assertTrue();
      expect(auditor.register()).assertFalse();
      expect(auditor.registerCount).assertEqual(2);
      let controller: MockWebController = new MockWebController();
      controller.runJavaScript('etsObj.searchWord("ohos")');
      controller.runJavaScript('etsObj.test("www.baidu.com")');
      expect(controller.javaScriptCalls.length).assertEqual(2);
      expect(controller.javaScriptCalls[0]).assertContain('etsObj');
      expect(controller.javaScriptCalls[1]).assertContain('etsObj');
      TestLogger.info(TAG, 'proxy registered once, js calls=' + controller.javaScriptCalls.length);
      TestLogger.caseEnd(TAG, 'Browser_Security_Proxy_003', 1);
      TestLogger.pass(TAG, 'Browser_Security_Proxy_003');
    });

    it('Browser_Security_Popup_001', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Security_Popup_001');
      let guard: PopupGuard = new PopupGuard();
      expect(guard.judge('javascript:alert(document.cookie)')).assertFalse();
      expect(guard.judge('data:text/html,<script>alert(1)</script>')).assertFalse();
      expect(guard.judge('file:///data/local/tmp/a.txt')).assertFalse();
      expect(guard.judge('vbscript:msgbox(1)')).assertFalse();
      expect(guard.allowed).assertEqual(0);
      expect(guard.denied).assertEqual(4);
      expect(guard.total()).assertEqual(4);
      TestLogger.info(TAG, 'popup denied pseudo schemes, denied=' + guard.denied);
      TestLogger.caseEnd(TAG, 'Browser_Security_Popup_001', 1);
      TestLogger.pass(TAG, 'Browser_Security_Popup_001');
    });

    it('Browser_Security_Popup_002', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Security_Popup_002');
      let guard: PopupGuard = new PopupGuard();
      expect(guard.judge('')).assertFalse();
      expect(guard.judge('about:blank')).assertFalse();
      expect(guard.judge('www.bing.com')).assertFalse();
      expect(guard.judge('https://www.bing.com/')).assertTrue();
      expect(guard.judge('https://evil.example/?q=1')).assertTrue();
      expect(guard.allowed).assertEqual(2);
      expect(guard.denied).assertEqual(3);
      expect(guard.lastUrl).assertEqual('https://evil.example/?q=1');
      TestLogger.info(TAG, 'popup url policy evaluated, total=' + guard.total());
      TestLogger.caseEnd(TAG, 'Browser_Security_Popup_002', 1);
      TestLogger.pass(TAG, 'Browser_Security_Popup_002');
    });

    it('Browser_Security_Popup_003', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Security_Popup_003');
      let guard: PopupGuard = new PopupGuard();
      guard.judge('https://popup.example/new');
      guard.rejectNativeController();
      expect(guard.attachedController).assertEqual(0);
      guard.grantNativeController();
      expect(guard.attachedController).assertEqual(1);
      guard.rejectNativeController();
      expect(guard.attachedController).assertEqual(0);
      expect(guard.judge('https://popup.example/next')).assertTrue();
      expect(guard.allowed).assertEqual(2);
      expect(guard.denied).assertEqual(0);
      let blankGuard: PopupGuard = new PopupGuard();
      expect(blankGuard.judge('about:blank')).assertFalse();
      expect(blankGuard.judge('')).assertFalse();
      expect(blankGuard.denied).assertEqual(2);
      TestLogger.info(TAG, 'popup controller detached after window creation');
      TestLogger.caseEnd(TAG, 'Browser_Security_Popup_003', 1);
      TestLogger.pass(TAG, 'Browser_Security_Popup_003');
    });

    it('Browser_Security_AddressBar_001', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Security_AddressBar_001');
      let trick: string = 'https://www.bing.com@evil.example/login';
      expect(UrlSchemeGuard.hasUserInfo(trick)).assertTrue();
      expect(AddressSpoofDetector.displayHost(trick)).assertEqual('evil.example');
      expect(UrlSchemeGuard.isSafeNavigation(trick)).assertFalse();
      let normal: string = 'https://www.bing.com/search?q=ohos';
      expect(UrlSchemeGuard.hasUserInfo(normal)).assertFalse();
      expect(AddressSpoofDetector.displayHost(normal)).assertEqual('www.bing.com');
      expect(UrlSchemeGuard.isSafeNavigation(normal)).assertTrue();
      TestLogger.info(TAG, 'userinfo address bar trick detected');
      TestLogger.caseEnd(TAG, 'Browser_Security_AddressBar_001', 1);
      TestLogger.pass(TAG, 'Browser_Security_AddressBar_001');
    });

    it('Browser_Security_AddressBar_003', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Security_AddressBar_003');
      expect(AddressSpoofDetector.hasConfusableChar('bаidu.com')).assertTrue();
      expect(AddressSpoofDetector.hasConfusableChar('baidu.com')).assertFalse();
      expect(AddressSpoofDetector.hasBackslash('https://evil.example\\@www.baidu.com')).assertTrue();
      expect(AddressSpoofDetector.hasEncodedDot('evil%2ebaidu.com')).assertTrue();
      expect(AddressSpoofDetector.hasEncodedDot('baidu.com')).assertFalse();
      expect(UrlSchemeGuard.isValidHost('evil%2ebaidu.com:8080')).assertFalse();
      let host: string = UrlSchemeGuard.hostOf('https://WWW.BAIDU.COM/Path');
      expect(host).assertEqual('www.baidu.com');
      expect(UrlSchemeGuard.hostOf('https://a.example:8443/x')).assertEqual('a.example:8443');
      TestLogger.info(TAG, 'confusable and encoded host detection verified');
      TestLogger.caseEnd(TAG, 'Browser_Security_AddressBar_003', 1);
      TestLogger.pass(TAG, 'Browser_Security_AddressBar_003');
    });

    it('Browser_Security_Https_001', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Security_Https_001');
      let enforcer: HttpsEnforcer = new HttpsEnforcer();
      expect(enforcer.enforce('www.baidu.com')).assertEqual('https://www.baidu.com');
      expect(enforcer.enforce('http://www.baidu.com/x')).assertEqual('https://www.baidu.com/x');
      expect(enforcer.enforce('https://www.baidu.com/x')).assertEqual('https://www.baidu.com/x');
      expect(enforcer.upgradeCount).assertEqual(1);
      expect(enforcer.isSecure('https://www.baidu.com')).assertTrue();
      expect(enforcer.isSecure('http://www.baidu.com')).assertFalse();
      expect(enforcer.secureRatio(['https://a.example', 'http://b.example', 'https://c.example', 'https://d.example'])).assertEqual(75);
      expect(enforcer.secureHosts.length).assertEqual(1);
      TestLogger.info(TAG, 'https enforcement verified, upgraded=' + enforcer.upgradeCount);
      TestLogger.caseEnd(TAG, 'Browser_Security_Https_001', 1);
      TestLogger.pass(TAG, 'Browser_Security_Https_001');
    });

    it('Browser_Security_Https_002', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Security_Https_002');
      let enforcer: HttpsEnforcer = new HttpsEnforcer();
      enforcer.enforce('https://www.baidu.com/');
      let downgraded: string = enforcer.navigate('http://www.baidu.com/login');
      expect(downgraded).assertEqual('https://www.baidu.com/login');
      expect(enforcer.downgradeBlocked).assertEqual(1);
      let fresh: string = enforcer.navigate('http://new.example/a');
      expect(fresh).assertEqual('https://new.example/a');
      expect(enforcer.upgradeCount).assertEqual(1);
      expect(enforcer.isSecure(downgraded)).assertTrue();
      expect(enforcer.isSecure(fresh)).assertTrue();
      TestLogger.info(TAG, 'https downgrade blocked, count=' + enforcer.downgradeBlocked);
      TestLogger.caseEnd(TAG, 'Browser_Security_Https_002', 1);
      TestLogger.pass(TAG, 'Browser_Security_Https_002');
    });

    it('Browser_Security_Permission_001', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Security_Permission_001');
      let audit: PermissionAudit = new PermissionAudit(['ohos.permission.INTERNET', 'ohos.permission.GET_WIFI_INFO']);
      expect(audit.count()).assertEqual(2);
      expect(audit.has('ohos.permission.INTERNET')).assertTrue();
      expect(audit.has('ohos.permission.GET_WIFI_INFO')).assertTrue();
      expect(audit.has('ohos.permission.CAMERA')).assertFalse();
      let required: string[] = ['ohos.permission.INTERNET', 'ohos.permission.GET_WIFI_INFO'];
      expect(audit.missing(required).length).assertEqual(0);
      expect(audit.isMinimal(required, [])).assertTrue();
      TestLogger.info(TAG, 'declared internet and wifi permissions verified');
      TestLogger.caseEnd(TAG, 'Browser_Security_Permission_001', 1);
      TestLogger.pass(TAG, 'Browser_Security_Permission_001');
    });

    it('Browser_Security_Permission_002', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Security_Permission_002');
      let declared: string[] = [];
      let i: number = 0;
      for (i = 0; i < PERMISSION_CASES.length; i++) {
        if (PERMISSION_CASES[i].declared) {
          declared.push(PERMISSION_CASES[i].name);
        }
      }
      let audit: PermissionAudit = new PermissionAudit(declared);
      let sensitive: string[] = [];
      for (i = 0; i < PERMISSION_CASES.length; i++) {
        if (PERMISSION_CASES[i].sensitive) {
          sensitive.push(PERMISSION_CASES[i].name);
        }
      }
      expect(sensitive.length).assertEqual(6);
      expect(audit.sensitiveDeclared(sensitive).length).assertEqual(0);
      expect(audit.isMinimal(['ohos.permission.INTERNET', 'ohos.permission.GET_WIFI_INFO'], sensitive)).assertTrue();
      let overreach: PermissionAudit = new PermissionAudit(declared.concat(['ohos.permission.CAMERA']));
      expect(overreach.sensitiveDeclared(sensitive).length).assertEqual(1);
      expect(overreach.isMinimal(['ohos.permission.INTERNET'], sensitive)).assertFalse();
      TestLogger.info(TAG, 'sensitive permission overreach detected');
      TestLogger.caseEnd(TAG, 'Browser_Security_Permission_002', 1);
      TestLogger.pass(TAG, 'Browser_Security_Permission_002');
    });

    it('Browser_Security_Attribute_001', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Security_Attribute_001');
      let audit: WebAttributeAudit = new WebAttributeAudit(ATTRIBUTE_RECORDS);
      expect(audit.valueOf('javaScriptAccess')).assertTrue();
      expect(audit.valueOf('fileAccess')).assertTrue();
      expect(audit.valueOf('domStorageAccess')).assertTrue();
      expect(audit.valueOf('multiWindowAccess')).assertTrue();
      expect(audit.valueOf('databaseAccess')).assertFalse();
      expect(audit.valueOf('geolocationAccess')).assertFalse();
      let expected: string[] = ['javaScriptAccess', 'fileAccess', 'domStorageAccess', 'multiWindowAccess'];
      expect(audit.allEnabled(expected)).assertTrue();
      expect(audit.allEnabled(expected.concat(['databaseAccess']))).assertFalse();
      TestLogger.info(TAG, 'web security attributes audited');
      TestLogger.caseEnd(TAG, 'Browser_Security_Attribute_001', 1);
      TestLogger.pass(TAG, 'Browser_Security_Attribute_001');
    });

    it('Browser_Security_Attribute_002', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Security_Attribute_002');
      let audit: WebAttributeAudit = new WebAttributeAudit(ATTRIBUTE_RECORDS);
      let risky: string[] = audit.risky();
      expect(risky.length).assertEqual(4);
      expect(risky.indexOf('javaScriptAccess') >= 0).assertTrue();
      expect(risky.indexOf('fileAccess') >= 0).assertTrue();
      expect(risky.indexOf('databaseAccess')).assertEqual(-1);
      expect(audit.highSeverity()).assertEqual(2);
      let score: number = audit.score();
      expect(score).assertLess(100);
      expect(score).assertLarger(0);
      expect(score).assertEqual(45);
      TestLogger.info(TAG, 'risk score computed=' + score);
      TestLogger.caseEnd(TAG, 'Browser_Security_Attribute_002', 1);
      TestLogger.pass(TAG, 'Browser_Security_Attribute_002');
    });

    it('Browser_Security_Attribute_003', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Security_Attribute_003');
      let hardened: AttributeRecord[] = [
        { name: 'javaScriptAccess', enabled: false, risk: true, severity: 'high' },
        { name: 'fileAccess', enabled: false, risk: true, severity: 'high' },
        { name: 'domStorageAccess', enabled: false, risk: true, severity: 'low' },
        { name: 'multiWindowAccess', enabled: false, risk: true, severity: 'medium' }
      ];
      let audit: WebAttributeAudit = new WebAttributeAudit(hardened);
      expect(audit.risky().length).assertEqual(0);
      expect(audit.highSeverity()).assertEqual(0);
      expect(audit.score()).assertEqual(100);
      expect(audit.valueOf('javaScriptAccess')).assertFalse();
      expect(audit.allEnabled(['javaScriptAccess'])).assertFalse();
      TestLogger.info(TAG, 'hardened attribute profile scored 100');
      TestLogger.caseEnd(TAG, 'Browser_Security_Attribute_003', 1);
      TestLogger.pass(TAG, 'Browser_Security_Attribute_003');
    });

    it('Browser_Security_Search_001', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Security_Search_001');
      let payload: string = '"><script>alert(1)</script>';
      let encoded: string = encodeSearchWord(payload);
      expect(encoded.indexOf('<')).assertEqual(-1);
      expect(encoded.indexOf('>')).assertEqual(-1);
      expect(encoded.indexOf('"')).assertEqual(-1);
      let built: string = buildSearchUrl(payload);
      expect(built.indexOf(SEARCH_ENGINE)).assertEqual(0);
      expect(built.indexOf('<script>')).assertEqual(-1);
      expect(built).assertContain('%22');
      expect(built).assertContain('%3C');
      let word: string = '安全 & privacy';
      let builtWord: string = buildSearchUrl(word);
      expect(builtWord).assertContain('https://www.bing.com/search?q=');
      expect(builtWord.indexOf(' ')).assertEqual(-1);
      TestLogger.info(TAG, 'search payload encoded, length=' + built.length);
      TestLogger.caseEnd(TAG, 'Browser_Security_Search_001', 1);
      TestLogger.pass(TAG, 'Browser_Security_Search_001');
    });

    it('Browser_Security_Model_001', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Security_Model_001');
      let browser: MockBrowser = new MockBrowser(1);
      expect(browser.loadUrl('www.baidu.com')).assertTrue();
      let controller: MockWebController = new MockWebController();
      expect(controller.loadUrl('www.baidu.com')).assertTrue();
      expect(controller.loadCount).assertEqual(1);
      expect(browser.normalize('javascript:alert(1)').indexOf('https://')).assertEqual(0);
      expect(UrlSchemeGuard.isSafeNavigation(browser.normalize('javascript:alert(1)'))).assertFalse();
      expect(browser.loadUrl('http://www.bing.com/')).assertTrue();
      // An explicit plain http address keeps its scheme; only scheme-less
      // input is upgraded to https.
      expect(browser.normalize('http://www.bing.com/')).assertEqual('http://www.bing.com/');
      expect(browser.normalize('www.bing.com').indexOf('https://')).assertEqual(0);
      TestLogger.info(TAG, 'model loadUrl upgrades scheme-less input to https');
      TestLogger.caseEnd(TAG, 'Browser_Security_Model_001', 1);
      TestLogger.pass(TAG, 'Browser_Security_Model_001');
    });

    it('Browser_Security_Model_002', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Security_Model_002');
      let controller: MockWebController = new MockWebController();
      expect(controller.loadUrl('https://www.bing.com/')).assertTrue();
      expect(controller.accessBackward()).assertFalse();
      expect(controller.accessForward()).assertFalse();
      expect(controller.loadUrl('https://www.baidu.com/')).assertTrue();
      expect(controller.accessBackward()).assertTrue();
      expect(controller.backward()).assertTrue();
      expect(controller.accessForward()).assertTrue();
      expect(controller.forward()).assertTrue();
      controller.refresh();
      expect(controller.refreshCount).assertEqual(1);
      let network: MockNetwork = new MockNetwork();
      network.setOnline(false);
      expect(network.fetch('https://www.baidu.com/')).assertFalse();
      network.setOnline(true);
      expect(network.fetch('https://www.baidu.com/')).assertTrue();
      expect(network.requestCount()).assertLarger(0);
      TestLogger.info(TAG, 'navigation guard and offline handling verified');
      TestLogger.caseEnd(TAG, 'Browser_Security_Model_002', 1);
      TestLogger.pass(TAG, 'Browser_Security_Model_002');
    });

    it('Browser_Security_Model_003', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Security_Model_003');
      expect(sanitizeInput('www.baidu.com')).assertEqual('www.baidu.com');
      expect(isValidAddress('www.baidu.com')).assertTrue();
      expect(normalizeUrl('www.baidu.com')).assertEqual('https://www.baidu.com');
      expect(normalizeUrl('https://www.baidu.com')).assertEqual('https://www.baidu.com');
      expect(UrlSchemeGuard.isSafeNavigation(normalizeUrl('www.baidu.com'))).assertTrue();
      expect(MAX_TAB_COUNT).assertEqual(10);
      expect(URL_SCHEME).assertEqual('https://');
      TestLogger.info(TAG, 'shared security helpers aligned');
      TestLogger.caseEnd(TAG, 'Browser_Security_Model_003', 1);
      TestLogger.pass(TAG, 'Browser_Security_Model_003');
    });

    it('Browser_Security_UserAgent_001', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Security_UserAgent_001');
      expect(PAD_USER_AGENT).assertContain('Mozilla/5.0');
      expect(PAD_USER_AGENT).assertContain('Chrome/92');
      expect(PHONE_USER_AGENT).assertContain('HuaweiBrowser');
      expect(PAD_USER_AGENT.indexOf('HuaweiBrowser')).assertEqual(-1);
      expect(PHONE_USER_AGENT.length).assertLess(PAD_USER_AGENT.length);
      expect(PHONE_USER_AGENT.indexOf('<')).assertEqual(-1);
      expect(PAD_USER_AGENT.indexOf('javascript')).assertEqual(-1);
      TestLogger.info(TAG, 'user agent constants free of script payload');
      TestLogger.caseEnd(TAG, 'Browser_Security_UserAgent_001', 1);
      TestLogger.pass(TAG, 'Browser_Security_UserAgent_001');
    });

    it('Browser_Security_Loading_001', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Security_Loading_001');
      let browser: MockBrowser = new MockBrowser(1);
      expect(browser.loadingStatus).assertEqual(MockLoadingStatus.END);
      browser.onPageBegin('https://www.baidu.com/');
      expect(browser.loadingStatus).assertEqual(MockLoadingStatus.LOADING);
      expect('https://www.baidu.com/'.indexOf('http')).assertEqual(0);
      expect('rawfile://pad.html'.indexOf('http')).assertEqual(-1);
      expect(UrlSchemeGuard.isAllowedScheme('rawfile://pad.html')).assertTrue();
      browser.onProgressChange(40);
      expect(browser.progress).assertEqual(40);
      expect(browser.hideProgress).assertFalse();
      browser.onProgressChange(100);
      expect(browser.progress).assertEqual(0);
      expect(browser.hideProgress).assertTrue();
      browser.onPageEnd();
      expect(browser.loadingStatus).assertEqual(MockLoadingStatus.END);
      TestLogger.info(TAG, 'loading lifecycle security state verified');
      TestLogger.caseEnd(TAG, 'Browser_Security_Loading_001', 1);
      TestLogger.pass(TAG, 'Browser_Security_Loading_001');
    });
  });
}
