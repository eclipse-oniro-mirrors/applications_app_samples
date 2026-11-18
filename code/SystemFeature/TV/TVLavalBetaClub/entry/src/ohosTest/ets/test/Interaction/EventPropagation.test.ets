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

const PHASE_CAPTURE: string = 'capture';

const PHASE_TARGET: string = 'target';

const PHASE_BUBBLE: string = 'bubble';

const MAX_DEPTH: number = 8;

interface HandlerRecord {
  node: string;
  phase: string;
  order: number;
}

// A node in the declarative component tree
class EventTargetNode {
  public id: string;
  private parent: EventTargetNode | null = null;
  private children: EventTargetNode[] = [];
  private handled: boolean = false;

  constructor(id: string) {
    this.id = id;
  }

  public appendChild(child: EventTargetNode): boolean {
    if (child === this || child.id.length === 0) {
      return false;
    }
    child.parent = this;
    this.children.push(child);
    return true;
  }

  public getParent(): EventTargetNode | null {
    return this.parent;
  }

  public getChildren(): EventTargetNode[] {
    return [...this.children];
  }

  public childCount(): number {
    return this.children.length;
  }

  public markHandled(): void {
    this.handled = true;
  }

  public isHandled(): boolean {
    return this.handled;
  }

  public resetHandled(): void {
    this.handled = false;
  }

  public depth(): number {
    let depth: number = 0;
    let node: EventTargetNode | null = this.parent;
    while (node !== null) {
      depth++;
      node = node.getParent();
    }
    return depth;
  }
}

// Builds the capture and bubble paths for a target node
class PropagationPath {
  public static pathToRoot(target: EventTargetNode): EventTargetNode[] {
    const path: EventTargetNode[] = [];
    let node: EventTargetNode | null = target;
    while (node !== null && path.length < MAX_DEPTH) {
      path.push(node);
      node = node.getParent();
    }
    return path;
  }

  public static captureOrder(target: EventTargetNode): string[] {
    const path = PropagationPath.pathToRoot(target);
    const ids: string[] = [];
    for (let i = path.length - 1; i >= 0; i--) {
      ids.push(path[i].id);
    }
    return ids;
  }

  public static bubbleOrder(target: EventTargetNode): string[] {
    const path = PropagationPath.pathToRoot(target);
    const ids: string[] = [];
    for (let i = 0; i < path.length; i++) {
      ids.push(path[i].id);
    }
    return ids;
  }

  public static sameAncestors(first: EventTargetNode, second: EventTargetNode): boolean {
    const firstPath = PropagationPath.pathToRoot(first);
    const secondPath = PropagationPath.pathToRoot(second);
    const rootOne = firstPath[firstPath.length - 1];
    const rootTwo = secondPath[secondPath.length - 1];
    return rootOne.id === rootTwo.id;
  }
}

// Records handler invocations and respects stopPropagation
class EventDispatcher {
  private records: HandlerRecord[] = [];
  private stopped: boolean = false;
  private prevented: boolean = false;

  public dispatch(target: EventTargetNode, node: EventTargetNode, phase: string): boolean {
    if (this.stopped) {
      return false;
    }
    this.records.push({ node: node.id, phase: phase, order: this.records.length });
    node.markHandled();
    target.markHandled();
    return true;
  }

  public capture(target: EventTargetNode): number {
    const order = PropagationPath.captureOrder(target);
    let handled: number = 0;
    for (let i = 0; i < order.length; i++) {
      if (this.dispatch(target, PropagationPath.pathToRoot(target)[order.length - 1 - i], PHASE_CAPTURE)) {
        handled++;
      }
    }
    return handled;
  }

  public bubble(target: EventTargetNode): number {
    const order = PropagationPath.bubbleOrder(target);
    let handled: number = 0;
    for (let i = 0; i < order.length; i++) {
      if (this.dispatch(target, PropagationPath.pathToRoot(target)[i], PHASE_BUBBLE)) {
        handled++;
      }
    }
    return handled;
  }

  public stopPropagation(): void {
    this.stopped = true;
  }

  public preventDefault(): void {
    this.prevented = true;
  }

  public isStopped(): boolean {
    return this.stopped;
  }

  public isPrevented(): boolean {
    return this.prevented;
  }

  public getRecords(): HandlerRecord[] {
    return [...this.records];
  }

  public recordCount(): number {
    return this.records.length;
  }

  public phasesOf(nodeId: string): string[] {
    const phases: string[] = [];
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].node === nodeId) {
        phases.push(this.records[i].phase);
      }
    }
    return phases;
  }

  public reset(): void {
    this.records = [];
    this.stopped = false;
    this.prevented = false;
  }
}

export default function eventPropagationTest() {
  describe('EventPropagation_Test', () => {

    it('target_node_should_link_parent_and_children', 0, () => {
      const root = new EventTargetNode('root');
      const page = new EventTargetNode('page');
      const button = new EventTargetNode('button');
      expect(root.appendChild(page)).assertTrue();
      expect(page.appendChild(button)).assertTrue();
      expect(root.childCount()).assertEqual(1);
      expect(page.childCount()).assertEqual(1);
      expect(button.getParent() === page).assertTrue();
      expect(root.getParent() === null).assertTrue();
      expect(root.depth()).assertEqual(0);
      expect(button.depth()).assertEqual(2);
    });

    it('target_node_should_handle_state_flags', 0, () => {
      const node = new EventTargetNode('node');
      expect(node.isHandled()).assertFalse();
      node.markHandled();
      expect(node.isHandled()).assertTrue();
      node.resetHandled();
      expect(node.isHandled()).assertFalse();
      expect(node.getChildren().length).assertEqual(0);
    });

    it('propagation_path_should_capture_root_to_target', 0, () => {
      const root = new EventTargetNode('root');
      const page = new EventTargetNode('page');
      const card = new EventTargetNode('card');
      root.appendChild(page);
      page.appendChild(card);
      expect(PropagationPath.captureOrder(card)).assertDeepEquals(['root', 'page', 'card']);
      expect(PropagationPath.bubbleOrder(card)).assertDeepEquals(['card', 'page', 'root']);
      expect(PropagationPath.pathToRoot(card).length).assertEqual(3);
    });

    it('propagation_path_should_share_root_for_siblings', 0, () => {
      const root = new EventTargetNode('root');
      const left = new EventTargetNode('left');
      const right = new EventTargetNode('right');
      root.appendChild(left);
      root.appendChild(right);
      expect(PropagationPath.sameAncestors(left, right)).assertTrue();
      expect(PropagationPath.sameAncestors(left, root)).assertTrue();
      expect(PropagationPath.bubbleOrder(left)).assertDeepEquals(['left', 'root']);
      expect(PropagationPath.bubbleOrder(right)).assertDeepEquals(['right', 'root']);
    });

    it('dispatcher_should_record_capture_order', 0, () => {
      const root = new EventTargetNode('root');
      const page = new EventTargetNode('page');
      const button = new EventTargetNode('button');
      root.appendChild(page);
      page.appendChild(button);
      const dispatcher = new EventDispatcher();
      expect(dispatcher.capture(button)).assertEqual(3);
      const records = dispatcher.getRecords();
      expect(records.length).assertEqual(3);
      expect(records[0].node).assertEqual('root');
      expect(records[1].node).assertEqual('page');
      expect(records[2].node).assertEqual('button');
      expect(dispatcher.phasesOf('page')).assertDeepEquals([PHASE_CAPTURE]);
      expect(button.isHandled()).assertTrue();
    });

    it('dispatcher_should_record_bubble_order', 0, () => {
      const root = new EventTargetNode('root');
      const page = new EventTargetNode('page');
      const button = new EventTargetNode('button');
      root.appendChild(page);
      page.appendChild(button);
      const dispatcher = new EventDispatcher();
      expect(dispatcher.bubble(button)).assertEqual(3);
      const records = dispatcher.getRecords();
      expect(records[0].node).assertEqual('button');
      expect(records[2].node).assertEqual('root');
      expect(dispatcher.phasesOf('button')).assertDeepEquals([PHASE_BUBBLE]);
      expect(dispatcher.recordCount()).assertEqual(3);
    });

    it('dispatcher_should_stop_propagation', 0, () => {
      const root = new EventTargetNode('root');
      const page = new EventTargetNode('page');
      root.appendChild(page);
      const dispatcher = new EventDispatcher();
      expect(dispatcher.dispatch(page, page, PHASE_TARGET)).assertTrue();
      dispatcher.stopPropagation();
      expect(dispatcher.isStopped()).assertTrue();
      expect(dispatcher.dispatch(page, root, PHASE_BUBBLE)).assertFalse();
      expect(dispatcher.recordCount()).assertEqual(1);
      expect(root.isHandled()).assertFalse();
    });

    it('dispatcher_should_prevent_default', 0, () => {
      const node = new EventTargetNode('node');
      const dispatcher = new EventDispatcher();
      expect(dispatcher.isPrevented()).assertFalse();
      dispatcher.dispatch(node, node, PHASE_TARGET);
      dispatcher.preventDefault();
      expect(dispatcher.isPrevented()).assertTrue();
      expect(dispatcher.recordCount()).assertEqual(1);
      expect(node.isHandled()).assertTrue();
    });

    it('dispatcher_reset_should_clear_state', 0, () => {
      const node = new EventTargetNode('node');
      const dispatcher = new EventDispatcher();
      dispatcher.dispatch(node, node, PHASE_TARGET);
      dispatcher.stopPropagation();
      dispatcher.preventDefault();
      dispatcher.reset();
      expect(dispatcher.recordCount()).assertEqual(0);
      expect(dispatcher.isStopped()).assertFalse();
      expect(dispatcher.isPrevented()).assertFalse();
      expect(dispatcher.getRecords().length).assertEqual(0);
    });

    it('target_node_should_reject_invalid_children', 0, () => {
      const node = new EventTargetNode('node');
      expect(node.appendChild(node)).assertFalse();
      expect(node.appendChild(new EventTargetNode(''))).assertFalse();
      expect(node.childCount()).assertEqual(0);
      expect(node.getParent() === null).assertTrue();
    });

    it('propagation_path_should_cap_depth', 0, () => {
      let current = new EventTargetNode('n0');
      const root = current;
      for (let i = 1; i < 12; i++) {
        const child = new EventTargetNode(`n${i}`);
        current.appendChild(child);
        current = child;
      }
      const path = PropagationPath.pathToRoot(current);
      expect(path.length).assertEqual(MAX_DEPTH);
      expect(path[0].id).assertEqual('n11');
      expect(path[path.length - 1].id).assertEqual('n4');
      expect(root.depth()).assertEqual(0);
    });

    it('dispatcher_should_support_multiple_handlers_per_node', 0, () => {
      const node = new EventTargetNode('button');
      const dispatcher = new EventDispatcher();
      dispatcher.dispatch(node, node, PHASE_CAPTURE);
      dispatcher.dispatch(node, node, PHASE_TARGET);
      dispatcher.dispatch(node, node, PHASE_BUBBLE);
      expect(dispatcher.phasesOf('button')).assertDeepEquals([PHASE_CAPTURE, PHASE_TARGET, PHASE_BUBBLE]);
      expect(dispatcher.recordCount()).assertEqual(3);
      expect(dispatcher.getRecords()[1].order).assertEqual(1);
    });

    it('propagation_constants_should_be_stable', 0, () => {
      expect(PHASE_CAPTURE).assertEqual('capture');
      expect(PHASE_TARGET).assertEqual('target');
      expect(PHASE_BUBBLE).assertEqual('bubble');
      expect(MAX_DEPTH).assertEqual(8);
      expect(PHASE_CAPTURE === PHASE_BUBBLE).assertFalse();
    });
  });
}

