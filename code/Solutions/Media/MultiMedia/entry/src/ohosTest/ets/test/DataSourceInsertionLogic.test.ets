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

export default function DataSourceInsertionLogic(): void {
  describe('DataSourceInsertionLogic', (): void => {
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void): void => {
        setTimeout(resolve, 1);
      });
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1032
     * @tc.name MultiMedia_Insert_1032
     * @tc.desc Insert with normalized splice position but notify the original position
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Insert_1032', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Insert_1032';
      LogicTestLog.begin(name, 'length=0;index=-Infinity');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(0, 300, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      const inserted: MediaData = createMediaRows(1, 900, 3)[0];
      source.addData(Number.NEGATIVE_INFINITY, inserted);
      LogicTestLog.number(name, 'insert total', 1, source.totalCount());
      expect(source.totalCount()).assertEqual(1);
      LogicTestLog.number(name, 'aliased length', 1, original.length);
      expect(original.length).assertEqual(1);
      LogicTestLog.value(name, 'inserted reference', String(true), String(source.getData(0) === inserted));
      expect(source.getData(0) === inserted).assertEqual(true);
      LogicTestLog.value(name, 'inserted URI', String('/logic/item-900'), String(source.getData(0).uri));
      expect(source.getData(0).uri).assertEqual('/logic/item-900');
      LogicTestLog.number(name, 'inserted type', 3, source.getData(0).fileType);
      expect(source.getData(0).fileType).assertEqual(3);
      LogicTestLog.number(name, 'inserted duration', 900900, source.getData(0).duration);
      expect(source.getData(0).duration).assertEqual(900900);
      LogicTestLog.number(name, 'inserted timestamp', 1700000900, source.getData(0).dateAdded);
      expect(source.getData(0).dateAdded).assertEqual(1700000900);
      LogicTestLog.value(name, 'complete insertion order',
        String('/logic/item-900'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual('/logic/item-900');
      LogicTestLog.value(name, 'original notified index', String('add:-Infinity'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:-Infinity');
      source.pushData(createMediaRows(1, 901, 4)[0]);
      LogicTestLog.number(name, 'subsequent append total', 2, source.totalCount());
      expect(source.totalCount()).assertEqual(2);
      LogicTestLog.value(name, 'append position', String('/logic/item-901'), String(source.getData(1).uri));
      expect(source.getData(1).uri).assertEqual('/logic/item-901');
      LogicTestLog.value(name, 'append notification order',
        String('add:-Infinity|add:1'),
        String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:-Infinity|add:1');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1036
     * @tc.name MultiMedia_Insert_1036
     * @tc.desc Insert with normalized splice position but notify the original position
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Insert_1036', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Insert_1036';
      LogicTestLog.begin(name, 'length=0;index=-2');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(0, 300, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      const inserted: MediaData = createMediaRows(1, 900, 3)[0];
      source.addData(-2, inserted);
      LogicTestLog.number(name, 'insert total', 1, source.totalCount());
      expect(source.totalCount()).assertEqual(1);
      LogicTestLog.number(name, 'aliased length', 1, original.length);
      expect(original.length).assertEqual(1);
      LogicTestLog.value(name, 'inserted reference', String(true), String(source.getData(0) === inserted));
      expect(source.getData(0) === inserted).assertEqual(true);
      LogicTestLog.value(name, 'inserted URI', String('/logic/item-900'), String(source.getData(0).uri));
      expect(source.getData(0).uri).assertEqual('/logic/item-900');
      LogicTestLog.number(name, 'inserted type', 3, source.getData(0).fileType);
      expect(source.getData(0).fileType).assertEqual(3);
      LogicTestLog.number(name, 'inserted duration', 900900, source.getData(0).duration);
      expect(source.getData(0).duration).assertEqual(900900);
      LogicTestLog.number(name, 'inserted timestamp', 1700000900, source.getData(0).dateAdded);
      expect(source.getData(0).dateAdded).assertEqual(1700000900);
      LogicTestLog.value(name, 'complete insertion order',
        String('/logic/item-900'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual('/logic/item-900');
      LogicTestLog.value(name, 'original notified index', String('add:-2'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:-2');
      source.pushData(createMediaRows(1, 901, 4)[0]);
      LogicTestLog.number(name, 'subsequent append total', 2, source.totalCount());
      expect(source.totalCount()).assertEqual(2);
      LogicTestLog.value(name, 'append position', String('/logic/item-901'), String(source.getData(1).uri));
      expect(source.getData(1).uri).assertEqual('/logic/item-901');
      LogicTestLog.value(name, 'append notification order', String('add:-2|add:1'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:-2|add:1');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1040
     * @tc.name MultiMedia_Insert_1040
     * @tc.desc Insert with normalized splice position but notify the original position
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Insert_1040', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Insert_1040';
      LogicTestLog.begin(name, 'length=0;index=-1');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(0, 300, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      const inserted: MediaData = createMediaRows(1, 900, 3)[0];
      source.addData(-1, inserted);
      LogicTestLog.number(name, 'insert total', 1, source.totalCount());
      expect(source.totalCount()).assertEqual(1);
      LogicTestLog.number(name, 'aliased length', 1, original.length);
      expect(original.length).assertEqual(1);
      LogicTestLog.value(name, 'inserted reference', String(true), String(source.getData(0) === inserted));
      expect(source.getData(0) === inserted).assertEqual(true);
      LogicTestLog.value(name, 'inserted URI', String('/logic/item-900'), String(source.getData(0).uri));
      expect(source.getData(0).uri).assertEqual('/logic/item-900');
      LogicTestLog.number(name, 'inserted type', 3, source.getData(0).fileType);
      expect(source.getData(0).fileType).assertEqual(3);
      LogicTestLog.number(name, 'inserted duration', 900900, source.getData(0).duration);
      expect(source.getData(0).duration).assertEqual(900900);
      LogicTestLog.number(name, 'inserted timestamp', 1700000900, source.getData(0).dateAdded);
      expect(source.getData(0).dateAdded).assertEqual(1700000900);
      LogicTestLog.value(name, 'complete insertion order',
        String('/logic/item-900'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual('/logic/item-900');
      LogicTestLog.value(name, 'original notified index', String('add:-1'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:-1');
      source.pushData(createMediaRows(1, 901, 4)[0]);
      LogicTestLog.number(name, 'subsequent append total', 2, source.totalCount());
      expect(source.totalCount()).assertEqual(2);
      LogicTestLog.value(name, 'append position', String('/logic/item-901'), String(source.getData(1).uri));
      expect(source.getData(1).uri).assertEqual('/logic/item-901');
      LogicTestLog.value(name, 'append notification order', String('add:-1|add:1'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:-1|add:1');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1044
     * @tc.name MultiMedia_Insert_1044
     * @tc.desc Insert with normalized splice position but notify the original position
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Insert_1044', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Insert_1044';
      LogicTestLog.begin(name, 'length=0;index=-0.75');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(0, 300, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      const inserted: MediaData = createMediaRows(1, 900, 3)[0];
      source.addData(-0.75, inserted);
      LogicTestLog.number(name, 'insert total', 1, source.totalCount());
      expect(source.totalCount()).assertEqual(1);
      LogicTestLog.number(name, 'aliased length', 1, original.length);
      expect(original.length).assertEqual(1);
      LogicTestLog.value(name, 'inserted reference', String(true), String(source.getData(0) === inserted));
      expect(source.getData(0) === inserted).assertEqual(true);
      LogicTestLog.value(name, 'inserted URI', String('/logic/item-900'), String(source.getData(0).uri));
      expect(source.getData(0).uri).assertEqual('/logic/item-900');
      LogicTestLog.number(name, 'inserted type', 3, source.getData(0).fileType);
      expect(source.getData(0).fileType).assertEqual(3);
      LogicTestLog.number(name, 'inserted duration', 900900, source.getData(0).duration);
      expect(source.getData(0).duration).assertEqual(900900);
      LogicTestLog.number(name, 'inserted timestamp', 1700000900, source.getData(0).dateAdded);
      expect(source.getData(0).dateAdded).assertEqual(1700000900);
      LogicTestLog.value(name, 'complete insertion order',
        String('/logic/item-900'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual('/logic/item-900');
      LogicTestLog.value(name, 'original notified index', String('add:-0.75'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:-0.75');
      source.pushData(createMediaRows(1, 901, 4)[0]);
      LogicTestLog.number(name, 'subsequent append total', 2, source.totalCount());
      expect(source.totalCount()).assertEqual(2);
      LogicTestLog.value(name, 'append position', String('/logic/item-901'), String(source.getData(1).uri));
      expect(source.getData(1).uri).assertEqual('/logic/item-901');
      LogicTestLog.value(name, 'append notification order',
        String('add:-0.75|add:1'),
        String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:-0.75|add:1');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1048
     * @tc.name MultiMedia_Insert_1048
     * @tc.desc Insert with normalized splice position but notify the original position
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Insert_1048', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Insert_1048';
      LogicTestLog.begin(name, 'length=0;index=0');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(0, 300, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      const inserted: MediaData = createMediaRows(1, 900, 3)[0];
      source.addData(0, inserted);
      LogicTestLog.number(name, 'insert total', 1, source.totalCount());
      expect(source.totalCount()).assertEqual(1);
      LogicTestLog.number(name, 'aliased length', 1, original.length);
      expect(original.length).assertEqual(1);
      LogicTestLog.value(name, 'inserted reference', String(true), String(source.getData(0) === inserted));
      expect(source.getData(0) === inserted).assertEqual(true);
      LogicTestLog.value(name, 'inserted URI', String('/logic/item-900'), String(source.getData(0).uri));
      expect(source.getData(0).uri).assertEqual('/logic/item-900');
      LogicTestLog.number(name, 'inserted type', 3, source.getData(0).fileType);
      expect(source.getData(0).fileType).assertEqual(3);
      LogicTestLog.number(name, 'inserted duration', 900900, source.getData(0).duration);
      expect(source.getData(0).duration).assertEqual(900900);
      LogicTestLog.number(name, 'inserted timestamp', 1700000900, source.getData(0).dateAdded);
      expect(source.getData(0).dateAdded).assertEqual(1700000900);
      LogicTestLog.value(name, 'complete insertion order',
        String('/logic/item-900'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual('/logic/item-900');
      LogicTestLog.value(name, 'original notified index', String('add:0'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:0');
      source.pushData(createMediaRows(1, 901, 4)[0]);
      LogicTestLog.number(name, 'subsequent append total', 2, source.totalCount());
      expect(source.totalCount()).assertEqual(2);
      LogicTestLog.value(name, 'append position', String('/logic/item-901'), String(source.getData(1).uri));
      expect(source.getData(1).uri).assertEqual('/logic/item-901');
      LogicTestLog.value(name, 'append notification order', String('add:0|add:1'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:0|add:1');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1052
     * @tc.name MultiMedia_Insert_1052
     * @tc.desc Insert with normalized splice position but notify the original position
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Insert_1052', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Insert_1052';
      LogicTestLog.begin(name, 'length=0;index=0.75');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(0, 300, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      const inserted: MediaData = createMediaRows(1, 900, 3)[0];
      source.addData(0.75, inserted);
      LogicTestLog.number(name, 'insert total', 1, source.totalCount());
      expect(source.totalCount()).assertEqual(1);
      LogicTestLog.number(name, 'aliased length', 1, original.length);
      expect(original.length).assertEqual(1);
      LogicTestLog.value(name, 'inserted reference', String(true), String(source.getData(0) === inserted));
      expect(source.getData(0) === inserted).assertEqual(true);
      LogicTestLog.value(name, 'inserted URI', String('/logic/item-900'), String(source.getData(0).uri));
      expect(source.getData(0).uri).assertEqual('/logic/item-900');
      LogicTestLog.number(name, 'inserted type', 3, source.getData(0).fileType);
      expect(source.getData(0).fileType).assertEqual(3);
      LogicTestLog.number(name, 'inserted duration', 900900, source.getData(0).duration);
      expect(source.getData(0).duration).assertEqual(900900);
      LogicTestLog.number(name, 'inserted timestamp', 1700000900, source.getData(0).dateAdded);
      expect(source.getData(0).dateAdded).assertEqual(1700000900);
      LogicTestLog.value(name, 'complete insertion order',
        String('/logic/item-900'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual('/logic/item-900');
      LogicTestLog.value(name, 'original notified index', String('add:0.75'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:0.75');
      source.pushData(createMediaRows(1, 901, 4)[0]);
      LogicTestLog.number(name, 'subsequent append total', 2, source.totalCount());
      expect(source.totalCount()).assertEqual(2);
      LogicTestLog.value(name, 'append position', String('/logic/item-901'), String(source.getData(1).uri));
      expect(source.getData(1).uri).assertEqual('/logic/item-901');
      LogicTestLog.value(name, 'append notification order',
        String('add:0.75|add:1'),
        String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:0.75|add:1');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1056
     * @tc.name MultiMedia_Insert_1056
     * @tc.desc Insert with normalized splice position but notify the original position
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Insert_1056', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Insert_1056';
      LogicTestLog.begin(name, 'length=0;index=1');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(0, 300, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      const inserted: MediaData = createMediaRows(1, 900, 3)[0];
      source.addData(1, inserted);
      LogicTestLog.number(name, 'insert total', 1, source.totalCount());
      expect(source.totalCount()).assertEqual(1);
      LogicTestLog.number(name, 'aliased length', 1, original.length);
      expect(original.length).assertEqual(1);
      LogicTestLog.value(name, 'inserted reference', String(true), String(source.getData(0) === inserted));
      expect(source.getData(0) === inserted).assertEqual(true);
      LogicTestLog.value(name, 'inserted URI', String('/logic/item-900'), String(source.getData(0).uri));
      expect(source.getData(0).uri).assertEqual('/logic/item-900');
      LogicTestLog.number(name, 'inserted type', 3, source.getData(0).fileType);
      expect(source.getData(0).fileType).assertEqual(3);
      LogicTestLog.number(name, 'inserted duration', 900900, source.getData(0).duration);
      expect(source.getData(0).duration).assertEqual(900900);
      LogicTestLog.number(name, 'inserted timestamp', 1700000900, source.getData(0).dateAdded);
      expect(source.getData(0).dateAdded).assertEqual(1700000900);
      LogicTestLog.value(name, 'complete insertion order',
        String('/logic/item-900'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual('/logic/item-900');
      LogicTestLog.value(name, 'original notified index', String('add:1'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:1');
      source.pushData(createMediaRows(1, 901, 4)[0]);
      LogicTestLog.number(name, 'subsequent append total', 2, source.totalCount());
      expect(source.totalCount()).assertEqual(2);
      LogicTestLog.value(name, 'append position', String('/logic/item-901'), String(source.getData(1).uri));
      expect(source.getData(1).uri).assertEqual('/logic/item-901');
      LogicTestLog.value(name, 'append notification order', String('add:1|add:1'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:1|add:1');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1060
     * @tc.name MultiMedia_Insert_1060
     * @tc.desc Insert with normalized splice position but notify the original position
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Insert_1060', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Insert_1060';
      LogicTestLog.begin(name, 'length=0;index=2');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(0, 300, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      const inserted: MediaData = createMediaRows(1, 900, 3)[0];
      source.addData(2, inserted);
      LogicTestLog.number(name, 'insert total', 1, source.totalCount());
      expect(source.totalCount()).assertEqual(1);
      LogicTestLog.number(name, 'aliased length', 1, original.length);
      expect(original.length).assertEqual(1);
      LogicTestLog.value(name, 'inserted reference', String(true), String(source.getData(0) === inserted));
      expect(source.getData(0) === inserted).assertEqual(true);
      LogicTestLog.value(name, 'inserted URI', String('/logic/item-900'), String(source.getData(0).uri));
      expect(source.getData(0).uri).assertEqual('/logic/item-900');
      LogicTestLog.number(name, 'inserted type', 3, source.getData(0).fileType);
      expect(source.getData(0).fileType).assertEqual(3);
      LogicTestLog.number(name, 'inserted duration', 900900, source.getData(0).duration);
      expect(source.getData(0).duration).assertEqual(900900);
      LogicTestLog.number(name, 'inserted timestamp', 1700000900, source.getData(0).dateAdded);
      expect(source.getData(0).dateAdded).assertEqual(1700000900);
      LogicTestLog.value(name, 'complete insertion order',
        String('/logic/item-900'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual('/logic/item-900');
      LogicTestLog.value(name, 'original notified index', String('add:2'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:2');
      source.pushData(createMediaRows(1, 901, 4)[0]);
      LogicTestLog.number(name, 'subsequent append total', 2, source.totalCount());
      expect(source.totalCount()).assertEqual(2);
      LogicTestLog.value(name, 'append position', String('/logic/item-901'), String(source.getData(1).uri));
      expect(source.getData(1).uri).assertEqual('/logic/item-901');
      LogicTestLog.value(name, 'append notification order', String('add:2|add:1'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:2|add:1');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1064
     * @tc.name MultiMedia_Insert_1064
     * @tc.desc Insert with normalized splice position but notify the original position
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Insert_1064', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Insert_1064';
      LogicTestLog.begin(name, 'length=0;index=Infinity');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(0, 300, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      const inserted: MediaData = createMediaRows(1, 900, 3)[0];
      source.addData(Number.POSITIVE_INFINITY, inserted);
      LogicTestLog.number(name, 'insert total', 1, source.totalCount());
      expect(source.totalCount()).assertEqual(1);
      LogicTestLog.number(name, 'aliased length', 1, original.length);
      expect(original.length).assertEqual(1);
      LogicTestLog.value(name, 'inserted reference', String(true), String(source.getData(0) === inserted));
      expect(source.getData(0) === inserted).assertEqual(true);
      LogicTestLog.value(name, 'inserted URI', String('/logic/item-900'), String(source.getData(0).uri));
      expect(source.getData(0).uri).assertEqual('/logic/item-900');
      LogicTestLog.number(name, 'inserted type', 3, source.getData(0).fileType);
      expect(source.getData(0).fileType).assertEqual(3);
      LogicTestLog.number(name, 'inserted duration', 900900, source.getData(0).duration);
      expect(source.getData(0).duration).assertEqual(900900);
      LogicTestLog.number(name, 'inserted timestamp', 1700000900, source.getData(0).dateAdded);
      expect(source.getData(0).dateAdded).assertEqual(1700000900);
      LogicTestLog.value(name, 'complete insertion order',
        String('/logic/item-900'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual('/logic/item-900');
      LogicTestLog.value(name, 'original notified index', String('add:Infinity'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:Infinity');
      source.pushData(createMediaRows(1, 901, 4)[0]);
      LogicTestLog.number(name, 'subsequent append total', 2, source.totalCount());
      expect(source.totalCount()).assertEqual(2);
      LogicTestLog.value(name, 'append position', String('/logic/item-901'), String(source.getData(1).uri));
      expect(source.getData(1).uri).assertEqual('/logic/item-901');
      LogicTestLog.value(name, 'append notification order',
        String('add:Infinity|add:1'),
        String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:Infinity|add:1');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1068
     * @tc.name MultiMedia_Insert_1068
     * @tc.desc Insert with normalized splice position but notify the original position
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Insert_1068', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Insert_1068';
      LogicTestLog.begin(name, 'length=0;index=NaN');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(0, 300, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      const inserted: MediaData = createMediaRows(1, 900, 3)[0];
      source.addData(Number.NaN, inserted);
      LogicTestLog.number(name, 'insert total', 1, source.totalCount());
      expect(source.totalCount()).assertEqual(1);
      LogicTestLog.number(name, 'aliased length', 1, original.length);
      expect(original.length).assertEqual(1);
      LogicTestLog.value(name, 'inserted reference', String(true), String(source.getData(0) === inserted));
      expect(source.getData(0) === inserted).assertEqual(true);
      LogicTestLog.value(name, 'inserted URI', String('/logic/item-900'), String(source.getData(0).uri));
      expect(source.getData(0).uri).assertEqual('/logic/item-900');
      LogicTestLog.number(name, 'inserted type', 3, source.getData(0).fileType);
      expect(source.getData(0).fileType).assertEqual(3);
      LogicTestLog.number(name, 'inserted duration', 900900, source.getData(0).duration);
      expect(source.getData(0).duration).assertEqual(900900);
      LogicTestLog.number(name, 'inserted timestamp', 1700000900, source.getData(0).dateAdded);
      expect(source.getData(0).dateAdded).assertEqual(1700000900);
      LogicTestLog.value(name, 'complete insertion order',
        String('/logic/item-900'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual('/logic/item-900');
      LogicTestLog.value(name, 'original notified index', String('add:NaN'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:NaN');
      source.pushData(createMediaRows(1, 901, 4)[0]);
      LogicTestLog.number(name, 'subsequent append total', 2, source.totalCount());
      expect(source.totalCount()).assertEqual(2);
      LogicTestLog.value(name, 'append position', String('/logic/item-901'), String(source.getData(1).uri));
      expect(source.getData(1).uri).assertEqual('/logic/item-901');
      LogicTestLog.value(name, 'append notification order', String('add:NaN|add:1'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:NaN|add:1');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1072
     * @tc.name MultiMedia_Insert_1072
     * @tc.desc Insert with normalized splice position but notify the original position
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Insert_1072', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Insert_1072';
      LogicTestLog.begin(name, 'length=1;index=-Infinity');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(1, 301, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      const inserted: MediaData = createMediaRows(1, 900, 3)[0];
      source.addData(Number.NEGATIVE_INFINITY, inserted);
      LogicTestLog.number(name, 'insert total', 2, source.totalCount());
      expect(source.totalCount()).assertEqual(2);
      LogicTestLog.number(name, 'aliased length', 2, original.length);
      expect(original.length).assertEqual(2);
      LogicTestLog.value(name, 'inserted reference', String(true), String(source.getData(0) === inserted));
      expect(source.getData(0) === inserted).assertEqual(true);
      LogicTestLog.value(name, 'inserted URI', String('/logic/item-900'), String(source.getData(0).uri));
      expect(source.getData(0).uri).assertEqual('/logic/item-900');
      LogicTestLog.number(name, 'inserted type', 3, source.getData(0).fileType);
      expect(source.getData(0).fileType).assertEqual(3);
      LogicTestLog.number(name, 'inserted duration', 900900, source.getData(0).duration);
      expect(source.getData(0).duration).assertEqual(900900);
      LogicTestLog.number(name, 'inserted timestamp', 1700000900, source.getData(0).dateAdded);
      expect(source.getData(0).dateAdded).assertEqual(1700000900);
      LogicTestLog.value(name, 'complete insertion order',
        String('/logic/item-900|/logic/item-301'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(
        '/logic/item-900|/logic/item-301');
      LogicTestLog.value(name, 'original notified index', String('add:-Infinity'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:-Infinity');
      source.pushData(createMediaRows(1, 901, 4)[0]);
      LogicTestLog.number(name, 'subsequent append total', 3, source.totalCount());
      expect(source.totalCount()).assertEqual(3);
      LogicTestLog.value(name, 'append position', String('/logic/item-901'), String(source.getData(2).uri));
      expect(source.getData(2).uri).assertEqual('/logic/item-901');
      LogicTestLog.value(name, 'append notification order',
        String('add:-Infinity|add:2'),
        String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:-Infinity|add:2');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1076
     * @tc.name MultiMedia_Insert_1076
     * @tc.desc Insert with normalized splice position but notify the original position
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Insert_1076', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Insert_1076';
      LogicTestLog.begin(name, 'length=1;index=-3');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(1, 301, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      const inserted: MediaData = createMediaRows(1, 900, 3)[0];
      source.addData(-3, inserted);
      LogicTestLog.number(name, 'insert total', 2, source.totalCount());
      expect(source.totalCount()).assertEqual(2);
      LogicTestLog.number(name, 'aliased length', 2, original.length);
      expect(original.length).assertEqual(2);
      LogicTestLog.value(name, 'inserted reference', String(true), String(source.getData(0) === inserted));
      expect(source.getData(0) === inserted).assertEqual(true);
      LogicTestLog.value(name, 'inserted URI', String('/logic/item-900'), String(source.getData(0).uri));
      expect(source.getData(0).uri).assertEqual('/logic/item-900');
      LogicTestLog.number(name, 'inserted type', 3, source.getData(0).fileType);
      expect(source.getData(0).fileType).assertEqual(3);
      LogicTestLog.number(name, 'inserted duration', 900900, source.getData(0).duration);
      expect(source.getData(0).duration).assertEqual(900900);
      LogicTestLog.number(name, 'inserted timestamp', 1700000900, source.getData(0).dateAdded);
      expect(source.getData(0).dateAdded).assertEqual(1700000900);
      LogicTestLog.value(name, 'complete insertion order',
        String('/logic/item-900|/logic/item-301'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(
        '/logic/item-900|/logic/item-301');
      LogicTestLog.value(name, 'original notified index', String('add:-3'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:-3');
      source.pushData(createMediaRows(1, 901, 4)[0]);
      LogicTestLog.number(name, 'subsequent append total', 3, source.totalCount());
      expect(source.totalCount()).assertEqual(3);
      LogicTestLog.value(name, 'append position', String('/logic/item-901'), String(source.getData(2).uri));
      expect(source.getData(2).uri).assertEqual('/logic/item-901');
      LogicTestLog.value(name, 'append notification order', String('add:-3|add:2'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:-3|add:2');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1080
     * @tc.name MultiMedia_Insert_1080
     * @tc.desc Insert with normalized splice position but notify the original position
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Insert_1080', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Insert_1080';
      LogicTestLog.begin(name, 'length=1;index=-1');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(1, 301, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      const inserted: MediaData = createMediaRows(1, 900, 3)[0];
      source.addData(-1, inserted);
      LogicTestLog.number(name, 'insert total', 2, source.totalCount());
      expect(source.totalCount()).assertEqual(2);
      LogicTestLog.number(name, 'aliased length', 2, original.length);
      expect(original.length).assertEqual(2);
      LogicTestLog.value(name, 'inserted reference', String(true), String(source.getData(0) === inserted));
      expect(source.getData(0) === inserted).assertEqual(true);
      LogicTestLog.value(name, 'inserted URI', String('/logic/item-900'), String(source.getData(0).uri));
      expect(source.getData(0).uri).assertEqual('/logic/item-900');
      LogicTestLog.number(name, 'inserted type', 3, source.getData(0).fileType);
      expect(source.getData(0).fileType).assertEqual(3);
      LogicTestLog.number(name, 'inserted duration', 900900, source.getData(0).duration);
      expect(source.getData(0).duration).assertEqual(900900);
      LogicTestLog.number(name, 'inserted timestamp', 1700000900, source.getData(0).dateAdded);
      expect(source.getData(0).dateAdded).assertEqual(1700000900);
      LogicTestLog.value(name, 'complete insertion order',
        String('/logic/item-900|/logic/item-301'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(
        '/logic/item-900|/logic/item-301');
      LogicTestLog.value(name, 'original notified index', String('add:-1'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:-1');
      source.pushData(createMediaRows(1, 901, 4)[0]);
      LogicTestLog.number(name, 'subsequent append total', 3, source.totalCount());
      expect(source.totalCount()).assertEqual(3);
      LogicTestLog.value(name, 'append position', String('/logic/item-901'), String(source.getData(2).uri));
      expect(source.getData(2).uri).assertEqual('/logic/item-901');
      LogicTestLog.value(name, 'append notification order', String('add:-1|add:2'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:-1|add:2');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1084
     * @tc.name MultiMedia_Insert_1084
     * @tc.desc Insert with normalized splice position but notify the original position
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Insert_1084', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Insert_1084';
      LogicTestLog.begin(name, 'length=1;index=-0.75');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(1, 301, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      const inserted: MediaData = createMediaRows(1, 900, 3)[0];
      source.addData(-0.75, inserted);
      LogicTestLog.number(name, 'insert total', 2, source.totalCount());
      expect(source.totalCount()).assertEqual(2);
      LogicTestLog.number(name, 'aliased length', 2, original.length);
      expect(original.length).assertEqual(2);
      LogicTestLog.value(name, 'inserted reference', String(true), String(source.getData(0) === inserted));
      expect(source.getData(0) === inserted).assertEqual(true);
      LogicTestLog.value(name, 'inserted URI', String('/logic/item-900'), String(source.getData(0).uri));
      expect(source.getData(0).uri).assertEqual('/logic/item-900');
      LogicTestLog.number(name, 'inserted type', 3, source.getData(0).fileType);
      expect(source.getData(0).fileType).assertEqual(3);
      LogicTestLog.number(name, 'inserted duration', 900900, source.getData(0).duration);
      expect(source.getData(0).duration).assertEqual(900900);
      LogicTestLog.number(name, 'inserted timestamp', 1700000900, source.getData(0).dateAdded);
      expect(source.getData(0).dateAdded).assertEqual(1700000900);
      LogicTestLog.value(name, 'complete insertion order',
        String('/logic/item-900|/logic/item-301'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(
        '/logic/item-900|/logic/item-301');
      LogicTestLog.value(name, 'original notified index', String('add:-0.75'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:-0.75');
      source.pushData(createMediaRows(1, 901, 4)[0]);
      LogicTestLog.number(name, 'subsequent append total', 3, source.totalCount());
      expect(source.totalCount()).assertEqual(3);
      LogicTestLog.value(name, 'append position', String('/logic/item-901'), String(source.getData(2).uri));
      expect(source.getData(2).uri).assertEqual('/logic/item-901');
      LogicTestLog.value(name, 'append notification order',
        String('add:-0.75|add:2'),
        String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:-0.75|add:2');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1088
     * @tc.name MultiMedia_Insert_1088
     * @tc.desc Insert with normalized splice position but notify the original position
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Insert_1088', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Insert_1088';
      LogicTestLog.begin(name, 'length=1;index=0');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(1, 301, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      const inserted: MediaData = createMediaRows(1, 900, 3)[0];
      source.addData(0, inserted);
      LogicTestLog.number(name, 'insert total', 2, source.totalCount());
      expect(source.totalCount()).assertEqual(2);
      LogicTestLog.number(name, 'aliased length', 2, original.length);
      expect(original.length).assertEqual(2);
      LogicTestLog.value(name, 'inserted reference', String(true), String(source.getData(0) === inserted));
      expect(source.getData(0) === inserted).assertEqual(true);
      LogicTestLog.value(name, 'inserted URI', String('/logic/item-900'), String(source.getData(0).uri));
      expect(source.getData(0).uri).assertEqual('/logic/item-900');
      LogicTestLog.number(name, 'inserted type', 3, source.getData(0).fileType);
      expect(source.getData(0).fileType).assertEqual(3);
      LogicTestLog.number(name, 'inserted duration', 900900, source.getData(0).duration);
      expect(source.getData(0).duration).assertEqual(900900);
      LogicTestLog.number(name, 'inserted timestamp', 1700000900, source.getData(0).dateAdded);
      expect(source.getData(0).dateAdded).assertEqual(1700000900);
      LogicTestLog.value(name, 'complete insertion order',
        String('/logic/item-900|/logic/item-301'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(
        '/logic/item-900|/logic/item-301');
      LogicTestLog.value(name, 'original notified index', String('add:0'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:0');
      source.pushData(createMediaRows(1, 901, 4)[0]);
      LogicTestLog.number(name, 'subsequent append total', 3, source.totalCount());
      expect(source.totalCount()).assertEqual(3);
      LogicTestLog.value(name, 'append position', String('/logic/item-901'), String(source.getData(2).uri));
      expect(source.getData(2).uri).assertEqual('/logic/item-901');
      LogicTestLog.value(name, 'append notification order', String('add:0|add:2'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:0|add:2');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1092
     * @tc.name MultiMedia_Insert_1092
     * @tc.desc Insert with normalized splice position but notify the original position
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Insert_1092', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Insert_1092';
      LogicTestLog.begin(name, 'length=1;index=0.75');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(1, 301, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      const inserted: MediaData = createMediaRows(1, 900, 3)[0];
      source.addData(0.75, inserted);
      LogicTestLog.number(name, 'insert total', 2, source.totalCount());
      expect(source.totalCount()).assertEqual(2);
      LogicTestLog.number(name, 'aliased length', 2, original.length);
      expect(original.length).assertEqual(2);
      LogicTestLog.value(name, 'inserted reference', String(true), String(source.getData(0) === inserted));
      expect(source.getData(0) === inserted).assertEqual(true);
      LogicTestLog.value(name, 'inserted URI', String('/logic/item-900'), String(source.getData(0).uri));
      expect(source.getData(0).uri).assertEqual('/logic/item-900');
      LogicTestLog.number(name, 'inserted type', 3, source.getData(0).fileType);
      expect(source.getData(0).fileType).assertEqual(3);
      LogicTestLog.number(name, 'inserted duration', 900900, source.getData(0).duration);
      expect(source.getData(0).duration).assertEqual(900900);
      LogicTestLog.number(name, 'inserted timestamp', 1700000900, source.getData(0).dateAdded);
      expect(source.getData(0).dateAdded).assertEqual(1700000900);
      LogicTestLog.value(name, 'complete insertion order',
        String('/logic/item-900|/logic/item-301'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(
        '/logic/item-900|/logic/item-301');
      LogicTestLog.value(name, 'original notified index', String('add:0.75'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:0.75');
      source.pushData(createMediaRows(1, 901, 4)[0]);
      LogicTestLog.number(name, 'subsequent append total', 3, source.totalCount());
      expect(source.totalCount()).assertEqual(3);
      LogicTestLog.value(name, 'append position', String('/logic/item-901'), String(source.getData(2).uri));
      expect(source.getData(2).uri).assertEqual('/logic/item-901');
      LogicTestLog.value(name, 'append notification order',
        String('add:0.75|add:2'),
        String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:0.75|add:2');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1096
     * @tc.name MultiMedia_Insert_1096
     * @tc.desc Insert with normalized splice position but notify the original position
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Insert_1096', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Insert_1096';
      LogicTestLog.begin(name, 'length=1;index=1');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(1, 301, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      const inserted: MediaData = createMediaRows(1, 900, 3)[0];
      source.addData(1, inserted);
      LogicTestLog.number(name, 'insert total', 2, source.totalCount());
      expect(source.totalCount()).assertEqual(2);
      LogicTestLog.number(name, 'aliased length', 2, original.length);
      expect(original.length).assertEqual(2);
      LogicTestLog.value(name, 'inserted reference', String(true), String(source.getData(1) === inserted));
      expect(source.getData(1) === inserted).assertEqual(true);
      LogicTestLog.value(name, 'inserted URI', String('/logic/item-900'), String(source.getData(1).uri));
      expect(source.getData(1).uri).assertEqual('/logic/item-900');