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
import TabConfig from '../../../../main/ets/common/constants/TabsConfig';
import { TabItem } from '../../../../main/ets/common/bean/TabItem';

export default function tabConfigTest(): void {
  describe('TabConfigTest', () => {
    beforeAll(() => {
      console.info('[Suite] TabConfigTest start');
    });

    afterAll(() => {
      console.info('[Suite] TabConfigTest end');
    });

    it('tab_items_count_is_two', 0, () => {
      expect(
        TabConfig.tabItems.length
      ).assertEqual(
        2
      );
    });

    it('tab_first_index_is_zero', 0, () => {
      expect(
        TabConfig.tabItems[0].index
      ).assertEqual(
        0
      );
    });

    it('tab_second_index_is_one', 0, () => {
      expect(
        TabConfig.tabItems[1].index
      ).assertEqual(
        1
      );
    });

    it('tab_indexes_are_continuous', 0, () => {
      for (let i = 0; i < TabConfig.tabItems.length; i++) {
        expect(
          TabConfig.tabItems[i].index
        ).assertEqual(
          i
        );
      }
    });

    it('tab_title_resource_ids_are_valid', 0, () => {
      for (let i = 0; i < TabConfig.tabItems.length; i++) {
        expect(
          TabConfig.tabItems[i].title.id > 0
        ).assertTrue();
      }
    });

    it('tab_activated_icons_are_defined', 0, () => {
      for (let i = 0; i < TabConfig.tabItems.length; i++) {
        expect(
          TabConfig.tabItems[i].imageActivated.id > 0
        ).assertTrue();
      }
    });

    it('tab_normal_icons_are_defined', 0, () => {
      for (let i = 0; i < TabConfig.tabItems.length; i++) {
        expect(
          TabConfig.tabItems[i].imageOriginal.id > 0
        ).assertTrue();
      }
    });

    it('tab_icon_pairs_differ', 0, () => {
      for (let i = 0; i < TabConfig.tabItems.length; i++) {
        const item: TabItem = TabConfig.tabItems[i];
        expect(
          item.imageActivated.id === item.imageOriginal.id
        ).assertFalse();
      }
    });

    it('tab_titles_are_distinct_resources', 0, () => {
      expect(
        TabConfig.tabItems[0].title.id === TabConfig.tabItems[1].title.id
      ).assertFalse();
    });

    it('tab_items_are_tab_item_instances', 0, () => {
      for (let i = 0; i < TabConfig.tabItems.length; i++) {
        expect(
          TabConfig.tabItems[i] instanceof TabItem
        ).assertTrue();
      }
    });
  });
}
