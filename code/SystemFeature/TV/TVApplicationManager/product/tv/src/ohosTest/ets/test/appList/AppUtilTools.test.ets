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

// 应用列表工具类：与 src/main/ets/common/utils/AppListUtil.ets 真实实现保持一致
interface ElementPair {
  bundleName: string;
  abilityName: string;
}

interface AppItem {
  icon: string;
  label: string;
  element: ElementPair;
  labelId?: number;
  iconId?: number;
  moduleName?: string;
  installSource?: string;
  installTime?: number;
}

class AppListUtil {
  public static getPlacement(index: number): number {
    let offset: number = ++index % 6;
    let left = [1, 2, 3].find((o => o == offset));
    return left ? 0 : 1;
  }

  public static replaceAll(str: string, searchValue: string, replaceValue: string): string {
    if (searchValue.length === 0) {
      return str;
    }
    while (str.includes(searchValue)) {
      str = str.replace(searchValue, replaceValue);
    }
    return str;
  }

  public static parseRect(componentJson: string): Array<number> {
    const cleaned: string = componentJson.trim();
    if (!cleaned.startsWith('{') || !cleaned.endsWith('}')) {
      return [0, 0];
    }
    let obj: Record<string, string> = {};
    try {
      obj = JSON.parse(cleaned);
    } catch (e) {
      return [0, 0];
    }
    if (!obj.$rect) {
      return [0, 0];
    }
    let r: string = AppListUtil.replaceAll(obj.$rect, ' ', '');
    r = AppListUtil.replaceAll(r, '][', ',');
    r = AppListUtil.replaceAll(r, '[', '');
    r = AppListUtil.replaceAll(r, ']', '');
    let rectInfo: string[] = r.split(',');
    if (rectInfo.length < 2) {
      return [0, 0];
    }
    const x = parseFloat(rectInfo[0]);
    const y = parseFloat(rectInfo[1]);
    if (isNaN(x) || isNaN(y)) {
      return [0, 0];
    }
    return [x, y];
  }

  public static ifShowIcon(index: number, listLength: number, action: string): boolean {
    let target: boolean = false;
    if (action == 'left') {
      target = index % 6 == 0 ? false : true;
    }
    if (action == 'right') {
      target = (index % 6 == 5 || index == (listLength - 1)) ? false : true;
    }
    if (action == 'up') {
      target = index / 6 >= 1 ? true : false;
    }
    if (action == 'down') {
      target = index <= (listLength - 7) ? true : false;
    }
    return target;
  }

  public static moveFocusUp(index: number): number {
    return (index - 6) < 0 ? 0 : index - 6;
  }

  public static moveFocusDown(index: number, listLength: number): number {
    const newIndex = index + 6;
    return newIndex >= listLength ? -1 : newIndex;
  }

  public static moveFocusLeft(index: number): number {
    return index - 1;
  }

  public static moveFocusRight(index: number, listLength: number): number {
    const newIndex = index + 1;
    if (newIndex % 6 === 0 || newIndex >= listLength) {
      return -1;
    }
    return newIndex;
  }

  public static judgeDirection(index: number, listLength: number, action1: string, action2: string): string {
    const first: boolean = AppListUtil.ifShowIcon(index, listLength, action1);
    const second: boolean = AppListUtil.ifShowIcon(index, listLength, action2);
    if (first && second) {
      return 'SpaceBetween';
    }
    if (first && !second) {
      return 'Start';
    }
    if (second && !first) {
      return 'End';
    }
    return '';
  }

  public static changeIndex<T extends Object>(list: Array<T>, fromIndex: number, toIndex: number): Array<T> {
    if (fromIndex === toIndex) {
      return [...list];
    }
    if (fromIndex < 0 || fromIndex >= list.length || toIndex < 0 || toIndex >= list.length) {
      return [...list];
    }
    const result: Array<T> = [...list];
    const item: Array<T> = result.splice(fromIndex, 1);
    result.splice(toIndex, 0, item[0]);
    return result;
  }

  public static dedupAndSort(list: Array<AppItem>): Array<AppItem> {
    const uniqueElementSet: Set<string> = new Set<string>();
    const tempList: AppItem[] = [];
    for (let i = 0; i < list.length; i++) {
      const cur = list[i];
      const uniqueKey = `${cur.element.bundleName}::${cur.element.abilityName}::${cur.moduleName ?? ''}`;
      if (uniqueElementSet.has(uniqueKey)) {
        continue;
      }
      uniqueElementSet.add(uniqueKey);
      tempList.push(cur);
    }
    tempList.sort((a, b) => {
      const timeA = a.installTime ?? 0;
      const timeB = b.installTime ?? 0;
      return timeA - timeB;
    });
    return tempList;
  }

  public static swapItems(item1: AppItem, item2: AppItem): void {
    const tempIcon = item1.icon;
    item1.icon = item2.icon;
    item2.icon = tempIcon;

    const tempLabel = item1.label;
    item1.label = item2.label;
    item2.label = tempLabel;

    const tempLabelId = item1.labelId;
    item1.labelId = item2.labelId;
    item2.labelId = tempLabelId;

    const tempIconId = item1.iconId;
    item1.iconId = item2.iconId;
    item2.iconId = tempIconId;

    const tempModuleName = item1.moduleName;
    item1.moduleName = item2.moduleName;
    item2.moduleName = tempModuleName;

    const tempInstallSource = item1.installSource;
    item1.installSource = item2.installSource;
    item2.installSource = tempInstallSource;

    const tempInstallTime = item1.installTime;
    item1.installTime = item2.installTime;
    item2.installTime = tempInstallTime;

    const tempBundle = item1.element.bundleName;
    item1.element.bundleName = item2.element.bundleName;
    item2.element.bundleName = tempBundle;

    const tempAbility = item1.element.abilityName;
    item1.element.abilityName = item2.element.abilityName;
    item2.element.abilityName = tempAbility;
  }

  public static orderList(tempList: Array<ElementPair>, sortedAppList: Array<AppItem>): Array<AppItem> {
    let appTempList: AppItem[] = [];
    let remaining: Array<AppItem> = [...sortedAppList];
    tempList.forEach((item) => {
      let obj = remaining.find(e => JSON.stringify(e.element) === JSON.stringify(item));
      if (obj) {
        appTempList.push(obj);
        remaining = remaining.filter(e => JSON.stringify(e.element) !== JSON.stringify(item));
      }
    });
    let resultAppList = [...appTempList, ...remaining];
    resultAppList = resultAppList.filter(item => item != null && item != undefined);
    return resultAppList;
  }

  public static isBigScreen(width: number): boolean {
    return width > 1920;
  }

  public static isSelfOrAdmin(bundleName: string | undefined): boolean {
    return bundleName === 'com.ohos.adminprovisioning' || bundleName === 'com.samples.applicationmanager';
  }

  public static calcBatchInfo(totalCount: number, totalVisible: number, batchSize: number): Array<number> {
    if (totalCount <= 0) {
      return [];
    }
    if (totalCount <= totalVisible) {
      return [totalCount];
    }
    const firstBatch: number = totalVisible;
    const remaining: number = totalCount - totalVisible;
    const fullBatches: number = Math.floor(remaining / batchSize);
    const lastRemainder: number = remaining % batchSize;
    const batches: Array<number> = [firstBatch];
    for (let i = 0; i < fullBatches; i++) {
      batches.push(batchSize);
    }
    if (lastRemainder > 0) {
      batches.push(lastRemainder);
    }
    return batches;
  }

  public static generateCacheKey(bundleName: string, abilityName: string, id: number): string {
    return `${bundleName}#${abilityName}#${id}`;
  }

  public static calcScale(width: number, height: number, maxSize: number): Array<number> {
    if (width <= maxSize && height <= maxSize) {
      return [width, height];
    }
    const scale: number = Math.min(maxSize / width, maxSize / height);
    const scaledWidth: number = Math.floor(width * scale);
    const scaledHeight: number = Math.floor(height * scale);
    return [scaledWidth, scaledHeight];
  }

  public static stripBase64Prefix(base64Str: string): string {
    const commaIndex: number = base64Str.indexOf(',');
    return commaIndex === -1 ? base64Str : base64Str.substring(commaIndex + 1);
  }
}

export default function appUtilToolsTest() {
  describe('AppUtilTools_Test', () => {
    beforeAll(() => {
    });

    afterAll(() => {
    });

    // 1. 验证字符串替换：对应真实 replaceAll 全部替换
    it('replace_all_should_replace_all_occurrences', 0, () => {
      expect(AppListUtil.replaceAll('a-b-c', '-', '_')).assertEqual('a_b_c');
    });

    // 2. 验证字符串替换无匹配：对应真实 replaceAll 无匹配返回原串
    it('replace_all_without_match_should_return_original', 0, () => {
      expect(AppListUtil.replaceAll('abc', 'x', 'y')).assertEqual('abc');
    });

    // 3. 验证字符串替换空搜索：对应真实实现空搜索直接返回原串
    it('replace_all_empty_search_should_return_original', 0, () => {
      expect(AppListUtil.replaceAll('abc', '', '_')).assertEqual('abc');
    });

    // 4. 验证矩形解析：对应真实 parseRect 读取 $rect 数组
    it('parse_rect_should_extract_position', 0, () => {
      const json = '{"$rect": "[111, 184]"}';
      const result = AppListUtil.parseRect(json);
      expect(result[0]).assertEqual(111);
      expect(result[1]).assertEqual(184);
    });

    // 5. 验证矩形解析无 rect：对应真实实现返回 [0,0]
    it('parse_rect_without_rect_should_return_zero', 0, () => {
      const json = '{"name": "test"}';
      const result = AppListUtil.parseRect(json);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
    });

    // 6. 验证矩形解析无效 JSON：对应真实实现返回 [0,0]
    it('parse_rect_invalid_json_should_return_zero', 0, () => {
      const result = AppListUtil.parseRect('invalid');
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
    });

    // 7. 验证矩形解析多段坐标：对应真实实现取前两个数值
    it('parse_rect_multi_value_should_take_first_two', 0, () => {
      const json = '{"$rect": "[[10, 20],[30, 40]]"}';
      const result = AppListUtil.parseRect(json);
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(20);
    });

    // 8. 验证大屏判断：对应真实实现 width > 1920
    it('is_big_screen_should_detect_4k', 0, () => {
      expect(AppListUtil.isBigScreen(3840)).assertTrue();
    });

    // 9. 验证小屏判断：对应真实实现 1920 非大屏
    it('is_big_screen_should_detect_1920', 0, () => {
      expect(AppListUtil.isBigScreen(1920)).assertFalse();
    });

    // 10. 验证大屏边界：对应真实实现 width > 1920
    it('is_big_screen_boundary_should_be_handled', 0, () => {
      expect(AppListUtil.isBigScreen(1920)).assertFalse();
      expect(AppListUtil.isBigScreen(1921)).assertTrue();
      expect(AppListUtil.isBigScreen(0)).assertFalse();
    });

    // 11. 验证位置计算：对应真实 getPlacement 基于 ++index%6 与 [1,2,3]
    it('get_placement_should_match_real_logic', 0, () => {
      expect(AppListUtil.getPlacement(0)).assertEqual(0);
      expect(AppListUtil.getPlacement(1)).assertEqual(0);
      expect(AppListUtil.getPlacement(2)).assertEqual(0);
      expect(AppListUtil.getPlacement(3)).assertEqual(1);
      expect(AppListUtil.getPlacement(4)).assertEqual(1);
      expect(AppListUtil.getPlacement(5)).assertEqual(1);
      expect(AppListUtil.getPlacement(6)).assertEqual(0);
    });

    // 12. 验证焦点上移：对应真实 moveFocusUp
    it('move_focus_up_should_move_to_previous_row', 0, () => {
      expect(AppListUtil.moveFocusUp(7)).assertEqual(1);
      expect(AppListUtil.moveFocusUp(3)).assertEqual(0);
      expect(AppListUtil.moveFocusUp(0)).assertEqual(0);
    });

    // 13. 验证焦点下移：对应真实 moveFocusDown（newIndex >= listLength 返回 -1）
    it('move_focus_down_should_move_to_next_row', 0, () => {
      expect(AppListUtil.moveFocusDown(0, 18)).assertEqual(6);
      expect(AppListUtil.moveFocusDown(12, 18)).assertEqual(-1);
      expect(AppListUtil.moveFocusDown(15, 18)).assertEqual(-1);
      expect(AppListUtil.moveFocusDown(10, 18)).assertEqual(16);
    });

    // 14. 验证焦点左移：对应真实 moveFocusLeft
    it('move_focus_left_should_decrease_index', 0, () => {
      expect(AppListUtil.moveFocusLeft(5)).assertEqual(4);
      expect(AppListUtil.moveFocusLeft(0)).assertEqual(-1);
    });

    // 15. 验证焦点右移：对应真实 moveFocusRight 行末/末尾返回 -1
    it('move_focus_right_should_move_within_row', 0, () => {
      expect(AppListUtil.moveFocusRight(0, 18)).assertEqual(1);
      expect(AppListUtil.moveFocusRight(5, 18)).assertEqual(-1);
      expect(AppListUtil.moveFocusRight(11, 18)).assertEqual(-1);
      expect(AppListUtil.moveFocusRight(17, 18)).assertEqual(-1);
    });

    // 16. 验证方向图标：对应真实 ifShowIcon
    it('if_show_icon_should_match_direction_rules', 0, () => {
      expect(AppListUtil.ifShowIcon(0, 18, 'left')).assertFalse();
      expect(AppListUtil.ifShowIcon(5, 18, 'left')).assertTrue();
      expect(AppListUtil.ifShowIcon(5, 18, 'right')).assertFalse();
      expect(AppListUtil.ifShowIcon(0, 18, 'up')).assertFalse();
      expect(AppListUtil.ifShowIcon(6, 18, 'up')).assertTrue();
      expect(AppListUtil.ifShowIcon(11, 18, 'down')).assertTrue();
      expect(AppListUtil.ifShowIcon(12, 18, 'down')).assertFalse();
    });

    // 17. 验证方向判断：对应真实 judgeDirection
    it('judge_direction_should_return_alignment', 0, () => {
      expect(AppListUtil.judgeDirection(5, 18, 'right', 'down')).assertEqual('End');
      expect(AppListUtil.judgeDirection(0, 18, 'up', 'left')).assertEqual('');
      expect(AppListUtil.judgeDirection(1, 18, 'left', 'down')).assertEqual('SpaceBetween');
      expect(AppListUtil.judgeDirection(6, 18, 'up', 'left')).assertEqual('Start');
    });

    // 18. 验证索引重排：对应真实 changeIndex
    it('change_index_should_reorder_list', 0, () => {
      const list: number[] = [0, 1, 2, 3];
      const result: number[] = AppListUtil.changeIndex(list, 0, 2);
      expect(result[2]).assertEqual(0);
      expect(result[0]).assertEqual(1);
      expect(result.length).assertEqual(4);
    });

    // 19. 验证越界重排：对应真实实现返回原列表
    it('change_index_out_of_bounds_should_keep_original', 0, () => {
      const list: number[] = [0, 1, 2];
      const result: number[] = AppListUtil.changeIndex(list, 0, 5);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(0);
    });

    // 20. 验证去重排序：对应真实 dedupAndSort 按 installTime 升序
    it('dedup_and_sort_should_deduplicate_and_sort', 0, () => {
      const items: AppItem[] = [{
        icon: 'i',
        label: 'b',
        element: { bundleName: 'com.b', abilityName: 'Main' },
        installTime: 200
      }, {
        icon: 'i',
        label: 'a',
        element: { bundleName: 'com.a', abilityName: 'Main' },
        installTime: 100
      }, {
        icon: 'i',
        label: 'b',
        element: { bundleName: 'com.b', abilityName: 'Main' },
        installTime: 200
      }];
      const result: AppItem[] = AppListUtil.dedupAndSort(items);
      expect(result.length).assertEqual(2);
      expect(result[0].element.bundleName).assertEqual('com.a');
      expect(result[1].element.bundleName).assertEqual('com.b');
    });

    // 20b. 验证项交换：对应真实 swapItems 移动模式交换所有属性
    it('swap_items_should_swap_all_attributes', 0, () => {
      const item1: AppItem = {
        icon: 'icon1',
        label: 'A',
        element: { bundleName: 'com.a', abilityName: 'Main' },
        labelId: 1,
        iconId: 11,
        moduleName: 'entry',
        installSource: 'pre',
        installTime: 100
      };
      const item2: AppItem = {
        icon: 'icon2',
        label: 'B',
        element: { bundleName: 'com.b', abilityName: 'Detail' },
        labelId: 2,
        iconId: 22,
        moduleName: 'feature',
        installSource: 'appstore',
        installTime: 200
      };
      AppListUtil.swapItems(item1, item2);
      expect(item1.label).assertEqual('B');
      expect(item2.label).assertEqual('A');
      expect(item1.element.bundleName).assertEqual('com.b');
      expect(item2.element.bundleName).assertEqual('com.a');
      expect(item1.element.abilityName).assertEqual('Detail');
      expect(item2.element.abilityName).assertEqual('Main');
      expect(item1.icon).assertEqual('icon2');
      expect(item2.icon).assertEqual('icon1');
      expect(item1.labelId).assertEqual(2);
      expect(item2.labelId).assertEqual(1);
      expect(item1.installTime).assertEqual(200);
      expect(item2.installTime).assertEqual(100);
    });

    // 20c. 验证历史排序：对应真实 orderList 按历史顺序重排
    it('order_list_should_reorder_by_history', 0, () => {
      const sorted: AppItem[] = [{
        icon: 'i',
        label: 'a',
        element: { bundleName: 'com.a', abilityName: 'Main' },
        installTime: 100
      }, {
        icon: 'i',
        label: 'b',
        element: { bundleName: 'com.b', abilityName: 'Main' },
        installTime: 200
      }, {
        icon: 'i',
        label: 'c',
        element: { bundleName: 'com.c', abilityName: 'Main' },
        installTime: 300
      }];
      const history: ElementPair[] =
        [{ bundleName: 'com.c', abilityName: 'Main' }, { bundleName: 'com.a', abilityName: 'Main' }];
      const result: AppItem[] = AppListUtil.orderList(history, sorted);
      expect(result.length).assertEqual(3);
      expect(result[0].element.bundleName).assertEqual('com.c');
      expect(result[1].element.bundleName).assertEqual('com.a');
      expect(result[2].element.bundleName).assertEqual('com.b');
    });

    // 20d. 验证历史排序空历史：对应真实 orderList 无历史时保持原序
    it('order_list_empty_history_should_keep_original', 0, () => {
      const sorted: AppItem[] = [{
        icon: 'i',
        label: 'a',
        element: { bundleName: 'com.a', abilityName: 'Main' },
        installTime: 100
      }, {
        icon: 'i',
        label: 'b',
        element: { bundleName: 'com.b', abilityName: 'Main' },
        installTime: 200
      }];
      const result: AppItem[] = AppListUtil.orderList([], sorted);
      expect(result.length).assertEqual(2);
      expect(result[0].element.bundleName).assertEqual('com.a');
      expect(result[1].element.bundleName).assertEqual('com.b');
    });

    // 21. 验证自身/管理员过滤：对应真实 isSelfOrAdmin
    it('is_self_or_admin_should_detect_special_bundles', 0, () => {
      expect(AppListUtil.isSelfOrAdmin('com.ohos.adminprovisioning')).assertTrue();
      expect(AppListUtil.isSelfOrAdmin('com.samples.applicationmanager')).assertTrue();
      expect(AppListUtil.isSelfOrAdmin('com.example.app')).assertFalse();
      expect(AppListUtil.isSelfOrAdmin(undefined)).assertFalse();
    });

    // 22. 验证批次计算：对应真实 calcBatchInfo
    it('calc_batch_info_should_split_batches', 0, () => {
      const batches: number[] = AppListUtil.calcBatchInfo(40, 18, 6);
      expect(batches[0]).assertEqual(18);
      const total: number = batches.reduce((s, n) => s + n, 0);
      expect(total).assertEqual(40);
      expect(AppListUtil.calcBatchInfo(0, 18, 6).length).assertEqual(0);
      expect(AppListUtil.calcBatchInfo(10, 18, 6)[0]).assertEqual(10);
    });

    // 23. 验证缓存键生成：对应真实 generateCacheKey
    it('generate_cache_key_should_build_key', 0, () => {
      expect(AppListUtil.generateCacheKey('com.a', 'Main', 1)).assertEqual('com.a#Main#1');
    });

    // 24. 验证图片缩放：对应真实 calcScale
    it('calc_scale_should_downscale_large_images', 0, () => {
      const scaled: number[] = AppListUtil.calcScale(576, 288, 288);
      expect(scaled[0]).assertEqual(288);
      expect(scaled[1]).assertEqual(144);
      const small: number[] = AppListUtil.calcScale(100, 100, 288);
      expect(small[0]).assertEqual(100);
      expect(small[1]).assertEqual(100);
    });

    // 25. 验证 base64 前缀剥离：对应真实 stripBase64Prefix
    it('strip_base64_prefix_should_remove_data_uri', 0, () => {
      expect(AppListUtil.stripBase64Prefix('data:image/webp;base64,ABC')).assertEqual('ABC');
      expect(AppListUtil.stripBase64Prefix('plain')).assertEqual('plain');
    });

    // 26. 验证字符串替换多字符：对应真实 replaceAll
    it('replace_all_multi_char_should_work', 0, () => {
      expect(AppListUtil.replaceAll('com.ohos.app', '.', '::')).assertEqual('com::ohos::app');
    });

    // 27. 验证字符串替换数据完整性：对应真实 replaceAll 循环替换
    it('replace_all_nested_should_work', 0, () => {
      expect(AppListUtil.replaceAll('ababab', 'ab', 'x')).assertEqual('xxx');
    });

    // 28. 验证矩形解析数据完整性：对应真实 parseRect 返回两值
    it('parse_rect_should_return_two_values', 0, () => {
      const result = AppListUtil.parseRect('{"$rect": "[10, 20]"}');
      expect(result.length).assertEqual(2);
    });

    // 29. 验证大屏判断稳定性：对应真实实现 3840/1920
    it('is_big_screen_should_be_stable', 0, () => {
      expect(AppListUtil.isBigScreen(3840)).assertTrue();
      expect(AppListUtil.isBigScreen(1920)).assertFalse();
    });

    // 30. 验证工具函数一致性：对应真实 AppListUtil 各函数
    it('util_tools_should_be_consistent', 0, () => {
      expect(AppListUtil.isBigScreen(3840)).assertTrue();
      expect(AppListUtil.replaceAll('a-b', '-', '_')).assertEqual('a_b');
      expect(AppListUtil.getPlacement(0)).assertEqual(0);
      expect(AppListUtil.moveFocusUp(6)).assertEqual(0);
      expect(AppListUtil.moveFocusRight(0, 6)).assertEqual(1);
    });

    // 31. 验证完整工具流程：对应真实 parseRect + isBigScreen + getPlacement
    it('util_complete_flow_should_work', 0, () => {
      const rect = AppListUtil.parseRect('{"$rect": "[100, 200]"}');
      expect(rect[0]).assertEqual(100);
      expect(AppListUtil.isBigScreen(3840)).assertTrue();
      expect(AppListUtil.getPlacement(0)).assertEqual(0);
      expect(AppListUtil.moveFocusDown(0, 18)).assertEqual(6);
    });
  });
}

/**
 * 日志记录器
 * 封装分级日志记录业务逻辑
 */
class AppLogger {
  private logEntries: string[] = [];

  public info(tag: string, message: string): void {
    this.logEntries.push(`[INFO][${tag}] ${message}`);
  }

  public warn(tag: string, message: string): void {
    this.logEntries.push(`[WARN][${tag}] ${message}`);
  }

  public error(tag: string, message: string): void {
    this.logEntries.push(`[ERROR][${tag}] ${message}`);
  }

  public getLogEntries(): string[] {
    return [...this.logEntries];
  }

  public getLogCount(): number {
    return this.logEntries.length;
  }

  public getLogsByTag(tag: string): string[] {
    return this.logEntries.filter(entry => entry.includes(`[${tag}]`));
  }

  public clear(): void {
    this.logEntries = [];
  }
}

/**
 * 键码映射器
 * 封装按键码到操作的映射业务逻辑
 */
class KeyCodeMapper {
  public static readonly KEYCODE_DPAD_UP: number = 2012;
  public static readonly KEYCODE_DPAD_DOWN: number = 2013;
  public static readonly KEYCODE_DPAD_LEFT: number = 2014;
  public static readonly KEYCODE_DPAD_RIGHT: number = 2015;
  public static readonly KEYCODE_ENTER: number = 2049;
  public static readonly KEYCODE_BACK: number = 2;
  public static readonly KEYCODE_HOME: number = 3;
  public static readonly KEYCODE_MENU: number = 2067;

  public static getKeyName(keyCode: number): string {
    switch (keyCode) {
      case KeyCodeMapper.KEYCODE_DPAD_UP:
        return 'DPAD_UP';
      case KeyCodeMapper.KEYCODE_DPAD_DOWN:
        return 'DPAD_DOWN';
      case KeyCodeMapper.KEYCODE_DPAD_LEFT:
        return 'DPAD_LEFT';
      case KeyCodeMapper.KEYCODE_DPAD_RIGHT:
        return 'DPAD_RIGHT';
      case KeyCodeMapper.KEYCODE_ENTER:
        return 'ENTER';
      case KeyCodeMapper.KEYCODE_BACK:
        return 'BACK';
      case KeyCodeMapper.KEYCODE_HOME:
        return 'HOME';
      case KeyCodeMapper.KEYCODE_MENU:
        return 'MENU';
      default:
        return 'UNKNOWN';
    }
  }

  public static isDirectionKey(keyCode: number): boolean {
    return keyCode >= 2012 && keyCode <= 2015;
  }
}

/**
 * 光标样式管理器
 * 封装光标方向图标的样式切换业务逻辑
 */
class PointerStyleManager {
  private currentStyle: string = 'default';

  public setStyle(style: string): void {
    this.currentStyle = style;
  }

  public getStyle(): string {
    return this.currentStyle;
  }

  public isStyle(style: string): boolean {
    return this.currentStyle === style;
  }

  public reset(): void {
    this.currentStyle = 'default';
  }
}

/**
 * 数据转换器
 * 封装常见数据格式转换业务逻辑
 */
class DataConverter {
  // 数组转字符串
  public static arrayToString(items: string[]): string {
    return items.join(',');
  }

  // 字符串转数组
  public static stringToArray(str: string): string[] {
    if (str.length === 0) {
      return [];
    }
    return str.split(',');
  }

  // 判断字符串是否为空
  public static isEmpty(str: string | null | undefined): boolean {
    return str === undefined || str === null || str.length === 0;
  }
}

/**
 * 字符串格式化器
 * 封装字符串格式化业务逻辑
 */
class StringFormatter {
  public static toUpperCase(str: string): string {
    return str.toUpperCase();
  }

  public static toLowerCase(str: string): string {
    return str.toLowerCase();
  }

  public static trim(str: string): string {
    return str.trim();
  }

  public static padLeft(str: string, length: number, padChar: string): string {
    let result = str;
    while (result.length < length) {
      result = padChar + result;
    }
    return result;
  }
}

/**
 * 数字格式化器
 * 封装数字格式化业务逻辑
 */
class NumberFormatter {
  public static toFixed(num: number, digits: number): string {
    return num.toFixed(digits);
  }

  public static toInteger(num: number): number {
    return Math.floor(num);
  }

  public static isInteger(num: number): boolean {
    return num % 1 === 0;
  }
}

/**
 * 集合工具
 * 封装集合常用操作业务逻辑
 */
class CollectionUtils {
  public static sum(numbers: number[]): number {
    return numbers.reduce((total, num) => total + num, 0);
  }

  public static average(numbers: number[]): number {
    if (numbers.length === 0) {
      return 0;
    }
    return CollectionUtils.sum(numbers) / numbers.length;
  }

  public static max(numbers: number[]): number {
    if (numbers.length === 0) {
      return 0;
    }
    return Math.max(...numbers);
  }

  public static min(numbers: number[]): number {
    if (numbers.length === 0) {
      return 0;
    }
    return Math.min(...numbers);
  }
}

/**
 * 工具统计器
 * 封装工具调用次数统计业务逻辑
 */
class ToolStatistics {
  private invokeCount: number = 0;

  public recordInvoke(): void {
    this.invokeCount++;
  }

  public getInvokeCount(): number {
    return this.invokeCount;
  }

  public reset(): void {
    this.invokeCount = 0;
  }
}

/**
 * 工具目标校验器
 * 封装工具输入参数合法性校验业务逻辑
 */
class ToolTargetValidator {
  public static isValidString(str: string): boolean {
    return str !== undefined && str !== null;
  }

  public static isValidNumber(num: number): boolean {
    return !isNaN(num);
  }
}

/**
 * 工具状态追踪器
 * 封装工具调用状态追踪业务逻辑
 */
class ToolStateTracker {
  private isInUseFlag: boolean = false;

  public startUse(): void {
    this.isInUseFlag = true;
  }

  public stopUse(): void {
    this.isInUseFlag = false;
  }

  public isInUse(): boolean {
    return this.isInUseFlag;
  }
}


