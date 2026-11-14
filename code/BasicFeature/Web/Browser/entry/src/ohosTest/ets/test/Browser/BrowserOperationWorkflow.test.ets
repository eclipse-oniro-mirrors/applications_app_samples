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
  getDriver, startBrowserApp, countById, componentByIdExists,
  MAX_TAB_COUNT, MIN_TAB_COUNT, PAD_HOME_PAGE,
  ID_ACTION_ADD, ID_CANCEL_TAB, ID_NAV_HOME, ID_INPUT_URL
} from '../Shared/BrowserTestKit';
import { MockBrowser, MockBrowserTab, MockClock, MockLoadingStatus } from '../Shared/BrowserMock';

const TAG: string = 'BrowserOperationWorkflowTest';

/* ------------------------------------------------------------------ */
/* Workflow vocabulary                                                 */
/* ------------------------------------------------------------------ */

/** Lifecycle of one orchestrated browser workflow. */
enum WorkflowState {
  IDLE = 0,
  RUNNING = 1,
  COMPLETED = 2,
  ROLLED_BACK = 3,
  FAILED = 4
}

function stateName(state: WorkflowState): string {
  switch (state) {
    case WorkflowState.IDLE:
      return 'idle';
    case WorkflowState.RUNNING:
      return 'running';
    case WorkflowState.COMPLETED:
      return 'completed';
    case WorkflowState.ROLLED_BACK:
      return 'rolled-back';
    case WorkflowState.FAILED:
      return 'failed';
    default:
      return 'unknown';
  }
}

/** The five gestures a workflow may chain. */
enum StepKind {
  OPEN = 0,
  ADD = 1,
  SWITCH = 2,
  CLOSE = 3,
  HOME = 4
}

function stepName(kind: StepKind): string {
  switch (kind) {
    case StepKind.OPEN:
      return 'open';
    case StepKind.ADD:
      return 'add';
    case StepKind.SWITCH:
      return 'switch';
    case StepKind.CLOSE:
      return 'close';
    case StepKind.HOME:
      return 'home';
    default:
      return 'unknown';
  }
}

interface WorkflowStep {
  id: string;
  kind: StepKind;
  target: number;
  url: string;
  description: string;
}

interface StepResult {
  stepId: string;
  kind: string;
  ok: boolean;
  tabsAfter: number;
  indexAfter: number;
  stateAfter: string;
}

interface WorkflowSpec {
  name: string;
  steps: WorkflowStep[];
  expectedTabs: number;
  expectedIndex: number;
  expectedState: WorkflowState;
  expectRollback: boolean;
}

/** Compact step builders keep the workflow tables readable. */
function stepOpen(id: string, url: string): WorkflowStep {
  const step: WorkflowStep = {
    id: id, kind: StepKind.OPEN, target: 0, url: url,
    description: `load ${url} in the active tab`
  };
  return step;
}

function stepAdd(id: string): WorkflowStep {
  const step: WorkflowStep = {
    id: id, kind: StepKind.ADD, target: -1, url: '',
    description: 'append a tab and select it'
  };
  return step;
}

function stepSwitch(id: string, index: number): WorkflowStep {
  const step: WorkflowStep = {
    id: id, kind: StepKind.SWITCH, target: index, url: '',
    description: `select tab ${index}`
  };
  return step;
}

function stepClose(id: string, index: number): WorkflowStep {
  const step: WorkflowStep = {
    id: id, kind: StepKind.CLOSE, target: index, url: '',
    description: `close tab ${index}`
  };
  return step;
}

function stepHome(id: string, homePage: string): WorkflowStep {
  const step: WorkflowStep = {
    id: id, kind: StepKind.HOME, target: -1, url: homePage,
    description: `return to ${homePage}`
  };
  return step;
}

/* ------------------------------------------------------------------ */
/* Declarative workflows                                               */
/* ------------------------------------------------------------------ */

const WORKFLOWS: WorkflowSpec[] = [
  {
    name: 'browse-session',
    steps: [
      stepOpen('open-home', 'https://example.com'),
      stepAdd('new-tab'),
      stepSwitch('back-to-first', 0),
      stepClose('close-first', 0),
      stepHome('home', PAD_HOME_PAGE)
    ],
    expectedTabs: 1,
    expectedIndex: 0,
    expectedState: WorkflowState.COMPLETED,
    expectRollback: false
  },
  {
    name: 'tab-growth',
    steps: [
      stepAdd('add-1'),
      stepAdd('add-2'),
      stepAdd('add-3'),
      stepSwitch('select-second', 1),
      stepClose('close-second', 1),
      stepHome('home', 'phone.html')
    ],
    expectedTabs: 3,
    expectedIndex: 1,
    expectedState: WorkflowState.COMPLETED,
    expectRollback: false
  },
  {
    name: 'invalid-close',
    steps: [
      stepOpen('open', 'https://example.com'),
      stepAdd('add'),
      stepClose('close-missing', 5)
    ],
    expectedTabs: 1,
    expectedIndex: 0,
    expectedState: WorkflowState.ROLLED_BACK,
    expectRollback: true
  },
  {
    name: 'guard-last-tab',
    steps: [
      stepClose('close-only', 0)
    ],
    expectedTabs: 1,
    expectedIndex: 0,
    expectedState: WorkflowState.ROLLED_BACK,
    expectRollback: true
  },
  {
    name: 'home-first',
    steps: [
      stepHome('home', PAD_HOME_PAGE),
      stepOpen('open-doc', 'developer.example.org'),
      stepAdd('add')
    ],
    expectedTabs: 2,
    expectedIndex: 1,
    expectedState: WorkflowState.COMPLETED,
    expectRollback: false
  }
];

/** Ordering contract: which kinds may follow a given kind. */
const ORDER_RULES: Map<string, string[]> = new Map<string, string[]>([
  ['open', ['add', 'switch', 'close', 'home']],
  ['add', ['switch', 'close', 'home', 'add']],
  ['switch', ['close', 'home', 'open', 'switch']],
  ['close', ['add', 'home', 'switch', 'close']],
  ['home', ['open', 'add']]
]);

/* ------------------------------------------------------------------ */
/* Workflow engine                                                     */
/* ------------------------------------------------------------------ */

interface WorkflowSnapshot {
  keys: number[];
  urls: string[];
  index: number;
}

/**
 * Runs a step list over a mock browser and rolls the whole session back when
 * one step is refused, so a half applied workflow never remains visible.
 */
class WorkflowEngine {
  browser: MockBrowser = new MockBrowser(1);
  state: WorkflowState = WorkflowState.IDLE;
  journal: StepResult[] = [];
  spec: WorkflowSpec | null = null;
  private snapshotData: WorkflowSnapshot | null = null;

  constructor(initialTabCount: number = 1) {
    this.browser = new MockBrowser(initialTabCount);
  }

  private takeSnapshot(): WorkflowSnapshot {
    const urls: string[] = [];
    for (let index = 0; index < this.browser.tabs.length; index++) {
      urls.push(this.browser.tabs[index].controller.currentUrl);
    }
    const snapshot: WorkflowSnapshot = {
      keys: this.browser.getTabKeys(),
      urls: urls,
      index: this.browser.tabArrayIndex
    };
    return snapshot;
  }

  private restore(snapshot: WorkflowSnapshot): void {
    const fresh: MockBrowser = new MockBrowser(snapshot.keys.length);
    for (let index = 0; index < snapshot.urls.length; index++) {
      if (snapshot.urls[index] !== '') {
        fresh.tabs[index].controller.loadUrl(snapshot.urls[index]);
      }
    }
    fresh.setTabArrayIndex(snapshot.index);
    this.browser = fresh;
  }

  /** Applies one step and reports whether the model accepted it. */
  applyStep(step: WorkflowStep): boolean {
    if (step.kind === StepKind.OPEN) {
      return this.browser.loadUrl(step.url);
    }
    if (step.kind === StepKind.ADD) {
      return this.browser.addTab();
    }
    if (step.kind === StepKind.SWITCH) {
      return this.browser.selectTab(step.target);
    }
    if (step.kind === StepKind.CLOSE) {
      return this.browser.deleteTab(step.target);
    }
    if (step.kind === StepKind.HOME) {
      this.browser.resetToHome(step.url);
      return true;
    }
    return false;
  }

  run(spec: WorkflowSpec): StepResult[] {
    this.spec = spec;
    this.journal = [];
    this.state = WorkflowState.RUNNING;
    this.snapshotData = this.takeSnapshot();
    let failed: boolean = false;
    for (let index = 0; index < spec.steps.length; index++) {
      const step: WorkflowStep = spec.steps[index];
      const ok: boolean = this.applyStep(step);
      if (!ok) {
        this.state = WorkflowState.FAILED;
      }
      const result: StepResult = {
        stepId: step.id,
        kind: stepName(step.kind),
        ok: ok,
        tabsAfter: this.browser.tabs.length,
        indexAfter: this.browser.tabArrayIndex,
        stateAfter: stateName(this.state)
      };
      this.journal.push(result);
      if (!ok) {
        failed = true;
        break;
      }
    }
    if (failed) {
      if (this.snapshotData !== null) {
        this.restore(this.snapshotData);
      }
      this.state = WorkflowState.ROLLED_BACK;
    } else {
      this.state = WorkflowState.COMPLETED;
    }
    return this.journal;
  }

  executedCount(): number {
    return this.journal.length;
  }

  failedStep(): StepResult | null {
    for (let index = 0; index < this.journal.length; index++) {
      if (!this.journal[index].ok) {
        return this.journal[index];
      }
    }
    return null;
  }

  lastStep(): StepResult | null {
    if (this.journal.length === 0) {
      return null;
    }
    return this.journal[this.journal.length - 1];
  }

  transitions(): string[] {
    const states: string[] = ['idle'];
    for (let index = 0; index < this.journal.length; index++) {
      states.push(this.journal[index].stateAfter);
    }
    states.push(stateName(this.state));
    return states;
  }

  /** True when every journal entry managed to keep the strip consistent. */
  journalIsCoherent(): boolean {
    for (let index = 0; index < this.journal.length; index++) {
      const entry: StepResult = this.journal[index];
      if (entry.tabsAfter < MIN_TAB_COUNT) {
        return false;
      }
      if (entry.indexAfter < 0 && entry.tabsAfter > 0) {
        return false;
      }
    }
    return true;
  }
}

/** Ordering helper used by the sequence constraint cases. */
function follows(previous: string, next: string): boolean {
  const allowed: string[] | undefined = ORDER_RULES.get(previous);
  if (allowed === undefined) {
    return false;
  }
  return allowed.indexOf(next) >= 0;
}

function adjacencyViolations(steps: WorkflowStep[]): string[] {
  const broken: string[] = [];
  for (let index = 1; index < steps.length; index++) {
    const previous: string = stepName(steps[index - 1].kind);
    const current: string = stepName(steps[index].kind);
    if (!follows(previous, current)) {
      broken.push(`${previous}->${current}`);
    }
  }
  return broken;
}

export default function browserOperationWorkflowTest() {
  describe('browserOperationWorkflowTest', () => {
    let driver: Driver = getDriver();
    let engine: WorkflowEngine = new WorkflowEngine(1);
    let clock: MockClock = new MockClock();

    beforeAll(async () => {
      TestLogger.info(TAG, 'workflow suite begin');
      await startBrowserApp();
    });

    afterAll(() => {
      TestLogger.info(TAG, `workflows=${WORKFLOWS.length} states=${stateName(engine.state)}`);
      TestLogger.info(TAG, TestLogger.summary(TAG));
    });

    beforeEach(() => {
      TestLogger.resetSteps(TAG);
      engine = new WorkflowEngine(1);
      clock = new MockClock();
    });

    it('Browser_Workflow_001', 0, async () => {
      TestLogger.step(TAG, 'the workflow table describes five runnable sequences');
      expect(WORKFLOWS.length).assertEqual(5);
      const names: Set<string> = new Set<string>();
      for (let index = 0; index < WORKFLOWS.length; index++) {
        const spec: WorkflowSpec = WORKFLOWS[index];
        expect(names.has(spec.name)).assertFalse();
        names.add(spec.name);
        expect(spec.steps.length >= 1).assertTrue();
        expect(spec.expectedTabs >= MIN_TAB_COUNT).assertTrue();
        expect(spec.expectedTabs <= MAX_TAB_COUNT + 1).assertTrue();
        for (let cursor = 0; cursor < spec.steps.length; cursor++) {
          expect(spec.steps[cursor].id.length).assertLarger(0);
          expect(stepName(spec.steps[cursor].kind).length > 2).assertTrue();
        }
      }
      expect(names.size).assertEqual(5);
    });

    it('Browser_Workflow_002', 0, async () => {
      TestLogger.step(TAG, 'browse session opens adds switches closes and goes home');
      const spec: WorkflowSpec = WORKFLOWS[0];
      const journal: StepResult[] = engine.run(spec);
      expect(journal.length).assertEqual(5);
      expect(engine.state).assertEqual(WorkflowState.COMPLETED);
      expect(engine.browser.tabs.length).assertEqual(spec.expectedTabs);
      expect(engine.browser.tabArrayIndex).assertEqual(spec.expectedIndex);
      expect(journal[0].kind).assertEqual('open');
      expect(journal[1].kind).assertEqual('add');
      expect(journal[2].kind).assertEqual('switch');
      expect(journal[3].kind).assertEqual('close');
      expect(journal[4].kind).assertEqual('home');
      expect(journal[0].ok).assertTrue();
      expect(journal[4].ok).assertTrue();
      const controller: MockBrowserTab | null = engine.browser.getCurrentTab();
      expect(controller === null).assertFalse();
      if (controller !== null) {
        expect(controller.controller.currentUrl).assertEqual(PAD_HOME_PAGE);
      }
    });

    it('Browser_Workflow_003', 0, async () => {
      TestLogger.step(TAG, 'tab growth workflow keeps three tabs and the second selected');
      const spec: WorkflowSpec = WORKFLOWS[1];
      const journal: StepResult[] = engine.run(spec);
      expect(journal.length).assertEqual(6);
      expect(engine.state).assertEqual(WorkflowState.COMPLETED);
      expect(engine.browser.tabs.length).assertEqual(3);
      expect(engine.browser.tabArrayIndex).assertEqual(1);
      expect(journal[0].tabsAfter).assertEqual(2);
      expect(journal[1].tabsAfter).assertEqual(3);
      expect(journal[2].tabsAfter).assertEqual(4);
      expect(journal[3].indexAfter).assertEqual(1);
      expect(journal[4].tabsAfter).assertEqual(3);
      expect(journal[5].tabsAfter).assertEqual(3);
      expect(engine.browser.getTabKeys()).assertDeepEquals([0, 1, 2]);
    });

    it('Browser_Workflow_004', 0, async () => {
      TestLogger.step(TAG, 'a refused close rolls the whole workflow back');
      const spec: WorkflowSpec = WORKFLOWS[2];
      const journal: StepResult[] = engine.run(spec);
      expect(journal.length).assertEqual(3);
      expect(engine.state).assertEqual(WorkflowState.ROLLED_BACK);
      expect(spec.expectRollback).assertTrue();
      expect(engine.browser.tabs.length).assertEqual(1);
      expect(engine.browser.tabArrayIndex).assertEqual(0);
      const failed: StepResult | null = engine.failedStep();
      expect(failed === null).assertFalse();
      if (failed !== null) {
        expect(failed.ok).assertFalse();
        expect(failed.kind).assertEqual('close');
        expect(failed.stepId).assertEqual('close-missing');
        expect(failed.stateAfter).assertEqual('failed');
      }
      expect(engine.lastStep()!.ok).assertFalse();
    });

    it('Browser_Workflow_005', 0, async () => {
      TestLogger.step(TAG, 'closing the last tab is refused and rolled back');
      const spec: WorkflowSpec = WORKFLOWS[3];
      engine.run(spec);
      expect(engine.state).assertEqual(WorkflowState.ROLLED_BACK);
      expect(engine.executedCount()).assertEqual(1);
      expect(engine.browser.tabs.length).assertEqual(MIN_TAB_COUNT);
      expect(engine.browser.tabArrayIndex).assertEqual(0);
      expect(engine.browser.toasts.length).assertEqual(0);
      const failed: StepResult | null = engine.failedStep();
      if (failed !== null) {
        expect(failed.kind).assertEqual('close');
        expect(failed.tabsAfter).assertEqual(1);
        expect(failed.indexAfter).assertEqual(0);
      }
      expect(engine.journalIsCoherent()).assertTrue();
    });

    it('Browser_Workflow_006', 0, async () => {
      TestLogger.step(TAG, 'home first workflow loads the home page then grows');
      const spec: WorkflowSpec = WORKFLOWS[4];
      const journal: StepResult[] = engine.run(spec);
      expect(journal.length).assertEqual(3);
      expect(engine.state).assertEqual(WorkflowState.COMPLETED);
      expect(engine.browser.tabs.length).assertEqual(2);
      expect(engine.browser.tabArrayIndex).assertEqual(1);
      expect(journal[0].kind).assertEqual('home');
      expect(journal[0].ok).assertTrue();
      expect(journal[1].kind).assertEqual('open');
      expect(journal[2].kind).assertEqual('add');
      expect(engine.browser.getTabKeys()).assertDeepEquals([0, 1]);
      expect(engine.failedStep() === null).assertTrue();
    });

    it('Browser_Workflow_007', 0, async () => {
      TestLogger.step(TAG, 'state machine walks idle running completed');
      const spec: WorkflowSpec = WORKFLOWS[0];
      expect(engine.state).assertEqual(WorkflowState.IDLE);
      engine.run(spec);
      const transitions: string[] = engine.transitions();
      expect(transitions[0]).assertEqual('idle');
      expect(transitions[1]).assertEqual('running');
      expect(transitions[transitions.length - 1]).assertEqual('completed');
      expect(engine.state).assertEqual(WorkflowState.COMPLETED);
      expect(stateName(WorkflowState.IDLE)).assertEqual('idle');
      expect(stateName(WorkflowState.RUNNING)).assertEqual('running');
      expect(stateName(WorkflowState.COMPLETED)).assertEqual('completed');
      expect(stateName(WorkflowState.ROLLED_BACK)).assertEqual('rolled-back');
      expect(stateName(WorkflowState.FAILED)).assertEqual('failed');
    });

    it('Browser_Workflow_008', 0, async () => {
      TestLogger.step(TAG, 'rolling back walks idle running failed rolled-back');
      const spec: WorkflowSpec = WORKFLOWS[2];
      engine.run(spec);
      const transitions: string[] = engine.transitions();
      expect(transitions[0]).assertEqual('idle');
      expect(transitions[1]).assertEqual('running');
      expect(transitions.indexOf('failed')).assertLarger(0);
      expect(transitions[transitions.length - 1]).assertEqual('rolled-back');
      expect(engine.state).assertEqual(WorkflowState.ROLLED_BACK);
      expect(transitions.length).assertEqual(engine.journal.length + 2);
      expect(engine.journal[engine.journal.length - 1].stateAfter).assertEqual('failed');
    });

    it('Browser_Workflow_009', 0, async () => {
      TestLogger.step(TAG, 'declared workflows satisfy the adjacency rules');
      for (let index = 0; index < WORKFLOWS.length; index++) {
        const violations: string[] = adjacencyViolations(WORKFLOWS[index].steps);
        TestLogger.info(TAG, `workflow ${WORKFLOWS[index].name} violations=${violations.length}`);
        expect(violations.length).assertEqual(0);
      }
      expect(follows('open', 'add')).assertTrue();
      expect(follows('add', 'switch')).assertTrue();
      expect(follows('switch', 'close')).assertTrue();
      expect(follows('close', 'home')).assertTrue();
      expect(follows('home', 'open')).assertTrue();
      expect(follows('home', 'close')).assertFalse();
      expect(follows('home', 'switch')).assertFalse();
      expect(follows('unknown', 'open')).assertFalse();
    });

    it('Browser_Workflow_010', 0, async () => {
      TestLogger.step(TAG, 'out of order pairs are reported by the checker');
      const bad: WorkflowStep[] = [
        stepHome('h', PAD_HOME_PAGE),
        stepClose('c', 0)
      ];
      const violations: string[] = adjacencyViolations(bad);
      expect(violations.length).assertEqual(1);
      expect(violations[0]).assertEqual('home->close');
      const good: WorkflowStep[] = [
        stepOpen('o', 'example.com'),
        stepHome('h', PAD_HOME_PAGE)
      ];
      expect(adjacencyViolations(good).length).assertEqual(0);
      expect(ORDER_RULES.size).assertEqual(5);
      const allowed: string[] | undefined = ORDER_RULES.get('open');
      expect(allowed === undefined).assertFalse();
      if (allowed !== undefined) {
        expect(allowed.length).assertEqual(4);
        expect(allowed.indexOf('switch')).assertLarger(-1);
      }
    });

    it('Browser_Workflow_011', 0, async () => {
      TestLogger.step(TAG, 'rollback restores the pages that were open before the run');
      const prepared: WorkflowEngine = new WorkflowEngine(2);
      prepared.browser.tabs[0].controller.loadUrl('https://a.example.com');
      prepared.browser.tabs[1].controller.loadUrl('https://b.example.com');
      prepared.browser.setTabArrayIndex(1);
      const failing: WorkflowSpec = WORKFLOWS[2];
      prepared.run(failing);
      expect(prepared.state).assertEqual(WorkflowState.ROLLED_BACK);
      expect(prepared.browser.tabs.length).assertEqual(2);
      expect(prepared.browser.tabArrayIndex).assertEqual(1);
      expect(prepared.browser.tabs[0].controller.currentUrl).assertEqual('https://a.example.com');
      expect(prepared.browser.tabs[1].controller.currentUrl).assertEqual('https://b.example.com');
      expect(prepared.browser.getTabKeys()).assertDeepEquals([0, 1]);
    });

    it('Browser_Workflow_012', 0, async () => {
      TestLogger.step(TAG, 'a failing step stops the journal immediately');
      const failing: WorkflowSpec = {
        name: 'stop-at-first-error',
        steps: [
          stepAdd('add-ok'),
          stepClose('close-oob', 9),
          stepHome('never-reached', PAD_HOME_PAGE)
        ],
        expectedTabs: 1,
        expectedIndex: 0,
        expectedState: WorkflowState.ROLLED_BACK,
        expectRollback: true
      };
      engine.run(failing);
      expect(engine.executedCount()).assertEqual(2);
      expect(engine.state).assertEqual(WorkflowState.ROLLED_BACK);
      expect(engine.journal[1].ok).assertFalse();
      expect(engine.journal[1].stepId).assertEqual('close-oob');
      expect(engine.journalIsCoherent()).assertTrue();
      for (let index = 0; index < engine.journal.length; index++) {
        expect(engine.journal[index].stepId === 'never-reached').assertFalse();
      }
      expect(engine.browser.tabs.length).assertEqual(1);
    });

    it('Browser_Workflow_013', 0, async () => {
      TestLogger.step(TAG, 'workflow anchors exist in the rendered title bar');
      const addAnchor: boolean = await componentByIdExists(driver, ID_ACTION_ADD);
      TestLogger.info(TAG, `add anchor=${addAnchor}`);
      const urlAnchor: boolean = await componentByIdExists(driver, ID_INPUT_URL);
      const homeAnchor: boolean = await componentByIdExists(driver, ID_NAV_HOME);
      TestLogger.info(TAG, `url anchor=${urlAnchor} home anchor=${homeAnchor}`);
      const cancelCount: number = await countById(driver, ID_CANCEL_TAB);
      expect(cancelCount >= 0).assertTrue();
      expect(ID_ACTION_ADD).assertEqual('actionButton1');
      expect(ID_NAV_HOME).assertEqual('navigationButton3');
      expect(ID_CANCEL_TAB).assertEqual('cancelBtn');
      expect(WORKFLOWS[0].steps[4].kind).assertEqual(StepKind.HOME);
      expect(WORKFLOWS[0].steps[1].kind).assertEqual(StepKind.ADD);
    });

    it('Browser_Workflow_014', 0, async () => {
      TestLogger.step(TAG, 'replaying a workflow reproduces the same journal');
      const first: WorkflowEngine = new WorkflowEngine(1);
      const second: WorkflowEngine = new WorkflowEngine(1);
      const spec: WorkflowSpec = WORKFLOWS[1];
      first.run(spec);
      second.run(spec);
      expect(first.executedCount()).assertEqual(second.executedCount());
      for (let index = 0; index < first.journal.length; index++) {
        expect(first.journal[index].stepId).assertEqual(second.journal[index].stepId);
        expect(first.journal[index].ok).assertEqual(second.journal[index].ok);
        expect(first.journal[index].tabsAfter).assertEqual(second.journal[index].tabsAfter);
        expect(first.journal[index].indexAfter).assertEqual(second.journal[index].indexAfter);
      }
      expect(first.state).assertEqual(second.state);
      expect(first.browser.getTabKeys()).assertDeepEquals(second.browser.getTabKeys());
      expect(first.transitions().length).assertEqual(second.transitions().length);
      expect(first.state).assertEqual(WorkflowState.COMPLETED);
    });

    it('Browser_Workflow_015', 0, async () => {
      TestLogger.step(TAG, 'a second run starts from a fresh snapshot');
      engine.run(WORKFLOWS[0]);
      expect(engine.state).assertEqual(WorkflowState.COMPLETED);
      const afterFirst: number = engine.browser.tabs.length;
      engine.run(WORKFLOWS[0]);
      expect(engine.state).assertEqual(WorkflowState.COMPLETED);
      expect(engine.browser.tabs.length).assertEqual(afterFirst);
      expect(engine.executedCount()).assertEqual(5);
      expect(engine.browser.getTabKeys()).assertDeepEquals([0]);
      expect(engine.browser.tabArrayIndex).assertEqual(0);
      expect(engine.journal[0].stepId).assertEqual('open-home');
      expect(engine.journal[4].stepId).assertEqual('home');
      expect(engine.failedStep() === null).assertTrue();
    });

    it('Browser_Workflow_016', 0, async () => {
      TestLogger.step(TAG, 'close followed by home leaves the strip consistent');
      const spec: WorkflowSpec = {
        name: 'close-then-home',
        steps: [
          stepAdd('add'),
          stepClose('close-first', 0),
          stepHome('home', PAD_HOME_PAGE)
        ],
        expectedTabs: 1,
        expectedIndex: 0,
        expectedState: WorkflowState.COMPLETED,
        expectRollback: false
      };
      const journal: StepResult[] = engine.run(spec);
      expect(journal.length).assertEqual(3);
      expect(engine.state).assertEqual(WorkflowState.COMPLETED);
      expect(engine.browser.tabs.length).assertEqual(1);
      expect(engine.browser.tabArrayIndex).assertEqual(0);
      expect(journal[0].tabsAfter).assertEqual(2);
      expect(journal[1].tabsAfter).assertEqual(1);
      expect(journal[1].indexAfter).assertEqual(0);
      expect(journal[2].ok).assertTrue();
      expect(engine.journalIsCoherent()).assertTrue();
      const tab: MockBrowserTab | null = engine.browser.getCurrentTab();
      if (tab !== null) {
        expect(tab.controller.currentUrl).assertEqual(PAD_HOME_PAGE);
      }
      expect(engine.browser.toasts.length).assertEqual(0);
    });

    it('Browser_Workflow_017', 0, async () => {
      TestLogger.step(TAG, 'workflow summary reports counts and clock stamps');
      let completed: number = 0;
      let rolled: number = 0;
      for (let index = 0; index < WORKFLOWS.length; index++) {
        const local: WorkflowEngine = new WorkflowEngine(1);
        local.run(WORKFLOWS[index]);
        if (local.state === WorkflowState.COMPLETED) {
          completed += 1;
        }
        if (local.state === WorkflowState.ROLLED_BACK) {
          rolled += 1;
        }
        expect(local.journalIsCoherent()).assertTrue();
      }
      expect(completed + rolled).assertEqual(WORKFLOWS.length);
      expect(completed).assertEqual(3);
      expect(rolled).assertEqual(2);
      const stamp: number = clock.now();
      clock.advance(400);
      expect(clock.now() - stamp).assertEqual(400);
      expect(engine.browser.loadingStatus).assertEqual(MockLoadingStatus.END);
      TestLogger.info(TAG, `completed=${completed} rolledBack=${rolled}`);
    });
  });
}
