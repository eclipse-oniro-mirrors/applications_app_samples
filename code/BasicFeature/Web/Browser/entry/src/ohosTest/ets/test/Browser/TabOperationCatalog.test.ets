/*
 * Copyright (c) 2026 Sample Device Co., Ltd.
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

import { describe, it, expect, beforeAll, afterAll, beforeEach } from '@ohos/hypium';
import { Driver } from '@ohos.UiTest';
import TestLogger from '../Shared/TestLogger';
import {
  getDriver, startBrowserApp, componentByIdExists, countById,
  nextTabIndex, resolveTabIndexAfterDelete,
  MAX_TAB_COUNT, MIN_TAB_COUNT, PAD_HOME_PAGE, PHONE_HOME_PAGE, TAB_LIMIT_MESSAGE,
  ID_ACTION_ADD, ID_CANCEL_TAB, ID_NAV_HOME, ID_NAV_REFRESH
} from '../Shared/BrowserTestKit';
import { MockBrowser, MockClock } from '../Shared/BrowserMock';

const TAG: string = 'BrowserTabOperationCatalogTest';

/* ------------------------------------------------------------------ */
/* Operation vocabulary of the browser tab panel                     */
/* ------------------------------------------------------------------ */

/** Every tab level operation the sample application exposes. */
enum TabOpKind {
  ADD = 0,
  DELETE = 1,
  SWITCH = 2,
  CLOSE = 3,
  HOME = 4,
  RELOAD = 5
}

/** Coarse grouping used by the coverage statistics of the catalog. */
enum OpCategory {
  STRUCTURE = 0,
  NAVIGATION = 1,
  RECOVERY = 2
}

function kindName(kind: TabOpKind): string {
  switch (kind) {
    case TabOpKind.ADD:
      return 'ADD';
    case TabOpKind.DELETE:
      return 'DELETE';
    case TabOpKind.SWITCH:
      return 'SWITCH';
    case TabOpKind.CLOSE:
      return 'CLOSE';
    case TabOpKind.HOME:
      return 'HOME';
    case TabOpKind.RELOAD:
      return 'RELOAD';
    default:
      return 'UNKNOWN';
  }
}

function categoryName(category: OpCategory): string {
  switch (category) {
    case OpCategory.STRUCTURE:
      return 'structure';
    case OpCategory.NAVIGATION:
      return 'navigation';
    case OpCategory.RECOVERY:
      return 'recovery';
    default:
      return 'unknown';
  }
}

/**
 * One row of the tab operation catalog.
 *
 * The catalog is the single source of truth used by the suite: preconditions,
 * parameter contract, expected tab delta and the visible outcome of every
 * operation live next to each other so that a missing guard is a catalog
 * defect rather than a silent behavioural drift.
 */
interface TabOperationSpec {
  id: string;
  displayName: string;
  kind: TabOpKind;
  category: OpCategory;
  minTabCount: number;
  maxTabCount: number;
  parameter: string;
  parameterRequired: boolean;
  expectsRefusal: boolean;
  expectedTabDelta: number;
  expectedIndexDelta: number;
  toast: string;
  precondition: string;
  expectation: string;
}

/** Runtime state a catalog row is evaluated against. */
interface TabOpContext {
  name: string;
  tabCount: number;
  currentIndex: number;
  targetIndex: number;
  controllerReady: boolean;
  loading: boolean;
}

/** Aggregated statistics printed by the suite summary. */
interface CatalogStats {
  total: number;
  structure: number;
  navigation: number;
  recovery: number;
  refusals: number;
  tabDeltaSum: number;
}

/* ------------------------------------------------------------------ */
/* Catalog content: twenty rows covering the six operation kinds       */
/* ------------------------------------------------------------------ */

const CATALOG_SPECS: TabOperationSpec[] = [
  {
    id: 'TAB_ADD_DEFAULT',
    displayName: 'append a tab from the model default path',
    kind: TabOpKind.ADD,
    category: OpCategory.STRUCTURE,
    minTabCount: MIN_TAB_COUNT,
    maxTabCount: MAX_TAB_COUNT,
    parameter: 'none',
    parameterRequired: false,
    expectsRefusal: false,
    expectedTabDelta: 1,
    expectedIndexDelta: 1,
    toast: '',
    precondition: 'one tab is open and the count stays at or below the ceiling',
    expectation: 'a tab is appended with the next free key and becomes selected'
  },
  {
    id: 'TAB_ADD_FROM_ACTION_BUTTON',
    displayName: 'append a tab from actionButton1',
    kind: TabOpKind.ADD,
    category: OpCategory.STRUCTURE,
    minTabCount: MIN_TAB_COUNT,
    maxTabCount: MAX_TAB_COUNT,
    parameter: 'button press',
    parameterRequired: false,
    expectsRefusal: false,
    expectedTabDelta: 1,
    expectedIndexDelta: 1,
    toast: '',
    precondition: 'the title bar action button is rendered and enabled',
    expectation: 'the tap is forwarded to addTab and one tab is appended'
  },
  {
    id: 'TAB_ADD_AT_CAPACITY',
    displayName: 'refuse a tab append at the ceiling',
    kind: TabOpKind.ADD,
    category: OpCategory.STRUCTURE,
    minTabCount: MAX_TAB_COUNT + 1,
    maxTabCount: 1024,
    parameter: 'none',
    parameterRequired: false,
    expectsRefusal: true,
    expectedTabDelta: 0,
    expectedIndexDelta: 0,
    toast: TAB_LIMIT_MESSAGE,
    precondition: 'the tab list already holds more than ten entries',
    expectation: 'the append is refused with the capacity toast and no key is consumed'
  },
  {
    id: 'TAB_ADD_AFTER_DELETE',
    displayName: 'reuse the key that a deletion released',
    kind: TabOpKind.ADD,
    category: OpCategory.STRUCTURE,
    minTabCount: 2,
    maxTabCount: MAX_TAB_COUNT,
    parameter: 'none',
    parameterRequired: false,
    expectsRefusal: false,
    expectedTabDelta: 1,
    expectedIndexDelta: 1,
    toast: '',
    precondition: 'a deletion lowered the count so the ceiling is not reached',
    expectation: 'the appended tab takes the first free key and the index moves to it'
  },
  {
    id: 'TAB_DELETE_MIDDLE',
    displayName: 'delete a tab from the middle of the strip',
    kind: TabOpKind.DELETE,
    category: OpCategory.STRUCTURE,
    minTabCount: 2,
    maxTabCount: MAX_TAB_COUNT,
    parameter: 'index',
    parameterRequired: true,
    expectsRefusal: false,
    expectedTabDelta: -1,
    expectedIndexDelta: 0,
    toast: '',
    precondition: 'at least two tabs exist and the index points inside the strip',
    expectation: 'the row disappears and every later key is renumbered downwards'
  },
  {
    id: 'TAB_DELETE_FIRST',
    displayName: 'delete the first tab of the strip',
    kind: TabOpKind.DELETE,
    category: OpCategory.STRUCTURE,
    minTabCount: 2,
    maxTabCount: MAX_TAB_COUNT,
    parameter: 'index',
    parameterRequired: true,
    expectsRefusal: false,
    expectedTabDelta: -1,
    expectedIndexDelta: -1,
    toast: '',
    precondition: 'the selected tab is not the first entry and the count is above one',
    expectation: 'the removal shifts the selection one slot to the left'
  },
  {
    id: 'TAB_DELETE_LAST_INDEX',
    displayName: 'delete the tail tab while it is selected',
    kind: TabOpKind.DELETE,
    category: OpCategory.STRUCTURE,
    minTabCount: 2,
    maxTabCount: MAX_TAB_COUNT,
    parameter: 'index',
    parameterRequired: true,
    expectsRefusal: false,
    expectedTabDelta: -1,
    expectedIndexDelta: -1,
    toast: '',
    precondition: 'the selected index equals the last valid index',
    expectation: 'the selection is repaired to the new last valid index'
  },
  {
    id: 'TAB_DELETE_AT_MIN_COUNT',
    displayName: 'refuse deleting the only remaining tab',
    kind: TabOpKind.DELETE,
    category: OpCategory.STRUCTURE,
    minTabCount: MIN_TAB_COUNT,
    maxTabCount: MIN_TAB_COUNT,
    parameter: 'index',
    parameterRequired: true,
    expectsRefusal: true,
    expectedTabDelta: 0,
    expectedIndexDelta: 0,
    toast: '',
    precondition: 'exactly one tab is left in the browser',
    expectation: 'the deletion is refused and the single tab stays untouched'
  },
  {
    id: 'TAB_SWITCH_FORWARD',
    displayName: 'switch to the tab on the right',
    kind: TabOpKind.SWITCH,
    category: OpCategory.NAVIGATION,
    minTabCount: 2,
    maxTabCount: MAX_TAB_COUNT,
    parameter: 'index',
    parameterRequired: true,
    expectsRefusal: false,
    expectedTabDelta: 0,
    expectedIndexDelta: 1,
    toast: '',
    precondition: 'the target index is greater than the current index and still valid',
    expectation: 'tabArrayIndex moves forward and the target controller becomes active'
  },
  {
    id: 'TAB_SWITCH_BACKWARD',
    displayName: 'switch back to the tab on the left',
    kind: TabOpKind.SWITCH,
    category: OpCategory.NAVIGATION,
    minTabCount: 2,
    maxTabCount: MAX_TAB_COUNT,
    parameter: 'index',
    parameterRequired: true,
    expectsRefusal: false,
    expectedTabDelta: 0,
    expectedIndexDelta: -1,
    toast: '',
    precondition: 'the target index is smaller than the current index and not negative',
    expectation: 'tabArrayIndex moves backward and the structure stays unchanged'
  },
  {
    id: 'TAB_SWITCH_OUT_OF_RANGE',
    displayName: 'refuse a switch to a missing tab',
    kind: TabOpKind.SWITCH,
    category: OpCategory.NAVIGATION,
    minTabCount: MIN_TAB_COUNT,
    maxTabCount: MAX_TAB_COUNT,
    parameter: 'index',
    parameterRequired: true,
    expectsRefusal: true,
    expectedTabDelta: 0,
    expectedIndexDelta: 0,
    toast: '',
    precondition: 'the requested index is negative or beyond the last valid index',
    expectation: 'the selection stays where it was and no controller is attached'
  },
  {
    id: 'TAB_CLOSE_ACTIVE',
    displayName: 'close the active tab from the cancel button',
    kind: TabOpKind.CLOSE,
    category: OpCategory.STRUCTURE,
    minTabCount: 2,
    maxTabCount: MAX_TAB_COUNT,
    parameter: 'button press',
    parameterRequired: false,
    expectsRefusal: false,
    expectedTabDelta: -1,
    expectedIndexDelta: 0,
    toast: '',
    precondition: 'cancelBtn is visible because more than one tab exists',
    expectation: 'the active tab is removed and the neighbouring tab is selected'
  },
  {
    id: 'TAB_CLOSE_INACTIVE',
    displayName: 'close an inactive tab through its own cancel affordance',
    kind: TabOpKind.CLOSE,
    category: OpCategory.STRUCTURE,
    minTabCount: 2,
    maxTabCount: MAX_TAB_COUNT,
    parameter: 'index',
    parameterRequired: true,
    expectsRefusal: false,
    expectedTabDelta: -1,
    expectedIndexDelta: 0,
    toast: '',
    precondition: 'the target index differs from the selected index and both are valid',
    expectation: 'the inactive tab is removed and the selection is repaired in place'
  },
  {
    id: 'TAB_CLOSE_LAST_REMAINING',
    displayName: 'refuse closing the last remaining tab',
    kind: TabOpKind.CLOSE,
    category: OpCategory.STRUCTURE,
    minTabCount: MIN_TAB_COUNT,
    maxTabCount: MIN_TAB_COUNT,
    parameter: 'button press',
    parameterRequired: false,
    expectsRefusal: true,
    expectedTabDelta: 0,
    expectedIndexDelta: 0,
    toast: '',
    precondition: 'only one tab is open so cancelBtn is hidden',
    expectation: 'the close request is ignored and the browser keeps one tab'
  },
  {
    id: 'TAB_HOME_PAD',
    displayName: 'load the tablet rawfile home page',
    kind: TabOpKind.HOME,
    category: OpCategory.NAVIGATION,
    minTabCount: MIN_TAB_COUNT,
    maxTabCount: MAX_TAB_COUNT,
    parameter: 'rawfile',
    parameterRequired: false,
    expectsRefusal: false,
    expectedTabDelta: 0,
    expectedIndexDelta: 0,
    toast: '',
    precondition: 'the tablet layout is active and a controller is attached',
    expectation: 'pad.html is loaded and the address field is cleared'
  },
  {
    id: 'TAB_HOME_PHONE',
    displayName: 'load the phone rawfile home page',
    kind: TabOpKind.HOME,
    category: OpCategory.NAVIGATION,
    minTabCount: MIN_TAB_COUNT,
    maxTabCount: MAX_TAB_COUNT,
    parameter: 'rawfile',
    parameterRequired: false,
    expectsRefusal: false,
    expectedTabDelta: 0,
    expectedIndexDelta: 0,
    toast: '',
    precondition: 'the phone layout is active and a controller is attached',
    expectation: 'phone.html is loaded and the address field is cleared'
  },
  {
    id: 'TAB_HOME_WITHOUT_CONTROLLER',
    displayName: 'refuse a home load without a controller',
    kind: TabOpKind.HOME,
    category: OpCategory.NAVIGATION,
    minTabCount: MIN_TAB_COUNT,
    maxTabCount: MAX_TAB_COUNT,
    parameter: 'rawfile',
    parameterRequired: false,
    expectsRefusal: true,
    expectedTabDelta: 0,
    expectedIndexDelta: 0,
    toast: '',
    precondition: 'the selected tab exists but its controller is not ready yet',
    expectation: 'nothing is loaded and the previous page stays visible'
  },
  {
    id: 'TAB_RELOAD_CURRENT',
    displayName: 'reload the page of the active tab',
    kind: TabOpKind.RELOAD,
    category: OpCategory.RECOVERY,
    minTabCount: MIN_TAB_COUNT,
    maxTabCount: MAX_TAB_COUNT,
    parameter: 'button press',
    parameterRequired: false,
    expectsRefusal: false,
    expectedTabDelta: 0,
    expectedIndexDelta: 0,
    toast: '',
    precondition: 'a controller is attached and the current page is not empty',
    expectation: 'refresh is called once on the active controller only'
  },
  {
    id: 'TAB_RELOAD_AFTER_BACK',
    displayName: 'reload after stepping back in history',
    kind: TabOpKind.RELOAD,
    category: OpCategory.RECOVERY,
    minTabCount: MIN_TAB_COUNT,
    maxTabCount: MAX_TAB_COUNT,
    parameter: 'button press',
    parameterRequired: false,
    expectsRefusal: false,
    expectedTabDelta: 0,
    expectedIndexDelta: 0,
    toast: '',
    precondition: 'the history cursor is not at the newest entry',
    expectation: 'the page at the cursor is refreshed and the cursor is preserved'
  },
  {
    id: 'TAB_RELOAD_WITHOUT_CONTROLLER',
    displayName: 'refuse a reload without a controller',
    kind: TabOpKind.RELOAD,
    category: OpCategory.RECOVERY,
    minTabCount: MIN_TAB_COUNT,
    maxTabCount: MAX_TAB_COUNT,
    parameter: 'button press',
    parameterRequired: false,
    expectsRefusal: true,
    expectedTabDelta: 0,
    expectedIndexDelta: 0,
    toast: '',
    precondition: 'the selected tab has no usable web controller',
    expectation: 'the refresh counter stays untouched and no toast is raised'
  }
];

/* ------------------------------------------------------------------ */
/* Catalog query and evaluation helpers                                */
/* ------------------------------------------------------------------ */

function makeContext(name: string, tabCount: number, currentIndex: number, targetIndex: number,
  controllerReady: boolean, loading: boolean): TabOpContext {
  const context: TabOpContext = {
    name: name,
    tabCount: tabCount,
    currentIndex: currentIndex,
    targetIndex: targetIndex,
    controllerReady: controllerReady,
    loading: loading
  };
  return context;
}

/** Lookup and evaluation panel of the catalog. */
class TabOperationCatalog {
  private specs: TabOperationSpec[] = [];
  private positions: Map<string, number> = new Map<string, number>();

  constructor(specs: TabOperationSpec[]) {
    this.specs = specs.slice(0);
    for (let index = 0; index < this.specs.length; index++) {
      this.positions.set(this.specs[index].id, index);
    }
  }

  size(): number {
    return this.specs.length;
  }

  all(): TabOperationSpec[] {
    return this.specs.slice(0);
  }

  ids(): string[] {
    return this.specs.map((spec: TabOperationSpec) => spec.id);
  }

  find(id: string): TabOperationSpec | null {
    const position: number | undefined = this.positions.get(id);
    if (position === undefined) {
      return null;
    }
    return this.specs[position];
  }

  indexOf(id: string): number {
    const position: number | undefined = this.positions.get(id);
    return position === undefined ? -1 : position;
  }

  byKind(kind: TabOpKind): TabOperationSpec[] {
    return this.specs.filter((spec: TabOperationSpec) => spec.kind === kind);
  }

  byCategory(category: OpCategory): TabOperationSpec[] {
    return this.specs.filter((spec: TabOperationSpec) => spec.category === category);
  }

  byRefusal(expected: boolean): TabOperationSpec[] {
    return this.specs.filter((spec: TabOperationSpec) => spec.expectsRefusal === expected);
  }

  hasDuplicateIds(): boolean {
    const seen: Set<string> = new Set<string>();
    for (let index = 0; index < this.specs.length; index++) {
      const key: string = this.specs[index].id;
      if (seen.has(key)) {
        return true;
      }
      seen.add(key);
    }
    return false;
  }

  categoryCounts(): Map<string, number> {
    const counts: Map<string, number> = new Map<string, number>();
    counts.set(categoryName(OpCategory.STRUCTURE), 0);
    counts.set(categoryName(OpCategory.NAVIGATION), 0);
    counts.set(categoryName(OpCategory.RECOVERY), 0);
    for (let index = 0; index < this.specs.length; index++) {
      const key: string = categoryName(this.specs[index].category);
      let previous: number = 0;
      const found: number | undefined = counts.get(key);
      if (found !== undefined) {
        previous = found;
      }
      counts.set(key, previous + 1);
    }
    return counts;
  }

  kindCounts(): Map<string, number> {
    const counts: Map<string, number> = new Map<string, number>();
    for (let index = 0; index < this.specs.length; index++) {
      const key: string = kindName(this.specs[index].kind);
      let previous: number = 0;
      const found: number | undefined = counts.get(key);
      if (found !== undefined) {
        previous = found;
      }
      counts.set(key, previous + 1);
    }
    return counts;
  }

  sumTabDelta(): number {
    let total: number = 0;
    for (let index = 0; index < this.specs.length; index++) {
      total += this.specs[index].expectedTabDelta;
    }
    return total;
  }

  sumIndexDelta(): number {
    let total: number = 0;
    for (let index = 0; index < this.specs.length; index++) {
      total += this.specs[index].expectedIndexDelta;
    }
    return total;
  }

  counterWeight(): number {
    let moves: number = 0;
    for (let index = 0; index < this.specs.length; index++) {
      const spec: TabOperationSpec = this.specs[index];
      moves += spec.expectedTabDelta < 0 ? -spec.expectedTabDelta : spec.expectedTabDelta;
    }
    return moves;
  }

  stats(): CatalogStats {
    const counts: Map<string, number> = this.categoryCounts();
    const structure: number = counts.get(categoryName(OpCategory.STRUCTURE)) as number;
    const navigation: number = counts.get(categoryName(OpCategory.NAVIGATION)) as number;
    const recovery: number = counts.get(categoryName(OpCategory.RECOVERY)) as number;
    const stats: CatalogStats = {
      total: this.specs.length,
      structure: structure,
      navigation: navigation,
      recovery: recovery,
      refusals: this.byRefusal(true).length,
      tabDeltaSum: this.sumTabDelta()
    };
    return stats;
  }

  /** Returns the catalog rows whose textual contract is incomplete. */
  incompleteFields(): string[] {
    const broken: string[] = [];
    for (let index = 0; index < this.specs.length; index++) {
      const spec: TabOperationSpec = this.specs[index];
      let complete: boolean = spec.id.length > 0 && spec.displayName.length > 0;
      complete = complete && spec.precondition.length > 0 && spec.expectation.length > 0;
      complete = complete && spec.parameter.length > 0;
      complete = complete && spec.minTabCount >= MIN_TAB_COUNT;
      complete = complete && spec.maxTabCount >= spec.minTabCount;
      if (!complete) {
        broken.push(spec.id);
      }
    }
    return broken;
  }

  /** Capacity rows must carry the toast, every other row must stay silent. */
  toastContractViolations(): string[] {
    const broken: string[] = [];
    for (let index = 0; index < this.specs.length; index++) {
      const spec: TabOperationSpec = this.specs[index];
      if (spec.expectsRefusal && spec.toast.length > 0 && spec.kind !== TabOpKind.ADD &&
        spec.kind !== TabOpKind.DELETE) {
        broken.push(spec.id);
      }
      if (!spec.expectsRefusal && spec.toast.length > 0) {
        broken.push(spec.id);
      }
    }
    return broken;
  }

  /**
   * Decides whether the model would accept the row under the given context.
   * The rules mirror model/Browser.ets: capacity is compared with "> 10",
   * deletion and closing need at least two tabs, switching needs a valid index.
   */
  allowed(spec: TabOperationSpec, context: TabOpContext): boolean {
    if (spec.expectsRefusal) {
      return false;
    }
    if (spec.kind === TabOpKind.ADD) {
      return context.tabCount <= MAX_TAB_COUNT;
    }
    if (spec.kind === TabOpKind.DELETE || spec.kind === TabOpKind.CLOSE) {
      if (context.tabCount <= MIN_TAB_COUNT) {
        return false;
      }
      return context.targetIndex >= 0 && context.targetIndex < context.tabCount;
    }
    if (spec.kind === TabOpKind.SWITCH) {
      if (context.tabCount <= MIN_TAB_COUNT) {
        return false;
      }
      return context.targetIndex >= 0 && context.targetIndex < context.tabCount &&
        context.targetIndex !== context.currentIndex;
    }
    if (spec.kind === TabOpKind.HOME || spec.kind === TabOpKind.RELOAD) {
      return context.controllerReady;
    }
    return false;
  }

  /** Row oriented executability matrix: one boolean column per context. */
  matrix(contexts: TabOpContext[]): boolean[][] {
    const rows: boolean[][] = [];
    for (let row = 0; row < this.specs.length; row++) {
      const columns: boolean[] = [];
      for (let column = 0; column < contexts.length; column++) {
        columns.push(this.allowed(this.specs[row], contexts[column]));
      }
      rows.push(columns);
    }
    return rows;
  }

  /** Counts the enabled cells of one matrix column. */
  columnWeight(matrix: boolean[][], column: number): number {
    let total: number = 0;
    for (let row = 0; row < matrix.length; row++) {
      if (matrix[row][column]) {
        total += 1;
      }
    }
    return total;
  }

  rowSummary(spec: TabOperationSpec): string {
    const delta: string = spec.expectedTabDelta >= 0 ? `+${spec.expectedTabDelta}` :
      `${spec.expectedTabDelta}`;
    const refusal: string = spec.expectsRefusal ? 'refused' : 'accepted';
    return `${spec.id}|${kindName(spec.kind)}|${categoryName(spec.category)}|${delta}|${refusal}`;
  }

  summaryRows(): string[] {
    return this.specs.map((spec: TabOperationSpec) => this.rowSummary(spec));
  }

  /** Sorted view grouped by kind, keeping the catalog order inside a kind. */
  sortedByKind(): TabOperationSpec[] {
    const result: TabOperationSpec[] = [];
    const order: TabOpKind[] = [TabOpKind.ADD, TabOpKind.DELETE, TabOpKind.SWITCH,
      TabOpKind.CLOSE, TabOpKind.HOME, TabOpKind.RELOAD];
    for (let cursor = 0; cursor < order.length; cursor++) {
      const bucket: TabOperationSpec[] = this.byKind(order[cursor]);
      for (let index = 0; index < bucket.length; index++) {
        result.push(bucket[index]);
      }
    }
    return result;
  }

  /** Structural problems of a runtime context, empty when it is usable. */
  validateContext(context: TabOpContext): string[] {
    const problems: string[] = [];
    if (context.tabCount < MIN_TAB_COUNT) {
      problems.push('tabCount below the minimum');
    }
    if (context.tabCount > MAX_TAB_COUNT + 1) {
      problems.push('tabCount above the hard ceiling');
    }
    if (context.currentIndex < 0) {
      problems.push('currentIndex is negative');
    }
    if (context.tabCount > 0 && context.currentIndex >= context.tabCount) {
      problems.push('currentIndex beyond the last tab');
    }
    if (context.targetIndex < 0) {
      problems.push('targetIndex is negative');
    }
    return problems;
  }
}

const catalog: TabOperationCatalog = new TabOperationCatalog(CATALOG_SPECS);

function buildStats(): CatalogStats {
  return catalog.stats();
}

export default function tabOperationCatalogTest() {
  describe('tabOperationCatalogTest', () => {
    let driver: Driver = getDriver();
    let clock: MockClock = new MockClock();

    beforeAll(async () => {
      TestLogger.info(TAG, 'catalog suite begin');
      await startBrowserApp();
    });

    afterAll(() => {
      const stats: CatalogStats = buildStats();
      TestLogger.info(TAG, `catalog total=${stats.total} structure=${stats.structure} ` +
        `navigation=${stats.navigation} recovery=${stats.recovery} refusals=${stats.refusals}`);
      TestLogger.info(TAG, TestLogger.summary(TAG));
    });

    beforeEach(() => {
      TestLogger.resetSteps(TAG);
      clock = new MockClock();
    });

    it('Browser_TabOpCatalog_001', 0, async () => {
      TestLogger.step(TAG, 'the catalog exposes twenty distinct rows');
      expect(catalog.size()).assertEqual(20);
      expect(catalog.all().length).assertEqual(20);
      expect(catalog.ids().length).assertEqual(20);
      expect(catalog.ids()[0]).assertEqual('TAB_ADD_DEFAULT');
      expect(catalog.ids()[19]).assertEqual('TAB_RELOAD_WITHOUT_CONTROLLER');
      expect(catalog.hasDuplicateIds()).assertFalse();
      const unique: Set<string> = new Set<string>();
      const allIds: string[] = catalog.ids();
      for (let index = 0; index < allIds.length; index++) {
        unique.add(allIds[index]);
      }
      expect(unique.size).assertEqual(catalog.size());
    });

    it('Browser_TabOpCatalog_002', 0, async () => {
      TestLogger.step(TAG, 'ids are unique and searchable by exact key');
      const ids: string[] = catalog.ids();
      for (let index = 0; index < ids.length; index++) {
        const found: TabOperationSpec | null = catalog.find(ids[index]);
        expect(found === null).assertFalse();
        if (found !== null) {
          expect(found.id).assertEqual(ids[index]);
          expect(catalog.indexOf(ids[index])).assertEqual(index);
        }
      }
      expect(catalog.find('TAB_MISSING_ROW') === null).assertTrue();
      expect(catalog.indexOf('TAB_MISSING_ROW')).assertEqual(-1);
      expect(catalog.find('tab_add_default') === null).assertTrue();
    });

    it('Browser_TabOpCatalog_003', 0, async () => {
      TestLogger.step(TAG, 'all six operation kinds are represented');
      const counts: Map<string, number> = catalog.kindCounts();
      expect(counts.size).assertEqual(6);
      expect(counts.get('ADD')).assertEqual(4);
      expect(counts.get('DELETE')).assertEqual(4);
      expect(counts.get('SWITCH')).assertEqual(3);
      expect(counts.get('CLOSE')).assertEqual(3);
      expect(counts.get('HOME')).assertEqual(3);
      expect(counts.get('RELOAD')).assertEqual(3);
      let sum: number = 0;
      counts.forEach((value: number) => {
        sum += value;
      });
      expect(sum).assertEqual(catalog.size());
    });

    it('Browser_TabOpCatalog_004', 0, async () => {
      TestLogger.step(TAG, 'category buckets partition the catalog without overlap');
      const counts: Map<string, number> = catalog.categoryCounts();
      expect(counts.get('structure')).assertEqual(11);
      expect(counts.get('navigation')).assertEqual(6);
      expect(counts.get('recovery')).assertEqual(3);
      expect(catalog.byCategory(OpCategory.STRUCTURE).length).assertEqual(11);
      expect(catalog.byCategory(OpCategory.NAVIGATION).length).assertEqual(6);
      expect(catalog.byCategory(OpCategory.RECOVERY).length).assertEqual(3);
      const stats: CatalogStats = buildStats();
      expect(stats.structure + stats.navigation + stats.recovery).assertEqual(stats.total);
    });

    it('Browser_TabOpCatalog_005', 0, async () => {
      TestLogger.step(TAG, 'every row fills its textual contract');
      const broken: string[] = catalog.incompleteFields();
      expect(broken.length).assertEqual(0);
      const specs: TabOperationSpec[] = catalog.all();
      for (let index = 0; index < specs.length; index++) {
        expect(specs[index].id.startsWith('TAB_')).assertTrue();
        expect(specs[index].displayName.length > 8).assertTrue();
        expect(specs[index].precondition.length > 10).assertTrue();
        expect(specs[index].expectation.length > 10).assertTrue();
        expect(specs[index].maxTabCount >= specs[index].minTabCount).assertTrue();
      }
    });

    it('Browser_TabOpCatalog_006', 0, async () => {
      TestLogger.step(TAG, 'refusal rows are exactly the guarded operations');
      const refused: TabOperationSpec[] = catalog.byRefusal(true);
      expect(refused.length).assertEqual(6);
      expect(catalog.byRefusal(false).length).assertEqual(14);
      const refusedKinds: string[] = refused.map((spec: TabOperationSpec) => kindName(spec.kind));
      expect(refusedKinds.indexOf('ADD')).assertLarger(-1);
      expect(refusedKinds.indexOf('DELETE')).assertLarger(-1);
      expect(refusedKinds.indexOf('SWITCH')).assertLarger(-1);
      expect(refusedKinds.indexOf('CLOSE')).assertLarger(-1);
      expect(refusedKinds.indexOf('RELOAD')).assertLarger(-1);
      expect(refusedKinds.indexOf('HOME')).assertLarger(-1);
      for (let index = 0; index < refused.length; index++) {
        expect(refused[index].expectedTabDelta).assertEqual(0);
        expect(refused[index].expectedIndexDelta).assertEqual(0);
      }
    });

    it('Browser_TabOpCatalog_007', 0, async () => {
      TestLogger.step(TAG, 'tab deltas add up to the documented net movement');
      expect(catalog.sumTabDelta()).assertEqual(-2);
      expect(catalog.sumIndexDelta()).assertEqual(1);
      expect(catalog.counterWeight()).assertEqual(8);
      const addDelta: number = catalog.byKind(TabOpKind.ADD)
        .reduce((sum: number, spec: TabOperationSpec) => sum + spec.expectedTabDelta, 0);
      expect(addDelta).assertEqual(3);
      const deleteDelta: number = catalog.byKind(TabOpKind.DELETE)
        .reduce((sum: number, spec: TabOperationSpec) => sum + spec.expectedTabDelta, 0);
      expect(deleteDelta).assertEqual(-3);
      const switchDelta: number = catalog.byKind(TabOpKind.SWITCH)
        .reduce((sum: number, spec: TabOperationSpec) => sum + spec.expectedIndexDelta, 0);
      expect(switchDelta).assertEqual(0);
    });

    it('Browser_TabOpCatalog_008', 0, async () => {
      TestLogger.step(TAG, 'toast contract keeps refusals silent except capacity guards');
      const violations: string[] = catalog.toastContractViolations();
      expect(violations.length).assertEqual(0);
      const addAtCapacity: TabOperationSpec | null = catalog.find('TAB_ADD_AT_CAPACITY');
      expect(addAtCapacity === null).assertFalse();
      if (addAtCapacity !== null) {
        expect(addAtCapacity.toast).assertEqual(TAB_LIMIT_MESSAGE);
        expect(addAtCapacity.minTabCount).assertEqual(MAX_TAB_COUNT + 1);
      }
      const closeLast: TabOperationSpec | null = catalog.find('TAB_CLOSE_LAST_REMAINING');
      if (closeLast !== null) {
        expect(closeLast.toast).assertEqual('');
        expect(closeLast.minTabCount).assertEqual(MIN_TAB_COUNT);
      }
    });

    it('Browser_TabOpCatalog_009', 0, async () => {
      TestLogger.step(TAG, 'add rows declare the documented capacity guard');
      const adds: TabOperationSpec[] = catalog.byKind(TabOpKind.ADD);
      expect(adds.length).assertEqual(4);
      for (let index = 0; index < adds.length; index++) {
        expect(adds[index].category).assertEqual(OpCategory.STRUCTURE);
        if (adds[index].expectsRefusal) {
          // The capacity guard models a tab list that is already beyond ten.
          expect(adds[index].maxTabCount).assertLarger(MAX_TAB_COUNT);
        } else {
          expect(adds[index].maxTabCount).assertEqual(MAX_TAB_COUNT);
        }
        expect(adds[index].parameterRequired).assertFalse();
      }
      const guarded: TabOperationSpec[] = adds.filter((spec: TabOperationSpec) => spec.expectsRefusal);
      expect(guarded.length).assertEqual(1);
      expect(guarded[0].id).assertEqual('TAB_ADD_AT_CAPACITY');
      expect(catalog.allowed(guarded[0], makeContext('full', 11, 10, 10, true, false))).assertFalse();
      expect(catalog.allowed(adds[0], makeContext('room', 10, 9, 9, true, false))).assertTrue();
    });

    it('Browser_TabOpCatalog_010', 0, async () => {
      TestLogger.step(TAG, 'delete rows require a valid index and two tabs');
      const deletes: TabOperationSpec[] = catalog.byKind(TabOpKind.DELETE);
      expect(deletes.length).assertEqual(4);
      for (let index = 0; index < deletes.length; index++) {
        expect(deletes[index].parameter).assertEqual('index');
        expect(deletes[index].parameterRequired).assertTrue();
        expect(deletes[index].expectedTabDelta <= 0).assertTrue();
      }
      const middle: TabOperationSpec | null = catalog.find('TAB_DELETE_MIDDLE');
      if (middle !== null) {
        expect(catalog.allowed(middle, makeContext('three', 3, 2, 1, true, false))).assertTrue();
        expect(catalog.allowed(middle, makeContext('single', 1, 0, 0, true, false))).assertFalse();
        expect(catalog.allowed(middle, makeContext('oob', 3, 0, 3, true, false))).assertFalse();
      }
    });

    it('Browser_TabOpCatalog_011', 0, async () => {
      TestLogger.step(TAG, 'switch rows keep the selection inside the strip');
      const switches: TabOperationSpec[] = catalog.byKind(TabOpKind.SWITCH);
      expect(switches.length).assertEqual(3);
      const forward: TabOperationSpec | null = catalog.find('TAB_SWITCH_FORWARD');
      const backward: TabOperationSpec | null = catalog.find('TAB_SWITCH_BACKWARD');
      expect(forward === null).assertFalse();
      expect(backward === null).assertFalse();
      if (forward !== null) {
        expect(forward.expectedIndexDelta).assertEqual(1);
        expect(catalog.allowed(forward, makeContext('r', 3, 0, 1, true, false))).assertTrue();
        expect(catalog.allowed(forward, makeContext('same', 3, 1, 1, true, false))).assertFalse();
      }
      if (backward !== null) {
        expect(backward.expectedIndexDelta).assertEqual(-1);
        expect(catalog.allowed(backward, makeContext('l', 3, 2, 1, true, false))).assertTrue();
        expect(catalog.allowed(backward, makeContext('neg', 3, 0, -1, true, false))).assertFalse();
      }
    });

    it('Browser_TabOpCatalog_012', 0, async () => {
      TestLogger.step(TAG, 'close and reload rows follow the controller contract');
      const closes: TabOperationSpec[] = catalog.byKind(TabOpKind.CLOSE);
      const reloads: TabOperationSpec[] = catalog.byKind(TabOpKind.RELOAD);
      expect(closes.length).assertEqual(3);
      expect(reloads.length).assertEqual(3);
      const closeLast: TabOperationSpec | null = catalog.find('TAB_CLOSE_LAST_REMAINING');
      if (closeLast !== null) {
        expect(catalog.allowed(closeLast, makeContext('one', 1, 0, 0, true, false))).assertFalse();
      }
      const reload: TabOperationSpec | null = catalog.find('TAB_RELOAD_CURRENT');
      if (reload !== null) {
        expect(reload.category).assertEqual(OpCategory.RECOVERY);
        expect(catalog.allowed(reload, makeContext('ready', 2, 0, 0, true, false))).assertTrue();
        expect(catalog.allowed(reload, makeContext('cold', 2, 0, 0, false, false))).assertFalse();
      }
      const home: TabOperationSpec | null = catalog.find('TAB_HOME_PAD');
      if (home !== null) {
        expect(home.category).assertEqual(OpCategory.NAVIGATION);
        expect(catalog.allowed(home, makeContext('cold', 2, 0, 0, false, false))).assertFalse();
      }
    });

    it('Browser_TabOpCatalog_013', 0, async () => {
      TestLogger.step(TAG, 'executability matrix has one column per context');
      const contexts: TabOpContext[] = [
        makeContext('single', 1, 0, 0, true, false),
        makeContext('three', 3, 1, 2, true, false),
        makeContext('ten', 10, 9, 8, true, false),
        makeContext('overflow', 11, 10, 10, true, false),
        makeContext('cold', 2, 0, 1, false, true)
      ];
      const matrix: boolean[][] = catalog.matrix(contexts);
      expect(matrix.length).assertEqual(catalog.size());
      for (let row = 0; row < matrix.length; row++) {
        expect(matrix[row].length).assertEqual(5);
      }
      for (let column = 0; column < 5; column++) {
        const weight: number = catalog.columnWeight(matrix, column);
        expect(weight).assertLarger(0);
        expect(weight).assertLess(catalog.size());
      }
      expect(catalog.columnWeight(matrix, 3)).assertLess(catalog.columnWeight(matrix, 2));
      expect(catalog.columnWeight(matrix, 4)).assertLess(catalog.columnWeight(matrix, 1));
    });

    it('Browser_TabOpCatalog_014', 0, async () => {
      TestLogger.step(TAG, 'matrix cells agree with the per row guard evaluation');
      const context: TabOpContext = makeContext('three', 3, 1, 2, true, false);
      const matrix: boolean[][] = catalog.matrix([context]);
      const specs: TabOperationSpec[] = catalog.all();
      let enabled: number = 0;
      for (let row = 0; row < specs.length; row++) {
        expect(matrix[row][0]).assertEqual(catalog.allowed(specs[row], context));
        if (matrix[row][0]) {
          enabled += 1;
        }
      }
      expect(enabled).assertEqual(catalog.columnWeight(matrix, 0));
      expect(enabled).assertEqual(catalog.size() - catalog.byRefusal(true).length);
    });

    it('Browser_TabOpCatalog_015', 0, async () => {
      TestLogger.step(TAG, 'summary rows describe every catalog entry');
      const rows: string[] = catalog.summaryRows();
      expect(rows.length).assertEqual(20);
      expect(rows[0]).assertEqual('TAB_ADD_DEFAULT|ADD|structure|+1|accepted');
      expect(rows[2]).assertEqual('TAB_ADD_AT_CAPACITY|ADD|structure|+0|refused');
      const parts: string[] = rows[3].split('|');
      expect(parts.length).assertEqual(5);
      expect(parts[0]).assertEqual('TAB_ADD_AFTER_DELETE');
      for (let index = 0; index < rows.length; index++) {
        expect(rows[index].indexOf('|')).assertLarger(0);
        expect(rows[index].indexOf('UNKNOWN')).assertEqual(-1);
      }
    });

    it('Browser_TabOpCatalog_016', 0, async () => {
      TestLogger.step(TAG, 'kind grouping keeps the original order inside a bucket');
      const sorted: TabOperationSpec[] = catalog.sortedByKind();
      expect(sorted.length).assertEqual(catalog.size());
      expect(sorted[0].kind).assertEqual(TabOpKind.ADD);
      expect(sorted[sorted.length - 1].kind).assertEqual(TabOpKind.RELOAD);
      let previous: number = -1;
      for (let index = 0; index < sorted.length; index++) {
        expect(sorted[index].kind >= previous).assertTrue();
        previous = sorted[index].kind;
      }
      const kinds: string[] = sorted.map((spec: TabOperationSpec) => kindName(spec.kind));
      expect(kinds[3]).assertEqual('ADD');
      expect(kinds[4]).assertEqual('DELETE');
      expect(kinds[11]).assertEqual('CLOSE');
      expect(kinds[17]).assertEqual('RELOAD');
    });

    it('Browser_TabOpCatalog_017', 0, async () => {
      TestLogger.step(TAG, 'context validation reports structural problems only');
      expect(catalog.validateContext(makeContext('ok', 3, 1, 2, true, false)).length).assertEqual(0);
      const low: string[] = catalog.validateContext(makeContext('low', 0, 0, 0, true, false));
      expect(low.length).assertEqual(1);
      expect(low[0]).assertEqual('tabCount below the minimum');
      const high: string[] = catalog.validateContext(makeContext('high', MAX_TAB_COUNT + 2, 0, 0,
        true, false));
      expect(high.length).assertEqual(1);
      const stale: string[] = catalog.validateContext(makeContext('stale', 2, 5, -1, true, false));
      expect(stale.length).assertEqual(2);
      expect(stale.indexOf('currentIndex beyond the last tab')).assertLarger(-1);
      expect(stale.indexOf('targetIndex is negative')).assertLarger(-1);
      expect(catalog.validateContext(makeContext('edge', MIN_TAB_COUNT, 0, 0, true, true)).length)
        .assertEqual(0);
    });

    it('Browser_TabOpCatalog_018', 0, async () => {
      TestLogger.step(TAG, 'catalog deltas match the observable model movement');
      const addRow: TabOperationSpec | null = catalog.find('TAB_ADD_DEFAULT');
      const deleteRow: TabOperationSpec | null = catalog.find('TAB_DELETE_MIDDLE');
      const closeRow: TabOperationSpec | null = catalog.find('TAB_CLOSE_ACTIVE');
      const browser: MockBrowser = new MockBrowser(3);
      expect(browser.tabs.length).assertEqual(3);
      if (addRow !== null) {
        const before: number = browser.tabs.length;
        expect(browser.addTab()).assertTrue();
        expect(browser.tabs.length - before).assertEqual(addRow.expectedTabDelta);
        expect(browser.tabArrayIndex).assertEqual(before);
      }
      if (deleteRow !== null) {
        const before: number = browser.tabs.length;
        expect(browser.deleteTab(1)).assertTrue();
        expect(browser.tabs.length - before).assertEqual(deleteRow.expectedTabDelta);
        expect(browser.getTabKeys()).assertDeepEquals([0, 1, 2]);
      }
      if (closeRow !== null) {
        const before: number = browser.tabs.length;
        expect(browser.deleteTab(0)).assertTrue();
        expect(browser.tabs.length - before).assertEqual(closeRow.expectedTabDelta);
        expect(browser.tabArrayIndex >= 0).assertTrue();
      }
      expect(browser.tabs.length).assertEqual(2);
    });

    it('Browser_TabOpCatalog_019', 0, async () => {
      TestLogger.step(TAG, 'catalog ids map onto rendered browser affordances');
      const addButton: boolean = await componentByIdExists(driver, ID_ACTION_ADD);
      TestLogger.info(TAG, `actionButton1 rendered=${addButton}`);
      const cancelCount: number = await countById(driver, ID_CANCEL_TAB);
      expect(cancelCount >= 0).assertTrue();
      const homeButton: boolean = await componentByIdExists(driver, ID_NAV_HOME);
      const refreshButton: boolean = await componentByIdExists(driver, ID_NAV_REFRESH);
      TestLogger.info(TAG, `home=${homeButton} refresh=${refreshButton}`);
      const homeRow: TabOperationSpec | null = catalog.find('TAB_HOME_PAD');
      const reloadRow: TabOperationSpec | null = catalog.find('TAB_RELOAD_CURRENT');
      expect(homeRow === null).assertFalse();
      expect(reloadRow === null).assertFalse();
      if (homeRow !== null && reloadRow !== null) {
        expect(homeRow.parameter).assertEqual('rawfile');
        expect(reloadRow.parameter).assertEqual('button press');
        expect(homeRow.expectsRefusal).assertFalse();
        expect(reloadRow.expectsRefusal).assertFalse();
      }
    });

    it('Browser_TabOpCatalog_020', 0, async () => {
      TestLogger.step(TAG, 'home rows distinguish the tablet and phone rawfile pages');
      const pad: TabOperationSpec | null = catalog.find('TAB_HOME_PAD');
      const phone: TabOperationSpec | null = catalog.find('TAB_HOME_PHONE');
      expect(pad === null).assertFalse();
      expect(phone === null).assertFalse();
      expect(PAD_HOME_PAGE).assertEqual('pad.html');
      expect(PHONE_HOME_PAGE).assertEqual('phone.html');
      expect(PAD_HOME_PAGE === PHONE_HOME_PAGE).assertFalse();
      if (pad !== null && phone !== null) {
        expect(pad.id === phone.id).assertFalse();
        expect(pad.displayName === phone.displayName).assertFalse();
        expect(pad.expectedTabDelta).assertEqual(phone.expectedTabDelta);
        expect(pad.expectedIndexDelta).assertEqual(phone.expectedIndexDelta);
      }
      const start: number = clock.now();
      clock.advance(250);
      expect(clock.now() - start).assertEqual(250);
      expect(nextTabIndex(4)).assertEqual(4);
      expect(resolveTabIndexAfterDelete(4, 1, 3)).assertEqual(3);
    });

    it('Browser_TabOpCatalog_021', 0, async () => {
      TestLogger.step(TAG, 'capacity row mirrors the model toast behaviour');
      const full: MockBrowser = new MockBrowser(MAX_TAB_COUNT);
      expect(full.tabs.length).assertEqual(10);
      expect(full.addTab()).assertTrue();
      expect(full.tabs.length).assertEqual(11);
      expect(full.addTab()).assertFalse();
      expect(full.toasts.length).assertEqual(1);
      expect(full.toasts[0]).assertEqual(TAB_LIMIT_MESSAGE);
      expect(full.tabs.length).assertEqual(11);
      const row: TabOperationSpec | null = catalog.find('TAB_ADD_AT_CAPACITY');
      if (row !== null) {
        expect(row.toast).assertEqual(full.toasts[0]);
        expect(row.expectedTabDelta).assertEqual(0);
        expect(catalog.allowed(row, makeContext('full', 11, 10, 10, true, false))).assertFalse();
      }
      expect(full.getTabKeys().length).assertEqual(11);
      expect(full.getTabKeys()[10]).assertEqual(10);
    });

    it('Browser_TabOpCatalog_022', 0, async () => {
      TestLogger.step(TAG, 'catalog bounds agree with the published tab limits');
      const specs: TabOperationSpec[] = catalog.all();
      let minSeen: number = 1024;
      let maxSeen: number = 0;
      for (let index = 0; index < specs.length; index++) {
        if (specs[index].minTabCount < minSeen) {
          minSeen = specs[index].minTabCount;
        }
        if (specs[index].maxTabCount > maxSeen) {
          maxSeen = specs[index].maxTabCount;
        }
      }
      expect(minSeen).assertEqual(MIN_TAB_COUNT);
      expect(maxSeen).assertEqual(1024);
      expect(MIN_TAB_COUNT).assertEqual(1);
      expect(MAX_TAB_COUNT).assertEqual(10);
      const stats: CatalogStats = buildStats();
      expect(stats.total).assertEqual(20);
      expect(stats.refusals).assertEqual(6);
      expect(stats.tabDeltaSum).assertEqual(-2);
      TestLogger.info(TAG, `min=${minSeen} max=${maxSeen} refusals=${stats.refusals}`);
    });
  });
}
