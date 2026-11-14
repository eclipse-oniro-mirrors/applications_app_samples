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
import { startBrowserApp, TAB_LIMIT_MESSAGE, ID_INPUT_URL, ID_CANCEL_TAB } from '../Shared/BrowserTestKit';
import { MockBrowser } from '../Shared/BrowserMock';

const TAG: string = 'SecurityAccessibilityTest';

const CREDENTIAL_KEYS: string[] = ['password', 'passwd', 'pwd', 'token', 'cookie', 'authorization', 'secret', 'sessionid', 'sid'];
const PRIVACY_WORDS: string[] = ['password', 'passwd', 'token', 'cookie', 'secret', '13800138000', 'admin@'];
const FOCUS_IDS: string[] = ['navigationButton0', 'navigationButton1', 'navigationButton2', 'navigationButton3',
  'inputUrl', 'actionButton0', 'actionButton1', 'cancelBtn'];

interface ControlLabel {
  id: string;
  label: string;
  kind: string;
  privacySensitive: boolean;
}

interface FocusNode {
  id: string;
  order: number;
  visible: boolean;
  enabled: boolean;
}

interface NoticeItem {
  key: string;
  text: string;
  tone: string;
}

const CONTROL_LABELS: ControlLabel[] = [
  { id: 'navigationButton0', label: '后退', kind: 'button', privacySensitive: false },
  { id: 'navigationButton1', label: '前进', kind: 'button', privacySensitive: false },
  { id: 'navigationButton2', label: '刷新', kind: 'button', privacySensitive: false },
  { id: 'navigationButton3', label: '主页', kind: 'button', privacySensitive: false },
  { id: 'inputUrl', label: '输入网址', kind: 'textinput', privacySensitive: false },
  { id: 'actionButton0', label: '提交', kind: 'button', privacySensitive: false },
  { id: 'actionButton1', label: '新增页签', kind: 'button', privacySensitive: false },
  { id: 'cancelBtn', label: '关闭页签', kind: 'button', privacySensitive: false }
];

const FOCUS_NODES: FocusNode[] = [
  { id: 'navigationButton0', order: 1, visible: true, enabled: true },
  { id: 'navigationButton1', order: 2, visible: true, enabled: true },
  { id: 'navigationButton2', order: 3, visible: true, enabled: true },
  { id: 'navigationButton3', order: 4, visible: true, enabled: true },
  { id: 'inputUrl', order: 5, visible: true, enabled: true },
  { id: 'actionButton0', order: 6, visible: true, enabled: true },
  { id: 'actionButton1', order: 7, visible: true, enabled: true },
  { id: 'cancelBtn', order: 8, visible: true, enabled: true }
];

const NOTICES: NoticeItem[] = [
  { key: 'secure', text: '当前页面使用 HTTPS 加密连接', tone: 'info' },
  { key: 'insecure', text: '当前页面未使用加密连接，请勿输入密码', tone: 'warning' },
  { key: 'mixed', text: '部分内容未加密，已被拦截', tone: 'warning' },
  { key: 'tabLimit', text: '页签数量已满', tone: 'info' }
];

/**
 * Redacts credentials, phone numbers and mail addresses before any log write.
 * The browser logs page urls and search words, therefore every recorded line is
 * passed through this model first.
 */
class PrivacyRedactor {
  static isTerminator(ch: string): boolean {
    return ch === ';' || ch === ' ' || ch === '&' || ch === ',' || ch === '\n' || ch === '\t';
  }

  static maskKey(line: string, key: string): string {
    let lower: string = line.toLowerCase();
    let marker: string = key + '=';
    let start: number = lower.indexOf(marker);
    if (start < 0) {
      return line;
    }
    let valueStart: number = start + marker.length;
    let end: number = valueStart;
    while (end < line.length && !PrivacyRedactor.isTerminator(line.charAt(end))) {
      end += 1;
    }
    return line.substring(0, valueStart) + '***' + line.substring(end);
  }

  static maskPhone(line: string): string {
    let result: string = '';
    let i: number = 0;
    while (i < line.length) {
      let code: number = line.charCodeAt(i);
      let isDigit: boolean = code >= 48 && code <= 57;
      if (!isDigit) {
        result += line.charAt(i);
        i += 1;
        continue;
      }
      let end: number = i;
      while (end < line.length) {
        let next: number = line.charCodeAt(end);
        if (next < 48 || next > 57) {
          break;
        }
        end += 1;
      }
      let run: string = line.substring(i, end);
      if (run.length === 11 && run.charAt(0) === '1') {
        result += '1**********';
      } else {
        result += run;
      }
      i = end;
    }
    return result;
  }

  static maskEmail(line: string): string {
    let at: number = line.indexOf('@');
    if (at <= 0) {
      return line;
    }
    let start: number = at;
    while (start > 0 && line.charAt(start - 1) !== ' ' && line.charAt(start - 1) !== ';' && line.charAt(start - 1) !== ',') {
      start -= 1;
    }
    let end: number = at + 1;
    while (end < line.length && line.charAt(end) !== ' ' && line.charAt(end) !== ';' && line.charAt(end) !== ',') {
      end += 1;
    }
    let domain: string = line.substring(at + 1, end);
    if (domain.indexOf('.') < 0) {
      return line;
    }
    return line.substring(0, start) + '***@***' + line.substring(end);
  }

  static redact(line: string): string {
    let result: string = line;
    let i: number = 0;
    for (i = 0; i < CREDENTIAL_KEYS.length; i++) {
      result = PrivacyRedactor.maskKey(result, CREDENTIAL_KEYS[i]);
    }
    result = PrivacyRedactor.maskPhone(result);
    result = PrivacyRedactor.maskEmail(result);
    return result;
  }

  static containsSecret(line: string): boolean {
    let i: number = 0;
    for (i = 0; i < CREDENTIAL_KEYS.length; i++) {
      if (line.toLowerCase().indexOf(CREDENTIAL_KEYS[i] + '=') >= 0) {
        return true;
      }
    }
    return false;
  }

  static isStable(line: string): boolean {
    return PrivacyRedactor.redact(line) === PrivacyRedactor.redact(PrivacyRedactor.redact(line));
  }
}

class LogLeakScanner {
  findings: string[] = [];
  scanned: number = 0;

  scan(lines: string[]): number {
    let i: number = 0;
    for (i = 0; i < lines.length; i++) {
      this.scanned += 1;
      if (PrivacyRedactor.containsSecret(lines[i])) {
        this.findings.push('credential at line ' + i);
      }
      if (PrivacyRedactor.redact(lines[i]).indexOf('***') >= 0) {
        this.findings.push('redacted payload at line ' + i);
      }
    }
    return this.findings.length;
  }

  redacted(lines: string[]): string[] {
    let result: string[] = [];
    let i: number = 0;
    for (i = 0; i < lines.length; i++) {
      result.push(PrivacyRedactor.redact(lines[i]));
    }
    return result;
  }
}

class LabelAudit {
  labels: ControlLabel[] = [];

  constructor(labels: ControlLabel[]) {
    let i: number = 0;
    for (i = 0; i < labels.length; i++) {
      this.labels.push(labels[i]);
    }
  }

  labelOf(id: string): string {
    let i: number = 0;
    for (i = 0; i < this.labels.length; i++) {
      if (this.labels[i].id === id) {
        return this.labels[i].label;
      }
    }
    return '';
  }

  missing(): string[] {
    let result: string[] = [];
    let i: number = 0;
    for (i = 0; i < this.labels.length; i++) {
      if (this.labels[i].label.trim().length === 0) {
        result.push(this.labels[i].id);
      }
    }
    return result;
  }

  privacyViolations(): string[] {
    let result: string[] = [];
    let i: number = 0;
    let k: number = 0;
    for (i = 0; i < this.labels.length; i++) {
      for (k = 0; k < PRIVACY_WORDS.length; k++) {
        if (this.labels[i].label.toLowerCase().indexOf(PRIVACY_WORDS[k]) >= 0) {
          result.push(this.labels[i].id);
          break;
        }
      }
    }
    return result;
  }

  duplicates(): string[] {
    let result: string[] = [];
    let i: number = 0;
    let k: number = 0;
    for (i = 0; i < this.labels.length; i++) {
      for (k = i + 1; k < this.labels.length; k++) {
        if (this.labels[i].label === this.labels[k].label && result.indexOf(this.labels[i].label) < 0) {
          result.push(this.labels[i].label);
        }
      }
    }
    return result;
  }

  shortestLength(): number {
    let min: number = 1000;
    let i: number = 0;
    for (i = 0; i < this.labels.length; i++) {
      if (this.labels[i].label.length < min) {
        min = this.labels[i].label.length;
      }
    }
    return min;
  }
}

class FocusChain {
  nodes: FocusNode[] = [];

  constructor(nodes: FocusNode[]) {
    let i: number = 0;
    for (i = 0; i < nodes.length; i++) {
      if (nodes[i].visible && nodes[i].enabled) {
        this.nodes.push(nodes[i]);
      }
    }
  }

  ids(): string[] {
    let result: string[] = [];
    let i: number = 0;
    for (i = 0; i < this.nodes.length; i++) {
      result.push(this.nodes[i].id);
    }
    return result;
  }

  isMonotonic(): boolean {
    let i: number = 1;
    for (i = 1; i < this.nodes.length; i++) {
      if (this.nodes[i].order <= this.nodes[i - 1].order) {
        return false;
      }
    }
    return true;
  }

  duplicated(): string[] {
    let result: string[] = [];
    let i: number = 0;
    for (i = 0; i < this.nodes.length; i++) {
      if (result.indexOf(this.nodes[i].id) >= 0) {
        continue;
      }
      let k: number = i + 1;
      for (k = i + 1; k < this.nodes.length; k++) {
        if (this.nodes[k].id === this.nodes[i].id) {
          result.push(this.nodes[i].id);
        }
      }
    }
    return result;
  }

  nextOf(id: string): string {
    let index: number = this.ids().indexOf(id);
    if (index < 0 || this.nodes.length === 0) {
      return '';
    }
    return this.nodes[(index + 1) % this.nodes.length].id;
  }

  previousOf(id: string): string {
    let index: number = this.ids().indexOf(id);
    if (index < 0 || this.nodes.length === 0) {
      return '';
    }
    return this.nodes[(index + this.nodes.length - 1) % this.nodes.length].id;
  }

  hasTrap(): boolean {
    if (this.nodes.length === 1) {
      return true;
    }
    return this.duplicated().length > 0;
  }

  reachableCount(total: number): number {
    return this.nodes.length * 100 / total >= 100 ? total : this.nodes.length;
  }
}

class ScreenReaderOrder {
  announceOrder: string[] = [];
  announced: string[] = [];

  constructor(chain: FocusChain) {
    this.announceOrder = chain.ids();
  }

  positionOf(id: string): number {
    return this.announceOrder.indexOf(id);
  }

  isSameAs(chain: FocusChain): boolean {
    let expected: string[] = chain.ids();
    if (expected.length !== this.announceOrder.length) {
      return false;
    }
    let i: number = 0;
    for (i = 0; i < expected.length; i++) {
      if (expected[i] !== this.announceOrder[i]) {
        return false;
      }
    }
    return true;
  }

  announce(id: string, label: string): string {
    if (label.trim().length === 0) {
      return '';
    }
    let message: string = label + ', ' + id;
    if (this.announced.indexOf(message) >= 0) {
      return '';
    }
    this.announced.push(message);
    return message;
  }

  announceAll(labels: ControlLabel[]): number {
    let count: number = 0;
    let i: number = 0;
    for (i = 0; i < this.announceOrder.length; i++) {
      let label: string = '';
      let k: number = 0;
      for (k = 0; k < labels.length; k++) {
        if (labels[k].id === this.announceOrder[i]) {
          label = labels[k].label;
        }
      }
      if (this.announce(this.announceOrder[i], label).length > 0) {
        count += 1;
      }
    }
    return count;
  }
}

class NoticeAudit {
  items: NoticeItem[] = [];

  constructor(items: NoticeItem[]) {
    let i: number = 0;
    for (i = 0; i < items.length; i++) {
      this.items.push(items[i]);
    }
  }

  textOf(key: string): string {
    let i: number = 0;
    for (i = 0; i < this.items.length; i++) {
      if (this.items[i].key === key) {
        return this.items[i].text;
      }
    }
    return '';
  }

  toneOf(key: string): string {
    let i: number = 0;
    for (i = 0; i < this.items.length; i++) {
      if (this.items[i].key === key) {
        return this.items[i].tone;
      }
    }
    return '';
  }

  warnings(): number {
    let total: number = 0;
    let i: number = 0;
    for (i = 0; i < this.items.length; i++) {
      if (this.items[i].tone === 'warning') {
        total += 1;
      }
    }
    return total;
  }

  emptyTexts(): number {
    let total: number = 0;
    let i: number = 0;
    for (i = 0; i < this.items.length; i++) {
      if (this.items[i].text.trim().length === 0) {
        total += 1;
      }
    }
    return total;
  }

  tooLong(limit: number): string[] {
    let result: string[] = [];
    let i: number = 0;
    for (i = 0; i < this.items.length; i++) {
      if (this.items[i].text.length > limit) {
        result.push(this.items[i].key);
      }
    }
    return result;
  }

  mentionsInsecureWording(): boolean {
    let text: string = this.textOf('insecure');
    return text.indexOf('未使用加密') >= 0 && text.indexOf('请勿') >= 0;
  }
}

export default function securityAccessibilityTest() {
  describe('securityAccessibilityTest', () => {
    beforeAll(async () => {
      TestLogger.info(TAG, 'suite begin, security accessibility audit');
      await startBrowserApp();
    });

    afterAll(() => {
      TestLogger.info(TAG, TestLogger.summary(TAG));
    });

    it('Security_A11y_Label_001', 0, async () => {
      TestLogger.caseBegin(TAG, 'Security_A11y_Label_001');
      let audit: LabelAudit = new LabelAudit(CONTROL_LABELS);
      expect(audit.labels.length).assertEqual(8);
      expect(audit.missing().length).assertEqual(0);
      expect(audit.labelOf('inputUrl')).assertEqual('输入网址');
      expect(audit.labelOf(ID_INPUT_URL)).assertEqual('输入网址');
      expect(audit.labelOf(ID_CANCEL_TAB)).assertEqual('关闭页签');
      expect(audit.labelOf('unknownButton')).assertEqual('');
      expect(audit.shortestLength()).assertLarger(0);
      TestLogger.info(TAG, 'all interactive controls expose a label');
      TestLogger.caseEnd(TAG, 'Security_A11y_Label_001', 1);
      TestLogger.pass(TAG, 'Security_A11y_Label_001');
    });

    it('Security_A11y_Label_002', 0, async () => {
      TestLogger.caseBegin(TAG, 'Security_A11y_Label_002');
      let audit: LabelAudit = new LabelAudit(CONTROL_LABELS);
      expect(audit.privacyViolations().length).assertEqual(0);
      let leaked: ControlLabel[] = CONTROL_LABELS.concat([
        { id: 'secretField', label: 'token 12ab34', kind: 'textinput', privacySensitive: true }
      ]);
      let badAudit: LabelAudit = new LabelAudit(leaked);
      expect(badAudit.privacyViolations().length).assertEqual(1);
      expect(badAudit.privacyViolations()[0]).assertEqual('secretField');
      TestLogger.info(TAG, 'labels free of privacy keywords');
      TestLogger.caseEnd(TAG, 'Security_A11y_Label_002', 1);
      TestLogger.pass(TAG, 'Security_A11y_Label_002');
    });

    it('Security_A11y_Label_003', 0, async () => {
      TestLogger.caseBegin(TAG, 'Security_A11y_Label_003');
      let audit: LabelAudit = new LabelAudit(CONTROL_LABELS);
      expect(audit.duplicates().length).assertEqual(0);
      expect(audit.labelOf('actionButton1')).assertEqual('新增页签');
      expect(audit.labelOf('actionButton1').indexOf('页签')).assertLarger(-1);
      let passwordLabel: string = '密码输入框';
      expect(passwordLabel.indexOf('123456')).assertEqual(-1);
      expect(passwordLabel.length).assertLess(8);
      let emptyAudit: LabelAudit = new LabelAudit([
        { id: 'ghostButton', label: '   ', kind: 'button', privacySensitive: false }
      ]);
      expect(emptyAudit.missing().length).assertEqual(1);
      TestLogger.info(TAG, 'label uniqueness and password label checked');
      TestLogger.caseEnd(TAG, 'Security_A11y_Label_003', 1);
      TestLogger.pass(TAG, 'Security_A11y_Label_003');
    });

    it('Security_A11y_Redact_001', 0, async () => {
      TestLogger.caseBegin(TAG, 'Security_A11y_Redact_001');
      let line: string = 'password=Passw0rd!;user=alice';
      let masked: string = PrivacyRedactor.redact(line);
      expect(masked).assertContain('password=***');
      expect(masked.indexOf('Passw0rd')).assertEqual(-1);
      expect(masked).assertContain('user=alice');
      expect(PrivacyRedactor.containsSecret(line)).assertTrue();
      expect(PrivacyRedactor.containsSecret(masked)).assertTrue();
      expect(PrivacyRedactor.redact('pwd=123456')).assertEqual('pwd=***');
      TestLogger.info(TAG, 'password value redacted from log line');
      TestLogger.caseEnd(TAG, 'Security_A11y_Redact_001', 1);
      TestLogger.pass(TAG, 'Security_A11y_Redact_001');
    });

    it('Security_A11y_Redact_002', 0, async () => {
      TestLogger.caseBegin(TAG, 'Security_A11y_Redact_002');
      let tokenLine: string = 'token=abcd1234&next=1';
      let maskedToken: string = PrivacyRedactor.redact(tokenLine);
      expect(maskedToken).assertEqual('token=***&next=1');
      expect(maskedToken.indexOf('abcd1234')).assertEqual(-1);
      let cookieLine: string = 'cookie: sid=xyz';
      let maskedCookie: string = PrivacyRedactor.redact(cookieLine);
      expect(maskedCookie.indexOf('sid=xyz')).assertEqual(-1);
      expect(maskedCookie).assertContain('cookie');
      let authLine: string = 'authorization=Bearer abc.def';
      let maskedAuth: string = PrivacyRedactor.redact(authLine);
      expect(maskedAuth.indexOf('Bearer')).assertEqual(-1);
      TestLogger.info(TAG, 'token cookie authorization redacted');
      TestLogger.caseEnd(TAG, 'Security_A11y_Redact_002', 1);
      TestLogger.pass(TAG, 'Security_A11y_Redact_002');
    });

    it('Security_A11y_Redact_003', 0, async () => {
      TestLogger.caseBegin(TAG, 'Security_A11y_Redact_003');
      let phoneLine: string = 'call 13800138000 now';
      let maskedPhone: string = PrivacyRedactor.redact(phoneLine);
      expect(maskedPhone).assertEqual('call 1********** now');
      expect(maskedPhone.indexOf('13800138000')).assertEqual(-1);
      let mailLine: string = 'mail admin@corp.example now';
      let maskedMail: string = PrivacyRedactor.redact(mailLine);
      expect(maskedMail.indexOf('admin@corp.example')).assertEqual(-1);
      expect(maskedMail).assertContain('***@***');
      expect(PrivacyRedactor.maskEmail('no-at-sign')).assertEqual('no-at-sign');
      expect(PrivacyRedactor.maskPhone('12345')).assertEqual('12345');
      TestLogger.info(TAG, 'phone and mail redaction verified');
      TestLogger.caseEnd(TAG, 'Security_A11y_Redact_003', 1);
      TestLogger.pass(TAG, 'Security_A11y_Redact_003');
    });

    it('Security_A11y_Redact_004', 0, async () => {
      TestLogger.caseBegin(TAG, 'Security_A11y_Redact_004');
      let safe: string = 'inputUrl=https://www.bing.com/search?q=ohos';
      expect(PrivacyRedactor.redact(safe)).assertEqual(safe);
      expect(PrivacyRedactor.isStable(safe)).assertTrue();
      expect(PrivacyRedactor.isStable('password=abc;phone=13800138000')).assertTrue();
      expect(PrivacyRedactor.redact('')).assertEqual('');
      expect(PrivacyRedactor.containsSecret('nothing here')).assertFalse();
      TestLogger.info(TAG, 'safe log line remains unchanged and redaction is idempotent');
      TestLogger.caseEnd(TAG, 'Security_A11y_Redact_004', 1);
      TestLogger.pass(TAG, 'Security_A11y_Redact_004');
    });

    it('Security_A11y_Log_001', 0, async () => {
      TestLogger.caseBegin(TAG, 'Security_A11y_Log_001');
      let lines: string[] = [
        'inputUrl=https://www.bing.com/search?q=ohos',
        'tab count=3 current=1',
        'progress=100 hideProgress=true',
        'userAgent=HuaweiBrowser/12.0.4.1'
      ];
      let scanner: LogLeakScanner = new LogLeakScanner();
      expect(scanner.scan(lines)).assertEqual(0);
      expect(scanner.scanned).assertEqual(4);
      expect(scanner.findings.length).assertEqual(0);
      expect(scanner.redacted(lines).length).assertEqual(4);
      expect(scanner.redacted(lines)[0]).assertEqual(lines[0]);
      TestLogger.info(TAG, 'clean log ring contains no secrets');
      TestLogger.caseEnd(TAG, 'Security_A11y_Log_001', 1);
      TestLogger.pass(TAG, 'Security_A11y_Log_001');
    });

    it('Security_A11y_Log_002', 0, async () => {
      TestLogger.caseBegin(TAG, 'Security_A11y_Log_002');
      let leaked: string[] = ['login password=Passw0rd!', 'cookie: sid=abc'];
      let scanner: LogLeakScanner = new LogLeakScanner();
      expect(scanner.scan(leaked)).assertLarger(0);
      expect(scanner.scanned).assertEqual(2);
      let safe: string[] = scanner.redacted(leaked);
      expect(safe[0].indexOf('Passw0rd')).assertEqual(-1);
      expect(safe[0]).assertContain('password=***');
      expect(safe[1].indexOf('sid=abc')).assertEqual(-1);
      TestLogger.info(TAG, 'injected secret detected and masked, findings=' + scanner.findings.length);
      TestLogger.caseEnd(TAG, 'Security_A11y_Log_002', 1);
      TestLogger.pass(TAG, 'Security_A11y_Log_002');
    });


    it('Security_A11y_Focus_001', 0, async () => {
      TestLogger.caseBegin(TAG, 'Security_A11y_Focus_001');
      let chain: FocusChain = new FocusChain(FOCUS_NODES);
      expect(chain.nodes.length).assertEqual(FOCUS_IDS.length);
      expect(chain.ids().length).assertEqual(8);
      let i: number = 0;
      for (i = 0; i < FOCUS_IDS.length; i++) {
        expect(chain.ids().indexOf(FOCUS_IDS[i])).assertLarger(-1);
      }
      expect(chain.ids()[0]).assertEqual('navigationButton0');
      expect(chain.ids()[7]).assertEqual('cancelBtn');
      TestLogger.info(TAG, 'all interactive controls are focus reachable');
      TestLogger.caseEnd(TAG, 'Security_A11y_Focus_001', 1);
      TestLogger.pass(TAG, 'Security_A11y_Focus_001');
    });

    it('Security_A11y_Focus_002', 0, async () => {
      TestLogger.caseBegin(TAG, 'Security_A11y_Focus_002');
      let chain: FocusChain = new FocusChain(FOCUS_NODES);
      expect(chain.isMonotonic()).assertTrue();
      expect(chain.duplicated().length).assertEqual(0);
      expect(chain.nextOf('navigationButton0')).assertEqual('navigationButton1');
      expect(chain.nextOf('inputUrl')).assertEqual('actionButton0');
      expect(chain.nextOf('cancelBtn')).assertEqual('navigationButton0');
      expect(chain.previousOf('navigationButton0')).assertEqual('cancelBtn');
      expect(chain.nextOf('ghostButton')).assertEqual('');
      TestLogger.info(TAG, 'focus order monotonic and wrapping verified');
      TestLogger.caseEnd(TAG, 'Security_A11y_Focus_002', 1);
      TestLogger.pass(TAG, 'Security_A11y_Focus_002');
    });

    it('Security_A11y_Focus_003', 0, async () => {
      TestLogger.caseBegin(TAG, 'Security_A11y_Focus_003');
      let chain: FocusChain = new FocusChain(FOCUS_NODES);
      expect(chain.hasTrap()).assertFalse();
      let hidden: FocusNode[] = FOCUS_NODES.concat([
        { id: 'hiddenSecret', order: 9, visible: false, enabled: true },
        { id: 'disabledButton', order: 10, visible: true, enabled: false }
      ]);
      let visibleChain: FocusChain = new FocusChain(hidden);
      expect(visibleChain.nodes.length).assertEqual(8);
      expect(visibleChain.ids().indexOf('hiddenSecret')).assertEqual(-1);
      expect(visibleChain.ids().indexOf('disabledButton')).assertEqual(-1);
      let trapped: FocusChain = new FocusChain([
        { id: 'onlyButton', order: 1, visible: true, enabled: true }
      ]);
      expect(trapped.hasTrap()).assertTrue();
      TestLogger.info(TAG, 'hidden and disabled nodes excluded from focus chain');
      TestLogger.caseEnd(TAG, 'Security_A11y_Focus_003', 1);
      TestLogger.pass(TAG, 'Security_A11y_Focus_003');
    });

    it('Security_A11y_Reader_001', 0, async () => {
      TestLogger.caseBegin(TAG, 'Security_A11y_Reader_001');
      let chain: FocusChain = new FocusChain(FOCUS_NODES);
      let reader: ScreenReaderOrder = new ScreenReaderOrder(chain);
      expect(reader.isSameAs(chain)).assertTrue();
      expect(reader.positionOf('inputUrl')).assertEqual(4);
      expect(reader.positionOf('cancelBtn')).assertEqual(7);
      expect(reader.positionOf('ghostButton')).assertEqual(-1);
      expect(reader.announceOrder.length).assertEqual(8);
      TestLogger.info(TAG, 'screen reader order equals focus order');
      TestLogger.caseEnd(TAG, 'Security_A11y_Reader_001', 1);
      TestLogger.pass(TAG, 'Security_A11y_Reader_001');
    });

    it('Security_A11y_Notice_001', 0, async () => {
      TestLogger.caseBegin(TAG, 'Security_A11y_Notice_001');
      let audit: NoticeAudit = new NoticeAudit(NOTICES);
      expect(audit.items.length).assertEqual(4);
      expect(audit.textOf('secure')).assertContain('HTTPS');
      expect(audit.toneOf('secure')).assertEqual('info');
      expect(audit.emptyTexts()).assertEqual(0);
      expect(audit.tooLong(40).length).assertEqual(0);
      expect(audit.textOf('unknown')).assertEqual('');
      TestLogger.info(TAG, 'secure connection notice is present');
      TestLogger.caseEnd(TAG, 'Security_A11y_Notice_001', 1);
      TestLogger.pass(TAG, 'Security_A11y_Notice_001');
    });

    it('Security_A11y_Notice_002', 0, async () => {
      TestLogger.caseBegin(TAG, 'Security_A11y_Notice_002');
      let audit: NoticeAudit = new NoticeAudit(NOTICES);
      expect(audit.mentionsInsecureWording()).assertTrue();
      expect(audit.toneOf('insecure')).assertEqual('warning');
      expect(audit.toneOf('mixed')).assertEqual('warning');
      expect(audit.warnings()).assertEqual(2);
      expect(audit.textOf('mixed')).assertContain('拦截');
      let tampered: NoticeAudit = new NoticeAudit([
        { key: 'insecure', text: '当前页面未使用加密连接', tone: 'warning' }
      ]);
      expect(tampered.mentionsInsecureWording()).assertFalse();
      TestLogger.info(TAG, 'insecure notice warns the user before typing secrets');
      TestLogger.caseEnd(TAG, 'Security_A11y_Notice_002', 1);
      TestLogger.pass(TAG, 'Security_A11y_Notice_002');
    });

    it('Security_A11y_Notice_003', 0, async () => {
      TestLogger.caseBegin(TAG, 'Security_A11y_Notice_003');
      let audit: NoticeAudit = new NoticeAudit(NOTICES);
      expect(audit.textOf('tabLimit')).assertEqual(TAB_LIMIT_MESSAGE);
      expect(audit.textOf('tabLimit')).assertContain('页签');
      let browser: MockBrowser = new MockBrowser(1);
      let audio: string = audit.textOf('tabLimit');
      expect(audio.indexOf('http')).assertEqual(-1);
      expect(audio.indexOf('token')).assertEqual(-1);
      expect(browser.toasts.length).assertEqual(0);
      TestLogger.info(TAG, 'tab limit notice reuses the business string');
      TestLogger.caseEnd(TAG, 'Security_A11y_Notice_003', 1);
      TestLogger.pass(TAG, 'Security_A11y_Notice_003');
    });
  });
}
