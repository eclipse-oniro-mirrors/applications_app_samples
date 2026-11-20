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

const ROLE_BUTTON: string = 'button';

const ROLE_TEXT: string = 'text';

const ROLE_LIST: string = 'list';

const ROLE_IMAGE: string = 'image';

const MAX_NODES: number = 32;

const MAX_LABEL_LENGTH: number = 128;

interface A11yNode {
  id: string;
  label: string;
  role: string;
  focusable: boolean;
  order: number;
}

// Validates a11y metadata before focus traversal
class A11yValidator {
  public static isRoleValid(role: string): boolean {
    return role === ROLE_BUTTON || role === ROLE_TEXT ||
      role === ROLE_LIST || role === ROLE_IMAGE;
  }

  public static isLabelValid(label: string): boolean {
    return label.length > 0 && label.length <= MAX_LABEL_LENGTH;
  }

  public static isNodeValid(node: A11yNode): boolean {
    return node.id.length > 0 && A11yValidator.isRoleValid(node.role) &&
      A11yValidator.isLabelValid(node.label) && node.order >= 0;
  }

  public static requiresLabel(role: string): boolean {
    return role === ROLE_BUTTON || role === ROLE_LIST || role === ROLE_IMAGE;
  }
}

// Traverses a11y focus in declared order
class A11yFocusManager {
  private nodes: A11yNode[] = [];
  private current: number = -1;

  public add(node: A11yNode): boolean {
    if (!A11yValidator.isNodeValid(node) || this.has(node.id) || this.nodes.length >= MAX_NODES) {
      return false;
    }
    this.nodes.push({
      id: node.id,
      label: node.label,
      role: node.role,
      focusable: node.focusable,
      order: node.order
    });
    return true;
  }

  public has(id: string): boolean {
    return this.nodes.some((node: A11yNode) => node.id === id);
  }

  private sorted(): A11yNode[] {
    return [...this.nodes].sort((left: A11yNode, right: A11yNode) => left.order - right.order);
  }

  public next(): string {
    const ordered = this.sorted();
    if (ordered.length === 0) {
      return '';
    }
    const start = this.current < 0 ? 0 : this.current + 1;
    for (let step = 0; step < ordered.length; step++) {
      const index = (start + step) % ordered.length;
      if (ordered[index].focusable) {
        this.current = index;
        return ordered[index].id;
      }
    }
    return '';
  }

  public previous(): string {
    const ordered = this.sorted();
    if (ordered.length === 0) {
      return '';
    }
    const start = this.current < 0 ? ordered.length - 1 : this.current - 1;
    for (let step = 0; step < ordered.length; step++) {
      const index = (start - step + ordered.length) % ordered.length;
      if (ordered[index].focusable) {
        this.current = index;
        return ordered[index].id;
      }
    }
    return '';
  }

  public focus(id: string): boolean {
    const ordered = this.sorted();
    for (let i = 0; i < ordered.length; i++) {
      if (ordered[i].id === id && ordered[i].focusable) {
        this.current = i;
        return true;
      }
    }
    return false;
  }

  public currentLabel(): string {
    const ordered = this.sorted();
    return this.current < 0 || this.current >= ordered.length ? '' : ordered[this.current].label;
  }

  public currentId(): string {
    const ordered = this.sorted();
    return this.current < 0 || this.current >= ordered.length ? '' : ordered[this.current].id;
  }

  public size(): number {
    return this.nodes.length;
  }

  public focusableCount(): number {
    return this.nodes.filter((node: A11yNode) => node.focusable).length;
  }

  public clear(): void {
    this.nodes = [];
    this.current = -1;
  }
}

// Records screen-reader announcements during traversal
class A11yAnnouncer {
  private announcements: string[] = [];
  private readonly capacity: number;

  constructor(capacity: number) {
    this.capacity = capacity;
  }

  public announce(label: string): boolean {
    if (label.length === 0 || this.capacity <= 0) {
      return false;
    }
    if (this.announcements.length >= this.capacity) {
      this.announcements.shift();
    }
    this.announcements.push(label);
    return true;
  }

  public count(): number {
    return this.announcements.length;
  }

  public latest(): string {
    return this.announcements.length === 0 ? '' : this.announcements[this.announcements.length - 1];
  }

  public contains(label: string): boolean {
    return this.announcements.includes(label);
  }

  public clear(): void {
    this.announcements = [];
  }
}

// Aggregates a11y checks
class A11yReport {
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

export default function a11yFocusTestingTest() {
  describe('A11yFocusTesting_Test', () => {

    it('validator_should_check_roles', 0, () => {
      expect(A11yValidator.isRoleValid(ROLE_BUTTON)).assertTrue();
      expect(A11yValidator.isRoleValid(ROLE_TEXT)).assertTrue();
      expect(A11yValidator.isRoleValid(ROLE_LIST)).assertTrue();
      expect(A11yValidator.isRoleValid(ROLE_IMAGE)).assertTrue();
      expect(A11yValidator.isRoleValid('slider')).assertFalse();
      expect(A11yValidator.requiresLabel(ROLE_BUTTON)).assertTrue();
      expect(A11yValidator.requiresLabel(ROLE_TEXT)).assertFalse();
    });

    it('validator_should_check_labels', 0, () => {
      expect(A11yValidator.isLabelValid('create issue')).assertTrue();
      expect(A11yValidator.isLabelValid('')).assertFalse();
      expect(A11yValidator.isLabelValid('a'.repeat(MAX_LABEL_LENGTH))).assertTrue();
      expect(A11yValidator.isLabelValid('a'.repeat(MAX_LABEL_LENGTH + 1))).assertFalse();
    });

    it('validator_should_check_nodes', 0, () => {
      expect(A11yValidator.isNodeValid({
        id: 'n1', label: 'create', role: ROLE_BUTTON, focusable: true, order: 0
      })).assertTrue();
      expect(A11yValidator.isNodeValid({
        id: '', label: 'create', role: ROLE_BUTTON, focusable: true, order: 0
      })).assertFalse();
      expect(A11yValidator.isNodeValid({
        id: 'n1', label: '', role: ROLE_BUTTON, focusable: true, order: 0
      })).assertFalse();
      expect(A11yValidator.isNodeValid({
        id: 'n1', label: 'x', role: 'slider', focusable: true, order: 0
      })).assertFalse();
    });

    it('manager_should_add_nodes', 0, () => {
      const manager = new A11yFocusManager();
      expect(manager.add({
        id: 'n1', label: 'create', role: ROLE_BUTTON, focusable: true, order: 1
      })).assertTrue();
      expect(manager.add({
        id: 'n1', label: 'duplicate', role: ROLE_BUTTON, focusable: true, order: 2
      })).assertFalse();
      expect(manager.size()).assertEqual(1);
      expect(manager.has('n1')).assertTrue();
      expect(manager.has('n2')).assertFalse();
    });

    it('manager_should_traverse_forward', 0, () => {
      const manager = new A11yFocusManager();
      manager.add({ id: 'a', label: 'a', role: ROLE_BUTTON, focusable: true, order: 1 });
      manager.add({ id: 'b', label: 'b', role: ROLE_TEXT, focusable: false, order: 2 });
      manager.add({ id: 'c', label: 'c', role: ROLE_BUTTON, focusable: true, order: 3 });
      expect(manager.focusableCount()).assertEqual(2);
      expect(manager.next()).assertEqual('a');
      expect(manager.next()).assertEqual('c');
      expect(manager.next()).assertEqual('a');
      expect(manager.currentId()).assertEqual('a');
      expect(manager.currentLabel()).assertEqual('a');
    });

    it('manager_should_traverse_backward', 0, () => {
      const manager = new A11yFocusManager();
      manager.add({ id: 'a', label: 'a', role: ROLE_BUTTON, focusable: true, order: 1 });
      manager.add({ id: 'c', label: 'c', role: ROLE_BUTTON, focusable: true, order: 3 });
      expect(manager.previous()).assertEqual('c');
      expect(manager.previous()).assertEqual('a');
      expect(manager.previous()).assertEqual('c');
    });

    it('manager_should_focus_by_id', 0, () => {
      const manager = new A11yFocusManager();
      manager.add({ id: 'a', label: 'a', role: ROLE_BUTTON, focusable: true, order: 1 });
      manager.add({ id: 'b', label: 'b', role: ROLE_TEXT, focusable: false, order: 2 });
      expect(manager.focus('a')).assertTrue();
      expect(manager.currentId()).assertEqual('a');
      expect(manager.focus('b')).assertFalse();
      expect(manager.focus('missing')).assertFalse();
      expect(manager.currentId()).assertEqual('a');
    });

    it('manager_should_handle_empty', 0, () => {
      const manager = new A11yFocusManager();
      expect(manager.next()).assertEqual('');
      expect(manager.previous()).assertEqual('');
      expect(manager.currentId()).assertEqual('');
      expect(manager.currentLabel()).assertEqual('');
      expect(manager.focusableCount()).assertEqual(0);
      manager.clear();
      expect(manager.size()).assertEqual(0);
    });

    it('manager_should_respect_order', 0, () => {
      const manager = new A11yFocusManager();
      manager.add({ id: 'third', label: 'third', role: ROLE_BUTTON, focusable: true, order: 30 });
      manager.add({ id: 'first', label: 'first', role: ROLE_BUTTON, focusable: true, order: 10 });
      manager.add({ id: 'second', label: 'second', role: ROLE_BUTTON, focusable: true, order: 20 });
      expect(manager.next()).assertEqual('first');
      expect(manager.next()).assertEqual('second');
      expect(manager.next()).assertEqual('third');
    });

    it('announcer_should_track_labels', 0, () => {
      const announcer = new A11yAnnouncer(3);
      expect(announcer.announce('create issue')).assertTrue();
      expect(announcer.announce('')).assertFalse();
      announcer.announce('list of issues');
      expect(announcer.count()).assertEqual(2);
      expect(announcer.latest()).assertEqual('list of issues');
      expect(announcer.contains('create issue')).assertTrue();
      expect(announcer.contains('missing')).assertFalse();
      announcer.clear();
      expect(announcer.count()).assertEqual(0);
    });

    it('announcer_should_be_bounded', 0, () => {
      const announcer = new A11yAnnouncer(2);
      announcer.announce('a');
      announcer.announce('b');
      announcer.announce('c');
      expect(announcer.count()).assertEqual(2);
      expect(announcer.contains('a')).assertFalse();
      expect(announcer.latest()).assertEqual('c');
      const zero = new A11yAnnouncer(0);
      expect(zero.announce('a')).assertFalse();
    });

    it('report_should_aggregate_checks', 0, () => {
      const report = new A11yReport();
      report.check('labels', true);
      report.check('traversal', true);
      expect(report.count()).assertEqual(2);
      expect(report.isPassed()).assertTrue();
      report.check('announce', false);
      expect(report.isPassed()).assertFalse();
      expect(report.failures()).assertDeepEquals(['announce']);
      report.reset();
      expect(report.count()).assertEqual(0);
    });

    it('a11y_flow_should_announce_focus', 0, () => {
      const manager = new A11yFocusManager();
      const announcer = new A11yAnnouncer(10);
      const report = new A11yReport();
      manager.add({ id: 'n1', label: 'create issue', role: ROLE_BUTTON, focusable: true, order: 1 });
      manager.add({ id: 'n2', label: 'issue list', role: ROLE_LIST, focusable: true, order: 2 });
      const first = manager.next();
      announcer.announce(manager.currentLabel());
      const second = manager.next();
      announcer.announce(manager.currentLabel());
      report.check('first', first === 'n1');
      report.check('second', second === 'n2');
      report.check('announcements', announcer.count() === 2);
      expect(report.isPassed()).assertTrue();
      expect(announcer.contains('create issue')).assertTrue();
      expect(announcer.contains('issue list')).assertTrue();
    });

    it('a11y_constants_should_be_stable', 0, () => {
      expect(ROLE_BUTTON).assertEqual('button');
      expect(ROLE_TEXT).assertEqual('text');
      expect(ROLE_LIST).assertEqual('list');
      expect(ROLE_IMAGE).assertEqual('image');
      expect(MAX_NODES).assertEqual(32);
      expect(MAX_LABEL_LENGTH).assertEqual(128);
    });
  });
}

