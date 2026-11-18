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

import { describe, it, expect } from '@ohos/hypium';
import UrlConstant from '../../../../main/ets/common/Constants/UrlConstant';

const CODE_SUCCESS: number = 0;

const CODE_SERVER_ERROR: number = 500;

const DATA_SOURCE_REMOTE: string = 'remote';

const DATA_SOURCE_CACHE: string = 'cache';

const DATA_SOURCE_EMPTY: string = 'empty';

const MAX_PAGE_SIZE: number = 50;

const DEFAULT_PAGE_SIZE: number = 10;

interface IssueItem {
  issueId: string;
  status: string;
  description: string;
}

interface DataSourceResponse {
  code: number;
  msg: string;
  data: IssueItem[];
  total: number;
  pageIndex: number;
}

// Validates the server response envelope before it reaches the UI
class ResponseValidator {
  public static isSuccess(response: DataSourceResponse): boolean {
    return response.code === CODE_SUCCESS && response.msg.length > 0;
  }

  public static isItemValid(item: IssueItem): boolean {
    return item.issueId.length >= 6 && item.status.length > 0 && item.description.length > 0;
  }

  public static isListValid(items: IssueItem[]): boolean {
    if (items.length === 0) {
      return false;
    }
    for (let i = 0; i < items.length; i++) {
      if (!ResponseValidator.isItemValid(items[i])) {
        return false;
      }
    }
    return true;
  }

  public static isEnvelopeValid(response: DataSourceResponse): boolean {
    return ResponseValidator.isSuccess(response) && response.total >= 0 &&
      response.pageIndex >= 0 && response.data !== undefined;
  }

  public static normalizePageSize(size: number): number {
    if (size <= 0) {
      return DEFAULT_PAGE_SIZE;
    }
    return size > MAX_PAGE_SIZE ? MAX_PAGE_SIZE : size;
  }

  public static pageCount(total: number, pageSize: number): number {
    const normalized = ResponseValidator.normalizePageSize(pageSize);
    return total <= 0 ? 0 : Math.ceil(total / normalized);
  }
}

// Chooses the effective data source for the list page
class DataSourceSelector {
  public static select(remoteValid: boolean, cacheSize: number): string {
    if (remoteValid) {
      return DATA_SOURCE_REMOTE;
    }
    if (cacheSize > 0) {
      return DATA_SOURCE_CACHE;
    }
    return DATA_SOURCE_EMPTY;
  }

  public static isEmpty(source: string): boolean {
    return source === DATA_SOURCE_EMPTY;
  }

  public static isFallback(source: string): boolean {
    return source === DATA_SOURCE_CACHE;
  }

  public static requiresRetry(source: string): boolean {
    return source === DATA_SOURCE_EMPTY;
  }
}

// Applies paging and sorting to the issue list
class IssueListPager {
  public static page(items: IssueItem[], pageIndex: number, pageSize: number): IssueItem[] {
    if (pageIndex < 0 || items.length === 0) {
      return [];
    }
    const size = ResponseValidator.normalizePageSize(pageSize);
    const start = pageIndex * size;
    if (start >= items.length) {
      return [];
    }
    return items.slice(start, start + size);
  }

  public static hasMore(items: number, pageIndex: number, pageSize: number): boolean {
    const size = ResponseValidator.normalizePageSize(pageSize);
    return (pageIndex + 1) * size < items;
  }

  public static sortByIssueId(items: IssueItem[]): IssueItem[] {
    return [...items].sort((left: IssueItem, right: IssueItem) =>
      left.issueId < right.issueId ? -1 : (left.issueId > right.issueId ? 1 : 0));
  }

  public static dedupe(items: IssueItem[]): IssueItem[] {
    const seen: Set<string> = new Set<string>();
    const result: IssueItem[] = [];
    for (let i = 0; i < items.length; i++) {
      if (!seen.has(items[i].issueId)) {
        seen.add(items[i].issueId);
        result.push(items[i]);
      }
    }
    return result;
  }
}

// Accumulates responses into a paginated feed
class PaginatedFeed {
  private items: IssueItem[] = [];
  private pageIndex: number = 0;
  private total: number = 0;

  public append(response: DataSourceResponse): boolean {
    if (!ResponseValidator.isEnvelopeValid(response)) {
      return false;
    }
    if (response.pageIndex !== this.pageIndex) {
      return false;
    }
    this.items = IssueListPager.dedupe(this.items.concat(response.data));
    this.total = response.total;
    this.pageIndex++;
    return true;
  }

  public getItems(): IssueItem[] {
    return [...this.items];
  }

  public size(): number {
    return this.items.length;
  }

  public getPageIndex(): number {
    return this.pageIndex;
  }

  public getTotal(): number {
    return this.total;
  }

  public hasMore(): boolean {
    return this.items.length < this.total;
  }

  public reset(): void {
    this.items = [];
    this.pageIndex = 0;
    this.total = 0;
  }
}

// Builds representative responses for validation tests
class ResponseFactory {
  public static item(id: string, status: string): IssueItem {
    return { issueId: id, status: status, description: `description of ${id}` };
  }

  public static success(count: number, pageIndex: number = 0): DataSourceResponse {
    const data: IssueItem[] = [];
    for (let i = 0; i < count; i++) {
      data.push(ResponseFactory.item(`ISSUE-${pageIndex * 100 + i}`, 'processing'));
    }
    return { code: CODE_SUCCESS, msg: 'ok', data: data, total: count, pageIndex: pageIndex };
  }

  public static failure(): DataSourceResponse {
    return { code: CODE_SERVER_ERROR, msg: 'server error', data: [], total: 0, pageIndex: 0 };
  }

  public static malformed(): DataSourceResponse {
    return {
      code: CODE_SUCCESS,
      msg: '',
      data: [ResponseFactory.item('x', 'processing')],
      total: 1,
      pageIndex: 0
    };
  }
}

export default function issueDataSourceValidationTest() {
  describe('IssueDataSourceValidation_Test', () => {

    it('validator_should_check_envelope_success', 0, () => {
      expect(ResponseValidator.isSuccess(ResponseFactory.success(3))).assertTrue();
      expect(ResponseValidator.isSuccess(ResponseFactory.failure())).assertFalse();
      expect(ResponseValidator.isSuccess(ResponseFactory.malformed())).assertFalse();
      expect(ResponseValidator.isEnvelopeValid(ResponseFactory.success(3))).assertTrue();
      expect(ResponseValidator.isEnvelopeValid(ResponseFactory.failure())).assertFalse();
    });

    it('validator_should_check_issue_items', 0, () => {
      expect(ResponseValidator.isItemValid(ResponseFactory.item('ISSUE-1001', 'processing'))).assertTrue();
      expect(ResponseValidator.isItemValid(ResponseFactory.item('x', 'processing'))).assertFalse();
      expect(ResponseValidator.isItemValid({
        issueId: 'ISSUE-1001', status: '', description: 'text'
      })).assertFalse();
      expect(ResponseValidator.isItemValid({
        issueId: 'ISSUE-1001', status: 'processing', description: ''
      })).assertFalse();
    });

    it('validator_should_check_list', 0, () => {
      expect(ResponseValidator.isListValid(ResponseFactory.success(3).data)).assertTrue();
      expect(ResponseValidator.isListValid([])).assertFalse();
      const mixed: IssueItem[] = [
        ResponseFactory.item('ISSUE-1001', 'processing'),
        ResponseFactory.item('bad', 'processing')
      ];
      expect(ResponseValidator.isListValid(mixed)).assertFalse();
    });

    it('validator_should_normalize_page_size', 0, () => {
      expect(ResponseValidator.normalizePageSize(0)).assertEqual(DEFAULT_PAGE_SIZE);
      expect(ResponseValidator.normalizePageSize(-5)).assertEqual(DEFAULT_PAGE_SIZE);
      expect(ResponseValidator.normalizePageSize(20)).assertEqual(20);
      expect(ResponseValidator.normalizePageSize(MAX_PAGE_SIZE)).assertEqual(MAX_PAGE_SIZE);
      expect(ResponseValidator.normalizePageSize(MAX_PAGE_SIZE + 1)).assertEqual(MAX_PAGE_SIZE);
    });

    it('validator_should_compute_page_count', 0, () => {
      expect(ResponseValidator.pageCount(25, 10)).assertEqual(3);
      expect(ResponseValidator.pageCount(20, 10)).assertEqual(2);
      expect(ResponseValidator.pageCount(0, 10)).assertEqual(0);
      expect(ResponseValidator.pageCount(15, 0)).assertEqual(2);
      expect(ResponseValidator.pageCount(100, 1000)).assertEqual(2);
    });

    it('selector_should_prefer_remote', 0, () => {
      expect(DataSourceSelector.select(true, 5)).assertEqual(DATA_SOURCE_REMOTE);
      expect(DataSourceSelector.select(false, 5)).assertEqual(DATA_SOURCE_CACHE);
      expect(DataSourceSelector.select(false, 0)).assertEqual(DATA_SOURCE_EMPTY);
      expect(DataSourceSelector.isEmpty(DATA_SOURCE_EMPTY)).assertTrue();
      expect(DataSourceSelector.isFallback(DATA_SOURCE_CACHE)).assertTrue();
      expect(DataSourceSelector.requiresRetry(DATA_SOURCE_EMPTY)).assertTrue();
      expect(DataSourceSelector.requiresRetry(DATA_SOURCE_REMOTE)).assertFalse();
    });

    it('pager_should_slice_pages', 0, () => {
      const items = ResponseFactory.success(25).data;
      expect(IssueListPager.page(items, 0, 10).length).assertEqual(10);
      expect(IssueListPager.page(items, 1, 10).length).assertEqual(10);
      expect(IssueListPager.page(items, 2, 10).length).assertEqual(5);
      expect(IssueListPager.page(items, 3, 10).length).assertEqual(0);
      expect(IssueListPager.page(items, -1, 10).length).assertEqual(0);
      expect(IssueListPager.page([], 0, 10).length).assertEqual(0);
    });

    it('pager_should_report_more_pages', 0, () => {
      expect(IssueListPager.hasMore(25, 0, 10)).assertTrue();
      expect(IssueListPager.hasMore(25, 1, 10)).assertTrue();
      expect(IssueListPager.hasMore(25, 2, 10)).assertFalse();
      expect(IssueListPager.hasMore(0, 0, 10)).assertFalse();
      expect(IssueListPager.hasMore(10, 0, 100)).assertFalse();
    });

    it('pager_should_sort_and_dedupe', 0, () => {
      const items: IssueItem[] = [
        ResponseFactory.item('ISSUE-3002', 'processing'),
        ResponseFactory.item('ISSUE-3001', 'resolved'),
        ResponseFactory.item('ISSUE-3002', 'processing')
      ];
      const sorted = IssueListPager.sortByIssueId(items);
      expect(sorted[0].issueId).assertEqual('ISSUE-3001');
      expect(sorted.length).assertEqual(3);
      const unique = IssueListPager.dedupe(items);
      expect(unique.length).assertEqual(2);
      expect(IssueListPager.dedupe([]).length).assertEqual(0);
    });

    it('feed_should_append_pages_in_order', 0, () => {
      const feed = new PaginatedFeed();
      const first = ResponseFactory.success(10, 0);
      first.total = 20;
      expect(feed.append(first)).assertTrue();
      expect(feed.size()).assertEqual(10);
      expect(feed.getPageIndex()).assertEqual(1);
      expect(feed.hasMore()).assertTrue();
      const second = ResponseFactory.success(10, 1);
      second.total = 20;
      expect(feed.append(second)).assertTrue();
      expect(feed.size()).assertEqual(20);
      expect(feed.hasMore()).assertFalse();
      expect(feed.getTotal()).assertEqual(20);
    });

    it('feed_should_reject_out_of_order_pages', 0, () => {
      const feed = new PaginatedFeed();
      expect(feed.append(ResponseFactory.success(5, 1))).assertFalse();
      expect(feed.size()).assertEqual(0);
      expect(feed.append(ResponseFactory.failure())).assertFalse();
      expect(feed.size()).assertEqual(0);
      expect(feed.append(ResponseFactory.success(5, 0))).assertTrue();
      expect(feed.append(ResponseFactory.success(5, 1))).assertTrue();
      expect(feed.size()).assertEqual(10);
      feed.reset();
      expect(feed.size()).assertEqual(0);
      expect(feed.getPageIndex()).assertEqual(0);
      expect(feed.hasMore()).assertFalse();
    });

    it('data_source_flow_should_fallback_to_cache', 0, () => {
      const remote = ResponseFactory.failure();
      const remoteValid = ResponseValidator.isEnvelopeValid(remote);
      const cacheItems = ResponseFactory.success(3).data;
      const source = DataSourceSelector.select(remoteValid, cacheItems.length);
      expect(remoteValid).assertFalse();
      expect(source).assertEqual(DATA_SOURCE_CACHE);
      expect(ResponseValidator.isListValid(cacheItems)).assertTrue();
      expect(DataSourceSelector.requiresRetry(source)).assertFalse();
      const emptySource = DataSourceSelector.select(false, 0);
      expect(emptySource).assertEqual(DATA_SOURCE_EMPTY);
      expect(DataSourceSelector.requiresRetry(emptySource)).assertTrue();
    });

    it('endpoint_constants_should_be_used', 0, () => {
      expect(UrlConstant.ISSUE_LIST.length).assertLarger(0);
      expect(UrlConstant.ISSUE_DETAIL.length).assertLarger(0);
      expect(CODE_SUCCESS).assertEqual(0);
      expect(CODE_SERVER_ERROR).assertEqual(500);
      expect(DEFAULT_PAGE_SIZE).assertEqual(10);
      expect(MAX_PAGE_SIZE).assertEqual(50);
    });
  });
}

