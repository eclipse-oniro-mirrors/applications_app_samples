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

export default function DataSourceDeletion1Logic(): void {
  describe('DataSourceDeletion1Logic', (): void => {
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void): void => {
        setTimeout(resolve, 1);
      });
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1033
     * @tc.name MultiMedia_Delete_1033
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1033', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1033';
      LogicTestLog.begin(name, 'length=0;index=-Infinity;remove=0');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(0, 300, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(Number.NEGATIVE_INFINITY, 0);
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
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1034
     * @tc.name MultiMedia_Delete_1034
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1034', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1034';
      LogicTestLog.begin(name, 'length=0;index=-Infinity;remove=2');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(0, 300, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(Number.NEGATIVE_INFINITY, 2);
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
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1035
     * @tc.name MultiMedia_Delete_1035
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1035', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1035';
      LogicTestLog.begin(name, 'length=0;index=-Infinity;remove=3');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(0, 300, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(Number.NEGATIVE_INFINITY, 3);
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
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1037
     * @tc.name MultiMedia_Delete_1037
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1037', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1037';
      LogicTestLog.begin(name, 'length=0;index=-2;remove=-1');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(0, 300, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(-2, -1);
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
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1038
     * @tc.name MultiMedia_Delete_1038
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1038', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1038';
      LogicTestLog.begin(name, 'length=0;index=-2;remove=1');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(0, 300, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(-2, 1);
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
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1039
     * @tc.name MultiMedia_Delete_1039
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1039', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1039';
      LogicTestLog.begin(name, 'length=0;index=-2;remove=3');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(0, 300, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(-2, 3);
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
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1041
     * @tc.name MultiMedia_Delete_1041
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1041', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1041';
      LogicTestLog.begin(name, 'length=0;index=-1;remove=0');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(0, 300, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(-1, 0);
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
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1042
     * @tc.name MultiMedia_Delete_1042
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1042', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1042';
      LogicTestLog.begin(name, 'length=0;index=-1;remove=2');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(0, 300, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(-1, 2);
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
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1043
     * @tc.name MultiMedia_Delete_1043
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1043', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1043';
      LogicTestLog.begin(name, 'length=0;index=-1;remove=3');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(0, 300, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(-1, 3);
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
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1045
     * @tc.name MultiMedia_Delete_1045
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1045', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1045';
      LogicTestLog.begin(name, 'length=0;index=-0.75;remove=-1');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(0, 300, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(-0.75, -1);
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
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1046
     * @tc.name MultiMedia_Delete_1046
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1046', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1046';
      LogicTestLog.begin(name, 'length=0;index=-0.75;remove=1');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(0, 300, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(-0.75, 1);
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
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1047
     * @tc.name MultiMedia_Delete_1047
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1047', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1047';
      LogicTestLog.begin(name, 'length=0;index=-0.75;remove=3');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(0, 300, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(-0.75, 3);
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
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1049
     * @tc.name MultiMedia_Delete_1049
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1049', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1049';
      LogicTestLog.begin(name, 'length=0;index=0;remove=-1');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(0, 300, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(0, -1);
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
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1050
     * @tc.name MultiMedia_Delete_1050
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1050', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1050';
      LogicTestLog.begin(name, 'length=0;index=0;remove=1');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(0, 300, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(0, 1);
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
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1051
     * @tc.name MultiMedia_Delete_1051
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1051', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1051';
      LogicTestLog.begin(name, 'length=0;index=0;remove=3');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(0, 300, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(0, 3);
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
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1053
     * @tc.name MultiMedia_Delete_1053
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1053', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1053';
      LogicTestLog.begin(name, 'length=0;index=0.75;remove=-1');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(0, 300, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(0.75, -1);
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
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1054
     * @tc.name MultiMedia_Delete_1054
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1054', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1054';
      LogicTestLog.begin(name, 'length=0;index=0.75;remove=1');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(0, 300, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(0.75, 1);
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
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1055
     * @tc.name MultiMedia_Delete_1055
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1055', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1055';
      LogicTestLog.begin(name, 'length=0;index=0.75;remove=3');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(0, 300, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(0.75, 3);
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
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1057
     * @tc.name MultiMedia_Delete_1057
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1057', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1057';
      LogicTestLog.begin(name, 'length=0;index=1;remove=0');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(0, 300, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(1, 0);
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
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1058
     * @tc.name MultiMedia_Delete_1058
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1058', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1058';
      LogicTestLog.begin(name, 'length=0;index=1;remove=2');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(0, 300, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(1, 2);
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
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1059
     * @tc.name MultiMedia_Delete_1059
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1059', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1059';
      LogicTestLog.begin(name, 'length=0;index=1;remove=3');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(0, 300, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(1, 3);
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
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1061
     * @tc.name MultiMedia_Delete_1061
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1061', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1061';
      LogicTestLog.begin(name, 'length=0;index=2;remove=-1');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(0, 300, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(2, -1);
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
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1062
     * @tc.name MultiMedia_Delete_1062
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1062', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1062';
      LogicTestLog.begin(name, 'length=0;index=2;remove=1');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(0, 300, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(2, 1);
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
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1063
     * @tc.name MultiMedia_Delete_1063
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1063', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1063';
      LogicTestLog.begin(name, 'length=0;index=2;remove=3');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(0, 300, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(2, 3);
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
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1065
     * @tc.name MultiMedia_Delete_1065
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1065', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1065';
      LogicTestLog.begin(name, 'length=0;index=Infinity;remove=0');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(0, 300, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(Number.POSITIVE_INFINITY, 0);
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
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1066
     * @tc.name MultiMedia_Delete_1066
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1066', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1066';
      LogicTestLog.begin(name, 'length=0;index=Infinity;remove=2');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(0, 300, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(Number.POSITIVE_INFINITY, 2);
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
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1067
     * @tc.name MultiMedia_Delete_1067
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1067', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1067';
      LogicTestLog.begin(name, 'length=0;index=Infinity;remove=3');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(0, 300, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(Number.POSITIVE_INFINITY, 3);
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
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1069
     * @tc.name MultiMedia_Delete_1069
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1069', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1069';
      LogicTestLog.begin(name, 'length=0;index=NaN;remove=0');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(0, 300, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(Number.NaN, 0);
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
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1070
     * @tc.name MultiMedia_Delete_1070
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1070', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1070';
      LogicTestLog.begin(name, 'length=0;index=NaN;remove=2');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(0, 300, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(Number.NaN, 2);
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
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1071
     * @tc.name MultiMedia_Delete_1071
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1071', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1071';
      LogicTestLog.begin(name, 'length=0;index=NaN;remove=3');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(0, 300, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(Number.NaN, 3);
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
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1073
     * @tc.name MultiMedia_Delete_1073
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1073', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1073';
      LogicTestLog.begin(name, 'length=1;index=-Infinity;remove=0');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(1, 301, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(Number.NEGATIVE_INFINITY, 0);
      LogicTestLog.number(name, 'remaining total', 1, source.totalCount());
      expect(source.totalCount()).assertEqual(1);
      LogicTestLog.number(name, 'aliased delete length', 1, original.length);
      expect(original.length).assertEqual(1);
      LogicTestLog.value(name, 'delete preserves array', String(true), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(true);
      LogicTestLog.number(name, 'delete does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      LogicTestLog.value(name, 'remaining URI order',
        String('/logic/item-301'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual('/logic/item-301');
      LogicTestLog.value(name, 'remaining name order',
        String('item-301'),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        'item-301');
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
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1074
     * @tc.name MultiMedia_Delete_1074
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1074', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1074';
      LogicTestLog.begin(name, 'length=1;index=-Infinity;remove=2');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(1, 301, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(Number.NEGATIVE_INFINITY, 2);
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
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1075
     * @tc.name MultiMedia_Delete_1075
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1075', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1075';
      LogicTestLog.begin(name, 'length=1;index=-Infinity;remove=4');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(1, 301, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(Number.NEGATIVE_INFINITY, 4);
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
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1077
     * @tc.name MultiMedia_Delete_1077
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1077', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1077';
      LogicTestLog.begin(name, 'length=1;index=-3;remove=0');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(1, 301, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(-3, 0);
      LogicTestLog.number(name, 'remaining total', 1, source.totalCount());
      expect(source.totalCount()).assertEqual(1);
      LogicTestLog.number(name, 'aliased delete length', 1, original.length);
      expect(original.length).assertEqual(1);
      LogicTestLog.value(name, 'delete preserves array', String(true), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(true);
      LogicTestLog.number(name, 'delete does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      LogicTestLog.value(name, 'remaining URI order',
        String('/logic/item-301'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual('/logic/item-301');
      LogicTestLog.value(name, 'remaining name order',
        String('item-301'),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        'item-301');
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
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1078
     * @tc.name MultiMedia_Delete_1078
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1078', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1078';
      LogicTestLog.begin(name, 'length=1;index=-3;remove=2');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(1, 301, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(-3, 2);
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
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1079
     * @tc.name MultiMedia_Delete_1079
     * @tc.desc Delete a range without implicit listener notifications and preserve remaining order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Delete_1079', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Delete_1079';
      LogicTestLog.begin(name, 'length=1;index=-3;remove=4');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(1, 301, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      source.deleteData(-3, 4);
      LogicTestLog.number(name, 'remaining total', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      LogicTestLog.number(name, 'aliased delete length', 0, original.length);
      expect(original.length).assertEqual(0);
      LogicTestLog.value(name, 'delete preserves array', String(true), String(source.getDataArray() === original));
      expect(source.getDataArray() === original).assertEqual(true);
      LogicTestLog.number(name, 'delete does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      LogicTestLog.value(name, 'remaining URI order',