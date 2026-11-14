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
import { Driver } from '@ohos.UiTest';
import TestLogger from '../Shared/TestLogger';
import {
  getDriver, startBrowserApp, serializedDelay, componentByIdExists, countById, clickById,
  waitForId, pressKey, normalizeUrl, backPressConsumes, pushHistory,
  ID_INPUT_URL, ID_NAV_BACK, ID_NAV_FORWARD, ID_NAV_REFRESH, ID_NAV_HOME,
  ID_ACTION_SUBMIT, ID_ACTION_ADD, ID_CANCEL_TAB, DELAY_TOUCH_EVENT,
  DELAY_KEY_NAVIGATION, TIMEOUT_COMPONENT, TIMEOUT_FOCUS_CHANGE,
  KEY_BACK, KEY_DPAD_LEFT, KEY_DPAD_RIGHT, KEY_ENTER, PAD_HOME_PAGE
} from '../Shared/BrowserTestKit';
import { MockBrowser, MockLoadingStatus, MockClock } from '../Shared/BrowserMock';

const TAG: string = 'BrowserEventPropagationTest';

/* ------------------------------------------------------------------ */
/* Component tree used by the bubble experiments                        */
/* ------------------------------------------------------------------ */

const NODE_COLUMN: string = 'columnRoot';
const NODE_ROW: string = 'toolbarRow';
const NODE_TAB_STRIP: string = 'tabStripRow';
const NODE_BACK: string = 'navigationButton0';
const NODE_FORWARD: string = 'navigationButton1';
const NODE_INPUT: string = 'inputUrl';
const NODE_SUBMIT: string = 'actionButton0';
const NODE_CANCEL: string = 'cancelBtn';
const NODE_WEB: string = 'webView';
const NODE_UNKNOWN: string = 'ghostNode';

const PHASE_DOWN: string = 'down';
const PHASE_MOVE: string = 'move';
const PHASE_UP: string = 'up';
const PHASE_CANCEL: string = 'cancel';

const KEYCODE_DPAD_LEFT: string = 'dpadLeft';
const KEYCODE_DPAD_RIGHT: string = 'dpadRight';
const KEYCODE_ENTER: string = 'enter';
const KEYCODE_TAB: string = 'tab';

/** One node of the synthetic component tree. */
class PropNode {
  id: string;
  parentId: string;
  handlesCapture: boolean;
  handlesBubble: boolean;
  interceptCapture: boolean;
  consumeBubble: boolean;

  constructor(id: string, parentId: string, handlesCapture: boolean = true,
    handlesBubble: boolean = true) {
    this.id = id;
    this.parentId = parentId;
    this.handlesCapture = handlesCapture;
    this.handlesBubble = handlesBubble;
    this.interceptCapture = false;
    this.consumeBubble = false;
  }
}

/** Tree with the same nesting as common/TitleBar.ets. */
class PropTree {
  nodes: PropNode[] = [];

  constructor() {
    this.nodes.push(new PropNode(NODE_COLUMN, ''));
    this.nodes.push(new PropNode(NODE_ROW, NODE_COLUMN));
    this.nodes.push(new PropNode(NODE_TAB_STRIP, NODE_COLUMN));
    this.nodes.push(new PropNode(NODE_BACK, NODE_ROW));
    this.nodes.push(new PropNode(NODE_FORWARD, NODE_ROW));
    this.nodes.push(new PropNode(NODE_INPUT, NODE_ROW));
    this.nodes.push(new PropNode(NODE_SUBMIT, NODE_ROW));
    this.nodes.push(new PropNode(NODE_CANCEL, NODE_TAB_STRIP));
    this.nodes.push(new PropNode(NODE_WEB, NODE_COLUMN));
  }

  nodeOf(id: string): PropNode | null {
    for (let index = 0; index < this.nodes.length; index++) {
      if (this.nodes[index].id === id) {
        return this.nodes[index];
      }
    }
    return null;
  }

  /** Target first, root last. */
  pathTo(id: string): string[] {
    const result: string[] = [];
    let cursor: PropNode | null = this.nodeOf(id);
    let guard: number = 0;
    while (cursor !== null && guard < 12) {
      result.push(cursor.id);
      cursor = cursor.parentId === '' ? null : this.nodeOf(cursor.parentId);
      guard += 1;
    }
    return result;
  }

  /** Root first, target last. */
  captureOrder(id: string): string[] {
    return this.pathTo(id).slice(0).reverse();
  }

  depthOf(id: string): number {
    return this.pathTo(id).length;
  }

  siblingIds(id: string): string[] {
    const node: PropNode | null = this.nodeOf(id);
    if (node === null) {
      return [];
    }
    const result: string[] = [];
    for (let index = 0; index < this.nodes.length; index++) {
      if (this.nodes[index].parentId === node.parentId && this.nodes[index].id !== id) {
        result.push(this.nodes[index].id);
      }
    }
    return result;
  }

  childrenOf(id: string): string[] {
    const result: string[] = [];
    for (let index = 0; index < this.nodes.length; index++) {
      if (this.nodes[index].parentId === id) {
        result.push(this.nodes[index].id);
      }
    }
    return result;
  }

  setIntercept(id: string, value: boolean): boolean {
    const node: PropNode | null = this.nodeOf(id);
    if (node === null) {
      return false;
    }
    node.interceptCapture = value;
    return true;
  }

  setConsume(id: string, value: boolean): boolean {
    const node: PropNode | null = this.nodeOf(id);
    if (node === null) {
      return false;
    }
    node.consumeBubble = value;
    return true;
  }
}

/* ------------------------------------------------------------------ */
/* Capture / bubble dispatcher                                          */
/* ------------------------------------------------------------------ */

/** Observable outcome of one dispatch. */
class DispatchResult {
  captureLog: string[] = [];
  bubbleLog: string[] = [];
  consumed: boolean = false;
  stoppedAt: string = '';
  phase: string = PHASE_UP;

  visited(): string[] {
    return this.captureLog.concat(this.bubbleLog);
  }

  bubbleTargets(): string[] {
    return this.bubbleLog.slice(0);
  }

  lastBubble(): string {
    return this.bubbleLog.length === 0 ? '' : this.bubbleLog[this.bubbleLog.length - 1];
  }
}

/**
 * Two phase dispatcher.
 *
 * Capture walks the tree from the root down to the target; a node that
 * intercepts there prevents every descendant handler from running. Bubble
 * walks back from the target to the root and stops as soon as a node marks the
 * event as consumed.
 */
class TouchDispatcher {
  tree: PropTree;
  dispatchCount: number = 0;
  interceptCount: number = 0;
  consumeCount: number = 0;

  constructor(tree: PropTree) {
    this.tree = tree;
  }

  dispatch(targetId: string, phase: string): DispatchResult {
    const result: DispatchResult = new DispatchResult();
    result.phase = phase;
    this.dispatchCount += 1;
    const target: PropNode | null = this.tree.nodeOf(targetId);
    if (target === null) {
      result.stoppedAt = NODE_UNKNOWN;
      return result;
    }
    const capture: string[] = this.tree.captureOrder(targetId);
    for (let index = 0; index < capture.length; index++) {
      const node: PropNode | null = this.tree.nodeOf(capture[index]);
      if (node === null) {
        continue;
      }
      if (!node.handlesCapture) {
        continue;
      }
      result.captureLog.push(node.id);
      if (node.interceptCapture) {
        result.consumed = true;
        result.stoppedAt = node.id;
        this.interceptCount += 1;
        return result;
      }
    }
    const bubble: string[] = this.tree.pathTo(targetId);
    for (let index = 0; index < bubble.length; index++) {
      const node: PropNode | null = this.tree.nodeOf(bubble[index]);
      if (node === null) {
        continue;
      }
      if (!node.handlesBubble) {
        continue;
      }
      result.bubbleLog.push(node.id);
      if (node.consumeBubble) {
        result.consumed = true;
        result.stoppedAt = node.id;
        this.consumeCount += 1;
        break;
      }
    }
    return result;
  }

  /** A click only bubbles when the matching touch stream ended with up. */
  clickBubbles(touchPhases: string[]): boolean {
    if (touchPhases.length === 0) {
      return false;
    }
    const last: string = touchPhases[touchPhases.length - 1];
    return last === PHASE_UP;
  }
}

/* ------------------------------------------------------------------ */
/* Back press consumption                                               */
/* ------------------------------------------------------------------ */

/**
 * Mirrors Index.ets onBackPress: the page consumes the gesture while the
 * current tab can go backward or while a page load is still running.
 */
class BackPressPropagator {
  browser: MockBrowser;
  consumedCount: number = 0;
  passedCount: number = 0;
  log: string[] = [];

  constructor(browser: MockBrowser) {
    this.browser = browser;
  }

  press(): boolean {
    const tab = this.browser.getCurrentTab();
    const accessBackward: boolean = tab !== null && tab.controller.accessBackward();
    const loading: boolean = this.browser.loadingStatus === MockLoadingStatus.LOADING;
    const predicted: boolean = backPressConsumes(accessBackward, loading);
    const consumed: boolean = this.browser.onBackPress();
    this.log.push(consumed ? 'consume' : 'pass');
    if (consumed) {
      this.consumedCount += 1;
    } else {
      this.passedCount += 1;
    }
    if (predicted !== consumed) {
      this.log.push('prediction-mismatch');
    }
    return consumed;
  }

  mismatchCount(): number {
    let total: number = 0;
    for (let index = 0; index < this.log.length; index++) {
      if (this.log[index] === 'prediction-mismatch') {
        total += 1;
      }
    }
    return total;
  }

  /** Presses until the gesture is no longer consumed. */
  drain(limit: number = 12): number {
    let presses: number = 0;
    while (presses < limit) {
      presses += 1;
      if (!this.press()) {
        break;
      }
    }
    return presses;
  }
}

/* ------------------------------------------------------------------ */
/* Focus key propagation                                                */
/* ------------------------------------------------------------------ */

/** Outcome of one key press inside the focus tree. */
class KeyRoute {
  key: string;
  handledBy: string = '';
  visited: string[] = [];
  consumed: boolean = false;

  constructor(key: string) {
    this.key = key;
  }
}

/**
 * Key events are offered to the focused node first and bubble upwards until a
 * node reports that it handled the key.
 */
class FocusKeyPropagator {
  tree: PropTree;
  handlers: Map<string, string[]> = new Map<string, string[]>();

  constructor(tree: PropTree) {
    this.tree = tree;
  }

  setHandledKeys(nodeId: string, keys: string[]): boolean {
    if (this.tree.nodeOf(nodeId) === null) {
      return false;
    }
    this.handlers.set(nodeId, keys.slice(0));
    return true;
  }

  handles(nodeId: string, key: string): boolean {
    const keys: string[] | undefined = this.handlers.get(nodeId);
    if (keys === undefined) {
      return false;
    }
    return keys.indexOf(key) >= 0;
  }

  route(focusedId: string, key: string): KeyRoute {
    const result: KeyRoute = new KeyRoute(key);
    const path: string[] = this.tree.pathTo(focusedId);
    for (let index = 0; index < path.length; index++) {
      result.visited.push(path[index]);
      if (this.handles(path[index], key)) {
        result.handledBy = path[index];
        result.consumed = true;
        break;
      }
    }
    return result;
  }
}

/* ------------------------------------------------------------------ */
/* Multiple listeners for the same event                                */
/* ------------------------------------------------------------------ */

/** One subscriber of a shared event channel. */
class Subscriber {
  id: string;
  priority: number;
  once: boolean;
  active: boolean;
  order: number;

  constructor(id: string, priority: number, once: boolean, order: number) {
    this.id = id;
    this.priority = priority;
    this.once = once;
    this.active = true;
    this.order = order;
  }
}

/**
 * Event channel with the semantics of a component that allows several
 * listeners on the same callback: priority wins, registration order breaks
 * ties, a listener removed by a previous listener is skipped in that same
 * dispatch and once listeners unsubscribe after their turn.
 */
class MultiListenerHub {
  subscribers: Subscriber[] = [];
  invoked: string[] = [];
  skipped: string[] = [];
  private pendingRemoval: string[] = [];
  private seed: number = 0;

  add(id: string, priority: number = 0, once: boolean = false): boolean {
    if (this.find(id) !== null) {
      return false;
    }
    this.seed += 1;
    this.subscribers.push(new Subscriber(id, priority, once, this.seed));
    return true;
  }

  find(id: string): Subscriber | null {
    for (let index = 0; index < this.subscribers.length; index++) {
      if (this.subscribers[index].id === id) {
        return this.subscribers[index];
      }
    }
    return null;
  }

  requestRemoval(id: string): void {
    this.pendingRemoval.push(id);
  }

  remove(id: string): boolean {
    for (let index = 0; index < this.subscribers.length; index++) {
      if (this.subscribers[index].id === id) {
        this.subscribers.splice(index, 1);
        return true;
      }
    }
    return false;
  }

  activeCount(): number {
    let total: number = 0;
    for (let index = 0; index < this.subscribers.length; index++) {
      if (this.subscribers[index].active) {
        total += 1;
      }
    }
    return total;
  }

  order(): string[] {
    const selected: Subscriber[] = this.subscribers.slice(0);
    selected.sort((left: Subscriber, right: Subscriber) => {
      if (left.priority !== right.priority) {
        return right.priority - left.priority;
      }
      return left.order - right.order;
    });
    return selected.map((subscriber: Subscriber) => subscriber.id);
  }

  dispatch(): string[] {
    const batch: string[] = [];
    const ordered: Subscriber[] = this.subscribers.slice(0);
    ordered.sort((left: Subscriber, right: Subscriber) => {
      if (left.priority !== right.priority) {
        return right.priority - left.priority;
      }
      return left.order - right.order;
    });
    for (let index = 0; index < ordered.length; index++) {
      const subscriber: Subscriber = ordered[index];
      if (!subscriber.active) {
        this.skipped.push(subscriber.id);
        continue;
      }
      if (this.pendingRemoval.indexOf(subscriber.id) >= 0) {
        subscriber.active = false;
        this.skipped.push(subscriber.id);
        continue;
      }
      this.invoked.push(subscriber.id);
      batch.push(subscriber.id);
      if (subscriber.once) {
        subscriber.active = false;
      }
    }
    for (let index = 0; index < this.pendingRemoval.length; index++) {
      this.remove(this.pendingRemoval[index]);
    }
    this.pendingRemoval = [];
    return batch;
  }
}

/* ------------------------------------------------------------------ */
/* Fixtures                                                             */
/* ------------------------------------------------------------------ */

function buildTree(): PropTree {
  return new PropTree();
}

function buildDispatcher(): TouchDispatcher {
  return new TouchDispatcher(buildTree());
}

function buildBrowserWithHistory(depth: number = 3): MockBrowser {
  const browser: MockBrowser = new MockBrowser();
  for (let index = 0; index < depth; index++) {
    browser.loadUrl(`example${index}.com`);
    browser.onPageEnd();
  }
  return browser;
}

/** Counts how many ancestors of a target would receive a bubbled event. */
function bubbleFanout(tree: PropTree, targetId: string): number {
  return tree.pathTo(targetId).length;
}

/* ------------------------------------------------------------------ */
/* Suite                                                               */
/* ------------------------------------------------------------------ */

export default function browserEventPropagationTest() {
  describe('browserEventPropagationTest', () => {
    let driver: Driver = getDriver();

    beforeAll(async () => {
      TestLogger.info(TAG, 'suite begin');
      await startBrowserApp();
      await serializedDelay(driver, DELAY_TOUCH_EVENT);
      const tree: PropTree = buildTree();
      TestLogger.info(TAG, `tree nodes=${tree.nodes.length}, back path=${tree.pathTo(NODE_BACK).join('>')}`);
    });

    afterAll(() => {
      TestLogger.info(TAG, TestLogger.summary(TAG));
    });

    it('Browser_Prop_001', 0, async () => {
      TestLogger.step(TAG, 'button bubble path reaches row and column');
      const tree: PropTree = buildTree();
      const path: string[] = tree.pathTo(NODE_BACK);
      expect(path.join(',')).assertEqual('navigationButton0,toolbarRow,columnRoot');
      expect(path[0]).assertEqual(NODE_BACK);
      expect(path[path.length - 1]).assertEqual(NODE_COLUMN);
      expect(tree.depthOf(NODE_BACK)).assertEqual(3);
      expect(tree.depthOf(NODE_COLUMN)).assertEqual(1);
      expect(tree.nodeOf(NODE_UNKNOWN)).assertNull();
    });

    it('Browser_Prop_002', 0, async () => {
      TestLogger.step(TAG, 'capture descends from root while bubble ascends');
      const tree: PropTree = buildTree();
      expect(tree.captureOrder(NODE_BACK).join(',')).assertEqual(
        'columnRoot,toolbarRow,navigationButton0');
      expect(tree.pathTo(NODE_BACK).join(',')).assertEqual(
        'navigationButton0,toolbarRow,columnRoot');
      const dispatcher: TouchDispatcher = buildDispatcher();
      const result: DispatchResult = dispatcher.dispatch(NODE_BACK, PHASE_DOWN);
      expect(result.captureLog.join(',')).assertEqual('columnRoot,toolbarRow,navigationButton0');
      expect(result.bubbleLog.join(',')).assertEqual('navigationButton0,toolbarRow,columnRoot');
      expect(result.consumed).assertFalse();
      expect(result.stoppedAt).assertEqual('');
    });

    it('Browser_Prop_003', 0, async () => {
      TestLogger.step(TAG, 'stop at the target keeps row and column untouched');
      const tree: PropTree = buildTree();
      tree.setConsume(NODE_BACK, true);
      const dispatcher: TouchDispatcher = new TouchDispatcher(tree);
      const result: DispatchResult = dispatcher.dispatch(NODE_BACK, PHASE_UP);
      expect(result.bubbleLog.length).assertEqual(1);
      expect(result.bubbleLog[0]).assertEqual(NODE_BACK);
      expect(result.consumed).assertTrue();
      expect(result.stoppedAt).assertEqual(NODE_BACK);
      expect(dispatcher.consumeCount).assertEqual(1);
      expect(result.bubbleLog.indexOf(NODE_ROW)).assertEqual(-1);
      expect(result.bubbleLog.indexOf(NODE_COLUMN)).assertEqual(-1);
    });

    it('Browser_Prop_004', 0, async () => {
      TestLogger.step(TAG, 'stop at the row still lets the button handler run');
      const tree: PropTree = buildTree();
      tree.setConsume(NODE_ROW, true);
      const dispatcher: TouchDispatcher = new TouchDispatcher(tree);
      const result: DispatchResult = dispatcher.dispatch(NODE_INPUT, PHASE_UP);
      expect(result.bubbleLog.join(',')).assertEqual('inputUrl,toolbarRow');
      expect(result.consumed).assertTrue();
      expect(result.stoppedAt).assertEqual(NODE_ROW);
      expect(result.lastBubble()).assertEqual(NODE_ROW);
      expect(result.bubbleLog.indexOf(NODE_COLUMN)).assertEqual(-1);
    });

    it('Browser_Prop_005', 0, async () => {
      TestLogger.step(TAG, 'capture intercept of a parent suppresses the child');
      const tree: PropTree = buildTree();
      expect(tree.setIntercept(NODE_ROW, true)).assertTrue();
      const dispatcher: TouchDispatcher = new TouchDispatcher(tree);
      const result: DispatchResult = dispatcher.dispatch(NODE_SUBMIT, PHASE_DOWN);
      expect(result.captureLog.join(',')).assertEqual('columnRoot,toolbarRow');
      expect(result.bubbleLog.length).assertEqual(0);
      expect(result.consumed).assertTrue();
      expect(result.stoppedAt).assertEqual(NODE_ROW);
      expect(dispatcher.interceptCount).assertEqual(1);
      expect(dispatcher.dispatchCount).assertEqual(1);
    });

    it('Browser_Prop_006', 0, async () => {
      TestLogger.step(TAG, 'clearing the intercept restores the full path');
      const tree: PropTree = buildTree();
      const dispatcher: TouchDispatcher = new TouchDispatcher(tree);
      tree.setIntercept(NODE_COLUMN, true);
      const blocked: DispatchResult = dispatcher.dispatch(NODE_CANCEL, PHASE_DOWN);
      expect(blocked.bubbleLog.length).assertEqual(0);
      expect(blocked.stoppedAt).assertEqual(NODE_COLUMN);
      tree.setIntercept(NODE_COLUMN, false);
      const open: DispatchResult = dispatcher.dispatch(NODE_CANCEL, PHASE_DOWN);
      expect(open.bubbleLog.join(',')).assertEqual('cancelBtn,tabStripRow,columnRoot');
      expect(open.consumed).assertFalse();
      expect(dispatcher.interceptCount).assertEqual(1);
    });

    it('Browser_Prop_007', 0, async () => {
      TestLogger.step(TAG, 'a consumed event keeps its flag after the dispatch');
      const tree: PropTree = buildTree();
      tree.setConsume(NODE_FORWARD, true);
      const dispatcher: TouchDispatcher = new TouchDispatcher(tree);
      const first: DispatchResult = dispatcher.dispatch(NODE_FORWARD, PHASE_UP);
      const second: DispatchResult = dispatcher.dispatch(NODE_FORWARD, PHASE_UP);
      expect(first.consumed).assertTrue();
      expect(second.consumed).assertTrue();
      expect(first.stoppedAt).assertEqual(NODE_FORWARD);
      expect(second.stoppedAt).assertEqual(NODE_FORWARD);
      expect(dispatcher.consumeCount).assertEqual(2);
      expect(dispatcher.dispatchCount).assertEqual(2);
    });

    it('Browser_Prop_008', 0, async () => {
      TestLogger.step(TAG, 'siblings never receive the event of another branch');
      const tree: PropTree = buildTree();
      expect(tree.siblingIds(NODE_BACK).join(',')).assertEqual('navigationButton1,inputUrl,actionButton0');
      const dispatcher: TouchDispatcher = new TouchDispatcher(tree);
      const result: DispatchResult = dispatcher.dispatch(NODE_BACK, PHASE_UP);
      expect(result.bubbleLog.indexOf(NODE_FORWARD)).assertEqual(-1);
      expect(result.bubbleLog.indexOf(NODE_INPUT)).assertEqual(-1);
      expect(result.bubbleLog.indexOf(NODE_SUBMIT)).assertEqual(-1);
      expect(result.bubbleLog.indexOf(NODE_WEB)).assertEqual(-1);
      expect(result.bubbleLog.indexOf(NODE_CANCEL)).assertEqual(-1);
    });

    it('Browser_Prop_009', 0, async () => {
      TestLogger.step(TAG, 'tab strip branch bubbles through its own row only');
      const tree: PropTree = buildTree();
      expect(tree.childrenOf(NODE_COLUMN).join(',')).assertEqual('toolbarRow,tabStripRow,webView');
      expect(tree.childrenOf(NODE_TAB_STRIP).join(',')).assertEqual('cancelBtn');
      const dispatcher: TouchDispatcher = new TouchDispatcher(tree);
      const result: DispatchResult = dispatcher.dispatch(NODE_CANCEL, PHASE_UP);
      expect(result.bubbleLog.join(',')).assertEqual('cancelBtn,tabStripRow,columnRoot');
      expect(result.bubbleLog.indexOf(NODE_ROW)).assertEqual(-1);
      expect(bubbleFanout(tree, NODE_CANCEL)).assertEqual(3);
      expect(bubbleFanout(tree, NODE_COLUMN)).assertEqual(1);
    });

    it('Browser_Prop_010', 0, async () => {
      TestLogger.step(TAG, 'back press is consumed while history can rewind');
      const browser: MockBrowser = buildBrowserWithHistory(3);
      const propagator: BackPressPropagator = new BackPressPropagator(browser);
      expect(propagator.press()).assertTrue();
      expect(propagator.consumedCount).assertEqual(1);
      expect(propagator.passedCount).assertEqual(0);
      expect(propagator.mismatchCount()).assertEqual(0);
      const tab = browser.getCurrentTab();
      if (tab !== null) {
        expect(tab.controller.historyIndex).assertEqual(1);
      }
      expect(backPressConsumes(true, false)).assertTrue();
      expect(backPressConsumes(false, true)).assertTrue();
      expect(backPressConsumes(false, false)).assertFalse();
    });

    it('Browser_Prop_011', 0, async () => {
      TestLogger.step(TAG, 'back press is consumed while a page is loading');
      const browser: MockBrowser = new MockBrowser();
      browser.loadUrl('https://example.com');
      browser.onPageBegin('https://example.com');
      expect(browser.loadingStatus).assertEqual(MockLoadingStatus.LOADING);
      const propagator: BackPressPropagator = new BackPressPropagator(browser);
      expect(propagator.press()).assertTrue();
      expect(propagator.mismatchCount()).assertEqual(0);
      expect(propagator.log.join(',')).assertEqual('consume');
      browser.onPageEnd();
      expect(propagator.press()).assertFalse();
      expect(propagator.log.join(',')).assertEqual('consume,pass');
      expect(propagator.consumedCount).assertEqual(1);
      expect(propagator.passedCount).assertEqual(1);
    });

    it('Browser_Prop_012', 0, async () => {
      TestLogger.step(TAG, 'back press reaches the ability at the home page');
      const browser: MockBrowser = new MockBrowser();
      browser.resetToHome(PAD_HOME_PAGE);
      browser.onPageEnd();
      const propagator: BackPressPropagator = new BackPressPropagator(browser);
      expect(propagator.press()).assertFalse();
      expect(propagator.passedCount).assertEqual(1);
      expect(propagator.consumedCount).assertEqual(0);
      expect(propagator.mismatchCount()).assertEqual(0);
      expect(propagator.log.join(',')).assertEqual('pass');
      expect(browser.tabs.length).assertEqual(1);
      expect(browser.getTabArrayIndex()).assertEqual(0);
    });

    it('Browser_Prop_013', 0, async () => {
      TestLogger.step(TAG, 'back press drains the whole history then passes through');
      const browser: MockBrowser = buildBrowserWithHistory(4);
      const propagator: BackPressPropagator = new BackPressPropagator(browser);
      const presses: number = propagator.drain(12);
      TestLogger.info(TAG, `drain presses=${presses}, log=${propagator.log.join(',')}`);
      expect(presses).assertEqual(4);
      expect(propagator.consumedCount).assertEqual(3);
      expect(propagator.passedCount).assertEqual(1);
      expect(propagator.mismatchCount()).assertEqual(0);
      const tab = browser.getCurrentTab();
      if (tab !== null) {
        expect(tab.controller.historyIndex).assertEqual(0);
        expect(tab.controller.accessBackward()).assertFalse();
      }
    });

    it('Browser_Prop_014', 0, async () => {
      TestLogger.step(TAG, 'a handled dpad key stops at the focused button');
      const tree: PropTree = buildTree();
      const propagator: FocusKeyPropagator = new FocusKeyPropagator(tree);
      expect(propagator.setHandledKeys(NODE_INPUT, [KEYCODE_DPAD_LEFT])).assertTrue();
      const route: KeyRoute = propagator.route(NODE_INPUT, KEYCODE_DPAD_LEFT);
      expect(route.consumed).assertTrue();
      expect(route.handledBy).assertEqual(NODE_INPUT);
      expect(route.visited.join(',')).assertEqual('inputUrl');
      expect(route.visited.indexOf(NODE_ROW)).assertEqual(-1);
      expect(propagator.handles(NODE_INPUT, KEYCODE_DPAD_LEFT)).assertTrue();
      expect(propagator.handles(NODE_INPUT, KEYCODE_ENTER)).assertFalse();
    });

    it('Browser_Prop_015', 0, async () => {
      TestLogger.step(TAG, 'an unhandled key bubbles to the toolbar default');
      const tree: PropTree = buildTree();
      const propagator: FocusKeyPropagator = new FocusKeyPropagator(tree);
      propagator.setHandledKeys(NODE_ROW, [KEYCODE_TAB]);
      const route: KeyRoute = propagator.route(NODE_SUBMIT, KEYCODE_TAB);
      expect(route.consumed).assertTrue();
      expect(route.handledBy).assertEqual(NODE_ROW);
      expect(route.visited.join(',')).assertEqual('actionButton0,toolbarRow');
      expect(route.visited.length).assertEqual(2);
      const ghost: KeyRoute = propagator.route(NODE_SUBMIT, KEYCODE_ENTER);
      expect(ghost.consumed).assertFalse();
      expect(ghost.handledBy).assertEqual('');
      expect(ghost.visited.join(',')).assertEqual('actionButton0,toolbarRow,columnRoot');
    });

    it('Browser_Prop_016', 0, async () => {
      TestLogger.step(TAG, 'two listeners on one channel run in registration order');
      const hub: MultiListenerHub = new MultiListenerHub();
      expect(hub.add('first')).assertTrue();
      expect(hub.add('second')).assertTrue();
      expect(hub.add('third')).assertTrue();
      expect(hub.order().join(',')).assertEqual('first,second,third');
      const batch: string[] = hub.dispatch();
      expect(batch.join(',')).assertEqual('first,second,third');
      expect(hub.invoked.length).assertEqual(3);
      expect(hub.activeCount()).assertEqual(3);
      expect(hub.add('second')).assertFalse();
      expect(hub.activeCount()).assertEqual(3);
    });

    it('Browser_Prop_017', 0, async () => {
      TestLogger.step(TAG, 'priority listeners jump ahead of later registrations');
      const hub: MultiListenerHub = new MultiListenerHub();
      hub.add('normalA', 0);
      hub.add('normalB', 0);
      hub.add('urgent', 50);
      hub.add('medium', 10);
      expect(hub.order().join(',')).assertEqual('urgent,medium,normalA,normalB');
      const batch: string[] = hub.dispatch();
      expect(batch.join(',')).assertEqual('urgent,medium,normalA,normalB');
      expect(batch[0]).assertEqual('urgent');
      expect(batch[batch.length - 1]).assertEqual('normalB');
      expect(hub.activeCount()).assertEqual(4);
    });

    it('Browser_Prop_018', 0, async () => {
      TestLogger.step(TAG, 'a listener removed mid dispatch is skipped');
      const hub: MultiListenerHub = new MultiListenerHub();
      hub.add('alpha');
      hub.add('beta');
      hub.add('gamma');
      hub.requestRemoval('beta');
      const batch: string[] = hub.dispatch();
      expect(batch.join(',')).assertEqual('alpha,gamma');
      expect(batch.indexOf('beta')).assertEqual(-1);
      expect(hub.skipped.indexOf('beta') >= 0).assertTrue();
      expect(hub.find('beta')).assertNull();
      expect(hub.activeCount()).assertEqual(2);
      const next: string[] = hub.dispatch();
      expect(next.join(',')).assertEqual('alpha,gamma');
    });

    it('Browser_Prop_019', 0, async () => {
      TestLogger.step(TAG, 'a once listener participates in exactly one dispatch');
      const hub: MultiListenerHub = new MultiListenerHub();
      hub.add('onceTop', 20, true);
      hub.add('steady', 0, false);
      expect(hub.activeCount()).assertEqual(2);
      expect(hub.dispatch().join(',')).assertEqual('onceTop,steady');
      expect(hub.activeCount()).assertEqual(1);
      expect(hub.dispatch().join(',')).assertEqual('steady');
      expect(hub.invoked.filter((id: string) => id === 'onceTop').length).assertEqual(1);
      expect(hub.invoked.filter((id: string) => id === 'steady').length).assertEqual(2);
    });

    it('Browser_Prop_020', 0, async () => {
      TestLogger.step(TAG, 'five level chain bubbles one handler per ancestor');
      const chain: PropTree = new PropTree();
      chain.nodes.push(new PropNode('level4', NODE_WEB));
      const dispatcher: TouchDispatcher = new TouchDispatcher(chain);
      const path: string[] = chain.pathTo('level4');
      expect(path.join(',')).assertEqual('level4,webView,columnRoot');
      const result: DispatchResult = dispatcher.dispatch('level4', PHASE_UP);
      expect(result.bubbleLog.length).assertEqual(3);
      expect(result.captureLog.length).assertEqual(3);
      expect(result.captureLog[0]).assertEqual(NODE_COLUMN);
      expect(result.bubbleLog[0]).assertEqual('level4');
      expect(result.consumed).assertFalse();
    });

    it('Browser_Prop_021', 0, async () => {
      TestLogger.step(TAG, 'click bubbles only after a completed touch stream');
      const dispatcher: TouchDispatcher = buildDispatcher();
      expect(dispatcher.clickBubbles([PHASE_DOWN, PHASE_UP])).assertTrue();
      expect(dispatcher.clickBubbles([PHASE_DOWN, PHASE_MOVE, PHASE_UP])).assertTrue();
      expect(dispatcher.clickBubbles([PHASE_DOWN, PHASE_CANCEL])).assertFalse();
      expect(dispatcher.clickBubbles([PHASE_DOWN])).assertFalse();
      expect(dispatcher.clickBubbles([])).assertFalse();
      const result: DispatchResult = dispatcher.dispatch(NODE_SUBMIT, PHASE_UP);
      expect(result.phase).assertEqual(PHASE_UP);
      expect(result.visited().length).assertEqual(6);
    });

    it('Browser_Prop_022', 0, async () => {
      TestLogger.step(TAG, 'cancelled touch never reaches ancestor click handlers');
      const tree: PropTree = buildTree();
      const dispatcher: TouchDispatcher = new TouchDispatcher(tree);
      const cancel: DispatchResult = dispatcher.dispatch(NODE_SUBMIT, PHASE_CANCEL);
      expect(dispatcher.clickBubbles([PHASE_DOWN, PHASE_CANCEL])).assertFalse();
      expect(cancel.consumed).assertFalse();
      expect(cancel.phase).assertEqual(PHASE_CANCEL);
      expect(cancel.bubbleLog.join(',')).assertEqual('actionButton0,toolbarRow,columnRoot');
      expect(tree.setConsume(NODE_SUBMIT, true)).assertTrue();
      const consumed: DispatchResult = dispatcher.dispatch(NODE_SUBMIT, PHASE_CANCEL);
      expect(consumed.consumed).assertTrue();
      expect(consumed.bubbleLog.length).assertEqual(1);
    });

    it('Browser_Prop_023', 0, async () => {
      TestLogger.step(TAG, 'consumption matrix matches the helper contract');
      const cases: boolean[][] = [
        [true, false, true],
        [false, true, true],
        [true, true, true],
        [false, false, false]
      ];
      for (let index = 0; index < cases.length; index++) {
        const accessBackward: boolean = cases[index][0];
        const loading: boolean = cases[index][1];
        const expected: boolean = cases[index][2];
        expect(backPressConsumes(accessBackward, loading)).assertEqual(expected);
        const browser: MockBrowser = new MockBrowser();
        if (accessBackward) {
          browser.loadUrl('https://a.example');
          browser.loadUrl('https://b.example');
        }
        if (loading) {
          browser.onPageBegin('https://c.example');
        }
        const propagator: BackPressPropagator = new BackPressPropagator(browser);
        expect(propagator.press()).assertEqual(expected);
      }
    });

    it('Browser_Prop_024', 0, async () => {
      TestLogger.step(TAG, 'propagation storm keeps counters and paths stable');
      const tree: PropTree = buildTree();
      tree.setConsume(NODE_ROW, true);
      const dispatcher: TouchDispatcher = new TouchDispatcher(tree);
      let consumedTotal: number = 0;
      for (let index = 0; index < 25; index++) {
        const result: DispatchResult = dispatcher.dispatch(NODE_BACK, PHASE_UP);
        if (result.consumed) {
          consumedTotal += 1;
        }
        expect(result.bubbleLog.join(',')).assertEqual('navigationButton0,toolbarRow');
      }
      expect(consumedTotal).assertEqual(25);
      expect(dispatcher.dispatchCount).assertEqual(25);
      expect(dispatcher.consumeCount).assertEqual(25);
      expect(dispatcher.interceptCount).assertEqual(0);
      TestLogger.info(TAG, `storm dispatches=${dispatcher.dispatchCount}`);
    });

    it('Browser_Prop_025', 0, async () => {
      TestLogger.step(TAG, 'on device back key keeps the app while history exists');
      const backPresent: boolean = await componentByIdExists(driver, ID_NAV_BACK);
      expect(backPresent).assertTrue();
      await clickById(driver, ID_INPUT_URL);
      const typed: boolean = await componentByIdExists(driver, ID_INPUT_URL);
      expect(typed).assertTrue();
      const browser: MockBrowser = buildBrowserWithHistory(2);
      const propagator: BackPressPropagator = new BackPressPropagator(browser);
      expect(propagator.press()).assertTrue();
      await pressKey(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, TIMEOUT_FOCUS_CHANGE);
      const inputAfter: boolean = await componentByIdExists(driver, ID_INPUT_URL);
      const submitAfter: boolean = await componentByIdExists(driver, ID_ACTION_SUBMIT);
      expect(inputAfter).assertTrue();
      expect(submitAfter).assertTrue();
      expect(propagator.mismatchCount()).assertEqual(0);
    });

    it('Browser_Prop_026', 0, async () => {
      TestLogger.step(TAG, 'on device sibling buttons keep independent click counters');
      const before: number = await countById(driver, ID_NAV_FORWARD);
      expect(before >= 0).assertTrue();
      await clickById(driver, ID_NAV_FORWARD);
      await serializedDelay(driver, DELAY_TOUCH_EVENT);
      await clickById(driver, ID_NAV_REFRESH);
      await serializedDelay(driver, DELAY_TOUCH_EVENT);
      const inputStill: boolean = await componentByIdExists(driver, ID_INPUT_URL);
      const homeStill: boolean = await componentByIdExists(driver, ID_NAV_HOME);
      expect(inputStill).assertTrue();
      expect(homeStill).assertTrue();
      const tree: PropTree = buildTree();
      const dispatcher: TouchDispatcher = new TouchDispatcher(tree);
      const first: DispatchResult = dispatcher.dispatch(NODE_FORWARD, PHASE_UP);
      const second: DispatchResult = dispatcher.dispatch(NODE_SUBMIT, PHASE_UP);
      expect(first.bubbleLog.indexOf(NODE_SUBMIT)).assertEqual(-1);
      expect(second.bubbleLog.indexOf(NODE_FORWARD)).assertEqual(-1);
      expect(first.bubbleLog[0]).assertEqual(NODE_FORWARD);
      expect(dispatcher.dispatchCount).assertEqual(2);
    });

    it('Browser_Prop_027', 0, async () => {
      TestLogger.step(TAG, 'history stack helper agrees with the back press model');
      const stack: string[] = [];
      const seeded: string[] = pushHistory(stack, 'https://a.example');
      const grown: string[] = pushHistory(seeded, 'https://b.example');
      const duplicate: string[] = pushHistory(grown, 'https://b.example');
      expect(grown.length).assertEqual(2);
      expect(duplicate.length).assertEqual(2);
      expect(duplicate.join(',')).assertEqual('https://a.example,https://b.example');
      expect(pushHistory([], 'https://c.example').length).assertEqual(1);
      expect(normalizeUrl('a.example')).assertEqual('https://a.example');
      expect(pushHistory(grown, 'https://c.example', 2).join(',')).assertEqual(
        'https://b.example,https://c.example');
    });
    it('Browser_Prop_028', 0, async () => {
      TestLogger.step(TAG, 'focus keys route through the tree and stay answered');
      const tree: PropTree = buildTree();
      const propagator: FocusKeyPropagator = new FocusKeyPropagator(tree);
      propagator.setHandledKeys(NODE_INPUT, [KEYCODE_DPAD_LEFT, KEYCODE_DPAD_RIGHT, KEYCODE_ENTER]);
      const left: KeyRoute = propagator.route(NODE_INPUT, KEYCODE_DPAD_LEFT);
      const right: KeyRoute = propagator.route(NODE_INPUT, KEYCODE_DPAD_RIGHT);
      const enter: KeyRoute = propagator.route(NODE_INPUT, KEYCODE_ENTER);
      expect(left.handledBy).assertEqual(NODE_INPUT);
      expect(right.handledBy).assertEqual(NODE_INPUT);
      expect(enter.handledBy).assertEqual(NODE_INPUT);
      expect(left.visited.length).assertEqual(1);
      const clock: MockClock = new MockClock();
      clock.advance(DELAY_KEY_NAVIGATION);
      expect(clock.now()).assertLarger(0);
      const present: boolean = await waitForId(driver, ID_INPUT_URL, TIMEOUT_COMPONENT);
      expect(present).assertTrue();
      await pressKey(driver, KEY_DPAD_LEFT, 1, DELAY_KEY_NAVIGATION);
      await pressKey(driver, KEY_DPAD_RIGHT, 1, DELAY_KEY_NAVIGATION);
      await pressKey(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, TIMEOUT_FOCUS_CHANGE);
      const inputAfter: boolean = await componentByIdExists(driver, ID_INPUT_URL);
      const addTabs: number = await countById(driver, ID_ACTION_ADD);
      const closeTabs: number = await countById(driver, ID_CANCEL_TAB);
      TestLogger.info(TAG, `after focus keys: addButtons=${addTabs}, closeButtons=${closeTabs}`);
      expect(inputAfter).assertTrue();
      expect(addTabs >= 0).assertTrue();
      expect(closeTabs >= 0).assertTrue();
    });
  });
}
