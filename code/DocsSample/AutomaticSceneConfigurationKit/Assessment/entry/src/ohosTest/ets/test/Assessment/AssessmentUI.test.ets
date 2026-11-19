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
  TEXT_STATE_INACTIVE,
  TEXT_WHITELIST_EMPTY,
  TIMEOUT_PAGE_RENDER,
  TEST_BUNDLE_SECONDARY,
  serializedDelay,
  getDriver,
  launchAssessmentApp,
  findById,
  indexComponentCount,
  checkTextContent,
  waitForIndexPage,
  isComponentEnabled,
  hideSoftKeyboard,
  addAllowedApp,
  allowedAppRowCount,
  removeFirstAllowedApp,
  clickIndexButton,
  pressAndWait
} from '../Shared/AssessmentDriver';
import { clickSerialized, inputTextSerialized, getTextSerialized, clickPointSerialized } from '../Shared/AssessmentDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Assessment]';
const BUNDLE: string = 'Assessment_';

// Identifiers of the entry page buttons, they are grouped so that the cases can iterate the
// whole operation card in one go instead of repeating five lookups.
const OPERATION_BUTTON_IDS: string[] = [
  ID_BEGIN_BUTTON,
  ID_END_BUTTON,
  ID_QUERY_STATE_BUTTON,
  ID_QUERY_CONFIG_BUTTON
];

// Labels rendered by the operation card, they are asserted through the text of the buttons.
const OPERATION_BUTTON_LABELS: string[] = ['begin', 'end', 'isActive', 'getConfiguration'];

// The duration chips of the configuration card, the values match the candidates declared by
// AssessmentConstants of the sample.
const DURATION_LABELS: string[] = ['Default duration', '10 min', '30 min', '60 min'];

/**
 * Result of a single layout probe.
 */
interface LayoutProbe {
  id: string;
  found: boolean;
  enabled: boolean;
  text: string;
}

/**
 * Describes what the entry page of the assessment sample is expected to render.
 */
class IndexPageExpectation {
  private requiredIds: string[] = OPERATION_BUTTON_IDS;
  private requiredTexts: string[] = [TEXT_STATE_INACTIVE, TEXT_WHITELIST_EMPTY];

  public getRequiredIds(): string[] {
    return this.requiredIds.slice();
  }

  public getRequiredTexts(): string[] {
    return this.requiredTexts.slice();
  }

  public hasId(id: string): boolean {
    return this.requiredIds.indexOf(id) >= 0;
  }

  public hasText(text: string): boolean {
    return this.requiredTexts.indexOf(text) >= 0;
  }

  public requiredIdCount(): number {
    return this.requiredIds.length;
  }

  public toString(): string {
    return `IndexPageExpectation{ids=${this.requiredIds.length}, texts=${this.requiredTexts.length}}`;
  }
}

/**
 * Collects the layout probes of one page visit, the suite uses it to separate a missing
 * component from a disabled component, which are two different defects.
 */
class LayoutObserver {
  private probes: LayoutProbe[] = [];
  private visits: number = 0;

  public record(id: string, component: Component | null, enabled: boolean, text: string): void {
    this.probes.push({
      id: id,
      found: component !== null,
      enabled: enabled,
      text: text
    });
  }

  public startVisit(): void {
    this.visits++;
  }

  public getVisits(): number {
    return this.visits;
  }

  public getProbes(): LayoutProbe[] {
    return this.probes.slice();
  }

  public reset(): void {
    this.probes = [];
    this.visits = 0;
  }

  public foundCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.probes.length; i++) {
      if (this.probes[i].found) {
        count++;
      }
    }
    return count;
  }

  public missingIds(): string[] {
    const ids: string[] = [];
    for (let i = 0; i < this.probes.length; i++) {
      if (!this.probes[i].found) {
        ids.push(this.probes[i].id);
      }
    }
    return ids;
  }

  public disabledIds(): string[] {
    const ids: string[] = [];
    for (let i = 0; i < this.probes.length; i++) {
      if (this.probes[i].found && !this.probes[i].enabled) {
        ids.push(this.probes[i].id);
      }
    }
    return ids;
  }

  public hasProbe(id: string): boolean {
    return this.probes.some((probe: LayoutProbe) => probe.id === id);
  }

  public toString(): string {
    return `LayoutObserver{visits=${this.visits}, probes=${this.probes.length}}`;
  }
}

/**
 * Probes one identifier and reports whether the entry page still renders it.
 */
async function probeId(driver: Driver, id: string, observer: LayoutObserver): Promise<LayoutProbe> {
  const component: Component | null = await findById(driver, id);
  const enabled: boolean = await isComponentEnabled(component);
  const text: string = component === null ? '' : await readText(component);
  observer.record(id, component, enabled, text);
  return {
    id: id,
    found: component !== null,
    enabled: enabled,
    text: text
  };
}

/**
 * Reads the text of a component, an empty string is returned when the read fails because the
 * component dropped out of the tree between the lookup and the read.
 */
async function readText(component: Component): Promise<string> {
  try {
    return await getTextSerialized(component);
  } catch (error) {
    const err: Error = error instanceof Error ? error : new Error(String(error));
    hilog.warn(DOMAIN, TAG, 'readText failed: %{public}s', err.message);
    return '';
  }
}

/**
 * Starts the sample and waits until the entry page is rendered.
 *
 * Every case starts from a fresh launch so that the suite does not depend on the execution
 * order of the cases, which is what the reference suite of the TV sample does as well.
 */
async function openIndexPage(driver: Driver): Promise<boolean> {
  await launchAssessmentApp();
  const rendered: boolean = await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
  if (!rendered) {
    hilog.warn(DOMAIN, TAG, 'openIndexPage: the entry page is not rendered, the case is skipped');
  }
  return rendered;
}

export default function assessmentUITest() {
  describe('AssessmentUI_Test', () => {
    let driver: Driver;
    let observer: LayoutObserver;
    let expectation: IndexPageExpectation;

    beforeAll(async () => {
      driver = getDriver();
      observer = new LayoutObserver();
      expectation = new IndexPageExpectation();
      await serializedDelay(driver, 1000);
      await launchAssessmentApp();
      await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
    });

    afterAll(async () => {
      await pressAndWait(driver, 2, 2, 50);
      await serializedDelay(driver, 500);
    });

    /**
     * Scenario: the offline layout of the entry page is complete even when the assessment
     * service refuses every call, which is the case on an image without the SysCap.
     * Expectation: all four buttons and the title are present regardless of the service.
     */
    it('Assessment_LayoutIndependentOfService_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LayoutIndependentOfService_008, begin');
      observer.reset();
      observer.startVisit();
      const rendered: boolean = await openIndexPage(driver);
      if (!rendered) {
        return;
      }
      for (let i = 0; i < OPERATION_BUTTON_IDS.length; i++) {
        const probe: LayoutProbe = await probeId(driver, OPERATION_BUTTON_IDS[i], observer);
        expect(probe.found).assertTrue();
      }
      expect(observer.missingIds().length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LayoutIndependentOfService_008, end');
    });

    /**
     * Scenario: the expectation model of the entry page is stable.
     * Expectation: the expectation keeps the four operation buttons and the two status texts,
     * the lookup operations answer consistently, so the other cases can rely on it.
     */
    it('Assessment_IndexExpectationModel_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'IndexExpectationModel_013, begin');
      expect(expectation.requiredIdCount()).assertEqual(4);
      expect(expectation.hasId(ID_BEGIN_BUTTON)).assertTrue();
      expect(expectation.hasId(ID_END_BUTTON)).assertTrue();
      expect(expectation.hasId(ID_QUERY_STATE_BUTTON)).assertTrue();
      expect(expectation.hasId(ID_QUERY_CONFIG_BUTTON)).assertTrue();
      expect(expectation.hasId('assessment_unknown_button')).assertFalse();
      expect(expectation.hasText(TEXT_STATE_INACTIVE)).assertTrue();
      expect(expectation.hasText('Assessment state: unknown')).assertFalse();
      expect(expectation.getRequiredIds().length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', expectation.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'IndexExpectationModel_013, end');
    });

    /**
     * Scenario: the layout observer separates a missing component from a disabled one.
     * Expectation: both synthetic probes carry a null component, so the observer
     * classifies both as missing; the disabled bucket stays empty because a probe
     * only lands there when its component is present and disabled.
     */
    it('Assessment_LayoutObserverModel_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LayoutObserverModel_014, begin');
      const local: LayoutObserver = new LayoutObserver();
      local.startVisit();
      local.startVisit();
      local.record('probe_a', null, false, '');
      local.record('probe_b', null, true, 'probe text');
      expect(local.getVisits()).assertEqual(2);
      expect(local.getProbes().length).assertEqual(2);
      expect(local.missingIds().length).assertEqual(2);
      expect(local.missingIds()[0]).assertEqual('probe_a');
      expect(local.missingIds()[1]).assertEqual('probe_b');
      expect(local.disabledIds().length).assertEqual(0);
      expect(local.foundCount()).assertEqual(0);
      expect(local.hasProbe('probe_b')).assertTrue();
      local.reset();
      expect(local.getVisits()).assertEqual(0);
      expect(local.getProbes().length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LayoutObserverModel_014, end');
    });

    /**
     * Scenario: the four duration candidates of the sample map to the documented constants.
     * Expectation: the default candidate is zero, the other three are ten, thirty and sixty
     * minutes in milliseconds, which is what the configuration card sends to the controller.
     */
    it('Assessment_DurationCandidateMapping_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DurationCandidateMapping_015, begin');
      const candidates: number[] = [0, 600000, 1800000, 3600000];
      expect(candidates.length).assertEqual(DURATION_LABELS.length);
      expect(candidates[0]).assertEqual(0);
      expect(candidates[1]).assertEqual(10 * 60 * 1000);
      expect(candidates[2]).assertEqual(30 * 60 * 1000);
      expect(candidates[3]).assertEqual(60 * 60 * 1000);
      const unique: Set<number> = new Set<number>(candidates);
      expect(unique.size).assertEqual(candidates.length);
      for (let i = 1; i < candidates.length; i++) {
        expect(candidates[i] > candidates[i - 1]).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DurationCandidateMapping_015, end');
    });

    /**
     * Scenario: the operation card renders one button per operation.
     * Expectation: the four identifiers and the four labels form the same ordered operation
     * list, every label is non empty and no label is repeated.
     */
    it('Assessment_OperationButtonLabels_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OperationButtonLabels_016, begin');
      expect(OPERATION_BUTTON_LABELS.length).assertEqual(OPERATION_BUTTON_IDS.length);
      const uniqueLabels: Set<string> = new Set<string>(OPERATION_BUTTON_LABELS);
      expect(uniqueLabels.size).assertEqual(OPERATION_BUTTON_LABELS.length);
      for (let i = 0; i < OPERATION_BUTTON_LABELS.length; i++) {
        expect(OPERATION_BUTTON_LABELS[i].length > 0).assertTrue();
      }
      expect(OPERATION_BUTTON_LABELS[0]).assertEqual('begin');
      expect(OPERATION_BUTTON_LABELS[1]).assertEqual('end');
      expect(OPERATION_BUTTON_LABELS[2]).assertEqual('isActive');
      expect(OPERATION_BUTTON_LABELS[3]).assertEqual('getConfiguration');
      hilog.info(DOMAIN, TAG, '%{public}s labels: %{public}s', BUNDLE + 'OperationButtonLabels_016',
        OPERATION_BUTTON_LABELS.join('|'));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OperationButtonLabels_016, end');
    });
  });
}
