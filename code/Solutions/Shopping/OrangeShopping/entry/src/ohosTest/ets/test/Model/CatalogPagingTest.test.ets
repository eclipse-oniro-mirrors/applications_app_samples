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

import { describe, beforeAll, it, afterEach, expect } from '@ohos/hypium';
import { yieldToEventLoop } from '../Shared/TestDriver';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Catalog, Goods, PagedResult } from '../Shared/ShopModel';
import { CATEGORY_FOOD, CATEGORY_PHONE, createGoods, defaultCatalog } from '../Shared/TestData';

const DOMAIN: number = 0x0000;
const TAG: string = 'OrangeShoppingTest';

export default function catalogPagingTest() {
  describe('OrangeShoppingCatalogPaging', () => {
    let catalog: Catalog = defaultCatalog();

    beforeAll(() => {
      catalog = defaultCatalog();
      hilog.info(DOMAIN, TAG, '%{public}s', 'paging suite prepared');
    });

    afterEach(async () => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_PAGING_0010
     * @tc.name      paging_first_page_returns_the_leading_window_001
     * @tc.desc      Verify paging first page returns the leading window.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('paging_first_page_returns_the_leading_window_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: paging_first_page_returns_the_leading_window_001');
      let page: Goods[] = catalog.page(0, 4);
      let ids: number[] = [];
      for (let index: number = 0; index < page.length; index++) {
        ids.push(page[index].id);
      }
      expect(page.length).assertEqual(4);
      expect((ids).length).assertEqual(([0, 1, 2, 3]).length);
      for (let __i61: number = 0; __i61 < ([0, 1, 2, 3]).length; __i61++) {
        expect((ids)[__i61]).assertEqual(([0, 1, 2, 3])[__i61]);
      }
      expect(page[0].id).assertEqual(0);
      expect(page[3].id).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_PAGING_0020
     * @tc.name      paging_second_page_starts_after_the_first_window_002
     * @tc.desc      Verify paging second page starts after the first window.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('paging_second_page_starts_after_the_first_window_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: paging_second_page_starts_after_the_first_window_002');
      let first: Goods[] = catalog.page(0, 4);
      let second: Goods[] = catalog.page(1, 4);
      let firstLastId: number = first[first.length - 1].id;
      let secondFirstId: number = second[0].id;
      expect(firstLastId).assertEqual(3);
      expect(secondFirstId).assertEqual(4);
      expect(secondFirstId).assertEqual(firstLastId + 1);
      expect(second.length).assertEqual(4);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_PAGING_0030
     * @tc.name      paging_last_page_is_full_when_the_size_divides_the_catalog_003
     * @tc.desc      Verify paging last page is full when the size divides the catalog.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('paging_last_page_is_full_when_the_size_divides_the_catalog_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: paging_last_page_is_full_when_the_size_divides_the_catalog_003');
      let page: Goods[] = catalog.page(3, 4);
      expect(page.length).assertEqual(4);
      expect(page[0].id).assertEqual(12);
      expect(page[1].id).assertEqual(13);
      expect(page[2].id).assertEqual(14);
      // Sixteen items in pages of four put page 3 on ids 12..15, the final full window.
      expect(page[3].id).assertEqual(15);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_PAGING_0040
     * @tc.name      paging_partial_last_page_carries_only_the_remainder_004
     * @tc.desc      Verify paging partial last page carries only the remainder.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('paging_partial_last_page_carries_only_the_remainder_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: paging_partial_last_page_carries_only_the_remainder_004');
      // Page 2 of size 6 starts at 12 and the catalog ends at 15, so only four ids remain.
      let page: Goods[] = catalog.page(2, 6);
      expect(page.length).assertEqual(4);
      expect(page[0].id).assertEqual(12);
      expect(page[3].id).assertEqual(15);
      let after: Goods[] = catalog.page(3, 6);
      expect(after.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_PAGING_0050
     * @tc.name      paging_size_one_returns_the_first_single_item_005
     * @tc.desc      Verify paging size one returns the first single item.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('paging_size_one_returns_the_first_single_item_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: paging_size_one_returns_the_first_single_item_005');
      let page: Goods[] = catalog.page(0, 1);
      expect(page.length).assertEqual(1);
      expect(page[0].id).assertEqual(0);
      let result: PagedResult<Goods> = new PagedResult<Goods>(page, 0, 1, catalog.count());
      expect(result.hasNext()).assertTrue();
      expect(result.hasPrevious()).assertFalse();
      expect(result.count()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_PAGING_0060
     * @tc.name      paging_size_one_returns_a_single_middle_item_006
     * @tc.desc      Verify paging size one returns a single middle item.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('paging_size_one_returns_a_single_middle_item_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: paging_size_one_returns_a_single_middle_item_006');
      let page: Goods[] = catalog.page(9, 1);
      expect(page.length).assertEqual(1);
      expect(page[0].id).assertEqual(9);
      let result: PagedResult<Goods> = new PagedResult<Goods>(page, 9, 1, catalog.count());
      expect(result.hasNext()).assertTrue();
      expect(result.hasPrevious()).assertTrue();
      expect(result.count()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_PAGING_0070
     * @tc.name      paging_size_one_final_page_is_the_last_item_007
     * @tc.desc      Verify paging size one final page is the last item.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('paging_size_one_final_page_is_the_last_item_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: paging_size_one_final_page_is_the_last_item_007');
      let page: Goods[] = catalog.page(15, 1);
      expect(page.length).assertEqual(1);
      expect(page[0].id).assertEqual(15);
      let result: PagedResult<Goods> = new PagedResult<Goods>(page, 15, 1, catalog.count());
      expect(result.hasNext()).assertFalse();
      expect(result.hasPrevious()).assertTrue();
      expect(result.count()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_PAGING_0080
     * @tc.name      paging_size_sixteen_returns_the_whole_catalog_008
     * @tc.desc      Verify paging size sixteen returns the whole catalog.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('paging_size_sixteen_returns_the_whole_catalog_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: paging_size_sixteen_returns_the_whole_catalog_008');
      let page: Goods[] = catalog.page(0, 16);
      let ids: number[] = [];
      for (let index: number = 0; index < page.length; index++) {
        ids.push(page[index].id);
      }
      expect((ids).length).assertEqual((catalog.ids()).length);
      for (let __i62: number = 0; __i62 < (catalog.ids()).length; __i62++) {
        expect((ids)[__i62]).assertEqual((catalog.ids())[__i62]);
      }
      expect(page[0].id).assertEqual(0);
      expect(page[15].id).assertEqual(15);
      let result: PagedResult<Goods> = new PagedResult<Goods>(page, 0, 16, catalog.count());
      expect(result.hasNext()).assertFalse();
      expect(result.hasPrevious()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_PAGING_0090
     * @tc.name      paging_size_sixteen_second_page_is_empty_009
     * @tc.desc      Verify paging size sixteen second page is empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('paging_size_sixteen_second_page_is_empty_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: paging_size_sixteen_second_page_is_empty_009');
      let page: Goods[] = catalog.page(1, 16);
      expect(page.length).assertEqual(0);
      let result: PagedResult<Goods> = new PagedResult<Goods>(page, 1, 16, catalog.count());
      expect(result.hasNext()).assertFalse();
      expect(result.hasPrevious()).assertTrue();
      expect(result.count()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_PAGING_0100
     * @tc.name      paging_pages_beyond_the_end_return_no_items_010
     * @tc.desc      Verify paging pages beyond the end return no items.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('paging_pages_beyond_the_end_return_no_items_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: paging_pages_beyond_the_end_return_no_items_010');
      // Both the first page past the end (4) and a far one (100) must come back empty
      // with no next page.
      let pages: number[] = [4, 100];
      for (let index: number = 0; index < pages.length; index++) {
        let page: Goods[] = catalog.page(pages[index], 4);
        expect(page.length).assertEqual(0);
        let result: PagedResult<Goods> = new PagedResult<Goods>(page, pages[index], 4, catalog.count());
        expect(result.hasNext()).assertFalse();
        expect(result.hasPrevious()).assertTrue();
        expect(result.count()).assertEqual(0);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_PAGING_0110
     * @tc.name      paging_non_positive_sizes_are_rejected_011
     * @tc.desc      Verify paging non positive sizes are rejected.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('paging_non_positive_sizes_are_rejected_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: paging_non_positive_sizes_are_rejected_011');
      // Zero and negative sizes are refused at every page number, and pageCount returns 0
      // instead of dividing by zero.
      let sizes: number[] = [0, -1, -4];
      for (let index: number = 0; index < sizes.length; index++) {
        let first: Goods[] = catalog.page(0, sizes[index]);
        let later: Goods[] = catalog.page(2, sizes[index]);
        expect(first.length).assertEqual(0);
        expect(later.length).assertEqual(0);
        expect(catalog.pageCount(sizes[index])).assertEqual(0);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_PAGING_0120
     * @tc.name      paging_count_covers_the_catalog_for_divisible_sizes_012
     * @tc.desc      Verify paging count covers the catalog for divisible sizes.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('paging_count_covers_the_catalog_for_divisible_sizes_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: paging_count_covers_the_catalog_for_divisible_sizes_012');
      // For sizes that divide 16, pageCount x size must equal the catalog size, so the last
      // page is full and the page after it is empty.
      let sizes: number[] = [1, 2, 4, 8, 16];
      let total: number = catalog.count();
      for (let index: number = 0; index < sizes.length; index++) {
        let size: number = sizes[index];
        let pages: number = catalog.pageCount(size);
        expect(total % size).assertEqual(0);
        expect(pages * size).assertEqual(total);
        let last: Goods[] = catalog.page(pages - 1, size);
        expect(last.length).assertEqual(size);
        let after: Goods[] = catalog.page(pages, size);
        expect(after.length).assertEqual(0);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_PAGING_0130
     * @tc.name      paging_count_rounds_up_for_non_divisible_sizes_013
     * @tc.desc      Verify paging count rounds up for non divisible sizes.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('paging_count_rounds_up_for_non_divisible_sizes_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: paging_count_rounds_up_for_non_divisible_sizes_013');
      let sizes: number[] = [3, 6, 7, 9];
      // Ceiling division over 16 items: 16/3 -> 6, 16/6 -> 3, 16/7 -> 3, 16/9 -> 2 pages.
      let expected: number[] = [6, 3, 3, 2];
      for (let index: number = 0; index < sizes.length; index++) {
        let pages: number = catalog.pageCount(sizes[index]);
        expect(pages).assertEqual(expected[index]);
        let last: Goods[] = catalog.page(pages - 1, sizes[index]);
        let remainder: number = catalog.count() - (pages - 1) * sizes[index];
        expect(last.length).assertEqual(remainder);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_PAGING_0140
     * @tc.name      paging_count_is_one_when_the_size_exceeds_the_catalog_014
     * @tc.desc      Verify paging count is one when the size exceeds the catalog.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('paging_count_is_one_when_the_size_exceeds_the_catalog_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: paging_count_is_one_when_the_size_exceeds_the_catalog_014');
      // Sizes above 16 still need exactly one page, and MAX_SAFE_INTEGER must not overflow
      // the page-count division.
      let sizes: number[] = [17, 100, Number.MAX_SAFE_INTEGER];
      for (let index: number = 0; index < sizes.length; index++) {
        expect(catalog.pageCount(sizes[index])).assertEqual(1);
        expect(catalog.page(0, sizes[index]).length).assertEqual(catalog.count());
        expect(catalog.page(1, sizes[index]).length).assertEqual(0);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_PAGING_0150
     * @tc.name      paging_empty_catalog_has_no_items_on_any_page_015
     * @tc.desc      Verify paging empty catalog has no items on any page.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('paging_empty_catalog_has_no_items_on_any_page_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: paging_empty_catalog_has_no_items_on_any_page_015');
      let empty: Catalog = new Catalog([]);
      let pages: number[] = [0, 2];
      for (let index: number = 0; index < pages.length; index++) {
        let page: Goods[] = empty.page(pages[index], 4);
        expect(page.length).assertEqual(0);
        let result: PagedResult<Goods> = new PagedResult<Goods>(page, pages[index], 4, empty.count());
        expect(result.count()).assertEqual(0);
        expect(result.hasNext()).assertFalse();
        expect(result.hasPrevious()).assertEqual(pages[index] > 0);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_PAGING_0160
     * @tc.name      paging_empty_catalog_has_zero_page_count_016
     * @tc.desc      Verify paging empty catalog has zero page count.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('paging_empty_catalog_has_zero_page_count_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: paging_empty_catalog_has_zero_page_count_016');
      let empty: Catalog = new Catalog([]);
      let sizes: number[] = [1, 4, 16, Number.MAX_SAFE_INTEGER];
      for (let index: number = 0; index < sizes.length; index++) {
        expect(empty.pageCount(sizes[index])).assertEqual(0);
        expect(empty.page(0, sizes[index]).length).assertEqual(0);
      }
      expect(empty.isEmpty()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_PAGING_0170
     * @tc.name      paged_result_constructor_stores_the_declared_metadata_017
     * @tc.desc      Verify paged result constructor stores the declared metadata.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('paged_result_constructor_stores_the_declared_metadata_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: paged_result_constructor_stores_the_declared_metadata_017');
      let items: Goods[] = catalog.page(1, 4);
      let result: PagedResult<Goods> = new PagedResult<Goods>(items, 1, 4, 16);
      expect(result.items.length).assertEqual(4);
      expect(result.page).assertEqual(1);
      expect(result.size).assertEqual(4);
      expect(result.total).assertEqual(16);
      expect(result.count()).assertEqual(4);
      expect(result.items[0].id).assertEqual(4);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_PAGING_0180
     * @tc.name      paged_result_first_page_has_no_previous_018
     * @tc.desc      Verify paged result first page has no previous.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('paged_result_first_page_has_no_previous_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: paged_result_first_page_has_no_previous_018');
      let items: Goods[] = catalog.page(0, 4);
      let result: PagedResult<Goods> = new PagedResult<Goods>(items, 0, 4, catalog.count());
      expect(result.hasNext()).assertTrue();
      expect(result.hasPrevious()).assertFalse();
      expect(result.count()).assertEqual(4);
      expect(result.count()).assertEqual(items.length);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_PAGING_0190
     * @tc.name      paged_result_middle_page_has_both_neighbours_019
     * @tc.desc      Verify paged result middle page has both neighbours.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('paged_result_middle_page_has_both_neighbours_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: paged_result_middle_page_has_both_neighbours_019');
      let items: Goods[] = catalog.page(2, 4);
      let result: PagedResult<Goods> = new PagedResult<Goods>(items, 2, 4, catalog.count());
      expect(result.hasNext()).assertTrue();
      expect(result.hasPrevious()).assertTrue();
      expect(result.count()).assertEqual(4);
      expect(result.items[0].id).assertEqual(8);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_PAGING_0200
     * @tc.name      paged_result_last_full_page_has_no_next_020
     * @tc.desc      Verify paged result last full page has no next.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('paged_result_last_full_page_has_no_next_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: paged_result_last_full_page_has_no_next_020');
      let items: Goods[] = catalog.page(3, 4);
      let result: PagedResult<Goods> = new PagedResult<Goods>(items, 3, 4, catalog.count());
      expect(result.hasNext()).assertFalse();
      expect(result.hasPrevious()).assertTrue();
      expect(result.count()).assertEqual(4);
      expect(result.items[3].id).assertEqual(15);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_PAGING_0210
     * @tc.name      paged_result_beyond_the_last_page_has_no_next_021
     * @tc.desc      Verify paged result beyond the last page has no next.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('paged_result_beyond_the_last_page_has_no_next_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: paged_result_beyond_the_last_page_has_no_next_021');
      let items: Goods[] = catalog.page(4, 4);
      let result: PagedResult<Goods> = new PagedResult<Goods>(items, 4, 4, catalog.count());
      expect(items.length).assertEqual(0);
      expect(result.hasNext()).assertFalse();
      expect(result.hasPrevious()).assertTrue();
      expect(result.count()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_PAGING_0220
     * @tc.name      paged_result_has_next_is_false_at_the_exact_total_boundary_022
     * @tc.desc      Verify paged result has next is false at the exact total boundary.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('paged_result_has_next_is_false_at_the_exact_total_boundary_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: paged_result_has_next_is_false_at_the_exact_total_boundary_022');
      let items: Goods[] = catalog.page(1, 4);
      // At page 1 of size 4 the window ends exactly at total 8, so hasNext must be false on
      // equality and not only once the total is exceeded.
      let result: PagedResult<Goods> = new PagedResult<Goods>(items, 1, 4, 8);
      expect((result.page + 1) * result.size).assertEqual(result.total);
      expect(result.hasNext()).assertFalse();
      expect(result.hasPrevious()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_PAGING_0230
     * @tc.name      paged_result_has_next_is_true_one_item_past_the_boundary_023
     * @tc.desc      Verify paged result has next is true one item past the boundary.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('paged_result_has_next_is_true_one_item_past_the_boundary_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: paged_result_has_next_is_true_one_item_past_the_boundary_023');
      let items: Goods[] = catalog.page(1, 4);
      // A total of 9 is one item past the 8th slot, the smallest total that must report a
      // next page for this window.
      let result: PagedResult<Goods> = new PagedResult<Goods>(items, 1, 4, 9);
      expect((result.page + 1) * result.size).assertEqual(8);
      expect(result.hasNext()).assertTrue();
      expect(result.count()).assertEqual(4);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_PAGING_0240
     * @tc.name      paged_result_has_previous_only_for_page_zero_024
     * @tc.desc      Verify paged result has previous only for page zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('paged_result_has_previous_only_for_page_zero_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: paged_result_has_previous_only_for_page_zero_024');
      let pages: number[] = [0, 1, 5, 100];
      let expected: boolean[] = [false, true, true, true];
      let items: Goods[] = catalog.page(0, 4);
      for (let index: number = 0; index < pages.length; index++) {
        let result: PagedResult<Goods> = new PagedResult<Goods>(items, pages[index], 4, 16);
        expect(result.hasPrevious()).assertEqual(expected[index]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_PAGING_0250
     * @tc.name      paged_result_count_equals_the_observed_item_count_025
     * @tc.desc      Verify paged result count equals the observed item count.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('paged_result_count_equals_the_observed_item_count_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: paged_result_count_equals_the_observed_item_count_025');
      let items: Goods[] = catalog.page(0, 3);
      let result: PagedResult<Goods> = new PagedResult<Goods>(items, 0, 10, catalog.count());
      expect(items.length).assertEqual(3);
      expect(result.count()).assertEqual(3);
      expect(result.size).assertEqual(10);
      expect(result.hasNext()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_PAGING_0260
     * @tc.name      paged_result_zero_size_never_reports_the_end_026
     * @tc.desc      Verify paged result zero size never reports the end.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('paged_result_zero_size_never_reports_the_end_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: paged_result_zero_size_never_reports_the_end_026');
      let items: Goods[] = [];
      // Size 0 keeps (page + 1) x size at 0 against a total of 16, so hasNext stays true;
      // the case pins that degenerate arithmetic instead of hiding it.
      let result: PagedResult<Goods> = new PagedResult<Goods>(items, 0, 0, 16);
      expect(result.size).assertEqual(0);
      expect(result.count()).assertEqual(0);
      expect(result.hasNext()).assertTrue();
      expect(result.hasPrevious()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_PAGING_0270
     * @tc.name      paged_result_zero_total_never_reports_a_next_page_027
     * @tc.desc      Verify paged result zero total never reports a next page.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('paged_result_zero_total_never_reports_a_next_page_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: paged_result_zero_total_never_reports_a_next_page_027');
      let items: Goods[] = [];
      let pages: number[] = [0, 3];
      for (let index: number = 0; index < pages.length; index++) {
        let result: PagedResult<Goods> = new PagedResult<Goods>(items, pages[index], 5, 0);
        expect(result.hasNext()).assertFalse();
        expect(result.hasPrevious()).assertEqual(pages[index] > 0);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_PAGING_0280
     * @tc.name      paged_result_has_next_uses_total_not_item_length_028
     * @tc.desc      Verify paged result has next uses total not item length.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('paged_result_has_next_uses_total_not_item_length_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: paged_result_has_next_uses_total_not_item_length_028');
      let items: Goods[] = catalog.page(0, 4);
      let result: PagedResult<Goods> = new PagedResult<Goods>(items, 0, 4, 100);
      expect(result.count()).assertEqual(4);
      expect((result.page + 1) * result.size).assertEqual(4);
      expect(result.hasNext()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_PAGING_0290
     * @tc.name      paged_result_count_tracks_a_live_items_array_029
     * @tc.desc      Verify paged result count tracks a live items array.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('paged_result_count_tracks_a_live_items_array_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: paged_result_count_tracks_a_live_items_array_029');
      let items: Goods[] = catalog.page(0, 2);
      let result: PagedResult<Goods> = new PagedResult<Goods>(items, 0, 2, 2);
      expect(result.count()).assertEqual(2);
      expect(result.hasNext()).assertFalse();
      // count() reads the live array, so a third item lifts 2 to 3 while hasNext still
      // follows the fixed total of 2.
      items.push(createGoods(15, 'Pushed Item', 1000, CATEGORY_PHONE));
      expect(result.count()).assertEqual(3);
      expect(result.hasNext()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_PAGING_0300
     * @tc.name      paging_partitions_every_product_exactly_once_across_sizes_030
     * @tc.desc      Verify paging partitions every product exactly once across sizes.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('paging_partitions_every_product_exactly_once_across_sizes_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: paging_partitions_every_product_exactly_once_across_sizes_030');
      // Every id 0..15 must be visited exactly once per page size, so a gap or an overlap
      // between windows shows up as a seen count other than 1.
      let sizes: number[] = [1, 2, 4, 5, 6, 16];
      for (let sizeIndex: number = 0; sizeIndex < sizes.length; sizeIndex++) {
        let size: number = sizes[sizeIndex];
        let seen: number[] = [];
        for (let id: number = 0; id < catalog.count(); id++) {
          seen.push(0);
        }
        let pages: number = catalog.pageCount(size);
        for (let pageIndex: number = 0; pageIndex < pages; pageIndex++) {
          let items: Goods[] = catalog.page(pageIndex, size);
          for (let itemIndex: number = 0; itemIndex < items.length; itemIndex++) {
            let identifier: number = items[itemIndex].id;
            seen[identifier] = seen[identifier] + 1;
          }
        }
        for (let id: number = 0; id < seen.length; id++) {

          expect(seen[id]).assertEqual(1);
        }
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_PAGING_0310
     * @tc.name      paging_concatenated_pages_reproduce_the_catalog_order_031
     * @tc.desc      Verify paging concatenated pages reproduce the catalog order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('paging_concatenated_pages_reproduce_the_catalog_order_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: paging_concatenated_pages_reproduce_the_catalog_order_031');
      let collected: number[] = [];
      let pages: number = catalog.pageCount(4);
      for (let pageIndex: number = 0; pageIndex < pages; pageIndex++) {
        let items: Goods[] = catalog.page(pageIndex, 4);
        for (let itemIndex: number = 0; itemIndex < items.length; itemIndex++) {
          collected.push(items[itemIndex].id);
        }
      }
      expect((collected).length).assertEqual((catalog.ids()).length);
      for (let __i63: number = 0; __i63 < (catalog.ids()).length; __i63++) {
        expect((collected)[__i63]).assertEqual((catalog.ids())[__i63]);
      }
      expect(collected.length).assertEqual(catalog.count());
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_PAGING_0320
     * @tc.name      paging_full_pages_start_at_page_number_times_size_032
     * @tc.desc      Verify paging full pages start at page number times size.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('paging_full_pages_start_at_page_number_times_size_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: paging_full_pages_start_at_page_number_times_size_032');
      let sizes: number[] = [4, 6];
      for (let sizeIndex: number = 0; sizeIndex < sizes.length; sizeIndex++) {
        let size: number = sizes[sizeIndex];
        let fullPages: number = Math.floor(catalog.count() / size);
        for (let pageIndex: number = 0; pageIndex < fullPages; pageIndex++) {
          let items: Goods[] = catalog.page(pageIndex, size);
          expect(items.length).assertEqual(size);
          expect(items[0].id).assertEqual(pageIndex * size);
        }
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_PAGING_0330
     * @tc.name      paging_last_page_length_matches_the_remainder_033
     * @tc.desc      Verify paging last page length matches the remainder.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('paging_last_page_length_matches_the_remainder_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: paging_last_page_length_matches_the_remainder_033');
      let sizes: number[] = [6, 7, 10];
      // Remainder arithmetic: 16 % 6 = 4, 16 % 7 = 2 and 16 % 10 = 6 items on the last page.
      let remainders: number[] = [4, 2, 6];
      for (let index: number = 0; index < sizes.length; index++) {
        let pages: number = catalog.pageCount(sizes[index]);
        let last: Goods[] = catalog.page(pages - 1, sizes[index]);
        expect(last.length).assertEqual(remainders[index]);
        expect(last.length).assertEqual(catalog.count() % sizes[index]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_PAGING_0340
     * @tc.name      paging_single_item_catalog_has_one_page_034
     * @tc.desc      Verify paging single item catalog has one page.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('paging_single_item_catalog_has_one_page_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: paging_single_item_catalog_has_one_page_034');
      let single: Catalog = new Catalog([
        createGoods(300, 'Only Product', 1000, CATEGORY_PHONE)
      ]);
      expect(single.count()).assertEqual(1);
      expect(single.pageCount(1)).assertEqual(1);
      expect(single.pageCount(5)).assertEqual(1);
      expect(single.page(0, 1).length).assertEqual(1);
      expect(single.page(0, 5).length).assertEqual(1);
      expect(single.page(1, 1).length).assertEqual(0);
      expect(single.page(0, 5)[0].id).assertEqual(300);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_PAGING_0350
     * @tc.name      paging_preserves_insertion_order_not_numeric_order_035
     * @tc.desc      Verify paging preserves insertion order not numeric order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('paging_preserves_insertion_order_not_numeric_order_035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: paging_preserves_insertion_order_not_numeric_order_035');
      let ordered: Catalog = new Catalog([
        // Ids 9, 3, 7 are inserted out of numeric order, so page 0 must read 9, 3 and page 1
        // the single 7.
        createGoods(9, 'Nine First', 1000, CATEGORY_PHONE),
        createGoods(3, 'Three Second', 1000, CATEGORY_FOOD),
        createGoods(7, 'Seven Third', 1000, CATEGORY_PHONE)
      ]);
      let first: Goods[] = ordered.page(0, 2);
      let second: Goods[] = ordered.page(1, 2);
      expect(first.length).assertEqual(2);
      expect(first[0].id).assertEqual(9);
      expect(first[1].id).assertEqual(3);
      expect(second.length).assertEqual(1);
      expect(second[0].id).assertEqual(7);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_PAGING_0360
     * @tc.name      paging_oversized_page_returns_the_entire_catalog_036
     * @tc.desc      Verify paging oversized page returns the entire catalog.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('paging_oversized_page_returns_the_entire_catalog_036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: paging_oversized_page_returns_the_entire_catalog_036');
      let page: Goods[] = catalog.page(0, 20);
      expect(page.length).assertEqual(catalog.count());
      expect(page[0].id).assertEqual(0);
      expect(page[page.length - 1].id).assertEqual(15);
      let result: PagedResult<Goods> = new PagedResult<Goods>(page, 0, 20, catalog.count());
      expect(result.hasNext()).assertFalse();
      expect(result.hasPrevious()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_PAGING_0370
     * @tc.name      paging_duplicate_identifier_rows_are_paged_separately_037
     * @tc.desc      Verify paging duplicate identifier rows are paged separately.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('paging_duplicate_identifier_rows_are_paged_separately_037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: paging_duplicate_identifier_rows_are_paged_separately_037');
      let duplicate: Catalog = new Catalog([
        createGoods(7, 'First Seven', 1000, CATEGORY_PHONE),
        createGoods(7, 'Second Seven', 2000, CATEGORY_FOOD)
      ]);
      let first: Goods[] = duplicate.page(0, 1);
      let second: Goods[] = duplicate.page(1, 1);
      expect(first.length).assertEqual(1);
      expect(second.length).assertEqual(1);
      expect(first[0].id).assertEqual(7);
      expect(second[0].id).assertEqual(7);
      expect(first[0].price.cents()).assertEqual(1000);
      expect(second[0].price.cents()).assertEqual(2000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_PAGING_0380
     * @tc.name      paging_does_not_filter_sold_out_items_038
     * @tc.desc      Verify paging does not filter sold out items.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('paging_does_not_filter_sold_out_items_038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: paging_does_not_filter_sold_out_items_038');
      let mixed: Catalog = new Catalog([
        createGoods(50, 'Sold Out Product', 1000, CATEGORY_PHONE, 'sold out', 'basic_label', 0),
        createGoods(51, 'Available Product', 2000, CATEGORY_PHONE, 'available', 'basic_label', 5)
      ]);
      let page: Goods[] = mixed.page(0, 2);
      expect(page.length).assertEqual(2);
      expect(page[0].id).assertEqual(50);
      expect(page[1].id).assertEqual(51);
      expect(page[0].isInStock()).assertFalse();
      expect(page[1].isInStock()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_PAGING_0390
     * @tc.name      paging_maximum_safe_page_number_returns_no_items_039
     * @tc.desc      Verify paging maximum safe page number returns no items.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('paging_maximum_safe_page_number_returns_no_items_039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: paging_maximum_safe_page_number_returns_no_items_039');
      // The start index page x size leaves the exact integer range long before this, yet the
      // window must come back empty rather than wrapping or throwing.
      let page: Goods[] = catalog.page(Number.MAX_SAFE_INTEGER, 4);
      expect(page.length).assertEqual(0);
      let result: PagedResult<Goods> = new PagedResult<Goods>(page, Number.MAX_SAFE_INTEGER, 4,
        catalog.count());
      expect(result.hasNext()).assertFalse();
      expect(result.hasPrevious()).assertTrue();
      expect(result.count()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_PAGING_0400
     * @tc.name      paging_maximum_safe_page_size_returns_every_item_040
     * @tc.desc      Verify paging maximum safe page size returns every item.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('paging_maximum_safe_page_size_returns_every_item_040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: paging_maximum_safe_page_size_returns_every_item_040');
      let page: Goods[] = catalog.page(0, Number.MAX_SAFE_INTEGER);
      expect(page.length).assertEqual(catalog.count());
      expect(page[0].id).assertEqual(0);
      expect(page[15].id).assertEqual(15);
      let result: PagedResult<Goods> = new PagedResult<Goods>(page, 0, Number.MAX_SAFE_INTEGER,
        catalog.count());
      expect(result.hasNext()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_PAGING_0410
     * @tc.name      paging_size_one_below_the_catalog_yields_two_pages_041
     * @tc.desc      Verify paging size one below the catalog yields two pages.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('paging_size_one_below_the_catalog_yields_two_pages_041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: paging_size_one_below_the_catalog_yields_two_pages_041');
      let size: number = catalog.count() - 1;
      expect(catalog.pageCount(size)).assertEqual(2);
      let first: Goods[] = catalog.page(0, size);
      let second: Goods[] = catalog.page(1, size);
      expect(first.length).assertEqual(15);
      expect(second.length).assertEqual(1);
      expect(first[0].id).assertEqual(0);
      expect(second[0].id).assertEqual(15);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_PAGING_0420
     * @tc.name      paging_one_past_the_last_page_is_empty_for_every_size_042
     * @tc.desc      Verify paging one past the last page is empty for every size.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('paging_one_past_the_last_page_is_empty_for_every_size_042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: paging_one_past_the_last_page_is_empty_for_every_size_042');
      let sizes: number[] = [1, 2, 4, 5, 6, 16];
      for (let index: number = 0; index < sizes.length; index++) {
        let pages: number = catalog.pageCount(sizes[index]);
        let after: Goods[] = catalog.page(pages, sizes[index]);
        expect(after.length).assertEqual(0);
        let last: Goods[] = catalog.page(pages - 1, sizes[index]);
        expect(last.length > 0).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_PAGING_0430
     * @tc.name      paging_size_three_returns_contiguous_windows_043
     * @tc.desc      Verify paging size three returns contiguous windows.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('paging_size_three_returns_contiguous_windows_043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: paging_size_three_returns_contiguous_windows_043');
      let first: Goods[] = catalog.page(0, 3);
      let middle: Goods[] = catalog.page(2, 3);
      let last: Goods[] = catalog.page(5, 3);
      expect(([first[0].id, first[1].id, first[2].id]).length).assertEqual(([0, 1, 2]).length);
      for (let __i64: number = 0; __i64 < ([0, 1, 2]).length; __i64++) {
        expect(([first[0].id, first[1].id, first[2].id])[__i64]).assertEqual(([0, 1, 2])[__i64]);
      }
      expect(([middle[0].id, middle[1].id, middle[2].id]).length).assertEqual(([6, 7, 8]).length);
      for (let __i65: number = 0; __i65 < ([6, 7, 8]).length; __i65++) {
        expect(([middle[0].id, middle[1].id, middle[2].id])[__i65]).assertEqual(([6, 7, 8])[__i65]);
      }
      expect(last.length).assertEqual(1);
      expect(last[0].id).assertEqual(15);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_PAGING_0440
     * @tc.name      paging_size_two_last_page_holds_the_final_pair_044
     * @tc.desc      Verify paging size two last page holds the final pair.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('paging_size_two_last_page_holds_the_final_pair_044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: paging_size_two_last_page_holds_the_final_pair_044');
      let page: Goods[] = catalog.page(7, 2);
      expect(page.length).assertEqual(2);
      expect(page[0].id).assertEqual(14);
      expect(page[1].id).assertEqual(15);
      let result: PagedResult<Goods> = new PagedResult<Goods>(page, 7, 2, catalog.count());
      expect(result.hasNext()).assertFalse();
      expect(result.hasPrevious()).assertTrue();
      expect(result.count()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_PAGING_0450
     * @tc.name      paging_size_eight_splits_the_catalog_in_half_045
     * @tc.desc      Verify paging size eight splits the catalog in half.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('paging_size_eight_splits_the_catalog_in_half_045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: paging_size_eight_splits_the_catalog_in_half_045');
      expect(catalog.pageCount(8)).assertEqual(2);
      let first: Goods[] = catalog.page(0, 8);
      let second: Goods[] = catalog.page(1, 8);
      expect(first.length).assertEqual(8);
      expect(second.length).assertEqual(8);
      expect(first[0].id).assertEqual(0);
      expect(first[7].id).assertEqual(7);
      expect(second[0].id).assertEqual(8);
      expect(second[7].id).assertEqual(15);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_PAGING_0460
     * @tc.name      paging_window_length_never_exceeds_the_requested_size_046
     * @tc.desc      Verify paging window length never exceeds the requested size.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('paging_window_length_never_exceeds_the_requested_size_046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: paging_window_length_never_exceeds_the_requested_size_046');
      let sizes: number[] = [3, 4, 6];
      for (let sizeIndex: number = 0; sizeIndex < sizes.length; sizeIndex++) {
        let size: number = sizes[sizeIndex];
        let pages: number = catalog.pageCount(size);
        for (let pageIndex: number = 0; pageIndex < pages; pageIndex++) {
          let items: Goods[] = catalog.page(pageIndex, size);
          expect(items.length >= 0 && items.length <= size).assertTrue();
        }
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_PAGING_0470
     * @tc.name      paging_last_page_is_non_empty_for_every_size_047
     * @tc.desc      Verify paging last page is non empty for every size.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('paging_last_page_is_non_empty_for_every_size_047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: paging_last_page_is_non_empty_for_every_size_047');
      let sizes: number[] = [2, 3, 5, 6, 7, 9];
      for (let index: number = 0; index < sizes.length; index++) {
        let pages: number = catalog.pageCount(sizes[index]);
        let last: Goods[] = catalog.page(pages - 1, sizes[index]);
        expect(last.length > 0).assertTrue();
        expect(last[last.length - 1].id).assertEqual(15);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_PAGING_0480
     * @tc.name      paging_empty_catalog_accepts_an_oversized_page_048
     * @tc.desc      Verify paging empty catalog accepts an oversized page.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('paging_empty_catalog_accepts_an_oversized_page_048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: paging_empty_catalog_accepts_an_oversized_page_048');
      let empty: Catalog = new Catalog([]);
      let page: Goods[] = empty.page(0, 100);
      expect(page.length).assertEqual(0);
      let result: PagedResult<Goods> = new PagedResult<Goods>(page, 0, 100, empty.count());
      expect(result.hasNext()).assertFalse();
      expect(result.hasPrevious()).assertFalse();
      expect(result.count()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_PAGING_0490
     * @tc.name      paging_single_item_catalog_second_page_is_empty_049
     * @tc.desc      Verify paging single item catalog second page is empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('paging_single_item_catalog_second_page_is_empty_049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: paging_single_item_catalog_second_page_is_empty_049');
      let single: Catalog = new Catalog([
        createGoods(301, 'Lone Product', 500, CATEGORY_FOOD)
      ]);
      let first: Goods[] = single.page(0, 1);
      let second: Goods[] = single.page(1, 1);
      expect(first.length).assertEqual(1);
      expect(second.length).assertEqual(0);
      let result: PagedResult<Goods> = new PagedResult<Goods>(first, 0, 1, single.count());
      expect(result.hasNext()).assertFalse();
      expect(result.hasPrevious()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_PAGING_0500
     * @tc.name      paging_single_item_three_page_size_still_returns_it_050
     * @tc.desc      Verify paging single item three page size still returns it.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('paging_single_item_three_page_size_still_returns_it_050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: paging_single_item_three_page_size_still_returns_it_050');
      let single: Catalog = new Catalog([
        createGoods(302, 'Lone Product', 500, CATEGORY_FOOD)
      ]);
      let page: Goods[] = single.page(0, 3);
      expect(page.length).assertEqual(1);
      expect(page[0].id).assertEqual(302);
      expect(single.pageCount(3)).assertEqual(1);
      expect(single.page(1, 3).length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_PAGING_0510
     * @tc.name      paged_result_page_number_is_preserved_verbatim_051
     * @tc.desc      Verify paged result page number is preserved verbatim.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('paged_result_page_number_is_preserved_verbatim_051', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: paged_result_page_number_is_preserved_verbatim_051');
      let items: Goods[] = catalog.page(7, 2);
      let result: PagedResult<Goods> = new PagedResult<Goods>(items, 7, 2, catalog.count());
      expect(result.page).assertEqual(7);
      expect(result.size).assertEqual(2);
      expect(result.total).assertEqual(16);
      expect(result.hasPrevious()).assertTrue();
      expect(result.hasNext()).assertFalse();
      expect(result.items[1].id).assertEqual(15);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_PAGING_0520
     * @tc.name      paged_result_size_larger_than_total_has_no_next_for_page_zero_052
     * @tc.desc      Verify paged result size larger than total has no next for page zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('paged_result_size_larger_than_total_has_no_next_for_page_zero_052', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: paged_result_size_larger_than_total_still_has_next_for_page_zero');
      let items: Goods[] = catalog.page(0, 20);
      let result: PagedResult<Goods> = new PagedResult<Goods>(items, 0, 20, 16);
      expect(result.count()).assertEqual(16);
      expect(result.hasNext()).assertFalse();
      expect(result.hasPrevious()).assertFalse();
      expect((result.page + 1) * result.size).assertEqual(20);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_PAGING_0530
     * @tc.name      paged_result_has_next_for_a_partial_page_with_more_total_053
     * @tc.desc      Verify paged result has next for a partial page with more total.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('paged_result_has_next_for_a_partial_page_with_more_total_053', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: paged_result_has_next_for_a_partial_page_with_more_total_053');
      let items: Goods[] = catalog.page(2, 6);
      let result: PagedResult<Goods> = new PagedResult<Goods>(items, 2, 6, 20);
      expect(result.count()).assertEqual(4);
      expect(result.hasNext()).assertTrue();
      expect(result.hasPrevious()).assertTrue();
      expect((result.page + 1) * result.size).assertEqual(18);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_PAGING_0540
     * @tc.name      paged_result_total_equal_to_items_has_no_next_054
     * @tc.desc      Verify paged result total equal to items has no next.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('paged_result_total_equal_to_items_has_no_next_054', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: paged_result_total_equal_to_items_has_no_next_054');
      let items: Goods[] = catalog.page(0, 4);
      let result: PagedResult<Goods> = new PagedResult<Goods>(items, 0, 4, 4);
      expect(result.total).assertEqual(4);
      expect(result.count()).assertEqual(4);
      expect(result.hasNext()).assertFalse();
      expect(result.hasPrevious()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_PAGING_0550
     * @tc.name      paging_single_item_pages_sweep_every_identifier_055
     * @tc.desc      Verify paging single item pages sweep every identifier.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('paging_single_item_pages_sweep_every_identifier_055', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: paging_single_item_pages_sweep_every_identifier_055');
      let pages: number = catalog.pageCount(1);
      expect(pages).assertEqual(catalog.count());
      for (let pageIndex: number = 0; pageIndex < pages; pageIndex++) {
        let items: Goods[] = catalog.page(pageIndex, 1);
        expect(items.length).assertEqual(1);
        expect(items[0].id).assertEqual(pageIndex);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_PAGING_0560
     * @tc.name      paging_count_is_monotonic_as_the_size_grows_056
     * @tc.desc      Verify paging count is monotonic as the size grows.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('paging_count_is_monotonic_as_the_size_grows_056', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: paging_count_is_monotonic_as_the_size_grows_056');
      let sizes: number[] = [1, 4, 8, 16];
      // Page counts fall 16, 4, 2, 1 as the size grows 1, 4, 8, 16, and each value must be no
      // larger than the one before it.
      let expected: number[] = [16, 4, 2, 1];
      expect(sizes.length).assertEqual(expected.length);
      let previous: number = catalog.count() + 1;
      for (let index: number = 0; index < sizes.length; index++) {
        let count: number = catalog.pageCount(sizes[index]);
        expect(count).assertEqual(expected[index]);
        expect(count <= previous).assertTrue();
        previous = count;
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_PAGING_0570
     * @tc.name      paging_count_never_exceeds_the_item_count_057
     * @tc.desc      Verify paging count never exceeds the item count.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('paging_count_never_exceeds_the_item_count_057', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: paging_count_never_exceeds_the_item_count_057');
      for (let size: number = 1; size <= catalog.count(); size++) {
        let pages: number = catalog.pageCount(size);
        expect(pages >= 1 && pages <= catalog.count()).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_PAGING_0580
     * @tc.name      paging_window_start_advances_without_gaps_for_size_five_058
     * @tc.desc      Verify paging window start advances without gaps for size five.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('paging_window_start_advances_without_gaps_for_size_five_058', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: paging_window_start_advances_without_gaps_for_size_five_058');
      let pageSize: number = 5;
      let pages: number = catalog.pageCount(pageSize);
      // Each window must start one past the previous window's last id, so the size-5 walk
      // has no gap and finishes on id 15.
      let previousEnd: number = -1;
      for (let pageIndex: number = 0; pageIndex < pages; pageIndex++) {
        let items: Goods[] = catalog.page(pageIndex, pageSize);
        expect(items.length > 0).assertTrue();
        if (pageIndex === 0) {
          expect(items[0].id).assertEqual(0);
        } else {
          expect(items[0].id).assertEqual(previousEnd + 1);
        }
        previousEnd = items[items.length - 1].id;
      }
      expect(previousEnd).assertEqual(catalog.count() - 1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_PAGING_0590
     * @tc.name      paging_two_item_catalog_has_two_single_item_pages_059
     * @tc.desc      Verify paging two item catalog has two single item pages.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('paging_two_item_catalog_has_two_single_item_pages_059', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: paging_two_item_catalog_has_two_single_item_pages_059');
      let pair: Catalog = new Catalog([
        createGoods(400, 'First Pair Item', 1000, CATEGORY_PHONE),
        createGoods(401, 'Second Pair Item', 2000, CATEGORY_FOOD)
      ]);
      expect(pair.pageCount(1)).assertEqual(2);
      let first: Goods[] = pair.page(0, 1);
      let second: Goods[] = pair.page(1, 1);
      let after: Goods[] = pair.page(2, 1);
      expect(first[0].id).assertEqual(400);
      expect(second[0].id).assertEqual(401);
      expect(after.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_PAGING_0600
     * @tc.name      paging_two_item_catalog_with_size_two_fits_one_page_060
     * @tc.desc      Verify paging two item catalog with size two fits one page.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('paging_two_item_catalog_with_size_two_fits_one_page_060', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: paging_two_item_catalog_with_size_two_fits_one_page_060');
      let pair: Catalog = new Catalog([
        createGoods(402, 'Third Pair Item', 1000, CATEGORY_PHONE),
        createGoods(403, 'Fourth Pair Item', 2000, CATEGORY_FOOD)
      ]);
      expect(pair.pageCount(2)).assertEqual(1);
      let page: Goods[] = pair.page(0, 2);
      expect(page.length).assertEqual(2);
      expect(page[0].id).assertEqual(402);
      expect(page[1].id).assertEqual(403);
      expect(pair.page(1, 2).length).assertEqual(0);
      let result: PagedResult<Goods> = new PagedResult<Goods>(page, 0, 2, pair.count());
      expect(result.hasNext()).assertFalse();
      expect(result.hasPrevious()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_PAGING_0610
     * @tc.name      paging_two_item_catalog_count_is_one_for_larger_sizes_061
     * @tc.desc      Verify paging two item catalog count is one for larger sizes.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('paging_two_item_catalog_count_is_one_for_larger_sizes_061', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: paging_two_item_catalog_count_is_one_for_larger_sizes_061');
      let pair: Catalog = new Catalog([
        createGoods(404, 'Fifth Pair Item', 1000, CATEGORY_PHONE),
        createGoods(405, 'Sixth Pair Item', 2000, CATEGORY_FOOD)
      ]);
      let sizes: number[] = [3, 5, Number.MAX_SAFE_INTEGER];
      for (let index: number = 0; index < sizes.length; index++) {
        expect(pair.pageCount(sizes[index])).assertEqual(1);
        expect(pair.page(0, sizes[index]).length).assertEqual(pair.count());
        expect(pair.page(1, sizes[index]).length).assertEqual(0);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_PAGING_0620
     * @tc.name      paged_result_single_item_catalog_metadata_062
     * @tc.desc      Verify paged result single item catalog metadata.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('paged_result_single_item_catalog_metadata_062', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: paged_result_single_item_catalog_metadata_062');
      let single: Catalog = new Catalog([
        createGoods(406, 'Metadata Single', 700, CATEGORY_PHONE)
      ]);
      let items: Goods[] = single.page(0, 5);
      let result: PagedResult<Goods> = new PagedResult<Goods>(items, 0, 5, single.count());
      expect(items.length).assertEqual(1);
      expect(result.count()).assertEqual(1);
      expect(result.hasNext()).assertFalse();
      expect(result.hasPrevious()).assertFalse();
      expect(result.total).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_PAGING_0630
     * @tc.name      paged_result_has_next_walk_for_two_items_063
     * @tc.desc      Verify paged result has next walk for two items.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('paged_result_has_next_walk_for_two_items_063', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: paged_result_has_next_walk_for_two_items_063');
      let pair: Catalog = new Catalog([
        createGoods(407, 'Walk First Item', 1000, CATEGORY_PHONE),
        createGoods(408, 'Walk Second Item', 2000, CATEGORY_FOOD)
      ]);
      let expectedNext: boolean[] = [true, false];
      let expectedPrevious: boolean[] = [false, true];
      for (let pageIndex: number = 0; pageIndex < expectedNext.length; pageIndex++) {
        let items: Goods[] = pair.page(pageIndex, 1);
        let result: PagedResult<Goods> = new PagedResult<Goods>(items, pageIndex, 1, pair.count());
        expect(result.hasNext()).assertEqual(expectedNext[pageIndex]);
        expect(result.hasPrevious()).assertEqual(expectedPrevious[pageIndex]);
        expect(result.count()).assertEqual(1);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_PAGING_0640
     * @tc.name      paging_empty_catalog_page_at_maximum_page_number_is_empty_064
     * @tc.desc      Verify paging empty catalog page at maximum page number is empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('paging_empty_catalog_page_at_maximum_page_number_is_empty_064', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: paging_empty_catalog_page_at_maximum_page_number_is_empty_064');
      let empty: Catalog = new Catalog([]);
      let page: Goods[] = empty.page(Number.MAX_SAFE_INTEGER, 4);
      expect(page.length).assertEqual(0);
      let result: PagedResult<Goods> = new PagedResult<Goods>(page, Number.MAX_SAFE_INTEGER, 4,
        empty.count());
      expect(result.hasNext()).assertFalse();
      expect(result.hasPrevious()).assertTrue();
      expect(result.count()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_PAGING_0650
     * @tc.name      paging_empty_catalog_count_at_maximum_size_is_zero_065
     * @tc.desc      Verify paging empty catalog count at maximum size is zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('paging_empty_catalog_count_at_maximum_size_is_zero_065', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: paging_empty_catalog_count_at_maximum_size_is_zero_065');
      let empty: Catalog = new Catalog([]);
      expect(empty.pageCount(Number.MAX_SAFE_INTEGER)).assertEqual(0);
      expect(empty.page(0, Number.MAX_SAFE_INTEGER).length).assertEqual(0);
      expect(empty.page(Number.MAX_SAFE_INTEGER, Number.MAX_SAFE_INTEGER).length).assertEqual(0);
      expect(empty.count()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_PAGING_0660
     * @tc.name      paging_size_nine_splits_into_full_then_partial_066
     * @tc.desc      Verify paging size nine splits into full then partial.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('paging_size_nine_splits_into_full_then_partial_066', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: paging_size_nine_splits_into_full_then_partial_066');
      let first: Goods[] = catalog.page(0, 9);
      let second: Goods[] = catalog.page(1, 9);
      expect(catalog.pageCount(9)).assertEqual(2);
      expect(first.length).assertEqual(9);
      expect(second.length).assertEqual(7);
      expect(first[0].id).assertEqual(0);
      // Sixteen items in pages of nine give a full 9-item window then a 7-item remainder
      // that ends on id 15.
      expect(first[8].id).assertEqual(8);
      expect(second[0].id).assertEqual(9);
      expect(second[6].id).assertEqual(15);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_PAGING_0670
     * @tc.name      paging_size_six_windows_walk_the_catalog_in_order_067
     * @tc.desc      Verify paging size six windows walk the catalog in order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('paging_size_six_windows_walk_the_catalog_in_order_067', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: paging_size_six_windows_walk_the_catalog_in_order_067');
      let first: Goods[] = catalog.page(0, 6);
      let second: Goods[] = catalog.page(1, 6);
      let third: Goods[] = catalog.page(2, 6);
      expect(first.length).assertEqual(6);
      expect(second.length).assertEqual(6);
      expect(third.length).assertEqual(4);
      expect(first[0].id).assertEqual(0);
      expect(first[5].id).assertEqual(5);
      expect(second[0].id).assertEqual(6);
      expect(second[5].id).assertEqual(11);
      expect(third[0].id).assertEqual(12);
      expect(third[3].id).assertEqual(15);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_PAGING_0680
     * @tc.name      paging_size_five_has_three_full_pages_and_one_single_068
     * @tc.desc      Verify paging size five has three full pages and one single.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('paging_size_five_has_three_full_pages_and_one_single_068', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: paging_size_five_has_three_full_pages_and_one_single_068');
      let lengths: number[] = [];
      for (let pageIndex: number = 0; pageIndex < catalog.pageCount(5); pageIndex++) {
        lengths.push(catalog.page(pageIndex, 5).length);
      }
      expect((lengths).length).assertEqual(([5, 5, 5, 1]).length);
      for (let __i66: number = 0; __i66 < ([5, 5, 5, 1]).length; __i66++) {
        expect((lengths)[__i66]).assertEqual(([5, 5, 5, 1])[__i66]);
      }
      expect(catalog.pageCount(5)).assertEqual(4);
      expect(catalog.page(0, 5)[0].id).assertEqual(0);
      expect(catalog.page(3, 5)[0].id).assertEqual(15);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_PAGING_0690
     * @tc.name      paging_size_two_windows_sweep_every_identifier_069
     * @tc.desc      Verify paging size two windows sweep every identifier.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('paging_size_two_windows_sweep_every_identifier_069', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: paging_size_two_windows_sweep_every_identifier_069');
      let pages: number = catalog.pageCount(2);
      expect(pages).assertEqual(8);
      for (let pageIndex: number = 0; pageIndex < pages; pageIndex++) {
        let items: Goods[] = catalog.page(pageIndex, 2);
        expect(items.length).assertEqual(2);
        expect(items[0].id).assertEqual(pageIndex * 2);
        expect(items[1].id).assertEqual(pageIndex * 2 + 1);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CATALOG_PAGING_0700
     * @tc.name      paged_result_total_below_the_page_start_has_no_next_070
     * @tc.desc      Verify paged result total below the page start has no next.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('paged_result_total_below_the_page_start_has_no_next_070', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: paged_result_total_below_the_page_start_has_no_next_070');
      let items: Goods[] = catalog.page(3, 4);
      // Page 3 starts at 12, already past a total of 8, so hasNext is false even though the
      // formula still yields 16 for the next page start.
      let result: PagedResult<Goods> = new PagedResult<Goods>(items, 3, 4, 8);
      expect((result.page + 1) * result.size).assertEqual(16);
      expect(result.hasNext()).assertFalse();
      expect(result.hasPrevious()).assertTrue();
      expect(result.count()).assertEqual(4);
    });
  });
}
