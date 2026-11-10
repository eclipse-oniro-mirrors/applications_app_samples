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

const MIN_CONTRAST_RATIO: number = 3;

const MAX_ANNOUNCEMENTS: number = 10;

interface A11yLabel {
  text: string;
  description: string;
}

// Represents a focusable a11y node
class A11yNode {
  public label: string;
  public role: string;
  public description: string;
  public focusable: boolean;
  public enabled: boolean;

  constructor(label: string, role: string, focusable: boolean = true) {
    this.label = label;
    this.role = role;
    this.focusable = focusable;
    this.description = '';
    this.enabled = true;
  }

  public isDescribed(): boolean {
    return this.description.length > 0;
  }

  public isInteractive(): boolean {
    return this.focusable && this.enabled &&
      (this.role === ROLE_BUTTON || this.role === ROLE_LIST);
  }

  public toLabel(): A11yLabel {
    return { text: this.label, description: this.description };
  }
}

// Builds a flat a11y tree and supports label queries
class A11yTree {
  private nodes: A11yNode[] = [];

  public add(node: A11yNode): boolean {
    if (node.label.length === 0) {
      return false;
    }
    this.nodes.push(node);
    return true;
  }

  public size(): number {
    return this.nodes.length;
  }

  public findByLabel(label: string): A11yNode | undefined {
    for (let i = 0; i < this.nodes.length; i++) {
      if (this.nodes[i].label === label) {
        return this.nodes[i];
      }
    }
    return undefined;
  }

  public labels(): string[] {
    return this.nodes.map((node: A11yNode) => node.label);
  }

  public interactiveNodes(): A11yNode[] {
    return this.nodes.filter((node: A11yNode) => node.isInteractive());
  }

  public focusOrder(): string[] {
    const order: string[] = [];
    for (let i = 0; i < this.nodes.length; i++) {
      if (this.nodes[i].isInteractive()) {
        order.push(this.nodes[i].label);
      }
    }
    return order;
  }

  public undescribedInteractiveCount(): number {
    let count: number = 0;
    const interactive = this.interactiveNodes();
    for (let i = 0; i < interactive.length; i++) {
      if (!interactive[i].isDescribed()) {
        count++;
      }
    }
    return count;
  }

  public clear(): void {
    this.nodes = [];
  }
}

// Emulates a screen reader announcement queue
class ScreenReaderModel {
  private queue: string[] = [];
  private spoken: number = 0;

  public announce(message: string): boolean {
    if (message.length === 0 || this.queue.length >= MAX_ANNOUNCEMENTS) {
      return false;
    }
    this.queue.push(message);
    return true;
  }

  public next(): string {
    if (this.queue.length === 0) {
      return '';
    }
    const message = this.queue.shift();
    if (message === undefined) {
      return '';
    }
    this.spoken++;
    return message;
  }

  public pending(): number {
    return this.queue.length;
  }

  public getSpoken(): number {
    return this.spoken;
  }

  public lastSpokenMessage(): string {
    return this.queue.length === 0 ? '' : this.queue[this.queue.length - 1];
  }

  public clear(): void {
    this.queue = [];
    this.spoken = 0;
  }
}

// Tracks a11y focus independently from visual focus
class A11yFocusManager {
  private focusables: string[] = [];
  private current: number = -1;

  public setFocusables(labels: string[]): void {
    this.focusables = [...labels];
    this.current = labels.length === 0 ? -1 : 0;
  }

  public next(): string {
    if (this.focusables.length === 0) {
      return '';
    }
    this.current = (this.current + 1) % this.focusables.length;
    return this.currentLabel();
  }

  public previous(): string {
    if (this.focusables.length === 0) {
      return '';
    }
    this.current = (this.current - 1 + this.focusables.length) % this.focusables.length;
    return this.currentLabel();
  }

  public focusLabel(label: string): boolean {
    const index = this.focusables.indexOf(label);
    if (index < 0) {
      return false;
    }
    this.current = index;
    return true;
  }

  public currentLabel(): string {
    if (this.current < 0 || this.current >= this.focusables.length) {
      return '';
    }
    return this.focusables[this.current];
  }

  public getIndex(): number {
    return this.current;
  }

  public count(): number {
    return this.focusables.length;
  }

  public reset(): void {
    this.focusables = [];
    this.current = -1;
  }
}

// Validates contrast and touch target sizes for a11y
class A11yValidator {
  public static contrastRatio(foreground: number, background: number): number {
    if (foreground < 0 || background < 0 || foreground > 255 || background > 255) {
      return 0;
    }
    const lighter = Math.max(foreground, background);
    const darker = Math.min(foreground, background);
    return (lighter + 5) / (darker + 5);
  }

  public static hasSufficientContrast(foreground: number, background: number): boolean {
    return A11yValidator.contrastRatio(foreground, background) >= MIN_CONTRAST_RATIO;
  }

  public static isTouchTargetValid(width: number, height: number): boolean {
    return width >= 48 && height >= 48;
  }

  public static isFontScaleAcceptable(scale: number): boolean {
    return scale >= 1 && scale <= 2;
  }
}

export default function a11yNavigationTest() {
  describe('A11yNavigation_Test', () => {

    it('a11y_node_should_describe_interaction', 0, () => {
      const button = new A11yNode('submit issue', ROLE_BUTTON);
      expect(button.isInteractive()).assertTrue();
      expect(button.isDescribed()).assertFalse();
      button.description = 'submits the current issue';
      expect(button.isDescribed()).assertTrue();
      const label = button.toLabel();
      expect(label.text).assertEqual('submit issue');
      expect(label.description).assertEqual('submits the current issue');
    });

    it('a11y_node_should_reject_disabled_interaction', 0, () => {
      const button = new A11yNode('disabled', ROLE_BUTTON);
      button.enabled = false;
      expect(button.isInteractive()).assertFalse();
      const text = new A11yNode('label', ROLE_TEXT);
      expect(text.isInteractive()).assertFalse();
      const image = new A11yNode('cover', ROLE_IMAGE);
      expect(image.isInteractive()).assertFalse();
    });

    it('tree_should_store_and_find_nodes', 0, () => {
      const tree = new A11yTree();
      expect(tree.size()).assertEqual(0);
      expect(tree.add(new A11yNode('create', ROLE_BUTTON))).assertTrue();
      expect(tree.add(new A11yNode('list', ROLE_LIST))).assertTrue();
      expect(tree.add(new A11yNode('', ROLE_TEXT))).assertFalse();
      expect(tree.size()).assertEqual(2);
      expect(tree.findByLabel('create') !== undefined).assertTrue();
      expect(tree.findByLabel('missing') === undefined).assertTrue();
      expect(tree.labels()).assertDeepEquals(['create', 'list']);
    });

    it('tree_should_filter_interactive_nodes', 0, () => {
      const tree = new A11yTree();
      const create = new A11yNode('create', ROLE_BUTTON);
      create.description = 'create a new issue';
      const list = new A11yNode('list', ROLE_LIST);
      list.description = 'open the issue list';
      const title = new A11yNode('title', ROLE_TEXT);
      tree.add(create);
      tree.add(list);
      tree.add(title);
      expect(tree.interactiveNodes().length).assertEqual(2);
      expect(tree.focusOrder()).assertDeepEquals(['create', 'list']);
      expect(tree.undescribedInteractiveCount()).assertEqual(0);
    });

    it('tree_should_report_undescribed_nodes', 0, () => {
      const tree = new A11yTree();
      tree.add(new A11yNode('a', ROLE_BUTTON));
      tree.add(new A11yNode('b', ROLE_BUTTON));
      expect(tree.undescribedInteractiveCount()).assertEqual(2);
      const first = tree.findByLabel('a') as A11yNode;
      first.description = 'describes a';
      expect(tree.undescribedInteractiveCount()).assertEqual(1);
      tree.clear();
      expect(tree.size()).assertEqual(0);
      expect(tree.labels().length).assertEqual(0);
    });

    it('screen_reader_should_queue_announcements', 0, () => {
      const reader = new ScreenReaderModel();
      expect(reader.announce('home page')).assertTrue();
      expect(reader.announce('')).assertFalse();
      expect(reader.pending()).assertEqual(1);
      expect(reader.next()).assertEqual('home page');
      expect(reader.getSpoken()).assertEqual(1);
      expect(reader.next()).assertEqual('');
      expect(reader.getSpoken()).assertEqual(1);
    });

    it('screen_reader_should_bound_queue', 0, () => {
      const reader = new ScreenReaderModel();
      for (let i = 0; i < MAX_ANNOUNCEMENTS; i++) {
        expect(reader.announce(`msg-${i}`)).assertTrue();
      }
      expect(reader.announce('overflow')).assertFalse();
      expect(reader.pending()).assertEqual(MAX_ANNOUNCEMENTS);
      reader.clear();
      expect(reader.pending()).assertEqual(0);
      expect(reader.getSpoken()).assertEqual(0);
    });

    it('a11y_focus_should_wrap_forward', 0, () => {
      const manager = new A11yFocusManager();
      manager.setFocusables(['create', 'list', 'intro']);
      expect(manager.currentLabel()).assertEqual('create');
      expect(manager.count()).assertEqual(3);
      expect(manager.next()).assertEqual('list');
      expect(manager.next()).assertEqual('intro');
      expect(manager.next()).assertEqual('create');
      expect(manager.getIndex()).assertEqual(0);
    });

    it('a11y_focus_should_wrap_backward', 0, () => {
      const manager = new A11yFocusManager();
      manager.setFocusables(['a', 'b', 'c']);
      expect(manager.previous()).assertEqual('c');
      expect(manager.previous()).assertEqual('b');
      expect(manager.focusLabel('c')).assertTrue();
      expect(manager.currentLabel()).assertEqual('c');
      expect(manager.focusLabel('missing')).assertFalse();
      expect(manager.currentLabel()).assertEqual('c');
    });

    it('a11y_focus_should_handle_empty_list', 0, () => {
      const manager = new A11yFocusManager();
      manager.setFocusables([]);
      expect(manager.count()).assertEqual(0);
      expect(manager.getIndex()).assertEqual(-1);
      expect(manager.currentLabel()).assertEqual('');
      expect(manager.next()).assertEqual('');
      expect(manager.previous()).assertEqual('');
      expect(manager.focusLabel('x')).assertFalse();
      manager.reset();
      expect(manager.count()).assertEqual(0);
    });

    it('validator_should_check_contrast', 0, () => {
      expect(A11yValidator.contrastRatio(0, 255)).assertLarger(MIN_CONTRAST_RATIO);
      expect(A11yValidator.hasSufficientContrast(0, 255)).assertTrue();
      expect(A11yValidator.hasSufficientContrast(255, 255)).assertFalse();
      expect(A11yValidator.contrastRatio(-1, 0)).assertEqual(0);
      expect(A11yValidator.contrastRatio(300, 0)).assertEqual(0);
    });

    it('validator_should_check_target_and_font_scale', 0, () => {
      expect(A11yValidator.isTouchTargetValid(48, 48)).assertTrue();
      expect(A11yValidator.isTouchTargetValid(47, 48)).assertFalse();
      expect(A11yValidator.isTouchTargetValid(48, 47)).assertFalse();
      expect(A11yValidator.isFontScaleAcceptable(1)).assertTrue();
      expect(A11yValidator.isFontScaleAcceptable(2)).assertTrue();
      expect(A11yValidator.isFontScaleAcceptable(0.5)).assertFalse();
      expect(A11yValidator.isFontScaleAcceptable(3)).assertFalse();
    });

    it('a11y_flow_should_announce_focus_change', 0, () => {
      const tree = new A11yTree();
      const create = new A11yNode('create', ROLE_BUTTON);
      create.description = 'create a new issue';
      const list = new A11yNode('list', ROLE_LIST);
      list.description = 'open the issue list';
      tree.add(create);
      tree.add(list);
      const manager = new A11yFocusManager();
      manager.setFocusables(tree.focusOrder());
      const reader = new ScreenReaderModel();
      const current = manager.currentLabel();
      const node = tree.findByLabel(current) as A11yNode;
      expect(reader.announce(node.description)).assertTrue();
      expect(reader.next()).assertEqual('create a new issue');
      manager.next();
      const nextNode = tree.findByLabel(manager.currentLabel()) as A11yNode;
      expect(nextNode.description).assertEqual('open the issue list');
      expect(tree.undescribedInteractiveCount()).assertEqual(0);
    });

    it('a11y_constants_should_be_stable', 0, () => {
      expect(ROLE_BUTTON).assertEqual('button');
      expect(ROLE_TEXT).assertEqual('text');
      expect(ROLE_LIST).assertEqual('list');
      expect(ROLE_IMAGE).assertEqual('image');
      expect(MIN_CONTRAST_RATIO).assertEqual(3);
      expect(MAX_ANNOUNCEMENTS).assertEqual(10);
    });
  });
}

