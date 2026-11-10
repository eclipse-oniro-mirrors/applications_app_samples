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

import { describe, it, expect, beforeAll, afterAll, beforeEach } from '@ohos/hypium';
import { Driver } from '@ohos.UiTest';
import {
  getDriver,
  serializedDelay,
  ensureHomePage,
  backToHome,
  openCreateIssuePage,
  openIssueListPage,
  openIntroductionPage,
  pressAndWait,
  waitForAnyText,
  componentCount,
  KEY_BACK,
  KEY_ENTER,
  DELAY_PAGE_SWITCH,
  TIMEOUT_PAGE_RENDER,
  TEXT_CREATE_ISSUE_CANDIDATES,
  TEXT_FORM_CANDIDATES,
  TEXT_HOME_HEADER_CANDIDATES,
  TEXT_ISSUE_LIST_CANDIDATES,
  TEXT_INTRODUCTION_CANDIDATES,
} from '../Shared/BetaClubDriver';

const PAGE_HOME: string = 'IssueReporterHome';

const PAGE_ADD: string = 'IssueReporterAdd';

const PAGE_LIST: string = 'IssueReporterList';

const PAGE_DETAIL: string = 'IssueReporterDetail';

const PAGE_INTRODUCTION: string = 'UseIntroduction';

const MAX_ROUTER_DEPTH: number = 8;

interface PageVisit {
  page: string;
  timestamp: number;
}

// Models aboutToAppear/aboutToDisappear counters for one page
class PageLifecycleModel {
  private appearCount: number = 0;
  private disappearCount: number = 0;
  private active: boolean = false;
  private readonly name: string;

  constructor(name: string) {
    this.name = name;
  }

  public onAppear(): void {
    this.appearCount++;
    this.active = true;
  }

  public onDisappear(): void {
    this.disappearCount++;
    this.active = false;
  }

  public getName(): string {
    return this.name;
  }

  public isActive(): boolean {
    return this.active;
  }

  public getAppearCount(): number {
    return this.appearCount;
  }

  public getDisappearCount(): number {
    return this.disappearCount;
  }

  public isBalanced(): boolean {
    return Math.abs(this.appearCount - this.disappearCount) <= 1;
  }
}

// Models router.pushUrl/pop history for the issue reporter stack
class RouterHistory {
  private stack: string[] = [];
  private visits: PageVisit[] = [];

  constructor(root: string) {
    this.stack.push(root);
    this.visits.push({ page: root, timestamp: Date.now() });
  }

  public push(page: string): boolean {
    if (this.stack.length >= MAX_ROUTER_DEPTH) {
      return false;
    }
    this.stack.push(page);
    this.visits.push({ page: page, timestamp: Date.now() });
    return true;
  }

  public pop(): string {
    if (this.stack.length <= 1) {
      return '';
    }
    const removed = this.stack.pop();
    this.visits.push({ page: this.current(), timestamp: Date.now() });
    return removed === undefined ? '' : removed;
  }

  public current(): string {
    return this.stack.length === 0 ? '' : this.stack[this.stack.length - 1];
  }

  public depth(): number {
    return this.stack.length;
  }

  public contains(page: string): boolean {
    return this.stack.includes(page);
  }

  public getVisits(): PageVisit[] {
    return [...this.visits];
  }

  public visitCount(page: string): number {
    let count: number = 0;
    for (let i = 0; i < this.visits.length; i++) {
      if (this.visits[i].page === page) {
        count++;
      }
    }
    return count;
  }

  public reset(root: string): void {
    this.stack = [root];
    this.visits = [{ page: root, timestamp: Date.now() }];
  }
}

// Caches page state so returning from detail does not reload
class PageStateCache {
  private store: Map<string, string> = new Map<string, string>();

  public save(key: string, value: string): void {
    this.store.set(key, value);
  }

  public load(key: string): string {
    const value = this.store.get(key);
    return value === undefined ? '' : value;
  }

  public has(key: string): boolean {
    return this.store.has(key);
  }

  public remove(key: string): void {
    this.store.delete(key);
  }

  public size(): number {
    return this.store.size;
  }

  public keys(): string[] {
    const result: string[] = [];
    this.store.forEach((value: string, key: string) => {
      result.push(key);
    });
    return result;
  }

  public clear(): void {
    this.store.clear();
  }
}

// Tracks the detail page loading state machine
class DetailLoadState {
  public static readonly IDLE: string = 'idle';

  public static readonly LOADING: string = 'loading';

  public static readonly SUCCESS: string = 'success';

  public static readonly FAILURE: string = 'failure';

  private state: string = DetailLoadState.IDLE;

  public transition(next: string): boolean {
    if (this.state === next) {
      return false;
    }
    if (this.state === DetailLoadState.IDLE && next === DetailLoadState.LOADING) {
      this.state = next;
      return true;
    }
    if (this.state === DetailLoadState.LOADING &&
      (next === DetailLoadState.SUCCESS || next === DetailLoadState.FAILURE)) {
      this.state = next;
      return true;
    }
    if ((this.state === DetailLoadState.SUCCESS || this.state === DetailLoadState.FAILURE) &&
      next === DetailLoadState.LOADING) {
      this.state = next;
      return true;
    }
    return false;
  }

  public getState(): string {
    return this.state;
  }

  public isLoading(): boolean {
    return this.state === DetailLoadState.LOADING;
  }

  public isFinished(): boolean {
    return this.state === DetailLoadState.SUCCESS || this.state === DetailLoadState.FAILURE;
  }

  public reset(): void {
    this.state = DetailLoadState.IDLE;
  }
}

export default function issuePageLifecycleTest() {
  describe('IssuePageLifecycle_Test', () => {
    let driver: Driver;
    let history: RouterHistory;

    beforeAll(async () => {
      driver = getDriver();
      history = new RouterHistory(PAGE_HOME);
      await serializedDelay(driver, 300);
      await ensureHomePage(driver);
    });

    afterAll(async () => {
      await backToHome(driver, 3);
    });

    beforeEach(() => {
      history.reset(PAGE_HOME);
    });

    it('page_lifecycle_should_count_appear_and_disappear', 0, () => {
      const page = new PageLifecycleModel(PAGE_HOME);
      expect(page.getAppearCount()).assertEqual(0);
      expect(page.getDisappearCount()).assertEqual(0);
      page.onAppear();
      expect(page.isActive()).assertTrue();
      expect(page.getAppearCount()).assertEqual(1);
      page.onDisappear();
      expect(page.isActive()).assertFalse();
      expect(page.getDisappearCount()).assertEqual(1);
      expect(page.isBalanced()).assertTrue();
    });

    it('page_lifecycle_should_allow_repeated_visits', 0, () => {
      const page = new PageLifecycleModel(PAGE_LIST);
      for (let i = 0; i < 3; i++) {
        page.onAppear();
        page.onDisappear();
      }
      expect(page.getAppearCount()).assertEqual(3);
      expect(page.getDisappearCount()).assertEqual(3);
      expect(page.isBalanced()).assertTrue();
      expect(page.getName()).assertEqual(PAGE_LIST);
    });

    it('page_lifecycle_should_detect_unbalanced_state', 0, () => {
      const page = new PageLifecycleModel(PAGE_ADD);
      page.onAppear();
      page.onAppear();
      page.onAppear();
      page.onDisappear();
      expect(page.isBalanced()).assertFalse();
      expect(page.getAppearCount() - page.getDisappearCount()).assertEqual(2);
    });

    it('router_history_should_push_and_pop_pages', 0, () => {
      expect(history.current()).assertEqual(PAGE_HOME);
      expect(history.depth()).assertEqual(1);
      expect(history.push(PAGE_LIST)).assertTrue();
      expect(history.current()).assertEqual(PAGE_LIST);
      expect(history.depth()).assertEqual(2);
      expect(history.pop()).assertEqual(PAGE_LIST);
      expect(history.current()).assertEqual(PAGE_HOME);
      expect(history.depth()).assertEqual(1);
    });

    it('router_history_should_not_pop_root', 0, () => {
      expect(history.pop()).assertEqual('');
      expect(history.current()).assertEqual(PAGE_HOME);
      expect(history.depth()).assertEqual(1);
      expect(history.contains(PAGE_HOME)).assertTrue();
      expect(history.contains(PAGE_LIST)).assertFalse();
    });

    it('router_history_should_enforce_max_depth', 0, () => {
      for (let i = 1; i < MAX_ROUTER_DEPTH; i++) {
        expect(history.push(PAGE_DETAIL)).assertTrue();
      }
      expect(history.depth()).assertEqual(MAX_ROUTER_DEPTH);
      expect(history.push(PAGE_DETAIL)).assertFalse();
      expect(history.depth()).assertEqual(MAX_ROUTER_DEPTH);
    });

    it('router_history_should_record_visits', 0, () => {
      history.push(PAGE_ADD);
      history.push(PAGE_LIST);
      history.pop();
      expect(history.visitCount(PAGE_HOME)).assertEqual(1);
      expect(history.visitCount(PAGE_ADD)).assertEqual(2);
      expect(history.visitCount(PAGE_LIST)).assertEqual(1);
      expect(history.getVisits().length).assertEqual(4);
    });

    it('page_state_cache_should_restore_issue_draft', 0, () => {
      const cache = new PageStateCache();
      cache.save('draft:description', 'screen flickers');
      cache.save('draft:probability', '3');
      expect(cache.has('draft:description')).assertTrue();
      expect(cache.load('draft:description')).assertEqual('screen flickers');
      expect(cache.load('draft:probability')).assertEqual('3');
      expect(cache.load('missing')).assertEqual('');
      expect(cache.size()).assertEqual(2);
    });

    it('page_state_cache_should_remove_and_clear', 0, () => {
      const cache = new PageStateCache();
      cache.save('a', '1');
      cache.save('b', '2');
      cache.remove('a');
      expect(cache.has('a')).assertFalse();
      expect(cache.load('a')).assertEqual('');
      expect(cache.size()).assertEqual(1);
      expect(cache.keys().length).assertEqual(1);
      cache.clear();
      expect(cache.size()).assertEqual(0);
      expect(cache.keys().length).assertEqual(0);
    });

    it('page_state_cache_should_overwrite_existing_key', 0, () => {
      const cache = new PageStateCache();
      cache.save('status', 'draft');
      cache.save('status', 'submitted');
      expect(cache.size()).assertEqual(1);
      expect(cache.load('status')).assertEqual('submitted');
      cache.remove('status');
      cache.remove('status');
      expect(cache.size()).assertEqual(0);
    });

    it('detail_load_state_should_follow_success_path', 0, () => {
      const state = new DetailLoadState();
      expect(state.getState()).assertEqual(DetailLoadState.IDLE);
      expect(state.transition(DetailLoadState.LOADING)).assertTrue();
      expect(state.isLoading()).assertTrue();
      expect(state.transition(DetailLoadState.SUCCESS)).assertTrue();
      expect(state.isFinished()).assertTrue();
      expect(state.isLoading()).assertFalse();
      expect(state.transition(DetailLoadState.SUCCESS)).assertFalse();
    });

    it('detail_load_state_should_follow_failure_path', 0, () => {
      const state = new DetailLoadState();
      state.transition(DetailLoadState.LOADING);
      expect(state.transition(DetailLoadState.FAILURE)).assertTrue();
      expect(state.getState()).assertEqual(DetailLoadState.FAILURE);
      expect(state.isFinished()).assertTrue();
      expect(state.transition(DetailLoadState.SUCCESS)).assertFalse();
      expect(state.transition(DetailLoadState.LOADING)).assertTrue();
      state.reset();
      expect(state.getState()).assertEqual(DetailLoadState.IDLE);
    });

    it('home_page_should_restore_after_returning_from_create', 0, async () => {
      await ensureHomePage(driver);
      const opened = await openCreateIssuePage(driver);
      expect(opened).assertTrue();
      const formVisible = await waitForAnyText(driver, TEXT_FORM_CANDIDATES, TIMEOUT_PAGE_RENDER);
      expect(formVisible !== '').assertTrue();
      await pressAndWait(driver, KEY_BACK, 1, DELAY_PAGE_SWITCH);
      const homeVisible = await waitForAnyText(driver, TEXT_HOME_HEADER_CANDIDATES, TIMEOUT_PAGE_RENDER);
      expect(homeVisible !== '').assertTrue();
    });

    it('home_page_should_restore_after_returning_from_list', 0, async () => {
      await ensureHomePage(driver);
      const opened = await openIssueListPage(driver);
      expect(opened).assertTrue();
      await pressAndWait(driver, KEY_BACK, 1, DELAY_PAGE_SWITCH);
      const homeVisible = await waitForAnyText(driver, TEXT_HOME_HEADER_CANDIDATES, TIMEOUT_PAGE_RENDER);
      expect(homeVisible !== '').assertTrue();
    });

    it('home_page_should_restore_after_returning_from_introduction', 0, async () => {
      await ensureHomePage(driver);
      const opened = await openIntroductionPage(driver);
      expect(opened).assertTrue();
      await pressAndWait(driver, KEY_BACK, 1, DELAY_PAGE_SWITCH);
      const homeVisible = await waitForAnyText(driver, TEXT_INTRODUCTION_CANDIDATES, TIMEOUT_PAGE_RENDER);
      expect(homeVisible !== '').assertTrue();
      const createVisible = await waitForAnyText(driver, TEXT_HOME_HEADER_CANDIDATES, TIMEOUT_PAGE_RENDER);
      expect(createVisible !== '').assertTrue();
    });

    it('page_switch_should_keep_component_count_reasonable', 0, async () => {
      await ensureHomePage(driver);
      const homeCount = await componentCount(driver);
      expect(homeCount).assertLarger(0);
      await openIntroductionPage(driver);
      const introCount = await componentCount(driver);
      expect(introCount).assertLarger(0);
      await backToHome(driver, 2);
      const restoredCount = await componentCount(driver);
      expect(restoredCount).assertLarger(0);
      expect(restoredCount).assertLessOrEqual(homeCount * 3);
    });

    it('router_history_should_simulate_full_user_journey', 0, () => {
      history.push(PAGE_LIST);
      history.push(PAGE_DETAIL);
      history.pop();
      history.pop();
      history.push(PAGE_ADD);
      expect(history.current()).assertEqual(PAGE_ADD);
      expect(history.visitCount(PAGE_HOME)).assertEqual(2);
      expect(history.visitCount(PAGE_LIST)).assertEqual(2);
      expect(history.visitCount(PAGE_DETAIL)).assertEqual(1);
      expect(history.visitCount(PAGE_ADD)).assertEqual(1);
      expect(history.depth()).assertEqual(2);
    });

    it('page_state_cache_should_support_many_drafts', 0, () => {
      const cache = new PageStateCache();
      for (let i = 0; i < 10; i++) {
        cache.save(`draft:${i}`, `value-${i}`);
      }
      expect(cache.size()).assertEqual(10);
      expect(cache.keys().length).assertEqual(10);
      expect(cache.load('draft:0')).assertEqual('value-0');
      expect(cache.load('draft:9')).assertEqual('value-9');
      cache.clear();
      expect(cache.load('draft:5')).assertEqual('');
    });

    it('detail_load_state_should_reject_invalid_transition', 0, () => {
      const state = new DetailLoadState();
      expect(state.transition(DetailLoadState.SUCCESS)).assertFalse();
      expect(state.transition(DetailLoadState.FAILURE)).assertFalse();
      expect(state.getState()).assertEqual(DetailLoadState.IDLE);
      state.transition(DetailLoadState.LOADING);
      expect(state.transition(DetailLoadState.IDLE)).assertFalse();
      expect(state.isLoading()).assertTrue();
      expect(state.isFinished()).assertFalse();
    });

    it('page_enter_key_should_open_entry_without_crash', 0, async () => {
      await ensureHomePage(driver);
      await pressAndWait(driver, KEY_ENTER, 1, DELAY_PAGE_SWITCH);
      await serializedDelay(driver, DELAY_PAGE_SWITCH);
      const attachmentVisible = await waitForAnyText(driver, TEXT_FORM_CANDIDATES, TIMEOUT_PAGE_RENDER);
      const listVisible = await waitForAnyText(driver, TEXT_ISSUE_LIST_CANDIDATES, TIMEOUT_PAGE_RENDER);
      expect(attachmentVisible !== '' || listVisible !== '').assertTrue();
      await backToHome(driver, 3);
    });

    it('page_lifecycle_constants_should_be_unique', 0, () => {
      const pages: string[] = [PAGE_HOME, PAGE_ADD, PAGE_LIST, PAGE_DETAIL, PAGE_INTRODUCTION];
      const unique: Set<string> = new Set<string>();
      for (let i = 0; i < pages.length; i++) {
        unique.add(pages[i]);
        expect(pages[i].length).assertLarger(0);
      }
      expect(unique.size).assertEqual(pages.length);
      expect(MAX_ROUTER_DEPTH).assertEqual(8);
    });
  });
}

