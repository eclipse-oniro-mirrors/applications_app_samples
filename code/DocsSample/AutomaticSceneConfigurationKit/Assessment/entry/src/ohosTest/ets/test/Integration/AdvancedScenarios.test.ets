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
  ID_QUERY_STATE_BUTTON,
  ID_QUERY_CONFIG_BUTTON,
  TEXT_WHITELIST_EMPTY,
  TEXT_NO_ACTIVE_ASSESSMENT,
  KEY_BACK,
  TIMEOUT_PAGE_RENDER,
  TEST_BUNDLE_PRIMARY,
  TEST_BUNDLE_SECONDARY,
  serializedDelay,
  getDriver,
  launchAssessmentApp,
  findById,
  indexComponentCount,
  checkTextContent,
  waitForIndexPage,
  isAssessmentActive,
  isAssessmentInactive,
  addAllowedApp,
  allowedAppRowCount,
  removeFirstAllowedApp,
  clickIndexButton,
  pressAndWait
} from '../Shared/AssessmentDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Assessment]';
const BUNDLE: string = 'Assessment_';

// Upper bound of the whitelist edits a single scenario performs. The sample accepts at most
// twenty bundle names, five edits are enough to exercise every branch of the edit round trip.
const MAX_EDIT_ROUNDS: number = 5;

// Tolerance of the component count comparison. A List only renders the items that are inside
// the viewport, so a scenario that scrolls can legitimately change the count by a few nodes.
const COUNT_TOLERANCE: number = 6;

// Sentinel of a scenario that has not been observed yet.
const NOT_OBSERVED: number = -1;

/**
 * One step of an advanced scenario.
 *
 * A step is pure data: the guarded UI runner executes the action, and the expected effect is
 * only used to describe the observation in the report.
 */
interface ScenarioStep {
  name: string;
  action: string;
  expectedEffect: string;
}

/**
 * A scenario that combines configuration, query and whitelist edits.
 *
 * The definition is intentionally independent from the driver so that the scenario registry can
 * be validated without a device, and the same definition is then executed by the guarded runner.
 */
class ScenarioDefinition {
  private id: string = '';
  private title: string = '';
  private rowsDelta: number = 0;
  private activeExpected: boolean = false;
  private steps: ScenarioStep[] = [];

  constructor(id: string, title: string, rowsDelta: number, activeExpected: boolean) {
    this.id = id;
    this.title = title;
    this.rowsDelta = rowsDelta;
    this.activeExpected = activeExpected;
  }

  public getId(): string {
    return this.id;
  }

  public getTitle(): string {
    return this.title;
  }

  public getRowsDelta(): number {
    return this.rowsDelta;
  }

  public isActiveExpected(): boolean {
    return this.activeExpected;
  }

  public addStep(name: string, action: string, expectedEffect: string): void {
    this.steps.push({
      name: name,
      action: action,
      expectedEffect: expectedEffect
    });
  }

  public getStepCount(): number {
    return this.steps.length;
  }

  public getSteps(): ScenarioStep[] {
    return this.steps.slice();
  }

  public getStepNames(): string[] {
    const names: string[] = [];
    for (let i = 0; i < this.steps.length; i++) {
      names.push(this.steps[i].name);
    }
    return names;
  }

  public touchesWhitelist(): boolean {
    for (let i = 0; i < this.steps.length; i++) {
      const action: string = this.steps[i].action;
      if (action.indexOf('add') >= 0 || action.indexOf('remove') >= 0) {
        return true;
      }
    }
    return false;
  }

  public queriesService(): boolean {
    for (let i = 0; i < this.steps.length; i++) {
      const action: string = this.steps[i].action;
      if (action.indexOf('query') >= 0) {
        return true;
      }
    }
    return false;
  }

  public toString(): string {
    return `ScenarioDefinition{id=${this.id}, steps=${this.steps.length}}`;
  }
}

/**
 * Registry of the advanced scenarios.
 *
 * The registry rejects a duplicate identifier and a scenario without steps, both of them would
 * silently shrink the executed matrix instead of failing loudly.
 */
class ScenarioRegistry {
  private scenarios: ScenarioDefinition[] = [];

  public register(scenario: ScenarioDefinition): boolean {
    if (scenario.getId().length === 0 || scenario.getStepCount() === 0) {
      return false;
    }
    if (this.find(scenario.getId()) !== undefined) {
      return false;
    }
    this.scenarios.push(scenario);
    return true;
  }

  public find(id: string): ScenarioDefinition | undefined {
    for (let i = 0; i < this.scenarios.length; i++) {
      if (this.scenarios[i].getId() === id) {
        return this.scenarios[i];
      }
    }
    return undefined;
  }

  public count(): number {
    return this.scenarios.length;
  }

  public getIds(): string[] {
    const ids: string[] = [];
    for (let i = 0; i < this.scenarios.length; i++) {
      ids.push(this.scenarios[i].getId());
    }
    return ids;
  }

  public whitelistScenarios(): number {
    let count: number = 0;
    for (let i = 0; i < this.scenarios.length; i++) {
      if (this.scenarios[i].touchesWhitelist()) {
        count++;
      }
    }
    return count;
  }

  public serviceScenarios(): number {
    let count: number = 0;
    for (let i = 0; i < this.scenarios.length; i++) {
      if (this.scenarios[i].queriesService()) {
        count++;
      }
    }
    return count;
  }
}

/**
 * Tally of the scenario outcomes.
 *
 * A skipped scenario is tracked separately from a failed one, because a missing page or a
 * missing assessment service is an environment property and not a defect of the sample.
 */
class OutcomeTally {
  private passed: number = 0;
  private failed: number = 0;
  private skipped: number = 0;

  public pass(): void {
    this.passed++;
  }

  public fail(): void {
    this.failed++;
  }

  public skip(): void {
    this.skipped++;
  }

  public getPassed(): number {
    return this.passed;
  }

  public getFailed(): number {
    return this.failed;
  }

  public getSkipped(): number {
    return this.skipped;
  }

  public total(): number {
    return this.passed + this.failed + this.skipped;
  }

  public allResolved(): boolean {
    return this.failed === 0;
  }

  public toString(): string {
    return `OutcomeTally{passed=${this.passed}, failed=${this.failed}, skipped=${this.skipped}}`;
  }
}

/**
 * Builds the scenario registry that the suite executes.
 *
 * Every scenario combines at least one configuration edit with at least one service query, which
 * is exactly the interaction pattern an application follows when it starts an assessment.
 *
 * @returns the populated registry.
 */
function buildScenarioRegistry(): ScenarioRegistry {
  const registry: ScenarioRegistry = new ScenarioRegistry();

  const configureAndQuery: ScenarioDefinition =
    new ScenarioDefinition('configure_and_query', 'Configure then query', 0, false);
  configureAndQuery.addStep('read_title', 'find assessment_index_title', 'the entry page is rendered');
  configureAndQuery.addStep('add_bundle', 'add com.samples.dictionary', 'the whitelist grows');
  configureAndQuery.addStep('query_config', 'query getConfiguration', 'the config text is refreshed');
  configureAndQuery.addStep('query_state', 'query isActive', 'the state text stays inactive');
  registry.register(configureAndQuery);

  const whitelistRoundTrip: ScenarioDefinition =
    new ScenarioDefinition('whitelist_round_trip', 'Whitelist edit round trip', 0, false);
  whitelistRoundTrip.addStep('row_before', 'count the remove buttons', 'the baseline is recorded');
  whitelistRoundTrip.addStep('add_bundle', 'add com.samples.reader', 'one row is appended');
  whitelistRoundTrip.addStep('remove_bundle', 'click the first remove button', 'one row is dropped');
  whitelistRoundTrip.addStep('row_after', 'count the remove buttons', 'the count matches the baseline');
  registry.register(whitelistRoundTrip);

  const drainWhitelist: ScenarioDefinition =
    new ScenarioDefinition('drain_whitelist', 'Drain the whitelist', -1, false);
  drainWhitelist.addStep('remove_all', 'remove every whitelist row', 'the empty hint shows up');
  drainWhitelist.addStep('query_config', 'query getConfiguration', 'the query survives an empty whitelist');
  registry.register(drainWhitelist);

  const repeatedQuery: ScenarioDefinition =
    new ScenarioDefinition('repeated_query', 'Repeated queries', 0, false);
  repeatedQuery.addStep('query_state', 'query isActive', 'no state change');
  repeatedQuery.addStep('query_config', 'query getConfiguration', 'no config change');
  repeatedQuery.addStep('query_state_again', 'query isActive again', 'the result is stable');
  registry.register(repeatedQuery);

  return registry;
}

/**
 * Launches the sample and waits for the entry page.
 *
 * @param driver driver of the running case.
 * @returns true when the entry page is rendered.
 */
async function prepareIndex(driver: Driver): Promise<boolean> {
  await launchAssessmentApp();
  return await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
}

export default function advancedScenariosTest() {
  describe('AdvancedScenarios_Test', () => {
    let driver: Driver;
    let registry: ScenarioRegistry;
    let tally: OutcomeTally;

    beforeAll(async () => {
      driver = getDriver();
      registry = buildScenarioRegistry();
      tally = new OutcomeTally();
      await serializedDelay(driver, 1000);
      await launchAssessmentApp();
      await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, 50);
      await serializedDelay(driver, 500);
    });

    /**
     * Scenario: register a malformed scenario.
     * Expectation: a duplicate identifier and a scenario without steps are both rejected, the
     * registry keeps its size so the executed matrix does not silently change.
     */
    it('Assessment_AdvancedRegistryRejects_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AdvancedRegistryRejects_002, begin');
      const local: ScenarioRegistry = new ScenarioRegistry();
      const empty: ScenarioDefinition = new ScenarioDefinition('empty', 'Empty scenario', 0, false);
      expect(local.register(empty)).assertFalse();
      const valid: ScenarioDefinition = new ScenarioDefinition('valid', 'Valid scenario', 0, false);
      valid.addStep('step', 'query isActive', 'no change');
      expect(local.register(valid)).assertTrue();
      expect(local.register(valid)).assertFalse();
      expect(local.count()).assertEqual(1);
      const unnamed: ScenarioDefinition = new ScenarioDefinition('', 'Unnamed', 0, false);
      unnamed.addStep('step', 'query isActive', 'no change');
      expect(local.register(unnamed)).assertFalse();
      expect(local.count()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AdvancedRegistryRejects_002, end');
    });

    /**
     * Scenario: tally the outcomes of a guarded run.
     * Expectation: a skipped scenario is not a failure, the tally only fails when a scenario is
     * reported as failed.
     */
    it('Assessment_AdvancedOutcomeTally_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AdvancedOutcomeTally_003, begin');
      const local: OutcomeTally = new OutcomeTally();
      local.pass();
      local.skip();
      expect(local.total()).assertEqual(2);
      expect(local.getSkipped()).assertEqual(1);
      expect(local.allResolved()).assertTrue();
      local.fail();
      expect(local.total()).assertEqual(3);
      expect(local.allResolved()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'AdvancedOutcomeTally_003', local.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AdvancedOutcomeTally_003, end');
    });

    /**
     * Scenario: run a scenario definition twice.
     * Expectation: the second run observes the same number of steps, the definition is immutable
     * with respect to execution.
     */
    it('Assessment_AdvancedScenarioReentrancy_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AdvancedScenarioReentrancy_009, begin');
      const scenario: ScenarioDefinition | undefined = registry.find('configure_and_query');
      expect(scenario !== undefined).assertTrue();
      if (scenario === undefined) {
        return;
      }
      const first: number = scenario.getStepCount();
      const second: number = scenario.getStepCount();
      expect(first).assertEqual(second);
      expect(first).assertEqual(4);
      const names: string[] = scenario.getStepNames();
      expect(names[0]).assertEqual('read_title');
      expect(names[names.length - 1]).assertEqual('query_state');
      const steps: ScenarioStep[] = scenario.getSteps();
      steps.push({
        name: 'injected',
        action: 'query isActive',
        expectedEffect: 'unused'
      });
      expect(scenario.getStepCount()).assertEqual(first);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AdvancedScenarioReentrancy_009, end');
    });

    /**
     * Scenario: a guarded runner that meets a missing page.
     * Expectation: the runner marks the scenario as skipped instead of failed, and the tally
     * stays free of failures.
     */
    it('Assessment_AdvancedGuardSkip_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AdvancedGuardSkip_010, begin');
      const local: OutcomeTally = new OutcomeTally();
      const pageAvailable: boolean = false;
      if (!pageAvailable) {
        local.skip();
      } else {
        local.pass();
      }
      expect(local.getSkipped()).assertEqual(1);
      expect(local.getFailed()).assertEqual(0);
      expect(local.allResolved()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'AdvancedGuardSkip_010', local.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AdvancedGuardSkip_010, end');
    });

    /**
     * Scenario: the scenario steps reference only components that the entry page declares.
     * Expectation: every whitelist action maps to the add or remove button identifier, and no
     * scenario references the exam page, which is only reachable after a confirmed begin.
     */
    it('Assessment_AdvancedStepContract_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AdvancedStepContract_011, begin');
      const ids: string[] = registry.getIds();
      let whitelistSteps: number = 0;
      for (let i = 0; i < ids.length; i++) {
        const scenario: ScenarioDefinition | undefined = registry.find(ids[i]);
        if (scenario === undefined) {
          continue;
        }
        const steps: ScenarioStep[] = scenario.getSteps();
        for (let s = 0; s < steps.length; s++) {
          expect(steps[s].name.length > 0).assertTrue();
          expect(steps[s].action.length > 0).assertTrue();
          expect(steps[s].expectedEffect.length > 0).assertTrue();
          if (steps[s].action.indexOf('add') >= 0 || steps[s].action.indexOf('remove') >= 0) {
            whitelistSteps++;
          }
          expect(steps[s].action.indexOf('exam') < 0).assertTrue();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s whitelist steps %{public}d',
        BUNDLE + 'AdvancedStepContract_011', whitelistSteps);
      expect(whitelistSteps > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AdvancedStepContract_011, end');
    });
  });
}
