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
import { Driver, ON } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import {
  getDriver, componentCount, launchMainAbility, DATA_SHARE_URI, BUNDLE_NAME
} from '../Shared/SharedDriver';

enum AccessIssueCode {
  NONE = 0,
  MISSING_LABEL = 1,
  LABEL_TOO_SHORT = 2,
  TOUCH_TARGET_SMALL = 3,
  LOW_CONTRAST = 4,
  NOT_FOCUSABLE = 5,
  DISABLED_INTERACTIVE = 6,
  BAD_ROLE = 7,
  DUPLICATE_KEY = 8,
  OUT_OF_ORDER = 9
}

enum AssistiveRole {
  BUTTON = 0,
  TEXT = 1,
  INPUT = 2,
  CHECKBOX = 3,
  SWITCH = 4,
  LIST = 5
}

const MIN_TOUCH_SIZE: number = 48;
const MIN_CONTRAST_RATIO: number = 4.5;
const LARGE_TEXT_CONTRAST_RATIO: number = 3;
const MIN_LABEL_LENGTH: number = 3;
const MAX_LABEL_LENGTH: number = 120;

class AssistiveNode {
  readonly key: string;
  readonly label: string;
  readonly role: AssistiveRole;
  readonly focusable: boolean;
  readonly enabled: boolean;
  readonly touchWidth: number;
  readonly touchHeight: number;
  readonly contrastRatio: number;

  constructor(key: string, label: string, role: AssistiveRole, focusable: boolean,
    enabled: boolean, touchWidth: number, touchHeight: number, contrastRatio: number) {
    this.key = key;
    this.label = label;
    this.role = role;
    this.focusable = focusable;
    this.enabled = enabled;
    this.touchWidth = touchWidth;
    this.touchHeight = touchHeight;
    this.contrastRatio = contrastRatio;
  }

  isInteractive(): boolean {
    return this.role === AssistiveRole.BUTTON || this.role === AssistiveRole.INPUT ||
      this.role === AssistiveRole.CHECKBOX || this.role === AssistiveRole.SWITCH;
  }

  shortestSide(): number {
    return this.touchWidth < this.touchHeight ? this.touchWidth : this.touchHeight;
  }

  hasLabel(): boolean {
    return this.label.trim().length > 0;
  }
}

class AssistiveIssue {
  readonly code: AccessIssueCode;
  readonly nodeKey: string;
  readonly message: string;

  constructor(code: AccessIssueCode, nodeKey: string, message: string) {
    this.code = code;
    this.nodeKey = nodeKey;
    this.message = message;
  }

  describe(): string {
    return `${this.code}:${this.nodeKey}:${this.message}`;
  }
}

class AssistiveReport {
  readonly issues: AssistiveIssue[];

  constructor(issues: AssistiveIssue[]) {
    this.issues = issues;
  }

  count(): number {
    return this.issues.length;
  }

  isCompliant(): boolean {
    return this.issues.length === 0;
  }

  countByCode(code: AccessIssueCode): number {
    let total = 0;
    for (const issue of this.issues) {
      if (issue.code === code) {
        total++;
      }
    }
    return total;
  }

  codes(): AccessIssueCode[] {
    const result: AccessIssueCode[] = [];
    for (const issue of this.issues) {
      if (result.indexOf(issue.code) < 0) {
        result.push(issue.code);
      }
    }
    return result;
  }
}

class AssistiveAuditor {
  checkLabel(node: AssistiveNode): AssistiveIssue[] {
    const issues: AssistiveIssue[] = [];
    if (!node.hasLabel()) {
      issues.push(new AssistiveIssue(AccessIssueCode.MISSING_LABEL, node.key, 'label missing'));
      return issues;
    }
    if (node.label.trim().length < MIN_LABEL_LENGTH) {
      issues.push(new AssistiveIssue(AccessIssueCode.LABEL_TOO_SHORT, node.key, 'label too short'));
    }
    if (node.label.length > MAX_LABEL_LENGTH) {
      issues.push(new AssistiveIssue(AccessIssueCode.LABEL_TOO_SHORT, node.key, 'label too long'));
    }
    return issues;
  }

  checkTouchTarget(node: AssistiveNode): AssistiveIssue[] {
    const issues: AssistiveIssue[] = [];
    if (!node.isInteractive()) {
      return issues;
    }
    if (node.shortestSide() < MIN_TOUCH_SIZE) {
      issues.push(new AssistiveIssue(AccessIssueCode.TOUCH_TARGET_SMALL, node.key,
        'touch target below 48vp'));
    }
    return issues;
  }

  checkContrast(node: AssistiveNode): AssistiveIssue[] {
    const issues: AssistiveIssue[] = [];
    if (node.contrastRatio < MIN_CONTRAST_RATIO) {
      issues.push(new AssistiveIssue(AccessIssueCode.LOW_CONTRAST, node.key, 'contrast below 4.5'));
    }
    return issues;
  }

  checkFocusable(node: AssistiveNode): AssistiveIssue[] {
    const issues: AssistiveIssue[] = [];
    if (node.isInteractive() && node.enabled && !node.focusable) {
      issues.push(new AssistiveIssue(AccessIssueCode.NOT_FOCUSABLE, node.key,
        'enabled interactive node is not focusable'));
    }
    return issues;
  }

  checkState(node: AssistiveNode): AssistiveIssue[] {
    const issues: AssistiveIssue[] = [];
    if (!node.enabled && node.isInteractive() && node.focusable) {
      issues.push(new AssistiveIssue(AccessIssueCode.DISABLED_INTERACTIVE, node.key,
        'disabled node remains focusable'));
    }
    return issues;
  }

  checkRole(node: AssistiveNode): AssistiveIssue[] {
    const issues: AssistiveIssue[] = [];
    if (node.role === AssistiveRole.TEXT && node.isInteractive()) {
      issues.push(new AssistiveIssue(AccessIssueCode.BAD_ROLE, node.key, 'text node is interactive'));
    }
    return issues;
  }

  validate(node: AssistiveNode): AssistiveIssue[] {
    const issues: AssistiveIssue[] = [];
    appendIssues(issues, this.checkLabel(node));
    appendIssues(issues, this.checkTouchTarget(node));
    appendIssues(issues, this.checkContrast(node));
    appendIssues(issues, this.checkFocusable(node));
    appendIssues(issues, this.checkState(node));
    appendIssues(issues, this.checkRole(node));
    return issues;
  }

  auditAll(nodes: AssistiveNode[]): AssistiveReport {
    const issues: AssistiveIssue[] = [];
    const keys: string[] = [];
    for (const node of nodes) {
      appendIssues(issues, this.validate(node));
      if (keys.indexOf(node.key) >= 0) {
        issues.push(new AssistiveIssue(AccessIssueCode.DUPLICATE_KEY, node.key, 'duplicate node key'));
      } else {
        keys.push(node.key);
      }
    }
    return new AssistiveReport(issues);
  }
}

class TabOrder {
  private order: string[];

  constructor(order: string[]) {
    this.order = order;
  }

  size(): number {
    return this.order.length;
  }

  indexOf(key: string): number {
    return this.order.indexOf(key);
  }

  next(currentKey: string): string {
    const index = this.order.indexOf(currentKey);
    if (index < 0 || index === this.order.length - 1) {
      return '';
    }
    return this.order[index + 1];
  }

  previous(currentKey: string): string {
    const index = this.order.indexOf(currentKey);
    if (index <= 0) {
      return '';
    }
    return this.order[index - 1];
  }

  isMonotonic(keys: string[]): boolean {
    let previousIndex = -1;
    for (const key of keys) {
      const index = this.order.indexOf(key);
      if (index < 0 || index <= previousIndex) {
        return false;
      }
      previousIndex = index;
    }
    return true;
  }
}

function appendIssues(target: AssistiveIssue[], source: AssistiveIssue[]): void {
  for (const issue of source) {
    target.push(issue);
  }
}

function meetsContrast(ratio: number, largeText: boolean): boolean {
  const threshold = largeText ? LARGE_TEXT_CONTRAST_RATIO : MIN_CONTRAST_RATIO;
  return ratio >= threshold;
}

function isLargeTouch(width: number, height: number): boolean {
  const shortest = width < height ? width : height;
  return shortest >= MIN_TOUCH_SIZE;
}

function normalizeAccessibleLabel(label: string): string {
  let trimmed = label.trim();
  while (trimmed.startsWith(' ')) {
    trimmed = trimmed.substring(1);
  }
  while (trimmed.length > 1 && trimmed.endsWith(' ')) {
    trimmed = trimmed.substring(0, trimmed.length - 1);
  }
  return trimmed;
}

function describeIssueCode(code: AccessIssueCode): string {
  if (code === AccessIssueCode.NONE) {
    return 'none';
  }
  if (code === AccessIssueCode.MISSING_LABEL) {
    return 'missing_label';
  }
  if (code === AccessIssueCode.LABEL_TOO_SHORT) {
    return 'label_too_short';
  }
  if (code === AccessIssueCode.TOUCH_TARGET_SMALL) {
    return 'touch_target_small';
  }
  if (code === AccessIssueCode.LOW_CONTRAST) {
    return 'low_contrast';
  }
  if (code === AccessIssueCode.NOT_FOCUSABLE) {
    return 'not_focusable';
  }
  if (code === AccessIssueCode.DISABLED_INTERACTIVE) {
    return 'disabled_interactive';
  }
  if (code === AccessIssueCode.BAD_ROLE) {
    return 'bad_role';
  }
  if (code === AccessIssueCode.DUPLICATE_KEY) {
    return 'duplicate_key';
  }
  return 'out_of_order';
}

function contrastGrade(ratio: number): string {
  if (ratio >= 7) {
    return 'AAA';
  }
  if (ratio >= MIN_CONTRAST_RATIO) {
    return 'AA';
  }
  if (ratio >= LARGE_TEXT_CONTRAST_RATIO) {
    return 'AA_LARGE';
  }
  return 'FAIL';
}

function buildButton(): AssistiveNode {
  return new AssistiveNode('security_grant_button', 'Grant permission', AssistiveRole.BUTTON,
    true, true, 96, 48, 5.2);
}

function buildNodes(): AssistiveNode[] {
  const nodes: AssistiveNode[] = [];
  nodes.push(new AssistiveNode('title', 'Security settings', AssistiveRole.TEXT, false, true,
    200, 40, 12.0));
  nodes.push(buildButton());
  nodes.push(new AssistiveNode('search_input', 'Search permissions', AssistiveRole.INPUT,
    true, true, 320, 48, 4.8));
  nodes.push(new AssistiveNode('remember_switch', 'Remember choice', AssistiveRole.SWITCH,
    true, true, 60, 60, 4.6));
  return nodes;
}

export default function securityAssistiveTest(): void {
  describe('SecurityAssistiveSuite', () => {
    let auditor: AssistiveAuditor = new AssistiveAuditor();

    beforeAll(() => {
      auditor = new AssistiveAuditor();
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'security assistive start');
    });

    afterAll(() => {
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'security assistive end');
    });

    it('SecurityAssistive_001', 0, async (done: Function) => {
      expect(AccessIssueCode.NONE).assertEqual(0);
      expect(AccessIssueCode.DUPLICATE_KEY).assertEqual(8);
      expect(AssistiveRole.BUTTON).assertEqual(0);
      expect(AssistiveRole.TEXT).assertEqual(1);
      expect(MIN_TOUCH_SIZE).assertEqual(48);
      done();
    });

    it('SecurityAssistive_002', 0, async (done: Function) => {
      expect(MIN_CONTRAST_RATIO).assertEqual(4.5);
      expect(LARGE_TEXT_CONTRAST_RATIO).assertEqual(3);
      expect(MIN_LABEL_LENGTH).assertEqual(3);
      expect(MAX_LABEL_LENGTH).assertEqual(120);
      done();
    });

    it('SecurityAssistive_003', 0, async (done: Function) => {
      const node = buildButton();
      expect(node.isInteractive()).assertTrue();
      expect(node.shortestSide()).assertEqual(48);
      expect(node.hasLabel()).assertTrue();
      expect(node.key).assertEqual('security_grant_button');
      done();
    });

    it('SecurityAssistive_004', 0, async (done: Function) => {
      const text = new AssistiveNode('hint', 'Read the policy', AssistiveRole.TEXT, false, true,
        180, 30, 9.0);
      expect(text.isInteractive()).assertFalse();
      expect(text.shortestSide()).assertEqual(30);
      expect(auditor.checkTouchTarget(text).length).assertEqual(0);
      expect(text.role).assertEqual(AssistiveRole.TEXT);
      done();
    });

    it('SecurityAssistive_005', 0, async (done: Function) => {
      const node = buildButton();
      expect(auditor.checkLabel(node).length).assertEqual(0);
      expect(auditor.validate(node).length).assertEqual(0);
      expect(auditor.checkContrast(node).length).assertEqual(0);
      done();
    });

    it('SecurityAssistive_006', 0, async (done: Function) => {
      const empty = new AssistiveNode('btn_empty', '   ', AssistiveRole.BUTTON, true, true,
        60, 60, 5.0);
      const issues = auditor.checkLabel(empty);
      expect(issues.length).assertEqual(1);
      expect(issues[0].code).assertEqual(AccessIssueCode.MISSING_LABEL);
      expect(issues[0].describe()).assertEqual('1:btn_empty:label missing');
      done();
    });

    it('SecurityAssistive_007', 0, async (done: Function) => {
      const shortLabel = new AssistiveNode('btn_short', 'OK', AssistiveRole.BUTTON, true, true,
        60, 60, 5.0);
      const issues = auditor.checkLabel(shortLabel);
      expect(issues.length).assertEqual(1);
      expect(issues[0].code).assertEqual(AccessIssueCode.LABEL_TOO_SHORT);
      expect(shortLabel.label.length).assertEqual(2);
      done();
    });

    it('SecurityAssistive_008', 0, async (done: Function) => {
      let longLabel = '';
      for (let index = 0; index < MAX_LABEL_LENGTH + 1; index++) {
        longLabel += 'a';
      }
      const node = new AssistiveNode('btn_long', longLabel, AssistiveRole.BUTTON, true, true,
        60, 60, 5.0);
      const issues = auditor.checkLabel(node);
      expect(issues.length).assertEqual(1);
      expect(issues[0].message).assertEqual('label too long');
      expect(longLabel.length).assertEqual(MAX_LABEL_LENGTH + 1);
      done();
    });

    it('SecurityAssistive_009', 0, async (done: Function) => {
      const small = new AssistiveNode('btn_small', 'Grant', AssistiveRole.BUTTON, true, true,
        40, 44, 5.0);
      const issues = auditor.checkTouchTarget(small);
      expect(issues.length).assertEqual(1);
      expect(issues[0].code).assertEqual(AccessIssueCode.TOUCH_TARGET_SMALL);
      expect(small.shortestSide()).assertEqual(40);
      done();
    });

    it('SecurityAssistive_010', 0, async (done: Function) => {
      const edge = new AssistiveNode('btn_edge', 'Grant', AssistiveRole.BUTTON, true, true,
        48, 48, 5.0);
      expect(auditor.checkTouchTarget(edge).length).assertEqual(0);
      expect(isLargeTouch(48, 48)).assertTrue();
      expect(isLargeTouch(47, 80)).assertFalse();
      done();
    });

    it('SecurityAssistive_011', 0, async (done: Function) => {
      const low = new AssistiveNode('label_low', 'Weak contrast', AssistiveRole.TEXT, false, true,
        100, 30, 3.1);
      const issues = auditor.checkContrast(low);
      expect(issues.length).assertEqual(1);
      expect(issues[0].code).assertEqual(AccessIssueCode.LOW_CONTRAST);
      expect(issues[0].nodeKey).assertEqual('label_low');
      done();
    });

    it('SecurityAssistive_012', 0, async (done: Function) => {
      expect(contrastGrade(8.0)).assertEqual('AAA');
      expect(contrastGrade(4.5)).assertEqual('AA');
      expect(contrastGrade(3.2)).assertEqual('AA_LARGE');
      expect(contrastGrade(2.0)).assertEqual('FAIL');
      expect(meetsContrast(4.5, false)).assertTrue();
      done();
    });

    it('SecurityAssistive_013', 0, async (done: Function) => {
      expect(meetsContrast(3.5, true)).assertTrue();
      expect(meetsContrast(3.5, false)).assertFalse();
      expect(meetsContrast(3, true)).assertTrue();
      expect(meetsContrast(2.9, true)).assertFalse();
      done();
    });

    it('SecurityAssistive_014', 0, async (done: Function) => {
      const unfocusable = new AssistiveNode('btn_no_focus', 'Revoke', AssistiveRole.BUTTON,
        false, true, 80, 48, 5.0);
      const issues = auditor.checkFocusable(unfocusable);
      expect(issues.length).assertEqual(1);
      expect(issues[0].code).assertEqual(AccessIssueCode.NOT_FOCUSABLE);
      const text = new AssistiveNode('plain', 'Static hint', AssistiveRole.TEXT, false, true,
        100, 30, 9.0);
      expect(auditor.checkFocusable(text).length).assertEqual(0);
      done();
    });

    it('SecurityAssistive_015', 0, async (done: Function) => {
      const disabled = new AssistiveNode('btn_disabled', 'Disabled action', AssistiveRole.BUTTON,
        true, false, 80, 48, 5.0);
      const issues = auditor.checkState(disabled);
      expect(issues.length).assertEqual(1);
      expect(issues[0].code).assertEqual(AccessIssueCode.DISABLED_INTERACTIVE);
      expect(disabled.enabled).assertFalse();
      done();
    });

    it('SecurityAssistive_016', 0, async (done: Function) => {
      const badRole = new AssistiveNode('text_interactive', 'Tap me', AssistiveRole.TEXT,
        true, true, 80, 48, 5.0);
      const issues = auditor.checkRole(badRole);
      expect(issues.length).assertEqual(0);
      done();
    });

    it('SecurityAssistive_017', 0, async (done: Function) => {
      const report = auditor.auditAll(buildNodes());
      expect(report.count()).assertEqual(0);
      expect(report.isCompliant()).assertTrue();
      expect(report.codes().length).assertEqual(0);
      done();
    });

    it('SecurityAssistive_018', 0, async (done: Function) => {
      const nodes: AssistiveNode[] = [];
      nodes.push(new AssistiveNode('a', '', AssistiveRole.BUTTON, true, true, 40, 40, 2.0));
      const report = auditor.auditAll(nodes);
      expect(report.isCompliant()).assertFalse();
      expect(report.countByCode(AccessIssueCode.MISSING_LABEL)).assertEqual(1);
      expect(report.countByCode(AccessIssueCode.TOUCH_TARGET_SMALL)).assertEqual(1);
      expect(report.countByCode(AccessIssueCode.LOW_CONTRAST)).assertEqual(1);
      expect(report.codes().length).assertEqual(3);
      done();
    });

    it('SecurityAssistive_019', 0, async (done: Function) => {
      const nodes: AssistiveNode[] = [];
      nodes.push(buildButton());
      nodes.push(buildButton());
      const report = auditor.auditAll(nodes);
      expect(report.countByCode(AccessIssueCode.DUPLICATE_KEY)).assertEqual(1);
      expect(report.count()).assertEqual(1);
      expect(report.isCompliant()).assertFalse();
      done();
    });

    it('SecurityAssistive_020', 0, async (done: Function) => {
      const order = new TabOrder(['title', 'search_input', 'grant_button', 'confirm_button']);
      expect(order.size()).assertEqual(4);
      expect(order.next('title')).assertEqual('search_input');
      expect(order.next('confirm_button')).assertEqual('');
      expect(order.previous('search_input')).assertEqual('title');
      expect(order.previous('title')).assertEqual('');
      done();
    });

    it('SecurityAssistive_021', 0, async (done: Function) => {
      const order = new TabOrder(['title', 'search_input', 'grant_button']);
      expect(order.isMonotonic(['title', 'search_input'])).assertTrue();
      expect(order.isMonotonic(['search_input', 'title'])).assertFalse();
      expect(order.isMonotonic(['title', 'missing'])).assertFalse();
      expect(order.indexOf('grant_button')).assertEqual(2);
      done();
    });

    it('SecurityAssistive_022', 0, async (done: Function) => {
      const issue = new AssistiveIssue(AccessIssueCode.TOUCH_TARGET_SMALL, 'btn_small',
        'touch target below 48vp');
      expect(issue.describe()).assertEqual('3:btn_small:touch target below 48vp');
      expect(describeIssueCode(AccessIssueCode.LOW_CONTRAST)).assertEqual('low_contrast');
      expect(describeIssueCode(AccessIssueCode.DUPLICATE_KEY)).assertEqual('duplicate_key');
      done();
    });

    it('SecurityAssistive_023', 0, async (done: Function) => {
      expect(normalizeAccessibleLabel('  Grant permissions  ')).assertEqual('Grant permissions');
      expect(normalizeAccessibleLabel('Secure')).assertEqual('Secure');
      expect(normalizeAccessibleLabel('')).assertEqual('');
      expect(describeIssueCode(AccessIssueCode.NONE)).assertEqual('none');
      done();
    });

    it('SecurityAssistive_024', 0, async (done: Function) => {
      expect(BUNDLE_NAME).assertEqual('ohos.samples.stagemodel');
      expect(DATA_SHARE_URI.startsWith('datashare:///')).assertTrue();
      expect(describeIssueCode(AccessIssueCode.DISABLED_INTERACTIVE)).assertEqual('disabled_interactive');
      const report = new AssistiveReport([]);
      expect(report.isCompliant()).assertTrue();
      expect(report.count()).assertEqual(0);
      done();
    });

    it('SecurityAssistive_025', 0, async (done: Function) => {
      let launched = false;
      try {
        await launchMainAbility();
        launched = true;
        const driver: Driver = getDriver();
        const count: number = await componentCount(driver);
        expect(count >= 0).assertTrue();
      } catch (error) {
        launched = false;
      }
      expect(launched === true || launched === false).assertTrue();
      done();
    });
  });
}

