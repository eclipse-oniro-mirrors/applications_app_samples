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

// Transcription of the pull-to-refresh behaviour the sample relies on: the gesture state machine, damping and
// animation ticks of @ohos/pulltorefresh 2.0.6 (PullToRefresh.ets) and the page callbacks of PullToRefreshNews.ets.
// Scroller, canvas and timers are replaced by explicit inputs so every step is deterministic.

// Mirrors the gesture states of PullToRefresh.ets.
export const IS_FREE: number = 0;
export const IS_PULL_DOWN_1: number = 11;
export const IS_PULL_DOWN_2: number = 12;
export const IS_REFRESHING: number = 2;
export const IS_REFRESHED: number = 3;
export const IS_PULL_UP_1: number = 41;
export const IS_PULL_UP_2: number = 42;
export const IS_LOADING: number = 5;

// Mirrors the PullToRefreshConfigurator defaults.
export const DEFAULT_MAX_TRANSLATE: number = 100;
export const DEFAULT_SENSITIVITY: number = 0.7;
export const DEFAULT_ANIM_DURATION: number = 150;
export const DEFAULT_REFRESH_HEIGHT: number = 30;
export const DEFAULT_REFRESH_ANIM_DURATION: number = 1000;
export const DEFAULT_LOAD_IMG_HEIGHT: number = 30;

// Mirrors the PullToRefreshNews constants.
export const NEWS_MOCK_DATA_COUNT: number = 8;
export const NEWS_MAX_LIST: number = 4;
export const NEWS_REFRESH_TIME: number = 1500;
export const LOAD_PULL_STATE_CHANGE: number = 0.75;
export const CHANGE_PAGE_STATE: number = 0.99;
export const MOCK_DATA_FILE_ONE_DIR: string = 'mockDataOne.json';
export const MOCK_DATA_FILE_TWO_DIR: string = 'mockDataTwo.json';
export const CURRENT_DATA_RESOLVE_SUCCESS: string = '刷新当前数据成功';
export const NEW_DATA_RESOLVE_SUCCESS: string = '更新数据成功';
export const CURRENT_DATA_TIP: string = '释放刷新当前页面数据';
export const NEW_DATA_TIP: string = '释放更新下页数据';
export const LOAD_DEFAULT_TEXT: string = '正在玩命加载中...';
export const LOAD_STOP_TEXT: string = '已经到底啦';
export const LOAD_TEXT_PULL_UP_1: string = '正在上拉刷新...';
export const LOAD_TEXT_PULL_UP_2: string = '放开刷新';

// Readable name of a gesture state, '' for unknown values.
export function stateName(state: number): string {
  if (state === IS_FREE) {
    return 'free';
  }
  if (state === IS_PULL_DOWN_1) {
    return 'pullDown1';
  }
  if (state === IS_PULL_DOWN_2) {
    return 'pullDown2';
  }
  if (state === IS_REFRESHING) {
    return 'refreshing';
  }
  if (state === IS_REFRESHED) {
    return 'refreshed';
  }
  if (state === IS_PULL_UP_1) {
    return 'pullUp1';
  }
  if (state === IS_PULL_UP_2) {
    return 'pullUp2';
  }
  if (state === IS_LOADING) {
    return 'loading';
  }
  return '';
}

// Mirrors headerUI(): the header is visible while pulling down or refreshing.
export function isHeaderVisible(state: number): boolean {
  return state === IS_PULL_DOWN_1 || state === IS_PULL_DOWN_2 || state === IS_REFRESHING;
}

// Mirrors footerUI(): the footer is visible while pulling up or loading.
export function isFooterVisible(state: number): boolean {
  return state === IS_PULL_UP_1 || state === IS_PULL_UP_2 || state === IS_LOADING;
}

// Mirrors onActionUpdate(): gestures are only tracked in the free and pulling states.
export function acceptsGesture(state: number): boolean {
  return state === IS_FREE || state === IS_PULL_DOWN_1 || state === IS_PULL_DOWN_2 || state === IS_PULL_UP_1 ||
    state === IS_PULL_UP_2;
}

// Mirrors the isTop check of onActionUpdate(), which tolerates tiny floating offsets.
export function isListAtTop(yOffset: number): boolean {
  let isTop: boolean = yOffset === 0;
  if (yOffset > -0.0001 && yOffset < 0.001) {
    isTop = true;
  }
  return isTop;
}

// Damping factor used by getTranslateYOfRefresh() for the current top translation.
export function refreshDampingOf(trYTop: number, maxTranslate: number): number {
  const ratio: number = trYTop / maxTranslate;
  if (ratio < 0.2) {
    return 1;
  }
  if (ratio < 0.4) {
    return 0.8;
  }
  if (ratio < 0.6) {
    return 0.6;
  }
  if (ratio < 0.8) {
    return 0.4;
  }
  return 0.2;
}

// Damping factor used by getTranslateYOfLoadMore() for the current bottom translation (negative values).
export function loadDampingOf(trYBottom: number, maxTranslate: number): number {
  const ratio: number = trYBottom / maxTranslate;
  if (ratio > -0.2) {
    return 1;
  }
  if (ratio > -0.4) {
    return 0.8;
  }
  if (ratio > -0.6) {
    return 0.6;
  }
  if (ratio > -0.8) {
    return 0.4;
  }
  return 0.2;
}

// Mirrors getTranslateYOfRefresh(): damped translation clamped to [0, maxTranslate].
export function translateYOfRefresh(trYTop: number, deltaY: number, maxTranslate: number, sensitivity: number): number {
  const moved: number = deltaY * refreshDampingOf(trYTop, maxTranslate) * sensitivity;
  if (trYTop + moved > maxTranslate) {
    return maxTranslate;
  }
  if (trYTop + moved < 0) {
    return 0;
  }
  return trYTop + moved;
}

// Mirrors getTranslateYOfLoadMore(): damped translation clamped to [-maxTranslate, 0].
export function translateYOfLoadMore(trYBottom: number, deltaY: number, maxTranslate: number,
  sensitivity: number): number {
  const moved: number = deltaY * loadDampingOf(trYBottom, maxTranslate) * sensitivity;
  if (trYBottom + moved < -maxTranslate) {
    return -maxTranslate;
  }
  if (trYBottom + moved > 0) {
    return 0;
  }
  return trYBottom + moved;
}

// Mirrors the pull-down state choice: below the refresh height it is stage 1, otherwise stage 2.
export function pullDownStateOf(trYTop: number, refreshHeight: number): number {
  return trYTop < refreshHeight ? IS_PULL_DOWN_1 : IS_PULL_DOWN_2;
}

// Mirrors the pull-up state choice: until the load image is fully revealed it is stage 1, otherwise stage 2.
export function pullUpStateOf(trYBottom: number, loadImgHeight: number): number {
  return trYBottom > -loadImgHeight ? IS_PULL_UP_1 : IS_PULL_UP_2;
}

// Mirrors onActionEnd(): a pull down refreshes once it reaches 75% of maxTranslate.
export function shouldStartRefresh(trYTop: number, maxTranslate: number): boolean {
  return trYTop / maxTranslate >= 0.75;
}

// Mirrors onActionEnd(): a pull up loads once it reaches 75% of maxTranslate.
export function shouldStartLoad(trYBottom: number, maxTranslate: number): boolean {
  return -trYBottom / maxTranslate >= 0.75;
}

// Mirrors the refreshing interval: value wraps at 1 and grows by 10 / refreshAnimDuration, kept to 3 decimals.
export function refreshTick(value: number, refreshAnimDuration: number): number {
  let next: number = value;
  if (next >= 1) {
    next -= 1;
  } else if (refreshAnimDuration !== 0) {
    next += 10 / refreshAnimDuration;
  }
  return Math.round(next * 1000) / 1000;
}

// Mirrors the loading interval: value wraps at 1 and grows by 0.01, kept to 2 decimals.
export function loadingTick(value: number): number {
  let next: number = value;
  if (next >= 1) {
    next -= 1;
  } else {
    next += 0.01;
  }
  return Math.round(next * 100) / 100;
}

// Value after n refreshing ticks starting from 0.
export function refreshValueAfter(ticks: number, refreshAnimDuration: number): number {
  let value: number = 0;
  for (let i: number = 0; i < ticks; i++) {
    value = refreshTick(value, refreshAnimDuration);
  }
  return value;
}

// Value after n loading ticks starting from 0.
export function loadingValueAfter(ticks: number): number {
  let value: number = 0;
  for (let i: number = 0; i < ticks; i++) {
    value = loadingTick(value);
  }
  return value;
}

// Mirrors drawRefreshView(): the satellite moves from point 1 to point 2, capped at 75% of the way.
export function satelliteCoordinate(value: number, from: number, to: number): number {
  const capped: number = value > 0.75 ? 0.75 : value;
  return capped * (to - from) + from;
}

// Mirrors drawRefreshView(): satellite radius refreshHeight / 20 + 1.
export function satelliteRadius(refreshHeight: number): number {
  return refreshHeight / 20 + 1;
}

// Mirrors drawRefreshView(): nothing is drawn until the header is fully revealed.
export function drawsRefreshRing(trYTop: number, refreshHeight: number): boolean {
  return trYTop >= refreshHeight;
}

// Mirrors drawLoadView(true, value): arrow angle while pulling up.
export function pullUpArrowAngle(value: number): number {
  return value < 0.75 ? 0 : 180;
}

// Mirrors drawLoadView(true, value): '' until the load image is revealed, then the two pull-up texts.
export function pullUpLoadText(trYBottom: number, loadImgHeight: number, value: number): string {
  if (trYBottom <= -loadImgHeight) {
    return value < 0.75 ? LOAD_TEXT_PULL_UP_1 : LOAD_TEXT_PULL_UP_2;
  }
  return '';
}

// Mirrors drawLoadView(false, value): loading icon angle.
export function loadingAngle(value: number): number {
  return value * 360;
}

// Mirrors the body height of PullToRefresh: mHeight - trYTop + trYBottom.
export function listBodyHeight(height: number, trYTop: number, trYBottom: number): number {
  return height - trYTop + trYBottom;
}

// Mirrors PullToRefreshNews.onRefresh(): the page switches only when isChangePage is set.
export function nextNewsPage(currentPage: number, isChangePage: boolean): number {
  return isChangePage ? (currentPage + 1) % 2 : currentPage;
}

// Mirrors currentPageMap of PullToRefreshNews.
export function mockFileOfPage(page: number): string {
  if (page === 0) {
    return MOCK_DATA_FILE_ONE_DIR;
  }
  if (page === 1) {
    return MOCK_DATA_FILE_TWO_DIR;
  }
  return '';
}

// Mirrors the resolve text of onRefresh().
export function refreshResolveText(isChangePage: boolean): string {
  return isChangePage ? NEW_DATA_RESOLVE_SUCCESS : CURRENT_DATA_RESOLVE_SUCCESS;
}

// Mirrors onAnimRefreshing(): pulling between 75% and 99% refreshes the current page, otherwise the next page.
export function isChangePageOf(pullHeightValue: number): boolean {
  return !(pullHeightValue > LOAD_PULL_STATE_CHANGE && pullHeightValue <= CHANGE_PAGE_STATE);
}

// Mirrors customRefresh(): the tip shown for the current pull height.
export function refreshTipOf(pullHeightValue: number): string {
  return pullHeightValue <= CHANGE_PAGE_STATE ? CURRENT_DATA_TIP : NEW_DATA_TIP;
}

// Mirrors onAnimPullUp(): arrow angle of the custom footer.
export function newsPullUpAngle(value: number): number {
  return value < LOAD_PULL_STATE_CHANGE ? 0 : 180;
}

// Mirrors onAnimPullUp(): text of the custom footer.
export function newsPullUpText(value: number): string {
  return value < LOAD_PULL_STATE_CHANGE ? LOAD_TEXT_PULL_UP_1 : LOAD_TEXT_PULL_UP_2;
}

// Mirrors onAnimLoading(): the stop text appears once every page is loaded.
export function newsLoadingText(newsDataListIndex: number): string {
  return newsDataListIndex !== NEWS_MAX_LIST ? LOAD_DEFAULT_TEXT : LOAD_STOP_TEXT;
}

// Mirrors customLoad(): the footer icon collapses once every page is loaded while loading.
export function footerIconSize(newsDataListIndex: number, isLoading: boolean, loadImgHeight: number): number {
  return newsDataListIndex === NEWS_MAX_LIST && isLoading ? 0 : loadImgHeight;
}

// Mirrors customLoad(): left margin of the footer text.
export function footerTextMargin(newsDataListIndex: number, isLoading: boolean): number {
  return newsDataListIndex === NEWS_MAX_LIST && isLoading ? 0 : 8;
}

// Mirrors onLoadMore(): another page of mock data is appended until NEWS_MAX_LIST pages are shown.
export function canLoadMore(newsDataListIndex: number): boolean {
  return newsDataListIndex < NEWS_MAX_LIST;
}

// Number of news items shown after the given number of load-more calls.
export function newsCountAfterLoads(loads: number): number {
  let index: number = 1;
  let count: number = NEWS_MOCK_DATA_COUNT;
  for (let i: number = 0; i < loads; i++) {
    if (canLoadMore(index)) {
      count += NEWS_MOCK_DATA_COUNT;
      index++;
    }
  }
  return count;
}

// Mirrors NewsData.
export class NewsItem {
  public newsId: string = '';
  public newsTitle: string = '';
  public newsContent: string = '';
  public newsTime: string = '';

  constructor(id: string, title: string, content: string, time: string) {
    this.newsId = id;
    this.newsTitle = title;
    this.newsContent = content;
    this.newsTime = time;
  }

  toString(): string {
    return this.newsId + ' ' + this.newsTitle + ' ' + this.newsContent + ' ' + this.newsTime;
  }
}

// Mirrors NewsDataSource (pushData/addData/clear) with the add notifications of BasicDataSource recorded.
export class NewsSourceModel {
  private items: NewsItem[] = [];
  private added: number[] = [];

  totalCount(): number {
    return this.items.length;
  }

  getData(index: number): NewsItem | undefined {
    return this.items[index];
  }

  addData(index: number, item: NewsItem): void {
    this.items.splice(index, 0, item);
    this.added.push(index);
  }

  pushData(item: NewsItem): void {
    this.items.push(item);
    this.added.push(this.items.length - 1);
  }

  clear(): void {
    this.items = [];
  }

  ids(): string[] {
    return this.items.map((item: NewsItem) => item.newsId);
  }

  addNotifications(): number[] {
    return this.added.slice();
  }
}

// Deterministic stand-in for the rawfile mock data: page 0 ids start at 1, page 1 ids at 101.
export function mockNews(page: number): NewsItem[] {
  const base: number = page === 1 ? 101 : 1;
  const items: NewsItem[] = [];
  for (let i: number = 0; i < NEWS_MOCK_DATA_COUNT; i++) {
    const id: string = `${base + i}`;
    items.push(new NewsItem(id, `title${id}`, `content${id}`, `2024-0${page + 1}-0${i + 1}`));
  }
  return items;
}

// Mirrors the gesture handling of PullToRefresh with the default (or given) configurator values.
export class PullGestureModel {
  private state: number = IS_FREE;
  private trYTop: number = 0;
  private trYBottom: number = 0;
  private touchYOld: number = 0;
  private listOffsetOld: number = 0;
  private loadText: string = '';
  private angle1: number = 0;
  private maxTranslate: number = DEFAULT_MAX_TRANSLATE;
  private sensitivity: number = DEFAULT_SENSITIVITY;
  private refreshHeight: number = DEFAULT_REFRESH_HEIGHT;
  private loadImgHeight: number = DEFAULT_LOAD_IMG_HEIGHT;
  private hasRefresh: boolean = true;
  private hasLoadMore: boolean = true;

  constructor(maxTranslate: number, sensitivity: number, hasRefresh: boolean, hasLoadMore: boolean) {
    this.maxTranslate = maxTranslate;
    this.sensitivity = sensitivity;
    this.hasRefresh = hasRefresh;
    this.hasLoadMore = hasLoadMore;
  }

  // onActionStart(): remembers the touch position.
  touchDown(offsetY: number): void {
    this.touchYOld = offsetY;
  }

  // onActionUpdate() for a list at yOffset; isAtEnd tells whether the list is scrolled to its end.
  move(offsetY: number, yOffset: number, isAtEnd: boolean): number {
    if (!acceptsGesture(this.state)) {
      return this.state;
    }
    const distanceY: number = offsetY - this.touchYOld;
    const isPullAction: boolean = distanceY > 0;
    const isTop: boolean = isListAtTop(yOffset);
    if ((this.state === IS_FREE && isTop && isPullAction) || this.state === IS_PULL_DOWN_1 ||
      this.state === IS_PULL_DOWN_2) {
      if (this.hasRefresh) {
        this.trYTop = translateYOfRefresh(this.trYTop, distanceY, this.maxTranslate, this.sensitivity);
        this.state = pullDownStateOf(this.trYTop, this.refreshHeight);
      }
    } else if (this.hasLoadMore) {
      const atBottom: boolean = this.state === IS_FREE && this.listOffsetOld === yOffset && this.listOffsetOld !== 0 &&
        offsetY < this.touchYOld && isAtEnd;
      if (atBottom || this.state === IS_PULL_UP_1 || this.state === IS_PULL_UP_2) {
        this.trYBottom = translateYOfLoadMore(this.trYBottom, distanceY, this.maxTranslate, this.sensitivity);
        this.state = pullUpStateOf(this.trYBottom, this.loadImgHeight);
        const value: number = -this.trYBottom / this.maxTranslate;
        this.loadText = pullUpLoadText(this.trYBottom, this.loadImgHeight, value);
        if (this.trYBottom <= -this.loadImgHeight) {
          this.angle1 = pullUpArrowAngle(value);
        }
      }
      this.listOffsetOld = yOffset;
    }
    this.touchYOld = offsetY;
    return this.state;
  }

  // onActionEnd(): returns 'refresh', 'load', 'close' or 'free'.
  release(): string {
    if (this.trYTop > 0) {
      if (this.state === IS_FREE || this.state === IS_PULL_DOWN_1 || this.state === IS_PULL_DOWN_2) {
        if (!shouldStartRefresh(this.trYTop, this.maxTranslate)) {
          this.closeRefresh();
          return 'close';
        }
        this.state = IS_REFRESHING;
        this.trYTop = this.maxTranslate * 0.75;
        return 'refresh';
      }
      return 'free';
    }
    if (this.trYBottom < 0) {
      if (this.state === IS_FREE || this.state === IS_PULL_UP_1 || this.state === IS_PULL_UP_2) {
        if (!shouldStartLoad(this.trYBottom, this.maxTranslate)) {
          this.closeLoad();
          return 'close';
        }
        this.state = IS_LOADING;
        this.trYBottom = -this.maxTranslate * 0.75;
        return 'load';
      }
      return 'free';
    }
    this.state = IS_FREE;
    return 'free';
  }

  // onRefresh() resolved: an empty text closes at once, otherwise the refreshed state shows the text.
  finishRefresh(refreshText: string): number {
    if (refreshText.length === 0) {
      this.closeRefresh();
    } else {
      this.state = IS_REFRESHED;
    }
    return this.state;
  }

  closeRefresh(): void {
    this.trYTop = 0;
    this.state = IS_FREE;
  }

  closeLoad(): void {
    this.trYBottom = 0;
    this.state = IS_FREE;
    this.loadText = '';
  }

  currentState(): number {
    return this.state;
  }

  top(): number {
    return this.trYTop;
  }

  bottom(): number {
    return this.trYBottom;
  }

  footerText(): string {
    return this.loadText;
  }

  arrowAngle(): number {
    return this.angle1;
  }
}

// Mirrors the PullToRefreshNews page: refresh/load callbacks and the footer/header state they drive.
export class NewsPageModel {
  private source: NewsSourceModel = new NewsSourceModel();
  private newsDataListIndex: number = 1;
  private currentPage: number = 0;
  private isChangePage: boolean = false;
  private pullHeightValue: number = 0;
  private isPullUp: boolean = true;
  private isLoading: boolean = false;
  private loadText: string = '';
  private angle1: number = 0;
  private angle2: number = 0;

  constructor() {
    mockNews(0).forEach((item: NewsItem) => {
      this.source.pushData(item);
    });
  }

  onAnimPullDown(value: number): void {
    this.pullHeightValue = value;
  }

  onAnimRefreshing(value: number): void {
    if (value) {
      this.angle2 = value * 360;
      this.isChangePage = isChangePageOf(this.pullHeightValue);
    }
  }

  // onRefresh() after NEWS_REFRESH_TIME: reloads the (possibly next) page and resolves the tip text.
  onRefresh(): string {
    if (this.isChangePage) {
      this.currentPage = (this.currentPage + 1) % 2;
    }
    this.source.clear();
    mockNews(this.currentPage).forEach((item: NewsItem) => {
      this.source.pushData(item);
    });
    this.newsDataListIndex = 1;
    return refreshResolveText(this.isChangePage);
  }

  onAnimPullUp(value: number): void {
    if (value) {
      this.isLoading = false;
      this.isPullUp = true;
      this.angle1 = newsPullUpAngle(value);
      this.loadText = newsPullUpText(value);
    }
  }

  onAnimLoading(value: number): void {
    if (value) {
      this.isPullUp = false;
      this.isLoading = true;
      this.angle2 = value * 360;
      this.loadText = newsLoadingText(this.newsDataListIndex);
    }
  }

  // onLoadMore() after NEWS_REFRESH_TIME: appends page-one data until NEWS_MAX_LIST pages are shown.
  onLoadMore(): boolean {
    if (!canLoadMore(this.newsDataListIndex)) {
      return false;
    }
    mockNews(0).forEach((item: NewsItem) => {
      this.source.pushData(item);
    });
    this.newsDataListIndex++;
    return true;
  }

  aboutToDisappear(): void {
    this.source.clear();
  }

  newsCount(): number {
    return this.source.totalCount();
  }

  firstId(): string {
    const first: NewsItem | undefined = this.source.getData(0);
    return first === undefined ? '' : first.newsId;
  }

  listIndex(): number {
    return this.newsDataListIndex;
  }

  page(): number {
    return this.currentPage;
  }

  changesPage(): boolean {
    return this.isChangePage;
  }

  footer(): string {
    return `${this.isPullUp ? 'up' : ''}${this.isLoading ? 'loading' : ''}:${this.loadText}`;
  }

  iconSize(loadImgHeight: number): number {
    return footerIconSize(this.newsDataListIndex, this.isLoading, loadImgHeight);
  }

  angles(): string {
    return `${this.angle1}/${this.angle2}`;
  }

  tip(): string {
    return refreshTipOf(this.pullHeightValue);
  }
}
