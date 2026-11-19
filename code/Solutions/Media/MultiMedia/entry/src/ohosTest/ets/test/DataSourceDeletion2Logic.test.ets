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

import { beforeEach, describe, expect, it } from '@ohos/hypium';
import { LogicTestLog } from '../utils/LogicTestLog';
import MediaDataSource from '../../../main/ets/view/BasicDataSource';
import type { MediaData } from '../../../main/ets/view/BasicDataSource';
import { createMediaRows, DataSourceProbe } from '../utils/DataSourceFakes';

export default function DataSourceDeletion2Logic(): void {
  describe('DataSourceDeletion2Logic', (): void => {
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void): void => {
        setTimeout(resolve, 1);
      });
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1119
     * @tc.name MultiMedia_Delete_1119
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1119', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1119';
      LogicTestLog.begin(name, 'length=3;index=-5;remove=6');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(3, 303, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(-5, 6);
      LogicTestLog.number(name, 'remaining total', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      LogicTestLog.number(name, 'aliased delete length', 0, original.length);
      expect(original.length).assertEqual(0);
      LogicTestLog.value(name, 'delete preserves array', String(true), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(true);
      LogicTestLog.number(name, 'delete does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      LogicTestLog.value(name, 'remaining URI order',
        String(''),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual('');
      LogicTestLog.value(name, 'remaining name order',
        String(''),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual('');
      source.notifyDataReload();
      LogicTestLog.value(name, 'manual reload after range delete', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      source.pushData(createMediaRows(1, 902, 1)[0]);
      LogicTestLog.number(name, 'append after range delete', 1, source.totalCount());
      expect(source.totalCount()).assertEqual(1);
      LogicTestLog.value(name, 'new final item', String('/logic/item-902'), String(source.getData(0).uri));
      expect(source.getData(0).uri).assertEqual('/logic/item-902');
      LogicTestLog.value(name, 'post-delete event sequence', String('reload|add:0'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload|add:0');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1121
     * @tc.name MultiMedia_Delete_1121
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1121', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1121';
      LogicTestLog.begin(name, 'length=3;index=-1;remove=0');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(3, 303, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(-1, 0);
      LogicTestLog.number(name, 'remaining total', 3, source.totalCount());
      expect(source.totalCount()).assertEqual(3);
      LogicTestLog.number(name, 'aliased delete length', 3, original.length);
      expect(original.length).assertEqual(3);
      LogicTestLog.value(name, 'delete preserves array', String(true), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(true);
      LogicTestLog.number(name, 'delete does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      LogicTestLog.value(name, 'remaining URI order',
        String('/logic/item-303|/logic/item-304|/logic/item-305'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(
        '/logic/item-303|/logic/item-304|/logic/item-305');
      LogicTestLog.value(name, 'remaining name order',
        String('item-303|item-304|item-305'),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        'item-303|item-304|item-305');
      source.notifyDataReload();
      LogicTestLog.value(name, 'manual reload after range delete', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      source.pushData(createMediaRows(1, 902, 1)[0]);
      LogicTestLog.number(name, 'append after range delete', 4, source.totalCount());
      expect(source.totalCount()).assertEqual(4);
      LogicTestLog.value(name, 'new final item', String('/logic/item-902'), String(source.getData(3).uri));
      expect(source.getData(3).uri).assertEqual('/logic/item-902');
      LogicTestLog.value(name, 'post-delete event sequence', String('reload|add:3'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload|add:3');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1122
     * @tc.name MultiMedia_Delete_1122
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1122', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1122';
      LogicTestLog.begin(name, 'length=3;index=-1;remove=2');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(3, 303, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(-1, 2);
      LogicTestLog.number(name, 'remaining total', 2, source.totalCount());
      expect(source.totalCount()).assertEqual(2);
      LogicTestLog.number(name, 'aliased delete length', 2, original.length);
      expect(original.length).assertEqual(2);
      LogicTestLog.value(name, 'delete preserves array', String(true), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(true);
      LogicTestLog.number(name, 'delete does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      LogicTestLog.value(name, 'remaining URI order',
        String('/logic/item-303|/logic/item-304'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(
        '/logic/item-303|/logic/item-304');
      LogicTestLog.value(name, 'remaining name order',
        String('item-303|item-304'),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        'item-303|item-304');
      source.notifyDataReload();
      LogicTestLog.value(name, 'manual reload after range delete', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      source.pushData(createMediaRows(1, 902, 1)[0]);
      LogicTestLog.number(name, 'append after range delete', 3, source.totalCount());
      expect(source.totalCount()).assertEqual(3);
      LogicTestLog.value(name, 'new final item', String('/logic/item-902'), String(source.getData(2).uri));
      expect(source.getData(2).uri).assertEqual('/logic/item-902');
      LogicTestLog.value(name, 'post-delete event sequence', String('reload|add:2'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload|add:2');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1123
     * @tc.name MultiMedia_Delete_1123
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1123', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1123';
      LogicTestLog.begin(name, 'length=3;index=-1;remove=6');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(3, 303, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(-1, 6);
      LogicTestLog.number(name, 'remaining total', 2, source.totalCount());
      expect(source.totalCount()).assertEqual(2);
      LogicTestLog.number(name, 'aliased delete length', 2, original.length);
      expect(original.length).assertEqual(2);
      LogicTestLog.value(name, 'delete preserves array', String(true), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(true);
      LogicTestLog.number(name, 'delete does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      LogicTestLog.value(name, 'remaining URI order',
        String('/logic/item-303|/logic/item-304'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(
        '/logic/item-303|/logic/item-304');
      LogicTestLog.value(name, 'remaining name order',
        String('item-303|item-304'),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        'item-303|item-304');
      source.notifyDataReload();
      LogicTestLog.value(name, 'manual reload after range delete', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      source.pushData(createMediaRows(1, 902, 1)[0]);
      LogicTestLog.number(name, 'append after range delete', 3, source.totalCount());
      expect(source.totalCount()).assertEqual(3);
      LogicTestLog.value(name, 'new final item', String('/logic/item-902'), String(source.getData(2).uri));
      expect(source.getData(2).uri).assertEqual('/logic/item-902');
      LogicTestLog.value(name, 'post-delete event sequence', String('reload|add:2'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload|add:2');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1125
     * @tc.name MultiMedia_Delete_1125
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1125', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1125';
      LogicTestLog.begin(name, 'length=3;index=-0.75;remove=-1');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(3, 303, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(-0.75, -1);
      LogicTestLog.number(name, 'remaining total', 3, source.totalCount());
      expect(source.totalCount()).assertEqual(3);
      LogicTestLog.number(name, 'aliased delete length', 3, original.length);
      expect(original.length).assertEqual(3);
      LogicTestLog.value(name, 'delete preserves array', String(true), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(true);
      LogicTestLog.number(name, 'delete does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      LogicTestLog.value(name, 'remaining URI order',
        String('/logic/item-303|/logic/item-304|/logic/item-305'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(
        '/logic/item-303|/logic/item-304|/logic/item-305');
      LogicTestLog.value(name, 'remaining name order',
        String('item-303|item-304|item-305'),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        'item-303|item-304|item-305');
      source.notifyDataReload();
      LogicTestLog.value(name, 'manual reload after range delete', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      source.pushData(createMediaRows(1, 902, 1)[0]);
      LogicTestLog.number(name, 'append after range delete', 4, source.totalCount());
      expect(source.totalCount()).assertEqual(4);
      LogicTestLog.value(name, 'new final item', String('/logic/item-902'), String(source.getData(3).uri));
      expect(source.getData(3).uri).assertEqual('/logic/item-902');
      LogicTestLog.value(name, 'post-delete event sequence', String('reload|add:3'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload|add:3');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1126
     * @tc.name MultiMedia_Delete_1126
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1126', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1126';
      LogicTestLog.begin(name, 'length=3;index=-0.75;remove=1');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(3, 303, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(-0.75, 1);
      LogicTestLog.number(name, 'remaining total', 2, source.totalCount());
      expect(source.totalCount()).assertEqual(2);
      LogicTestLog.number(name, 'aliased delete length', 2, original.length);
      expect(original.length).assertEqual(2);
      LogicTestLog.value(name, 'delete preserves array', String(true), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(true);
      LogicTestLog.number(name, 'delete does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      LogicTestLog.value(name, 'remaining URI order',
        String('/logic/item-304|/logic/item-305'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(
        '/logic/item-304|/logic/item-305');
      LogicTestLog.value(name, 'remaining name order',
        String('item-304|item-305'),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        'item-304|item-305');
      source.notifyDataReload();
      LogicTestLog.value(name, 'manual reload after range delete', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      source.pushData(createMediaRows(1, 902, 1)[0]);
      LogicTestLog.number(name, 'append after range delete', 3, source.totalCount());
      expect(source.totalCount()).assertEqual(3);
      LogicTestLog.value(name, 'new final item', String('/logic/item-902'), String(source.getData(2).uri));
      expect(source.getData(2).uri).assertEqual('/logic/item-902');
      LogicTestLog.value(name, 'post-delete event sequence', String('reload|add:2'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload|add:2');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1127
     * @tc.name MultiMedia_Delete_1127
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1127', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1127';
      LogicTestLog.begin(name, 'length=3;index=-0.75;remove=6');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(3, 303, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(-0.75, 6);
      LogicTestLog.number(name, 'remaining total', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      LogicTestLog.number(name, 'aliased delete length', 0, original.length);
      expect(original.length).assertEqual(0);
      LogicTestLog.value(name, 'delete preserves array', String(true), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(true);
      LogicTestLog.number(name, 'delete does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      LogicTestLog.value(name, 'remaining URI order',
        String(''),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual('');
      LogicTestLog.value(name, 'remaining name order',
        String(''),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual('');
      source.notifyDataReload();
      LogicTestLog.value(name, 'manual reload after range delete', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      source.pushData(createMediaRows(1, 902, 1)[0]);
      LogicTestLog.number(name, 'append after range delete', 1, source.totalCount());
      expect(source.totalCount()).assertEqual(1);
      LogicTestLog.value(name, 'new final item', String('/logic/item-902'), String(source.getData(0).uri));
      expect(source.getData(0).uri).assertEqual('/logic/item-902');
      LogicTestLog.value(name, 'post-delete event sequence', String('reload|add:0'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload|add:0');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1129
     * @tc.name MultiMedia_Delete_1129
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1129', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1129';
      LogicTestLog.begin(name, 'length=3;index=0;remove=-1');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(3, 303, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(0, -1);
      LogicTestLog.number(name, 'remaining total', 3, source.totalCount());
      expect(source.totalCount()).assertEqual(3);
      LogicTestLog.number(name, 'aliased delete length', 3, original.length);
      expect(original.length).assertEqual(3);
      LogicTestLog.value(name, 'delete preserves array', String(true), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(true);
      LogicTestLog.number(name, 'delete does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      LogicTestLog.value(name, 'remaining URI order',
        String('/logic/item-303|/logic/item-304|/logic/item-305'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(
        '/logic/item-303|/logic/item-304|/logic/item-305');
      LogicTestLog.value(name, 'remaining name order',
        String('item-303|item-304|item-305'),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        'item-303|item-304|item-305');
      source.notifyDataReload();
      LogicTestLog.value(name, 'manual reload after range delete', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      source.pushData(createMediaRows(1, 902, 1)[0]);
      LogicTestLog.number(name, 'append after range delete', 4, source.totalCount());
      expect(source.totalCount()).assertEqual(4);
      LogicTestLog.value(name, 'new final item', String('/logic/item-902'), String(source.getData(3).uri));
      expect(source.getData(3).uri).assertEqual('/logic/item-902');
      LogicTestLog.value(name, 'post-delete event sequence', String('reload|add:3'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload|add:3');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1130
     * @tc.name MultiMedia_Delete_1130
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1130', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1130';
      LogicTestLog.begin(name, 'length=3;index=0;remove=1');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(3, 303, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(0, 1);
      LogicTestLog.number(name, 'remaining total', 2, source.totalCount());
      expect(source.totalCount()).assertEqual(2);
      LogicTestLog.number(name, 'aliased delete length', 2, original.length);
      expect(original.length).assertEqual(2);
      LogicTestLog.value(name, 'delete preserves array', String(true), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(true);
      LogicTestLog.number(name, 'delete does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      LogicTestLog.value(name, 'remaining URI order',
        String('/logic/item-304|/logic/item-305'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(
        '/logic/item-304|/logic/item-305');
      LogicTestLog.value(name, 'remaining name order',
        String('item-304|item-305'),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        'item-304|item-305');
      source.notifyDataReload();
      LogicTestLog.value(name, 'manual reload after range delete', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      source.pushData(createMediaRows(1, 902, 1)[0]);
      LogicTestLog.number(name, 'append after range delete', 3, source.totalCount());
      expect(source.totalCount()).assertEqual(3);
      LogicTestLog.value(name, 'new final item', String('/logic/item-902'), String(source.getData(2).uri));
      expect(source.getData(2).uri).assertEqual('/logic/item-902');
      LogicTestLog.value(name, 'post-delete event sequence', String('reload|add:2'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload|add:2');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1131
     * @tc.name MultiMedia_Delete_1131
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1131', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1131';
      LogicTestLog.begin(name, 'length=3;index=0;remove=6');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(3, 303, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(0, 6);
      LogicTestLog.number(name, 'remaining total', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      LogicTestLog.number(name, 'aliased delete length', 0, original.length);
      expect(original.length).assertEqual(0);
      LogicTestLog.value(name, 'delete preserves array', String(true), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(true);
      LogicTestLog.number(name, 'delete does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      LogicTestLog.value(name, 'remaining URI order',
        String(''),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual('');
      LogicTestLog.value(name, 'remaining name order',
        String(''),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual('');
      source.notifyDataReload();
      LogicTestLog.value(name, 'manual reload after range delete', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      source.pushData(createMediaRows(1, 902, 1)[0]);
      LogicTestLog.number(name, 'append after range delete', 1, source.totalCount());
      expect(source.totalCount()).assertEqual(1);
      LogicTestLog.value(name, 'new final item', String('/logic/item-902'), String(source.getData(0).uri));
      expect(source.getData(0).uri).assertEqual('/logic/item-902');
      LogicTestLog.value(name, 'post-delete event sequence', String('reload|add:0'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload|add:0');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1133
     * @tc.name MultiMedia_Delete_1133
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1133', 0, async (): Promise<void> => {