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
      const name: string = 'MultiMedia_Delete_1133';
      LogicTestLog.begin(name, 'length=3;index=0.75;remove=-1');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(3, 303, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(0.75, -1);
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
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1134
     * @tc.name MultiMedia_Delete_1134
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1134', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1134';
      LogicTestLog.begin(name, 'length=3;index=0.75;remove=1');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(3, 303, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(0.75, 1);
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
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1135
     * @tc.name MultiMedia_Delete_1135
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1135', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1135';
      LogicTestLog.begin(name, 'length=3;index=0.75;remove=6');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(3, 303, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(0.75, 6);
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
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1137
     * @tc.name MultiMedia_Delete_1137
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1137', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1137';
      LogicTestLog.begin(name, 'length=3;index=1;remove=0');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(3, 303, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(1, 0);
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
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1138
     * @tc.name MultiMedia_Delete_1138
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1138', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1138';
      LogicTestLog.begin(name, 'length=3;index=1;remove=2');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(3, 303, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(1, 2);
      LogicTestLog.number(name, 'remaining total', 1, source.totalCount());
      expect(source.totalCount()).assertEqual(1);
      LogicTestLog.number(name, 'aliased delete length', 1, original.length);
      expect(original.length).assertEqual(1);
      LogicTestLog.value(name, 'delete preserves array', String(true), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(true);
      LogicTestLog.number(name, 'delete does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      LogicTestLog.value(name, 'remaining URI order',
        String('/logic/item-303'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual('/logic/item-303');
      LogicTestLog.value(name, 'remaining name order',
        String('item-303'),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        'item-303');
      source.notifyDataReload();
      LogicTestLog.value(name, 'manual reload after range delete', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      source.pushData(createMediaRows(1, 902, 1)[0]);
      LogicTestLog.number(name, 'append after range delete', 2, source.totalCount());
      expect(source.totalCount()).assertEqual(2);
      LogicTestLog.value(name, 'new final item', String('/logic/item-902'), String(source.getData(1).uri));
      expect(source.getData(1).uri).assertEqual('/logic/item-902');
      LogicTestLog.value(name, 'post-delete event sequence', String('reload|add:1'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload|add:1');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1139
     * @tc.name MultiMedia_Delete_1139
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1139', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1139';
      LogicTestLog.begin(name, 'length=3;index=1;remove=6');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(3, 303, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(1, 6);
      LogicTestLog.number(name, 'remaining total', 1, source.totalCount());
      expect(source.totalCount()).assertEqual(1);
      LogicTestLog.number(name, 'aliased delete length', 1, original.length);
      expect(original.length).assertEqual(1);
      LogicTestLog.value(name, 'delete preserves array', String(true), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(true);
      LogicTestLog.number(name, 'delete does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      LogicTestLog.value(name, 'remaining URI order',
        String('/logic/item-303'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual('/logic/item-303');
      LogicTestLog.value(name, 'remaining name order',
        String('item-303'),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        'item-303');
      source.notifyDataReload();
      LogicTestLog.value(name, 'manual reload after range delete', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      source.pushData(createMediaRows(1, 902, 1)[0]);
      LogicTestLog.number(name, 'append after range delete', 2, source.totalCount());
      expect(source.totalCount()).assertEqual(2);
      LogicTestLog.value(name, 'new final item', String('/logic/item-902'), String(source.getData(1).uri));
      expect(source.getData(1).uri).assertEqual('/logic/item-902');
      LogicTestLog.value(name, 'post-delete event sequence', String('reload|add:1'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload|add:1');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1141
     * @tc.name MultiMedia_Delete_1141
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1141', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1141';
      LogicTestLog.begin(name, 'length=3;index=2;remove=-1');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(3, 303, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(2, -1);
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
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1142
     * @tc.name MultiMedia_Delete_1142
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1142', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1142';
      LogicTestLog.begin(name, 'length=3;index=2;remove=1');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(3, 303, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(2, 1);
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
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1143
     * @tc.name MultiMedia_Delete_1143
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1143', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1143';
      LogicTestLog.begin(name, 'length=3;index=2;remove=6');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(3, 303, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(2, 6);
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
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1145
     * @tc.name MultiMedia_Delete_1145
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1145', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1145';
      LogicTestLog.begin(name, 'length=3;index=3;remove=0');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(3, 303, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(3, 0);
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
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1146
     * @tc.name MultiMedia_Delete_1146
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1146', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1146';
      LogicTestLog.begin(name, 'length=3;index=3;remove=2');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(3, 303, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(3, 2);
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
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1147
     * @tc.name MultiMedia_Delete_1147
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1147', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1147';
      LogicTestLog.begin(name, 'length=3;index=3;remove=6');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(3, 303, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(3, 6);
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
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1149
     * @tc.name MultiMedia_Delete_1149
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1149', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1149';
      LogicTestLog.begin(name, 'length=3;index=5;remove=0');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(3, 303, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(5, 0);
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
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1150
     * @tc.name MultiMedia_Delete_1150
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1150', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1150';
      LogicTestLog.begin(name, 'length=3;index=5;remove=2');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(3, 303, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(5, 2);
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
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1151
     * @tc.name MultiMedia_Delete_1151
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1151', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1151';
      LogicTestLog.begin(name, 'length=3;index=5;remove=6');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(3, 303, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(5, 6);
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
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1153
     * @tc.name MultiMedia_Delete_1153
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1153', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1153';
      LogicTestLog.begin(name, 'length=3;index=Infinity;remove=0');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(3, 303, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(Number.POSITIVE_INFINITY, 0);
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
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1154
     * @tc.name MultiMedia_Delete_1154
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1154', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1154';
      LogicTestLog.begin(name, 'length=3;index=Infinity;remove=2');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(3, 303, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(Number.POSITIVE_INFINITY, 2);
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
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1155
     * @tc.name MultiMedia_Delete_1155
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1155', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1155';
      LogicTestLog.begin(name, 'length=3;index=Infinity;remove=6');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(3, 303, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(Number.POSITIVE_INFINITY, 6);
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
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1157
     * @tc.name MultiMedia_Delete_1157
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1157', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1157';
      LogicTestLog.begin(name, 'length=3;index=NaN;remove=0');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(3, 303, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(Number.NaN, 0);
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
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1158
     * @tc.name MultiMedia_Delete_1158
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1158', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1158';
      LogicTestLog.begin(name, 'length=3;index=NaN;remove=2');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(3, 303, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(Number.NaN, 2);
      LogicTestLog.number(name, 'remaining total', 1, source.totalCount());
      expect(source.totalCount()).assertEqual(1);
      LogicTestLog.number(name, 'aliased delete length', 1, original.length);
      expect(original.length).assertEqual(1);
      LogicTestLog.value(name, 'delete preserves array', String(true), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(true);
      LogicTestLog.number(name, 'delete does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      LogicTestLog.value(name, 'remaining URI order',
        String('/logic/item-305'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual('/logic/item-305');
      LogicTestLog.value(name, 'remaining name order',
        String('item-305'),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        'item-305');
      source.notifyDataReload();
      LogicTestLog.value(name, 'manual reload after range delete', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      source.pushData(createMediaRows(1, 902, 1)[0]);
      LogicTestLog.number(name, 'append after range delete', 2, source.totalCount());
      expect(source.totalCount()).assertEqual(2);
      LogicTestLog.value(name, 'new final item', String('/logic/item-902'), String(source.getData(1).uri));
      expect(source.getData(1).uri).assertEqual('/logic/item-902');
      LogicTestLog.value(name, 'post-delete event sequence', String('reload|add:1'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload|add:1');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1159
     * @tc.name MultiMedia_Delete_1159
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1159', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1159';
      LogicTestLog.begin(name, 'length=3;index=NaN;remove=6');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(3, 303, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(Number.NaN, 6);
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
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1161
     * @tc.name MultiMedia_Delete_1161
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1161', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1161';
      LogicTestLog.begin(name, 'length=7;index=-Infinity;remove=0');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(7, 307, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(Number.NEGATIVE_INFINITY, 0);
      LogicTestLog.number(name, 'remaining total', 7, source.totalCount());
      expect(source.totalCount()).assertEqual(7);
      LogicTestLog.number(name, 'aliased delete length', 7, original.length);
      expect(original.length).assertEqual(7);
      LogicTestLog.value(name, 'delete preserves array', String(true), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(true);
      LogicTestLog.number(name, 'delete does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      const expected29: string =
        '/logic/item-307|/logic/item-308|/logic/item-309|/logic/item-' +
        '310|/logic/item-311|/logic/item-312|/logic/item-313';
      LogicTestLog.value(name, 'remaining URI order',
        String(expected29),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected29);
      LogicTestLog.value(name, 'remaining name order',
        String('item-307|item-308|item-309|item-310|item-311|item-312|item-313'),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        'item-307|item-308|item-309|item-310|item-311|item-312|item-313');
      source.notifyDataReload();
      LogicTestLog.value(name, 'manual reload after range delete', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      source.pushData(createMediaRows(1, 902, 1)[0]);
      LogicTestLog.number(name, 'append after range delete', 8, source.totalCount());
      expect(source.totalCount()).assertEqual(8);
      LogicTestLog.value(name, 'new final item', String('/logic/item-902'), String(source.getData(7).uri));
      expect(source.getData(7).uri).assertEqual('/logic/item-902');
      LogicTestLog.value(name, 'post-delete event sequence', String('reload|add:7'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload|add:7');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1162
     * @tc.name MultiMedia_Delete_1162
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1162', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1162';
      LogicTestLog.begin(name, 'length=7;index=-Infinity;remove=2');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(7, 307, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(Number.NEGATIVE_INFINITY, 2);
      LogicTestLog.number(name, 'remaining total', 5, source.totalCount());
      expect(source.totalCount()).assertEqual(5);
      LogicTestLog.number(name, 'aliased delete length', 5, original.length);
      expect(original.length).assertEqual(5);
      LogicTestLog.value(name, 'delete preserves array', String(true), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(true);
      LogicTestLog.number(name, 'delete does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      const expected30: string =
        '/logic/item-309|/logic/item-310|/logic/item-311|/logic/item-' +
        '312|/logic/item-313';
      LogicTestLog.value(name, 'remaining URI order',
        String(expected30),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected30);
      LogicTestLog.value(name, 'remaining name order',
        String('item-309|item-310|item-311|item-312|item-313'),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        'item-309|item-310|item-311|item-312|item-313');
      source.notifyDataReload();
      LogicTestLog.value(name, 'manual reload after range delete', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      source.pushData(createMediaRows(1, 902, 1)[0]);
      LogicTestLog.number(name, 'append after range delete', 6, source.totalCount());
      expect(source.totalCount()).assertEqual(6);
      LogicTestLog.value(name, 'new final item', String('/logic/item-902'), String(source.getData(5).uri));
      expect(source.getData(5).uri).assertEqual('/logic/item-902');
      LogicTestLog.value(name, 'post-delete event sequence', String('reload|add:5'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload|add:5');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1163
     * @tc.name MultiMedia_Delete_1163
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1163', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1163';
      LogicTestLog.begin(name, 'length=7;index=-Infinity;remove=10');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(7, 307, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(Number.NEGATIVE_INFINITY, 10);
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
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1165
     * @tc.name MultiMedia_Delete_1165
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1165', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1165';
      LogicTestLog.begin(name, 'length=7;index=-9;remove=0');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(7, 307, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(-9, 0);
      LogicTestLog.number(name, 'remaining total', 7, source.totalCount());
      expect(source.totalCount()).assertEqual(7);
      LogicTestLog.number(name, 'aliased delete length', 7, original.length);
      expect(original.length).assertEqual(7);
      LogicTestLog.value(name, 'delete preserves array', String(true), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(true);
      LogicTestLog.number(name, 'delete does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      const expected32: string =
        '/logic/item-307|/logic/item-308|/logic/item-309|/logic/item-' +
        '310|/logic/item-311|/logic/item-312|/logic/item-313';
      LogicTestLog.value(name, 'remaining URI order',
        String(expected32),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected32);
      LogicTestLog.value(name, 'remaining name order',
        String('item-307|item-308|item-309|item-310|item-311|item-312|item-313'),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        'item-307|item-308|item-309|item-310|item-311|item-312|item-313');
      source.notifyDataReload();
      LogicTestLog.value(name, 'manual reload after range delete', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      source.pushData(createMediaRows(1, 902, 1)[0]);
      LogicTestLog.number(name, 'append after range delete', 8, source.totalCount());
      expect(source.totalCount()).assertEqual(8);
      LogicTestLog.value(name, 'new final item', String('/logic/item-902'), String(source.getData(7).uri));
      expect(source.getData(7).uri).assertEqual('/logic/item-902');
      LogicTestLog.value(name, 'post-delete event sequence', String('reload|add:7'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload|add:7');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1166
     * @tc.name MultiMedia_Delete_1166
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1166', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1166';
      LogicTestLog.begin(name, 'length=7;index=-9;remove=2');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(7, 307, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(-9, 2);
      LogicTestLog.number(name, 'remaining total', 5, source.totalCount());
      expect(source.totalCount()).assertEqual(5);
      LogicTestLog.number(name, 'aliased delete length', 5, original.length);
      expect(original.length).assertEqual(5);
      LogicTestLog.value(name, 'delete preserves array', String(true), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(true);
      LogicTestLog.number(name, 'delete does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      const expected33: string =
        '/logic/item-309|/logic/item-310|/logic/item-311|/logic/item-' +
        '312|/logic/item-313';
      LogicTestLog.value(name, 'remaining URI order',
        String(expected33),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected33);
      LogicTestLog.value(name, 'remaining name order',
        String('item-309|item-310|item-311|item-312|item-313'),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        'item-309|item-310|item-311|item-312|item-313');
      source.notifyDataReload();
      LogicTestLog.value(name, 'manual reload after range delete', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      source.pushData(createMediaRows(1, 902, 1)[0]);
      LogicTestLog.number(name, 'append after range delete', 6, source.totalCount());
      expect(source.totalCount()).assertEqual(6);
      LogicTestLog.value(name, 'new final item', String('/logic/item-902'), String(source.getData(5).uri));
      expect(source.getData(5).uri).assertEqual('/logic/item-902');
      LogicTestLog.value(name, 'post-delete event sequence', String('reload|add:5'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload|add:5');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1167
     * @tc.name MultiMedia_Delete_1167
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1167', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1167';
      LogicTestLog.begin(name, 'length=7;index=-9;remove=10');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(7, 307, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(-9, 10);
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
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1169
     * @tc.name MultiMedia_Delete_1169
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1169', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1169';
      LogicTestLog.begin(name, 'length=7;index=-1;remove=0');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(7, 307, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(-1, 0);
      LogicTestLog.number(name, 'remaining total', 7, source.totalCount());
      expect(source.totalCount()).assertEqual(7);
      LogicTestLog.number(name, 'aliased delete length', 7, original.length);
      expect(original.length).assertEqual(7);
      LogicTestLog.value(name, 'delete preserves array', String(true), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(true);
      LogicTestLog.number(name, 'delete does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      const expected35: string =
        '/logic/item-307|/logic/item-308|/logic/item-309|/logic/item-' +
        '310|/logic/item-311|/logic/item-312|/logic/item-313';
      LogicTestLog.value(name, 'remaining URI order',
        String(expected35),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected35);
      LogicTestLog.value(name, 'remaining name order',
        String('item-307|item-308|item-309|item-310|item-311|item-312|item-313'),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        'item-307|item-308|item-309|item-310|item-311|item-312|item-313');
      source.notifyDataReload();
      LogicTestLog.value(name, 'manual reload after range delete', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      source.pushData(createMediaRows(1, 902, 1)[0]);
      LogicTestLog.number(name, 'append after range delete', 8, source.totalCount());
      expect(source.totalCount()).assertEqual(8);
      LogicTestLog.value(name, 'new final item', String('/logic/item-902'), String(source.getData(7).uri));
      expect(source.getData(7).uri).assertEqual('/logic/item-902');
      LogicTestLog.value(name, 'post-delete event sequence', String('reload|add:7'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload|add:7');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1170
     * @tc.name MultiMedia_Delete_1170
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1170', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1170';
      LogicTestLog.begin(name, 'length=7;index=-1;remove=2');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(7, 307, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(-1, 2);
      LogicTestLog.number(name, 'remaining total', 6, source.totalCount());
      expect(source.totalCount()).assertEqual(6);
      LogicTestLog.number(name, 'aliased delete length', 6, original.length);
      expect(original.length).assertEqual(6);
      LogicTestLog.value(name, 'delete preserves array', String(true), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(true);
      LogicTestLog.number(name, 'delete does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      const expected36: string =
        '/logic/item-307|/logic/item-308|/logic/item-309|/logic/item-' +
        '310|/logic/item-311|/logic/item-312';
      LogicTestLog.value(name, 'remaining URI order',
        String(expected36),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected36);
      LogicTestLog.value(name, 'remaining name order',
        String('item-307|item-308|item-309|item-310|item-311|item-312'),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        'item-307|item-308|item-309|item-310|item-311|item-312');
      source.notifyDataReload();
      LogicTestLog.value(name, 'manual reload after range delete', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      source.pushData(createMediaRows(1, 902, 1)[0]);
      LogicTestLog.number(name, 'append after range delete', 7, source.totalCount());
      expect(source.totalCount()).assertEqual(7);
      LogicTestLog.value(name, 'new final item', String('/logic/item-902'), String(source.getData(6).uri));
      expect(source.getData(6).uri).assertEqual('/logic/item-902');
      LogicTestLog.value(name, 'post-delete event sequence', String('reload|add:6'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload|add:6');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1171
     * @tc.name MultiMedia_Delete_1171
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1171', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1171';
      LogicTestLog.begin(name, 'length=7;index=-1;remove=10');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(7, 307, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(-1, 10);
      LogicTestLog.number(name, 'remaining total', 6, source.totalCount());
      expect(source.totalCount()).assertEqual(6);
      LogicTestLog.number(name, 'aliased delete length', 6, original.length);
      expect(original.length).assertEqual(6);
      LogicTestLog.value(name, 'delete preserves array', String(true), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(true);
      LogicTestLog.number(name, 'delete does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      const expected37: string =
        '/logic/item-307|/logic/item-308|/logic/item-309|/logic/item-' +
        '310|/logic/item-311|/logic/item-312';
      LogicTestLog.value(name, 'remaining URI order',
        String(expected37),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected37);
      LogicTestLog.value(name, 'remaining name order',
        String('item-307|item-308|item-309|item-310|item-311|item-312'),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        'item-307|item-308|item-309|item-310|item-311|item-312');
      source.notifyDataReload();
      LogicTestLog.value(name, 'manual reload after range delete', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      source.pushData(createMediaRows(1, 902, 1)[0]);
      LogicTestLog.number(name, 'append after range delete', 7, source.totalCount());
      expect(source.totalCount()).assertEqual(7);
      LogicTestLog.value(name, 'new final item', String('/logic/item-902'), String(source.getData(6).uri));
      expect(source.getData(6).uri).assertEqual('/logic/item-902');
      LogicTestLog.value(name, 'post-delete event sequence', String('reload|add:6'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload|add:6');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1173
     * @tc.name MultiMedia_Delete_1173
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1173', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1173';
      LogicTestLog.begin(name, 'length=7;index=-0.75;remove=-1');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(7, 307, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(-0.75, -1);
      LogicTestLog.number(name, 'remaining total', 7, source.totalCount());
      expect(source.totalCount()).assertEqual(7);
      LogicTestLog.number(name, 'aliased delete length', 7, original.length);
      expect(original.length).assertEqual(7);
      LogicTestLog.value(name, 'delete preserves array', String(true), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(true);
      LogicTestLog.number(name, 'delete does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      const expected39: string =
        '/logic/item-307|/logic/item-308|/logic/item-309|/logic/item-' +
        '310|/logic/item-311|/logic/item-312|/logic/item-313';
      LogicTestLog.value(name, 'remaining URI order',
        String(expected39),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected39);
      LogicTestLog.value(name, 'remaining name order',
        String('item-307|item-308|item-309|item-310|item-311|item-312|item-313'),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        'item-307|item-308|item-309|item-310|item-311|item-312|item-313');
      source.notifyDataReload();
      LogicTestLog.value(name, 'manual reload after range delete', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      source.pushData(createMediaRows(1, 902, 1)[0]);
      LogicTestLog.number(name, 'append after range delete', 8, source.totalCount());
      expect(source.totalCount()).assertEqual(8);
      LogicTestLog.value(name, 'new final item', String('/logic/item-902'), String(source.getData(7).uri));
      expect(source.getData(7).uri).assertEqual('/logic/item-902');
      LogicTestLog.value(name, 'post-delete event sequence', String('reload|add:7'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload|add:7');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1174
     * @tc.name MultiMedia_Delete_1174
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1174', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1174';
      LogicTestLog.begin(name, 'length=7;index=-0.75;remove=1');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(7, 307, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(-0.75, 1);
      LogicTestLog.number(name, 'remaining total', 6, source.totalCount());
      expect(source.totalCount()).assertEqual(6);
      LogicTestLog.number(name, 'aliased delete length', 6, original.length);
      expect(original.length).assertEqual(6);
      LogicTestLog.value(name, 'delete preserves array', String(true), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(true);
      LogicTestLog.number(name, 'delete does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      const expected40: string =
        '/logic/item-308|/logic/item-309|/logic/item-310|/logic/item-' +
        '311|/logic/item-312|/logic/item-313';
      LogicTestLog.value(name, 'remaining URI order',
        String(expected40),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected40);
      LogicTestLog.value(name, 'remaining name order',
        String('item-308|item-309|item-310|item-311|item-312|item-313'),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        'item-308|item-309|item-310|item-311|item-312|item-313');
      source.notifyDataReload();
      LogicTestLog.value(name, 'manual reload after range delete', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      source.pushData(createMediaRows(1, 902, 1)[0]);
      LogicTestLog.number(name, 'append after range delete', 7, source.totalCount());
      expect(source.totalCount()).assertEqual(7);
      LogicTestLog.value(name, 'new final item', String('/logic/item-902'), String(source.getData(6).uri));
      expect(source.getData(6).uri).assertEqual('/logic/item-902');
      LogicTestLog.value(name, 'post-delete event sequence', String('reload|add:6'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload|add:6');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1175
     * @tc.name MultiMedia_Delete_1175
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1175', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1175';
      LogicTestLog.begin(name, 'length=7;index=-0.75;remove=10');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(7, 307, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(-0.75, 10);
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
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1177
     * @tc.name MultiMedia_Delete_1177
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1177', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1177';
      LogicTestLog.begin(name, 'length=7;index=0;remove=-1');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(7, 307, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(0, -1);
      LogicTestLog.number(name, 'remaining total', 7, source.totalCount());
      expect(source.totalCount()).assertEqual(7);
      LogicTestLog.number(name, 'aliased delete length', 7, original.length);
      expect(original.length).assertEqual(7);
      LogicTestLog.value(name, 'delete preserves array', String(true), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(true);
      LogicTestLog.number(name, 'delete does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      const expected42: string =
        '/logic/item-307|/logic/item-308|/logic/item-309|/logic/item-' +
        '310|/logic/item-311|/logic/item-312|/logic/item-313';
      LogicTestLog.value(name, 'remaining URI order',
        String(expected42),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected42);
      LogicTestLog.value(name, 'remaining name order',
        String('item-307|item-308|item-309|item-310|item-311|item-312|item-313'),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        'item-307|item-308|item-309|item-310|item-311|item-312|item-313');
      source.notifyDataReload();
      LogicTestLog.value(name, 'manual reload after range delete', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      source.pushData(createMediaRows(1, 902, 1)[0]);
      LogicTestLog.number(name, 'append after range delete', 8, source.totalCount());
      expect(source.totalCount()).assertEqual(8);
      LogicTestLog.value(name, 'new final item', String('/logic/item-902'), String(source.getData(7).uri));
      expect(source.getData(7).uri).assertEqual('/logic/item-902');
      LogicTestLog.value(name, 'post-delete event sequence', String('reload|add:7'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload|add:7');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1178
     * @tc.name MultiMedia_Delete_1178
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1178', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1178';
      LogicTestLog.begin(name, 'length=7;index=0;remove=1');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(7, 307, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(0, 1);
      LogicTestLog.number(name, 'remaining total', 6, source.totalCount());
      expect(source.totalCount()).assertEqual(6);
      LogicTestLog.number(name, 'aliased delete length', 6, original.length);
      expect(original.length).assertEqual(6);
      LogicTestLog.value(name, 'delete preserves array', String(true), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(true);
      LogicTestLog.number(name, 'delete does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      const expected43: string =
        '/logic/item-308|/logic/item-309|/logic/item-310|/logic/item-' +
        '311|/logic/item-312|/logic/item-313';
      LogicTestLog.value(name, 'remaining URI order',
        String(expected43),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected43);
      LogicTestLog.value(name, 'remaining name order',
        String('item-308|item-309|item-310|item-311|item-312|item-313'),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        'item-308|item-309|item-310|item-311|item-312|item-313');
      source.notifyDataReload();
      LogicTestLog.value(name, 'manual reload after range delete', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      source.pushData(createMediaRows(1, 902, 1)[0]);
      LogicTestLog.number(name, 'append after range delete', 7, source.totalCount());
      expect(source.totalCount()).assertEqual(7);
      LogicTestLog.value(name, 'new final item', String('/logic/item-902'), String(source.getData(6).uri));
      expect(source.getData(6).uri).assertEqual('/logic/item-902');
      LogicTestLog.value(name, 'post-delete event sequence', String('reload|add:6'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload|add:6');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1179
     * @tc.name MultiMedia_Delete_1179
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1179', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1179';
      LogicTestLog.begin(name, 'length=7;index=0;remove=10');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(7, 307, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(0, 10);
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
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1181
     * @tc.name MultiMedia_Delete_1181
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1181', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1181';
      LogicTestLog.begin(name, 'length=7;index=0.75;remove=-1');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(7, 307, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(0.75, -1);
      LogicTestLog.number(name, 'remaining total', 7, source.totalCount());
      expect(source.totalCount()).assertEqual(7);
      LogicTestLog.number(name, 'aliased delete length', 7, original.length);
      expect(original.length).assertEqual(7);
      LogicTestLog.value(name, 'delete preserves array', String(true), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(true);
      LogicTestLog.number(name, 'delete does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      const expected45: string =
        '/logic/item-307|/logic/item-308|/logic/item-309|/logic/item-' +
        '310|/logic/item-311|/logic/item-312|/logic/item-313';
      LogicTestLog.value(name, 'remaining URI order',
        String(expected45),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected45);
      LogicTestLog.value(name, 'remaining name order',
        String('item-307|item-308|item-309|item-310|item-311|item-312|item-313'),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        'item-307|item-308|item-309|item-310|item-311|item-312|item-313');
      source.notifyDataReload();
      LogicTestLog.value(name, 'manual reload after range delete', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      source.pushData(createMediaRows(1, 902, 1)[0]);
      LogicTestLog.number(name, 'append after range delete', 8, source.totalCount());
      expect(source.totalCount()).assertEqual(8);
      LogicTestLog.value(name, 'new final item', String('/logic/item-902'), String(source.getData(7).uri));
      expect(source.getData(7).uri).assertEqual('/logic/item-902');
      LogicTestLog.value(name, 'post-delete event sequence', String('reload|add:7'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload|add:7');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1182
     * @tc.name MultiMedia_Delete_1182
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1182', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1182';
      LogicTestLog.begin(name, 'length=7;index=0.75;remove=1');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(7, 307, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(0.75, 1);
      LogicTestLog.number(name, 'remaining total', 6, source.totalCount());
      expect(source.totalCount()).assertEqual(6);
      LogicTestLog.number(name, 'aliased delete length', 6, original.length);
      expect(original.length).assertEqual(6);
      LogicTestLog.value(name, 'delete preserves array', String(true), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(true);
      LogicTestLog.number(name, 'delete does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      const expected46: string =
        '/logic/item-308|/logic/item-309|/logic/item-310|/logic/item-' +
        '311|/logic/item-312|/logic/item-313';
      LogicTestLog.value(name, 'remaining URI order',
        String(expected46),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected46);
      LogicTestLog.value(name, 'remaining name order',
        String('item-308|item-309|item-310|item-311|item-312|item-313'),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        'item-308|item-309|item-310|item-311|item-312|item-313');
      source.notifyDataReload();
      LogicTestLog.value(name, 'manual reload after range delete', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      source.pushData(createMediaRows(1, 902, 1)[0]);
      LogicTestLog.number(name, 'append after range delete', 7, source.totalCount());
      expect(source.totalCount()).assertEqual(7);
      LogicTestLog.value(name, 'new final item', String('/logic/item-902'), String(source.getData(6).uri));
      expect(source.getData(6).uri).assertEqual('/logic/item-902');
      LogicTestLog.value(name, 'post-delete event sequence', String('reload|add:6'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload|add:6');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1183
     * @tc.name MultiMedia_Delete_1183
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1183', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1183';
      LogicTestLog.begin(name, 'length=7;index=0.75;remove=10');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(7, 307, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(0.75, 10);
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
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1185
     * @tc.name MultiMedia_Delete_1185
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1185', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1185';
      LogicTestLog.begin(name, 'length=7;index=1;remove=0');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(7, 307, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);