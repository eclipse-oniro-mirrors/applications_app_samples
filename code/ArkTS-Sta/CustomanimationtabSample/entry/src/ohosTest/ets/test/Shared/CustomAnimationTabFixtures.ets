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

/**
 * Pure model fixtures for the custom animation tab sample.
 *
 * The classes below mirror the state and arithmetic that pages/Index.ets performs
 * for tab selection, the non-looping swiper, the moving indicator bar and the
 * skeleton rows. They contain no ArkUI and no UiTest so every consumer can run
 * as a pure model test on the host test ability.
 */

export const TAB_LABELS: Array<string> = [
  '\u5168\u90e8',
  'UI\u5e03\u5c40',
  '\u52a8\u6548',
  '\u4e09\u65b9\u5e93',
  '\u5176\u4ed6',
];

export const TAB_COUNT: number = 5;
export const TAB_WIDTH: number = 95;
export const LIST_ROW_COUNT: number = 8;
export const DEFAULT_INDEX: number = 0;
export const PAGE_TITLE_PREFIX: string = 'page-title-';

export const INDICATOR_GRAY: string = '#C0C0C0';
export const INDICATOR_YELLOW: string = '#FFFF00';
export const INDICATOR_GRAY_ID: string = 'indicator-gray';
export const INDICATOR_YELLOW_ID: string = 'indicator-yellow';

export const SCROLL_OFFSET_TAB_ONE: number = -90;
export const SCROLL_OFFSET_TAB_THREE: number = 90;
export const SCROLL_OFFSET_NONE: number = 0;

export const SKELETON_TITLE_HEIGHT: number = 20;
export const SKELETON_TEXT_HEIGHT: number = 14;
export const SKELETON_ACTION_WIDTH: number = 58;
export const SKELETON_IMAGE_WIDTH: number = 128;
export const SKELETON_TOPIC_COUNT_MINE: number = 2;
export const SKELETON_ACTION_COUNT_OTHER: number = 3;

export interface TabFixture {
  index: number;
  label: string;
  titleId: string;
  skeletonRows: number;
}

export interface ClickResult {
  accepted: boolean;
  from: number;
  to: number;
  displacementDelta: number;
  scrollOffset: number;
}

export interface TabSnapshotData {
  index: number;
  displacement: number;
  yellow: boolean;
}

export interface OperationResult {
  operation: number;
  accepted: boolean;
  snapshot: TabSnapshotData;
}

export interface SnapshotDiff {
  fields: Array<string>;
  count: number;
}

export const TAB_FIXTURES: Array<TabFixture> = [
  {
    index: 0,
    label: TAB_LABELS[0],
    titleId: PAGE_TITLE_PREFIX + '0',
    skeletonRows: LIST_ROW_COUNT,
  },
  {
    index: 1,
    label: TAB_LABELS[1],
    titleId: PAGE_TITLE_PREFIX + '1',
    skeletonRows: LIST_ROW_COUNT,
  },
  {
    index: 2,
    label: TAB_LABELS[2],
    titleId: PAGE_TITLE_PREFIX + '2',
    skeletonRows: LIST_ROW_COUNT,
  },
  {
    index: 3,
    label: TAB_LABELS[3],
    titleId: PAGE_TITLE_PREFIX + '3',
    skeletonRows: LIST_ROW_COUNT,
  },
  {
    index: 4,
    label: TAB_LABELS[4],
    titleId: PAGE_TITLE_PREFIX + '4',
    skeletonRows: LIST_ROW_COUNT,
  },
];

export enum TabOperationType {
  SELECT = 0,
  SWIPE_NEXT = 1,
  SWIPE_PREV = 2,
  TOGGLE_COLOR = 3,
  RESET = 4,
}

export enum TabDirection {
  FORWARD = 'forward',
  BACKWARD = 'backward',
}

export enum IndicatorState {
  GRAY = 'gray',
  YELLOW = 'yellow',
}

export function pageTitleFor(index: number): string {
  return PAGE_TITLE_PREFIX + String(index);
}

export function indicatorIdFor(yellow: boolean): string {
  return yellow ? INDICATOR_YELLOW_ID : INDICATOR_GRAY_ID;
}

export function isIndexValid(index: number): boolean {
  return index >= 0 && index < TAB_COUNT;
}

export function expectedScrollOffset(index: number): number {
  if (index === 1) {
    return SCROLL_OFFSET_TAB_ONE;
  }
  if (index === 3) {
    return SCROLL_OFFSET_TAB_THREE;
  }
  return SCROLL_OFFSET_NONE;
}

export function expectedClickDelta(from: number, to: number): number {
  return (to - from) * TAB_WIDTH;
}

export function sumSkeletonRows(): number {
  let total: number = 0;
  for (let i: number = 0; i < TAB_FIXTURES.length; i++) {
    total += TAB_FIXTURES[i].skeletonRows;
  }
  return total;
}

export function uniqueLabels(): number {
  const seen: Array<string> = new Array<string>();
  for (let i: number = 0; i < TAB_LABELS.length; i++) {
    if (seen.indexOf(TAB_LABELS[i]) < 0) {
      seen.push(TAB_LABELS[i]);
    }
  }
  return seen.length;
}

export function resolveLabelIndex(label: string): number {
  for (let i: number = 0; i < TAB_LABELS.length; i++) {
    if (TAB_LABELS[i] === label) {
      return i;
    }
  }
  return -1;
}

/** Tab selection state mirroring the swiperIndex @State field. */
export class TabSelectionModel {
  private current: number = DEFAULT_INDEX;
  private readonly labels: Array<string> = TAB_LABELS;

  public count(): number {
    return this.labels.length;
  }

  public currentIndex(): number {
    return this.current;
  }

  public currentLabel(): string {
    return this.labels[this.current];
  }

  public labelAt(index: number): string {
    if (!isIndexValid(index)) {
      return '';
    }
    return this.labels[index];
  }

  public select(index: number): boolean {
    if (!isIndexValid(index)) {
      return false;
    }
    this.current = index;
    return true;
  }

  public selectByLabel(label: string): boolean {
    const index: number = resolveLabelIndex(label);
    if (index < 0) {
      return false;
    }
    this.current = index;
    return true;
  }

  public moveNext(): boolean {
    if (this.current >= this.labels.length - 1) {
      return false;
    }
    this.current++;
    return true;
  }

  public movePrev(): boolean {
    if (this.current <= 0) {
      return false;
    }
    this.current--;
    return true;
  }

  public reset(): void {
    this.current = DEFAULT_INDEX;
  }

  public snapshotIndex(): number {
    return this.current;
  }
}

/** Indicator color state mirroring indicatorBarColor. */
export class IndicatorModel {
  private yellow: boolean = false;
  private toggleCount: number = 0;

  public isYellow(): boolean {
    return this.yellow;
  }

  public isGray(): boolean {
    return !this.yellow;
  }

  public stateName(): string {
    return this.yellow ? IndicatorState.YELLOW : IndicatorState.GRAY;
  }

  public stateId(): string {
    return indicatorIdFor(this.yellow);
  }

  public colorValue(): string {
    return this.yellow ? INDICATOR_YELLOW : INDICATOR_GRAY;
  }

  public toggle(): string {
    this.yellow = !this.yellow;
    this.toggleCount++;
    return this.stateId();
  }

  public setYellow(value: boolean): void {
    this.yellow = value;
    this.toggleCount++;
  }

  public reset(): void {
    this.yellow = false;
    this.toggleCount = 0;
  }

  public toggles(): number {
    return this.toggleCount;
  }
}

/** Indicator bar displacement mirroring backgroundBarDisplacement. */
export class TabLayoutModel {
  private displacement: number = 0;
  private scrollEvents: number = 0;

  public currentDisplacement(): number {
    return this.displacement;
  }

  public deltaForClick(from: number, to: number): number {
    return expectedClickDelta(from, to);
  }

  public applyClick(from: number, to: number): ClickResult {
    if (!isIndexValid(from) || !isIndexValid(to)) {
      return {
        accepted: false,
        from: from,
        to: to,
        displacementDelta: 0,
        scrollOffset: 0,
      };
    }
    const delta: number = expectedClickDelta(from, to);
    this.displacement += delta;
    return {
      accepted: true,
      from: from,
      to: to,
      displacementDelta: delta,
      scrollOffset: expectedScrollOffset(to),
    };
  }

  public onScroll(xOffset: number): number {
    this.displacement += -xOffset;
    this.scrollEvents++;
    return this.displacement;
  }

  public expectedLeftFor(index: number): number {
    return index * TAB_WIDTH;
  }

  public reset(): void {
    this.displacement = 0;
    this.scrollEvents = 0;
  }

  public scrollEventCount(): number {
    return this.scrollEvents;
  }
}

/** Non-looping swiper mirroring Swiper().loop(false). */
export class SwiperModel {
  private current: number = DEFAULT_INDEX;
  private readonly count: number;
  public readonly loop: boolean = false;

  constructor(count: number) {
    this.count = count;
  }

  public index(): number {
    return this.current;
  }

  public pageCount(): number {
    return this.count;
  }

  public isLooping(): boolean {
    return this.loop;
  }

  public isAtStart(): boolean {
    return this.current === 0;
  }

  public isAtEnd(): boolean {
    return this.current === this.count - 1;
  }

  public setIndex(index: number): boolean {
    if (!isIndexValid(index)) {
      return false;
    }
    this.current = index;
    return true;
  }

  public moveNext(): boolean {
    if (this.current >= this.count - 1) {
      return false;
    }
    this.current++;
    return true;
  }

  public movePrev(): boolean {
    if (this.current <= 0) {
      return false;
    }
    this.current--;
    return true;
  }

  public onChange(index: number): boolean {
    if (!isIndexValid(index)) {
      return false;
    }
    this.current = index;
    return true;
  }

  public reset(): void {
    this.current = DEFAULT_INDEX;
  }
}

/** Skeleton layout branch mirroring SkeletonLayout.isMine. */
export class SkeletonModel {
  private isMine: boolean;

  constructor(isMine: boolean) {
    this.isMine = isMine;
  }

  public mine(): boolean {
    return this.isMine;
  }

  public rowCount(): number {
    return LIST_ROW_COUNT;
  }

  public actionAreaCount(): number {
    return this.isMine ? 0 : SKELETON_ACTION_COUNT_OTHER;
  }

  public topicCount(): number {
    return this.isMine ? SKELETON_TOPIC_COUNT_MINE : 0;
  }

  public hasActionAreas(): boolean {
    return !this.isMine;
  }

  public hasTopics(): boolean {
    return this.isMine;
  }

  public titleHeight(): number {
    return SKELETON_TITLE_HEIGHT;
  }

  public textHeight(): number {
    return SKELETON_TEXT_HEIGHT;
  }

  public actionWidth(): number {
    return SKELETON_ACTION_WIDTH;
  }

  public imageWidth(): number {
    return SKELETON_IMAGE_WIDTH;
  }

  public static totalCards(): number {
    return TAB_COUNT * LIST_ROW_COUNT;
  }
}

/** Aggregate state mirroring the three @State fields plus the swiper index. */
export class TabStateModel {
  public selection: TabSelectionModel = new TabSelectionModel();
  public indicator: IndicatorModel = new IndicatorModel();
  public layout: TabLayoutModel = new TabLayoutModel();
  public swiper: SwiperModel = new SwiperModel(TAB_COUNT);

  public index(): number {
    return this.selection.currentIndex();
  }

  public label(): string {
    return this.selection.currentLabel();
  }

  public click(index: number): boolean {
    const from: number = this.selection.currentIndex();
    if (!this.selection.select(index)) {
      return false;
    }
    this.layout.applyClick(from, index);
    this.swiper.setIndex(index);
    return true;
  }

  public swipeForward(): boolean {
    if (!this.swiper.moveNext()) {
      return false;
    }
    this.syncFromSwiper();
    return true;
  }

  public swipeBackward(): boolean {
    if (!this.swiper.movePrev()) {
      return false;
    }
    this.syncFromSwiper();
    return true;
  }

  public swipe(direction: TabDirection): boolean {
    if (direction === TabDirection.FORWARD) {
      return this.swipeForward();
    }
    return this.swipeBackward();
  }

  public toggleColor(): string {
    return this.indicator.toggle();
  }

  public reset(): void {
    this.selection.reset();
    this.indicator.reset();
    this.layout.reset();
    this.swiper.reset();
  }

  public snapshot(): TabSnapshotData {
    return {
      index: this.index(),
      displacement: this.layout.currentDisplacement(),
      yellow: this.indicator.isYellow(),
    };
  }

  public restore(data: TabSnapshotData): boolean {
    if (!isIndexValid(data.index)) {
      return false;
    }
    this.selection.select(data.index);
    this.swiper.setIndex(data.index);
    this.layout.reset();
    this.layout.onScroll(-data.displacement);
    this.indicator.setYellow(data.yellow);
    return true;
  }

  public scrollOffsetForCurrent(): number {
    return expectedScrollOffset(this.index());
  }

  public isConsistent(): boolean {
    return (
      this.selection.currentIndex() === this.swiper.index() &&
      this.index() >= 0 &&
      this.index() < TAB_COUNT
    );
  }

  private syncFromSwiper(): void {
    const from: number = this.selection.currentIndex();
    const to: number = this.swiper.index();
    this.selection.select(to);
    this.layout.applyClick(from, to);
  }
}

/** Immutable snapshot used by history and consistency assertions. */
export class TabSnapshot {
  public readonly index: number;
  public readonly displacement: number;
  public readonly yellow: boolean;

  constructor(index: number, displacement: number, yellow: boolean) {
    this.index = index;
    this.displacement = displacement;
    this.yellow = yellow;
  }

  public static from(state: TabStateModel): TabSnapshot {
    const data: TabSnapshotData = state.snapshot();
    return new TabSnapshot(data.index, data.displacement, data.yellow);
  }

  public equals(other: TabSnapshot): boolean {
    return (
      this.index === other.index &&
      this.displacement === other.displacement &&
      this.yellow === other.yellow
    );
  }

  public toData(): TabSnapshotData {
    return {
      index: this.index,
      displacement: this.displacement,
      yellow: this.yellow,
    };
  }

  public diff(other: TabSnapshot): SnapshotDiff {
    const fields: Array<string> = new Array<string>();
    if (this.index !== other.index) {
      fields.push('index');
    }
    if (this.displacement !== other.displacement) {
      fields.push('displacement');
    }
    if (this.yellow !== other.yellow) {
      fields.push('yellow');
    }
    return { fields: fields, count: fields.length };
  }

  public toString(): string {
    return (
      'TabSnapshot{index: ' +
      String(this.index) +
      ', displacement: ' +
      String(this.displacement) +
      ', yellow: ' +
      String(this.yellow) +
      '}'
    );
  }
}

/** Undo/redo history over immutable tab snapshots. */
export class TabStateHistory {
  private undoStack: Array<TabSnapshot> = new Array<TabSnapshot>();
  private redoStack: Array<TabSnapshot> = new Array<TabSnapshot>();

  public push(snapshot: TabSnapshot): void {
    this.undoStack.push(snapshot);
    this.redoStack = new Array<TabSnapshot>();
  }

  public undo(): TabSnapshot | null {
    if (this.undoStack.length === 0) {
      return null;
    }
    const last: number = this.undoStack.length - 1;
    const snapshot: TabSnapshot = this.undoStack[last];
    this.undoStack.pop();
    this.redoStack.push(snapshot);
    return snapshot;
  }

  public redo(): TabSnapshot | null {
    if (this.redoStack.length === 0) {
      return null;
    }
    const last: number = this.redoStack.length - 1;
    const snapshot: TabSnapshot = this.redoStack[last];
    this.redoStack.pop();
    this.undoStack.push(snapshot);
    return snapshot;
  }

  public undoCount(): number {
    return this.undoStack.length;
  }

  public redoCount(): number {
    return this.redoStack.length;
  }

  public clear(): void {
    this.undoStack = new Array<TabSnapshot>();
    this.redoStack = new Array<TabSnapshot>();
  }
}

/** Operation catalogue used by workflow style model cases. */
export class TabOperationCatalog {
  public static readonly NAMES: Array<string> = [
    'select',
    'swipeNext',
    'swipePrev',
    'toggleColor',
    'reset',
  ];

  public static isValid(operation: number): boolean {
    return (
      operation >= TabOperationType.SELECT &&
      operation <= TabOperationType.RESET
    );
  }

  public static nameOf(operation: number): string {
    if (!TabOperationCatalog.isValid(operation)) {
      return 'unknown';
    }
    return TabOperationCatalog.NAMES[operation];
  }

  public static apply(
    state: TabStateModel,
    operation: number,
    argument: number,
  ): OperationResult {
    let accepted: boolean = false;
    if (operation === TabOperationType.SELECT) {
      accepted = state.click(argument);
    } else if (operation === TabOperationType.SWIPE_NEXT) {
      accepted = state.swipeForward();
    } else if (operation === TabOperationType.SWIPE_PREV) {
      accepted = state.swipeBackward();
    } else if (operation === TabOperationType.TOGGLE_COLOR) {
      state.toggleColor();
      accepted = true;
    } else if (operation === TabOperationType.RESET) {
      state.reset();
      accepted = true;
    }
    return {
      operation: operation,
      accepted: accepted,
      snapshot: state.snapshot(),
    };
  }

  public static applySequence(
    state: TabStateModel,
    operations: Array<number>,
    argumentsList: Array<number>,
  ): number {
    let accepted: number = 0;
    for (let i: number = 0; i < operations.length; i++) {
      const argument: number = i < argumentsList.length ? argumentsList[i] : 0;
      if (TabOperationCatalog.apply(state, operations[i], argument).accepted) {
        accepted++;
      }
    }
    return accepted;
  }
}

/** Validation helpers reused by model validation suites. */
export class TabValidationModel {
  public static isValidIndex(index: number): boolean {
    return isIndexValid(index);
  }

  public static isValidLabel(label: string): boolean {
    return resolveLabelIndex(label) >= 0;
  }

  public static isValidColorValue(value: string): boolean {
    return value === INDICATOR_GRAY || value === INDICATOR_YELLOW;
  }

  public static isValidStateId(id: string): boolean {
    return id === INDICATOR_GRAY_ID || id === INDICATOR_YELLOW_ID;
  }

  public static isValidOperation(operation: number): boolean {
    return TabOperationCatalog.isValid(operation);
  }

  public static isValidRowCount(rows: number): boolean {
    return rows === LIST_ROW_COUNT;
  }

  public static isNonNegative(value: number): boolean {
    return value >= 0;
  }

  public static isValidToggleCount(count: number): boolean {
    return count >= 0;
  }

  public static isValidSnapshot(data: TabSnapshotData): boolean {
    return isIndexValid(data.index) && data.displacement === data.displacement;
  }

  public static isValidClickResult(result: ClickResult): boolean {
    if (!result.accepted) {
      return result.displacementDelta === 0 && result.scrollOffset === 0;
    }
    return (
      isIndexValid(result.from) &&
      isIndexValid(result.to) &&
      result.displacementDelta === expectedClickDelta(result.from, result.to)
    );
  }
}

/** Rolling sampler used by pure performance oriented cases. */
export class TabPerformanceSampler {
  private samples: Array<number> = new Array<number>();

  public record(value: number): void {
    this.samples.push(value);
  }

  public count(): number {
    return this.samples.length;
  }

  public total(): number {
    let sum: number = 0;
    for (let i: number = 0; i < this.samples.length; i++) {
      sum += this.samples[i];
    }
    return sum;
  }

  public average(): number {
    if (this.samples.length === 0) {
      return 0;
    }
    return Math.floor(this.total() / this.samples.length);
  }

  public peak(): number {
    let result: number = 0;
    for (let i: number = 0; i < this.samples.length; i++) {
      if (this.samples[i] > result) {
        result = this.samples[i];
      }
    }
    return result;
  }

  public minimum(): number {
    if (this.samples.length === 0) {
      return 0;
    }
    let result: number = this.samples[0];
    for (let i: number = 1; i < this.samples.length; i++) {
      if (this.samples[i] < result) {
        result = this.samples[i];
      }
    }
    return result;
  }

  public isStable(limit: number): boolean {
    return this.peak() <= limit;
  }

  public reset(): void {
    this.samples = new Array<number>();
  }
}

/** Per-operation statistics for workflow and stress cases. */
export class TabOperationStatistics {
  private counts: Array<number> = [0, 0, 0, 0, 0];
  private acceptedCount: number = 0;
  private rejectedCount: number = 0;

  public record(operation: number, accepted: boolean): void {
    if (TabOperationCatalog.isValid(operation)) {
      this.counts[operation]++;
    }
    if (accepted) {
      this.acceptedCount++;
    } else {
      this.rejectedCount++;
    }
  }

  public countFor(operation: number): number {
    if (!TabOperationCatalog.isValid(operation)) {
      return 0;
    }
    return this.counts[operation];
  }

  public total(): number {
    return this.acceptedCount + this.rejectedCount;
  }

  public accepted(): number {
    return this.acceptedCount;
  }

  public rejected(): number {
    return this.rejectedCount;
  }

  public distinctOperations(): number {
    let distinct: number = 0;
    for (let i: number = 0; i < this.counts.length; i++) {
      if (this.counts[i] > 0) {
        distinct++;
      }
    }
    return distinct;
  }

  public reset(): void {
    this.counts = [0, 0, 0, 0, 0];
    this.acceptedCount = 0;
    this.rejectedCount = 0;
  }
}

/** Read/write access log for access pattern assertions. */
export class TabAccessLog {
  private reads: Array<string> = new Array<string>();
  private writes: Array<string> = new Array<string>();

  public recordRead(field: string): void {
    this.reads.push(field);
  }

  public recordWrite(field: string): void {
    this.writes.push(field);
  }

  public readCount(): number {
    return this.reads.length;
  }

  public writeCount(): number {
    return this.writes.length;
  }

  public hasRead(field: string): boolean {
    return this.reads.indexOf(field) >= 0;
  }

  public hasWrite(field: string): boolean {
    return this.writes.indexOf(field) >= 0;
  }

  public clear(): void {
    this.reads = new Array<string>();
    this.writes = new Array<string>();
  }
}

/** Consistency helpers comparing model outputs against production ids. */
export class TabConsistencyModel {
  public static selectionMatchesSwiper(state: TabStateModel): boolean {
    return state.selection.currentIndex() === state.swiper.index();
  }

  public static titleMatchesIndex(index: number): boolean {
    return pageTitleFor(index) === PAGE_TITLE_PREFIX + String(index);
  }

  public static indicatorMatches(yellow: boolean, id: string): boolean {
    return indicatorIdFor(yellow) === id;
  }

  public static displacementMatches(
    from: number,
    to: number,
    observed: number,
  ): boolean {
    return observed === expectedClickDelta(from, to);
  }

  public static snapshotMatches(
    state: TabStateModel,
    snapshot: TabSnapshot,
  ): boolean {
    const current: TabSnapshot = TabSnapshot.from(state);
    return current.equals(snapshot);
  }

  public static scrollOffsetMatches(index: number, offset: number): boolean {
    return expectedScrollOffset(index) === offset;
  }

  public static operationResultMatches(result: OperationResult): boolean {
    return result.snapshot.index >= 0 && result.snapshot.index < TAB_COUNT;
  }
}

/** Deterministic workflow runner returning the final model snapshot. */
export class TabWorkflowRunner {
  public static run(
    operations: Array<number>,
    argumentsList: Array<number>,
  ): TabSnapshotData {
    const state: TabStateModel = new TabStateModel();
    TabOperationCatalog.applySequence(state, operations, argumentsList);
    return state.snapshot();
  }

  public static finalIndex(
    operations: Array<number>,
    argumentsList: Array<number>,
  ): number {
    return TabWorkflowRunner.run(operations, argumentsList).index;
  }
}
