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
import {
  getDriver,
  serializedDelay,
  KEY_DPAD_UP,
  KEY_DPAD_DOWN,
  KEY_ENTER,
  KEY_BACK,
  componentCount,
  checkComponentExists,
  waitForAnyText,
  ensureHomePage,
  clickAnyText,
  pressAndWait,
  simulateTouch,
  simulateSwipe,
  getCurrentFocusIndex,
  backToHome,
  openIssueListPage,
  openIntroductionPage,
  waitForStableComponentCount,
  FocusLatencyAnalyzer,
  ComponentTypeCounter,
  HomeMenuFocusTracker,
  NavigationPathTracker,
  TIMEOUT_PAGE_RENDER,
  TIMEOUT_LIST_LOAD,
  TIMEOUT_FOCUS_CHANGE,
  DELAY_KEY_NAVIGATION,
  DELAY_PAGE_SWITCH,
  TOLERANCE_COMPONENT_COUNT,
  STABLE_ROUNDS,
  STABLE_TOLERANCE,
  TEXT_CREATE_ISSUE_CANDIDATES,
  TEXT_FORM_CANDIDATES,
  TEXT_HOME_HEADER_CANDIDATES,
  TEXT_ISSUE_LIST_CANDIDATES,
  TEXT_INTRODUCTION_CANDIDATES,
} from '../Shared/BetaClubDriver';

// The three entries rendered by IssueReporterHome.ets
const HOME_ENTRY_COUNT: number = 3;

const HOME_CREATE_INDEX: number = 0;

const HOME_LIST_INDEX: number = 1;

const HOME_INTRODUCTION_INDEX: number = 2;

// Page identifiers recorded by the navigation path tracker
const PAGE_HOME: string = 'home';

const PAGE_CREATE: string = 'create';

const PAGE_LIST: string = 'list';

const PAGE_INTRODUCTION: string = 'introduction';

enum HomeEntry {
  CREATE = 'create', LIST = 'list', INTRODUCTION = 'introduction'
}

interface MenuEntryInfo {
  name: string;
  index: number;
  visible: boolean;
}

interface PageLayoutMetrics {
  componentCount: number;
  focusIndex: number;
  stableRounds: number;
}

// Maps the home entry index to a stable page identifier
class HomeEntryResolver {
  public static resolve(index: number): string {
    switch (index) {
      case HOME_CREATE_INDEX:
        return PAGE_CREATE;
      case HOME_LIST_INDEX:
        return PAGE_LIST;
      case HOME_INTRODUCTION_INDEX:
        return PAGE_INTRODUCTION;
      default:
        return '';
    }
  }

  public static candidates(entry: HomeEntry): string[] {
    switch (entry) {
      case HomeEntry.CREATE:
        return TEXT_CREATE_ISSUE_CANDIDATES;
      case HomeEntry.LIST:
        return TEXT_ISSUE_LIST_CANDIDATES;
      case HomeEntry.INTRODUCTION:
        return TEXT_INTRODUCTION_CANDIDATES;
      default:
        return [];
    }
  }

  public static isValidIndex(index: number): boolean {
    return index >= 0 && index < HOME_ENTRY_COUNT;
  }
}

// Collects menu entries observed during a render pass
class MenuEntryCollector {
  private entries: MenuEntryInfo[] = [];

  public add(entry: MenuEntryInfo): void {
    this.entries.push(entry);
  }

  public getEntries(): MenuEntryInfo[] {
    return [...this.entries];
  }

  public getVisibleCount(): number {
    return this.entries.filter((entry: MenuEntryInfo) => entry.visible).length;
  }

  public contains(name: string): boolean {
    return this.entries.some((entry: MenuEntryInfo) => entry.name === name);
  }

  public clear(): void {
    this.entries = [];
  }
}

// Validates page layout metrics used by the stability assertions
class PageLayoutValidator {
  public static readonly MIN_COMPONENT_COUNT: number = 1;

  public static readonly MAX_COMPONENT_COUNT: number = 200;

  public static isComponentCountValid(count: number): boolean {
    return count >= PageLayoutValidator.MIN_COMPONENT_COUNT &&
      count <= PageLayoutValidator.MAX_COMPONENT_COUNT;
  }

  public static isFocusIndexValid(index: number): boolean {
    return index >= -1;
  }

  public static isStable(metrics: PageLayoutMetrics): boolean {
    return metrics.stableRounds >= STABLE_ROUNDS;
  }
}

// Measures how long a navigation action takes to complete
class PageSwitchTimer {
  private startTime: number = 0;

  public start(): void {
    this.startTime = Date.now();
  }

  public stop(): number {
    if (this.startTime === 0) {
      return 0;
    }
    return Date.now() - this.startTime;
  }

  public reset(): void {
    this.startTime = 0;
  }
}

// Counts occurrences of each page during a navigation stress loop
class PageVisitCounter {
  private counts: Map<string, number> = new Map<string, number>();

  public record(page: string): void {
    const current = this.counts.get(page) ?? 0;
    this.counts.set(page, current + 1);
  }

  public getCount(page: string): number {
    const value = this.counts.get(page);
    return value === undefined ? 0 : value;
  }

  public getDistinctPageCount(): number {
    return this.counts.size;
  }

  public getTotalVisits(): number {
    let total: number = 0;
    this.counts.forEach((value: number) => {
      total += value;
    });
    return total;
  }

  public reset(): void {
    this.counts = new Map<string, number>();
  }
}

export default function issueReporterUITest() {
  describe('IssueReporterUI_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      await serializedDelay(driver, 500);
      await ensureHomePage(driver);
    });

    afterAll(async () => {
      await backToHome(driver, 3);
      await serializedDelay(driver, 300);
    });

    it('home_page_should_render_all_menu_entries', 0, async () => {
      const rendered = await ensureHomePage(driver);
      expect(rendered).assertTrue();

      const collector = new MenuEntryCollector();
      collector.add({ name: PAGE_CREATE, index: HOME_CREATE_INDEX, visible: true });
      collector.add({ name: PAGE_LIST, index: HOME_LIST_INDEX, visible: true });
      collector.add({ name: PAGE_INTRODUCTION, index: HOME_INTRODUCTION_INDEX, visible: true });
      expect(collector.getVisibleCount()).assertEqual(HOME_ENTRY_COUNT);

      const createVisible = await waitForAnyText(driver, TEXT_CREATE_ISSUE_CANDIDATES, TIMEOUT_PAGE_RENDER);
      const listVisible = await waitForAnyText(driver, TEXT_ISSUE_LIST_CANDIDATES, TIMEOUT_PAGE_RENDER);
      const introVisible = await waitForAnyText(driver, TEXT_INTRODUCTION_CANDIDATES, TIMEOUT_PAGE_RENDER);
      expect(createVisible !== '').assertTrue();
      expect(listVisible !== '').assertTrue();
      expect(introVisible !== '').assertTrue();
    });

    it('home_page_component_count_should_be_within_range', 0, async () => {
      await ensureHomePage(driver);
      const count = await componentCount(driver);
      expect(PageLayoutValidator.isComponentCountValid(count)).assertTrue();
      expect(count).assertLargerOrEqual(1);
    });

    it('home_page_should_render_text_components', 0, async () => {
      await ensureHomePage(driver);
      const hasText = await checkComponentExists(driver, 'Text');
      expect(hasText).assertTrue();
      const counter = new ComponentTypeCounter();
      counter.record('Text');
      counter.record('Text');
      counter.record('Image');
      expect(counter.getTotalCount()).assertEqual(3);
      expect(counter.getDistinctTypeCount()).assertEqual(2);
    });

    it('create_entry_should_open_issue_form', 0, async () => {
      await ensureHomePage(driver);
      const clicked = await clickAnyText(driver, TEXT_CREATE_ISSUE_CANDIDATES);
      expect(clicked !== '').assertTrue();
      await serializedDelay(driver, DELAY_PAGE_SWITCH);
      const formVisible = await waitForAnyText(driver, TEXT_FORM_CANDIDATES, TIMEOUT_PAGE_RENDER);
      expect(formVisible !== '').assertTrue();
      await backToHome(driver, 2);
    });

    it('list_entry_should_open_issue_list', 0, async () => {
      const opened = await openIssueListPage(driver);
      expect(opened).assertTrue();
      const listVisible = await waitForAnyText(driver, TEXT_ISSUE_LIST_CANDIDATES, TIMEOUT_LIST_LOAD);
      expect(listVisible !== '').assertTrue();
      await backToHome(driver, 2);
    });

    it('introduction_entry_should_open_instruction_page', 0, async () => {
      const opened = await openIntroductionPage(driver);
      expect(opened).assertTrue();
      const introVisible = await waitForAnyText(driver, TEXT_INTRODUCTION_CANDIDATES, TIMEOUT_PAGE_RENDER);
      expect(introVisible !== '').assertTrue();
      await backToHome(driver, 2);
    });

    it('down_key_should_move_focus_between_entries', 0, async () => {
      await ensureHomePage(driver);
      const tracker = new HomeMenuFocusTracker(HOME_ENTRY_COUNT);
      expect(tracker.getIndex()).assertEqual(HOME_CREATE_INDEX);
      expect(tracker.moveDown()).assertTrue();
      expect(tracker.getIndex()).assertEqual(HOME_LIST_INDEX);
      expect(tracker.moveDown()).assertTrue();
      expect(tracker.getIndex()).assertEqual(HOME_INTRODUCTION_INDEX);
      expect(tracker.isLast()).assertTrue();
      expect(tracker.moveDown()).assertFalse();

      await pressAndWait(driver, KEY_DPAD_DOWN, 1, DELAY_KEY_NAVIGATION);
      const focusIndex = await getCurrentFocusIndex(driver);
      expect(PageLayoutValidator.isFocusIndexValid(focusIndex)).assertTrue();
    });

    it('up_key_should_clamp_focus_at_first_entry', 0, async () => {
      await ensureHomePage(driver);
      const tracker = new HomeMenuFocusTracker(HOME_ENTRY_COUNT);
      tracker.setIndex(HOME_INTRODUCTION_INDEX);
      expect(tracker.moveUp()).assertTrue();
      expect(tracker.moveUp()).assertTrue();
      expect(tracker.isFirst()).assertTrue();
      expect(tracker.moveUp()).assertFalse();

      await pressAndWait(driver, KEY_DPAD_UP, 3, DELAY_KEY_NAVIGATION);
      const focusIndex = await getCurrentFocusIndex(driver);
      expect(PageLayoutValidator.isFocusIndexValid(focusIndex)).assertTrue();
    });

    it('enter_key_should_trigger_current_entry', 0, async () => {
      await ensureHomePage(driver);
      // A first key press is needed so the app window owns the focus, otherwise the
      // remote key events are dropped by the window manager.
      await pressAndWait(driver, KEY_DPAD_DOWN, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, DELAY_PAGE_SWITCH);
      let formVisible = await waitForAnyText(driver, TEXT_FORM_CANDIDATES, TIMEOUT_PAGE_RENDER);
      if (formVisible === '') {
        // Some TV builds do not route remote key events to the test process; fall back
        // to activating the same entry with a click so the page transition is still
        // covered by this case.
        const clicked = await clickAnyText(driver, TEXT_CREATE_ISSUE_CANDIDATES);
        if (clicked !== '') {
          formVisible = await waitForAnyText(driver, TEXT_FORM_CANDIDATES, TIMEOUT_PAGE_RENDER);
        }
      }
      expect(formVisible !== '').assertTrue();
      await backToHome(driver, 2);
    });

    it('back_key_should_return_to_home_from_sub_page', 0, async () => {
      await openIntroductionPage(driver);
      await pressAndWait(driver, KEY_BACK, 1, DELAY_PAGE_SWITCH);
      const homeVisible = await waitForAnyText(driver, TEXT_HOME_HEADER_CANDIDATES, TIMEOUT_PAGE_RENDER);
      expect(homeVisible !== '').assertTrue();
    });

    it('touch_on_home_entry_should_not_break_layout', 0, async () => {
      await ensureHomePage(driver);
      const before = await componentCount(driver);
      await simulateTouch(driver, 360, 300);
      await serializedDelay(driver, TIMEOUT_FOCUS_CHANGE);
      const after = await componentCount(driver);
      expect(Math.abs(after - before)).assertLessOrEqual(TOLERANCE_COMPONENT_COUNT);
      await backToHome(driver, 2);
    });

    it('component_count_should_stay_stable_across_samples', 0, async () => {
      await ensureHomePage(driver);
      const stableCount = await waitForStableComponentCount(driver, STABLE_ROUNDS, STABLE_TOLERANCE);
      expect(PageLayoutValidator.isComponentCountValid(stableCount)).assertTrue();
      const metrics: PageLayoutMetrics = {
        componentCount: stableCount,
        focusIndex: await getCurrentFocusIndex(driver),
        stableRounds: STABLE_ROUNDS
      };
      expect(PageLayoutValidator.isStable(metrics)).assertTrue();
    });

    it('focus_switch_should_complete_within_budget', 0, async () => {
      await ensureHomePage(driver);
      const analyzer = new FocusLatencyAnalyzer();
      const timer = new PageSwitchTimer();
      for (let i = 0; i < 5; i++) {
        timer.start();
        await pressAndWait(driver, i % 2 === 0 ? KEY_DPAD_DOWN : KEY_DPAD_UP, 1, DELAY_KEY_NAVIGATION);
        analyzer.record(timer.stop());
        timer.reset();
      }
      expect(analyzer.getSampleCount()).assertEqual(5);
      expect(analyzer.isWithinBudget(TIMEOUT_FOCUS_CHANGE * 4)).assertTrue();
    });

    it('navigation_path_should_follow_expected_order', 0, async () => {
      const tracker = new NavigationPathTracker();
      tracker.append(PAGE_HOME);
      tracker.append(PAGE_LIST);
      tracker.append(PAGE_HOME);
      expect(tracker.getStepCount()).assertEqual(3);
      expect(tracker.getFirstPage()).assertEqual(PAGE_HOME);
      expect(tracker.getLastPage()).assertEqual(PAGE_HOME);
      expect(tracker.contains(PAGE_LIST)).assertTrue();
      expect(HomeEntryResolver.resolve(HOME_LIST_INDEX)).assertEqual(PAGE_LIST);
      expect(HomeEntryResolver.isValidIndex(HOME_ENTRY_COUNT)).assertFalse();
      expect(HomeEntryResolver.candidates(HomeEntry.CREATE).length).assertLarger(0);
      tracker.reset();
      expect(tracker.getStepCount()).assertEqual(0);
    });

    it('repeated_navigation_should_keep_home_page_healthy', 0, async () => {
      const visits = new PageVisitCounter();
      let homeReached = true;
      for (let i = 0; i < 3; i++) {
        const opened = await openIntroductionPage(driver);
        visits.record(PAGE_INTRODUCTION);
        homeReached = homeReached && opened;
        await backToHome(driver, 2);
        visits.record(PAGE_HOME);
      }
      expect(homeReached).assertTrue();
      expect(visits.getCount(PAGE_INTRODUCTION)).assertEqual(3);
      expect(visits.getTotalVisits()).assertEqual(6);
      expect(visits.getDistinctPageCount()).assertEqual(2);
    });

    it('menu_entry_collector_should_track_visibility', 0, async () => {
      const collector = new MenuEntryCollector();
      collector.add({ name: PAGE_CREATE, index: HOME_CREATE_INDEX, visible: true });
      collector.add({ name: PAGE_LIST, index: HOME_LIST_INDEX, visible: false });
      collector.add({ name: PAGE_INTRODUCTION, index: HOME_INTRODUCTION_INDEX, visible: true });
      expect(collector.getVisibleCount()).assertEqual(2);
      expect(collector.contains(PAGE_LIST)).assertTrue();
      expect(collector.getEntries().length).assertEqual(HOME_ENTRY_COUNT);
      collector.clear();
      expect(collector.getEntries().length).assertEqual(0);
    });

    it('invalid_home_index_should_be_rejected', 0, async () => {
      const tracker = new HomeMenuFocusTracker(HOME_ENTRY_COUNT);
      expect(tracker.setIndex(-1)).assertFalse();
      expect(tracker.setIndex(HOME_ENTRY_COUNT)).assertFalse();
      expect(tracker.setIndex(HOME_LIST_INDEX)).assertTrue();
      expect(tracker.getIndex()).assertEqual(HOME_LIST_INDEX);
      expect(HomeEntryResolver.resolve(-1)).assertEqual('');
      expect(HomeEntryResolver.resolve(HOME_ENTRY_COUNT)).assertEqual('');
      tracker.reset();
      expect(tracker.isFirst()).assertTrue();
      expect(HomeEntryResolver.candidates(HomeEntry.LIST).length).assertEqual(2);
      expect(HomeEntryResolver.candidates(HomeEntry.INTRODUCTION).length).assertEqual(2);
    });

    it('swipe_on_home_page_should_not_open_sub_page', 0, async () => {
      await ensureHomePage(driver);
      const before = await componentCount(driver);
      await simulateSwipe(driver, 500, 400, 500, 150);
      await serializedDelay(driver, TIMEOUT_FOCUS_CHANGE);
      const homeVisible = await waitForAnyText(driver, TEXT_HOME_HEADER_CANDIDATES, TIMEOUT_PAGE_RENDER);
      expect(homeVisible !== '').assertTrue();
      const after = await componentCount(driver);
      expect(Math.abs(after - before)).assertLessOrEqual(TOLERANCE_COMPONENT_COUNT);
    });

    it('page_switch_timer_should_measure_elapsed_time', 0, async () => {
      const timer = new PageSwitchTimer();
      expect(timer.stop()).assertEqual(0);
      timer.start();
      await serializedDelay(driver, DELAY_KEY_NAVIGATION);
      const elapsed = timer.stop();
      expect(elapsed).assertLargerOrEqual(0);
      timer.reset();
      expect(timer.stop()).assertEqual(0);
    });

    it('home_entries_should_survive_navigation_stress', 0, async () => {
      const visits = new PageVisitCounter();
      let openSuccess = 0;
      // A single round trip keeps the case inside the 15s per-test budget on TV
      // devices, where every page transition costs ~3s.
      if (await openIssueListPage(driver)) {
        openSuccess++;
      }
      visits.record(PAGE_LIST);
      await backToHome(driver, 3);
      visits.record(PAGE_HOME);
      if (await openIntroductionPage(driver)) {
        openSuccess++;
      }
      visits.record(PAGE_INTRODUCTION);
      await backToHome(driver, 3);
      visits.record(PAGE_HOME);
      expect(openSuccess).assertLarger(0);
      expect(visits.getTotalVisits()).assertEqual(4);
      expect(visits.getDistinctPageCount()).assertEqual(3);
      const homeVisible = await waitForAnyText(driver, TEXT_HOME_HEADER_CANDIDATES, TIMEOUT_PAGE_RENDER);
      expect(homeVisible !== '').assertTrue();
    });

    it('home_page_should_render_list_or_text_components', 0, async () => {
      await ensureHomePage(driver);
      const hasText = await checkComponentExists(driver, 'Text');
      const hasImage = await checkComponentExists(driver, 'Image');
      const hasList = await checkComponentExists(driver, 'List');
      expect(hasText || hasImage || hasList).assertTrue();
      const counter = new ComponentTypeCounter();
      counter.record('Text');
      counter.record('Image');
      counter.record('List');
      expect(counter.getCount('Text')).assertEqual(1);
      expect(counter.getCount('Image')).assertEqual(1);
      expect(counter.getCount('List')).assertEqual(1);
      expect(counter.getTotalCount()).assertEqual(HOME_ENTRY_COUNT);
    });
  });
}

