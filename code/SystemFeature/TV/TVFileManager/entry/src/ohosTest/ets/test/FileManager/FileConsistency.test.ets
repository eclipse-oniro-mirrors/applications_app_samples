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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BasicDataSource } from '../../../../main/ets/component/adapter/BasicDataSource';
import FileDataSource from '../../../../main/ets/component/adapter/FileDataSource';
import ListPageAdapter from '../../../../main/ets/component/adapter/ListPageAdapter';
import { FileBean } from '../../../../main/ets/component/bean/FileBean';
import { createBean } from '../Shared/TestData';
import { Context } from '@kit.AbilityKit';

const DOMAIN: number = 0x0000;
const TAG: string = 'TVFileManagerTest';

export default function fileConsistencyTest() {
  describe('FileConsistency', () => {
    /*
     * Generic data source backs every lazy loaded list.
     */
    describe('FileConsistency_BasicDataSource_Generic_Access', () => {
      it('total_count_matches_array', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_count_matches_array');
        let source: BasicDataSource<number> = new BasicDataSource<number>([1, 2, 3]);
        expect(source.totalCount()).assertEqual(3);
      });

      it('get_data_returns_item', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: get_data_returns_item');
        let source: BasicDataSource<string> = new BasicDataSource<string>(['a', 'b']);
        expect(source.getData(1)).assertEqual('b');
      });

      it('empty_source_count_zero', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: empty_source_count_zero');
        let source: BasicDataSource<number> = new BasicDataSource<number>([]);
        expect(source.totalCount()).assertEqual(0);
      });

      it('notify_methods_exist', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: notify_methods_exist');
        let source: BasicDataSource<number> = new BasicDataSource<number>([]);
        expect(typeof source.notifyDataReload).assertEqual('function');
        expect(typeof source.notifyDataAdd).assertEqual('function');
        expect(typeof source.notifyDataChange).assertEqual('function');
        expect(typeof source.notifyDataDelete).assertEqual('function');
        expect(typeof source.notifyDataMove).assertEqual('function');
      });
    });

    /*
     * File rows are pushed, removed and renamed in place.
     */
    describe('FileConsistency_FileDataSource_Collection', () => {
      it('constructor_keeps_array', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: constructor_keeps_array');
        let source: FileDataSource = new FileDataSource({} as Context, [createBean('a.txt')]);
        expect(source.totalCount()).assertEqual(1);
      });

      it('push_appends_items', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: push_appends_items');
        let source: FileDataSource = new FileDataSource({} as Context, []);
        source.push([createBean('a.txt'), createBean('b.txt')]);
        expect(source.totalCount()).assertEqual(2);
      });

      it('find_returns_same_instance', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: find_returns_same_instance');
        let bean: FileBean = createBean('a.txt');
        let source: FileDataSource = new FileDataSource({} as Context, [bean]);
        expect(source.find(bean.id) === bean).assertTrue();
      });

      it('get_index_by_id', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: get_index_by_id');
        let bean: FileBean = createBean('a.txt');
        let source: FileDataSource = new FileDataSource({} as Context, [bean]);
        expect(source.getIndexById(bean.id)).assertEqual(0);
      });

      it('clear_empties_array', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: clear_empties_array');
        let source: FileDataSource = new FileDataSource({} as Context, [createBean('a.txt')]);
        source.clear();
        expect(source.totalCount()).assertEqual(0);
      });

      it('splice_removes_selected', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: splice_removes_selected');
        let bean: FileBean = createBean('a.txt');
        let source: FileDataSource = new FileDataSource({} as Context, [bean]);
        source.splice([bean]);
        expect(source.totalCount()).assertEqual(0);
      });

      it('rename_updates_row', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: rename_updates_row');
        let bean: FileBean = createBean('a.txt');
        let source: FileDataSource = new FileDataSource({} as Context, [bean]);
        source.rename([bean], 'b.txt');
        expect(source.getData(0).name).assertEqual('b.txt');
      });

      it('check_array_tracks_selection', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: check_array_tracks_selection');
        let bean: FileBean = createBean('a.txt');
        let source: FileDataSource = new FileDataSource({} as Context, []);
        source.checkArrayPush(0, bean);
        expect(source.getCheckArray().size).assertEqual(1);
        source.checkArrayRemove(0);
        expect(source.getCheckArray().size).assertEqual(0);
      });
    });

    /*
     * The adapter used by the media grid resets before every scan.
     */
    describe('FileConsistency_ListPageAdapter_Root_Push', () => {
      it('push_root_adds_items', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: push_root_adds_items');
        let adapter: ListPageAdapter = new ListPageAdapter({} as Context);
        adapter.pushRoot([createBean('a.mp4')]);
        expect(adapter.totalCount()).assertEqual(1);
      });

      it('clear_removes_items', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: clear_removes_items');
        let adapter: ListPageAdapter = new ListPageAdapter({} as Context);
        adapter.pushRoot([createBean('a.mp4')]);
        adapter.clear();
        expect(adapter.totalCount()).assertEqual(0);
      });
    });

    /*
     * Extended boundary, type and matrix coverage for FileConsistency derived from the reference suite.
     */
    describe('FileConsistency_Extended_Coverage', () => {
      it('datasource_basic_matrix_0', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: datasource_basic_matrix_0');
        let list: number[] = [];
        for (let i = 0; i < 0; i++) {
          list.push(i);
        }
        let source: BasicDataSource<number> = new BasicDataSource<number>(list);
        expect(source.totalCount()).assertEqual(list.length);
      });

      it('datasource_file_matrix_1', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: datasource_file_matrix_1');
        let source: FileDataSource = new FileDataSource({} as Context, []);
        for (let i = 0; i < 1; i++) {
          source.push([createBean('m' + i + '.txt')]);
        }
        expect(source.totalCount()).assertEqual(1);
      });

      it('datasource_index_matrix_2', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: datasource_index_matrix_2');
        let bean: FileBean = createBean('idx2.txt');
        let source: FileDataSource = new FileDataSource({} as Context, [bean]);
        expect(source.getIndexById(bean.id)).assertEqual(0);
        expect(source.find(bean.id) !== undefined).assertTrue();
      });

      it('datasource_check_matrix_3', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: datasource_check_matrix_3');
        let bean: FileBean = createBean('chk3.txt');
        let source: FileDataSource = new FileDataSource({} as Context, []);
        source.checkArrayPush(3, bean);
        expect(source.getCheckArray().get(3) === bean).assertTrue();
        source.checkArrayRemove(3);
        expect(source.getCheckArray().size).assertEqual(0);
      });

      it('datasource_basic_matrix_4', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: datasource_basic_matrix_4');
        let list: number[] = [];
        for (let i = 0; i < 4; i++) {
          list.push(i);
        }
        let source: BasicDataSource<number> = new BasicDataSource<number>(list);
        expect(source.totalCount()).assertEqual(list.length);
      });

      it('datasource_file_matrix_5', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: datasource_file_matrix_5');
        let source: FileDataSource = new FileDataSource({} as Context, []);
        for (let i = 0; i < 0; i++) {
          source.push([createBean('m' + i + '.txt')]);
        }
        expect(source.totalCount()).assertEqual(0);
      });

      it('datasource_index_matrix_6', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: datasource_index_matrix_6');
        let bean: FileBean = createBean('idx6.txt');
        let source: FileDataSource = new FileDataSource({} as Context, [bean]);
        expect(source.getIndexById(bean.id)).assertEqual(0);
        expect(source.find(bean.id) !== undefined).assertTrue();
      });

      it('datasource_check_matrix_7', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: datasource_check_matrix_7');
        let bean: FileBean = createBean('chk7.txt');
        let source: FileDataSource = new FileDataSource({} as Context, []);
        source.checkArrayPush(7, bean);
        expect(source.getCheckArray().get(7) === bean).assertTrue();
        source.checkArrayRemove(7);
        expect(source.getCheckArray().size).assertEqual(0);
      });

      it('datasource_basic_matrix_8', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: datasource_basic_matrix_8');
        let list: number[] = [];
        for (let i = 0; i < 1; i++) {
          list.push(i);
        }
        let source: BasicDataSource<number> = new BasicDataSource<number>(list);
        expect(source.totalCount()).assertEqual(list.length);
      });

      it('datasource_file_matrix_9', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: datasource_file_matrix_9');
        let source: FileDataSource = new FileDataSource({} as Context, []);
        for (let i = 0; i < 4; i++) {
          source.push([createBean('m' + i + '.txt')]);
        }
        expect(source.totalCount()).assertEqual(4);
      });

      it('datasource_index_matrix_10', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: datasource_index_matrix_10');
        let bean: FileBean = createBean('idx10.txt');
        let source: FileDataSource = new FileDataSource({} as Context, [bean]);
        expect(source.getIndexById(bean.id)).assertEqual(0);
        expect(source.find(bean.id) !== undefined).assertTrue();
      });

      it('datasource_check_matrix_11', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: datasource_check_matrix_11');
        let bean: FileBean = createBean('chk11.txt');
        let source: FileDataSource = new FileDataSource({} as Context, []);
        source.checkArrayPush(11, bean);
        expect(source.getCheckArray().get(11) === bean).assertTrue();
        source.checkArrayRemove(11);
        expect(source.getCheckArray().size).assertEqual(0);
      });

      it('datasource_basic_matrix_12', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: datasource_basic_matrix_12');
        let list: number[] = [];
        for (let i = 0; i < 5; i++) {
          list.push(i);
        }
        let source: BasicDataSource<number> = new BasicDataSource<number>(list);
        expect(source.totalCount()).assertEqual(list.length);
      });

      it('datasource_file_matrix_13', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: datasource_file_matrix_13');
        let source: FileDataSource = new FileDataSource({} as Context, []);
        for (let i = 0; i < 3; i++) {
          source.push([createBean('m' + i + '.txt')]);
        }
        expect(source.totalCount()).assertEqual(3);
      });

      it('datasource_index_matrix_14', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: datasource_index_matrix_14');
        let bean: FileBean = createBean('idx14.txt');
        let source: FileDataSource = new FileDataSource({} as Context, [bean]);
        expect(source.getIndexById(bean.id)).assertEqual(0);
        expect(source.find(bean.id) !== undefined).assertTrue();
      });

      it('datasource_check_matrix_15', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: datasource_check_matrix_15');
        let bean: FileBean = createBean('chk15.txt');
        let source: FileDataSource = new FileDataSource({} as Context, []);
        source.checkArrayPush(15, bean);
        expect(source.getCheckArray().get(15) === bean).assertTrue();
        source.checkArrayRemove(15);
        expect(source.getCheckArray().size).assertEqual(0);
      });

      it('datasource_basic_matrix_16', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: datasource_basic_matrix_16');
        let list: number[] = [];
        for (let i = 0; i < 2; i++) {
          list.push(i);
        }
        let source: BasicDataSource<number> = new BasicDataSource<number>(list);
        expect(source.totalCount()).assertEqual(list.length);
      });

      it('datasource_file_matrix_17', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: datasource_file_matrix_17');
        let source: FileDataSource = new FileDataSource({} as Context, []);
        for (let i = 0; i < 2; i++) {
          source.push([createBean('m' + i + '.txt')]);
        }
        expect(source.totalCount()).assertEqual(2);
      });

      it('datasource_index_matrix_18', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: datasource_index_matrix_18');
        let bean: FileBean = createBean('idx18.txt');
        let source: FileDataSource = new FileDataSource({} as Context, [bean]);
        expect(source.getIndexById(bean.id)).assertEqual(0);
        expect(source.find(bean.id) !== undefined).assertTrue();
      });

      it('datasource_check_matrix_19', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: datasource_check_matrix_19');
        let bean: FileBean = createBean('chk19.txt');
        let source: FileDataSource = new FileDataSource({} as Context, []);
        source.checkArrayPush(19, bean);
        expect(source.getCheckArray().get(19) === bean).assertTrue();
        source.checkArrayRemove(19);
        expect(source.getCheckArray().size).assertEqual(0);
      });

      it('datasource_basic_matrix_20', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: datasource_basic_matrix_20');
        let list: number[] = [];
        for (let i = 0; i < 6; i++) {
          list.push(i);
        }
        let source: BasicDataSource<number> = new BasicDataSource<number>(list);
        expect(source.totalCount()).assertEqual(list.length);
      });

      it('datasource_file_matrix_21', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: datasource_file_matrix_21');
        let source: FileDataSource = new FileDataSource({} as Context, []);
        for (let i = 0; i < 1; i++) {
          source.push([createBean('m' + i + '.txt')]);
        }
        expect(source.totalCount()).assertEqual(1);
      });

      it('datasource_index_matrix_22', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: datasource_index_matrix_22');
        let bean: FileBean = createBean('idx22.txt');
        let source: FileDataSource = new FileDataSource({} as Context, [bean]);
        expect(source.getIndexById(bean.id)).assertEqual(0);
        expect(source.find(bean.id) !== undefined).assertTrue();
      });

      it('datasource_check_matrix_23', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: datasource_check_matrix_23');
        let bean: FileBean = createBean('chk23.txt');
        let source: FileDataSource = new FileDataSource({} as Context, []);
        source.checkArrayPush(23, bean);
        expect(source.getCheckArray().get(23) === bean).assertTrue();
        source.checkArrayRemove(23);
        expect(source.getCheckArray().size).assertEqual(0);
      });

      it('datasource_basic_matrix_24', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: datasource_basic_matrix_24');
        let list: number[] = [];
        for (let i = 0; i < 3; i++) {
          list.push(i);
        }
        let source: BasicDataSource<number> = new BasicDataSource<number>(list);
        expect(source.totalCount()).assertEqual(list.length);
      });

      it('datasource_file_matrix_25', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: datasource_file_matrix_25');
        let source: FileDataSource = new FileDataSource({} as Context, []);
        for (let i = 0; i < 0; i++) {
          source.push([createBean('m' + i + '.txt')]);
        }
        expect(source.totalCount()).assertEqual(0);
      });

      it('datasource_index_matrix_26', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: datasource_index_matrix_26');
        let bean: FileBean = createBean('idx26.txt');
        let source: FileDataSource = new FileDataSource({} as Context, [bean]);
        expect(source.getIndexById(bean.id)).assertEqual(0);
        expect(source.find(bean.id) !== undefined).assertTrue();
      });

      it('datasource_check_matrix_27', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: datasource_check_matrix_27');
        let bean: FileBean = createBean('chk27.txt');
        let source: FileDataSource = new FileDataSource({} as Context, []);
        source.checkArrayPush(27, bean);
        expect(source.getCheckArray().get(27) === bean).assertTrue();
        source.checkArrayRemove(27);
        expect(source.getCheckArray().size).assertEqual(0);
      });

      it('datasource_basic_matrix_28', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: datasource_basic_matrix_28');
        let list: number[] = [];
        for (let i = 0; i < 0; i++) {
          list.push(i);
        }
        let source: BasicDataSource<number> = new BasicDataSource<number>(list);
        expect(source.totalCount()).assertEqual(list.length);
      });

      it('datasource_file_matrix_29', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: datasource_file_matrix_29');
        let source: FileDataSource = new FileDataSource({} as Context, []);
        for (let i = 0; i < 4; i++) {
          source.push([createBean('m' + i + '.txt')]);
        }
        expect(source.totalCount()).assertEqual(4);
      });

      it('datasource_index_matrix_30', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: datasource_index_matrix_30');
        let bean: FileBean = createBean('idx30.txt');
        let source: FileDataSource = new FileDataSource({} as Context, [bean]);
        expect(source.getIndexById(bean.id)).assertEqual(0);
        expect(source.find(bean.id) !== undefined).assertTrue();
      });

      it('datasource_check_matrix_31', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: datasource_check_matrix_31');
        let bean: FileBean = createBean('chk31.txt');
        let source: FileDataSource = new FileDataSource({} as Context, []);
        source.checkArrayPush(31, bean);
        expect(source.getCheckArray().get(31) === bean).assertTrue();
        source.checkArrayRemove(31);
        expect(source.getCheckArray().size).assertEqual(0);
      });

      it('datasource_basic_matrix_32', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: datasource_basic_matrix_32');
        let list: number[] = [];
        for (let i = 0; i < 4; i++) {
          list.push(i);
        }
        let source: BasicDataSource<number> = new BasicDataSource<number>(list);
        expect(source.totalCount()).assertEqual(list.length);
      });

      it('datasource_file_matrix_33', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: datasource_file_matrix_33');
        let source: FileDataSource = new FileDataSource({} as Context, []);
        for (let i = 0; i < 3; i++) {
          source.push([createBean('m' + i + '.txt')]);
        }
        expect(source.totalCount()).assertEqual(3);
      });

      it('datasource_index_matrix_34', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: datasource_index_matrix_34');
        let bean: FileBean = createBean('idx34.txt');
        let source: FileDataSource = new FileDataSource({} as Context, [bean]);
        expect(source.getIndexById(bean.id)).assertEqual(0);
        expect(source.find(bean.id) !== undefined).assertTrue();
      });

      it('datasource_check_matrix_35', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: datasource_check_matrix_35');
        let bean: FileBean = createBean('chk35.txt');
        let source: FileDataSource = new FileDataSource({} as Context, []);
        source.checkArrayPush(35, bean);
        expect(source.getCheckArray().get(35) === bean).assertTrue();
        source.checkArrayRemove(35);
        expect(source.getCheckArray().size).assertEqual(0);
      });

      it('datasource_basic_matrix_36', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: datasource_basic_matrix_36');
        let list: number[] = [];
        for (let i = 0; i < 1; i++) {
          list.push(i);
        }
        let source: BasicDataSource<number> = new BasicDataSource<number>(list);
        expect(source.totalCount()).assertEqual(list.length);
      });

      it('datasource_file_matrix_37', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: datasource_file_matrix_37');
        let source: FileDataSource = new FileDataSource({} as Context, []);
        for (let i = 0; i < 2; i++) {
          source.push([createBean('m' + i + '.txt')]);
        }
        expect(source.totalCount()).assertEqual(2);
      });

      it('datasource_index_matrix_38', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: datasource_index_matrix_38');
        let bean: FileBean = createBean('idx38.txt');
        let source: FileDataSource = new FileDataSource({} as Context, [bean]);
        expect(source.getIndexById(bean.id)).assertEqual(0);
        expect(source.find(bean.id) !== undefined).assertTrue();
      });

      it('datasource_check_matrix_39', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: datasource_check_matrix_39');
        let bean: FileBean = createBean('chk39.txt');
        let source: FileDataSource = new FileDataSource({} as Context, []);
        source.checkArrayPush(39, bean);
        expect(source.getCheckArray().get(39) === bean).assertTrue();
        source.checkArrayRemove(39);
        expect(source.getCheckArray().size).assertEqual(0);
      });

      it('datasource_basic_matrix_40', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: datasource_basic_matrix_40');
        let list: number[] = [];
        for (let i = 0; i < 5; i++) {
          list.push(i);
        }
        let source: BasicDataSource<number> = new BasicDataSource<number>(list);
        expect(source.totalCount()).assertEqual(list.length);
      });

      it('datasource_file_matrix_41', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: datasource_file_matrix_41');
        let source: FileDataSource = new FileDataSource({} as Context, []);
        for (let i = 0; i < 1; i++) {
          source.push([createBean('m' + i + '.txt')]);
        }
        expect(source.totalCount()).assertEqual(1);
      });

      it('datasource_index_matrix_42', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: datasource_index_matrix_42');
        let bean: FileBean = createBean('idx42.txt');
        let source: FileDataSource = new FileDataSource({} as Context, [bean]);
        expect(source.getIndexById(bean.id)).assertEqual(0);
        expect(source.find(bean.id) !== undefined).assertTrue();
      });

      it('datasource_check_matrix_43', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: datasource_check_matrix_43');
        let bean: FileBean = createBean('chk43.txt');
        let source: FileDataSource = new FileDataSource({} as Context, []);
        source.checkArrayPush(43, bean);
        expect(source.getCheckArray().get(43) === bean).assertTrue();
        source.checkArrayRemove(43);
        expect(source.getCheckArray().size).assertEqual(0);
      });

      it('datasource_basic_matrix_44', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: datasource_basic_matrix_44');
        let list: number[] = [];
        for (let i = 0; i < 2; i++) {
          list.push(i);
        }
        let source: BasicDataSource<number> = new BasicDataSource<number>(list);
        expect(source.totalCount()).assertEqual(list.length);
      });
    });
  });
}
