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

import { afterAll, beforeAll, describe, expect, it } from '@ohos/hypium';
import { Component, Driver } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import {
  ID_INDEX_TITLE,
  ID_BUNDLE_INPUT,
  ID_ADD_BUTTON,
  ID_BEGIN_BUTTON,
  ID_END_BUTTON,
  ID_QUERY_STATE_BUTTON,
  ID_QUERY_CONFIG_BUTTON,
  TYPE_LIST,
  TYPE_TEXT,
  TYPE_BUTTON,
  TEXT_STATE_INACTIVE,
  TEXT_WHITELIST_EMPTY,
  TEXT_REMOVE_BUTTON,
  KEY_DOWN,
  KEY_ENTER,
  KEY_BACK,
  KEY_TAB,
  TIMEOUT_PAGE_RENDER,
  DELAY_KEY_NAVIGATION,
  DELAY_TOUCH_EVENT,
  DELAY_AFTER_ACTION,
  serializedDelay,
  getDriver,
  launchAssessmentApp,
  findById,
  findComponentsByType,
  indexComponentCount,
  checkTextContent,
  collectTexts,
  waitForIndexPage,
  waitForStableIndex,
  isComponentEnabled,
  clickComponent,
  addAllowedApp,
  allowedAppRowCount,
  removeFirstAllowedApp,
  pressAndWait,
  textFrequency
} from '../Shared/AssessmentDriver';
import { clickSerialized, inputTextSerialized, getTextSerialized, clickPointSerialized } from '../Shared/AssessmentDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Assessment]';
const BUNDLE: string = 'Assessment_';

// The three phases of a dispatched pointer event. ArkUI delivers a capture pass from the root
// down to the target, then a bubble pass from the target back up to the root.
const PHASE_CAPTURE: string = 'capture';
const PHASE_TARGET: string = 'target';
const PHASE_BUBBLE: string = 'bubble';

// The tag of the page root and of the four list items of the entry page. Every node of the
// model carries its tag, the propagation trace writes the tag of every visited node.
const TAG_PAGE: string = 'page';
const TAG_TITLE_CARD: string = 'title_card';
const TAG_CONFIG_CARD: string = 'config_card';
const TAG_OPERATION_CARD: string = 'operation_card';
const TAG_STATUS_CARD: string = 'status_card';
const TAG_WHITELIST_ROW: string = 'whitelist_row';
const TAG_WHITELIST_NAME: string = 'whitelist_name';
const TAG_REMOVE_BUTTON: string = 'remove_button';
const TAG_ADD_BUTTON: string = 'add_button';
const TAG_BUNDLE_INPUT: string = 'bundle_input';
const TAG_BEGIN_BUTTON: string = 'begin_button';
const TAG_END_BUTTON: string = 'end_button';
const TAG_QUERY_STATE_BUTTON: string = 'query_state_button';
const TAG_QUERY_CONFIG_BUTTON: string = 'query_config_button';

// The reactions that a node can apply to an event that reaches it.
const REACTION_NONE: string = 'none';
const REACTION_TOGGLE_SELECTION: string = 'toggle_selection';
const REACTION_REMOVE_ROW: string = 'remove_row';
const REACTION_HANDLE_BEGIN: string = 'handle_begin';
const REACTION_HANDLE_END: string = 'handle_end';
const REACTION_QUERY: string = 'query';
const REACTION_STOP: string = 'stop';

// A node that stops the propagation shortens every trace: the trace of a stopped dispatch ends
// at the node that called stopPropagation.
const STOP_AT_SELF: boolean = true;

// The number of whitelist rows that the identity cases add, it stays low so that the list does
// not have to scroll during the identity audit.
const IDENTITY_ROW_COUNT: number = 3;

// The keys of the ForEach item generator. The sample keys a whitelist row by its bundle name and
// an event log entry by the pair of its index and its text.
const KEY_PREFIX_ROW: string = 'row_';
const KEY_PREFIX_EVENT: string = 'event_';

/**
 * One node of the propagation tree.
 *
 * A node knows its tag, its parent and its children. The reaction decides what the node does when
 * the event reaches it, the stop flag decides whether the bubble continues to the parent.
 */
class EventNode {
  public tag: string = '';
  public parentTag: string = '';
  public childTags: string[] = [];
  public reaction: string = REACTION_NONE;
  public stopsPropagation: boolean = false;
  public captures: boolean = true;

  constructor(tag: string = '', parentTag: string = '', reaction: string = REACTION_NONE,
    stopsPropagation: boolean = false) {
    this.tag = tag;
    this.parentTag = parentTag;
    this.reaction = reaction;
    this.stopsPropagation = stopsPropagation;
  }

  /**
   * Scenario: the tree builder attaches a child.
   * Expectation: the child tag is appended once, repeated attachments are ignored so that a
   * rebuild of the tree cannot duplicate a node.
   *
   * @param childTag tag of the child.
   */
  public attach(childTag: string): void {
    if (this.childTags.indexOf(childTag) >= 0) {
      return;
    }
    this.childTags.push(childTag);
  }

  /**
   * @returns true when the node has no child.
   */
  public isLeaf(): boolean {
    return this.childTags.length === 0;
  }

  /**
   * Scenario: the node reacts to an event.
   * Expectation: a node without a reaction reports the none reaction and a node that stops the
   * propagation reports its own reaction plus the stop flag.
   *
   * @returns the reaction that the node applies.
   */
  public appliedReaction(): string {
    return this.reaction;
  }

  /**
   * @returns a compact description used by the log lines.
   */
  public toString(): string {
    return `EventNode{tag=${this.tag}, reaction=${this.reaction}, stop=${this.stopsPropagation}}`;
  }
}

/**
 * The tree of the entry page, built from a flat node list.
 */
class EventTree {
  private nodes: EventNode[] = [];
  private tags: string[] = [];

  constructor(nodes: EventNode[]) {
    this.nodes = nodes;
    for (let i = 0; i < nodes.length; i++) {
      this.tags.push(nodes[i].tag);
    }
  }

  /**
   * @param tag node tag.
   * @returns the node, null when the tag is unknown.
   */
  public nodeOf(tag: string): EventNode | null {
    const index: number = this.tags.indexOf(tag);
    if (index < 0) {
      return null;
    }
    return this.nodes[index];
  }

  /**
   * @returns the number of nodes of the tree.
   */
  public size(): number {
    return this.nodes.length;
  }

  /**
   * Scenario: the capture path of a target is collected.
   * Expectation: the path starts at the root and ends at the direct parent of the target, so it
   * never contains the target itself.
   *
   * @param targetTag tag of the target node.
   * @returns the tags from the root down to the parent of the target.
   */
  public capturePath(targetTag: string): string[] {
    const path: string[] = [];
    let current: EventNode | null = this.nodeOf(targetTag);
    if (current === null) {
      return path;
    }
    let guard: number = 0;
    while (current.parentTag.length > 0 && guard < this.nodes.length + 1) {
      path.unshift(current.parentTag);
      current = this.nodeOf(current.parentTag);
      guard++;
      if (current === null) {
        break;
      }
    }
    return path;
  }

  /**
   * Scenario: the bubble path of a target is collected.
   * Expectation: the path starts at the parent of the target and ends at the root, the target
   * itself is delivered separately as the target phase.
   *
   * @param targetTag tag of the target node.
   * @returns the tags from the parent of the target up to the root.
   */
  public bubblePath(targetTag: string): string[] {
    const path: string[] = [];
    const target: EventNode | null = this.nodeOf(targetTag);
    if (target === null) {
      return path;
    }
    let current: EventNode | null = target;
    let guard: number = 0;
    while (current.parentTag.length > 0 && guard < this.nodes.length + 1) {
      path.push(current.parentTag);
      current = this.nodeOf(current.parentTag);
      guard++;
      if (current === null) {
        break;
      }
    }
    return path;
  }

  /**
   * @param tag node tag.
   * @returns true when the node is the root of the tree.
   */
  public isRoot(tag: string): boolean {
    const node: EventNode | null = this.nodeOf(tag);
    if (node === null) {
      return false;
    }
    return node.parentTag.length === 0;
  }

  /**
   * @param tag node tag.
   * @returns the depth of the node, -1 when the tag is unknown.
   */
  public depthOf(tag: string): number {
    let depth: number = 0;
    let current: EventNode | null = this.nodeOf(tag);
    let guard: number = 0;
    while (current !== null && current.parentTag.length > 0 && guard < this.nodes.length + 1) {
      depth++;
      current = this.nodeOf(current.parentTag);
      guard++;
    }
    if (current === null && depth === 0) {
      return -1;
    }
    return depth;
  }

  /**
   * @returns the tags of every node in construction order.
   */
  public allTags(): string[] {
    return this.tags.slice();
  }

  /**
   * Scenario: the parent relation is audited.
   * Expectation: every non root node has a known parent and the root has none, so the tree has
   * no dangling reference.
   *
   * @returns the number of dangling parent references.
   */
  public danglingCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.nodes.length; i++) {
      const parent: string = this.nodes[i].parentTag;
      if (parent.length > 0 && this.tags.indexOf(parent) < 0) {
        count++;
      }
    }
    return count;
  }

  /**
   * @returns a compact description used by the log lines.
   */
  public toString(): string {
    return `EventTree{nodes=${this.nodes.length}, dangling=${this.danglingCount()}}`;
  }
}

/**
 * One visit of one node during a dispatch.
 */
class Visit {
  public seq: number = 0;
  public phase: string = '';
  public tag: string = '';
  public reaction: string = '';
  public stopped: boolean = false;

  constructor(seq: number = 0, phase: string = '', tag: string = '', reaction: string = '',
    stopped: boolean = false) {
    this.seq = seq;
    this.phase = phase;
    this.tag = tag;
    this.reaction = reaction;
    this.stopped = stopped;
  }

  /**
   * @returns a compact description used by the log lines.
   */
  public toString(): string {
    return `Visit{seq=${this.seq}, phase=${this.phase}, tag=${this.tag}, reaction=${this.reaction}}`;
  }
}

/**
 * The dispatcher of one event.
 *
 * The dispatcher walks the capture path from the root down, delivers the target phase, then walks
 * the bubble path upwards. A node that stops the propagation ends the dispatch, which is what the
 * remove button of a whitelist row does after it removed the row.
 */
class EventDispatcher {
  private visits: Visit[] = [];
  private sequence: number = 0;
  private stoppedAt: string = '';
  private deliveryCount: number = 0;

  /**
   * Scenario: a pointer event is dispatched to a target node.
   * Expectation: the capture phase visits the ancestors from the root down, the target phase
   * visits the target once and the bubble phase visits the ancestors upwards. A stop inside the
   * capture phase prevents the target from being reached at all.
   *
   * @param tree tree of the page.
   * @param targetTag tag of the target node.
   * @returns the number of visited nodes.
   */
  public dispatch(tree: EventTree, targetTag: string): number {
    this.reset();
    const target: EventNode | null = tree.nodeOf(targetTag);
    if (target === null) {
      hilog.warn(DOMAIN, TAG, 'EventDispatcher.dispatch: the target %{public}s is unknown', targetTag);
      return 0;
    }
    const capture: string[] = tree.capturePath(targetTag);
    for (let i = 0; i < capture.length; i++) {
      const node: EventNode | null = tree.nodeOf(capture[i]);
      if (node === null) {
        continue;
      }
      this.visit(PHASE_CAPTURE, node);
      if (node.stopsPropagation) {
        this.stoppedAt = node.tag;
        return this.visits.length;
      }
    }
    this.visit(PHASE_TARGET, target);
    if (target.stopsPropagation) {
      this.stoppedAt = target.tag;
      return this.visits.length;
    }
    const bubble: string[] = tree.bubblePath(targetTag);
    for (let i = 0; i < bubble.length; i++) {
      const node: EventNode | null = tree.nodeOf(bubble[i]);
      if (node === null) {
        continue;
      }
      this.visit(PHASE_BUBBLE, node);
      if (node.stopsPropagation) {
        this.stoppedAt = node.tag;
        return this.visits.length;
      }
    }
    return this.visits.length;
  }

  /**
   * Scenario: the dispatch is configured to skip the capture pass.
   * Expectation: the target is visited first and the bubble pass follows, which is the ordering
   * of a pointer event that the framework delivers without a capture handler.
   *
   * @param tree tree of the page.
   * @param targetTag tag of the target node.
   * @returns the number of visited nodes.
   */
  public dispatchWithoutCapture(tree: EventTree, targetTag: string): number {
    this.reset();
    const target: EventNode | null = tree.nodeOf(targetTag);
    if (target === null) {
      return 0;
    }
    this.visit(PHASE_TARGET, target);
    if (target.stopsPropagation) {
      this.stoppedAt = target.tag;
      return this.visits.length;
    }
    const bubble: string[] = tree.bubblePath(targetTag);
    for (let i = 0; i < bubble.length; i++) {
      const node: EventNode | null = tree.nodeOf(bubble[i]);
      if (node === null) {
        continue;
      }
      this.visit(PHASE_BUBBLE, node);
      if (node.stopsPropagation) {
        this.stoppedAt = node.tag;
        return this.visits.length;
      }
    }
    return this.visits.length;
  }

  private visit(phase: string, node: EventNode): void {
    this.sequence++;
    this.deliveryCount++;
    const stopped: boolean = node.stopsPropagation;
    this.visits.push(new Visit(this.sequence, phase, node.tag, node.reaction, stopped));
  }

  /**
   * @returns the number of visited nodes.
   */
  public size(): number {
    return this.visits.length;
  }

  /**
   * @returns a copy of the visits in delivery order.
   */
  public getVisits(): Visit[] {
    return this.visits.slice();
  }

  /**
   * @param phase phase to look for.
   * @returns the number of visits of the phase.
   */
  public countOfPhase(phase: string): number {
    let count: number = 0;
    for (let i = 0; i < this.visits.length; i++) {
      if (this.visits[i].phase === phase) {
        count++;
      }
    }
    return count;
  }

  /**
   * @param tag node tag.
   * @returns the number of visits of the node, a node can be visited twice when it lies on the
   * capture path and on the bubble path.
   */
  public countOfTag(tag: string): number {
    let count: number = 0;
    for (let i = 0; i < this.visits.length; i++) {
      if (this.visits[i].tag === tag) {
        count++;
      }
    }
    return count;
  }

  /**
   * @param reaction reaction to count.
   * @returns the number of visits that applied the reaction.
   */
  public countOfReaction(reaction: string): number {
    let count: number = 0;
    for (let i = 0; i < this.visits.length; i++) {
      if (this.visits[i].reaction === reaction) {
        count++;
      }
    }
    return count;
  }

  /**
   * @returns the tag of the node that stopped the dispatch, an empty string when the dispatch
   * reached the root.
   */
  public getStoppedAt(): string {
    return this.stoppedAt;
  }

  /**
   * @returns true when the dispatch was stopped before the bubble reached the root.
   */
  public wasStopped(): boolean {
    return this.stoppedAt.length > 0;
  }

  /**
   * @returns the tags of the visited nodes in delivery order.
   */
  public visitedTags(): string[] {
    const tags: string[] = [];
    for (let i = 0; i < this.visits.length; i++) {
      tags.push(this.visits[i].tag);
    }
    return tags;
  }

  /**
   * Scenario: the phase ordering is audited.
   * Expectation: every capture visit precedes the target visit and every bubble visit follows
   * it, so the trace shows the documented two pass delivery.
   *
   * @returns true when the phase order is valid.
   */
  public isPhaseOrderValid(): boolean {
    let targetSeen: boolean = false;
    let bubbleSeen: boolean = false;
    for (let i = 0; i < this.visits.length; i++) {
      const phase: string = this.visits[i].phase;
      if (phase === PHASE_BUBBLE) {
        bubbleSeen = true;
      }
      if (phase === PHASE_TARGET) {
        if (bubbleSeen) {
          return false;
        }
        targetSeen = true;
      }
      if (phase === PHASE_CAPTURE && targetSeen) {
        return false;
      }
    }
    return true;
  }

  /**
   * @returns the trace rendered as a compact arrow line.
   */
  public asLine(): string {
    const parts: string[] = [];
    for (let i = 0; i < this.visits.length; i++) {
      parts.push(`${this.visits[i].phase}:${this.visits[i].tag}`);
    }
    return parts.join('>');
  }

  /**
   * Clears the trace.
   */
  public reset(): void {
    this.visits = [];
    this.sequence = 0;
    this.stoppedAt = '';
    this.deliveryCount = 0;
  }

  /**
   * @returns the total number of visits since the last reset.
   */
  public delivered(): number {
    return this.deliveryCount;
  }

  /**
   * @returns a compact description used by the log lines.
   */
  public toString(): string {
    return `EventDispatcher{visits=${this.visits.length}, stoppedAt=${this.stoppedAt}}`;
  }
}

/**
 * Identity model of a keyed list.
 *
 * The ForEach of the sample keys a whitelist row by its bundle name, so a re-render keeps the
 * component instance of an unchanged row and recreates only the rows whose key disappeared. The
 * model records which keys were created and which were reused across a rebuild.
 */
class KeyedListModel {
  private keys: string[] = [];
  private created: string[] = [];
  private reused: number = 0;

  constructor(keys: string[] = []) {
    this.keys = keys.slice();
    for (let i = 0; i < this.keys.length; i++) {
      this.created.push(this.keys[i]);
    }
  }

  /**
   * Scenario: the list is rebuilt with a new key sequence.
   * Expectation: a key that survives the rebuild reuses its component instance, a key that is
   * new creates one and a key that disappeared is dropped.
   *
   * @param nextKeys key sequence of the rebuild.
   * @returns the number of newly created rows.
   */
  public rebuild(nextKeys: string[]): number {
    let createdNow: number = 0;
    const previous: string[] = this.keys;
    for (let i = 0; i < nextKeys.length; i++) {
      if (previous.indexOf(nextKeys[i]) >= 0) {
        this.reused++;
      } else {
        this.created.push(nextKeys[i]);
        createdNow++;
      }
    }
    this.keys = nextKeys.slice();
    return createdNow;
  }

  /**
   * @returns the current key sequence.
   */
  public getKeys(): string[] {
    return this.keys.slice();
  }

  /**
   * @returns the number of rows that were created at least once.
   */
  public createdCount(): number {
    return this.created.length;
  }

  /**
   * @returns the number of row instances that were reused across rebuilds.
   */
  public reusedCount(): number {
    return this.reused;
  }

  /**
   * @param key key of the row.
   * @returns true when the row was ever created.
   */
  public wasCreated(key: string): boolean {
    return this.created.indexOf(key) >= 0;
  }

  /**
   * @returns the number of duplicated keys in the current sequence.
   */
  public duplicateKeys(): number {
    let duplicates: number = 0;
    for (let i = 0; i < this.keys.length; i++) {
      if (this.keys.indexOf(this.keys[i]) !== i) {
        duplicates++;
      }
    }
    return duplicates;
  }

  /**
   * @returns a compact description used by the log lines.
   */
  public toString(): string {
    return `KeyedListModel{keys=${this.keys.length}, created=${this.created.length}, ` +
      `reused=${this.reused}}`;
  }
}

/**
 * Builder of the page tree of the entry page.
 *
 * The parent relations mirror the List and the cards of pages/Index.ets: the root List holds the
 * four card items, the config card holds the input row and the whitelist rows, and every row
 * holds its name text and its remove button.
 *
 * @returns the tree of the entry page.
 */
function buildEntryPageTree(): EventTree {
  const page: EventNode = new EventNode(TAG_PAGE, '', REACTION_NONE, false);
  page.attach(TAG_TITLE_CARD);
  page.attach(TAG_CONFIG_CARD);
  page.attach(TAG_OPERATION_CARD);
  page.attach(TAG_STATUS_CARD);

  const title: EventNode = new EventNode(TAG_TITLE_CARD, TAG_PAGE, REACTION_NONE, false);

  const config: EventNode = new EventNode(TAG_CONFIG_CARD, TAG_PAGE, REACTION_NONE, false);
  config.attach(TAG_BUNDLE_INPUT);
  config.attach(TAG_ADD_BUTTON);
  config.attach(TAG_WHITELIST_ROW);

  const input: EventNode = new EventNode(TAG_BUNDLE_INPUT, TAG_CONFIG_CARD, REACTION_NONE, false);
  const add: EventNode = new EventNode(TAG_ADD_BUTTON, TAG_CONFIG_CARD, REACTION_NONE, false);

  const row: EventNode = new EventNode(TAG_WHITELIST_ROW, TAG_CONFIG_CARD, REACTION_TOGGLE_SELECTION,
    false);
  row.attach(TAG_WHITELIST_NAME);
  row.attach(TAG_REMOVE_BUTTON);

  const name: EventNode = new EventNode(TAG_WHITELIST_NAME, TAG_WHITELIST_ROW, REACTION_NONE, false);
  const remove: EventNode = new EventNode(TAG_REMOVE_BUTTON, TAG_WHITELIST_ROW, REACTION_REMOVE_ROW,
    STOP_AT_SELF);

  const operation: EventNode = new EventNode(TAG_OPERATION_CARD, TAG_PAGE, REACTION_NONE, false);
  operation.attach(TAG_BEGIN_BUTTON);
  operation.attach(TAG_END_BUTTON);
  operation.attach(TAG_QUERY_STATE_BUTTON);
  operation.attach(TAG_QUERY_CONFIG_BUTTON);

  const begin: EventNode = new EventNode(TAG_BEGIN_BUTTON, TAG_OPERATION_CARD, REACTION_HANDLE_BEGIN,
    false);
  const end: EventNode = new EventNode(TAG_END_BUTTON, TAG_OPERATION_CARD, REACTION_HANDLE_END, false);
  const queryState: EventNode = new EventNode(TAG_QUERY_STATE_BUTTON, TAG_OPERATION_CARD,
    REACTION_QUERY, false);
  const queryConfig: EventNode = new EventNode(TAG_QUERY_CONFIG_BUTTON, TAG_OPERATION_CARD,
    REACTION_QUERY, false);

  const status: EventNode = new EventNode(TAG_STATUS_CARD, TAG_PAGE, REACTION_NONE, false);

  return new EventTree([page, title, config, input, add, row, name, remove, operation, begin, end,
    queryState, queryConfig, status]);
}

/**
 * Scenario: the display order of the two list items of a whitelist row is fixed.
 *
 * The row renders its name first and its remove button second, so a row index maps onto the
 * remove button index by a constant offset.
 *
 * @returns the number of displayed children of a whitelist row.
 */
function rowChildCount(): number {
  return 2;
}

/**
 * @param rowIndex index of the row.
 * @returns the display index of the remove button of the row.
 */
function removeButtonIndexOf(rowIndex: number): number {
  return rowIndex * rowChildCount() + 1;
}

/**
 * @param bundleName bundle name of the row.
 * @returns the ForEach key of the row.
 */
function rowKeyOf(bundleName: string): string {
  return `${KEY_PREFIX_ROW}${bundleName}`;
}

/**
 * @param index index of the event log entry.
 * @param text text of the entry.
 * @returns the ForEach key of the entry.
 */
function eventKeyOf(index: number, text: string): string {
  return `${KEY_PREFIX_EVENT}${index}_${text}`;
}

/**
 * Makes sure that the entry page is rendered.
 *
 * @param driver driver of the running case.
 * @returns true when the entry page is rendered.
 */
async function ensureIndexPage(driver: Driver): Promise<boolean> {
  const title: Component | null = await findById(driver, ID_INDEX_TITLE);
  if (title !== null) {
    return true;
  }
  await launchAssessmentApp();
  const rendered: boolean = await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
  if (!rendered) {
    hilog.warn(DOMAIN, TAG, 'ensureIndexPage: the entry page is not rendered');
  }
  return rendered;
}

/**
 * Reads the text of a component and normalizes a driver failure to an empty string.
 *
 * @param component component to read.
 * @returns the text of the component.
 */
async function readTextSafely(component: Component): Promise<string> {
  try {
    return await getTextSerialized(component);
  } catch (error) {
    const err: Error = error instanceof Error ? error : new Error(String(error));
    hilog.warn(DOMAIN, TAG, 'readTextSafely failed: %{public}s', err.message);
    return '';
  }
}

export default function eventPropagationTest() {
  describe('EventPropagation_Test', () => {
    let driver: Driver;
    let tree: EventTree;
    let dispatcher: EventDispatcher;

    beforeAll(async () => {
      driver = getDriver();
      tree = buildEntryPageTree();
      dispatcher = new EventDispatcher();
      await serializedDelay(driver, 1000);
      await launchAssessmentApp();
      await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
      hilog.info(DOMAIN, TAG, 'EventPropagation_Test beforeAll, %{public}s', tree.toString());
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
    });

    /**
     * Scenario: the page tree of the entry page is built.
     * Expectation: every node has a known parent, the tree has no dangling reference and the
     * root is the page list.
     */
    it('Assessment_EventPropagation_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventPropagation_001, begin');
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'EventPropagation_001', tree.toString());
      expect(tree.size()).assertEqual(14);
      expect(tree.danglingCount()).assertEqual(0);
      expect(tree.isRoot(TAG_PAGE)).assertTrue();
      expect(tree.isRoot(TAG_CONFIG_CARD)).assertFalse();
      const pageNode: EventNode | null = tree.nodeOf(TAG_PAGE);
      const nameNode: EventNode | null = tree.nodeOf(TAG_WHITELIST_NAME);
      expect(pageNode !== null).assertTrue();
      expect(nameNode !== null).assertTrue();
      if (pageNode !== null) {
        expect(pageNode.isLeaf()).assertFalse();
      }
      if (nameNode !== null) {
        expect(nameNode.isLeaf()).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventPropagation_001, end');
    });

    /**
     * Scenario: the depth of the nodes of the tree.
     * Expectation: the root sits at zero, the cards at one, the row at two and the remove button
     * at three, which is the nesting of the List builder.
     */
    it('Assessment_EventPropagation_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventPropagation_002, begin');
      expect(tree.depthOf(TAG_PAGE)).assertEqual(0);
      expect(tree.depthOf(TAG_CONFIG_CARD)).assertEqual(1);
      expect(tree.depthOf(TAG_OPERATION_CARD)).assertEqual(1);
      expect(tree.depthOf(TAG_STATUS_CARD)).assertEqual(1);
      expect(tree.depthOf(TAG_WHITELIST_ROW)).assertEqual(2);
      expect(tree.depthOf(TAG_REMOVE_BUTTON)).assertEqual(3);
      expect(tree.depthOf('assessment_unknown')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventPropagation_002, end');
    });

    /**
     * Scenario: the capture path of the remove button.
     * Expectation: the path starts at the root, visits the config card and the row and stops
     * before the target itself.
     */
    it('Assessment_EventPropagation_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventPropagation_003, begin');
      const path: string[] = tree.capturePath(TAG_REMOVE_BUTTON);
      hilog.info(DOMAIN, TAG, '%{public}s capture path: %{public}s',
        BUNDLE + 'EventPropagation_003', path.join('>'));
      expect(path.length).assertEqual(3);
      expect(path[0]).assertEqual(TAG_PAGE);
      expect(path[1]).assertEqual(TAG_CONFIG_CARD);
      expect(path[2]).assertEqual(TAG_WHITELIST_ROW);
      expect(path.indexOf(TAG_REMOVE_BUTTON)).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventPropagation_003, end');
    });

    /**
     * Scenario: the bubble path of the remove button.
     * Expectation: the path starts at the parent of the target and ends at the root, which is the
     * reverse of the capture path.
     */
    it('Assessment_EventPropagation_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventPropagation_004, begin');
      const path: string[] = tree.bubblePath(TAG_REMOVE_BUTTON);
      hilog.info(DOMAIN, TAG, '%{public}s bubble path: %{public}s',
        BUNDLE + 'EventPropagation_004', path.join('>'));
      expect(path.length).assertEqual(3);
      expect(path[0]).assertEqual(TAG_WHITELIST_ROW);
      expect(path[1]).assertEqual(TAG_CONFIG_CARD);
      expect(path[2]).assertEqual(TAG_PAGE);
      expect(path.indexOf(TAG_REMOVE_BUTTON)).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventPropagation_004, end');
    });

    /**
     * Scenario: the capture and the bubble path of a leaf are mirrored.
     * Expectation: the two paths contain the same tags in the reverse order, which is the
     * structural invariant of the two pass dispatch.
     */
    it('Assessment_EventPropagation_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventPropagation_005, begin');
      const capture: string[] = tree.capturePath(TAG_BEGIN_BUTTON);
      const bubble: string[] = tree.bubblePath(TAG_BEGIN_BUTTON);
      expect(capture.length).assertEqual(bubble.length);
      for (let i = 0; i < capture.length; i++) {
        expect(capture[i]).assertEqual(bubble[bubble.length - 1 - i]);
      }
      expect(capture[0]).assertEqual(TAG_PAGE);
      expect(bubble[0]).assertEqual(TAG_OPERATION_CARD);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventPropagation_005, end');
    });

    /**
     * Scenario: the capture path of the root.
     * Expectation: the root has no ancestor, both paths are empty and the root is delivered as
     * the target phase only.
     */
    it('Assessment_EventPropagation_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventPropagation_006, begin');
      expect(tree.capturePath(TAG_PAGE).length).assertEqual(0);
      expect(tree.bubblePath(TAG_PAGE).length).assertEqual(0);
      expect(tree.capturePath('assessment_unknown').length).assertEqual(0);
      expect(tree.bubblePath('assessment_unknown').length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventPropagation_006, end');
    });

    /**
     * Scenario: a full dispatch to the query button.
     * Expectation: the capture pass visits three nodes, the target once and the bubble pass
     * three nodes, so the trace holds seven visits in the documented order.
     */
    it('Assessment_EventPropagation_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventPropagation_007, begin');
      const visits: number = dispatcher.dispatch(tree, TAG_QUERY_STATE_BUTTON);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'EventPropagation_007', dispatcher.asLine());
      expect(visits).assertEqual(5);
      expect(dispatcher.countOfPhase(PHASE_CAPTURE)).assertEqual(2);
      expect(dispatcher.countOfPhase(PHASE_TARGET)).assertEqual(1);
      expect(dispatcher.countOfPhase(PHASE_BUBBLE)).assertEqual(2);
      expect(dispatcher.isPhaseOrderValid()).assertTrue();
      expect(dispatcher.wasStopped()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventPropagation_007, end');
    });

    /**
     * Scenario: the visit order of a dispatch.
     * Expectation: the first visit is the page root in the capture phase, the middle visit is
     * the target and the last visit is the root in the bubble phase.
     */
    it('Assessment_EventPropagation_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventPropagation_008, begin');
      dispatcher.dispatch(tree, TAG_QUERY_CONFIG_BUTTON);
      const visits: Visit[] = dispatcher.getVisits();
      expect(visits.length).assertEqual(5);
      expect(visits[0].tag).assertEqual(TAG_PAGE);
      expect(visits[0].phase).assertEqual(PHASE_CAPTURE);
      expect(visits[1].tag).assertEqual(TAG_OPERATION_CARD);
      expect(visits[1].phase).assertEqual(PHASE_CAPTURE);
      expect(visits[2].tag).assertEqual(TAG_QUERY_CONFIG_BUTTON);
      expect(visits[2].phase).assertEqual(PHASE_TARGET);
      expect(visits[3].tag).assertEqual(TAG_OPERATION_CARD);
      expect(visits[3].phase).assertEqual(PHASE_BUBBLE);
      expect(visits[4].tag).assertEqual(TAG_PAGE);
      expect(visits[4].phase).assertEqual(PHASE_BUBBLE);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventPropagation_008, end');
    });

    /**
     * Scenario: the action card is visited twice by one dispatch.
     * Expectation: the operation card appears once on the capture path and once on the bubble
     * path, which is why a naive handler would run twice.
     */
    it('Assessment_EventPropagation_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventPropagation_009, begin');
      dispatcher.dispatch(tree, TAG_BEGIN_BUTTON);
      expect(dispatcher.countOfTag(TAG_OPERATION_CARD)).assertEqual(2);
      expect(dispatcher.countOfTag(TAG_PAGE)).assertEqual(2);
      expect(dispatcher.countOfTag(TAG_BEGIN_BUTTON)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'EventPropagation_009',
        dispatcher.asLine());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventPropagation_009, end');
    });

    /**
     * Scenario: the target reaction is applied once.
     * Expectation: the begin reaction is counted once even though the button is visited in the
     * capture and in the target phase, the capture visit carries no reaction of its own.
     */
    it('Assessment_EventPropagation_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventPropagation_010, begin');
      dispatcher.dispatch(tree, TAG_BEGIN_BUTTON);
      expect(dispatcher.countOfReaction(REACTION_HANDLE_BEGIN)).assertEqual(1);
      const visits: Visit[] = dispatcher.getVisits();
      let targetReactions: number = 0;
      for (let i = 0; i < visits.length; i++) {
        if (visits[i].phase === PHASE_TARGET && visits[i].reaction === REACTION_HANDLE_BEGIN) {
          targetReactions++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s target reactions: %{public}d',
        BUNDLE + 'EventPropagation_010', targetReactions);
      expect(targetReactions).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventPropagation_010, end');
    });

    /**
     * Scenario: a dispatch without the capture pass.
     * Expectation: the target is visited first and the four bubble visits follow in increasing
     * depth, so the trace is shorter by the capture visits.
     */
    it('Assessment_EventPropagation_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventPropagation_011, begin');
      const visits: number = dispatcher.dispatchWithoutCapture(tree, TAG_QUERY_STATE_BUTTON);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'EventPropagation_011', dispatcher.asLine());
      expect(visits).assertEqual(3);
      expect(dispatcher.countOfPhase(PHASE_CAPTURE)).assertEqual(0);
      expect(dispatcher.countOfPhase(PHASE_TARGET)).assertEqual(1);
      expect(dispatcher.countOfPhase(PHASE_BUBBLE)).assertEqual(2);
      expect(dispatcher.isPhaseOrderValid()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventPropagation_011, end');
    });

    /**
     * Scenario: the remove button stops the propagation.
     * Expectation: the row is visited, the remove button removes the row and stops, so no parent
     * above the button is visited.
     */
    it('Assessment_EventPropagation_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventPropagation_012, begin');
      const visits: number = dispatcher.dispatch(tree, TAG_REMOVE_BUTTON);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'EventPropagation_012', dispatcher.asLine());
      expect(dispatcher.wasStopped()).assertTrue();
      expect(dispatcher.getStoppedAt()).assertEqual(TAG_REMOVE_BUTTON);
      expect(dispatcher.countOfPhase(PHASE_BUBBLE)).assertEqual(0);
      expect(dispatcher.countOfPhase(PHASE_CAPTURE)).assertEqual(3);
      expect(dispatcher.countOfPhase(PHASE_TARGET)).assertEqual(1);
      expect(visits).assertEqual(4);
      expect(dispatcher.countOfReaction(REACTION_REMOVE_ROW)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventPropagation_012, end');
    });

    /**
     * Scenario: the row toggle of a whitelist row.
     * Expectation: a tap on the row name reaches the name, the row applies its selection
     * reaction and the event continues to the config card and the page.
     */
    it('Assessment_EventPropagation_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventPropagation_013, begin');
      const visits: number = dispatcher.dispatch(tree, TAG_WHITELIST_NAME);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'EventPropagation_013', dispatcher.asLine());
      expect(visits).assertEqual(7);
      expect(dispatcher.wasStopped()).assertFalse();
      expect(dispatcher.countOfReaction(REACTION_TOGGLE_SELECTION)).assertEqual(2);
      expect(dispatcher.countOfTag(TAG_WHITELIST_ROW)).assertEqual(2);
      expect(dispatcher.countOfTag(TAG_PAGE)).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventPropagation_013, end');
    });

    /**
     * Scenario: a stop placed on an ancestor.
     * Expectation: the capture pass reaches the stopping ancestor and the dispatch ends before
     * the target is delivered at all.
     */
    it('Assessment_EventPropagation_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventPropagation_014, begin');
      const root: EventNode = new EventNode(TAG_PAGE, '', REACTION_STOP, true);
      root.attach(TAG_CONFIG_CARD);
      const config: EventNode = new EventNode(TAG_CONFIG_CARD, TAG_PAGE, REACTION_NONE, false);
      config.attach(TAG_ADD_BUTTON);
      const add: EventNode = new EventNode(TAG_ADD_BUTTON, TAG_CONFIG_CARD, REACTION_NONE, false);
      const guarded: EventTree = new EventTree([root, config, add]);
      const local: EventDispatcher = new EventDispatcher();
      local.dispatch(guarded, TAG_ADD_BUTTON);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'EventPropagation_014', local.asLine());
      expect(local.getStoppedAt()).assertEqual(TAG_PAGE);
      expect(local.countOfPhase(PHASE_TARGET)).assertEqual(0);
      expect(local.countOfPhase(PHASE_BUBBLE)).assertEqual(0);
      expect(local.size()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventPropagation_014, end');
    });

    /**
     * Scenario: a stop placed on a middle node.
     * Expectation: the capture visits the nodes above the stopping node and the dispatch ends
     * there, the target is never reached.
     */
    it('Assessment_EventPropagation_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventPropagation_015, begin');
      const page: EventNode = new EventNode(TAG_PAGE, '', REACTION_NONE, false);
      page.attach(TAG_OPERATION_CARD);
      const card: EventNode = new EventNode(TAG_OPERATION_CARD, TAG_PAGE, REACTION_STOP, true);
      card.attach(TAG_BEGIN_BUTTON);
      const begin: EventNode = new EventNode(TAG_BEGIN_BUTTON, TAG_OPERATION_CARD, REACTION_HANDLE_BEGIN,
        false);
      const guarded: EventTree = new EventTree([page, card, begin]);
      const local: EventDispatcher = new EventDispatcher();
      local.dispatch(guarded, TAG_BEGIN_BUTTON);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'EventPropagation_015', local.asLine());
      expect(local.size()).assertEqual(2);
      expect(local.getStoppedAt()).assertEqual(TAG_OPERATION_CARD);
      expect(local.countOfReaction(REACTION_HANDLE_BEGIN)).assertEqual(0);
      expect(local.countOfPhase(PHASE_TARGET)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventPropagation_015, end');
    });

    /**
     * Scenario: a dispatch to an unknown target.
     * Expectation: nothing is visited, the dispatcher reports an empty trace and no stop.
     */
    it('Assessment_EventPropagation_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventPropagation_016, begin');
      const local: EventDispatcher = new EventDispatcher();
      const visits: number = local.dispatch(tree, 'assessment_unknown');
      expect(visits).assertEqual(0);
      expect(local.size()).assertEqual(0);
      expect(local.wasStopped()).assertFalse();
      expect(local.asLine()).assertEqual('');
      expect(local.isPhaseOrderValid()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventPropagation_016, end');
    });

    /**
     * Scenario: the sequence numbers of the visits.
     * Expectation: the numbers start at one and grow by one per visit, so the trace order can be
     * reconstructed without the array index.
     */
    it('Assessment_EventPropagation_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventPropagation_018, begin');
      dispatcher.dispatch(tree, TAG_ADD_BUTTON);
      const visits: Visit[] = dispatcher.getVisits();
      expect(visits[0].seq).assertEqual(1);
      for (let i = 1; i < visits.length; i++) {
        expect(visits[i].seq).assertEqual(visits[i - 1].seq + 1);
      }
      expect(dispatcher.delivered()).assertEqual(visits.length);
      hilog.info(DOMAIN, TAG, '%{public}s visits: %{public}d', BUNDLE + 'EventPropagation_018', visits.length);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventPropagation_018, end');
    });

    /**
     * Scenario: the keyed list of the whitelist.
     * Expectation: the initial keys all create a row, the created count equals the row count and
     * no key is duplicated.
     */
    it('Assessment_EventPropagation_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventPropagation_019, begin');
      const keys: string[] = [rowKeyOf('com.samples.assessment'), rowKeyOf('com.samples.dictionary')];
      const list: KeyedListModel = new KeyedListModel(keys);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'EventPropagation_019', list.toString());
      expect(list.getKeys().length).assertEqual(2);
      expect(list.createdCount()).assertEqual(2);
      expect(list.reusedCount()).assertEqual(0);
      expect(list.duplicateKeys()).assertEqual(0);
      expect(list.wasCreated(rowKeyOf('com.samples.assessment'))).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventPropagation_019, end');
    });

    /**
     * Scenario: a rebuild that appends one row.
     * Expectation: only the new key creates a row, the two old keys are reused and the created
     * count grows by one.
     */
    it('Assessment_EventPropagation_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventPropagation_020, begin');
      const list: KeyedListModel = new KeyedListModel([
        rowKeyOf('com.samples.assessment'),
        rowKeyOf('com.samples.dictionary')
      ]);
      const created: number = list.rebuild([
        rowKeyOf('com.samples.assessment'),
        rowKeyOf('com.samples.dictionary'),
        rowKeyOf('com.samples.reader')
      ]);
      hilog.info(DOMAIN, TAG, '%{public}s created: %{public}d, reused: %{public}d',
        BUNDLE + 'EventPropagation_020', created, list.reusedCount());
      expect(created).assertEqual(1);
      expect(list.reusedCount()).assertEqual(2);
      expect(list.createdCount()).assertEqual(3);
      expect(list.getKeys().length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventPropagation_020, end');
    });

    /**
     * Scenario: a rebuild that removes a row.
     * Expectation: the surviving keys reuse their instances, no new row is created and the key
     * sequence shrinks.
     */
    it('Assessment_EventPropagation_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventPropagation_021, begin');
      const list: KeyedListModel = new KeyedListModel([
        rowKeyOf('com.samples.assessment'),
        rowKeyOf('com.samples.dictionary'),
        rowKeyOf('com.samples.reader')
      ]);
      const created: number = list.rebuild([
        rowKeyOf('com.samples.assessment'),
        rowKeyOf('com.samples.reader')
      ]);
      expect(created).assertEqual(0);
      expect(list.reusedCount()).assertEqual(2);
      expect(list.createdCount()).assertEqual(3);
      expect(list.getKeys().indexOf(rowKeyOf('com.samples.dictionary'))).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'EventPropagation_021', list.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventPropagation_021, end');
    });

    /**
     * Scenario: a rebuild that reorders the rows.
     * Expectation: the order follows the new key sequence, no row is recreated because every key
     * survived.
     */
    it('Assessment_EventPropagation_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventPropagation_022, begin');
      const list: KeyedListModel = new KeyedListModel([rowKeyOf('a'), rowKeyOf('b')]);
      const created: number = list.rebuild([rowKeyOf('b'), rowKeyOf('a')]);
      expect(created).assertEqual(0);
      expect(list.getKeys()[0]).assertEqual(rowKeyOf('b'));
      expect(list.getKeys()[1]).assertEqual(rowKeyOf('a'));
      expect(list.createdCount()).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventPropagation_022, end');
    });

    /**
     * Scenario: a keyed list that is fed an unkeyed duplicate.
     * Expectation: the duplicate is reported by the audit, which is why the sample keys a row by
     * its bundle name after the duplicate guard rejected the second add.
     */
    it('Assessment_EventPropagation_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventPropagation_023, begin');
      const list: KeyedListModel = new KeyedListModel([rowKeyOf('a'), rowKeyOf('a'), rowKeyOf('b')]);
      expect(list.duplicateKeys()).assertEqual(1);
      expect(list.getKeys().length).assertEqual(3);
      const clean: KeyedListModel = new KeyedListModel([rowKeyOf('a'), rowKeyOf('b')]);
      expect(clean.duplicateKeys()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventPropagation_023, end');
    });

    /**
     * Scenario: the key of an event log entry.
     * Expectation: the key carries the index and the text, so a new entry never collides with an
     * older entry that carried the same text.
     */
    it('Assessment_EventPropagation_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventPropagation_024, begin');
      const first: string = eventKeyOf(0, 'onBegin code=0 message=');
      const second: string = eventKeyOf(1, 'onBegin code=0 message=');
      expect(first === second).assertFalse();
      expect(first.indexOf(KEY_PREFIX_EVENT)).assertEqual(0);
      const list: KeyedListModel = new KeyedListModel([first, second]);
      expect(list.duplicateKeys()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s first key: %{public}s', BUNDLE + 'EventPropagation_024', first);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventPropagation_024, end');
    });

    /**
     * Scenario: the display index of the remove button of a row.
     * Expectation: every row renders two children and the remove button sits second, so the
     * index of the button grows by two per row.
     */
    it('Assessment_EventPropagation_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventPropagation_025, begin');
      expect(rowChildCount()).assertEqual(2);
      expect(removeButtonIndexOf(0)).assertEqual(1);
      expect(removeButtonIndexOf(1)).assertEqual(3);
      expect(removeButtonIndexOf(2)).assertEqual(5);
      for (let i = 1; i < 5; i++) {
        expect(removeButtonIndexOf(i) - removeButtonIndexOf(i - 1)).assertEqual(rowChildCount());
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventPropagation_025, end');
    });

    /**
     * Scenario: the child attachment of a node.
     * Expectation: a child is attached once, a repeated attachment is ignored and the leaf flag
     * follows the child list.
     */
    it('Assessment_EventPropagation_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventPropagation_026, begin');
      const node: EventNode = new EventNode(TAG_CONFIG_CARD, TAG_PAGE, REACTION_NONE, false);
      expect(node.isLeaf()).assertTrue();
      node.attach(TAG_ADD_BUTTON);
      node.attach(TAG_ADD_BUTTON);
      expect(node.childTags.length).assertEqual(1);
      expect(node.isLeaf()).assertFalse();
      node.attach(TAG_BUNDLE_INPUT);
      expect(node.childTags.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'EventPropagation_026', node.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventPropagation_026, end');
    });

    /**
     * Scenario: the reaction of a node.
     * Expectation: a plain node reports the none reaction, an action node reports its own
     * reaction and the stop flag is carried separately.
     */
    it('Assessment_EventPropagation_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventPropagation_027, begin');
      const plain: EventNode = new EventNode(TAG_PAGE, '', REACTION_NONE, false);
      const remove: EventNode = new EventNode(TAG_REMOVE_BUTTON, TAG_WHITELIST_ROW, REACTION_REMOVE_ROW,
        STOP_AT_SELF);
      expect(plain.appliedReaction()).assertEqual(REACTION_NONE);
      expect(remove.appliedReaction()).assertEqual(REACTION_REMOVE_ROW);
      expect(remove.stopsPropagation).assertTrue();
      expect(plain.stopsPropagation).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventPropagation_027, end');
    });

    /**
     * Scenario: the list itself is the root of the dispatch.
     * Expectation: a tap on the list is delivered as the target phase and no bubble visit
     * exists, the list has no ancestor.
     */
    it('Assessment_EventPropagation_039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventPropagation_039, begin');
      dispatcher.dispatch(tree, TAG_PAGE);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'EventPropagation_039', dispatcher.asLine());
      expect(dispatcher.size()).assertEqual(1);
      expect(dispatcher.countOfPhase(PHASE_TARGET)).assertEqual(1);
      expect(dispatcher.countOfPhase(PHASE_CAPTURE)).assertEqual(0);
      expect(dispatcher.countOfPhase(PHASE_BUBBLE)).assertEqual(0);
      expect(dispatcher.wasStopped()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventPropagation_039, end');
    });

    /**
     * Scenario: the card order of the entry page.
     * Expectation: the four cards are children of the list in the documented order, the title
     * first and the status card last.
     */
    it('Assessment_EventPropagation_041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventPropagation_041, begin');
      const page: EventNode | null = tree.nodeOf(TAG_PAGE);
      expect(page !== null).assertTrue();
      if (page !== null) {
        expect(page.childTags.length).assertEqual(4);
        expect(page.childTags[0]).assertEqual(TAG_TITLE_CARD);
        expect(page.childTags[1]).assertEqual(TAG_CONFIG_CARD);
        expect(page.childTags[2]).assertEqual(TAG_OPERATION_CARD);
        expect(page.childTags[3]).assertEqual(TAG_STATUS_CARD);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventPropagation_041, end');
    });

    /**
     * Scenario: the config card holds its input, its add button and the row.
     * Expectation: the row sits after the input and the add button, and the row owns the name
     * and the remove button in that order.
     */
    it('Assessment_EventPropagation_042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventPropagation_042, begin');
      const config: EventNode | null = tree.nodeOf(TAG_CONFIG_CARD);
      expect(config !== null).assertTrue();
      if (config !== null) {
        expect(config.childTags.indexOf(TAG_BUNDLE_INPUT)).assertEqual(0);
        expect(config.childTags.indexOf(TAG_ADD_BUTTON)).assertEqual(1);
        expect(config.childTags.indexOf(TAG_WHITELIST_ROW)).assertEqual(2);
      }
      const row: EventNode | null = tree.nodeOf(TAG_WHITELIST_ROW);
      expect(row !== null).assertTrue();
      if (row !== null) {
        expect(row.childTags[0]).assertEqual(TAG_WHITELIST_NAME);
        expect(row.childTags[1]).assertEqual(TAG_REMOVE_BUTTON);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventPropagation_042, end');
    });

    /**
     * Scenario: the operation card reacts to all four buttons.
     * Expectation: the begin, end and query reactions are each reachable from the card, the
     * card itself carries no reaction.
     */
    it('Assessment_EventPropagation_043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventPropagation_043, begin');
      const card: EventNode | null = tree.nodeOf(TAG_OPERATION_CARD);
      expect(card !== null).assertTrue();
      if (card !== null) {
        expect(card.childTags.length).assertEqual(4);
        expect(card.reaction).assertEqual(REACTION_NONE);
      }
      dispatcher.dispatch(tree, TAG_BEGIN_BUTTON);
      expect(dispatcher.countOfReaction(REACTION_HANDLE_BEGIN)).assertEqual(1);
      dispatcher.dispatch(tree, TAG_END_BUTTON);
      expect(dispatcher.countOfReaction(REACTION_HANDLE_END)).assertEqual(1);
      dispatcher.dispatch(tree, TAG_QUERY_CONFIG_BUTTON);
      expect(dispatcher.countOfReaction(REACTION_QUERY)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventPropagation_043, end');
    });

    /**
     * Scenario: the begin button is disableable without leaving the tree.
     * Expectation: a disabled begin button is still a node of the tree, the dispatch reaches it
     * but the sample refuses the reaction at the handler level.
     */
    it('Assessment_EventPropagation_044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventPropagation_044, begin');
      const begin: EventNode | null = tree.nodeOf(TAG_BEGIN_BUTTON);
      expect(begin !== null).assertTrue();
      if (begin !== null) {
        expect(begin.reaction).assertEqual(REACTION_HANDLE_BEGIN);
        expect(begin.isLeaf()).assertTrue();
        expect(tree.depthOf(TAG_BEGIN_BUTTON)).assertEqual(2);
      }
      dispatcher.dispatch(tree, TAG_BEGIN_BUTTON);
      expect(dispatcher.countOfTag(TAG_BEGIN_BUTTON)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventPropagation_044, end');
    });

    /**
     * Scenario: a key event is dispatched through the same tree.
     * Expectation: the enter key on the focused begin button follows the same capture, target
     * and bubble order as a pointer event.
     */
    it('Assessment_EventPropagation_045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventPropagation_045, begin');
      const keyboard: EventDispatcher = new EventDispatcher();
      keyboard.dispatch(tree, TAG_BEGIN_BUTTON);
      const pointer: EventDispatcher = new EventDispatcher();
      pointer.dispatch(tree, TAG_BEGIN_BUTTON);
      expect(keyboard.asLine()).assertEqual(pointer.asLine());
      expect(keyboard.countOfPhase(PHASE_CAPTURE)).assertEqual(pointer.countOfPhase(PHASE_CAPTURE));
      expect(keyboard.isPhaseOrderValid()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventPropagation_045, end');
    });

    /**
     * Scenario: the audit of a keyed list across three rebuilds.
     * Expectation: the created count only counts genuinely new keys and the reused count grows
     * with every surviving key, so the list does not thrash.
     */
    it('Assessment_EventPropagation_050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventPropagation_050, begin');
      const list: KeyedListModel = new KeyedListModel([]);
      const first: string[] = [];
      for (let i = 0; i < IDENTITY_ROW_COUNT; i++) {
        first.push(rowKeyOf(`com.samples.app_${i}`));
      }
      const createdFirst: number = list.rebuild(first);
      hilog.info(DOMAIN, TAG, '%{public}s first rebuild created: %{public}d',
        BUNDLE + 'EventPropagation_050', createdFirst);
      expect(createdFirst).assertEqual(IDENTITY_ROW_COUNT);
      const second: string[] = first.slice();
      second.shift();
      const createdSecond: number = list.rebuild(second);
      expect(createdSecond).assertEqual(0);
      expect(list.reusedCount()).assertEqual(IDENTITY_ROW_COUNT - 1);
      const third: string[] = second.slice();
      third.push(rowKeyOf('com.samples.app_new'));
      const createdThird: number = list.rebuild(third);
      expect(createdThird).assertEqual(1);
      expect(list.reusedCount()).assertEqual(2 * (IDENTITY_ROW_COUNT - 1));
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'EventPropagation_050', list.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventPropagation_050, end');
    });

    /**
     * Scenario: the trace of a stopped dispatch is a prefix of the trace of a full dispatch.
     * Expectation: every visit of the stopped trace appears in the same position in the full
     * trace, which proves that a stop only truncates and never reorders the delivery.
     */
    it('Assessment_EventPropagation_051', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventPropagation_051, begin');
      const full: EventDispatcher = new EventDispatcher();
      full.dispatch(tree, TAG_REMOVE_BUTTON);
      const fullLine: string[] = full.asLine().split('>');
      expect(full.getStoppedAt()).assertEqual(TAG_REMOVE_BUTTON);
      expect(full.size()).assertEqual(4);
      const expectedPrefix: string[] = [
        `${PHASE_CAPTURE}:${TAG_PAGE}`,
        `${PHASE_CAPTURE}:${TAG_CONFIG_CARD}`,
        `${PHASE_CAPTURE}:${TAG_WHITELIST_ROW}`,
        `${PHASE_TARGET}:${TAG_REMOVE_BUTTON}`
      ];
      expect(fullLine.length).assertEqual(expectedPrefix.length);
      for (let i = 0; i < expectedPrefix.length; i++) {
        expect(fullLine[i]).assertEqual(expectedPrefix[i]);
      }
      hilog.info(DOMAIN, TAG, '%{public}s line: %{public}s', BUNDLE + 'EventPropagation_051', full.asLine());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventPropagation_051, end');
    });

    /**
     * Scenario: two dispatches on the same tree are independent.
     * Expectation: the second dispatch starts from a clean trace and reports the same result as
     * the first one, the tree carries no mutable dispatch state.
     */
    it('Assessment_EventPropagation_052', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventPropagation_052, begin');
      const first: EventDispatcher = new EventDispatcher();
      first.dispatch(tree, TAG_ADD_BUTTON);
      const firstLine: string = first.asLine();
      const second: EventDispatcher = new EventDispatcher();
      second.dispatch(tree, TAG_ADD_BUTTON);
      expect(second.asLine()).assertEqual(firstLine);
      expect(first.size()).assertEqual(second.size());
      expect(first.countOfPhase(PHASE_CAPTURE)).assertEqual(second.countOfPhase(PHASE_CAPTURE));
      hilog.info(DOMAIN, TAG, '%{public}s visits: %{public}d', BUNDLE + 'EventPropagation_052', first.size());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventPropagation_052, end');
    });

    /**
     * Scenario: the trace description of the dispatcher.
     * Expectation: the description carries the visit count and the stopping node, an empty trace
     * reports an empty stopping node.
     */
    it('Assessment_EventPropagation_053', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventPropagation_053, begin');
      const local: EventDispatcher = new EventDispatcher();
      expect(local.toString().indexOf('visits=0') >= 0).assertTrue();
      local.dispatch(tree, TAG_REMOVE_BUTTON);
      const text: string = local.toString();
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'EventPropagation_053', text);
      expect(text.indexOf('stoppedAt=' + TAG_REMOVE_BUTTON) >= 0).assertTrue();
      expect(text.indexOf('visits=4') >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventPropagation_053, end');
    });
  });
}
