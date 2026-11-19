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
      LogicTestLog.number(name, 'inserted type', 3, source.getData(1).fileType);
      expect(source.getData(1).fileType).assertEqual(3);
      LogicTestLog.number(name, 'inserted duration', 900900, source.getData(1).duration);
      expect(source.getData(1).duration).assertEqual(900900);
      LogicTestLog.number(name, 'inserted timestamp', 1700000900, source.getData(1).dateAdded);
      expect(source.getData(1).dateAdded).assertEqual(1700000900);
      LogicTestLog.value(name, 'complete insertion order',
        String('/logic/item-301|/logic/item-900'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(
        '/logic/item-301|/logic/item-900');
      LogicTestLog.value(name, 'original notified index', String('add:1'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:1');
      source.pushData(createMediaRows(1, 901, 4)[0]);
      LogicTestLog.number(name, 'subsequent append total', 3, source.totalCount());
      expect(source.totalCount()).assertEqual(3);
      LogicTestLog.value(name, 'append position', String('/logic/item-901'), String(source.getData(2).uri));
      expect(source.getData(2).uri).assertEqual('/logic/item-901');
      LogicTestLog.value(name, 'append notification order', String('add:1|add:2'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:1|add:2');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1100
     * @tc.name MultiMedia_Insert_1100
     * @tc.desc Insert with normalized splice position but notify the original position
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Insert_1100', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Insert_1100';
      LogicTestLog.begin(name, 'length=1;index=3');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(1, 301, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      const inserted: MediaData = createMediaRows(1, 900, 3)[0];
      source.addData(3, inserted);
      LogicTestLog.number(name, 'insert total', 2, source.totalCount());
      expect(source.totalCount()).assertEqual(2);
      LogicTestLog.number(name, 'aliased length', 2, original.length);
      expect(original.length).assertEqual(2);
      LogicTestLog.value(name, 'inserted reference', String(true), String(source.getData(1) === inserted));
      expect(source.getData(1) === inserted).assertEqual(true);
      LogicTestLog.value(name, 'inserted URI', String('/logic/item-900'), String(source.getData(1).uri));
      expect(source.getData(1).uri).assertEqual('/logic/item-900');
      LogicTestLog.number(name, 'inserted type', 3, source.getData(1).fileType);
      expect(source.getData(1).fileType).assertEqual(3);
      LogicTestLog.number(name, 'inserted duration', 900900, source.getData(1).duration);
      expect(source.getData(1).duration).assertEqual(900900);
      LogicTestLog.number(name, 'inserted timestamp', 1700000900, source.getData(1).dateAdded);
      expect(source.getData(1).dateAdded).assertEqual(1700000900);
      LogicTestLog.value(name, 'complete insertion order',
        String('/logic/item-301|/logic/item-900'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(
        '/logic/item-301|/logic/item-900');
      LogicTestLog.value(name, 'original notified index', String('add:3'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:3');
      source.pushData(createMediaRows(1, 901, 4)[0]);
      LogicTestLog.number(name, 'subsequent append total', 3, source.totalCount());
      expect(source.totalCount()).assertEqual(3);
      LogicTestLog.value(name, 'append position', String('/logic/item-901'), String(source.getData(2).uri));
      expect(source.getData(2).uri).assertEqual('/logic/item-901');
      LogicTestLog.value(name, 'append notification order', String('add:3|add:2'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:3|add:2');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1104
     * @tc.name MultiMedia_Insert_1104
     * @tc.desc Insert with normalized splice position but notify the original position
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Insert_1104', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Insert_1104';
      LogicTestLog.begin(name, 'length=1;index=Infinity');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(1, 301, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      const inserted: MediaData = createMediaRows(1, 900, 3)[0];
      source.addData(Number.POSITIVE_INFINITY, inserted);
      LogicTestLog.number(name, 'insert total', 2, source.totalCount());
      expect(source.totalCount()).assertEqual(2);
      LogicTestLog.number(name, 'aliased length', 2, original.length);
      expect(original.length).assertEqual(2);
      LogicTestLog.value(name, 'inserted reference', String(true), String(source.getData(1) === inserted));
      expect(source.getData(1) === inserted).assertEqual(true);
      LogicTestLog.value(name, 'inserted URI', String('/logic/item-900'), String(source.getData(1).uri));
      expect(source.getData(1).uri).assertEqual('/logic/item-900');
      LogicTestLog.number(name, 'inserted type', 3, source.getData(1).fileType);
      expect(source.getData(1).fileType).assertEqual(3);
      LogicTestLog.number(name, 'inserted duration', 900900, source.getData(1).duration);
      expect(source.getData(1).duration).assertEqual(900900);
      LogicTestLog.number(name, 'inserted timestamp', 1700000900, source.getData(1).dateAdded);
      expect(source.getData(1).dateAdded).assertEqual(1700000900);
      LogicTestLog.value(name, 'complete insertion order',
        String('/logic/item-301|/logic/item-900'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(
        '/logic/item-301|/logic/item-900');
      LogicTestLog.value(name, 'original notified index', String('add:Infinity'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:Infinity');
      source.pushData(createMediaRows(1, 901, 4)[0]);
      LogicTestLog.number(name, 'subsequent append total', 3, source.totalCount());
      expect(source.totalCount()).assertEqual(3);
      LogicTestLog.value(name, 'append position', String('/logic/item-901'), String(source.getData(2).uri));
      expect(source.getData(2).uri).assertEqual('/logic/item-901');
      LogicTestLog.value(name, 'append notification order',
        String('add:Infinity|add:2'),
        String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:Infinity|add:2');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1108
     * @tc.name MultiMedia_Insert_1108
     * @tc.desc Insert with normalized splice position but notify the original position
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Insert_1108', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Insert_1108';
      LogicTestLog.begin(name, 'length=1;index=NaN');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(1, 301, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      const inserted: MediaData = createMediaRows(1, 900, 3)[0];
      source.addData(Number.NaN, inserted);
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
      LogicTestLog.value(name, 'original notified index', String('add:NaN'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:NaN');
      source.pushData(createMediaRows(1, 901, 4)[0]);
      LogicTestLog.number(name, 'subsequent append total', 3, source.totalCount());
      expect(source.totalCount()).assertEqual(3);
      LogicTestLog.value(name, 'append position', String('/logic/item-901'), String(source.getData(2).uri));
      expect(source.getData(2).uri).assertEqual('/logic/item-901');
      LogicTestLog.value(name, 'append notification order', String('add:NaN|add:2'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:NaN|add:2');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1112
     * @tc.name MultiMedia_Insert_1112
     * @tc.desc Insert with normalized splice position but notify the original position
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Insert_1112', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Insert_1112';
      LogicTestLog.begin(name, 'length=3;index=-Infinity');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(3, 303, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      const inserted: MediaData = createMediaRows(1, 900, 3)[0];
      source.addData(Number.NEGATIVE_INFINITY, inserted);
      LogicTestLog.number(name, 'insert total', 4, source.totalCount());
      expect(source.totalCount()).assertEqual(4);
      LogicTestLog.number(name, 'aliased length', 4, original.length);
      expect(original.length).assertEqual(4);
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
        String('/logic/item-900|/logic/item-303|/logic/item-304|/logic/item-305'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(
        '/logic/item-900|/logic/item-303|/logic/item-304|/logic/item-305');
      LogicTestLog.value(name, 'original notified index', String('add:-Infinity'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:-Infinity');
      source.pushData(createMediaRows(1, 901, 4)[0]);
      LogicTestLog.number(name, 'subsequent append total', 5, source.totalCount());
      expect(source.totalCount()).assertEqual(5);
      LogicTestLog.value(name, 'append position', String('/logic/item-901'), String(source.getData(4).uri));
      expect(source.getData(4).uri).assertEqual('/logic/item-901');
      LogicTestLog.value(name, 'append notification order',
        String('add:-Infinity|add:4'),
        String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:-Infinity|add:4');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1116
     * @tc.name MultiMedia_Insert_1116
     * @tc.desc Insert with normalized splice position but notify the original position
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Insert_1116', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Insert_1116';
      LogicTestLog.begin(name, 'length=3;index=-5');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(3, 303, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      const inserted: MediaData = createMediaRows(1, 900, 3)[0];
      source.addData(-5, inserted);
      LogicTestLog.number(name, 'insert total', 4, source.totalCount());
      expect(source.totalCount()).assertEqual(4);
      LogicTestLog.number(name, 'aliased length', 4, original.length);
      expect(original.length).assertEqual(4);
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
        String('/logic/item-900|/logic/item-303|/logic/item-304|/logic/item-305'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(
        '/logic/item-900|/logic/item-303|/logic/item-304|/logic/item-305');
      LogicTestLog.value(name, 'original notified index', String('add:-5'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:-5');
      source.pushData(createMediaRows(1, 901, 4)[0]);
      LogicTestLog.number(name, 'subsequent append total', 5, source.totalCount());
      expect(source.totalCount()).assertEqual(5);
      LogicTestLog.value(name, 'append position', String('/logic/item-901'), String(source.getData(4).uri));
      expect(source.getData(4).uri).assertEqual('/logic/item-901');
      LogicTestLog.value(name, 'append notification order', String('add:-5|add:4'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:-5|add:4');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1120
     * @tc.name MultiMedia_Insert_1120
     * @tc.desc Insert with normalized splice position but notify the original position
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Insert_1120', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Insert_1120';
      LogicTestLog.begin(name, 'length=3;index=-1');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(3, 303, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      const inserted: MediaData = createMediaRows(1, 900, 3)[0];
      source.addData(-1, inserted);
      LogicTestLog.number(name, 'insert total', 4, source.totalCount());
      expect(source.totalCount()).assertEqual(4);
      LogicTestLog.number(name, 'aliased length', 4, original.length);
      expect(original.length).assertEqual(4);
      LogicTestLog.value(name, 'inserted reference', String(true), String(source.getData(2) === inserted));
      expect(source.getData(2) === inserted).assertEqual(true);
      LogicTestLog.value(name, 'inserted URI', String('/logic/item-900'), String(source.getData(2).uri));
      expect(source.getData(2).uri).assertEqual('/logic/item-900');
      LogicTestLog.number(name, 'inserted type', 3, source.getData(2).fileType);
      expect(source.getData(2).fileType).assertEqual(3);
      LogicTestLog.number(name, 'inserted duration', 900900, source.getData(2).duration);
      expect(source.getData(2).duration).assertEqual(900900);
      LogicTestLog.number(name, 'inserted timestamp', 1700000900, source.getData(2).dateAdded);
      expect(source.getData(2).dateAdded).assertEqual(1700000900);
      LogicTestLog.value(name, 'complete insertion order',
        String('/logic/item-303|/logic/item-304|/logic/item-900|/logic/item-305'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(
        '/logic/item-303|/logic/item-304|/logic/item-900|/logic/item-305');
      LogicTestLog.value(name, 'original notified index', String('add:-1'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:-1');
      source.pushData(createMediaRows(1, 901, 4)[0]);
      LogicTestLog.number(name, 'subsequent append total', 5, source.totalCount());
      expect(source.totalCount()).assertEqual(5);
      LogicTestLog.value(name, 'append position', String('/logic/item-901'), String(source.getData(4).uri));
      expect(source.getData(4).uri).assertEqual('/logic/item-901');
      LogicTestLog.value(name, 'append notification order', String('add:-1|add:4'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:-1|add:4');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1124
     * @tc.name MultiMedia_Insert_1124
     * @tc.desc Insert with normalized splice position but notify the original position
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Insert_1124', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Insert_1124';
      LogicTestLog.begin(name, 'length=3;index=-0.75');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(3, 303, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      const inserted: MediaData = createMediaRows(1, 900, 3)[0];
      source.addData(-0.75, inserted);
      LogicTestLog.number(name, 'insert total', 4, source.totalCount());
      expect(source.totalCount()).assertEqual(4);
      LogicTestLog.number(name, 'aliased length', 4, original.length);
      expect(original.length).assertEqual(4);
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
        String('/logic/item-900|/logic/item-303|/logic/item-304|/logic/item-305'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(
        '/logic/item-900|/logic/item-303|/logic/item-304|/logic/item-305');
      LogicTestLog.value(name, 'original notified index', String('add:-0.75'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:-0.75');
      source.pushData(createMediaRows(1, 901, 4)[0]);
      LogicTestLog.number(name, 'subsequent append total', 5, source.totalCount());
      expect(source.totalCount()).assertEqual(5);
      LogicTestLog.value(name, 'append position', String('/logic/item-901'), String(source.getData(4).uri));
      expect(source.getData(4).uri).assertEqual('/logic/item-901');
      LogicTestLog.value(name, 'append notification order',
        String('add:-0.75|add:4'),
        String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:-0.75|add:4');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1128
     * @tc.name MultiMedia_Insert_1128
     * @tc.desc Insert with normalized splice position but notify the original position
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Insert_1128', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Insert_1128';
      LogicTestLog.begin(name, 'length=3;index=0');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(3, 303, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      const inserted: MediaData = createMediaRows(1, 900, 3)[0];
      source.addData(0, inserted);
      LogicTestLog.number(name, 'insert total', 4, source.totalCount());
      expect(source.totalCount()).assertEqual(4);
      LogicTestLog.number(name, 'aliased length', 4, original.length);
      expect(original.length).assertEqual(4);
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
        String('/logic/item-900|/logic/item-303|/logic/item-304|/logic/item-305'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(
        '/logic/item-900|/logic/item-303|/logic/item-304|/logic/item-305');
      LogicTestLog.value(name, 'original notified index', String('add:0'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:0');
      source.pushData(createMediaRows(1, 901, 4)[0]);
      LogicTestLog.number(name, 'subsequent append total', 5, source.totalCount());
      expect(source.totalCount()).assertEqual(5);
      LogicTestLog.value(name, 'append position', String('/logic/item-901'), String(source.getData(4).uri));
      expect(source.getData(4).uri).assertEqual('/logic/item-901');
      LogicTestLog.value(name, 'append notification order', String('add:0|add:4'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:0|add:4');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1132
     * @tc.name MultiMedia_Insert_1132
     * @tc.desc Insert with normalized splice position but notify the original position
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Insert_1132', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Insert_1132';
      LogicTestLog.begin(name, 'length=3;index=0.75');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(3, 303, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      const inserted: MediaData = createMediaRows(1, 900, 3)[0];
      source.addData(0.75, inserted);
      LogicTestLog.number(name, 'insert total', 4, source.totalCount());
      expect(source.totalCount()).assertEqual(4);
      LogicTestLog.number(name, 'aliased length', 4, original.length);
      expect(original.length).assertEqual(4);
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
        String('/logic/item-900|/logic/item-303|/logic/item-304|/logic/item-305'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(
        '/logic/item-900|/logic/item-303|/logic/item-304|/logic/item-305');
      LogicTestLog.value(name, 'original notified index', String('add:0.75'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:0.75');
      source.pushData(createMediaRows(1, 901, 4)[0]);
      LogicTestLog.number(name, 'subsequent append total', 5, source.totalCount());
      expect(source.totalCount()).assertEqual(5);
      LogicTestLog.value(name, 'append position', String('/logic/item-901'), String(source.getData(4).uri));
      expect(source.getData(4).uri).assertEqual('/logic/item-901');
      LogicTestLog.value(name, 'append notification order',
        String('add:0.75|add:4'),
        String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:0.75|add:4');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1136
     * @tc.name MultiMedia_Insert_1136
     * @tc.desc Insert with normalized splice position but notify the original position
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Insert_1136', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Insert_1136';
      LogicTestLog.begin(name, 'length=3;index=1');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(3, 303, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      const inserted: MediaData = createMediaRows(1, 900, 3)[0];
      source.addData(1, inserted);
      LogicTestLog.number(name, 'insert total', 4, source.totalCount());
      expect(source.totalCount()).assertEqual(4);
      LogicTestLog.number(name, 'aliased length', 4, original.length);
      expect(original.length).assertEqual(4);
      LogicTestLog.value(name, 'inserted reference', String(true), String(source.getData(1) === inserted));
      expect(source.getData(1) === inserted).assertEqual(true);
      LogicTestLog.value(name, 'inserted URI', String('/logic/item-900'), String(source.getData(1).uri));
      expect(source.getData(1).uri).assertEqual('/logic/item-900');
      LogicTestLog.number(name, 'inserted type', 3, source.getData(1).fileType);
      expect(source.getData(1).fileType).assertEqual(3);
      LogicTestLog.number(name, 'inserted duration', 900900, source.getData(1).duration);
      expect(source.getData(1).duration).assertEqual(900900);
      LogicTestLog.number(name, 'inserted timestamp', 1700000900, source.getData(1).dateAdded);
      expect(source.getData(1).dateAdded).assertEqual(1700000900);
      LogicTestLog.value(name, 'complete insertion order',
        String('/logic/item-303|/logic/item-900|/logic/item-304|/logic/item-305'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(
        '/logic/item-303|/logic/item-900|/logic/item-304|/logic/item-305');
      LogicTestLog.value(name, 'original notified index', String('add:1'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:1');
      source.pushData(createMediaRows(1, 901, 4)[0]);
      LogicTestLog.number(name, 'subsequent append total', 5, source.totalCount());
      expect(source.totalCount()).assertEqual(5);
      LogicTestLog.value(name, 'append position', String('/logic/item-901'), String(source.getData(4).uri));
      expect(source.getData(4).uri).assertEqual('/logic/item-901');
      LogicTestLog.value(name, 'append notification order', String('add:1|add:4'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:1|add:4');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1140
     * @tc.name MultiMedia_Insert_1140
     * @tc.desc Insert with normalized splice position but notify the original position
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Insert_1140', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Insert_1140';
      LogicTestLog.begin(name, 'length=3;index=2');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(3, 303, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      const inserted: MediaData = createMediaRows(1, 900, 3)[0];
      source.addData(2, inserted);
      LogicTestLog.number(name, 'insert total', 4, source.totalCount());
      expect(source.totalCount()).assertEqual(4);
      LogicTestLog.number(name, 'aliased length', 4, original.length);
      expect(original.length).assertEqual(4);
      LogicTestLog.value(name, 'inserted reference', String(true), String(source.getData(2) === inserted));
      expect(source.getData(2) === inserted).assertEqual(true);
      LogicTestLog.value(name, 'inserted URI', String('/logic/item-900'), String(source.getData(2).uri));
      expect(source.getData(2).uri).assertEqual('/logic/item-900');
      LogicTestLog.number(name, 'inserted type', 3, source.getData(2).fileType);
      expect(source.getData(2).fileType).assertEqual(3);
      LogicTestLog.number(name, 'inserted duration', 900900, source.getData(2).duration);
      expect(source.getData(2).duration).assertEqual(900900);
      LogicTestLog.number(name, 'inserted timestamp', 1700000900, source.getData(2).dateAdded);
      expect(source.getData(2).dateAdded).assertEqual(1700000900);
      LogicTestLog.value(name, 'complete insertion order',
        String('/logic/item-303|/logic/item-304|/logic/item-900|/logic/item-305'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(
        '/logic/item-303|/logic/item-304|/logic/item-900|/logic/item-305');
      LogicTestLog.value(name, 'original notified index', String('add:2'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:2');
      source.pushData(createMediaRows(1, 901, 4)[0]);
      LogicTestLog.number(name, 'subsequent append total', 5, source.totalCount());
      expect(source.totalCount()).assertEqual(5);
      LogicTestLog.value(name, 'append position', String('/logic/item-901'), String(source.getData(4).uri));
      expect(source.getData(4).uri).assertEqual('/logic/item-901');
      LogicTestLog.value(name, 'append notification order', String('add:2|add:4'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:2|add:4');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1144
     * @tc.name MultiMedia_Insert_1144
     * @tc.desc Insert with normalized splice position but notify the original position
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Insert_1144', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Insert_1144';
      LogicTestLog.begin(name, 'length=3;index=3');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(3, 303, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      const inserted: MediaData = createMediaRows(1, 900, 3)[0];
      source.addData(3, inserted);
      LogicTestLog.number(name, 'insert total', 4, source.totalCount());
      expect(source.totalCount()).assertEqual(4);
      LogicTestLog.number(name, 'aliased length', 4, original.length);
      expect(original.length).assertEqual(4);
      LogicTestLog.value(name, 'inserted reference', String(true), String(source.getData(3) === inserted));
      expect(source.getData(3) === inserted).assertEqual(true);
      LogicTestLog.value(name, 'inserted URI', String('/logic/item-900'), String(source.getData(3).uri));
      expect(source.getData(3).uri).assertEqual('/logic/item-900');
      LogicTestLog.number(name, 'inserted type', 3, source.getData(3).fileType);
      expect(source.getData(3).fileType).assertEqual(3);
      LogicTestLog.number(name, 'inserted duration', 900900, source.getData(3).duration);
      expect(source.getData(3).duration).assertEqual(900900);
      LogicTestLog.number(name, 'inserted timestamp', 1700000900, source.getData(3).dateAdded);
      expect(source.getData(3).dateAdded).assertEqual(1700000900);
      LogicTestLog.value(name, 'complete insertion order',
        String('/logic/item-303|/logic/item-304|/logic/item-305|/logic/item-900'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(
        '/logic/item-303|/logic/item-304|/logic/item-305|/logic/item-900');
      LogicTestLog.value(name, 'original notified index', String('add:3'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:3');
      source.pushData(createMediaRows(1, 901, 4)[0]);
      LogicTestLog.number(name, 'subsequent append total', 5, source.totalCount());
      expect(source.totalCount()).assertEqual(5);
      LogicTestLog.value(name, 'append position', String('/logic/item-901'), String(source.getData(4).uri));
      expect(source.getData(4).uri).assertEqual('/logic/item-901');
      LogicTestLog.value(name, 'append notification order', String('add:3|add:4'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:3|add:4');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1148
     * @tc.name MultiMedia_Insert_1148
     * @tc.desc Insert with normalized splice position but notify the original position
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Insert_1148', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Insert_1148';
      LogicTestLog.begin(name, 'length=3;index=5');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(3, 303, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      const inserted: MediaData = createMediaRows(1, 900, 3)[0];
      source.addData(5, inserted);
      LogicTestLog.number(name, 'insert total', 4, source.totalCount());
      expect(source.totalCount()).assertEqual(4);
      LogicTestLog.number(name, 'aliased length', 4, original.length);
      expect(original.length).assertEqual(4);
      LogicTestLog.value(name, 'inserted reference', String(true), String(source.getData(3) === inserted));
      expect(source.getData(3) === inserted).assertEqual(true);
      LogicTestLog.value(name, 'inserted URI', String('/logic/item-900'), String(source.getData(3).uri));
      expect(source.getData(3).uri).assertEqual('/logic/item-900');
      LogicTestLog.number(name, 'inserted type', 3, source.getData(3).fileType);
      expect(source.getData(3).fileType).assertEqual(3);
      LogicTestLog.number(name, 'inserted duration', 900900, source.getData(3).duration);
      expect(source.getData(3).duration).assertEqual(900900);
      LogicTestLog.number(name, 'inserted timestamp', 1700000900, source.getData(3).dateAdded);
      expect(source.getData(3).dateAdded).assertEqual(1700000900);
      LogicTestLog.value(name, 'complete insertion order',
        String('/logic/item-303|/logic/item-304|/logic/item-305|/logic/item-900'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(
        '/logic/item-303|/logic/item-304|/logic/item-305|/logic/item-900');
      LogicTestLog.value(name, 'original notified index', String('add:5'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:5');
      source.pushData(createMediaRows(1, 901, 4)[0]);
      LogicTestLog.number(name, 'subsequent append total', 5, source.totalCount());
      expect(source.totalCount()).assertEqual(5);
      LogicTestLog.value(name, 'append position', String('/logic/item-901'), String(source.getData(4).uri));
      expect(source.getData(4).uri).assertEqual('/logic/item-901');
      LogicTestLog.value(name, 'append notification order', String('add:5|add:4'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:5|add:4');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1152
     * @tc.name MultiMedia_Insert_1152
     * @tc.desc Insert with normalized splice position but notify the original position
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Insert_1152', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Insert_1152';
      LogicTestLog.begin(name, 'length=3;index=Infinity');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(3, 303, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      const inserted: MediaData = createMediaRows(1, 900, 3)[0];
      source.addData(Number.POSITIVE_INFINITY, inserted);
      LogicTestLog.number(name, 'insert total', 4, source.totalCount());
      expect(source.totalCount()).assertEqual(4);
      LogicTestLog.number(name, 'aliased length', 4, original.length);
      expect(original.length).assertEqual(4);
      LogicTestLog.value(name, 'inserted reference', String(true), String(source.getData(3) === inserted));
      expect(source.getData(3) === inserted).assertEqual(true);
      LogicTestLog.value(name, 'inserted URI', String('/logic/item-900'), String(source.getData(3).uri));
      expect(source.getData(3).uri).assertEqual('/logic/item-900');
      LogicTestLog.number(name, 'inserted type', 3, source.getData(3).fileType);
      expect(source.getData(3).fileType).assertEqual(3);
      LogicTestLog.number(name, 'inserted duration', 900900, source.getData(3).duration);
      expect(source.getData(3).duration).assertEqual(900900);
      LogicTestLog.number(name, 'inserted timestamp', 1700000900, source.getData(3).dateAdded);
      expect(source.getData(3).dateAdded).assertEqual(1700000900);
      LogicTestLog.value(name, 'complete insertion order',
        String('/logic/item-303|/logic/item-304|/logic/item-305|/logic/item-900'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(
        '/logic/item-303|/logic/item-304|/logic/item-305|/logic/item-900');
      LogicTestLog.value(name, 'original notified index', String('add:Infinity'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:Infinity');
      source.pushData(createMediaRows(1, 901, 4)[0]);
      LogicTestLog.number(name, 'subsequent append total', 5, source.totalCount());
      expect(source.totalCount()).assertEqual(5);
      LogicTestLog.value(name, 'append position', String('/logic/item-901'), String(source.getData(4).uri));
      expect(source.getData(4).uri).assertEqual('/logic/item-901');
      LogicTestLog.value(name, 'append notification order',
        String('add:Infinity|add:4'),
        String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:Infinity|add:4');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1156
     * @tc.name MultiMedia_Insert_1156
     * @tc.desc Insert with normalized splice position but notify the original position
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Insert_1156', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Insert_1156';
      LogicTestLog.begin(name, 'length=3;index=NaN');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(3, 303, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      const inserted: MediaData = createMediaRows(1, 900, 3)[0];
      source.addData(Number.NaN, inserted);
      LogicTestLog.number(name, 'insert total', 4, source.totalCount());
      expect(source.totalCount()).assertEqual(4);
      LogicTestLog.number(name, 'aliased length', 4, original.length);
      expect(original.length).assertEqual(4);
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
        String('/logic/item-900|/logic/item-303|/logic/item-304|/logic/item-305'),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(
        '/logic/item-900|/logic/item-303|/logic/item-304|/logic/item-305');
      LogicTestLog.value(name, 'original notified index', String('add:NaN'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:NaN');
      source.pushData(createMediaRows(1, 901, 4)[0]);
      LogicTestLog.number(name, 'subsequent append total', 5, source.totalCount());
      expect(source.totalCount()).assertEqual(5);
      LogicTestLog.value(name, 'append position', String('/logic/item-901'), String(source.getData(4).uri));
      expect(source.getData(4).uri).assertEqual('/logic/item-901');
      LogicTestLog.value(name, 'append notification order', String('add:NaN|add:4'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:NaN|add:4');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1160
     * @tc.name MultiMedia_Insert_1160
     * @tc.desc Insert with normalized splice position but notify the original position
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Insert_1160', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Insert_1160';
      LogicTestLog.begin(name, 'length=7;index=-Infinity');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(7, 307, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      const inserted: MediaData = createMediaRows(1, 900, 3)[0];
      source.addData(Number.NEGATIVE_INFINITY, inserted);
      LogicTestLog.number(name, 'insert total', 8, source.totalCount());
      expect(source.totalCount()).assertEqual(8);
      LogicTestLog.number(name, 'aliased length', 8, original.length);
      expect(original.length).assertEqual(8);
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
      const expected28: string =
        '/logic/item-900|/logic/item-307|/logic/item-308|/logic/item-' +
        '309|/logic/item-310|/logic/item-311|/logic/item-312|/logic/i' +
        'tem-313';
      LogicTestLog.value(name, 'complete insertion order',
        String(expected28),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected28);
      LogicTestLog.value(name, 'original notified index', String('add:-Infinity'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:-Infinity');
      source.pushData(createMediaRows(1, 901, 4)[0]);
      LogicTestLog.number(name, 'subsequent append total', 9, source.totalCount());
      expect(source.totalCount()).assertEqual(9);
      LogicTestLog.value(name, 'append position', String('/logic/item-901'), String(source.getData(8).uri));
      expect(source.getData(8).uri).assertEqual('/logic/item-901');
      LogicTestLog.value(name, 'append notification order',
        String('add:-Infinity|add:8'),
        String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:-Infinity|add:8');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1164
     * @tc.name MultiMedia_Insert_1164
     * @tc.desc Insert with normalized splice position but notify the original position
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Insert_1164', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Insert_1164';
      LogicTestLog.begin(name, 'length=7;index=-9');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(7, 307, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      const inserted: MediaData = createMediaRows(1, 900, 3)[0];
      source.addData(-9, inserted);
      LogicTestLog.number(name, 'insert total', 8, source.totalCount());
      expect(source.totalCount()).assertEqual(8);
      LogicTestLog.number(name, 'aliased length', 8, original.length);
      expect(original.length).assertEqual(8);
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
      const expected31: string =
        '/logic/item-900|/logic/item-307|/logic/item-308|/logic/item-' +
        '309|/logic/item-310|/logic/item-311|/logic/item-312|/logic/i' +
        'tem-313';
      LogicTestLog.value(name, 'complete insertion order',
        String(expected31),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected31);
      LogicTestLog.value(name, 'original notified index', String('add:-9'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:-9');
      source.pushData(createMediaRows(1, 901, 4)[0]);
      LogicTestLog.number(name, 'subsequent append total', 9, source.totalCount());
      expect(source.totalCount()).assertEqual(9);
      LogicTestLog.value(name, 'append position', String('/logic/item-901'), String(source.getData(8).uri));
      expect(source.getData(8).uri).assertEqual('/logic/item-901');
      LogicTestLog.value(name, 'append notification order', String('add:-9|add:8'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:-9|add:8');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1168
     * @tc.name MultiMedia_Insert_1168
     * @tc.desc Insert with normalized splice position but notify the original position
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Insert_1168', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Insert_1168';
      LogicTestLog.begin(name, 'length=7;index=-1');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(7, 307, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      const inserted: MediaData = createMediaRows(1, 900, 3)[0];
      source.addData(-1, inserted);
      LogicTestLog.number(name, 'insert total', 8, source.totalCount());
      expect(source.totalCount()).assertEqual(8);
      LogicTestLog.number(name, 'aliased length', 8, original.length);
      expect(original.length).assertEqual(8);
      LogicTestLog.value(name, 'inserted reference', String(true), String(source.getData(6) === inserted));
      expect(source.getData(6) === inserted).assertEqual(true);
      LogicTestLog.value(name, 'inserted URI', String('/logic/item-900'), String(source.getData(6).uri));
      expect(source.getData(6).uri).assertEqual('/logic/item-900');
      LogicTestLog.number(name, 'inserted type', 3, source.getData(6).fileType);
      expect(source.getData(6).fileType).assertEqual(3);
      LogicTestLog.number(name, 'inserted duration', 900900, source.getData(6).duration);
      expect(source.getData(6).duration).assertEqual(900900);
      LogicTestLog.number(name, 'inserted timestamp', 1700000900, source.getData(6).dateAdded);
      expect(source.getData(6).dateAdded).assertEqual(1700000900);
      const expected34: string =
        '/logic/item-307|/logic/item-308|/logic/item-309|/logic/item-' +
        '310|/logic/item-311|/logic/item-312|/logic/item-900|/logic/i' +
        'tem-313';
      LogicTestLog.value(name, 'complete insertion order',
        String(expected34),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected34);
      LogicTestLog.value(name, 'original notified index', String('add:-1'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:-1');
      source.pushData(createMediaRows(1, 901, 4)[0]);
      LogicTestLog.number(name, 'subsequent append total', 9, source.totalCount());
      expect(source.totalCount()).assertEqual(9);
      LogicTestLog.value(name, 'append position', String('/logic/item-901'), String(source.getData(8).uri));
      expect(source.getData(8).uri).assertEqual('/logic/item-901');
      LogicTestLog.value(name, 'append notification order', String('add:-1|add:8'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:-1|add:8');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1172
     * @tc.name MultiMedia_Insert_1172
     * @tc.desc Insert with normalized splice position but notify the original position
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Insert_1172', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Insert_1172';
      LogicTestLog.begin(name, 'length=7;index=-0.75');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(7, 307, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      const inserted: MediaData = createMediaRows(1, 900, 3)[0];
      source.addData(-0.75, inserted);
      LogicTestLog.number(name, 'insert total', 8, source.totalCount());
      expect(source.totalCount()).assertEqual(8);
      LogicTestLog.number(name, 'aliased length', 8, original.length);
      expect(original.length).assertEqual(8);
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
      const expected38: string =
        '/logic/item-900|/logic/item-307|/logic/item-308|/logic/item-' +
        '309|/logic/item-310|/logic/item-311|/logic/item-312|/logic/i' +
        'tem-313';
      LogicTestLog.value(name, 'complete insertion order',
        String(expected38),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected38);
      LogicTestLog.value(name, 'original notified index', String('add:-0.75'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:-0.75');
      source.pushData(createMediaRows(1, 901, 4)[0]);
      LogicTestLog.number(name, 'subsequent append total', 9, source.totalCount());
      expect(source.totalCount()).assertEqual(9);
      LogicTestLog.value(name, 'append position', String('/logic/item-901'), String(source.getData(8).uri));
      expect(source.getData(8).uri).assertEqual('/logic/item-901');
      LogicTestLog.value(name, 'append notification order',
        String('add:-0.75|add:8'),
        String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:-0.75|add:8');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1176
     * @tc.name MultiMedia_Insert_1176
     * @tc.desc Insert with normalized splice position but notify the original position
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Insert_1176', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Insert_1176';
      LogicTestLog.begin(name, 'length=7;index=0');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(7, 307, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      const inserted: MediaData = createMediaRows(1, 900, 3)[0];
      source.addData(0, inserted);
      LogicTestLog.number(name, 'insert total', 8, source.totalCount());
      expect(source.totalCount()).assertEqual(8);
      LogicTestLog.number(name, 'aliased length', 8, original.length);
      expect(original.length).assertEqual(8);
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
      const expected41: string =
        '/logic/item-900|/logic/item-307|/logic/item-308|/logic/item-' +
        '309|/logic/item-310|/logic/item-311|/logic/item-312|/logic/i' +
        'tem-313';
      LogicTestLog.value(name, 'complete insertion order',
        String(expected41),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected41);
      LogicTestLog.value(name, 'original notified index', String('add:0'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:0');
      source.pushData(createMediaRows(1, 901, 4)[0]);
      LogicTestLog.number(name, 'subsequent append total', 9, source.totalCount());
      expect(source.totalCount()).assertEqual(9);
      LogicTestLog.value(name, 'append position', String('/logic/item-901'), String(source.getData(8).uri));
      expect(source.getData(8).uri).assertEqual('/logic/item-901');
      LogicTestLog.value(name, 'append notification order', String('add:0|add:8'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:0|add:8');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1180
     * @tc.name MultiMedia_Insert_1180
     * @tc.desc Insert with normalized splice position but notify the original position
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Insert_1180', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Insert_1180';
      LogicTestLog.begin(name, 'length=7;index=0.75');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(7, 307, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      const inserted: MediaData = createMediaRows(1, 900, 3)[0];
      source.addData(0.75, inserted);
      LogicTestLog.number(name, 'insert total', 8, source.totalCount());
      expect(source.totalCount()).assertEqual(8);
      LogicTestLog.number(name, 'aliased length', 8, original.length);
      expect(original.length).assertEqual(8);
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
      const expected44: string =
        '/logic/item-900|/logic/item-307|/logic/item-308|/logic/item-' +
        '309|/logic/item-310|/logic/item-311|/logic/item-312|/logic/i' +
        'tem-313';
      LogicTestLog.value(name, 'complete insertion order',
        String(expected44),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected44);
      LogicTestLog.value(name, 'original notified index', String('add:0.75'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:0.75');
      source.pushData(createMediaRows(1, 901, 4)[0]);
      LogicTestLog.number(name, 'subsequent append total', 9, source.totalCount());
      expect(source.totalCount()).assertEqual(9);
      LogicTestLog.value(name, 'append position', String('/logic/item-901'), String(source.getData(8).uri));
      expect(source.getData(8).uri).assertEqual('/logic/item-901');
      LogicTestLog.value(name, 'append notification order',
        String('add:0.75|add:8'),
        String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:0.75|add:8');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1184
     * @tc.name MultiMedia_Insert_1184
     * @tc.desc Insert with normalized splice position but notify the original position
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Insert_1184', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Insert_1184';
      LogicTestLog.begin(name, 'length=7;index=1');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(7, 307, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      const inserted: MediaData = createMediaRows(1, 900, 3)[0];
      source.addData(1, inserted);
      LogicTestLog.number(name, 'insert total', 8, source.totalCount());
      expect(source.totalCount()).assertEqual(8);
      LogicTestLog.number(name, 'aliased length', 8, original.length);
      expect(original.length).assertEqual(8);
      LogicTestLog.value(name, 'inserted reference', String(true), String(source.getData(1) === inserted));
      expect(source.getData(1) === inserted).assertEqual(true);
      LogicTestLog.value(name, 'inserted URI', String('/logic/item-900'), String(source.getData(1).uri));
      expect(source.getData(1).uri).assertEqual('/logic/item-900');
      LogicTestLog.number(name, 'inserted type', 3, source.getData(1).fileType);
      expect(source.getData(1).fileType).assertEqual(3);
      LogicTestLog.number(name, 'inserted duration', 900900, source.getData(1).duration);
      expect(source.getData(1).duration).assertEqual(900900);
      LogicTestLog.number(name, 'inserted timestamp', 1700000900, source.getData(1).dateAdded);
      expect(source.getData(1).dateAdded).assertEqual(1700000900);
      const expected47: string =
        '/logic/item-307|/logic/item-900|/logic/item-308|/logic/item-' +
        '309|/logic/item-310|/logic/item-311|/logic/item-312|/logic/i' +
        'tem-313';
      LogicTestLog.value(name, 'complete insertion order',
        String(expected47),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected47);
      LogicTestLog.value(name, 'original notified index', String('add:1'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:1');
      source.pushData(createMediaRows(1, 901, 4)[0]);
      LogicTestLog.number(name, 'subsequent append total', 9, source.totalCount());
      expect(source.totalCount()).assertEqual(9);
      LogicTestLog.value(name, 'append position', String('/logic/item-901'), String(source.getData(8).uri));
      expect(source.getData(8).uri).assertEqual('/logic/item-901');
      LogicTestLog.value(name, 'append notification order', String('add:1|add:8'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:1|add:8');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1188
     * @tc.name MultiMedia_Insert_1188
     * @tc.desc Insert with normalized splice position but notify the original position
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Insert_1188', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Insert_1188';
      LogicTestLog.begin(name, 'length=7;index=6');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(7, 307, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      const inserted: MediaData = createMediaRows(1, 900, 3)[0];
      source.addData(6, inserted);
      LogicTestLog.number(name, 'insert total', 8, source.totalCount());
      expect(source.totalCount()).assertEqual(8);
      LogicTestLog.number(name, 'aliased length', 8, original.length);
      expect(original.length).assertEqual(8);
      LogicTestLog.value(name, 'inserted reference', String(true), String(source.getData(6) === inserted));
      expect(source.getData(6) === inserted).assertEqual(true);
      LogicTestLog.value(name, 'inserted URI', String('/logic/item-900'), String(source.getData(6).uri));
      expect(source.getData(6).uri).assertEqual('/logic/item-900');
      LogicTestLog.number(name, 'inserted type', 3, source.getData(6).fileType);
      expect(source.getData(6).fileType).assertEqual(3);
      LogicTestLog.number(name, 'inserted duration', 900900, source.getData(6).duration);
      expect(source.getData(6).duration).assertEqual(900900);
      LogicTestLog.number(name, 'inserted timestamp', 1700000900, source.getData(6).dateAdded);
      expect(source.getData(6).dateAdded).assertEqual(1700000900);
      const expected50: string =
        '/logic/item-307|/logic/item-308|/logic/item-309|/logic/item-' +
        '310|/logic/item-311|/logic/item-312|/logic/item-900|/logic/i' +
        'tem-313';
      LogicTestLog.value(name, 'complete insertion order',
        String(expected50),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected50);
      LogicTestLog.value(name, 'original notified index', String('add:6'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:6');
      source.pushData(createMediaRows(1, 901, 4)[0]);
      LogicTestLog.number(name, 'subsequent append total', 9, source.totalCount());
      expect(source.totalCount()).assertEqual(9);
      LogicTestLog.value(name, 'append position', String('/logic/item-901'), String(source.getData(8).uri));
      expect(source.getData(8).uri).assertEqual('/logic/item-901');
      LogicTestLog.value(name, 'append notification order', String('add:6|add:8'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:6|add:8');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1192
     * @tc.name MultiMedia_Insert_1192
     * @tc.desc Insert with normalized splice position but notify the original position
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Insert_1192', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Insert_1192';
      LogicTestLog.begin(name, 'length=7;index=7');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(7, 307, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      const inserted: MediaData = createMediaRows(1, 900, 3)[0];
      source.addData(7, inserted);
      LogicTestLog.number(name, 'insert total', 8, source.totalCount());
      expect(source.totalCount()).assertEqual(8);
      LogicTestLog.number(name, 'aliased length', 8, original.length);
      expect(original.length).assertEqual(8);
      LogicTestLog.value(name, 'inserted reference', String(true), String(source.getData(7) === inserted));
      expect(source.getData(7) === inserted).assertEqual(true);
      LogicTestLog.value(name, 'inserted URI', String('/logic/item-900'), String(source.getData(7).uri));
      expect(source.getData(7).uri).assertEqual('/logic/item-900');
      LogicTestLog.number(name, 'inserted type', 3, source.getData(7).fileType);
      expect(source.getData(7).fileType).assertEqual(3);
      LogicTestLog.number(name, 'inserted duration', 900900, source.getData(7).duration);
      expect(source.getData(7).duration).assertEqual(900900);
      LogicTestLog.number(name, 'inserted timestamp', 1700000900, source.getData(7).dateAdded);
      expect(source.getData(7).dateAdded).assertEqual(1700000900);
      const expected54: string =
        '/logic/item-307|/logic/item-308|/logic/item-309|/logic/item-' +
        '310|/logic/item-311|/logic/item-312|/logic/item-313|/logic/i' +
        'tem-900';
      LogicTestLog.value(name, 'complete insertion order',
        String(expected54),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected54);
      LogicTestLog.value(name, 'original notified index', String('add:7'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:7');
      source.pushData(createMediaRows(1, 901, 4)[0]);
      LogicTestLog.number(name, 'subsequent append total', 9, source.totalCount());
      expect(source.totalCount()).assertEqual(9);
      LogicTestLog.value(name, 'append position', String('/logic/item-901'), String(source.getData(8).uri));
      expect(source.getData(8).uri).assertEqual('/logic/item-901');
      LogicTestLog.value(name, 'append notification order', String('add:7|add:8'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:7|add:8');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1196
     * @tc.name MultiMedia_Insert_1196
     * @tc.desc Insert with normalized splice position but notify the original position
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Insert_1196', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Insert_1196';
      LogicTestLog.begin(name, 'length=7;index=9');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(7, 307, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      const inserted: MediaData = createMediaRows(1, 900, 3)[0];
      source.addData(9, inserted);
      LogicTestLog.number(name, 'insert total', 8, source.totalCount());
      expect(source.totalCount()).assertEqual(8);
      LogicTestLog.number(name, 'aliased length', 8, original.length);
      expect(original.length).assertEqual(8);
      LogicTestLog.value(name, 'inserted reference', String(true), String(source.getData(7) === inserted));
      expect(source.getData(7) === inserted).assertEqual(true);
      LogicTestLog.value(name, 'inserted URI', String('/logic/item-900'), String(source.getData(7).uri));
      expect(source.getData(7).uri).assertEqual('/logic/item-900');
      LogicTestLog.number(name, 'inserted type', 3, source.getData(7).fileType);
      expect(source.getData(7).fileType).assertEqual(3);
      LogicTestLog.number(name, 'inserted duration', 900900, source.getData(7).duration);
      expect(source.getData(7).duration).assertEqual(900900);
      LogicTestLog.number(name, 'inserted timestamp', 1700000900, source.getData(7).dateAdded);
      expect(source.getData(7).dateAdded).assertEqual(1700000900);
      const expected58: string =
        '/logic/item-307|/logic/item-308|/logic/item-309|/logic/item-' +
        '310|/logic/item-311|/logic/item-312|/logic/item-313|/logic/i' +
        'tem-900';
      LogicTestLog.value(name, 'complete insertion order',
        String(expected58),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected58);
      LogicTestLog.value(name, 'original notified index', String('add:9'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:9');
      source.pushData(createMediaRows(1, 901, 4)[0]);
      LogicTestLog.number(name, 'subsequent append total', 9, source.totalCount());
      expect(source.totalCount()).assertEqual(9);
      LogicTestLog.value(name, 'append position', String('/logic/item-901'), String(source.getData(8).uri));
      expect(source.getData(8).uri).assertEqual('/logic/item-901');
      LogicTestLog.value(name, 'append notification order', String('add:9|add:8'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:9|add:8');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1200
     * @tc.name MultiMedia_Insert_1200
     * @tc.desc Insert with normalized splice position but notify the original position
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Insert_1200', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Insert_1200';
      LogicTestLog.begin(name, 'length=7;index=Infinity');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(7, 307, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      const inserted: MediaData = createMediaRows(1, 900, 3)[0];
      source.addData(Number.POSITIVE_INFINITY, inserted);
      LogicTestLog.number(name, 'insert total', 8, source.totalCount());
      expect(source.totalCount()).assertEqual(8);
      LogicTestLog.number(name, 'aliased length', 8, original.length);
      expect(original.length).assertEqual(8);
      LogicTestLog.value(name, 'inserted reference', String(true), String(source.getData(7) === inserted));
      expect(source.getData(7) === inserted).assertEqual(true);
      LogicTestLog.value(name, 'inserted URI', String('/logic/item-900'), String(source.getData(7).uri));
      expect(source.getData(7).uri).assertEqual('/logic/item-900');
      LogicTestLog.number(name, 'inserted type', 3, source.getData(7).fileType);
      expect(source.getData(7).fileType).assertEqual(3);
      LogicTestLog.number(name, 'inserted duration', 900900, source.getData(7).duration);
      expect(source.getData(7).duration).assertEqual(900900);
      LogicTestLog.number(name, 'inserted timestamp', 1700000900, source.getData(7).dateAdded);
      expect(source.getData(7).dateAdded).assertEqual(1700000900);
      const expected62: string =
        '/logic/item-307|/logic/item-308|/logic/item-309|/logic/item-' +
        '310|/logic/item-311|/logic/item-312|/logic/item-313|/logic/i' +
        'tem-900';
      LogicTestLog.value(name, 'complete insertion order',
        String(expected62),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected62);
      LogicTestLog.value(name, 'original notified index', String('add:Infinity'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:Infinity');
      source.pushData(createMediaRows(1, 901, 4)[0]);
      LogicTestLog.number(name, 'subsequent append total', 9, source.totalCount());
      expect(source.totalCount()).assertEqual(9);
      LogicTestLog.value(name, 'append position', String('/logic/item-901'), String(source.getData(8).uri));
      expect(source.getData(8).uri).assertEqual('/logic/item-901');
      LogicTestLog.value(name, 'append notification order',
        String('add:Infinity|add:8'),
        String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:Infinity|add:8');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1204
     * @tc.name MultiMedia_Insert_1204
     * @tc.desc Insert with normalized splice position but notify the original position
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Insert_1204', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Insert_1204';
      LogicTestLog.begin(name, 'length=7;index=NaN');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(7, 307, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      const inserted: MediaData = createMediaRows(1, 900, 3)[0];
      source.addData(Number.NaN, inserted);
      LogicTestLog.number(name, 'insert total', 8, source.totalCount());
      expect(source.totalCount()).assertEqual(8);
      LogicTestLog.number(name, 'aliased length', 8, original.length);
      expect(original.length).assertEqual(8);
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
      const expected66: string =
        '/logic/item-900|/logic/item-307|/logic/item-308|/logic/item-' +
        '309|/logic/item-310|/logic/item-311|/logic/item-312|/logic/i' +
        'tem-313';
      LogicTestLog.value(name, 'complete insertion order',
        String(expected66),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected66);
      LogicTestLog.value(name, 'original notified index', String('add:NaN'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:NaN');
      source.pushData(createMediaRows(1, 901, 4)[0]);
      LogicTestLog.number(name, 'subsequent append total', 9, source.totalCount());
      expect(source.totalCount()).assertEqual(9);
      LogicTestLog.value(name, 'append position', String('/logic/item-901'), String(source.getData(8).uri));
      expect(source.getData(8).uri).assertEqual('/logic/item-901');
      LogicTestLog.value(name, 'append notification order', String('add:NaN|add:8'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:NaN|add:8');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1208
     * @tc.name MultiMedia_Insert_1208
     * @tc.desc Insert with normalized splice position but notify the original position
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Insert_1208', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Insert_1208';
      LogicTestLog.begin(name, 'length=16;index=-Infinity');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(16, 316, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      const inserted: MediaData = createMediaRows(1, 900, 3)[0];
      source.addData(Number.NEGATIVE_INFINITY, inserted);
      LogicTestLog.number(name, 'insert total', 17, source.totalCount());
      expect(source.totalCount()).assertEqual(17);
      LogicTestLog.number(name, 'aliased length', 17, original.length);
      expect(original.length).assertEqual(17);
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
      const expected69: string =
        '/logic/item-900|/logic/item-316|/logic/item-317|/logic/item-' +
        '318|/logic/item-319|/logic/item-320|/logic/item-321|/logic/i' +
        'tem-322|/logic/item-323|/logic/item-324|/logic/item-325|/log' +
        'ic/item-326|/logic/item-327|/logic/item-328|/logic/item-329|' +
        '/logic/item-330|/logic/item-331';
      LogicTestLog.value(name, 'complete insertion order',
        String(expected69),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected69);
      LogicTestLog.value(name, 'original notified index', String('add:-Infinity'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:-Infinity');
      source.pushData(createMediaRows(1, 901, 4)[0]);
      LogicTestLog.number(name, 'subsequent append total', 18, source.totalCount());
      expect(source.totalCount()).assertEqual(18);
      LogicTestLog.value(name, 'append position', String('/logic/item-901'), String(source.getData(17).uri));
      expect(source.getData(17).uri).assertEqual('/logic/item-901');
      LogicTestLog.value(name, 'append notification order',
        String('add:-Infinity|add:17'),
        String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:-Infinity|add:17');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1212
     * @tc.name MultiMedia_Insert_1212
     * @tc.desc Insert with normalized splice position but notify the original position
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Insert_1212', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Insert_1212';
      LogicTestLog.begin(name, 'length=16;index=-18');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(16, 316, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      const inserted: MediaData = createMediaRows(1, 900, 3)[0];
      source.addData(-18, inserted);
      LogicTestLog.number(name, 'insert total', 17, source.totalCount());
      expect(source.totalCount()).assertEqual(17);
      LogicTestLog.number(name, 'aliased length', 17, original.length);
      expect(original.length).assertEqual(17);
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
      const expected74: string =
        '/logic/item-900|/logic/item-316|/logic/item-317|/logic/item-' +
        '318|/logic/item-319|/logic/item-320|/logic/item-321|/logic/i' +
        'tem-322|/logic/item-323|/logic/item-324|/logic/item-325|/log' +
        'ic/item-326|/logic/item-327|/logic/item-328|/logic/item-329|' +
        '/logic/item-330|/logic/item-331';
      LogicTestLog.value(name, 'complete insertion order',
        String(expected74),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected74);
      LogicTestLog.value(name, 'original notified index', String('add:-18'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:-18');
      source.pushData(createMediaRows(1, 901, 4)[0]);
      LogicTestLog.number(name, 'subsequent append total', 18, source.totalCount());
      expect(source.totalCount()).assertEqual(18);
      LogicTestLog.value(name, 'append position', String('/logic/item-901'), String(source.getData(17).uri));
      expect(source.getData(17).uri).assertEqual('/logic/item-901');
      LogicTestLog.value(name, 'append notification order',
        String('add:-18|add:17'),
        String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:-18|add:17');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1216
     * @tc.name MultiMedia_Insert_1216
     * @tc.desc Insert with normalized splice position but notify the original position
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Insert_1216', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Insert_1216';
      LogicTestLog.begin(name, 'length=16;index=-1');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(16, 316, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      const inserted: MediaData = createMediaRows(1, 900, 3)[0];
      source.addData(-1, inserted);
      LogicTestLog.number(name, 'insert total', 17, source.totalCount());
      expect(source.totalCount()).assertEqual(17);
      LogicTestLog.number(name, 'aliased length', 17, original.length);
      expect(original.length).assertEqual(17);
      LogicTestLog.value(name, 'inserted reference', String(true), String(source.getData(15) === inserted));
      expect(source.getData(15) === inserted).assertEqual(true);
      LogicTestLog.value(name, 'inserted URI', String('/logic/item-900'), String(source.getData(15).uri));
      expect(source.getData(15).uri).assertEqual('/logic/item-900');
      LogicTestLog.number(name, 'inserted type', 3, source.getData(15).fileType);
      expect(source.getData(15).fileType).assertEqual(3);
      LogicTestLog.number(name, 'inserted duration', 900900, source.getData(15).duration);
      expect(source.getData(15).duration).assertEqual(900900);
      LogicTestLog.number(name, 'inserted timestamp', 1700000900, source.getData(15).dateAdded);
      expect(source.getData(15).dateAdded).assertEqual(1700000900);
      const expected79: string =
        '/logic/item-316|/logic/item-317|/logic/item-318|/logic/item-' +
        '319|/logic/item-320|/logic/item-321|/logic/item-322|/logic/i' +
        'tem-323|/logic/item-324|/logic/item-325|/logic/item-326|/log' +
        'ic/item-327|/logic/item-328|/logic/item-329|/logic/item-330|' +
        '/logic/item-900|/logic/item-331';
      LogicTestLog.value(name, 'complete insertion order',
        String(expected79),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected79);
      LogicTestLog.value(name, 'original notified index', String('add:-1'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:-1');
      source.pushData(createMediaRows(1, 901, 4)[0]);
      LogicTestLog.number(name, 'subsequent append total', 18, source.totalCount());
      expect(source.totalCount()).assertEqual(18);
      LogicTestLog.value(name, 'append position', String('/logic/item-901'), String(source.getData(17).uri));
      expect(source.getData(17).uri).assertEqual('/logic/item-901');
      LogicTestLog.value(name, 'append notification order', String('add:-1|add:17'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:-1|add:17');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1220
     * @tc.name MultiMedia_Insert_1220
     * @tc.desc Insert with normalized splice position but notify the original position
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Insert_1220', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Insert_1220';
      LogicTestLog.begin(name, 'length=16;index=-0.75');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(16, 316, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      const inserted: MediaData = createMediaRows(1, 900, 3)[0];
      source.addData(-0.75, inserted);
      LogicTestLog.number(name, 'insert total', 17, source.totalCount());
      expect(source.totalCount()).assertEqual(17);
      LogicTestLog.number(name, 'aliased length', 17, original.length);
      expect(original.length).assertEqual(17);
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
      const expected86: string =
        '/logic/item-900|/logic/item-316|/logic/item-317|/logic/item-' +
        '318|/logic/item-319|/logic/item-320|/logic/item-321|/logic/i' +
        'tem-322|/logic/item-323|/logic/item-324|/logic/item-325|/log' +
        'ic/item-326|/logic/item-327|/logic/item-328|/logic/item-329|' +
        '/logic/item-330|/logic/item-331';
      LogicTestLog.value(name, 'complete insertion order',
        String(expected86),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected86);
      LogicTestLog.value(name, 'original notified index', String('add:-0.75'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:-0.75');
      source.pushData(createMediaRows(1, 901, 4)[0]);
      LogicTestLog.number(name, 'subsequent append total', 18, source.totalCount());
      expect(source.totalCount()).assertEqual(18);
      LogicTestLog.value(name, 'append position', String('/logic/item-901'), String(source.getData(17).uri));
      expect(source.getData(17).uri).assertEqual('/logic/item-901');
      LogicTestLog.value(name, 'append notification order',
        String('add:-0.75|add:17'),
        String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:-0.75|add:17');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1224
     * @tc.name MultiMedia_Insert_1224
     * @tc.desc Insert with normalized splice position but notify the original position
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Insert_1224', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Insert_1224';
      LogicTestLog.begin(name, 'length=16;index=0');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(16, 316, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      const inserted: MediaData = createMediaRows(1, 900, 3)[0];
      source.addData(0, inserted);
      LogicTestLog.number(name, 'insert total', 17, source.totalCount());
      expect(source.totalCount()).assertEqual(17);
      LogicTestLog.number(name, 'aliased length', 17, original.length);
      expect(original.length).assertEqual(17);
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
      const expected91: string =
        '/logic/item-900|/logic/item-316|/logic/item-317|/logic/item-' +
        '318|/logic/item-319|/logic/item-320|/logic/item-321|/logic/i' +
        'tem-322|/logic/item-323|/logic/item-324|/logic/item-325|/log' +
        'ic/item-326|/logic/item-327|/logic/item-328|/logic/item-329|' +
        '/logic/item-330|/logic/item-331';
      LogicTestLog.value(name, 'complete insertion order',
        String(expected91),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected91);
      LogicTestLog.value(name, 'original notified index', String('add:0'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:0');
      source.pushData(createMediaRows(1, 901, 4)[0]);
      LogicTestLog.number(name, 'subsequent append total', 18, source.totalCount());
      expect(source.totalCount()).assertEqual(18);
      LogicTestLog.value(name, 'append position', String('/logic/item-901'), String(source.getData(17).uri));
      expect(source.getData(17).uri).assertEqual('/logic/item-901');
      LogicTestLog.value(name, 'append notification order', String('add:0|add:17'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:0|add:17');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1228
     * @tc.name MultiMedia_Insert_1228
     * @tc.desc Insert with normalized splice position but notify the original position
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Insert_1228', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Insert_1228';
      LogicTestLog.begin(name, 'length=16;index=0.75');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(16, 316, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      const inserted: MediaData = createMediaRows(1, 900, 3)[0];
      source.addData(0.75, inserted);
      LogicTestLog.number(name, 'insert total', 17, source.totalCount());
      expect(source.totalCount()).assertEqual(17);
      LogicTestLog.number(name, 'aliased length', 17, original.length);
      expect(original.length).assertEqual(17);
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
      const expected96: string =
        '/logic/item-900|/logic/item-316|/logic/item-317|/logic/item-' +
        '318|/logic/item-319|/logic/item-320|/logic/item-321|/logic/i' +
        'tem-322|/logic/item-323|/logic/item-324|/logic/item-325|/log' +
        'ic/item-326|/logic/item-327|/logic/item-328|/logic/item-329|' +
        '/logic/item-330|/logic/item-331';
      LogicTestLog.value(name, 'complete insertion order',
        String(expected96),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected96);
      LogicTestLog.value(name, 'original notified index', String('add:0.75'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:0.75');
      source.pushData(createMediaRows(1, 901, 4)[0]);
      LogicTestLog.number(name, 'subsequent append total', 18, source.totalCount());
      expect(source.totalCount()).assertEqual(18);
      LogicTestLog.value(name, 'append position', String('/logic/item-901'), String(source.getData(17).uri));
      expect(source.getData(17).uri).assertEqual('/logic/item-901');
      LogicTestLog.value(name, 'append notification order',
        String('add:0.75|add:17'),
        String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:0.75|add:17');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1232
     * @tc.name MultiMedia_Insert_1232
     * @tc.desc Insert with normalized splice position but notify the original position
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Insert_1232', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Insert_1232';
      LogicTestLog.begin(name, 'length=16;index=1');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(16, 316, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      const inserted: MediaData = createMediaRows(1, 900, 3)[0];
      source.addData(1, inserted);
      LogicTestLog.number(name, 'insert total', 17, source.totalCount());
      expect(source.totalCount()).assertEqual(17);
      LogicTestLog.number(name, 'aliased length', 17, original.length);
      expect(original.length).assertEqual(17);
      LogicTestLog.value(name, 'inserted reference', String(true), String(source.getData(1) === inserted));
      expect(source.getData(1) === inserted).assertEqual(true);
      LogicTestLog.value(name, 'inserted URI', String('/logic/item-900'), String(source.getData(1).uri));
      expect(source.getData(1).uri).assertEqual('/logic/item-900');
      LogicTestLog.number(name, 'inserted type', 3, source.getData(1).fileType);
      expect(source.getData(1).fileType).assertEqual(3);
      LogicTestLog.number(name, 'inserted duration', 900900, source.getData(1).duration);
      expect(source.getData(1).duration).assertEqual(900900);
      LogicTestLog.number(name, 'inserted timestamp', 1700000900, source.getData(1).dateAdded);
      expect(source.getData(1).dateAdded).assertEqual(1700000900);
      const expected101: string =
        '/logic/item-316|/logic/item-900|/logic/item-317|/logic/item-' +
        '318|/logic/item-319|/logic/item-320|/logic/item-321|/logic/i' +
        'tem-322|/logic/item-323|/logic/item-324|/logic/item-325|/log' +
        'ic/item-326|/logic/item-327|/logic/item-328|/logic/item-329|' +
        '/logic/item-330|/logic/item-331';
      LogicTestLog.value(name, 'complete insertion order',
        String(expected101),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected101);
      LogicTestLog.value(name, 'original notified index', String('add:1'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:1');
      source.pushData(createMediaRows(1, 901, 4)[0]);
      LogicTestLog.number(name, 'subsequent append total', 18, source.totalCount());
      expect(source.totalCount()).assertEqual(18);
      LogicTestLog.value(name, 'append position', String('/logic/item-901'), String(source.getData(17).uri));
      expect(source.getData(17).uri).assertEqual('/logic/item-901');
      LogicTestLog.value(name, 'append notification order', String('add:1|add:17'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:1|add:17');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1236
     * @tc.name MultiMedia_Insert_1236
     * @tc.desc Insert with normalized splice position but notify the original position
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Insert_1236', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Insert_1236';
      LogicTestLog.begin(name, 'length=16;index=15');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(16, 316, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      const inserted: MediaData = createMediaRows(1, 900, 3)[0];
      source.addData(15, inserted);
      LogicTestLog.number(name, 'insert total', 17, source.totalCount());
      expect(source.totalCount()).assertEqual(17);
      LogicTestLog.number(name, 'aliased length', 17, original.length);
      expect(original.length).assertEqual(17);
      LogicTestLog.value(name, 'inserted reference', String(true), String(source.getData(15) === inserted));
      expect(source.getData(15) === inserted).assertEqual(true);
      LogicTestLog.value(name, 'inserted URI', String('/logic/item-900'), String(source.getData(15).uri));
      expect(source.getData(15).uri).assertEqual('/logic/item-900');
      LogicTestLog.number(name, 'inserted type', 3, source.getData(15).fileType);
      expect(source.getData(15).fileType).assertEqual(3);
      LogicTestLog.number(name, 'inserted duration', 900900, source.getData(15).duration);
      expect(source.getData(15).duration).assertEqual(900900);
      LogicTestLog.number(name, 'inserted timestamp', 1700000900, source.getData(15).dateAdded);
      expect(source.getData(15).dateAdded).assertEqual(1700000900);
      const expected106: string =
        '/logic/item-316|/logic/item-317|/logic/item-318|/logic/item-' +
        '319|/logic/item-320|/logic/item-321|/logic/item-322|/logic/i' +
        'tem-323|/logic/item-324|/logic/item-325|/logic/item-326|/log' +
        'ic/item-327|/logic/item-328|/logic/item-329|/logic/item-330|' +
        '/logic/item-900|/logic/item-331';
      LogicTestLog.value(name, 'complete insertion order',
        String(expected106),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected106);
      LogicTestLog.value(name, 'original notified index', String('add:15'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:15');
      source.pushData(createMediaRows(1, 901, 4)[0]);
      LogicTestLog.number(name, 'subsequent append total', 18, source.totalCount());
      expect(source.totalCount()).assertEqual(18);
      LogicTestLog.value(name, 'append position', String('/logic/item-901'), String(source.getData(17).uri));
      expect(source.getData(17).uri).assertEqual('/logic/item-901');
      LogicTestLog.value(name, 'append notification order', String('add:15|add:17'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:15|add:17');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1240
     * @tc.name MultiMedia_Insert_1240
     * @tc.desc Insert with normalized splice position but notify the original position
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Insert_1240', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Insert_1240';
      LogicTestLog.begin(name, 'length=16;index=16');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(16, 316, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      const inserted: MediaData = createMediaRows(1, 900, 3)[0];
      source.addData(16, inserted);
      LogicTestLog.number(name, 'insert total', 17, source.totalCount());
      expect(source.totalCount()).assertEqual(17);
      LogicTestLog.number(name, 'aliased length', 17, original.length);
      expect(original.length).assertEqual(17);
      LogicTestLog.value(name, 'inserted reference', String(true), String(source.getData(16) === inserted));
      expect(source.getData(16) === inserted).assertEqual(true);
      LogicTestLog.value(name, 'inserted URI', String('/logic/item-900'), String(source.getData(16).uri));
      expect(source.getData(16).uri).assertEqual('/logic/item-900');
      LogicTestLog.number(name, 'inserted type', 3, source.getData(16).fileType);
      expect(source.getData(16).fileType).assertEqual(3);
      LogicTestLog.number(name, 'inserted duration', 900900, source.getData(16).duration);
      expect(source.getData(16).duration).assertEqual(900900);
      LogicTestLog.number(name, 'inserted timestamp', 1700000900, source.getData(16).dateAdded);
      expect(source.getData(16).dateAdded).assertEqual(1700000900);
      const expected113: string =
        '/logic/item-316|/logic/item-317|/logic/item-318|/logic/item-' +
        '319|/logic/item-320|/logic/item-321|/logic/item-322|/logic/i' +
        'tem-323|/logic/item-324|/logic/item-325|/logic/item-326|/log' +
        'ic/item-327|/logic/item-328|/logic/item-329|/logic/item-330|' +
        '/logic/item-331|/logic/item-900';
      LogicTestLog.value(name, 'complete insertion order',
        String(expected113),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected113);
      LogicTestLog.value(name, 'original notified index', String('add:16'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:16');
      source.pushData(createMediaRows(1, 901, 4)[0]);
      LogicTestLog.number(name, 'subsequent append total', 18, source.totalCount());
      expect(source.totalCount()).assertEqual(18);
      LogicTestLog.value(name, 'append position', String('/logic/item-901'), String(source.getData(17).uri));
      expect(source.getData(17).uri).assertEqual('/logic/item-901');
      LogicTestLog.value(name, 'append notification order', String('add:16|add:17'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:16|add:17');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1244
     * @tc.name MultiMedia_Insert_1244
     * @tc.desc Insert with normalized splice position but notify the original position
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Insert_1244', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Insert_1244';
      LogicTestLog.begin(name, 'length=16;index=18');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(16, 316, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      const inserted: MediaData = createMediaRows(1, 900, 3)[0];
      source.addData(18, inserted);
      LogicTestLog.number(name, 'insert total', 17, source.totalCount());
      expect(source.totalCount()).assertEqual(17);
      LogicTestLog.number(name, 'aliased length', 17, original.length);
      expect(original.length).assertEqual(17);
      LogicTestLog.value(name, 'inserted reference', String(true), String(source.getData(16) === inserted));
      expect(source.getData(16) === inserted).assertEqual(true);
      LogicTestLog.value(name, 'inserted URI', String('/logic/item-900'), String(source.getData(16).uri));
      expect(source.getData(16).uri).assertEqual('/logic/item-900');
      LogicTestLog.number(name, 'inserted type', 3, source.getData(16).fileType);
      expect(source.getData(16).fileType).assertEqual(3);
      LogicTestLog.number(name, 'inserted duration', 900900, source.getData(16).duration);
      expect(source.getData(16).duration).assertEqual(900900);
      LogicTestLog.number(name, 'inserted timestamp', 1700000900, source.getData(16).dateAdded);
      expect(source.getData(16).dateAdded).assertEqual(1700000900);
      const expected120: string =
        '/logic/item-316|/logic/item-317|/logic/item-318|/logic/item-' +
        '319|/logic/item-320|/logic/item-321|/logic/item-322|/logic/i' +
        'tem-323|/logic/item-324|/logic/item-325|/logic/item-326|/log' +
        'ic/item-327|/logic/item-328|/logic/item-329|/logic/item-330|' +
        '/logic/item-331|/logic/item-900';
      LogicTestLog.value(name, 'complete insertion order',
        String(expected120),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected120);
      LogicTestLog.value(name, 'original notified index', String('add:18'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:18');
      source.pushData(createMediaRows(1, 901, 4)[0]);
      LogicTestLog.number(name, 'subsequent append total', 18, source.totalCount());
      expect(source.totalCount()).assertEqual(18);
      LogicTestLog.value(name, 'append position', String('/logic/item-901'), String(source.getData(17).uri));
      expect(source.getData(17).uri).assertEqual('/logic/item-901');
      LogicTestLog.value(name, 'append notification order', String('add:18|add:17'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:18|add:17');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1248
     * @tc.name MultiMedia_Insert_1248
     * @tc.desc Insert with normalized splice position but notify the original position
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Insert_1248', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Insert_1248';
      LogicTestLog.begin(name, 'length=16;index=Infinity');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(16, 316, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      const inserted: MediaData = createMediaRows(1, 900, 3)[0];
      source.addData(Number.POSITIVE_INFINITY, inserted);
      LogicTestLog.number(name, 'insert total', 17, source.totalCount());
      expect(source.totalCount()).assertEqual(17);
      LogicTestLog.number(name, 'aliased length', 17, original.length);
      expect(original.length).assertEqual(17);
      LogicTestLog.value(name, 'inserted reference', String(true), String(source.getData(16) === inserted));
      expect(source.getData(16) === inserted).assertEqual(true);
      LogicTestLog.value(name, 'inserted URI', String('/logic/item-900'), String(source.getData(16).uri));
      expect(source.getData(16).uri).assertEqual('/logic/item-900');
      LogicTestLog.number(name, 'inserted type', 3, source.getData(16).fileType);
      expect(source.getData(16).fileType).assertEqual(3);
      LogicTestLog.number(name, 'inserted duration', 900900, source.getData(16).duration);
      expect(source.getData(16).duration).assertEqual(900900);
      LogicTestLog.number(name, 'inserted timestamp', 1700000900, source.getData(16).dateAdded);
      expect(source.getData(16).dateAdded).assertEqual(1700000900);
      const expected127: string =
        '/logic/item-316|/logic/item-317|/logic/item-318|/logic/item-' +
        '319|/logic/item-320|/logic/item-321|/logic/item-322|/logic/i' +
        'tem-323|/logic/item-324|/logic/item-325|/logic/item-326|/log' +
        'ic/item-327|/logic/item-328|/logic/item-329|/logic/item-330|' +
        '/logic/item-331|/logic/item-900';
      LogicTestLog.value(name, 'complete insertion order',
        String(expected127),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected127);
      LogicTestLog.value(name, 'original notified index', String('add:Infinity'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:Infinity');
      source.pushData(createMediaRows(1, 901, 4)[0]);
      LogicTestLog.number(name, 'subsequent append total', 18, source.totalCount());
      expect(source.totalCount()).assertEqual(18);
      LogicTestLog.value(name, 'append position', String('/logic/item-901'), String(source.getData(17).uri));
      expect(source.getData(17).uri).assertEqual('/logic/item-901');
      LogicTestLog.value(name, 'append notification order',
        String('add:Infinity|add:17'),
        String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:Infinity|add:17');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1252
     * @tc.name MultiMedia_Insert_1252
     * @tc.desc Insert with normalized splice position but notify the original position
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Insert_1252', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Insert_1252';
      LogicTestLog.begin(name, 'length=16;index=NaN');
      const source: MediaDataSource = new MediaDataSource();
      const listener: DataSourceProbe = new DataSourceProbe();
      const original: MediaData[] = createMediaRows(16, 316, 2);
      source.setDataArray(original);
      source.registerDataChangeListener(listener);
      const inserted: MediaData = createMediaRows(1, 900, 3)[0];
      source.addData(Number.NaN, inserted);
      LogicTestLog.number(name, 'insert total', 17, source.totalCount());
      expect(source.totalCount()).assertEqual(17);
      LogicTestLog.number(name, 'aliased length', 17, original.length);
      expect(original.length).assertEqual(17);
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
      const expected134: string =
        '/logic/item-900|/logic/item-316|/logic/item-317|/logic/item-' +
        '318|/logic/item-319|/logic/item-320|/logic/item-321|/logic/i' +
        'tem-322|/logic/item-323|/logic/item-324|/logic/item-325|/log' +
        'ic/item-326|/logic/item-327|/logic/item-328|/logic/item-329|' +
        '/logic/item-330|/logic/item-331';
      LogicTestLog.value(name, 'complete insertion order',
        String(expected134),
        String(source.getDataArray().map((item: MediaData): string => item.uri).join('|')));
      expect(source.getDataArray().map((item: MediaData): string => item.uri).join('|')).assertEqual(expected134);
      LogicTestLog.value(name, 'original notified index', String('add:NaN'), String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:NaN');
      source.pushData(createMediaRows(1, 901, 4)[0]);
      LogicTestLog.number(name, 'subsequent append total', 18, source.totalCount());
      expect(source.totalCount()).assertEqual(18);
      LogicTestLog.value(name, 'append position', String('/logic/item-901'), String(source.getData(17).uri));
      expect(source.getData(17).uri).assertEqual('/logic/item-901');
      LogicTestLog.value(name, 'append notification order',
        String('add:NaN|add:17'),
        String(listener.events.join('|')));
      expect(listener.events.join('|')).assertEqual('add:NaN|add:17');
      LogicTestLog.end(name);
    });
  });
}
