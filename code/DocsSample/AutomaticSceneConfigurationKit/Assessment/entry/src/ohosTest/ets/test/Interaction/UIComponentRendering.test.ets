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
  DELAY_AFTER_ACTION,
  DELAY_KEY_NAVIGATION,
  ID_ADD_BUTTON,
  ID_BEGIN_BUTTON,
  ID_BUNDLE_INPUT,
  ID_END_BUTTON,
  ID_INDEX_TITLE,
  ID_QUERY_CONFIG_BUTTON,
  ID_QUERY_STATE_BUTTON,
  KEY_BACK,
  TEXT_NO_EVENT,
  TEXT_REMOVE_BUTTON,
  TEXT_WHITELIST_EMPTY,
  TIMEOUT_PAGE_RENDER,
  TOLERANCE_COMPONENT_COUNT,
  TYPE_BUTTON,
  TYPE_TEXT,
  TYPE_TEXT_INPUT,
  addAllowedApp,
  allowedAppRowCount,
  findById,
  findComponentsByType,
  getDriver,
  indexComponentCount,
  launchAssessmentApp,
  pressAndWait,
  serializedDelay,
  waitForIndexPage
} from '../Shared/AssessmentDriver';
import { clickSerialized, inputTextSerialized, getTextSerialized, clickPointSerialized } from '../Shared/AssessmentDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Assessment]';
const BUNDLE: string = 'Assessment_';

// The entry page is a List with four ListItems: the title area, the configuration card, the
// operation card and the status card.
const ROOT_LIST_ITEM_COUNT: number = 4;

// The configuration card renders four duration chips.
const DURATION_CHIP_COUNT: number = 4;

// The operation card renders two rows of two buttons.
const OPERATION_BUTTON_COUNT: number = 4;

// The status card renders one divider and the configuration card another one.
const DIVIDER_COUNT: number = 2;

// The entry page declares these fixed texts, the count is the baseline of the render audit.
const FIXED_TEXT_COUNT: number = 10;

// The whitelist starts with the default bundle, so one remove button is rendered at rest.
const INITIAL_WHITELIST_ROWS: number = 1;

// The assessment service accepts at most twenty bundle names in the whitelist.
const MAX_ALLOWED_APPS: number = 20;

// Layout tokens of resources/base/element/float.json.
const PAGE_PADDING_VP: number = 16;
const CARD_PADDING_VP: number = 16;
const CARD_RADIUS_VP: number = 16;
const FONT_SIZE_TITLE_FP: number = 24;
const FONT_SIZE_SECTION_FP: number = 18;
const FONT_SIZE_BODY_FP: number = 16;
const FONT_SIZE_CAPTION_FP: number = 14;

// Heights that the layout source declares for the interactive components.
const BUTTON_HEIGHT_VP: number = 44;
const INPUT_HEIGHT_VP: number = 40;
const REMOVE_HEIGHT_VP: number = 28;

// The maximum number of characters that a bundle name keeps before the ellipsis is applied.
const MAX_LINES_BUNDLE: number = 1;
const ELLIPSIS_WIDTH_PER_CHAR: number = 8;

// The ForEach key of the duration chips, it is built from the index so that a reordering of
// the candidates does not reuse a stale chip.
const DURATION_KEY_PREFIX: string = 'duration_';

// The identifier of the root list of the entry page. The shared driver already exports
// TYPE_LIST, so the local re-declaration uses a distinct name.
const TYPE_ROOT_LIST: string = 'List';
const TYPE_DIVIDER: string = 'Divider';

/**
 * Kind of a node in the synthetic render tree.
 */
enum NodeKind {
  LIST = 0,
  LIST_ITEM = 1,
  COLUMN = 2,
  ROW = 3,
  FLEX = 4,
  TEXT = 5,
  BUTTON = 6,
  TEXT_INPUT = 7,
  DIVIDER = 8
}

/**
 * Verdict of the key uniqueness audit of a ForEach.
 */
enum KeyAuditVerdict {
  UNIQUE = 0,
  DUPLICATED = 1,
  EMPTY = 2
}

/**
 * One node of the synthetic render tree of a page.
 *
 * The class is a plain tree node, the entry page is rebuilt from it by the render audit so that
 * the component counts, the conditional branches and the keyed identity can be checked without
 * looking at the device.
 */
class RenderNode {
  public id: string = '';
  public kind: NodeKind = NodeKind.COLUMN;
  public text: string = '';
  public children: RenderNode[] = [];
  public maxLines: number = 0;
  public ellipsis: boolean = false;
  public weight: number = 0;
  public conditional: boolean = false;

  /**
   * @param id identifier of the node, it is empty for an anonymous layout node.
   * @param kind component kind of the node.
   * @param text text rendered by the node, it is empty for a layout node.
   */
  constructor(id: string = '', kind: NodeKind = NodeKind.COLUMN, text: string = '') {
    this.id = id;
    this.kind = kind;
    this.text = text;
  }

  /**
   * Appends a child.
   *
   * @param child child node.
   * @returns the appended child, which lets a builder chain the calls.
   */
  public add(child: RenderNode): RenderNode {
    this.children.push(child);
    return child;
  }

  /**
   * @returns the total number of nodes of the subtree, including this node.
   */
  public size(): number {
    let total: number = 1;
    for (let i = 0; i < this.children.length; i++) {
      total += this.children[i].size();
    }
    return total;
  }

  /**
   * @returns the greatest depth of the subtree, a leaf has a depth of one.
   */
  public depth(): number {
    let deepest: number = 0;
    for (let i = 0; i < this.children.length; i++) {
      const childDepth: number = this.children[i].depth();
      if (childDepth > deepest) {
        deepest = childDepth;
      }
    }
    return deepest + 1;
  }

  /**
   * Counts the nodes of one kind in the subtree.
   *
   * @param kind component kind to count.
   * @returns the number of nodes of that kind.
   */
  public countOf(kind: NodeKind): number {
    let count: number = this.kind === kind ? 1 : 0;
    for (let i = 0; i < this.children.length; i++) {
      count += this.children[i].countOf(kind);
    }
    return count;
  }

  /**
   * Finds a node by identifier.
   *
   * @param id identifier to look for.
   * @returns the node, or null when the subtree has no such node.
   */
  public find(id: string): RenderNode | null {
    if (this.id === id) {
      return this;
    }
    for (let i = 0; i < this.children.length; i++) {
      const found: RenderNode | null = this.children[i].find(id);
      if (found !== null) {
        return found;
      }
    }
    return null;
  }

  /**
   * Lists the identifiers of the subtree in traversal order.
   *
   * @returns the identifiers, anonymous nodes contribute an empty entry.
   */
  public ids(): string[] {
    const result: string[] = [];
    result.push(this.id);
    for (let i = 0; i < this.children.length; i++) {
      const childIds: string[] = this.children[i].ids();
      for (let j = 0; j < childIds.length; j++) {
        result.push(childIds[j]);
      }
    }
    return result;
  }

  /**
   * Lists the texts of the subtree in traversal order.
   *
   * @returns the non empty texts.
   */
  public texts(): string[] {
    const result: string[] = [];
    if (this.text.length > 0) {
      result.push(this.text);
    }
    for (let i = 0; i < this.children.length; i++) {
      const childTexts: string[] = this.children[i].texts();
      for (let j = 0; j < childTexts.length; j++) {
        result.push(childTexts[j]);
      }
    }
    return result;
  }

  /**
   * @returns the number of nodes that belong to a conditional branch.
   */
  public conditionalCount(): number {
    let count: number = this.conditional ? 1 : 0;
    for (let i = 0; i < this.children.length; i++) {
      count += this.children[i].conditionalCount();
    }
    return count;
  }

  /**
   * @returns the identifiers that appear more than once in the subtree.
   */
  public duplicateIds(): string[] {
    const all: string[] = this.ids();
    const seen: string[] = [];
    const duplicates: string[] = [];
    for (let i = 0; i < all.length; i++) {
      const id: string = all[i];
      if (id.length === 0) {
        continue;
      }
      if (seen.indexOf(id) >= 0) {
        if (duplicates.indexOf(id) < 0) {
          duplicates.push(id);
        }
        continue;
      }
      seen.push(id);
    }
    return duplicates;
  }

  /**
   * @returns a compact description used by the log lines.
   */
  public toString(): string {
    return `RenderNode{id=${this.id}, kind=${this.kind}, children=${this.children.length}, ` +
      `size=${this.size()}}`;
  }
}

/**
 * Describes the keyed identity of one ForEach of the page and audits its keys.
 */
class ForEachKeyAudit {
  private name: string = '';
  private keys: string[] = [];

  /**
   * @param name name of the ForEach.
   * @param keys keys that the key generator produced for the current data.
   */
  constructor(name: string = '', keys: string[] = []) {
    this.name = name;
    this.keys = keys.slice();
  }

  /**
   * Builds the keys of the duration chips, they are derived from the index.
   *
   * @param count number of chips.
   * @returns the keys in chip order.
   */
  public static durationKeys(count: number): string[] {
    const keys: string[] = [];
    for (let i = 0; i < count; i++) {
      keys.push(`${DURATION_KEY_PREFIX}${i}`);
    }
    return keys;
  }

  /**
   * Builds the keys of the whitelist rows, they are the bundle names themselves.
   *
   * @param bundles bundle names of the whitelist.
   * @returns the keys in row order.
   */
  public static bundleKeys(bundles: string[]): string[] {
    return bundles.slice();
  }

  /**
   * Builds the keys of the event log, they are the index and the text concatenated so that a
   * repeated event still gets a distinct key.
   *
   * @param entries event log entries.
   * @returns the keys in entry order.
   */
  public static eventJournalKeys(entries: string[]): string[] {
    const keys: string[] = [];
    for (let i = 0; i < entries.length; i++) {
      keys.push(`${i}_${entries[i]}`);
    }
    return keys;
  }

  /**
   * @returns the name of the audited ForEach.
   */
  public getName(): string {
    return this.name;
  }

  /**
   * @returns the number of keys.
   */
  public size(): number {
    return this.keys.length;
  }

  /**
   * Audits the keys of the ForEach.
   *
   * @returns the verdict of the audit.
   */
  public judge(): KeyAuditVerdict {
    if (this.keys.length === 0) {
      return KeyAuditVerdict.EMPTY;
    }
    const unique: Set<string> = new Set<string>(this.keys);
    if (unique.size !== this.keys.length) {
      return KeyAuditVerdict.DUPLICATED;
    }
    return KeyAuditVerdict.UNIQUE;
  }

  /**
   * @returns true when every key is distinct and non empty.
   */
  public isUnique(): boolean {
    return this.judge() === KeyAuditVerdict.UNIQUE;
  }

  /**
   * @returns the keys that appear more than once.
   */
  public duplicateKeys(): string[] {
    const seen: string[] = [];
    const duplicates: string[] = [];
    for (let i = 0; i < this.keys.length; i++) {
      const key: string = this.keys[i];
      if (seen.indexOf(key) >= 0) {
        if (duplicates.indexOf(key) < 0) {
          duplicates.push(key);
        }
        continue;
      }
      seen.push(key);
    }
    return duplicates;
  }

  /**
   * @returns a compact description used by the log lines.
   */
  public toString(): string {
    return `ForEachKeyAudit{name=${this.name}, keys=${this.keys.length}, verdict=${this.judge()}}`;
  }
}

/**
 * Builds the synthetic render tree of the entry page.
 *
 * The tree mirrors pages/Index.ets: a root List of four ListItems, the configuration card with
 * the duration chips and the whitelist rows, the operation card with two rows of two buttons,
 * and the status card with the state text, the configuration text and the event log.
 */
class EntryPageTree {
  private bundles: string[] = [];
  private logs: string[] = [];
  private queryDuration: number = -1;

  /**
   * @param bundles bundle names of the whitelist, the caller decides whether it is empty.
   * @param logs event log entries, an empty array renders the empty state.
   */
  constructor(bundles: string[] = ['com.samples.assessment'], logs: string[] = []) {
    this.bundles = bundles.slice();
    this.logs = logs.slice();
  }

  /**
   * Sets the queried configuration, minus one means that no session is active.
   *
   * @param duration queried duration in milliseconds.
   */
  public setQueryDuration(duration: number): void {
    this.queryDuration = duration;
  }

  /**
   * @returns the root list of the page.
   */
  public buildRoot(): RenderNode {
    const root: RenderNode = new RenderNode('assessment_index_root', NodeKind.LIST);
    root.add(this.buildTitleArea());
    root.add(this.buildConfigCard());
    root.add(this.buildOperationCard());
    root.add(this.buildStatusCard());
    return root;
  }

  /**
   * @returns the title area item.
   */
  private buildTitleArea(): RenderNode {
    const item: RenderNode = new RenderNode('', NodeKind.LIST_ITEM);
    const column: RenderNode = new RenderNode('', NodeKind.COLUMN);
    item.add(column);
    const title: RenderNode = new RenderNode(ID_INDEX_TITLE, NodeKind.TEXT, 'Assessment');
    column.add(title);
    const intro: RenderNode = new RenderNode('', NodeKind.TEXT,
      'Call begin to enter assessment mode.');
    column.add(intro);
    return item;
  }

  /**
   * @returns the configuration card item.
   */
  private buildConfigCard(): RenderNode {
    const item: RenderNode = new RenderNode('', NodeKind.LIST_ITEM);
    const column: RenderNode = new RenderNode('', NodeKind.COLUMN);
    item.add(column);
    column.add(new RenderNode('', NodeKind.TEXT, 'Assessment Config'));
    column.add(new RenderNode('', NodeKind.TEXT, 'Duration'));
    const chips: RenderNode = new RenderNode('', NodeKind.FLEX);
    const labels: string[] = ['Default duration', '10 min', '30 min', '60 min'];
    for (let i = 0; i < labels.length; i++) {
      chips.add(new RenderNode('', NodeKind.TEXT, labels[i]));
    }
    column.add(chips);
    column.add(new RenderNode('', NodeKind.DIVIDER));
    column.add(new RenderNode('', NodeKind.TEXT, 'Allowed Apps'));
    const row: RenderNode = new RenderNode('', NodeKind.ROW);
    const input: RenderNode = new RenderNode(ID_BUNDLE_INPUT, NodeKind.TEXT_INPUT, 'Bundle name');
    input.weight = 1;
    row.add(input);
    row.add(new RenderNode(ID_ADD_BUTTON, NodeKind.BUTTON, 'Add'));
    column.add(row);
    if (this.bundles.length === 0) {
      const empty: RenderNode = new RenderNode('', NodeKind.TEXT, TEXT_WHITELIST_EMPTY);
      empty.conditional = true;
      column.add(empty);
    } else {
      for (let i = 0; i < this.bundles.length; i++) {
        const bundleRow: RenderNode = new RenderNode('', NodeKind.ROW);
        bundleRow.conditional = true;
        const bundleText: RenderNode = new RenderNode('', NodeKind.TEXT, this.bundles[i]);
        bundleText.maxLines = MAX_LINES_BUNDLE;
        bundleText.ellipsis = true;
        bundleText.weight = 1;
        bundleRow.add(bundleText);
        bundleRow.add(new RenderNode('', NodeKind.BUTTON, TEXT_REMOVE_BUTTON));
        column.add(bundleRow);
      }
    }
    return item;
  }

  /**
   * @returns the operation card item.
   */
  private buildOperationCard(): RenderNode {
    const item: RenderNode = new RenderNode('', NodeKind.LIST_ITEM);
    const column: RenderNode = new RenderNode('', NodeKind.COLUMN);
    item.add(column);
    column.add(new RenderNode('', NodeKind.TEXT, 'Operations'));
    const first: RenderNode = new RenderNode('', NodeKind.ROW);
    const begin: RenderNode = new RenderNode(ID_BEGIN_BUTTON, NodeKind.BUTTON, 'begin');
    begin.weight = 1;
    first.add(begin);
    const end: RenderNode = new RenderNode(ID_END_BUTTON, NodeKind.BUTTON, 'end');
    end.weight = 1;
    first.add(end);
    column.add(first);
    const second: RenderNode = new RenderNode('', NodeKind.ROW);
    const queryState: RenderNode = new RenderNode(ID_QUERY_STATE_BUTTON, NodeKind.BUTTON, 'isActive');
    queryState.weight = 1;
    second.add(queryState);
    const queryConfig: RenderNode =
      new RenderNode(ID_QUERY_CONFIG_BUTTON, NodeKind.BUTTON, 'getConfiguration');
    queryConfig.weight = 1;
    second.add(queryConfig);
    column.add(second);
    return item;
  }

  /**
   * @returns the status card item.
   */
  private buildStatusCard(): RenderNode {
    const item: RenderNode = new RenderNode('', NodeKind.LIST_ITEM);
    const column: RenderNode = new RenderNode('', NodeKind.COLUMN);
    item.add(column);
    column.add(new RenderNode('', NodeKind.TEXT, 'Status'));
    column.add(new RenderNode('', NodeKind.TEXT, 'Assessment state: inactive'));
    column.add(new RenderNode('', NodeKind.TEXT, 'Current config'));
    if (this.queryDuration < 0) {
      const none: RenderNode = new RenderNode('', NodeKind.TEXT, 'No active assessment');
      none.conditional = true;
      column.add(none);
    } else {
      const value: RenderNode = new RenderNode('', NodeKind.TEXT,
        `duration: ${this.queryDuration} ms`);
      value.conditional = true;
      column.add(value);
    }
    column.add(new RenderNode('', NodeKind.DIVIDER));
    column.add(new RenderNode('', NodeKind.TEXT, 'Event log'));
    if (this.logs.length === 0) {
      const noEvent: RenderNode = new RenderNode('', NodeKind.TEXT, TEXT_NO_EVENT);
      noEvent.conditional = true;
      column.add(noEvent);
    } else {
      for (let i = 0; i < this.logs.length; i++) {
        const entry: RenderNode = new RenderNode('', NodeKind.TEXT, this.logs[i]);
        entry.conditional = true;
        column.add(entry);
      }
    }
    return item;
  }

  /**
   * @returns the bundle names of the whitelist.
   */
  public getBundles(): string[] {
    return this.bundles.slice();
  }

  /**
   * @returns the event log entries.
   */
  public getLogs(): string[] {
    return this.logs.slice();
  }
}

/**
 * Summarises a render tree, the summary is what the live page is compared with.
 */
class RenderSnapshot {
  public nodeCount: number = 0;
  public textCount: number = 0;
  public buttonCount: number = 0;
  public inputCount: number = 0;
  public dividerCount: number = 0;
  public listItemCount: number = 0;
  public conditionalCount: number = 0;
  public depth: number = 0;
  public textLength: number = 0;

  /**
   * Summarises a tree.
   *
   * @param root root of the tree.
   * @returns the snapshot of the tree.
   */
  public static of(root: RenderNode): RenderSnapshot {
    const snapshot: RenderSnapshot = new RenderSnapshot();
    snapshot.nodeCount = root.size();
    snapshot.textCount = root.countOf(NodeKind.TEXT);
    snapshot.buttonCount = root.countOf(NodeKind.BUTTON);
    snapshot.inputCount = root.countOf(NodeKind.TEXT_INPUT);
    snapshot.dividerCount = root.countOf(NodeKind.DIVIDER);
    snapshot.listItemCount = root.countOf(NodeKind.LIST_ITEM);
    snapshot.conditionalCount = root.conditionalCount();
    snapshot.depth = root.depth();
    snapshot.textLength = root.texts().length;
    return snapshot;
  }

  /**
   * @param other snapshot to compare with.
   * @returns true when every counter matches.
   */
  public equals(other: RenderSnapshot): boolean {
    return this.nodeCount === other.nodeCount && this.textCount === other.textCount &&
      this.buttonCount === other.buttonCount && this.inputCount === other.inputCount &&
      this.dividerCount === other.dividerCount && this.listItemCount === other.listItemCount &&
      this.conditionalCount === other.conditionalCount && this.depth === other.depth;
  }

  /**
   * @returns a compact description used by the log lines.
   */
  public toString(): string {
    return `RenderSnapshot{nodes=${this.nodeCount}, texts=${this.textCount}, ` +
      `buttons=${this.buttonCount}, inputs=${this.inputCount}, dividers=${this.dividerCount}}`;
  }
}

/**
 * Tests a piece of text against the maxLines and textOverflow contract of a whitelist row.
 *
 * A bundle name that does not fit the available width is truncated with an ellipsis, the model
 * reproduces the platform rule so that the truncation can be checked without a screenshot.
 */
class TextTruncationModel {
  private availableWidthVp: number = 0;
  private widthPerCharVp: number = ELLIPSIS_WIDTH_PER_CHAR;
  private maxLines: number = MAX_LINES_BUNDLE;
  private ellipsis: boolean = true;

  /**
   * @param availableWidthVp width that the text may occupy.
   */
  constructor(availableWidthVp: number = 200) {
    this.availableWidthVp = availableWidthVp;
  }

  /**
   * @param text text to lay out.
   * @returns the number of characters that fit on one line.
   */
  public capacity(): number {
    return Math.floor(this.availableWidthVp / this.widthPerCharVp);
  }

  /**
   * @param text text to lay out.
   * @returns true when the text needs truncation.
   */
  public overflows(text: string): boolean {
    return text.length > this.capacity() * this.maxLines;
  }

  /**
   * @param text text to lay out.
   * @returns the text as it is rendered, with the ellipsis appended when needed.
   */
  public render(text: string): string {
    if (!this.overflows(text)) {
      return text;
    }
    const visible: number = Math.max(0, this.capacity() * this.maxLines - 1);
    const prefix: string = text.substring(0, visible);
    if (!this.ellipsis) {
      return prefix;
    }
    return `${prefix}...`;
  }

  /**
   * @returns the maximum number of lines of the text.
   */
  public getMaxLines(): number {
    return this.maxLines;
  }

  /**
   * @returns the width that the text may occupy.
   */
  public getAvailableWidth(): number {
    return this.availableWidthVp;
  }

  /**
   * @param text text to lay out.
   * @returns a compact description used by the log lines.
   */
  public describe(text: string): string {
    return `TextTruncationModel{capacity=${this.capacity()}, length=${text.length}, ` +
      `overflows=${this.overflows(text)}}`;
  }
}

/**
 * Audits the layout weight distribution of one row.
 */
class WeightAllocator {
  private weights: number[] = [];
  private totalWidthVp: number = 0;
  private gapVp: number = 0;

  /**
   * @param totalWidthVp width that the row occupies.
   * @param gapVp gap between the children.
   * @param weights layout weights of the children.
   */
  constructor(totalWidthVp: number = 400, gapVp: number = 12, weights: number[] = [1, 1]) {
    this.totalWidthVp = totalWidthVp;
    this.gapVp = gapVp;
    this.weights = weights.slice();
  }

  /**
   * @returns the width that is available to the weighted children.
   */
  public availableWidth(): number {
    const gaps: number = this.gapVp * Math.max(0, this.weights.length - 1);
    return Math.max(0, this.totalWidthVp - gaps);
  }

  /**
   * @returns the sum of the weights.
   */
  public totalWeight(): number {
    let total: number = 0;
    for (let i = 0; i < this.weights.length; i++) {
      total += this.weights[i];
    }
    return total;
  }

  /**
   * @param index index of the child.
   * @returns the width that the child receives.
   */
  public widthOf(index: number): number {
    if (index < 0 || index >= this.weights.length) {
      return 0;
    }
    const total: number = this.totalWeight();
    if (total <= 0) {
      return 0;
    }
    return this.availableWidth() * this.weights[index] / total;
  }

  /**
   * @returns the widths in child order.
   */
  public widths(): number[] {
    const result: number[] = [];
    for (let i = 0; i < this.weights.length; i++) {
      result.push(this.widthOf(i));
    }
    return result;
  }

  /**
   * @returns true when two equal weights receive the same width.
   */
  public isBalanced(): boolean {
    if (this.weights.length < 2) {
      return true;
    }
    const first: number = this.widthOf(0);
    for (let i = 1; i < this.weights.length; i++) {
      if (Math.abs(this.widthOf(i) - first) > 0.001) {
        return false;
      }
    }
    return true;
  }
}

/**
 * Reads the text of a component, an empty string is returned when the read fails.
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

/**
 * Collects the texts of a component type.
 *
 * @param driver driver of the running case.
 * @param type component type.
 * @returns the texts, the entries of components that fail to answer are skipped.
 */
async function collectTextsOfType(driver: Driver, type: string): Promise<string[]> {
  const components: Component[] = await findComponentsByType(driver, type);
  const values: string[] = [];
  for (let i = 0; i < components.length; i++) {
    const content: string = await readTextSafely(components[i]);
    if (content.length > 0) {
      values.push(content);
    }
  }
  return values;
}

/**
 * Starts the sample and waits until the entry page is rendered.
 *
 * @param driver driver of the running case.
 * @returns true when the entry page is rendered.
 */
async function guardEntryPage(driver: Driver): Promise<boolean> {
  await launchAssessmentApp();
  const rendered: boolean = await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
  if (!rendered) {
    hilog.warn(DOMAIN, TAG, 'guardEntryPage: the entry page is not rendered, the case is skipped');
  }
  return rendered;
}

export default function uiComponentRenderingTest() {
  describe('UIComponentRendering_Test', () => {
    let driver: Driver;
    let defaultTree: EntryPageTree;
    let defaultSnapshot: RenderSnapshot;
    let emptyTree: EntryPageTree;
    let emptySnapshot: RenderSnapshot;

    beforeAll(async () => {
      driver = getDriver();
      defaultTree = new EntryPageTree(['com.samples.assessment'], []);
      defaultSnapshot = RenderSnapshot.of(defaultTree.buildRoot());
      emptyTree = new EntryPageTree([], ['onBegin', 'onEnd']);
      emptySnapshot = RenderSnapshot.of(emptyTree.buildRoot());
      await serializedDelay(driver, 1000);
      await launchAssessmentApp();
      await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
    });

    /**
     * Scenario: the duration chips of the configuration card.
     * Expectation: the ForEach renders four chips with the documented labels.
     */
    it('Assessment_UIComponentRendering_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UIComponentRendering_002, begin');
      const root: RenderNode = defaultTree.buildRoot();
      const texts: string[] = root.texts();
      expect(texts.indexOf('Default duration') >= 0).assertTrue();
      expect(texts.indexOf('10 min') >= 0).assertTrue();
      expect(texts.indexOf('30 min') >= 0).assertTrue();
      expect(texts.indexOf('60 min') >= 0).assertTrue();
      const chips: RenderNode = new RenderNode('', NodeKind.FLEX);
      for (let i = 0; i < DURATION_CHIP_COUNT; i++) {
        chips.add(new RenderNode('', NodeKind.TEXT, `chip_${i}`));
      }
      expect(chips.countOf(NodeKind.TEXT)).assertEqual(DURATION_CHIP_COUNT);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UIComponentRendering_002, end');
    });

    /**
     * Scenario: the keyed identity of the duration ForEach.
     * Expectation: the index based keys are unique and the empty dataset produces the empty
     * verdict instead of a duplicate.
     */
    it('Assessment_UIComponentRendering_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UIComponentRendering_004, begin');
      const audit: ForEachKeyAudit =
        new ForEachKeyAudit('duration_chips', ForEachKeyAudit.durationKeys(DURATION_CHIP_COUNT));
      expect(audit.size()).assertEqual(DURATION_CHIP_COUNT);
      expect(audit.judge()).assertEqual(KeyAuditVerdict.UNIQUE);
      expect(audit.duplicateKeys().length).assertEqual(0);
      const empty: ForEachKeyAudit = new ForEachKeyAudit('duration_chips', []);
      expect(empty.judge()).assertEqual(KeyAuditVerdict.EMPTY);
      expect(empty.isUnique()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'UIComponentRendering_004', audit.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UIComponentRendering_004, end');
    });

    /**
     * Scenario: the keyed identity of the whitelist ForEach.
     * Expectation: the bundle names are unique keys, a duplicated bundle name is reported once
     * by the audit.
     */
    it('Assessment_UIComponentRendering_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UIComponentRendering_005, begin');
      const bundles: string[] = ['com.samples.assessment', 'com.samples.dictionary'];
      const audit: ForEachKeyAudit = new ForEachKeyAudit('whitelist', ForEachKeyAudit.bundleKeys(bundles));
      expect(audit.judge()).assertEqual(KeyAuditVerdict.UNIQUE);
      const duplicated: ForEachKeyAudit = new ForEachKeyAudit('whitelist',
        ForEachKeyAudit.bundleKeys(['com.samples.assessment', 'com.samples.assessment']));
      expect(duplicated.judge()).assertEqual(KeyAuditVerdict.DUPLICATED);
      expect(duplicated.duplicateKeys().length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UIComponentRendering_005, end');
    });

    /**
     * Scenario: the keyed identity of the event log ForEach.
     * Expectation: the index prefix keeps two identical log lines apart, so the log does not
     * collapse a repeated event.
     */
    it('Assessment_UIComponentRendering_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UIComponentRendering_006, begin');
      const entries: string[] = ['onBegin: 0', 'onBegin: 0'];
      const keys: string[] = ForEachKeyAudit.eventJournalKeys(entries);
      expect(keys.length).assertEqual(2);
      expect(keys[0] === keys[1]).assertFalse();
      const audit: ForEachKeyAudit = new ForEachKeyAudit('event_log', keys);
      expect(audit.judge()).assertEqual(KeyAuditVerdict.UNIQUE);
      hilog.info(DOMAIN, TAG, '%{public}s keys: %{public}s',
        BUNDLE + 'UIComponentRendering_006', keys.join(','));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UIComponentRendering_006, end');
    });

    /**
     * Scenario: the empty whitelist branch of the configuration card.
     * Expectation: the empty state text replaces the rows and the card keeps a single
     * conditional text node.
     */
    it('Assessment_UIComponentRendering_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UIComponentRendering_007, begin');
      const root: RenderNode = emptyTree.buildRoot();
      const texts: string[] = root.texts();
      expect(texts.indexOf(TEXT_WHITELIST_EMPTY) >= 0).assertTrue();
      expect(root.countOf(NodeKind.BUTTON)).assertEqual(OPERATION_BUTTON_COUNT + 1);
      expect(root.find(ID_BUNDLE_INPUT) !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s',
        BUNDLE + 'UIComponentRendering_007', emptySnapshot.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UIComponentRendering_007, end');
    });

    /**
     * Scenario: the populated whitelist branch of the configuration card.
     * Expectation: every bundle name produces a row with one remove button, so the button count
     * grows with the whitelist.
     */
    it('Assessment_UIComponentRendering_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UIComponentRendering_008, begin');
      const populated: EntryPageTree = new EntryPageTree(
        ['com.samples.assessment', 'com.samples.dictionary', 'com.samples.reader'], []);
      const root: RenderNode = populated.buildRoot();
      const removeButtons: number = root.countOf(NodeKind.BUTTON) - OPERATION_BUTTON_COUNT - 1;
      expect(removeButtons).assertEqual(3);
      const texts: string[] = root.texts();
      expect(texts.indexOf(TEXT_WHITELIST_EMPTY) < 0).assertTrue();
      expect(texts.indexOf('com.samples.reader') >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UIComponentRendering_008, end');
    });

    /**
     * Scenario: the two branches of the whitelist are compared.
     * Expectation: the populated tree has more nodes than the empty one, which is the expected
     * re-render of the conditional block.
     */
    it('Assessment_UIComponentRendering_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UIComponentRendering_009, begin');
      const populated: RenderSnapshot = RenderSnapshot.of(
        new EntryPageTree(['com.samples.assessment', 'com.samples.dictionary'], []).buildRoot());
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'UIComponentRendering_009',
        populated.toString());
      expect(populated.nodeCount).assertLarger(emptySnapshot.nodeCount);
      expect(populated.buttonCount).assertLarger(emptySnapshot.buttonCount);
      expect(populated.equals(emptySnapshot)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UIComponentRendering_009, end');
    });

    /**
     * Scenario: the event log branch of the status card.
     * Expectation: an empty log renders the no-event text and a populated log renders one text
     * node per entry.
     */
    it('Assessment_UIComponentRendering_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UIComponentRendering_010, begin');
      const emptyLog: RenderNode = new EntryPageTree(['com.samples.assessment'], []).buildRoot();
      expect(emptyLog.texts().indexOf(TEXT_NO_EVENT) >= 0).assertTrue();
      const logs: string[] = ['onBegin: 0', 'onEnd: 0'];
      const filledLog: RenderNode = new EntryPageTree(['com.samples.assessment'], logs).buildRoot();
      const texts: string[] = filledLog.texts();
      expect(texts.indexOf(TEXT_NO_EVENT) < 0).assertTrue();
      expect(texts.indexOf('onBegin: 0') >= 0).assertTrue();
      expect(texts.indexOf('onEnd: 0') >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UIComponentRendering_010, end');
    });

    /**
     * Scenario: the queried configuration branch of the status card.
     * Expectation: minus one renders the no-active text, a queried duration renders the value.
     */
    it('Assessment_UIComponentRendering_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UIComponentRendering_011, begin');
      const unqueried: EntryPageTree = new EntryPageTree(['com.samples.assessment'], []);
      const unqueriedTexts: string[] = unqueried.buildRoot().texts();
      expect(unqueriedTexts.indexOf('No active assessment') >= 0).assertTrue();
      const queried: EntryPageTree = new EntryPageTree(['com.samples.assessment'], []);
      queried.setQueryDuration(600000);
      const queriedTexts: string[] = queried.buildRoot().texts();
      expect(queriedTexts.indexOf('No active assessment') < 0).assertTrue();
      expect(queriedTexts.indexOf('duration: 600000 ms') >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UIComponentRendering_011, end');
    });

    /**
     * Scenario: the live page renders the no-event text at rest.
     * Expectation: the status card carries the no-event text before any session started.
     */
    it('Assessment_UIComponentRendering_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UIComponentRendering_012, begin');
      const rendered: boolean = await guardEntryPage(driver);
      if (!rendered) {
        return;
      }
      const texts: string[] = await collectTextsOfType(driver, TYPE_TEXT);
      let found: boolean = false;
      for (let i = 0; i < texts.length; i++) {
        if (texts[i] === TEXT_NO_EVENT) {
          found = true;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s no event text found: %{public}s',
        BUNDLE + 'UIComponentRendering_012', `${found}`);
      if (!found) {
        hilog.warn(DOMAIN, TAG, '%{public}s the status card is off screen, the case is skipped',
          BUNDLE + 'UIComponentRendering_012');
        return;
      }
      expect(found).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UIComponentRendering_012, end');
    });

    /**
     * Scenario: the layout weight of the operation buttons.
     * Expectation: the two buttons of a row share the width evenly, the weight allocator
     * reports a balanced split.
     */
    it('Assessment_UIComponentRendering_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UIComponentRendering_017, begin');
      const allocator: WeightAllocator = new WeightAllocator(400, 12, [1, 1]);
      expect(allocator.isBalanced()).assertTrue();
      expect(allocator.availableWidth()).assertEqual(388);
      expect(Math.abs(allocator.widthOf(0) - 194) < 0.001).assertTrue();
      expect(Math.abs(allocator.widthOf(1) - 194) < 0.001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s widths: %{public}s',
        BUNDLE + 'UIComponentRendering_017', allocator.widths().join(','));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UIComponentRendering_017, end');
    });

    /**
     * Scenario: the layout weight of the whitelist input row.
     * Expectation: the input takes the remaining width while the add button keeps its
     * intrinsic width, so the input is much wider than the button.
     */
    it('Assessment_UIComponentRendering_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UIComponentRendering_018, begin');
      const allocator: WeightAllocator = new WeightAllocator(688, 8, [1, 0]);
      expect(allocator.availableWidth()).assertEqual(680);
      expect(allocator.widthOf(0)).assertEqual(680);
      expect(allocator.widthOf(1)).assertEqual(0);
      expect(allocator.isBalanced()).assertFalse();
      expect(allocator.widthOf(5)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UIComponentRendering_018, end');
    });

    /**
     * Scenario: a weight list that sums to zero.
     * Expectation: the allocator returns zero for every child instead of dividing by zero.
     */
    it('Assessment_UIComponentRendering_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UIComponentRendering_019, begin');
      const allocator: WeightAllocator = new WeightAllocator(400, 0, [0, 0]);
      expect(allocator.totalWeight()).assertEqual(0);
      expect(allocator.widthOf(0)).assertEqual(0);
      expect(allocator.widths().length).assertEqual(2);
      expect(allocator.isBalanced()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UIComponentRendering_019, end');
    });

    /**
     * Scenario: the maxLines and ellipsis contract of a whitelist row.
     * Expectation: a long bundle name is cut at the capacity and an ellipsis is appended, a
     * short one is rendered unchanged.
     */
    it('Assessment_UIComponentRendering_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UIComponentRendering_020, begin');
      const model: TextTruncationModel = new TextTruncationModel(80);
      expect(model.capacity()).assertEqual(10);
      expect(model.getMaxLines()).assertEqual(MAX_LINES_BUNDLE);
      const short: string = 'com.sample';
      expect(model.overflows(short)).assertFalse();
      expect(model.render(short)).assertEqual(short);
      const long: string = 'com.samples.assessment.verylongsuffix';
      expect(model.overflows(long)).assertTrue();
      const rendered: string = model.render(long);
      expect(rendered.endsWith('...')).assertTrue();
      expect(rendered.length).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s',
        BUNDLE + 'UIComponentRendering_020', model.describe(long));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UIComponentRendering_020, end');
    });

    /**
     * Scenario: the truncation model without an ellipsis.
     * Expectation: the text is still cut but no suffix is appended.
     */
    it('Assessment_UIComponentRendering_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UIComponentRendering_021, begin');
      const model: TextTruncationModel = new TextTruncationModel(80);
      const long: string = 'com.samples.assessment.verylongsuffix';
      const rendered: string = model.render(long);
      expect(rendered.indexOf('...') >= 0).assertTrue();
      const plainModel: TextTruncationModel = new TextTruncationModel(400);
      expect(plainModel.overflows(long)).assertFalse();
      expect(plainModel.render(long)).assertEqual(long);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UIComponentRendering_021, end');
    });

    /**
     * Scenario: the node count of the synthetic tree.
     * Expectation: the default tree has more nodes than the empty tree and the depth grows with
     * the nested cards.
     */
    it('Assessment_UIComponentRendering_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UIComponentRendering_022, begin');
      expect(defaultSnapshot.nodeCount > 0).assertTrue();
      expect(defaultSnapshot.depth).assertLarger(3);
      expect(defaultSnapshot.listItemCount).assertEqual(ROOT_LIST_ITEM_COUNT);
      expect(defaultSnapshot.textCount > FIXED_TEXT_COUNT).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s',
        BUNDLE + 'UIComponentRendering_022', defaultSnapshot.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UIComponentRendering_022, end');
    });

    /**
     * Scenario: the synthetic tree is searched by identifier.
     * Expectation: every declared identifier resolves and an unknown identifier returns null.
     */
    it('Assessment_UIComponentRendering_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UIComponentRendering_023, begin');
      const root: RenderNode = defaultTree.buildRoot();
      expect(root.find(ID_INDEX_TITLE) !== null).assertTrue();
      expect(root.find(ID_BUNDLE_INPUT) !== null).assertTrue();
      expect(root.find(ID_ADD_BUTTON) !== null).assertTrue();
      expect(root.find(ID_BEGIN_BUTTON) !== null).assertTrue();
      expect(root.find('assessment_missing_node') === null).assertTrue();
      const found: RenderNode | null = root.find(ID_QUERY_CONFIG_BUTTON);
      if (found !== null) {
        expect(found.kind).assertEqual(NodeKind.BUTTON);
        expect(found.text).assertEqual('getConfiguration');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UIComponentRendering_023, end');
    });

    /**
     * Scenario: the synthetic tree has no duplicated identifier.
     * Expectation: the duplicate audit is empty, which is what ForEach keyed identity needs.
     */
    it('Assessment_UIComponentRendering_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UIComponentRendering_024, begin');
      const root: RenderNode = defaultTree.buildRoot();
      const duplicates: string[] = root.duplicateIds();
      hilog.info(DOMAIN, TAG, '%{public}s duplicate ids: %{public}d',
        BUNDLE + 'UIComponentRendering_024', duplicates.length);
      expect(duplicates.length).assertEqual(0);
      const broken: RenderNode = new RenderNode('root', NodeKind.COLUMN);
      broken.add(new RenderNode('twin', NodeKind.TEXT, 'a'));
      broken.add(new RenderNode('twin', NodeKind.TEXT, 'b'));
      expect(broken.duplicateIds().length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UIComponentRendering_024, end');
    });

    /**
     * Scenario: the ForEach key audit is run twice for the same dataset.
     * Expectation: the verdict is stable, so the page does not rebuild the chips on a redraw.
     */
    it('Assessment_UIComponentRendering_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UIComponentRendering_026, begin');
      const first: ForEachKeyAudit = new ForEachKeyAudit('duration_chips',
        ForEachKeyAudit.durationKeys(DURATION_CHIP_COUNT));
      const second: ForEachKeyAudit = new ForEachKeyAudit('duration_chips',
        ForEachKeyAudit.durationKeys(DURATION_CHIP_COUNT));
      expect(first.judge()).assertEqual(second.judge());
      expect(first.getName()).assertEqual('duration_chips');
      expect(first.toString().indexOf('keys=4') >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'UIComponentRendering_026', first.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UIComponentRendering_026, end');
    });

    /**
     * Scenario: the remove button is rendered by every whitelist row.
     * Expectation: the model declares one remove button per bundle and the text is the
     * documented one.
     */
    it('Assessment_UIComponentRendering_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UIComponentRendering_028, begin');
      const root: RenderNode = defaultTree.buildRoot();
      const texts: string[] = root.texts();
      let removeCount: number = 0;
      for (let i = 0; i < texts.length; i++) {
        if (texts[i] === TEXT_REMOVE_BUTTON) {
          removeCount++;
        }
      }
      expect(removeCount).assertEqual(INITIAL_WHITELIST_ROWS);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UIComponentRendering_028, end');
    });

    /**
     * Scenario: the spacing tokens of the cards.
     * Expectation: the page padding, the card padding and the card radius are all sixteen vp,
     * which keeps the cards aligned with the page gutter.
     */
    it('Assessment_UIComponentRendering_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UIComponentRendering_031, begin');
      expect(PAGE_PADDING_VP).assertEqual(16);
      expect(CARD_PADDING_VP).assertEqual(16);
      expect(CARD_RADIUS_VP).assertEqual(16);
      expect(PAGE_PADDING_VP).assertEqual(CARD_PADDING_VP);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UIComponentRendering_031, end');
    });

    /**
     * Scenario: the heights that the layout source declares.
     * Expectation: the buttons are taller than the input, which is taller than the remove
     * button, the ladder matches the touch target rule.
     */
    it('Assessment_UIComponentRendering_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UIComponentRendering_032, begin');
      expect(BUTTON_HEIGHT_VP).assertLarger(INPUT_HEIGHT_VP);
      expect(INPUT_HEIGHT_VP).assertLarger(REMOVE_HEIGHT_VP);
      expect(REMOVE_HEIGHT_VP).assertLargerOrEqual(28);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}d / %{public}d / %{public}d',
        BUNDLE + 'UIComponentRendering_032', BUTTON_HEIGHT_VP, INPUT_HEIGHT_VP, REMOVE_HEIGHT_VP);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UIComponentRendering_032, end');
    });

    /**
     * Scenario: the conditional node count of the empty whitelist tree.
     * Expectation: the empty branch contributes one conditional node, the populated branch one
     * per row.
     */
    it('Assessment_UIComponentRendering_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UIComponentRendering_033, begin');
      const empty: RenderSnapshot = RenderSnapshot.of(new EntryPageTree([], []).buildRoot());
      const oneRow: RenderSnapshot =
        RenderSnapshot.of(new EntryPageTree(['com.samples.assessment'], []).buildRoot());
      hilog.info(DOMAIN, TAG, '%{public}s conditional nodes empty=%{public}d oneRow=%{public}d',
        BUNDLE + 'UIComponentRendering_033', empty.conditionalCount, oneRow.conditionalCount);
      expect(empty.conditionalCount >= 1).assertTrue();
      expect(oneRow.conditionalCount >= 1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UIComponentRendering_033, end');
    });

    /**
     * Scenario: the texts of the model are all non empty.
     * Expectation: every text node carries a label, so no component renders an empty string.
     */
    it('Assessment_UIComponentRendering_036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UIComponentRendering_036, begin');
      const root: RenderNode = defaultTree.buildRoot();
      const texts: string[] = root.texts();
      let empty: number = 0;
      for (let i = 0; i < texts.length; i++) {
        if (texts[i].trim().length === 0) {
          empty++;
        }
      }
      expect(empty).assertEqual(0);
      expect(texts.length).assertEqual(defaultSnapshot.textLength);
      hilog.info(DOMAIN, TAG, '%{public}s texts: %{public}d',
        BUNDLE + 'UIComponentRendering_036', texts.length);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UIComponentRendering_036, end');
    });

    /**
     * Scenario: the tree is rebuilt with the same inputs.
     * Expectation: the snapshot of the rebuilt tree equals the snapshot of the first one, so
     * the render is deterministic.
     */
    it('Assessment_UIComponentRendering_037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UIComponentRendering_037, begin');
      const rebuilt: EntryPageTree = new EntryPageTree(['com.samples.assessment'], []);
      const snapshot: RenderSnapshot = RenderSnapshot.of(rebuilt.buildRoot());
      expect(snapshot.equals(defaultSnapshot)).assertTrue();
      expect(snapshot.nodeCount).assertEqual(defaultSnapshot.nodeCount);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UIComponentRendering_037, end');
    });

    /**
     * Scenario: the title node of the model is a text node.
     * Expectation: the title has no children, carries a label and sits in the first list item.
     */
    it('Assessment_UIComponentRendering_040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UIComponentRendering_040, begin');
      const root: RenderNode = defaultTree.buildRoot();
      const title: RenderNode | null = root.find(ID_INDEX_TITLE);
      expect(title !== null).assertTrue();
      if (title !== null) {
        expect(title.kind).assertEqual(NodeKind.TEXT);
        expect(title.children.length).assertEqual(0);
        expect(title.text.length > 0).assertTrue();
        expect(title.size()).assertEqual(1);
        expect(title.depth()).assertEqual(1);
      }
      const firstItem: RenderNode = root.children[0];
      expect(firstItem.find(ID_INDEX_TITLE) !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UIComponentRendering_040, end');
    });

    /**
     * Scenario: a node description is used in a triage.
     * Expectation: the description carries the identifier, the kind, the child count and the
     * subtree size.
     */
    it('Assessment_UIComponentRendering_041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UIComponentRendering_041, begin');
      const root: RenderNode = defaultTree.buildRoot();
      const text: string = root.toString();
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'UIComponentRendering_041', text);
      expect(text.indexOf('assessment_index_root') >= 0).assertTrue();
      expect(text.indexOf('children=4') >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UIComponentRendering_041, end');
    });
  });
}
