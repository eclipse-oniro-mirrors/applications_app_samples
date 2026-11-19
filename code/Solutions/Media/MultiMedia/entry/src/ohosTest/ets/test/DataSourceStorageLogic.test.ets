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

export default function DataSourceStorageLogic(): void {
  describe('DataSourceStorageLogic', (): void => {
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void): void => {
        setTimeout(resolve, 1);
      });
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1000
     * @tc.name MultiMedia_Storage_1000
     * @tc.desc Load ordered metadata and preserve explicit notification contract
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Storage_1000', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Storage_1000';
      LogicTestLog.begin(name, 'count=0;type=1');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      source.registerDataChangeListener(listener);
      LogicTestLog.number(name, 'initial total', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      const data: MediaData[] = createMediaRows(0, 101, 1);
      source.setDataArray(data);
      LogicTestLog.number(name, 'loaded total', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      LogicTestLog.number(name, 'array length', 0, source.getDataArray().length);
      expect(source.getDataArray().length).assertEqual(0);
      LogicTestLog.value(name, 'array alias', String(true), String(source.getDataArray() === data));
      expect(source.getDataArray() === data).assertEqual(true);
      LogicTestLog.number(name, 'set does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      LogicTestLog.value(name, 'ordered URIs',
        String(''),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual('');
      LogicTestLog.value(name, 'ordered names',
        String(''),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual('');
      LogicTestLog.value(name, 'empty lookup', String(true), String(source.getData(0) === undefined));
      expect(source.getData(0) === undefined).assertEqual(true);
      source.notifyDataReload();
      LogicTestLog.value(name, 'explicit reload', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      LogicTestLog.number(name, 'reload preserves data', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1001
     * @tc.name MultiMedia_Storage_1001
     * @tc.desc Load ordered metadata and preserve explicit notification contract
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Storage_1001', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Storage_1001';
      LogicTestLog.begin(name, 'count=0;type=2');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      source.registerDataChangeListener(listener);
      LogicTestLog.number(name, 'initial total', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      const data: MediaData[] = createMediaRows(0, 102, 2);
      source.setDataArray(data);
      LogicTestLog.number(name, 'loaded total', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      LogicTestLog.number(name, 'array length', 0, source.getDataArray().length);
      expect(source.getDataArray().length).assertEqual(0);
      LogicTestLog.value(name, 'array alias', String(true), String(source.getDataArray() === data));
      expect(source.getDataArray() === data).assertEqual(true);
      LogicTestLog.number(name, 'set does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      LogicTestLog.value(name, 'ordered URIs',
        String(''),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual('');
      LogicTestLog.value(name, 'ordered names',
        String(''),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual('');
      LogicTestLog.value(name, 'empty lookup', String(true), String(source.getData(0) === undefined));
      expect(source.getData(0) === undefined).assertEqual(true);
      source.notifyDataReload();
      LogicTestLog.value(name, 'explicit reload', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      LogicTestLog.number(name, 'reload preserves data', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1002
     * @tc.name MultiMedia_Storage_1002
     * @tc.desc Load ordered metadata and preserve explicit notification contract
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Storage_1002', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Storage_1002';
      LogicTestLog.begin(name, 'count=0;type=3');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      source.registerDataChangeListener(listener);
      LogicTestLog.number(name, 'initial total', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      const data: MediaData[] = createMediaRows(0, 103, 3);
      source.setDataArray(data);
      LogicTestLog.number(name, 'loaded total', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      LogicTestLog.number(name, 'array length', 0, source.getDataArray().length);
      expect(source.getDataArray().length).assertEqual(0);
      LogicTestLog.value(name, 'array alias', String(true), String(source.getDataArray() === data));
      expect(source.getDataArray() === data).assertEqual(true);
      LogicTestLog.number(name, 'set does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      LogicTestLog.value(name, 'ordered URIs',
        String(''),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual('');
      LogicTestLog.value(name, 'ordered names',
        String(''),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual('');
      LogicTestLog.value(name, 'empty lookup', String(true), String(source.getData(0) === undefined));
      expect(source.getData(0) === undefined).assertEqual(true);
      source.notifyDataReload();
      LogicTestLog.value(name, 'explicit reload', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      LogicTestLog.number(name, 'reload preserves data', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1003
     * @tc.name MultiMedia_Storage_1003
     * @tc.desc Load ordered metadata and preserve explicit notification contract
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Storage_1003', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Storage_1003';
      LogicTestLog.begin(name, 'count=0;type=4');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      source.registerDataChangeListener(listener);
      LogicTestLog.number(name, 'initial total', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      const data: MediaData[] = createMediaRows(0, 104, 4);
      source.setDataArray(data);
      LogicTestLog.number(name, 'loaded total', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      LogicTestLog.number(name, 'array length', 0, source.getDataArray().length);
      expect(source.getDataArray().length).assertEqual(0);
      LogicTestLog.value(name, 'array alias', String(true), String(source.getDataArray() === data));
      expect(source.getDataArray() === data).assertEqual(true);
      LogicTestLog.number(name, 'set does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      LogicTestLog.value(name, 'ordered URIs',
        String(''),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual('');
      LogicTestLog.value(name, 'ordered names',
        String(''),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual('');
      LogicTestLog.value(name, 'empty lookup', String(true), String(source.getData(0) === undefined));
      expect(source.getData(0) === undefined).assertEqual(true);
      source.notifyDataReload();
      LogicTestLog.value(name, 'explicit reload', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      LogicTestLog.number(name, 'reload preserves data', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1004
     * @tc.name MultiMedia_Storage_1004
     * @tc.desc Load ordered metadata and preserve explicit notification contract
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Storage_1004', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Storage_1004';
      LogicTestLog.begin(name, 'count=1;type=1');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      source.registerDataChangeListener(listener);
      LogicTestLog.number(name, 'initial total', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      const data: MediaData[] = createMediaRows(1, 111, 1);
      source.setDataArray(data);
      LogicTestLog.number(name, 'loaded total', 1, source.totalCount());
      expect(source.totalCount()).assertEqual(1);
      LogicTestLog.number(name, 'array length', 1, source.getDataArray().length);
      expect(source.getDataArray().length).assertEqual(1);
      LogicTestLog.value(name, 'array alias', String(true), String(source.getDataArray() === data));
      expect(source.getDataArray() === data).assertEqual(true);
      LogicTestLog.number(name, 'set does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      LogicTestLog.value(name, 'ordered URIs',
        String('/logic/item-111'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual('/logic/item-111');
      LogicTestLog.value(name, 'ordered names',
        String('item-111'),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        'item-111');
      LogicTestLog.value(name, 'item alias', String(true), String(source.getData(0) === data[0]));
      expect(source.getData(0) === data[0]).assertEqual(true);
      LogicTestLog.value(name, 'last uri', String('/logic/item-111'), String(source.getData(0).uri));
      expect(source.getData(0).uri).assertEqual('/logic/item-111');
      LogicTestLog.value(name, 'last displayName', String('item-111'), String(source.getData(0).displayName));
      expect(source.getData(0).displayName).assertEqual('item-111');
      LogicTestLog.number(name, 'last fileType', 1, source.getData(0).fileType);
      expect(source.getData(0).fileType).assertEqual(1);
      LogicTestLog.number(name, 'last duration', 111111, source.getData(0).duration);
      expect(source.getData(0).duration).assertEqual(111111);
      LogicTestLog.number(name, 'last dateAdded', 1700000111, source.getData(0).dateAdded);
      expect(source.getData(0).dateAdded).assertEqual(1700000111);
      source.notifyDataReload();
      LogicTestLog.value(name, 'explicit reload', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      LogicTestLog.number(name, 'reload preserves data', 1, source.totalCount());
      expect(source.totalCount()).assertEqual(1);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1005
     * @tc.name MultiMedia_Storage_1005
     * @tc.desc Load ordered metadata and preserve explicit notification contract
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Storage_1005', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Storage_1005';
      LogicTestLog.begin(name, 'count=1;type=2');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      source.registerDataChangeListener(listener);
      LogicTestLog.number(name, 'initial total', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      const data: MediaData[] = createMediaRows(1, 112, 2);
      source.setDataArray(data);
      LogicTestLog.number(name, 'loaded total', 1, source.totalCount());
      expect(source.totalCount()).assertEqual(1);
      LogicTestLog.number(name, 'array length', 1, source.getDataArray().length);
      expect(source.getDataArray().length).assertEqual(1);
      LogicTestLog.value(name, 'array alias', String(true), String(source.getDataArray() === data));
      expect(source.getDataArray() === data).assertEqual(true);
      LogicTestLog.number(name, 'set does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      LogicTestLog.value(name, 'ordered URIs',
        String('/logic/item-112'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual('/logic/item-112');
      LogicTestLog.value(name, 'ordered names',
        String('item-112'),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        'item-112');
      LogicTestLog.value(name, 'item alias', String(true), String(source.getData(0) === data[0]));
      expect(source.getData(0) === data[0]).assertEqual(true);
      LogicTestLog.value(name, 'last uri', String('/logic/item-112'), String(source.getData(0).uri));
      expect(source.getData(0).uri).assertEqual('/logic/item-112');
      LogicTestLog.value(name, 'last displayName', String('item-112'), String(source.getData(0).displayName));
      expect(source.getData(0).displayName).assertEqual('item-112');
      LogicTestLog.number(name, 'last fileType', 2, source.getData(0).fileType);
      expect(source.getData(0).fileType).assertEqual(2);
      LogicTestLog.number(name, 'last duration', 112112, source.getData(0).duration);
      expect(source.getData(0).duration).assertEqual(112112);
      LogicTestLog.number(name, 'last dateAdded', 1700000112, source.getData(0).dateAdded);
      expect(source.getData(0).dateAdded).assertEqual(1700000112);
      source.notifyDataReload();
      LogicTestLog.value(name, 'explicit reload', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      LogicTestLog.number(name, 'reload preserves data', 1, source.totalCount());
      expect(source.totalCount()).assertEqual(1);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1006
     * @tc.name MultiMedia_Storage_1006
     * @tc.desc Load ordered metadata and preserve explicit notification contract
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Storage_1006', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Storage_1006';
      LogicTestLog.begin(name, 'count=1;type=3');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      source.registerDataChangeListener(listener);
      LogicTestLog.number(name, 'initial total', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      const data: MediaData[] = createMediaRows(1, 113, 3);
      source.setDataArray(data);
      LogicTestLog.number(name, 'loaded total', 1, source.totalCount());
      expect(source.totalCount()).assertEqual(1);
      LogicTestLog.number(name, 'array length', 1, source.getDataArray().length);
      expect(source.getDataArray().length).assertEqual(1);
      LogicTestLog.value(name, 'array alias', String(true), String(source.getDataArray() === data));
      expect(source.getDataArray() === data).assertEqual(true);
      LogicTestLog.number(name, 'set does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      LogicTestLog.value(name, 'ordered URIs',
        String('/logic/item-113'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual('/logic/item-113');
      LogicTestLog.value(name, 'ordered names',
        String('item-113'),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        'item-113');
      LogicTestLog.value(name, 'item alias', String(true), String(source.getData(0) === data[0]));
      expect(source.getData(0) === data[0]).assertEqual(true);
      LogicTestLog.value(name, 'last uri', String('/logic/item-113'), String(source.getData(0).uri));
      expect(source.getData(0).uri).assertEqual('/logic/item-113');
      LogicTestLog.value(name, 'last displayName', String('item-113'), String(source.getData(0).displayName));
      expect(source.getData(0).displayName).assertEqual('item-113');
      LogicTestLog.number(name, 'last fileType', 3, source.getData(0).fileType);
      expect(source.getData(0).fileType).assertEqual(3);
      LogicTestLog.number(name, 'last duration', 113113, source.getData(0).duration);
      expect(source.getData(0).duration).assertEqual(113113);
      LogicTestLog.number(name, 'last dateAdded', 1700000113, source.getData(0).dateAdded);
      expect(source.getData(0).dateAdded).assertEqual(1700000113);
      source.notifyDataReload();
      LogicTestLog.value(name, 'explicit reload', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      LogicTestLog.number(name, 'reload preserves data', 1, source.totalCount());
      expect(source.totalCount()).assertEqual(1);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1007
     * @tc.name MultiMedia_Storage_1007
     * @tc.desc Load ordered metadata and preserve explicit notification contract
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Storage_1007', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Storage_1007';
      LogicTestLog.begin(name, 'count=1;type=4');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      source.registerDataChangeListener(listener);
      LogicTestLog.number(name, 'initial total', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      const data: MediaData[] = createMediaRows(1, 114, 4);
      source.setDataArray(data);
      LogicTestLog.number(name, 'loaded total', 1, source.totalCount());
      expect(source.totalCount()).assertEqual(1);
      LogicTestLog.number(name, 'array length', 1, source.getDataArray().length);
      expect(source.getDataArray().length).assertEqual(1);
      LogicTestLog.value(name, 'array alias', String(true), String(source.getDataArray() === data));
      expect(source.getDataArray() === data).assertEqual(true);
      LogicTestLog.number(name, 'set does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      LogicTestLog.value(name, 'ordered URIs',
        String('/logic/item-114'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual('/logic/item-114');
      LogicTestLog.value(name, 'ordered names',
        String('item-114'),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        'item-114');
      LogicTestLog.value(name, 'item alias', String(true), String(source.getData(0) === data[0]));
      expect(source.getData(0) === data[0]).assertEqual(true);
      LogicTestLog.value(name, 'last uri', String('/logic/item-114'), String(source.getData(0).uri));
      expect(source.getData(0).uri).assertEqual('/logic/item-114');
      LogicTestLog.value(name, 'last displayName', String('item-114'), String(source.getData(0).displayName));
      expect(source.getData(0).displayName).assertEqual('item-114');
      LogicTestLog.number(name, 'last fileType', 4, source.getData(0).fileType);
      expect(source.getData(0).fileType).assertEqual(4);
      LogicTestLog.number(name, 'last duration', 114114, source.getData(0).duration);
      expect(source.getData(0).duration).assertEqual(114114);
      LogicTestLog.number(name, 'last dateAdded', 1700000114, source.getData(0).dateAdded);
      expect(source.getData(0).dateAdded).assertEqual(1700000114);
      source.notifyDataReload();
      LogicTestLog.value(name, 'explicit reload', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      LogicTestLog.number(name, 'reload preserves data', 1, source.totalCount());
      expect(source.totalCount()).assertEqual(1);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1008
     * @tc.name MultiMedia_Storage_1008
     * @tc.desc Load ordered metadata and preserve explicit notification contract
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Storage_1008', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Storage_1008';
      LogicTestLog.begin(name, 'count=2;type=1');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      source.registerDataChangeListener(listener);
      LogicTestLog.number(name, 'initial total', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      const data: MediaData[] = createMediaRows(2, 121, 1);
      source.setDataArray(data);
      LogicTestLog.number(name, 'loaded total', 2, source.totalCount());
      expect(source.totalCount()).assertEqual(2);
      LogicTestLog.number(name, 'array length', 2, source.getDataArray().length);
      expect(source.getDataArray().length).assertEqual(2);
      LogicTestLog.value(name, 'array alias', String(true), String(source.getDataArray() === data));
      expect(source.getDataArray() === data).assertEqual(true);
      LogicTestLog.number(name, 'set does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      LogicTestLog.value(name, 'ordered URIs',
        String('/logic/item-121|/logic/item-122'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(
        '/logic/item-121|/logic/item-122');
      LogicTestLog.value(name, 'ordered names',
        String('item-121|item-122'),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        'item-121|item-122');
      LogicTestLog.value(name, 'item alias', String(true), String(source.getData(1) === data[1]));
      expect(source.getData(1) === data[1]).assertEqual(true);
      LogicTestLog.value(name, 'last uri', String('/logic/item-122'), String(source.getData(1).uri));
      expect(source.getData(1).uri).assertEqual('/logic/item-122');
      LogicTestLog.value(name, 'last displayName', String('item-122'), String(source.getData(1).displayName));
      expect(source.getData(1).displayName).assertEqual('item-122');
      LogicTestLog.number(name, 'last fileType', 1, source.getData(1).fileType);
      expect(source.getData(1).fileType).assertEqual(1);
      LogicTestLog.number(name, 'last duration', 122122, source.getData(1).duration);
      expect(source.getData(1).duration).assertEqual(122122);
      LogicTestLog.number(name, 'last dateAdded', 1700000122, source.getData(1).dateAdded);
      expect(source.getData(1).dateAdded).assertEqual(1700000122);
      source.notifyDataReload();
      LogicTestLog.value(name, 'explicit reload', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      LogicTestLog.number(name, 'reload preserves data', 2, source.totalCount());
      expect(source.totalCount()).assertEqual(2);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1009
     * @tc.name MultiMedia_Storage_1009
     * @tc.desc Load ordered metadata and preserve explicit notification contract
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Storage_1009', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Storage_1009';
      LogicTestLog.begin(name, 'count=2;type=2');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      source.registerDataChangeListener(listener);
      LogicTestLog.number(name, 'initial total', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      const data: MediaData[] = createMediaRows(2, 122, 2);
      source.setDataArray(data);
      LogicTestLog.number(name, 'loaded total', 2, source.totalCount());
      expect(source.totalCount()).assertEqual(2);
      LogicTestLog.number(name, 'array length', 2, source.getDataArray().length);
      expect(source.getDataArray().length).assertEqual(2);
      LogicTestLog.value(name, 'array alias', String(true), String(source.getDataArray() === data));
      expect(source.getDataArray() === data).assertEqual(true);
      LogicTestLog.number(name, 'set does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      LogicTestLog.value(name, 'ordered URIs',
        String('/logic/item-122|/logic/item-123'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(
        '/logic/item-122|/logic/item-123');
      LogicTestLog.value(name, 'ordered names',
        String('item-122|item-123'),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        'item-122|item-123');
      LogicTestLog.value(name, 'item alias', String(true), String(source.getData(1) === data[1]));
      expect(source.getData(1) === data[1]).assertEqual(true);
      LogicTestLog.value(name, 'last uri', String('/logic/item-123'), String(source.getData(1).uri));
      expect(source.getData(1).uri).assertEqual('/logic/item-123');
      LogicTestLog.value(name, 'last displayName', String('item-123'), String(source.getData(1).displayName));
      expect(source.getData(1).displayName).assertEqual('item-123');
      LogicTestLog.number(name, 'last fileType', 2, source.getData(1).fileType);
      expect(source.getData(1).fileType).assertEqual(2);
      LogicTestLog.number(name, 'last duration', 123123, source.getData(1).duration);
      expect(source.getData(1).duration).assertEqual(123123);
      LogicTestLog.number(name, 'last dateAdded', 1700000123, source.getData(1).dateAdded);
      expect(source.getData(1).dateAdded).assertEqual(1700000123);
      source.notifyDataReload();
      LogicTestLog.value(name, 'explicit reload', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      LogicTestLog.number(name, 'reload preserves data', 2, source.totalCount());
      expect(source.totalCount()).assertEqual(2);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1010
     * @tc.name MultiMedia_Storage_1010
     * @tc.desc Load ordered metadata and preserve explicit notification contract
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Storage_1010', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Storage_1010';
      LogicTestLog.begin(name, 'count=2;type=3');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      source.registerDataChangeListener(listener);
      LogicTestLog.number(name, 'initial total', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      const data: MediaData[] = createMediaRows(2, 123, 3);
      source.setDataArray(data);
      LogicTestLog.number(name, 'loaded total', 2, source.totalCount());
      expect(source.totalCount()).assertEqual(2);
      LogicTestLog.number(name, 'array length', 2, source.getDataArray().length);
      expect(source.getDataArray().length).assertEqual(2);
      LogicTestLog.value(name, 'array alias', String(true), String(source.getDataArray() === data));
      expect(source.getDataArray() === data).assertEqual(true);
      LogicTestLog.number(name, 'set does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      LogicTestLog.value(name, 'ordered URIs',
        String('/logic/item-123|/logic/item-124'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(
        '/logic/item-123|/logic/item-124');
      LogicTestLog.value(name, 'ordered names',
        String('item-123|item-124'),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        'item-123|item-124');
      LogicTestLog.value(name, 'item alias', String(true), String(source.getData(1) === data[1]));
      expect(source.getData(1) === data[1]).assertEqual(true);
      LogicTestLog.value(name, 'last uri', String('/logic/item-124'), String(source.getData(1).uri));
      expect(source.getData(1).uri).assertEqual('/logic/item-124');
      LogicTestLog.value(name, 'last displayName', String('item-124'), String(source.getData(1).displayName));
      expect(source.getData(1).displayName).assertEqual('item-124');
      LogicTestLog.number(name, 'last fileType', 3, source.getData(1).fileType);
      expect(source.getData(1).fileType).assertEqual(3);
      LogicTestLog.number(name, 'last duration', 124124, source.getData(1).duration);
      expect(source.getData(1).duration).assertEqual(124124);
      LogicTestLog.number(name, 'last dateAdded', 1700000124, source.getData(1).dateAdded);
      expect(source.getData(1).dateAdded).assertEqual(1700000124);
      source.notifyDataReload();
      LogicTestLog.value(name, 'explicit reload', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      LogicTestLog.number(name, 'reload preserves data', 2, source.totalCount());
      expect(source.totalCount()).assertEqual(2);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1011
     * @tc.name MultiMedia_Storage_1011
     * @tc.desc Load ordered metadata and preserve explicit notification contract
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Storage_1011', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Storage_1011';
      LogicTestLog.begin(name, 'count=2;type=4');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      source.registerDataChangeListener(listener);
      LogicTestLog.number(name, 'initial total', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      const data: MediaData[] = createMediaRows(2, 124, 4);
      source.setDataArray(data);
      LogicTestLog.number(name, 'loaded total', 2, source.totalCount());
      expect(source.totalCount()).assertEqual(2);
      LogicTestLog.number(name, 'array length', 2, source.getDataArray().length);
      expect(source.getDataArray().length).assertEqual(2);
      LogicTestLog.value(name, 'array alias', String(true), String(source.getDataArray() === data));
      expect(source.getDataArray() === data).assertEqual(true);
      LogicTestLog.number(name, 'set does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      LogicTestLog.value(name, 'ordered URIs',
        String('/logic/item-124|/logic/item-125'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(
        '/logic/item-124|/logic/item-125');
      LogicTestLog.value(name, 'ordered names',
        String('item-124|item-125'),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        'item-124|item-125');
      LogicTestLog.value(name, 'item alias', String(true), String(source.getData(1) === data[1]));
      expect(source.getData(1) === data[1]).assertEqual(true);
      LogicTestLog.value(name, 'last uri', String('/logic/item-125'), String(source.getData(1).uri));
      expect(source.getData(1).uri).assertEqual('/logic/item-125');
      LogicTestLog.value(name, 'last displayName', String('item-125'), String(source.getData(1).displayName));
      expect(source.getData(1).displayName).assertEqual('item-125');
      LogicTestLog.number(name, 'last fileType', 4, source.getData(1).fileType);
      expect(source.getData(1).fileType).assertEqual(4);
      LogicTestLog.number(name, 'last duration', 125125, source.getData(1).duration);
      expect(source.getData(1).duration).assertEqual(125125);
      LogicTestLog.number(name, 'last dateAdded', 1700000125, source.getData(1).dateAdded);
      expect(source.getData(1).dateAdded).assertEqual(1700000125);
      source.notifyDataReload();
      LogicTestLog.value(name, 'explicit reload', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      LogicTestLog.number(name, 'reload preserves data', 2, source.totalCount());
      expect(source.totalCount()).assertEqual(2);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1012
     * @tc.name MultiMedia_Storage_1012
     * @tc.desc Load ordered metadata and preserve explicit notification contract
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Storage_1012', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Storage_1012';
      LogicTestLog.begin(name, 'count=3;type=1');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      source.registerDataChangeListener(listener);
      LogicTestLog.number(name, 'initial total', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      const data: MediaData[] = createMediaRows(3, 131, 1);
      source.setDataArray(data);
      LogicTestLog.number(name, 'loaded total', 3, source.totalCount());
      expect(source.totalCount()).assertEqual(3);
      LogicTestLog.number(name, 'array length', 3, source.getDataArray().length);
      expect(source.getDataArray().length).assertEqual(3);
      LogicTestLog.value(name, 'array alias', String(true), String(source.getDataArray() === data));
      expect(source.getDataArray() === data).assertEqual(true);
      LogicTestLog.number(name, 'set does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      LogicTestLog.value(name, 'ordered URIs',
        String('/logic/item-131|/logic/item-132|/logic/item-133'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(
        '/logic/item-131|/logic/item-132|/logic/item-133');
      LogicTestLog.value(name, 'ordered names',
        String('item-131|item-132|item-133'),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        'item-131|item-132|item-133');
      LogicTestLog.value(name, 'item alias', String(true), String(source.getData(2) === data[2]));
      expect(source.getData(2) === data[2]).assertEqual(true);
      LogicTestLog.value(name, 'last uri', String('/logic/item-133'), String(source.getData(2).uri));
      expect(source.getData(2).uri).assertEqual('/logic/item-133');
      LogicTestLog.value(name, 'last displayName', String('item-133'), String(source.getData(2).displayName));
      expect(source.getData(2).displayName).assertEqual('item-133');
      LogicTestLog.number(name, 'last fileType', 1, source.getData(2).fileType);
      expect(source.getData(2).fileType).assertEqual(1);
      LogicTestLog.number(name, 'last duration', 133133, source.getData(2).duration);
      expect(source.getData(2).duration).assertEqual(133133);
      LogicTestLog.number(name, 'last dateAdded', 1700000133, source.getData(2).dateAdded);
      expect(source.getData(2).dateAdded).assertEqual(1700000133);
      source.notifyDataReload();
      LogicTestLog.value(name, 'explicit reload', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      LogicTestLog.number(name, 'reload preserves data', 3, source.totalCount());
      expect(source.totalCount()).assertEqual(3);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1013
     * @tc.name MultiMedia_Storage_1013
     * @tc.desc Load ordered metadata and preserve explicit notification contract
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Storage_1013', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Storage_1013';
      LogicTestLog.begin(name, 'count=3;type=2');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      source.registerDataChangeListener(listener);
      LogicTestLog.number(name, 'initial total', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      const data: MediaData[] = createMediaRows(3, 132, 2);
      source.setDataArray(data);
      LogicTestLog.number(name, 'loaded total', 3, source.totalCount());
      expect(source.totalCount()).assertEqual(3);
      LogicTestLog.number(name, 'array length', 3, source.getDataArray().length);
      expect(source.getDataArray().length).assertEqual(3);
      LogicTestLog.value(name, 'array alias', String(true), String(source.getDataArray() === data));
      expect(source.getDataArray() === data).assertEqual(true);
      LogicTestLog.number(name, 'set does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      LogicTestLog.value(name, 'ordered URIs',
        String('/logic/item-132|/logic/item-133|/logic/item-134'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(
        '/logic/item-132|/logic/item-133|/logic/item-134');
      LogicTestLog.value(name, 'ordered names',
        String('item-132|item-133|item-134'),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        'item-132|item-133|item-134');
      LogicTestLog.value(name, 'item alias', String(true), String(source.getData(2) === data[2]));
      expect(source.getData(2) === data[2]).assertEqual(true);
      LogicTestLog.value(name, 'last uri', String('/logic/item-134'), String(source.getData(2).uri));
      expect(source.getData(2).uri).assertEqual('/logic/item-134');
      LogicTestLog.value(name, 'last displayName', String('item-134'), String(source.getData(2).displayName));
      expect(source.getData(2).displayName).assertEqual('item-134');
      LogicTestLog.number(name, 'last fileType', 2, source.getData(2).fileType);
      expect(source.getData(2).fileType).assertEqual(2);
      LogicTestLog.number(name, 'last duration', 134134, source.getData(2).duration);
      expect(source.getData(2).duration).assertEqual(134134);
      LogicTestLog.number(name, 'last dateAdded', 1700000134, source.getData(2).dateAdded);
      expect(source.getData(2).dateAdded).assertEqual(1700000134);
      source.notifyDataReload();
      LogicTestLog.value(name, 'explicit reload', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      LogicTestLog.number(name, 'reload preserves data', 3, source.totalCount());
      expect(source.totalCount()).assertEqual(3);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1014
     * @tc.name MultiMedia_Storage_1014
     * @tc.desc Load ordered metadata and preserve explicit notification contract
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Storage_1014', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Storage_1014';
      LogicTestLog.begin(name, 'count=3;type=3');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      source.registerDataChangeListener(listener);
      LogicTestLog.number(name, 'initial total', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      const data: MediaData[] = createMediaRows(3, 133, 3);
      source.setDataArray(data);
      LogicTestLog.number(name, 'loaded total', 3, source.totalCount());
      expect(source.totalCount()).assertEqual(3);
      LogicTestLog.number(name, 'array length', 3, source.getDataArray().length);
      expect(source.getDataArray().length).assertEqual(3);
      LogicTestLog.value(name, 'array alias', String(true), String(source.getDataArray() === data));
      expect(source.getDataArray() === data).assertEqual(true);
      LogicTestLog.number(name, 'set does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      LogicTestLog.value(name, 'ordered URIs',
        String('/logic/item-133|/logic/item-134|/logic/item-135'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(
        '/logic/item-133|/logic/item-134|/logic/item-135');
      LogicTestLog.value(name, 'ordered names',
        String('item-133|item-134|item-135'),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        'item-133|item-134|item-135');
      LogicTestLog.value(name, 'item alias', String(true), String(source.getData(2) === data[2]));
      expect(source.getData(2) === data[2]).assertEqual(true);
      LogicTestLog.value(name, 'last uri', String('/logic/item-135'), String(source.getData(2).uri));
      expect(source.getData(2).uri).assertEqual('/logic/item-135');
      LogicTestLog.value(name, 'last displayName', String('item-135'), String(source.getData(2).displayName));
      expect(source.getData(2).displayName).assertEqual('item-135');
      LogicTestLog.number(name, 'last fileType', 3, source.getData(2).fileType);
      expect(source.getData(2).fileType).assertEqual(3);
      LogicTestLog.number(name, 'last duration', 135135, source.getData(2).duration);
      expect(source.getData(2).duration).assertEqual(135135);
      LogicTestLog.number(name, 'last dateAdded', 1700000135, source.getData(2).dateAdded);
      expect(source.getData(2).dateAdded).assertEqual(1700000135);
      source.notifyDataReload();
      LogicTestLog.value(name, 'explicit reload', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      LogicTestLog.number(name, 'reload preserves data', 3, source.totalCount());
      expect(source.totalCount()).assertEqual(3);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1015
     * @tc.name MultiMedia_Storage_1015
     * @tc.desc Load ordered metadata and preserve explicit notification contract
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Storage_1015', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Storage_1015';
      LogicTestLog.begin(name, 'count=3;type=4');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      source.registerDataChangeListener(listener);
      LogicTestLog.number(name, 'initial total', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      const data: MediaData[] = createMediaRows(3, 134, 4);
      source.setDataArray(data);
      LogicTestLog.number(name, 'loaded total', 3, source.totalCount());
      expect(source.totalCount()).assertEqual(3);
      LogicTestLog.number(name, 'array length', 3, source.getDataArray().length);
      expect(source.getDataArray().length).assertEqual(3);
      LogicTestLog.value(name, 'array alias', String(true), String(source.getDataArray() === data));
      expect(source.getDataArray() === data).assertEqual(true);
      LogicTestLog.number(name, 'set does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      LogicTestLog.value(name, 'ordered URIs',
        String('/logic/item-134|/logic/item-135|/logic/item-136'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(
        '/logic/item-134|/logic/item-135|/logic/item-136');
      LogicTestLog.value(name, 'ordered names',
        String('item-134|item-135|item-136'),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        'item-134|item-135|item-136');
      LogicTestLog.value(name, 'item alias', String(true), String(source.getData(2) === data[2]));
      expect(source.getData(2) === data[2]).assertEqual(true);
      LogicTestLog.value(name, 'last uri', String('/logic/item-136'), String(source.getData(2).uri));
      expect(source.getData(2).uri).assertEqual('/logic/item-136');
      LogicTestLog.value(name, 'last displayName', String('item-136'), String(source.getData(2).displayName));
      expect(source.getData(2).displayName).assertEqual('item-136');
      LogicTestLog.number(name, 'last fileType', 4, source.getData(2).fileType);
      expect(source.getData(2).fileType).assertEqual(4);
      LogicTestLog.number(name, 'last duration', 136136, source.getData(2).duration);
      expect(source.getData(2).duration).assertEqual(136136);
      LogicTestLog.number(name, 'last dateAdded', 1700000136, source.getData(2).dateAdded);
      expect(source.getData(2).dateAdded).assertEqual(1700000136);
      source.notifyDataReload();
      LogicTestLog.value(name, 'explicit reload', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      LogicTestLog.number(name, 'reload preserves data', 3, source.totalCount());
      expect(source.totalCount()).assertEqual(3);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1016
     * @tc.name MultiMedia_Storage_1016
     * @tc.desc Load ordered metadata and preserve explicit notification contract
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Storage_1016', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Storage_1016';
      LogicTestLog.begin(name, 'count=7;type=1');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      source.registerDataChangeListener(listener);
      LogicTestLog.number(name, 'initial total', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      const data: MediaData[] = createMediaRows(7, 171, 1);
      source.setDataArray(data);
      LogicTestLog.number(name, 'loaded total', 7, source.totalCount());
      expect(source.totalCount()).assertEqual(7);
      LogicTestLog.number(name, 'array length', 7, source.getDataArray().length);
      expect(source.getDataArray().length).assertEqual(7);
      LogicTestLog.value(name, 'array alias', String(true), String(source.getDataArray() === data));
      expect(source.getDataArray() === data).assertEqual(true);
      LogicTestLog.number(name, 'set does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      const expected0: string =
        '/logic/item-171|/logic/item-172|/logic/item-173|/logic/item-' +
        '174|/logic/item-175|/logic/item-176|/logic/item-177';
      LogicTestLog.value(name, 'ordered URIs',
        String(expected0),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected0);
      LogicTestLog.value(name, 'ordered names',
        String('item-171|item-172|item-173|item-174|item-175|item-176|item-177'),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        'item-171|item-172|item-173|item-174|item-175|item-176|item-177');
      LogicTestLog.value(name, 'item alias', String(true), String(source.getData(6) === data[6]));
      expect(source.getData(6) === data[6]).assertEqual(true);
      LogicTestLog.value(name, 'last uri', String('/logic/item-177'), String(source.getData(6).uri));
      expect(source.getData(6).uri).assertEqual('/logic/item-177');
      LogicTestLog.value(name, 'last displayName', String('item-177'), String(source.getData(6).displayName));
      expect(source.getData(6).displayName).assertEqual('item-177');
      LogicTestLog.number(name, 'last fileType', 1, source.getData(6).fileType);
      expect(source.getData(6).fileType).assertEqual(1);
      LogicTestLog.number(name, 'last duration', 177177, source.getData(6).duration);
      expect(source.getData(6).duration).assertEqual(177177);
      LogicTestLog.number(name, 'last dateAdded', 1700000177, source.getData(6).dateAdded);
      expect(source.getData(6).dateAdded).assertEqual(1700000177);
      source.notifyDataReload();
      LogicTestLog.value(name, 'explicit reload', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      LogicTestLog.number(name, 'reload preserves data', 7, source.totalCount());
      expect(source.totalCount()).assertEqual(7);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1017
     * @tc.name MultiMedia_Storage_1017
     * @tc.desc Load ordered metadata and preserve explicit notification contract
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Storage_1017', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Storage_1017';
      LogicTestLog.begin(name, 'count=7;type=2');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      source.registerDataChangeListener(listener);
      LogicTestLog.number(name, 'initial total', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      const data: MediaData[] = createMediaRows(7, 172, 2);
      source.setDataArray(data);
      LogicTestLog.number(name, 'loaded total', 7, source.totalCount());
      expect(source.totalCount()).assertEqual(7);
      LogicTestLog.number(name, 'array length', 7, source.getDataArray().length);
      expect(source.getDataArray().length).assertEqual(7);
      LogicTestLog.value(name, 'array alias', String(true), String(source.getDataArray() === data));
      expect(source.getDataArray() === data).assertEqual(true);
      LogicTestLog.number(name, 'set does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      const expected1: string =
        '/logic/item-172|/logic/item-173|/logic/item-174|/logic/item-' +
        '175|/logic/item-176|/logic/item-177|/logic/item-178';
      LogicTestLog.value(name, 'ordered URIs',
        String(expected1),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected1);
      LogicTestLog.value(name, 'ordered names',
        String('item-172|item-173|item-174|item-175|item-176|item-177|item-178'),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        'item-172|item-173|item-174|item-175|item-176|item-177|item-178');
      LogicTestLog.value(name, 'item alias', String(true), String(source.getData(6) === data[6]));
      expect(source.getData(6) === data[6]).assertEqual(true);
      LogicTestLog.value(name, 'last uri', String('/logic/item-178'), String(source.getData(6).uri));
      expect(source.getData(6).uri).assertEqual('/logic/item-178');
      LogicTestLog.value(name, 'last displayName', String('item-178'), String(source.getData(6).displayName));
      expect(source.getData(6).displayName).assertEqual('item-178');
      LogicTestLog.number(name, 'last fileType', 2, source.getData(6).fileType);
      expect(source.getData(6).fileType).assertEqual(2);
      LogicTestLog.number(name, 'last duration', 178178, source.getData(6).duration);
      expect(source.getData(6).duration).assertEqual(178178);
      LogicTestLog.number(name, 'last dateAdded', 1700000178, source.getData(6).dateAdded);
      expect(source.getData(6).dateAdded).assertEqual(1700000178);
      source.notifyDataReload();
      LogicTestLog.value(name, 'explicit reload', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      LogicTestLog.number(name, 'reload preserves data', 7, source.totalCount());
      expect(source.totalCount()).assertEqual(7);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1018
     * @tc.name MultiMedia_Storage_1018
     * @tc.desc Load ordered metadata and preserve explicit notification contract
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Storage_1018', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Storage_1018';
      LogicTestLog.begin(name, 'count=7;type=3');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      source.registerDataChangeListener(listener);
      LogicTestLog.number(name, 'initial total', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      const data: MediaData[] = createMediaRows(7, 173, 3);
      source.setDataArray(data);
      LogicTestLog.number(name, 'loaded total', 7, source.totalCount());
      expect(source.totalCount()).assertEqual(7);
      LogicTestLog.number(name, 'array length', 7, source.getDataArray().length);
      expect(source.getDataArray().length).assertEqual(7);
      LogicTestLog.value(name, 'array alias', String(true), String(source.getDataArray() === data));
      expect(source.getDataArray() === data).assertEqual(true);
      LogicTestLog.number(name, 'set does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      const expected2: string =
        '/logic/item-173|/logic/item-174|/logic/item-175|/logic/item-' +
        '176|/logic/item-177|/logic/item-178|/logic/item-179';
      LogicTestLog.value(name, 'ordered URIs',
        String(expected2),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected2);
      LogicTestLog.value(name, 'ordered names',
        String('item-173|item-174|item-175|item-176|item-177|item-178|item-179'),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        'item-173|item-174|item-175|item-176|item-177|item-178|item-179');
      LogicTestLog.value(name, 'item alias', String(true), String(source.getData(6) === data[6]));
      expect(source.getData(6) === data[6]).assertEqual(true);
      LogicTestLog.value(name, 'last uri', String('/logic/item-179'), String(source.getData(6).uri));
      expect(source.getData(6).uri).assertEqual('/logic/item-179');
      LogicTestLog.value(name, 'last displayName', String('item-179'), String(source.getData(6).displayName));
      expect(source.getData(6).displayName).assertEqual('item-179');
      LogicTestLog.number(name, 'last fileType', 3, source.getData(6).fileType);
      expect(source.getData(6).fileType).assertEqual(3);
      LogicTestLog.number(name, 'last duration', 179179, source.getData(6).duration);
      expect(source.getData(6).duration).assertEqual(179179);
      LogicTestLog.number(name, 'last dateAdded', 1700000179, source.getData(6).dateAdded);
      expect(source.getData(6).dateAdded).assertEqual(1700000179);
      source.notifyDataReload();
      LogicTestLog.value(name, 'explicit reload', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      LogicTestLog.number(name, 'reload preserves data', 7, source.totalCount());
      expect(source.totalCount()).assertEqual(7);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1019
     * @tc.name MultiMedia_Storage_1019
     * @tc.desc Load ordered metadata and preserve explicit notification contract
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Storage_1019', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Storage_1019';
      LogicTestLog.begin(name, 'count=7;type=4');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      source.registerDataChangeListener(listener);
      LogicTestLog.number(name, 'initial total', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      const data: MediaData[] = createMediaRows(7, 174, 4);
      source.setDataArray(data);
      LogicTestLog.number(name, 'loaded total', 7, source.totalCount());
      expect(source.totalCount()).assertEqual(7);
      LogicTestLog.number(name, 'array length', 7, source.getDataArray().length);
      expect(source.getDataArray().length).assertEqual(7);
      LogicTestLog.value(name, 'array alias', String(true), String(source.getDataArray() === data));
      expect(source.getDataArray() === data).assertEqual(true);
      LogicTestLog.number(name, 'set does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      const expected3: string =
        '/logic/item-174|/logic/item-175|/logic/item-176|/logic/item-' +
        '177|/logic/item-178|/logic/item-179|/logic/item-180';
      LogicTestLog.value(name, 'ordered URIs',
        String(expected3),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected3);
      LogicTestLog.value(name, 'ordered names',
        String('item-174|item-175|item-176|item-177|item-178|item-179|item-180'),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        'item-174|item-175|item-176|item-177|item-178|item-179|item-180');
      LogicTestLog.value(name, 'item alias', String(true), String(source.getData(6) === data[6]));
      expect(source.getData(6) === data[6]).assertEqual(true);
      LogicTestLog.value(name, 'last uri', String('/logic/item-180'), String(source.getData(6).uri));
      expect(source.getData(6).uri).assertEqual('/logic/item-180');
      LogicTestLog.value(name, 'last displayName', String('item-180'), String(source.getData(6).displayName));
      expect(source.getData(6).displayName).assertEqual('item-180');
      LogicTestLog.number(name, 'last fileType', 4, source.getData(6).fileType);
      expect(source.getData(6).fileType).assertEqual(4);
      LogicTestLog.number(name, 'last duration', 180180, source.getData(6).duration);
      expect(source.getData(6).duration).assertEqual(180180);
      LogicTestLog.number(name, 'last dateAdded', 1700000180, source.getData(6).dateAdded);
      expect(source.getData(6).dateAdded).assertEqual(1700000180);
      source.notifyDataReload();
      LogicTestLog.value(name, 'explicit reload', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      LogicTestLog.number(name, 'reload preserves data', 7, source.totalCount());
      expect(source.totalCount()).assertEqual(7);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1020
     * @tc.name MultiMedia_Storage_1020
     * @tc.desc Load ordered metadata and preserve explicit notification contract
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Storage_1020', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Storage_1020';
      LogicTestLog.begin(name, 'count=16;type=1');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      source.registerDataChangeListener(listener);
      LogicTestLog.number(name, 'initial total', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      const data: MediaData[] = createMediaRows(16, 261, 1);
      source.setDataArray(data);
      LogicTestLog.number(name, 'loaded total', 16, source.totalCount());
      expect(source.totalCount()).assertEqual(16);
      LogicTestLog.number(name, 'array length', 16, source.getDataArray().length);
      expect(source.getDataArray().length).assertEqual(16);
      LogicTestLog.value(name, 'array alias', String(true), String(source.getDataArray() === data));
      expect(source.getDataArray() === data).assertEqual(true);
      LogicTestLog.number(name, 'set does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      const expected4: string =
        '/logic/item-261|/logic/item-262|/logic/item-263|/logic/item-' +
        '264|/logic/item-265|/logic/item-266|/logic/item-267|/logic/i' +
        'tem-268|/logic/item-269|/logic/item-270|/logic/item-271|/log' +
        'ic/item-272|/logic/item-273|/logic/item-274|/logic/item-275|' +
        '/logic/item-276';
      LogicTestLog.value(name, 'ordered URIs',
        String(expected4),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected4);
      const expected5: string =
        'item-261|item-262|item-263|item-264|item-265|item-266|item-2' +
        '67|item-268|item-269|item-270|item-271|item-272|item-273|ite' +
        'm-274|item-275|item-276';
      LogicTestLog.value(name, 'ordered names',
        String(expected5),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(expected5);
      LogicTestLog.value(name, 'item alias', String(true), String(source.getData(15) === data[15]));
      expect(source.getData(15) === data[15]).assertEqual(true);
      LogicTestLog.value(name, 'last uri', String('/logic/item-276'), String(source.getData(15).uri));
      expect(source.getData(15).uri).assertEqual('/logic/item-276');
      LogicTestLog.value(name, 'last displayName', String('item-276'), String(source.getData(15).displayName));
      expect(source.getData(15).displayName).assertEqual('item-276');
      LogicTestLog.number(name, 'last fileType', 1, source.getData(15).fileType);
      expect(source.getData(15).fileType).assertEqual(1);
      LogicTestLog.number(name, 'last duration', 276276, source.getData(15).duration);
      expect(source.getData(15).duration).assertEqual(276276);
      LogicTestLog.number(name, 'last dateAdded', 1700000276, source.getData(15).dateAdded);
      expect(source.getData(15).dateAdded).assertEqual(1700000276);
      source.notifyDataReload();
      LogicTestLog.value(name, 'explicit reload', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      LogicTestLog.number(name, 'reload preserves data', 16, source.totalCount());
      expect(source.totalCount()).assertEqual(16);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1021
     * @tc.name MultiMedia_Storage_1021
     * @tc.desc Load ordered metadata and preserve explicit notification contract
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Storage_1021', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Storage_1021';
      LogicTestLog.begin(name, 'count=16;type=2');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      source.registerDataChangeListener(listener);
      LogicTestLog.number(name, 'initial total', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      const data: MediaData[] = createMediaRows(16, 262, 2);
      source.setDataArray(data);
      LogicTestLog.number(name, 'loaded total', 16, source.totalCount());
      expect(source.totalCount()).assertEqual(16);
      LogicTestLog.number(name, 'array length', 16, source.getDataArray().length);
      expect(source.getDataArray().length).assertEqual(16);
      LogicTestLog.value(name, 'array alias', String(true), String(source.getDataArray() === data));
      expect(source.getDataArray() === data).assertEqual(true);
      LogicTestLog.number(name, 'set does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      const expected6: string =
        '/logic/item-262|/logic/item-263|/logic/item-264|/logic/item-' +
        '265|/logic/item-266|/logic/item-267|/logic/item-268|/logic/i' +
        'tem-269|/logic/item-270|/logic/item-271|/logic/item-272|/log' +
        'ic/item-273|/logic/item-274|/logic/item-275|/logic/item-276|' +
        '/logic/item-277';
      LogicTestLog.value(name, 'ordered URIs',
        String(expected6),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected6);
      const expected7: string =
        'item-262|item-263|item-264|item-265|item-266|item-267|item-2' +
        '68|item-269|item-270|item-271|item-272|item-273|item-274|ite' +
        'm-275|item-276|item-277';
      LogicTestLog.value(name, 'ordered names',
        String(expected7),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(expected7);
      LogicTestLog.value(name, 'item alias', String(true), String(source.getData(15) === data[15]));
      expect(source.getData(15) === data[15]).assertEqual(true);
      LogicTestLog.value(name, 'last uri', String('/logic/item-277'), String(source.getData(15).uri));
      expect(source.getData(15).uri).assertEqual('/logic/item-277');
      LogicTestLog.value(name, 'last displayName', String('item-277'), String(source.getData(15).displayName));
      expect(source.getData(15).displayName).assertEqual('item-277');
      LogicTestLog.number(name, 'last fileType', 2, source.getData(15).fileType);
      expect(source.getData(15).fileType).assertEqual(2);
      LogicTestLog.number(name, 'last duration', 277277, source.getData(15).duration);
      expect(source.getData(15).duration).assertEqual(277277);
      LogicTestLog.number(name, 'last dateAdded', 1700000277, source.getData(15).dateAdded);
      expect(source.getData(15).dateAdded).assertEqual(1700000277);
      source.notifyDataReload();
      LogicTestLog.value(name, 'explicit reload', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      LogicTestLog.number(name, 'reload preserves data', 16, source.totalCount());
      expect(source.totalCount()).assertEqual(16);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1022
     * @tc.name MultiMedia_Storage_1022
     * @tc.desc Load ordered metadata and preserve explicit notification contract
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Storage_1022', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Storage_1022';
      LogicTestLog.begin(name, 'count=16;type=3');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      source.registerDataChangeListener(listener);
      LogicTestLog.number(name, 'initial total', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      const data: MediaData[] = createMediaRows(16, 263, 3);
      source.setDataArray(data);
      LogicTestLog.number(name, 'loaded total', 16, source.totalCount());
      expect(source.totalCount()).assertEqual(16);
      LogicTestLog.number(name, 'array length', 16, source.getDataArray().length);
      expect(source.getDataArray().length).assertEqual(16);
      LogicTestLog.value(name, 'array alias', String(true), String(source.getDataArray() === data));
      expect(source.getDataArray() === data).assertEqual(true);
      LogicTestLog.number(name, 'set does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      const expected8: string =
        '/logic/item-263|/logic/item-264|/logic/item-265|/logic/item-' +
        '266|/logic/item-267|/logic/item-268|/logic/item-269|/logic/i' +
        'tem-270|/logic/item-271|/logic/item-272|/logic/item-273|/log' +
        'ic/item-274|/logic/item-275|/logic/item-276|/logic/item-277|' +
        '/logic/item-278';
      LogicTestLog.value(name, 'ordered URIs',
        String(expected8),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected8);
      const expected9: string =
        'item-263|item-264|item-265|item-266|item-267|item-268|item-2' +
        '69|item-270|item-271|item-272|item-273|item-274|item-275|ite' +
        'm-276|item-277|item-278';
      LogicTestLog.value(name, 'ordered names',
        String(expected9),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(expected9);
      LogicTestLog.value(name, 'item alias', String(true), String(source.getData(15) === data[15]));
      expect(source.getData(15) === data[15]).assertEqual(true);
      LogicTestLog.value(name, 'last uri', String('/logic/item-278'), String(source.getData(15).uri));
      expect(source.getData(15).uri).assertEqual('/logic/item-278');
      LogicTestLog.value(name, 'last displayName', String('item-278'), String(source.getData(15).displayName));
      expect(source.getData(15).displayName).assertEqual('item-278');
      LogicTestLog.number(name, 'last fileType', 3, source.getData(15).fileType);
      expect(source.getData(15).fileType).assertEqual(3);
      LogicTestLog.number(name, 'last duration', 278278, source.getData(15).duration);
      expect(source.getData(15).duration).assertEqual(278278);
      LogicTestLog.number(name, 'last dateAdded', 1700000278, source.getData(15).dateAdded);
      expect(source.getData(15).dateAdded).assertEqual(1700000278);
      source.notifyDataReload();
      LogicTestLog.value(name, 'explicit reload', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      LogicTestLog.number(name, 'reload preserves data', 16, source.totalCount());
      expect(source.totalCount()).assertEqual(16);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1023
     * @tc.name MultiMedia_Storage_1023
     * @tc.desc Load ordered metadata and preserve explicit notification contract
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Storage_1023', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Storage_1023';
      LogicTestLog.begin(name, 'count=16;type=4');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      source.registerDataChangeListener(listener);
      LogicTestLog.number(name, 'initial total', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      const data: MediaData[] = createMediaRows(16, 264, 4);
      source.setDataArray(data);
      LogicTestLog.number(name, 'loaded total', 16, source.totalCount());
      expect(source.totalCount()).assertEqual(16);
      LogicTestLog.number(name, 'array length', 16, source.getDataArray().length);
      expect(source.getDataArray().length).assertEqual(16);
      LogicTestLog.value(name, 'array alias', String(true), String(source.getDataArray() === data));
      expect(source.getDataArray() === data).assertEqual(true);
      LogicTestLog.number(name, 'set does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      const expected10: string =
        '/logic/item-264|/logic/item-265|/logic/item-266|/logic/item-' +
        '267|/logic/item-268|/logic/item-269|/logic/item-270|/logic/i' +
        'tem-271|/logic/item-272|/logic/item-273|/logic/item-274|/log' +
        'ic/item-275|/logic/item-276|/logic/item-277|/logic/item-278|' +
        '/logic/item-279';
      LogicTestLog.value(name, 'ordered URIs',
        String(expected10),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected10);
      const expected11: string =
        'item-264|item-265|item-266|item-267|item-268|item-269|item-2' +
        '70|item-271|item-272|item-273|item-274|item-275|item-276|ite' +
        'm-277|item-278|item-279';
      LogicTestLog.value(name, 'ordered names',
        String(expected11),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        expected11);
      LogicTestLog.value(name, 'item alias', String(true), String(source.getData(15) === data[15]));
      expect(source.getData(15) === data[15]).assertEqual(true);
      LogicTestLog.value(name, 'last uri', String('/logic/item-279'), String(source.getData(15).uri));
      expect(source.getData(15).uri).assertEqual('/logic/item-279');
      LogicTestLog.value(name, 'last displayName', String('item-279'), String(source.getData(15).displayName));
      expect(source.getData(15).displayName).assertEqual('item-279');
      LogicTestLog.number(name, 'last fileType', 4, source.getData(15).fileType);
      expect(source.getData(15).fileType).assertEqual(4);
      LogicTestLog.number(name, 'last duration', 279279, source.getData(15).duration);
      expect(source.getData(15).duration).assertEqual(279279);
      LogicTestLog.number(name, 'last dateAdded', 1700000279, source.getData(15).dateAdded);
      expect(source.getData(15).dateAdded).assertEqual(1700000279);
      source.notifyDataReload();
      LogicTestLog.value(name, 'explicit reload', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      LogicTestLog.number(name, 'reload preserves data', 16, source.totalCount());
      expect(source.totalCount()).assertEqual(16);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1024
     * @tc.name MultiMedia_Storage_1024
     * @tc.desc Load ordered metadata and preserve explicit notification contract
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Storage_1024', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Storage_1024';
      LogicTestLog.begin(name, 'count=32;type=1');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      source.registerDataChangeListener(listener);
      LogicTestLog.number(name, 'initial total', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      const data: MediaData[] = createMediaRows(32, 421, 1);
      source.setDataArray(data);
      LogicTestLog.number(name, 'loaded total', 32, source.totalCount());
      expect(source.totalCount()).assertEqual(32);
      LogicTestLog.number(name, 'array length', 32, source.getDataArray().length);
      expect(source.getDataArray().length).assertEqual(32);
      LogicTestLog.value(name, 'array alias', String(true), String(source.getDataArray() === data));
      expect(source.getDataArray() === data).assertEqual(true);
      LogicTestLog.number(name, 'set does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      const expected12: string =
        '/logic/item-421|/logic/item-422|/logic/item-423|/logic/item-' +
        '424|/logic/item-425|/logic/item-426|/logic/item-427|/logic/i' +
        'tem-428|/logic/item-429|/logic/item-430|/logic/item-431|/log' +
        'ic/item-432|/logic/item-433|/logic/item-434|/logic/item-435|' +
        '/logic/item-436|/logic/item-437|/logic/item-438|/logic/item-' +
        '439|/logic/item-440|/logic/item-441|/logic/item-442|/logic/i' +
        'tem-443|/logic/item-444|/logic/item-445|/logic/item-446|/log' +
        'ic/item-447|/logic/item-448|/logic/item-449|/logic/item-450|' +
        '/logic/item-451|/logic/item-452';
      LogicTestLog.value(name, 'ordered URIs',
        String(expected12),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected12);
      const expected13: string =
        'item-421|item-422|item-423|item-424|item-425|item-426|item-4' +
        '27|item-428|item-429|item-430|item-431|item-432|item-433|ite' +
        'm-434|item-435|item-436|item-437|item-438|item-439|item-440|' +
        'item-441|item-442|item-443|item-444|item-445|item-446|item-4' +
        '47|item-448|item-449|item-450|item-451|item-452';
      LogicTestLog.value(name, 'ordered names',
        String(expected13),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        expected13);
      LogicTestLog.value(name, 'item alias', String(true), String(source.getData(31) === data[31]));
      expect(source.getData(31) === data[31]).assertEqual(true);
      LogicTestLog.value(name, 'last uri', String('/logic/item-452'), String(source.getData(31).uri));
      expect(source.getData(31).uri).assertEqual('/logic/item-452');
      LogicTestLog.value(name, 'last displayName', String('item-452'), String(source.getData(31).displayName));
      expect(source.getData(31).displayName).assertEqual('item-452');
      LogicTestLog.number(name, 'last fileType', 1, source.getData(31).fileType);
      expect(source.getData(31).fileType).assertEqual(1);
      LogicTestLog.number(name, 'last duration', 452452, source.getData(31).duration);
      expect(source.getData(31).duration).assertEqual(452452);
      LogicTestLog.number(name, 'last dateAdded', 1700000452, source.getData(31).dateAdded);
      expect(source.getData(31).dateAdded).assertEqual(1700000452);
      source.notifyDataReload();
      LogicTestLog.value(name, 'explicit reload', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      LogicTestLog.number(name, 'reload preserves data', 32, source.totalCount());
      expect(source.totalCount()).assertEqual(32);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1025
     * @tc.name MultiMedia_Storage_1025
     * @tc.desc Load ordered metadata and preserve explicit notification contract
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Storage_1025', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Storage_1025';
      LogicTestLog.begin(name, 'count=32;type=2');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      source.registerDataChangeListener(listener);
      LogicTestLog.number(name, 'initial total', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      const data: MediaData[] = createMediaRows(32, 422, 2);
      source.setDataArray(data);
      LogicTestLog.number(name, 'loaded total', 32, source.totalCount());
      expect(source.totalCount()).assertEqual(32);
      LogicTestLog.number(name, 'array length', 32, source.getDataArray().length);
      expect(source.getDataArray().length).assertEqual(32);
      LogicTestLog.value(name, 'array alias', String(true), String(source.getDataArray() === data));
      expect(source.getDataArray() === data).assertEqual(true);
      LogicTestLog.number(name, 'set does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      const expected14: string =
        '/logic/item-422|/logic/item-423|/logic/item-424|/logic/item-' +
        '425|/logic/item-426|/logic/item-427|/logic/item-428|/logic/i' +
        'tem-429|/logic/item-430|/logic/item-431|/logic/item-432|/log' +
        'ic/item-433|/logic/item-434|/logic/item-435|/logic/item-436|' +
        '/logic/item-437|/logic/item-438|/logic/item-439|/logic/item-' +
        '440|/logic/item-441|/logic/item-442|/logic/item-443|/logic/i' +
        'tem-444|/logic/item-445|/logic/item-446|/logic/item-447|/log' +
        'ic/item-448|/logic/item-449|/logic/item-450|/logic/item-451|' +
        '/logic/item-452|/logic/item-453';
      LogicTestLog.value(name, 'ordered URIs',
        String(expected14),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected14);
      const expected15: string =
        'item-422|item-423|item-424|item-425|item-426|item-427|item-4' +
        '28|item-429|item-430|item-431|item-432|item-433|item-434|ite' +
        'm-435|item-436|item-437|item-438|item-439|item-440|item-441|' +
        'item-442|item-443|item-444|item-445|item-446|item-447|item-4' +
        '48|item-449|item-450|item-451|item-452|item-453';
      LogicTestLog.value(name, 'ordered names',
        String(expected15),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        expected15);
      LogicTestLog.value(name, 'item alias', String(true), String(source.getData(31) === data[31]));
      expect(source.getData(31) === data[31]).assertEqual(true);
      LogicTestLog.value(name, 'last uri', String('/logic/item-453'), String(source.getData(31).uri));
      expect(source.getData(31).uri).assertEqual('/logic/item-453');
      LogicTestLog.value(name, 'last displayName', String('item-453'), String(source.getData(31).displayName));
      expect(source.getData(31).displayName).assertEqual('item-453');
      LogicTestLog.number(name, 'last fileType', 2, source.getData(31).fileType);
      expect(source.getData(31).fileType).assertEqual(2);
      LogicTestLog.number(name, 'last duration', 453453, source.getData(31).duration);
      expect(source.getData(31).duration).assertEqual(453453);
      LogicTestLog.number(name, 'last dateAdded', 1700000453, source.getData(31).dateAdded);
      expect(source.getData(31).dateAdded).assertEqual(1700000453);
      source.notifyDataReload();
      LogicTestLog.value(name, 'explicit reload', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      LogicTestLog.number(name, 'reload preserves data', 32, source.totalCount());
      expect(source.totalCount()).assertEqual(32);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1026
     * @tc.name MultiMedia_Storage_1026
     * @tc.desc Load ordered metadata and preserve explicit notification contract
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Storage_1026', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Storage_1026';
      LogicTestLog.begin(name, 'count=32;type=3');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      source.registerDataChangeListener(listener);
      LogicTestLog.number(name, 'initial total', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      const data: MediaData[] = createMediaRows(32, 423, 3);
      source.setDataArray(data);
      LogicTestLog.number(name, 'loaded total', 32, source.totalCount());
      expect(source.totalCount()).assertEqual(32);
      LogicTestLog.number(name, 'array length', 32, source.getDataArray().length);
      expect(source.getDataArray().length).assertEqual(32);
      LogicTestLog.value(name, 'array alias', String(true), String(source.getDataArray() === data));
      expect(source.getDataArray() === data).assertEqual(true);
      LogicTestLog.number(name, 'set does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      const expected16: string =
        '/logic/item-423|/logic/item-424|/logic/item-425|/logic/item-' +
        '426|/logic/item-427|/logic/item-428|/logic/item-429|/logic/i' +
        'tem-430|/logic/item-431|/logic/item-432|/logic/item-433|/log' +
        'ic/item-434|/logic/item-435|/logic/item-436|/logic/item-437|' +
        '/logic/item-438|/logic/item-439|/logic/item-440|/logic/item-' +
        '441|/logic/item-442|/logic/item-443|/logic/item-444|/logic/i' +
        'tem-445|/logic/item-446|/logic/item-447|/logic/item-448|/log' +
        'ic/item-449|/logic/item-450|/logic/item-451|/logic/item-452|' +
        '/logic/item-453|/logic/item-454';
      LogicTestLog.value(name, 'ordered URIs',
        String(expected16),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected16);
      const expected17: string =
        'item-423|item-424|item-425|item-426|item-427|item-428|item-4' +
        '29|item-430|item-431|item-432|item-433|item-434|item-435|ite' +
        'm-436|item-437|item-438|item-439|item-440|item-441|item-442|' +
        'item-443|item-444|item-445|item-446|item-447|item-448|item-4' +
        '49|item-450|item-451|item-452|item-453|item-454';
      LogicTestLog.value(name, 'ordered names',
        String(expected17),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        expected17);
      LogicTestLog.value(name, 'item alias', String(true), String(source.getData(31) === data[31]));
      expect(source.getData(31) === data[31]).assertEqual(true);
      LogicTestLog.value(name, 'last uri', String('/logic/item-454'), String(source.getData(31).uri));
      expect(source.getData(31).uri).assertEqual('/logic/item-454');
      LogicTestLog.value(name, 'last displayName', String('item-454'), String(source.getData(31).displayName));
      expect(source.getData(31).displayName).assertEqual('item-454');
      LogicTestLog.number(name, 'last fileType', 3, source.getData(31).fileType);
      expect(source.getData(31).fileType).assertEqual(3);
      LogicTestLog.number(name, 'last duration', 454454, source.getData(31).duration);
      expect(source.getData(31).duration).assertEqual(454454);
      LogicTestLog.number(name, 'last dateAdded', 1700000454, source.getData(31).dateAdded);
      expect(source.getData(31).dateAdded).assertEqual(1700000454);
      source.notifyDataReload();
      LogicTestLog.value(name, 'explicit reload', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      LogicTestLog.number(name, 'reload preserves data', 32, source.totalCount());
      expect(source.totalCount()).assertEqual(32);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1027
     * @tc.name MultiMedia_Storage_1027
     * @tc.desc Load ordered metadata and preserve explicit notification contract
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Storage_1027', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Storage_1027';
      LogicTestLog.begin(name, 'count=32;type=4');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      source.registerDataChangeListener(listener);
      LogicTestLog.number(name, 'initial total', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      const data: MediaData[] = createMediaRows(32, 424, 4);
      source.setDataArray(data);
      LogicTestLog.number(name, 'loaded total', 32, source.totalCount());
      expect(source.totalCount()).assertEqual(32);
      LogicTestLog.number(name, 'array length', 32, source.getDataArray().length);
      expect(source.getDataArray().length).assertEqual(32);
      LogicTestLog.value(name, 'array alias', String(true), String(source.getDataArray() === data));
      expect(source.getDataArray() === data).assertEqual(true);
      LogicTestLog.number(name, 'set does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      const expected18: string =
        '/logic/item-424|/logic/item-425|/logic/item-426|/logic/item-' +
        '427|/logic/item-428|/logic/item-429|/logic/item-430|/logic/i' +
        'tem-431|/logic/item-432|/logic/item-433|/logic/item-434|/log' +
        'ic/item-435|/logic/item-436|/logic/item-437|/logic/item-438|' +
        '/logic/item-439|/logic/item-440|/logic/item-441|/logic/item-' +
        '442|/logic/item-443|/logic/item-444|/logic/item-445|/logic/i' +
        'tem-446|/logic/item-447|/logic/item-448|/logic/item-449|/log' +
        'ic/item-450|/logic/item-451|/logic/item-452|/logic/item-453|' +
        '/logic/item-454|/logic/item-455';
      LogicTestLog.value(name, 'ordered URIs',
        String(expected18),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected18);
      const expected19: string =
        'item-424|item-425|item-426|item-427|item-428|item-429|item-4' +
        '30|item-431|item-432|item-433|item-434|item-435|item-436|ite' +
        'm-437|item-438|item-439|item-440|item-441|item-442|item-443|' +
        'item-444|item-445|item-446|item-447|item-448|item-449|item-4' +
        '50|item-451|item-452|item-453|item-454|item-455';
      LogicTestLog.value(name, 'ordered names',
        String(expected19),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        expected19);
      LogicTestLog.value(name, 'item alias', String(true), String(source.getData(31) === data[31]));
      expect(source.getData(31) === data[31]).assertEqual(true);
      LogicTestLog.value(name, 'last uri', String('/logic/item-455'), String(source.getData(31).uri));
      expect(source.getData(31).uri).assertEqual('/logic/item-455');
      LogicTestLog.value(name, 'last displayName', String('item-455'), String(source.getData(31).displayName));
      expect(source.getData(31).displayName).assertEqual('item-455');
      LogicTestLog.number(name, 'last fileType', 4, source.getData(31).fileType);
      expect(source.getData(31).fileType).assertEqual(4);
      LogicTestLog.number(name, 'last duration', 455455, source.getData(31).duration);
      expect(source.getData(31).duration).assertEqual(455455);
      LogicTestLog.number(name, 'last dateAdded', 1700000455, source.getData(31).dateAdded);
      expect(source.getData(31).dateAdded).assertEqual(1700000455);
      source.notifyDataReload();
      LogicTestLog.value(name, 'explicit reload', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      LogicTestLog.number(name, 'reload preserves data', 32, source.totalCount());
      expect(source.totalCount()).assertEqual(32);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1028
     * @tc.name MultiMedia_Storage_1028
     * @tc.desc Load ordered metadata and preserve explicit notification contract
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Storage_1028', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Storage_1028';
      LogicTestLog.begin(name, 'count=65;type=1');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      source.registerDataChangeListener(listener);
      LogicTestLog.number(name, 'initial total', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      const data: MediaData[] = createMediaRows(65, 751, 1);
      source.setDataArray(data);
      LogicTestLog.number(name, 'loaded total', 65, source.totalCount());
      expect(source.totalCount()).assertEqual(65);
      LogicTestLog.number(name, 'array length', 65, source.getDataArray().length);
      expect(source.getDataArray().length).assertEqual(65);
      LogicTestLog.value(name, 'array alias', String(true), String(source.getDataArray() === data));
      expect(source.getDataArray() === data).assertEqual(true);
      LogicTestLog.number(name, 'set does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      const expected20: string =
        '/logic/item-751|/logic/item-752|/logic/item-753|/logic/item-' +
        '754|/logic/item-755|/logic/item-756|/logic/item-757|/logic/i' +
        'tem-758|/logic/item-759|/logic/item-760|/logic/item-761|/log' +
        'ic/item-762|/logic/item-763|/logic/item-764|/logic/item-765|' +
        '/logic/item-766|/logic/item-767|/logic/item-768|/logic/item-' +
        '769|/logic/item-770|/logic/item-771|/logic/item-772|/logic/i' +
        'tem-773|/logic/item-774|/logic/item-775|/logic/item-776|/log' +
        'ic/item-777|/logic/item-778|/logic/item-779|/logic/item-780|' +
        '/logic/item-781|/logic/item-782|/logic/item-783|/logic/item-' +
        '784|/logic/item-785|/logic/item-786|/logic/item-787|/logic/i' +
        'tem-788|/logic/item-789|/logic/item-790|/logic/item-791|/log' +
        'ic/item-792|/logic/item-793|/logic/item-794|/logic/item-795|' +
        '/logic/item-796|/logic/item-797|/logic/item-798|/logic/item-' +
        '799|/logic/item-800|/logic/item-801|/logic/item-802|/logic/i' +
        'tem-803|/logic/item-804|/logic/item-805|/logic/item-806|/log' +
        'ic/item-807|/logic/item-808|/logic/item-809|/logic/item-810|' +
        '/logic/item-811|/logic/item-812|/logic/item-813|/logic/item-' +
        '814|/logic/item-815';
      LogicTestLog.value(name, 'ordered URIs',
        String(expected20),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected20);
      const expected21: string =
        'item-751|item-752|item-753|item-754|item-755|item-756|item-7' +
        '57|item-758|item-759|item-760|item-761|item-762|item-763|ite' +
        'm-764|item-765|item-766|item-767|item-768|item-769|item-770|' +
        'item-771|item-772|item-773|item-774|item-775|item-776|item-7' +
        '77|item-778|item-779|item-780|item-781|item-782|item-783|ite' +
        'm-784|item-785|item-786|item-787|item-788|item-789|item-790|' +
        'item-791|item-792|item-793|item-794|item-795|item-796|item-7' +
        '97|item-798|item-799|item-800|item-801|item-802|item-803|ite' +
        'm-804|item-805|item-806|item-807|item-808|item-809|item-810|' +
        'item-811|item-812|item-813|item-814|item-815';
      LogicTestLog.value(name, 'ordered names',
        String(expected21),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        expected21);
      LogicTestLog.value(name, 'item alias', String(true), String(source.getData(64) === data[64]));
      expect(source.getData(64) === data[64]).assertEqual(true);
      LogicTestLog.value(name, 'last uri', String('/logic/item-815'), String(source.getData(64).uri));
      expect(source.getData(64).uri).assertEqual('/logic/item-815');
      LogicTestLog.value(name, 'last displayName', String('item-815'), String(source.getData(64).displayName));
      expect(source.getData(64).displayName).assertEqual('item-815');
      LogicTestLog.number(name, 'last fileType', 1, source.getData(64).fileType);
      expect(source.getData(64).fileType).assertEqual(1);
      LogicTestLog.number(name, 'last duration', 815815, source.getData(64).duration);
      expect(source.getData(64).duration).assertEqual(815815);
      LogicTestLog.number(name, 'last dateAdded', 1700000815, source.getData(64).dateAdded);
      expect(source.getData(64).dateAdded).assertEqual(1700000815);
      source.notifyDataReload();
      LogicTestLog.value(name, 'explicit reload', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      LogicTestLog.number(name, 'reload preserves data', 65, source.totalCount());
      expect(source.totalCount()).assertEqual(65);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1029
     * @tc.name MultiMedia_Storage_1029
     * @tc.desc Load ordered metadata and preserve explicit notification contract
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Storage_1029', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Storage_1029';
      LogicTestLog.begin(name, 'count=65;type=2');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      source.registerDataChangeListener(listener);
      LogicTestLog.number(name, 'initial total', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      const data: MediaData[] = createMediaRows(65, 752, 2);
      source.setDataArray(data);
      LogicTestLog.number(name, 'loaded total', 65, source.totalCount());
      expect(source.totalCount()).assertEqual(65);
      LogicTestLog.number(name, 'array length', 65, source.getDataArray().length);
      expect(source.getDataArray().length).assertEqual(65);
      LogicTestLog.value(name, 'array alias', String(true), String(source.getDataArray() === data));
      expect(source.getDataArray() === data).assertEqual(true);
      LogicTestLog.number(name, 'set does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      const expected22: string =
        '/logic/item-752|/logic/item-753|/logic/item-754|/logic/item-' +
        '755|/logic/item-756|/logic/item-757|/logic/item-758|/logic/i' +
        'tem-759|/logic/item-760|/logic/item-761|/logic/item-762|/log' +
        'ic/item-763|/logic/item-764|/logic/item-765|/logic/item-766|' +
        '/logic/item-767|/logic/item-768|/logic/item-769|/logic/item-' +
        '770|/logic/item-771|/logic/item-772|/logic/item-773|/logic/i' +
        'tem-774|/logic/item-775|/logic/item-776|/logic/item-777|/log' +
        'ic/item-778|/logic/item-779|/logic/item-780|/logic/item-781|' +
        '/logic/item-782|/logic/item-783|/logic/item-784|/logic/item-' +
        '785|/logic/item-786|/logic/item-787|/logic/item-788|/logic/i' +
        'tem-789|/logic/item-790|/logic/item-791|/logic/item-792|/log' +
        'ic/item-793|/logic/item-794|/logic/item-795|/logic/item-796|' +
        '/logic/item-797|/logic/item-798|/logic/item-799|/logic/item-' +
        '800|/logic/item-801|/logic/item-802|/logic/item-803|/logic/i' +
        'tem-804|/logic/item-805|/logic/item-806|/logic/item-807|/log' +
        'ic/item-808|/logic/item-809|/logic/item-810|/logic/item-811|' +
        '/logic/item-812|/logic/item-813|/logic/item-814|/logic/item-' +
        '815|/logic/item-816';
      LogicTestLog.value(name, 'ordered URIs',
        String(expected22),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected22);
      const expected23: string =
        'item-752|item-753|item-754|item-755|item-756|item-757|item-7' +
        '58|item-759|item-760|item-761|item-762|item-763|item-764|ite' +
        'm-765|item-766|item-767|item-768|item-769|item-770|item-771|' +
        'item-772|item-773|item-774|item-775|item-776|item-777|item-7' +
        '78|item-779|item-780|item-781|item-782|item-783|item-784|ite' +
        'm-785|item-786|item-787|item-788|item-789|item-790|item-791|' +
        'item-792|item-793|item-794|item-795|item-796|item-797|item-7' +
        '98|item-799|item-800|item-801|item-802|item-803|item-804|ite' +
        'm-805|item-806|item-807|item-808|item-809|item-810|item-811|' +
        'item-812|item-813|item-814|item-815|item-816';
      LogicTestLog.value(name, 'ordered names',
        String(expected23),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        expected23);
      LogicTestLog.value(name, 'item alias', String(true), String(source.getData(64) === data[64]));
      expect(source.getData(64) === data[64]).assertEqual(true);
      LogicTestLog.value(name, 'last uri', String('/logic/item-816'), String(source.getData(64).uri));
      expect(source.getData(64).uri).assertEqual('/logic/item-816');
      LogicTestLog.value(name, 'last displayName', String('item-816'), String(source.getData(64).displayName));
      expect(source.getData(64).displayName).assertEqual('item-816');
      LogicTestLog.number(name, 'last fileType', 2, source.getData(64).fileType);
      expect(source.getData(64).fileType).assertEqual(2);
      LogicTestLog.number(name, 'last duration', 816816, source.getData(64).duration);
      expect(source.getData(64).duration).assertEqual(816816);
      LogicTestLog.number(name, 'last dateAdded', 1700000816, source.getData(64).dateAdded);
      expect(source.getData(64).dateAdded).assertEqual(1700000816);
      source.notifyDataReload();
      LogicTestLog.value(name, 'explicit reload', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      LogicTestLog.number(name, 'reload preserves data', 65, source.totalCount());
      expect(source.totalCount()).assertEqual(65);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1030
     * @tc.name MultiMedia_Storage_1030
     * @tc.desc Load ordered metadata and preserve explicit notification contract
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Storage_1030', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Storage_1030';
      LogicTestLog.begin(name, 'count=65;type=3');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      source.registerDataChangeListener(listener);
      LogicTestLog.number(name, 'initial total', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      const data: MediaData[] = createMediaRows(65, 753, 3);
      source.setDataArray(data);
      LogicTestLog.number(name, 'loaded total', 65, source.totalCount());
      expect(source.totalCount()).assertEqual(65);
      LogicTestLog.number(name, 'array length', 65, source.getDataArray().length);
      expect(source.getDataArray().length).assertEqual(65);
      LogicTestLog.value(name, 'array alias', String(true), String(source.getDataArray() === data));
      expect(source.getDataArray() === data).assertEqual(true);
      LogicTestLog.number(name, 'set does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      const expected24: string =
        '/logic/item-753|/logic/item-754|/logic/item-755|/logic/item-' +
        '756|/logic/item-757|/logic/item-758|/logic/item-759|/logic/i' +
        'tem-760|/logic/item-761|/logic/item-762|/logic/item-763|/log' +
        'ic/item-764|/logic/item-765|/logic/item-766|/logic/item-767|' +
        '/logic/item-768|/logic/item-769|/logic/item-770|/logic/item-' +
        '771|/logic/item-772|/logic/item-773|/logic/item-774|/logic/i' +
        'tem-775|/logic/item-776|/logic/item-777|/logic/item-778|/log' +
        'ic/item-779|/logic/item-780|/logic/item-781|/logic/item-782|' +
        '/logic/item-783|/logic/item-784|/logic/item-785|/logic/item-' +
        '786|/logic/item-787|/logic/item-788|/logic/item-789|/logic/i' +
        'tem-790|/logic/item-791|/logic/item-792|/logic/item-793|/log' +
        'ic/item-794|/logic/item-795|/logic/item-796|/logic/item-797|' +
        '/logic/item-798|/logic/item-799|/logic/item-800|/logic/item-' +
        '801|/logic/item-802|/logic/item-803|/logic/item-804|/logic/i' +
        'tem-805|/logic/item-806|/logic/item-807|/logic/item-808|/log' +
        'ic/item-809|/logic/item-810|/logic/item-811|/logic/item-812|' +
        '/logic/item-813|/logic/item-814|/logic/item-815|/logic/item-' +
        '816|/logic/item-817';
      LogicTestLog.value(name, 'ordered URIs',
        String(expected24),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected24);
      const expected25: string =
        'item-753|item-754|item-755|item-756|item-757|item-758|item-7' +
        '59|item-760|item-761|item-762|item-763|item-764|item-765|ite' +
        'm-766|item-767|item-768|item-769|item-770|item-771|item-772|' +
        'item-773|item-774|item-775|item-776|item-777|item-778|item-7' +
        '79|item-780|item-781|item-782|item-783|item-784|item-785|ite' +
        'm-786|item-787|item-788|item-789|item-790|item-791|item-792|' +
        'item-793|item-794|item-795|item-796|item-797|item-798|item-7' +
        '99|item-800|item-801|item-802|item-803|item-804|item-805|ite' +
        'm-806|item-807|item-808|item-809|item-810|item-811|item-812|' +
        'item-813|item-814|item-815|item-816|item-817';
      LogicTestLog.value(name, 'ordered names',
        String(expected25),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        expected25);
      LogicTestLog.value(name, 'item alias', String(true), String(source.getData(64) === data[64]));
      expect(source.getData(64) === data[64]).assertEqual(true);
      LogicTestLog.value(name, 'last uri', String('/logic/item-817'), String(source.getData(64).uri));
      expect(source.getData(64).uri).assertEqual('/logic/item-817');
      LogicTestLog.value(name, 'last displayName', String('item-817'), String(source.getData(64).displayName));
      expect(source.getData(64).displayName).assertEqual('item-817');
      LogicTestLog.number(name, 'last fileType', 3, source.getData(64).fileType);
      expect(source.getData(64).fileType).assertEqual(3);
      LogicTestLog.number(name, 'last duration', 817817, source.getData(64).duration);
      expect(source.getData(64).duration).assertEqual(817817);
      LogicTestLog.number(name, 'last dateAdded', 1700000817, source.getData(64).dateAdded);
      expect(source.getData(64).dateAdded).assertEqual(1700000817);
      source.notifyDataReload();
      LogicTestLog.value(name, 'explicit reload', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      LogicTestLog.number(name, 'reload preserves data', 65, source.totalCount());
      expect(source.totalCount()).assertEqual(65);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1031
     * @tc.name MultiMedia_Storage_1031
     * @tc.desc Load ordered metadata and preserve explicit notification contract
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Storage_1031', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Storage_1031';
      LogicTestLog.begin(name, 'count=65;type=4');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      source.registerDataChangeListener(listener);
      LogicTestLog.number(name, 'initial total', 0, source.totalCount());
      expect(source.totalCount()).assertEqual(0);
      const data: MediaData[] = createMediaRows(65, 754, 4);
      source.setDataArray(data);
      LogicTestLog.number(name, 'loaded total', 65, source.totalCount());
      expect(source.totalCount()).assertEqual(65);
      LogicTestLog.number(name, 'array length', 65, source.getDataArray().length);
      expect(source.getDataArray().length).assertEqual(65);
      LogicTestLog.value(name, 'array alias', String(true), String(source.getDataArray() === data));
      expect(source.getDataArray() === data).assertEqual(true);
      LogicTestLog.number(name, 'set does not notify', 0, listener.events.length);
      expect(listener.events.length).assertEqual(0);
      const expected26: string =
        '/logic/item-754|/logic/item-755|/logic/item-756|/logic/item-' +
        '757|/logic/item-758|/logic/item-759|/logic/item-760|/logic/i' +
        'tem-761|/logic/item-762|/logic/item-763|/logic/item-764|/log' +
        'ic/item-765|/logic/item-766|/logic/item-767|/logic/item-768|' +
        '/logic/item-769|/logic/item-770|/logic/item-771|/logic/item-' +
        '772|/logic/item-773|/logic/item-774|/logic/item-775|/logic/i' +
        'tem-776|/logic/item-777|/logic/item-778|/logic/item-779|/log' +
        'ic/item-780|/logic/item-781|/logic/item-782|/logic/item-783|' +
        '/logic/item-784|/logic/item-785|/logic/item-786|/logic/item-' +
        '787|/logic/item-788|/logic/item-789|/logic/item-790|/logic/i' +
        'tem-791|/logic/item-792|/logic/item-793|/logic/item-794|/log' +
        'ic/item-795|/logic/item-796|/logic/item-797|/logic/item-798|' +
        '/logic/item-799|/logic/item-800|/logic/item-801|/logic/item-' +
        '802|/logic/item-803|/logic/item-804|/logic/item-805|/logic/i' +
        'tem-806|/logic/item-807|/logic/item-808|/logic/item-809|/log' +
        'ic/item-810|/logic/item-811|/logic/item-812|/logic/item-813|' +
        '/logic/item-814|/logic/item-815|/logic/item-816|/logic/item-' +
        '817|/logic/item-818';
      LogicTestLog.value(name, 'ordered URIs',
        String(expected26),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected26);
      const expected27: string =
        'item-754|item-755|item-756|item-757|item-758|item-759|item-7' +
        '60|item-761|item-762|item-763|item-764|item-765|item-766|ite' +
        'm-767|item-768|item-769|item-770|item-771|item-772|item-773|' +
        'item-774|item-775|item-776|item-777|item-778|item-779|item-7' +
        '80|item-781|item-782|item-783|item-784|item-785|item-786|ite' +
        'm-787|item-788|item-789|item-790|item-791|item-792|item-793|' +
        'item-794|item-795|item-796|item-797|item-798|item-799|item-8' +
        '00|item-801|item-802|item-803|item-804|item-805|item-806|ite' +
        'm-807|item-808|item-809|item-810|item-811|item-812|item-813|' +
        'item-814|item-815|item-816|item-817|item-818';
      LogicTestLog.value(name, 'ordered names',
        String(expected27),
        String(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.displayName).join('|')).assertEqual(
        expected27);
      LogicTestLog.value(name, 'item alias', String(true), String(source.getData(64) === data[64]));
      expect(source.getData(64) === data[64]).assertEqual(true);
      LogicTestLog.value(name, 'last uri', String('/logic/item-818'), String(source.getData(64).uri));
      expect(source.getData(64).uri).assertEqual('/logic/item-818');
      LogicTestLog.value(name, 'last displayName', String('item-818'), String(source.getData(64).displayName));
      expect(source.getData(64).displayName).assertEqual('item-818');
      LogicTestLog.number(name, 'last fileType', 4, source.getData(64).fileType);
      expect(source.getData(64).fileType).assertEqual(4);
      LogicTestLog.number(name, 'last duration', 818818, source.getData(64).duration);
      expect(source.getData(64).duration).assertEqual(818818);
      LogicTestLog.number(name, 'last dateAdded', 1700000818, source.getData(64).dateAdded);
      expect(source.getData(64).dateAdded).assertEqual(1700000818);
      source.notifyDataReload();
      LogicTestLog.value(name, 'explicit reload', String('reload'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('reload');
      LogicTestLog.number(name, 'reload preserves data', 65, source.totalCount());
      expect(source.totalCount()).assertEqual(65);
      LogicTestLog.end(name);
    });
  });
}
